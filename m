Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595691;
	b=dysM800tFhZ0ETRSM/HqGf7JGc0XPkrPragI6Qtfsh8Ysl1ng+Px/+gUPH5OofX5kHnc
	 IoIPUGVPdVky7QaMblob4fB+jdOMGB1j68DKOstAAg/bf+alu19EYzMectulalYSjESX0
	 1yrd/8aCePG2y1vgHDVVaJFhN4B7fciC3SEQmFt+WXDPTmFHGFXXmW5IPi3iE5wOBunQ5
	 M4NVsOvDN1MKarTgIsAa0VYSnB8Elt2qevnWtlEI/GIgGDNHaMXK0fVAPxh0cL1lVQSYc
	 gg5GzXibTeJ1A95u/i9T290mRmc4USI0jEihBdZ9IrIep8+HxJ3+9yMamonnGF25bPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595691;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=oRQQ4eBkWGibC5XYs3zRzzFr1cAlLBlEj5FzcQuT9Ks=;
	b=ld1sMvgP7Wl8MtGApUqADpln33Mo61B+qARKuZl0Rhi0V/pzCS3+PqDan3dBL7pxsZJ4
	 zht7VGaQKpsUOQeauhavxpBAXkLLtcYQM+QDPgSvphcrnxGUpqejEP18QxkXOFizDCel7
	 k8YPIIauPWReAqVQFrBi0otN1RayioSW5rICVPwXDgQimB9ZGhSGoWZBI4VuFmxeAFtas
	 TA1hQcoEN+EIEFvvaI0gBCT1leNr4sIx7nRCxSeVxKsCDYVxcvH+H7CYrlQIWialzTabO
	 kxaiMvZt9JaWSlbQLWy+uqr7+HabATZuBPH8+eXXpM3SR119ye92j/Zv3tMREw8S2Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e4cLLepI;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12776606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 15:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12776606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e4cLLepI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7DF1B1A12AB;
	Wed, 21 Oct 2026 15:14:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3ACB8606E3;
	Wed, 21 Oct 2026 15:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 522E1103289F5;
	Wed, 21 Oct 2026 17:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792595682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oRQQ4eBkWGibC5XYs3zRzzFr1cAlLBlEj5FzcQuT9Ks=;
	b=e4cLLepIpKhdQ17Mcc1K1L9Dl6CdWHiMkthE4idkFLam+ygTjsC5BEFFiOZKDnASbqkK29
	y4OHG2gBYUUIIDzwjP5bwDlEcVY4+5BSTR0nyQtcDiCsuldGr0eInKpglc23Sg3KEzELyu
	3YXasE5zeSssZgObWbeDw5w6OWTroiCGnXQmMSjkZsgDt4qTtGNX1WMTQROA2p20ghJ24E
	b1/ZK4wMHzYBQnxAfK4FdayxTWhl7Ca79W+CqfJxpCSvIm6pn1y9zOws/UOZzw5MvocVqT
	ujTxdFHybMzZI9PbtIs6BBUYtTsjqibssuRhni4oUDGyFudBqmTiHJRdXRJWRg==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 17:14:40 +0200
Message-Id: <DMAM4V1UOAIZ.2OVWHIYOAWHG7@bootlin.com>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH 5/5] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
 <20261021-paul-lm51772-v1-5-25f0ffbffa8d@bootlin.com>
 <sashiko-outbox-180131@kernel.org>
In-Reply-To: <sashiko-outbox-180131@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 21, 2026 at 12:56 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [High] regulator: lm51772: wrong register for CONV_EN in lm51772_set_co=
nv_en()
> - [High] regulator: lm51772: cached CLEAR_FAULTS read in lm51772_irq_rena=
ble()
> - [High] regulator: lm51772: OVP lowered before VOUT in lm51772_regulator=
_set_voltage_sel()
> - [Medium] regulator: lm51772: multi-bit mask passed to regulator_err2not=
if()
> - [Medium] regulator: lm51772: plain 64-bit division in lm51772_regulator=
_set_current_limit()
> - [Medium] regulator: lm51772: min_uA ignored in lm51772_regulator_set_cu=
rrent_limit()
> --
>
> commit a4b40e7b6b6cb8eaba3df00e481d736c9bbb846f
> Author: Paul Louvel <paul.louvel@bootlin.com>
>
> regulator: Add TI LM51772 support
>
> This commit adds an I2C regulator driver for the TI LM51772 buck-boost
> controller, supporting a configurable buck-boost output and a fixed 5 V L=
DO
> output with voltage setting, current limiting, and fault reporting.
>
>> diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/l=
m51772-regulator.c
>> new file mode 100644
>> index 0000000000000..b5259f2772433
>> --- /dev/null
>> +++ b/drivers/regulator/lm51772-regulator.c
>> @@ -0,0 +1,826 @@
>
> [ ... ]
>
>> +/* MFR_SPECIFIC_D0 bits */
>> +#define LM51772_EN_VCC1				BIT(5)
>> +
>> +/* MFR_SPECIFIC_D1 bits */
>> +#define LM51772_EN_THER_WARN			BIT(7)
>> +#define LM51772_THW_THRESHOLD_MASK		GENMASK(6, 5)
>> +#define LM51772_EN_NINT				BIT(4)
>> +#define LM51772_CONV_EN				BIT(0)
>
> [ ... ]
>
>> +static int lm51772_set_conv_en(struct regmap *regmap, bool enable)
>> +{
>> +	int ret;
>> +
>> +	ret =3D regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0,
>> +				 LM51772_CONV_EN2,
>> +				 FIELD_PREP(LM51772_CONV_EN2, enable));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0,
>> +				  LM51772_CONV_EN,
>> +				  FIELD_PREP(LM51772_CONV_EN, enable));
>> +}
>> +
>> +static int lm51772_get_conv_en(struct regmap *regmap)
>> +{
>> +	unsigned int pd_ctrl, cfg0;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_USB_PD_CONTROL_0, &pd_ctrl);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_MFR_SPECIFIC_D0, &cfg0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return FIELD_GET(LM51772_CONV_EN2, pd_ctrl) || FIELD_GET(LM51772_CONV_=
EN, cfg0);
>> +}
>
> [Severity: High]
> Should lm51772_set_conv_en() and lm51772_get_conv_en() access
> LM51772_REG_MFR_SPECIFIC_D1 instead of LM51772_REG_MFR_SPECIFIC_D0 for
> LM51772_CONV_EN?
>
> LM51772_CONV_EN is defined under the MFR_SPECIFIC_D1 bit definitions, and=
 in
> lm51772_reg_defaults, LM51772_REG_MFR_SPECIFIC_D1 has a default value of
> 0x09 (bit 0 set) while LM51772_REG_MFR_SPECIFIC_D0 defaults to 0x32 (bit =
0
> clear).
>
> When lm51772_regulator_enable(), lm51772_regulator_disable(), or
> lm51772_regulator_is_enabled() is called on the vout regulator, updating =
and
> reading LM51772_REG_MFR_SPECIFIC_D0 leaves LM51772_CONV_EN set in
> LM51772_REG_MFR_SPECIFIC_D1, preventing the converter from being disabled=
 in
> hardware while modifying bit 0 of LM51772_REG_MFR_SPECIFIC_D0.

LM51772_CONV_EN bit is in MFT_SPECIFIC_D0. I put it under the wrong comment
block.

>
> [ ... ]
>
>> +static int lm51772_set_ov(struct regulator_dev *rdev, int lim_uV)
>> +{
>> +	static const struct linear_range ovp_ranges[] =3D {
>> +		LINEAR_RANGE(4000000, 0, 0x17, 500000),
>> +		LINEAR_RANGE(16000000, 0x18, 0x3f, 1000000),
>> +	};
>> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
>> +	struct device *dev =3D rdev_get_dev(rdev);
>> +	unsigned int selector;
>> +	bool found;
>> +	int ret;
>> +
>> +	ret =3D linear_range_get_selector_low_array(ovp_ranges, ARRAY_SIZE(ovp=
_ranges), lim_uV,
>> +						  &selector, &found);
>> +	if (ret || !found)
>> +		return -EINVAL;
>> +
>> +	dev_dbg(dev, "OVP set to %d uV (selector 0x%02x)\n", lim_uV, selector)=
;
>> +
>> +	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, selector);
>> +}
>> +
>> +static int lm51772_regulator_set_voltage_sel(struct regulator_dev *rdev=
, unsigned int selector)
>> +{
>> +	const struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
>> +	int ret;
>> +
>> +	/*
>> +	 * The LM51772 uses hardcoded OVP thresholds. Update the OVP threshold
>> +	 * to match the new voltage.
>> +	 */
>> +	if (priv->ovp_thres) {
>> +		ret =3D regulator_list_voltage_pickable_linear_range(rdev, selector);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret =3D lm51772_set_ov(rdev, ret + priv->ovp_thres);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return regulator_set_voltage_sel_pickable_regmap(rdev, selector);
>> +}
>
> [Severity: High]
> When decreasing the output voltage in lm51772_regulator_set_voltage_sel()
> while priv->ovp_thres is set, can calling lm51772_set_ov() before
> regulator_set_voltage_sel_pickable_regmap() trip a false over-voltage
> protection fault because VOUT is still at the higher voltage when the low=
er
> OVP threshold is written to LM51772_REG_MFR_SPECIFIC_D5?
>
> Also, in lm51772_set_ov(), ovp_ranges[0] ends at 15500000 uV (selector 0x=
17)
> and ovp_ranges[1] starts at 16000000 uV (selector 0x18), up to 55000000 u=
V
> (selector 0x3f). If ret + priv->ovp_thres falls between 15500001 uV and
> 15999999 uV, or exceeds 55000000 uV, linear_range_get_selector_low_array(=
)
> sets found to false and lm51772_set_ov() returns -EINVAL, causing the
> voltage change to fail.
>
> [ ... ]
>

True. Then, shall I wait until the voltage settle ? Because even if I did i=
t
after setting the voltage, vout might still be above the new ovp threshold =
for a
short time.

>> +static int lm51772_regulator_set_current_limit(struct regulator_dev *rd=
ev, int min_uA, int max_uA)
>> +{
>> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
>> +	u64 voltage_uV =3D ((u64)priv->sense_res_milliohms * max_uA) / 1000;
>> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
>> +	u8 ilim_reg;
>> +
>> +	if (priv->iset_pin)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (voltage_uV < LM51772_ILIM_THR_MIN_UV || voltage_uV > LM51772_ILIM_=
THR_MAX_UV)
>> +		return -EINVAL;
>> +
>> +	ilim_reg =3D voltage_uV / LM51772_ILIM_THR_STEP_UV;
>
> [Severity: Medium]
> Will dividing u64 values with the plain / operator in
> lm51772_regulator_set_current_limit() cause a link failure (__udivdi3 /
> __aeabi_uldivmod undefined) when building on 32-bit architectures? Should
> this use div_u64() instead?
>
> [Severity: Medium]
> What happens in lm51772_regulator_set_current_limit() if the truncated
> register value ilim_reg corresponds to a current limit strictly below
> min_uA? Because min_uA is not checked, can this program a hardware curren=
t
> limit lower than the minimum requested by the caller instead of returning
> -EINVAL?
>

This is just sloppy programming on my part. In the first place, there is no=
 need
for u64 integer, and the sense resistor should not exceed 10 mOhms.
Also min_uA is completely ignored which is indeed not right.

>> +
>> +	dev_dbg(rdev_get_dev(rdev),
>> +		"set current limit: %d uA (ilim_reg 0x%02x, sense_res %d mOhm)\n", ma=
x_uA, ilim_reg,
>> +		priv->sense_res_milliohms);
>> +
>> +	return regmap_write(regmap, LM51772_REG_ILIM_THRESHOLD, ilim_reg);
>> +}
>
> [ ... ]
>
>> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *ri=
d,
>> +			     unsigned long *dev_mask)
>> +{
>> +	struct regmap *regmap =3D rid->data;
>> +	unsigned int reg, errors;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>> +
>> +	errors =3D lm51772_status2err(reg);
>> +
>> +	for (size_t i =3D 0; i < rid->num_states; i++) {
>> +		rid->states[i].errors =3D errors & rid->states[i].possible_errs;
>> +		rid->states[i].notifs =3D regulator_err2notif(rid->states[i].errors);
>
> [Severity: Medium]
> In lm51772_irq_map_event(), what happens when more than one fault bit is =
set
> in LM51772_REG_STATUS_BYTE at the same time?
>
> lm51772_status2err() ORs multiple REGULATOR_ERROR_* flags together, so
> rid->states[i].errors can have multiple bits set. However,
> regulator_err2notif() in include/linux/regulator/driver.h is a switch
> statement over single-bit REGULATOR_ERROR_* constants and returns 0 when
> passed a multi-bit mask, which drops the corresponding REGULATOR_EVENT_*
> notifications.
>

True. I don't know why, but I was convinced that it converted multiple erro=
rs.
Better reading what I use next time!

>> +
>> +		if (reg & LM51772_STAT_OFF)
>> +			rid->states[i].notifs |=3D REGULATOR_EVENT_DISABLE;
>> +
>> +		if (rid->states[i].errors || rid->states[i].notifs & REGULATOR_EVENT_=
DISABLE)
>> +			*dev_mask |=3D BIT(i);
>> +	}
>> +
>> +	rid->opaque =3D reg;
>> +
>> +	return 0;
>> +}
>> +
>> +static int lm51772_irq_renable(struct regulator_irq_data *rid)
>> +{
>> +	struct regmap *regmap =3D rid->data;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &reg);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>> +
>> +	if (rid->opaque && rid->opaque =3D=3D reg) {
>> +		ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
>> +		if (ret)
>> +			return REGULATOR_FAILED_RETRY;
>> +
>> +		return REGULATOR_ERROR_ON;
>> +	}
>> +
>> +	rid->opaque =3D 0;
>> +
>> +	return REGULATOR_ERROR_CLEARED;
>> +}
>
> [ ... ]
>
>> +static const struct regmap_range lm51772_volatile_ranges[] =3D {
>> +	regmap_reg_range(LM51772_REG_PD_STATUS_0, LM51772_REG_PD_STATUS_0),
>> +	regmap_reg_range(LM51772_REG_STATUS_BYTE, LM51772_REG_STATUS_BYTE)
>> +};
>> +
>> +static const struct regmap_access_table lm51772_volatile_table =3D {
>> +	.yes_ranges =3D lm51772_volatile_ranges,
>> +	.n_yes_ranges =3D ARRAY_SIZE(lm51772_volatile_ranges)
>> +};
>> +
>> +static const struct reg_default lm51772_reg_defaults[] =3D {
>> +	{ LM51772_REG_CLEAR_FAULTS, 0x00 },	{ LM51772_REG_ILIM_THRESHOLD, 0x64=
 },
>
> [Severity: High]
> Does regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg) in
> lm51772_irq_renable() actually reach the hardware over I2C?
>
> Because lm51772_regmap_config enables REGCACHE_MAPLE, seeds
> LM51772_REG_CLEAR_FAULTS in lm51772_reg_defaults, and omits
> LM51772_REG_CLEAR_FAULTS from lm51772_volatile_ranges, regmap_read() retu=
rns
> the cached 0x00 value without performing an I2C bus transaction. As a
> result, latched faults in LM51772_REG_STATUS_BYTE are never cleared and
> lm51772_irq_renable() will keep returning REGULATOR_ERROR_ON.
>
> Also, in lm51772_irq_renable(), if an additional fault bit becomes set in
> LM51772_REG_STATUS_BYTE so that reg is non-zero but no longer equal to
> rid->opaque, won't the (rid->opaque && rid->opaque =3D=3D reg) check eval=
uate to
> false and return REGULATOR_ERROR_CLEARED while faults are still active?
>
> [ ... ]

Yes, also true.




--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

