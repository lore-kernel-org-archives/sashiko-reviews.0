Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67353322B9F
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910564; cv=pass; b=GuRBhhBn/np6T8O2HWU+FLE3/LuU5gcHAxPItBN7/Uj1i9lbd5ZLMQBc6iPeTNvf1Q34Nlolhu1VrAmy1omee8Ccpm093fDlpGKUGv8rRwJG+IofvZpiTOt8rvBeyEm4EsYHkqX7IAsv+z+bF1uaqpaEC2CxIE0JLX2B+AIGg4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910564; c=relaxed/simple;
	bh=eiLri7nlGvjARufQYKavsqrnbicdoE8hXtUZaLQQeSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrGSSEerQvOMUikZSDZ+KYQVvJxvYgjTeyuwnCnY37E7FmYaTXFV4WE20jpEdN8X+ImWEJrwguqu9R4yCyfm8Z4cTXm3OSY+yhDONSC1E9XFzwdLVRFpUwVG5qaCNKG7O47L3B5lre+/ivEFzlVKzSOaM4hubNQAkuC/3jeCIwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjBiYI34; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjBiYI34"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81e6f2ee60bso13516497b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 09:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784910562; cv=none;
        d=google.com; s=arc-20260327;
        b=IMrH1JrTbyyufWDv6jFNcO01tkSzvxgShluiYi5UrNnlW3lJ9+qv1Qf3hu6SCbVnDn
         kBfFdapYzaM21QiqSb9DjAO+ZTmuHlAO4rX/bYVzE8wJg/T+exKojQzDuIzOlhdmbF7V
         1LmEmXsOsC4myzcNKxUGrQR8v3iNK9m79GnnwDNB+nSX4WYwMZ0xKl5/O+PqeDvhn5YA
         RQPaCYSUbhlpDmM7yoLP1qyxvZWeZWeO6EmReGpCo8J6drAYXtttTkZ6mKYFyucEUKHJ
         dnHhQCqC2PuCIn2YCX9uyofAHJBuoqUkhWBnjttWXu15GJTLEq8nBYufY1pP+Xzm7LH9
         C+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0E+HrKhU17MYywCk8O/iPWCgtKjnfsVN5oK8hiTFYg=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=e0eo6hkn277vVY2gOhoSIt0JygmELe6HDDmJ2+2np6P9tuFScR74ulZz1tUF25craC
         ZnM87aFVrv6+pO4nX2WtMQfeVsc7xGO0SYxgMkf1vh8wxAYDlPMsSRI809POsnOKmE+x
         c8pKuOW7vkhBf/BDwzcREdPlRI2OGFa0/2u5QO4s1XsZsi5qBmjDbg7p3kyy9Ai0c/7E
         jF7Nf7SHkNhR52GTKUxYgwGkA27pXhecOh5mAaHvtmo12VcH4hRJJpr9OBUIqfsy2/iN
         dKYEWt0hzZcSJOo4qXUcTX3ZerTRzBlvvs2p0YyzU6IdqV/lgGC7LEOYWrQPUb2VO6jZ
         uuWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910562; x=1785515362; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o0E+HrKhU17MYywCk8O/iPWCgtKjnfsVN5oK8hiTFYg=;
        b=cjBiYI34yNLLi5EB+C6daKXEi9mEfRE1uELGPNLeGd4ByrZkE6w5qgjcKTx2Jw7iAA
         VLljOoiVA0suQr4+1EsdIxXYe12jBERcvHg0et/shaazHmMtU7Kx8DyE9djdbXi56cRm
         /pvx6+UnqZKRbmS4loqA4hP8Ok0Dlb2zldb+MnNYezWT7fvV+B2Wgl07Iwyp9z+bCEfZ
         ZGc7EbKKmqLMAu7Eg690zHxmO7n1WzmdKiv6MuGt4IJOCmzj8x9H4FfqVTI2/WsIR2XW
         s3AhPkXKdmBh6J2D1upmFdDFy8yzC1NysY1aw+HY5ccEz9KzvatLgUMANnDU9eaEBuhd
         RnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910562; x=1785515362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0E+HrKhU17MYywCk8O/iPWCgtKjnfsVN5oK8hiTFYg=;
        b=gEsJk0mos52OAIb3ZKZJwJJGXmC8juG429XWJmJCfGlNTXT0FoTsP0wZhQHP/SbltC
         xt5kysrU51PKRHbVV482tgeQLIQ9iylyOulk70c29R75hiC/yaL1P0ZKuljEunKrXTzQ
         WooMZNuZmcfbi8NSEM4r49TZ03cNWPRIgbMrCdxKCxsgSMn2evvF5j9BWVfw59I/FG19
         PWNPWdMQZcLHtWXtM79dDCwH3NFFxbu7NThPn6oMlSNaevvzjWtVpEPpYne7fjwTtDI4
         Gg5Y7agHl8IET0wIl+6t1TCW7lLo3tpRx0a8PWljoAWZnsXvhIOnDuQ7wE2o8y8Ub3XC
         tFoQ==
X-Gm-Message-State: AOJu0YyzI1c4b45QmlAB7XRfozKoLuEpAU9LrNFtoJfd4ZgtcxQBxuJN
	ion/07qkYJ66LnEIuqMvzu4S2ieBwl/LBnQk3tqhy5ajq7dhP0KQxOL7AJQv0jLPbXz1aFLpJEn
	QNBxc3yqgt94bVDnhlBoFq3ZfPo6qe20ojNcI
X-Gm-Gg: AR+sD11Hve+9dZ+Lok9lsAE7tdNj8RCAQ7ZO5bN+Au8/LBE7JQFR3i7dtYgGJpkGgr1
	WtJZUJv4jb+5HqfDQtZWtK72RSivhBFtWzRgqVFigL9pjwsbi2gji6289MLBEFDmQ0PaODYi6ts
	e0QSAMybEPqKfnyhRBWaeXSrkOEKabe7NR+S9pv/DuP1B4yTD7v3mq0Pk0VPAsQBu32t+PAH0e0
	2hq5BKJbRo7PaboLpu54Li+1neqAjxPy0s01LDakjNIzRVFBrBisnz0jYD8uA==
X-Received: by 2002:a05:690c:f07:b0:81e:c38e:4bf3 with SMTP id
 00721157ae682-81f63bcff14mr3477987b3.26.1784910562292; Fri, 24 Jul 2026
 09:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-18-ameryhung@gmail.com>
 <20260723080103.AE5CF1F000E9@smtp.kernel.org>
In-Reply-To: <20260723080103.AE5CF1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 24 Jul 2026 09:29:11 -0700
X-Gm-Features: AUfX_mxON2WAiG3iq5irnRXSgNH4j5x1p07ciXkqimDB5AI19VYzK5IjC1ulqzs
Message-ID: <CAMB2axPrsX+2fbKf--2M7oGBW68oWK1K+Ftt=SQpiYrcT0zvSQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 17/18] bpf: Classify scalar kfunc arguments
 from BTF
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 1:01=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] The `KF_ARG_MEM_SIZE` argument type completely bypasses the =
`SCALAR_VALUE` check, allowing eBPF programs to pass massive pointers as bu=
ffer sizes.
> - [Low] Uninitialized variables `ref_t` and `ref_tname` passed by value t=
o `get_kfunc_arg_type()`.
> --
>
> --- Patch [17]: [PATCH bpf-next v1 17/18] bpf: Classify scalar kfunc argu=
ments from BTF ---
> commit ea739f7fbc71c6a534cb3103ddbdf3b31c5f391a
> Author: Amery Hung <ameryhung@gmail.com>
> Subject: bpf: Classify scalar kfunc arguments from BTF
>
> This patch updates how scalar kfunc arguments are handled by moving their
> classification out of the inline register state validation and into BTF-b=
ased
> classification. It adds specific KF_ARG_* kinds for scalars and separates
> BTF classification from register validation in check_kfunc_args.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 24858a38c34cf..ba2608592bd5f 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -12130,11 +12122,13 @@ static int check_kfunc_args(struct bpf_verifi=
er_env *env, struct bpf_call_arg_me
> >               if (reg_is_referenced(env, reg))
> >                       update_ref_obj(&meta->ref_obj, reg);
> >
> > -             ref_t =3D btf_type_skip_modifiers(btf, t->type, &ref_id);
> > -             ref_tname =3D btf_name_by_offset(btf, ref_t->name_off);
> > +             if (btf_type_is_ptr(t)) {
> > +                     ref_t =3D btf_type_skip_modifiers(btf, t->type, &=
ref_id);
> > +                     ref_tname =3D btf_name_by_offset(btf, ref_t->name=
_off);
> > +             }
> >
> > -             kf_arg_type =3D get_kfunc_ptr_arg_type(env, meta, t, ref_=
t, ref_tname,
> > -                                                  args, i, nargs, argn=
o);
> > +             kf_arg_type =3D get_kfunc_arg_type(env, meta, t, ref_t, r=
ef_tname,
> > +                                              args, i, nargs, argno);
>
> [Severity: Low]
> If a kfunc call has a scalar argument, btf_type_is_ptr(t) evaluates to fa=
lse,
> skipping the initialization of ref_t and ref_tname.
>
> Could this result in passing uninitialized variables from the stack by va=
lue
> into get_kfunc_arg_type() during check_kfunc_args()?

No because these are only used when the arg type is non-scalar. The
next patch also resolve ref_t and ref_tname in get_kfunc_arg_type
instead of passing them. I will make it less confusing by doing it in
this patch instead.

>
> [ ... ]
>
> > @@ -12435,6 +12462,19 @@ static int check_kfunc_args(struct bpf_verifie=
r_env *env, struct bpf_call_arg_me
> >                               }
> >                       }
> >                       break;
> > +             case KF_ARG_CONST_MEM_SIZE:
> > +                     if (reg->type !=3D SCALAR_VALUE) {
> > +                             verbose(env, "%s is not a scalar\n", reg_=
arg_name(env, argno));
> > +                             return -EINVAL;
> > +                     }
> > +
> > +                     ret =3D process_const_arg(env, reg, argno, meta);
> > +                     if (ret < 0)
> > +                             return ret;
> > +
> > +                     fallthrough;
> > +             case KF_ARG_MEM_SIZE:
> > +                     break;
>
> [Severity: Critical]
> Does this allow an eBPF program to bypass the scalar check by passing a
> non-scalar register as the size parameter?
>
> Because the KF_ARG_MEM_SIZE case label is placed after the SCALAR_VALUE
> check inside KF_ARG_CONST_MEM_SIZE, an argument that is exactly
> KF_ARG_MEM_SIZE will jump directly to its label and break out, leaving th=
e
> register's type unchecked.
>
> Could this allow programs to pass a pointer as a buffer size, potentially
> leading to out-of-bounds memory accesses?
>

Right, SCALAR_VALUE check needs to happen in KF_ARG_MEM_SIZE. Will fix.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D17
