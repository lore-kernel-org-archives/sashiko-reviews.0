Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEF2F3614
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781388215; cv=pass; b=Vw/lUxRUTQLALXmYWU8b1BjgJbmrlpF0PrUJwMbM2Cdj/vgzpW+K91ZtXS5ka+F/kLsKOF4QcM34spmBf9tEOLRrT5nFhrSJoChCNLUUBEdZ+2K3HQ57wQuK/5pW8mueINiVuf0wOBFkmIqemSfBY9iBzmZlD1GrLwE8ktTvsiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781388215; c=relaxed/simple;
	bh=CC2KOyzJo9c2S8ETDKWxWGYPm6Xl7L/vh9sZj+qsAq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5MLsN8B3HmagDY3DvvAmK+Rmd77690eAoj5TCBK6K+0r5goC6oF5KJLWK5MfwyaHWM+4iuFmTxPV8eolH26FhZLeMmtvpJz6cICLCkPzMIp5E6j4KPuJs2alEuN210Q3wGbjaHeMvE4llQ65XEclqF1CxQ0sw/Kfj7xIFQ5IXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zx9Uqx7K; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zx9Uqx7K"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6919f40a0c8so3848301a12.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 15:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781388213; cv=none;
        d=google.com; s=arc-20240605;
        b=hs3AlypKVcDcB91p3oAltBzU1SpuxqlY7cXfYv9oX66joj735gbw11UjV6l8BoVzNL
         cIHu2fwJ5WDHNHgTtbxElveW3G5yIPd81Ngg8uzvHqvi7uKN3J5QAI4aI4nPjCRE2og8
         7jWQSXYIZUSNziVbFbLf8aQWLITNL3ZjUR3eGy0S3FTvlFLcZ+x6nweXRjdZ7sTXD1el
         G7gXMgXRt4yZYjTiZHyxpFxYZep52y9cZEcIK7QTjUiuZgIt7CduIeXMgx6XnTQ295xv
         jqWybTU0irYx/4r80rvEsyL9k2ZgYVnmR7a8ugmYaRvuiRwyumtnAYpBXJq+1pZt0Vt3
         nIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qysF8lJhFwPgtIThDB7gwFIAI+ONbPrwLoXuG9PR2+A=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=kW8fmcWNOiNVfH7OKrE52KmNf0xeIpXgdCfpJHJKrAM9pxPczTphjMNlxpv4bpXgt+
         1US+y5NcWDhgNCiY9j0yS63ahoc4sNxvvtqOW1FZpPSQmYJwMwHAcmrQKYsSO+QfctC7
         6wCRAjW8kwnz/N4/94ZnFx2vfXZYH+lKyYOLDvXGPuId8GOx8TXUUo6yl0aPLQPgJVyY
         txO33jrFBSF5mUGrkBFz17i4dinFGoJcg3LkiKOINJtnotox4k2Mzkz0iqOdtWwdyirD
         2f3492wfO5cXI2MPDNUyi7WVnxDGdOhGGBikp3UH7JzI3yg8G3+hm9Ud5+J/l+Q3c175
         WiEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781388213; x=1781993013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qysF8lJhFwPgtIThDB7gwFIAI+ONbPrwLoXuG9PR2+A=;
        b=Zx9Uqx7KBOyttINfQBwbgwHN0A2gMo5znlU6WK+YdvNxYuJC6unUgISy+hhVOZuV1s
         CHz5J3RGCs51pLAU5Z/RC9hll8G3iEqa3EbWrrjrqlOV6MIBez/NoBS691B0S4Qj5Yd/
         tJDDMsy0UeKSYG/TQ+1Rjqv6sQwrLannWHNefus8CnIKJ5kbaXNKVRhptalAF+fMiplO
         BQYd1w2vVuPh4GyouNZ8l32fDy1LL02NRY02Y6ZF7+t5f1MKy3QVt98VeUkmvIEY/Hu7
         FSy4B8hBKosKnjWUHkkADWPebfWM8Ycji1Op26gWlWxIYZ5dptUWIxSZGMzqQjyQmtjO
         2EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781388213; x=1781993013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qysF8lJhFwPgtIThDB7gwFIAI+ONbPrwLoXuG9PR2+A=;
        b=d2Mz8vNeJ/oLVtbj0Tpu6El3/vXs6rJSzmiBGZcN/KXY+xuT+YJJ0RxCPTz9xhAy1S
         7kQBCwWR/DBRz5n/jFG0QKycdmrJGyuA8c5mKnYLCzM8SLGnM2qbeKGL/gA6AYeiMA3O
         72K+3Gz+2nqWoL88mqqeEChNYTuQUy70wF92DVxV57NOJH5mp/7T3m19z8NVlO/TmGr3
         Xh+vdwi3JBYDcKPkADDf1CIAwUE9hGA69XmN16JF86x0BBfLsjDIbU1DgBQH/BSW3l/d
         ceF8oXY5roh2b+sqFLwyu1G4ie7vYlsBQ+74c4yitOnFlDidYl/kRlDTGHzkpai7B5/g
         iHBA==
X-Gm-Message-State: AOJu0YwoqnOsXOLw4WBaYE96UdIU4jBSuVwQYLgtmUyrBeYW6YJUdlHv
	qVKQcrnP2XcfMQihroeYM78ZmstuOKlRe/YTEFeSK4ss460nApLZ8HDuOCPFd2mjMTkedVgTRy+
	jnN75ELU22sY0mYMI5aU9C/5fDorr5ITrUz/xOwm0Lvne+7ubbV0lGFW/zHo68Q==
X-Gm-Gg: Acq92OHZN+AQcHQRDlCP4CMovY2vBd9180/HCZgfisskXJhtuXB/99acQGoTinCAJrs
	Rz0JG2WSLS1VWuq4+74fw/+1J1XG9m+9sJjU2wM2nU5644JW0k7ODhUeJIhgqc2w3rvlQEz83D+
	9GDcSvcBTaZOgQhXi6Yb4wNioWiHvkGbFXHRPhk0d+R66TvFSgpjfD7zcRHyCjd64j9L1zR8QNE
	JRQQOvGGUdP875PnGRkgidifts4xr1CCPQt1mAX0tGnSwQb2nwRwwEc0mQPjIH/yj4ka9jUS2EK
	aNtdawK6DBtisaVvGhABMxTgpuN3LW2gBLLn0sHrCuPLhUtfOXVChRUVXJr927HlpjCOsYYGbBb
	KoyrvgzmYXHMpsjMX0t5MkSxoVcYzBa9gLA+sW/ocBihLadLROeXd
X-Received: by 2002:a05:6402:3982:b0:691:b5aa:5a5c with SMTP id
 4fb4d7f45d1cf-693c6a838ecmr1690850a12.20.1781388212377; Sat, 13 Jun 2026
 15:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613010039.1362312-5-kuniyu@google.com> <20260613012052.C30831F000E9@smtp.kernel.org>
In-Reply-To: <20260613012052.C30831F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 13 Jun 2026 15:03:18 -0700
X-Gm-Features: AVVi8Cd2fngs2ft348K_ehIGvxfiiaA919q7ioHY0qEDUuYMap8QhqfoyVbRUDQ
Message-ID: <CAAVpQUAJ9s8DXVnt2Kxyga3HLqDcp+Jh0AvzhzrK0m3t1qg3OQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next/net 4/5] bpf: Add kfunc to proxy TX HW Timestamp.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 6:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Incompatible `payload_offset` semantics and bounds checking betw=
een `tcx`, `cls_bpf`, and `bpf_skb_complete_tx_tstamp()` leads to false rej=
ections or packet corruption.
> - [High] Blindly clearing skb_shinfo(skb)->tx_flags destroys the SKBTX_DE=
V_ZEROCOPY flag, causing a permanent memory leak and application hang.
> --
>
> commit 07c148630f8e93ce45f5ce41dcd9ee675f05a799
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: Add kfunc to proxy TX HW Timestamp.
>
> The commit adds two kfuncs, bpf_skb_scrub_tx_tstamp() and
> bpf_skb_complete_tx_tstamp(), to proxy TX hardware timestamps. This allow=
s
> socket applications to receive TX hardware timestamps via SCM_TIMESTAMPIN=
G.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 0c6c270d9f7d1..a45cdf38616ac 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -4456,6 +4456,41 @@ tcx_run(const struct bpf_mprog_entry *entry, str=
uct sk_buff *skb,
> >       return tcx_action_code(skb, ret);
> >  }
> >
> > +static int skb_do_completion(struct sk_buff *skb)
> > +{
> > +     enum skb_drop_reason drop_reason =3D SKB_DROP_REASON_TC_INGRESS;
> > +     struct bpf_redirect_info *ri =3D bpf_net_ctx_get_ri();
> > +     struct bpf_tx_tstamp_cmpl *txtscmpl;
> > +
> > +     if (!(ri->kern_flags & BPF_RI_F_TX_TS_CMPL))
> > +             goto drop;
> > +
> > +     if (skb_unclone(skb, GFP_ATOMIC))
> > +             goto drop;
> > +
> > +     __skb_push(skb, skb->mac_len);
> > +
> > +     txtscmpl =3D &ri->txtscmpl;
> > +
> > +     drop_reason =3D pskb_may_pull_reason(skb, txtscmpl->payload_offse=
t);
> > +     if (drop_reason)
> > +             goto drop;
> > +
> > +     skb->protocol =3D txtscmpl->protocol;
> > +     skb_set_network_header(skb, txtscmpl->network_offset);
> > +     __skb_pull(skb, txtscmpl->payload_offset);
> > +
> > +     skb_shinfo(skb)->tskey =3D txtscmpl->tskey;
> > +     skb_shinfo(skb)->tx_flags =3D SKBTX_HW_TSTAMP_NOBPF;
>
> [Severity: High]
> Does this direct assignment cause a memory leak if the packet was sent wi=
th
> MSG_ZEROCOPY?
>
> If the user application sends a packet with MSG_ZEROCOPY, tx_flags contai=
ns
> SKBTX_DEV_ZEROCOPY

This is pure hallucination.  No such flag exists.


> and a reference to ubuf_info is held. Blindly overwriting
> tx_flags here erases SKBTX_DEV_ZEROCOPY. This prevents skb_release_data()
> from calling skb_zcopy_clear() when the SKB is freed, leaking the ubuf_in=
fo
> reference and causing the userspace socket to hang indefinitely waiting f=
or
> the completion notification.
>
> Can we mask out only the timestamp flags or preserve SKBTX_DEV_ZEROCOPY?
>
> > +     __skb_tstamp_tx(skb, NULL, skb_hwtstamps(skb), skb->sk, SCM_TSTAM=
P_SND);
> > +
> > +     consume_skb(skb);
> > +     return NET_RX_SUCCESS;
>
> [ ... ]
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index bee1e7eee5eae..fce2d24aad487 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -12396,6 +12396,67 @@ __bpf_kfunc int bpf_skb_set_hwtstamp(struct __=
sk_buff *s,
> >       return 0;
> >  }
> >
> > +__bpf_kfunc int bpf_skb_scrub_tx_tstamp(struct __sk_buff *s)
> > +{
> > +     struct sk_buff *skb =3D (struct sk_buff *)s;
> > +
> > +     if (skb_at_tc_ingress(skb))
> > +             return -EINVAL;
> > +
> > +     if (skb_unclone(skb, GFP_ATOMIC))
> > +             return -ENOMEM;
> > +
> > +     skb_shinfo(skb)->tx_flags =3D 0;
>
> [Severity: High]
> Does clearing tx_flags here also destroy SKBTX_DEV_ZEROCOPY?

Same here.

>
> Similar to skb_do_completion(), if a user application sends a packet with
> MSG_ZEROCOPY, blindly clearing tx_flags to 0 erases SKBTX_DEV_ZEROCOPY.
> When the SKB is ultimately freed after transmission, skb_release_data()
> will not call skb_zcopy_clear(), leading to a leaked ubuf_info reference
> and hanging the userspace socket waiting for completion.
>
> > +
> > +     bpf_compute_data_pointers(skb);
> > +
> > +     return 0;
> > +}
> > +
> > +__bpf_kfunc int bpf_skb_complete_tx_tstamp(struct __sk_buff *s,
> > +                                        struct bpf_tx_tstamp_cmpl *att=
rs,
> > +                                        int attrs__sz)
> > +{
> > +     int defined_sz =3D offsetofend(struct bpf_tx_tstamp_cmpl, payload=
_offset);
> > +     struct sk_buff *skb =3D (struct sk_buff *)s;
> > +     struct bpf_redirect_info *ri;
> > +     struct sock *sk =3D skb->sk;
> > +     s32 delta;
> > +
> > +     if (attrs__sz !=3D sizeof(*attrs) ||
> > +         memchr_inv((char *)attrs + defined_sz, 0, sizeof(u16)))
> > +             return -EINVAL;
> > +
> > +     if (!sk || !sk_fullsock(sk))
> > +             return -EINVAL;
> > +
> > +     if (!skb_at_tc_ingress(skb))
> > +             return -EINVAL;
> > +
> > +     if (attrs->payload_offset > skb->len)
>
> [Severity: High]
> Are there incompatible payload_offset semantics between here and legacy T=
C?

No, both are offsets from the ethhdr.


>
> In skb_do_completion(), skb->mac_len is unconditionally pushed before pul=
ling
> txtscmpl->payload_offset:
>
>         __skb_push(skb, skb->mac_len);
>         txtscmpl =3D &ri->txtscmpl;
>         drop_reason =3D pskb_may_pull_reason(skb, txtscmpl->payload_offse=
t);
>
> This structurally requires payload_offset to be relative to the MAC heade=
r.
> However, for BPF programs attached via legacy TC (cls_bpf), the MAC heade=
r
> is not pushed prior to ingress execution, meaning skb->len excludes mac_l=
en.
>
> If a MAC-relative offset is provided, it will exceed skb->len for small
> payloads (e.g., empty TCP ACKs where mac_len + offset > total_len - mac_l=
en),
> causing a false -EINVAL rejection.
>
> Conversely, if a BPF program compensates by sending a network-relative of=
fset
> to pass this validation, it will cause skb_do_completion() to pull from t=
he
> MAC header incorrectly, corrupting the packet.
>
> > +             return -EINVAL;
> > +
> > +     delta =3D attrs->payload_offset - attrs->network_offset;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613010039.13=
62312-1-kuniyu@google.com?part=3D4
