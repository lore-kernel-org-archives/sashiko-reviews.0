Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1356145198A
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776094; cv=none; b=sOFOZK6QA1SHQewMqNAEp5Sl5urdRWvHXzsEfrLU2guQcbe1GGB6yMV7F+rD+br725MgF4xZmizjrNgWt7yltsdI64wUOyWCtws/4GH4MYSBJdXKtmNYLGnYO0jMd5E4hljOT71c5Bwg9cxN1a3cb37jRlHbBB9e0sOQeNrIIi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776094; c=relaxed/simple;
	bh=cXdqsLo120TY3TCRdOozGdXnOYE9gF95a8GwBjQ+9W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYlHAbx9etn0knHxkxq99jSI0W1o8NR5oXM1ItlHpClInP64H3qEKMBRQdsOWncuk8Hr/HEdsaCVs5JFergLU2tdSZgVGbZhw7t0q1Zo0FopQfYIjED8sJpV594oRcTrD3cqfFQyggrlCmqmD0mBMoVet/admgMfNUG/jj6QJrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Erwyq7Lo; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Erwyq7Lo"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c25420fe973so552276566b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788776091; x=1789380891; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgGLBV2hAy5Dzl/eCzlxyTb+6ng/OBGxSoDpE5wbGLg=;
        b=Erwyq7Lo5q8TT0bivgyOPuJHzOPbPoXqZ/rB1jmcaQCljlzkPynWIDW9i/7yXnJzcu
         q4tMMVf07vX7dphcoRcMSHrte2K+G6lg/DrLxIc24F3lXHnQW7m2yFaNw+OkgOtN9ahC
         +NaEDGh39ZVY95pDcDrvU9OUVZz56tzPQF78rCmdAX3uuur08f4zy2KERoAJ4/i88rKg
         ytLAYIR4jp7wz8/ac2ORbidg84FWaMdaRNKJ7eNEsSdku9oGMUgDlgVNnevBC/KhUaPD
         MP2YHV8M7z6/+HOWq8HprJbY7Rxno3YZE4uechNdEXj9fRhb/OpG/TRuHnV4pM4d+PeG
         GDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776091; x=1789380891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kgGLBV2hAy5Dzl/eCzlxyTb+6ng/OBGxSoDpE5wbGLg=;
        b=iizk4esE+0dX41ZHXgSoPbVsBdbqOX+Ph5rAak5q0eY3WV3IEjwF2Pf7bWY5W9mcoo
         qc2eW54yji1O5ezQ/AeGhUIVcnH8qwQerbCjhMfg+PxE8A+Cbw1Fu+T27xYRsSuWFZQw
         b0aYMvllAElKgHfGNOhgC9O45xuSWvlUc22zvgiiN3c9Hd9CqoMWRymSjDVKC+umXkrD
         Mwq1fH1txKg7g+WB/6xR3YSplJ/bEe+YZKZSV+/KP9h365fYm2+5yOqnPa8hH0de8fkl
         Sf8IhlmNHmptd5M3GSeHayGqim1flCN397S+IrMMQG4Bh8E8k+/sjL54CT1oUoM9TTb2
         O2yw==
X-Gm-Message-State: AFuF++lMg977HK+sZrksgTc6cIa2ACAPbtjhgZNJPxjJ28NHHDDJCPH9
	9Rn1pihrBjv0Ljhj/iTuAtwvDUvUAn/tkZ5c+cZkCwTLIOLS9/E76UTQCtL1ccBfH0DqJe2NRB5
	ZOygGkg==
X-Gm-Gg: AYBFou2q5wSgUD0HdSKSjLVE+8D/b43JroKzcZiPL3xHj7riH/Z0zxw7BNNo7dIwtQd
	bFeDoqRetnR4xB7b7FKFUAVYzwodPSLki1HNVRlVLJYv/0d1PRrfFA+KkmMuS+EwOgiE0iCbqHx
	u5Y1ZbBFmKN1jAVwQz2mygsl9R59dKh9vfV236nIBSqpqTZ+5Y3Ob3McttTXjEOZ4Be7VKvFbMw
	mYqJeutjTtMxeyzcCWsGMpv7Eyq1PwS59agHKBNsrrTHmIsU8kBY2OALama19aM4rzMrdFmaxjN
	xOChRpsNR8dCmxCuunNx8NxIn2pJgzR60k4d+OWW4IbRfBzu41LrlMbW3P/SvXtmt2P268+J5eG
	W7ZcI3iax+0sdkfj3vkEuGx7TLi2IJsUytzDpW3FBc0B3pzNDhwP+2sdwmNJ5HAhl7cpzaeAliv
	fd7YIYxqNb5BaADaVQzP+xbb+V9mH8jPFBEbfHxjIsGsIzmcQ9qU6n1IZ3RlTQZ2uxguy2oCoOZ
	ViGSGlJMmtof3eq48FGAh3iN4S0NL+L
X-Received: by 2002:a17:907:72c7:b0:c26:30fa:7cf2 with SMTP id a640c23a62f3a-c2630fa7fb2mr416258166b.13.1788776089665;
        Mon, 07 Sep 2026 03:14:49 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm449759366b.6.2026.09.07.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:14:49 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:14:45 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 16/20] KVM: arm64: Add __pkvm_host_split_guest HVC
Message-ID: <ap6OlRx_Z4BJsXjZ@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-17-vdonnefort@google.com>
 <20260803105428.76EEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803105428.76EEF1F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 10:54:27AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Failed guest stage-2 page table splits leave the host stage-2 ownership metadata permanently split, causing subsequent split attempts to fail with -EINVAL.
> - [High] Incorrect WARN_ON() semantics in host_stage2_split_gfn_meta() turns a recoverable memory allocation failure into a fatal EL2 panic.
> --
> 
> --- Patch [16]: [PATCH 16/20] KVM: arm64: Add __pkvm_host_split_guest HVC ---
> commit 76334f00eacfa593f4125057892101e13067d2e0
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Add __pkvm_host_split_guest HVC
> 
> This HVC allows the host to break an existing block in a protected VM. This
> will later allow the guest to share a sub-region of an existing
> huge-mapping with the host.
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index e16dde4c5f4b9..71ebd1856cb0c 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> [ ... ]
> > @@ -660,14 +658,49 @@ static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
> [ ... ]
> > +	end = phys + size;
> > +	while (phys < end) {
> > +		u64 meta = host_stage2_encode_gfn_meta(vm, gfn);
> > +		kvm_pte_t annotation = FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_GUEST) |
> > +				       FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
> > +
> > +		ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
> > +				      phys, PAGE_SIZE, &host_s2_pool,
> > +				      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
> > +		if (WARN_ON(ret))
> 
> [Severity: High]
> Can a memory allocation failure here trigger a fatal EL2 panic?
> 
> Since WARN_ON() at EL2 expands to a fatal BRK instruction with no "warn and
> continue" semantics, an -ENOMEM from host_stage2_try() will cause a hypervisor
> panic rather than taking the error path.
> 
> > +			return ret;
> > +
> > +		phys += PAGE_SIZE;
> > +		gfn++;
> >  	}
> >  
> > -	*gfn = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, meta);
> >  	return 0;
> >  }
> [ ... ]
> > @@ -1748,6 +1788,39 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> [ ... ]
> > +	ret = host_stage2_split_gfn_meta(phys, ipa, size, vm);
> > +	if (ret)
> > +		goto unlock;
> > +
> > +	ret = kvm_pgtable_stage2_split(&vm->pgt, ipa, size, mc);
> 
> [Severity: High]
> Does this leave the host stage-2 ownership metadata permanently split if
> kvm_pgtable_stage2_split() fails?
> 
> If the guest split fails (e.g., due to memory exhaustion returning -ENOMEM
> or -EAGAIN), the error is returned immediately without reverting the host
> stage-2 modifications made by host_stage2_split_gfn_meta(). This could cause
> subsequent split attempts for this block to fail with -EINVAL due to the
> desynchronized state.

Not sure here if I should just WARN_ON(kvm_pgtable_stage2_split()) as we can't
rollback host_stage2_split_gfn_meta()...

-- 
Vincent
> 
> > +
> > +unlock:
> > +	guest_unlock_component(vm);
> > +	host_unlock_component();
> > +
> > +	return ret;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803100904.3563942-1-vdonnefort@google.com?part=16
