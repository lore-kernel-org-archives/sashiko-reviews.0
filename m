Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB33EF649
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 22:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884158; cv=none; b=GpBgypUh7P26AhPiYxcGGsRSmbC8ogKHB7Hn4P5egsrSTsp3afnGVDp6BLYyKXptJYAZZxBLbAPvXUcaZtTQIU1QaiHMBZiSQIXVpf/SB8bcHIOrVoWgf8yzPav1FrjILFzL0UNkKxgKZM1r/NiKAIuYzBUIPfys5xCMQUNJz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884158; c=relaxed/simple;
	bh=3kBs+LoK/41x7KTyqa5sAHIy4wlL0hqntfKNUvehlXc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yr7va6FEAPmxz3p+PHF0lG/7jObBIF8cm90IWTS4JOkB3RUloKBVUsD5RejqIPy24pHwweWEi3GYUxQwWfBKUsXPdTjlZfi/U7GZvCYmg161nKboifkpKVD488vmlbey3Q00ha1b2wvmqzY8pHD6oIPvdNXN9uisVD8mTNx4wx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kOWisG9E; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kOWisG9E"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso393681b3a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778884157; x=1779488957; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MJEFaPkKBrp+ZhLTHzWdmAHs7LO5UggosySgozYIFoU=;
        b=kOWisG9EVvotS8x42JguVInbzaNDS14dwe6mtC+f5dYa3UC7lVSiVbMiZ0u2DVCyw6
         whdleKEdYcG9lTq9rNz5GiZX5DmqbsD7sZB/cfvwoShcMihpLW/U8kJqw4VTp6ubuvS6
         x2cuPjm8FG00fU/2Id9jyIc/PtSGmic5JSaA8PNsMIlj04I9xnmaZVjWWRBOcAGUfVH0
         BccQvBJ350cm5QByA2gD7nNhZn1mW1kokQyrpan0VRDfL9S+E1nxZzvRuVNrQrppVg0S
         EHj+iyYJFhreeLC6oxUm+H9wTY8nofSVZLrXKdIXmJYVsrX68OE1EGvsWe+vaCt4D3sf
         rKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778884157; x=1779488957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJEFaPkKBrp+ZhLTHzWdmAHs7LO5UggosySgozYIFoU=;
        b=j6hwuNg9Pd0Z0q+jC3NTqk+7GNYEFHakD/hsj4cEVz6CQezZ2fAUje2nbOzDRD2dwv
         FXYVUL+Jz1HJrT/VdqB5GFw2a+kV9Q6N1GqwzH1QVJB1JJfjbY422us4dqsVMH+rA06Q
         uCa50XcLtQzTSShqNrPztc0OLfcZh6OUKPSJS8h1UWqX536iu7WyzMiC9kFE4XRyGsKf
         SOqJNV4jIXGqJmQh4GCPTUb1pYjg6mxBL6P76iXOJ4bbkVZBvRt/+NlZrqVZpfN/rY/c
         iFrr5rnNlurbfSwPU20+LnkTrDvWZzxwWqwjO7yW7h8KoqjX4I48BPiraE9d3j+9J18m
         MENQ==
X-Gm-Message-State: AOJu0Ywqev0TRfwgA3LWUxByIeDs1XioTV3pfuQ6R3LDWrf1agFKFGZC
	s/S5P6jkY4l3GUIHX53M9FVGspyB5Jr+skH7PwNjx6IKOuYS3gcwEHf+CNePM3bc5ihcIVo/MKz
	zJ/MJAkrApZojdTqECnlzYG24s0gymJD+dY2wDzUAQd94MOxnCOmOandXEOg/PYxQsbQBFoX8pE
	t40DQnkyFmNdEl4wzxC4oWsVw8R01+INTo4X4CDaViSI6IwQ5B
X-Received: from pfoo19.prod.google.com ([2002:a05:6a00:1a13:b0:82f:20ed:8059])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3028:b0:82f:2243:e445
 with SMTP id d2e1a72fcca58-83f33d9dc40mr6348229b3a.32.1778884156219; Fri, 15
 May 2026 15:29:16 -0700 (PDT)
Date: Fri, 15 May 2026 15:29:15 -0700
In-Reply-To: <20260515203447.ED0E7C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-12-seanjc@google.com> <20260515203447.ED0E7C2BCB0@smtp.kernel.org>
Message-ID: <ageeO3P0Nc3Fji48@google.com>
Subject: Re: [PATCH v3 11/41] x86/kvm: Don't disable kvmclock on BSP in syscore_suspend()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index df95516a9d899..006e3a13500b4 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> [ ... ]
> > @@ -178,8 +178,22 @@ static void kvm_register_clock(char *txt)
> >  	pr_debug("kvm-clock: cpu %d, msr %llx, %s", smp_processor_id(), pa, txt);
> >  }
> >  
> > +static void kvmclock_disable(void)
> > +{
> > +	if (msr_kvm_system_time)
> > +		native_write_msr(msr_kvm_system_time, 0);
> > +}
> > +
> >  static void kvm_save_sched_clock_state(void)
> >  {
> > +	/*
> > +	 * Stop host writes to kvmclock immediately prior to suspend/hibernate.
> > +	 * If the system is hibernating, then kvmclock will likely reside at a
> > +	 * different physical address when the system awakens, and host writes
> > +	 * to the old address prior to reconfiguring kvmclock would clobber
> > +	 * random memory.
> > +	 */
> > +	kvmclock_disable();
> >  }
> 
> Can this lead to memory corruption if another clocksource overwrites the
> x86_platform.save_sched_clock_state callback?

Yes, that's why the kernel only allows one "main" hypervisor.
