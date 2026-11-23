Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432118;
	b=RWDkbYXfS410RX73CW4PL2vMnxWNgPCabgChvz3Yx0wjIGdj9dO60rvb3CCfEvoPlh1B
	 02FhbxM7M5slaEYg07BtG7kiTiOSme9Xf0D9PcezYjzYbDGwlsEvMM7wLTbiEonC7Ox+A
	 lQLvcAZ31I9ihzqFHeIyysVY5frebpgr59+7c2HjSfN5dHlVn8ebhGc5H0upVUPaPim2M
	 ePikSByvsTWZzD0qFzNvNSQe0tLvn1ej+tg9brKEXOCuM5vD4xsbCMBgH3Vhh0gJ4AVvW
	 91izDp1nEz/CYxu3NopNMLJnxjnda+JRUTvKqTHh2vyX+982HnsFGUHOBki0F3IeJHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2ahVaClWdiwyy5fxyONnLYFCAROTD31eA1TLqeeKJiU=;
	b=iVM31TSwA8all4Enn/oUdnUPQKJE4vywWhvuXzBBhS2FLqMCF+DQTZcWp5cKpht0G/bv
	 2FHGj9hCYF01KogcO5DDE3riWJ5fj1/K4lrDTGvPTZbH2N6i0Am3BH63HPRYzJ9Eth9tY
	 hCxXJtSJb3xch7hbiVg8miXRz1A73IwgVAHD0YZ+53l+aK41Otbl+VCrO60+H4IkPCq54
	 Mmc0Hnmxb9DFHEeDNIl8peZ1drAVFqszt0SB+WS+7OZp/xL5Z3fMmlE8mVHDTA+K5i8gH
	 pCtH7kZ/HDy66WtIoqXCYKyR4DJ2uPjhOhp0m2faR2PtgCGYQEhEdLTA78Vct+kJ/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=bt2VSFp9;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33984606A31E
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 11:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33984606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=bt2VSFp9
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso190482f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795432116; x=1796036916; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ahVaClWdiwyy5fxyONnLYFCAROTD31eA1TLqeeKJiU=;
        b=bt2VSFp9CIIAltQoi/VreeqHhrjZCe3/unTtCON4zB+A0oZFMGKySEjraE6MUGQN3r
         m4ILlqbuLaSFqoTdq9ydkf4Py/apERKnFMM/F7WrnH7AhRcEdz6PSVSdiAiufobJ7J1v
         rFLG1epRyRUkYfSD+Mtqc/Q3BSOesqzC27BSQB6IUS0c2S+Pl+66MtW5RyohXnCA50cc
         i+ciYSdn+UiMNdFey/9xSHlpjeffIZU2QqCLK704Xf3Z72LwySNEVwY3zT6yO3r4hbg7
         WAZ3kQVBT4fPV+och1t2W1rFpqG0xKvKvm1T31c9CX1/wUmmzFgur7omWb8fjNb3M82Y
         sWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432116; x=1796036916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2ahVaClWdiwyy5fxyONnLYFCAROTD31eA1TLqeeKJiU=;
        b=SICVkeZZKqOf53hnTN4FX6cpEIaDckjp0VdGeUp4UARtRJuu2Sqejzve9jvyGsa5Fc
         djOuKheJ6wxCfAqMLS6HM6+YA3IrsmUt9QZzQfVPhuZibxpndDlLm4Y6vmVHW8TAftNd
         ZmM6ndch6WUw24z3oxmmYlSt/z5dYURExZ7KFQLzRTabVY4A+jTNLCrLj7Q2tazfpLdv
         kOk9gYprBwnZb1rHHHls5eaO53LiA5MU3xLwA+1Vj1qoXnyhEByV70Pi9/RFVdesFtxi
         +KF5wVuN6Twpx1sfjIHbpGoLuGJPMkeFHeB6uB1E2EYJGC8k+/U+GkK/Q/L1psGLb+tY
         wmcg==
X-Gm-Message-State: APuU4Z8syfbupboLNViduNTZDs5FjV/2ZwpvCHMDOL2cy8fL9jV+gzSW
	y3T1qcn0GKq4DK4sZP+OLFeWgTRBqWdZ9J/GJUsDqeRGs2LEf4aFQ801iF1TnrLje3WKdmJkoz7
	wY7UksOX2sQ==
X-Gm-Gg: AZFdTZfUoDR+OcFB7CRttzEJNhVg68tb8yTu63doGeTk+Bn/XWmc3jSlhzCHjGcikPZ
	D0+81Ti/J1CZSZmcZFyeqHQ4uhsfnsCa25YeQWp+CHX6qdXYGTOjFW9F/FVjMLbsYvZd6pc5DGm
	xwXl+T+rwWygLFfT/Q5WxYKfbytxZjz0d/9J4O/KUBv0nyhMEMqujoPdgv7CH5gsDwyuk6rxeLv
	8KSVc9KyeJHA4AK2Fyw0Ny0q2eKzfuQ13Am/5V3ctfDRzpb4MM7v3JosTsmIyOHv1O9TlRxyz3R
	GyQsPH40F+GcFoOtu/lbftclzSFJOlILWCx9oHZWlV2cW6f9Mi35fsEtaavISf5XcXHtqoqflvC
	OOawc46JVVFIkKGW4+ykVCwJj1dXeR6GHKzcxibowqpmhH0MQVxlQMVo/nAmkcdYS1dbrExeRbA
	SQ8VKR+VrrH0g2MHrqq92WFHti77NGXx9TZyrqSsS4hhbb/WzXfpHzq1eifxurwr23SSBFPv6Pf
	BlEHVrJ5lBZULJKbA5nzgMqGHNatov3xVtBQXsBUjBi2585LUi/ZbvbZ8YVJglkznehT7pI1No9
	RETUgK6YvvPJNzUufgAdotcoUhKHkMrQ153t9cJ0
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr23222776f8f.7.1795432116203;
        Mon, 23 Nov 2026 03:08:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm5162435f8f.19.2026.11.23.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:35 -0800 (PST)
Date: Mon, 23 Nov 2026 14:08:32 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: nv: Re-inject a stored SError after the exit
 is handled
Message-ID: <awQesKJZd0gKpLJx@stanley.mountain>
References: <20261123-double_exception-v1-1-cd82b59a232d@pereq.eu>
 <sashiko-outbox-229065@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-229065@kernel.org>

Yep.  These are sort of existing bugs which my patch makes worse...

Claude had previously told me it would review patches to see if they
expose any new bugs, but now it's saying that promise only extented to
"crash fixes" and not to "warnings like this".  :P

Anyway, I will send these fixes.

regards,
dan carpenter


On Mon, Nov 23, 2026 at 10:42:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] KVM: arm64: nv: duplicate SError injection when
>   NESTED_SERROR_PENDING is set
> - [Medium] KVM: arm64: nv: premature SError re-injection in
>   kvm_nested_flush_hwstate()
> --
> 
> commit a6e9a58a0688b0de9bbbb40738acfc3f5921f92e
> Author: Dan Carpenter <dan@pereq.eu>
> 
> KVM: arm64: nv: Re-inject a stored SError after the exit is handled
> 
> This commit defers SError re-injection for nested guests from
> kvm_nested_sync_hwstate() to kvm_nested_flush_hwstate() so that exit
> handlers can record their exception or PC increment before the SError is
> re-injected, and updates kvm_arch_vcpu_runnable() to treat a deliverable
> stored SError as a wakeup condition.
> 
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 78d5b18dbd2d6..f063c01c565a0 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -2213,8 +2213,11 @@ void kvm_nested_flush_hwstate(struct kvm_vcpu *vcpu)
> >  	if (!vcpu_has_nv(vcpu))
> >  		return;
> >  
> > -	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
> > +	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING))) {
> > +		/* Commit the exit handler's exception first */
> > +		__kvm_adjust_pc(vcpu);
> >  		kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
> > +	}
> >  
> >  	vgic_v3_nested_update_mi(vcpu);
> >  
> 
> [Severity: Medium]
> Can re-injecting NESTED_SERROR_PENDING here run prematurely when guest
> entry is subsequently aborted?
> 
> In kvm_arch_vcpu_ioctl_run(), kvm_nested_flush_hwstate() runs before
> checking ret <= 0 or kvm_vcpu_exit_request(), and inside
> kvm_nested_flush_hwstate() the SError is re-injected before
> vgic_v3_nested_update_mi() and the KVM_REQ_GUEST_HYP_IRQ_PENDING check:
> 
> arch/arm64/kvm/nested.c:kvm_nested_flush_hwstate() {
> 	...
> 	vgic_v3_nested_update_mi(vcpu);
> 
> 	if (vgic_state_is_nested(vcpu) && kvm_vgic_vcpu_pending_irq(vcpu))
> 		kvm_make_request(KVM_REQ_GUEST_HYP_IRQ_PENDING, vcpu);
> }
> 
> If L2 has PSTATE.A == 1 (with HCR_EL2.AMO == 0 and HCRX_EL2.TMEA == 0) and
> NESTED_SERROR_PENDING set while an L1 IRQ or maintenance interrupt is
> pending, kvm_nested_flush_hwstate() clears NESTED_SERROR_PENDING, sets
> HCR_EL2_VSE in *vcpu_hcr(vcpu), and posts KVM_REQ_GUEST_HYP_IRQ_PENDING.
> kvm_vcpu_exit_request() then aborts guest entry without calling
> kvm_nested_sync_hwstate(), and on the next loop iteration
> check_nested_vcpu_requests() -> kvm_inject_nested_irq() switches the vCPU
> to L1 vEL2 with HCR_EL2_VSE still set in vcpu->arch.hcr_el2 even when TGE
> and AMO are clear.  Similarly, if PSTATE.A == 0 in L2 or if ret <= 0 exits
> to userspace, pend_serror_exception() pends the SError into L2 state that
> gets committed by __kvm_adjust_pc() even though L2 was never entered.
> 
> > @@ -2231,18 +2234,11 @@ void kvm_nested_sync_hwstate(struct kvm_vcpu *vcpu)
> >  
> >  	/*
> >  	 * We previously decided that an SError was deliverable to the guest.
> > -	 * Reap the pending state from HCR_EL2 and...
> > +	 * Reap the pending state from HCR_EL2, and re-inject it from
> > +	 * kvm_nested_flush_hwstate() once the exit has been handled.
> >  	 */
> >  	if (unlikely(__test_and_clear_bit(__ffs(HCR_EL2_VSE), hcr)))
> >  		vcpu_set_flag(vcpu, NESTED_SERROR_PENDING);
> > -
> > -	/*
> > -	 * Re-attempt SError injection in case the deliverability has changed,
> > -	 * which is necessary to faithfully emulate WFI the case of a pending
> > -	 * SError being a wakeup condition.
> > -	 */
> > -	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
> > -		kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
> >  }
> 
> [Severity: Medium]
> Does leaving NESTED_SERROR_PENDING set across handle_exit() and exits to
> userspace cause a duplicate SError injection when kvm_inject_serror_esr()
> is called before the next kvm_nested_flush_hwstate()?
> 
> Because kvm_inject_serror_esr() does not clear NESTED_SERROR_PENDING when
> it delivers an SError via kvm_inject_nested_serror(),
> pend_serror_exception(), or HCR_EL2_VSE, a KVM_GET_VCPU_EVENTS followed by
> KVM_SET_VCPU_EVENTS in __kvm_arm_vcpu_set_events() injects and immediately
> commits the SError via commit_pending_events() while NESTED_SERROR_PENDING
> remains set:
> 
> arch/arm64/kvm/guest.c:__kvm_arm_vcpu_set_events() {
> 	...
> 	if (has_esr)
> 		ret = kvm_inject_serror_esr(vcpu, esr);
> 	else
> 		ret = kvm_inject_serror(vcpu);
> 
> 	commit_pending_events(vcpu);
> }
> 
> On the subsequent KVM_RUN, kvm_nested_flush_hwstate() sees
> NESTED_SERROR_PENDING still set and injects a second SError into the
> guest.  The same double injection happens in-kernel if handle_exit() calls
> kvm_handle_guest_sea() -> kvm_inject_serror() while NESTED_SERROR_PENDING
> is set.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261123-double_exception-v1-1-cd82b59a232d@pereq.eu?part=1
