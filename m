Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101016;
	b=sTeo2XbGjyWYtOdidpvIJsTU/tfhjefReoB3WrLB17ojQngJnmLJReRhtJqZ58qBmEtT
	 ZUTNyUfvfQGbVayepgU6UMNeClC0/rKBf0bkx4na8PdVdf4var0mFBmqIVPQ4G7DlGJ4b
	 hv7rGUgr2wWIdW/Mce+GSI6s63FCPSSY3w8xFJuSGh4u+Bm6ScPpPd8ZkGHqF1891vXXK
	 AkpwcgwNWTn+MXgiojQ4pS+yISTpLYNuE3yBEQjsMJqWKrJIUu3lH36gIFvcx69ZUlOWg
	 x36gieAThZVHbUxzWUb2mrbbsgxVEmoirRPMPhh+yLzz1Kj6N7uyreMLi4EAtxKE3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101016;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=K8XWHiZTo/rnPk/qmo2METIj0DAH3PZeMPGufOb8jOo=;
	b=K0pt7gwMsy9nEbc8guldyO+CPTUdCCIJG7GswWzBIB0GLdHgRKEKSUp+JkZOO8EF2T2v
	 Rod1OvuP1bUT65cM3yHL0pU0QhTqeBKqjwoiuIJG1IBJxi52UaCVSXqWbwlNsc78XEcvm
	 XFQ92KmiCb/ng9hp7W3ZIvHoTRAto2hpcS9VaKWP9YsYROBjSOKab1I+ROhk1FRJ4O1IW
	 kA9n4YCe2hGtAdoJc8C2v18AlL3MXN4VTGOa2igB8CDB9I7e3WacTBAgC857KTLJ1Htxc
	 sD81j0YIIRwnuTL3LawOaKI2C9yJhxoMtyHeycwZRNWYDQdGICbz6vYZMchbTInig2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="YOrQW02/";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C62606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 11:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YOrQW02/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40F361A1365
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 11:36:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15371603BD;
	Tue, 27 Oct 2026 11:36:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A9AF10328A20;
	Tue, 27 Oct 2026 12:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793101010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K8XWHiZTo/rnPk/qmo2METIj0DAH3PZeMPGufOb8jOo=;
	b=YOrQW02/HjeWaxjxwTKHj6oIGJTkJqbBTPwsntykcEFbhgR0hGP9NGyVwMJ2J+BYxyusvb
	Ab7RFYpeBkIjfY2vL77aaxy2mOHXlCTewQGGIyDp4AlNsCoMCJCKEpDR2MnDGrFd5pkC0K
	ZOvLhI23rmVczti1jz4NzueMVFXPj3Y0OJ08IB3oW3h2weaR+6/OkILyhOfLqBnbiwIZmX
	vbJQjxXwknkQrw45j1Q3OIsCFcWzQqhXbY/LrL8F+9MqD7qILvOcxOgSynZQzg885CYStN
	OhZh1VAjw4yPH+nVkNp3v9QK5PC9COGu5TL7OrXNGZuQUUsGkEY/W06ySNlTHg==
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
Date: Tue, 27 Oct 2026 12:36:48 +0100
Message-Id: <DMFL9BJQOD79.2Q2K2J8AFHV4A@bootlin.com>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v2 4/4] regulator: Add TI LM51772 support
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
 <20261027-paul-lm51772-v2-4-b2a767e34722@bootlin.com>
 <sashiko-outbox-186345@kernel.org>
In-Reply-To: <sashiko-outbox-186345@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 27, 2026 at 11:01 AM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [High] regulator: lm51772: use logical AND in lm51772_get_conv_en()
> - [High] regulator: lm51772: fix current limit bounds and max_uA check
> - [High] regulator: lm51772: fix STAT_OFF and fault checks in IRQ callbac=
ks
> - [Medium] regulator: lm51772: fix cached errors and IRQ order in lm51772=
_setup_irq()
> - [Medium] regulator: lm51772: allow OVP limits below 4V in lm51772_set_o=
v()
> - [Medium] regulator: lm51772: OVP updated after voltage ramp-up trips fa=
lse OVP fault
> - [Medium] regulator: lm51772: state mismatch between priv->iset_pin and =
hardware default
> --
>
> commit 85d9f9bf5e7e89e913ab51cc149fc605a17772db
> Author: Paul Louvel <paul.louvel@bootlin.com>
>
> regulator: Add TI LM51772 support
>
> This commit adds a regulator driver for the TI LM51772 I2C buck-boost
> voltage regulator and its auxiliary 5 V LDO output.
>
>> diff --git a/drivers/regulator/lm51772-regulator.c b/drivers/regulator/l=
m51772-regulator.c
>> new file mode 100644
>> index 0000000000000..66f4541b50994
>> --- /dev/null
>> +++ b/drivers/regulator/lm51772-regulator.c
>
> [ ... ]
>
>> +static int lm51772_set_conv_en(struct regmap *regmap, bool enable)
>> +{
>> +	int ret;
>> +
>> +	ret =3D regmap_update_bits(regmap, LM51772_REG_USB_PD_CONTROL_0, LM517=
72_CONV_EN2,
>> +				 FIELD_PREP(LM51772_CONV_EN2, enable));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D0, LM51772=
_CONV_EN,
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
> Should lm51772_get_conv_en() use && instead of || here?
>
> In lm51772_reg_defaults (and at hardware reset), LM51772_REG_USB_PD_CONTR=
OL_0
> is 0x01 (so LM51772_CONV_EN2 is 1) while LM51772_REG_MFR_SPECIFIC_D0 is 0=
x32
> (so LM51772_CONV_EN is 0), and lm51772_set_conv_en() must set both bits t=
o
> enable the converter.
>
> When a consumer calls regulator_enable() on vout for the first time:
>
>   _regulator_enable()
>     _regulator_is_enabled()
>       lm51772_regulator_is_enabled()
>         lm51772_get_conv_en()
>
> Because lm51772_get_conv_en() uses ||, it returns 1 while LM51772_CONV_EN=
 is
> still 0, causing _regulator_enable() to treat vout as already enabled and
> skip calling _regulator_do_enable().
>
> [ ... ]
>

No. It might need a comment in the code to clarify this.
Both bits are internally OR'ed, so whenever one of them is set, the convert=
er is
enabled.
When enabling / disabling, we update both bits, just to be consistent.

>> +static int lm51772_set_ov(struct regulator_dev *rdev, int lim_uV)
>> +{
>> +	static const struct linear_range ovp_ranges[] =3D {
>> +		LINEAR_RANGE(4000000, 0, 0x18, 500000),
>> +		LINEAR_RANGE(16000000, 0x18, 0x3f, 1000000),
>> +	};
>> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
>> +	struct device *dev =3D rdev_get_dev(rdev);
>> +	unsigned int sel;
>> +	bool found;
>> +	int ret;
>> +
>> +	ret =3D linear_range_get_selector_high_array(ovp_ranges, ARRAY_SIZE(ov=
p_ranges), lim_uV, &sel,
>> +						   &found);
>> +	if (ret || !found)
>> +		return -EINVAL;
>
> [Severity: Medium]
> Does checking !found in lm51772_set_ov() reject valid over-voltage protec=
tion
> thresholds when the target voltage plus lim_uV is below 4.0 V?
>
> Because vout supports output voltages down to 1.0 V while ovp_ranges star=
ts
> at 4.0 V (4000000 uV), calling linear_range_get_selector_high_array() wit=
h
> lim_uV < 4000000 sets sel =3D 0 (4.0 V, the lowest available upper-bound =
OVP
> threshold), sets found =3D false, and returns 0.
>
> Checking !found causes lm51772_set_ov() to return -EINVAL instead of
> selecting 4.0 V, and since fixed_ovp is set on vout, _regulator_do_set_vo=
ltage()
> will also fail with -EINVAL whenever vout + lim_uV is under 4.0 V.
>

Yes, setting it to 4.0V should be the correct behavior.

>> +
>> +	dev_dbg(dev, "OVP set to selector 0x%02x\n", sel);
>> +
>> +	return regmap_write(regmap, LM51772_REG_MFR_SPECIFIC_D5, sel);
>> +}
>> +
>> +static int lm51772_regulator_set_over_voltage_protection(struct regulat=
or_dev *rdev, int lim_uV,
>> +							 int severity, bool enable)
>> +{
>> +	int ret;
>> +
>> +	if (!enable)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (severity !=3D REGULATOR_SEVERITY_PROT)
>> +		return -EOPNOTSUPP;
>> +
>> +	/* Use default OVP threshold when no limit is requested. */
>> +	if (!lim_uV)
>> +		return regmap_write(rdev_get_regmap(rdev), LM51772_REG_MFR_SPECIFIC_D=
5,
>> +				    LM51772_OVP_DEFAULT);
>> +
>> +	ret =3D regulator_get_voltage_rdev(rdev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return lm51772_set_ov(rdev, ret + lim_uV);
>> +}
>
> [Severity: Medium]
> When regulator-ov-protection-microvolt is configured and vout is raised t=
o a
> new voltage above the previous absolute OVP threshold, can this trip a fa=
lse
> hardware OVP fault during the voltage ramp?
>
> With fixed_ovp enabled on vout in lm51772_regulator_descs,
> _regulator_do_set_voltage() first writes the new voltage selector via
> ops->set_voltage_sel() and sleeps for fsleep(delay) while the output slew=
s,
> and only afterwards invokes ops->set_over_voltage_protection():
>
>   _regulator_do_set_voltage()
>     ops->set_voltage_sel()
>     fsleep(delay)
>     handle_notify_limits(..., ops->set_over_voltage_protection, ...)
>       lm51772_regulator_set_over_voltage_protection()
>
> When stepping vout up (for example from 5 V to 20 V with a 1 V OVP margin=
,
> where LM51772_REG_MFR_SPECIFIC_D5 is initially set to 6 V), the converter
> ramps past 6 V during fsleep(delay) before LM51772_REG_MFR_SPECIFIC_D5 is
> updated to 21 V. Should the OVP threshold be raised before increasing the
> output voltage?
>
> [ ... ]
>

Described in last review.

>> +static int lm51772_regulator_set_current_limit(struct regulator_dev *rd=
ev, int min_uA, int max_uA)
>> +{
>> +	struct lm51772_priv *priv =3D rdev_get_drvdata(rdev);
>> +	struct regmap *regmap =3D rdev_get_regmap(rdev);
>> +	unsigned int current_uA;
>> +	unsigned int sel;
>> +
>> +	if (priv->iset_pin)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (min_uA > LM51772_ILIM_MAX_UA || max_uA < LM51772_ILIM_MIN_UA)
>> +		return -EINVAL;
>> +
>> +	if (max_uA > LM51772_ILIM_MAX_UA)
>> +		max_uA =3D LM51772_ILIM_MAX_UA;
>> +
>> +	sel =3D LM51772_UA_TO_ILIM_SEL(priv->sense_res_micro_ohms, max_uA);
>> +	sel =3D clamp_val(sel, LM51772_ILIM_THR_MIN, LM51772_ILIM_THR_MAX);
>> +
>> +	/* Check if the selected value is still within the allowed range after=
 computation. */\n> +	current_uA =3D LM51772_ILIM_SEL_TO_UA(priv->sense_res=
_micro_ohms, sel);
>> +	if (current_uA < min_uA)
>> +		return -EINVAL;
>
> [Severity: High]
> Can clamping sel up to LM51772_ILIM_THR_MIN cause
> lm51772_regulator_set_current_limit() to program a current limit higher t=
han
> max_uA when a smaller sense resistor is used?
>
> For example, if shunt-resistor-micro-ohms is 5000 (where LM51772_ILIM_THR=
_MIN
> 0x0A corresponds to 1000000 uA) and the caller requests min_uA =3D 500000=
 and
> max_uA =3D 600000, LM51772_UA_TO_ILIM_SEL() computes sel =3D 6, which cla=
mp_val()
> raises to 0x0A. Recomputing current_uA gives 1000000 uA, and because only
> current_uA < min_uA is checked (without checking current_uA > max_uA), th=
e
> driver programs 1.0 A into LM51772_REG_ILIM_THRESHOLD, exceeding max_uA.
>
> Also, LM51772_ILIM_MIN_UA and LM51772_ILIM_MAX_UA hardcode the current ra=
nge
> for a 10 mOhm resistor rather than scaling with priv->sense_res_micro_ohm=
s,
> which rejects valid selectors when a different sense resistor is configur=
ed.
>
> [ ... ]
>

Yes. I should use a linear range array to describe which value this registe=
r can
take. Clamping was lazy and wrong.

>> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *ri=
d, unsigned long *dev_mask)
>> +{
>> +	struct regmap *regmap =3D rid->data;
>> +	unsigned int status, reg, errors;
>> +	bool dev_off;
>> +	size_t bit;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_STATUS_BYTE, &status);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>> +
>> +	errors =3D lm51772_status2err(status);
>> +	rid->opaque =3D status;
>> +
>> +	dev_off =3D (status & LM51772_STAT_OFF) !=3D 0;
>> +
>> +	ret =3D regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
>> +	if (ret)
>> +		return REGULATOR_FAILED_RETRY;
>> +
>> +	for (size_t i =3D 0; i < rid->num_states; i++) {
>> +		rid->states[i].errors =3D errors & rid->states[i].possible_errs;
>> +		rid->states[i].notifs =3D 0;
>> +
>> +		for_each_set_bit(bit, &rid->states[i].errors, BITS_PER_TYPE(rid->stat=
es[i].errors))
>> +			rid->states[i].notifs |=3D regulator_err2notif(BIT(bit));
>> +
>> +		if (dev_off)
>> +			rid->states[i].notifs |=3D REGULATOR_EVENT_DISABLE;
>> +
>> +		if (rid->states[i].errors || dev_off)
>> +			*dev_mask |=3D BIT(i);
>> +	}
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
> [Severity: High]
> Are LM51772_STAT_OFF and rid->opaque handled as intended in
> lm51772_irq_map_event() and lm51772_irq_renable()?
>
> In lm51772_irq_map_event(), dev_off reflects LM51772_STAT_OFF for the mai=
n
> buck-boost converter (vout), including when vout is simply disabled in
> software. However, the loop applies dev_off to all regulators in
> rid->num_states, which sends REGULATOR_EVENT_DISABLE to the auxiliary vcc=
1
> LDO (and to vout on warning interrupts while vout is software-disabled).
>
> In lm51772_irq_renable(), comparing the raw status byte with
> rid->opaque =3D=3D reg has two issues:
>
> 1. If an interrupt occurs when status is only LM51772_STAT_OFF (for examp=
le,
> an INPUT/VIN_UV event while vout is off), reading LM51772_REG_CLEAR_FAULT=
S
> does not clear LM51772_STAT_OFF, so rid->opaque =3D=3D reg stays true and
> lm51772_irq_renable() returns REGULATOR_ERROR_ON in an infinite polling l=
oop.
>

This is the intended behavior.
renable is only called when the pin act as nFLT. When the unit is off, the =
OFF
bit will be set, until the unit is enabled again.
In the mean time, the IRQ have to be disabled, so REGULATOR_ERROR_ON must b=
e
returned. This is not an infinite loop if may be turned on again, otherwise=
,
this is a intended infinite loop.

> 2. If multiple status bits were set and one bit changes while other fault
> bits remain active in reg, rid->opaque =3D=3D reg evaluates to false, ski=
pping
> LM51772_REG_CLEAR_FAULTS and prematurely returning REGULATOR_ERROR_CLEARE=
D.
>

Yes and this is the intended behavior.
If a bit change we want to have an irq and map event again.
LM51772_REG_CLEAR_FAULTS will be called.

>> +
>> +static int lm51772_vout_of_parse(struct device_node *np, const struct r=
egulator_desc *desc,
>> +				 struct regulator_config *cfg)
>> +{
>> +	u32 sense_res_micro_ohms, active_discharge_strength, pcm_window_low;
>> +	struct lm51772_priv *priv =3D cfg->driver_data;
>> +	int ret;
>
> [ ... ]
>
>> +	priv->iset_pin =3D of_property_read_bool(np, "ti,iset-pin");
>
> [Severity: Medium]
> What happens to priv->iset_pin if the optional regulators/vout DT node is
> absent?
>
> In lm51772_reg_defaults, LM51772_REG_MFR_SPECIFIC_D9 defaults to 0x2C, wh=
ich
> has LM51772_SEL_ISET_PIN (BIT(5)) set to 1 (selecting the external ISET p=
in).
> However, priv->iset_pin is zero-initialized to false in lm51772_probe() a=
nd
> LM51772_SEL_ISET_PIN is only updated in lm51772_vout_of_parse().
>
> If the vout child node is omitted (or on non-DT instantiation via
> lm51772_id), regulator_of_get_init_data() does not invoke
> lm51772_vout_of_parse(), leaving LM51772_SEL_ISET_PIN set to 1 in hardwar=
e
> while priv->iset_pin is false in software. As a result,
> lm51772_regulator_get_current_limit() and
> lm51772_regulator_set_current_limit() will read and write the inactive
> LM51772_REG_ILIM_THRESHOLD register instead of returning -EOPNOTSUPP (or
> clearing LM51772_SEL_ISET_PIN).
>
> [ ... ]
>

Yes.

>> +static int lm51772_setup_irq(struct device *dev, struct regmap *regmap,=
 int irq,
>> +			     struct regulator_dev *rdev[LM51772_N_REGS], bool nint)
>> +{
>> +	int common_errs =3D REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_T=
EMP_WARN |
>> +			  REGULATOR_ERROR_FAIL;
>> +	int per_rdev_errs[] =3D {
>> +		REGULATOR_ERROR_OVER_CURRENT | REGULATOR_ERROR_OVER_VOLTAGE_WARN,
>> +		0,
>> +	};
>> +	struct regulator_irq_desc irq_desc =3D {
>> +		.name =3D "lm51772-irq",
>> +		.data =3D regmap,
>> +		.map_event =3D lm51772_irq_map_event,
>> +	};
>> +	void *retp;
>> +
>> +	if (!nint) {
>> +		irq_desc.renable =3D lm51772_irq_renable;
>> +		irq_desc.irq_off_ms =3D 1000;
>> +		irq_desc.reread_ms =3D 200;
>> +	}
>> +
>> +	retp =3D devm_regulator_irq_helper(dev, &irq_desc, irq, 0, common_errs=
, per_rdev_errs, rdev,
>> +					 LM51772_N_REGS);
>> +	if (IS_ERR(retp))
>> +		return PTR_ERR(retp);
>> +
>> +	return regmap_update_bits(regmap, LM51772_REG_MFR_SPECIFIC_D1, LM51772=
_EN_NINT,
>> +				  FIELD_PREP(LM51772_EN_NINT, nint));
>> +}
>
> [Severity: Medium]
> When nint is true, how do cached error flags in rdev->cached_err get clea=
red?
>
> Because common_errs and per_rdev_errs are passed to
> devm_regulator_irq_helper(), init_rdev_errors() sets rdev->use_cached_err=
 =3D
> true, and regulator_notifier_isr() latches any reported errors via
> rdev_flag_err(). However, rdev_clear_err() is only called from
> regulator_notifier_isr_work(), which is only scheduled when
> irq_desc.irq_off_ms is non-zero. With irq_off_ms left at 0 when nint is t=
rue,
> _regulator_get_error_flags() will permanently OR the latched rdev->cached=
_err
> flags into every subsequent regulator_get_error_flags() call even after t=
he
> fault clears.
>

Will be fixed by keeping irq_off_ms, but set the renable callback to NULL w=
hen
nint is true.

> Also, should LM51772_EN_NINT be configured via regmap_update_bits() befor=
e
> calling devm_regulator_irq_helper() so the IRQ handler is not active whil=
e
> the pin is still in its default nFLT mode?

Would be better, yes.

--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

