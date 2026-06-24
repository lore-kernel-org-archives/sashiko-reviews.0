Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E2378803
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329873; cv=pass; b=gLjd6QbqJFBXf2t/ysmUKdED0i15O23wZR00pb2UkNQwCZsKq8zu9kXvbANShe4beYvQ+NwggNQ8fvB236+l6ZSdttMVY3tb2QmX26y402ywrFtvRLotd/Sozp4eixQADubGGp0ZL9nHmArEnr6XJK4aaL5++fzZqhmiK22sd2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329873; c=relaxed/simple;
	bh=GllgBcs7itEW4894JZAopXwN8/rtekGyTgYh7QSrd3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1nUIMByWeQ+9aaJ+UcZjqMSajqM5Nt5zmfUrb5Rb8lFG2cPqM8XrGe5FQo8noz2THGBhRpFU7FacwBxiw5KnaSX+6k8qn/H5IOJ7NYAKet+2yEHvPG5tKxP6vax0KA06ooUxJT47iGT0UKzhMFX6lE2iA1tTxm1PXSFLUiO/zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rANIhlTM; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rANIhlTM"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6611689dc10so2003760d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 12:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782329870; cv=none;
        d=google.com; s=arc-20240605;
        b=AX04z+IOaAeMaYnxGCQxujCn7Bgop/9Hwgh39Rg4YM/woz/JCXWXVDvqbEb9m8iNLN
         RnRx5nLPTGh9cVk6YYoEsXSNOcQjAoq1oazh29QqzP7DWFiuOy9W9IdhV667I0oZLXOs
         D6xB87Nkticsg/J7I1lIkkp2O5Iuaz3pINH7qYMFc5/JSTNM/m7hJ0xo5cS7oOWO4s9l
         oHJ7wRSx/+4jE4qehYmGQqH2nKgk2HyMIUQdK7r33S1lPML/9mkhgWv/n0sgft/JqHg1
         XPhn/5QUcdMMZ0xPU5PlFXrksC2x5O3etCLuDnYo35tiPOqKaRJNWJ395W9sgPAL2YWw
         y5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=URp0L1lYBHGwRqyQw+KN67MjI1sc7tNut0CrqAxYvkI=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=choZmqdjsLxkXemzSIG1sj4RNxy7tSnvFE7NH9mWpq/uBa30bIaoXJenDx+YHyC+Uq
         VFKJE8sTvtzHqj27rp7ZtRI/s2oD0+TnpnosRuvRG6xN0qIaiQVR3KHA2M1Xdn+hqSq2
         uWAsRXTwikA2y1E6kqKXDdShwqYNTSJDJhXPaqrpehYZcRT6JXUD3KDkV49yIuJPY6o9
         uRxfYICEq0HPwhM5J+NmGZHgeMZ3E0mWFCAvv6Y+n87Y+xrXXoeQSDYf5Ou2gWGktqwd
         DvQaf+FdrFos7toCbMlmF3d+NmrlmoyWETnuYSkFyEgf6BAK2zXUBqokyFmTusygvMfE
         52cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782329870; x=1782934670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URp0L1lYBHGwRqyQw+KN67MjI1sc7tNut0CrqAxYvkI=;
        b=rANIhlTMP7/7kyoGrCNMrAnB+drH2I0UeJ+vqXsJTB8r45lkdKaEKfprOwV6bzVjDR
         TfjJe4RY97w81fdFM7RSHk2++BCkiKoXmUsPzB+ythHwnDq/WVTvaWDG1oz3aXHavJ/R
         xnEsBzLLhNTjKb+bbIUrx2ZFXgPfoXu1z5pmguQeH8Yebq6asSBb/YhQXOjV41nTxuuc
         lHnZUTmhlFCYft+cwtLIZE9tJffG7/bzo7tRI2b68I7YORIAo/JX95l0jsUeB2A0ERYm
         M48jxJZnUPCC9jp6ue6d0me1lKcl9KXq4lqMfPfHK9TnY2kOHcjgrUZNy1v26/0HnV9L
         k1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329870; x=1782934670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URp0L1lYBHGwRqyQw+KN67MjI1sc7tNut0CrqAxYvkI=;
        b=g75sACFWDk/GaGV2B2KpRijmbOVdWrqxRPnppLmACX3ZKCBH2s6NmKDvJVJ6EA4JeL
         afhOo8kJw1eZ18IuZqvpc92fPEY516dfctV5GH2PduAzGdkUYGJtDkcZcYVcd+atUiwP
         /gdENOaorC9tTIuvU0yZB+0bqkPcT6ohgvpNr4i7mrJt6unYTx65LpItQzASmGea87zD
         dyFF+WOal2reCO6m6Pua+bgTWa1E8NW+Rwanc0gvtF6vTZJYtxqRBX2ywtEGduxALBZG
         59AnrxThgquB464+w3FYZcyL6Mey1DRge4ERQlFfd1WyQyDCxM7vQUVyI4DOK9VfqEug
         sByg==
X-Gm-Message-State: AOJu0Yz6ZesXYAaDS1EpLufhzgFQL9mfGgi7N6XgL3AiR2TgSrusG+CO
	0J5Po4hlnKKJ8GbjH6eOQ55PW2qYXVyVIs+M9c7QUgdSyUPuvi3u5Sw0leW2jxcEciMpZmYsv+m
	X/WzWQ/BUQ1ipZxK03lVhvISGBfcJm/nevvLv
X-Gm-Gg: AfdE7cm/ijWRSKFdtqhhSNlmO3DW5wXkqe/wdCpmPqyd39vhGNcgnWGFK2rCUiE/T9T
	iXNwLDbPfOpTzPZAi+q9EcdsqpSE/Wq+9S9hU3raBL5odZKSTFuWKer+vq001MAKTggfwI4rkEa
	ctFwJe/iDn64+/phsZ2FpiLFfGalay3HvtI5ERMfS7FERMZIaX0z71m1Nrog1Eau2O8L4E0lkPV
	7ZxfM2gtcK/V9b0WVVopvnaCbAlu4yUiCTYStm81ZaHa6O7k1TcS5QdkOQ/PvbXf6OzR7KG
X-Received: by 2002:a05:690e:124a:b0:660:e09c:d57 with SMTP id
 956f58d0204a3-66359eda206mr7571115d50.29.1782329870009; Wed, 24 Jun 2026
 12:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-13-ameryhung@gmail.com>
 <20260623234059.132101F000E9@smtp.kernel.org>
In-Reply-To: <20260623234059.132101F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 12:37:39 -0700
X-Gm-Features: AVVi8CePzLI1GItTni-IRcFpJEANx5x0teJCdRQsOaLFcwXMDm4RX1VHNkz46nw
Message-ID: <CAMB2axO0UnZDC6Ea0y8fL0cxz8qmXzU5UdqAarL_JVLfcOn29Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 12/15] bpf: tcp: Support parse/len/write
 header option hooks in bpf_tcp_ops
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Incorrect pointer arithmetic on the BPF context array causes NUL=
L pointer dereferences on 32-bit architectures.
> - [High] A missing bounds check in TCP option parsing combined with a TOC=
TOU double-fetch allows a malicious BPF program to cause a heap buffer over=
flow.
> - [Medium] The struct_ops TCP option reservation is gated by a completely=
 unrelated cgroup BPF static key, breaking the feature for established conn=
ections.
> - [Low] Multi-line comments in BPF subsystem files violate the required c=
omment style.
> --
>
> commit d91122a96beff2abb78548435a7fd30a3c89c2ac
> Author: Amery Hung <ameryhung@gmail.com>
>
> Add the TCP header option callbacks to the bpf_tcp_ops struct_ops type
>
> This patch exposes TCP header option callbacks as struct_ops members to
> allow BPF programs to parse, reserve, and write TCP header options. It
> mirrors the legacy BPF_SOCK_OPS callbacks and shares the reserved window.
>
> > The hdr_opt_len fast path in tcp_established_options() is gated by
> > cgroup_bpf_enabled(CGROUP_TCP_SOCK_OPS). Note this is a global,
> > per-attach-type static branch: it is enabled whenever any bpf_tcp_ops i=
s
> > attached, even one that does not implement hdr_opt_len or that is attac=
hed
> > to a different cgroup.
>
> [Severity: Medium]
> Is this description accurate? Struct_ops do not enable this cgroup static
> key. Will this check evaluate to false in non-cgroup-bpf deployments,
> skipping space reservation for established connections but still calling
> write_hdr_opt later?

See reply at the end.

>
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> [ ... ]
> > @@ -3005,6 +3005,45 @@ struct bpf_tcp_ops {
> >
> >       /* Called on listen(2), right after the socket enters TCP_LISTEN.=
 */
> >       void (*listen)(struct sock *sk);
> > +
> [Severity: Low]
> This isn't a bug, but does the BPF subsystem prefer the opening /* to be =
on
> its own line for multi-line comments?
>
> > +     /* Parse the TCP header options of an incoming skb received on an
> > +      * established connection. Use bpf_dynptr_from_skb()/bpf_skb_load=
_bytes()
> > +      * to access the options.
> > +      */
> > +     void (*parse_hdr)(struct sock *sk, struct sk_buff *skb);
> > +
> [ ... ]
> > diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
> > --- a/net/ipv4/bpf_tcp_ops.c
> > +++ b/net/ipv4/bpf_tcp_ops.c
> [ ... ]
> > @@ -66,6 +87,99 @@ static struct bpf_tcp_ops __bpf_tcp_ops =3D {
> >       .retrans =3D retrans_stub,
> >       .connect =3D connect_stub,
> >       .listen =3D listen_stub,
> > +     .parse_hdr =3D parse_hdr_stub,
> > +     .hdr_opt_len =3D hdr_opt_len_stub,
> > +     .write_hdr_opt =3D write_hdr_opt_stub,
> > +};
> > +
> > +BPF_CALL_4(bpf_tcp_ops_store_hdr_opt, void *, ctx, const void *, from,
> > +        u32, len, u64, flags)
> > +{
> [Severity: High]
> Can this pointer cast lead to reading the wrong offset on 32-bit systems?
> The ctx array contains 64-bit integers, so casting directly to a pointer
> array might result in reading the upper 32 bits (which are zero) on
> little-endian architectures, causing a NULL pointer dereference.

struct_ops is backed by trampoline which is only on 64-bit arches so
NULL pointer dereference should be a non-issue.

I will still change bpf_tcp_ops_{load, store, reserve}_hdr_opt to the
following style to silence -Wint-to-pointer-cast warning on 32-bit.

u64 *args =3D (u64 *)ctx;

struct sk_buff *skb =3D (void *)(unsigned long)args[1];

>
> > +     struct sk_buff *skb =3D ((struct sk_buff **)ctx)[1];
> > +     struct bpf_sock_ops_kern sock_ops =3D {};
> > +     u32 opt_off =3D ((u64 *)ctx)[5];
> > +     u8 *op, *opend;
> > +
> [Severity: Low]
> This isn't a bug, but multi-line comments in the BPF subsystem typically
> place the opening /* on a separate line.
>
> > +     /* bpf_tcp_ops does not keep track of the end of the written TCP =
header
> > +      * options, so search for it every time the helper is called. The=
 free
> > +      * space is NOP-filled, so a TCPOPT_NOP ends the search rather th=
an being
> > +      * skipped as in a normal option walk in sockops.
> > +      */
> > +     op =3D skb->data + opt_off;
> > +     opend =3D skb->data + tcp_hdrlen(skb);
> > +     while (op < opend && *op !=3D TCPOPT_NOP) {
> [Severity: High]
> Does this loop prevent op from advancing past opend if the option length
> byte is forged? If op[1] is maliciously modified concurrently in the BPF
> map memory before __bpf_sock_ops_store_hdr_opt() does its memcpy, could
> the next call to bpf_tcp_ops_store_hdr_opt() advance op past opend and
> cause an out-of-bounds memcpy?

OOB is not possible here. The loop only walks the BPF-reserved option
region, and that region is NOP-filled and written exclusively by the
store_hdr_opt helper. __bpf_sock_ops_store_hdr_opt() rejects any option
that doesn't fit.

>
> > +             if (*op =3D=3D TCPOPT_EOL || op + 1 >=3D opend || op[1] <=
 2)
> > +                     break;
> > +             op +=3D op[1];
> > +     }
> > +
> > +     sock_ops.skb =3D skb;
> > +     sock_ops.skb_data_end =3D op;
> > +     sock_ops.remaining_opt_len =3D opend - op;
> > +
> > +     return __bpf_sock_ops_store_hdr_opt(&sock_ops, from, len, flags);
> > +}
> [ ... ]
> > +BPF_CALL_4(bpf_tcp_ops_load_hdr_opt, void *, ctx, void *, search_res,
> > +        u32, len, u64, flags)
> > +{
> [Severity: High]
> Will this cast misalign the array index on 32-bit architectures? Treating
> the 64-bit integer array as an array of 32-bit pointers will cause the
> wrong bytes to be read for the context argument.

Not a bug. Will change silence compilation warning on 32-bit arch.

>
> > +     struct sk_buff *skb =3D ((struct sk_buff **)ctx)[1];
> > +     struct bpf_sock_ops_kern sock_ops =3D {};
> [ ... ]
> > +BPF_CALL_3(bpf_tcp_ops_reserve_hdr_opt, void *, ctx, u32, len, u64, fl=
ags)
> > +{
> [Severity: High]
> Could casting ctx to a pointer array here also lead to a NULL pointer
> dereference on 32-bit systems due to reading the upper 32 bits of the
> previous 64-bit argument?

Not a bug. Will change silence compilation warning on 32-bit arch.

>
> > +     unsigned int *remaining =3D ((unsigned int **)ctx)[5];
> > +
> > +     if (flags || len < 2)
> > +             return -EINVAL;
> [ ... ]
> > diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> > --- a/net/ipv4/tcp_output.c
> > +++ b/net/ipv4/tcp_output.c
> [ ... ]
> > @@ -1244,6 +1281,15 @@ static unsigned int tcp_established_options(stru=
ct sock *sk, struct sk_buff *skb
> >               size =3D MAX_TCP_OPTION_SPACE - remaining;
> >       }
> >
> [Severity: Medium]
> Does this cgroup check evaluate to false for struct_ops in non-cgroup-bpf
> deployments? If so, does it silently skip reserving space in
> bpf_tcp_ops_hdr_opt_len() for established connections, while still callin=
g
> write_hdr_opt unconditionally later?

No. CGROUP_TCP_SOCK_OPS hooks are turned on and off all together.
write_hdr_opt is also guarded by
cgroup_bpf_enabled(CGROUP_TCP_SOCK_OPS).

>
> > +     if (cgroup_bpf_enabled(CGROUP_TCP_SOCK_OPS)) {
> > +             unsigned int remaining =3D MAX_TCP_OPTION_SPACE - size;
> > +
> > +             remaining =3D bpf_tcp_ops_hdr_opt_len(sk, skb, NULL, NULL=
, 0, opts,
> > +                                                 remaining);
> > +
> > +             size =3D MAX_TCP_OPTION_SPACE - remaining;
> > +     }
> > +
> >       return size;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D12
