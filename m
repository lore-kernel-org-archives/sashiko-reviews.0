Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72E93DCD8D
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459086; cv=none; b=blPU+X1k3HzbOlSr999pxniFnTepDP0uS4Oy8rVHShxmkkCALgpNKuSYppu8R3fErSdh4dZGWNwG9lRjgF30csYFh7qIR8hwnIR4JeH7wSFqBfdRsAnGBU+EcTCd08Ndm28CP/svodCGmXZ6o8rbzoG8dKK8uEIqbxcI5ydbKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459086; c=relaxed/simple;
	bh=OEc9yOg8EqWibdPoyfbkDcO433W+IMrTKTKTmdxVcSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6VD+USP0zkoQjuS0I9E+1sCFKmWiafeHMgB5HtKTVzGIj38l1wCQjdN3ewzqNq8BHJnImcJo8RZ3R9CsrA54k81hUJFBGCJ39GIPmuRYszWX7a3s1frpodTQPng0n71vy096VnTBASLkgh0eelnJknM/p846ugcK1bJ59OodJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qSISMNeC; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qSISMNeC"
X-Gm-Message-State: AOJu0Yw5TcuDyMNc645zI0MhGIeaOU2pJoya3jDg9x07P2j6Kzn98mJv
	o1cKtC6bGVbmdMlUyOb5XpfMskCyJIqDC+aa58cWKhA31uBBo6jUxGmrnePBmJ1MIJZQeImHV7Q
	w5fy2gdIy9hcH2sT9F9N11y+8+UsDZb4f05sImlI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782459083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnSIankP1B496nsaCP1FChLJmI3HhObTJqr8uBliVQY=;
	b=qSISMNeCGa3J/A8Pbx98CsoMEbFcx+XZSYOrq9nPnkqS9eshDvoepjHWIpca1q6m0X/oCx
	+vUBP6v53hQjT2od23UHibEtGs11nyXgQa00MP/HeFWZm893/3QTd76QyC96HPIScem33r
	/XQnGwnMqWHTXHa2M1zXef/FJFxNBEw=
X-Received: by 2002:ac8:59c3:0:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-51a850c88f1mr1317711cf.17.1782459079675; Fri, 26 Jun 2026
 00:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626070408.3420953-1-fuad.tabba@linux.dev>
 <20260626070408.3420953-7-fuad.tabba@linux.dev> <20260626072444.F1EA31F000E9@smtp.kernel.org>
In-Reply-To: <20260626072444.F1EA31F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 26 Jun 2026 08:30:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz1F45Ws1W23ukNvCLLyE0SvHtTOeH75O12YYqn1xwkHQ@mail.gmail.com>
X-Gm-Features: AVVi8CcfDyHzCN27M_yVdIayGu23Hbu9MJ874ZKPAOam1wvFApxWUxOchKwxFqQ
Message-ID: <CA+EHjTz1F45Ws1W23ukNvCLLyE0SvHtTOeH75O12YYqn1xwkHQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Fri, 26 Jun 2026 at 08:24, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] The patch correctly fixes TOCTOU and arbitrary read/write vu=
lnerabilities for GICv3 by preventing EL2 from directly dereferencing host-=
provided pointers in `handle___vgic_v3_save_aprs` and `handle___vgic_v3_res=
tore_vmcr_aprs`. However, it leaves the exact same vulnerability unpatched =
in the GICv5 equivalents: `handle___vgic_v5_save_apr` and `handle___vgic_v5=
_restore_vmcr_apr`. These functions take a host-supplied pointer (`cpu_if`)=
, which they pass directly to the inner save/restore functions via `kern_hy=
p_va`. Because `kern_hyp_va` is idempotent for hypervisor linear-map pointe=
rs, the untrusted host (which is an adversary in the pKVM threat model) can=
 pass an arbitrary EL2 memory address. This allows the host to execute arbi=
trary memory reads and writes in the hypervisor (e.g., writing the value of=
 `SYS_ICH_APR_EL2` to arbitrary EL2 memory or reading arbitrary memory into=
 sysregs), completely bypassing pKVM isolation.
> --
>
> commit 815e460f9f860b3c06ec7eb259e1f2d75d196c33
> Author: Marc Zyngier <maz@kernel.org>
>
> KVM: arm64: Minimise EL2's exposure of host VGIC state during world switc=
h
>
> The host passes a vgic_v3_cpu_if pointer to the __vgic_v3_save_aprs and
> __vgic_v3_restore_vmcr_aprs hypercalls, which EL2 dereferences
> wholesale. That exposes the host's full VGIC emulation state to the
> hypervisor, against pKVM's isolation goals.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 45d717889f6ea..f3233ee343a39 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>
> [ ... ]
>
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
> > +             for (i =3D 0; i < ARRAY_SIZE(host_cpu_if->vgic_ap0r); i++=
) {
> > +                     host_cpu_if->vgic_ap0r[i] =3D hyp_cpu_if->vgic_ap=
0r[i];
> > +                     host_cpu_if->vgic_ap1r[i] =3D hyp_cpu_if->vgic_ap=
1r[i];
> > +             }
> > +     } else {
> > +             __vgic_v3_save_aprs(&host_vcpu->arch.vgic_cpu.vgic_v3);
> > +     }
> >  }
> >
> >  static void handle___vgic_v3_restore_vmcr_aprs(struct kvm_cpu_context =
*host_ctxt)
> >  {
> > -     DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
> > +     struct pkvm_hyp_vcpu *hyp_vcpu;
> > +     struct kvm_vcpu *host_vcpu;
> > +
> > +     host_vcpu =3D get_host_hyp_vcpus_from_vgic_v3_cpu_if(host_ctxt, 1=
,
> > +                                                        &hyp_vcpu);
> > +     if (!host_vcpu)
> > +             return;
> >
> > -     __vgic_v3_restore_vmcr_aprs(kern_hyp_va(cpu_if));
> > +     if (unlikely(hyp_vcpu)) {
> > +             struct vgic_v3_cpu_if *hyp_cpu_if, *host_cpu_if;
> > +             int i;
> > +
> > +             hyp_cpu_if =3D &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
> > +             host_cpu_if =3D &host_vcpu->arch.vgic_cpu.vgic_v3;
> > +
> > +             hyp_cpu_if->vgic_vmcr =3D host_cpu_if->vgic_vmcr;
> > +             /* Should be a one-off */
> > +             hyp_cpu_if->vgic_sre =3D (ICC_SRE_EL1_DIB |
> > +                                     ICC_SRE_EL1_DFB |
> > +                                     ICC_SRE_EL1_SRE);
> > +             for (i =3D 0; i < ARRAY_SIZE(host_cpu_if->vgic_ap0r); i++=
) {
> > +                     hyp_cpu_if->vgic_ap0r[i] =3D host_cpu_if->vgic_ap=
0r[i];
> > +                     hyp_cpu_if->vgic_ap1r[i] =3D host_cpu_if->vgic_ap=
1r[i];
> > +             }
> > +
> > +             __vgic_v3_restore_vmcr_aprs(hyp_cpu_if);
> > +     } else {
> > +             __vgic_v3_restore_vmcr_aprs(&host_vcpu->arch.vgic_cpu.vgi=
c_v3);
> > +     }
> >  }
>
> [Severity: Critical]
> This is a pre-existing issue, but while this patch correctly fixes the TO=
CTOU
> and arbitrary read/write vulnerabilities for GICv3, it seems the same pat=
tern
> remains unpatched in the GICv5 equivalents:
>
> arch/arm64/kvm/hyp/nvhe/hyp-main.c:handle___vgic_v5_save_apr() {
>         DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
>         __vgic_v5_save_apr(kern_hyp_va(cpu_if));
> }
>
> arch/arm64/kvm/hyp/nvhe/hyp-main.c:handle___vgic_v5_restore_vmcr_apr() {
>         DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
>         __vgic_v5_restore_vmcr_apr(kern_hyp_va(cpu_if));
> }
>
> Since kern_hyp_va() is idempotent for hypervisor linear-map pointers, cou=
ld
> the untrusted host (which is an adversary in the pKVM threat model) pass =
an
> arbitrary EL2 memory address here?
>
> Would this allow the host to execute arbitrary memory reads and writes in=
 the
> hypervisor (for example, writing the value of SYS_ICH_APR_EL2 to arbitrar=
y
> EL2 memory or reading arbitrary memory into sysregs), which might bypass =
pKVM
> isolation?

We covered this too [1]:

GICv5 is not supported in protected mode (is_protected_kvm_enabled()
gate in vgic-v5.c skips device registration entirely), so the v5
handlers are unreachable.


Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTxSZOwDBwVidTnjkNCzS-F9x=3DYXfZFQs0pB=
0OyJWcby7Q@mail.gmail.com/

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626070408.34=
20953-1-fuad.tabba@linux.dev?part=3D6
