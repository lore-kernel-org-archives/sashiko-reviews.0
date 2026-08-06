Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DE3BED4F
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010770; cv=none; b=Mref4HsmkJQb/wvd/VMilnQ+i9Ekmyf9skU2tYOhRNMfT1WcMMZeT7kK5D0mpuVzo1mK2QtVFyfm+NYlTHL2UF8uqsRX+SfgEcm2Ms2wRSGv/1jnZCBr3UqdLFwi3XXQy45ccdzQ2FDJN2PzWmy2AX3XARQDHcbKD9hHEfbJEO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010770; c=relaxed/simple;
	bh=XOSMvSov/gybIroVgA8s3OFGnhhXTvOD0vM2ma4afZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcaynwYla79+VrN+QQj78BswV7Q4C9mXPJE8L4LXONsiS0DaVfNaS4rDkNDWnWzdCn32g0u7gRMCI+BHQ8JErdAoGsJmDcKfz+8/VaWYYipTVeIBj3N6fPDQT58LiYYb3z/fY8CSo9nvyBJmlSKlaiC2ACt0M1LIY3aPymI/Cis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ul9htfDp; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ul9htfDp"
X-Gm-Message-State: AOJu0YxrQUcUnuSVrXun/LVpPwjY4oNoRQg6l9ibAtbk7HZbzI5MUhcZ
	16jzLPI43M7FGE9c8HG4QJqgU2VKtx52W9OKhHfqODzc4iU1IGi7gNgWn3fK9GtCC1Lt62Lonm9
	xRfN/MHwicqSy1HkHcX1RYAnVxIOUa+mq/6ZBM4m+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786010766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sd7giFCK5weiS6KT5uQGxV3QgdzjIXS0/7bop55V9H4=;
	b=ul9htfDpUsxo4fxCSAjRMtu3D23l99WMThE1gV5h2u/EPxHMSdHylfJhMJ6HSUzfqxoA9+
	5HvXxMn7/VzO3wDcFgTGNVbOsU4cGT84YS87fun9am/cK3lM5fL8fNB0KAsakO9EFmSfud
	DzEWSIHB/0P3cNYCeSksf9XpS6DWJak=
X-Received: by 2002:a05:622a:8e0a:b0:50d:edb1:6bd1 with SMTP id
 d75a77b69052e-52cfea481f8mr12430341cf.13.1786010754010; Thu, 06 Aug 2026
 03:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612065925.755562-10-tabba@google.com> <20260612072456.0F4D01F000E9@smtp.kernel.org>
 <CA+EHjTyyDJsOEhcJnuxpyia5EU_GUck_GeQRP65n75S85f31cg@mail.gmail.com>
In-Reply-To: <CA+EHjTyyDJsOEhcJnuxpyia5EU_GUck_GeQRP65n75S85f31cg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 6 Aug 2026 11:05:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxiHyuw5EjWLha1OySm3xjRH6rbk41On+5V2+ig1FdCmg@mail.gmail.com>
X-Gm-Features: AUfX_my5TqgrY5exxH9RUtKLQTafBomnqBT8MbfzG7FPJfArZNcmpDyLX-8v0FE
Message-ID: <CA+EHjTxiHyuw5EjWLha1OySm3xjRH6rbk41On+5V2+ig1FdCmg@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
To: sashiko-reviews@lists.linux.dev, Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Hi folks,

On Fri, 12 Jun 2026 at 09:05, Fuad Tabba <tabba@google.com> wrote:
...
> > Pre-existing issues:
> > - [Critical] The GICv5 equivalents of the VGIC save/restore hypercalls =
(`handle___vgic_v5_save_apr` and `handle___vgic_v5_restore_vmcr_apr`) direc=
tly dereference host-provided pointers without validation, allowing a compl=
ete bypass of pKVM isolation.
...
> > > +     } else {
> > > +             __vgic_v3_save_aprs(&host_vcpu->arch.vgic_cpu.vgic_v3);
> > > +     }
> > >  }
> >
> > [Severity: Critical]
> > This is a pre-existing issue, but while this patch addresses the VGIC v=
3 host
> > pointer dereference bypass by using get_host_hyp_vcpus_from_vgic_v3_cpu=
_if(),
> > does the same pKVM isolation bypass exist in the GICv5 equivalents?
>
> GICv5 is not supported in protected mode. vgic-v5.c:62-64 skips
> GICv5 registration entirely when is_protected_kvm_enabled(), so no
> GICv5-based guest can be created under pKVM. The host never reaches
> these hypercalls through any legitimate code path.

I was wrong here.

skip_v5 only stops the host's own KVM from registering a GICv5 vgic,
so the host can still call __vgic_v5_save_apr and
__vgic_v5_restore_vmcr_apr.

vgic_model has the same gap. EL2 copies it out of the host's `struct
kvm` without validating it, so a host can steer the world switch into
the GICv5 registers, which are UNDEFINED without FEAT_GCIE. That takes
an UNDEF at EL2 and panics the hypervisor. I reproduced it under QEMU
on a GICv3 machine.

I have sent a series for both [1]. The wider point is that "pKVM does
not support GICv5" does not imply "EL2 cannot get there", which is
what I had assumed, so it might be worth another look at the newer
hypercalls in Sascha's IRS series on that basis [2].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260806100256.371164-1-fuad.tabba@linux.de=
v/
[2] https://lore.kernel.org/all/20260724104819.1296803-1-sascha.bischoff@ar=
m.com/


>
> >
> > Looking at handle___vgic_v5_save_apr() and handle___vgic_v5_restore_vmc=
r_apr()
> > in arch/arm64/kvm/hyp/nvhe/hyp-main.c:
> >
> > handle___vgic_v5_save_apr(struct kvm_cpu_context *host_ctxt) {
> >     DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
> >     __vgic_v5_save_apr(kern_hyp_va(cpu_if));
> > }
> >
> > These handlers appear to take a cpu_if pointer directly from the untrus=
ted
> > host context and apply kern_hyp_va() without validation. Could a malici=
ous
> > host provide an address that translates to an arbitrary EL2-private mem=
ory
> > location, granting an arbitrary write or read primitive when
> > __vgic_v5_save_apr() or __vgic_v5_restore_vmcr_apr() is invoked?
> >
> > [Severity: Critical]
> > This is also a pre-existing issue, but does a similar arbitrary memory
> > corruption primitive exist in handle___kvm_adjust_pc()?
>
> Yes, pre-existing. It is addressed later in this series by
> "Prevent host PC adjustments for protected vCPUs" (patch 10/11).
>
> Cheers,
> /fuad
>
> >
> > Looking at handle___kvm_adjust_pc() in arch/arm64/kvm/hyp/nvhe/hyp-main=
.c:
> >
> > static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt) {
> >     DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> >     __kvm_adjust_pc(kern_hyp_va(vcpu));
> > }
> >
> > And __kvm_adjust_pc() in arch/arm64/kvm/hyp/exception.c:
> >
> > void __kvm_adjust_pc(struct kvm_vcpu *vcpu) {
> >     if (vcpu_get_flag(vcpu, PENDING_EXCEPTION)) {
> >         kvm_inject_exception(vcpu);
> >         vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> >         vcpu_clear_flag(vcpu, EXCEPT_MASK);
> >     }
> >     ...
> > }
> >
> > It seems the host-provided vcpu pointer is converted via kern_hyp_va()
> > without the __get_host_hyp_vcpus() validation barrier. Could a maliciou=
s
> > host inject a pointer that translates into EL2-private memory (like
> > hypervisor page tables) and set the PENDING_EXCEPTION bit, forcing
> > __kvm_adjust_pc() to write exception vector addresses and clear flags a=
t
> > specific offsets within the target structure?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612065925.=
755562-1-tabba@google.com?part=3D9
