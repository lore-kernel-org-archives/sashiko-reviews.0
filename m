Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805336A017
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849367; cv=none; b=CSpy5GPHEUlZwG0HdsWPBzT+fHHLRs3JBH5e5IBVA+uvOUfkf/STtwaoIFNRUp1pTqTKZE+/IPnzcb/6yvJKK6beSl970EySvNEFCKJOHHxTPfwpoGw1wp8nKoERURWkdkbWZnIfrAK/R/cX3wKu9YDJpcgGK75V14so4BR8EW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849367; c=relaxed/simple;
	bh=+7C5lZBewC732a5VoFJYD/T7A8MeDEXxraYOh2dv9uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld2XZ+VXqoqLRKm2L2EP58uCA+E/Krce8WI9syUhtIgXhH3uIuH4+LPrQSViVXm3YeqCJsQSCAcxJl+DlwEPmWA6LorS0LuKGg6J242yBxmx9autacRr2xSLfUvxAOTf/Re0Oo7YcR5cI/fDOyCOyTtwObZHkLAv8ViwP4iI4s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VD6Yhr1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VD6Yhr1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F961F0089B
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791849364;
	bh=cMR0NDzmNg/O/J/KQWz6rHyb+xoTnK+pzaAfU43Blm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VD6Yhr1mGzugGDAqeVvZt4SdvxE6uECTs6XSHr25DIdzNijIr8vSHVcaS03t5g/3Q
	 towqG5DuHs4WMjOztjWoGxZmz7GsZHLsCwBqVRnHbaEW0AYzfRoSxhWxaGcfwyKyTE
	 PE5FKxo13+qk6O52t79/vR5hn7zBdQo0U/X+4tGM2/ASds3PVIxmTSHje2xqccM7Hn
	 sUn2qej5RAnCPSW+BYpmYCIrR0xDgiqLP/Jg54R8nBIM+o3klUGvcxmwly2FmksIWE
	 4fwC3tpL7Ojv5PymUP+KydFytmALdfwag0/BQEEP9x/XzDnRvJb+mbErgvqzCdFMW8
	 jaMgRNsayahlQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e5e090746so212762466b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 16:56:04 -0700 (PDT)
X-Gm-Message-State: AFq9FYIRJ8DANYOlprejIBq3A1o8ZqoAvkMtj4e21Ig02CXxVqREU6x4
	jnvQDCNMjUaDguDZZrMojvDX5GHVdiEal7wXfi5vWgUuxQYPFnyxv4G9tahsz18Cl/5XFFEdYus
	eHQB+rDA5czF3ZS6M7UOnVpiYV+ud4Nc=
X-Received: by 2002:a17:907:1c9c:b0:c29:22cf:b0f5 with SMTP id
 a640c23a62f3a-c31aa0aefc9mr1027886466b.33.1791849363890; Mon, 12 Oct 2026
 16:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-11-yosry@kernel.org>
 <sashiko-outbox-168751@kernel.org>
In-Reply-To: <sashiko-outbox-168751@kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 12 Oct 2026 16:55:52 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMbpc+beOmB-vEs7zDigdHkaocw2=Yk_aruXL9ckfCt1A@mail.gmail.com>
X-Gm-Features: AclHuK9H07o_QUuuRoBW0-GVUkblTssXgDwvsX7_DrVyeM2taekup_3H__3SUKw
Message-ID: <CAO9r8zMbpc+beOmB-vEs7zDigdHkaocw2=Yk_aruXL9ckfCt1A@mail.gmail.com>
Subject: Re: [PATCH v3 10/27] KVM: SVM: Use a static ASID per vCPU
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] kvm: svm: source SEV VM retains and uses migrated SEV ASID
> --
>
> commit 9452efa2aa9c0c4c26d340a238f30fbe12b3e4cc
> Author: Yosry Ahmed <yosry@kernel.org>
>
> KVM: SVM: Use a static ASID per vCPU
>
> Switch from dynamic ASID allocation to a static per-vCPU ASID. The dynami=
c
> ASID allocation logic is now only effectively used when running out of AS=
IDs
> on a CPU, or switching CPUs.
>
> > diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> > --- a/arch/x86/kvm/svm/svm.c
> > +++ b/arch/x86/kvm/svm/svm.c
> [ ... ]
> > @@ -3875,37 +3868,24 @@ static void svm_set_nested_run_soft_int_state(s=
truct kvm_vcpu *vcpu)
> [ ... ]
> >  static int pre_svm_run(struct kvm_vcpu *vcpu)
> >  {
> [ ... ]
> >       if (is_sev_guest(vcpu))
> >               return pre_sev_run(svm, vcpu->cpu);
> >
> > -     /* FIXME: handle wraparound of asid_generation */
> > -     if (svm->current_vmcb->asid_generation !=3D sd->asid_generation)
> > -             new_asid(svm, sd);
> > +     if (unlikely(svm->vmcb->control.asid =3D=3D fallback_asid))
> > +             vmcb_set_flush_asid(svm->vmcb);
> >
> >       return 0;
> >  }
>
> [Severity: Critical]
> When an intra-host SEV VM migration occurs via KVM_VM_MOVE_ENC_CONTEXT_FR=
OM,
> the migration path in sev_vm_move_enc_context_from() transfers the SEV AS=
ID
> to the destination VM and marks the source VM as non-SEV by setting
> sev->active to false. However, the source vCPUs retain the SEV ASID in th=
eir
> svm->asid and vmcb->control.asid.
>
> Previously, this was safely mitigated here in pre_svm_run() because the
> generation mismatch (the SEV ASID generation was 0) triggered new_asid(),
> allocating a new normal ASID for the source vCPU.
>
> By removing the generation check here, does this allow a malicious host
> userspace to execute KVM_RUN on the source vCPUs as non-SEV vCPUs while
> still using the destination VM's SEV ASID? Could this break SEV
> confidentiality and integrity by allowing the host to inject arbitrary
> translations or read data from the destination SEV VM's TLB?

As mentioned in the previous version, the
sev_vm_move_enc_context_from() prevents the source VM from running
again by calling kvm_vm_dead(source_kvm).

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012233638.25=
46339-1-yosry@kernel.org?part=3D10
