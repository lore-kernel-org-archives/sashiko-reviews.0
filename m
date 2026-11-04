Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751437;
	b=YLfey+42115A1EvQi5Popdl4Y3fFrNePpmQIkQDqh9wew3TalV50froJ064GA1AZSmOS
	 4bwjM4Y+R2uogy9x0R1YpFtErJkLcLS4rH9klw/IA1xe/sUUe1cEFEhls0Lt2QvDSvBFl
	 /mDSRwu9tiDRvymcmhzeBB2nmaPk7rG2mIL06IgHxyhCaEc03Vo/aejSvyAtnDL+usiGr
	 3nQHkZZ9/MDTh6fh2lR2W9bMk7tYAi9+9fapSP/pajSRvfb9+vQ3rXg9mT5IW6FWeLvu3
	 +g6r204uov0C49zFzLGRv81zR3fWdvu6obsy3Ycvg0kJ4JxGMP9BGyBhmL8vcGbrs+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LhyvKds25xNhoCjxUA6XF46cL6FC3po2ea3t+x75DYw=;
	b=K15r8xejtmSRg4VWDLAWT3vFQHneN8uk3ByyMF66WzeYbK1scBWbO0Keva3Ss4qvfTDR
	 sEOrqNx1ACI7Cv8gj525RQIIw8BjIYAzYET5qfu38Fq+i1LUsk4hU4epbIRQ8tewDiX88
	 xOpqAw1mkYkFxEsua++m8cAWFFNZX6WEvIcdT7mP5gwCwlQsUGCDwYjYW7sjK3lqawxuA
	 MQsyhctun50wvmYkTOcV3ZXQgYeW2ki4hP05Btjl8QIRk6KGkrYaWJZHz1IeiYS40wQnT
	 nln3GMnu57QaYyEj9z2v3+yKO+rD1Jxw1YN6Wp2V24RZ7VeRT7oZqwCKkVh85vfGQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P+tSdCen;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FBD606A331
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 00:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FBD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P+tSdCen
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so182036b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 16:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793751436; x=1794356236; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhyvKds25xNhoCjxUA6XF46cL6FC3po2ea3t+x75DYw=;
        b=P+tSdCenQ++UxnkiMWzQICR+Iv26haBqQp6nS8R4Eipfkqttmy4+RrYJREGirNmUjt
         FogO10TQu/Az0Sn5FEatYXKGAvKUrQ0ejTzZaPuaq6SEuNB+gbN42stSvEeo6CEx37wP
         PnxPPVKNm4yX6eo6hL/oecCpfV5UFhN/QWjRUWN8uQATGAJOsMwtgsq9Ik++9dkpaMrH
         Z8+rZZlzp1ZSq3SyDsPc0eToi0jVwfkyNQ9n/Yoagjw9/iP6/AomT9013EkOi9CYU1Do
         zi2fokt8IsAa6riM+zYTPU3HDbTUHe+eZh4FE5s/yG8rjzWJFrIaLkzYOz8X9CDcIrMR
         3IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751436; x=1794356236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhyvKds25xNhoCjxUA6XF46cL6FC3po2ea3t+x75DYw=;
        b=h09qpOz6HkwXs6k2gEq+j3cVGIXOtn6Ke3yOJLiipMHmTn8O6If6/oKor89B93eBS8
         8WIkmXX9IKFmCu2SZ1tu2eX5MU1hIEPfweOBVoW047jE9U02qUbhZvWDXqADzpJn0+DM
         /EL126+QMXJKKWpYy3Oo07lsp0Vl6XPnQiMOei4MUj1qMn8RLo1hyvPsizBFdrg/xIwm
         byd387YSdwU4jwIrparVoywxsxZpctCyaN4Yqg+FkleQS0o88X7UJxoARes2QHtFLbhc
         89X8V39Eap28n2BThs3qlUbXbKGCEwtsINE7a407TJHqVqfHCNk/LihpL5Vqlfe/k9Rk
         RBBg==
X-Gm-Message-State: APuU4Z/cWCoB34ZZXUtB43nCU3HspUz8htWUcYKGFNq38ElEEKdLMaqW
	0acStmmMl5M1u03kd9LyM4Sn7y7Ni2/dnW4gpMf+2UuLMJB6A+sy/bKsw4l56iFJA1eWhLOVEoo
	acoGuIg==
X-Received: from pfgg3.prod.google.com ([2002:a05:6a00:bd83:b0:8a0:cc:2b89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b4a:b0:89e:cfbb:e8af
 with SMTP id d2e1a72fcca58-8a9ba8fb9c0mr10230607b3a.6.1793751436089; Tue, 03
 Nov 2026 16:17:16 -0800 (PST)
Date: Tue, 3 Nov 2026 16:17:15 -0800
In-Reply-To: <se1h6b4t.ritesh.list@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com> <20261030212112.2598640-13-seanjc@google.com>
 <sashiko-outbox-191627@kernel.org> <auitWWkOopYYbBH3@google.com> <se1h6b4t.ritesh.list@gmail.com>
Message-ID: <aup5i73T5aOKqcYS@google.com>
Subject: Re: [PATCH v4 12/23] KVM: Destroy memslots immediately after
 mmu_notifiers are unregistered
From: Sean Christopherson <seanjc@google.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Gautam Menghani <gautam@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, Ritesh Harjani wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > +Gautam and PPC lists/maintainers
> > On Fri, Oct 30, 2026, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >> - [Medium] KVM: PPC: Book3S HV: rmap_nested memory leak in kvmhv_release_all_nested()
> >> > @@ -1310,12 +1329,10 @@ static void kvm_destroy_vm(struct kvm *kvm)
> >> >  		kvm->mn_active_invalidate_count = 0;
> >> >  	else
> >> >  		WARN_ON(kvm->mmu_invalidate_in_progress);
> >> > +	kvm_destroy_memslots(kvm);
> >> > +
> >> >  	kvm_arch_destroy_vm(kvm);
> >> >  	kvm_destroy_devices(kvm);
> >> > -	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
> >> > -		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
> >> > -		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
> >> > -	}
> >> 
> >> [Severity: Medium]
> >> Does hoisting kvm_destroy_memslots() above kvm_arch_destroy_vm() leak
> >> struct rmap_nested allocations in slot->arch.rmap on PowerPC Book3S HV when
> >> destroying a VM with nested virtualization enabled?
> >
> > I don't think so?  Patch 3[*], "KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()",
> > should free the rmaps in response to kvm_arch_flush_shadow_all().   From what I
> > can tell, the page tables have to be in radix mode, and so the rmaps are freed via:
> >
> >   kvmppc_radix_flush_memslot()
> >   |
> >   -> kvmppc_unmap_pte()
> >      |
> >      -> kvmhv_remove_nest_rmap_range()
> >         |
> >         -> kvmhv_remove_nest_rmap_list()
> >
> 
> That's correct. Maybe, I think Sashiko didn't consider patch-3 of the series
> during review of this patch-12.
> 
> > And if that doesn't work, it means memslot deletion on an active VM is completely
> > broken.
> >
> > However, it means the memslot code in kvmhv_release_all_nested() is
> > dead code,
> 
> Not really. I do see a caller of this, for when we switch from radix
> to HPT. So we still need it.

Oh, nice, I somehow missed that.  Yay, less work to do!

> INCOMING CALLS
> - f kvmhv_release_all_nested
>   - f kvmppc_switch_mmu_to_hpt    [arch/powerpc/kvm/book3s_hv.c:5591]
>     + f kvmppc_alloc_reset_hpt    [arch/powerpc/kvm/book3s_64_mmu_hv.c:144]
>     + f kvmhv_configure_mmu       [arch/powerpc/kvm/book3s_hv.c:6330]
>   + f kvmppc_core_destroy_vm_hv   [arch/powerpc/kvm/book3s_hv.c:5930]
> 
> 
> 
> So FWIW patch-12 as such looks good to me from PowerPC perspective,
> since those rmap entries will get freed up as part of the
> mmu_notifier_unregister() (after patch-3). Agreed that Sashiko
> comment does not look correct.
