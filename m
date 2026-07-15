Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D9422533
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107244; cv=none; b=p5aCrcGGhVhMlHLmVXnVJBi2pGdGRx3lzWs/D03dGMLU01w55yS6WhMq3x4HX9GFJA0DcIpOyzJfEg6aftRJlwlRQq8RFd5Fcp3zQ44Rt63aYwbcnZhv1TVP5TXo87uUOK00GP7+nej7up6hz54MTzpvWJmd59AtNAd3JLiOUZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107244; c=relaxed/simple;
	bh=0aF2tXqVSZJ+KzEI8hvUhfrB4O8Tj5s5ExsezUdork0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icKjly9H5+mlFfw8llbbdI/YPEp4ghM8DMlncc0jQbvqQ7dbdzaoNzgkQKRdCycKaD0ZDPDxXz5le0IrXt8T6wgJWyDytilQhcnqih9fMOvLrjZUgo18j3ek2hOmaOqZvWrSyzYdPfVVGzmcBQbdaXWp75n9AqAoCokS+Ze0wQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o/X7pNzh; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o/X7pNzh"
X-Gm-Message-State: AOJu0YzdUrR+FBiFBNtZqotbzFvw3JVIM8hqBGENEiegH/j0Qz+KVkq+
	Dm9FJDWQ3H03UJabdJcVE0Me9wuc6s2jKfOowa8viJ7K8gIwZsKfUmpBdYUKILaCk+0d69HU9UO
	/553KYpuhqR0Bj1kft66VIoqTVlgG14N4NZB05CjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784107241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+w7C3+NagRQkTxTKtZanj6iawsWBCIYUN0QzC15AWME=;
	b=o/X7pNzhQzm5mMb6/mvT+8W+ZXb7jkn2tGLpnzAIQOsffmVr1NZ4P405OQAXEzZ7Al4dm/
	VobPhS1Q+P17BONaFfl/ItM4d3ShLclH4n0q6hDDmB1t/KuhI4njJREkBCN/jViuwqGZDj
	VNsmg9D2JZG0nmsboFFDEl6x5tL4yBE=
X-Received: by 2002:ac8:5cc6:0:b0:51b:fd5e:e81a with SMTP id
 d75a77b69052e-51d7c6a88e1mr24424431cf.20.1784107237702; Wed, 15 Jul 2026
 02:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715081238.1891918-1-fuad.tabba@linux.dev>
 <20260715081238.1891918-9-fuad.tabba@linux.dev> <20260715083412.433141F000E9@smtp.kernel.org>
In-Reply-To: <20260715083412.433141F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 10:20:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyFH3EeVCVg14ow=vGYX9hcvcnY_PpaC3+bYCOXm4bcYg@mail.gmail.com>
X-Gm-Features: AUfX_mwHNUGF999MIZRmMiosO-SWRhA13pmJXgmKk3ndgyMw0ua1XEUTQ8EyUHc
Message-ID: <CA+EHjTyFH3EeVCVg14ow=vGYX9hcvcnY_PpaC3+bYCOXm4bcYg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Wed, 15 Jul 2026 at 09:34, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Removal of hcr_el2 synchronization breaks virtual SError injecti=
on, causing an infinite loop of virtual SErrors.
> - [High] Asynchronous host-side modifications to vCPU system registers (e=
.g., PMU overflow updating PMOVSSET_EL0) are permanently lost due to lazy s=
tate sync.
>
> Pre-existing issues:
> - [Critical] The hypervisor unconditionally overwrites a protected guest'=
s register context with the untrusted host context on every entry, and leak=
s it back to the host on exit.

https://lore.kernel.org/all/CA+EHjTxiyUSJqRcadSCOmR+tELSsBiGaTYH9xxXh-g-xyu=
HZdA@mail.gmail.com/

/fuad
> --
>
> --- Patch [8]: [PATCH v6 8/8] KVM: arm64: Implement lazy vCPU state sync =
for non-protected guests ---
> commit 89d46644a5cb6e03eee6a1ef5d530db27a9d6cdb
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: KVM: arm64: Implement lazy vCPU state sync for non-protected gue=
sts
>
> This commit defers the register context copy for non-protected guests bet=
ween
> the host and hypervisor. The state is only flushed to the hypervisor if i=
t is
> marked dirty by the host on entry, and copied back to the host on exit on=
ly
> when needed. Protected guests continue to have their state copied
> unconditionally.
>
> > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.=
c
> > index 54aedf93c78b6..29108e5c0206e 100644
> > --- a/arch/arm64/kvm/handle_exit.c
> > +++ b/arch/arm64/kvm/handle_exit.c
> [ ... ]
> > @@ -486,9 +486,32 @@ int handle_exit(struct kvm_vcpu *vcpu, int excepti=
on_index)
> >       }
> >  }
> >
> > +static void handle_exit_pkvm_state(struct kvm_vcpu *vcpu, int exceptio=
n_index)
> > +{
> > +     int exception_code =3D ARM_EXCEPTION_CODE(exception_index);
> [ ... ]
> > +     if (exception_code =3D=3D ARM_EXCEPTION_TRAP ||
> > +         exception_code =3D=3D ARM_EXCEPTION_EL1_SERROR ||
> > +         ARM_SERROR_PENDING(exception_index)) {
> > +             kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > +             vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > +     } else {
> > +             vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>
> [Severity: High]
> Does clearing the dirty flag on IRQ exits result in dropping asynchronous
> host modifications to vCPU system registers?
>
> When an external IRQ triggers during guest execution, handle_exit_pkvm_st=
ate()
> clears the dirty flag. If the host's IRQ handler asynchronously updates t=
he
> host's vcpu->arch.ctxt (for example, kvm_pmu_perf_overflow() setting
> PMOVSSET_EL0), flush_hyp_vcpu() will skip syncing this updated state on t=
he
> next guest entry.
>
> When the guest later traps, handle_exit_pkvm_state() calls
> __pkvm_vcpu_sync_state(), which overwrites the host's updated context wit=
h the
> hypervisor's stale context, permanently erasing the asynchronous update.
>
> > +     }
> > +}
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 2db56146ec493..4a8445b636e60 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> [ ... ]
> > @@ -172,7 +214,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *h=
yp_vcpu)
> >       fpsimd_sve_flush();
> >       flush_debug_state(hyp_vcpu);
> >
> > -     hyp_vcpu->vcpu.arch.ctxt        =3D host_vcpu->arch.ctxt;
> > +     /*
> > +      * If we deal with a non-protected guest and the state is potenti=
ally
> > +      * dirty (from a host perspective), copy the state back into the =
hyp
> > +      * vcpu.
> > +      */
> > +     if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > +             if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
> > +                     flush_hyp_vcpu_state(hyp_vcpu);
> > +     } else {
> > +             hyp_vcpu->vcpu.arch.ctxt =3D host_vcpu->arch.ctxt;
>
> [Severity: Critical]
> This is a pre-existing issue, but does this unconditionally overwrite the
> protected guest's register context with the untrusted host context?
>
> In flush_hyp_vcpu(), this line allows the host EL1 to arbitrarily modify =
the
> protected guest's general purpose and system registers, bypassing pKVM's =
guest
> confidentiality and integrity guarantees.
>
> > +     }
> >
> >       /* __hyp_running_vcpu must be NULL in a guest context. */
> >       hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu =3D NULL;
> [ ... ]
> > @@ -203,9 +255,13 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hy=
p_vcpu)
> >       fpsimd_sve_sync(&hyp_vcpu->vcpu);
> >       sync_debug_state(hyp_vcpu);
> >
> > -     host_vcpu->arch.ctxt            =3D hyp_vcpu->vcpu.arch.ctxt;
> > -
> > -     host_vcpu->arch.hcr_el2         =3D hyp_vcpu->vcpu.arch.hcr_el2;
>
> [Severity: High]
> Does removing the synchronization of hcr_el2 break virtual SError injecti=
on and
> cause an infinite loop of virtual SErrors?
>
> When the host injects a virtual SError by setting HCR_VSE in its local
> hcr_el2 copy, the guest takes the SError, and the hardware clears HCR_VSE=
 in
> the hypervisor's active hcr_el2.
>
> Without this line, the hypervisor's cleared state is never synchronized b=
ack
> to the host. The host's copy permanently retains HCR_VSE=3D1, and on ever=
y
> subsequent guest entry, flush_hyp_vcpu() will copy HCR_VSE=3D1 back to th=
e
> hypervisor, endlessly re-injecting the SError.
>
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > +             host_vcpu->arch.ctxt =3D hyp_vcpu->vcpu.arch.ctxt;
>
> [Severity: Critical]
> This is a pre-existing issue, but does this leak the protected guest's
> registers back to the untrusted host?
>
> Similar to the issue in flush_hyp_vcpu(), this line in sync_hyp_vcpu() co=
pies
> the protected guest's register context to the untrusted host on exit, whi=
ch
> violates pKVM's threat model guarantees.
>
> > +     } else {
> > +             /* Keep PC (tracepoint) and PSTATE (vcpu_mode_is_bad_32bi=
t) current. */
> > +             host_vcpu->arch.ctxt.regs.pc =3D hyp_vcpu->vcpu.arch.ctxt=
.regs.pc;
> > +             host_vcpu->arch.ctxt.regs.pstate =3D hyp_vcpu->vcpu.arch.=
ctxt.regs.pstate;
> > +     }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715081238.18=
91918-1-fuad.tabba@linux.dev?part=3D8
