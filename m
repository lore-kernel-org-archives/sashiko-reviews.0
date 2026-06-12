Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5074C377ECC
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 08:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252130; cv=pass; b=jyiTk+lWFLMMD6fY1G8sopU8JOlpTNMJB3owAq4jTY6iMXMxxBKWdyt78Dtpdj+rNlsRXAtUK/1Dju59xMZRJyO1VmzZYTQ/HEL1lxahE4KhZ9Umlr+7M4iiEh74VP4XdO6PgRklEIsmMyFS/va3TNZ7KGHoKAW0PqvtOHur4FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252130; c=relaxed/simple;
	bh=MzEFp4pjBpUyzQQecCLTxwctjZloQpf3KVzIOs2W6ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KY/vEC2+Fds64eSENRDS36GxW+DKIduxSYARVVfPAKi2znOJbF1IfJNEw5Y6It3JlLci+d7UvRO85TKhnkPyMsvFl8pGmE04hZwZwYoJOlzBKjABIuX6HBlbpi8pUtXSblEnyfjXzgTxVXWcRkiTeMi+nukqR1HXzLRvQlBKmJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hz1oRjn+; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hz1oRjn+"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51765331535so293581cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 01:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781252128; cv=none;
        d=google.com; s=arc-20240605;
        b=MLYzMuOcvRI07uw30Xtq0S1ffmsjZBk4ONacyX+oAaycrjwb0TvP6n1UQuecDlAUKI
         vrZ0FEpHraesG1PNudtWm2HdGuXjaA+Im48265z9bvQBasGHrxfFmvdq1WmVJ2CnohQ+
         i3ZJkBrDiHvA7A2ebVsyjkCFrXmk7lG6hF2+pmHU7zsMcVQ+xapg4kDljBSznKHVy5lW
         fKUniXsxK7/98+bIPfnIwGKOB6blMisCchd7XYiOoL6DMyEYxOKn7/rFy+nfkcRYikvL
         tEYbrZcejTU7amFdLUUcTVhPw/uw0r8LNtUQ1F662BCcZWRVYjAVLLBPJGj2Ndws9sKU
         JjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h3wU5q8stR3D4hTYWLM9ySnSvxIpdYSTYFtemeb7EEw=;
        fh=VKU7ZaEp1A7DZ4DrENso69hyqyAonMuRN+dnf7gvuag=;
        b=lFoe5qAgS1JllASH2biHpFywkdYfJt20lRMRixHzrcHBQEPUmuOthB2efoA5YjuiDR
         HNoQ30lNsTz2TN0MHWOQx3l6Zwcl5hFg0EvtBDCJ6oVe7rbTxR4Cxxoc0mGfTPvL786I
         CmJ8EerBu4Tw98vo7MqwqnPAOD/O/XeFNb/0LKiEtbOBEDFWh8xG5ax0MkEB66nTAcgH
         KdL0JQ30u8g4keokpSaW13mpK36deyLYgfiSZv6P2vDALuS+SxGNFZ4fhB+nu8dqzsS5
         zBbA+87mTX7k8Tj2PgJHdAnZri8LHOXdpxS7foNzDFkj5hpG5IqfmBmgIFWeCWKTzkMr
         bW8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781252128; x=1781856928; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3wU5q8stR3D4hTYWLM9ySnSvxIpdYSTYFtemeb7EEw=;
        b=hz1oRjn+0wnbcheS6z6+B07zhz7hhg/I7tWm/I+k8u5+w25aq2mbNR+EVSuOU0BLr+
         MGS7XQjlHoaO3eudxKlzUNDcZXMJFbv5r95sLqOEdB/UoLmzqcfqbVsswQJ7DbCMsOE0
         Dt/AMFTKAzJ215EyFgZ1amJlXqxp9gDObvsJeCNVeDDSkSpD2AR3yEmfPzJJwWf42hTS
         XOIE9+OfWoRL/BVsXrGw/1SaVi6IAl8Ist4j9TjpUeC44WY6/JOKGbl/L+1fMZAYTYB7
         PRfKDYjHvSnFLm+ue7tFxLB5D0F9GG3hq4v0OWRggB+JcIArw8MKk2Jw26F0OCJcNUBf
         edPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781252128; x=1781856928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h3wU5q8stR3D4hTYWLM9ySnSvxIpdYSTYFtemeb7EEw=;
        b=jEvztL+iE+IOQPNI+TwIUpQCoR4Dz4s7K/6VJtE6rkwp6ygaL0Abe4/DHuICgKjSyw
         Z1OT/RnTNZDdEUpln7MFUOAw9TZIi5XGjLRCCoPWZqs5ouBIUzKQrojtCx12GbLthS7L
         Lx3L+GHHtKCZSKV+2E9onNX+1hPBN9qJxSCpIalZq1XWIIOhUblkq6a7uVHYjd5abDSq
         xWrE7ywFkB7H8sJz5/XMahs4l2bjVAaFBSglNcz+xgmLvlrMiRzdV8n6KI5iHJGQKQFe
         pFcZGILZvnagd+dh198C+jovohAx6sFg1np20sQp9O3j85UOmeL/T8VNxtdT4/12XsUE
         nNTA==
X-Gm-Message-State: AOJu0YxNBDG0KgF3x4fxs4P+R6n9BjfmJceDioMjuuPOzBcc+JFc03At
	Tnt+uUmJ0Kv1nJy1yHaYpbQu83iCIGQxvQBCO26f6c/lUfNy1eWzPx2uYfrbD8LQQkTrT6BwrYm
	0fHydsey+TGlm+uHLPEBoPfzwIFcjs2W5CQhlCp3n6rKV29o/FN2N6eyjnrQ=
X-Gm-Gg: Acq92OGklCk8Mn60dyeDILOksRmQfZZya1pafz2Sw9ZzzZKacnf9SbXckqZJ07oBkNk
	a4VTuZwNxoxGOZb2EMomS2JP6lshH03ms1KCF5Vxx/Tyh36vxpSgTqqKmeE8Dji772ayRkBUBkK
	9a8MjOOe6P3D7pUCRtOWHYIGKMjtpvHVx2xgeDPBmfDWp0gIOnNuuQ+ehQZX3gdgiaxv6kVQIx5
	Ivetb+NFf6ZmflGu+V5/1/wjPtcIoQieMQfs6ZnRSYk6SysqQAQVKUnMfwPrN2VfEQ3Q+KQ4ik7
	/BHQ5ohx
X-Received: by 2002:ac8:690b:0:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-517fb1606cemr6428911cf.22.1781252127654; Fri, 12 Jun 2026
 01:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612065925.755562-11-tabba@google.com> <20260612072328.BC6B31F000E9@smtp.kernel.org>
In-Reply-To: <20260612072328.BC6B31F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 12 Jun 2026 09:14:50 +0100
X-Gm-Features: AVVi8CcVBD_Hdo8p6kcAKqp6Vo8QUt2p-qrb9GQkidVFjzCzDoYy_ynQaltaxv8
Message-ID: <CA+EHjTxO_mQ1PznEgE3AP0YvLu1bQO9S+DiNRb8Cj89TkyGwsw@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] KVM: arm64: Add primitives to flush/sync the
 VGIC state at EL2
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jun 2026 at 08:23, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Unconditional pinning of vgic_sre to SRE=3D1 breaks GICv2 emulat=
ion for non-protected guests.
> --
>
> commit 3d9e59afaa5e29a6ce57ece8ccacae434b38915d
> Author: Marc Zyngier <maz@kernel.org>
>
> KVM: arm64: Add primitives to flush/sync the VGIC state at EL2
>
> This commit adds flush_hyp_vgic_state() and sync_hyp_vgic_state()
> primitives to move per-vCPU VGIC state between the host and hypervisor
> contexts for pKVM.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 2f165b6c7b071..23e644c24a03a 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> [ ... ]
> > @@ -99,6 +99,46 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
> [ ... ]
> > +static void flush_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     struct kvm_vcpu *host_vcpu =3D hyp_vcpu->host_vcpu;
> > +     struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
> > +     unsigned int used_lrs, max_lrs, i;
> > +
> > +     host_cpu_if     =3D &host_vcpu->arch.vgic_cpu.vgic_v3;
> > +     hyp_cpu_if      =3D &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
> > +
> > +     max_lrs         =3D (read_gicreg(ICH_VTR_EL2) & ICH_VTR_EL2_ListR=
egs) + 1;
> > +     used_lrs        =3D host_cpu_if->used_lrs;
> > +     used_lrs        =3D min(used_lrs, max_lrs);
> > +
> > +     hyp_cpu_if->vgic_hcr    =3D host_cpu_if->vgic_hcr;
> > +     /* Should be a one-off */
> > +     hyp_cpu_if->vgic_sre    =3D (ICC_SRE_EL1_DIB |
> > +                                ICC_SRE_EL1_DFB |
> > +                                ICC_SRE_EL1_SRE);
>
> [Severity: High]
> Does hardcoding ICC_SRE_EL1_SRE here break GICv2 emulation for non-protec=
ted
> guests?

No. GICv2 is not supported under pKVM. vgic_v2_probe() (vgic-v2.c)
returns -ENXIO when is_protected_kvm_enabled(), so no GICv2 guest can
be created. Every guest reaching flush_hyp_vgic_state is GICv3.

> When __vgic_v3_restore_state() executes on guest entry, it will program
> ICC_SRE_EL1 with this value. Setting the SRE bit to 1 disables the GICv2
> memory-mapped interface (GICV) for EL1. Non-protected guests configured t=
o
> use GICv2 rely on vgic_sre =3D=3D 0 to keep the memory-mapped interface e=
nabled.
>
> Should this value be copied from the host-set values for non-protected VM=
s
> rather than being unconditionally pinned?

The host sets the same value for GICv3 guests (vgic-v3.c),
so copying and hardcoding produce the same result. GICv2 is blocked
under pKVM (vgic_v2_probe returns -ENXIO), so the vgic_sre=3D0 branch
is unreachable. Hardcoding is intentional for the protected case
(EL2 must not trust the host value) and harmless for non-protected
(the values are identical).

Cheers,
/fuad

>
> > +     hyp_cpu_if->used_lrs    =3D used_lrs;
> > +
> > +     for (i =3D 0; i < used_lrs; i++)
> > +             hyp_cpu_if->vgic_lr[i] =3D host_cpu_if->vgic_lr[i];
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612065925.75=
5562-1-tabba@google.com?part=3D10
