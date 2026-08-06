Received: from out-181.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42143848F
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012174; cv=none; b=DRTQ8TxlP/qt9uzw8ByyccfeaAzLmGN2R3dTxyCn9TR1boZh0lYIrFwUxSUwa2/WRU5OvzuNuphDcaV9AMwkxWjZem1z+eXFKTWLnkfpTBtYMEZX+uRpEDmPoOVeRXncBJmAWC9a0JBykpTtb6DbbF3sXs6r0kySb91XkkXXx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012174; c=relaxed/simple;
	bh=NvBICakGyQH9sHFyfR7Q9JnnLoE+3m+jSLiUuDst1rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWwXaph60h2aLtNdWt0aRTBd4I2egwPePv+S8vACqI9U8ZwK3rjvbFeYiz8UnvQeoQkJ/OZyR335MQVVpEX816TT26pRuEci7O5T9lb960LosVwlw7drsw6sV2UEu9mEzoTiqj7bmGwNKQWk6dvY0QGWlw25LOYPO9RvYoFN3rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aou44YO/; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aou44YO/"
X-Gm-Message-State: AOJu0YwwxRU0j9nGzRj+MSECKlttSlE6UtWl6vHDNWEgE++tInMor8Xd
	V1RWOPTB6RnKsqELFpNo9Z2tew1cMIPm4sGlY1FGsZk2uBtDpg3IjwwrlCpKFApyA9rgpDD2Vi+
	bpM4gi+Qm/cBpXFWOHDzc/c+WX9V5uinFs9KvaCr1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786012170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gyHIAEcc7EYTchvF4v8OZJwBj28xxsDIlJxCAeS0PE=;
	b=aou44YO/0aB+uGJkarVppVanHbznwYIFm2ktEiSAZGkCwPtRcaTj20m8ACRksn+R1B9uYQ
	wjziQs246VoGYIjZVsKAS5nFv80BQnCxPvrBWIi6LYoPMI9KDUnSmEBaBZhk3g8nhGXgVs
	2+HStEM4SGH02nwIxOHWKQXNyaMt/tQ=
X-Received: by 2002:ac8:7d51:0:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-52cfbdba534mr16532461cf.2.1786012140284; Thu, 06 Aug 2026
 03:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806100256.371164-1-fuad.tabba@linux.dev> <20260806100256.371164-4-fuad.tabba@linux.dev>
 <20260806101600.207261F000E9@smtp.kernel.org>
In-Reply-To: <20260806101600.207261F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 6 Aug 2026 11:28:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxNyzw_t++nF66zocB2de5ZKwtAN4M9jj69VU457OEMFA@mail.gmail.com>
X-Gm-Features: AUfX_myF3cUgFTKnFOFo1bCqRsxQ978TfYpZmRtSvsYce4mJ1A2qgiTqTisJreM
Message-ID: <CA+EHjTxNyzw_t++nF66zocB2de5ZKwtAN4M9jj69VU457OEMFA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] KVM: arm64: vgic: Do not access the GICv5 CPU
 interface from EL1
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Thu, 6 Aug 2026 at 11:16, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing Context Synchronization Event (CSE) after writing to SYS=
_ICC_ICSR_EL1.

This runs on the guest-entry path, and the ERET into the guest is a
context synchronization event.

I really thought we've covered this in the review-prompts, I'll look
into this later...
/fuad

> --
>
> --- Patch [3]: [PATCH v1 3/4] KVM: arm64: vgic: Do not access the GICv5 C=
PU interface from EL1 ---
> commit 5b0cdbb37754741e9006b6abdf408b239ed6b887
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
>
> This commit fixes an issue where the GICv5 CPU interface was incorrectly
> accessed from EL1 on systems without FEAT_GCIE_LEGACY. It restricts GICv5
> access to VHE, similar to the existing GICv3 handling.
>
> > diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> > index 74bace10a22ed..df58c0042ed63 100644
> > --- a/arch/arm64/kvm/vgic/vgic.c
> > +++ b/arch/arm64/kvm/vgic/vgic.c
> > @@ -1042,11 +1042,15 @@ static void vgic_flush_lr_state(struct kvm_vcpu=
 *vcpu)
> >  static inline bool can_access_vgic_from_kernel(void)
> >  {
> >       /*
> > -      * GICv2 can always be accessed from the kernel because it is
> > -      * memory-mapped, and VHE systems can access GICv3 EL2 system
> > -      * registers.
> > +      * GICv3 and GICv5 drive the CPU interface through EL2 system
> > +      * registers, so only VHE reaches them from the kernel. GICv2 is
> > +      * memory-mapped and always reachable.
> >        */
> > -     return !static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif=
) || has_vhe();
> > +     if (kvm_vgic_global_state.type =3D=3D VGIC_V5 ||
> > +         static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
> > +             return has_vhe();
> > +
> > +     return true;
> >  }
>
> While reviewing the GICv5 access paths related to this change, I noticed =
a
> related issue in the GICv5 context restore path:
>
> arch/arm64/kvm/hyp/vgic-v5-sr.c:__vgic_v5_restore_state() {
>     write_sysreg_s(cpu_if->vgic_icsr, SYS_ICC_ICSR_EL1);
> }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this write to
> SYS_ICC_ICSR_EL1 require a subsequent isb() instruction?
>
> According to the ARM64 KVM architectural rules, any write to an ICC_*_EL1
> register (excluding ICC_PMR_EL1) must be immediately followed by an isb()
> as the very next instruction.
>
> Because __vgic_v5_restore_state() writes to SYS_ICC_ICSR_EL1 and then
> returns, the caller will execute subsequent instructions without a Contex=
t
> Synchronization Event. Could this leave the CPU operating with an
> architecturally undefined pipeline state during the vCPU switch?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806100256.37=
1164-1-fuad.tabba@linux.dev?part=3D3
