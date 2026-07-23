Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732548A8D8
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832870; cv=pass; b=UR5MpPMWg03aHpRxmniHFEv2cmlbRdeJLWCDF12dssi9lSDlJoJhTM4kizbExf+dBqzrPBM8/ZUT970el6Pkgd8y7B5kQNLr5qXsXLwMmKKFH9jJJiLIvK3G2V4KXtESxCWa3p4M+dwDACokrFizVjsom0QvNRg2eodAkGUvuEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832870; c=relaxed/simple;
	bh=A+DwNBWdhdV6Z+SG7OPJ2fvJ4kaoRit2HmpO7nwr+Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+tlicBVTkSe5gFF80CHlbPTGbsCrAwZrGYpYHmMU3NtxsOeXJUwZjuXOv+SxdzNwTehN9FGP+ls7CRkA5T4Zia98ssYzJENGWLAZmix5DQpn4V5Jhv+W72BMZqYYGBLsEcHUXPd6zAe8aT8l0DwC89AorgpkjfB72ixMuM1CsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1sgaEWB; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1sgaEWB"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80dc4a68e4aso8580497b3.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 11:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784832859; cv=none;
        d=google.com; s=arc-20260327;
        b=M/Os9LhJN1EeclW3Ybio/nmeBP+J7ny1HzxIywR65rvVzdoyIkx6gJ7IWn77WYw2qY
         1H+ixjrm6xxHPXL8aZKclhIJ5TQG/HEJhs+s+utXEwDK0VNicwZewFHMctElfcYgMaXd
         QZk/spnNLBU5f5J8NLwt7K6Ul+y/KohuEajQpCempNZXeXVK2gahNnXAU6MeZEfVR1M2
         muNuKuSxuKvso7sEcOd0s7u/bxIfxi0OvpU7p4Ck9aTn5HOLPdkP1VcDdVEVJMOve/vY
         i9xK12K+mm/nqenjF7q8uRWI2qwqFm69tEin9Mc92zczlSwPEnmS3GCvZWtTFVFY4t7R
         LAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qa9bU5WWlnrT9J3GllGph8U3lPugnECSdzFcC2slgYw=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=D40ipt/pDaO+lQWH7AJ6xM3DqrM7yhYgi4UO1gdgV/TA9ZAGIpXEcqHwrAb5YxmKvd
         a/vPcld05bBHTR4sZwYwTHU7bJ/QnhLUZkGmlKmp3uvSmO2Hp0x+vnakqJ3mOB1vXRX8
         eTaW+p3qcqZcHdby5JjUlEgkaNsCYuVqds8mzL5MGNubSvhFoHKpEju4nf41qgyjIejZ
         yhVet532pF7u6yEdvHbBsg25pTiIyHJgQkDZXUbOYm+OMVe/NE+py88k9pEUYNx1Nu/D
         9Ul2QiEqnGWeKSStHoVaClVZFm2SbFSVcmDDspRYVZrAsesF9YBkdK+EYtzt3D3xdKOc
         WNcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832859; x=1785437659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qa9bU5WWlnrT9J3GllGph8U3lPugnECSdzFcC2slgYw=;
        b=Q1sgaEWBy+Jc2J+1bkFglcd823yvAHsdDWFzet4y/2s3h/5cCU34tyYef1sxLnMlHA
         cattuw6XWoKXdezl2d9DBq4ljB/opNMFZpcXtgXz3IWb2YP/vyBCjTAvisS0RIfMF17X
         OnvHiHoS3RfM/MAFkASkCjotG5AzAeta3mQ4ZIty34rXjtd0UKaqt81FqC6Avr9mNqgM
         z+tsJIFJNz1E1BlbCKg5uWGiX1UwqHuP+s1YToJhTnvO6D/VwamAV5v50+sWk576kJdP
         FCwWWCqg9CVqJpvUXgtFoVQHB4uRFALw8o2grJZ8ovL38prceX51KabMxDZHQ3eCFv+m
         jM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832859; x=1785437659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qa9bU5WWlnrT9J3GllGph8U3lPugnECSdzFcC2slgYw=;
        b=gk+LQmKLhWWD/+TqcrvCbbSizpNcobAJhXKpwEef6goLmOzs8QwwIxFyPt42jTmG5E
         Z0GimDkStLHeIaL+O/kH7dfoEphD1XBkMoon55uI9HC/fGK3iVzXPLh3hUmWOYAQw1RB
         zO8jK1aPrxK8eRG7Ezu2P/8jZv5Dv3pGWDiqBIjueYNc++Urr+uaC+U7/FvP5fKU6qqI
         R2qOgqhBNq3MSDTjbqiMtOULr+igwSG961Gfzp2s1Yli3aZyQRM4UeiTP9Xd0+u8xcxv
         zVX6pCNTJX5FwnqeVxRZaj44W0DSOBoUU1V+FnJh5QZ5TfbQNlECQhFIJZDGfHd8ic7R
         QxpQ==
X-Gm-Message-State: AOJu0Yw26EXqfCVFZGLeaWCHUHjHjNpHHYDswwwJreYt7FV/6SSUFUns
	QEntTdmqGeEgz7VXqWe5MI92P6sTqCEcPZxMccOgPukBMuHlI01DqvBYtT5x38yjiLC10ZUJG91
	R95XK146xQLm4+nL4/rmcVmegVg5ixp8eOA==
X-Gm-Gg: AR+sD1197vNcYTvETsXdqOmQZGELORN7sjEdFDlaSakDSyZLdgUA+9VhqnAGQx7Yl4+
	RidI6/G2zozLWaFS/wwNzAAXd1SygIcYGdPAunk7H8g+sQhXPvUXD86DrQ9X8CN+XCDknQ6/oTv
	9C7/AUBvv1YzB2d57R5XbzRmWCQckSnq/oDA2Q9tceiPKv2koxBJGVLd8MtBnIsSxVwodQ4bI6q
	aOEjNds9yEDalJLUQ1vBVPtLyhPoq2ERNnBjO2VnEBBq4bUimxHp+5hHOg8Bg==
X-Received: by 2002:a05:690c:660c:b0:80e:38c5:bc17 with SMTP id
 00721157ae682-81f4c1a0b48mr12335177b3.7.1784832859259; Thu, 23 Jul 2026
 11:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-8-ameryhung@gmail.com>
 <20260723055758.5F7201F000E9@smtp.kernel.org>
In-Reply-To: <20260723055758.5F7201F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Jul 2026 11:54:08 -0700
X-Gm-Features: AUfX_mzZddXGt83Bzab0nPn6L98g__jZNuWaDyAcT6CG2sg_7U-eO5op9mM6aKQ
Message-ID: <CAMB2axMGGHrAojKtdXAoPi6soYyBVf+LVqWFcpDSLQt2mo-gyA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 07/18] bpf: Check fixed-size mem args of
 helpers and kfuncs the same way
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Global subprograms incorrectly accept NULL pointers for non-null=
able ARG_PTR_TO_MEM arguments, leading to kernel NULL pointer dereference.
> --
>
> --- Patch [7]: [PATCH bpf-next v1 07/18] bpf: Check fixed-size mem args o=
f helpers and kfuncs the same way ---
> commit 878ed5f4f87b10a9bf04aa450c46f6f99550d430
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Check fixed-size mem args of helpers and kfuncs the same way
>
> This commit consolidates the fixed-size memory argument checking for help=
ers,
> kfuncs, and global subprograms by routing the helper MEM_FIXED_SIZE case
> through check_mem_reg. It also resolves a bug where passing a NULL to an
> argument marked PTR_MAYBE_NULL | ARG_PTR_TO_FIXED_SIZE_MEM would falsely
> reject the program.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 6520742d51b58..be5d93c0da813 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -6941,11 +6941,14 @@ static int check_mem_size_reg(struct bpf_verifi=
er_env *env,
> >  }
> >
> >  static int check_mem_reg(struct bpf_verifier_env *env, struct bpf_reg_=
state *reg,
> > -                      argno_t argno, u32 mem_size, struct bpf_call_arg=
_meta *meta)
> > +                      argno_t argno, u32 mem_size, enum bpf_access_typ=
e access_type,
> > +                      struct bpf_call_arg_meta *meta)
> >  {
> > +     /* meta->btf is set only for kfuncs; a NULL meta means a global s=
ubprog. */
> > +     bool helper =3D meta && !meta->btf;
> >       bool may_be_null =3D type_may_be_null(reg->type);
> >       struct bpf_reg_state saved_reg;
> > -     int err;
> > +     int size, err =3D 0;
> >
> >       if (bpf_register_is_null(reg))
> >               return 0;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this early return all=
ow a
> NULL pointer to bypass memory access bounds checks and type validations w=
hen
> the register is a constant 0?
>
> [ ... ]
>
> > @@ -9257,7 +9261,7 @@ static int btf_check_func_arg_match(struct bpf_ve=
rifier_env *env, int subprog,
> >                       ret =3D check_func_arg_reg_off(env, reg, argno, A=
RG_DONTCARE);
> >                       if (ret < 0)
> >                               return ret;
> > -                     if (check_mem_reg(env, reg, argno, arg->mem_size,=
 NULL))
> > +                     if (check_mem_reg(env, reg, argno, arg->mem_size,=
 BPF_READ | BPF_WRITE, NULL))
> >                               return -EINVAL;
> >                       if (!(arg->arg_type & PTR_MAYBE_NULL) && (reg->ty=
pe & PTR_MAYBE_NULL)) {
> >                               bpf_log(log, "%s is expected to be non-NU=
LL\n",
>
> [Severity: High]
> This is a pre-existing issue, but if a caller passes a hardcoded NULL
> (SCALAR_VALUE of 0) to a global subprogram expecting a non-nullable
> ARG_PTR_TO_MEM, check_mem_reg returns 0 immediately.
>
> Because the SCALAR_VALUE type does not have the PTR_MAYBE_NULL flag set,
> this subsequent bitwise check in btf_check_func_arg_match:
>
> !(arg->arg_type & PTR_MAYBE_NULL) && (reg->type & PTR_MAYBE_NULL)
>
> will fail to catch the NULL. Could this allow a global subprogram to
> incorrectly accept and dereference a NULL pointer at runtime, resulting
> in a kernel panic?
>

Confirmed that this is a preexisting issue. I will send the fix as a
separate patch. This is yet another example of why we need to
consolidate call verification.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D7
