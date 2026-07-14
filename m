Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4243DA39
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031518; cv=none; b=fmgyGEE5AeLmbZS36mO41KjweN4JQyOT1NEK/VE6Sluww8wYVaj7HWOCtKxHTW43eBzSCieePUJfGBo31+olJer2INGVhvFPaRQzx1afR6uwsCJgAEYwrx1OZ5eSytGHGDvqmX0AwyYmxhEuMTaT23Gm5NrvIWlWunrSeown4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031518; c=relaxed/simple;
	bh=K/4klNxMi+9OR8RYrEooWyIOqMFa+1K+RRGPzJ/nQf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBJNnvBSmwkPp+YDATYUAW2Aqe9UfJJsUl/xlGzvEyNy+ew+n/qRW1kA3G6gLO+RPbxYheVfxa9bC+V//Ne5cf9i0BwXvvmEISZ9o5sAMwU0UWnpn8L0uO3TahAgjLtyQ5n/zUaFNTnGfZE6dvIU/mxH+WOuA8MCoQIDdXtz0iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bG7/KiFg; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bG7/KiFg"
X-Gm-Message-State: AOJu0Yyzi9xPGzX2tO52kgQD8zzUU65WaXngcN0y7QvZ+qblmOp3MNGV
	5dzk3/xLC6dP/X/0Ax7ifixrWMutWXKZIktVVfG8HpoVW2RZs8+39Rljdz3EZNRcWd52XqT9Ds1
	eA6k2dp22HLgHSx+JIxQGASgDLEcRfbzn2/Y4/1Ko
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784031514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLgH5rJkGlfpF3a9F6yG0sGBjFkWSWDbvdJBPcSZDXM=;
	b=bG7/KiFgsQ2SQ5uu+McKjOQ/cAoYzq8S6sU2E7cSgMjER+1bk35QzwqTLg7SZiHvm7IIXU
	2txa2dWsnj4jaMtU+IDKFvzHnCwDG1tRxcu5s+jaeiSuoJe6SjyhH+brbpFJ78rErfh/za
	aNX9pDDkEZN7qTiNQY3UT+o/F31iC6U=
X-Received: by 2002:a05:622a:5c12:b0:51c:7a8b:c3ff with SMTP id
 d75a77b69052e-51d7bdb83edmr14021141cf.24.1784031486784; Tue, 14 Jul 2026
 05:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714101601.4142645-1-fuad.tabba@linux.dev>
 <20260714101601.4142645-7-fuad.tabba@linux.dev> <20260714115332.1B2161F000E9@smtp.kernel.org>
In-Reply-To: <20260714115332.1B2161F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 13:17:29 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyGULmVCgyoya3bXG4gRj0OYFE1gnJLhNE6kvCrZFtXyQ@mail.gmail.com>
X-Gm-Features: AUfX_myS5KUEwY9h0WY2nIF-xAnJOjibXd2sHjVydJnzqI-M53lzmp1FGIi_wAk
Message-ID: <CA+EHjTyGULmVCgyoya3bXG4gRj0OYFE1gnJLhNE6kvCrZFtXyQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Tue, 14 Jul 2026 at 12:53, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] handle___vgic_v3_save_aprs erroneously overwrites the host's vgi=
c_vmcr with a stale EL2 value.

__vgic_v3_save_aprs()  reads only AP0R/AP1R, so the copied  vgic_vmcr
is the host's own value from the prior  restore_vmcr_aprs: redundant,
not stale.

> Pre-existing issues:
> - [Critical] Incomplete fix leaves identical hypervisor memory corruption=
 vulnerability in GICv5 hypercalls.

GICv5 is not supported under pKVM (vgic_v5_probe  ->  skip_v5), so
those handlers are unreachable in protected mode.

> - [Critical] The `handle___kvm_adjust_pc` hypercall blindly dereferences =
a host-provided `vcpu` pointer via `kern_hyp_va()` without validation.

Pre-existing upstream code, untouched by this series, so it's out of
scope here; the pointer validation is being addressed separately.

/fuad

> --
>
> --- Patch [6]: [PATCH v5 6/8] KVM: arm64: Minimise EL2's exposure of host=
 VGIC state during world switch ---
> commit bad346f74febb306b17aa647c2da5c6747345fe8
> Author: Marc Zyngier <maz@kernel.org>
>
> KVM: arm64: Minimise EL2's exposure of host VGIC state during world switc=
h
>
> The host passes a vgic_v3_cpu_if pointer to the __vgic_v3_save_aprs and
> __vgic_v3_restore_vmcr_aprs hypercalls, which EL2 dereferences wholesale.
> This patch copies only vgic_vmcr and the active priority registers betwee=
n
> EL2's hyp-side state and the host vCPU to minimise exposure.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 45d717889f6ea..f3233ee343a39 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> [ ... ]
> > @@ -508,16 +520,63 @@ static void handle___vgic_v3_init_lrs(struct kvm_=
cpu_context *host_ctxt)
> >
> >  static void handle___vgic_v3_save_aprs(struct kvm_cpu_context *host_ct=
xt)
> >  {
> > -     DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
> > +     struct pkvm_hyp_vcpu *hyp_vcpu;
> > +     struct kvm_vcpu *host_vcpu;
> >
> > -     __vgic_v3_save_aprs(kern_hyp_va(cpu_if));
> > +     host_vcpu =3D get_host_hyp_vcpus_from_vgic_v3_cpu_if(host_ctxt, 1=
,
> > +                                                        &hyp_vcpu);
> > +     if (!host_vcpu)
> > +             return;
> > +
> > +     if (unlikely(hyp_vcpu)) {
> > +             struct vgic_v3_cpu_if *hyp_cpu_if, *host_cpu_if;
> > +             int i;
> > +
> > +             hyp_cpu_if =3D &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
> > +             __vgic_v3_save_aprs(hyp_cpu_if);
> > +
> > +             host_cpu_if =3D &host_vcpu->arch.vgic_cpu.vgic_v3;
> > +             host_cpu_if->vgic_vmcr =3D hyp_cpu_if->vgic_vmcr;
>
> [Severity: High]
> Does this overwrite the host's vgic_vmcr with a stale EL2 value?
>
> When the guest performs an MMIO write to the GICv2 VMCR (emulated on a GI=
Cv3
> host), the trap is handled at EL1, updating
> host_vcpu->arch.vgic_cpu.vgic_v3.vgic_vmcr.
>
> Later, if the vCPU is preempted or userspace schedules out,
> __vgic_v3_save_aprs is invoked. Because __vgic_v3_save_aprs() does not re=
ad
> VMCR from hardware, hyp_cpu_if->vgic_vmcr contains the stale value from t=
he
> previous guest exit.
>
> This would silently clobber and destroy the EL1's MMIO emulation updates.
>
> [ ... ]
>
> This is a pre-existing issue, but I noticed a similar pattern in
> handle___kvm_adjust_pc() in the same file:
>
> arch/arm64/kvm/hyp/nvhe/hyp-main.c:handle___kvm_adjust_pc() {
>         ...
>         __kvm_adjust_pc(kern_hyp_va(vcpu));
> }
>
> [Severity: Critical]
> Could this allow an EL1 host to corrupt hypervisor memory?
>
> An EL1 host can call the __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc hypercall
> and provide an arbitrary TTBR1 pointer. EL2's handle___kvm_adjust_pc()
> applies kern_hyp_va() without bounds-checking or validation.
>
> When __kvm_adjust_pc() is executed:
>
> arch/arm64/kvm/hyp/exception.c:__kvm_adjust_pc() {
>         if (vcpu_get_flag(vcpu, PENDING_EXCEPTION)) {
>         ...
>
> This dereferences the unvalidated pointer to read flags and modify memory=
,
> giving EL1 the ability to increment 64-bit values in EL2 memory.
>
>
> This is also a pre-existing issue, but a similar pattern remains in the
> GICv5 counterparts:
>
> arch/arm64/kvm/hyp/nvhe/hyp-main.c:handle___vgic_v5_save_apr() {
>         ...
>         __vgic_v5_save_apr(kern_hyp_va(cpu_if));
> }
>
> arch/arm64/kvm/hyp/nvhe/hyp-main.c:handle___vgic_v5_restore_vmcr_apr() {
>         ...
>         __vgic_v5_restore_vmcr_apr(kern_hyp_va(cpu_if));
> }
>
> [Severity: Critical]
> Does this leave an identical memory corruption regression?
>
> An EL1 host can call these hypercalls with an arbitrary TTBR1 pointer,
> which is directly dereferenced without validation, leading to arbitrary
> memory read/write against EL2.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714101601.41=
42645-1-fuad.tabba@linux.dev?part=3D6
