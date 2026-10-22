Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706722;
	b=d4Rjn9GUsCa47RdeRrgC0uQXiCnDO8LIBO4kYK31DtbsJXznZU+2nEoPtWllRcr2YJd9
	 +zxuoz+15j/vEIB2eG7WUsHO2GozDGSNGroRIDu9S2xGEvxxNjtiKiBRoouMW8Kun8fAC
	 Hirpz/ZSIT2+BRx1C0iWil+n9ja6ExZPo2skA86XRcj2NYDRMX6QavGjg9e2om1Jnh9sr
	 zpsZC/z9ixk5Uy+WIrRgCcG+ZKUd38b9Hi4O63ErSIOWxGE0cwdRCR4BTN0iUX9xeb6Uz
	 50QFLx9UYsLE8zS4QqhEpAMEyVLcLW2zzDcHaxgUkLxiyVFprl24VfDlmaSRP+W24wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=aQpldUTNn86Cmtvp1C0Vo7oleaHSSPMS8g9EH60UkDA=;
	b=fHWa9NPVAOf5pzcWRCi2bqpX/FCKB3SW1/13LgRea1vFaoSF3Fc82SqNonWMB+8RZg0v
	 yBqN141U+sjlrvCTfY+25/3y2Xo5e4nF3kZ4BPmY11vXVRqaH7vzREWMxILdo1fcjzgtA
	 6v1Kn510r3/wo9IVnEmaV9Vhxxf4W8PJtP2/DwXIf9YBp1SliC9jLOCdkjvaXRIM7aI4+
	 obyvpxWcJMooJu2sEzoJmb3R5oVVCnPMlA7waXAagCW1SkMGyNVSRB51LtpuoaN459/Ip
	 PMTWUNhMXdP+TDf5eXewdC83kwJATb8I8zt82tu5ykqI2tYAEdqHcCVYoDr3qGBSeJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=siqgvudz;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7998606A31D
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7998606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=siqgvudz
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so208341a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792706721; x=1793311521; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQpldUTNn86Cmtvp1C0Vo7oleaHSSPMS8g9EH60UkDA=;
        b=siqgvudzJqfglKtPY/ub5gkNH2PNw6h6A3L35RBx6v4ZhUJutaEPhYMfkKmyub9R+T
         MqHZ88yHah2r5lBEtDa5iKw9eKV0CIUvZtf/bm9+st659/jf4xjqgdi5H/Keua7UO/Xs
         hmtNw9DWpwO63DYgVuzAc+9DG7BnZuFPc69vQkCGP5FPEOxZAg/MA/xZzLgLNDTvTax0
         EEA1Cg7EFJ0+Qit5dZ0sFeZUHZMXPX5GYxnMX1MtMKxhfNN4Q/7BaSPzIOjLxuKgztLu
         m/kBn8t3ncW8vMNgwccRhvrNEFnbwQl5k+trHU07wrNx+G66EvbIymi3KBeCUvHTzzNH
         OsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706721; x=1793311521;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQpldUTNn86Cmtvp1C0Vo7oleaHSSPMS8g9EH60UkDA=;
        b=nbPlafw5PkGxhO9qISQAwrOAO6hDOeMSuS9nXUovJyZhwqE7z42TVjWKA3vGhPfY5y
         q0r26xzeeQFNQe9ZdI1eGrjoI3AoWvX0UNMkPwkFHGXmbMiarkdgofLcek6hThB4xGZk
         cJQtgzrcP+R/6UJl9fkrKsP/k5KeRMOie7HGfJMHxW6bCdZ+B9EhiH9AOMwgyKmLjJgm
         wpNqC4FxeiCW5x566yD5xiUkLBBc/9UOWwC1zpdAVr2+3YwQPOLAHfKVbTQV8P8828pm
         U+ttENBd9Uyzsxp89PThr77CxScxWE6AW9A9JiBEQp9Qd++DdOz5pIxfRgZYydrTzQIx
         VKLQ==
X-Gm-Message-State: AFq9FYJWhVQ+eBiFMVJWaEAGkRN47pSaevPW/KDFmQb8w+SQ4ttD1XBM
	YsVhtdjt80X6N8jifuQ/7pZifsYdXNLUASL340uBq8IyDWfXTl+J9XNPzV7bYoXdgnb0fZOc05o
	mFJnxG+3oT30ny67gnY/TFdMBJ+qUAP3JScLlMDQsbdlNOvACE9BaVgszMosdAaMwG4lczAATIy
	IlXk4rWTiXsbcs1jUa08XJxnoUyGEO67Civv8daZwGPJRO5l/u
X-Received: from pjnz3.prod.google.com ([2002:a17:90a:8b83:b0:3aa:ff61:94d0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ac7:b0:3ac:ba49:2fed
 with SMTP id 98e67ed59e1d1-3adce874318mr147979a91.58.1792706720890; Thu, 22
 Oct 2026 15:05:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:05:20 -0700
In-Reply-To: <sashiko-outbox-182093@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022215541.631694-1-seanjc@google.com> <20261022215541.631694-3-seanjc@google.com>
 <sashiko-outbox-182093@kernel.org>
Message-ID: <atqIoDulcBpCyqFL@google.com>
Subject: Re: [PATCH 2/2] KVM: x86: Convert all runtime WARNs to ONCE variants
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 22, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> > index 44dad106fad19..945efc1cfaea1 100644
> > --- a/arch/x86/kvm/mmu/tdp_mmu.c
> > +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> > @@ -1368,7 +1368,7 @@ static bool __kvm_tdp_mmu_age_gfn_range(struct kvm *kvm,
> >  	 * this helper must NOT be used to unmap GFNs, as it processes only
> >  	 * valid roots!
> >  	 */
> > -	WARN_ON(types & ~KVM_VALID_ROOTS);
> > +	WARN_ON_ONCE(types & ~KVM_VALID_ROOTS);
> >  
> >  	guard(rcu)();
> >  	for_each_tdp_mmu_root_rcu(kvm, root, range->slot->as_id, types) {
> 
> [Severity: Medium]
> Should the WARN_ON() in kvm_mmu_uninit_tdp_mmu() in arch/x86/kvm/mmu/tdp_mmu.c
> also be converted to WARN_ON_ONCE()?
> 
> arch/x86/kvm/mmu/tdp_mmu.c:kvm_mmu_uninit_tdp_mmu() {
> 	kvm_tdp_mmu_invalidate_roots(kvm, KVM_VALID_ROOTS);
> 	kvm_tdp_mmu_zap_invalidated_roots(kvm, false);
> 
> #ifdef CONFIG_KVM_PROVE_MMU
> 	KVM_MMU_WARN_ON(atomic64_read(&kvm->arch.tdp_mmu_pages));
> #endif
> 	WARN_ON(!list_empty(&kvm->arch.tdp_mmu_roots));
>     ...
> }
> 
> Despite having uninit in its name, kvm_mmu_uninit_tdp_mmu() is not a
> module-exit helper. When tdp_mmu_enabled is true, it is invoked per VM at
> runtime during VM teardown (as well as on the error cleanup path of
> kvm_arch_init_vm()):
> 
> kvm_arch_destroy_vm() (in arch/x86/kvm/x86.c)
>   -> kvm_mmu_uninit_vm() (in arch/x86/kvm/mmu/mmu.c)
>        -> kvm_mmu_uninit_tdp_mmu()
> 
> Other VM and vCPU teardown checks, such as sev_vm_destroy() and
> free_loaded_vmcs(), were converted to WARN_ON_ONCE() in this patch, so
> leaving this check unconverted allows repeated warnings on every VM
> destruction if kvm->arch.tdp_mmu_roots is non-empty.

Gah, yes.  For some reason I was thinking that was a module exit function.
