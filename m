Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EDF3EF0C8
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513375; cv=none; b=QLahNVRL6DfaUBxbchnJm9qat9F4XgEb2gdpDwrby6dEqqaCq5uo52r4Gou8h4Eujaat+gYouZB+tsWOM/mN3PZmCsuwi//K5h043ZHjIANkBFAGzce1xZjR0ila8oZfZLQGv1PzE9D7o2NURmrrETkitpWSEoOZwuwKflvuCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513375; c=relaxed/simple;
	bh=WGhV3M5EiiSM57qbmHhxLbuYTAc4xNJTox/ibDHaE4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cMZZEvXeOsq/5f49TO2Cn59RSKn9GB0Auc/8X9GpwnxHoltJiP37fNpCGG5z1KSiuh3ZYsNFLXivaBflKqIP+Ca70uiCBMR3GAOHW7GJXKyo6bCLAMPytnfrHN2wPnG/Eh9OB7gfEUpbYrkNmSnHT18WSSIcgtKVDfOxzIyjJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Utr+NmH9; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Utr+NmH9"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so30393185ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785513373; x=1786118173; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MeH8PMDYJdhxZAkOjUCN37GF4BiM7iUBixl+LFEnzM=;
        b=Utr+NmH9yzbcv8zxHQVfdUIltVsIsTckO0r41b0Xw3y3Vfeb2MdzsjfL1TvC1YwtlN
         M343VYquyeTAP2kx3hvXmM2B3ur88IJj22SFDJsxze52S12ApUSctrnmsNfor+SxYZ3k
         JeB6ni1iWmn2mHZ8DDbYoNP482zFJRxXCqjxfCjcGEZ++Towe1698dob5polpNOl/Rda
         xTU1DfHuJxRsqrMBHpoluE+RyW7wvTFK29CQoxGGvMAKYjgZFXdMplJ1C7u1Mw26u4TV
         gjhh7vU741QzDiWmuT6xQSZzGDJtAN0/WBPrvu+dbcaWcq6z5x5GGs04wsKD15RLGTzf
         GAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513373; x=1786118173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MeH8PMDYJdhxZAkOjUCN37GF4BiM7iUBixl+LFEnzM=;
        b=p61HSXqRvP6n+D3CmhQNZgGIg0ESJ7sNl+l0dFg/6kuei5l7Sn9qOiQyMrF4oAZFRj
         3Nd/GbiqY9t1UKmyvm5b7GZD7sstMU4ufC/z9c00UEjngeQmThiqVM4Smd4cDe2wi7y3
         Jdmcf8CJROseW0+nivBjz+5WOuyBsVD0BZYjytvAtDEDCAVfRbgKdG4KGIHrozzuoc8v
         uRSbyOEGsfqiJ9nJS2m4Zcrl+kaiPwE4b2x1UrAjPIXcsQ83G0BPFZPfhTfR0YW72+dN
         R33Ehp4Ipxl/Pff33SehqbGRvLlkNIrnVLOio00D9LE4WUMsAJlA+A6oeVV6KzMpkdh2
         wCLA==
X-Gm-Message-State: AOJu0YwRkmFl0P9ITXXv8prtHr04bIBwL8uRcm+wmNh/hgKaBpK3kHCb
	gh8PDjLt26Hg+imabLBY/VjYGLor/KgPcUjGUnBFnGD3FBimxQNk1BUJF9LI2RZNG7RVzXdP3Ux
	zVBe5wHv3eCILovLNgL6NN7+bCe92LuuYFhxNzW9W2XO2IxGheq6S+Byak1XYBtTuPfjyqChi3g
	VAbpvIo902I7S9MlzcFGVFizzZXaeppcNFVgDY4ZKOVGpuW1km
X-Received: from plbml11.prod.google.com ([2002:a17:903:34cb:b0:2ca:d246:c7c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f45:b0:2cc:77f3:a934
 with SMTP id d9443c01a7336-2d05242c56fmr4444575ad.46.1785513373143; Fri, 31
 Jul 2026 08:56:13 -0700 (PDT)
Date: Fri, 31 Jul 2026 08:56:12 -0700
In-Reply-To: <20260730193350.60B801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com> <20260730191908.2084803-4-seanjc@google.com>
 <20260730193350.60B801F000E9@smtp.kernel.org>
Message-ID: <amzFnPEikFTHhW9X@google.com>
Subject: Re: [PATCH 3/9] KVM: selftests: Affine child tasks to other pCPUs in
 hardware disable test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
> > index 3147f5c97e943..1bcbd13e99947 100644
> > --- a/tools/testing/selftests/kvm/hardware_disable_test.c
> > +++ b/tools/testing/selftests/kvm/hardware_disable_test.c
> [ ... ]
> > @@ -84,16 +85,11 @@ static void run_test(u32 run)
> [ ... ]
> >  		check_create_thread(&threads[i], NULL, run_vcpu, vcpu);
> > -		check_set_affinity(threads[i], &cpu_set);
> > +		check_set_affinity(threads[i], &child_cpu_set);
> >  
> >  		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
> >  			check_create_thread(&throw_away, NULL, sleeping_thread,
> >  					    (void *)NULL);
> > -			check_set_affinity(throw_away, &cpu_set);
> > +			check_set_affinity(throw_away, &child_cpu_set);
> >  		}
> >  	}
> [ ... ]
> > @@ -147,12 +143,30 @@ void wait_for_child_setup(pid_t pid)
> [ ... ]
> > +static void setup_child_cpu_set(void)
> > +{
> > +	int cpu;
> > +
> > +	kvm_sched_getaffinity(0, sizeof(child_cpu_set), &child_cpu_set);
> > +
> > +	if (CPU_COUNT(&child_cpu_set) < 2)
> > +		return;
> > +
> > +	cpu = pin_task_to_random_cpu(pthread_self(), &child_cpu_set);
> > +	CPU_CLR(cpu, &child_cpu_set);
> > +
> > +	while (CPU_COUNT(&child_cpu_set) > VCPU_NUM)
> > +		CPU_CLR(kvm_pick_random_cpu(&child_cpu_set), &child_cpu_set);
> > +}
> 
> [Severity: Medium]
> Since setup_child_cpu_set() pins the parent thread to a single random CPU
> prior to spawning children, won't the newly created threads in run_test()
> inherit this single-CPU affinity upon creation?
> 
> Because check_create_thread() spawns the threads before their affinity is
> explicitly updated to child_cpu_set, they might immediately begin executing
> on the exact same CPU as the parent.

Yeah, I was trying to avoid this since pthread_attr_setaffinity_np() is only
available with __USE_GNU.

> Could this result in the child threads starving the parent on that single CPU
> before the parent gets a chance to execute check_set_affinity()? This seems
> like it might heavily delay the migration and trigger the same CPU contention
> that this patch aims to fix.

After far too much testing, the problem isn't direct CPU contention, AFAICT it's
due to incurring cross-node NUMA penalties, and presumably scheduler contention
when the pool of possible CPUs to run on is huge.

I tried a bunch of fancy approaches, e.g. making parent, child, and grandchildren
all mutually exclusive, and while the fanciness can provide marginal benefits when
pthread_attr_setaffinity_np() isn't available, all that really matters is that the
worker threads get affined before they start doing work.
