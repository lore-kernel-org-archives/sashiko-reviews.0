Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622821;
	b=e9k/NrgQhB6Clv5aRqVMNxFaDfTQFyhRKVpsGHY/LJtB4SHknKThxTQYG1+YEqOj0lVR
	 2v1eBVY5o7w6HbCybOVoIBIZZ01QKcBm/ONccPfe/xc/EaMh2mNQzca8asKO3ZrvTpeFb
	 tSe4oYUbzB/1G9lmp0ZlVc1om2wwCIlHHD3yxrIUe0lB0HVw/INncAm59+HmeEvL7tYbR
	 K+NLgnL7jNBoi7ojzsI2EtBiQ1on68s4mlV8dGr7RTmAQEDoWHHmuG8uOaHtrOCVMxCf0
	 DIFoFU6C8QZsoBZ0820l5MYFJBniZJQrrbO6d8A6zwUWzzxUNyMKttXmlp25WnBMMvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622821;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Disposition-Notification-To:
	 Organization:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=S3FuZwbrAhjaM6kTBlafii6bM4GnE5BBZTC//slK6X0=;
	b=enQmnZvhFNFUdh3xXzcLvgVIG1Lpq5SnyvuExPFeCUSOdQP3o0nZKrUhjL47W8RVpkMM
	 Z4n/0xkELSNtomeDqX3XVt2OXCS1I2B4y9oSKMamzUrAbSTV0X+avJs+fqlXKPP/iJy0N
	 SWaMybUwAGBeZJvWNDpyU0j/xVk990N2fsPsW5X4VppR/GOnaYguE5N8VRrLp4OvKmbO5
	 dhqeJGBGADtceENHs0rgio6X7ul+u0fnz++Z8xnsFLjqDf996FZzFqhQxUn2iZmD0Tmro
	 Ibh+pQQr9cy/TFYqkriQrB+K9/lyrtF0+keiKmGbuv2GAKN/YFJ/CQhJHH6+BiWptAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ppI+mJfi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kI7IykWa;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B1E606A681;
	Wed, 25 Nov 2026 16:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B1E606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ppI+mJfi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kI7IykWa
Message-ID: <bd31f8cd5121429a3b181ba70ffd53475aec8704.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795622813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3FuZwbrAhjaM6kTBlafii6bM4GnE5BBZTC//slK6X0=;
	b=ppI+mJfiNu64lB4cP9r+efKp90B6RxvjvO1EYM2GYO0XNKA7U4fuZH9+bdhujgZewVnKML
	epcRVSZwW8Cdn7NUW9lcwfaOIssIN+xJOGJ8rq1ZBi2y/311PMwAxaTuJ+oHdIQxNjvjsR
	0MzVEv+feRxWpAlRE4FgEWjj7uVwqmb6WekA2M/8re6hO3HIfrqt6nqANGUc1IjmBbBEjd
	shz24YD5tIt3+1tHW1Y1z+UIa/INyEi0DJ353aP5q8kJh3rExQhFjDgLWYDI3sbBGSsJLA
	clT34JhJxOFBR/bpf9e+L/bActooeqdlNiD9wy57A3vx4+OgZ1HeVg0PDe6/3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795622813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3FuZwbrAhjaM6kTBlafii6bM4GnE5BBZTC//slK6X0=;
	b=kI7IykWaiatQvtUYlHM+qgl3ONjmikyiQQiOdaoshgxC4hg2CF3o731Q9pqk8WCy2oVo7e
	tHgmexuzGmJ3pfDw==
Subject: Re: [PATCH net-next v5 5/9] net: dsa: Add tag handling for SoC-e
 switches
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 17:06:51 +0100
In-Reply-To: <sashiko-outbox-227109@kernel.org>
References: 
	<20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
	 <20261120-devel-vstrassheim-soce-dsa-ml-v5-5-5de9225715e6@linutronix.de>
	 <sashiko-outbox-227109@kernel.org>
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

On Sat, 2026-11-21 at 14:53 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: dsa: broken flow dissection in sdsa due to inflated
>   needed_headroom
> --
>=20
> commit ff03e408d05d4a91db8a81df7f6cead0f9e1dc6f
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> net: dsa: Add tag handling for SoC-e switches
>=20
> This commit adds a DSA tag driver for SoC-e switches using the 8-byte
> EtherType SDSA header.
>=20
> > diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> > new file mode 100644
> > index 0000000000000..c5a9f61edf405
> > --- /dev/null
> > +++ b/net/dsa/tag_sdsa.c
> [ ... ]
> > +static const struct dsa_device_ops sdsa_netdev_ops =3D {
> > +	.name =3D SDSA_NAME,
> > +	.proto =3D DSA_TAG_PROTO_SDSA,
> > +	.xmit =3D sdsa_xmit,
> > +	.rcv =3D sdsa_rcv,
> > +	/* Include room for an accelerated non-802.1Q tag pushed in-band. */
> > +	.needed_headroom =3D SDSA_HLEN + VLAN_HLEN,
> > +};
>=20
> [Severity: Medium]
> Does setting .needed_headroom to SDSA_HLEN + VLAN_HLEN without a
> .flow_dissect callback break flow dissection on the conduit?
>=20
> When ops->flow_dissect is NULL, __skb_flow_dissect() falls back to
> dsa_tag_generic_flow_dissect(), which uses ops->needed_headroom as the RX
> tag length:
>=20
> include/net/dsa.h:dsa_tag_generic_flow_dissect() {
> 	const struct dsa_device_ops *ops =3D skb->dev->dsa_ptr->tag_ops;
> 	int tag_len =3D ops->needed_headroom;
>=20
> 	*offset =3D tag_len;
> 	*proto =3D ((__be16 *)skb->data)[(tag_len / 2) - 1];
> }
>=20
> Because received frames only carry an 8-byte SDSA header (SDSA_HLEN),
> dsa_tag_generic_flow_dissect() reads the encapsulated EtherType 4 bytes
> past its actual offset and advances nhoff by 12 bytes instead of 8.
>=20

Yes, there is a problem. I will fix that with an SDSA-specific
.flow_dissect() callback
