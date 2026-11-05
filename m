Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877693;
	b=gHSPPmlYMcZWt7viyl8zR1utuA0OjkmlI8WQeeWGUv4JfguSaQSYeCdGNFc0luN9Sahn
	 F/hrY9Shw0AW4xjAz45NnMO/CqLy97d6+WmHxa+rObarnNe3Y6bWoH9Sa7oIBSAAhWTsD
	 U5clDvxoolDuQpAWnj63dWj5aomyM+qDtqei7zy30t4I6GOlfL4vwD3Ya7dwIvXq3+eE3
	 9wwfmpSeoCRQ5Lwi3CCAYmQWXq62A/6IneJ/BEQnUleR13Lcrntug7CfRjxB1x71r8WT1
	 v8VVh+NsMMBQSMYTOgwhL4ED+dwvCvD/5LVY8ZSuDZtdNosTx+quezle/46bMNQ4ibA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877693;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2xUTtxgUZ6SEuDDCF3JUpUTBjaKWKA1OBritWDe7fg0=;
	b=kHv0qTJkclNr10s0x7j69wVJn5pnSsbFsyE0mTyqd7VdoFoSFnM9u0y/uGdAUlJEGi/1
	 hESOv43doieUiVYgybwpLradPpCKS9NoI8CoKiGWSIkxlXvnZEdiSyaHfyGsnOpUcYy9i
	 /U7VIxnEutBn1yY2caCfgH1uY56QDoMvpBPNzS7o8Eqnu6RmNzilHY4KKynsjFI5IdQH+
	 BAKS632yB3vh8PeXei2s2ZhDUefoqvD/kU9ihyt2CmTnoEZJ+9pfUTkE1b/pJqLDWJfE+
	 ajjER62jIRS3QBR0gfMJNydE6eNxnZqEMt1Gj5W1PTWExdtGshsMFNTbsqfQUHuFeQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=m9IF7MEr;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB1D606A339
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 11:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB1D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=m9IF7MEr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C09430D712;
	Thu,  5 Nov 2026 12:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793877683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2xUTtxgUZ6SEuDDCF3JUpUTBjaKWKA1OBritWDe7fg0=;
	b=m9IF7MEraxgNTLtMkadwh70DlqtSAr57f6aDJq4H5kzMHeN351+m8OwbROtueGyYr0++5J
	5wbawi3OCraz2JIPjpdXUIyuJcEwx3mc1xValDT8rI9vxU8GNVZmpHkSl5ri7aPrQgkggC
	kWG7DmwBLrl2bMXd7/II+ohiQPDR/bGVUoTTdbGicfBXQyLiMbxUCZfX0uBTako3fj9SVL
	nP5s5lAAOWRn3DVjA3MuykvP/WNpfduucohLI2vJ+OvlaRGF8bCKk/x6FUweRDiyJKp6xB
	haiAmkVfSd/lm4ku87wc9r1n1yoJKylzNWofHwJ565zoW7B+AgL9kFz0wBgKtg==
Message-ID: <6b8a44ad-2795-45f4-9248-bdd5ead0e66f@cjdns.fr>
Date: Thu, 5 Nov 2026 12:21:20 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 5/7] net: dsa: mediatek: support MDIO switch downstream
 of MMIO switch
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-6-cjd@cjdns.fr> <sashiko-outbox-191440@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <sashiko-outbox-191440@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 30/10/2026 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] net: dsa: mt7530: broken PHY IRQs due to late mt7530_setup_mdio_irq()
> - [High] net: dsa: mt7530: premature and re-entrant mt7530_setup_mdio() in probe
> - [High] net: dsa: mt7530: unchecked mt7530_setup_mdio() error in mt7988_probe()
> - [High] net: dsa: mt7530: reg_mutex lockdep recursion with downstream switch
> --
>
> commit 51caf2efd42e68935e207fbaf1614c12f27f5efa
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> net: dsa: mediatek: support MDIO switch downstream of MMIO switch
>
> This commit exports mt7530_setup_mdio(), makes it idempotent via a check on
> priv->child_bus, moves mt7530_setup_mdio_irq() to mt753x_setup(), and calls
> mt7530_setup_mdio() from mt7988_probe() after dsa_register_switch() to allow a
> downstream MDIO switch to probe and complete the DSA switch tree.
>
>> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
>> index cf3bdb23a2d54..746a0a4622497 100644
>> --- a/drivers/net/dsa/mt7530-mmio.c
>> +++ b/drivers/net/dsa/mt7530-mmio.c
>> @@ -61,7 +61,21 @@ mt7988_probe(struct platform_device *pdev)
>>   	if (IS_ERR(priv->regmap))
>>   		return PTR_ERR(priv->regmap);
>>   
>> -	return dsa_register_switch(priv->ds);
>> +	ret = dsa_register_switch(priv->ds);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * If not all switches in the hierarchy have been probed,
>> +	 * dsa_register_switch() returns 0 without calling mt753x_setup().
>> +	 * Call mt7530_setup_mdio() because there's a chance that the missing
>> +	 * switch is on the MDIO bus. Do not call this before
>> +	 * dsa_register_switch() as it  may exit with an error.
>> +	 */
>> +	mt7530_setup_mdio(priv);
>> +
>> +	return 0;
> [Severity: High]
> What happens if mt7530_setup_mdio(priv) fails here in mt7988_probe(), for
> example with -ENOMEM from devm_mdiobus_alloc() or -EPROBE_DEFER from
> devm_of_mdiobus_register()?
>
> Because the return value of mt7530_setup_mdio(priv) is ignored and
> mt7988_probe() returns 0, the driver core will treat probe as successful and
> never retry deferred probing, leaving the downstream switch unprobed, the DSA
> tree permanently incomplete, and priv->ds registered in the switch tree
> holding allocated dsa_port instances and conduit net_device references without
> unwinding via mt7530_remove_common(priv) / dsa_unregister_switch(priv->ds).
> Should mt7988_probe() check the return value of mt7530_setup_mdio(priv) and
> unregister the switch on error?


Makes sense to change this.


>
> [Severity: High]
> Also, when a downstream MDIO switch is registered on the MMIO switch's MDIO
> bus (upstream_priv->child_bus), won't register accesses on the downstream
> switch trigger a lockdep recursive locking warning on priv->reg_mutex?
>
> Both the upstream MMIO switch and the downstream MDIO switch initialize
> priv->reg_mutex at the same callsite in mt7530_probe_common():
>
> drivers/net/dsa/mt7530.c:mt7530_probe_common() {
> 	...
> 	mutex_init(&priv->reg_mutex);
> 	...
> }
>
> This assigns both mutexes to the same static lockdep class. When any operation
> on the downstream switch holds mutex_lock(&downstream_priv->reg_mutex) at
> subclass 0 and performs a regmap access, such as in mt7530_port_disable():
>
> drivers/net/dsa/mt7530.c:mt7530_port_disable() {
> 	mutex_lock(&priv->reg_mutex);
> 	priv->ports[port].enable = false;
> 	regmap_update_bits(priv->regmap, MT7530_PCR_P(port), PCR_MATRIX_MASK,
> 			   PCR_MATRIX_CLR);
> 	mutex_unlock(&priv->reg_mutex);
> }
>
> the underlying MDIO transfer goes through mt7530_regmap_read() /
> mt7530_regmap_write() on downstream_priv->bus (which is
> upstream_priv->child_bus) and calls mt7531_ind_c22_phy_read() /
> mt7531_ind_c22_phy_write(), which acquires mutex_lock(&upstream_priv->reg_mutex)
> at subclass 0 of the same lockdep class:
>
> drivers/net/dsa/mt7530.c:mt7531_ind_c22_phy_write() {
> 	mutex_lock(&priv->reg_mutex);
> 	...
> }
>
> Does priv->reg_mutex need a separate lockdep key or nesting annotation when
> switches are stacked this way?


I guess we can set a lockdep key for all MDIO and another one for all 
MMIO switch instances because the only bus-level hierarchy we should 
ever expect to see is MMIO->MDIO, if there are ever 2 MDIO switches, 
they should be represented as siblings.


>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index d45388e2efc83..24e4485624d39 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2509,7 +2509,7 @@ mt7530_free_mdio_irq(struct mt7530_priv *priv)
>>   	}
>>   }
>>   
>> -static int
>> +int
>>   mt7530_setup_mdio(struct mt7530_priv *priv)
>>   {
>>   	struct device_node *mnp, *np = priv->dev->of_node;
>> @@ -2519,6 +2519,10 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>>   	static int idx;
>>   	int ret = 0;
>>   
>> +	/* Already done */
>> +	if (priv->child_bus)
>> +		return 0;
>> +
>>   	mnp = of_get_child_by_name(np, "mdio");
>>   
>>   	if (mnp && !of_device_is_available(mnp))
>> @@ -2543,9 +2547,6 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>>   	bus->parent = dev;
>>   	bus->phy_mask = ~ds->phys_mii_mask;
>>   
>> -	if (priv->irq_domain && !mnp)
>> -		mt7530_setup_mdio_irq(priv);
>> -
>>   	priv->child_bus = bus;
> [Severity: High]
> When mt7988_probe() calls mt7530_setup_mdio(priv) after dsa_register_switch()
> returns 0 on an incomplete DSA tree, neither dsa_switch_setup() nor
> mt753x_setup() has executed yet. Can calling mt7530_setup_mdio() at that point
> cause four ordering and re-entrancy regressions?
>
> 1. Hardware reset and PHY clock setup in mt7988_setup() have not run yet when
> mt7988_probe() calls mt7530_setup_mdio(priv). In mt7988_setup():
>
> drivers/net/dsa/mt7530.c:mt7988_setup() {
> 	/* Reset the switch */
> 	reset_control_assert(priv->rstc);
> 	usleep_range(20, 50);
> 	reset_control_deassert(priv->rstc);
> 	usleep_range(20, 50);
>
> 	/* AN7583 require additional tweak to CONN_CFG */
> 	if (priv->id == ID_AN7583)
> 		regmap_update_bits(priv->regmap, AN7583_GEPHY_CONN_CFG, ...);
>
> 	/* Reset the switch PHYs */
> 	regmap_write(priv->regmap, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
> }
>
> MDIO accesses in mt7530_setup_mdio() happen before priv->rstc is deasserted
> and before AN7583_GEPHY_CONN_CFG is configured. Then, when the downstream
> switch registers and completes the DSA tree, dsa_tree_setup() invokes
> mt753x_setup() -> mt7988_setup() on the upstream switch, asserting priv->rstc
> and writing SYS_CTRL_PHY_RST after MDIO devices and PHYs on the bus have
> already been probed.


This is true, and while it hasn't caused any problems in testing, I 
don't like the idea of hitting a reset line while a downstream bus is 
supposed to be operational. I think the correct approach is to move the 
content of mt7988_setup to mt7988_probe. The reset operation should 
probably be moved to mt7530_probe_common because it's getting called 
from every code path one way or another.


>
> 2. mt7530_setup_irq(priv) is only called from mt753x_setup(), so
> priv->irq_domain is still NULL when mt7988_probe() calls
> mt7530_setup_mdio(priv). Any child PHY or switch node under the mdio DT node
> whose interrupt-parent is the upstream switch will fail fwnode_irq_get() with
> -EPROBE_DEFER during devm_of_mdiobus_register().


The EN751221 downstream does not (to my knowledge) have its interrupt 
line wired to the SoC, and the upstream switch does not have any active 
PHYs, so practically speaking these PHYs need to use polling mode. 
However, this is a rock in my shoe from a correctness perspective and I 
think its addressable by calling mt7530_setup_irq() from 
mt7530_setup_mdio() so that it is called early. The only interaction 
with the hardware is setting bits on MT7530_TOP_SIG_CTRL, and that can 
be moved to mt7530_setup so that it will run post-reset.


>
> 3. ds->phys_mii_mask is only populated by dsa_switch_setup():
>
> net/dsa/dsa.c:dsa_switch_setup() {
> 	...
> 	ds->phys_mii_mask |= dsa_user_ports(ds);
> 	...
> }
>
> When mt7988_probe() calls mt7530_setup_mdio(priv) on an incomplete tree,
> ds->phys_mii_mask is still 0, so bus->phy_mask = ~ds->phys_mii_mask is
> 0xffffffff. If there is no mdio child DT node (mnp == NULL),
> devm_of_mdiobus_register(dev, bus, NULL) scans no PHYs and sets
> priv->child_bus = bus. When the tree later completes and mt753x_setup() calls
> mt7530_setup_mdio(priv), it returns 0 immediately because priv->child_bus is
> already set, leaving ds->user_mii_bus with no PHYs.


This can be resolved by omitting the early call to mt7530_setup_mdio() 
if of_get_child_by_name(np, "mdio") == NULL, which is okay because if 
there's no mdio block then there's no child switch.


>
> 4. Because priv->child_bus = bus is set before devm_of_mdiobus_register(dev,
> bus, mnp) finishes iterating all child nodes of mnp in
> __of_mdiobus_parse_phys(), probing the downstream switch child node
> synchronously calls:
>
> mt7530_probe()
>    -> dsa_register_switch()
>      -> dsa_tree_setup()
>        -> dsa_tree_setup_switches()
>          -> mt753x_setup()
>            -> mt7530_setup_mdio()
>
> That re-entrant mt7530_setup_mdio() call sees priv->child_bus != NULL and
> returns 0 while the outer __of_mdiobus_parse_phys() loop is still mid-iteration
> and has not yet registered any PHY child nodes listed after the downstream
> switch node in mnp. dsa_tree_setup_ports() then runs immediately and fails
> phylink_of_phy_connect() with -ENODEV for those upstream user ports.


I believe this is actually a false positive from the AI, because 
downstream `priv->child_bus != NULL` should not be true because the 
downstream switch has a different instance of priv.


>
> [ ... ]
>
>> @@ -3386,10 +3388,17 @@ mt753x_setup(struct dsa_switch *ds)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/*
>> +	 * This must be called before mt753x_setup() returns because the DSA
>> +	 * core synchronously sets up ports and expects PHYs to be operational.
>> +	 */
>>   	ret = mt7530_setup_mdio(priv);
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (priv->irq_domain && ds->user_mii_bus)
>> +		mt7530_setup_mdio_irq(priv);
> [Severity: High]
> Doesn't moving mt7530_setup_mdio_irq(priv) after mt7530_setup_mdio(priv) break
> PHY interrupts for all switches using ds->user_mii_bus?


This can also be resolved by omitting the early call to 
mt7530_setup_mdio() if of_get_child_by_name(np, "mdio") == NULL.


I really dislike where this is going because I have to choose between 
three evils:

1. Major refactoring

2. Increasing deviation between the MMIO and MDIO setup flows

3. Added technical debt


Of course there's a 4th option which is to declare that cascaded 
switches just cannot be supported, even though working code has already 
been demonstrated. I'm going to try to come back with something that 
walks a reasonable path between these three extremes.


Thanks,

Caleb


>
> In mt7530_setup_mdio(), devm_mdiobus_alloc() initializes all bus->irq[i]
> entries to PHY_POLL. When mnp is NULL, devm_of_mdiobus_register(dev, bus, NULL)
> synchronously scans the bus and creates the phy_device instances via:
>
> devm_of_mdiobus_register()
>    -> __of_mdiobus_register()
>      -> __mdiobus_register()
>        -> mdiobus_scan_bus_c22()
>          -> mdiobus_scan_c22()
>            -> get_phy_device()
>              -> phy_device_create()
>
> During phy_device_create(), phylib copies bus->irq[addr] into each struct
> phy_device:
>
> drivers/net/phy/phy_device.c:phy_device_create() {
> 	...
> 	dev->irq = bus->irq[addr];
> 	...
> }
>
> Because mt7530_setup_mdio_irq(priv) now runs after mt7530_setup_mdio(priv) has
> already registered the bus and created the PHY devices, bus->irq[addr] is still
> PHY_POLL at creation time, so every PHY is created with phydev->irq == PHY_POLL
> and populating ds->user_mii_bus->irq[p] afterwards has no effect on the
> already-created PHY devices (while leaking the mapped IRQ descriptors).
>
> In addition, the error path in mt7530_setup_mdio() still calls
> mt7530_free_mdio_irq(priv) when devm_of_mdiobus_register() fails:
>
> drivers/net/dsa/mt7530.c:mt7530_setup_mdio() {
> 	...
> 	ret = devm_of_mdiobus_register(dev, bus, mnp);
> 	if (ret) {
> 		priv->child_bus = NULL;
> 		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
> 		if (priv->irq_domain && !mnp)
> 			mt7530_free_mdio_irq(priv);
> 	}
> }
>
> even though mt7530_setup_mdio_irq(priv) was not called before
> devm_of_mdiobus_register().
>
