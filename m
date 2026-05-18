Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF5D24DFF9
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137836; cv=none; b=H84kQzcg8506LSuQKZ8pfGmk7pYcMBzfbFPQRVKiY1YUV0Blw8fkILYFzYo/jJ/ihJBpLVx0oet4duUVz0VgGk+u2hE/IejNhIX4AIEfs1X2E6NLZLLJQja5Lbjh1vNP8Gan88ZW6n2mL7oLaDy3db0qQ3D+pdAFXk7bCJrB1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137836; c=relaxed/simple;
	bh=06kv6crDp6XZKshrhUXskI9fXrzeLGzJNXc6n7rslSQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GxK6wP/jSNass223X01ff8dEvU9gnOHjGomt5mdwtC5+vo1c4X2wmgl4IQraVDf4yw5YQO7kI0gAcg8HTz487wk04cMhQHEio7UBclwBQ7a2jAurDv/Teni4TAzrQ8XfoqWcgweCByQ6eWkSARH+J0qeLYOi7PA0xcEpITltRio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=maW3Ef//; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="maW3Ef//"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso32415295ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779137834; x=1779742634; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBzoFdeurFIMNQx3LZwRN9zVdUKex6zY1ADox/ll04w=;
        b=maW3Ef//5UA+Rnqil+KlTbdypRXxabKfL2Mm7pGo55LMUsk7Uw6zcfmQ8UumRFNxKn
         2UmzPGZmgidiPGWl/oeJ0UmJNuHUT/2NHFu1GiALnigEw2yRCyn9cEUY4oIehAlrb1Tu
         Tv+VlOv3X4288pha8Pg8nvAOgA4KT0O0GGfHNQyWe+g/osDPzlLHx2M4BobKQztFFJZZ
         ksdEG/2qfuh23Bu8L60tL0eu4gnFRvZxgow5Ll8k4xjjhVGMB6LEEkZdamtmHxkoRkSz
         G2VsqJrOEkDsd0P0P3yjLrc+hyNRR8c1PXOB3V0Kr7X7cuQc8S0cK20feV7ZsYzFNwHN
         KYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779137834; x=1779742634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBzoFdeurFIMNQx3LZwRN9zVdUKex6zY1ADox/ll04w=;
        b=nz0H1zTTofrmSwBqo8Tr+lPbSGxWTOyoYGZ0GK0623otvvbmGvvEBuPK0NitQXwQbg
         RiQiYHn856Tjphzmv10t6IfZ4ZcLMRzN/7RFcjRy39z/mbRwNP8uTJPeiziO0u29YCI8
         0C492DntWQD49Ffn554XzxS6ct0AwrZEXK6iVWAaf2Guefe+K0exEW/MNBZTANmERORa
         1qQsglJJzoSBveSGQ5HKN7FlIRDnjidK/pSH7oddy0r+U4e8x7v9T7+quzR2Pk1aJTYE
         OLmjKdrLUOF+gcfDjz4rbQNx7O++Bb4ULnAaAk6+IDERo80L8rYRhlWGj1nAbAE/keHo
         pb2w==
X-Gm-Message-State: AOJu0Yx/H+3rwuBlc5l0voncoCs5HZ06ZqxHVGHlrq51blMDdegyVEWG
	tXy3KYyALMb+EAVe8bQ+pzVSHEEDPG6bJEdxxrGhZUhMvvFdBwO/2v2+tfPTr0qsuYoM3qVPqBK
	ISkV4xM3fxV9EA1eCZevErBWCZXuqoHeDaSyO4j6lGSMqeYacp2Ehc3ENmxk/vJilTopiFjyAIu
	zjp2ELbK3/8PYglEJd/t9tROAgLPAjy/3BAk7Sh08sWm06bz7f
X-Received: from plbbb3.prod.google.com ([2002:a17:902:bc83:b0:2bc:b04b:d296])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc7:b0:2b4:6d92:b002
 with SMTP id d9443c01a7336-2bd7e9e58aemr193521345ad.37.1779137833388; Mon, 18
 May 2026 13:57:13 -0700 (PDT)
Date: Mon, 18 May 2026 13:57:12 -0700
In-Reply-To: <20260515195557.DEF05C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-37-seanjc@google.com> <20260515195557.DEF05C2BCB0@smtp.kernel.org>
Message-ID: <agt9KJ1LDU5zVMIs@google.com>
Subject: Re: [PATCH v3 36/41] x86/kvmclock: Get local APIC bus frequency from
 PV CPUID Timing Info
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] lapic_timer_period is incorrectly assigned the raw APIC frequency in kHz, which fails to account for the kernel's HZ configuration and breaks APIC timer calibration for any HZ != 1000.
> --
> 
> commit e5bbef05c7ba30fb00c716accae48693e295289a
> Author: Sean Christopherson <seanjc@google.com>
> 
> x86/kvmclock: Get local APIC bus frequency from PV CPUID Timing Info
> 
> This commit reads the local APIC bus frequency from the PV CPUID leaf
> and uses it to directly set lapic_timer_period, bypassing the standard
> calibration process.
> 
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> [ ... ]
> > @@ -200,10 +200,19 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
> >   */
> >  static unsigned long kvm_get_tsc_khz(void)
> >  {
> > +#ifdef CONFIG_X86_LOCAL_APIC
> > +	u32 apic_khz = kvm_para_apic_bus_khz();
> > +
> >  	/*
> > -	 * If KVM advertises the frequency directly in CPUID, use that
> > -	 * instead of reverse-calculating it from the KVM clock data.
> > +	 * Use the TSC frequency from KVM's (and other hypervisors') PV CPUID
> > +	 * leaf when available, instead of reverse-calculating it from the KVM
> > +	 * clock data.  As a bonus, the CPUID leaf also includes the local APIC
> > +	 * bus/timer frequency.
> >  	 */
> > +	if (apic_khz)
> > +		lapic_timer_period = apic_khz;
> 
> Does setting lapic_timer_period directly to apic_khz assume that HZ is
> always configured to 1000?
> 
> The lapic_timer_period variable represents the number of APIC timer ticks
> per jiffy. This is usually calculated as (frequency_in_hz / HZ), which would
> be (apic_khz * 1000) / HZ.

Ugh, TIL.  That's quite evil.  I'll fix in the next version.
