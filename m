Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9F370AFD
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924851; cv=none; b=uCTmfHHDceKMpQ7afQBAH6/y4PTaiPZib4DLtVrfEyFRxaFnVJ3ziMBKeUqneDZN3QegpMJr7j7O83M6O2Jkv09mkdW/h2ZWXnFsFM7u7yOcYQKvpk4gxyHEYBAV8J5yRmU8Y0ho1hdx1itrF4B/Ed+VA0piccpX17IY8IgMdYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924851; c=relaxed/simple;
	bh=lPHK/ihuGBPLemRU0lPXBkD1+OkfE/pRAjceTfkiS3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fs8MQwMPd4+tUj1oDS5pSkib24vgdEeRfVsIag0FcokXAV1LR4hb9MS0wlpfqInCPelsLrKbFVm3gLS+GNYAgk4xwq9Iv47rnTzB3psk3QCwLxVj355hbT6qL37gN8Ae9csgtnreQK3Pd3tbD8u4j4hCe8KvEdz0BYBVg7PLX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkcIulqz; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkcIulqz"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-306f36df4feso2734015eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780924849; x=1781529649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJPSMXCi6b6l39VWDqxTROb6VoHdQrtvaD0s6OS/zU=;
        b=kkcIulqz6ok/Om5gY58QxrtX8SjxkJhm6TiWHMAsh1AYto0//Mj/CkitHu98+NNOsF
         AixeXVxlnTYbTknKQAtGz5x5mI09EHgIzp5ZJHXWxh9oZqtVLVzlcIHMrX0NzI+A70Kq
         weT+ohWWvce66ghFB205NP+zS9OPMyZM0mtGusJhTlrj2Y4g2/LUtr/bzYh5rOi983QC
         QjqpUpYx9DJvyrl+t1i9r4D1WvhCejyb9l8yw6rrBoy1xcrdkINh9f7xjPnhEps31eLp
         t6aKPjzVgtwwDwcEZ0/uU4x4J1HFFKiIEyMvPxDYCkAP4xEy2QzHAVvtEpDs6b5Gn1Xn
         7RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924849; x=1781529649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFJPSMXCi6b6l39VWDqxTROb6VoHdQrtvaD0s6OS/zU=;
        b=pZvGOgCza+zrHgSQ/LvIQQaA8ZQL39rBc4cOAS0SP/cUb6V76KJjHB9tYY61YE1SrC
         c/pLub/3V6KhNqQCU0tQYWuSEIV0wFJ/rY9ystFdey/OfEH2amfMsFLCLZUUc9552qxN
         NB4wwamTflxav/9AvXeIGEs4Ncs6aiv/ssrGolYD2puaPm5OG/e1mX2NyOSxhQI1cDVv
         r+jnqN1BvlVKv6F53Y6zB1p9WbXQ+m2rUIAJTSsPI1xI6hI0ugSF4TROfJlr7sr5WpAY
         /Cuym2gdZKNgb4WRBhG0rwAk+5nvEVsklHqXxDoKPjl6y4/ueUThT20wpLKIME2wr+Jy
         Puew==
X-Forwarded-Encrypted: i=1; AFNElJ9FqrMyPYauR0bbCG+le4EkMfcrqMajokxWsrckXdOxbvmTSFyMEjeIeu3gIWiGN1JMRCs2mgYm5N/sjps/aOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZkCyoKxLERItt4EQXlG8RSfNcJweih1MJCRp6ug8pzQ6g4l0E
	wLni+2NQWmrPdqC0l6Pqpw2T7D8Qrp7VssnwvHci2iu8eCznEXmRnIE+
X-Gm-Gg: Acq92OFKTYCvh/6jWeuBUcB7y+ToL9Dk+Pyli4LaLl3TmP8ICQv3zW9V/YU88mmL025
	DoNoP1ICjXvy0bGONT/PQhYd76z7XfG8zpOOSNd4PruQWu7eZI+IgNoAdjSLXVloCeIxvcQcDtE
	OrUd1a6n3+2vJ8IsW1Tl42TVfjalF0jZ0vyvQe125fQTOIZqPcfbzqu2au8vCav4xyR1yHd980p
	sFiYRYc3AynAZ2vL+be+jvk1MFPkBm3hFLvbAoYV8n+HlZssDzXfjHsD2G6hwMmOR9twIfqkAn2
	jovDJw6D45uWYWAJ1BRbkJsFxXAk6cg82gts0lZAU2JO+nepxXt7TDQw93G+x/ezcNuwLbkIg52
	nWxygl0gMt6k5PX9Xm07tTgBFDEaG8sXJ6RoRogWP0j61Ox4tk3fmEPZAly54e7FitlJFE/Z779
	SWDWGr20CEhJcvMG08e1Xiicv/5XtC3yur6GrcQSvr7H9jyGV8ZA==
X-Received: by 2002:a05:7301:6098:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-3077fff14bamr6004505eec.13.1780924848991;
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm15481288eec.30.2026.06.08.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	linux-input@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 5/8] Input: cap11xx - add reset gpio support
Date: Mon,  8 Jun 2026 21:20:42 +0800
Message-ID: <20260608132042.547421-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606151346.8C5861F00893@smtp.kernel.org>
References: <20260606151346.8C5861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 2 potential issue(=
> s) to consider:
> - [Low] Inefficient delay using usleep_range() for a large duration (400-50=
> 0ms).
> - [Low] Missing explicit inclusion of <linux/delay.h>.
> --
> 
> commit 83de47341df3454fdb8216dc0a95948c3f158a40
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> Input: cap11xx - add reset gpio support
> 
> This commit adds hardware reset support for CAP11xx devices by toggling a
> dedicated reset GPIO during the i2c probe phase. It incorporates specific
> timing requirements for the reset filter and active reset duration.
> 
> > diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/ca=
> p11xx.c
> > index 686174722204c..7015aa7654ce7 100644
> > --- a/drivers/input/keyboard/cap11xx.c
> > +++ b/drivers/input/keyboard/cap11xx.c
> 
> [ ... ]
> 
> > @@ -452,6 +457,17 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_=
> client)
> >  	if (IS_ERR(priv->regmap))
> >  		return PTR_ERR(priv->regmap);
> > =20
> > +	priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LO=
> W);
> > +	if (IS_ERR(priv->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +							"Failed to get 'reset' GPIO\n");
> > +	if (priv->reset_gpio) {
> > +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
> > +		usleep_range(CAP11XX_T_RST_FILT_MIN, CAP11XX_T_RST_FILT_MIN * 2);
> > +		gpiod_set_value_cansleep(priv->reset_gpio, 0);
> > +		usleep_range(CAP11XX_T_RST_ON_MIN, CAP11XX_T_RST_ON_MAX);
> 
> [Severity: Low]
> Does this regression introduce unnecessary overhead by using usleep_range()
> for a 400-500ms delay in cap11xx_i2c_probe()?
> 
> According to kernel timer guidelines, usleep_range() is designed for short
> delays (10us to 20ms) and sets up high-resolution timers. For delays longer
> than 20ms, using msleep() or fsleep() avoids unnecessary overhead and
> expensive CPU wakeups.
> 

Agreed. Will replace usleep_range() with msleep() in V2.

>
> [Severity: Low]
> Could this regression in header dependencies be avoided by explicitly
> including <linux/delay.h> since we are now calling usleep_range() here?
> 
> While the code might compile due to implicit inclusion via other headers,
> relying on implicit includes can sometimes lead to build failures on other
> architectures or if intermediate headers are refactored in the future.
> 

OK. Will add #include <linux/delay.h> in v2,

> > +	}
> > +
> >  	error =3D regmap_read(priv->regmap, CAP11XX_REG_PRODUCT_ID, &val);
> >  	if (error)
> >  		return dev_err_probe(dev, error, "Failed to read product ID\n");
> 
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606150458.2506=
> 06-1-jerrysteve1101@gmail.com?part=3D5

