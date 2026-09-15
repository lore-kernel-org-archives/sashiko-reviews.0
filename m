Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536C1A9F8C;
	Tue, 15 Sep 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470673; cv=none; b=Ce04xexXL/yTCiLQuel6J7SZaIezAaJS6MY0jgovV/pQUHLs9GYUl+d9mgh5mwkLWwjgu4JClsBsb7T9OlxRqBTIy+9QtanBn/l3yVTtngQ5HO67QywuHP+wTeGpayQmtWsfX+fbZyl4hRkAdl5Z/DUM713iYSClpE4nwKCzBno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470673; c=relaxed/simple;
	bh=wd35QuTcUpDBUdzeEGHJ5g4dp7v8JfttnZT+e2P95u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPiN73iceDNnn+UHCWBKArFwNh9o1CQ/S8i/RQMTaFS27Oo4NOOH63KJXPHZuUMCyAbElA1p4prMQ1f3GMg5KtcLfNHU3R7rUAFbbg2vS8hqvx5MdQOeyV8DXEnKdfNTYRGJC5qNUrBZRPPWnWG0Xe3lw1RwG8wVPO1q/3I7DtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGRjoMkR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGRjoMkR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE741F000FF;
	Tue, 15 Sep 2026 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470671;
	bh=Jw7hC5ZxbSw7mwVQ5dM1PqIGD/qgD3KcxKNpQvWWZKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGRjoMkRNQo1a4U9SB8przwikf9GFS08tLOZfzVMCecqhhtvA31wRvyrB1p7AdB0N
	 SGI1I0nyo6pmzROXyaSonoycaJsp2VYPfp5YnjKc0cHv+lOR+qn0+Sp0qdA1zNhRLD
	 mUpqMMrO7bnHi24rtNr4pNu2DX1u9r1AIzzWlxAOFr3NXY/wAzSOzrKO29NPqbjGtC
	 j8nsqAQZTOSbJdwGgJP5z78BG6k06o9HMuH5alMQWYdhEqBwj7WsT1DTHelFB8LJPq
	 OJQtpkmLIysshONuzHeb7n3x1FKLK8toz2QkMmQL3fRQddIU2dp/FjWbCI3CP5GIX/
	 QF7omm6K/AlVQ==
Date: Tue, 15 Sep 2026 12:11:07 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Christian Marangi <ansuelsmth@gmail.com>, robh@kernel.org,
	mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v21 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
Message-ID: <20260915111107.GC11487@google.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-5-ansuelsmth@gmail.com>
 <20260912225509.B1AB41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260912225509.B1AB41F000FF@smtp.kernel.org>

On Sat, 12 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Integer truncation of u32 address difference to u8 allows bypassing bounds check, leading to out-of-bounds heap accesses.
> - [High] Unprotected concurrent access to `priv->phy_bus` causes unbalanced mutex unlocks, and Devres LIFO cleanup creates a Use-After-Free window.
> - [Low] Selecting MDIO_REGMAP without inheriting its dependency on PHYLIB causes Kconfig unmet direct dependencies warning.
> - [Low] Incorrect usage of FIELD_GET for PHY page comparison against a prepared constant.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 93cf16801f16f118e3a22ae17f7d80b0cc1d49bc
> Author: Christian Marangi <ansuelsmth@gmail.com>
> Subject: mfd: an8855: Add support for Airoha AN8855 Switch
> 
> This commit introduces core support for the Airoha AN8855 Switch.
> It provides a DSA switch and an NVMEM provider, and utilizes the
> mdio-regmap driver to handle the PHYs.
> 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index e4fd4572472f9..614b39a538fc8 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> [ ... ]
> > @@ -54,6 +54,19 @@ config MFD_ALTERA_SYSMGR
> >  	  using regmap_mmio accesses for ARM32 parts and SMC calls to
> >  	  EL3 for ARM64 parts.
> >  
> > +config MFD_AIROHA_AN8855
> > +	tristate "Airoha AN8855 Switch Core"
> > +	select MFD_CORE
> > +	select REGMAP
> > +	select MDIO_REGMAP
> > +	depends on NETDEVICES && OF
> 
> [Severity: Low]
> Does this configuration correctly inherit dependencies? Selecting MDIO_REGMAP
> without also inheriting its dependency on PHYLIB can trigger a Kconfig warning
> for unmet direct dependencies, which might lead to build failures if the
> selected infrastructure isn't actually available.
> 
> > +	help
> > +	  Support for the Airoha AN8855 Switch Core. This is an SoC
> > +	  that provides various peripherals, to count, i2c, an Ethrnet
> > +	  Switch, a CPU timer, GPIO, eFUSE.
> > +
> > +	  Currently it provides a DSA switch and a NVMEM provider.
> > +
> >  config MFD_ACT8945A
> >  	tristate "Active-semi ACT8945A"
> >  	select MFD_CORE
> > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > new file mode 100644
> > index 0000000000000..01f33293a9018
> > --- /dev/null
> > +++ b/drivers/mfd/airoha-an8855.c
> [ ... ]
> > +static void an8855_regmap_lock(struct an8855_core_priv *priv)
> > +{
> > +	if (priv->phy_bus)
> > +		mutex_lock(&priv->phy_bus->mdio_lock);
> > +	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> > +}
> > +
> > +static void an8855_regmap_unlock(struct an8855_core_priv *priv)
> > +{
> > +	mutex_unlock(&priv->bus->mdio_lock);
> > +	if (priv->phy_bus)
> > +		mutex_unlock(&priv->phy_bus->mdio_lock);
> > +}
> 
> [Severity: High]
> Could these unlocked reads of priv->phy_bus cause unbalanced locking or a
> use-after-free?
> 
> Since the regmap is created earlier in probe (via devm_regmap_init), it might
> be accessible concurrently before priv->phy_bus is initialized. If a
> concurrent access evaluates if (priv->phy_bus) as false here, it will skip
> locking. If the probe thread then assigns priv->phy_bus before
> an8855_regmap_unlock() executes, the unlock path could evaluate true and
> release a mutex it never acquired.
> 
> Additionally, if probe fails later at devm_mfd_add_devices(), devres unwinds
> in LIFO order. This would unregister and free phy_bus, but the regmap remains
> accessible until its own cleanup. During this window, an8855_regmap_lock()
> could attempt to lock a freed priv->phy_bus->mdio_lock.
> 
> [ ... ]
> > +static int an8855_regmap_phy_reset_page(struct an8855_core_priv *priv,
> > +					int phy) __must_hold(&priv->bus->mdio_lock)
> > +{
> > +	/* Check PHY page only for addr shared with switch */
> > +	if (phy != priv->switch_addr)
> > +		return 0;
> > +
> > +	/* Don't restore page if it's not set to Switch page */
> > +	if (priv->current_page != FIELD_GET(AN8855_PHY_PAGE,
> > +					    AN8855_PHY_PAGE_EXTENDED_4))
> > +		return 0;
> 
> [Severity: Low]
> Is this the intended usage of FIELD_GET()? The macro extracts an unshifted
> value, but it is being compared against AN8855_PHY_PAGE_EXTENDED_4, which is
> already shifted via FIELD_PREP_CONST. While this works out safely today
> because the mask GENMASK(2, 0) has a shift of zero, a future change to the
> mask could silently break this comparison logic.
> 
> [ ... ]
> > +static int an8855_phy_register(struct device *dev, struct an8855_core_priv *priv,
> > +			       struct device_node *phy_np)
> > +{
> > +	struct mdio_regmap_config mrc = { };
> > +	struct an8855_phy_priv *phy_priv;
> > +	struct regmap *regmap;
> > +	struct mii_bus *bus;
> > +	u8 phy_offset;
> > +	u32 addr;
> > +	int ret;
> > +
> > +	ret = of_property_read_u32(phy_np, "reg", &addr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	phy_offset = addr - priv->switch_addr;
> > +	if (phy_offset >= AN8855_MAX_PHY_PORT)
> > +		return -EINVAL;
> 
> [Severity: High]
> Could this lead to an out-of-bounds heap access?
> 
> The variable phy_offset is declared as a u8, but it is calculated from a u32
> addr which comes from the device tree. If the device tree provides an
> arbitrarily large reg value (such as priv->switch_addr + 256), the math
> modulo 256 wraps the u8 value to 0.
> 
> This would bypass the bounds check against AN8855_MAX_PHY_PORT. The
> unchecked addr would then be passed into fwnode_mdiobus_register_phy(),
> eventually reaching mdiobus_register_device() which attempts to access
> mdiodev->bus->mdio_map[mdiodev->addr] using the unbounded value.
> 
> [ ... ]
> > +	bus = devm_mdio_regmap_register(dev, &mrc);
> > +	if (IS_ERR(bus))
> > +		return PTR_ERR(bus);
> > +
> > +	if (addr == priv->switch_addr)
> > +		priv->phy_bus = bus;
> 
> [Severity: High]
> This is where priv->phy_bus is initialized. Because the switch regmap is
> already fully registered and accessible prior to this, any concurrent access
> can race with this assignment, triggering the unbalanced lock or
> use-after-free issues mentioned earlier.
> 
> > +
> > +	return fwnode_mdiobus_register_phy(bus, of_fwnode_handle(phy_np), addr);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260911225414.225980-1-ansuelsmth@gmail.com?part=4

-- 
Lee Jones
