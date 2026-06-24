Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673453A2549
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340091; cv=none; b=KNTn++u27TkM1mzfF3zBEdf1kNhLUd9/IAJWYEplDRdxtanuZiSLq/S2fDqTjmMgNNPk0AbFa1hwLzLercHf7q42/31+w080pD2d4LRf3Ho7YkYss7Gs+y3T9alEa7V71EpuMY7qEABSs7xjDD2X2LbzBzlJsMX3Vp8+UvAN2AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340091; c=relaxed/simple;
	bh=iYzlXFFtwrNOSeUItoEwOA4kQ6hwth+tnUdJV4zAI3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ARGZdZzunEBrzLdM4pzV34B43QhNpXmCw4ZlzKwKkdjlC8V7hrgU7Z4Dn5gU2paHy8YaUCdjlBDJAIHsWN217TGukMD9YGWHnzhAqXzzgUHneZTXX8NS1IVzZMBv+jR2pJ8QNjeBA+6PezJwqd3JWEVaIkWbK5qcocr926dwerY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoEL5lCq; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoEL5lCq"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8894570b58so839728a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 15:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340065; x=1782944865; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dE4wtlwd4UKJdKkZ5EnOOlpdhdJbc1e0cnd+7Jbu9n0=;
        b=SoEL5lCq58i6Yk78sZpli3H8Leo1WZnYUigGsIrq3H9EHQXG9W01Oh+65gnfho2Xcq
         RIz/gIEUrcNQ1NLMRTWxrdDgdgRmK7kP1jpJYKCWh7fXLGOZc/ec1hgI9Pk67iIs7z1m
         G505ea+Qvla5NBBtp5FIEqo3SNtDVqDxLP1gjKaWlq/eFG/9nrheGl04oDudJxd18CDW
         vdSqnqhkA4rt4d9OA5a89wyIfXZQ5CNigSsdiiGAnKmGjMJvbQfe8lcicub6HfBiqc+I
         VXdOLEAwyroN/ZmUHSsqz+iQgG+xY+PcosBy8oyspf98lOYiWM2+uJkB7rnzsqvStiKB
         d8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340065; x=1782944865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dE4wtlwd4UKJdKkZ5EnOOlpdhdJbc1e0cnd+7Jbu9n0=;
        b=ppQylMsLXnmW6SPTjkAWTi4But8AKgdyw0kzl6UE1E3QF4aeItxKipR6ZMk2rQBDWg
         amvH3bCWUzDmAPSrJ4gni/XBjusrDpfUEVqlknMb9YIU0B8G5lXC0uFyLB6S2F4qjoB7
         rj8ToI//qvAgY7jggI2iQ625HhicvpSG9Zb7+C5tYHu3qZL/ETx86zKH733BWmfPChB4
         2GecdKXpba/f4ALE2PEwEzt0qYfZ4B9pT63taQ2nQLuMzFVWuSMx6cP+Bi3KnysP3h6n
         aOjzUpUp0oSN98+CEM82GP7pulVoZaMBjqTSty1m9SxCtn+NRh5QRnyRs9NwzsusrhaF
         Xosw==
X-Gm-Message-State: AOJu0YwVU4CkgFNeWsPxibD7YQzQ+9PwkmR8rOKuEto4IJbGksHQgt+L
	D9SVPS1p4cdKFaCA6G0nY4KssS5xAvrXWovlms/lKVv2QZVRVSjUtxlnIFF5/wo4bD75Td3dA4+
	2wP6UtZyJmfvzpL5676E1i1aR/c4d3kHW3Qq90OD0x0+2hTP2LxPNHiDNf7AVIsjH33TsZ7DOYE
	F2aTMs0s8lPD/UioLq0EuiRHUrSeVUv75t/GRnUMs/04opnq44
X-Received: from pgjd16.prod.google.com ([2002:a63:d650:0:b0:c86:2413:1f39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918e:b0:3b5:52b4:87a7
 with SMTP id adf61e73a8af0-3bd4abed5abmr1654637.6.1782340064967; Wed, 24 Jun
 2026 15:27:44 -0700 (PDT)
Date: Wed, 24 Jun 2026 22:27:44 +0000
In-Reply-To: <20260624221757.393111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260624220516.3033391-1-seanjc@google.com> <20260624221757.393111F000E9@smtp.kernel.org>
Message-ID: <ajxZ4PLDkaZ698ht@google.com>
Subject: Re: [PATCH] KVM: x86: Ignore pending PV EOI if the vCPU has since
 disabled PV EOIs
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 24, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> > --- a/arch/x86/kvm/lapic.c
> > +++ b/arch/x86/kvm/lapic.c
> [ ... ]
> > @@ -3382,8 +3388,6 @@ static void apic_sync_pv_eoi_from_guest(struct kvm_vcpu *vcpu,
> >  	 * KVM_APIC_PV_EOI_PENDING is set, KVM_PV_EOI_ENABLED is unset:
> >  	 * 	-> host enabled PV EOI, guest executed EOI.
> >  	 */
> > -	BUG_ON(!pv_eoi_enabled(vcpu));
> > -
> >  	if (pv_eoi_test_and_clr_pending(vcpu))
> >  		return;
> >  	vector = apic_set_eoi(apic);
> 
> [Severity: High]
> This is a pre-existing issue, but if pv_eoi_test_and_clr_pending() encounters
> a memory access error, does it skip clearing the pending bit?

Yes, that's what this patch is fixing.

> Looking at pv_eoi_test_and_clr_pending():
> 
> arch/x86/kvm/lapic.c:pv_eoi_test_and_clr_pending() {
>     if (pv_eoi_get_user(vcpu, &val) < 0)
>         return false;
>     ...
>     __clear_bit(KVM_APIC_PV_EOI_PENDING, &vcpu->arch.apic_attention);
>     ...
> }
> 
> If a guest provides an invalid memory address, pv_eoi_test_and_clr_pending()
> returns false early without clearing KVM_APIC_PV_EOI_PENDING.
> 
> Will this cause apic_sync_pv_eoi_from_guest() to falsely assume the guest
> performed an EOI and proceed to call apic_set_eoi() below?
> 
> Since the pending bit remains set, will KVM continue calling apic_set_eoi()
> on every subsequent VM exit, erroneously clearing valid in-service interrupts
> and making the VM completely unresponsive?

Yes, but the alternative is to "falsely assume" the guest did NOT perform an EOI,
in which case in-service IRQs will never be cleared, and the guest be completely
unresponsive because it will stop receiving IRQs.

I.e. the problem isn't KVM's behavior, it's that the guest is hosed if the PV EOI
page goes missing.
