Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597223;
	b=BDdsacd8O223psgbwRHjVDMqwu2BF3yMku42FBg449Lk7jI7fzjzUKMLm3ubytIG9CvM
	 ALb8tikZYaFRozelziG/ZOhXoKStya8jYhl/nndOeeV22jM/5Ajg/tuGKtmD34GHtkgVk
	 2rEWtj+SWey2dYrHj19DmV+ZVv4/VY5D2iLxWLgupwR1WK8eNiXB6Tr2xAjDQFjlnwxGU
	 7Gei0bI5gNNkoCC8p6sSvweTLVKxdWKpfHqGmdFXTeLRqRxMgnsXEL3NgTrIuHZLWdDnd
	 sDWbfGjad3iKptEhbgLw7R6C1Pabrc8IFcQ2m0FEMfhMCEpkqOgJ9fJ2XrFk85J89hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597223;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mlKa/S1T+ePpqDxgAQsOW+J9fnHtOhXIZrJe3UiE9do=;
	b=yup6LuiUIXvx8QLv+n79Gp3gqJ/4srHzt5hUWTSkHejtR5OxcyxNNDFtfAZLm+8mny9j
	 xPBASqaLiJN1JnHNfIerATc24sZtm+1uFVj8B6m6+V+mqEwZs+XZe4FiVQ419hogl0Z9X
	 COcw4m0/j18Cse6hOqKd65gnLcbZqpCJSD2y2sGKJG/geeN80+kE57+tIgCvQap3i9bHA
	 UNPEpUanOcBWS/1Rl1l0iVoUAJ0gtGhmb3trxh3xRSBRZBbip2tEXg0WHg5jTBqWm5lXv
	 RpKvTr6tgZ4V3cSNvIUUEyuxrMZH0w0/NH7UyB0FQCtihxxeMbaPnsky/EbqbmfeVaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="1yZg01/z";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3qawMNU4;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEBE606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 19:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEBE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1yZg01/z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3qawMNU4
Message-ID: <6b3f1f7d358ab1ca20646ae0383d1408472e0293.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794597220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlKa/S1T+ePpqDxgAQsOW+J9fnHtOhXIZrJe3UiE9do=;
	b=1yZg01/zZYZNSdV5LoOUd6MBE+ySsNItD+FbnZKHNJa3rjGwkxtx153EDYsqNOAti1dPkA
	b9+WVZtn/s2XxpPem085Yno5EJqU6xJt/0Lxejpvm3+Zznpz1rV6eiY8qJ3xXeObIPTEz1
	YgbVEyStrtlnQa6EeEaJ8qSo4wkfMekav0z1CuBVV3H77Z+42x0byb0zbsgdgkwlfPM745
	sz2ty9P7RixklCzveZ5iBlMF+Iw6VYb/QbIbS0alhUU5K16ZYyO0M2k4jIWfJG6kGbWjhS
	aySJQYoN3X2z56usspICH5AAmgUdfy/+drPXm81oWtuBCrC6YWG1tD62QrEQHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794597220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlKa/S1T+ePpqDxgAQsOW+J9fnHtOhXIZrJe3UiE9do=;
	b=3qawMNU4HZhOG3+Dle4iGtSrBEdWt+/sLHu8bfRcoeSC464OFMTOJ5CdxEmFRBjl4Cg5Np
	HjZOQf1WiNU1iMAg==
Subject: Re: [PATCH net-next v4 8/8] net: dsa: soce: Add VLAN membership
 table support
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Date: Fri, 13 Nov 2026 20:13:40 +0100
In-Reply-To: <sashiko-outbox-201564@kernel.org>
References: 
	<20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
	 <20261105-devel-vstrassheim-soce-dsa-ml-v4-8-02f3cde2afa1@linutronix.de>
	 <sashiko-outbox-201564@kernel.org>
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
> - [High] net: dsa: soce: broken VID 1 untagging in
>   swip_vlan_write_entry()
> --
>=20
> commit 25c6cf2ff3f136587d102371c25a636e1af52a26
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> net: dsa: soce: Add VLAN membership table support
>=20
> This commit adds VLAN membership table programming for SoC-e switch cores
> that implement the Port VLAN synthesis option, initializing VLAN-capable
> cores with PVID 1 and updating per-VID hardware membership and untagging
> masks on VLAN add and delete operations.
>=20
> > diff --git a/drivers/net/dsa/soce-swip.c b/drivers/net/dsa/soce-swip.c
> > index 70fc2da91dd25..7cc3f4abc691d 100644
> > --- a/drivers/net/dsa/soce-swip.c
> > +++ b/drivers/net/dsa/soce-swip.c
> [ ... ]
> > @@ -179,6 +212,185 @@ static void swip_stp_disable(struct swip_dsa_loca=
l *local)
> [ ... ]
> > +static void swip_vlan_config_port(struct swip_priv *priv, int port)
> > +{
> > +	struct swip_dsa_local *local =3D &priv->local;
> > +	void __iomem *base =3D local->vlan;
> > +	u32 regval;
> > +
> > +	swip_vlan_select_port(local, port);
> > +	writel(SWIP_VLAN_PORT_MODE_HYBRID, base + SWIP_VLAN_PORT_MODE_OFFSET)=
;
> > +	writel(SWIP_VLAN_PORT_TYPE_UNAWARE, base + SWIP_VLAN_PORT_TYPE_OFFSET=
);
> > +	writel(FIELD_PREP(SWIP_VLAN_PORT_VLAN_PVID_MASK,
> > +			  SWIP_STANDALONE_PVID),
> > +	       base + SWIP_VLAN_PORT_VLAN_OFFSET);
> > +	writel(0, base + SWIP_VLAN_PORT_INGR_FILTER_OFFSET);
> > +	writel(SWIP_VLAN_PORT_INGR_ACCEPT_ALL,
> > +	       base + SWIP_VLAN_PORT_INGR_ACCEPT_OFFSET);
> > +
> > +	regval =3D readl(base + SWIP_VLAN_PORT_EGR_TAG_OFFSET);
> > +	regval &=3D ~SWIP_VLAN_PORT_EGR_TAG_MASK;
> > +	regval |=3D FIELD_PREP(SWIP_VLAN_PORT_EGR_TAG_MASK,
> > +			     SWIP_VLAN_PORT_EGR_TAG_UNTAG_PORT);
> > +	writel(regval, base + SWIP_VLAN_PORT_EGR_TAG_OFFSET);
> > +}
> > +
> > +static int swip_vlan_write_entry(struct swip_priv *priv, u16 vid)
> > +{
> > +	struct swip_dsa_local *local =3D &priv->local;
> > +	void __iomem *base =3D local->vlan;
> > +	struct dsa_port *dp;
> > +	u32 standalone =3D 0;
> > +	u32 cpu_ports;
> > +	u32 untagged;
> > +	u32 members;
> > +	int ret;
> > +
> > +	cpu_ports =3D dsa_cpu_ports(&priv->ds);
> > +	/* Bridge VLAN deletion must not remove standalone membership. */
> > +	if (vid =3D=3D SWIP_STANDALONE_PVID) {
> > +		dsa_switch_for_each_user_port(dp, &priv->ds) {
> > +			if (!dsa_port_bridge_dev_get(dp))
> > +				standalone |=3D BIT(dp->index);
> > +		}
> > +	}
> > +	members =3D priv->vlan_members[vid] | standalone;
> > +	/* CPU membership preserves VLAN delivery to the conduit. */
> > +	if (members)
> > +		members |=3D cpu_ports;
> > +	/* Explicit VLAN configuration takes precedence over default untaggin=
g. */
> > +	untagged =3D standalone & ~priv->vlan_members[vid] & ~cpu_ports;
>=20
> [Severity: High]
> Does this clear hardware VID 1 untagging whenever a port joins a software
> bridge (or adds a VID 1 VLAN upper), causing all untagged frames transmit=
ted
> out of that port to egress tagged with VID 1 on the wire?
>=20
> In swip_vlan_config_port(), every port including the CPU port is configur=
ed
> with SWIP_VLAN_PORT_TYPE_UNAWARE, PVID =3D SWIP_STANDALONE_PVID (1), and
> SWIP_VLAN_PORT_EGR_TAG_UNTAG_PORT. When the CPU transmits an untagged fra=
me
> via sdsa_xmit(), SDSA_TAG_VLAN_BIT is not set, so the switch classifies t=
he
> frame into the CPU port's PVID (VID 1) and strips the tag on egress from =
a
> user port only if BIT(port) is set in SWIP_VLAN_UNTAG_PORTS_OFFSET for VI=
D 1.
>=20
> Because swip_switch_ops does not implement .port_bridge_join, joining a
> Linux bridge takes the software fallback path:
>=20
>   dsa_user_changeupper()
>     -> dsa_port_bridge_join()
>       -> dsa_switch_bridge_join() -> returns -EOPNOTSUPP
>       -> dsa_port_bridge_destroy() -> sets dp->bridge =3D NULL
>=20
> As a result, dp->bridge is always NULL and dsa_port_bridge_dev_get(dp) in
> swip_vlan_write_entry() is always NULL for every port.
>=20
> When br_add_if() -> nbp_vlan_init() -> nbp_vlan_add() adds the bridge's
> default_pvid (VID 1, untagged), __vlan_vid_add() sees that the port is no=
t
> switchdev-offloaded and falls back to vlan_vid_add(dev, br->vlan_proto, 1=
).
> Because swip_probe() sets ds->needs_standalone_vlan_filtering =3D
> priv->features.port_vlan, the user port has NETIF_F_HW_VLAN_CTAG_FILTER s=
et,
> so vlan_vid_add() calls:
>=20
>   dsa_user_vlan_rx_add_vid()
>     -> dsa_port_vlan_add()
>       -> swip_port_vlan_add()
>=20
> with vid =3D 1 and flags =3D 0 (since ndo_vlan_rx_add_vid does not carry
> BRIDGE_VLAN_INFO_UNTAGGED).
>=20
> swip_port_vlan_add() sets BIT(port) in priv->vlan_members[1], and
> swip_vlan_write_entry() then computes:
>=20
>   untagged =3D standalone & ~priv->vlan_members[vid] & ~cpu_ports;
>=20
> which clears BIT(port) in SWIP_VLAN_UNTAG_PORTS_OFFSET for VID 1. Once th=
at
> bit is cleared, untagged frames sent on the bridge or port are classified
> into VID 1 at the CPU port and egress the user port with an 802.1Q VID 1 =
tag
> instead of untagged.
>=20
> Conversely, because dsa_port_bridge_dev_get(dp) is always NULL, deleting
> VID 1 from the bridged port (for example via bridge vlan del dev swp0 vid=
 1)
> clears BIT(port) in priv->vlan_members[1], which leaves BIT(port) set in
> standalone and restores the port to both SWIP_VLAN_MEMBER_PORTS_OFFSET an=
d
> SWIP_VLAN_UNTAG_PORTS_OFFSET for VID 1.

No, I could not reproduce the unexpected VID 1 tagging with a VLAN 1
upper or a software bridge. But looking again at the documentation, I
see that the "Custom Untag" register programming is not needed in the
current mode. It works because the ports use "Untag Port VLAN", so the
Custom Untag table is not used. I will remove the unnecessary register
programming in the next version and add more comments as documentation.

>=20
> Also, because dp->bridge is always NULL and
> ds->needs_standalone_vlan_filtering is false when !priv->features.port_vl=
an,
> can swip_port_vlan_add() or swip_port_vlan_del() ever be reached when
> priv->features.port_vlan is false?
>=20

Regarding VLAN callbacks: yes, in the current configuration they will
not be reached through the normal VLAN/bridge paths if
features.port_vlan is false. I would prefer to keep the checks since the
callbacks are available in the ops structure, even if the VLAN resources
are not initialized without that feature.

