Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332968;
	b=n3W/M27W/yk1ftav9mJntrkHAN7JIv2Ge7WTSb8HOZ4BjwhQ90DoRzEXAynFM7UAJHIZ
	 FdC1soGvBsXuqACZsdP6YF6Q1QLf1d6Cf8lTBtT09RYpLd+Su3KV3qVbVR0a5C4PVO7vA
	 T3e/9WMs3JjlmCuXMhnDDEi49wPTVycF4C3fgY5eF1HZ7twtD7EM0p/UKcUlV1n64w20s
	 RC+dYOMZMzjBM0pJM9DZi16CdlQLtJfzhUSv3kkULoEYZ8Bc0rRmzgYBqg+eh5nl//gX9
	 HqP2j6JuZlOsL9OFRa48ayPXk+3AtqizUeVDPN3k0mMwxFphJlqBL4Ob6sE0yFtvygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332968;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZBtYwIztatKAIg9rOVcpTo1UVvFd4ZVcnLUIkP9ibuU=;
	b=QDh7IOB62mMFzQt2R/mnPH6otOWl2nVxhyx6LzudpmeqSRiWnORkOZ1UQIlP52OkMjtA
	 cp0ZjsIdo4EB17Mw+FGIYEYlQWJ6TfMyTf2QOC03BqrjrqyB3e02/hXAfWa3qGzC8fCyI
	 xwV8ROnGt4f9qVeSOCafIYrEikog53QJZMP5Ni1HUVOxznj9NwtLWts6J8a8x5okWGEle
	 hdIAU+V3RRfdaK1n+Z87E2HkCTL1mpocu+/XM0REi4PYVWwgWuhkhQR7mYszjn0iRDmI0
	 lOVD8z8Z4xG3bx/XofGWl8n3BYbqFl9bcbiYTtXo43zeQaHzGKtgUatLARIMjel44CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4RufZvbG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ztl6GNyw;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D054606A337
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 17:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D054606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4RufZvbG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ztl6GNyw
Message-ID: <34d508d55d6ba60c2e78ffc863670ece319f1ef6.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794332966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBtYwIztatKAIg9rOVcpTo1UVvFd4ZVcnLUIkP9ibuU=;
	b=4RufZvbGqpd2BYbq0rA5ruUzo2IGQxx3bnjdnKiCX6Szqk+qP9LuHP1yxc/QG/mXef3h+8
	FUr28e1WhWVPeyFQY6G4NcG3cn00B6QC+7VtNhy6s2RutD22yOqxiKtsiDgcdWmCzXI3KR
	HSFwKQ52yEezErnhgtOwWA2vdafW3m3ASAooQ+XiYIUrmv6Zs+gIYMLt1Lr63IrHap3lPE
	GC8qR68xzitjB+oqEiGIbfG4XmivmamCpr6XnpwrmDN98kBh5b/DYM/z2yUdGlQte6EzYc
	yEgKHamPvtBbufBjzVcRcneXzzNW1Q7Z/18/HHwo0W1YvzHi6UzMdIMBLFr87A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794332966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBtYwIztatKAIg9rOVcpTo1UVvFd4ZVcnLUIkP9ibuU=;
	b=ztl6GNywPacdeaSyS7E3LimLxzm34rqSX1kktck1Yr27dy92Z366D7/iswrE7HanLYQmkC
	a3Oitvgpl1PRFeCw==
Subject: Re: [PATCH net-next v4 5/8] net: dsa: Add tag handling for SoC-e
 switches
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Date: Tue, 10 Nov 2026 18:49:26 +0100
In-Reply-To: <sashiko-outbox-201561@kernel.org>
References: 
	<20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
	 <20261105-devel-vstrassheim-soce-dsa-ml-v4-5-02f3cde2afa1@linutronix.de>
	 <sashiko-outbox-201561@kernel.org>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 14:17 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] net: dsa: insufficient skb headroom in sdsa_xmit() for
>   non-802.1Q VLAN
> --
>=20
> commit ae5577cfb919384ffe32e9238c7345ef431b5a12
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> net: dsa: Add tag handling for SoC-e switches
>=20
> This commit adds a DSA tag driver for SoC-e switches using an 8-byte
> EtherType 0xdcdc SDSA header. It handles transmit and receive frame
> tagging, including 802.1Q TCI metadata encoding and non-802.1Q VLAN
> header insertion.
>=20
> > diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> > new file mode 100644
> > index 0000000000000..dcfa5de0ac6bd
> > --- /dev/null
> > +++ b/net/dsa/tag_sdsa.c
> > @@ -0,0 +1,168 @@
>=20
> [ ... ]
>=20
> > +static struct sk_buff *sdsa_xmit(struct sk_buff *skb, struct net_devic=
e *dev)
> > +{
> > +	struct dsa_port *dp =3D dsa_user_to_port(dev);
> > +	struct sdsa_tag *tag;
> > +	bool encode_vlan;
> > +	bool tag_present;
> > +	u16 vlan_tci;
> > +
> > +	BUILD_BUG_ON(sizeof(*tag) !=3D SDSA_HLEN);
> > +
> > +	/* SDSA carries no TPID, so only encode 802.1Q C-tags. */
> > +	tag_present =3D skb_vlan_tag_present(skb);
> > +	encode_vlan =3D tag_present && skb->vlan_proto =3D=3D htons(ETH_P_802=
1Q);
> > +	/* Prevent the conduit from inserting a VLAN header ahead of SDSA. */
> > +	if (tag_present && !encode_vlan) {
> > +		skb =3D __vlan_hwaccel_push_inside(skb);
> > +		if (!skb)
> > +			return NULL;
> > +	}
> > +
> > +	skb_push(skb, SDSA_HLEN);
>=20
> [Severity: High]
> Can this skb_push(skb, SDSA_HLEN) underflow skb->head and trigger
> skb_under_panic() when transmitting a packet with a non-802.1Q hardware
> accelerated VLAN tag (for example ETH_P_8021AD)?
>=20
> sdsa_netdev_ops sets needed_headroom to SDSA_HLEN (8 bytes), so
> dsa_user_xmit() -> skb_ensure_writable_head_tail() only guarantees
> SDSA_HLEN + conduit->needed_headroom bytes of headroom before calling
> sdsa_xmit():
>=20
> dsa_user_xmit()
>   skb_ensure_writable_head_tail(skb, dev)
>   sdsa_xmit()
>     __vlan_hwaccel_push_inside()
>       __vlan_insert_inner_tag()
>         skb_cow_head(skb, VLAN_HLEN)
>         skb_push(skb, VLAN_HLEN)
>     skb_push(skb, SDSA_HLEN)
>=20
> When skb enters sdsa_xmit() with 8 to 11 bytes of headroom,
> __vlan_hwaccel_push_inside() sees enough room for VLAN_HLEN (4 bytes)
> without reallocating and consumes 4 bytes via skb_push(skb, VLAN_HLEN),
> leaving only 4 to 7 bytes of headroom before skb_push(skb, SDSA_HLEN)
> pushes another 8 bytes.
>=20
> Should sdsa_xmit() call skb_cow_head() before pushing, or should
> sdsa_netdev_ops reserve SDSA_HLEN + VLAN_HLEN in needed_headroom?
>=20

Yes, that's true. I will add VLAN_HLEN to needed_headroom and check
the edge cases.

