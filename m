Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4C3DA7F5
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071812; cv=none; b=mwwU9K/8Z71eR5ln+WzgHKPc8P6BKuYcCN2nhJ2Djl6Lk+01yZ6+x9bfcoJd5N2GYK75hXqHLfVSWlP3IaFJAdRIuoEqa5Vz8HZeXss8DpRM6r/SLPkqPa8lTndvpKOv6kJwJeOQIs4c/Enenth7dcKv+2E1AQowJ5Cdp6+aRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071812; c=relaxed/simple;
	bh=pSxoxMhbYF7BHHLDnIxxdXcvcxE9JP52g/U+97KRZUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GoanLh6rw21VxUBD8pz1ZcyffGrosrb+cIZ/k0btc7gFVAXZVWgI4M8gPWU5us2v9eA+Rmdf0kFWUithKqGn5adCFX9ZjxQbPGms5IWXF8bCz4aZu/vnPu5LxbJSAgD9ICHX4+EuwnCAC6eZQhvNT3KV8P8Z//v5fvVEuoMWo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GxBAvcJd; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GxBAvcJd"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso145806445ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780071809; x=1780676609; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Scb9q7Vc7fjy0mJZyLF9pe8pDeFrn1cuBRV6rD40tUE=;
        b=GxBAvcJdD9c1R+V1PUHTTXEA4B7rbzHACBSiJjK4FI4TfYARRFvviO+K3oIfSpHjvb
         l42KRT67kG99qjfG0yozV3Saj3MRXLfBPq5v+slYxXRqmRwlH9p+FgT2fM+6Oc6e/3bv
         PxJLk7fb8qv2OzMVRI8PZvbAr3UtthDhzUb9mdiKiV0lLjflGPSNpxqshTf77qaH3Pkx
         Er1Hf99M/0CAf4yey4YqF9WS7mX2RxcmmHdW14x49D5ZYGRT7L3/EqiKtgrIg5D/OGhI
         DQG1HdJDpc+PWrkQaJWdARuftpG22TZXrnJZuzFSX/SRGgeUla+aBK+6/OtKDniXJosb
         SsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780071809; x=1780676609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Scb9q7Vc7fjy0mJZyLF9pe8pDeFrn1cuBRV6rD40tUE=;
        b=PqPJ7cap7CUgGNzeNB6Tiki6G4w/H2v1ObGiTzkUmAXdFU0vkL+NJwM8xIzQRzPaCw
         L3b2t4s7PqbPMegGoHYj4aKbaczZoRC6k4qLi8fr1H/0lVZt+aGU0/wJhci1ySJ5rgGG
         ZIhE9rMltNRWicskr1md5lZ5NCyxtEy2Z/9WfOz8NoCAh7jCoDYfa2DoPQtHEAQ0hrN4
         XJT31dopFssyeYQDzGhw9rLdKA9LpKslK0txzq79bYwoi1z5YT/cOnE2Jd+fMipcEzDa
         u+dDdQPDbx7GNmXvrngYxJTwJ3D+auXn0U0Z6/CjsJOVBU1Ym0RR31Q/YGom03ffbW8H
         syDg==
X-Gm-Message-State: AOJu0YwWdYD9Kfrcs8uoGIoF1cNQwCwf8dZEQw0mxxN/v9Na9M3kIQ9R
	Jlkb8lLQcUMVBwgMsum3lvpIYfN3zclZgUSqrO7HlzJBNrsNPYpe3cDIR9Q8BUFD9bSFPpgu20c
	bw63PCIQNyi6m+atMCTBx83vMtrMbSx3mHDiPjnGfMHhz577y+WnOWHns3CW/xanWupzsVdBsFd
	aqZ1pC5sYxojN1l+8NX58IKzLr98zeSY1hMJlPe6vSO3I6gopC
X-Received: from pgct19.prod.google.com ([2002:a05:6a02:5293:b0:c85:746c:1066])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c6:b0:2bd:9c0a:32c
 with SMTP id d9443c01a7336-2bf3683b78dmr6175505ad.19.1780071808895; Fri, 29
 May 2026 09:23:28 -0700 (PDT)
Date: Fri, 29 May 2026 09:23:27 -0700
In-Reply-To: <20260529161442.754A41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-7-seanjc@google.com> <20260529161442.754A41F00893@smtp.kernel.org>
Message-ID: <ahm9fwLDnnby9q0k@google.com>
Subject: Re: [PATCH v4 06/47] x86/sev: Shove SNP's secure/trusted TSC
 frequency directly into "calibration"
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index 833eed5c048a9..2b8f94c3fcc7f 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> [ ... ]
> > @@ -1537,16 +1538,20 @@ static void __init tsc_enable_sched_clock(void)
> >  
> >  void __init tsc_early_init(void)
> >  {
> > +	unsigned int known_tsc_khz = 0;
> > +
> >  	if (!boot_cpu_has(X86_FEATURE_TSC))
> >  		return;
> >  	/* Don't change UV TSC multi-chassis synchronization */
> >  	if (is_early_uv_system())
> >  		return;
> >  
> > -	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
> > -		snp_secure_tsc_init();
> > +	if (tsc_early_khz)
> > +		known_tsc_khz = tsc_early_khz;
> > +	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
> > +		known_tsc_khz = snp_secure_tsc_init();
> 
> [Severity: High]
> Does skipping snp_secure_tsc_init() when tsc_early_khz is provided omit
> critical CPU capabilities?
> 
> In the pre-patch code, snp_secure_tsc_init() was called unconditionally to
> set up hardware capabilities before determining frequencies:
> 
> arch/x86/coco/sev/core.c:snp_secure_tsc_init() {
> 	...
> 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> 	...
> }
> 
> By chaining this into an else-if block, if tsc_early_khz is provided
> (e.g., via the kernel command line), snp_secure_tsc_init() is bypassed.

Which is bizarre and awful, but in practice is effectively what was already
happening, because the kernel would simply never invoke x86_platform.calibrate_tsc().

I have no objection to ignoring tsc_early_khz when running as a CoCo guest with
a secure/trusted TSC, but if we want to go that route, I'd like to do it as a
patch on top of everything else, so that it can be easily reverted if it turns
out someone is somehow depending on that combination.
