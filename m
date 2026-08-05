Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375F3B8409
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942969; cv=none; b=SOloM32vVuBF8/UQIDtCclRxhmbuXQR+ahYCkZMeiPxJQ1UJKY4FvEIjvi+M60r/6imcIbYDl4pPttGZvvlI9H7S6WVTCloWxVwHZy3E3INB+4JyUSEZ+SdgGCNfoi/c/lpQZ6W7dzjuHwu3KWKit3ZO3lXzxHHk08DIJ3yuRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942969; c=relaxed/simple;
	bh=/jsnyeL31Ho9o2A2RGw3IIZL5oIJUrAhbAI6FLENcnk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iu6WoB7WfxXBt1fsSvxtKJoMEjTfqPucs3ra719nAy6oZn8JdCK/WLWaPYv+x24Iwsj75xdVkApDea3pAtVVEbbhb1cBo0+h9xGIAV5fIuCF5MnohOrCdoDyVQ9o+bON8KLh94t7rm5mpR9ST9o3qTAWF0LtzR0X2T59fgS6G4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cgTHIT4K; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cgTHIT4K"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d004f13426so14303985ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785942965; x=1786547765; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yhOJIAa5pFjp3z2I6OHq3rdcIlnjtUlrPTkzMvt2+A=;
        b=cgTHIT4KNg3nduMb+d787pZHcmd+x7hnXjForEBg3rjH4nXet/YMhBBf63Qs4UsLrP
         oCLuxcUMU/+CWjVQCjXxFKTyGByrZYSRYUed/j8funDqoMOeFTbIBpV/l9qwf1/xlZKa
         opb1WZan/3ZV9GnioA8tis+9x07AMe6fKjUVkS9HiWdruN0a89Q3V/r2zxgSWsNbNBDz
         OwEnW402kZSJlr2YLJuTD+R/N7MzHoA3Vz7ahcHqhtV5zRQaU7HuPZ/t9lBrQc+omwDf
         2v2TeB4Kg4riigb3giXEGnvN1ns0R+yL64d7xyJY0MHWVCvmnj+DNcDB7V36Fxvj9eNh
         S9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942965; x=1786547765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yhOJIAa5pFjp3z2I6OHq3rdcIlnjtUlrPTkzMvt2+A=;
        b=Q8tzrCUQ0U0+uk+aQIVyVgUDMSZ7xOVba4MwjDyjbHjRZ3R8ypNORqz8bgpSNZqsdM
         5IFzPHfoisBX+IabdM1bUTX0G+z+hReQgyYovfUyLBjJ17ojSeWQ/fpMc6N8NMHTNsuZ
         naRGcUiQPUTziY83nlOOOAb3NJOwpqd7qGX7psPyEGZl7ohRsGQnQ2yJkaGISW0MR4s+
         /WjJ0sgT7ZvJRmuX/FvnZIXx84UrSR9AtmIVdfHirjidVvPJ5Htq/7XmNJQYvHguxQvQ
         fensOQz3JW6SW8tQplLUCIjyEomfgyoqkpSJC/pugnR/K/RKbz4kCSORXW7xKWCieSXN
         cZPA==
X-Gm-Message-State: AOJu0YymnqP8TVBjtRSeMZ4z0PpxKxr0LAwYxbEz9650kiS0WQebpiEy
	ai8mwYugksl6Obn3zAdoEgmt6MLFYi6iBNC0BHHKZomNOATxXnT3EhqHZWJmoB2e1ou4KL5vXnC
	+xtBz77DKmAjulv2mNyG5s3/FzyI5of2hW19JezDdsaoLW0zWUkqnbL4gHu81Zk5Mf6cwybR9wj
	l+T7C6YyXb0ESSDxwovxPYFAaVHtN7511U7UnpmT4SdQ9i6CGy
X-Received: from plbmu15.prod.google.com ([2002:a17:903:b4f:b0:2cf:7a5b:f7ad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2290:b0:2c0:db23:4c4
 with SMTP id d9443c01a7336-2d0ca78d505mr81371305ad.16.1785942964856; Wed, 05
 Aug 2026 08:16:04 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:16:04 -0700
In-Reply-To: <20260804235652.56E811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804233923.3504629-1-seanjc@google.com> <20260804233923.3504629-14-seanjc@google.com>
 <20260804235652.56E811F00A3A@smtp.kernel.org>
Message-ID: <anNTtCYh7BpURA3n@google.com>
Subject: Re: [PATCH v8 13/17] KVM: x86: Disable preemption, not IRQs, when
 getting TSC+freq pair
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"

+David

On Tue, Aug 04, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index fa00799ba13da..e0e8c6883b831 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> [ ... ]
> > @@ -1805,11 +1804,14 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
> >  		}
> >  	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
> >  
> > -	/* Keep irq disabled to prevent changes to the clock */
> > -	local_irq_save(flags);
> > +	/*
> > +	 * Ensure reading the TSC+frequency pair is done on the same CPU.  When
> > +	 * NOT using the master clock, the TSC frequency may vary between CPUs.
> > +	 */
> > +	preempt_disable();
> >  	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
> >  	if (unlikely(tgt_tsc_hz == 0)) {
> > -		local_irq_restore(flags);
> > +		preempt_enable();
> >  		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
> >  		return 1;
> >  	}
> 
> [Severity: High]
> Could replacing local_irq_save() with preempt_disable() allow hardware
> interrupts to break the temporal atomicity of the fallback clock reads?
> 
> If KVM falls back to the non-master clock path just below this code,
> host_tsc and kernel_ns are read sequentially:
> 
>         if (!use_master_clock) {
>                 host_tsc = rdtsc();
>                 kernel_ns = get_kvmclock_base_ns();
>         }
> 
> If an interrupt fires between these two reads, it would cause kernel_ns
> to be sampled later than host_tsc.
> 
> Could this inflated kernel_ns then falsely trigger a catch-up adjustment
> later in kvm_guest_time_update():
> 
>         if (vcpu->tsc_catchup) {
>                 u64 tsc = compute_guest_tsc(v, kernel_ns);
>                 if (tsc > tsc_timestamp) {
>                         adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
>                         tsc_timestamp = tsc;
>                 }
>         }
> 
> and permanently advance the guest's TSC offset or cause temporary time freezes?

Hmm, yes?  Though it's worth pointing out that NMIs can introduce the same issue,
and that's not really a solvable problem.

And if we keep the "disable IRQs" logic, then I think we should also disable IRQs
when doing kvm_get_time_and_clockread() for the same reasons, because that too
grabs a TSC+nanoseconds pair.  And that would mean disabling IRQs in get_kvmclock(),
so that kvm_vm_ioctl_get_clock() in particular provides an atomic-as-possible pair.

David, any thoughts?  I'm leaning towards keeping IRQs disabled to minimize the
chances of introducing a regression, even though I highly doubt disabling IRQs
to provide an atomic-ish pair was ever done deliberately.  My main concern with
disabling IRQs is that it will further muddy the waters with respect to what is
actually necessary, versus weird things KVM does for historical reasons.  Though
that can largely be solved with a verbose changelog.
