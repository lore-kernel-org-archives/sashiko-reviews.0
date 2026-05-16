Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA143D8120
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935452; cv=none; b=StATeZXCt3GB1zzHV8zUuZqwuRT2XG0EHOby7IzvGnVH/qsyEIkF6A68YLNbYONEXvk1LXe4rEkfhlTamor49CqS9Berouu/u74WABFIouTXiKy4XupfuRfswNHTUM/0JrAS91elFGgamv6QgKEEw+VXiofEJ5HzPrSKkPlSckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935452; c=relaxed/simple;
	bh=ckx1x0sUwpi41seZmj+D+RK41xCsTA25D9MdcStdVM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JckOkMhsNgcV1tQa6mbnYiUakurNGVwTXDY1DXUEB+y4i8cm2p6t2egZH3wJgJyAZLSozrVekhZtM5m/F5rL5vhzJvMssuMMx1ph6DZqs2fz5ZM51oF7nbV900d614Bwv5s2z3yEy35KxoZ30HtlBStQlDeTo0vAyirIMYnKyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hJncLNgN; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hJncLNgN"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E15BB27023;
	Sat, 16 May 2026 14:44:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kd3DKUEgHG5k; Sat, 16 May 2026 14:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778935447; bh=ckx1x0sUwpi41seZmj+D+RK41xCsTA25D9MdcStdVM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJncLNgNw9PdACjR9C/8p/7W7cYXRMnlYFXW1sHyiTwgBTe2aKSVTbugXPLKcngOQ
	 0q+57bIYXmh17X5QmUmlMMgWh21WE1HIBE9ZNeHmsJdBsec9EzSJBJxoXNn7Rk5mJh
	 dipHhK5PetZos/Nk1UCCJT7zF24LtJsTj1gg0uAj2GCWvMG0c1Wv+whuBI2kVzfbSx
	 IilVJ2xXZBRZFEiAPM5rrgDAD5SCgNeBrswuN43px7A0CaYI337oN77r8YIxPczFpA
	 dZP6zGC4m/OnRPABdVYoteYHM51stbaEuylECFCzUER3GIhnjjLVGzJJsUzjLrajHf
	 6glyWR4sFeFPw==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 16 May 2026 18:13:57 +0530
Message-Id: <DIK3ZE2OHPPC.1MTV4U3YJUMF0@disroot.org>
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: <sashiko-reviews@lists.linux.dev>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 06/10] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
References: <20260516-s2mu005-pmic-v7-6-73f9702fb461@disroot.org>
 <20260515221558.11108C2BCB0@smtp.kernel.org>
In-Reply-To: <20260515221558.11108C2BCB0@smtp.kernel.org>

On 2026-05-15 22:15 +00:00, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [Medium] The V4L2 external_strobe_set callback triggers a software stro=
be instead of configuring a hardware strobe.
> - [Medium] The OF match table is declared but never assigned to the platf=
orm_driver struct.
> - [Medium] Inconsistent Torch maximum brightness constraints between Sysf=
s and V4L2.
> - [Medium] Lack of mutual exclusion between Torch and Flash modes.
> - [Medium] Hardware state leak on probe failure or module unload.
> --
>
> commit b304c8fc634e3a0a1b0e1d670a3987ad37675a8c
> Author: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> leds: flash: add support for Samsung S2M series PMIC flash LED device
>
> This commit adds support for flash LEDs found in Samsung S2M series PMICs=
,
> such as the S2MU005. The driver supports two independently controlled cha=
nnels
> that can operate in both torch and flash modes.
>
>> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/le=
ds-s2m-flash.c
>> new file mode 100644
>> index 0000000000000..6ee8db094611a
>> --- /dev/null
>> +++ b/drivers/leds/flash/leds-s2m-flash.c
>
> [ ... ]
>
>> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_f=
lash, bool enable)
>> +{
>> +	struct s2m_led *led =3D to_s2m_led(v4l2_flash->fled_cdev);
>> +
>> +	return led->fled.ops->strobe_set(&led->fled, enable);
>> +}
>
> Does this implementation fire the flash immediately instead of configurin=
g
> it to wait for a hardware strobe signal?
>
> The V4L2 API contract expects external_strobe_set to merely arm the devic=
e
> for an external hardware pin assertion. If the PMIC lacks true
> hardware-based external strobe support, should has_external_strobe be
> omitted instead?

This function performs hardware-based external strobing, and the flash
seems to fire immediately. I don't have access to the documentation for
this device, so I can't know internal details, but it does work as
expected.

> [ ... ]
>
>> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev,=
 enum led_brightness value)
>> +{
> [ ... ]
>> +	ret =3D regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_TOR=
CH_EN(led->channel));
>> +	if (ret) {
>> +		dev_err(cdev->dev, "failed to enable torch LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&led->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *fle=
d, bool state)
>> +{
> [ ... ]
>> +	ret =3D regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLA=
SH_EN(led->channel));
>> +	if (ret) {
>> +		dev_err(fled->led_cdev.dev, "failed to enable flash LED\n");
>> +		goto unlock;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&led->lock);
>> +
>> +	return ret;
>> +}
>
> Since the LED subsystem allows Sysfs to enable Torch and Flash
> independently, is there a risk that both modes could be active
> simultaneously in the PMIC registers?
>
> Neither s2mu005_fled_torch_brightness_set() nor
> s2mu005_fled_flash_strobe_set() appears to clear the enable bit for the
> opposite mode.

Yes, both can be simultaneously active, but no, there's no risk. The
reason is that the torch and the flash are two separate, independent
LEDs, thus being controllable independently. So there is no need of
negotiation required between torch and flash mode.

> [ ... ]
>
>> +static int s2mu005_fled_init(struct s2m_led *led, struct device *dev, s=
truct regmap *regmap,
>> +			     unsigned int nr_channels)
>> +{
> [ ... ]
>> +	/* Enable the LED channels. */
>> +	ret =3D regmap_set_bits(regmap, S2MU005_REG_FLED_CTRL1, S2MU005_FLED_C=
H_EN);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable LED channels\n");
>> +
>> +	return 0;
>> +}
>
> If the probe fails during child node iteration, or if the module is
> unloaded, does this leave the PMIC LED block permanently powered on?=20
>
> It looks like S2MU005_FLED_CH_EN is set globally here but never cleared o=
n
> failure or removal, which could cause a resource and power leak.

FIXME. Although a non-issue in testing, it is duly appropriate to unset
it, in the driver .remove() callback.

> [ ... ]
>
>> +static int s2mu005_fled_init_channel(struct s2m_led *led, struct device=
 *dev,
>> +				     struct fwnode_handle *fwnp)
>> +{
> [ ... ]
>> +	cdev->max_brightness =3D 16;
>> +	cdev->brightness_set_blocking =3D s2mu005_fled_torch_brightness_set;
>> +	cdev->flags |=3D LED_DEV_CAP_FLASH;
> [ ... ]
>> +	v4l2_cfg.intensity.min =3D led->fled.brightness.min;
>> +	v4l2_cfg.intensity.step =3D led->fled.brightness.step;
>> +	v4l2_cfg.intensity.max =3D led->fled.brightness.max;
>> +	v4l2_cfg.intensity.val =3D led->fled.brightness.val;
>
> Does this create an inconsistency between the Sysfs and V4L2 Torch maximu=
m
> brightness constraints?
>
> The code sets cdev->max_brightness to 16, but v4l2_cfg.intensity is
> initialized using the Flash constraints. Since led->fled.brightness limit=
s
> the brightness to 375,000 uA (effectively level 15), V4L2 users might be
> artificially restricted to level 15 while Sysfs users can reach 16.

As explained above, torch and flash LEDs are different. The flash is
restricted to 15 as the level-16 equivalent causes flickering (the cause
is unknown), but the same is not true for the torch LED. Hence the
discrepancy.

> [ ... ]
>
>> +static const struct of_device_id s2m_fled_of_match_table[] =3D {
>> +	{ .compatible =3D "samsung,s2mu005-flash", .data =3D (void *)S2MU005 }=
,
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
>> +
>> +static struct platform_driver s2m_fled_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "s2m-flash",
>> +	},
>> +	.probe =3D s2m_fled_probe,
>> +	.id_table =3D s2m_fled_id_table,
>> +};
>> +module_platform_driver(s2m_fled_driver);
>
> Should s2m_fled_of_match_table be assigned to the .of_match_table field
> within the driver structure here?
>
> It appears to be declared and exported above, but never assigned to the
> driver. This might prevent Device Tree compatible string matching.

This is intended behavior, as was also documented in a previous revision
of this patch.
