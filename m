Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38BD35E955
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781349140; cv=none; b=qgJGVeZSih5UJ9cpYBgEBMWSphCsHXHzgrjqYWqtgJyJ882jSnRkX14cjlUNuZyzXA2S2NqK2FjII6Csftwsja99ffbLCBVrGQjFfOHQcmJ9IoMZ4k6rYgHPvo1Cl19tgYGRKWESlJHOXrHlyNuhO1ydwbSPCy7hRCezymQhYjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781349140; c=relaxed/simple;
	bh=Mxk9izfmJ1iYm8ASdn+hegoHoCOC54G9INbOprZmXnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/23JOwQYlyNB/L1Y/OqX7w4CQLfr+qvKNDWFVphIRL2nWJJfav+A1xBOPDRDgO5mg7ntdd4svM8wDbkdZcVXayr5YqrjhsO6O/+hEfTqfWzr5e+XJQK/r1mIwWG/ClJFL/31VsVrA25N1pKlNqwEI+pmdDqWpf+PfL377H9WGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ7YeYIV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ7YeYIV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso16620915ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781349138; x=1781953938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv/S7oGdPwlP4CzZrwOTO68eimVH3uL1uxQlQb3wY7k=;
        b=OJ7YeYIVR6WqACbHuSNxMXW+8d2wpYy2us4IdYF6kFnRKcZ91Nm7Jb4zUHZpjsGmCN
         vOUYiryWLODIv24O+9JOrpFFItR0TBj+4W4LyaYKTZBphMpxUk5TYVibTvrBU5anEdEu
         3BwHZ3h8w0Ro91Uu9bow97G4LqDhpCV8EfApdjHJM1JwtYnHnRwBXDZ+c8peSQfwZuw2
         FjEAhf1sGZ+klzIkJXN6FAtbOouXcwu6IsJI4+ry9XaP8ukKzxXhFGqT4016tr3H0Ovd
         7mXSKYbfq9GXG3zIsKaxcKQlriac35BJGbK0TZI1ZzuR1trjwDidACWmyNSA/Sa5UIG+
         Kjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781349138; x=1781953938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jv/S7oGdPwlP4CzZrwOTO68eimVH3uL1uxQlQb3wY7k=;
        b=Zy+quDHgwafI9b4heNW+jwlIgzEe+ZQSf9JWSufLmWEnvZsrp3gEemjE4vH0GGbQ4x
         /YU35ggAJBoxtD0G5XBjtz1GkhpILD+UZq01+CsV7jnpTcBBs96MEjAXRm2MD9rqlt2n
         WoteNOm+0KvgRpl1aE2D5mrkCEx3dxhiBPh1lK49ypwb5YJIDuu7l7+wCNmKOwt/r+Oq
         DX+975/1YF4f+4siynDh4q4aGg4TTlhMTjrPPcpwZUcWspBybiPfrPO80MZEXRfRntGL
         sX+m7VLrJzIU5Y1EJIVFnqDDuRX7mgi/7bOD4uT7g4Gc5Cj6G9pHsJNXEWTP3c6fzJgg
         JmYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q11OSZnfxzQ1Qbj2MzSf+Jqg190YK5fUzcsbo/AZHzQFNE9VvCr1q3uX3rYUA98kQvQP10+M7ABZJiHp39SI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlmBTQh57Uv0XXsaXYfwPj+KOLKui8LCNkGIvHpwk0wyDj4Cn1
	4n0wOyJIEiAqndFivbH61cQx19+4bX2m1Jrm25QCqzlNQHst9mRAS1ph
X-Gm-Gg: Acq92OExTpSGOCYCF3zcu90f1ynoDmSjIvkcQaR7YIDEz0xcP9P9gMrqlxn9HYZxCCg
	SKhdDLF6qm93QK5ledR7s+d4jXhI+z6K0+4Zfwu11e1So3Wz7eWXAn9MiGjTUEXuBvnU7GQeOjK
	qNECDb5c2hPonXL7l1C2uNXyHQeWAO+KpFR48KLkngcLIuXnSUKu0bJWnWF5fex8YQEyw3GjPJ2
	9wQ8fgdREs/KA4dNNWvh6KjOhVNlVzO9ZkuaN2ZeerAJEs7KYCoU8RV6dPh8EVbobo8w2M6HqYI
	xbUPY/Sz/YlGzEtpFF/jRPay0tjHZTXk39fo4Us93OJpWe0yAKJwrbLUkJYu8946JB6qfCupbk9
	oj7ZP7Tg+YtcF8+CipDvQPbc1DopCwqvWdzLi/uioTDW5KBP+zvInOn345Mk4n7gwJIGyQWeUxx
	Nh22LEaIHDtB88Yfdexgyp
X-Received: by 2002:a17:902:e750:b0:2c1:e04d:7cb5 with SMTP id d9443c01a7336-2c412841372mr79321145ad.34.1781349138173;
        Sat, 13 Jun 2026 04:12:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741::1003])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm47466445ad.23.2026.06.13.04.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:12:17 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	linux-input@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 9/9] Input: cap11xx - add support for CAP1114
Date: Sat, 13 Jun 2026 19:12:14 +0800
Message-ID: <20260613111214.17097-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612074238.4C3371F000E9@smtp.kernel.org>
References: <20260612074238.4C3371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 4 potential issue(=
> s) to consider:
> - [High] Buffer overflow when parsing the 'microchip,calib-sensitivity' dev=
> ice tree property for devices with more than 8 channels.
> - [Medium] Integer truncation silently drops signal guard configurations fo=
> r channels 8-13.
> - [Low] Out-of-bounds `GENMASK` generates an 11-bit mask for an 8-bit LED c=
> ontrol register.
> - [Low] Unnecessary 9th threshold register added to regmap defaults.
> --
> 
> commit a843fc20f78c2766e479b33ffb3dcd6238d1f3f0
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> Input: cap11xx - add support for CAP1114
> 
> CAP1114 is a 14-channel capacitive touch sensor with 11 LED outputs
> and hardware reset support. The CAP1114 uses two control registers
> for LED output management and requires two button status registers
> for touch input state reporting.
> 
> > diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/ca=
> p11xx.c
> > index d45bb231d7a1f..e4da0e26c34a8 100644
> > --- a/drivers/input/keyboard/cap11xx.c
> > +++ b/drivers/input/keyboard/cap11xx.c
> [ ... ]
> > @@ -98,6 +105,9 @@ static const struct reg_default cap11xx_reg_defaults[]=
>  =3D {
> >  	{ CAP11XX_REG_SENSOR_THRESH(3),		0x40 },
> >  	{ CAP11XX_REG_SENSOR_THRESH(4),		0x40 },
> >  	{ CAP11XX_REG_SENSOR_THRESH(5),		0x40 },
> > +	{ CAP11XX_REG_SENSOR_THRESH(6),		0x40 },
> > +	{ CAP11XX_REG_SENSOR_THRESH(7),		0x40 },
> > +	{ CAP11XX_REG_SENSOR_THRESH(8),		0x40 },
> 
> [Severity: Low]
> Does this code inadvertently add a 9th threshold register?
> 
> Since the indexing is 0-based, an 8-threshold device should only need indic=
> es
> 0 through 7.
> 
> Register index 8 appears to map to an unused register.

Good catch, CAP11XX_REG_SENSOR_THRESH(8) should be dropped.

> 
> >  	{ CAP11XX_REG_CONFIG2,			0x40 },
> >  };
> [ ... ]
> > @@ -394,6 +442,14 @@ static int cap11xx_init_leds(struct device *dev,
> >  	if (error)
> >  		return error;
> > =20
> > +	if (num_leds > 8) {
> > +		error =3D regmap_update_bits(priv->regmap,
> > +					   priv->model->led_output_control_reg_base + 1,
> > +					   GENMASK(num_leds - 8 - 1, 0), 0);
> 
> [Severity: Low]
> Can this result in an out-of-bounds mask generation when num_leds > 8?
> 
> In cap11xx_init_leds() just prior to this addition, the code calls:
> 
>     error =3D regmap_update_bits(priv->regmap,
>                    priv->model->led_output_control_reg_base,
>                    GENMASK(num_leds - 1, 0), 0);
> 
> When num_leds is 11 for the CAP1114 model, this generates an 11-bit mask
> to update an 8-bit register.
> 
> While the regmap core safely masks this, should the mask be clamped to
> min(num_leds, 8) to accurately reflect the hardware register's capacity?

Agreed, thanks for the correction.

> 
> > +		if (error)
> > +			return error;
> > +	}
> [ ... ]
> > @@ -572,6 +628,14 @@ static const struct cap11xx_hw_model cap1106_model =
> =3D {
> >  	.has_repeat_en =3D true,
> >  };
> > =20
> > +static const struct cap11xx_hw_model cap1114_model =3D {
> > +	.product_id =3D 0x3a,
> > +	.num_channels =3D 14, .num_leds =3D 11, .num_sensor_thresholds =3D 8,
> 
> [Severity: High]
> Does this code overflow the calib_sensitivities array during initialization?
> 
> In struct cap11xx_priv, the array is rigidly sized to 8 elements:
> 
>     u32 calib_sensitivities[8];
>     u32 keycodes[];
> 
> During cap11xx_init_keys(), when parsing "microchip,calib-sensitivity", the
> driver reads priv->model->num_channels elements:
> 
>     of_property_read_u32_array(node, "microchip,calib-sensitivity",
>                                priv->calib_sensitivities,
>                                priv->model->num_channels)
> 
> With num_channels set to 14, won't this write 14 elements into an 8-element
> array, clobbering the adjacent keycodes flexible array member and potential=
> ly
> causing memory corruption or a kernel panic?

Good point, I'll fix that in v3.

> 
> 
> [Severity: Medium]
> Will this configuration lead to integer truncation when parsing the
> "microchip,signal-guard" property?
> 
> In struct cap11xx_priv, the mask is defined as an 8-bit value:
> 
>     u8 signal_guard_inputs_mask;
> 
> During cap11xx_init_keys(), a loop iterates up to num_channels (14) and shi=
> fts
> the bits:
> 
>     priv->signal_guard_inputs_mask |=3D 0x01 << i;
> 
> For channels 8 to 13, won't this bitwise shift exceed the 8-bit variable wi=
> dth
> and silently truncate to 0?

Good point, I'll fix that in v3.

> 
> Even if the CAP1114 doesn't support signal guards, this drops the bitmask f=
> or
> the upper channels, bypassing the capability check and failing to emit the
> intended 'unsupported' warning.
> 
> > +	.led_output_control_reg_base =3D CAP1114_REG_LED_OUTPUT_CONTROL1,
> > +	.sensor_input_reg_base =3D CAP1114_REG_BUTTON_STATUS1,
> > +	.has_grouped_sensors =3D true,
> > +};
> 
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612072237.1177=
> 304-1-jerrysteve1101@gmail.com?part=3D9
> 
