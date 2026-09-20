Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB153E49F2
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938645; cv=pass; b=LOjC/y4X2SrLzAkFnzOICZx25jkoK2zFdzmwFdkCEy6oAKuq3E1uCmAM7jsP+XGoE8oFAt9D7u1SVdH4H/vASELL35UFDC14TdJLI8AaFTzUUVnYoa9RZFHQTulKky3H4H4Dv5WprLiNWPK0TDw2mkfhD4oB7bB5YZ6QKZIgcKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938645; c=relaxed/simple;
	bh=69/FIpXcRvK5VlNg8OdO/Vit0CelQGLcfTglHil7KWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpqjB/I2DhhJqv66Qe+X/8toxWvHnTnMnCbWythB7t/iXfPE2pCDy2z/Ho2r1j18TQHTIJeSfMFUdR3Qob3S0QQnZJBuK8XElXTOPwjkHjutMGJl54QCQFoM1pub9KZ7eOPAHvwAxZeNiB/qs1R/5ee/UCLa0yRhz5yW5FhN1Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h2G6/3+E; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h2G6/3+E"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so3156864a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 14:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938642; cv=none;
        d=google.com; s=arc-20260327;
        b=Rm/BjJr+sQo52nZOIfmGosICFu3N1uVBOjryVt1MypFBvqkWAnf9tYzkUzSetRlbo+
         hUbz5EyHAMu8KyNw9Kaktqjfe4is7wOVQtzyriAY5TBMC1HVFyno2FvZrlROz0msS/u0
         cc6sxtnDjJ6LS1qNqem6FwWEofiavG/+MwknZ3nwECyyCYAjG/lQsFuAdG5h3uPalLqx
         JcmbFqexLnwSFDJYxgzAr5F18OiX/hzUNJ+BOChclsLJJhPw4vugrbETJzg9TDHmjEZN
         HxVS1NEYIzmxoEEIUIsbGfXmrZllc89vGQiNNOBdY6nnaSP6WQW6ij1EIQFfToDy1G9S
         mPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYvxESqkXL+/6XOtOcDBnAusVQ1+xIAcUiUyD6HUoSY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=ra0a8Y5Y/kjnXEJR30pYrACsdE5MUFDPxU5EBy6OF41xYTrn59AXFtNBp7GVOguiV3
         9Cj2fPPaS8b7bsdlXZ70qPtVpyrZoAWREC0T7d3D1a+I07SFfUrAPpr+MblpUfDt6dhD
         wISfRKUfpJWVe2JQVgzqdeJCINbczIpLxfYxAy6YOui+pWDUglsLV4uNU3z/eLSyryV3
         1gmy0yz6Y4mSKez8OJGMBFwvII0oFyqUDlrswZ/ayXFRQrH1qdO+TvvlhfxRHGd5QHBs
         wnwCE46v3hZFi+W2j1OupfUsHao2aeYaSK6jBjg0oMprDTi9D2dh/hqCb/U74IQ5cR9A
         nBtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789938642; x=1790543442; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EYvxESqkXL+/6XOtOcDBnAusVQ1+xIAcUiUyD6HUoSY=;
        b=h2G6/3+ETPyQuoqNgUfEO5kJe3rv71iho+81LtTHcHJetVz3BOADD1cMg8wRUUNl+z
         45mE2pIdvpXC80ubRYC5kZM+tbN+KbXBho1raLUuIXHjV7o3xGOaKfml2Zlxvul43UVe
         oOQAm+znaWqXnThhte3RYMfk4mScjk1XiCL4Wub+zgz0zd7bitUVehQeslr2P3wsPsiV
         a3TO7p7Y2CSY8me9Of2bZ0iui64BjTpRPOjNkEbMMqlCq31Pqv8x3ln3uYWf27O6eNkL
         Wy25LXEbpeKB4B5JUcz78wt1uLuOstO/JPENDNS+OfSYMz+Ptce4mIl7awgG7+YbdxmG
         sPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938642; x=1790543442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYvxESqkXL+/6XOtOcDBnAusVQ1+xIAcUiUyD6HUoSY=;
        b=12DaHjlsA/TAaZBQPMtdUXyV4QOGIzs9+1DEJr4kzFiT3aIBEHjCDWBJvSmoDuc3TF
         1sgq3D3t9lwmB3nxKK1+DgSAVVeHDOLasJ2Cn1u1mzU0OCX+waR81vm4HNVEL34tsvmi
         hDrEx3Uavwo/y6/sUBujgnGbfJdIy0/ro3WWWPQ1E/1ECcxG6JnSYHQwi2ioFNTQnQ+8
         aznTkR7VR3jKAWCXG8Pw43HpY1D3TUEKgRa7Obj2T3kHb0aTFRVdgFIWsNoHTp9rM0E6
         0eWT0lFsGNnRTeXPU8Yj/lcDKKoEA3/f+PctOIQJ6R7R7MK7Oz60L2nSwaDkP3lyMsXP
         8uUA==
X-Gm-Message-State: AFuF++nbP8PNwH8tT2pqozrBsAdpkFdOciDQmK83YE1J+e3rpgpL2ftg
	Yhdi43cBBm4IriuBSAhnGkyxim3a43JSmMKhj0EKcAyisgit3zZxmKNi3AzC42RGSykSb4xOQC0
	vOA2pynyM7i22yRDOOTdveFwv+4VfkFQXD3b8dOALhoVz0bi9rRvl+Jm0SDY=
X-Gm-Gg: AYBFou3fzIsjwJqjf9HQSKBJ5IS/VvTi9Ce4GYLCuM4AlaKNHiBTRhXyZsrSWoran9S
	wfxB72rfPqeRZYpyaATc9+AFvAwyp7iGeyYkxi1mycmTXLQgOubSS2FYfB1X8Jz76zA7YIX3Rqd
	akh8EI4QtYHtNn9PM44dyKATIySxOIw/3bqkVm07/EFB+v7Q53/IhH41+tM6XnmMQU90Ey+WhJv
	Td6MtI5Oj+CZqxO2ZS2SnA0n29SpJ91iCJ526gNmJcostgSR9kqtNCHsFoKv0e7f55ZjGjNNoFA
	JWRczQ1OzQU3Yzl0meG69tfJIEQ5hGCgCo31mNdw6QLJ0kMGGfm9cOAAfsVZpSOBI0nHkv3XfC0
	gsKmRtC4E7vKBIQxFf17pQ1CsHQDf6rCG+AMpPfA4EbW6PAu1IOJ8dscVf2AX+cD+U6I=
X-Received: by 2002:a05:6402:42cb:b0:6a9:4edc:849a with SMTP id
 4fb4d7f45d1cf-6aa55edb017mr6546558a12.3.1789938641410; Sun, 20 Sep 2026
 14:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920195633.3033620-1-kuniyu@google.com> <20260920195633.3033620-7-kuniyu@google.com>
 <20260920201333.A40C81F000FF@smtp.kernel.org>
In-Reply-To: <20260920201333.A40C81F000FF@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 20 Sep 2026 14:10:26 -0700
X-Gm-Features: AcwNN1WlwcrlxX3Pn_Cb1NE8oUHBEHoAjP2yqHBfg1NXE2grE4ZnMmSHo80OmKU
Message-ID: <CAAVpQUAJJ2RmL_dTH=M2s2Tj9mypL2YtYK7t6tCSaEj4bYY9Uw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 6/7] bpf: tcp: Add kfunc to adjust sk->sk_rcvlowat.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 1:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: tcp: OOB access and type confusion in bpf_tcp_ops_set_rcvlo=
wat()
> --
>
> commit c903e36ae4ed7b68c1aea9023743a57be672cd2a
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Add kfunc to adjust sk->sk_rcvlowat.
>
> This commit adds a new BPF kfunc bpf_tcp_ops_set_rcvlowat() to dynamicall=
y
> adjust the receive low watermark for TCP sockets. It clamps negative valu=
es
> to INT_MAX and configures the wakeup flag appropriately depending on the
> calling hook (enqueue vs dequeue).
>
> > diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
> > index b0e14b54917eb..3768b1440eb77 100644
> > --- a/net/ipv4/bpf_tcp_ops.c
> > +++ b/net/ipv4/bpf_tcp_ops.c
> > @@ -359,8 +359,62 @@ static struct bpf_struct_ops bpf_tcp_ops =3D {
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
> Could this lead to an out-of-bounds slab memory access if a BPF program
> passes a non-TCP socket?

No, false-positive.

This kfunc is supported in encode_rcvq() and decode_rcvq()
only, and we don't support lookup helpers there.


>
> Because the kfunc accepts a generic struct sock *sk parameter, the BPF
> verifier allows passing any socket type. For example, a trusted UDP
> socket could be obtained via bpf_sk_lookup_udp() and passed directly here=
.
>
> However, __tcp_set_rcvlowat() blindly casts the socket to struct tcp_sock=
 *:
>
> net/ipv4/tcp.c:__tcp_set_rcvlowat() {
>     struct tcp_sock *tp =3D tcp_sk(sk);
>     ...
>     if (tp->window_clamp && tp->window_clamp < val)
>         WRITE_ONCE(tp->window_clamp, val);
> }
>
> This writes to tp->window_clamp, which resides well beyond the bounds of =
a
> UDP socket structure.
>
> Additionally, does this permit concurrent modification of the socket stat=
e
> since the looked-up socket isn't guaranteed to be locked?
>
> > +}
> > +
> > +__bpf_kfunc_end_defs();
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920195633.30=
33620-1-kuniyu@google.com?part=3D6
