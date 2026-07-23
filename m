Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C8540E8FA
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 23:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784849374; cv=pass; b=GXl44K4irxdDk73lo3R3QmiAs0pk470YjL5WpejDtPLYXhJ7dOYpYQ0JBu5wIIrTgcl6qv2YIaNtobeABKPoIYOhhFsfSwgvEmuwQqgLSWj6NRHBXqxZWOkki8ind25S72xoSz4Eem3LywoNxgZ6J0rh+fngJ/csN2l+Hi5R8iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784849374; c=relaxed/simple;
	bh=BVSk6mLrzSyTeGXwlJIPYNa+8Axk+ULGfvm3aiXsPQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSy71+5xHyd7ZNicf261aTYpoP5TrUoTeDsDeShvOJpT8I+C1XTrqxs023Rs6Y4md64khtSc6EjIrPjnBlRF8S62XzahS5Gh5eEnQK65kDB7THtbo0ps73YJKgh9ADl7Fkdkh6KpjLV+T04QIl/eON5k9yN+CeQwCE9Td+7i3J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYfCPqNc; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYfCPqNc"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-667bae10ba3so1175830d50.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 16:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784849371; cv=none;
        d=google.com; s=arc-20260327;
        b=sLgKspuaWbPrW4G/L/9YFk0pHzcJo+lhi773Ip6qEuP3GwbxYvXXRn7MmRqs86oXKC
         dmKM3K0VrePgsy60v+y6yB2ZDCTw2o7fm117D/CxqUe0sgEzs4BCGNJMUgE3BI+hTa/J
         IOOM5/EfzoyXjlm5pc09+atQfCOVlt3xkEkXjgB/lx54O9YdpOFc/o/eX5cPb5dL8MvB
         g2DiEh5ypAeb9DcWkWtkJisvM4zVKYTNE5X8eAduRfS72YUA8jlACWlaiu54AUgqaYK/
         aKO1+tNyhhkcfWoJgWKVQupr4wdYk6dBuJ7OptjVpNKBHsjw4mf/OPSB/SYDW1Y4C8jO
         ooBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RbV4veNtMxNuhfUCXGwbw+OXLaKwqSBL6ZNXEnhYxDY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=q8X/3+HqFcvEaONEDfOf6Ylwj317WnHqFGMfjJ8wX0PaMKCnnz8/MfsTMey9vG+o/X
         3O3ejtRelJPL8ZhDCK95sDg/KYoVUhCzUaAgvcM6XwRjUA73RizICsFe6rrdSFROZ3+o
         iT7tjvt4CREAYMn/oFlz7oum9Aw/MfYIkvt2r1hV47NJtQMIVPitIkkOXwX3ugOqSoan
         4W9BbOHwrsCprfS8WMAdiNluYAhYot16UJOgWrBuEjF/Aeu25NTSWKWq4UwEl3qPwWM9
         hNMzASNUfiGpAeY/NBT61acVZ2qJDX5eMy2JaO2nlkwWy63yx42WNezxDZrOoxJgje3A
         Y+Zg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784849371; x=1785454171; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbV4veNtMxNuhfUCXGwbw+OXLaKwqSBL6ZNXEnhYxDY=;
        b=bYfCPqNci6UxCvfkV4lmUNAs0aELpfwDiJNAVO1Xyj5v1EDL0GE07rAIKVXqFJtyfe
         bDjBJq/dj/mwegqk4Ju4MSXMc3mS1nzUAk2GEKmIBpBDIIEmOrY+axBc6S1AZUaGKpSo
         +x+7SacWgmYQR+m0+uQ7Q42pX+FN87zU4uM0MkM6G+UlXcwzdvSAr3JemOzhkSG+Pxks
         FgFVFNda4HC/z9KrWYgUTkFoFnQUtkFZSzPsaV4imvfezHbxLNF70VXNbZcC9smZFMMK
         /jW1Skz8dPaCbYJSX1lTJJn5wk9wJMUZHdvPtw06XZVMYN8/rmByZYLMSFcWe9lQjKJX
         vLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784849371; x=1785454171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbV4veNtMxNuhfUCXGwbw+OXLaKwqSBL6ZNXEnhYxDY=;
        b=qr5dsMn8bPzeuDe0YkXnvIDuxvRs6tFzouZHlaFSRUl7HAJWfcTTZQmiiA6pLJqUAs
         N9OFqDDgh61Lk7yzzWkJwyGC1qiW/CP36p3fx2wNj8Io62uPR6Sr6wzjRNbMhCUa1eUk
         zARJnfvMGGT5H9bOxOgc/TXcR3SSkIDutwqsVt9U1ZbHgyNz77ArwYuM4RGzOI+wyrgy
         TXSnLjD4gZcSE9+LF2+41+0lf/3diKY31k4CyVB375fNt3cW1VmT5kVwbQkvnwYDy+7F
         Bbb5oV42LCVDCW69MxvCdXQ64pZxGtzuAN/G/YRfy6DQTGL3cvB4XM9kNxLje9PHav9o
         oqJA==
X-Gm-Message-State: AOJu0Yy4SGoCnHGzoiHQTyc/NXwob85q7F1JNXIpldhMv8RQVub+Trlj
	/16AE7BbG4mdp2yAUutWOSrSWSW5M9CbGazlUn3k5bcAWVkSTBJe6OyL2pmBn0K6AvbwKEGYxtF
	Jq3svQYXeRKvysyz/XVByWBMNE+sxsWrrIxq/
X-Gm-Gg: AR+sD11uLuaN8C2VGp8iu9nqa0w1Kbv3HOqJ08gjPFEJLhbM7Pseot0A/Q8eMV6JKu0
	rdBBhbZIrbOZTygj3xooVU9VShKqpDYcZTNEc30fX0cJZzPEifPTTjxBuhl51HILDpEL7YC0HvP
	k2TEm/ySqcR8A9ay4m+mOph4rWl25jArQXbcxyPukVXjOROOaFpTBN2AayuD6tYfTQ7AnD8Bmgx
	SMXagUQDXXFrYP2or/D/sPvMicJkI50iHILl/2zi1uVo3jibTUSzFmMP8EwDw==
X-Received: by 2002:a05:690c:4803:b0:81d:7a2:f044 with SMTP id
 00721157ae682-81f4c1b9df2mr17185937b3.28.1784849371475; Thu, 23 Jul 2026
 16:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-16-ameryhung@gmail.com>
 <20260723072716.A1D231F000E9@smtp.kernel.org>
In-Reply-To: <20260723072716.A1D231F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Jul 2026 16:29:19 -0700
X-Gm-Features: AUfX_my_bvt3BtXJD1H4wyX3z15ITjeIuNTl1WeQ96Hz0gSr6fjyFnOS0wancEs
Message-ID: <CAMB2axN_qfmW79jfp65qd0FaNyfmMRMByUfytVKZ5s36EkNHdA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 15/18] bpf: Classify kfunc pointer arguments
 from BTF, resolve type against the register
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 12:27=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The removal of the `bpf_type_has_unsafe_modifiers()` check a=
llows referenced pointers with unsafe modifiers (specifically `MEM_PERCPU`)=
 to be passed as normal pointers to regular kfuncs.
> --
>
> --- Patch [15]: [PATCH bpf-next v1 15/18] bpf: Classify kfunc pointer arg=
uments from BTF, resolve type against the register ---
> commit 23915f0b14432c05d0cd9201ab12d531e9b8df8a
> Author: Amery Hung <ameryhung@gmail.com>
> Subject: bpf: Classify kfunc pointer arguments from BTF, resolve type aga=
inst the register
>
> This commit refactors kfunc pointer argument classification to rely on BT=
F
> rather than the caller's register state. It also moves the referenced-or-=
trusted
> checks for BTF ID arguments into the BTF ID resolution path.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -12383,20 +12376,46 @@ static int check_kfunc_args(struct bpf_verifi=
er_env *env, struct bpf_call_arg_me
> >                       break;
> >               case KF_ARG_PTR_TO_BTF_ID:
> >                       /* Only base_type is checked, further checks are =
done here */
> > -                     if ((base_type(reg->type) !=3D PTR_TO_BTF_ID ||
> > -                          (bpf_type_has_unsafe_modifiers(reg->type) &&=
 !is_rcu_reg(reg))) &&
> > -                         !reg2btf_ids[base_type(reg->type)]) {
> > -                             verbose(env, "%s is %s ", reg_arg_name(en=
v, argno),
> > -                                     reg_type_str(env, reg->type));
> > -                             verbose(env, "expected %s or socket\n",
> > -                                     reg_type_str(env, base_type(reg->=
type) |
> > -                                                       (type_flag(reg-=
>type) & BPF_REG_TRUSTED_MODIFIERS)));
> > +                     if (base_type(reg->type) =3D=3D PTR_TO_BTF_ID ||
> > +                         reg2btf_ids[base_type(reg->type)]) {
> > +
> > +                             if (!is_trusted_reg(env, reg)) {
> > +                                     if (!is_kfunc_rcu(meta)) {
> > +                                             verbose(env, "%s must be =
referenced or trusted\n",
> > +                                                     reg_arg_name(env,=
 argno));
> > +                                             return -EINVAL;
> > +                                     }
> > +                                     if (!is_rcu_reg(reg)) {
> > +                                             verbose(env, "%s must be =
a rcu pointer\n",
> > +                                                     reg_arg_name(env,=
 argno));
> > +                                             return -EINVAL;
> > +                                     }
> > +                             }
> > +
> > +                             ret =3D process_kf_arg_ptr_to_btf_id(env,=
 reg, ref_t, ref_tname, ref_id, meta, i, argno);
>
> [Severity: Critical]
> Does this new structure allow referenced pointers with unsafe modifiers (=
like
> MEM_PERCPU) to bypass validation and be passed to regular kfuncs?
>
> The original code explicitly checked for unsafe modifiers:
> bpf_type_has_unsafe_modifiers(reg->type) && !is_rcu_reg(reg)
>
> However, is_trusted_reg() unconditionally returns true for all referenced
> pointers. If a BPF program allocates a per-CPU object using
> bpf_percpu_obj_new(), it receives a referenced pointer with the
> PTR_TO_BTF_ID | MEM_ALLOC | MEM_PERCPU type.

Yes. This is a regression.

I will replace:
if (!is_trusted_reg(env, reg)) {

with:
if (!is_trusted_reg(env, reg) ||
    bpf_type_has_unsafe_modifiers(reg->type)) {

This also fixes a latent issue where referenced reg with MEM_RCU would
be allowed to be passed to non KF_RCU kfunc. This is not triggerable
since there is no KF_ACQUIRE | KF_RCU_PROTECTED kfunc.
ref_convert_alloc_rcu_protected() also clears id when adding MEM_RCU
tag.

>
> Since is_trusted_reg() will trust this referenced pointer, the unsafe
> modifier check appears to be bypassed. If this pointer is then passed to =
a
> generic kfunc expecting a standard kernel pointer, could dereferencing th=
e
> raw per-CPU pointer (which acts as an offset rather than a virtual addres=
s)
> trigger a page fault and crash the kernel?
>
> > +                             if (ret < 0)
> > +                                     return ret;
> > +                             break;
> > +                     }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D15
