Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CF39903C
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 22:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142691; cv=none; b=rLQOSqo3MkynGNpacWDHkZlitkmyetDrY4yqhceUtfrc6K1Y3s/U49aktZSZ7a4KFgk6jDr4owHK8X+iqCsJrgrCNV5tbfePSSYCtAzreWsDYzvventwx9pq/jTsjjI7cypy/mJ/daeJwUVg76kB37LkE9aYPNpHdgCGSvYb7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142691; c=relaxed/simple;
	bh=d38a//3QyE8FATQBxvy1992MNITy+ZsMH60ugHt1tIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DXMXQ9qgXO88YXIb5tUJVcbjIkKXes3+HI2lwwIKpBgJBf1i/C9nO6YPPDVddmxZlkLo5hrlYTXfl48vsCHE2YrsP/3CQj9JptwzOQenEXv8iRMMzW0IjOsqvjl6hFvOUfIncFPm/UPxVjioDFYh6Gu7/6ov4ksp1gpxuUt3+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CQitHiRG; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CQitHiRG"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8279604464so4379360a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779142690; x=1779747490; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5JlOTR1piV9fHtSRwQQLLSwH+2VVdLHIVfygz0qDnE=;
        b=CQitHiRG6ozTNn814cPW2lOcVD1dGToQw4sTCO4/yOPYtwKxF7v42uuxlpj0I+4kxX
         iyiTWtaJiKYn/QM79BpCOLcX8/YU84sJPVTt9zKSGVasZbwv2i6g8UU3AJgednax9wbo
         fNzPg0v8o574wr52sa9B+jB93L+dw6NqYYFM0v8nJUfJpLBIuXkHG+y07KlDPYvnWMn9
         1iYnewZGNtIYtOAsj03LepwrMaCCyW79onsnnwBc0iWuOjNWUyKzuKNpAzzXXpPghiPd
         YTWG1vDJXWcguXpULKGA+A5C6wEDEBgEXxNBbM5CDH73VKrOYl6HzLOs+Cxn4wCb/mC0
         vBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142690; x=1779747490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5JlOTR1piV9fHtSRwQQLLSwH+2VVdLHIVfygz0qDnE=;
        b=r1S6prrdMKcplKvVdyouQ31v4yAR+itj1mIf7mPuFzmj05iIIDLtHV/7TE0sW720Zd
         WoZZrGyC9+QO72MXOz1UFphj0bLIQdJgcgn9aStyP58roevcVsBeCwJ0R++jWpibjJzk
         x4ptGatLIGTD34dMfL57CIfHtCTCS6b4hc2tAo9LNtN/rMxfAiJVHqZzbkWNMdgin96b
         RH/j1jTXppnfZPebohX15OIOkHaOX3OMns9SDgL0bjjJE0Ew31/vuLU2NDXXvB8rFvrf
         oBaQClbBa72QAXM7RwWECDywO0oin0M8AFFKVSHIWMKEnX5a8z0+i3ndSNt2rL6/SUrR
         DG5w==
X-Gm-Message-State: AOJu0YxXHUeXEzNlEdowOhG9IpMnl5C9Kr7riSoL6kPLVKtwG1G4aKmn
	zkWKCoWrvBMI5czO7kVe1hpTEkZjeRlhIczVGDMgHaKRs5rBc8UMU/0/onJXzut0ZKcKlVYlbdh
	DXf283PqlPOQzE2T9DZTrw/mw+bB8Cs00yMi3tosWnVdsFk028URUbovx1rkVEOJ2M9I3/d8SuS
	P63nG5i27xH4yLqX7nf1x3nXVcOu9yECFa6uYzU0nMO4fBIsS9
X-Received: from pfob24.prod.google.com ([2002:aa7:8718:0:b0:83e:f637:eeed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:244c:b0:83a:7516:5be0
 with SMTP id d2e1a72fcca58-83f33f3b5d3mr16454915b3a.50.1779142689463; Mon, 18
 May 2026 15:18:09 -0700 (PDT)
Date: Mon, 18 May 2026 15:18:08 -0700
In-Reply-To: <20260515194535.56B84C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-32-seanjc@google.com> <20260515194535.56B84C2BCB0@smtp.kernel.org>
Message-ID: <aguQIJQYsarMScnl@google.com>
Subject: Re: [PATCH v3 31/41] x86/tsc: Pass KNOWN_FREQ and RELIABLE as params
 to registration
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="us-ascii"

+Michael (sashiko was quite stingy with its Cc list)

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Hyper-V VMs with an invariant TSC but no frequency MSRs lose the X86_FEATURE_TSC_RELIABLE capability.
> --
> 
> commit 0c0fbc4f0451c30c0e87e0e3591ea4f487eff75c
> Author: Sean Christopherson <seanjc@google.com>
> 
> x86/tsc: Pass KNOWN_FREQ and RELIABLE as params to registration
> 
> This commit adds a tsc_properties parameter to the paravirtual TSC
> calibration registration routine to consolidate feature flag tracking.
> It updates various hypervisor initialization paths to pass combined flags
> instead of manually setting the CPU capabilities.
> 
> > diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> > --- a/arch/x86/kernel/cpu/mshyperv.c
> > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > @@ -516,8 +516,13 @@ static void __init ms_hyperv_init_platform(void)
> >  
> >  	if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
> >  	    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
> > -		tsc_register_calibration_routines(hv_get_tsc_khz, hv_get_tsc_khz);
> > -		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> > +		enum tsc_properties tsc_properties = TSC_FREQUENCY_KNOWN;
> > +
> > +		if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT)
> > +			tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
> > +
> > +		tsc_register_calibration_routines(hv_get_tsc_khz, hv_get_tsc_khz,
> > +						  tsc_properties);
> >  	}
> 
> [ ... ]
> 
> > @@ -629,7 +634,6 @@ static void __init ms_hyperv_init_platform(void)
> >  		 * is called.
> >  		 */
> >  		wrmsrq(HV_X64_MSR_TSC_INVARIANT_CONTROL, HV_EXPOSE_INVARIANT_TSC);
> > -		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> >  	}
> 
> If a Hyper-V VM exposes an invariant TSC but lacks the frequency MSRs,
> does it bypass the tsc_register_calibration_routines() block entirely?

Yes.

> Without the standalone setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE) call
> here, it looks like these VMs will lose the reliable flag.
> 
> Will this inadvertently enable the TSC watchdog, potentially causing a
> performance regression if the system falsely marks the TSC as unstable due
> to virtualization scheduling delays?

Hmm, I was going to say that the change was intentional and desriable, but looking
at this yet again, I don't think that's true.  Enabling HV_EXPOSE_INVARIANT_TSC
just means the kernel will (probably) set X86_FEATURE_CONSTANT_TSC and
X86_FEATURE_NONSTOP_TSC during early_init_intel(), AFAICT it doesn't lead to
X86_FEATURE_TSC_RELIABLE being set.  And I think in this case, marking the TSC
as reliable makes sense; even if the kernel doesn't user Hyper-V's calibration
info, the host is still clearly telling the guest that the TSC is reliable.

Michael, does keeping the

		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);

but also passing TSC_FREQ_KNOWN_AND_RELIABLE to the calibration routine make
sense?
