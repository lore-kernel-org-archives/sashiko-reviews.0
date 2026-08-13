Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2954484258
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633110; cv=none; b=hK/MVIyVRPys8kES3cuDUJkTgK4s5FplWOjgi6XEnFIGcWc5MW+NMG6Cn+Q09PecD+149ybFmp9Jer+QCZ5QZz+K5k0HmtsertYwufmS/1O21m+FFzRd9d3UeIIaTPpsEbbZsl9MmMExfENG2D/N36ZWgm6tQFoXy0W48DKXtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633110; c=relaxed/simple;
	bh=yMR+TnSdk1ztOdOTdPBOe6RTGhKHZDxrly8/tCEswO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CneD/oeEEtHIWaVQL1/LDjgKSO0/scP6JUrt4HsBwPXC68tF3vB+36luvT33iMt71C44dCYuWDPgxVzCcLqKFVaxs7UVQW9LtoV0iCcs+Mu7+NItOx7OpnCOnntRBj/3z+wUS4NspBQlWNjFvyzZAX6omt8saGHLL1dvSXlalrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from Mogu.localdomain (unknown [223.73.65.85])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49e36c9ae;
	Thu, 13 Aug 2026 22:58:16 +0800 (GMT+08:00)
From: MoGGuU <Naixumogu@whut.edu.cn>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	Naixumogu@whut.edu.cn
Subject: Re: [PATCH] accel/rocket: Fix job submit error handling
Date: Thu, 13 Aug 2026 22:58:10 +0800
Message-ID: <20260813145810.177179-1-Naixumogu@whut.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813143334.81E231F00A3A@smtp.kernel.org>
References: <20260813142059.151644-1-Naixumogu@whut.edu.cn> <20260813143334.81E231F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ffba18d4403a1kunm78eaa06f3514f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0IdVkJNSUoaQhoYS0IaS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTEhVTU5VQ05ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++

Thanks for the review.

I checked the reported partial-submission restart path.  I do not believe
the new issue is reachable as described.  The interruptible operation in
this path is drm_gem_lock_reservations().  Its
dma_resv_lock_interruptible() call returns -EINTR when interrupted, as
documented by ww_mutex_lock_interruptible(), and drm_ioctl() propagates
that value unchanged.  It does not return an -ERESTART* value, so the
kernel will not automatically restart this ioctl from job zero.  The other
failure paths in rocket_ioctl_submit_job() also do not return an
-ERESTART* value.  Userspace could still choose to retry an EINTR manually;
the ordered partial-submit semantics documented in the commit message mean
that it must not blindly retry the whole batch.

The duplicate-BO report does not cause a double unlock either.  Trying to
lock the same WW mutex twice with the same acquisition context returns
-EALREADY.  drm_gem_lock_reservations() then unlocks the reservations it
already acquired and finalizes the context before returning the error.
rocket_job_push() takes its err path in that case, not err_unlock.  I also
verified this on RK3588: a submission containing the same input BO handle
twice returned EALREADY without a new warning or error in the kernel log.

The two dma-resv fence observations are valid pre-existing issues.  The
completion fence should be attached with DMA_RESV_USAGE_READ to input BOs
and DMA_RESV_USAGE_WRITE to output BOs after drm_sched_job_arm() creates
the finished fence, but before drm_sched_entity_push_job() makes the job
runnable.  I will address those in a separate follow-up patch so this patch
remains focused on its stated error-path fixes.

-- 
MoGGuU
