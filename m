Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889238B15E
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775501; cv=none; b=lmIotRwGYtgtZIfsfqBEfXtg35imAa/qwr/VfBEIueGeGXXF848Gb8Mb64BdDM66zCUf0RKPoI09N0C/oXzJu7sAPoMS2GjlB8qj9IKPEsUQCNzsrPn9dAx3mMafI4jdfX+gv10gl4JOuE9WeNfMtHeDWboqxkRlTPwy3JkfiVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775501; c=relaxed/simple;
	bh=yaYd7U63PvaDA6cO7LeE/1mHb8xRDDi/2mnJxnd1u98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=grXSdRjhbFkhS5oFp1p5igc8Fgr96dDSaWmnqCRUiisv/7gzyo5/T14ud4dpc7IJQvq6Eh8p0EUCeWG/aTEDReQavDsqdoO4uTu6yatWGigZ67LvTTsB3FTrMo+3Q5ZfRjG8JA1JjEQ4356WiG4oJespsT6TSc6C/F+6mTQGrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hl7xggAb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nJbe6q2+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hl7xggAb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nJbe6q2+"
Message-ID: <139da0ad01de73c947eb235375af982cd95ab4d4.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785775497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYkAFHj7VrpJHLOiM/4YLytheDbJSWzMveXEyjQO7dg=;
	b=hl7xggAb7RK2MHrEK8gp6x7IArwsO6B7yYM9777cLDFpoJPL2OikteypiyueuqPrDAWHV4
	7QGGv0IMyBNVtCLBso/NVBPFJsvLK9L9bH8X74was9RTMKOrvV2+NY8BldPsq9N5Sq5rtb
	wqnzD9Jx9sMyVQVmuKlY9KcwC/TbhWuGJa+ds87WXO0HN0g6lzZ2eWAr4CnI50YkhwNaoq
	GOfmBGv74ote/fUpLBiigIBJ1/A3t5NzjhZ88IjfdyEXGxDQPv0s687elt9wVwb4FQwVg3
	8HI6VCVyqC3KHWJ+H4DiHTuTriBFzbfnmIYIAMLijRvIwFGVDJY1L0N0WWW3/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785775497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYkAFHj7VrpJHLOiM/4YLytheDbJSWzMveXEyjQO7dg=;
	b=nJbe6q2+ENCbp7mS3YHDZfPAzf03KQCuQjElB4ZdHzhQVH0CWPAx7BcAV0fFFcZi6OTd9R
	WUAbEWZ5Z4f7rtAQ==
Subject: Re: [PATCH 4/4] net: dsa: soce: Add initial driver support for MRS
 switches
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Date: Mon, 03 Aug 2026 18:44:56 +0200
In-Reply-To: <20260730163758.659C91F00A3A@smtp.kernel.org>
References: 
	<20260729-devel-vstrassheim-soce-dsa-ml-v1-0-be569dae1b20@linutronix.de>
	 <20260729-devel-vstrassheim-soce-dsa-ml-v1-4-be569dae1b20@linutronix.de>
	 <20260730163758.659C91F00A3A@smtp.kernel.org>
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
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [High] Incorrect error check for `devm_of_iomap()` leads to potential N=
ULL pointer dereference on mapping failure.
> - [High] The `ds->phys_mii_mask` is never initialized, causing the driver=
's custom MDIO bus to silently ignore all PHY reads and writes.
> - [High] Concurrent MDIO accesses via `slave_mii_bus` and `user_mii_bus` =
race on shared hardware registers, causing state corruption.
> - [Medium] Missing bitmasks on input parameters in MDIO hardware register=
 construction allows out-of-bounds values to corrupt adjacent register fiel=
ds.
> - [Medium] The driver unconditionally issues a flush command to the hardw=
are FDB controller even if the previous command is still being processed.
> - [Medium] Asynchronous, switch-wide FDB flush is performed instead of a =
synchronous, per-port flush.
> --
>=20
> --- Patch [4]: [PATCH 4/4] net: dsa: soce: Add initial driver support for=
 MRS switches ---
> commit 4ad10a20f72f216349a16415f424608c5d3e5c86
> Author: Vasilij Strassheim <v.strassheim@linutronix.de>
>=20
> net: dsa: soce: Add initial driver support for MRS switches
>=20
> This commit adds initial support for SoC-e switches based on FPGA IP core=
s.
> It provides MDIO access helpers for supported IP register layouts and com=
mon
> STP/FDB handling.
>=20
> > diff --git a/drivers/net/dsa/soce/soce_common.c b/drivers/net/dsa/soce/=
soce_common.c
> > index 0000000000000..f7f345a690e46
> > --- /dev/null
> > +++ b/drivers/net/dsa/soce/soce_common.c
>=20
> [ ... ]
>=20
> > +static void soce_fast_age(struct dsa_switch *ds, int port,
> > +			  const struct soce_layout *layout)
> > +{
> > +	struct soce_priv *priv =3D ds->priv;
> > +	struct soce_dsa_local *local;
> > +	void __iomem *p_mes_ctrl;
> > +	u32 val;
> > +
> > +	local =3D &priv->local;
> > +	if (!layout || !local->base_addr)
> > +		return;
> > +
> > +	p_mes_ctrl =3D local->base_addr + layout->fdb_ctrl;
> > +	if (readl_poll_timeout(p_mes_ctrl, val,
> > +			       !(val & SOCE_FDB_CLEAR_UNDER_PROCESS),
> > +			       SOCE_FAST_AGE_POLL_US, SOCE_FAST_AGE_TIMEOUT_US))
> > +		dev_warn(ds->dev, "SoC-e fast_age timeout on port %d\n", port);
> > +
> > +	writel(SOCE_FDB_CLEAR_FLUSH_MSTID, p_mes_ctrl);
>=20
> [Severity: Medium]
> Does this code continue to issue the flush command even if the hardware i=
s
> still processing the previous one? If readl_poll_timeout() fails, it prin=
ts
> a warning but unconditionally executes the writel() below it.

This code will be reworked or removed in next version.

>=20
> [Severity: Medium]
> Will this flush the entire MSTID globally rather than just the specified =
port?
> The command ignores the port argument. Additionally, it appears to return
> immediately without waiting for the clear operation to complete.
>=20

This code will be reworked or removed in next version.

> > +}
>=20
> [ ... ]
>=20
> > diff --git a/drivers/net/dsa/soce/soce_dsa_core.c b/drivers/net/dsa/soc=
e/soce_dsa_core.c
> > index 0000000000000..b88d00c56d718
> > --- /dev/null
> > +++ b/drivers/net/dsa/soce/soce_dsa_core.c
>=20
> [ ... ]
>=20
> > +static int soce_phy_read(struct dsa_switch *ds, int port, int regnum)
> > +{
> > +	struct soce_priv *priv =3D ds->priv;
> > +	struct soce_dsa_local *local;
> > +
> > +	local =3D &priv->local;
> > +	if (!local->mdio_ops || !local->mdio_ops->phy_read)
> > +		return 0xffff;
> > +
> > +	return local->mdio_ops->phy_read(ds, port, regnum);
> > +}
>=20
> [Severity: High]
> Can concurrent MDIO accesses race on the shared hardware registers here?
> The DSA core implicitly registers the slave_mii_bus, and the driver expli=
citly
> registers a user_mii_bus. Both buses have their own independent mdio_lock
> mutex, but they share the same underlying MMIO routines.
>=20

This will be reworked based on other review comments. I'll check afterward =
if
the problem still exists.

> [ ... ]
>=20
> > +static int soce_sw_probe(struct mdio_device *mdiodev)
> > +{
> [ ... ]
> > +	local->base_addr =3D devm_of_iomap(dev, switch_node, 0, NULL);
> > +	if (IS_ERR(local->base_addr)) {
> > +		dev_err(dev, "failed to map switch register space for %pOF\n",
> > +			switch_node);
> > +		of_node_put(switch_node);
> > +		return PTR_ERR(local->base_addr);
> > +	}
>=20
> [Severity: High]
> Does devm_of_iomap() return NULL on failure rather than an error pointer?
> Checking IS_ERR() here will evaluate to false if it returns NULL, leading=
 to a
> potential NULL pointer dereference later when accessing the MMIO base.
>=20

No, this pattern is used in other files and proposed in devres.c:
 \* Usage example:
 \*
 \*      base =3D devm_of_iomap(&pdev->dev, node, 0, NULL);
 \*      if (IS_ERR(base))
 \*              return PTR_ERR(base);

> [ ... ]
>=20
> > diff --git a/drivers/net/dsa/soce/soce_mdio.c b/drivers/net/dsa/soce/so=
ce_mdio.c
> > index 0000000000000..241fc373de8b8
> > --- /dev/null
> > +++ b/drivers/net/dsa/soce/soce_mdio.c
>=20
> [ ... ]
>=20
> > +static int soce_user_phy_read(struct mii_bus *bus, int addr, int reg)
> > +{
> > +	struct dsa_switch *ds =3D bus->priv;
> > +
> > +	if (ds->phys_mii_mask & BIT(addr))
> > +		return ds->ops->phy_read(ds, addr, reg);
> > +
> > +	return 0xffff;
> > +}
>=20
> [Severity: High]
> Is ds->phys_mii_mask ever initialized? It appears to default to 0 when
> allocated in soce_sw_probe(). If it is always 0, this check will fail and
> all user PHY reads will silently return 0xffff.
>=20

Yes, ds->phys_mii_mask is initialized in dsa.c dsa_switch_setup():

/\* Initialize ds->phys_mii_mask before registering the user MDIO bus =20
 \* driver and before ops->setup() has run, since the switch drivers and =
=20
 \* the user MDIO bus driver rely on these values for probing PHY =20
 \* devices or not =20
 \*/ =20
ds->phys_mii_mask |=3D dsa_user_ports(ds);

> [ ... ]
>=20
> > +int soce_user_mii_bus_register(struct dsa_switch *ds)
> > +{
> [ ... ]
> > +	ds->user_mii_bus->parent =3D ds->dev;
> > +	ds->user_mii_bus->phy_mask =3D ~ds->phys_mii_mask;
>=20
> [Severity: High]
> Since ds->phys_mii_mask defaults to 0, will setting phy_mask to the inver=
ted
> value instruct the MDIO core to ignore all PHYs and prevent probing entir=
ely?
>=20
ds->phys_mii_mask is valid here, see the comment above.

> [ ... ]
>=20
> > +int soce_mdio_20_03_write(struct dsa_switch *ds, int portnumber, int r=
egnum,
> > +			  u16 val)
> > +{
> [ ... ]
> > +	/* Then write control */
> > +	regvalue =3D (mdio->phy_addr << SOCE_MDIO_20_03_CTRL_PHY_ADDR_SHIFT) =
|
> > +		   (regnum << SOCE_MDIO_20_03_CTRL_REG_ADDR_SHIFT) |
> > +		   SOCE_MDIO_20_03_CTRL_OP_WRITE |
> > +		   SOCE_MDIO_20_03_CTRL_START |
> > +		   mdio->mdio_output;
> > +	writel(regvalue, ctrl);
>=20
> [Severity: Medium]
> Should the phy_addr and regnum inputs be bounded or masked before shiftin=
g?
> If an oversized regnum is passed in via userspace ioctls, or a malformed =
DT
> provides a large soce,phy-addr, the shifted bits could overflow into adja=
cent
> control register fields.
>=20

Good point, I will fix that.

> [ ... ]
>=20
> > +static int soce_mdio_23_02_read_c22(struct dsa_switch *ds, int portnum=
ber,
> > +				    int regnum)
> > +{
> [ ... ]
> > +	regvalue =3D (regnum << SOCE_MDIO_23_02_CTRL_REGADDRDEVTYPE_OFFSET) +
> > +		   (mdio->phy_addr << SOCE_MDIO_23_02_CTRL_PHYADDR_OFFSET);
> > +	writel(regvalue, params);
>=20
> [Severity: Medium]
> Similarly here, can the addition of unmasked values risk arithmetic overf=
low
> into adjacent bit ranges if the inputs are out-of-bounds?
>=20
I will also fix that in the next version.


