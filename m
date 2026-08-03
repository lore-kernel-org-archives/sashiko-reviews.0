Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049936923B
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775924; cv=none; b=IMju5RD+I649CxUUJYinMV1VUFYu/ERbQcWqqeoU+2Rh2L+h+AhVk90ip6kFiwaIskWpVZSiGWepAikBrwq/L0kauQV1oPOVryrU8kGYcdp8MwZ1Kpk33KAfmbY8kwOcitBejVU7ojeUGI6J6Obs80pcdock+G4mWxQG+rvyylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775924; c=relaxed/simple;
	bh=t8GrFVEmP2+TMFS1kIwMJqGnk6LwSp2JqfgYsUYnFAo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SrIxzqGpfrroTsZfU3Q2WRp38tNcO97c6yhhzOlujBskEFcrRXZ6PeMJrC61McUIfkUSCyxn1YvNFOwXJFN5OwWFPpjYWKJ0vlDFbsIxMFd5a/VF5DHMF095WzZiFR9E8R5iJ29S+Fg8x/i1zU+px5foscYPfTZlJFiw+m7/6AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Bl4txuOs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pnrUzDkp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Bl4txuOs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pnrUzDkp"
Message-ID: <95963572ab3aedd2322d76107b70e67cf32db808.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785775921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udeRltbpOSwt06zJe4HtN9yW6onEmLdVDb9SWFSlNro=;
	b=Bl4txuOsr1iSFn+1p/OE92BUVgXZE0OOpudYTuMRLB19P1t/ofih4PDbmOLsGsylSIC+Dx
	M4aFUEtLCLjN+Qqpp0R43o0QSRh99VIKF1JaIrHZD57dPD39mMq83li5Ho07rpMNMWPNnu
	VkL+lK7ezsUSvbUy1jB6dpi6+F7h57KET8I+QYsbISAlVO14ZOEmNR//DkXWGFrQQhbJyM
	rKI60T1NXeysU5OwTYV3QWdiJ5tn4HtfM2MGiPeW4QhuzfVK/c2UyGlggFbNj++DyS03EJ
	CAFI317kYs1TfX8zEsT+bz2/FEGSod9I5Nn6r7uzpkoFrpK5eQ76M5lV27l7Kw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785775921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udeRltbpOSwt06zJe4HtN9yW6onEmLdVDb9SWFSlNro=;
	b=pnrUzDkpH6To88+D4aq3cVAMNz8LT4MM2PpEIiQ3zSsOxrvuoJcNR1/z1o3YQHevp7nuSj
	mMeOm6EDWZdlIkDw==
Subject: Re: [PATCH 3/4] net: dsa: Add support for SoC-e SDSA tags
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Date: Mon, 03 Aug 2026 18:52:00 +0200
In-Reply-To: <20260730163759.15CD21F000E9@smtp.kernel.org>
References: 
	<20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de>
	 <20260729-devel-vstrassheim-soce-dsa-ml-v1-3-be569dae1b20@linutronix.de>
	 <20260730163759.15CD21F000E9@smtp.kernel.org>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-07-30 at 16:37 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The `sdsa_xmit` and `sdsa_rcv` functions leak the SKB on all err=
or paths by returning `NULL` without freeing the buffer, leading to memory =
exhaustion.
> --
>=20
> --- Patch [3]: [PATCH 3/4] net: dsa: Add support for SoC-e SDSA tags ---
> commit d07af353633eb9eecc24042cfdf75f9ecf082368
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> net: dsa: Add support for SoC-e SDSA tags
>=20
> Adds a DSA tagger for the SoC-e SDSA header format used between
> the conduit and SoC-e switch ports.
>=20
> > diff --git a/net/dsa/tag_sdsa.c b/net/dsa/tag_sdsa.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/net/dsa/tag_sdsa.c
>=20
> [ ... ]
>=20
> > +static struct sk_buff *sdsa_xmit(struct sk_buff *skb, struct net_devic=
e *dev)
> > +{
> > +	struct dsa_port *dp =3D dsa_user_to_port(dev);
> > +	u8 *sdsa_header;
> > +
> > +	if (skb_cow_head(skb, SDSA_HLEN) < 0)
> > +		return NULL;
>=20
> [Severity: High]
> Does this leak the skb when skb_cow_head() fails? The DSA core expects th=
e
> tagger to consume and free the skb if it returns NULL on transmission. Sh=
ould
> this call kfree_skb() before returning?
>=20

Yes, I will fix all this findings.

> [ ... ]
>=20
> > +static struct sk_buff *sdsa_rcv(struct sk_buff *skb, struct net_device=
 *dev)
> > +{
> > +	u8 *sdsa_header;
> > +	int source_port;
> > +	u8 frame_type;
> > +
> > +	if (unlikely(!pskb_may_pull(skb, SDSA_HLEN)))
> > +		return NULL;
>=20
> [Severity: High]
> Does this error path leak the skb? If a malformed packet causes
> pskb_may_pull() to fail, returning NULL without freeing the buffer could
> allow network traffic to cause memory exhaustion.
>=20

Yes, I will fix all this findings.

> > +
> > +	sdsa_header =3D dsa_etype_header_pos_rx(skb);
> > +
> > +	/* Check that the frame type is TO_CPU. */
> > +	frame_type =3D FIELD_GET(SDSA_TAG_FRAME_TYPE_MASK, sdsa_header[4]);
> > +	if (frame_type !=3D 0)
> > +		return NULL;
>=20
> [Severity: High]
> Should the skb be freed here when the frame type check fails to avoid a
> memory leak?
>=20

Yes, I will fix all this findings.

> > +
> > +	/* VLAN-tagged traffic is intentionally unsupported yet. */
> > +	if (sdsa_header[4] & SDSA_TAG_VLAN_BIT)
> > +		return NULL;
>=20
> [Severity: High]
> Could unsupported VLAN-tagged traffic trigger a memory leak here?
>=20

Yes, I will fix all this findings.

> > +
> > +	/* Determine the source port from the two port fields. */
> > +	source_port =3D ((sdsa_header[4] & 0x1f) << 5) |
> > +		      ((sdsa_header[5] & 0xf8) >> 3);
> > +
> > +	skb->dev =3D dsa_conduit_find_user(dev, 0, source_port);
> > +	if (!skb->dev)
> > +		return NULL;
>=20
> [Severity: High]
> Does this also leak the skb if the conduit cannot find a corresponding us=
er
> device?

Yes, I will fix all this findings.


