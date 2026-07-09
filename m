Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843629E116
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783640209; cv=pass; b=Y7Fv09HuZGEqyF6Er+hRtDSyaPD0k5CRFTQX7grBwX5sS7RDzV/R43sfeqPOfMVApPX5j+lkCPonGinmhIw9UCfjiCV9bdZF/4AFpr4x0fs8ZcOFDVQp3RIdRUpv98x103bLu+AsSnRenIkPVcaxRSRpnxEtYG9uXZU+iRdIuus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783640209; c=relaxed/simple;
	bh=hqF49w0o9Y3pxIUlyHXKNxY20CM50UR0Kra4XyEh7q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfmdJCxl915guklFil95RdfqEW+taQxYWpokJFQrvTJ7PsXt85d8o9mHPUlsKOe3lXKOUmi0w549Sz99hjP83J7LkgGCIgXC30fbVOBweMMN9jp5zijm5n/Mt9F1HdS/aeLtUQfthpAUhpKKwy/dqcFw+lIMXUZDbhbfVWP6ZWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbfANkDE; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbfANkDE"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6679d88abdcso483250d50.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 16:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783640207; cv=none;
        d=google.com; s=arc-20260327;
        b=D0kr3UrnsL90mL1hMomTyfE/MItU/RVJ6z5kewfNq6nTH5s7KKVsK3/cNVs6UoVrP9
         VJVqq1XbWL5bPosnjpdic/To2p+PftaCDMbqKl90IhLee29mrTVKZjwP9gwow7A29mLe
         U2jqlC+4OyFvY/bl7bVAm3QWlCIXVlRU59UkErSBPy0w23fT8lkK5RSBBk2TMEepJzPX
         0CpNQ4nV85jzc3XTS04/yS86RtMiXrZAXJWmm/xMAL/9Sy1UHJ0DJdo0n73oQwDONOHv
         LYcPd5s+XAQiPAam5ktjWHwFN9lVhgSfMHHESOl2WZ+N/VeK0TOjIfxxecFFMeh8V1hB
         0bMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2JEFYM+Nd275OKVdEeBkO+9cqRAM0g5bLueXNaKqV8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=M6H7jQi7loV+J0lnHjtFUolFK5FcDfZSGFUk8FLzMWTxrIv8CfRuQ8mCTvO45sfG/5
         to/DZEvWqydiPWqf6636uiKih41m72ilaAOVRw2bfXetgh/ZxDBAknmebPsox6Eu0k+w
         bOX+lVA2pnLrUdMesIb/zTjT7ANwHsuxM2o5Np7zgoWtVXLhT5K9PNXj8xGFXJseIIIa
         w4Rjqx8IEE0qi0dosK0u+5nuQOivgaPr+TlOvPfOWGac4kzHEZ/KTG2i8tNn4uP7Z8R8
         gcJuW6RfKWHb3ft94O4KFUBeWVI/xpH1REEo1WqzH61eYnehrBosbT5RhqAbQykes18P
         Vezg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783640207; x=1784245007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2JEFYM+Nd275OKVdEeBkO+9cqRAM0g5bLueXNaKqV8=;
        b=TbfANkDEQhIl12oKhYs9c9XbiefjCfvfa24g4MKDsQSdJOn/bpmmxppt+LpRys0Qav
         dBtlQi4per1Mb1/JLx3JN9uus8l7twPydrmlWPCIXMuEJqBQrzEhvFc04nTjnrH9gi6Y
         6TWPFaLBE7c5/TqfwyhN2VSJAA5QgEBpzAThjDbPZl17rdkJ+HWaFhp4UtxzCe46vmXl
         FgN9BiHwlP0zDRj+frAE7j1NadCbR4Yhq/gcT+gGDM7Rp/hCP4Vu5aAgo1cVTmAEIplE
         dwwaYapYrj0s2HGrB+mfl7m0vo5Z7SR0aD7ZUywHI/vI3QGxTEw85FgsKkKXq7GpFmZq
         XNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783640207; x=1784245007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2JEFYM+Nd275OKVdEeBkO+9cqRAM0g5bLueXNaKqV8=;
        b=EOvTalueB3LUFUPNMQ13ym1aTmVqYl9pd5FoIcj6/HkJm83Fac6172P0meZ0PVc2af
         /HPXykLE8ioa5KKpfc+adGuZBJROSk7bOmPjENMCgN8bWj7o/suEB25H7qKq5MLebacx
         q1X1X62RxksSQbaZNOpfhx4/XO1kZCMNQGSlWy9Nb4mvIDogk+tyQCHa8lDNQquFO3F8
         PaHHnZf++mQtHT0pXGpoToXMZhVhOL5+hR6GfP90qd7WUdVAU4cnABBF7slSToyFsY9q
         L1PTu5Em3kJ81moX4ypAnqISPsfB357O8+MSyA8VCdWhpOphIgOsFB0vTn+532Ayet8X
         Go8w==
X-Gm-Message-State: AOJu0Yw5HfP6IuObS/CyPTF3E82nxCFo/4p30t7nWZiHkwsDTFQFasuF
	Ap4dVQM5lpoOvHn8mAeodaPueVA31+mMzflGOtBgNQXxO+fxiQeRb4B9m5CfrCWsmfxWf1FKgwV
	LH6rdagx1V2FxbZpy9RfpKcB9Y32klLLqgy5M
X-Gm-Gg: AfdE7ckc4xIeOqQTC9LaEgsrbr8NXWq5PDe/ce965PbezJZKlQu3Y0dIeSDB63iC1Zs
	xnqXyIUEZclFt0pXlOA1wgvRC7XBUg5f4hKDjqRK+Wbs6f3fRbG5LSZaJa+4JrYhL/aSIdSr3z6
	Ndq0aQffdtFKzN+uy70uHqGE3RvnAwvzEhFV8f+joeXqsHhNTNWQj0hHbSC39yQZ8bmwicredaK
	81Vlvoh257vKWEKYviZ4WNYmCT2a2Xo5B8c54OnOCKHtChHF3jMBEPvlfL+ADTt/Q9yH9WP
X-Received: by 2002:a53:a490:0:b0:667:546a:e624 with SMTP id
 956f58d0204a3-6679f26cdb7mr4983143d50.79.1783640206745; Thu, 09 Jul 2026
 16:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709230242.2003459-1-ameryhung@gmail.com> <20260709230242.2003459-3-ameryhung@gmail.com>
 <20260709231732.AAA701F000E9@smtp.kernel.org>
In-Reply-To: <20260709231732.AAA701F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 9 Jul 2026 16:36:34 -0700
X-Gm-Features: AVVi8Cfaiv0Nb5dLVXosUOmMYLoDtUBrkn6voSCtmKAgDMCTdizmGJG6UmULS34
Message-ID: <CAMB2axPf0=YPMD4br-zd+-tjLRAQa890PRJAKStSwZyAAef-PA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 2/4] bpf: Factor out raw_mode-related fields
 in bpf_call_arg_meta
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 4:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch drops the detection of `MEM_UNINIT` raw memory argumen=
ts for `ARG_PTR_TO_MAP_VALUE`, which incorrectly breaks valid BPF programs =
that pass uninitialized stack buffers to helpers like `bpf_map_pop_elem` an=
d `bpf_map_peek_elem`.
> --
>
> --- Patch [2]: [PATCH bpf-next v1 2/4] bpf: Factor out raw_mode-related f=
ields in bpf_call_arg_meta ---
> commit bbac2673fbeb11bb9179553dc669702134b2c290
> Author: Amery Hung <ameryhung@gmail.com>
>
>     bpf: Factor out raw_mode-related fields in bpf_call_arg_meta
>
>     To prepare for unifying the helper and kfunc call_arg_meta, group the
>     scattered MEM_UNINIT ("raw") memory argument fields (raw_mode, regno =
and
>     access_size) into a new struct arg_raw_mem_desc.
>
> >     Also drop the bogus raw_mode assignment in the ARG_PTR_TO_MAP_VALUE=
 case:
> >     arg_type_is_raw_mem() only matches ARG_PTR_TO_MEM | MEM_UNINIT, and=
 a map
> >     value pointer is handled by check_map_access(), never reaching
> >     check_stack_range_initialized(), so tagging it raw mode had no effe=
ct.
>
> [Severity: High]
> Is this assumption accurate? If a BPF program calls a helper like
> bpf_map_pop_elem() and passes a stack buffer (PTR_TO_STACK) as the map
> value buffer, wouldn't check_helper_mem_access() call
> check_stack_range_initialized() to validate the stack access?

I was wrong. This patch will cause a regression. raw_mode should not
be dropped for ARG_PTR_TO_MAP_VALUE.

>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 7dd961ede88df..e2a3ed67d2eb5 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -6690,6 +6688,8 @@ static int check_stack_range_initialized(
> >        * but BTF based global subprog validation isn't accurate enough.
> >        */
> >       bool allow_poison =3D access_size < 0 || clobber;
> > +     /* The call will initialize the memory; uninitialized stack allow=
ed */
> > +     bool raw_mode =3D meta && meta->arg_raw_mem.regno =3D=3D reg_from=
_argno(argno);
> >
> >       access_size =3D abs(access_size);
>
> [Severity: High]
> Because arg_type_is_raw_mem() only checks ARG_PTR_TO_MEM, arg_raw_mem.reg=
no
> will not be set for ARG_PTR_TO_MAP_VALUE arguments.
>
> Consequently, raw_mode will evaluate to false here. Does this cause the
> verifier to fail to bypass the uninitialized read checks, rejecting valid
> unprivileged programs with an 'invalid read from stack' error?
>
> [ ... ]
>
> > @@ -8403,7 +8401,6 @@ static int check_func_arg(struct bpf_verifier_env=
 *env, u32 arg,
> >                       verifier_bug(env, "invalid map_ptr to access map-=
>value");
> >                       return -EFAULT;
> >               }
> > -             meta->raw_mode =3D arg_type & MEM_UNINIT;
> >               err =3D check_helper_mem_access(env, reg, argno_from_reg(=
regno), meta->map.ptr->value_size,
> >                                             arg_type & MEM_WRITE ? BPF_=
WRITE : BPF_READ,
> >                                             false, meta);
>
> [Severity: High]
> Without this MEM_UNINIT assignment for ARG_PTR_TO_MAP_VALUE, does the
> verifier incorrectly reject valid programs passing uninitialized stack
> memory?
>
> [ ... ]
>
> > @@ -10303,8 +10292,9 @@ static int check_helper_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn
> >       /* Mark slots with STACK_MISC in case of raw mode, stack offset
> >        * is inferred from register state.
> >        */
> > -     for (i =3D 0; i < meta.access_size; i++) {
> > -             err =3D check_mem_access(env, insn_idx, regs + meta.regno=
, argno_from_reg(meta.regno), i, BPF_B,
> > +     for (i =3D 0; i < meta.arg_raw_mem.size; i++) {
> > +             err =3D check_mem_access(env, insn_idx, regs + meta.arg_r=
aw_mem.regno,
> > +                                    argno_from_reg(meta.arg_raw_mem.re=
gno), i, BPF_B,
> >                                      BPF_WRITE, -1, false, false);
>
> [Severity: High]
> Since meta.arg_raw_mem.size remains 0 for ARG_PTR_TO_MAP_VALUE, does this
> cause check_helper_call() to skip this post-processing loop entirely?
>
> Skipping this could miss crucial state scrubbing when a privileged progra=
m
> uses special slots like STACK_DYNPTR as a map value buffer.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709230242.20=
03459-1-ameryhung@gmail.com?part=3D2
