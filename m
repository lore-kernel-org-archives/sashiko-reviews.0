Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188435C6AA
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160408; cv=pass; b=cJz6rAM8TYBO6QrCw3Qtnbnfh+Ftn3wCczQ21q3IhqzHZUQAEFm7wPO1hQkWAuYCwT3mHCDRp7U+YHURrldaO2FPL7pXb1tkOBJqRjviwaqp8tcmyBnT2p3juTvUOvmMt5/XfndyCHKmgrDAaT/+6JzqJE/6tu+/d3dlA11HiR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160408; c=relaxed/simple;
	bh=xKKFYQhcHRuYG9ir/hwetHkc290PBnHmyac6P8Dgcmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpbk7rt+/jmS9EbRyWUSW1XyDKA2OVWDuxBA8tMxg7nlPt+CSfW0/kycLLQW1Vpu7uyY+X5OZyLapjQUfmC5WmNwevSMyeI9zO2zKDwYMWjLP41MpFJ+pQ0qG2H8qqQzyX1dD7YGZST2uFa2O8SfhVZezNBr6B+HuC/oAsebt5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iF0weWFg; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iF0weWFg"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6bff4d6504cso160030eaf.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 14:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789160404; cv=none;
        d=google.com; s=arc-20260327;
        b=Rcf9/hq1QK+LP8nTYD+2gJ9sJGYAt06RrkxJ2laY5XsNi+jZo5tXvUt0t0V+NCgQeu
         mgoWyRwkCr/PoFiybvbzihNzgU6bBhPx764xiY4yA+C43AA0OIB/05wGypzxZQTn3zqh
         upM9hqWG6O00F59iCh9SuCRsOOfsPlLpR3LpiTYcNrOHtad+PiwtRFCD+6Kf2+BAtjvI
         /TpYmKABSBz+oLiNU4Yar0Y7fGIIosUIyM94K1aznNp/U42QViJ99wOO/KB3wdo8f/wl
         L5c4gwMPSkW5Bi9xfbdVR3cPlE+fMla0H4DfExWhEVligzyorrtJMOuVOSxgZMTohSQZ
         MH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MH9IX5hIuMzODpkeT8csfNAVdxr4YmQhsEyInmF9M8U=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=crl/kmUwsReSMmaHFMekyrgKUW4vNdwT5wrTUv9E2/0JC1unUMwzmb0ZJMoJH3Yhys
         wmiqLeq8uCE07uOQm4OOeK55+np1ky1SkPOmz5/3VXCWvJM+fPNVRBB7xkPpV03/DTZI
         jj0FJXnKSizTL0rl8uFnzH07EI+o4m1Uxi4CnvfagLdBUbbxFJ92hOOHBbVAYBy2Bnqj
         77/w9TVBoL0Fbd8LCMyqxzPqDotBpLwiZFSD1qLylKO5NmVy2uanA9a5P/h8RKOW3DQg
         N6gSFJ5tZDw7ahKo+jdl2nqbeTbgA8Ja/00PfTHIixPwKLeMsDMOcCeVxo09F4MsvrVg
         j2IQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160404; x=1789765204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MH9IX5hIuMzODpkeT8csfNAVdxr4YmQhsEyInmF9M8U=;
        b=iF0weWFgvWP5Lbj4g1iYSlqKoLOfpLsDSTLEAH6h1+L61JaA/pw56DbJpMENm1AteE
         EztZvLPKY7KeqeBSKzdv3veTkmAsCf6t3N5ONAqryYBGYiKbNVaK+xSSFecqp0WhQnP7
         xHIJUHWcIqUl1Sr96sONbI03amSobfNOEo/cM3TfexOpaH484bZoB/L7q0nQfAIIC4Ao
         Ujj6us/IxR2luUaXXU/xJiPWK2Lrm7NA37fK8cPY/fMDkoy3Lp3A9GkCp75OIddhw5Cn
         iGr4KA1vLfH+zxBT/lhcL7yPMyZ4v4IoWYFEMIlU8dezVv4rMAwOTjHJ23flq+HUqXtq
         Fwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160404; x=1789765204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH9IX5hIuMzODpkeT8csfNAVdxr4YmQhsEyInmF9M8U=;
        b=JebAHHUcmbn7XJIey9hgnUmb983Bhgu2Sl/n7qs4cUDI8e+Q8/EooI8veT0oTUdDdb
         6+vymQYvAvlrH7IMCP7eVZLw8y+sAdq3LyPervJkqgFLmKuWLn11ufKrxqVecGjiAswy
         2PtC3SKGnLdCdVaRPfVKyIemx54ckFPV12ZlOEIKNjBm1lEPVuJgFyAOFImxy1RC/LWn
         a9tjvFY1nN7YnJZ8S2uSE0aTCXXfyryJBvWa5uZfV48/eKMYLRJEvlXqXb3peQ1AMi0G
         iO8AuiY/f/Myf1GRMm5J63nSNwRYgg4vUC7T57cLo39IVDq19YPxOufrxWlR5rEX1A80
         sXkw==
X-Gm-Message-State: AFuF++mNbwqkfcWQIim27iR7tep7PvmwygiLL5aHnMJZwWg8FDW3fvJC
	RP0Bc1vtje9qjH49shnG3QNykGcKt2WBeJh+v4xpNGzOPW26WU/0vKgOcgDyhe49T7tSxJA4w2j
	sFZFxfh2B8gK1mWCQYoam/Ddr6NUx3nVrnzC+
X-Gm-Gg: AYBFou22REmNC0qlrVVE8x56bPjiuTpE9YSb9bX9dDLMYPZ9EtmFfyd7WQ5qsr1MsyD
	SC6G8NCJqJh1bCge3UDL5uCQMq5QCtO0Za4YnwxL7Bb9zfMwIthviMdSMB7xRsH1m2OJUGUDyRg
	TbAZvBoo7Nx4R/c8jc/hiVKGMz73+WCy2HLhTqApRL26Plfcfszru1Lvjp7uc7PXxUdfxoWOhZr
	wg7e9LeEDYZGx4M6Q31QlSfgn1aKLP2Qm2SgNhYCVhWACy9LNci51a7EQ2rf5itXgjSKnhVCOu8
	v3G0VUQmVcyB00+ZxSJ7sFLHVmPz+EONH7HamoDRWpHavI/IKqUvleibpeSwVyfc8ewFfyI=
X-Received: by 2002:a05:6820:c452:10b0:6aa:cce3:ab61 with SMTP id
 006d021491bc7-6c0ba923c37mr6468380eaf.9.1789160404591; Fri, 11 Sep 2026
 14:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260905220117.922028-1-ameryhung@gmail.com> <20260905220117.922028-23-ameryhung@gmail.com>
 <20260905223348.85D551F00A3A@smtp.kernel.org>
In-Reply-To: <20260905223348.85D551F00A3A@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 11 Sep 2026 13:59:51 -0700
X-Gm-Features: AcwNN1XAVZWJkpdmxs5hktIsCs5XyxE_eHvb_ZIjvgNU9BY4E8vMsIjooOO66AU
Message-ID: <CAMB2axNjqLtLeKbVqKwf0yEQ4OvjTq3ifJq19wWTg5YkRDtWcw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 22/22] bpf: Check helper and kfunc arguments
 in one path
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 3:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Out-of-bounds reads on `meta->fn->arg_type` and `meta->fn->a=
rg_btf_id` for kfuncs with more than 5 arguments, allowing bypass of eBPF v=
erifier safety checks.
> --
>
> commit a1895fafaa5219b7b972d20a932c550f7862cec8
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Check helper and kfunc arguments in one path
>
> This commit unifies the argument checking logic for BPF helpers and kfunc=
s
> by introducing check_func_args(). It moves kfunc-specific argument handli=
ng
> into the shared check_func_arg() path to avoid duplicating the argument
> iteration and switch logic.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 6c5d7e544f844..54656fb31bbe7 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -8808,6 +8840,7 @@ static int check_func_arg(struct bpf_verifier_env=
 *env, u32 arg,
> >                         struct bpf_call_arg_meta *meta,
> >                         int insn_idx)
> >  {
> > +     const struct btf_param *btf_arg =3D meta->btf ? &btf_params(meta-=
>func_proto)[arg] : NULL;
> >       const struct bpf_func_proto *fn =3D meta->fn;
> >       struct bpf_func_state *caller =3D cur_func(env);
> >       struct bpf_reg_state *regs =3D cur_regs(env);
> >       argno_t argno =3D argno_from_arg(arg + 1);
> >       struct bpf_reg_state *reg =3D get_func_arg_reg(caller, regs, arg)=
;
> >       enum bpf_arg_type arg_type =3D fn->arg_type[arg];
>
> [Severity: Critical]
> Can this read out of bounds when processing kfuncs with more than 5
> arguments? The fn->arg_type array is sized for MAX_BPF_FUNC_ARGS (5), but
> kfuncs can have more arguments. For stack arguments (arg >=3D 5), this ap=
pears
> to read past the end of the array.

The review is a false positive. MAX_BPF_FUNC_ARGS is 12 not
MAX_BPF_FUNC_REG_ARGS, which is 5.

>
> [ ... ]
> > @@ -8935,6 +8980,7 @@ static int check_func_arg(struct bpf_verifier_env=
 *env, u32 arg,
> >       case ARG_PTR_TO_BTF_ID_SOCK_COMMON:
> >       {
> >               const u32 *arg_btf_id =3D fn->arg_btf_id[arg];
>
> [Severity: Critical]
> Does this also read out of bounds for kfuncs with more than 5 arguments?
> Similar to arg_type, the arg_btf_id array in struct bpf_func_proto is lim=
ited
> to MAX_BPF_FUNC_ARGS. If a garbage pointer is dereferenced here, could it
> crash the verifier?

Same false positive as the previous one.

>
> [ ... ]
> > @@ -9056,6 +9389,37 @@ static int check_func_arg(struct bpf_verifier_en=
v *env, u32 arg,
> >       return err;
> >  }
> >
> > +static int check_func_args(struct bpf_verifier_env *env, struct bpf_ca=
ll_arg_meta *meta,
> > +                        int insn_idx)
> > +{
> > +     struct bpf_func_state *caller =3D cur_func(env);
> > +     const struct btf_param *args =3D NULL;
> > +     u32 arg, nargs =3D MAX_BPF_FUNC_REG_ARGS;
> > +     int err;
> > +
> > +     if (meta->btf) {
> > +             args =3D btf_params(meta->func_proto);
> > +             nargs =3D btf_type_vlen(meta->func_proto);
> > +     }
> > +
> > +     if (nargs > MAX_BPF_FUNC_REG_ARGS) {
> > +             err =3D check_outgoing_stack_args(env, caller, nargs, met=
a->func_name,
> > +                                             meta->btf, args);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     for (arg =3D 0; arg < nargs; arg++) {
> > +             if (meta->fn->arg_type[arg] =3D=3D ARG_UNUSED)
> > +                     break;
>
> [Severity: Critical]
> Could this loop early-exit and bypass verifier checks for stack arguments=
?
>
> Since nargs can exceed 5 for kfuncs, the out-of-bounds read on
> meta->fn->arg_type[arg] might evaluate to ARG_UNUSED (0). If this happens=
,
> the loop breaks and skips the safety checks for all remaining stack
> arguments, potentially allowing unverified memory access.

Same false positive here. No out-of-bound read, and there is also no
ARG_UNUSED holes in kfunc arguments.

>
> > +             err =3D check_func_arg(env, arg, meta, insn_idx);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905220117.92=
2028-1-ameryhung@gmail.com?part=3D22
