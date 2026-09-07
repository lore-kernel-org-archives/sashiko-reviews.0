Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A4835B136
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772575; cv=none; b=UICFKDQtf4eSGU0QTcj3N8e7UfTqiIsMdR1b6IwixeVThsdUI9KH1thRFhM4WiQMG11LeQG2T1cXawv2BSVquh0R8JyGHY9PVeFkHiJ98ynfZhn1ASl305Hj2z9SSp0S7l+V5IFMjH5igo8W1T2PjfF76dKeHqdqsgV7RYRISRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772575; c=relaxed/simple;
	bh=uSJgBdQELyBQurw+6HjuxzlSuZmOfDQtEDm3tfBvO4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bb/WEkfWxrV16WQLCyY5WbxS8MSD5uGNe6ua41u91oioh5sIeitP1qyYHjqIIsxnG1QtFugqFUwyFWGFJZd6JsYtuYcEnccA8B3J5PlKFi7rqKtXiDrjk53oCHGw/IjyaBkH91jeFrINVk1QPZ58Lkr0q+VbLHNQoiMQGt9H1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WdD8rE66; arc=none smtp.client-ip=91.218.175.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WdD8rE66"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uSJgBdQELyBQurw+6HjuxzlSuZmOfDQtEDm3tfBvO4E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788772571; v=1; x=1789377371;
 b=WdD8rE667Xhp27QwZtI4fcsR8P1onD/awhg9t0rx07d9TY4KiRJVkIIqzH1bg0dIh8znJ2WR
 dhJewRVzGQhXiZaz8XMxcQKMWS0ZOXGM8nqTmR+rFqhUsTTepKBxtS5t0qIhTCuZHnxZOfUuh5v
 XSdsngmiG6iIkCTlVxWCPSiM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7cc189572d91ba6d;
	Mon, 07 Sep 2026 09:16:11 +0000
X-Mizu-Trace-ID: 7cc189572d91ba6d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so7332e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 02:16:07 -0700 (PDT)
X-Gm-Message-State: AFuF++mUnJV77EWi2cMDbcjma9Zm7/j1maGqbzWVIbDSKl1Ay8Jk/HDl
	CetvUwk+BtkwMeH/P258uj5XvDZ5VAi9nKPh4YSyk/gmG+BjpjZR4oH8yawvG48QbxO6C7ZlFFZ
	hEssfZJrWWR0ANu4EdvWQVKI1sXhrRaVTt9igoM6Q
X-Received: by 2002:a05:6512:2347:b0:5b4:9dba:4ecf with SMTP id
 2adb3069b0e04-5b74d405b3dmr139089e87.13.1788772566789; Mon, 07 Sep 2026
 02:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-13-fuad.tabba@linux.dev> <20260907072608.31AFB1F00A3A@smtp.kernel.org>
In-Reply-To: <20260907072608.31AFB1F00A3A@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 10:15:30 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzUKpPVb-u6pD9FT6GqBiDzOJvEUpNteK5L3EG5oFky-g@mail.gmail.com>
X-Gm-Features: AcwNN1WaVL035i4cZuvqKOC7lQooxqEaUlcWlp2T34oQIpwU9dyHFc8zHQjyrmA
Message-ID: <CA+EHjTzUKpPVb-u6pD9FT6GqBiDzOJvEUpNteK5L3EG5oFky-g@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] KVM: arm64: Add per-EC entry/exit state
 marshalling for protected guests
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sept 2026 at 08:26, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Dead fallback code due to EL2 WARN_ON panic semantics

Yes: a WARN_ON() at EL2 is a hyp_panic(), and _I_ taught you that one.
Now the student has become the master. I'll drop the fallback in v3.

/fuad

> --
>
> commit e6a23fd729ce9b1a6ab9652bdfcd06dd180d6ce8
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: Add per-EC entry/exit state marshalling for protected guests
>
> This commit introduces per-EC entry and exit state marshalling for protec=
ted
> guests. It routes protected guests through specific entry and exit handle=
rs
> to copy only the necessary context rather than the entire context between=
 the
> host and the hyp vCPU.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 1a3f23e90e563..2015bf5ce6287 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>
> [ ... ]
>
> > @@ -34,13 +38,342 @@ void __kvm_hyp_host_forward_smc(struct kvm_cpu_con=
text *host_ctxt);
>
> [ ... ]
>
> > +static void handle_pvm_entry_hvc64(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     u64 ret =3D READ_ONCE(hyp_vcpu->host_vcpu->arch.ctxt.regs.regs[0]=
);
> > +     u32 psci_fn =3D smccc_get_function(&hyp_vcpu->vcpu);
> > +
> > +     switch (psci_fn) {
> > +     case PSCI_0_2_FN_CPU_ON:
> > +     case PSCI_0_2_FN64_CPU_ON:
> > +             /*
> > +              * Roll back a CPU_ON the host failed, unless the target
> > +              * already reached ON: it is running, and the guest sees
> > +              * SUCCESS.
> > +              */
> > +             if (ret !=3D PSCI_RET_SUCCESS) {
> > +                     unsigned long cpu_id =3D smccc_get_arg1(&hyp_vcpu=
->vcpu);
> > +                     struct pkvm_hyp_vcpu *target_vcpu;
> > +                     struct pkvm_hyp_vm *hyp_vm;
> > +                     int prev;
> > +
> > +                     hyp_vm =3D pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > +                     target_vcpu =3D pkvm_mpidr_to_hyp_vcpu(hyp_vm, cp=
u_id);
> > +
> > +                     /*
> > +                      * pvm_psci_vcpu_on() resolved this MPIDR and vcp=
us[]
> > +                      * entries are never removed, so the lookup canno=
t miss.
> > +                      */
> > +                     if (WARN_ON(!target_vcpu)) {
> > +                             ret =3D PSCI_RET_INTERNAL_FAILURE;
> > +                             break;
> > +                     }
>
> [Severity: Low]
> Is the fallback error handling unreachable here?
>
> At EL2 in nVHE/pKVM, WARN_ON evaluates to a BRK instruction which panics =
the
> hypervisor. There is no warn-and-continue behavior in this context. If
> target_vcpu evaluates to NULL, the hypervisor will panic immediately, lea=
ving
> the fallback assignment to PSCI_RET_INTERNAL_FAILURE and the break statem=
ent
> entirely dead code.
>
> > +
> > +                     prev =3D cmpxchg_relaxed(&target_vcpu->power_stat=
e,
> > +                                            PSCI_0_2_AFFINITY_LEVEL_ON=
_PENDING,
> > +                                            PSCI_0_2_AFFINITY_LEVEL_OF=
F);
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907070002.33=
33525-1-fuad.tabba@linux.dev?part=3D12
