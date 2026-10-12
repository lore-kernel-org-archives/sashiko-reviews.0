Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E031466B1F
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806546; cv=none; b=ZgRzAEsRw1uIM9C/s7snSZHVulqHYUonjVsDryNNBmTs1swr7wQl6ai0uOnYvyDGsYMrczIK2P0zjgGZfsISnhCZWOJDZLGUAw8X0wuvMv76T5GmEGAqt3BKCioJhp64IoD6yvi16AOeSQKCdEQRzXZa0LZros4O75V3xAJczYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806546; c=relaxed/simple;
	bh=LhdrDr3n+heBp+EYcLVua5HPQEX1Sbf9QjYWaMoeB3w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pteIYZhqkpvdNqeur9sSDN8Ug6QzW+Smu0kWat5afr57xvmUhrGmI7fo7NE9J63KVuiWvuWu9HqhCqsIoheOzJCRngPIbYEDzdJkZPFqN5gt/6j9QzTlsHkm1GlOaVi3T9oHEbbmFVfTYYJKytxM0cA2XoCNbmefveRHIi0jGjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/x+PwVi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/x+PwVi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so14909185e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806544; x=1792411344; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kddTvWvhF+27bMv7g9Zho7YBUmupNxBjMAfrRSgPbzw=;
        b=E/x+PwViiolL9bKfG95H5Sijk/YdJxuZdd/OZGQkUOeZGUJbOngpz7i4U0eJxhHFUz
         xHEFnx1xjDIiGOOd/7vnIManKRafa0TwSXuMr/y4YeRnyhBvxygq70vdekJfkoqEqzph
         3lvQb01lmXvlNFdezd/IrwHJZojcKaNCCcBg+G4jh6n1Qvwx5LCMaEQJt2luObpOxt9y
         UkE1LpTwITtz1wJGiip4wHv6XOdECeab19PWEKAcz9uy50MwRjlRr7CuCF6Yq+VPqxtr
         Uf9PhYilHzGl78VL6pskhbG8V01lVr39tgxGc4llKFRU3bpFS3DYh9JzTxQgM0HDAdiS
         hijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806544; x=1792411344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kddTvWvhF+27bMv7g9Zho7YBUmupNxBjMAfrRSgPbzw=;
        b=qtoeLzmUsCul16/5hCbzZlmYF94iFPqurmhw3695VVLPM+b2HwW+FojSu2PZzWyvdk
         sPnpQEQ1yW+5wq0owlxlN3IWYWIiF0Mnzg1FH3/qpe7wcGpGGtvot5wdCX7luGOQIPig
         ykeY6b/PaIYai7xj1vCr1YG2sH3a9CVRZrqovC+GRD7MAwJlqP1Nh6u5ogqXvV39RIqj
         Mb6ujdCV71AJGLzDs9AWe/pVKZQQ/Qcz0OwmgADFvd20g50/jhSVJ4vMDd0VlNcQa0L4
         JqEDjaExPFuhvQEah98BDVc/JzYw0YVAL4AmluwmP3LablV6Z3JoZFHViTJVXDZ6TW4j
         UXMA==
X-Gm-Message-State: AFq9FYIJPi4JT3zgajRnoZcgNrrOCXc1yE3h1eUXMIrLaUANF6vG4EUQ
	F4YF8BLmz+t6uhkuMU7XkAZaDAcE8m8XW8Qg4Fs4/PZfWEk/rcC1A5HgsVcXqQ==
X-Gm-Gg: AYBFou2vj9rlZRHv3k8lCDoPOAu/8/tFFuQW/FT+ZIt4lvfLVJgRaXOYbQ50ZpC1XP/
	5JQbjqtnoxgDX4sYjs1csJYw4vGInNqn1USrvgtzKL7ewM6wzYuKxb93AYKOQP3G/OeSFo8V2Vc
	KQ10ld5WHVMvu7SwhH9JLtlYBRE2xDpvY+I8Y8nLLWwvB2xyGdS1FKDQlLOMIksVD+tNOfCYyuE
	pXRT/ydrZRGfdDb7zDxfA9qYLwlFWelhQDAJLw6cawTa29wIDyxGMx1XljyAV8uRGgaQYq5qSnx
	3GFkl9Bo+9tXTmzxtKozUqtP7misPo6sz9jc5hF72ym7XDO+Hq2v8kRTlvI2k0Lehkeb5fN45xa
	AQaGZpDCrNGH+ixcDZm6UQgu2KJh58mc9PzCZj+8rrhcv8RgGpeqzvxn4YuWmz2qy0L2r/wix88
	EDwN0r0DvZ4Zk2u2IQNFG09agK67/4otA9AvIAX5N7n6jG/HLsyJCvVPJC6WioNleuoBouHOJys
	Vgbvl4Q6HyjsuECLPUcJ26nrApS3gVoq4n/RVsGRwq0s94nor8Svb3i8mBi/awIAbHUqphCAhSg
	Ja/b4oumhfiMWAg=
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a18e4a3f69mr171571165e9.14.1791806543307;
        Mon, 12 Oct 2026 05:02:23 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm150533075e9.2.2026.10.12.05.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:02:22 -0700 (PDT)
Message-ID: <6acccc4e.4c22a69b.132624.271f@mx.google.com>
X-Google-Original-Message-ID: <aszMSyMGUIPNvy1J@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:02:19 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166721@kernel.org>

On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> - [Low] mfd: structure and variable naming violates MFD API guidelines
> --
> 
> commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> mfd: an8855: Add support for Airoha AN8855 Switch
> 
> This commit adds support for the Airoha AN8855 Switch which provides
> a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> and registers a regmap for each internal PHY.
> 
> > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > new file mode 100644
> > index 0000000000000..a2778511dfefc
> > --- /dev/null
> > +++ b/drivers/mfd/airoha-an8855.c
> [ ... ]
> > +static const struct regmap_range an8855_readable_ranges[] = {
> [ ... ]
> > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> 
> [Severity: Medium]
> Is this range definition correct? The General Purpose Timer range
> (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> (0x1000a200 to 0x1000a2ff).
> 
> Could this be a typo in the hardware memory map definition? It seems like
> the General Purpose Timer range might have been intended to end at
> 0x1000a1ff to avoid overlapping and potential register access boundary
> issues.
>

I have to double check this from documentation, but if possible I would
like to fix this with a followup patch.
 
> [ ... ]
> > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > +{
> > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > +	struct device *dev = &mdiodev->dev;
> > +	struct an8855_core *priv;
> > +	struct regmap *regmap;
> > +	int num_phys;
> > +	int i, ret;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> 
> [Severity: Low]
> This isn't a bug, but does this variable and structure naming align with MFD
> subsystem conventions?
> 
> The MFD guidelines suggest avoiding generic variable names like priv, and
> instead recommend using ddata for the instance variable. Also, should the
> struct name itself avoid hardcoding implementation details like core?
> Naming it something closer to struct an8855 might better adhere to the
> subsystem guidelines.
> 

I already updated the struct, is it needed to also update the local
variables?

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=4

-- 
	Ansuel
