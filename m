Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363371;
	b=oIvU8xmMs2DiHgd0q8bft5am2fgz1bP1pv1Gr4qm8hsRncgF2ik0zmNpwRSm8IjpPs7e
	 31TCY4pdmRFuzHCSeKceRlpaRheXHvwZW1O+pQKAWmhnlUewpvGeXF35j1Iy8k7Ba3kwW
	 QOZGgWahOZNDu4Dnm+DVCL658vKLsQ1dlwU4cK6ShoBYqBTfj+sK3UqPHtKpRDw4TsAp7
	 3gk0iV7Um9I3iv9nAvN9MIMqhrTHM6AHkbM5I8B+TIyAGlO+ANlfAU6Zyx6h/BPBWdGJZ
	 FNrsg6vLWaKEnWAZ3FMt2eN2+HnO3jHWXBdcWW22LT5G7yejq/9Q/5xFCuukmz1JpZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363371;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=O+fMJYNqO1rC4JyvXyWYRoIcA05TzHcyXa930/m//oM=;
	b=eL5bJAxTnAqe0QwFw1Vs1gblIKCfna3FsavcP4UfHEUXXAC3ef5v9t2qUGjvLoyF4+hP
	 C3r1Yb6k/NnVAQcKnyh7BYvkDNKpviMIvSzTO2LoJdMmC2BCp4wXnQlo0nIWF4NuHcU0l
	 HWWDL0PiK5aDZa3KgYNNhONaFek859qO+ZfJhCcL785/P9+YSA7ouN0hrCjjwX052aB8R
	 OHU3ZXxZF9F3dsgbWNg9x87Nixf83USkPlQcrP+OqwbpOVlz3T9CBR2Uw0PJDA3Y9hl9P
	 KmqqHT4PJXUnSbUIFm2Tkh1Wdm+8D696yQdtSLw7mllH3zS6eUG/2PXckPZ9x58IGCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VttTaChB;
	arc=none smtp.remote-ip=95.215.58.74
Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05F606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 12:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E05F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VttTaChB
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ATotVCKzOa5daMcaBxaevqyz3J/MtuzsEl1bHk96I5s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793363367; v=1; x=1793968167;
 b=VttTaChBDk3qmwZvyMhIcORAJJz9MaCcYF+FBsr/sbj2CLYmjhdbgMQqFYAQCTFcffvGUwqO
 G6iYZwXH1pwVmXKp244wathp/jjG/CQhgMb6db5c02C6Up4DnkXIEwY+90+V8IKSr/lV2PD82t9
 IS8Ajp/K8IS1CBWOH4aVQQ44=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8437a443a1e65823;
	Fri, 30 Oct 2026 12:29:27 +0000
X-Mizu-Trace-ID: 8437a443a1e65823
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7718e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 05:29:27 -0700 (PDT)
X-Gm-Message-State: AFq9FYJg1uPWwR87LmQZ1TKDOcKOMPSJ9kXAicPyEllMW42fsjxYD/Uu
	J/t9ZalNBfPp38UaB0vnk1zVdvJKf9AXsukmOrQkgDPNJGjlwDUvOH7g0/6XQYMGF/wKajh4WnB
	nG1w+gisWqQrGzdSWf+oSB107odV3sX+EOGWr1SVT
X-Received: by 2002:ac2:550e:0:b0:5bf:d226:862e with SMTP id
 2adb3069b0e04-5bfd22686c8mr228723e87.2.1793363366455; Fri, 30 Oct 2026
 05:29:26 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030105139.3543230-1-fuad.tabba@linux.dev>
 <sashiko-outbox-190923@kernel.org> <20261030120837.3752397-1-fuad.tabba@linux.dev>
 <sashiko-outbox-191007@kernel.org>
In-Reply-To: <sashiko-outbox-191007@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 30 Oct 2026 12:28:50 +0000
X-Gmail-Original-Message-ID: <CA+EHjTww0xwZpCNO2O2zd08T_y23KffA1CsMCCZ2cfjtE_rFGA@mail.gmail.com>
X-Gm-Features: AclHuK-DSjx38bmEPygqQZV-47VGAYcpoaYBLREG938yPZ9XUE_xpDZ28v470Ek
Message-ID: <CA+EHjTww0xwZpCNO2O2zd08T_y23KffA1CsMCCZ2cfjtE_rFGA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Size nested stage-2 MMUs by the NV
 PARange cap
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 12:24, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] KVM: arm64: nv: missing base changes in kvm_get_pa_bits() and reply changelog
> --
>
> commit f427a1e42f6e3dddeb1163b0cde7acfb4c92d8ef
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: nv: Size nested stage-2 MMUs by the NV PARange cap
>
> This commit replaces get_kvm_ipa_limit() with kvm_get_pa_bits(kvm) in
> kvm_handle_guest_abort() when checking whether a translation fault IPA
> exceeds the guest's PARange.
>
> >     KVM: arm64: nv: Size nested stage-2 MMUs by the NV PARange cap
> >
> >     On Fri, 30 Oct 2026 11:09:43 +0000, sashiko-bot@kernel.org wrote:
> >     [...]
> >     > Because fault_ipa < BIT_ULL(get_kvm_ipa_limit()) (52) and
> >     > fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr)) (48), won't
> >     > kvm_handle_guest_abort() fall through to kvm_inject_sea() and inject a
> >     > synchronous external abort into the guest instead of calling
> >     > kvm_inject_size_fault() to inject a stage-1 level 0 address size fault?
> >
> >     Yes. I'll fold this into v2:
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1db10d8d6db73..596b2b6ebbdf0 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -2440,8 +2440,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >       is_iabt = esr_trap_is_iabt(esr);
> >
> >       if (esr_fsc_is_translation_fault(esr)) {
> > -             /* Beyond sanitised PARange (which is the IPA limit) */
> > -             if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
> > +             /* Beyond sanitised PARange */
> > +             if (fault_ipa >= BIT_ULL(kvm_get_pa_bits(kvm))) {
> >                       kvm_inject_size_fault(vcpu);
> >                       return 1;
> >               }
>
> [Severity: Medium]
> Was the incremental reply diff applied directly instead of being folded into
> the base patch?

Patience, young grasshopper... this will be folded into the base
patch, see above.

/fuad
