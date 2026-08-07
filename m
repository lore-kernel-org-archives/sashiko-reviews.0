Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7A372EED
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118509; cv=none; b=NMcDVHF6nvvnkfKgmVyKPqzwpwjSL+2OUwMO6QdXBH6nF5dpYdU2G43dP/9yMn6Xp1Ok5Fh/ACa4L6CuoAmXR3TX2z5LQ6AmD7V1AWObegMyBGWGAqYL8lOBQJ16jzUvKCyefcw9i41CD27+z8AE4X240r5iywE9GDPPRpl58wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118509; c=relaxed/simple;
	bh=oyF0eUov7V5Joayl1WtETNH42ClpKVUpM7pXQZ8D0gs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EwFxhkv6MqR4yGRMIBDSL3NGwsyLhNcp+sicX+q7wfWUyKBA8UwPAmAlgybWzQ/GpCW6i9Q9dLz0efdYn6pGpaesE+/z8ASw3CbYudcyL8OHtMod5IY/1N06AtxyuuYkC3EYu2FJRLbG9yKxediYyvSRkv3ImELmR1QchCfWCNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ncF9EoVz; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ncF9EoVz"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso4510684a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786118506; x=1786723306; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuRvEMyIwcIIc608820BMSIsxJ52vGjz6iWrNb91CbA=;
        b=ncF9EoVzD2DeWJo983n/F6Xu/k5uOwxIvf9XEK+gCKPv2DoLDK3fdHbHiFnxesv7bN
         3+JXO1cweRT3meoLWNxR2TjFUXvEpUHfKAKBSKoHIknVzCpHavKM9Nf0uEsC6jUSovb4
         T4PCFcOR7YKW+Z6XkfJ6gH06IM86s2obgjsvfDG6C4QIb20LwPFlgIqNPsTl48NXHe4u
         fGhpwJbBSrGdSmr8n/9P26xXuQVnmN+j3o1wbilD9mQNGtOL6agPYxappS70W4gQ8bYl
         +S1qBfspOmIPyEEZe74WPXwDY2WWWcgqb+Z3mc+DmuMBzknMnbpXflv+lkDW+/eXBiyO
         dSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118506; x=1786723306;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LuRvEMyIwcIIc608820BMSIsxJ52vGjz6iWrNb91CbA=;
        b=Ksh8W0fy2H0Ex/lbV+/K8LnHC3ouMlpN17LGCg1SJFsFbsKFTNvwKFwADFe5sXb3ac
         EmjGuo99WOamBMGdO7OErHe64EsGm/NYwI8z1YnrkWt6+wJ4PdBEySqK/nV+Ij9wyrMI
         fsBjwdRfN1CIevTk+F4Pv8mdM5ts8ijD6GEiDrYnBw5xWd/VjjSEVI0KjODRdQ6E5jy1
         zmgjJNkCOM0ilOV7+IJMN7K1sg8i/+2bND+8rAztiubBcbYb15G9YzrSENPA7UnMq71H
         98eqMYUMyWCe9oeye7AVRF0D4urm6VAG0ga/ndKaD2tAuyq1M+lI4LU9H7utjRsaqRGB
         Y1Aw==
X-Gm-Message-State: AOJu0YypvaOXBE0T7HCz1IaJ3dYAjoj5AY1qbDTodwHk+kD3tRF8QIR0
	7uTjDli0HkBqPrXM4QWJomMi6tMFCh9ZqQJ2yOZNt3FoPIeP1Cmv5PA/Hh/DBHHO7coQ6LyYwle
	yVlWYdgjO8XSVjanKB3bbaV/Vw7f+FZ1GDOvLEPU+mj3LLBo/f5sI/POwt9u0TmUOVLV9AOY4Z9
	aTOxZgHgrWmj+hIFcf1qTCv4+JPluG1GQ8x7TuvW8mn4VGIauY
X-Received: from pjbse13.prod.google.com ([2002:a17:90b:518d:b0:386:bc47:e8b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28cf:b0:381:11eb:d78e
 with SMTP id 98e67ed59e1d1-3903c5d321dmr24032426a91.14.1786118505000; Fri, 07
 Aug 2026 09:01:45 -0700 (PDT)
Date: Fri, 7 Aug 2026 09:01:38 -0700
In-Reply-To: <anUmdhx0Dh-yd89z@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804233923.3504629-1-seanjc@google.com> <20260804233923.3504629-6-seanjc@google.com>
 <20260805000221.B63F61F00A3A@smtp.kernel.org> <anN_J_KZhVJ1zIeI@google.com> <anUmdhx0Dh-yd89z@google.com>
Message-ID: <anYBYu4rx-jCv8gr@google.com>
Subject: Re: [PATCH v8 05/17] KVM: x86: Avoid NTP frequency skew for KVM clock
 on 32-bit host
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"

+David (I realized I'm having a conversation between me, myself, and Sashiko)

On Thu, Aug 06, 2026, Sean Christopherson wrote:
> On Wed, Aug 05, 2026, Sean Christopherson wrote:
> > On Wed, Aug 05, 2026, sashiko-bot@kernel.org wrote:
> > > > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > > > index 3107878a6fe5d..8f469fd9863f9 100644
> > > > --- a/arch/x86/kvm/x86.c
> > > > +++ b/arch/x86/kvm/x86.c
> > > 
> > > [ ... ]
> > > 
> > > > @@ -915,13 +914,6 @@ static s64 get_kvmclock_base_ns(void)
> > > >  	/* Count up from boot time, but with the frequency of the raw clock.  */
> > > >  	return ktime_to_ns(ktime_add(ktime_get_raw(), pvclock_gtod_data.offs_boot));
> > > 
> > > [Severity: Low]
> > > Will reading the 64-bit pvclock_gtod_data.offs_boot without seqcount
> > > protection or data_race() annotations trigger KCSAN data race warnings on
> > > 32-bit systems?
> > > 
> > > By removing the ktime_get_boottime_ns() fallback, this read now executes on
> > > 32-bit architectures where it compiles to two non-atomic 32-bit accesses.
> > > If a KVM vCPU thread calls get_kvmclock_base_ns() while a timer interrupt
> > > runs timekeeping_update(), it overwrites offs_boot.
> > > 
> > > Even though the value only actually changes during suspend when the freezer
> > > subsystem guarantees vCPU threads are frozen (preventing functional tearing),
> > > overwriting the identical value concurrently with an unprotected read still
> > > introduces a formal C11 data race.
> > 
> > Huh.  And strictly speaking, 64-bit could tear the store/load.  Stealing heavily
> > from ktime_mono_to_any(), this as a prep patch plus fixup (not yet tested)?
> 
> LOL, hilarious.  I was cherry-picking the rest of the series on top to run the
> tests, and discovered that "Compute kvmclock base without pvclock_gtod_data"
> does exactly that: uses ktime_mono_to_any() directly.  So at least I went in the
> right direction?
> 
> David, is there any reason that patch needs to be 25/36?  AFAICT, it slots in
> very nicely before this patch.  Then we don't need to do the below, because
> ktime_mono_to_any() already takes care of 32-bit.

Same question for "KVM: x86: Use ktime_get_snapshot_id() for master clock".  I
don't see any obvious dependencies in here:

  KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
  KVM: x86: Remove runtime Xen TSC frequency CPUID update
  KVM: x86: Avoid redundant masterclock updates from multiple vCPUs
  KVM: x86/xen: Prevent runstate times from becoming negative
  KVM: x86: Avoid gratuitous global clock updates
  KVM: x86: Factor out kvm_use_master_clock()
  KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
  KVM: x86: Replace nr_vcpus_matched_tsc count with all_vcpus_matched_tsc bool
  KVM: x86: Kill last_tsc_{nsec,write,offset} fields
  KVM: x86: Improve synchronization in kvm_synchronize_tsc()

And if I pull those in earlier, and grab these two (which AFICT also don't have
dependencies either):

  KVM: x86: Remove runtime Xen TSC frequency CPUID update
  KVM: x86/xen: Prevent runstate times from becoming negative

Then what's left fits nicely into two or three buckets:

  1: Masterclock overhaul
  2. New uAPI and tests

> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index b6e1dfd6db6a..57679d871581 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -921,7 +921,8 @@ static void update_pvclock_gtod(struct timekeeper *tk)
> >  
> >         vdata->wall_time_sec            = tk->xtime_sec;
> >  
> > -       vdata->offs_boot                = tk->offs_boot;
> > +       /* Pairs with the READ_ONCE() in get_kvmclock_base_ns(). */
> > +       WRITE_ONCE(vdata->offs_boot, tk->offs_boot);
> >  
> >         write_seqcount_end(&vdata->seq);
> >  }
> > @@ -929,7 +930,26 @@ static void update_pvclock_gtod(struct timekeeper *tk)
> >  static s64 get_kvmclock_base_ns(void)
> >  {
> >         /* Count up from boot time, but with the frequency of the raw clock.  */
> > -       return ktime_to_ns(ktime_add(ktime_get_raw(), pvclock_gtod_data.offs_boot));
> > +       struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
> > +       ktime_t raw = ktime_get_raw();
> > +       ktime_t now;
> > +
> > +       /*
> > +        * Synchronization with clock updates isn't required on 64-bit as only
> > +        * one field is being consume
> > +        * */
> > +#ifdef CONFIG_X86_64
> > +       now = ktime_add(raw, READ_ONCE(gtod->offs_boot));
> > +#else
> > +       unsigned int seq;
> > +
> > +       do {
> > +               seq = read_seqcount_begin(&gtod->seq);
> > +               now = ktime_add(raw, *offset);
> > +       } while (read_seqcount_retry(gtod->seq, seq));
> > +#endif
> > +
> > +       return ktime_to_ns(now);
> >  }
> >  
> >  static uint32_t div_frac(uint32_t dividend, uint32_t divisor)
