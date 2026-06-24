Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA7325707
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782325461; cv=pass; b=ftqzZ/sg7JCDpGgfggIC8qx4t4UXgBSazASfmuod0jW/VICgfMTORtDx2L36h0CTZdWSMghEQrXuGTbkPbar3LY92GEGGG1J0BudglKkILWj1oJt3OkPK7OcrAJGxpUsmEgXxOiMMFfdvL8h2dA7gLRH7X7wndPYGeYjaEtsnFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782325461; c=relaxed/simple;
	bh=Hb4xLTgfJp/9y8lwsQ79+W67aztOiRgsiVtE17jRaQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlxJnEkIMncbnx5MyN2TgjgRdqi3VHsOfS9nN8eGlHsHqAnkXzSwQn+RRNzJj7yXdb7ixocchPiJfT/l2CzBXb87/Lsz85+fcuZ7txcY2b3bACIKx6G3FX2t7hpMrO70Ii2usPmSHwt6PdP5aqKVJtYDu/fS5VbEKSm0hqEsBQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izX7nKjB; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izX7nKjB"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66058b880e9so1496238d50.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 11:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782325459; cv=none;
        d=google.com; s=arc-20240605;
        b=iz9hO3LTJcsZffxhTZexsfmYXBaaX/vVJ4WhhUsL3iQPg8hDxq+Crp/gQzE1FcFc5m
         SqDzGQeW88e2EgGRh6Wd0Kiv7sHKsPpUQ7o71G/dgrm30cUMEYMqPR7kfFPdZM/gd5vu
         ND3PiT1JdZSpASfPjDfA+/qhXlYzjD4UVQEFgeQ+p/9DPCGvW1aMwyIwmWizagpIT9ZF
         NiLGk9HkYG3ndERIi7cX9bXupbWnb3umY+I6CR/Ni/v7gYJiEXYtzkYKwr0Wj3gtXgiu
         /M8Fq3+ZdGWZPGvjwiX9CM/mZ4UgTFWUfMRPC4lfhWFx/msbMXmsd/DMZ5P7XFY7Occb
         3Z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY4/t9eKkaWP4XUnsXNVlFzjY/g3Uh9b/Y5kJrRDbTM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=XUgQj0ssj6znobvhuEoeJnu6/zaFztEE6ZccAzp04zhxwogPuj+rCvzKskTJq7e/Mu
         rZsDLwBRuZEjK/lEqMhbBRpJBnI7fUjLZLjQ6LKnpyBGFr5Qj+6DQ5JcjHW4D7fQSV3f
         TS6s/Yt01L3NK/cwW34i5mm9y8FsEIBX8mHhDeYCF3lggpCusNJqSb3TH9CsnsjyANJ7
         29ntT5ZIUgTDe5lXVSqXXeiN54H+CUtP/G7ZQXPnaaiIFnWQAooEFUUO9BTOsq3LtVv2
         M4eljBnsgarSWiG+k5RA8hv9+cEUNz2nfkdcN8UUB5cXLukqOXmU/Ah/pDW1VP1fM4B4
         IOPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782325459; x=1782930259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY4/t9eKkaWP4XUnsXNVlFzjY/g3Uh9b/Y5kJrRDbTM=;
        b=izX7nKjBgB4yMJrn3iun/BxibiHg/JxbJQ0eAThtOa2pWlMJ7ByobzuyCeRnDndFI8
         PlgXYFk/EJPNgKEWzDKnvPBmbdE8dd0HSRpJTBkIh9Vpn7bMps4CqZRc8jFfbAzYRA7U
         KrTWq8UN6VJewRfbDgILQn9/apTuD9mMMUib7EL5+53eSwowNymfQyspq0/EeT8/YTXS
         kfGP2ZdUXVb4J+nZKMjR4E/DSSvY2icTn8jSgxGDhMdj9TcOqrQE2TbrAzYcMYDHy49J
         EjnhmXm4iu8U7jUciCCaccL/rwFZ2RaMJWMTSyv2QbDLgYPwckA2Z3A4LdrBrTu3h6Ik
         tsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782325459; x=1782930259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY4/t9eKkaWP4XUnsXNVlFzjY/g3Uh9b/Y5kJrRDbTM=;
        b=bxzfOv2s7P/Lt1YCNK7r7rT8Y6a1Y1iLnBFT7KTen+LKMGH9SuVdHlYdoP8waboyhE
         eQcWYaWOpDbCaNqNYIomVVhwJcECO3wU/LziMfdWcq2L4nTBHkLQMpBIkuiE7wg4tQnL
         Ejb1RyYDHuIsIGGj68weZlJhO6QMobo2+IDeoRWkQcglGl5kCtGBjVxo/eRtAmQlquFD
         sIc+28PFuqWQK/WQd+++vgmUMZHFH9+HvDZWyhAhRNwYMvq75VxlfF/Y/pw0l0i9WSXh
         6JMJwG5TOSrNMgtO2gblnftrUZHI+IM/rXe6BJ0otZdjZlZSQm46ukn5q9s7bXp6Faqb
         GwOg==
X-Gm-Message-State: AOJu0YyCxQISHyHM21WJE2gzcyGLuUcVioLQHcNE85/umLLoU7CyKcq5
	YP1CzYciHNSp1E8wBN2oKMA0CqBnqn5MA1yYb2zen9oCsEo+vQ2xNmnhzfp7gbAgh/HWI7IZgzv
	Gr2kXhjD4V2MTtbEcgSYdtKjmP5alRzqKhQ==
X-Gm-Gg: AfdE7cmnr1j75IYEQgUQeevZbX9qT6LbGJtEqGmEPQ7wDPQKcGWzgUN0MIjHW3Dv5qL
	6IrlMTJMw/huMwMFek2TZTesrfrGtn1qW66nnEwtFRzGEdZwLVsgsAzIm+9NEMVgtR4fG5TgCeu
	H6zE1dbgG579RUaihwtqiehtM3/EdKDmcujJfDN5cbLk+e4VAITAYefKtPWDxxfpAm40JZ+ro1U
	HZOU+WjCb0n82+mVzcMEESCx2Pi7fneEGSkUXMvsFokEzDO0miCoBBzcHHHQWvanM4YjX8u
X-Received: by 2002:a05:690e:4842:b0:661:37ed:63ad with SMTP id
 956f58d0204a3-6636e58827bmr2940730d50.43.1782325459014; Wed, 24 Jun 2026
 11:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-12-ameryhung@gmail.com>
 <20260623232250.6F1551F000E9@smtp.kernel.org>
In-Reply-To: <20260623232250.6F1551F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 11:24:06 -0700
X-Gm-Features: AVVi8CfGHzJvG4ND1DAHRQMFh9mCT59_erhCaC7fFPP3NcxAPyISMo77xTmsw4c
Message-ID: <CAMB2axM=ui2aZe8aDF6wr1ZZQe46AL4NAirF8wUWq2NMmLkhjA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 11/15] bpf: tcp: Support selected sock_ops
 callbacks as struct_ops
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] bpf_tcp_ops allows sleepable BPF programs which will trigger ker=
nel panics when executed within the RCU read-side critical sections of the =
dispatcher macros.
> - [Low] Multi-line comments in BPF subsystem files must have the opening =
`/*` on its own line.
> --
>
> commit c794084a252357df7f0bbf934f1e1707d2dd52fd
> Author: Martin KaFai Lau <martin.lau@kernel.org>
> Subject: bpf: tcp: Add bpf_tcp_ops and support attaching to cgroups
>
> This commit adds a TCP-specific struct_ops type, bpf_tcp_ops, and support=
s
> attaching it to cgroups. It wires up several existing sock_ops callbacks =
to
> allow each callback to have its own function signature.
>
> Link: https://drive.google.com/file/d/1wjKZth6T0llLJ_ONPAL_6Q_jbxbAjByp/v=
iew?usp=3Dsharing
>
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index 6d376ea4d1c0..2102f9f2afd6 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> [ ... ]
> > @@ -2953,12 +2953,120 @@ static inline void tcp_clear_sock_ops_cb_flags=
(struct sock *sk)
> >
> >  #endif
> >
> > +#if defined(CONFIG_BPF_JIT) && defined(CONFIG_CGROUP_BPF)
> > +
> > +struct bpf_tcp_ops {
> > +     /* Should return the initial SYN (active open) or SYN-ACK (passiv=
e open)
> > +      * retransmission timeout. Return the timeout in jiffies, or <=3D=
 0 for
> > +      * the kernel default.
> > +      *
> > +      * @req: request_sock on the passive (synack) path; NULL otherwis=
e.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but could these multi-line comments be updated to place=
 the
> opening /* on its own line?
>
> [ ... ]
> > diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
> > new file mode 100644
> > index 000000000000..cf53c95a0dbc
> > --- /dev/null
> > +++ b/net/ipv4/bpf_tcp_ops.c
> [ ... ]
> > +BPF_CALL_0(bpf_tcp_ops_get_retval)
> > +{
> > +     struct bpf_tramp_run_ctx *ctx =3D
> > +             container_of(current->bpf_ctx, struct bpf_tramp_run_ctx, =
run_ctx);
> > +
> > +     /* bpf_get_retval() is only exposed to timeout_init/rwnd_init, wh=
ich
> > +      * always run via bpf_tcp_ops_call_int(). Its run_ctx carries the=
 int
> > +      * return value chained across the bpf_tcp_ops attached to the cg=
roup
> > +      * and is this program's saved_run_ctx.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but would it be better to adjust this multi-line commen=
t so
> that the opening /* rests on its own line?
>
> [ ... ]
> > +static struct bpf_struct_ops bpf_tcp_ops =3D {
> > +     .verifier_ops =3D &bpf_tcp_ops_verifier,
> > +     .init_member =3D bpf_tcp_ops_init_member,
> > +     .init =3D bpf_tcp_ops_init,
> > +     .validate =3D bpf_tcp_ops_validate,
> > +     .name =3D "bpf_tcp_ops",
> > +     .cgroup_atype =3D CGROUP_TCP_SOCK_OPS,
> > +     .cfi_stubs =3D &__bpf_tcp_ops,
> > +     .owner =3D THIS_MODULE,
> > +};
>
> [Severity: High]
> Is it possible for sleepable BPF programs to be loaded for this struct_op=
s
> type?
>
> Without a .check_member callback to explicitly reject them, the verifier
> might allow sleepable programs to attach.
>
> If a sleepable program is attached, could it trigger a scheduling while
> atomic kernel panic?
>

This is a real issue. I will add check_member rejecting sleepable programs.

> Looking at include/net/tcp.h, the callbacks are invoked inside an RCU
> read-side critical section:
>
> bpf_tcp_ops_call()
>     rcu_read_lock_dont_migrate();
>     bpf_cgroup_struct_ops_foreach(...) {
>         if (tcp_ops->op)
>             tcp_ops->op(...);
>     }
>     rcu_read_unlock_migrate();
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D11
