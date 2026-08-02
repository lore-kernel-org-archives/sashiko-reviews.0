Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B9237FF5A
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785705442; cv=pass; b=mAlaN03GFuCgrHG5tyUk2PFhVwLRA+tH5cw9h6HB25e+YXBZ3vTq7VeZPT6srvN2/GmdOQ9+PsBBPK6xqQ78P5xuaHOtNwmT9bxYps1gKKVD6qkcEytlnjBy0yRYnhY1U4gjcxRBOaTCOm6My3Z9j4DTiFDdd01i1gf6/fA0kEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785705442; c=relaxed/simple;
	bh=g4IWA26zx0bHnq3hh34jBR4BuCV9r2Uy61AF0oiLWC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhOSCUUqIqxz5ekbm7bfMnGKiIAbabBvV7dGiClhmmGEJ02d03K6l/4V5CPauBj+0gi1pgKRkdee/AaWNVIrtiZpnAv0FBSp9Navq5J+RuUqOIqPgUtiRJrogYOkYHel8Bjj0Mj43LWzTBk6qGH1BUBObw+Am1PCEsdOu8PXXWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swetO6JH; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swetO6JH"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8143daf89c7so25048217b3.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 14:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785705433; cv=none;
        d=google.com; s=arc-20260327;
        b=ImF7wsTePy2ayn6qt0FKHrkp5bV2efsXn3YWV1+CPTh5Zvskhaf+rSzxlCa7aksYIN
         rqWNKA3CTXfdXELza40VnhnATtbqn/JTJA/8qOxuVnJVXK/Pkefk8pyUl9bkMCtw52Yu
         htoh+tYUSRjvxbegoP1mrApZZE3A/dGtGZkc41RvZxBEXk9Qvd5jNxtMiTxLsiRgy2L0
         n8m64pN8f0GwgzSiI1KirvNIdXyuewY1zqcMcbHQG8ovVH+Su7FCFS7Uav5sqDNurvH9
         2et8DZQphZwBg/tKTaGuSG57GPCO0QtrfD5NyFVqic8cL4DfGgWCkFZtBw49g8uAaOjZ
         sC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFSmz8MhaD6rw0nUEtZ2eNIsd9/R8mrR1PriLE2pH+w=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=cV4k6BTHBPJvaP40vp2UQrSPPbRNuOZHS4pYXib781ffBtYSJQKnxFo7ZxK0J/VzPv
         eZwXmWQ5fdLg3aCM/J0atyREhRxGiMm/JtanW3yAjqGrL/EJQMchkbUG61Hj2RUbJ7fQ
         KZY0x90jdnn1M6qPlZqfVBNTvHNt8hQtzDO4ee5sLx8mgKWLfdd8O6EtKATtCzrsdz7V
         cI3YvnZYJcdQ2qS0utY1GLl+jRIejDNF1HaEx+U0+gT0nXt49lc6NUnmmsbcHVKIooYu
         8R0vw17bsRC77pvnQi+elrLAiEHFH67U70xuWSFL5QBRteak5Bz3SQ6oAgu4krzN0g+H
         MD6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785705433; x=1786310233; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFSmz8MhaD6rw0nUEtZ2eNIsd9/R8mrR1PriLE2pH+w=;
        b=swetO6JHE/x4X3mxozA0SycwGjkZSF2WVOP1R77BHIsYACSEDCtRrMixdqCo2kFIoe
         WX3jnT4NqceRJFKWuOuRnsVwuaZAO0XdrziyihG7E2TBxLr56fKdSd1RH+nNiN/Cr8Yz
         o7SgA701x31WXYDvsLGXiqRZnbTVu0YCuMdmEKmFMRFdLzl+u6uCrUj9ZbvxtUSYTYHh
         xuU8W+5Rwe6Tv75hXGnyTqFMsCnVhcZhAgCjbGCywC6KobCxNI8Uvljjz31UJaOAkIG9
         AKaezf3aI0rDbH1X5VQWeiZl9FPPVP+HtodxtffKsd66LkjRNkcj/BD2EdC8aWqjYhN9
         zhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785705433; x=1786310233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFSmz8MhaD6rw0nUEtZ2eNIsd9/R8mrR1PriLE2pH+w=;
        b=XuW60hjGWzTYGUUGchNAp2r4uNtQQqu8UM0H6Cn726zM7jo9gelefou+7AhyaKdz1k
         PB9IF53id7Mv6nbede7mUgKLphey/TLNO/D3gBTUxsRVGKjIzeN9m0Xiv7c6wWzzBtcK
         iAxTGqydvusIb2iDTz7BhBEDWnRf9uoGjqbNbGB5Bj7Qoz38/MjJ15ZJdW/jAoRDxRqW
         sqzZwEuI7v8y7rdp7LaXYxKcpvO9+7gGP9F4yKAts5DZn9vRwdQR2N8pBdrom1FO9JPr
         lbxTqSjEKNUjLwzVLweogyRboOeErHu498ZKPgKpEX9wOq3SWxBQNFa+sWhm3DddK1E7
         +HEg==
X-Gm-Message-State: AOJu0Ywfx8ZtNPDF2U1yr4rK1pHEyVsRZceTmTXEUDmnU9CFAG2gEVLB
	b5946CP+6ek8nLZ9qxmwCM309RiA351ONt9KdslEktikA9/h6Ir+wtlACfD6QfmfdBZOjFuK1az
	dqd9uhJzV5xW8CH+xsJIOPupqBoUR6WmOvGcd
X-Gm-Gg: AR+sD13phGAvnX2Nir2mIrwohSsMdCMjYb71+ZsiA60Ah3M9K0Jf5n25EiETht3XCVh
	l36uqT6TBUQ1K30R6AR8g1DsZWxGWeBvCcjDmPYSEgGPaw4IGFwqGmvOrVURuj66DgHI3oRij7U
	8zNEEvFU9nHVPmaycdOet3h/45urTTU65BiyQ1v7aBO2Irfo3HrG/IyM7NNTj5SQ+T5TgxW2w5/
	4Lpk3UjGkFSlQu7762nnh1YW3MhyMbcAeHw8BUggf04W1U7ATcTL13ktlVlwOwPmRJXfz8aWPkE
	36QajMOcg0rnNC4xCifGGRdwcipRGZIHomw3RLzyqJduxw==
X-Received: by 2002:a05:690c:6012:b0:81d:e7d2:a46d with SMTP id
 00721157ae682-81fd49b4b75mr106198867b3.5.1785705432922; Sun, 02 Aug 2026
 14:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260801074633.1595644-1-ameryhung@gmail.com> <20260801074633.1595644-16-ameryhung@gmail.com>
 <20260801082246.17FB41F00AC4@smtp.kernel.org>
In-Reply-To: <20260801082246.17FB41F00AC4@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Sun, 2 Aug 2026 14:17:01 -0700
X-Gm-Features: AUfX_mwqin35OOhhJi4HSRb-zRXAQeOE2bagBf40buMwDEnUQ6iYIq0e4QK1WXA
Message-ID: <CAMB2axMVAk70e8ktN6_kr_8Y6N1yV8gTfJ4JyhDooGwg46j19w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 15/18] bpf: Classify kfunc pointer arguments
 from BTF, resolve type against the register
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 1:22=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Allowing PTR_TO_BTF_ID as a KF_ARG_PTR_TO_MEM argument is eith=
er broken or fundamentally unsafe due to unvalidated access flags.
> --
>
> --- Patch [15]: [PATCH bpf-next v3 15/18] bpf: Classify kfunc pointer arg=
uments from BTF, resolve type against the register ---
> commit d5adf1f80d7ac5827091492c5099bcb0c05e15d1
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Classify kfunc pointer arguments from BTF, resolve type against the =
register
>
> This commit changes kfunc pointer argument classification to rely strictl=
y
> on BTF rather than register state. It introduces support for passing a
> PTR_TO_BTF_ID as a fixed-size memory buffer when pointing to a scalar str=
uct.
>
> >     The new design now accepts one previously rejected case: passing
> >     PTR_TO_BTF_ID to a pointer to scalar w/o a following __sz/__szk. Th=
e
> >     argument will be classified as KF_ARG_PTR_TO_MEM | MEM_FIXED_SIZE. =
The
> >     PTR_TO_BTF_ID register will go through check_mem_reg() ->
> >     check_helper_mem_access() -> check_ptr_to_btf_access(), and by defa=
ult only
> >     read is allowed.
>
> [Severity: Medium]
> Will this newly accepted case always fail verification?
>
> While the commit message states that "by default only read is allowed,"
> the call to check_mem_reg() for KF_ARG_PTR_TO_MEM arguments
> unconditionally demands BPF_READ | BPF_WRITE access. This causes
> check_ptr_to_btf_access() to reject standard kernel pointers with -EACCES=
.

I see the problem in my wording. So it should be:

For a pointer to scalar arg, a kernel btf id will be rejected unless
explicitly granted by btf_struct_access(); a program allocated btf id
will be allowed.

>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 1ccf3b764c515..9045369ba5694 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -11405,37 +11414,37 @@ get_kfunc_ptr_arg_type(struct bpf_verifier_en=
v *env,
> [ ... ]
> > -     /* This is the catch all argument type of register types supporte=
d by
> > -      * check_helper_mem_access. However, we only allow when argument =
type is
> > -      * pointer to scalar, or struct composed (recursively) of scalars=
. When
> > -      * arg_mem_size is true, the pointer can be void *.
> > +     /* A pointer to a struct without a size argument is classified as=
 KF_ARG_PTR_TO_BTF_ID */
> > +     if (btf_type_is_struct(ref_t))
> > +             return KF_ARG_PTR_TO_BTF_ID;
> > +
> > +     /*
> > +      * Otherwise this is a fixed-size memory buffer supported by
> > +      * check_helper_mem_access(): a pointer to a scalar or a struct o=
f
> > +      * scalars. The access size is derived from the pointed-to BTF ty=
pe.
> >        */
> > -     if (!btf_type_is_scalar(ref_t) && !__btf_type_is_scalar_struct(en=
v, meta->btf, ref_t, 0) &&
> > -         (arg_mem_size ? !btf_type_is_void(ref_t) : 1)) {
> > -             verbose(env, "%s pointer type %s %s must point to %sscala=
r, or struct with scalar\n",
> > -                     reg_arg_name(env, argno),
> > -                     btf_type_str(ref_t), ref_tname, arg_mem_size ? "v=
oid, " : "");
> > +     if (!btf_type_is_scalar(ref_t) &&
> > +         !__btf_type_is_scalar_struct(env, meta->btf, ref_t, 0)) {
> > +             verbose(env, "%s pointer type %s %s must point to scalar,=
 or struct with scalar\n",
> > +                     reg_arg_name(env, argno), btf_type_str(ref_t), re=
f_tname);
> >               return -EINVAL;
> >       }
> > -     return arg_mem_size ? KF_ARG_PTR_TO_MEM : KF_ARG_PTR_TO_MEM | MEM=
_FIXED_SIZE;
> > +     return KF_ARG_PTR_TO_MEM | MEM_FIXED_SIZE;
> >  }
>
> [Severity: Medium]
> When get_kfunc_ptr_arg_type() returns KF_ARG_PTR_TO_MEM | MEM_FIXED_SIZE =
for
> a PTR_TO_BTF_ID, or when check_kfunc_args() falls through to KF_ARG_PTR_T=
O_MEM,
> it verifies the argument as a memory buffer:
>
> kernel/bpf/verifier.c:check_kfunc_args() {
>     ...
>                 case KF_ARG_PTR_TO_MEM:
>                         if (kf_arg_type & MEM_FIXED_SIZE) {
>                                 resolve_ret =3D btf_resolve_size(btf, ref=
_t, &type_size);
>                 ...
>                                 ret =3D check_mem_reg(env, reg, argno, ty=
pe_size, BPF_READ | BPF_WRITE, meta);
>     ...
> }
>
> Because check_mem_reg() is passed BPF_READ | BPF_WRITE, it requires write
> access. When this goes through check_helper_mem_access() and reaches
> check_ptr_to_btf_access(), it will be rejected because atype !=3D BPF_REA=
D:
>
> kernel/bpf/verifier.c:check_ptr_to_btf_access() {
>     ...
>                 if (atype !=3D BPF_READ && !type_is_ptr_alloc_obj(reg->ty=
pe)) {
>                         verbose(env, "only read is supported\n");
>                         return -EACCES;
>                 }
>     ...
> }
>
> Could this unconditionally break the newly introduced feature for standar=
d
> (non-allocated) kernel pointers? Also, if the BPF_READ | BPF_WRITE flag w=
ere
> simply changed to BPF_READ to pass verification, could it introduce a
> vulnerability since the verifier cannot guarantee that the underlying kfu=
nc
> will not write to the buffer?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801074633.15=
95644-1-ameryhung@gmail.com?part=3D15
