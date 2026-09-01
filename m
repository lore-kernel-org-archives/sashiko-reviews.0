Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4040681D
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274021; cv=none; b=Pe1lWvOehp840/GN1In6tsDT3iV1Y+K8dbMDJ/6vMjb6PzkSeq0DtzrOkYLdCAREywAFw35eHc8aU8qrHLXe61rP6uyW40N2Vj20j9x6CcfD7zqY8c5hqnJq7xJrrnmHtpPcQU6D3NefBXqhEz47rtHitHuR8R2NRTRtE9Mv6jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274021; c=relaxed/simple;
	bh=D9eeyQ2yzHaX3YGpTuDpx9hYk5aU1AyRCVFQ38n2MYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bx/xqUlnsPLgWL4IouPV+0+ExhCPNKR5lVuRwM2AIA0GCLcGG+2CwRtjZIodvOhJpB7iHsthidqoutN3B7TwkQqwXHRkdnGLn5wk4asTLaYJK81WhFR3AFCT8rlbWM3XcQMxffG+H4ABwni/hSwRetTYXyRDe+VTLcyp0UUDIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P2xBHY4j; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P2xBHY4j"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so2474512a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788274018; x=1788878818; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTTAEK9YzkBAMJ3JEL82g1HyXYeS1+m4mN6z3yJo0GY=;
        b=P2xBHY4j/Dr9s9sraOmwOGntGMbr+zhhVJwFbkTrTZuAp07TI+Z1gLtxsrITmrHVuh
         wrcrmqyQccRLJOQG5UWw39vtR0l0lpGEhq337nA1lpjyfxHw1G/46Lyjag/RKyoF363p
         Yk0AO9F9EdbPFaHknJdoq08/PexGGy9FZWUyyau12iCJwyBPm6wl65WOybW9E45o0yjr
         mLJcqaFx6kOP0E0Z0UmgA7VjV459MyRyKsJcv2X7M3ezHLU1DrJUKMOYG89KRu5RZVxJ
         6zFg6YrTmThc9EkDACim1nNrAKWar9lIwtAkW9Nb9j/MMpjL1KZGxdOGMAERNCz0n9xG
         pPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274018; x=1788878818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FTTAEK9YzkBAMJ3JEL82g1HyXYeS1+m4mN6z3yJo0GY=;
        b=eEIFXQsFglHD9OogQWbHDgTezFcxHHSjYdvayOF/yi3H6fBcTJeafuqivB5rO4k/dk
         zhqueUyHN6s5nmNvOyH3J5XFzcCcD3n7NohyVFXX35ZDiTftTqekfRJxkCE8pkfJVDgc
         BeA09T9kHSMjdEtsNWGOH4diKKUU6vPyhHpdY5AAoY9Kh9wVuv8vBTZr8CoXR/JhMPWd
         RPR7noC920PlmTfkPXMZs9Q141+7QYyNsQoNYJp01PH/QxOiyQetO5u5qVuR3BerbzeN
         X72du9q8+RBc8lslpjuwMn5InGp8jlCNvaSanHOEt3Y7B9gV29CxHpkfsHy+4z0qiQBF
         6REA==
X-Gm-Message-State: AFuF++kWLttQVeR87fqNOyx69LBVAN5KbkiJ5QQAXbo7bJ9YRkSGMSA4
	2RTc7ZpgdLHZ4XqxBvf/NEqFW39cyIdkwt1cqGEX6KZMJ5CRS7MtSc3/wYvhsEWAAObIm3aEOJQ
	LGDtKfg==
X-Gm-Gg: AYBFou3J3YkOkTXIMpwZPSfgwAPcbzTlZpzTNA//yVpg8ZwhAtxOebsPZ6G8vfE0QXH
	lIJevakCM84dYX4tljYhAgYJxaSblsTHxOvhUw2ETwpMNZWJ+m+1qSi5IjJgkmdU0sP2HACyHfK
	P6PzDY+hzGZCUe1wG19I/RtCQwz6ETNXUoXtllGqjWHWZtlZP/AuJ20njxzGzTpP9eUBo2nu5ef
	ojaDHMT1IeSZr7Wb/mY9zBTfA5616PYQ1lLLMcmdseicYKNQMwjVntKHRYj2TmDUwq2zykiEE7o
	z+5fwlX0Zbd+mq7Qnl7AzZETHswMNmML3ucbqF+Fhw99qNQd1ZTalu9vd183LcV+nYwsK2fVkPk
	ymjNvl97ZoWMrbt1kmu96+bkS5Hlf1JW5tpSFe/H6B5u49qcpEUrNnzR0Js4XYjWYc8njgY3Rzo
	3c8cjbsoZVBpuXAHHx8lE2JX+OOPXP/DEgxpQ/biuaLbxoxbmwdr2xm7ZGl+UwQA2Jz8QvcxiAK
	TEt41/aS/2sJIICJtkm1tCO5vjXAlg92vmoh2crGR8=
X-Received: by 2002:a05:6402:46c4:b0:6a5:dfb6:360c with SMTP id 4fb4d7f45d1cf-6a66a5b5e75mr3988587a12.2.1788274016327;
        Tue, 01 Sep 2026 07:46:56 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccdc436sm1160781a12.10.2026.09.01.07.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:46:55 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:46:52 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev,
	Oliver Upton <oupton@kernel.org>,
	linux-trace-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4 11/11] KVM: arm64: Tag host-VA hypercall parameters
 __kern
Message-ID: <apblXIuD6d2JVIfM@google.com>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
 <20260901140326.3812068-12-fuad.tabba@linux.dev>
 <20260901141548.3D6921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901141548.3D6921F000E9@smtp.kernel.org>

On Tue, Sep 01, 2026 at 02:15:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] The __kvm_adjust_pc hypercall translates and uses a host-provided vcpu pointer without validation, allowing a malicious host kernel to corrupt protected guest state.
> - [High] __pkvm_host_donate_hyp wraps fallible allocator primitives in WARN_ON(), allowing unprivileged host userspace to trigger a hypervisor panic.
> --
> 
> commit f41e99c0d7eef41b448f7016f3b2a6ae6358d4c0
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: KVM: arm64: Tag host-VA hypercall parameters __kern
> 
> This commit introduces the __kern sparse address space to tag host virtual
> addresses passed to EL2 hypercalls. It updates the hypercall declarations
> and unwrapping functions to ensure host VAs are explicitly translated
> before use, preventing unchecked dereferences at EL2.
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 9085f46c2880f..91e74a1a334f0 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> [ ... ]
> > @@ -548,9 +548,9 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_host_mkyoung_guest,
> >  }
> >  
> >  DEFINE_KVM_HOST_HCALL(void, __kvm_adjust_pc,
> > -	struct kvm_vcpu *, vcpu)
> > +	struct kvm_vcpu __kern *, vcpu)
> >  {
> > -	__kvm_adjust_pc(kern_hyp_va(vcpu));
> > +	__kvm_adjust_pc(kern_hyp_va_host(vcpu));
> >  }
> 
> [Severity: Critical]
> This is a pre-existing issue, but does this hypercall fail to validate the
> translated vcpu pointer?
> 
> If a compromised host kernel issues the __kvm_adjust_pc hypercall and passes
> a forged virtual address, kern_hyp_va_host() could resolve it to the
> physical memory of a protected VM's pkvm_hyp_vcpu structure residing in the
> EL2 linear map.
> 
> Since this pointer is then used directly in __kvm_adjust_pc() to modify
> flags like PENDING_EXCEPTION or INCREMENT_PC, could this allow a malicious
> host to corrupt protected guest state and bypass pKVM isolation boundaries?
> 
> [ ... ]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 6c8e33ebf8bb6..5cdb0318fa7ba 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> [ ... ]
> > @@ -657,9 +657,9 @@ static size_t pkvm_get_hyp_vm_size(unsigned int nr_vcpus)
> >  		size_mul(sizeof(struct pkvm_hyp_vcpu *), nr_vcpus));
> >  }
> >  
> > -static void *map_donated_memory_noclear(void *host_va, size_t size)
> > +static void *map_donated_memory_noclear(void __kern *host_va, size_t size)
> >  {
> > -	void *va = kern_hyp_va(host_va);
> > +	void *va = kern_hyp_va_host(host_va);
> >  
> >  	if (!PAGE_ALIGNED(va))
> >  		return NULL;
> > @@ -671,7 +671,7 @@ static void *map_donated_memory_noclear(void *host_va, size_t size)
> >  	return va;
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but can this donation path lead
> to a hypervisor panic triggered by unprivileged host userspace?
> 
> Host userspace can issue KVM_CREATE_VM or KVM_CREATE_VCPU ioctls, which
> trigger hypercalls like __pkvm_init_vm and __pkvm_init_vcpu. These
> eventually call map_donated_memory_noclear() and __pkvm_host_donate_hyp().
> 
> Looking at arch/arm64/kvm/hyp/nvhe/mem_protect.c:__pkvm_host_donate_hyp():
> 
> 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
> 	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
> 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HYP));
> 
> Both pkvm_create_mappings_locked() and host_stage2_set_owner_locked()
> allocate page tables from the hypervisor's memory pool and can fail with
> -ENOMEM if the pool is exhausted.
> 
> Since WARN_ON() at EL2 expands to a fatal BRK instruction, could an
> unprivileged user exhaust EL2 memory and trigger these paths to crash the
> entire system, rather than safely returning an error and rolling back?

I have had this one as well several times.

We should teach Sashiko that at the moment, both the hyp stage-1 and the host
stage-2 pool are dimensioned so allocation will never fail.

Perhaps that will be my first Sahisko contribution...

-- 
Vincent

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260901140326.3812068-1-fuad.tabba@linux.dev?part=11
> 
