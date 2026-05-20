Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA93164C3
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295256; cv=none; b=Vw4kJDqB7ts6ozExaRYmoKbda63CfoKQmTcjr92KoLxI/oIwGRlT1RqdL3uFJQaOrJsHIHTzZ9xycG1WHpmlE/WW5jqHrNDWd4IyhTKEjw0e3mq1dP0/nd7f952F8rF7iv/r33K01XZqNhTWS2697Pmc3w5hyZlNn7fkViV3rY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295256; c=relaxed/simple;
	bh=1jQGC7ilYK/8IRxbbHHrlHletOjw4xmsDBVkivTwitc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bQsLGEtVTUiX83tXOLgnn6wtmc8ZpZC+QipTQZLIYk2mqUoDEvjSxZ3Y92wC68AM1R+PSFhp7IAfiGbziFa9LxOZahM41bWZlUR4NSKkheIP8vI7xY98Ieb5ZX8tE2SxM968G/xFhTSWM/e73SSHQfnfpltJmtTAEbiL3Oh+hXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vYiXon8i; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vYiXon8i"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2babbeff9e4so55188885ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779295254; x=1779900054; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uOL4cOFcmIbqPzPir4tND7dtGvw5bh7PCiQarNYoOOk=;
        b=vYiXon8iiO2NXU3Rym6bQLA3j6S37W+hayX74lwdcPY+nVYToJW9YfbSFQyl/F1BWM
         kicvlC4IkOTZTmnYhWQKKRKFfQ00NirzR8+OY8WAyc328lLCAdeBmwa9j7w9dSAej5Ix
         aN2Fwxn9EYz5Ekm03slbq+v9vLBvhSYI6zdwTfKCf3oAhb9E13ifwSfOHxqyWxwAc5HJ
         xY55IuzOw6Vl7qnJWc9SoSUyiVCrKOeAbfv8kCth11W+y2EEjyhWqpLajr3UgySnQI3P
         OHrfSrC2HOom7ra1RpvHwIhRhCEiT6pOiyMoL9jMemRs6wtiWByfCY2a474ViE/AREiB
         e9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295254; x=1779900054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOL4cOFcmIbqPzPir4tND7dtGvw5bh7PCiQarNYoOOk=;
        b=oG69fjwuzJq8gKuawJ4Siq19uZlRSTeBWfXYiyDL+Ro88YZRcA6KXJF7js8uEEERgF
         GITaQc1AopXx2yhLMX80UI5/PB0L+9gMjk5SAzSS47JFRIjCIc1R4mhbnIu2VHGO7HS3
         Fa2e2/RrjHopeqfmTYpXHJi/M8n8uHfvhUdESEE7K39yMr5KADn75ney69ExDbfihh7S
         E026Vir3YT7ilw+77OSYD5FK3Xn8CMOK6YhrSnN5KzUjxxmkIaWHCU08RggsdOKGp1Op
         L7Ld/ztvCdBS2IGA8bAr1QrAQ6dJTCWW0CCXLb3luEWmFVdR3CJ/X0FjDB+JPGc4hiFv
         gZMg==
X-Gm-Message-State: AOJu0Yyk6/FaDWjIdKPIsdgFM/ApZGm5e6PPcZmoX2alyDeW0uo5HY/l
	ht44UkRBoKLWy1/ltA3OKZ6C0OG1gaurRJsXpX/48dxRBfETK5zdms5nk4ZcJ7NyYf3Tx7DhRrH
	FtgkpCA==
X-Received: from pllx16.prod.google.com ([2002:a17:902:7c10:b0:2b4:58ed:55d2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ac3:b0:2ba:bab2:a867
 with SMTP id d9443c01a7336-2be9d414296mr1888365ad.12.1779295253753; Wed, 20
 May 2026 09:40:53 -0700 (PDT)
Date: Wed, 20 May 2026 09:40:53 -0700
In-Reply-To: <SN6PR02MB4157D50A944A2794475E32FED4002@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-32-seanjc@google.com> <20260515194535.56B84C2BCB0@smtp.kernel.org>
 <aguQIJQYsarMScnl@google.com> <SN6PR02MB4157D50A944A2794475E32FED4002@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <ag3kFYLrypsBnlkY@google.com>
Subject: Re: [PATCH v3 31/41] x86/tsc: Pass KNOWN_FREQ and RELIABLE as params
 to registration
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 19, 2026, Michael Kelley wrote:
> From: Sean Christopherson <seanjc@google.com> Sent: Monday, May 18, 2026 3:18 PM
> > > > diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> > > > --- a/arch/x86/kernel/cpu/mshyperv.c
> > > > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > > > @@ -516,8 +516,13 @@ static void __init ms_hyperv_init_platform(void)
> > > >
> > > >  	if (ms_hyperv.features & HV_ACCESS_FREQUENCY_MSRS &&
> > > >  	    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
> > > > -		tsc_register_calibration_routines(hv_get_tsc_khz, hv_get_tsc_khz);
> > > > -		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> > > > +		enum tsc_properties tsc_properties = TSC_FREQUENCY_KNOWN;
> > > > +
> > > > +		if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT)
> > > > +			tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
> > > > +
> > > > +		tsc_register_calibration_routines(hv_get_tsc_khz, hv_get_tsc_khz,
> > > > +						  tsc_properties);
> > > >  	}
> > >
> > > [ ... ]
> > >
> > > > @@ -629,7 +634,6 @@ static void __init ms_hyperv_init_platform(void)
> > > >  		 * is called.
> > > >  		 */
> > > >  		wrmsrq(HV_X64_MSR_TSC_INVARIANT_CONTROL, HV_EXPOSE_INVARIANT_TSC);
> > > > -		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> > > >  	}
> > >
> > > If a Hyper-V VM exposes an invariant TSC but lacks the frequency MSRs,
> > > does it bypass the tsc_register_calibration_routines() block entirely?
> > 
> > Yes.
> > 
> > > Without the standalone setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE) call
> > > here, it looks like these VMs will lose the reliable flag.
> > >
> > > Will this inadvertently enable the TSC watchdog, potentially causing a
> > > performance regression if the system falsely marks the TSC as unstable due
> > > to virtualization scheduling delays?
> > 
> > Hmm, I was going to say that the change was intentional and desriable, but looking
> > at this yet again, I don't think that's true.  Enabling HV_EXPOSE_INVARIANT_TSC
> > just means the kernel will (probably) set X86_FEATURE_CONSTANT_TSC and
> > X86_FEATURE_NONSTOP_TSC during early_init_intel(), AFAICT it doesn't lead to
> > X86_FEATURE_TSC_RELIABLE being set.  And I think in this case, marking the TSC
> > as reliable makes sense; even if the kernel doesn't user Hyper-V's calibration
> > info, the host is still clearly telling the guest that the TSC is reliable.
> 
> Yes, I agree. But I'm doubtful that such a combination ever occurs in practice.
> I've never seen an occurrence of a Hyper-V (even really old versions) guest
> where the frequency MSRs are not available or are not accessible. The
> Hyper-V spec allows for either condition, so we have the code to test the
> flags. I've thought of the flags as always set, though I suppose one never
> knows what the future holds.
> 
> > 
> > Michael, does keeping the
> > 
> > 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> > 
> > but also passing TSC_FREQ_KNOWN_AND_RELIABLE to the calibration routine make
> > sense?
> 
> I don't see that it would break anything. But it seems a bit disjointed in
> that HV_ACCESS_TSC_INVARIANT is tested in two places in
> ms_hyperv_init_platform(). Does TSC_RELIABLE *need* to be passed to
> tsc_register_calibration_routines() if later code in ms_hyperv_init_platform()
> does setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE)?

Sort of?  It's not strictly necessary, but passing in TSC_RELIABLE allows
tsc_register_calibration_routines() to ensure it doesn't clobber a more robust
calibration routine with a "lesser" routine.  I.e. not passing TSC_RELIABLE in
this case would trigger a false positive (and break Hyper-V).

In other words, invoking setup_force_cpu_cap() is a (happy, desirable) side effect,
not the primary goal.
 
> In other words, I'm suggesting let tsc_register_calibration_routines() handle
> the TSC_FREQ_KNOWN case since that's what the calibration routines are all
> about. Leave the setting of X86_FEATURE_TSC_RELIABLE to the later code that
> tests HV_ACCESS_TSC_INVARIANT, instead of duplicating the
> setup_force_cpu_cap() operation.
>
> While combining FREQUENCY_KNOWN and RELIABLE into
> tsc_register_calibration_routines() is convenient, the two
> concepts turn out to be independent when looking strictly at
> the Hyper-V spec and code written to follow that spec.
> Combining them into the same function ends up being clumsy

Yeah, it's a bit awkward for Hyper-V, but Hyper-V is definitely the odd one out
here, in that it has an "out-of-band" feature that marks the TSC as reliable.
All other PV features that trigger overrides of the calibration routines bundle
the RELIABLE aspect with the feature itself.
