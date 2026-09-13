Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEA024501D
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 20:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331564; cv=none; b=gBERS+y0gurpMQK45uZDeSfN3pyTPztpQLo/jlI+rd0gvQMyNxcLsCtEsEwfWFZxDIlKsjQkyoTbzB+oeXPjAC6tRrkXMGjpuMQASzJhZhGFgcSeLt72kv+AE029OlgdSkGxDyrB+3mYFtjWqpvR5Fm6iw9S4v3vxUAniCsohi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331564; c=relaxed/simple;
	bh=+3wvn+LcJLxs9CD5gPyXtjBBE2q6N0M4ucxIJ7iBUQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFbmsrAu6oozXBypLBTjBE8TSJqw6RIrqBohNRr0Mnb3+/R3ZSjWOonmplc6jaFsotf7oDPRbkZQnIO1PO3lbsG5V1HPQu12FaU9EdrZSiCZzGNa4ReR7+Mf/2uD0WVQ8dq58zNm3r2iXok07qS1SUHZYtkMpZWY92UEdkuGwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VpPXr+xi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VpPXr+xi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e78adf099so2667335e9.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789331561; x=1789936361; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bQY7Y2h5Bi3Z75l523u4BoMdJvdggKly0nCHimUJnY=;
        b=VpPXr+xiWa/p0u4IPVkaH4wBkzy+c77iF3+R+ntj9WyOkaYKIdi4vKCr2QP9d8xix2
         fP/2f9+fX0wSluMoNyH8LsOIAs3W7QMH7NWg6Q7hFGulCjoI4sbqYvvhDFhYiFK9Nj1P
         fx0cWqIaYrvXDRGRg0wx54mkv0gdLwxwvu89qRk0w90ppXfj7ZI9LLyU8qAMDlK0WO08
         5J6UEPS3VX83RAlaMKn7HvYU0w0xZkYDMAfJa17C1xA9PRV1axE6NYRxKWOEf2VGytUn
         ujP5wB9hBr94VAssmYhy4qr3p4BPoYy9bUGZasshbS5PVnTW4q5K5ARCiZPIgmFXtpeU
         /v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331561; x=1789936361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9bQY7Y2h5Bi3Z75l523u4BoMdJvdggKly0nCHimUJnY=;
        b=X4kmcHneXXEZiLomWXm0sYbiPZ4IxHsju5dK2woAdbI7IMFTlZ7uTnzUIwlHw5ylIR
         +fQ9w07NgAGRUBFlMQpEGx5M3V4rs2hYBuicSe6ovAqEmw7AC8QYyrMN+ffqdIt3XVy4
         28/+hwVjYT36gqV5anQz1EuiRnA5SXRau95mMeAlILDJlr7D+ya+AIy3pAfh6crucyxr
         ZtqCAVo2ZbwTWvt/v8bjbm0TYHh2G3QvL35WZzbkrFQgRIv1PpSmFCi1SUQB37JzMQSI
         UySx/LOVz+fUjOMg4ruJ0ydN5B+SLTz8gPzsgB0fUDaKVIlKnRrMVcnu0NBJ96XdV2Nw
         +uLQ==
X-Gm-Message-State: AFuF++llCEYzUf9EBAKGTkr3JpFMtxC1V7TNu4zlFdLKalwHi0eumY1c
	swBTTliN/lqdjjN/Ng0Tp/Z/k9yoOn3dE/T3ubU7jor+KWMkROqB6Ya1oQegNaS2M9RfOsM78F9
	bQIWBPg==
X-Gm-Gg: AYBFou3BVgeoIJIw5eMkaYadbiP8ODkrc2I8pdwUwtdPCQiQCsBStPMCASVr2f4AXKk
	PD5YCHDXlZBfdu6Lxab97qzQXXFm9V45vbDqOVsAB9FgA2ZghqpshhAN9b+4eOJN+DTFAeSeGhE
	Q5mTG5k3FWh9LiPYUbyX0IWWAUFlJHAFBVE2Mfcq8E3DTHI28mY16PB5RnaybaljBMMdTnx9Emb
	rku0BEZSzsX3MtYOUCBYXKQhsQnx6nDrbpIy4DhvN3iX/8icO+BfQ2Gtj6CgLHCQhvt/Caryoek
	LQe0lAwVTcGm1sDHbt+ki39aK8jji+go4G0LLK1L+W07H5A+wFGoMUhZ6ZRvKxr6ANfWq71E+Dn
	iYZxGK/B3fGvbT8Lqt381Xiwd4N0529KRASJsromEFWiRQmCH+33JuvzxMMUoftTpRbOPPfYiZL
	tZxjPzBjN0OFvCQ7sjBKBJAjQJqxrtXsQWYdOvE4KpmBJ7pvZxFLYGG1+1LlyJVdgFq7xXr9CUg
	FfzIAxCjQeGhiV6CWWlxXi+CsXcLRBTwPLlju7sXlBJeewQYnPHuaM=
X-Received: by 2002:a05:600c:1991:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49e663cc7cdmr128057815e9.25.1789331560713;
        Sun, 13 Sep 2026 13:32:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02e0bsm118285185e9.2.2026.09.13.13.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:32:39 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:32:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v1] KVM: arm64: Fix protected VMs fault on system with
 pages larger than 4K
Message-ID: <aqcIZCglQ2B7LPnH@google.com>
References: <20260913173516.3122436-1-vdonnefort@google.com>
 <20260913175105.A57AC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913175105.A57AC1F000FF@smtp.kernel.org>

On Sun, Sep 13, 2026 at 05:51:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] gmem_abort() passes an unaligned fault_ipa to kvm_pgtable_stage2_map(), which triggers the new -EINVAL check on pKVM hosts.
> --
> 
> commit 724c2b0f8e554f59f7c409467796ff8e9acf590b
> Author: Vincent Donnefort <vdonnefort@google.com>
> Subject: KVM: arm64: Fix protected VMs fault on system with pages larger than 4K
> 
> This commit aligns the fault IPA down to the page size for protected VMs
> in pkvm_mem_abort(), similar to previous fixes for non-protected VMs.
> It also adds a strict page-alignment check to pkvm_pgtable_stage2_map()
> which returns -EINVAL if the address, size, or physical address are unaligned.
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 8e4c6e4bec123..1ca27d01a3ec6 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >  	u64 end = addr + size;
> >  	int ret;
> >  
> > +	if (!PAGE_ALIGNED(addr | size | phys))
> > +		return -EINVAL;
> > +
> 
> [Severity: High]
> Does this new check break non-protected VMs using guest_memfd on a pKVM host?
> 
> When gmem_abort() handles page faults for guest_memfd slots, it passes
> s2fd->fault_ipa directly to kvm_pgtable_stage2_map() without aligning it
> down to the page size:
> 
> arch/arm64/kvm/mmu.c:gmem_abort() {
>     ...
> 	} else {
> 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa,
> 							 PAGE_SIZE,
> 							 __pfn_to_phys(pfn),
> 							 prot, memcache, flags);
> 	}
>     ...
> }

Ha right...

And actually I will do gfn_to_gpa(gfn)... that fits better the series I have
sent for the protected VM huge pages.

-- 
Vincent

> 
> Since HPFAR_EL2 only aligns to 4K, on a 16K or 64K page host, the fault_ipa
> passed from gmem_abort() will fail this new PAGE_ALIGNED check and return
> -EINVAL. This prevents memory mapping and causes the VM fault handling to
> abort.
> 
> Should gmem_abort() also be updated to apply ALIGN_DOWN to s2fd->fault_ipa,
> just like pkvm_mem_abort() was fixed in this patch?
> 
> >  	lockdep_assert_held_write(&kvm->mmu_lock);
> >  	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260913173516.3122436-1-vdonnefort@google.com?part=1
