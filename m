Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFDB3F7AA9
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073979; cv=none; b=RnQudH4syH5hMa/wn7HreQDrDBE2FMm9RjO0LKe1jTFzteRT/HEjD4YiweOhRdPO00INr/k27RTq5k3B0JhBPL4cstXYUaSoTI+fumIFrIJAuX0iAaRot+pQQf2kYNXE5rwTegU8fUYUmz7gy6tYMsjxBm9kjIaQLL8DrKkpSnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073979; c=relaxed/simple;
	bh=QxzH5176QV1Z3ehduHKIGQu/MHoL+J9s1KmhHLaMQYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GfUaPGKG9joBFNnJDE9BT0a1Itv4CtaygJicN8PU7NHHRrRpMfSdQtJqOmbZP+qomQ7v8+v+Yd67fxJ1f28w7trVjwHW9+W9sdGcFyt90ZN1dloD55Mc6+FayWwWSy5F3WQw/f4bBup5vCkTd4WzHAnzyukTn+kenRfQgsd1XYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G8LuaciX; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G8LuaciX"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bd6aeb3637so314756045ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780073977; x=1780678777; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIfZI+15eXnt1VS1ntObygvWhZxyllpwUaeyj935Nek=;
        b=G8LuaciXq6DweKEo7RoXQEZm4dGfRNWlN6u8P48p38A6V+PmkU6GORv1mFQs/Nex5F
         8+NBhLSRSTyf4Mv7KqWZP6WCanimIUDz+iRAMVCsNjykkWnKHuTXNUbHqz51GuiuQIPc
         wNKCBL6ka4VcCtOpAzSTUu3G+EF4ge1dF3HI2RxVJ3/IUcwON3MOCvsTYEsNgEdSnAbQ
         8+4a1fbJ0TUtI03g2mfimYcLQpPG/L6YYCbsEGSpUH42FWpj9yg3cAgCficUcwkBli0j
         s32jAfpTwHv15dT0YSf10oUIGt5OB1w5kX92uqMyCm1PmithQNF5g7fsnn5hUj9ICrgF
         VENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073977; x=1780678777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIfZI+15eXnt1VS1ntObygvWhZxyllpwUaeyj935Nek=;
        b=GOaJt4tSRM9PZ7RaLYwasVKVmlwu3LFWqB5ohjw2dz+b1nhySg4t9QTH2u+N1VcN9A
         3ZGq0yaBY+/TU1mHBdH695S7tTfO41WvAAwPXZO9mKHszPD6cp6d5uIDXu1URjvqHq13
         DdhiEn8tycDzrFLpHaIgSgQBlSbyTLGLQx7qCH6iQQ/frhGaCfVTOU/PVWyfZcymPIp5
         1R4HBXiNLwgRBdVH2keOwRurciZbEn0yIfgRt2jJX4ELq4WpXwVbAx5MKJDkUKFm8akw
         5whe9WY7/B5kkCwBD31ZXe6C8yKJIL8DbdfFeEG+F4H23rkd5BxXsjlpYMPIthgsMyHJ
         dUww==
X-Gm-Message-State: AOJu0YxR8NLht+6wUjE+NT2JdXp/2Q5eOQFONQTuW/dZLA7UOwKWvldK
	nL5VwxrfWU3jRCE1tdW0ctA94HyMMiCs1nnZTNVnGmAICEvzbirG8kSq7KOB9p2PtCr0L3/8mgC
	TQlH59COpMqJ6ayoJdLa4aeTQ2OY9aHplsyDoqG3Eo2tkULG6zGYjD3NrJf2HiC5xCRJ2WLT974
	jVzrc/z6Cps/kPEG+oSjGqfBXFsqSFOgrW1TZaR+7qn6SbBPQ9
X-Received: from plry22.prod.google.com ([2002:a17:902:b496:b0:2bd:9e64:2df1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e78e:b0:2b4:5cea:f61c
 with SMTP id d9443c01a7336-2bf3679355bmr9901385ad.4.1780073976883; Fri, 29
 May 2026 09:59:36 -0700 (PDT)
Date: Fri, 29 May 2026 09:59:36 -0700
In-Reply-To: <20260529162111.990441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-8-seanjc@google.com> <20260529162111.990441F00893@smtp.kernel.org>
Message-ID: <ahnF-FehodVd474X@google.com>
Subject: Re: [PATCH v4 07/47] x86/tdx: Force TSC frequency with CPUID-based
 info provided by the TDX-Module
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index 2b8f94c3fcc7f..2603f136e29bd 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> 
> [ ... ]
> 
> > @@ -1550,6 +1551,8 @@ void __init tsc_early_init(void)
> >  		known_tsc_khz = tsc_early_khz;
> >  	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
> >  		known_tsc_khz = snp_secure_tsc_init();
> > +	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
> > +		known_tsc_khz = tdx_tsc_init();
> 
> [Severity: Medium]
> Does this structure accidentally bypass the TDX APIC timer and TSC capability
> initializations if the user provides the tsc_early_khz boot parameter?
> 
> Previously, setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE) was executed
> unconditionally in tdx_early_init() for TDX guests. With this change, 
> tdx_tsc_init() is skipped entirely when tsc_early_khz is provided due to
> the if/else if chain.

Drat.  But this isn't benign.  I don't see a better option than biting the bullet
and ignoring tsc_early_khz for Coco guests, e.g. in the SNP patch do:

	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
		known_tsc_khz = snp_secure_tsc_init();

	if (!known_tsc_khz)
		known_tsc_khz = tsc_early_khz;
	else if (tsc_early_khz)
		pr_err("Ignoring 'tsc_early_khz' in favor of trusted firmware\n");

and then this becomes:

	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
		known_tsc_khz = snp_secure_tsc_init();
	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
		known_tsc_khz = tdx_tsc_init();

	if (!known_tsc_khz)
		known_tsc_khz = tsc_early_khz;
	else if (tsc_early_khz)
		pr_err("Ignoring 'tsc_early_khz' in favor of trusted firmware\n");

At that point, I think it makes sense to double down and ignore tsc_early_khz if
the hypervisor provides the frequency.  It'll yield cleaner code overall, and
will be easy enough to document, e.g. to end up with:

	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
		known_tsc_khz = snp_secure_tsc_init();
	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
		known_tsc_khz = tdx_tsc_init();

	/*
	 * If the TSC frequency wasn't provided by trusted firmware, try to get
	 * it from the hypervisor (which is untrusted when running as a CoCo guest).
	 */
	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
		known_tsc_khz = x86_init.hyper.get_tsc_khz();

	/*
	 * Mark the TSC frequency as known if it was obtained from a hypervisor
	 * or trusted firmware.  Don't mark the frequency as known if the user
	 * specified the frequency, as the user-provided frequency is intended
	 * as a "starting point", not a known, guaranteed frequency.
	 */
	if (known_tsc_khz)
		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);

	if (!known_tsc_khz)
		known_tsc_khz = tsc_early_khz;
	else if (tsc_early_khz)
		pr_err("Ignoring 'tsc_early_khz' in favor of trusted firmware or hypervisor\n");
