Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF03E9C2B
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440935; cv=none; b=penU7WAN3Me64TGHBdtp82hCnf5uK5ldEErJKIItdAVllf6W0y5RRtDraA1UTLS/RQu1u+AzXqSOq/lcq7ir1RokIH5bFfpg8EfSrrBg54PJ2LMjIkKJ+J7KhZejagBsFN80L0SssB5PgGBUmNmVOFrncI2kCw6RWZqpW+Swqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440935; c=relaxed/simple;
	bh=cmM43HRzZFn1Vf8OPcewPhgRLaHIb9gz7ULaRVt9WFg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MGzqU5JgCt1Vy9zyaYrfVDC0xYE5VwWOTKV7ojKTYN1d+HCArViNZofdwkdipn7Cz68Y1Q8XWJ4goux5A+9xcboH3H6Y0Qp0BgiWT1WfeCpOOY55Vd6Fvshm2yGKLkMEldAum1/PGYVJlpwECs+YguNGClryciBYgalMo/vREYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UuEyg7kO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UuEyg7kO"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8782750b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783440933; x=1784045733; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yO5+0blD3DvIOx7PJW/Fsb9R24TIuMrYx2xzHN/rqA=;
        b=UuEyg7kOtCADj3Ci53NOEc4K4H8v3qZRjtuAtJNawoGJwpE3/dneiSyPqtUiC+VamA
         +/PE6v+GvYIoB24+bdU27O6p0j1kSk8WE+Lf9eGWnwNjeTYxUwBLL7sn4ZAAKY7ZktJB
         u2+nxsB1KFmfpEWdxdKPLAqks3+OxyD8lCRayljM5FMyhmmEZ7/hXBTvUnU20X0SQFv5
         hNU6ETA1waJtesERyp8iROf+LY0HrHFXp30nt8s3zPZ9N6n77U81W/1EFeSs6+eliHjX
         E2CN16N8uCfg8pfI0V1RncBeZGsTXmvCTF1yZvhZ+bzDTZXXZ6fGfkzKOps1PyStCYAh
         i81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440933; x=1784045733;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yO5+0blD3DvIOx7PJW/Fsb9R24TIuMrYx2xzHN/rqA=;
        b=XLGSwH74BtsT3OSbRvYczLhRzDMbw0hhuPH6j8rn5fmR1ZKRfKfZUhDK62Bu+UW8u0
         58dM/Dk6lXzZgjzYFc4iTn8Dd2E7HgsscMS+f9iKiqGfjYtCVWZmaDaDWYEknGAAY83a
         gqaPzM3otihv3NNWiWklkMkok8CSma6Puu8T+kS1Tlrs8zX7MLHyje+Cvv/K17VbO//J
         e/I8jDt61FnI8W0BKy5ux7kho4Ev1+QPsRuYHprCk7kfM3LFmEOszeeQAcndAkoiKNWf
         vxwV+y4fRQHpJogZmUL08s7W2jknCRF8yxZ3CkGxDxVchOkXG8rbDVKS/eVH9tSFByEZ
         QE4g==
X-Gm-Message-State: AOJu0Yzg6Yu7H/qXT5GQKSOAeme5QrpgXlVogbg2I/FQppAck1YUxEj6
	2xxOd3GaNGYkgfWHwYg5QycuDOmkHIyboQNapb4mOsK3udq1Kdxpf6KVX50SFWGsrDivoeums18
	9Ej14zrurzNB2fHd0HoCbzlEDEpOhhXz3dSyY4nnr2pXnd/YqUewkqxgJ7UxpBfYEcyeud9yjeY
	agBS+fZh4nP8+nBR/liwiAB2nhf902SrVHRjoLKzbCr2y1gv1z
X-Received: from pfus20.prod.google.com ([2002:a05:6a00:8d4:b0:848:2ec8:662f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:13aa:b0:845:4d71:8d15
 with SMTP id d2e1a72fcca58-84826db0b79mr5739899b3a.37.1783440933112; Tue, 07
 Jul 2026 09:15:33 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:15:32 -0700
In-Reply-To: <20260707152943.290581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260707150706.1198541-1-seanjc@google.com> <20260707150706.1198541-3-seanjc@google.com>
 <20260707152943.290581F000E9@smtp.kernel.org>
Message-ID: <ak0mJLxaz2TBwM0p@google.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: Randomize pCPU in steal time test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 07, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> > --- a/tools/testing/selftests/kvm/steal_time.c
> > +++ b/tools/testing/selftests/kvm/steal_time.c
> [ ... ]
> > @@ -514,14 +514,12 @@ int main(int ac, char **av)
> >  	long stolen_time;
> >  	long run_delay;
> >  	bool verbose;
> > -	int i;
> > +	int i, cpu;
> >  
> >  	verbose = ac > 1 && (!strncmp(av[1], "-v", 3) || !strncmp(av[1], "--verbose", 10));
> >  
> >  	/* Set CPU affinity so we can force preemption of the VCPU */
> > -	CPU_ZERO(&cpuset);
> > -	CPU_SET(0, &cpuset);
> > -	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
> > +	cpu = pin_self_to_any_cpu();
> >  
> >  	/* Create a VM and an identity mapped memslot for the steal time structure */
> >  	vm = vm_create_with_vcpus(NR_VCPUS, guest_code, vcpus);
> [ ... ]
> > @@ -557,7 +555,7 @@ int main(int ac, char **av)
> >  		run_delay = get_run_delay();
> >  		pthread_create(&thread, NULL, do_steal_time, NULL);
> >  		pthread_getaffinity_np(thread, sizeof(cpuset), &cpuset);
> > -		TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(0, &cpuset),
> > +		TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(cpu, &cpuset),
> 
> [Severity: Medium]
> Is there a race condition here if the worker thread exits before the parent
> reads its affinity?
> 
> When pthread_create() spawns the worker thread, the child runs for a short
> duration and exits. If the parent thread is preempted right after creation,
> the child might finish its work and exit before pthread_getaffinity_np()
> executes in the parent.
> 
> If the kernel task is already gone, pthread_getaffinity_np() will fail with

No, because the kernel task is kept alive until pthread_join().  As per the
pthread_create() manpage[*]:

  Only when a terminated joinable thread has been joined are the last of its
  resources released back to the system.

And by empirical testing, that includes the kernel task.

[*] https://man7.org/linux/man-pages/man3/pthread_create.3.html

> ESRCH. Because the explicit initialization of cpuset was removed earlier in
> main(), cpuset remains completely uninitialized.
> 
> Could this cause CPU_COUNT() and CPU_ISSET() to evaluate garbage stack memory
> and trigger sporadic TEST_ASSERT failures? Should the return value of
> pthread_getaffinity_np() be checked, or should cpuset be initialized before
> the call?

The return value should be checked, but I'd rather handle that in a separate
cleanup by adding a wrapper in kvm_syscalls.h.
