Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B9481FB0
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046741; cv=none; b=cm8kJGPKH+LYR8pxxj3e97AuHg81hz6hji4ouERTG37Efq59HjYNqNjTd5vQ8yaHeH+Nzyu3opuvEGg5KoeosLUf+XnAE5dvuW4E4K2lQlF4JI9ZnJDAt8zFf9tDU1ZGeF0LjW5rQDNugygG/EKjDRdQzwr7+46g1QUVKsU1OWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046741; c=relaxed/simple;
	bh=s6E47y2/NMhJk/PEw6g1iy2HPZkHb07neF1uVgmdqxc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIg2JwZSw6OIS+JdFlOWaC8ZMSV2WlI9o06mpBC5hFWCEczvSaeRxvMQHGV+NQfknbwPEY2WVbkWPlyjhkKriKf32rtnUeYSKXYJWuMUkQf9sL3gvp+2MXTxodhjR/kxS9+ksfTb34Hl4rjvz54y0m4EekmHOzGhNJd9xVHZOMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giKVt0+J; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giKVt0+J"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso7889232a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046739; x=1789651539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s6E47y2/NMhJk/PEw6g1iy2HPZkHb07neF1uVgmdqxc=;
        b=giKVt0+J4uff9voj+bXmvZlm0OWFexhYwTx+YtCU65lU2Ibieci6qLiPbqI5zwBmyV
         UtdJ5tKBEtLPcmuAg2wiiKz4LdVTSFjxqC877hzxoLFd7D2FPO81PqnSy5eVwH+4zbS1
         C/+uiNmXSgXNs4pnF68RYnoWRuxg05ZGdbvEAeIbeO8VLXT/do8DBrz9XBdN7jDsLSfn
         9dbpbkTuxF+UVnyOmghBwgM9jwBbRstDZgwlTdnNrDyFJreuEdw+fmCNh1fCrllqL8EQ
         nnSQOLWQhX9lr9STSfw7OnvDuqq60XMtLHFqZtMay9Hc6l7+nFERRMml2TbRBK43PMLT
         0whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046739; x=1789651539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s6E47y2/NMhJk/PEw6g1iy2HPZkHb07neF1uVgmdqxc=;
        b=kPNnrqy29qqy5Et1Q54Xiup9ynz7tUlaB0Mh1KfkcZZPnIExr49O71usjXbDKTd8jc
         eQ52ZSvq7/q9BUWDSGteiq39GI3kFzVwwhqLiikCuYQ7SnAYhZnNKeZ56z8Y8AGxWWwX
         P1Qb5ft1jYO4AvWQSsieIHzrB4Q8OhpADsvd1MIl++ZUoCyeRf6fYJjlXjBd0zEppnpW
         EzZcEoD9/UdP1GnPXCqjl/QtvRZaT2lZZ6pMSG+QEHBismloNR2ckTA3oA92o2dxj+JT
         mdokrv6VIgf4AgquRe63tTUf/603we1cDt+2gCSnYx9DUZO9rL3tPZVRqmPFEAvgzSnM
         sE7Q==
X-Gm-Message-State: AFuF++mxlcTEMde1vDmRzPRnWK8cLY65l28udz2HLl9H81um7OIDA5Yy
	8J3kW1KLF8sbcwOLqGEuMx0RQVUJInQ8nrU6q4YAD5Gz7F1xmtHeztuiEqSvQDs=
X-Gm-Gg: AYBFou0X684OB5ErHxnYncR/sLnLErGyhGbrgRzv+yzvrSHc+/YflDNJgnhjIj4Ka1y
	JkljVSmW/wow0AbErWOLxTpPwbfmEhOH+mTjOXd7HP/C7m3aHcA1UBjp+cd4Ai5zFNqniHeLlxN
	L7OD5fKsbn1LoIxcXSJ0O/f8cTUPZANKfICQYxLsv9PLxsn+nDAoITZDIK+yKAelLrnlC/DxTmb
	aseaOcU68B31aP/QfMTs1bfXSeVZf/HwBiHkY0RUdhwf3ebpk/YMB55YoByboeIJVgN9/p8kxTE
	aMHhgdoSYjg/alvB0NKHbXLffZ9yV6AKSEvqR0QUZtT4TyqWUggMKZk9MGQ+Il1AcZh35pcl6Ai
	uDbDe4xOx5JFWXSKrDnAfVHaFk1Tr3iOKuUhbqaf248/mWC63cmhnI1jhOkK0rcQB5cCKGe0iYs
	PKS+vbSct1xX44M8d5SYzTAc1SF4UFRiHagDoshz1wuR6BaqqaVrk9lzDY5K9kk9SQufh4Nckie
	Hh8i/lkYxAlCDZjGGKs1Ivz+A==
X-Received: by 2002:a17:90b:538b:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39b261d5148mr60978301a91.13.1789046738671;
        Thu, 10 Sep 2026 06:25:38 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39bae6d6bb0sm3488371a91.0.2026.09.10.06.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:25:38 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/sched: Free the run queues at the end of drm_sched_fini()
Date: Thu, 10 Sep 2026 22:25:32 +0900
Message-ID: <20260910132532.820610-1-donggeunyoo.kernel@gmail.com>
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

Thanks for the report - I went through it, and the reasoning holds up.
drm_sched_start() ends in drm_sched_wqueue_start(), which queues
work_run_job unconditionally, while drm_sched_fini() stops the submission
work only once, above the cancel_delayed_work_sync() that waits for the
timeout handler. Panthor and PVR both restart from timedout_job(), and both
pass their own submit_wq, so nothing drains it afterwards.

It is a separate problem from the one this patch addresses, and a more
involved one. This patch only moves the run queue frees within
drm_sched_fini(); closing that window means changing how the work items are
stopped, and whether that belongs in the scheduler or in the drivers
depends on what drm_sched_fini() is entitled to assume about its callers.
That is a call for the maintainers rather than something I should decide in
a patch of my own.

So this patch deliberately leaves it alone.

Regards,
Donggeun
