Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402E121638D
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 20:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334689; cv=pass; b=We7LdvImwWnq8Ol6MoXheW0bgdbmBfIAPFNs0BgdPYHtETs3XrsPtEUmKw5r5U8IuTm4lRmYBD2ZxsMbBOK9DFnUwEGDfMgHdV6BDjnYzhO0HlGxC8x1wSlvOBdcjhuI9JkvA6CgXpyNsFLioLckRBRf6Jb5uQgdeOQMqCUj+lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334689; c=relaxed/simple;
	bh=iE8Td62QGhxkIZbgcUbiontrp6elfLPsvStG0K7afZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OT/aOozcVxBymv9rVGH1sBVzHXTI80oBDLOwBrxVRxR5T9HSSnyHLWjKlQx1iKVVqYHm6ASp67iYyOvKIYX9ybHKpSa918ckx/DcX5v09gdfF957H9zB7eJR89X4dtGD3TVq+kc7/Zxip7DSHEaJ5V6EmshTlSSCyHK+GTBcXWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtxnHyJj; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtxnHyJj"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7fdeab38240so14724487b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782334687; cv=none;
        d=google.com; s=arc-20240605;
        b=OMrwJYfn2+x3GljNirvkJReczJ8rhHk4PQPS3xau/xMWYYT/TtLRlWjobFoysS/sfY
         4gwhnzP2bEKjW8cwtojQX4pLF/AdI3dttAUmUrQozRdr3MXJ3nmr5iJziN/WHrjY/i9s
         ZA1GG05ktkXjnHUkdMNSIitcQCcMw3yvOV1hZ6zejnHdE9O4nvkfIjGTMUrG4M7cu1FR
         +bhT7F6w2fapCfNR4ls4jQ2Gf+TpAYL/be4loERjBHQebXMIbUoVzLIHGLcuh530jFo0
         8hgRO0FMVadFczzJvZ8hMuYIzgUMpAgiLDyPUL5fLiZ/Mj3L4Js8P3As/8MozXWYArUf
         e8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1LWBkTNGly9Qx1uX6BXZJ5XtlUUnwZ8c7mDUm/i5F9M=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=XG3vYY1tuNK1idToHv5GXOm6FeTu3Pen+lczwwPw24YGTAWBBKyzkbKuufdnj4BQgQ
         SvrNvR0v7vNXuVdsJa6SqV6LpZO0EzVm/tU5f1h8jkU30eqEgqaaoJXmiinwHyeNuzYv
         5MIEHYz9OuYSYkXN+amqsG6gJ7+MDfqfwS56XBeUmfOP6S996eKvzNRHkbHzrpF9Q9nq
         yyKHPyVUF79DSjVCn6T+OA/YBkhn1DkoPw48Xm+8prJcv9srzsY0jyvTYKB9Jl89CBfz
         k4Sn/bGsNkQQx7LFsTBcSRYMlX+PQ0H26dowYGWtbi7CFsAxQC9/1PxSHFwaDU4LPHc2
         NZlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782334687; x=1782939487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LWBkTNGly9Qx1uX6BXZJ5XtlUUnwZ8c7mDUm/i5F9M=;
        b=DtxnHyJjji9Jg74Dnfm9yz75wxiZhJVacCY+7vJHm+3yqjz3zJMW1q6Mzsd4pE3wSf
         GHjJc/of3r8CjlcFKTuGJEp6IZNhDPfAlPFfXCUhMlO5kOM+B/zndt9wfLNxvfu57006
         ber6Q0mboSM+hOEP5Q5BmDlcY89QdG8n0IeXXYanCEWmW365hfgB5NwouPaG3ogdlClh
         AnQum9HIIPMjQNg1iYpcm12GEowV5JviyHvj6DvdTSDhi/dUgqroR0NDWOgD1bPT+f5D
         vNUuK0mxX3vH6mF+VP4xMNwFWnGJ1PJbty8SQjYxMLtzw42sgJmp9ucbzM3zPAB1toeQ
         JH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782334687; x=1782939487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LWBkTNGly9Qx1uX6BXZJ5XtlUUnwZ8c7mDUm/i5F9M=;
        b=jdN9UO4VVNe3TGQfhGCOxEGnAPR6/kItjkb1MdA2xS85Jcw+Tej+apNVXikkw3TmAj
         lxbANylWYSp5W5ZkbLuDq0KlF3aQnf6NiQOnFlkVd3qzriarqu5o7EIT3uJ0eB2u3VNJ
         7lfWI2sExeqdDUA2zC/4kZOFOClC+bEk5J2IUBar2ZcP+b47lz0zGruLpVZekVXlf76A
         nQjBHqkwq9qW5Hzb1VrgtD1qLaLEbf2e8oIN+crHv3fNq+pi7bjQVj3aCeSTa+/wTWTx
         aKeaGyAsvpKg5S+t3v9fLSSVW7+zC9ZFHPzz1rj+2ZdBuRUjbdYeRMeVQzyp7gMp1+y6
         6iIw==
X-Gm-Message-State: AOJu0Yxm7KMTKAwm8Ok8fXJnoXhQ3KqObzg2XwkIS2lbBetrLo4JMyfG
	sfZbM5KIcdcKUq3k/UPQ3ux5bLUDmLs9t7cIsEdoyHhwDZltTc1EPY9UVNJWKmRKgoldwUatdGM
	lTgYYyI04Ag0mULYZub92IPZhkXK6gCkl7+0F
X-Gm-Gg: AfdE7cmSABby+tVm7ZsBV5NMuiMeYlzbsvlaMj0yVn0B5ew9Tg9T+EwxiMGAunY0lst
	aH87WXYjtApTl8ZOpK+INxP32BihtZS8lMGyoD/8aaxSbqm/SUuGs9EVVZ71tFrk8PjR7dnUyBO
	WXmi4C+zXa4zAwk0gSU5plRSNGf7BdwcMkreFoGCwJfUKeNyNTEr3xWxtkJoWwDtI6ka+CbuXT5
	q3Cf5SnznhPwpA+0MjLAOO+4Gfcqn8wL9NGcn3WG+d4PLQ5jQYKol6+pAY1dixtTU5Kop/urTNQ
	B8cMYuA=
X-Received: by 2002:a05:690c:680c:b0:7dd:3ed9:10dd with SMTP id
 00721157ae682-807eec6b9b4mr51362227b3.27.1782334687200; Wed, 24 Jun 2026
 13:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-16-ameryhung@gmail.com>
 <20260624001445.AE70D1F000E9@smtp.kernel.org>
In-Reply-To: <20260624001445.AE70D1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 13:57:56 -0700
X-Gm-Features: AVVi8CfN8nRA6KomJ3hzZL_ho7Gj9C9TvR4N-lQMcuuX0lrbh3kPtjtxoueMi4c
Message-ID: <CAMB2axPRrUzzbGqW_6jssbbzma1Kz-WGAfJvdtoOyuUkX5h+wg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 15/15] selftests/bpf: Add test for bpf_tcp_ops
 header option hooks
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 5:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unchecked ASSERT_EQ failures on blocking sockets can cause the=
 test suite to hang indefinitely.
> - [Low] Multi-line comments do not follow the mandatory BPF subsystem sty=
le.
> --
>
> commit a1c417fa7da14f2f4f18705173e644ec97f1f5c8
> Author: Amery Hung <ameryhung@gmail.com>
> Subject: Add a test exercising the bpf_tcp_ops parse_hdr, hdr_opt_len and=
 write_hdr_opt members together with the header option helpers.
>
> This commit adds a new BPF selftest that verifies the behavior of TCP hea=
der
> option struct_ops callbacks and their associated helpers. It uses a
> cgroup-attached program to reserve, write, and parse custom TCP header
> options during socket communication.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ops_hdr.c b=
/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ops_hdr.c
> > new file mode 100644
> > index 000000000000..73e34d2be9a4
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/bpf_tcp_ops_hdr.c
>
> [ ... ]
>
> > +static void send_recv(void)
> > +{
> > +     char buf[64] =3D {};
> > +     int server_fd, client_fd, accept_fd;
> > +     ssize_t n;
> > +
> > +     server_fd =3D start_server(AF_INET6, SOCK_STREAM, "::1", 0, 0);
> > +     if (!ASSERT_GE(server_fd, 0, "start_server"))
> > +             return;
> > +
> > +     client_fd =3D connect_to_fd(server_fd, 0);
> > +     if (!ASSERT_OK_FD(client_fd, "connect_to_fd"))
> > +             goto close_server;
> > +
> > +     accept_fd =3D accept(server_fd, NULL, NULL);
> > +     if (!ASSERT_OK_FD(accept_fd, "accept"))
> > +             goto close_client;
> > +
> > +     /* Exchange data both directions so option-bearing data packets
> > +      * are sent and parsed on each side.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but does this multi-line comment violate the BPF subsys=
tem
> coding style? The BPF guidelines specify that the opening /* should be on
> its own line.

[...]

>
> > +     n =3D send(client_fd, buf, sizeof(buf), 0);
> > +     ASSERT_EQ(n, sizeof(buf), "client_send");
> > +     n =3D recv(accept_fd, buf, sizeof(buf), 0);
>
> [Severity: Medium]
> If the send() call fails, ASSERT_EQ will log a failure but execution will
> fall through to recv(). Will this cause the test suite to hang indefinite=
ly
> waiting on the blocking recv() call?
>
> Should the return value of ASSERT_EQ be checked (e.g., using an if statem=
ent)
> to prevent the test from hanging on local socket errors?

I didn't catch this part. I will remove send_recv() and use helpers in
network_helpers.c

>
> > +     ASSERT_EQ(n, sizeof(buf), "server_recv");
> > +
> > +     n =3D send(accept_fd, buf, sizeof(buf), 0);
> > +     ASSERT_EQ(n, sizeof(buf), "server_send");
> > +     n =3D recv(client_fd, buf, sizeof(buf), 0);
> > +     ASSERT_EQ(n, sizeof(buf), "client_recv");
> > +
> > +     close(accept_fd);
>
> [ ... ]
>
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_tcp_ops_hdr.c b/tool=
s/testing/selftests/bpf/progs/bpf_tcp_ops_hdr.c
> > new file mode 100644
> > index 000000000000..46618a604d96
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/bpf_tcp_ops_hdr.c
>
> [ ... ]
>
> > +SEC("struct_ops")
> > +void BPF_PROG(test_hdr_opt_len, struct sock *sk, struct sk_buff *skb,
> > +           struct request_sock *req, struct sk_buff *syn_skb,
> > +           enum tcp_synack_type synack_type, unsigned int *remaining)
> > +{
> > +     hdr_opt_len_cnt++;
> > +
> > +     /* Reserve TEST_OPT_LEN bytes; the helper decrements *remaining. =
Stacks
> > +      * with other progs in the cgroup hierarchy.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but should the opening /* be placed on its own line her=
e
> and in the other multi-line comments in this file to match the BPF
> subsystem comment style?

Will change to kernel style comments.

>
> > +     bpf_reserve_hdr_opt(ctx, TEST_OPT_LEN, 0);
> > +}
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D15
