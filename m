Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908409;
	b=X+3s3w49G+mSMlDvs9tPOnmnSku0PW1+n4FIhc8if6U2yfLydBA0T8L17uNw9ZpJhauc
	 7bAY8E+Iud2J/xMEPHQvusyRrKT8C6YpZZP0sswd+A/7o7p3UzJy5/OOi/uznZuIZMm22
	 z2J/k6gDjNR4dOqc505GEK3kKUw/DmUlfiI6YVGgzY7aPCshmSGvkHCCfdMKxdtKbHYiS
	 WffykYYePFgMlRuKbNOD1O6DA9oWWOkeEF/siHt7ph8CW8RXhWkqAVuvxUg2ZaeEGUs+i
	 r9BA2pk0NXhd/NWxNE3BwdYa48a+q7H59sOfIsCG8gTMxhe7T3UQWcAlguptWOqei6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908409;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=++B6g1rkbix+J1oVVYsPSBASK99MRRkm+UybAj51+pk=;
	b=O7BfMDfAtvbn669j0OrwQNlJ4JDb1uqQXP2HgCva2xdubGwdJjemDAoZPJf5YrZAm1rV
	 bWkzJd8R7Fx9lfMuhtMN3l1fujqwnAprSJG/qDn0a0j5nlKSIqs/EEXTePI3YEKNLu8X1
	 Aciko99osSEBt4vyBOltVPpXIa+fp+R6P9cVcD49DpZVdHf/0Et/0mkd68Z7rxNIV8YVw
	 fcvfhqQApCngPh6kE2NJycP68/YpWKZgtxDQL1n8u2TgQdTwmF0ICQOiZ7VFUpqpRmpMn
	 Gr0p+FrFoyhK477+Ap7V+eqmZl0/rOmf2vD+XjlBae5Oeb+rY2emPrJNmYaVgjZ0vlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=wSYtsYAs;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF6606A329
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 19:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76DF6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=wSYtsYAs
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C18432B8FF;
	Thu,  5 Nov 2026 20:53:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793908405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=++B6g1rkbix+J1oVVYsPSBASK99MRRkm+UybAj51+pk=;
	b=wSYtsYAsUb960aUgA1GWBofzaiglpxSqSHq1WZ3WmAUxP4E7IoIIGUoSbVy70Dko1Kb3Cj
	/qaAmF8es6fkxHBb65ZqgqUBt+uw3vpC0MBurUWP+fH2iRFqvlJOCT+EFUtGpjm0V7q461
	U5XgUk4z5CxDPx6j/oiX8cgokyLqtCnuqqiEU8os9q8DAaUg4cUxDzpk+lEmwIoH3CJXRx
	9fIbYpdnZ123ZKVrlHzJJ+gWz4TnGykpWtflvKARUQ8e/UwlGnBW8j1H+AJKDsOdYilw5r
	kkZX/vK9rDWEIExB7OtbhUwVsbufZos5VrRG7Veyqp7AOK1/G7MBuxieMlVBAw==
Message-ID: <4b77a67c-7dd3-4366-8fa6-802f57cc61de@cjdns.fr>
Date: Thu, 5 Nov 2026 20:53:23 +0100
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
Subject: Re: [PATCH v4 7/7] net: dsa: mediatek: support EN751221 switch
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-8-cjd@cjdns.fr> <sashiko-outbox-191442@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <sashiko-outbox-191442@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 30/10/2026 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] net: dsa: mt7530: missing MT7530_CHG_TRAP setup for ID_EN751221
> - [High] net: dsa: mt7530: recursive reg_mutex lockdep class in MMIO-MDIO hierarchy
> - [Medium] net: dsa: mt7530: swapped default_taps in en751221_trgmii_pair_setup()
> - [Medium] net: dsa: mt7530: missing child_bus mdio_lock in core_write() and core_rmw()
> - [Medium] net: dsa: mt7530: race with peer phylink in mt7530_cal_interswitch_trgmii()
> --
>
> commit fcbb4fdaccb60b7ebd8ef125ae65f04744031511
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> net: dsa: mediatek: support EN751221 switch
>
> This patch adds support for the EcoNet EN751221 on-die MT7530 switch and the
> optional external MCM MT7530 switch, along with startup calibration for the
> TRGMII link connecting them.
>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 24e4485624d39..447c80455460e 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -49,6 +49,9 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
>>   static int
>>   mt753x_ctrl_phy_addr(struct mt7530_priv *priv)
>>   {
>> +	if (priv->id == ID_EN751221)
>> +		return 12;
>> +
>>   	if (WARN_ON_ONCE(!priv->mdiodev))
>>   		return 0;
>>   
>> @@ -349,12 +352,19 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>>   	regmap_read(priv->regmap, MT753X_MTRAP, &xtal);
>>   	xtal &= MT7530_XTAL_MASK;
>>   
>> +	/* EN751221 on-die does not report clock speed in MTRAP */
>> +	if (priv->id == ID_EN751221)
>> +		xtal = MT7530_XTAL_25MHZ;
>> +
>>   	if (xtal == MT7530_XTAL_25MHZ)
>>   		ssc_delta = 0x57;
>>   	else
>>   		ssc_delta = 0x87;
>>   
>> -	if (priv->id == ID_MT7621) {
>> +	if (priv->id == ID_EN751221_EXT || priv->id == ID_EN751221) {
>> +		/* PLL frequency: 362.5Mhz */
>> +		ncpo1 = 0x1d00;
>> +	} else if (priv->id == ID_MT7621) {
> [Severity: Medium]
> When mt7530_mac_config() calls mt7530_setup_port6() on ID_EN751221, it invokes
> core_clear(), core_write(), and core_set() on control PHY address 12.
>
> On the MMIO-based ID_EN751221 switch, priv->bus is NULL and core_write() and
> core_rmw() fall back to priv->child_bus:
>
> drivers/net/dsa/mt7530.c:mt7530_mutex_lock() {
> 	if (priv->bus)
> 		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> }
>
> drivers/net/dsa/mt7530.c:core_write() {
> 	...
> 	if (!bus)
> 		bus = priv->child_bus;
>
> 	if (WARN_ON_ONCE(!bus))
> 		return;
>
> 	mt7530_mutex_lock(priv);
>
> 	/* Write the desired MMD Devad */
> 	ret = bus->write(bus, ctl_phy, MII_MMD_CTRL, MDIO_MMD_VEND2);
> 	...
> }
>
> Because mt7530_mutex_lock() and mt7530_mutex_unlock() only check priv->bus,
> priv->child_bus->mdio_lock is not acquired when priv->bus is NULL. While
> mt7531_ind_c22_phy_read() and mt7531_ind_c22_phy_write() acquire
> priv->reg_mutex for each individual Clause 22 transfer, can the multi-step
> MII_MMD_CTRL / MII_MMD_DATA sequence and read-modify-write in core_write() and
> core_rmw() interleave with concurrent MDIO transactions on priv->child_bus
> (such as phylib polling or regmap accesses to the downstream ID_EN751221_EXT
> switch)?


This issue was noted here: 
https://lore.kernel.org/sashiko-reviews/492da787-471d-4923-b6ad-6f6cb113b19e@cjdns.fr/

It only affects MMIO chips using core_*() functions (i.e. the EcoNets) 
and it is not showing trouble in testing. I think the correct fix is to 
replace the guts of core_write and core_rmw with calls to 
phy_write_mmd() but that affects everyone and needs to be validated - 
and I'd be inclined to send such a patch, but I feel that adding it here 
makes this patchset more difficult to review, not less. So I'm probably 
going to leave this one alone for the moment.


>
> [ ... ]
>
>> @@ -471,6 +481,251 @@ mt7531_pll_setup(struct mt7530_priv *priv)
>>   	usleep_range(25, 35);
>>   }
>>   
>> +static bool
>> +en751221_trgmii_cal_ok(struct mt7530_priv *rx, u32 reg)
>> +{
>> +	u32 val = 0;
>> +
>> +	regmap_read(rx->regmap, reg, &val);
>> +	regmap_write(rx->regmap, reg, val | EDGE_CHK);
>> +	regmap_write(rx->regmap, reg, val & ~EDGE_CHK);
>> +	regmap_read(rx->regmap, reg, &val);
>> +
>> +	return FIELD_GET(RD_VALUE_MASK, val) == TGMII_TD_PAT &&
>> +	       !FIELD_GET(RD_ERR_MASK, val);
>> +}
>> +
>> +static void
>> +en751221_trgmii_calibrate_direction(struct mt7530_priv *tx,
>> +				    struct mt7530_priv *rx,
>> +				    u8 *default_taps)
>> +{
> [ ... ]
>
>> +		if (best_tap > -1) {
>> +			regmap_update_bits(rx->regmap, rx_reg, RD_TAP_MASK,
>> +					   RD_TAP(best_tap));
>> +
>> +			log[best_tap] = 'X';
>> +
>> +			dev_info(rx->dev,
>> +				 "TRGMII lane %d: %s tap %d old %d\n",
>> +				 channel, log, best_tap, default_taps[channel]);
>> +		} else {
>> +			regmap_update_bits(rx->regmap, rx_reg, RD_TAP_MASK,
>> +					   RD_TAP(default_taps[channel]));
>> +
>> +			dev_warn(rx->dev,
>> +				 "TRGMII lane %d: %s calibration failed, preserving tap %u\n",
>> +				 channel, log, default_taps[channel]);
>> +		}
> [ ... ]
>
>> +static void
>> +en751221_trgmii_pair_setup(struct mt7530_priv *ext, int ext_port,
>> +			   struct mt7530_priv *ondie, int ondie_port)
>> +{
> [ ... ]
>
>> +	/* BOTH: Collect and then zero every RX TAP */
>> +	for (channel = 0; channel < NUM_TRGMII_CTRL; channel++) {
>> +		reg_val = 0;
>> +		regmap_read(ext->regmap, MT7530_TRGMII_RD(channel), &reg_val);
>> +		default_taps_ext[channel] = FIELD_GET(RD_TAP_MASK, reg_val);
>> +		regmap_clear_bits(ext->regmap, MT7530_TRGMII_RD(channel),
>> +				  RD_TAP_MASK);
>> +
>> +		reg_val = 0;
>> +		regmap_read(ondie->regmap, MT7530_TRGMII_RD(channel), &reg_val);
>> +		default_taps_ondie[channel] = FIELD_GET(RD_TAP_MASK, reg_val);
>> +		regmap_clear_bits(ondie->regmap, MT7530_TRGMII_RD(channel),
>> +				  RD_TAP_MASK);
>> +	}
>> +
>> +	en751221_trgmii_calibrate_direction(ondie, ext, default_taps_ondie);
>> +	en751221_trgmii_calibrate_direction(ext, ondie, default_taps_ext);
> [Severity: Medium]
> Are default_taps_ondie and default_taps_ext swapped in these two calls to
> en751221_trgmii_calibrate_direction()?


Seems so, will fix.


>
> In en751221_trgmii_calibrate_direction(tx, rx, default_taps), default_taps is
> used to log the previous RX tap value on rx->dev and to restore rx->regmap's
> MT7530_TRGMII_RD(channel) register if calibration fails. Passing
> default_taps_ondie when rx is ext (and default_taps_ext when rx is ondie) uses
> the peer switch's saved RX taps instead of rx's own saved taps.
>
>> +
>> +	dev_info(ondie->dev, "TRGMII inter-switch link initialized\n");
>> +}
>> +
>> +static void
>> +mt7530_cal_interswitch_trgmii(struct dsa_port *dp)
>> +{
>> +	struct dsa_switch *ds = dp->ds;
>> +	struct dsa_switch *peer_ds;
>> +	struct dsa_port *peer_dp;
>> +	struct mt7530_priv *peer;
>> +	struct mt7530_priv *priv;
>> +	struct dsa_link *dl;
>> +	u32 pmsr = 0;
>> +
>> +	priv = ds->priv;
>> +
>> +	if (priv->id != ID_EN751221_EXT)
>> +		return;
>> +
>> +	if (dp->type != DSA_PORT_TYPE_DSA)
>> +		return;
>> +
>> +	regmap_read(priv->regmap, MT7530_PMSR_P(dp->index), &pmsr);
>> +
>> +	if (!(pmsr & PMSR_LINK))
>> +		return;
>> +
>> +	list_for_each_entry(dl, &ds->dst->rtable, list) {
>> +		if (dl->dp != dp)
>> +			continue;
>> +
>> +		peer_dp = dl->link_dp;
>> +
>> +		if (peer_dp->type != DSA_PORT_TYPE_DSA)
>> +			continue;
>> +
>> +		peer_ds = dl->link_dp->ds;
>> +
>> +		if (!of_device_is_compatible(peer_ds->dev->of_node,
>> +					     "econet,en751221-switch"))
>> +			continue;
>> +
>> +		peer = peer_ds->priv;
>> +
>> +		if (peer->id != ID_EN751221)
>> +			continue;
>> +
>> +		en751221_trgmii_pair_setup(priv, dp->index, peer,
>> +					   peer_dp->index);
>> +	}
>> +}
> [Severity: Medium]
> Can mt7530_cal_interswitch_trgmii() race with the peer port's phylink_resolve()
> work item?


Yes, this is indeed possible. Inter-switch calibration needs to touch 
registers of both switches, that's unavoidable. Taking out the 
dp->pl->state_mutex is impossible because it's private. The right 
solution is probably to make mt7530.c take the reg_mutex *every* time it 
touches the regmap, but that's another change - and a pretty invasive one.

So while I don't like it, I think the best course of action is to leave 
this as it is.


>
> When dsa_tree_setup_ports() enables the DSA ports on both switches, each port
> schedules its own phylink_resolve() work item holding only its own
> dp->pl->state_mutex. In mt753x_phylink_mac_link_up(), priv->regmap's
> MT753X_PMCR_P(dp->index) has just been written with PMCR_FORCE_LNK right
> before calling mt7530_cal_interswitch_trgmii(dp), so checking PMSR_LINK on
> priv->regmap checks the local port rather than peer->regmap's
> MT7530_PMSR_P(peer_dp->index).
>
> While en751221_trgmii_pair_setup() forces MT753X_PMCR_P(ondie_port) down and
> sleeps in usleep_range(5000, 6000) twice during TX/RX reset, could peer_dp's
> phylink_resolve() run concurrently on another worker and call
> mt753x_phylink_mac_link_up() on ondie_port mid-reset? Also, when
> en751221_trgmii_pair_setup() writes mcr_up to MT753X_PMCR_P on both ports,
> does it overwrite PMCR_FORCE_TX_FC_EN and PMCR_FORCE_RX_FC_EN configured by
> mt753x_phylink_mac_link_up()?
>
>> @@ -1459,7 +1714,8 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
>>   
>>   	mutex_unlock(&priv->reg_mutex);
>>   
>> -	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
>> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
>> +	    priv->id != ID_EN751221 && priv->id != ID_EN751221_EXT)
>>   		return 0;
>>   
>>   	if (port == 5)
>> @@ -1486,7 +1742,8 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
>>   
>>   	mutex_unlock(&priv->reg_mutex);
>>   
>> -	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
>> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
>> +	    priv->id != ID_EN751221 && priv->id != ID_EN751221_EXT)
>>   		return;
> [Severity: High]
> Do the updates to MT753X_MTRAP for ID_EN751221 in mt7530_port_enable(),
> mt7530_port_disable(), mt7530_setup_port5(), and mt7531_setup_common() take
> effect without MT7530_CHG_TRAP being set?


Indeed this bit is not being set, I will add a new setup function for 
EcoNet (i.e. MMIO mt7530 chips).


>
> In mt753x_table, ID_EN751221 uses mt7988_setup() -> mt7531_setup_common().
> Unlike mt7530_setup(), which sets MT7530_CHG_TRAP in MT753X_MTRAP after
> resetting the switch so that trap bits can be modified by software,
> mt7988_setup() asserts and deasserts priv->rstc and then calls
> mt7531_setup_common() without setting MT7530_CHG_TRAP in MT753X_MTRAP.
>
> [ ... ]
>
>> @@ -3817,6 +4122,28 @@ const struct mt753x_info mt753x_table[] = {
>>   		.phy_write_c45 = mt7531_ind_c45_phy_write,
>>   		.mac_port_get_caps = en7528_mac_port_get_caps,
>>   	},
>> +	[ID_EN751221] = {
>> +		.id = ID_EN751221,
>> +		.pcs_ops = &mt7530_pcs_ops,
>> +		.sw_setup = mt7988_setup,
>> +		.phy_read_c22 = mt7531_ind_c22_phy_read,
>> +		.phy_write_c22 = mt7531_ind_c22_phy_write,
>> +		.phy_read_c45 = mt7531_ind_c45_phy_read,
>> +		.phy_write_c45 = mt7531_ind_c45_phy_write,
>> +		.mac_port_get_caps = en751221_mac_port_get_caps,
>> +		.mac_port_config = mt7530_mac_config,
>> +	},
>> +	[ID_EN751221_EXT] = {
>> +		.id = ID_EN751221_EXT,
>> +		.pcs_ops = &mt7530_pcs_ops,
>> +		.sw_setup = mt7530_setup,
>> +		.phy_read_c22 = mt7530_phy_read_c22,
>> +		.phy_write_c22 = mt7530_phy_write_c22,
>> +		.phy_read_c45 = mt7530_phy_read_c45,
>> +		.phy_write_c45 = mt7530_phy_write_c45,
>> +		.mac_port_get_caps = mt7530_mac_port_get_caps,
>> +		.mac_port_config = mt7530_mac_config,
>> +	},
> [Severity: High]
> When ID_EN751221_EXT is registered as an MDIO device on ID_EN751221's internal
> MDIO bus (ondie->child_bus), both switches initialize priv->reg_mutex in
> mt7530_probe_common() with the same lockdep class key.


Noted here 
https://lore.kernel.org/sashiko-reviews/492da787-471d-4923-b6ad-6f6cb113b19e@cjdns.fr/ 
and will be addressed.


>
> When an operation on the downstream ID_EN751221_EXT switch holds
> ext->reg_mutex and accesses ext->regmap, the regmap MDIO callbacks invoke the
> parent switch's child_bus operations, which acquire ondie->reg_mutex:
>
> mt7530_setup() (on ext)
>    mt7530_port_disable()
>      mutex_lock(&ext->reg_mutex)
>      regmap_update_bits(ext->regmap, ...)
>        mt7530_regmap_write()
>          bus->write() (on ondie->child_bus)
>            mt753x_phy_write_c22()
>              mt7531_ind_c22_phy_write()
>                mutex_lock(&ondie->reg_mutex)
>
> Will this nested acquisition of ondie->reg_mutex while ext->reg_mutex is held
> trigger a lockdep recursive locking warning?
>
