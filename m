Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2563D45D5
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881067; cv=none; b=PRArH7qfS4KZ63DnlSIrUbl9G2ymK2XbxA5g5JcvqhRG9vcESW862XQJkDfUXsOYwJcYSyz9XDcA92r2vurfoRPMO2IV1+IcueXyqeBFHHW/4HEmUBojZiW1qhrPBSAig8IBygDceCpi+8ROXnQJKUccXMMalapQHu+a34c9Hfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881067; c=relaxed/simple;
	bh=elWNjQXtC8thy3ti0vlFZsZxvG3tpc6l8oAx685pjj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8OhqWvQGmGDobI6vjjJBOsdzDKSOXb9apqjRoayvWrbglKKgzOSxq9BhIcELAtHTRit/IvcSvnhlarisQoz66vEE/xzxQVzUufmxTOG23cBb0TKODwfrPImgYAQd2OJ+nyOy87waJQ3d8Aj2AXQhTkl0JmSi5Z+7tUAUXTmZys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LVRpaD34; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LVRpaD34"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso21925e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784881063; x=1785485863; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oa7Uf24Ye3cJcbIbf3Yse8wlIIcJzJaytnCT20m/GIQ=;
        b=LVRpaD34cAKtrw2XD5l6NABHrlDun6xGAFosLkH9jQWPvy3S8PGEKvtS+3fLCl1XDs
         8qIpJ59KNiZkuHEXbRJvhgpZq2c4A6rwT2bI7HJE4HPGswy7kigeubQ+ryqNb9YyFdpq
         z7USDe4FpEDkxX1I2rwCowuVVqnArMyqEiJSaD+Cg/zxAlqz8+EEhlfndVq+1swIxQht
         hFLdCc+1ojm/Ehr8MUHZfkOcCOEcVruK2nAqClggaQzqI6UDFxkZpqzrYRmZ5BET/N68
         51oLrMAOgmsqMlUwWkKwqBUUMyt6W4CZKVWpI5CQNKfqfyBc20GejZWbU+/EpaquOSBd
         PL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881063; x=1785485863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oa7Uf24Ye3cJcbIbf3Yse8wlIIcJzJaytnCT20m/GIQ=;
        b=dfrmfjXaCdzUQtgFR+p8+OeePnPXvY6oefHj+O+pL3abSZWA3mq5lOCqNLwjfvJDI1
         tzPFVsf4NNsbQZ2isZdWdbN19Ekr2UHxRqYlEkrhQYg0on2dH2qcClhsaE6fm7drInrv
         Ra9QjWXW33H9rI/9xSEAXF0KZgZ1jnYfybc+0rh+P0x9t+r1O/1s94H5w+q6pUilKulG
         +z5aEEDdTZBXTMgwTSz+u15Q+TZqH8h6MCsIoGaDddYdEozDsoGsse4H1qqwBzG7Sfex
         jCG52ZBYAw+DgJ7FKS9FSRe4OzacuR+Zu01gr9UXtiZWPiHDBsez0NLLd7r+B+BYU+0C
         R4kQ==
X-Gm-Message-State: AOJu0Yy9GRV89peZ98dJd28I9wzYfPkmHiUMg9nsHlfyyVxcQ1BodvHq
	F23r2HGSJRuny/HtPwW+sitiikzikg4ow2XedLPxzOgcq3lXZQzTN2bFSA6U51zxb8lHm4HzXNz
	Cbw803w==
X-Gm-Gg: AR+sD12P1c+sxLMVtMEtshaHfhr50nEVAd4EGEjJCPcUYKjbdrpSwCQBnDoZXWpAVbh
	0ECKm8nmjQbr/eowp934znPr7ZAQA2x6wUc+SH6V+I4qIN5oCX3v+CZN4Bg4VelIR10DXiucliU
	aBm3b5QusJsN1pmFrF8zhF16iatv1Eb8Tbxn7H6IdHIkjkp36v5MPEz88KfMkzw+FIPiLOCcuVM
	FD601SQ2h52JwiykAb6yfJac/A91W4HANWt177JQsDL3DoTUfq5AH5sW978xcblXOdIzXJSJLWe
	lRkzlcNoXkoodaanEeuIKef3f6TyLR9gtat16dvX3GLf+NQBfXWhVGDP8A4dwyzGkpO2IRrCXJn
	WzTk4RnU/xVsHvS2dwEKhtnx4G+vkzj2qHqTrj9+Wb5rtupPJ9HS1V1GmnjzF8VMqgUn5p4Xuom
	RLKa1/68U0hgY/2lueOT7HGNsk5mtivaXTItBCyA==
X-Received: by 2002:a05:600c:2e96:b0:495:7a0b:3b4a with SMTP id 5b1f17b1804b1-4957d7907ccmr541285e9.7.1784881062421;
        Fri, 24 Jul 2026 01:17:42 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af786e4sm50771715e9.8.2026.07.24.01.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:17:41 -0700 (PDT)
Date: Fri, 24 Jul 2026 08:17:37 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [RFC PATCH v2 2/2] KVM: arm64: Support BBM level 3
Message-ID: <amMfoWWEBI17jdIj@google.com>
References: <20260723182140.4025575-1-smostafa@google.com>
 <20260723182140.4025575-3-smostafa@google.com>
 <20260723184346.CAE8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723184346.CAE8F1F000E9@smtp.kernel.org>

On Thu, Jul 23, 2026 at 06:43:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing DSB between MTE tag stores and the stage-2 PTE update.
> --
> 
> --- Patch [2]: [RFC PATCH v2 2/2] KVM: arm64: Support BBM level 3 ---
> commit be481f0e17bfc16626c7f5b1b8b652be3ec92909
> Author: Mostafa Saleh <smostafa@google.com>
> 
> KVM: arm64: Support BBM level 3
> 
> If the system supports hardware Break-Before-Make (BBM) level 3, use it
> to replace stage-2 PTEs directly. Otherwise, fall back to the software
> BBM sequence.
> 
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 127b7f9541b16..5e16ed7e9b909 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> 
> [ ... ]
> 
> > @@ -873,16 +891,35 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
> >  	return true;
> >  }
> >  
> > -static void stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t new)
> > +static bool stage2_make_pte(const struct kvm_pgtable_visit_ctx *ctx, struct kvm_s2_mmu *mmu,
> > +			    kvm_pte_t new)
> >  {
> >  	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
> >  
> > -	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
> > -
> >  	if (stage2_pte_is_counted(new))
> >  		mm_ops->get_page(ctx->ptep);
> >  
> > +	if (stage2_use_bbml3() && kvm_pte_valid(ctx->old)) {
> > +		/*
> > +		 * Barrier is required because stage2_try_set_pte() uses
> > +		 * WRITE_ONCE for non-shared walks, lacking release semantics
> > +		 * used in the software BBM case.
> > +		 */
> > +		smp_wmb();
> > +		if (!stage2_try_set_pte(ctx, new)) {
> > +			/* Raced with another core. */
> > +			if (stage2_pte_is_counted(new))
> > +				mm_ops->put_page(ctx->ptep);
> > +			return false;
> > +		}
> > +
> > +		stage2_clean_old_pte(ctx, mmu);
> > +		return true;
> > +	}
> > +
> > +	WARN_ON(!stage2_pte_is_locked(*ctx->ptep));
> >  	smp_store_release(ctx->ptep, new);
> > +	return true;
> >  }
> 
> [Severity: High]
> This is a pre-existing issue, but does this sequence lack a required
> synchronization barrier for MTE tag stores?
> 
> When KVM maps a page with MTE enabled, it clears the tags using STGM:
> 
> arch/arm64/kvm/mmu.c:kvm_s2_fault_map() {
>         ...
>         if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
>                 sanitise_mte_tags(kvm, pfn, mapping_size);
>         ...
> }
> 
> The PTE is then updated here in stage2_make_pte(), which uses either
> smp_wmb() + cmpxchg() (mapping to DMB ISHST + CASAL) for BBML3, or
> smp_store_release() (mapping to STLR) for the software BBM case. Neither
> of these provides the architecturally mandated DSB semantics required
> after MTE tag stores.
> 
> Without a DSB between sanitise_mte_tags() and the stage-2 PTE update, is
> it possible for the hardware page table walker to observe the new PTE
> before the explicit tag stores are globally visible? Could this result in
> the guest observing uninitialized MTE tags, leading to memory permission
> corruption or spurious tag check faults?

I do not know much about MTE, but AFAIU, STLR wouldn’t order against
page table walks. So there is a window between the STGM and the DSB at
the end of the map where another core can observe a valid PTE and not
a the new tag. My guess we need a DSB at the end of
sanitise_mte_tags()

Thanks,
Mostafa

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723182140.4025575-1-smostafa@google.com?part=2
