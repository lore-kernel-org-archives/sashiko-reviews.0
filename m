Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E7759B66C
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 20:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096823; cv=none; b=pb0Pf8OESWmn9uJFhZ87Qddswwpvly0TIXq6IzvberVoNDhnD1Luv+dSP6jZIGit6tub8A5DW6Kfk5P48pOtpFRUIsmVy9J+nnIV0aEJuyY5fFpuZX0PMZ4KwN2g/nWmy+AxTAEOnYkcIAt8l6AwAKYZWo1qVHvqOGTzxgNm8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096823; c=relaxed/simple;
	bh=rH7Ia9kG5bl/4aRt7c7p3qo0KgS93eRELfI4bKcrx/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+yHEFLy9YWWqrN9t0e+MXPUNo07tpcwh+7HaYHzxzogN5yNUpggVRam5hbrL13NGaM9wjQxk31NhKoqkodNgQSjmhZ8/LU+3iDFcuC1oBo+msJyjn+OyZUlcb5gr9sM1UdMO0gEn/oarn99HRvM2BcqSco/gXK153yBSUIGDIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Spo4AA9b; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Spo4AA9b"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a026611b2cso4035e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 13:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792096818; x=1792701618; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaE9+l/Y50l/+wGlSwRGnWFaRdGhhkwKUp/80S4l/8k=;
        b=Spo4AA9bzrdmIgUi0zU67Nf410jgLbhByrtoLph2QpHsYDFrmCkANBzAdr2usfsm5U
         or6AjyQ5ljCUTNVdCvrkZp1DVhgGgIoKLGhHmu0QCZ44tHMmdhW+89rQw8jIsFoJ5pzq
         0BJGP7JY612CTFlfZOIXIl7KtC6Zdv2pGVBl5sTfP3w6XRlEwnNWYpIvAMUvhjVMCdAn
         ee/FrsAKuJp5RoYur4tGYbNJ0f855TdbRnGImdpwvgXlZUTqBzwG/WmRZ4fzf4S/5L5N
         rWNZzAYZJ5jpw3iLtOIWZFc7ygI3BvQJw8twgw4MDCo8GYKzDm6/UoeeGEDr0CS5GqAl
         KD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096818; x=1792701618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aaE9+l/Y50l/+wGlSwRGnWFaRdGhhkwKUp/80S4l/8k=;
        b=Tu5/5vlWyEYPlB12i7XNuYfNbR2t2BPlKhLt/yte4C/bHG1J39w0o56ZqKZSiN3k0B
         ZhoIfPLsGU5TKclirkclphTLMsyb8cUxuPqtWQOrIlZkRo1L//Q3zsTGiB56IjFhLoRU
         yTqHy3759Lhs5w5mp7W4uGPjTnE/OaHx3fXMz5llcQhVKUUD/8zec8EA+niNoLrhaRzH
         huhIRYyYtPNwbSkt3b/o+WXX0MLS2ZjTnSsXAGAR8cQw3GSbYs7iZOJ9HB3Ylwqy/rse
         yiC04bF2Pl8BKiaXOn4O5P4eYWrsijqO4/fkyQrbK3slDIymjbkf+v0IWZmS6TYmfI/w
         G1vQ==
X-Gm-Message-State: AFq9FYJEVmJ+KD/S8UI1zETUbyobiQfxbOBeMfjBwrtnhuLgX5E+K/xu
	rxrnyR8Vu6mOnoSeASY9OUEpvG3Vm/JFDAhCj+l0KcJbQBy+GNXGCU3tqe5JqcL0/3VdrN8gJ7G
	/cQ9/8g==
X-Gm-Gg: AYBFou3oIhQ1BCG4wCxkvPyrS+3mxbQS2extVSn4KuRolRBt17vGWTVubtW41uwGQLk
	CBNLjEY9EUepvbfWvElgkbn5yKxxCUlj52l2uXVaUQoHnAT3OM95uvQPmgdrmoQLDerzjRxQ7Ar
	HAHKgLP5qGxT5LJDZmCg/SZBYsWe2U+Cmrul3LAEC6JPWtJBhE66Bc1sPix/dP5hiyrxOFg1SG3
	u3wEJdIQBw99SDuGSrWQJBOKFebNOEOWfR2RWskJkEZoQEeyQ+NmYFkF3LqQCYX8sFNeeXnCGtq
	Ep7r4qucxKa6p26EaPXIUOJDIdBlmtZMjpUuUaNmTid5kjzgeDBsmZ5BHSZdUHhDVBYTsJy0FN5
	VAUvyoJ12drlWskNd1dqZdZ9ShWbLcTLCha3iYf+8O+yuqG8QqV6UEs7tmCmR/pkduy0NQefKjY
	BYmO+YigaEb5QySIdrhwHPbVWs8pHZpqfG034z7q6N+BauDVFfNV1zecESKw2Jsv7GbUYQt677q
	q2+KLROesNEk/5F5yN1lSM0G+DVi0e1dv1q3JkF
X-Received: by 2002:a05:600c:b8d:b0:49f:ddcf:45b7 with SMTP id 5b1f17b1804b1-4a1c8ad2dd2mr94775e9.10.1792096817975;
        Thu, 15 Oct 2026 13:40:17 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm373877f8f.38.2026.10.15.13.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:40:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:40:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v9 08/25] KVM: arm64: iommu: Add memory pool
Message-ID: <atE6LaInh6CXke5g@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-9-smostafa@google.com>
 <sashiko-outbox-173376@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-173376@kernel.org>

On Thu, Oct 15, 2026 at 08:18:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kvm: fatal EL2 panic on IOMMU pool exhaustion
> --
> 
> commit 4301acf34cc06e2a4b1fab6b934f06ba07d48a9d
> Author: Mostafa Saleh <smostafa@google.com>
> Subject: KVM: arm64: iommu: Add memory pool
> 
> This patch reserves a memory pool for the IOMMU driver's shadow page tables
> early during boot based on the kvm-arm.iommu_pgt_mem command line parameter.
> The driver later allocates from and frees to this pool at runtime in
> protected KVM mode.
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu.c
> > --- a/arch/arm64/kvm/hyp/nvhe/iommu.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/iommu.c
> > @@ -115,6 +117,11 @@ int pkvm_iommu_init(void)
> >  	    !pkvm_iommu_ops->host_stage2_idmap)
> >  		return 0;
> >  
> > +	ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
> > +			    nr_pages, 0);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = pkvm_iommu_ops->init();
> >  	if (ret)
> >  		return ret;
> 
> [Severity: High]
> Will this trigger a fatal hypervisor panic if the host specifies an undersized
> pool?
> 
> The size of the newly introduced iommu_pages_pool is directly controlled by
> the host via the kvm-arm.iommu_pgt_mem command line parameter. If the
> host-provided pool size is too small, pkvm_iommu_snapshot_host_stage2()
> called immediately after this will exhaust the allocator and return -ENOMEM.
> 
> Because pkvm_iommu_init() wraps that call in a WARN_ON():
> 
> 	return WARN_ON(pkvm_iommu_snapshot_host_stage2());
> 
> and WARN_ON() at EL2 in nVHE/pKVM expands to a fatal BRK instruction, this
> exhaustion will crash the entire machine.
> 
> Could this be updated to propagate the error back to the host, instead of
> treating hyp_alloc_pages() failure as a fatal invariant violation?
> 

That is by design as explaind the same reply in v8:
https://lore.kernel.org/all/arKR23P92jOirpn-@google.com/

Thanks,
Mostafa

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015200903.2735565-1-smostafa@google.com?part=8
