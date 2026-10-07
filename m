Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6940E8D7
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400041; cv=none; b=BVeZcggSfgbfxzm9PUusrSAMa+g1S5/NvgaSKafBJIP10I2N9AW/WQhmoD9PP+/lL+adR7nEPvskc4KKvuyTkR77JITmf5XU9EM3kKOSLy4i+0380yiMzSZPJ//ItEYTilRyr08dJ6wDvr4hPSQb4uxxahTN71FmeQwd70jPneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400041; c=relaxed/simple;
	bh=Ykg5vHgeEHWQd7nv6+S7HdDvP8w3znf9GlqBCmXgna0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiM0yeblXJJg3yeybuyztGHGeCej9kqT8pRNUkOTOfvaaReJu3fBwP+gGLZKdDOo7bm6FCbxjR4aSDa1iwunD36Muwp/CxSJ2AoxntgQEFtmeAkwcW45Deu5sLMu92B3zIucL+OVRWanUMtpx9ekZJn1y7DuCIiCkiCyt/mhKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/8BELNb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/8BELNb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d3b445a84fso705ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 12:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791400039; x=1792004839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZpO++Lww0t5scaL6GXCwbq0i6uN65L3PPvCT34stxvw=;
        b=h/8BELNbN3L0vslTfr3suzoKwCWtjcK7jXLXwxoyP3MZb4dYABpiZw/Ff9iUpfsf76
         KhJRIzPGfYyZmVVgS1dJbJ6HDz0QntMvEmgBr+YkOmQbjvXQifKSD7hMEjG5MQhqG/Rm
         AMyYSjhUFnO/lk9Gh42RP56aW7vR6IiB/GtgkoQkHpqVGHlRMgKvbO7LcnZRxHWS8M9c
         wJfyMdFMKpYNMhwlzNFK9LRvlzsMUGX3f4cBUbf7ySH8Zf6UjBYWittpXIg3hQQFI08b
         Rd3FidsPyloHDEhJdx3rQJutertd+DYS++P9Fq+d82gO2Ds1VtCZp8/I5BRo8Srq2ew0
         9aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400039; x=1792004839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpO++Lww0t5scaL6GXCwbq0i6uN65L3PPvCT34stxvw=;
        b=0iY6QfIAMa1DaVmyMRFy/Y2zqTZT/rAjbW8aYr7MM/GKimr3pw24xnElcaeK8NLmoI
         luHr2s3OzMV8l6XisgYZy9T5lfLAbojGFc+qTBMvv7Q7Aa4zcWph0EnCsld1LpBT5Au1
         mB6zOYtEnyAZSiolFSNmIN2JTYCWu/b3QUOC7XuKuEALjNxTVXd5JRTrlBPlEBcYNl4B
         dUkIX30Xc8hEJvfIwEoum1qyFDMflm9x2TM9gyEhZR1Gx56eKaOaf1h9uCZgj37802kk
         yHmzttqqMe/IHSlieVZyDyvnpFg7FFGEkzH5KxX0GeDp6LjEFZqJveISUMeG/2sOuQL4
         5MkQ==
X-Gm-Message-State: AFq9FYLbsVXsOwPau4GtlE47W6DekfICleGNnWd4irA+MVu229A45do0
	eQdw/NrkbkzORT3wwFi21sSejl0pydwGtyqrcBQBpIrkRk8/XE4WpsIaB2m+bdLAlJWbgCPuyw/
	FkE5WBg==
X-Gm-Gg: AYBFou3+u4EY4ucuLuEo96gMNuXz5yWwhxoBWiJBXWTtTo+GdHge7Ow7gsXi+xGK2qP
	1yvsyCT0DatyyUZ83PfvaA4aBo6Wy+DGMtx5yi+rJady11qitz6T9yLA95BJWXraEoMNe7u0NmB
	7uVhLIOWqXL7GSOAUmEkgGVuxwr0XB7lYzJriOAxR4rDlKnDflBctr3Fxozqr84samENW+mOnQ7
	IC7CQiPrJ6bhey0tUqp92sxd82gmr6Jewal7axmvgDgZcapudMhDx5dr+eWxHqCRHeLjBt5gDaE
	QP2nvA+6NVsFq9MII/CYoFA5s6Ray9U/CY8CBVH9k1kc17tLfqBkfEnbLtsAGjDae4zubUFC8bY
	31+pLKSVWmN7TYbeNQ/+OLoOM9E4LLrD3vJ6ySQNdsMwjD2M8mv4KN1B0PCmOe+zUarc8GuORs0
	E3EnUBnoZ9ba7bOK+tpp8PTkJbN695q/h6aNflsEbZ6bpZPp1BXXkGHuFcMzp20Qp0xvd2ko4dg
	PeJJYA+63A+b6tmOMEfmZXsz8GEPnWc
X-Received: by 2002:a17:903:40c6:b0:2e6:f400:5655 with SMTP id d9443c01a7336-2e7ff4c6f84mr638965ad.3.1791400038714;
        Wed, 07 Oct 2026 12:07:18 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a9ba4f24sm2048447a12.23.2026.10.07.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:07:15 -0700 (PDT)
Date: Wed, 7 Oct 2026 19:07:11 +0000
From: Lisa Wang <wyihan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v15 16/23] KVM: selftests: Load per-vCPU guest stack in
 TDX boot parameters
Message-ID: <asaYX9uk48uWISHx@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-16-7c62a5d8a992@google.com>
 <20261002091336.EA00B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002091336.EA00B1F00899@smtp.kernel.org>

On Fri, Oct 02, 2026 at 09:13:36AM +0000, sashiko-bot@kernel.org wrote:
> > +void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> > +{
> > +	struct td_boot_parameters *params =
> > +		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
> > +	struct td_per_vcpu_parameters *vcpu_params =
> > +		&params->per_vcpu[vcpu->id];
> 
> [Severity: Medium]
> Will this lead to an out-of-bounds array access in
> tdx_vcpu_load_boot_parameters() if a test uses a sparse vcpu->id?
> 
> The boot parameters region appears to allocate memory for exactly
> nr_runnable_vcpus instances of struct td_per_vcpu_parameters in
> tdx_vm_setup_boot_parameters_region():
> 
>     size_t boot_params_size = sizeof(struct td_boot_parameters) +
>         nr_runnable_vcpus * sizeof(struct td_per_vcpu_parameters);
> 
> Since vcpu->id represents the KVM vCPU ID (which can be the APIC ID on x86)
> and can be larger than or equal to nr_runnable_vcpus, could this write beyond
> the allocated bounds and corrupt adjacent host memory and guest physical pages?
> 
> This could be triggered if a selftest creating a TDX VM specifies a sparse
> vcpu->id that is larger than or equal to the total number of runnable vCPUs
> passed to vm_create().

In KVM selftests, VMs already create vCPUs sequentially with vcpu->id
(via __vm_create_with_vcpus()). TDX selftests will not test sparse vCPU
IDs either, because TDH.VP.INIT always initializes %esi to the sequential
0-based vCPU index.

> > +
> > +	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
> > +	TEST_ASSERT(vcpu_params->esp_gva < (1ULL << 32),
> > +		    "ESP GVA must be within 32-bit address space for 32-bit boot code");
> 
> [Severity: Medium]
> Does this bounds check in tdx_vcpu_load_boot_parameters() actually work, or is
> the value silently truncated before the check?
> 
> Because kvm_allocate_vcpu_stack() returns a 64-bit gva_t, assigning it
> to vcpu_params->esp_gva truncates the value to 32 bits since esp_gva is
> declared as a u32.
> 
> The TEST_ASSERT then evaluates the already truncated 32-bit value against
> (1ULL << 32), which will always be true. Could this bypass the intended
> safety check and cause silent stack corruption and test failures instead of
> an explicit assertion failure?
> 
> This could be triggered if a selftest allocates enough memory such that the
> guest stack virtual address exceeds 4GB.

Yes, will fix in the next series.
