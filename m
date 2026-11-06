Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955052;
	b=jFM/u18IWCpkXvxWJIMt4n7bcGJTWnIZG2qoe7Bz6nw3x+h4q1njuLrMSyTj3KYZfyyM
	 Eendx2xEq2heEGesirxYxfunEwn+yt/CawLzC4JztCtC1FA9GySFVxsffkrkNIeg3a2s/
	 zJjaLQYG3e1/BWlamYarkFfPpwXYQjBdxK6gcmLDyFqO3cEhSIlIDxC0QAOJ7gvNXg+XS
	 5C+m9JSol7Ql6MyoFtGL5ahAjctdqxurieGsv7iVrsEaUFFhORIAr4192D2+JTNUjZlnJ
	 QhI2KjVqyKdvwUqPUi4E/i1uxTr2ZY4ph2ikFvGMY/NYZdhqLgXl/+wLSOpty1dDqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955052;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KF7tN6bGNSx68WV46A4jEtwjapr8WcL1zpKrGOQrGqs=;
	b=JGpeRisBrEV5o2SRdPVXclBwto5Qvu3KGS7mL4MauW68FzBBdfYkS/JCz0owzJVnsFxx
	 LZyNh15jgSE8EDeGJ1F36zXQL9SnV+P//Eau/A4erQCHxe+ohe6s2rbBeYEBim/MJt14P
	 rx/4/WpiYkYRVYkbJAQz+lJqbx09hegpEExly6BqKnDEDmRlwQ6JVTXqFVAhpfUSwET72
	 w7Z3W9YbTr0wezeIHF1pdahf/C3Z/9hnp+YlfOOzaCkS87h/h/47WQ1Ti4oF5eCm1PvEy
	 oxXz6n+PM3WmddT1kVWtl832IIncKLLp7zpYYyEaUqLuxK/IPBgpGnDGAkRCDm3xFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaraFvp3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F27606A32D
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaraFvp3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B7C1F008A1
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955051;
	bh=KF7tN6bGNSx68WV46A4jEtwjapr8WcL1zpKrGOQrGqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BaraFvp3UhGlbZQ6kYB/Kvc7ul5jccSTGbfxvXH7G/9eixtpX01cmd1PDM4aBXcod
	 oYtPCCK0Gh9Mgxvm3JK++HGzmk/gmNWpTFqI2TxHl+SLuyqIbhGr4uME1MFsRcUxth
	 Y4U3heQEEU8vbqY71Ee+NJESP8s3zkJ/2LFkoQHMQz8lInHsa3SIeDnJDM2pYjPBHM
	 Bs898x52MWB+2y5PMYEqWMuBcedf8KgLTo+uWxWK/9grceW6eYvCJsjsu67uOD48bi
	 jkHshg53xXFAFDrUbP+5bYrkBeA4ORPP2InLCDKcQSX5MPuTqbLYjCeIjNEeMSwuUJ
	 aly+t98Mj6bAg==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-714d57774d8so257687eaf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 06 Nov 2026 00:50:51 -0800 (PST)
X-Gm-Message-State: APuU4Z9ydIOd8qXZIkwdgj/pC0MFJEfo72tXpi/jkR3K1e97uhck0fA0
	cx1jtK9Hs3zKrfxRyCqQ5xcYRVA0mAOt3C1npf4vZCYgOfxcbWZHofe+FCZ6c+CHsDE9osgOrCd
	zDligHSlErkcraXNbFfIYr+D3RzxMm9U=
X-Received: by 2002:a05:6820:4404:b0:716:ab5f:f298 with SMTP id
 006d021491bc7-716e79454bcmr1109475eaf.61.1793955045918; Fri, 06 Nov 2026
 00:50:45 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105115715.1466924-1-edumazet@kernel.org> <20261105115715.1466924-3-edumazet@kernel.org>
 <sashiko-outbox-201039@kernel.org>
In-Reply-To: <sashiko-outbox-201039@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Fri, 6 Nov 2026 09:50:33 +0100
X-Gmail-Original-Message-ID: <CAL4WiipcbLN5_Zb8qXsnTyZfhGy0q1PsQ_Bwuxt3WMzzh4XK+w@mail.gmail.com>
X-Gm-Features: AclHuK9Ryygevumzz_dij8K9yE2RDrJc4GxFgKqXtujhvUjc_MGUdhYmJG3opRw
Message-ID: <CAL4WiipcbLN5_Zb8qXsnTyZfhGy0q1PsQ_Bwuxt3WMzzh4XK+w@mail.gmail.com>
Subject: Re: [PATCH net v3 2/8] net: virtio: do not use dev->type to find the
 outer L3 header
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, 
	Eugenio Perez <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 6 nov. 2026 =C3=A0 09:16, <sashiko-bot@kernel.org> a =C3=A9crit :
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: virtio: outer_l3min includes ETH_HLEN in
>   virtio_net_hdr_tnl_to_skb()
> --
>
> commit b246747b62fc4e9502b5e1a6192ecf203f97d1f4
> Author: Eric Dumazet <edumazet@kernel.org>
>
> net: virtio: do not use dev->type to find the outer L3 header
>
> This commit adds a has_eth parameter to virtio_net_hdr_tnl_to_skb() and
> virtio_net_l3_start() so callers specify whether the frame begins with an
> Ethernet header instead of relying on skb->dev->type.
>
> Link: https://lore.kernel.org/netdev/179387332014.488856.9111956413610107=
951@kernel.org/
>
> > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > index 357116c2a1489..b7b6b542f4763 100644
> > --- a/include/linux/virtio_net.h
> > +++ b/include/linux/virtio_net.h
>
> [ ... ]
>
> > @@ -452,6 +450,7 @@ virtio_net_tnl_offsets_ok(struct sk_buff *skb, bool=
 outer_isv6,
> >  static inline int
> >  virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >                         const struct virtio_net_hdr_v1_hash_tunnel *vhd=
r,
> > +                       bool has_eth,
> >                         bool tnl_hdr_negotiated,
> >                         bool tnl_csum_negotiated,
> >                         bool little_endian)
> > @@ -505,7 +504,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >       if (ret)
> >               return ret;
> >
> > -     if (!virtio_net_tnl_offsets_ok(skb, outer_isv6, outer_th))
> > +     if (!virtio_net_tnl_offsets_ok(skb, has_eth, outer_isv6, outer_th=
))
> >               return -EINVAL;
>
> [Severity: Medium]
> When tun_get_user() processes an IFF_TUN device, it resets the network he=
ader
> offset to 0 and calls tun_vnet_hdr_tnl_to_skb() -> virtio_net_hdr_tnl_to_=
skb()
> with has_eth set to false.
>
> However, earlier in virtio_net_hdr_tnl_to_skb(), outer_l3min still
> unconditionally includes ETH_HLEN:
>
>         outer_l3min =3D ETH_HLEN + virtio_l3min(outer_isv6);
>
>         inner_th =3D __virtio16_to_cpu(little_endian, hdr->csum_start);
>         inner_nh =3D le16_to_cpu(vhdr->inner_nh_offset);
>         outer_th =3D le16_to_cpu(vhdr->outer_th_offset);
>         if (outer_th < outer_l3min ||
>             inner_nh < outer_th + sizeof(struct udphdr) ||
>             inner_th < inner_nh + inner_l3min)
>                 return -EINVAL;
>
> For an IFF_TUN packet without outer IPv4 options or IPv6 extension header=
s,
> virtio_net_tnl_offsets_ok() -> virtio_net_l3_start() sets nhoff to 0, and
> virtio_net_l4_start() computes thoff as 20 (IPv4) or 40 (IPv6), requiring
> outer_th =3D=3D thoff. Because outer_th < outer_l3min rejects outer_th < =
34 for
> IPv4 or outer_th < 54 for IPv6, won't valid UDP-tunneled GSO packets on
> IFF_TUN devices be rejected with -EINVAL unless outer_l3min only adds
> ETH_HLEN when has_eth is true?
>

Yes, but this predates the series: since UDP tunnel GSO support was
added to tun, IFF_TUN frames are only accepted when the outer IP
header is long enough to cover the missing Ethernet header. Willem
pointed this out on v2.

This only rejects packets, it does not crash anything, and changing
it would enable a feature that never worked on IFF_TUN. I will send
that separately to net-next, now that has_eth makes it simple.
