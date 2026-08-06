Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BBA42A791
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054913; cv=none; b=fQGz3LTZpUN1cBhxspMQKIbivz5K+sHYAoaMKDPCRjoDdXdtuiDp97HjKEWBlwWmR0zbCMBNOOr8WzOL+6hz0KLBFG5rReLWbBWDF6d5gHplzslHWlQnsVTtuen66Xu2oyLZvDd3ZH5YWr4OpSaxZ8wZjgMqCuv9H+0C3kPOvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054913; c=relaxed/simple;
	bh=aW7oIeIP4ZCK+akZGuWexPtRK1UWq9PGrc5ukX6GXr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FX23ZM/thrXaJgpWAevtdiJAozcPfllqIsOnoiKwL8oLqfpnRAPsbXr7mfvDi4mmMH77mfmeUl+1EFpkdGUqc9V01XBR1qa7CBPyCoGG5WZ6/0B+MiYGZuPvgALswv37FSGb/JwneKfJ0Pn+8DGLoLjQKk/htQ4gMaR/S8Y4llU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mDKZ5w0v; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mDKZ5w0v"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so3388207b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786054911; x=1786659711; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gld0ILh0vdHn8FgOPInqNxEGvb4kAfssusuZDeF8P1s=;
        b=mDKZ5w0vFt+3Q24ZRSvqS9UYmnEC0o5/3WN5XX5ShLnTUJC/XwuKbuIp2urfGwlF+I
         tDoU9Bizc94HqyhLYudjMLAN7JqV/Uq4likY+IOsyGQQV3O6UD0VCvx/Ic2bI57byMn1
         vdwz8S8xPt/L3n69B7z40fng3lKV9VeS72NPv8k3xwwJqkhWdvY+rHyezMHOusd97AXf
         YIT6vTO7fVwpaFkNTtKMjvF1bh3MFom2qZGorL1wFdo1wLeS7LzArhG5fX9Sc+APZFJR
         A3OBNjzqg0SXfFz+mmlATrvzO+cHfCormI96e99iH+cSr5CSqTuyDTac4Zb4t5dD8w53
         jMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054911; x=1786659711;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gld0ILh0vdHn8FgOPInqNxEGvb4kAfssusuZDeF8P1s=;
        b=X0okW4w8kzRB3lh5YAVgsfrzQjTkyqXyRsL/WjCg11je995dQoqCV8keRNAbnNnAvU
         Ioo2C/iVUW8joHH9kuPf++Y4PUQl8108AoE6CdQZDUaiq8rO0XCOyAtyfU4rdvZ0qIuc
         dKKe4ymh3L1nThhKNgaKK+0K68Bm59kmWsC5LOKP0PAJeqL0MVGzh6pWYUTSQ5hwTZzc
         nhvEK9zg2fXWej9/O3SYjr7raytAlP4KffV90AYVIMJMAdDSKViXVciiXcGrIeoG7qt/
         DnZlegovREo+TgqWeTbtkpGXjI+PCE6FkMrtkTSCjWQNmTMrnz2nMI6SzVH3yJOBMD28
         /GIw==
X-Gm-Message-State: AOJu0YxZ+2b6GTTdSUMfyInj+8m+q1yHbMo8TL7c0rCl9jnnZFhM8Fhu
	IUNwDZyMECcq4g1y0KgoT5EEVm+XfWWvtdQIZpR4Iz2VVtltitk3oh9rclQPcZ8aUmr0MyKyWmp
	CWPqy3CVo1F1s/8EFCv5lCw7Ad/WpjUcssSgTryqX+2MuRSv5DXi53uoLUa0jVPiz6KpBGayFvO
	qWvrJAf5oU7rNf1bIR4D4LoG4gfifqlIAGWfSonaKjEx3MhdIA
X-Received: from pfcy7.prod.google.com ([2002:a05:6a00:93c7:b0:845:e683:1287])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c95:b0:845:3033:6cb7
 with SMTP id d2e1a72fcca58-84f2dfc8ec7mr17157522b3a.9.1786054911013; Thu, 06
 Aug 2026 15:21:51 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:21:50 -0700
In-Reply-To: <20260806221418.B08551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806214050.78058-1-seanjc@google.com> <20260806214050.78058-3-seanjc@google.com>
 <20260806221418.B08551F000E9@smtp.kernel.org>
Message-ID: <anUI_nHNrxV044FY@google.com>
Subject: Re: [PATCH 2/4] KVM: x86/mmu: Harden "map private PFN" against
 unexpected root invalidation
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 06, 2026, sashiko-bot@kernel.org wrote:
> @@ -5184,10 +5184,6 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  	if (kvm_gfn_is_write_tracked(kvm, fault.slot, fault.gfn))
> >  		return -EPERM;
> >  
> > -	r = kvm_mmu_reload(vcpu);
> > -	if (r)
> > -		return r;
> > -
> >  	r = mmu_topup_memory_caches(vcpu, false);
> >  	if (r)
> >  		return r;
> 
> [Severity: High]
> Since mmu_topup_memory_caches() is outside the loop, but kvm_mmu_reload()
> was moved inside, is it possible for the reload to consume cache items
> when allocating new roots?
> 
> If the root is invalid and kvm_mmu_load() allocates new roots, this
> consumes items from mmu_page_header_cache and mmu_shadow_page_cache. When
> execution proceeds to kvm_tdp_mmu_map() expecting fully topped up
> caches, could this lead to a cache underflow and a host warning or panic?

Literally the next patch...

> > @@ -5199,10 +5195,21 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
> >  			return -EIO;
> >  
> > +		r = kvm_mmu_reload(vcpu);
> > +		if (r)
> > +			return r;
> > +
> >  		cond_resched();
> >  
> >  		guard(read_lock)(&kvm->mmu_lock);
> >  
> > +		/*
> > +		 * Because slots_lock is held, it should be impossible for roots
> > +		 * to be invalidated after the initial MMU reload.  WARN, but
> > +		 * continue and re-reload the MMU to try and keep the VM alive.
> > +		 */
> > +		WARN_ON_ONCE(kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu));
> > +
> 
> [Severity: Medium]
> The comment mentions "continue and re-reload the MMU", but does this actually
> fall through directly to kvm_tdp_mmu_map() with an obsolete root?

Yes, addressed two patches from now.

> If the mapping succeeds, it might return RET_PF_FIXED. This would exit the
> loop instead of forcing a retry. Should there be a continue statement after
> the WARN_ON_ONCE to enforce the retry behavior described in the comment?

Eh, I'd rather hedge in the changelog.
