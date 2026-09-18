Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD235201B
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735518; cv=none; b=sGhut3o0Zmvon4hTc4Gyum46/rMX9CYpUT+QL5QiCkn318V69m9UOycToS0EKgVCuQo3qSE+x5vV4pfYWqx2bk5ZOIywgpi+MOn9K14SlKa5hykeqfc7iINF+6GFRQzQwjKc8omFTVBJLFAEGTnT9u/qJ5RKf1Quptf8mOQuWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735518; c=relaxed/simple;
	bh=yl6pFmV/xEg1vNv9xDvMEwbWpUcLiqdUahh2XN+OByI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A94H/XKFhtJNhil9UCbHt+aK/lfVO5E1Seg7WHJ+V3lYRmVEabyyZa7T0dV2DeX7xDbS8lhmZS+gafP+whwt7DCh+RsY4pFx6+PO92SQ46VsGqa07pZqMMySy8ew9Q1tRJ5fu2UsClmesF0Xyc5b2/eqWNx7aHoLZiiG1BKb34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVgOnUEL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVgOnUEL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so4607555e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789735512; x=1790340312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl6pFmV/xEg1vNv9xDvMEwbWpUcLiqdUahh2XN+OByI=;
        b=MVgOnUELMhtY3Yuk9xrhddOWahe/vbGH5lS8ecGXR9r/xHeTSpJxv6tmnb+AfveAX3
         3HEM6nzth2wODvisEtCFSkAv99rTLav5iBtQEItQlfeNWKtvoIuRCPq43guSb70d2G+0
         h2KycI37GcQrYzHt/g0fBLTPF/fKBlAJjyJ4hARAJNwdf1th2a3eUShRYZXaWGHemL48
         U6CU5/jfUHbuPItUcuUwuze7xUY40zBC6vwUuqnoEVIF900dxQ6QBglJZhW7vXT9MwsL
         lsa2/vf+9zExgal0BKUkJBmzxB4tQr4DB14rTw+XUrkXy2suxj8JCt97n7hHI/ayfnB1
         PElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789735512; x=1790340312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yl6pFmV/xEg1vNv9xDvMEwbWpUcLiqdUahh2XN+OByI=;
        b=Rbx4FAwEk+PibBhlQA/kZXHkDXqj1iXqd1TeWWb4I38le6bQx8ja8mZg1VlBvXDVjk
         UFDh17s9PoWt3FxB/MTpHcspwswpUS7iqyZ9pLg5dOLbtaq3WpC3jUyrI2mRL5+977LB
         iYBwl7pRFuMzbqCoR+saZuL/CVO+gEjYBRN5h5kK7bJq+KKYEZFptRtv9NkMdwttrSiL
         l99u0MjAEawqLGRHiqfmaaF4IORCSLAo5vZasV0yhxxB4gAkJNriLVSn3Y+X81YVGBPi
         gv5sq3m/lshGl5iOTPS4Vj8pbcu3g6W0FRfzvPFUYhYHitCr4qeBIjHcLITFeNagrk8h
         xfJg==
X-Forwarded-Encrypted: i=1; AKwUvByp4fsJbckzGK4ikMJgoxlyeD3bibhs7QpGcKcRGYuA/fA6aaptpuY9OB4lihK7WFJtcfS9JAMdEaMa/wtesfQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nRZYaIPf1+NNC2QZL6JoC32PxewJokRO4EWY3jgToZe/SAMGXt
	eIiujy3nAuuFjr/5MpnzKAXepfZl5bxMyOGbDDSw/PycEFLxJl2fFIIV
X-Gm-Gg: AYBFou0BD058QC/35GQNueqHkY4657D9955srfWikZM5CFtKvbOY0TMjIP9oKdEXX4C
	wsYACIDIkkLxVxyn9R54kxXDgRhr+fxS7SKU+5spysSe53g2orGI9WCt5oO18soZVDtYss/ofMS
	AlwK6K4IIQsOHhbGdjw7uZ8P0Bwqv6gJxr/bNaD4hQS0ZBhI02jc8f5vlf+4tsZBOLPFsfNgcPP
	PX3yy7V6JiecPNwBpnRYc+y1Uf9rsa9UOZzKZZB3i992tyDdPJKQgxufRbk53gtypAFpBuldw5f
	gTKTkH8cTHDfCwp7xFdVW0ukJsNhEP67ro29Z2VC5hLn24t4TyWT97c2DwO0As0jFlltf4yILkH
	f86/imQVSWP1eCecuBNc+RJBpavABCV0gj/Z1+odDNaQAWGVGh2XUIR4lBLq+ApKKrkMFobXGWM
	ePMzsBVUtMR0X+hiCgYdCUxeSmcqQ64NYyUJTLGNB7svm1Qd3wJL8eWayEM92oe0YWhvtxKq87a
	nEQJ07qY4X1XAk=
X-Received: by 2002:a05:600c:34c7:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fc5726cfcmr73044225e9.11.1789735512203;
        Fri, 18 Sep 2026 05:45:12 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d8cee0sm48825095e9.15.2026.09.18.05.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:45:11 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: sashiko-bot@kernel.org
Cc: bpf@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	tasos.papagiannnis@gmail.com
Subject: Re: [PATCH bpf-next v8 3/5] bpf: Add user memory access kfuncs for mm_struct
Date: Fri, 18 Sep 2026 15:44:46 +0300
Message-ID: <20260918124446.462781-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918093017.AFF821F00893@smtp.kernel.org>
References: <20260918093017.AFF821F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: High]
> Can this result in a Use-After-Free during concurrent task exit?

> When a task exits, mmput() drops mm_users to 0 and calls __mmput(), which
> invokes exit_mmap(). exit_mmap() releases the mmap_write_lock and then calls
> free_pgtables() without holding any locks.

> If a BPF program passes a trusted mm_struct like task->mm to this kfunc, it
> eventually calls access_remote_vm(mm) without validating or incrementing
> mm_users (for example, by using mmget_not_zero()).

> Since access_remote_vm() acquires mmap_read_lock(), if this occurs after
> exit_mmap() has dropped the write lock but before it destroys the VMA tree,
> vma_lookup() will succeed. This means __get_user_pages() will walk page
> tables that are being concurrently freed locklessly by free_pgtables(),
> resulting in a Use-After-Free.

> Does this need to acquire a reference to mm_users before proceeding?

I don't believe that this can happen in the case of lsm.s/bprm_check_security,
where bprm owns the mm throughout the lifetime of that hook.

I also cannot find a case where we can have a trusted pointer to mm_struct
where mm_users can be 0. A candidate could be security_vm_enough_memory_mm(),
but this is not in sleepable_lsm_hooks.

On the other hand, this can change in the future if anyone marks a relevant
pointer as trusted-or-null, similarly to what I did in this series.

I will update both kfuncs to use mmget_not_zero()/mmput() just to be on the
safe side for future uses of these kfuncs.
