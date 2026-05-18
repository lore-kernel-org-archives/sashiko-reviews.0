Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4E381AFA
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131867; cv=none; b=K30goxKqS2FG1m8d03qvl1DU7pMke4FDuQJdYla91odJk4VTpeWbcVVhV+9460Vj2+BjPTMJioyu/YY2xMgDDKDDoTe+44iamJhJyNiyvjDL3x2jGcBARDzOiTonmJahA6LhbcH17PeVap3/MKCwsnZk8oO2pg/0W7y31w33hD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131867; c=relaxed/simple;
	bh=ofODDOkkvzbqdsQg3gi+Qv4QDhxERbrkRCRKD59JhLk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGbG+L33FESaWCPUkBPGTPIoKFa6qk92g/0YGBRLv3Qpgnl546Zce/2ezGaIk3+aeS6UYYhAP5mSxGc2Mi40CJJdLfppspz3GC6USCJwlimV6b2lvjlt6iQd7ysoPDLkZnlvxwzZ8bVE4W4stp9Pm9+ytMXEINGNKu0fQUgzW5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WksYPHZA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WksYPHZA"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-83f24cd00f8so1524192b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779131865; x=1779736665; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=byBkYmeeTqdoqUtx0ontJmxUgTZsHoHtMo8LuZGH+UU=;
        b=WksYPHZAnmiKGADRz0VPapy4RYCVfYFGWzdX7rw6Yhrrg0g/RY4Woee4oR33nlZH8W
         kPQkUb7AhWe7sISOY8RT6rgVkqQ+2MI5uOXVEDcyK5gN0lSSgXxOteRH69/7yflOiJOz
         9+L9cX3PNv9KNEeXQluuVYv2cWK4kYRNeKYIFPu71f5oxa3bELec4XI/OMDOw9MeJpsf
         yYH+w0WcR6E7TAesWJ6BWwkFFeFRN9tb4zu8CE/LhPhG9GVhbIkmy/uTcubvMhbT0TMw
         yIGZlzyBbgNXXzC12/nSn2bruf8cPsdyRuvTByxHy2e2iL36YdwSkDtvlB/f1SwXR+ZZ
         wpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131865; x=1779736665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byBkYmeeTqdoqUtx0ontJmxUgTZsHoHtMo8LuZGH+UU=;
        b=rBHdyi1AEZZXUdT8Hh4BHE4L2BtaEI99Qhu9E6VDOHtvG2lBYzh22Rdb20e5zjmctf
         Np9E5Wg82lEbcOd5t29o619eN8tgWhsS57ebBsofAIDVHr5nFWc0u8bf6ALw4NEJYLRB
         fcqhd1c/kb9HfJejTFBLc/M0G3VubPUemMvPNFhunzEQ7QNuhm8VsVTHhErdoMU4lXVV
         88vudsJjacu3CWStH5T0TxWmlwg763ebjf4o3Wbg+wZfBBVYxzXhwyw1BhlVqrZDk5J8
         IFkZsdg4SSQjcfIjyBAtIJ3MsLdHS2XT1WwwEoH5ljF6bL/S4zATncY7XIImEI9roRq0
         8CaQ==
X-Gm-Message-State: AOJu0Yxd8ejKOAmcqLnvYUCuMl4+jEXLnCEOIOVBQdUBTe88fSSnxy3M
	2PUDRv5KJ11RnmS4mMLekF8s0PEcxf/ZoCztPJHa6FBXzTGL/MhiDNJSKy5KnedzNWe1HMOisfc
	guvWzgDKIRH6HcOfrO9SZk3SWN63kVy02e4Efd4G84b4LIADMVa0ON3eSkLFSECRFOSNYTVmKuy
	eXMUnXmyqUVF4DteavI/lIMAe35pAeK9CK4PXYWzj/hNI9qf0Y
X-Received: from pfbeq4.prod.google.com ([2002:a05:6a00:37c4:b0:82f:344e:386a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3010:b0:820:2f9b:fe31
 with SMTP id d2e1a72fcca58-83f33cf0645mr17477098b3a.30.1779131864734; Mon, 18
 May 2026 12:17:44 -0700 (PDT)
Date: Mon, 18 May 2026 12:17:44 -0700
In-Reply-To: <20260515201628.9E3C5C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-33-seanjc@google.com> <20260515201628.9E3C5C2BCB3@smtp.kernel.org>
Message-ID: <agtl2L4Y_jE1MAai@google.com>
Subject: Re: [PATCH v3 32/41] x86/tsc: Rejects attempts to override TSC
 calibration with lesser routine
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Spurious WARN_ON stack trace on every boot for CoCo (SEV-SNP/TDX) guests under KVM.
> --
> 
> commit e57255e4d076143a67d0e6e44f914aec31aed8c7
> Author: Sean Christopherson <seanjc@google.com>
> 
> x86/tsc: Rejects attempts to override TSC calibration with lesser routine
> 
> This commit adds a sanity check when registering a TSC frequency calibration
> routine to ensure the incoming routine is as robust as the outgoing one,
> rejecting it with a warning if it is not. This prevents replacing a trusted
> calibration source with a less trusted one.
> 
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index 98bef1d06fa9d..7a261214fa3ef 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> > @@ -1319,8 +1319,13 @@ void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
> >  
> >  	if (properties & TSC_FREQUENCY_KNOWN)
> >  		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> > +	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)))
> > +		return;
> > +
> >  	if (properties & TSC_RELIABLE)
> >  		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> > +	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_RELIABLE)))
> > +		return;
> 
> Will this cause a spurious warning stack trace on every boot for CoCo
> (SEV-SNP/TDX) guests under KVM?
> 
> For KVM CoCo guests, CoCo registers first via tsc_early_init(), setting both
> TSC_FREQUENCY_KNOWN and X86_FEATURE_TSC_RELIABLE.
> 
> KVM then registers second via kvmclock_init(). At this point in the patch
> series, KVM only passes TSC_FREQUENCY_KNOWN, so the properties & TSC_RELIABLE
> check is false, and it falls through to this WARN_ON. Since CoCo already set
> the capability, the condition evaluates to true.
> 
> I see this is fixed later in the series by the commit "x86/kvmclock: Mark TSC
> as reliable when it's constant and nonstop", which modifies KVM to pass
> TSC_FREQ_KNOWN_AND_RELIABLE on modern hardware, preventing this warning.
> 
> Could the patch ordering be adjusted to prevent this intermediate regression?

Ah shoot, no.  Well, not entirely.  Because when running as a CoCo guest with a
trusted TSC, the kernel needs to prevent overwriting the TSC calibration, *period*.
I.e. changing the ordering will eliminate the unwanted WARN, but it won't fix the
underlying goof that the trusted calibration routines are still being overwritten
with untrusted routines.

Hrm, the SNP secure TSC code complicates things, but I suspect it's broken.  If
it's indeed broken, then I think we can add a TSC_TRUSTED flag and then do:

	if (WARN_ON_ONCE(!calibrate_tsc))
		return;

	if (properties & TSC_FREQUENCY_KNOWN)
		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)))
		return;

	if (properties & TSC_RELIABLE)
		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_RELIABLE)))
		return;

	if (!cpu_has_trusted_tsc() || (properties & TSC_TRUSTED))
		x86_platform.calibrate_tsc = calibrate_tsc;

	if (calibrate_cpu)
		x86_platform.calibrate_cpu = calibrate_cpu;


Tom / Nikunj,

Isn't it completely wrong to assume the CPU frequency is the same as the TSC
frequency?  The changelog says the difference "does not apply", but that makes
no sense.

    Use the GUEST_TSC_FREQ MSR to discover the TSC frequency instead of
    relying on kvm-clock based frequency calibration.  Override both CPU and
    TSC frequency calibration callbacks with securetsc_get_tsc_khz(). Since
    the difference between CPU base and TSC frequency does not apply in this
    case, the same callback is being used.

E.g. if the host passed through APERF/MPERF, then the difference most definitely
applies.  If TSC != CPU frequency, then knowingly using bad data is even worse
(far, far worse) than hoping the untrusted host is playing nice.

If the TSC and CPU frequencies are somehow guaranteed to be the same (which I
can't possibly imagine is the case), then the above won't work because we also
want to prevent overriding calibrate_cpu().
