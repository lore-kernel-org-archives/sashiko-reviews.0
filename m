Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794503980;
	b=aVqKSr0ZF+fO/pGkqmSLiGi+04wK0cpVhN/RTwbwUXuxpCs7oORnG+gYfIvUSwUpMn62
	 TK2cEkLHNvVPiHodzOk8Yjr5Oy67knafIpLRhDI9tIhhrD6I3nzos/fa906cmWQyP62x6
	 bBSiO1d158Y4ccR/3+g+VlPTDjF7kTd06KRosd+Ip+QCnbmnw+WWNc1S1AQfD+94Opxsh
	 hKuKvhjbB2CbOchdShCSlxjKvsQ16xzD7qlr892Khi7DIRYp8AbKThTwap8xJdEhx/1Fw
	 uxfjs3PjgzITXb0iELOIUFmaidO6k5aRtTcKO7aBzMd7VmpFDKn6bXDfPEVqqGzt+qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=I05mjbbFYjMFnuigmLqaWYMd5Jv9jNx+LJJbCKAKCgw=;
	b=MllAhfk7SYU0YpW03yrdul6Zuq+98OdoiAGpSeeQIe03qT3ZjglQD25wMjYRp17MmC5Q
	 Nw1IWG592INEPybwTRyW4dMNkra1N/+UJ4GihPzOCSYSfREDwCh8XoqDaW9DpHfjXNdfG
	 LK8mH7SqvNU1VZ4bZdraofav/U+ajajaK6disv7GxiteO59z3W39fZhK2d9XJA0ExcOO1
	 lkAXEGxaTMi4XcU30bty7qzToC1QjQGzI10O8iHb4W0v0IYu5bW7bFMsKoJbyj47iBj1v
	 62PqF5sTr1eRm/0H1fyqUbBhXftIzjyXlo5Q67A4Vy3GTevznwl78Nnjxn3QrKxfaqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Oh8T0RUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75500606A33E
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 17:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75500606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Oh8T0RUC
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a9f9473029so21100b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794503978; cv=none;
        d=google.com; s=arc-20260327;
        b=omMhyBptmGwgpzKWYb05Y+MKWLjguuIAWLdlhR1dwGBiMIBEnDGaRVmT07MjLe84nY
         q9/Jn9aqCb4ClOz79rnmBy05IhEu38aCV4LogJdIuBlX22IOhS4CqJtbnqEasZpLuE83
         svNgscQBIFK8liRYf+SPx2E7HtKQNPxIWNTO9/S0na11AtJdv2UZY1yiieCXWtG8FyCd
         NAfQfdDV8wMGUMcYiBA30fccTrL+t5TULJNXH1b5rdQ2OEvwjejOViMufgfpRIlMkd+s
         VQ6yZ/F4g31oboyNrwaGSdf3p32HzGjUi4dff2PJV9wCpFyH2ZvUKQonz0zA3IFd6NHX
         ZvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I05mjbbFYjMFnuigmLqaWYMd5Jv9jNx+LJJbCKAKCgw=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=KIFo/xHpk8G4xNvd89Ql8p0X+x/G1+9Pxf90GDGC5mX7IOA4Xc8bEJIRn3VjC6kKe1
         g5FHpZ1e++4oc78wUlJcJ7HX2wQHg6eJUapWmJkZ/BFFhq8ThsYU0ZUY0OwCYXV5BEjg
         H8c5MIZsl8u5ViBO9I0IiFLHtUAeEt1SUDWg/kWBwaq6D3TpqmcuZtCkMXp33ybPlQPF
         w+1zXpynGpk90E7mB4nxyyC8eRXxA9SHt/gT+PQCvKZHk/fLuj88pSjkB6ugIff48ReY
         3E5zggx8i4/4Jixsn0WW2ur7gbtyQktoMIpE35Foia0RSj7kt1mbbkHCAXaqP+W1y5UA
         +7Yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794503978; x=1795108778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I05mjbbFYjMFnuigmLqaWYMd5Jv9jNx+LJJbCKAKCgw=;
        b=Oh8T0RUCwWN6hKZfQV/a2eefB5cOV5vlHWMXUjowgk6Ejfr3nDVe4FY8u9eTCz7K3h
         IQadJr3UyqnKsjjMuhoHhq03vWDkO5MB5mi1cV76u5JjeXrmQAfLqsVzz6tMJsbp+sSc
         aBx8O4So3D88pVUIN1Z9Ob+cLU9zh+YpYCE2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503978; x=1795108778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I05mjbbFYjMFnuigmLqaWYMd5Jv9jNx+LJJbCKAKCgw=;
        b=jrd9nWt+ekjM8J7mngkuOjaBPZ3rDH0O7xU1pUJ4lOhpa2wYsUigPgHLtjnK2suCB0
         XKLFOhCgeHniM1+xBlFM4GBi0Ci6AmeE/yidvIvpoQVBWbhG+V3XkCzXSNrtT52qRqgC
         /HSo+B4aNeDUkZbQx1TlAC8zf/D6M/FC6NqoE43ulz9ppmXmf6jbct7UJhN1Oo1LFAeD
         GY5PV8lzZQ/2lzylZwo2dwV/lz+f3sjzPFPP4w041gA/rdgDZQZG5MR3UdURgaTRIh3G
         pYipDb1S6/TT54DCAQ04YV3c0zCEUS1NTT296lhJzqicPoByCk3FWXHLCtAhqq16Z71G
         eMnw==
X-Gm-Message-State: APuU4Z8Uyz4LGyo3L4iUZy+L8Ne8XxLbKWb6Ba9lD7tnmtBVb9sCzMok
	mo4PeoQTyHVBhX6tYFC3xa6Rula1Om2P7YyJRo8daWS7qytZekXFkFN1oXKP7L409//QMSJsX06
	y4cbFxhiOczglzqyKg5F1wjUuNQiHW5OSCZGmFBl0x4v7534e8uiZkQ==
X-Gm-Gg: AYBFou3znjijVtBwA4ZREBdltNuzHDHR1r4s+GwPiAnLK6cbpvziqsEoHNNYoeXyK+5
	7OUwO4TyB4jMWuM0A+H2HU57atbl3qB0LzzCpudHLokewNJ0/bC6TBaPUWKMYheS7tPBrp5Bke+
	L5fTU+XzDHwpvH83cLaUA2O0911aImbQTn3YtMDqQaY7ubif2jbntyhWFQa2DM7zW29blkJAFjX
	8yMBsCoyNZUt10I1FZNtodGVizI+UmOx5wU3J07aOkOzjYcPz5AW3+2Iz8uxgatBjK4Aj7n22RQ
	6+5BzJcp1V1s3dKA8mUY0f1sb8pNL+rRN8Zt9gI7JYUfAgs8eemIciLMru+VRyqfDwXbGFjVeCF
	oHxOm0c8EMvohz8NBU3p7gx8STqdOmx4bqFcexmf8l0D5BWimfYg7ugnASqBKv7Yvoomlf8wHsG
	c/Owv4+tj8C5eGG9Nv5kONJjhzkr/LBvHmutt5
X-Received: by 2002:a05:6a00:228d:b0:887:1bcc:3c25 with SMTP id
 d2e1a72fcca58-8beb7c1fa13mr183814b3a.51.1794503978366; Thu, 12 Nov 2026
 09:19:38 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <QDISC-6HS9.v4.r0.20261111094338@mojatatu.com> <QDISC-6HS9.v4.r0.20261111094338-2@mojatatu.com>
 <sashiko-outbox-211424@kernel.org>
In-Reply-To: <sashiko-outbox-211424@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 12 Nov 2026 12:19:26 -0500
X-Gm-Features: AclHuK9KivP4uvNIJTy9S3jlRsHLU6_tkIOdqUIAFlS5S6MwJ3jvLG5_TAhlPDI
Message-ID: <CAM0EoMnS7YSy61ojBDnpUF6iDVnxk9KAuM3H=eezEYJL+7Xzgw@mail.gmail.com>
Subject: Re: [PATCH net v4 2/3] net: neighbour: reinject a parked skb through
 a headerless output device
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:17=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] net: neighbour: reinjecting skb onto n1->dev misroutes
>   redirected packets
> - [Low] net: neighbour: unresolvable commit SHA 1da177e4c3f4 in Fixes
>   trailer

What do they smoke in AI land for extra hallucinations? It could help
humans too.

------
$ git log 1da177e4c3f4
commit 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 (tag: v2.6.12-rc2)
Author: Linus Torvalds <torvalds@ppc970.osdl.org>
Date:   Sat Apr 16 15:20:36 2005 -0700

    Linux-2.6.12-rc2

    Initial git repository build. I'm not bothering with the full history,
    even though we have it. We can create a separate "historical" git
    archive of that later if we want to, and in the meantime it's about
    3.2GB when imported into git - space that would just make the early
    git days unnecessarily complicated, when we don't have a lot of good
    infrastructure for it.

    Let it rip!
-----

cheers,
jamal

> --
>
> commit 9cdb52e0469dfe26f25fc1882a3e6467660a9e45
> Author: Jamal Hadi Salim <jhs@mojatatu.com>
>
> > net: neighbour: reinject a parked skb through a headerless output devic=
e
> >
> > The issue:
> > neigh_update_process_arp_queue() drains a neighbour's arp_queue and
> > reinjects every skb through READ_ONCE(n1->output)(n1, skb), where n1 is
> > the top-level neighbour re-looked-up from the skb's dst, not the neighb=
our
> > the skb was queued on. skb->dev is whatever the producer left there.
> > Note: skb->dev and n1->dev are not guaranteed to be equal.
> >
> > When n1->dev has no header_ops, arp_constructor() and ndisc_constructor=
()
> > install neigh_direct_output(), a plain dev_queue_xmit() that transmits =
on
> > skb->dev and builds no link header. Such an output sends the skb out
> > whatever device skb->dev names, not out n1->dev, so a producer that
> > parked the skb naming a lower device has it leave without the link head=
er
> > its own transmit path builds.
> >
> > sch_teql is the producer that hits this: it parks the skb on the slave'=
s
> > neighbour while the top-level neighbour is the master's, so skb->dev an=
d
> > n1->dev differ and the reinjection has to come back through the master =
to
> > leave with a header. It names the slave on purpose, so that a parked sk=
b
> > does not outlive the master it came from.
> >
> > This half was split out of the sch_teql fix on review, so that the
> > neighbour restore carries its own commit log and its own Cc set.
> >
> > The Fix:
> > Put skb->dev back to n1->dev before the output call when that device
> > builds no link header, so a headerless output transmits on the device t=
he
> > neighbour belongs to, whatever the producer left in skb->dev.
> >
> > A forward that steers the skb to another device, nft fwd ... neigh or
> > bpf_redirect_neigh() with explicit nexthop parameters, parks it with th=
e
> > dst of the original route still attached. When the original route is
> > itself a headerless device this gate matches there and the skb goes bac=
k
> > out the original device, running its egress hook a second time. Those
> > forwards supply their own device and nexthop and do not consult the
> > retained dst, so dropping it at those two sites is where that is fixed;
> > that is a separate change to the producers.
> >
> > Conditions to recreate the bug:
> > CONFIG_NET_SCH_TEQL=3Dm and CONFIG_VETH=3Dy, run as root. This is the
> > neighbour half of the sch_teql parked-skb fix, reached once sch_teql pa=
rks
> > the skb naming the slave: create a veth pair, make one end a teql slave=
,
> > give the master an address and a route, flush the slave's neighbour ent=
ry
> > and send one packet:
> >
> >   ip link add v0 type veth peer name v0p
> >   ip link set v0 up;  ip link set v0p up
> >   tc qdisc add dev v0 root teql0
> >   ip link set teql0 up
> >   ip addr add 10.0.0.1/24 dev teql0
> >   ip route add 10.0.0.99/32 dev teql0
> >   ip neigh flush dev v0
> >   ping -I teql0 -c 1 10.0.0.99
> >
> > The packet parks on v0's arp_queue. When the solicitation resolves,
> > neigh_update_process_arp_queue() reinjects it; without this change it
> > leaves v0 directly, with no link header, and never reaches the peer.
> >
> > The window that frees the master, and the unload recipe that shows it,
> > are in the sch_teql patch.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org=
/
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
>
> [Severity: Low]
> The commit sha 1da177e4c3f4 ("Linux-2.6.12-rc2") in the Fixes: tag cannot=
 be
> resolved in the repository.
>
> > diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> > index d6e9c7c59a892..1b556fa17c57c 100644
> > --- a/net/core/neighbour.c
> > +++ b/net/core/neighbour.c
> > @@ -1339,6 +1339,9 @@ static void neigh_update_process_arp_queue(struct=
 neighbour *neigh)
> >                       if (n2)
> >                               n1 =3D n2;
> >               }
> > +             /* headerless output transmits on skb->dev, not n1->dev *=
/
> > +             if (!n1->dev->header_ops)
> > +                     skb->dev =3D n1->dev;
> >               READ_ONCE(n1->output)(n1, skb);
> >               if (n2)
> >                       neigh_release(n2);
>
> [Severity: Medium]
> Does resetting skb->dev to n1->dev here misroute packets redirected by
> nft_fwd_neigh_eval() or __bpf_redirect_neigh_v4() / __bpf_redirect_neigh_=
v6()
> when the original route points to a headerless device?
>
> As noted in the commit message, those helpers steer the skb to a target
> device and explicit nexthop while leaving the original skb_dst(skb)
> attached, and neither net/netfilter/nft_fwd_netdev.c nor net/core/filter.=
c
> drops that dst in the tree at this commit:
>
> net/netfilter/nft_fwd_netdev.c:nft_fwd_neigh_eval() {
>         ...
>         skb->dev =3D dev;
>         skb_clear_tstamp(skb);
>
>         nf_dev_xmit_recursion_inc();
>         neigh_xmit(neigh_table, dev, addr, skb);
> }
>
> When the target neighbour is incomplete and the original route's dst->dev
> has no header_ops, neigh_update_process_arp_queue() looks up n1 from the
> retained dst, overwrites skb->dev with n1->dev, and calls n1->output()
> (neigh_direct_output() -> dev_queue_xmit()) on the original headerless
> device instead of the redirected device.  If nft_fwd_neigh_eval() ran on
> n1->dev's egress hook, this runs the egress hook a second time and
> decrements TTL or hop_limit again; otherwise the redirect is lost and the
> packet is transmitted out n1->dev.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/QDISC-6HS9.v4.r0.=
20261111094338@mojatatu.com?part=3D2
