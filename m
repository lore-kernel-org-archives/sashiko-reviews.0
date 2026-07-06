Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D03FE67A
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338842; cv=none; b=NjwiFKeqJmQBhnm/6Fiool78aQwGK9fo3Gg+XlQ1CsVUniH5FZA8o9FGzAFfjZvllKwAUd/0I7FRGbqatG+XRhOpV+HFC7sAWSDvL0eN4P9u0DtyF28TCqii6PuroXTqt5g5BGaZMv03+61OexCzyUGQlW5EvUtO9cIXnPZ5rRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338842; c=relaxed/simple;
	bh=pQ2sBx1yflRxuOdyqgGzEEWEaQnnZZWHr6wFLS1861Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZtV0SgxwRrMtGLS9QYi6je2acvUWpczLytIGg/1hODGE0xN83QyAsXDoDosOWEgCCORKllfT6ZjRMiX4leiV5kJF6Ez5fp8smsC6LU9GWoFeU1+DSB3JbYufw/wC5NrBnkZvWphNIkseyPI+kBYmYfZr725wS74j+AhZOq1+Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dtCuTkBM; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dtCuTkBM"
X-Gm-Message-State: AOJu0Yy+Dkg9EMyZ6xSfTOp3rp9BX02kRoIQIikiNCg7jKB8w+jmJw+W
	HcVlIjnFLDxhfVNeuugacIpCIbi6hCl1dXdt301ESg/me6S4FicdCPUOaif8QDf7KBDGU+CDdyI
	yHeL8RlfswIOtNx0V883hURUkVlh9gvFxDEDt/Ei3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783338839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+eed6la7DRVrFBf17KyzvgFRJ5+OioCbBp3mjbwXuY=;
	b=dtCuTkBMepEh02h0vz3CoO1kSr2ZMgwW2eRKMNt+Pcs5SN2JG2gO0ekWwWARNrCI6GTHs6
	qrs0db9CUWJWV0mC/79SPmUzfnSde8WYOTUl4lMucJh1wBg4l9TbV19hyrbIxlmVDPm/x+
	ggfnkceNEfwScBk86wPrFDhAyGxIFxY=
X-Received: by 2002:ac8:5a15:0:b0:51a:713c:7444 with SMTP id
 d75a77b69052e-51c4c0f67bbmr18296841cf.18.1783338829969; Mon, 06 Jul 2026
 04:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706095927.560795-1-fuad.tabba@linux.dev> <20260706095927.560795-7-fuad.tabba@linux.dev>
 <20260706102817.B03AF1F000E9@smtp.kernel.org>
In-Reply-To: <20260706102817.B03AF1F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 6 Jul 2026 12:53:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyM3CYofmj_ugC_vkZkUBGw-7UFyXRJbi5QkF4QqcV2YA@mail.gmail.com>
X-Gm-Features: AVVi8CcufXl79qkj69YuJOxGM3lFnmm8GA-GesmNUrodYSpOe3hBd_p7YCWrQzI
Message-ID: <CA+EHjTyM3CYofmj_ugC_vkZkUBGw-7UFyXRJbi5QkF4QqcV2YA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Mon, 6 Jul 2026 at 11:28, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Userspace KVM_SET_ONE_REG modifications to ICC_VMCR_EL1 and Acti=
ve Priority Registers (APRs) are silently overwritten and lost on vcpu_put(=
) under pKVM.

The vcpu_load/vcpu_put path under pKVM uses the same direct
__vgic_v3_save_aprs / __vgic_v3_restore_vmcr_aprs on the host cpu_if
as non-pKVM nVHE, not the hyp-main.c wrappers.

/fuad


> --
>
> commit 8bda67fe364c44ad574acb3da5de4bf16e0ccbbf
> Author: Marc Zyngier <maz@kernel.org>
>
> KVM: arm64: Minimise EL2's exposure of host VGIC state during world switc=
h
>
> This commit avoids exposing the host's entire vgic_v3_cpu_if to EL2 by
> copying only the necessary vgic_vmcr and active priority registers during
> save and restore operations.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index 45d717889f6ea..f3233ee343a39 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>
> [ ... ]
>
> > @@ -508,16 +520,63 @@ static void handle___vgic_v3_save_aprs(struct kvm=
_cpu_context *host_ctxt)
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
>
> [Severity: High]
> Does this sequence risk clobbering userspace writes to ICC_VMCR_EL1 and t=
he
> Active Priority Registers?
>
> When userspace modifies the GIC CPU interface via KVM_SET_ONE_REG, the
> ioctl is wrapped by vcpu_load() and vcpu_put().
>
> Under pKVM, vcpu_load() calls __vgic_v3_restore_vmcr_aprs, which restores
> the hardware with the current values.
>
> The ioctl then updates host_cpu_if in memory with the new userspace value=
s.
>
> Finally, vcpu_put() issues the __vgic_v3_save_aprs hypercall.
>
> Since the hardware and hyp_cpu_if only have the pre-ioctl stale values,
> will this explicit copy back to host_cpu_if overwrite the new values set
> by userspace? This could cause state restoration or live migration to
> silently lose these register updates.
>
> > +     } else {
> > +             __vgic_v3_save_aprs(&host_vcpu->arch.vgic_cpu.vgic_v3);
> > +     }
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706095927.56=
0795-1-fuad.tabba@linux.dev?part=3D6
