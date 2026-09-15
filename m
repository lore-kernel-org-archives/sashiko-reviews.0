Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC264AF9D7
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487302; cv=pass; b=IBl+lsqMNRPOVFKLYPgmHjWeI0q8SHZhAzOBWN3S+tLOKb4bjSaXy0w8QHhJDfE7mh1tyuYrQNj92ohxIX2TpUc5Tbol3E6b6/M1kGvqkrJBbxHFYXq+dF3htj6nN5yAJXSIDAkGVH8H/zRiKH3fmCH3fki3dqxbCwq6ZQmZSZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487302; c=relaxed/simple;
	bh=IIae2hOq/rSdDn4rRHwnG8IHTBsRfnz+1SfXNqeYduA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWhz5VSLCyyXa30gr+mwvcEHOK8fPca1O2byOcMmPW9vcE92peuSf3x3/lYZpFHvboDxKBSXgByyDnBCNmpSC67vWmZaoPprSge09NFTSRz5zBPW8ystoBXefCjq7s3Qv4do7bTKHuk0rth0mCAPobrJdKYwdxlX77pb1ca0ucg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbuJjaUF; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbuJjaUF"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8abdfso2547394a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 08:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789487300; cv=none;
        d=google.com; s=arc-20260327;
        b=sLUP3e/RlgktKafpszMbb/HHPJkppO2pfEPCR0h8ba+DrqQpJ9kFtSS7sJgkYfsiyD
         Y4q9HdwST+BRLQZvvtfnnaojbakSUC70UPXUL6ZYwQI8qRgCampvvT3GQBM9Ml2uuyev
         PleMpPb/Z0TjrChu9IGz/H8tbN6b8NNPI7SPVpiMWc6Q2cX6e00NzqPv3QV6dls1NvhU
         sZA9Ac9e0+S0InNspQDUXxaOemBrtNXih+pNV+METdWWlSfCptSY4zm+rRefSyo8+KCf
         1CIcFF5v+ezm16LbFbwY9UOweQ1SJ7Ekp2JB8/zRgxWFHEAIs9hkhG59pk8AW5hTaiUW
         LEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IIae2hOq/rSdDn4rRHwnG8IHTBsRfnz+1SfXNqeYduA=;
        fh=ChuEeOg5ezr/J5zALyft1oIJMbWJ1PVyNKZvZH0fPsI=;
        b=FoKK3rcGK3WZzRancPp/OcWwu8SwIUTcryaa7TTxbGmZjcZBGe+X7C0ReGhKrlAGBR
         3fJ0cfsiHRMDs2KjGe44zHfgbGMa0ZE2eXA+S6XGcp2Uvg9u4esDQoUaeddDzLUrtxb5
         XD0zbppBWTthDKFFBO2Zw+tlgSkzBk+WeDFiHiBAl5zoTLcyEQpZbhXDR+ma9gIdCFsD
         i4pLxRvGNZ9ayL3LvIeYX7osvYfEzZGDcyVrte/0ybCTCgjQKRJLKMXO4WVmJQjbE+tM
         Ay85Rrf1yYkeUlFKpOwvQYRQ44GIOaOcoUvBb84+8bpSaT/2BQaemzHUwg2ZPZaxBtQN
         7jZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789487300; x=1790092100; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIae2hOq/rSdDn4rRHwnG8IHTBsRfnz+1SfXNqeYduA=;
        b=NbuJjaUFsW4vmpU1HpoH94nkaRDqgiY5hjNv8J1eXOihDW6Xx3QHs/fQBf1B+Wekv4
         JXHSUpDXuU7v4bIvWjVpG2Spf87CFzYPKC00dcvnjwJkkpdE66/BKDgbC6zczBZXNgDq
         r85TBWapu+hxSi/DUDqB0vBgWTCQ9N26VssEYVh8hD8DJr8n3VsOVTzv/3kJhtKYoCOc
         Se/jUVn9NmWxZ5+Gs+ucE+I2lFcKECf2fLj78M/2qrv30ljS9JoPWpaqAbZvK2RiFtH2
         2NmSvhY1eiuuNlnb0100Ikjb0Vd3vHm9MyL1kDdgl3UWeEvkS46Z8iyPDXYTCfK4/YGS
         4whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487300; x=1790092100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IIae2hOq/rSdDn4rRHwnG8IHTBsRfnz+1SfXNqeYduA=;
        b=CQTLHIYCjJEmQtUJPEjd7gU1mRUPwJoL+yThs/xXjverdbySQmisLH878JRG34XEsf
         e2pp53QelNBUCl1E5qKP8tc5oJWBtJx7BsyDf7EfCHLLB5Hpz3HGqE6mckqOXSv/9GbD
         7aK6ouxu0pMRC4+GnaxLNpm9XsgP0bICCPnr6OHoOx4L6x2vGVKJMMOCbrJmYfFI9Zvo
         pTpYnaUoriqnpN9PdIzDYqUfaoQ3TJGuV9CBBpOw2lZZhIW8YJXtI5qjhaxJIITr1BPb
         1LVwNWdHkm8D/GoR5dNnCsGOaFsG03tBDGwlxSQYzTFtR41YN3ADYMm0uCozvFl6obMS
         TSKA==
X-Gm-Message-State: AFuF++mDKJygjPeZ3gzYIuWNEJebivlM6HGgN2dRYVg9EK3ljhcqn42P
	RheYvcQ50vA2Ge/TnAKgqHjmuLwVWizHI5+2Poh7WYjmo1zxrbf/dEmy7WdCxs0B0K3fUCscUcL
	LaTlNuBIF5SR42W1uVN61FXYpzGzb2K6stGUsx8K4ggtx
X-Gm-Gg: AYBFou3Ds2vZwQWzfKJc/Y+3sE7Wt667QYayJAyg2fDuC6ZEw/aN5aByZU0Wlvk3wZL
	msdILI0FBWCQLoJ9DZb4qAkYcnByoE5mjmjdd8Sjz8jYC5+zT1VNL+Qm08EWyO3ygCV6Aaiae4E
	n1z3OvzY6+IGY7bsj6kCrpu4CGd2h1hsn7Icp9HW8mrQF7fL7s4n95T/JC8kfrezuGCrANaLMGI
	It8RLvy0Q1cf2fdTaImqQcnd8FD7v/L2DuMB6Y1FFNHQgESPMwKW9j+YkX6BQ0oggx2xS8I9PwX
	prKSW6lmSj76VdUFKqnssIAOxseyWB40svR7i3uGrVG+D/9smBKS1w==
X-Received: by 2002:a05:6a20:ce4a:b0:3cc:f008:8125 with SMTP id
 adf61e73a8af0-3db4047dfd2mr18121150637.1.1789487299805; Tue, 15 Sep 2026
 08:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914040332.1892175-1-oss.patchbox@gmail.com> <20260914041702.258821F000FF@smtp.kernel.org>
In-Reply-To: <20260914041702.258821F000FF@smtp.kernel.org>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Tue, 15 Sep 2026 11:48:07 -0400
X-Gm-Features: AcwNN1WjwF8pq8QGvnAAIZj-8VV9zkdWmSbWOv3iTyv7SJN2U0DA4DXnP8qJG64
Message-ID: <CAGG=RgBhjFbfvbmMtT4q=_1Q1k=Focg1HaLSzcRJ8YGg1XAS+A@mail.gmail.com>
Subject: Re: [PATCH v1] vdpa/octeon_ep: Fix race condition in device deletion
To: sashiko-reviews@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 00:17, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [High] Incorrect teardown ordering in `octep_vdpa_remove_vf` allows hardware interrupts to re-queue the event worker after it has been cancelled, leading to a Use-After-Free of `mgmt_dev`.
> - [High] The lockless `atomic_cmpxchg` synchronization introduced in `octep_vdpa_dev_del` is vulnerable to an ABA problem, allowing a Use-After-Free of a stale `vdpa_device` pointer.
> - [High] Early return in `octep_vdpa_dev_del` silently skips unregistering devices if multiple vDPA devices are mistakenly attached, leading to a permanent device leak.
> - [Medium] Calling `cancel_work_sync()` on a potentially uninitialized work struct triggers a kernel warning (`WARN_ON(!work->func)`).

Thanks for the review.
Please drop this version.
I will rework it and send v2 based on the review.

Please also drop the Cc: stable -- it was premature on v1.

Thanks,
Yuho
