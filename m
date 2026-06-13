Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3179175A70
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 00:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781310029; cv=none; b=dBladFyLzfoc+XNl7Z9G0eYC9o675eI2cY5FlcuZ1C7C17kGlTYpY/h9VnF8omfpBqDTp1O72r0KG+chSeM+P60SQuPjfXEQYghm7Yqbvo6WFc6aMa9SnclzuvicdFwZsjE2opo+EqXXsOJOPhXSydadLMFNg9xjAOnqIYnc2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781310029; c=relaxed/simple;
	bh=pFzcrLzSWkUP1eJvW3lGG2DvcARF6j1tkN7/i7nSNgc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EdPZpMRAZZX37dGxJC3ZLDqKYt4cXxHZAwc8YWeLTNbKo+4wXyamfasUFBrW2xQdgDsvwVH36Yydavh5TqZrYgyXiZZPcops87wySs4LVDZb0MK/lkm/UG87oIw6WIayB2Q9C6JQ1rACWj56xrgmqf14YKEbO7OQXODVEnHxPLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OQj1M9wp; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OQj1M9wp"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-842692bf60aso2021464b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310028; x=1781914828; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=31IiaAqN5Ew/pmLAdduQflk0iW5H/bc3usr/zVzw4k0=;
        b=OQj1M9wpKVjuBKqeEBRIMz7al/abMrvkYAYyVqtt/Rc5qJFGXzqTfpAAzn5rLfpxtj
         mq5ev1YjBOQhV1FG2i8cprlNnnwdlFgs1s3XbbBGra/5OqgzipJWfDFa/S4+K/u8cgYT
         enFzN2O80ivwXlf073XImk8/ySbvq+F2HwofflJ4L+GaWIQ+fUDZf3UjjUY6C0w8yBiZ
         PyTCRsw/ZpCo6ZS2Rd/8Wzr8shlJ0FQw2OSezhuO2fywrFYVwGaUBpY9BKCfkKsZJQ6G
         hO3Pw2SdZI3JmW/TexzSq8/DvFAQ66oenqdZhf/IV1btbTpGkPDiLtmU8c2ky6MNtEYu
         eHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310028; x=1781914828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31IiaAqN5Ew/pmLAdduQflk0iW5H/bc3usr/zVzw4k0=;
        b=HketONvDPQ1lvcsMhjbwq5sJtCH954kqInYHMz8YEeKoJQA56Y39UdCyS8XP21hPdD
         dCjGudGOFqgHP3cQrawlxMdFlhnrYUmI0BjsSIZk0A1XR0WaJSO8DdPLPk1CkH1TU5fm
         HbEbRjhnoEgNPgCQ5G2R6fQDF7/cMGzQlfHc0OlOAHr8XpBfB8LCMdwa2lzO9uB2IVIl
         ES6hR0HEfwjMhTogbGMJdEUdPwIJJtK5G6y6u8vYfxPZLVmGkbZzmR2VM13HGm/I/42p
         M+B0MOPGbYG1grGbtLqio78kH4amNv3YJfssUArUt1EFEdxPLDayabH9UyEssdXFX9hv
         Fsnw==
X-Gm-Message-State: AOJu0YyTMcFqvRABenb45uaiqn+iwljO7edAas229MxeJw6uO+M7onMR
	CP6Xo/WiryBLp+2LiKULI5R3F0jYY7KSW+9hdhzLP+W6VVujlCdVHGSw55dA2GZG4ydu32WOC39
	ikLaL6zFhlVDqs0Q4gKaD9LhLpjJ+2JnGrkAOkLYASIDF9qZhV9Fc/HlCiwKNOC1DBmgzwjaHPB
	NWA+9vflrwkU7q2atjLqfEq6TKnCtaeDfwfevAqQNmHDwheNcE
X-Received: from pfnu8.prod.google.com ([2002:aa7:8488:0:b0:82f:790c:3922])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:888e:0:b0:842:4612:55f6
 with SMTP id d2e1a72fcca58-844e1a29d48mr1958075b3a.21.1781310027838; Fri, 12
 Jun 2026 17:20:27 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:27 -0700
In-Reply-To: <20260612232258.0D9131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260612230622.687665-4-seanjc@google.com> <20260612232258.0D9131F000E9@smtp.kernel.org>
Message-ID: <aiyiSyTu4xzCN3hL@google.com>
Subject: Re: [PATCH v2 3/8] KVM: x86/hyperv: Ensure vCPU's Hyper-V object is
 initialized on cross-vCPU accesses
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 12, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/hyperv.h b/arch/x86/kvm/hyperv.h
> > index e6c74cfbb1cb6..821b586ed7464 100644
> > --- a/arch/x86/kvm/hyperv.h
> > +++ b/arch/x86/kvm/hyperv.h
> > @@ -61,6 +61,18 @@ static inline struct kvm_hv *to_kvm_hv(struct kvm *kvm)
> >  	return &kvm->arch.hyperv;
> >  }
> >  
> > +static inline struct kvm_vcpu_hv *to_hv_vcpu_safe(struct kvm_vcpu *vcpu)
> > +{
> > +	/*
> > +	 * Ensure the HyperV structure is fully initialized when accessing it
> > +	 * without holding vcpu->mutex (or some other guarantee that KVM can't
> > +	 * concurrently instantiate the structure).
> > +	 *
> > +	 * Pairs with the smp_store_release() in kvm_hv_vcpu_init().
> > +	 */
> > +	return smp_load_acquire(&vcpu->arch.hyperv);
> > +}
> > +
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but should 
> kvm_hv_has_stimer_pending() also be updated to use to_hv_vcpu_safe()?
> 
> It currently still uses the unsafe to_hv_vcpu() accessor:
> 
> static inline bool kvm_hv_has_stimer_pending(struct kvm_vcpu *vcpu)
> {
> 	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
> 	...
> 
> Since kvm_hv_has_stimer_pending() can be reached cross-vCPU without holding
> the target vcpu->mutex via the spin-loop yield path:
> 
> kvm_vcpu_on_spin() -> vcpu_dy_runnable() -> kvm_arch_dy_runnable() ->
> kvm_arch_vcpu_runnable() -> kvm_vcpu_has_events() ->
> kvm_hv_has_stimer_pending()
> 
> Could this bypass the necessary memory barriers and result in reading an
> uninitialized stimer_pending_bitmap?
> 
> Also, won't using the unsafe accessor here unconditionally trigger the lockdep
> assertion introduced later in the series when accessed cross-vCPU?

*sigh*

Yes and yes.
