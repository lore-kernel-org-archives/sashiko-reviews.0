Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B5E34A79D
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261339; cv=none; b=WB0GDyoBKLXINBR3i6k/zLrSeYoHCkZP3QGxzqAFsVT6ykuJTNyyVXLchUbySJRDloZ2iNJCgMJ/iFL4QZhRAmOim2u5FGdXf9CqN6yiAOWNV9cJi6F/jjHlFNR7+CpUtORk6YAG5PlS1bc9zxKjm2MSL7JfI63C8ztVqvohUsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261339; c=relaxed/simple;
	bh=5v0bBklZMAI11axTsyPo+y6JTU4aEE2dE3vxU2Rr3sM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hEur26EzH1P/EcTGufbYK+1gX963ouS7kHMfEMT0b0Q5WbQ8uL861Z7XE40juj7JRRuGn0SW8ArmyEKJVNAJNcSyZ3FrxMXCrYYg6pvNlAqmNGhEe1qFGy+C6WvKe50jdLHmdg8WeXpVLE3MIh8ZOm8IdWMGLxxdUNe6d99NIeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=MKI5592d; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="MKI5592d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=J3YrheZdqW+duFn409E1je+nPJyCNsond
	JsbSI32P1k=; b=MKI5592dDqeZC78qO7kw4nmMFreuTuNMelKcS1RZMly8V8E+C
	k1ANN2SMGYoccRahzELFoDBz+5WjL4fcLzKF2orsD8YyeKYYZsN+4ECzc+UAevMR
	/Tgj3XU3xQSGZ2xBn+/sEWr6mSmOyAEiZ7hQ6J4yDykH87IsGc7xfcgxzo=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUKuXw1qQO0EAA--.6649S2;
	Wed, 20 May 2026 15:15:58 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org
In-Reply-To: <20260515022854.5CCECC2BCB3@smtp.kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <20260515022854.5CCECC2BCB3@smtp.kernel.org>
Date: Wed, 20 May 2026 15:15:17 +0800
Message-Id: <177926131756.943957.13034250409955560370.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779261317; l=7643;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=5v0bBklZMAI11axTsyPo+y6JTU4aEE2dE3vxU2Rr3sM=;
 b=1SHdhTa7/XXqBvBO5si7ZJ1yZWKItKf+teEf19t+50ZV52xGugqg6YcBypmRUfrsV4FE8tP07
 V5mdeaxcNyRATDdPVrPObe1M/73HA72rTGZ56dM/HB147QaYDd0y3jH
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYUKuXw1qQO0EAA--.6649S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKr1xKF4kCr4kAF4xZw4fKrg_yoW3GF4fpF
	Z5Ga13tFW8JFWaqr40q3ykGF1rX3Z7AFWUGrZ8try2yFnIyrykXrW5K3yYvayDCr4qkr4a
	va15X3sI9ws8Ja7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	Ksj5UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQANEWoL3kQAGQADs8

On 2026-05-15 02:28 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Memory leak of temporary DT parsing arrays on consumer probe paths
> - [Medium] Silent ignoring of unsupported pin configurations
> - [Low] Build failure due to dynamic mask in `field_prep()`
> - [Low] Signed integer overflow during pin mux configuration
> - [Low] Unnecessary Kconfig dependencies selected
> --
> 
> commit 03445610d24a54757505c7f2def35cc4894dd19f
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
> 
> This commit adds the pinctrl driver for the UltraRISC DP1000 pinctrl
> controller.
> 
> > diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultrarisc/Kconfig
> > new file mode 100644
> > index 0000000000000..ba8747b90127d
> > --- /dev/null
> > +++ b/drivers/pinctrl/ultrarisc/Kconfig
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config PINCTRL_ULTRARISC
> > +	tristate
> > +	depends on OF
> > +	select PINMUX
> > +	select GENERIC_PINCTRL_GROUPS
> > +	select GENERIC_PINCONF
> > +	select GENERIC_PINMUX_FUNCTIONS
> > +	select GPIOLIB
> > +	select IRQ_DOMAIN_HIERARCHY
> > +	select MFD_SYSCON
> 
> This isn't a bug, but is it necessary to select IRQ_DOMAIN_HIERARCHY and
> MFD_SYSCON here? The driver code doesn't seem to include the corresponding
> headers or use their APIs.
>

I’ll drop them in v2, thanks.
 
> [ ... ]
> > diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
> > new file mode 100644
> > index 0000000000000..774746943e283
> > --- /dev/null
> > +++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
> [ ... ]
> > @@ -0,0 +1,746 @@
> [ ... ]
> > +static int ur_write_pin_conf(struct ur_pinctrl *pctldata, unsigned int pin, u32 conf)
> > +{
> > +	const struct ur_port_desc *port_desc;
> > +	struct ur_pin_val pin_val;
> > +	unsigned long flags;
> > +	void __iomem *reg;
> > +	u32 reg_offset;
> > +	u32 val;
> > +	u32 shift;
> > +	u32 mask;
> > +
> > +	if (ur_pin_num_to_port_pin(pctldata->match_data, &pin_val, pin))
> > +		return -EINVAL;
> > +
> > +	port_desc = &pctldata->match_data->ports[pin_val.port];
> > +	reg_offset = ur_get_pin_conf_offset(port_desc, pin_val.pin);
> > +	reg = pctldata->base + reg_offset;
> > +	shift = (pin_val.pin % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
> > +	mask = GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
> > +
> > +	raw_spin_lock_irqsave(&pctldata->lock, flags);
> > +	val = readl_relaxed(reg);
> > +	val = (val & ~mask) | field_prep(mask, conf);
> 
> Does this cause a build failure? The field_prep() macro strictly enforces
> that its mask argument must be a compile-time constant. Because mask is
> calculated dynamically based on pin_val.pin, the driver will fail to compile.
> 

No. This code uses `field_prep()`, not `FIELD_PREP()`. The lowercase helper
allows runtime-computed masks, so using a dynamically calculated `mask` here
is valid and does not cause a build failure.

> > +	writel_relaxed(val, reg);
> > +	raw_spin_unlock_irqrestore(&pctldata->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ur_set_pin_mux(struct ur_pinctrl *pctldata, struct ur_pin_val *pin_val)
> > +{
> > +	const struct ur_port_desc *port_desc = &pctldata->match_data->ports[pin_val->port];
> > +	void __iomem *reg = pctldata->base + port_desc->func_offset;
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&pctldata->lock, flags);
> > +	val = readl_relaxed(reg);
> > +	val &= ~((UR_FUNC0 | UR_FUNC1) << pin_val->pin);
> 
> Could this shift result in a signed integer overflow?
> 
> UR_FUNC0 is 1 and UR_FUNC1 is 0x10000, so their bitwise OR is 0x10001. If
> pin_val->pin is 15, left-shifting 0x10001 by 15 results in 0x80008000.
> This shifts a bit into the sign bit of a 32-bit signed integer.
> 
> Should these macros be defined with unsigned literals, such as 1U and
> 0x10000U?
>

Yes, good point. I’ll update these mode macros to use unsigned literals so
the mask calculation is done in an unsigned type.
 
> > +	val |= pin_val->mode << pin_val->pin;
> > +	writel_relaxed(val, reg);
> > +	raw_spin_unlock_irqrestore(&pctldata->lock, flags);
> > +
> > +	return 0;
> > +}
> [ ... ]
> > +static int ur_config_to_hw(unsigned long config, u32 *conf)
> > +{
> > +	enum pin_config_param param = pinconf_to_config_param(config);
> > +	u32 arg = pinconf_to_config_argument(config);
> > +
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> > +		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_DIS);
> > +		return 0;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_UP);
> > +		return 0;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
> > +		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_DOWN);
> > +		return 0;
> > +	case PIN_CONFIG_DRIVE_STRENGTH:
> > +		for (u32 i = 0; i < ARRAY_SIZE(ur_drive_strengths); i++) {
> > +			if (ur_drive_strengths[i] != arg)
> > +				continue;
> > +			FIELD_MODIFY(UR_DRIVE_MASK, conf, i);
> > +			return 0;
> > +		}
> > +		return -EINVAL;
> > +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> > +	case PIN_CONFIG_INPUT_ENABLE:
> > +	case PIN_CONFIG_OUTPUT_ENABLE:
> > +	case PIN_CONFIG_PERSIST_STATE:
> > +		return 0;
> 
> Does this code silently ignore unsupported configurations?
> 
> Returning 0 here tells the pinctrl framework that the configurations were
> successfully applied, even though no hardware state was modified. Should
> this return -ENOTSUPP for configurations the hardware doesn't support?
>

Agreed, returning 0 is misleading for unsupported options. I'll change these
cases to return -EOPNOTSUPP in v2.
 
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> [ ... ]
> > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > +				struct device_node *np,
> > +				const char *propname,
> > +				struct ur_legacy_prop_data *prop)
> > +{
> > +	struct ur_pinctrl *pctldata = pinctrl_dev_get_drvdata(pctldev);
> > +	int rows;
> > +
> > +	rows = pinctrl_count_index_with_args(np, propname);
> > +	if (rows < 0)
> > +		return dev_err_probe(pctldev->dev, rows, "%pOF: invalid %s count\n",
> > +				     np, propname);
> > +
> > +	prop->pin_vals = devm_kcalloc(pctldev->dev, rows, sizeof(*prop->pin_vals),
> > +				      GFP_KERNEL);
> > +	if (!prop->pin_vals)
> > +		return -ENOMEM;
> > +
> > +	prop->group_pins = devm_kcalloc(pctldev->dev, rows, sizeof(*prop->group_pins),
> > +					GFP_KERNEL);
> 
> Will this leak memory when consumer devices defer probe?
> 
> The devm_kcalloc() allocations are tied to pctldev->dev, which is the pinctrl
> provider device. Since ur_legacy_parse_prop() is called from dt_node_to_map
> during the consumer's probe sequence, these allocations will remain on the
> provider's devres list and accumulate each time the consumer defers probe.
> 
> Should standard kcalloc() be used here instead and explicitly freed at the
> end of ur_legacy_dt_node_to_map()?
>

Good catch. I'll switch these to kcalloc() and free them explicitly in
ur_legacy_dt_node_to_map() to avoid leaks during probe deferral in v2.
 
> > +	if (!prop->group_pins)
> > +		return -ENOMEM;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=6
> 

Best Regards,
Jia Wang


