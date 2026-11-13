Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794543062;
	b=JOtM+SFdkK0jYDX0wwJenma/svkTR8ureKkuOwwIf6hEkGTByf6uPr/MN+/lWCIwf+O6
	 acIpfmLVm8T9U5UVCgoE/H8kkWRjN47fDwYMUXavmSzWYE8YWnQy3F3U8mwWVFvicwUr3
	 6BjYPjlfHiU5ZPaJsw87yYg2HKeBdv2SvE7gUupT1TJUoHQFqGCOk+s9VHmiko3MdDbT5
	 JLTXcFCgXGdm98eQe0Bu738Re5PfdnayQxl8VTv3rILhRew+VjmwFtLtiGnZoE4UQH/nk
	 RyCVJeThKMSL0ipCzZd28Ti4dNW9l+jmmfMZcHF1Ol94B3rEIKYezGcx/i5YG1DtVXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
	b=ug6ZdJSpMmirtl9qo0WB01ishQUCpSpW0uq+Za36mX4uZ/NxI9JtZrUsZ5FtZ7Zgn1Ed
	 DNEXH1+Vs67fLai/KAzgWixLEmJYa9tj8qigJE3cpAf8PtJHq/2P6EDRKAfAsZUaJKIp2
	 W6hQqwr2c+lHRjuGSh3pdwYAguqGvheqwzT1JzcAjKafagorfAaa4nKAkQDaAbqRkzWhR
	 +Rmgmo8K4iD5cmv3Hlu87z/kzbp6fyAB+WVi7fweylIa01Xc9pWDth+snAhoCt4fyVX4a
	 tpj9LQwfTP4MTG2uCqg3fQcV4ySubqEKOgNmSaSHxUJ/TMuvdyMt9FDUXFbO/zNZULA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEOjBK53;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABBE606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 04:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ABBE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEOjBK53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so837376a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 20:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543062; cv=none;
        d=google.com; s=arc-20260327;
        b=jg1dYNOyOyuZkj4xHov5mGV6012suH64a78uCv9j/QAUWsMR+ugongY0eHDPTEfIAn
         GSXwknpWqeqGRTQA0y4kiABZt9UWjLEumqgC99WO9MNLFJUd/Q/ON+lmrK8o//z1GHGA
         gmgb1tms95WHyclOiFRz98aAm5WlOFys4dPbUjlPYr+tAWUkNatW/hDOmqU+DLsXyE7z
         oKJFPw29kF0RbWshq1JgSLtNettSphiVNchJ/AhVQ3bXTnnjYfCXiQPAmTf5rI6gaDmS
         CbX7491dZYmWnf6Cw5qOtYxT5/H8EjO48jV5+gbTuvKLIpzwdwQmFj0wNLt213lew/4/
         1qHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=bv9Rey2Ro3sFE4rXw9nyV6yHM6w9hiB42yiBYuHSCCQt3hzIdUtj2jvabV9Nv4478a
         RHklr6iGP9KL4hEiD9Un013Pps7lrG2akO20qn8pN0ODKMsp7FM532M1qf49o5vuni+9
         QjCg7vsDfazxD9NZ37teEkBgjMhWhRiHFXrB+qtNPPSwCvNenRCtrc4/oAPJUTei1hNW
         m5ytBCesjajUVBSey1pA/6qaayARVJdDd4j7LDA67A9etAmOJFHUzxg8b7xFzWibrE0U
         ss7fnp8uKCJmFCYgqhGqg9Ld2xQpVfewPEo4yLTZ5Rfos9bEqAcPtger2NrcwnhcSvA0
         b+Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543062; x=1795147862; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
        b=UEOjBK53WMus4gwj7luGAFH0lNplXd9Ncsiegj86MYH1jpj3vllkzoRjZMGVBX+mTB
         gFiEBhWfwiVbMhCwHMlHCdvSj/5FTDd+JWVOfAij4Nq8EdP7ngXep7X83ys1N86Mn/aE
         gMAexxF6lE8yrHZhfIvEnyXoz67A+fAUxpmy/NQabANv4pJ29M5xMA3MTEjY9hkHeKwk
         oXNlN843SQ1tJaaYuMG7aGSDbTTa7J2E0ogVscuU4zHhze0+NKM7xGoosRcQ8ZwqTEGB
         kT8FY2Pp9vzWI/2FK4WbCuPlllrW4d8bXx28Mu3Sw/I2e3Ug0Nf6cWPrWdlHSxcCDK9d
         xNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543062; x=1795147862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wi7hiqi2qVCH+ZGMHLiTp3SoPsoI9N8FiG5CgJtXgw8=;
        b=beq3gbOszpqJKOc+pZkIw2DiNBLoVCOYHGGMh1KQOP8MmWS+Xo5qSCniCuZ6CPrPEj
         5jTUcNRzVbFIEh/APD0TY3W6wTnOa6hKUhXIDhki1rRW14f2ULbmKgWrFJ/Is4morHOM
         1M5yxTHtt96guDWkCNXUba0Qk7/z2C+2GVsDdoYvJy/tQdKBIZWEv07/fUI+CLE9OyNG
         4WsHEAMH6L+sSFuMpZtAdkdr5HMSanxywlf73D+JOHSW3/2QuJ0uzahK4NMft6Akzt4L
         ZRUozioW4KkWHCOspKeXyvgQNK+85OIif2Ke4kG9Y1HBBX+12UszbKfdhVHyQ9QOSA9+
         XzLg==
X-Gm-Message-State: APuU4Z+vu2Uol74CVZSeV46jmMvOdheREgFTEsAkYVd/L97baghszTWU
	CUhXN6Ng05wSGT1spW0eixDGnyjgV+DoQPk3EUq0OQQIZjDlq4iJsH9d+hYvGklJmGQHRecUtOM
	7OtyVaU5QFXoTgn9HIbrHdB782g7vCVHTfi+I
X-Gm-Gg: AYBFou2mzJ4IgJFts7meiN3gilvs01dSyjcQqVgBdCQw4dlPCR2HBjgl251Y3D278sF
	buR/EEMCarwp+kvV8QQpKxi0KNqxEmhI0P1ygJ9I8gNA0YQcYSBP/5P9zS8DW8Xvb5/kCj0v4/y
	dgcbtxoR8icFvCTQuK10i4w8JU6nOWLTEUTXAq2i2tQni7x3aMu/u2SWEjM8x+z+4BHoYmdsHeG
	hIWUQC3/6tcvX667skdRG9iM88mxW0TsZOFHY5m0NCYDcA8OyuWptuLFDpiONDVvde2z0u0wn3w
	jTjDYGJ3fuWOQ7TjBdNYAWraZkiOy7X105OfRNSdoE+zHIhu11Jm5zUXKXV4c2Xec/pYFaWFe2V
	yCD3vgX14JKKXsHjTfVn6FVkwFSf4EkaN/sW6Rbc26aQrDxxbdAy7NCHc1V3XM88KFQ+IyoEFdn
	37gc3KXXe685KR3cufE5ja+Cr/dlJX710LJjyo8z1Tu8rZtgqJaYiahwGrFoaqZKMXmmU2iw==
X-Received: by 2002:a17:90b:57cc:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3b1b0cd0fe9mr1161971a91.45.1794543061626; Thu, 12 Nov 2026
 20:11:01 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112105116.32274-1-phucduc.bui@gmail.com> <20261112105116.32274-4-phucduc.bui@gmail.com>
 <sashiko-outbox-210984@kernel.org>
In-Reply-To: <sashiko-outbox-210984@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 11:10:49 +0700
X-Gm-Features: AclHuK8PCS-tPrFWQVDfCW_VcQwFfTkRV94vefTGZJMawzt2VOoRcy2Kw7Qsg4I
Message-ID: <CAABR9nE_C_UZyEJ=6G-zCYMkBgZphP7KymUw5U8+CR_yfYzsnQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> Commit 286d658477a4 ("ASoC: fsl_asrc: register m2m platform device") only
> added fsl_asrc_m2m_init() at the end of fsl_asrc_probe() and did not touch
> fsl_asrc_init() or its error path.  The unbalanced runtime PM usage count on
> fsl_asrc_init() failure was introduced by commit cab04ab5900f ("ASoC:
> fsl_asrc: Don't use devm_regmap_init_mmio_clk"), so the Fixes tag should
> point to that commit instead.
>
> Also, fsl_asrc_probe() acquires the reference via pm_runtime_resume_and_get()
> rather than pm_runtime_get_sync() since commit d05040741afe ("ASoC: fsl_asrc:
> using pm_runtime_resume_and_get to simplify the code").
>

Good catch, thanks.
I will fix the Fixes tag to point to cab04ab5900f and mention
pm_runtime_resume_and_get() in the commit message in v2.
