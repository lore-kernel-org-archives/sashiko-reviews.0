Received: from mail-ua2-f34.google.com (mail-ua2-f34.google.com [74.125.226.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381BE49E5C2
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263063; cv=pass; b=o/1M4z8eYDRK/OA5V8Z2UdJb2BQjn5juZCV05OIv4Wa73cGddlUStJ28utI+vYCmw3dXhLFRd1LTpXL6weBB565buO4rhaFhy9+eIdYtObia4s70yp1G8U5IfiFSLpEbRgFWyNPGL06Kv5ogXpIwYvacca7jSe8suJtjGiVH+8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263063; c=relaxed/simple;
	bh=hiI4wPptPBBH2tS2eN5fMYRAqM6mpI9nbrlZA5EyOCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghYTtPkf80rPi4w4vf3PE1kz9BdXRFIV8huWLwFzOXxdWdiyJH2CaZq5nI1BwHYlP8U8IUSk+4W3+pjROhZksJsEb/dAyeyJL86dJbcuVSrWG3bxfULIQlxlUqhCuvIS/n2EPRiHldzn6z9kBUf6vJJMRLtfrKRCC46zyc6rq64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Eh2ymjvO; arc=pass smtp.client-ip=74.125.226.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Eh2ymjvO"
Received: by mail-ua2-f34.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so1090074241.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 08:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263061; cv=none;
        d=google.com; s=arc-20260327;
        b=YRyUrVtjO45LLtNgsI42RFhx5HGiaegyLKPpT9ie5KeGMc3Ii13EbBPC1VA2S04oH5
         f2quxd8tIthCvv6UvPsAXnxmOLoa2uRruMZgj/a73vpsLOmAE4ybgdlIrWmsiebrGd6q
         13nQkh81IX8kaHg7T3ygwAumvOmCyp6bjvoPZGP3t4rVSgYdtVAcC4yatuQ/MO9CIM2U
         tABRQJvcsOt6K86gV+5BGyw1kCau6WniBuOqpgQIL7JMZu0Qegbo7BisdYSvJd0uuu+k
         NLxDdKrFd2HccacCK1FFnYLMrJnZvX/U/Kuhz040Ra8p2rC7XPzTj4+bWn+RG4PyMgh2
         b5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE3cBa1+vr7EU9XIxm+/iuwlg1RMwni+/YQSFj2++uw=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=NYp39HRPVFvNjC82LpZ3YTdZJWUYm5/tcmeDBhkLHUuBhJhRu13JZv7IvuC+/+toVu
         2ONken9G0g0Np2G5d7JHaur1xSkjclarq7F23EKIekLEtI8i8YS4k30Snjbs4pKeUB+B
         Dc+fgs2cJT7qF9vKId7b26wuBKuLN7dLJN7EYQ7dsK8K63/A1KPAh2udnGUJwNxxRhqZ
         xFrmLt1EvBWlrF9uHPMYV3dpFN1WB1cMzhi8sqUxAESIIr4qfBL2Cg9KHHf3Cg9VsYZV
         rSz/iDUzQujiuYkSDKOk9dKlccSpRaOhKF8xmImgNEfJXZHIsIHro79VJa2GUZyd/qyo
         BVyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790263061; x=1790867861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE3cBa1+vr7EU9XIxm+/iuwlg1RMwni+/YQSFj2++uw=;
        b=Eh2ymjvO5FR6uFPvySGSrgsShzHProyVDqG4rwpw8I3MeBY8bYixB01ngJPOurFH5W
         OE3z3Z8mdXEj2jfYrIr1KPeI9na/aBfOil7gYouFYmqpbfhhHsDM22bpGAMLINIQNXRp
         0URtmjkaosOMhNBrwW8qPJBzPec5+nDaeMvaHYSL6HjIz0/iIb+gCvBAoGcgt1JddGlr
         baP9roaKAxs383MkFKdw0VWtI2ovPnRN6Agh/suIpgJiS13BTijsT5UQ5fNrB5oDZ8h1
         OZ/vZze8Rt9K1GMI10s40FjedkSvYnSr/Izi0R5BNIuRV+5CfD9sXj8XABKc3WQyH3pv
         E3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263061; x=1790867861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE3cBa1+vr7EU9XIxm+/iuwlg1RMwni+/YQSFj2++uw=;
        b=lBTfkBvFidxBRLViHd4eWZthOLYgymWLiPzcgZ5d11bwh7D5hH+6COwkTJ6bga04hz
         T5G9M5RAQjWIesn4/gJ6HgK/JlD+XNJs9ukkgs7AH09C4wp5CjeUzugg2amG/4xjuGXX
         MI5MeUVssDK2FMawmydJoKASUKGAxZ94jdbrjiDwMyFWatwhFFDmm2FBHJfZ6+aOQXfI
         /3MDpycczVCCFsLVMd7tIL+iZQYe8zBgvkg3Jx8VSdTWuJVZUg83XD2Zob3MByU+9vcC
         nnc8yM+yVUPO+ybL7Ysti0Q1rgFln/ABZq7GsqaolsOGNoe4Rb/QDJBMENAdpN5k8PTH
         Sp4w==
X-Gm-Message-State: AFuF++k9C5Oe8pcz0DNT5FmCWpGexi71yOA1/2mGUDzr42xi2o1Pq+qd
	fCM745It8HOxKRNuzUcBhvz1owqfHjErIpeGjDsum2PdvwCT1dLaranlN6OtT9T680YBKKTn7Gc
	0dFed1N5jlr73zKL0uZ4TKXxD/9wl8fCChRDxcQWcxvINufdYlqbz48bC8JFNmRE=
X-Gm-Gg: AYBFou1jo6+n47Nh92VodX9oXZ7N7TcO80jp7glJBVgmMSx+eB7rQKWX66+uf8SiLnT
	/J6CTSFBatr9dyyeyW/lKh0m9NKX2SBaIrzi1+oAYs+dcrd9pgsco2u7vjOxfrUSbGVJKLkYueQ
	/xoiJ9PMkivK0Fqwqbzv1SXzIVTXE0ptyOlkOZ9Bf8BAv28Ml0Wbd8oaVKfpe1+XJNBPhBRJo5c
	+u0yyNfICBOMrsYitr2+6qY3JcxHRazKyK604lPh7dPuyNV9HqsZXpG/AQMpSydIfygJ0zIHPMy
	6jGBw0jDUV6zwP1PYEJdl+xFX2gbmP7+/J0AzmM3PYx5+4UsBQkqnv9Ei/o=
X-Received: by 2002:a05:6102:4412:b0:7a7:19aa:8a85 with SMTP id
 ada2fe7eead31-7af1eff69c0mr1510034137.32.1790263060699; Thu, 24 Sep 2026
 08:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924-kvm_fix_cbosize-v1-1-e57eec1b19cb@sifive.com> <20260924081658.53E8D1F000FF@smtp.kernel.org>
In-Reply-To: <20260924081658.53E8D1F000FF@smtp.kernel.org>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 24 Sep 2026 23:17:28 +0800
X-Gm-Features: AclHuK-8j0dV0FO6QI9Svv6Ns5n2LERm2Yo_GuvsvIQGRjQMmzoEaIAWt4LBROk
Message-ID: <CAMWQL2ggXYh+x__4GLZys22nN7FTo10euK22c7ZAVG5Gv0oWLw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix the Zicbo[m|z|p] block sizes in GET_ONE_REG
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oh I misunderstood the kvm_riscv_isa_check_host(...), please ignore this pa=
tch.


On Thu, Sep 24, 2026 at 4:16=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] kvm: riscv: reversed logic in GET_ONE_REG for Zicbo block sizes
> --
>
> commit 66e4542b7a02ac3b1e7a491baa6d04283e1ccc3a
> Author: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>
> RISC-V: KVM: fix the Zicbo[m|z|p] block sizes in GET_ONE_REG
>
> This commit modifies the ternary operator logic used to determine the Zic=
bo
> block sizes reported to KVM userspace via GET_ONE_REG. It changes the
> previous behavior to return the block size or 0 based on host extension
> support.
>
> > diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.=
c
> > index 877ba823fc747..f2b1255694491 100644
> > --- a/arch/riscv/kvm/vcpu_onereg.c
> > +++ b/arch/riscv/kvm/vcpu_onereg.c
> > @@ -50,13 +50,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm=
_vcpu *vcpu,
> >               reg_val =3D vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> >               break;
> >       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> > -             reg_val =3D (kvm_riscv_isa_check_host(ZICBOM)) ? 0 : risc=
v_cbom_block_size;
> > +             reg_val =3D (kvm_riscv_isa_check_host(ZICBOM)) ? riscv_cb=
om_block_size : 0;
>
> [Severity: High]
> Does this change reverse the intended logic and cause a regression in the=
 KVM
> userspace ABI?
>
> Looking at kvm_riscv_vcpu_get_reg_config() in arch/riscv/kvm/vcpu_onereg.=
c,
> kvm_riscv_isa_check_host() returns 0 on success (supported) and -ENOENT o=
n
> failure.
>
> Because 0 evaluates to false in C, the updated ternary operator returns 0
> when the extension is supported, and the block size when unsupported (-EN=
OENT
> evaluates to true).
>
> This causes KVM userspace to receive a 0 block size for supported extensi=
ons,
> which can prevent VMs from starting or cause guest crashes when performin=
g
> cache operations.
>
> >               break;
> >       case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> > -             reg_val =3D (kvm_riscv_isa_check_host(ZICBOZ)) ? 0 : risc=
v_cboz_block_size;
> > +             reg_val =3D (kvm_riscv_isa_check_host(ZICBOZ)) ? riscv_cb=
oz_block_size : 0;
>
> [Severity: High]
> Is this subject to the same logic reversal as above?
>
> In kvm_riscv_vcpu_get_reg_config(), the ternary operator for the ZICBOZ
> extension similarly returns 0 when the host extension is supported.
>
> >               break;
> >       case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> > -             reg_val =3D (kvm_riscv_isa_check_host(ZICBOP)) ? 0 : risc=
v_cbop_block_size;
> > +             reg_val =3D (kvm_riscv_isa_check_host(ZICBOP)) ? riscv_cb=
op_block_size : 0;
>
> [Severity: High]
> Does this also share the same logic reversal?
>
> For the ZICBOP extension in kvm_riscv_vcpu_get_reg_config(), the ternary
> operator evaluates to 0 when the host supports the extension.
>
> >               break;
> >       case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> >               reg_val =3D vcpu->arch.mvendorid;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-kvm_fix_=
cbosize-v1-1-e57eec1b19cb@sifive.com?part=3D1
