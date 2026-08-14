Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333733C502
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743187; cv=none; b=n0bx1vr85bvk7gfS06u/YLB+xbR0TRS+BDsZtG9ypAfy3iRcJrqSsrqfg3TAeHwlH7o19slv4THgR7MhWbp+WSqeSzad1OcUjiA1H5hq9k2wKY3DNtqf+VL2zA1OToIdcXCkWcmTxwRRc0AnWkn6Mg6fHmyY1LAPrDK0QqHPnF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743187; c=relaxed/simple;
	bh=JdZBQJYP+wsqqh0sq4Al62Ekzg8mxtfhzRH5qezuyF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLeJcU9hZiQiYgjzna38DNhkm9/Rx858HXsNn4hCQBx9pA2sGYvn3jCU7WR/Oipxgz7eXcjmH5m9b1zTWDbgTDDP/iEYIyGPu2HXyX2xTCDE7xUGPGHFQfW0kLzaWcaMB8cUOsxMbKp99kna4rd4Us3WW7dPo0A5NIWIvEdEQIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tinyisr.com; spf=pass smtp.mailfrom=tinyisr.com; dkim=pass (2048-bit key) header.d=tinyisr.com header.i=@tinyisr.com header.b=ehVLKvCd; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=HEVBkBzn; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tinyisr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tinyisr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tinyisr.com header.i=@tinyisr.com header.b="ehVLKvCd";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="HEVBkBzn"
DKIM-Signature: a=rsa-sha256; b=ehVLKvCdIAlVmSdupZtr1aSnN/PAzF8HsoCvxEN9B74N8/LtXOEeuGQYhgSMSdVyW/yDRzl+wTD9fHuM+DKlTt3ZR+o1y19REtPZgtoDtD/anPhHYVlhxwD4HJDP8koOztwoBXOf0gWhp2VEsJfu8TmQJEIwVCSoICUpfgBWeR9E9GFGuNod5d73SJ2sv6neXgQXB0aeZsGw+n28CQcw8HN0ArKWjai5JJ31c1SOaVAoLBLsOpqGVqu6M1UIes+IGJzVjx0CYHZK3QKzJVUMHX2nD5J+DbOkzXpp//ITQBf5TORXlm+darB7Oseyiuag2MGm+vSiJlsoKmv9s+j3kw==; s=purelymail3; d=tinyisr.com; v=1; bh=JdZBQJYP+wsqqh0sq4Al62Ekzg8mxtfhzRH5qezuyF4=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=HEVBkBznpzwi3Oj6dw2oSd6wKIRZZ2DuBcKAIsrK39CFIkK8toAQUM/PxG2mzuSzhJg2zT8G/HdKB0Z/vor7BZ0SqNWedLGlXJPs4hd0TBhWOttAolEPDAq7r+pYrVX+SdhfSDM2ikOAnHZw6QHIKWjidyO01TUA1Y+JW8P5AaE14QH3A47AlFVWqPT2SVyqGYjctuGlvk1TmF5UGDwnIb4msgufiaeDmGZHT2EJH2dH91XvB6tbpjcKFVm6xppaHvNNLl1mX9onlIp18nkNeoWIkOxcbNxL0tRe5/1FLhySvtWscOjrchXCaMo6DMXEb6HgR0eail/GLMh4Rhnp3w==; s=purelymail3; d=purelymail.com; v=1; bh=JdZBQJYP+wsqqh0sq4Al62Ekzg8mxtfhzRH5qezuyF4=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 99681:12517:null:purelymail
X-Pm-Original-To: sashiko-reviews@lists.linux.dev
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1907611818;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Aug 2026 21:32:57 +0000 (UTC)
Date: Sat, 15 Aug 2026 00:32:08 +0300
From: Joris Vaisvila <joey@tinyisr.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v7 4/4] net: dsa: initial support for MT7628
 embedded switch
Message-ID: <an9_ntsbVIchhRv7@archlinux>
References: <20260813190241.789323-1-joey@tinyisr.com>
 <20260813190241.789323-5-joey@tinyisr.com>
 <20260814190432.96E361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260814190432.96E361F000E9@smtp.kernel.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

Hi, thank you for the review

On Fri, Aug 14, 2026 at 07:04:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Using `devm_mdiobus_alloc()` and `devm_mdiobus_register()` in th=
e DSA `.setup()` callback leads to resource leaks and sysfs collisions on r=
e-bind.
> - [High] The VLAN Untag Bitmap (VUB) register stride is incorrectly set t=
o 7 instead of 8, which will write to the wrong hardware bits for VLANs 1, =
2, and 3 within a register block.
> --
>=20
> --- Patch [4]: [PATCH net-next v7 4/4] net: dsa: initial support for MT76=
28 embedded switch ---
> commit 94f2355ae398ce31cce3f01105a3f2af1b3c61d6
> Author: Joris Vaisvila <joey@tinyisr.com>
>=20
> net: dsa: initial support for MT7628 embedded switch
>=20
> Add support for the MT7628 embedded switch.
>=20
> The switch has 5 built-in 100Mbps user ports (ports 0-4) and one 1Gbps
> port that is internally attached to the SoCs CPU MAC and serves as the
> CPU port.
>=20
> > diff --git a/drivers/net/dsa/mt7628.c b/drivers/net/dsa/mt7628.c
> > new file mode 100644
> > index 0000000000000..fb63f6f644b9e
> > --- /dev/null
> > +++ b/drivers/net/dsa/mt7628.c
>=20
> [ ... ]
>=20
> > +#define MT7628_ESW_VMSC_PREP(vlan, vmsc) \
> > +=09(((vmsc) & MT7628_ESW_VMSC_M) << MT7628_ESW_VMSC_SHIFT(vlan))
> > +
> > +#define MT7628_ESW_VUB_S 7
> > +#define MT7628_ESW_VUB_M GENMASK(6, 0)
> > +#define MT7628_ESW_VUB_SHIFT(vlan) \
> > +=09(MT7628_ESW_VUB_S * ((vlan) % 4))
> > +#define MT7628_ESW_VUB_MASK(vlan) \
>=20
> [Severity: High]
> Is the register stride for the VLAN Untag Bitmap (VUB) incorrectly set to=
 7
> instead of 8?
>=20
> The MT7628 switch packs 4 VLAN configurations per 32-bit register. Using =
a
> 7-bit stride means the shift offsets will be 7, 14, and 21 for the upper
> VLANs in the register block, rather than the standard byte-aligned 8, 16,
> and 24.
>=20
> Could this write the untagged port mask into the wrong hardware bits and
> corrupt the VLAN configuration?
>=20
> [ ... ]
>=20

This matches the datasheet and has been tested to work correctly on real
hardware.

As per the datasheet, VLAN_0_UNTAG_EN is bits 6-0, VLAN_1_UNTAG_EN is
bits 13-7, VLAN_2_UNTAG_EN is bits 20-14, VLAN_3_UNTAG_EN 27-21 and bits
31-28 are unused. The layout is the same for all of the VUB registers.

> > +static int mt7628_setup_internal_mdio(struct dsa_switch *ds)
> > +{
> > +=09struct mt7628_esw *esw =3D ds->priv;
> > +=09struct device *dev =3D ds->dev;
> > +=09struct mii_bus *bus;
> > +
> > +=09bus =3D devm_mdiobus_alloc(dev);
>=20
> [Severity: High]
> Does allocating a devm-managed MDIO bus inside a DSA setup callback
> cause resource leaks or sysfs collisions on re-bind?
>=20
> The mt7628_setup_internal_mdio() function is called from the main
> mt7628_setup() callback. This setup callback runs every time the master
> conduit device binds. If the conduit interface is unbound and bound again=
,
> the setup callback is invoked a second time.
>=20
> Because the bus lifecycle is tied to the switch platform device via devm_=
,
> the old bus is not freed when the conduit unbinds. Will the second
> devm_mdiobus_register() attempt fail with a sysfs name collision (-EEXIST=
),
> preventing the switch from initializing?
>=20

This can't happen. The switch device is unbound when the conduit device
is unbound. Switch setup is only called through probe, so it can only be
called once per device lifetime.

In net/dsa/conduit.c:428 a device link is set up for the switch to
depend on the conduit device:
```
=09/* The DSA conduit must use SET_NETDEV_DEV for this to work. */
=09if (!netif_is_lag_master(dev)) {
=09=09consumer_link =3D device_link_add(ds->dev, dev->dev.parent,
=09=09=09=09=09=09DL_FLAG_AUTOREMOVE_CONSUMER);
=09=09if (!consumer_link)
=09=09=09netdev_err(dev,
=09=09=09=09   "Failed to create a device link to DSA switch %s\n",
=09=09=09=09   dev_name(ds->dev));
=09}
```

MT7628 does not support lag, so the device link is set up for this
device. This pattern is also used in other drivers, a few examples:
=09- in NXP NETC priv->dev is set to the &pci_dev->dev, which is used
=09  in devm_mdiobus_alloc_size().
=09- in mt7530-mmio priv->dev is set to the &platform_device->dev,
=09  which is then used in devm_mdiobus_alloc().

> > +=09if (!bus)
> > +=09=09return -ENOMEM;
> > +
> > +=09bus->name =3D "MT7628 internal MDIO bus";
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260813190241.78932=
3-1-joey@tinyisr.com?part=3D4

Thanks,
Joris
