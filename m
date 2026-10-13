Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEE94F93CD
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903693; cv=pass; b=cF9mJWS9zatyLZYLQp9mrendMF6sr7ccu8RuyQW6GaOkQGdWmwvgA7ZJhacfjiKVTc8eRJElkfxH1I1bPUBRlQJ+Gr2dxln1caacaiY/tIHXMY1FrnIwA+SAxYKRg3JP2eNqEJoUyQEBpqKPSYAzeJJirWkGQSsKV/3b8IOhWAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903693; c=relaxed/simple;
	bh=tw/fVrFqpZzJSyIZ5wzwHJRG0AwN51iLSFbnVvJXUeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iywW0ivUP2NjXtxpGPPHXKdBzen3tpotoOWG2ePwGjLtwPp/94VfDV5zjWktbbO9Tf7JgWJzRqnnj3dHhG5BwrYsa1dkeUOzn//vMKYdDNXsFN4HqZk1MMYvxFEix68oFUQBT64pllqXQw/Ep+EOCt/CaHM9Jc5a6dGMAMgOObM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cg5Pa6Pc; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cg5Pa6Pc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so25452a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 08:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791903689; cv=none;
        d=google.com; s=arc-20260327;
        b=bywKxFeoxRq18C9bv7kjQeztbX3s/l3SUWh9LQ9oy5iMBQMWytGiUskXX+yiBTsxP1
         3RyHDWdiuo/X6OQgxf5j2RT9xBjpJOyBABFFmWcbMwf8xBPbdL2V/4sO2bNTttpe9ooX
         rSl9W/BoGEDKfXiQQK/Vl9XYDlHnfMd7H41U2RiUmQ4Dk7kdia4HlOaz6AbCWYkCzEIo
         H8narPXGkNvo3RP9wr/VH30BivPsfZlqMFlJRjvXp2F54GBbOpvEzKL/w+3/6jJvB5Hm
         KvmRjOth2xl6b6otZ8NSw4w7o8ofMUwpg0c8gSYG2ss7ddviYxzTwLZsK/ayGl50lyRX
         vSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rymSkdZezJnGb9FeGEEgvGAMLZUCeRFNqmLOcwpB228=;
        fh=hVpOB/H+Wo6OlonK1GGSrvbmkRe5Zng6w+TlY8mnbsQ=;
        b=iPoVeEOgItIuEjPYYBI4nntiVT4Tqqq7PuUvSsMyienV5JuKgh+I/yVQwKxvLk9tL5
         rfE6vnz1g5lyNtj0++9JT+nPSAj1xAr9mT8dcMTTaMfkVKr0tyKh2c6jozPT5dqvxOgA
         MXZMFGdH+biWPCYTtJAS0pu655j3yWMQNNIMpyBCoNifm2CsTy15NAYywRDzc3TwHKlc
         Rk9j2FYEUa68uMmsD83JlA4VdYy4wSPAJ9dovgqx8uBzLSibMmJ/2/Hk5z9IMoo0B/gf
         Q5KvXhKnB4QV0RdjS/gc3FW+zGMcuPdPhbJGKcFeXFqpeO/Q92rXrpey3zEsy9tiXp7l
         lPww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791903689; x=1792508489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rymSkdZezJnGb9FeGEEgvGAMLZUCeRFNqmLOcwpB228=;
        b=cg5Pa6PcY4CEdA6zz/2ifoiMvis3gghn3KWOr0BCV4VSDcmKRRHn0jwETcnoitutIU
         zudbUvkM92nO09q3VywKKP2+BEi69gXJ3rsJOMfmguolWYUkplue8sPkiIOLWdtUVsaY
         LBmGhhPX8QRuS2w6qfozPi6hpiO9ajj/zUbI/4H4JwNW58J6WBYJ7ZOcP0IaE/4VuIoU
         m3R0R1TooEooE266R22C+rxWXLmnq9drT39OqtiuGsaUawceqVYfcJeRmKmjUTpvYcEL
         gHs0zPSTwjtgOBCSP+Ot3UNn1xUwWBur3yHHv4AT7un/ko/sTuLtTMPbSjxzuz3GjASw
         ii/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903689; x=1792508489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rymSkdZezJnGb9FeGEEgvGAMLZUCeRFNqmLOcwpB228=;
        b=OSQC+JkWKHYBHuTcWJelQSmREe/ia3HY85xSPy+uu4QxlH+xKRMgDKwumg8r7+Ia46
         DiWG9jvB9fiVsQumx1epzmktXBzTvYHud528mpNA7cL6JIp9ZYkETKwjTcZdcSSMeFz0
         Ady8Y/g6GO+Y5DaNdr/JBnP1PiaYNPZHQMzhbCsW82QfsbUVnOX04KGJKd2mtpR+c6FG
         5+KNZRVARdGOqBdIM9kTUsvXlToDmuRg1+EAt/Dfpor/Nun5c6tS44tIxcb0OP/ETC2W
         6GQb/BFcqRaSCv8Z9M00shwiA8IDaqKgoo5Ey5TwoKSuyHMTjFrGuDRjeIDvXQPYajq+
         oChA==
X-Gm-Message-State: AFq9FYIaeV6CxyXO276GFenVbNeIjI68ai4sV2i+2zy5/n5ykYXdBwV7
	gLrjuq1M2GPLjmUN4dKiD5PIxRluUnVfa3zw9oGb+Ll+l4dfd3W71TIUcu1NIgQLZOaHlqONnLd
	8PPkUiQsuuztUgAbNS7qi+tGAc9c0rdDcMzhqJvtQVTl8yGYzRZ3f18EF
X-Gm-Gg: AYBFou2yZ2k1at9z1VwkBf7tXud91MdLWMrn/939h1ZBn0TXfk9xiycFifhGtK7HCaz
	8QnrylkvsnWPuuJHPr7oLUyA8M8C8zkBdTvklJSZ5mgEMPSlz/706IvUT2zoQVH+MyNEQObxS81
	CvfFlt9k+FGdGIA9BQjQB2hLNcM9z9jfinRLWas+hNinVoZdeRZmNuHzbsfDKAZ7lmiy/ybuGt/
	2PwzK+TYbxG+B8ZfIqsslApk6YN3wzqeZ3VYq9mTFtV0sWnWVVgFYg9vTcX09pFHHQLEY0WU4h3
	iTxHWw/Z19RSgLlqmp/duxLLKo/qgkHzJcjsl5QpBGU2oBM1QQY9ZSVagONBTsTyMlGrArvjK/x
	EEU4hQKmW+8c=
X-Received: by 2002:a05:6402:652:b0:6ac:bdfe:116 with SMTP id
 4fb4d7f45d1cf-6b199a8e6camr137824a12.16.1791903687982; Tue, 13 Oct 2026
 08:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012082148.1698596-1-almasrymina@google.com>
 <20261012082148.1698596-7-almasrymina@google.com> <sashiko-outbox-169237@kernel.org>
In-Reply-To: <sashiko-outbox-169237@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Oct 2026 08:01:16 -0700
X-Gm-Features: AclHuK8M8mD59YUfA3CRA-iHfHLQ1szT4G06vA9qiJ8Q4zstPlMFFHmXtF7_XfU
Message-ID: <CAHS8izNBV==1fOkO+NP-vBznqtLZe9EzdkEj08gC_uZHiTRLhg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 6/6] net: kunit: test netmem, page_pool, and
 skb frag refcounting
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 1:22=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] net/kunit: kernel panic in TCP devmem test due to unset skb->u=
nreadable
> --
>
> commit 432a5016a6d079e3237437e79dd79f25313c4f7a
> Author: Mina Almasry <almasrymina@google.com>
>
> net: kunit: test netmem, page_pool, and skb frag refcounting
>
> Verify that non-pp (page._refcount / binding->ref) and page_pool
> (pp_ref_count) references stay balanced without cross-counter leaks or
> underflows across regular pages, page_pool pages, non-pp net_iovs, and
> page_pool net_iovs with both pp_recycle=3D0 and pp_recycle=3D1.
>
> > diff --git a/net/core/net_test.c b/net/core/net_test.c
> > index 9c3a590865d26..6f21e6baf7fb3 100644
> > --- a/net/core/net_test.c
> > +++ b/net/core/net_test.c
> [ ... ]
> > @@ -370,10 +370,1213 @@ static void ip_tunnel_flags_test_run(struct kun=
it *test)
> [ ... ]
> > +static void netmem_ref_test_tcp_devmem_recv(struct kunit *test)
> > +{
> [ ... ]
> > +     /* 1. Receive via tcp_recvmsg_dmabuf -> SO_DEVMEM_DONTNEED releas=
e */
> > +     skb =3D alloc_skb(0, GFP_KERNEL);
> > +     KUNIT_ASSERT_NOT_NULL(test, skb);
> > +     skb->pp_recycle =3D 1;
> > +     skb_add_rx_frag_netmem(skb, 0, niov_nm, 0, 64, PAGE_SIZE);
> > +     napi_pp_get_page(niov_nm);
> > +     TCP_SKB_CB(skb)->seq =3D 0;
> > +     TCP_SKB_CB(skb)->end_seq =3D 64;
> > +     skb_queue_tail(&sock->sk->sk_receive_queue, skb);
>
> [Severity: Medium]
> Does this code need to set skb->unreadable =3D 1 when injecting this devm=
em
> fragment?
>
> Without it, tcp_recvmsg_locked() checks skb_frags_readable(skb) and retur=
ns
> true. The TCP stack will attempt to copy the payload using
> skb_copy_datagram_msg() instead of processing it via tcp_recvmsg_dmabuf()=
.
>
> This leads to a kernel panic when __skb_datagram_iter() executes
> skb_frag_foreach_page() and retrieves the page pointer via netmem_to_page=
().
> Because the underlying memory is a net_iov, netmem_to_page() returns NULL=
 and
> the subsequent kmap_local_page(NULL) call crashes the kernel during test
> execution.
>

It certainly doesn't panic when I run it. And we're testing
refcounting here, I feel like going through a rabbithole of what skb
flags may be wrong on these test skbs may be pointless. And general
design is not necesasrily net-iov =3D=3D unreadable.

> > +
> > +     msg.msg_control =3D cmsg_buf;
> > +     msg.msg_controllen =3D sizeof(cmsg_buf);
> > +     ret =3D kernel_recvmsg(sock, &msg, &iov, 0, 64,
> > +                          MSG_SOCK_DEVMEM | MSG_DONTWAIT);
> > +     KUNIT_ASSERT_EQ(test, ret, 64);
> > +     KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), =
3L);
> > +     KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
> > +                     base_iov_ref);
> [ ... ]
> > +     /* 2. Receive second packet & destroy socket to test
> > +      * tcp_release_user_frags() -> napi_pp_put_page().
> > +      */
> > +     skb =3D alloc_skb(0, GFP_KERNEL);
> > +     KUNIT_ASSERT_NOT_NULL(test, skb);
> > +     skb->pp_recycle =3D 1;
> > +     skb_add_rx_frag_netmem(skb, 0, niov_nm, 0, 64, PAGE_SIZE);
> > +     napi_pp_get_page(niov_nm);
> > +     TCP_SKB_CB(skb)->seq =3D 64;
> > +     TCP_SKB_CB(skb)->end_seq =3D 128;
> > +     skb_queue_tail(&sock->sk->sk_receive_queue, skb);
>
> [Severity: Medium]
> Will this second injected SKB also trigger the same panic since it lacks
> skb->unreadable =3D 1?
>

Same.



--=20
Thanks,
Mina
