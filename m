Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6D1E1A3D
	for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173496; cv=none; b=f9+sHlFzXunMIYdQd3k9sdVDIt1eX31a4ocPM0fWWyRcRY+L8blXxPETGsG1r2idUqDg6ne12HjrqE5mVGzJS5H9c96VYXFHyICiQZeiRmilsnUxY3gYvmsTt2Ywhpwr/vEN8qzYIYbu1poP5qt6un4X+EW8HElQJCELJJBTjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173496; c=relaxed/simple;
	bh=4+pvpfnm7Y+kldzOhwF17EFvoIoCbYAxiP4iinuidC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAoJA06LcfvISZoy1NC0GxqLTNl+GcK1tU78h+mK89L3+QkJgRwJowiTt7duccgyMCK7SI1JdG9Jq5Lmqz7LwTY8yXf+8w9z5zfVAelUclOf/4545xpz82lJWgNUQyibPHKS/wRlvPEWUcg0a/ZwEl0+n2/nufpIToxjVMXFvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmwIg2sV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmwIg2sV"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1587638a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 17:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789173494; x=1789778294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZQfj7II/byHNXuSfY97UNVF+e/8Sy7W9P4BrNmI8r8=;
        b=kmwIg2sVLLR+9MlwomrLLz+gKfi4PyPH+IE3fRXTqzMb4iOJkAnZwoz+lq8hSsJjh9
         zgGJnOeXTKgGZJKgBUCktDGXfcVFbdUYqGXt34uGPnsQHV1CN4Nvw+hNAmawhipxu4lQ
         S5WUS3nbH31TZ7GXUfGs3tgrTq0B1XUFTGsIb1M+D6/GYZy2xNLRje8mYVH5Ll4ofDHW
         CUQOiM2JkXt84GK8uZt9BhukT1q77Sn2SFYjmI+WHAJTSObtR+veRLH9pZuJn3lCgd0r
         wt+qSMEs18Ng0OK/lwTYuyOnTznEy681xhoIMeyJKAuAai1DLGKpU7MkUfWsfhYQkQQW
         hn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789173494; x=1789778294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZQfj7II/byHNXuSfY97UNVF+e/8Sy7W9P4BrNmI8r8=;
        b=JFfhCmkJZDsuQxTDOG9Efmek97xHAFfHdM2nUd3U29zZv5v9XK/KJbZLtixziqL/9g
         8kL2ehUBvTK+wfwqFoGNNFBE9yykDWbglubZ9Et4xvUyQ82V6BbIxXu8LFs4FPwye7Gg
         JDpGY/jI8unwqILyIq9mb1WHI+ltGtU0JX1mg7wun2huiETu2ZcH1JYxKFJhXdd59kdy
         /zly6qmKE/h97aL/3KRuzmu+daArIx876Ckjb3oqIGR69L3ICYFuHa/KeZit8XklLd/V
         QhPLOqiaaei36QNPh3Mloh3Oe8L1n7T56K/MGki1RIB1NSuShKw3b1OSq1/T/rKdbEXn
         Afkw==
X-Gm-Message-State: AFuF++kUbGgJoGXsIoTzw8Uv1RLUDHGr+X2vs547BZxQuAW1rCWfkVjb
	vxzKrDqE9MmmTdxaTTnFpRfJPQjhvcNaQSSvRuOIicWBD790Phxn1Ix4FEk+yRgMeGlq
X-Gm-Gg: AYBFou3lCU9G6ZSZnHDuxrjQmLayleoOnv8DUb/dE/Ma4x/XQ3d+Lfr2mglXqS/wWH+
	lMmi6HmwdQBpQnhjjNI0d8yj69qXUZqNYFlFsSkWnZ+EnwZEw4tfXMBz+NkQSecLk9txd8ux+zn
	sd0Y+Yiq+89MiqFWcpW/31ZwjBMYnfs9qyI15KXY8ELBaJS0CCy+M95hqbUdn3AXHBxELiHOLXP
	qfh/mbcZMHfNLwXvYyC0lcE+tCAeH7BXdSasjbl6pRFD63GnpWUQsO7Mcq4pPW8ux5JqaDU6N+/
	lrQXyz3N6BnmCC4/KNJfv3WLiK9ZkOfzCW4TmMCGR5dQceC4e8Fn8hlZshdM7rKUZ4+HY5e5mNB
	hjznexMFdQ9WngG/fP8Zvhju7DGDTN2O3isjDFx34dDinlRzlZ+KS/+XdsUBNQSTAyckltkJSDG
	RzM4ESn23uHgLCxR1sXHWUNUrKw2L0yQqj7M7KobrgUWVBseIoxah7U1r9x4RYW/bvPpZJEJ0mX
	zzxK6upGwaWR6DbxZc12M1znQ==
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960826mr1728046a91.0.1789173494034;
        Fri, 11 Sep 2026 17:38:14 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db113a3d0sm2808801a91.14.2026.09.11.17.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:38:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Free the run queues at the end of drm_sched_fini()
Date: Sat, 12 Sep 2026 09:38:05 +0900
Message-ID: <20260912003805.1900119-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910123736.6EB8D1F000FF@smtp.kernel.org>
References: <20260910121601.805032-1-donggeunyoo.kernel@gmail.com> <20260910123736.6EB8D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/10/26 21:37, sashiko-bot@kernel.org wrote:
> [Critical] Potential Use-After-Free of `sched` and `sched->sched_rq` if
> `drm_sched_fini()` is called with pending jobs and `own_submit_wq` is false.

The chain is there in the scheduler. drm_sched_start() queues work_run_job
unconditionally, and drm_sched_fini() destroys submit_wq only when it owns it,
so a timeout handler restarting the scheduler during teardown could leave work
behind that later reads sched->sched_rq[i].

No in-tree driver reaches it. Of the four that pass their own submit_wq:

  - panthor sets .timeout = MAX_SCHEDULE_TIMEOUT on both its schedulers, which
    drm_sched_start_timeout() tests before anything else, so the TDR never arms;
  - powervr refcounts the context, and pvr_queue_destroy() runs only after the
    last reference is dropped, which in-flight jobs hold;
  - nouveau waits on nouveau_sched_job_list_empty() before drm_sched_fini();
  - xe never calls drm_sched_start().

Both drivers named in the report are covered, for different reasons. So there
is nothing here for this patch, which only moves the run queue frees within
drm_sched_fini().

The one thing worth recording is that the protection is per-driver rather than
structural. A driver combining its own submit_wq, a finite timeout, and
drm_sched_start() in timedout_job would have to drain before teardown itself.

Regards,
Donggeun
