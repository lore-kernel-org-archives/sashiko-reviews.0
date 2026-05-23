Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77A175A98
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779496924; cv=pass; b=uQ8+qXH1gIxEoXqbvhhmypnBAuR2oSQcwQQPKluKv82ON53OxTpm/sgILK0GjMelAiz9ef5Tvm5AtV2gHtwNoZlERGPpqeKezwkXKG50k49/HIRTYVE9Hn9psMVKAgDDlZXC/cLE5vsYYaEc/8VHDv4JcTqoELzAXsg7VRCSyYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779496924; c=relaxed/simple;
	bh=oLJfdMAe+v7hyzd6eHHmnfwAbB1cGlc0CxsWfS4//I4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsR/Q6JC/DsFxZyMTjHhjf6EjUma4kmgJMdKd6wu7XapgD/48Qip0BpoUoHmB0gjITZX+iijSy27Ec/DfZrQZ+64JGsIBkNp7osjq1ifexzjJtRqLxFpKvIZPd1oDHD+TZZFO3ZMmz5Neq3fuoyh6on3SgHwlnAtgBk6jARoIPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1aZXjv/; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1aZXjv/"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1357c851a48so10093052c88.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 17:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779496922; cv=none;
        d=google.com; s=arc-20240605;
        b=ZO9XrUTCXgpWvB2YBQpb+EncKRwojJsjZ2htuEu0KBGjijZqHy2u+SNnJWXxgLLXef
         VzASIUlyKh8pxyB2KNdJxZ1+mmcnXEheMFkG120eOQ6e1WDugnkw87X34Vg7QkISZFc2
         TqTeptMAiudYM8NDryX1rrbiUvm4slffjxkjIuM1gkUvXgFyEK3LaJpZfZigOEzGURF2
         KHKECQFKVAjIOPlABrbErABwE09jyk4kgOhV99Y/l2CE96Ocjf3o6ZXhbBGj1pFwXOci
         +fEadbLm9f6UkhIjy4KIiyFPL0/Wt4XngxfaB0/IRT1yMCSAMFC+rLh/719oAKMYjUZ1
         WFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=af+VkUquvxRk1a32iTVzsOEkTiwhLgx64pdwoW9F56w=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=hsoEXI8yWE/c41lwHVaGyzXGabjegUe89j2RxcN3w1YRZFPOCiV6Flz0f/WICCCg8S
         NAPCeqkYhTuN4LXu7k6eo9eBv2YoLvJtBou+UKNBgMVyvlFTvx8fer026TKm88YoBScd
         gQ3iGi1g6ka5HkZqodyMDuI+pmOv/fK16sF3LW8cLFZCZGiwENO0/4FryyOVvo15tUDX
         cHRIaVkgr7DXae9advgzyuQrk8l26BpW6PIEAjQRw8xALwTYvh6Hg86r5VMFrt5FTMXZ
         gBMEJzRtTTNq57VQhHqhxTfWm1I4j+zyKrDWFeA+uDlmM1I3oZ8VDAz9CZNUTmchZzln
         FBlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779496922; x=1780101722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af+VkUquvxRk1a32iTVzsOEkTiwhLgx64pdwoW9F56w=;
        b=k1aZXjv/0UF4jJe7ktHNKezAAGRsAmxhx+05fuAEXajqRBL9Z41xNWqJ6RUML4Icp2
         GbORu77LVGMflaCCUd1XVdZIGyooTRFlykUZPN38KGJm/DmowbciCSAs7X0qJzHZrOEh
         v1TObbH1Lfa1UHCXqT7Lz7n6HbcyX8y9KHvKlyzCnCv11VSKuGK5nNQy5hIKWae/zM9p
         dGfBXJg2S0c25zZBhdNZfUnDLSfIaEyC7O1IcmFWFfVjxzfDPsZPzUlpTny4GOJTb1bw
         gsnwJ1cRK3BceL8O8m0Kc754oZvMwZsY7txBndRckSl1tY09jCAPsEX+uJUeP6P1wdf+
         nzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779496922; x=1780101722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=af+VkUquvxRk1a32iTVzsOEkTiwhLgx64pdwoW9F56w=;
        b=JuAPXNXu8dMgan4IX375fFN/QMFSRFxE13eXMF2bQTAuRyezVBdjiJHrKCE1ugcsMt
         OvOL5nZzA1v5RkY2TVE0pDkBZiteL+AmazmNL/lZBwep08C2GlG3aUhLuTp5b04bYiT9
         tBGajbR8+hosgD9/35xhhc+VTOwqx+KeUvEWKdj5WYT32zW/GhrhY3ipX8nMjiPuuOGg
         jGhFzqKdgINbGEY0wV2R4rT1UF+HzUGI6Tfd0Aspgum280rUFLNUZvyjC/X9Fi6aPeAg
         xWRPunVtczrEP5ema4r03jxaWag71FMXQErVvoBAOrCWn4uB9heXAXVzFmJ4QljWqEj5
         dsog==
X-Gm-Message-State: AOJu0YytX9qYjtEMRrxgQFODk9YZhyL/asPymGhx6qXzFn7YMiSUMSKT
	+3sdZ9ivD46yF78Ax0xDqWjOykYuW0sSPEPxPyFfB9A3ifapbW941Q9TKj9MkexnvaF2FTyvvvs
	6iHnHP5TRf2JpNNRROmgnItNf6o3UNsu7Yu0uevNwkGiq0F5qrF8F4f9tYUU=
X-Gm-Gg: Acq92OF/S1LL1g65NZi/fg0fVr+oFZEwFqnIYrlsfGCUXKg/U65qUrLBsV4fR1KgdjD
	gxBXfoqp93EhaXyb5eur0gvWw4b+8lX+Jiph7n2d3hXclDP06dx0rBtkJD6JW8iarWpKM1NO9rb
	g3iUG3AfKo4iLxQW8QwWNn04eSbT7SxkthsEOAbFrFK+Xv1mn+9Ln+Sj2vxpvCqwTidqSfVfKJ2
	2wvFTc6nuK3MGoLNE5LnweAxYgzoUAmxr/wp4qSkUzi53iClhaXY1Th47nx4UEB2wj5YuzPF1eB
	ec5O8oA4WELMF4Ta/hoeadnEFWHdReHiSSz4KzBS0NIY4iY/0u0FAmsiBePfu0xaE+HhgB8NX1Y
	Oh/UYElSOeW/hzf9DNcyvZ4PvvdaB2uZi6k4KhW+n6Rs+O/kaMzJfMQlRmo6KMRo=
X-Received: by 2002:a05:7022:68a4:b0:132:7ab5:6cb8 with SMTP id
 a92af1059eb24-1365f6fd8ecmr2066179c88.2.1779496920838; Fri, 22 May 2026
 17:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522074601.1658705-7-kuniyu@google.com> <20260522084614.05FC71F00A3E@smtp.kernel.org>
In-Reply-To: <20260522084614.05FC71F00A3E@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 22 May 2026 17:41:49 -0700
X-Gm-Features: AVHnY4JQUJ2C2KHQsCPBeUSA5XtylFgRWRvtNJRwOZUkM1N3p4jA5dJ25jSBM78
Message-ID: <CAAVpQUAFrEMtPoprus7K9j1ZueE+zGM21M=3j8Zd00OMFBXmhg@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 06/11] bpf: tcp: Make BPF_SOCK_OPS_RCVQ_CB and
 SOCKMAP mutually exclusive.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:46=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Using `sk->sk_prot !=3D &tcp_prot` to detect SOCKMAP incorrectly=
 blocks other features (like KTLS and MPTCP) and introduces an order-of-ope=
rations bypass.
> - [High] The mutual exclusion check is broken due to a TOCTOU race becaus=
e `setsockopt` and SOCKMAP map updates use different synchronization primit=
ives.
> - [Medium] Lockless double read of `sk->sk_prot` without `READ_ONCE()` le=
ads to a data race.
>
> Pre-existing issues:
> - [High] A failed map update for an existing `psock` leaves newly attache=
d BPF programs active in `psock->progs`.
> --
>
> commit 5e984d100188fbad217fad5406d80666b989f1b9
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Make BPF_SOCK_OPS_RCVQ_CB and SOCKMAP mutually exclusive.
>
> Both BPF_SOCK_OPS_RCVQ_CB and SOCKMAP can intercept and handle
> socket receive queues, leading to overlapping use cases.
>
> While BPF_SOCK_OPS_RCVQ_CB focuses on optimizing single-socket
> performance by reducing EPOLLIN wakeups and fully preserves TCP
> zerocopy support, SOCKMAP is designed to facilitate multi-socket
> routing at the cost of higher overhead and no zerocopy support.
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 3608036632a81..ff7fd415486a6 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -5382,12 +5382,27 @@ static int bpf_sol_tcp_getsockopt(struct sock *=
sk, int optname,
> >       return 0;
> >  }
> >
> > +static int bpf_sock_ops_check_rcvq_cb(struct sock *sk, int val)
> > +{
> > +     if (val & BPF_SOCK_OPS_RCVQ_CB_FLAG) {
> > +             bool not_tcp_prot =3D sk->sk_prot !=3D &tcp_prot;
> > +
> > +#if IS_ENABLED(CONFIG_IPV6)
> > +             not_tcp_prot &=3D sk->sk_prot !=3D &tcpv6_prot;
>
> [Severity: High]
> Does this check falsely block other features like KTLS and MPTCP?
>
> Since features like KTLS also override sk->sk_prot, if KTLS is attached
> first, the check would falsely reject enabling BPF_SOCK_OPS_RCVQ_CB_FLAG
> with -EBUSY. Conversely, if the BPF flag is set first, the check passes,
> and a subsequent KTLS attachment would blindly overwrite sk->sk_prot,
> allowing both features to operate simultaneously and bypassing the mutual
> exclusion.

Disabling ktls is okay, but I'll check if sk->sk_prot is in tcp_bpf_prots.

tcp_bpf_prots < sk->sk_prot <
&tcp_bpf_prots[TCP_BPF_NUM_PROTS][TCP_BPF_NUM_CFGS]


> > @@ -5424,6 +5439,11 @@ static int bpf_sol_tcp_setsockopt(struct sock *s=
k, int optname,
> >       case TCP_BPF_SOCK_OPS_CB_FLAGS:
> >               if (val & ~(BPF_SOCK_OPS_ALL_CB_FLAGS))
> >                       return -EINVAL;
> > +
> > +             err =3D bpf_sock_ops_check_rcvq_cb(sk, val);
> > +             if (err)
> > +                     return err;
> > +
>
> [Severity: High]
> The commit message asserts that checks in setsockopt and SOCKMAP map upda=
tes
> are performed under lock_sock(), but can a TOCTOU race occur here because
> they use different synchronization primitives?
>
> While bpf_sol_tcp_setsockopt() uses lock_sock(sk), BPF helpers updating
> SOCKMAP (like bpf_map_update_elem called from BPF_PROG_TYPE_XDP or generi=
c
> map updates via sock_map_update_elem()) only acquire the spinlock
> bh_lock_sock(sk) and disable bottom halves.

Hmm.. I'll protect bpf_sock_ops_cb_flags with sk_callback_lock.


> Because bh_lock_sock() does not
> wait for lock_sock()'s sk_lock.owned flag, these operations can run
> concurrently.
>
> A concurrent SOCKMAP update could check tp->bpf_sock_ops_cb_flags (seeing=
 0)
> and override sk->sk_prot while the user's setsockopt is validating
> sk->sk_prot and subsequently setting tp->bpf_sock_ops_cb_flags. This allo=
ws
> both features to be successfully attached to the same socket.
>
> >               tp->bpf_sock_ops_cb_flags =3D val;
> >               break;
> >       default:
>
> [ ... ]
>
> > diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
> > index cc0bd73f36b6d..5c5c67080740a 100644
> > --- a/net/ipv4/tcp_bpf.c
> > +++ b/net/ipv4/tcp_bpf.c
> > @@ -729,6 +729,8 @@ int tcp_bpf_update_proto(struct sock *sk, struct sk=
_psock *psock, bool restore)
> >                       sock_replace_proto(sk, psock->sk_proto);
> >               }
> >               return 0;
> > +     } else if (BPF_SOCK_OPS_TEST_FLAG(tcp_sk(sk), BPF_SOCK_OPS_RCVQ_C=
B_FLAG)) {
> > +             return -EBUSY;
> >       }
>
> [Severity: High]
> This is a pre-existing issue, but does a failed map update for an existin=
g
> psock leave newly attached BPF programs active in psock->progs?

Orthogonal to this series.


>
> When adding new programs (e.g., stream_parser) to a socket that already h=
as
> a psock in sock_map_link(), the program pointers are updated immediately =
via
> psock_set_prog(). If a subsequent initialization step like
> sk_psock_init_strp() fails, the function aborts and calls sk_psock_put().
>
> However, sk_psock_put() only drops the temporary refcount acquired earlie=
r in
> the function and does not revert the psock->progs changes. As a result, t=
he
> newly attached BPF programs remain permanently active on the socket despi=
te
> the map update failing.
>
> >
> >       if (sk->sk_family =3D=3D AF_INET6) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522074601.16=
58705-1-kuniyu@google.com?part=3D6
