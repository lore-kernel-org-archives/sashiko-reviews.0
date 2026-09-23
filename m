Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AC541A56F
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202111; cv=pass; b=TG2yKWJReFDqWQzrZqsW7aCJDZdIIWIO4qXi2mtxLIQnDmPWdzQckCsqeo45tHChXFjR1IzXIlDZswyOkkC6haO4aQof7GGBh/N5s0UY8qV7PcP2HOQeyEi0HGHbWkuaINCdPHFHDEVJULczKKkeOLh0OyAHPZwmDIdAxbk7QnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202111; c=relaxed/simple;
	bh=tliYGNFTpwD+P7c3MiJ22dL/iRQQdvYPsDg/ctQP6Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQb3bbaZcOtXnwhdzobFzqbdDmh0SXgVZJLVey+MllUlc+spnVCZvMg7q5evfmc3oInFDuocgSCuIArtlLaGXWXPJlfHmmKYNaPJ8G5+cHNx0I82nTMVpPBJCrixTXEruEMz+kxXl+Q28w0ATkR3/we4KMQGCOWhNXeRTKJSvAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kt+LMjAD; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kt+LMjAD"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so15359c88.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 15:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790202109; cv=none;
        d=google.com; s=arc-20260327;
        b=pkRdYGltljqMAqHUchmCS65CjL/ITSzsXf9SZ8jyCVxI+WSwK5Jau1ZkqAchO1HK+L
         1FsVZ1E8UtW51kb74gJzj6B8jB4EoVyT7PX1XJUq82ejxJRD6UCsnd9d4us71nZPZeMe
         dUptXDPo9MLISJAtq2VghPzkCQSuHUrdiDLtoPXSowZov7qEDpFFAGcMNYc07+tBVtun
         4d5rLyUr9EoFh9ItE+GlhOV1OKh5YtFqwvD9iNc4kaRQGqciyBn/SjEgmB4tm/nIVLrh
         VEA4042fnHckMeerc1KSv9IK8F5vKkGFz9n9kp2hgp/PLq6hvSXBO0gpKYQ/lFLRKOyV
         lVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=esE/zmEZJv3Gumf+k+6MWUx8NLOwAoSQg46jivr0oLA=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=olP+E1NcAgHltooZt5sKOvc2Jg+YxHsa8u/l1NkhT7t5sIMBgdJxZ4g6jvc55/dUiN
         3Ll7NjIWEV/X3Sc6QZGp4WyY1T1Oq+4qGYMxxvbxxPnmiMZbYPIs3Q+OckBrXcwsWNyk
         o2JDqw9z3+NEWocpRz7G/y44k6cNWgvp8ZSFWlZuqZE1pf3q8niIT3XVjQ3QKxkw+Sf4
         NzRmTB7ZsRE6RG6uDFVyqaqxlxOE5VgbMaZrIJdW7fn6p9eRGWHuSLKbAoyDfoSxv1ao
         WSIf1VtJdPKKWAN0fFuXn5It7R3vcka3leqam8bR7hr0aeb5GJmxvoveFFN22pwse3QX
         w3Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790202109; x=1790806909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=esE/zmEZJv3Gumf+k+6MWUx8NLOwAoSQg46jivr0oLA=;
        b=Kt+LMjADm1omYzfZy38Ke0Xn2z58u3XSpL+v9GN2EjQvCQYQfGf40YF0KO1iikRJO3
         F2S2rIGnqQ0NQ8FTm8Qn4GXAVdr2lIw+OtSXjWXG6SGM+8BxsKuVaMcvHijOFoWG8E18
         USLwDK4GXP2juvBGA0WPhRr5o2xhxXP2CTuXZucqA1MP9JfjXCcmzLSM8dVMJZTOxb1l
         v3Er623Md9wur2j7ed+zFz4qwX+XK3xE2xNg/QXb8XZ/ZVBoRJ57BdvZeICkD4EzPpF3
         Mm7kA0qZXC4YSWEy7/utcAUBw+6GCTHed4NgIn+qv08PPlmfIX+BCNUfKCGRIKmkkn3D
         BshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202109; x=1790806909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esE/zmEZJv3Gumf+k+6MWUx8NLOwAoSQg46jivr0oLA=;
        b=2JXz2tcCnm1B0vE8qDDRraMC0ch8YZt7lHUrLWnhKD2ApDCFFQOnW1ic9zmZG73H1k
         2BWNnvVPKWr9vIQ1fxArUyQ4x+G/XjN11fxvULkZUiGjv3YT4YSQEycSaeuBhAPWE3+7
         SEJkkS2k0kV9+CHuoPHucBX+OMKYiWSUtJRS8jYXjGcadFa6+lA3/K6fmk2L1vDQHv7Z
         grs/Ii5m6VhBpI3gOUHbBGOgX8Dm4rN/5IMsmoMItJYK3g/VuNpUos4UdWfa2IcsdCLV
         IgFtyG4N/pSJB6zlz0+eYn5iSgypX2mEYfXLDk7SEh/JEDU5ptEP4SmUL6qtlyqbC46S
         pknA==
X-Gm-Message-State: AFuF++nhmKwrXgijAsd7t4+7a0n8VO0/yrwnmAgEuW6gdacvXx7GLDYq
	B8d8dynV1oIYfaH2G849kFLHgfu97+qRFetrTtQ46VpzT1pwkGO8MxIn8toFvLlB90f4YaAdqu3
	dvJWkiqv589AUk2jf41gDmLKOwXXPQxWyjb557N8H56Nufo1lpDXsuZGdWYoQDg==
X-Gm-Gg: AYBFou1T3Ekmyf9RAHG1B4h1Qp0AfnxZoetqSTn9IVq3wTxV6HSNPWemvY6zCrZJdpf
	RIMljRfcc0Sp+w0432dEw9E2cR6u4ljoDDCRuc4PyrJ7n/mt8J77U1BA58IDtHso/jXu60ORJRs
	46Y6pTietlTrYEWTDhpGMBPUqsTeeqKvBVcT2nMpPvOyV1yyomEFjxEPJ9IsbFBIDWNCvAgpfv6
	2S7OkDCx0LYLMDPtzxOghvfkcbgEGSgSstLG8VCI0K0328M7cM3lgdONKS6hkvrayJilrykveQU
	9bsAVdMzZ727b8VpuGNSxXe1ZCQZbSauxcnuPRE4v/B5ukDYOvF1/gLQUEDKBhepyIIt+885WgG
	Ua4VtStBE1tOVA1NGT/tGEgZU1Sq/kmyezorbHnNWUdLN+Gvn1lfjjQotfVTM9T8iiHCF7Lnkar
	NNLDegHTAZ7KJZafSLgObczKY=
X-Received: by 2002:a05:701b:21c8:b0:143:5c2a:e488 with SMTP id
 a92af1059eb24-14503f6e17amr337810c88.0.1790202108054; Wed, 23 Sep 2026
 15:21:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923213719.224838-1-kuniyu@google.com> <20260923213719.224838-8-kuniyu@google.com>
 <20260923220251.9490C1F000FF@smtp.kernel.org>
In-Reply-To: <20260923220251.9490C1F000FF@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 23 Sep 2026 15:21:36 -0700
X-Gm-Features: AclHuK_h4qXFBEFH72kLwaln6D1VfTAMFoRWKPVnz_qUcyz8UJSJ4LddlxF2mHc
Message-ID: <CAAVpQUCTjVNRnaLSA=V56fCwG8tt5_AsGVcUbB4N5kh55vhGEQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 7/8] bpf: tcp: Add kfunc to adjust sk->sk_rcvlowat.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: tcp: OOB write in __tcp_set_rcvlowat via unrelated socket
> --
>
> commit 68bce63bbe5802a4eee99c7c0f138096d7c16481
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Add kfunc to adjust sk->sk_rcvlowat.
>
> This commit adds a new BPF kfunc bpf_tcp_ops_set_rcvlowat to allow
> struct_ops programs to dynamically adjust sk->sk_rcvlowat. It clamps
> negative values to INT_MAX and delegates the update to __tcp_set_rcvlowat=
().
>
> > diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
> > index b0cade34cce65..e93c8d13684ef 100644
> > --- a/net/ipv4/bpf_tcp_ops.c
> > +++ b/net/ipv4/bpf_tcp_ops.c
> [ ... ]
> > @@ -368,8 +368,62 @@ static struct bpf_struct_ops bpf_tcp_ops =3D {
> >       .owner =3D THIS_MODULE,
> >  };
> >
> > +__bpf_kfunc_start_defs();
> > +
> > +__bpf_kfunc int bpf_tcp_ops_set_rcvlowat(struct sock *sk, int rcvlowat=
,
> > +                                      const struct bpf_prog_aux *aux)
> > +{
> > +     u32 moff =3D aux->attach_st_ops_member_off;
> > +     bool wakeup =3D false;
> > +
> > +     if (moff =3D=3D offsetof(struct bpf_tcp_ops, dequeue_rcvq))
> > +             wakeup =3D true;
> > +
> > +     if (rcvlowat < 0)
> > +             rcvlowat =3D INT_MAX;
> > +
> > +     return __tcp_set_rcvlowat(sk, rcvlowat, wakeup);
>
> [Severity: High]
> Does this code allow an out-of-bounds write via an unrelated socket type?

No, from v1:
https://lore.kernel.org/bpf/CAAVpQUAJJ2RmL_dTH=3DM2s2Tj9mypL2YtYK7t6tCSaEj4=
bYY9Uw@mail.gmail.com/

---8<---
No, false-positive.

This kfunc is supported in encode_rcvq() and decode_rcvq()
only, and we don't support lookup helpers there.
---8<---
