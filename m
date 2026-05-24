Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD425C804
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 04:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779595586; cv=pass; b=Im4zU+ilAr2iH3t6B1bj9kC6s0Z+uYWYZ1bKo6FS/wXdy1EoJwqRZceij+Wbc2sJ37l3SoLZEyIQDhgrTih7Kj01XOU1gRuBVoCDkYmkys6Gwo3u60V2AAH9+OfnEFHZtSx+rJlzsHCphNnb2R7rym2lvf/Ezn8GuYsea58BNb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779595586; c=relaxed/simple;
	bh=CA4DpKP1QcRdJpAKyGB+y5d2HftO/i17x4Nrs6fBWes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pqungu9i2Oa2DTIsaf41o1QaQuwo8gk16QxZo9q24y4QRD+dWgs3mEFkJDsn8j/5uYrfMrTuVCJ7m4asMTx2lo2nAmHVvJfZBe0radUp//hB7XB008EkafNi78+JeE+WrM3QvXpfStw+GhqQOmdILSwr16U16jHomNPRoFln3Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2ict1x5; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2ict1x5"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-136a89595c3so618748c88.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 21:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779595584; cv=none;
        d=google.com; s=arc-20240605;
        b=KO+/PYZ/wAByEcMBl5Tjcj7zuPm+El6L8Pgb+4vumwl2KVmk6ELCrI6wVi/rL6Tvhr
         B5fKivWczzxVlimzIK0Xn8SDES03wzoAjI9AfjiTVnqTP15eh1HJnRboBQMEZa4MNovW
         dz6bnwQKRQKarsuf6Y/q1bOGt1N1vdmBfU/8pQEyCKIxeaT9st+QYeQJyDHx9otQp+RF
         fyKkWgdF9iFAtIXhgOlci4SpRH1ZOqjv9DJhpUwaJGBBUM8S5UqqwR7EMAGIHVLb8Uh8
         2CIxL8TWMhpmaD9haWqHu87v++alOqjAfjI4Fp+H4tpXg5WWyHXiW05yXmg8Xb7+XfGD
         XTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BDTMc4T6qshbywfcZtVUYE28VJXJ36+uZ3Xu2ID3Wt4=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=AfZe7AJT/EiceFus7qJo+jBYtJtkpfB0QOIACDZCSPaEpph7uP/Fhg1qdugWYbrOkg
         Xk4f4SCN0zQ/ypQR0MizfeXg4RRGOHVKV4aNprR/OUzN8fEUu02RLMR2+EhIrneF2Lfp
         RJiF14b5Feo27CR6LMV7XveD+fJ3F4HiVRWNm5pWO1RGYX9ud/MZkyh7HkkS4E5rV021
         ZB74E5Mpygi+QHqc5NOyDMFl5zwkQcERoZ9rj6BBciRxnTiLh1Oc58oivwG8ld9YNgSU
         EdXqdq8rh+GPf/N8yI2bxcIHkpw9mxKMxk8IqV4hKPdyjiTIGafvARabZ/grVIwTaxWI
         o1pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779595584; x=1780200384; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDTMc4T6qshbywfcZtVUYE28VJXJ36+uZ3Xu2ID3Wt4=;
        b=u2ict1x5dvuOihOpFbVWQ6/3EeBy7s0l5oLelmJj2sJPM/trd6Fp2fZ9haFAA5QSWL
         a4Pb1M4lFmwV5MOS2Q0WlamlvjEgOst7Vr2S2nEbTwUlFQY5Y+DxoqngK+GC3cQibnY+
         xkbIU3DBp1QGrfUiSe3L97hoAh9rQt95qnuI6+iF7myjNvKVjQIEs6JL+S6v43mLoIEm
         7JFVH4ETE6alhIddvDJl70b45DUkrXuHbuwAMh3Gcv9griKhshJeCJJFUE89NQCeyI3N
         4in+wwKf/baIEBG6F7RWVW5Ah9x18hgar3Ek2r2Hq6/gZ5eZMSHqtjlA5wpHx0cr9xBZ
         oppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779595584; x=1780200384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BDTMc4T6qshbywfcZtVUYE28VJXJ36+uZ3Xu2ID3Wt4=;
        b=JVICfki5VJqcxxN1VYrGVLfWemk0+WC+9UNrG9M7jy56Dp6vVjecd5/3uf9bhcQKMG
         ZFUazAKz/WBigavDVavOD6C2vUi1g22Jw2BnLHyTICAgka0CjMi8me3CLKDtNdeZoOoS
         PFqlbnX4mVOwJ3efw8hviaAIkxZTdNUcJgHrQzQ1dNchLbnw/MxMDsi9/LaQBcTKlYAt
         t/GSe0WqfEvdEJ+UYnhZ1C4wGdlyN/tfPbXG80Bm3AcnR205JVP/nxEee47rnGwMdKBI
         NBniOZHzpKA4F1bISuB/CSgj7RX51NDTEebnJCvxOnedEKxxLOzRpSXgMeeBO46iJl0S
         +0hA==
X-Gm-Message-State: AOJu0Yz0F4PlL3qq+wXZtHkZnAcSHbD+3PcwmxxAUglH05+2ucs369nJ
	r/51rlxEjw3GDeF/l4v5nJNP4h5C1x4V2uTX9UceKju9ZtjJT21Wgcx04ZDCch92Xs6Sh+Beyck
	zrZKj42xqWxi3YCr9jG/OrkZbqQiRE2jBP9KYcfFIKvifJgbrfIoDmDgPKBk=
X-Gm-Gg: Acq92OEbHNzzEx8ANzDgqbHQxUWYQNGFkZefONiuARMPG0FWQWEC6umJnXU31NtPCmJ
	hQUUDiUZ20v6ylZ+0UJpZ7L+PCCpFt3l18YZWITyHUsyMWtq01a/V7A5XBEQ24Rg3XOOams4qZ/
	Jw8unSsDRbUHEXQZ2pDGW03Bq7DAnHCTtqQ6RbKrD7gFxmEp2qsgwkFNYZY+YHaiCM/uTd/qimd
	7jcuxklT1GsVPFwsDw2rcqzsgVSVYfG75Ca2WY6GJtDgdqgJj+rGLc/Ku7rQIbGbA5IOxZEiewB
	KwwpGhpBjH+svFDYNSoar87fkQnz0c+fkfyGg89D6jwC2UomVhYF1sJCoRlJWbrDJ06F2RQJYvM
	kBreI2ET4bnH02PesG1BR7KfscDtVL+EUBzjUEYxhKqzw5BBA0X5rDsyNAvVF46w=
X-Received: by 2002:a05:7022:68a4:b0:132:7ab5:6cb8 with SMTP id
 a92af1059eb24-1365f6fd8ecmr3312155c88.2.1779595583293; Sat, 23 May 2026
 21:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523083001.2911931-12-kuniyu@google.com> <20260523091241.59B251F000E9@smtp.kernel.org>
In-Reply-To: <20260523091241.59B251F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 23 May 2026 21:06:12 -0700
X-Gm-Features: AVHnY4IXKNztwLGicUHyUbzx0Z9uq1pIZJd3nSCTf6QXyIlj6jVHE8xU5TicPm0
Message-ID: <CAAVpQUCKxvRrrP3VG+4iZo-xFokNWdCBbUdbj+DTWem_bRyi3w@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 11/11] selftest: bpf: Add test for BPF_SOCK_OPS_RCVQ_CB.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 2:12=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] The test case incorrectly asserts that `SO_RCVLOWAT` is automa=
tically updated to `RPC_DESC_SIZE` (8) immediately after `recv()` reads the=
 first RPC frame.
> - [Low] Multi-line comments do not follow the mandatory BPF subsystem sty=
le.
> - [Low] Incorrect ASSERT macros used for file descriptor validation.
> --
>
> commit ab873db7faa26eaced426077409e35dd60974a4f
> Author: Kuniyuki Iwashima <kuniyu@google.com>
> Subject: selftest: bpf: Add test for BPF_SOCK_OPS_RCVQ_CB.
>
> This commit introduces a new selftest for the BPF_SOCK_OPS_RCVQ_CB hook.
> It simulates an RPC frame exchange over TCP to verify that a BPF program
> can dynamically adjust sk_rcvlowat and properly control epoll wakeups.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tcp_autolowat.c b/t=
ools/testing/selftests/bpf/prog_tests/tcp_autolowat.c
> > new file mode 100644
> > index 0000000000000..5e971c42a32a4
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/tcp_autolowat.c
>
> [ ... ]
>
> > +     {
> > +             .desc =3D {
> > +                     {.header_len =3D 100, .payload_len =3D 150},
> > +                     {.header_len =3D 200, .payload_len =3D 500},
> > +             },
> > +             .event =3D {
> > +                     { .type =3D RPC_EVENT_AUTOLOWAT,  .val =3D 1},
>
> [ ... ]
>
> > +                     /* skb has the first payload and 1 byte of the ne=
xt descriptor. */
> > +                     {.type =3D RPC_EVENT_SEND,        .len =3D 150 + =
1},
> > +                     {.type =3D RPC_EVENT_EPOLL,       .nfds =3D 1},
> > +                     {.type =3D RPC_EVENT_RCVLOWAT,    .rcvlowat =3D R=
PC_DESC_SIZE + 150 + 100},
> > +                     /* After reading the first RPC message, SO_RCVLOW=
AT should be RPC_DESC_SIZE. */
> > +                     {.type =3D RPC_EVENT_RECV,        .len =3D RPC_DE=
SC_SIZE + 150 + 100},
> > +                     {.type =3D RPC_EVENT_EPOLL,       .nfds =3D 0},
> > +                     {.type =3D RPC_EVENT_RCVLOWAT,    .rcvlowat =3D R=
PC_DESC_SIZE},
>
> [Severity: Medium]
> Does this assertion accurately reflect the kernel's behavior?
>
> The test calls recv() here, which executes in process context. However,
> tcp_recvmsg() does not trigger the BPF_SOCK_OPS_RCVQ_CB hook, as that hoo=
k
> only runs when new SKBs are enqueued from the network stack.

This is similarly wrong.  I don't know why AI thought the hook
is not called from recvmsg() since it's overly explained in multiple
commits.


>
> Since no new network packet has arrived yet, the BPF program hasn't run t=
o
> update sk->sk_rcvlowat. Could this cause sk->sk_rcvlowat to remain at 258
> instead of dropping to 8 (RPC_DESC_SIZE), resulting in a test failure her=
e?
>
> > +                     /* The second descriptor is available. */
> > +                     {.type =3D RPC_EVENT_SEND,        .len =3D RPC_DE=
SC_SIZE - 1},
> > +                     {.type =3D RPC_EVENT_EPOLL,       .nfds =3D 0},
> > +                     {.type =3D RPC_EVENT_RCVLOWAT,    .rcvlowat =3D R=
PC_DESC_SIZE + 200 + 500},
> > +             },
> > +     },
> > +};
>
> [ ... ]
>
> > +static int tcp_autolowat_setup_cb(struct tcp_autolowat_test_cb *cb, in=
t family)
> > +{
> > +     struct epoll_event ev =3D {};
> > +     int err;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(cb->fd); i++)
> > +             cb->fd[i] =3D -1;
> > +
> > +     cb->saved_netns =3D open("/proc/self/ns/net", O_RDONLY);
> > +     if (!ASSERT_NEQ(cb->saved_netns, -1, "save netns"))
>
> [Severity: Low]
> Is it preferred to use the ASSERT_OK_FD() macro here instead of ASSERT_NE=
Q()
> for file descriptor validation, to better align with modern BPF selftest
> patterns?

Will use ASSERT_OK_FD().


>
> > +             goto err;
> > +
> > +     err =3D unshare(CLONE_NEWNET);
> > +     if (!ASSERT_OK(err, "unshare"))
> > +             goto err;
> > +
> > +     err =3D system("ip link set dev lo up");
> > +     if (!ASSERT_OK(err, "set up lo"))
> > +             goto err;
> > +
> > +     cb->server =3D start_server(family, SOCK_STREAM, NULL, 0, 0);
> > +     if (!ASSERT_NEQ(cb->server, -1, "start_server"))
>
> [Severity: Low]
> Similarly, could this use ASSERT_OK_FD() as well? This pattern is repeate=
d
> for connect_to_fd(), accept(), and epoll_create1() below.
>
> > +             goto err;
> > +
>
> [ ... ]
>
> > diff --git a/tools/testing/selftests/bpf/progs/tcp_autolowat.c b/tools/=
testing/selftests/bpf/progs/tcp_autolowat.c
> > new file mode 100644
> > index 0000000000000..41eacfdb34aa1
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/tcp_autolowat.c
>
> [ ... ]
>
> > +     /* Since LLVM commit 324e27e8bad83ca23a3cd276d7e2e729b1b0b8c7,
> > +      * clang omits the "copy_len =3D=3D 0" check below, which is nece=
ssary
> > +      * to satisfy the BPF verifier's range check for bpf_skb_load_byt=
es().
> > +      */
>
> [Severity: Low]
> This isn't a bug, but could we update these multi-line comments to follow
> the preferred BPF subsystem style, where the opening /* is placed on its
> own line?
>
> > +     barrier_var(copy_len);
> > +
> > +     /* Do not swap the order of the two copy_len checks below.
> > +      * The BPF verifier somehow does not properly track the minimum
> > +      * value for 'copy_len =3D=3D 0'.
>
> [Severity: Low]
> This isn't a bug, but this comment also starts the text on the same line =
as
> the opening /*.
>
> > +      *
> > +      * 91: (15) if r7 =3D=3D 0x0 goto pc+40      ; R7=3Dscalar(smin=
=3Dsmin32=3D-247,smax=3Dsmax32=3D8)
> > +      * 92: (25) if r7 > 0x8 goto pc+39       ; R7=3Dscalar(smin=3Dsmi=
n32=3D0,smax=3Dumax=3Dsmax32=3Dumax32=3D8,var_off=3D(0x0; 0xf))
> > +      *
> > +      * This does not occur if copy_len is u32.
> > +      */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523083001.29=
11931-1-kuniyu@google.com?part=3D11
