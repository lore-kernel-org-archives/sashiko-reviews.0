Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28C386423
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 18:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620418; cv=pass; b=lIhQnpOtEUFpRg0r8E0XdjW0wztNZDx0Am65ogH8YHPnhv2XBBLD+go0Rei+x74ZXWze6+vCxWc8Qd/chHGiwBYJRP1AE2IQD2nk6ujjbiqgX8sDaMzQCaRtOF3z55tIFG9DsW1i34hp959oBrurYoZiuWQYaYQ2TarFtMgnJvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620418; c=relaxed/simple;
	bh=t0yDPJvdEtGqTqYBpAtdipUVGNWr+/cPQ70R+VoF7EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcHdffSU9TNMTHqnrxA4HVlSAU++jYCpCOG0uo29EoujqbkLqxq2ESchpDEkRZU3o2P8yzsKRSN9NHYlJWd2qs+XwgF3p1erICPCfjxS3N2buA2j/rBtSAffP++IX/NIIs0EIC9oke7sNusuSNb8sCd9+qfHqEG74YGJVCxYUB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbb9WEtE; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbb9WEtE"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3defecso2599603b6e.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 11:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790620414; cv=none;
        d=google.com; s=arc-20260327;
        b=Ycx6WM+LLaU9EjK5nPYIvPbErdfJP/1txN44WAfrUQ0mH3m+LWvViHMxnzzLT/ozvo
         Ao7FdGBi4e4v2oUoPZLyo8pUv3ogC3FlilCkl8Qbnk/P7IB6UqZVuJ1rqYGrwqCRyanD
         hPLshxL4dnwL53G0mxXlXMNggltdBDOWIwBOmUYhWys2/cV5G0ofvtUMqgb9gD/wV17f
         RgNXGAKKiue217Y1dJ42vPk9W5ag1FsvInrKdmg+GqLQXvxSj0mIxkalv0mrWDmZBrXR
         G9WHZDjJgFeRrComkiBqyXRfqiYsvoVCgV9aFzxXf0EF1x3LsBxMgdty1cqChPAHrqem
         j8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJv0YrgM9Mo4NiT5Hn/XU5a/l8or40BlSM4zqfmb43I=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=iRXwZIItzjP0ow+5JeV7MblgOZAMlJN3WNKIY+pBq5r9C6nNJ/Um6XnmFBFXZ+7beD
         p9Ypqd6GxMIFNzja/RSpcCnrFMNQCdllFMX6zAiiv8EfjafYjbZQIuMaxFR7R/tR2saV
         v6ja02gs+Me9gFqaOrXmDbhvgKFMGqxw+LVKFaJ7lXS3z0q7tOohboppG7ojgTYHcVtm
         Oifh7gDkisveQx9QWpP+cHmNyFRk+otsAg0w75yz5ekhyzwNOm9x/EfNJXtk5s8tNRhy
         eoBAm4PkdxppJmQNqCGNHRMHBkW9svbABaByecHAMSqMG3/91Mt/WsV3gkfZR+wRn9d7
         kAEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790620414; x=1791225214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJv0YrgM9Mo4NiT5Hn/XU5a/l8or40BlSM4zqfmb43I=;
        b=mbb9WEtEInmFhRVDGP+Redu/4TB7F28hZEAbPnYanMK52glm85QN3kim/zJ0VQjZSP
         BFvbImDwuPDou21tgdV3MJxH3r9o8y9UOr9Ln3Ysq0MxwCnEsItjUirB2i63CeW63F9m
         DoYHnG34kLAdUQLpFZYF5Q3JRUX6M2j7SEtddpfxD89kOwXWEmaHzpzwLL5AKn1PXP11
         lx9B6s79gOIE9P7uobg+hlUWb2SVLID8nLYotz3Ppa2szE1F7k/czr8uajn43HFOr9rT
         FdEVw9yoRoMuu8pPBu9zuGGDdPEdiTN7gmBiiZ9lYbJ2OclloaoWqlswjd41CB49X+uP
         0fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620414; x=1791225214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJv0YrgM9Mo4NiT5Hn/XU5a/l8or40BlSM4zqfmb43I=;
        b=gCjX0LmhsDMwAi0sdzjwn9tviE/tcASKHSUretUJjssINmEeoSFbalfJvef30vV1MX
         sbYJcID1vhZkwFm4o8bfd6S4Qvu9kjfiQdJph+AHUVJaxw75CKWg9q/eP18VEleJmw98
         RvH8mIE0/sMkHUxV4Rt8VEdPeeY+CUT+FvIOK1ksL2GgTwIwJwONPS1J1tR1k1AzoQiZ
         +7xOzsAEpydsW4+eUOWn0kBQ2osThNNjWccqjIdnnEWCOAuc0mK0ORz6kBR1JKEfjNrr
         t2XmuEfcYcaSS10Gk3B7ILPy9VhoIcjy1rlymkbQzTI6ouSVaCQeNIARjvuMY6SipBUq
         HaxA==
X-Gm-Message-State: AFuF++khqISFF09iNPP2Ie0hy+5JYbn7/CBoUKmjFI0ZaUXfCwkisssP
	eojkk+g0Sm4jfpPgtDIEUa5oxBqviiZhPMFESpTo810exXs0x7zj/zbkOf+xfdGqy8O/4jMl0km
	KLi94ngeEyuseB4JGDK0DMHieFwr8Ly9EpQ==
X-Gm-Gg: AYBFou3V3c8547p/TrtyW6eaMWKtdoUdxWQTvgkEIDkRspZ0VsAvPb77DaPCadcm7GF
	L3dAzv24OxXa2FyW6almhOfO9NmqaDVpS6TCo7p/qqJSMybMUglJDBOb8Ooe8/eBO87/rOdESQt
	7agH84gpxDU3EWda/sokrgj/VWsLPlkcN5+FK9ES5+Xkkh84cHuYceEHz4726jmYstBtdNhW1Xi
	buZbMt6OR5a2vk+RzbA8MGp/qLWAm1+cOTfLQ3eVIjw6WX2ZN2u6QWRo6vH9Zowh6oR10YLjIpK
	kziE/lSCeHAvwm5UlnDvYn4eK5PYUBrGHajIFjV8jisr8ZWLTQcbUVY=
X-Received: by 2002:a05:6808:50a9:b0:4d7:22cd:51cc with SMTP id
 5614622812f47-4d72aa5b173mr17373947b6e.35.1790620414186; Mon, 28 Sep 2026
 11:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928181414.644158-1-ameryhung@gmail.com> <20260928181414.644158-9-ameryhung@gmail.com>
 <20260928182823.0EFEF1F000FF@smtp.kernel.org>
In-Reply-To: <20260928182823.0EFEF1F000FF@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 28 Sep 2026 11:33:22 -0700
X-Gm-Features: AclHuK8HINrwTptjbFI71Pm_-wCViCSyK26VqdhJFYXA3tuWxpYFVyBj9WHNrwQ
Message-ID: <CAMB2axOEyuY67huG=POzf4ummgSFcQ-sGYX6-0kOXTdQEYfaLw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 08/11] bpf: Check subprog dynptr arguments in
 the common path
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] bpf: dead code and unreachable diagnostic in process_dynptr_func(=
)
> --
>
> commit a02951e0de8834e87c650bf3681861699a204241
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Check subprog dynptr arguments in the common path
>
> This commit routes subprog dynptr arguments through check_func_arg() to e=
nsure
> register types, offsets, and dynptr states are validated in a common orde=
r. It
> also updates a related selftest to maintain consistent failure states acr=
oss
> different compilers.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index efb20e50c974a..075002f6a59fe 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -10883,7 +10883,7 @@ static int btf_check_func_arg_match(struct bpf_=
verifier_env *env, int subprog,
> >               nslots =3D btf_arg_slots(t);
> >
> >               if (arg_type =3D=3D ARG_SCALAR || arg_type =3D=3D ARG_IGN=
ORE ||
> > -                 arg_type =3D=3D ARG_PTR_TO_CTX ||
> > +                 arg_type =3D=3D ARG_PTR_TO_CTX || arg_type =3D=3D ARG=
_PTR_TO_DYNPTR ||
> >                   base_type(arg_type) =3D=3D ARG_PTR_TO_ARENA) {
>
> [Severity: Low]
> Does routing this through check_func_arg() render the register type valid=
ation
> in process_dynptr_func() redundant and unreachable?

Indeed. I will remove the redundant check in v3.

>
> Since check_func_arg() calls check_reg_type() before process_dynptr_func(=
),
> the requirement for PTR_TO_STACK or CONST_PTR_TO_DYNPTR is already enforc=
ed
> earlier in the flow.
>
> This makes the custom error block in process_dynptr_func() dead code:
>
> kernel/bpf/verifier.c:process_dynptr_func() {
>         ...
>         if (reg->type !=3D PTR_TO_STACK && reg->type !=3D CONST_PTR_TO_DY=
NPTR) {
>                 verbose(env,
>                         "%s expected pointer to stack or const struct bpf=
_dynptr\n",
>                         reg_arg_name(env, argno));
>                 ...
>                 return -EINVAL;
>         }
>         ...
> }
>
> The selftest updates in this patch seem to confirm this, as the expected
> error message is changed from this custom diagnostic to the generic one
> produced by check_reg_type().
>
> >                       ret =3D check_func_arg(env, arg, slot, 0, &meta, =
env->insn_idx);
> >                       if (ret)
> > @@ -10912,15 +10912,6 @@ static int btf_check_func_arg_match(struct bpf=
_verifier_env *env, int subprog,
> >                                       reg_arg_name(env, argno));
> >                               return -EINVAL;
> >                       }
> > -             } else if (arg_type =3D=3D ARG_PTR_TO_DYNPTR) {
> > -                     ret =3D check_func_arg_reg_off(env, reg, argno, A=
RG_PTR_TO_DYNPTR);
> > -                     if (ret)
> > -                             return ret;
> > -
> > -                     ret =3D process_dynptr_func(env, reg, argno, env-=
>insn_idx,
> > -                                               arg_type, &meta);
> > -                     if (ret)
> > -                             return ret;
> >               } else if (base_type(arg_type) =3D=3D ARG_PTR_TO_BTF_ID) =
{
> >                       int err;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928181414.64=
4158-1-ameryhung@gmail.com?part=3D8
