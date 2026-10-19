Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428992;
	b=2AxJHKbC12+voNtomMrhxbWO9vPosjmBlORdyB/dxcNskx5L7X6aDIyQ4LJ65KC1PUQF
	 izi125WMBW4U89QctnubEJARXBtoo4hiCKLUSLAn4k6H8hBaYXAOLmAS2OkkCuA4LZ34V
	 /JPzufryoVja+5gjdekMYK2H4jCdk9pzlt1+y8ECZIiVkVKyb8QGxPZgLDXZilmlWNeca
	 mLmspzV5Z1zJBtpXF0eLTUPl18siGjDz6dr/FzbNKNU70PnzIuTGiDUd4dyBz9Nje5O0k
	 GcXqhCWs8oTpKNuhIGMMfuu1NU5JAqfe9RjEL1ez6gNmgJ0x2gT5e4x7nZIjdPvv97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
	 X-Google-Original-Message-ID:Date:From:To:Cc:Subject:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
	b=1UfVULw4D7AY6h32qRbc10JTDgGVa3DVr3sQEaI8iXutp+5hdEDZmfFJZD4YINPo9ZC7
	 os/0kCbxRsylbrByFj7wyLHU8zYHoPSswuI6G5LJyd6jLMTlKXYNydQ4H12z5y5Di6rAV
	 LxwZc7ExMHvQB2DuaFOu9ObhXdVh6wCpavtdrP5zDDAxT5YCDhm8EOjYvgr3hRbOlXOsa
	 Gcp9bMHEvSKySi5YaBC4U2KF/EFzzO0aptsLSA7fziWOc7EWR/qgmDcORYiG2zEfgQSLW
	 mTmCGVwQ6sUFTK4XSgmhfOJbLFknmOl1pmZy88ZMaSrrCXlarHH6XcDx2+ERHWefASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pZTsVKGj;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD4606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDD4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pZTsVKGj
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso18789415e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428990; x=1793033790; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
        b=pZTsVKGjuxFl/ARs7NmtzPsjMzxWmOrYC6HLVDM9G4Yrf6rp8K2Y//BZpWHCaMEtf5
         mFrKbVjjKh1YqjtZqOvC1cPA6sNxLASuqlqM4tmy/9mGo4QumGxs2wKBoTy4uzQpQghr
         m239qlUTJBfXMaLsRvvErX60ZfxvNdIJWYHWr+sl4HTZwsJRRIawaPpDeNmpfPxU69kV
         oQsTSxFbD4wuvrtoIgM7ePceJbpxy0hD7oXIXfbqGVfcW2hFCDBYT/drYAKi4yNrUuO7
         R00Rehv0Ls7nPS2nAjMrSHMIEfnzGq3GXQBC4CPOLm6FtqxNSDBk5a7v91mtgvSQju4y
         dYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428990; x=1793033790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgvtFckoRwO/w6wYyG/SDEa4Hefzwa+zI6y6vYHDT00=;
        b=2Z2cRPWosj0Be7c++EED8kQ/hszmB75465APWPGW830GJRRMc+/sEvEipf3q5R9Wdi
         M59HEAhRDkBpkYwpf9HUWOdhr7vAyligYK433hKJfVOuhnexoNGyMci5Uqr7nqrVvp+F
         E/bAQItIbliE2Sj6q5zk1HsiwDJk6UIpFFdnKBahqnRDNwpen0zxqCCskQObQBy/nQ2M
         qg6pC3M8tzCv+Tc67DXpHLSw5nZ7Z0oxOp9/+RgHq5rOdlwo0mw9a/w4eQquHQni3eq/
         egQ2/7VNqR59jOnvAKkphJzkhQs3SGpli8tSdkZ5Wh7A1uuvHatQ5Sc547GiipZrG5vP
         4Xwg==
X-Gm-Message-State: AFq9FYLz4C0q0Dh6q/r5/8U+jxbjA7Swm4mbj2zyENTBI4PW20arsvyy
	YSw4k2dAJbixK9HQh5/2TJkduJMIhAZBTOXHT089XwOul2O4ryz0b9YL
X-Gm-Gg: AYBFou02rkD5ufhStorsKwfTcubktC8kZY45EWZ8W58IUne9JKV9FU7WxPzkotBCmC2
	8aYIXfdGArGFcjxCpZPFCPCvU82Ou5kAkuqja0yM79VDGelzxXC3lfJ4ji2thoYfV8mFco/sY6t
	4JNw4KK10qRQzbd2fXJ/DoJjcY1o0Kqw+/U8ZQ+MUXh65cKCXlRTRsLLx2ZQiwY4Kp1peL3G7hP
	JBHQjWsR1Z/dB+dRo/9Q1qOhN5Q9r+mVHxlYW5jQlDXkiMoeIWS9QXr5oiNacsM0l08cJ5IUO3o
	Kl64XS2pji3sKt4X28bysjLgFQ7GC4ty2ZEIk2vdTT9s9/HO72EELT3giK4/5xFfrAhRyf3oETE
	2gVaAg1Ggx9kml4e4URFDEdbE+Wckttxdd6oE1YzCy81TYePikjnnF4jB5iPqHkiUopMvpARrF9
	lcc1eW0B/mCGDiyOtAwttHrmnAeRFNL6Fc3+J/9stOYH0wpOmTK9QOcbGt9ROGX9nKs7pO0xZmH
	UnDa3mjlZ1miCYwYU5+9r5+9LI6mATLW010PLmHPXLvjDtfBV7tPTHsPkz0Tg==
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr195261465e9.2.1792428989590;
        Mon, 19 Oct 2026 09:56:29 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm92295f8f.30.2026.10.19.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:56:28 -0700 (PDT)
Message-ID: <6ad64bbc.66e4af69.3b9046.552a@mx.google.com>
X-Google-Original-Message-ID: <atZLucG4T0G9wQur@Ansuel-XPS.>
Date: Mon, 19 Oct 2026 18:56:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <sashiko-outbox-166721@kernel.org>
 <6acccc4e.4c22a69b.132624.271f@mx.google.com>
 <20261019164430.GI2663669@google.com>
 <6ad64981.198a47d7.3d6d5a.6d01@mx.google.com>
 <20261019165231.GJ2663669@google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019165231.GJ2663669@google.com>

On Mon, Oct 19, 2026 at 05:52:31PM +0100, Lee Jones wrote:
> On Mon, 19 Oct 2026, Christian Marangi wrote:
> 
> > On Mon, Oct 19, 2026 at 05:44:30PM +0100, Lee Jones wrote:
> > > On Mon, 12 Oct 2026, Christian Marangi wrote:
> > > 
> > > > On Sat, Oct 10, 2026 at 04:11:40PM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > - [Medium] mfd: overlapping regmap readable ranges for General Purpose and GPU timers
> > > > > - [Low] mfd: structure and variable naming violates MFD API guidelines
> > > > > --
> > > > > 
> > > > > commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
> > > > > Author: Christian Marangi <ansuelsmth@gmail.com>
> > > > > 
> > > > > mfd: an8855: Add support for Airoha AN8855 Switch
> > > > > 
> > > > > This commit adds support for the Airoha AN8855 Switch which provides
> > > > > a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
> > > > > and registers a regmap for each internal PHY.
> > > > > 
> > > > > > diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> > > > > > new file mode 100644
> > > > > > index 0000000000000..a2778511dfefc
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/mfd/airoha-an8855.c
> > > > > [ ... ]
> > > > > > +static const struct regmap_range an8855_readable_ranges[] = {
> > > > > [ ... ]
> > > > > > +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> > > > > > +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> > > > > > +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> > > > > 
> > > > > [Severity: Medium]
> > > > > Is this range definition correct? The General Purpose Timer range
> > > > > (0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
> > > > > (0x1000a200 to 0x1000a2ff).
> > > > > 
> > > > > Could this be a typo in the hardware memory map definition? It seems like
> > > > > the General Purpose Timer range might have been intended to end at
> > > > > 0x1000a1ff to avoid overlapping and potential register access boundary
> > > > > issues.
> > > > 
> > > > I have to double check this from documentation, but if possible I would
> > > > like to fix this with a followup patch.
> > > >  
> > > > > [ ... ]
> > > > > > +static int an8855_core_probe(struct mdio_device *mdiodev)
> > > > > > +{
> > > > > > +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> > > > > > +	struct device *dev = &mdiodev->dev;
> > > > > > +	struct an8855_core *priv;
> > > > > > +	struct regmap *regmap;
> > > > > > +	int num_phys;
> > > > > > +	int i, ret;
> > > > > > +
> > > > > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > > 
> > > > > [Severity: Low]
> > > > > This isn't a bug, but does this variable and structure naming align with MFD
> > > > > subsystem conventions?
> > > > > 
> > > > > The MFD guidelines suggest avoiding generic variable names like priv, and
> > > > > instead recommend using ddata for the instance variable. Also, should the
> > > > > struct name itself avoid hardcoding implementation details like core?
> > > > > Naming it something closer to struct an8855 might better adhere to the
> > > > > subsystem guidelines.
> > > > > 
> > > > 
> > > > I already updated the struct, is it needed to also update the local
> > > > variables?
> > > 
> > > Ah, I was just about to apply this!
> > > 
> > > This would be preferred:
> > > 
> > >   struct an8855 *ddata;
> > >
> > 
> > Ahhhhhh! You got me!
> > 
> > Do you think there might be a faster method to submit this so I can quickly
> > rename the variable and you can pick it? 
> 
> Is everything else ready to go?
> 
> BTW, there is no rush on this - I'm done for v7.4-rc1.
> 

Honestly it's really to slim down this series and the fact that it's
multi-subystem related.

The net part is done, I also asnwered the comments from sashiko but still
waiting a slot for maintainers to check.

I understand there is no rush but it's also true that it's getting
problematic to carry this part in this series (at least for me)

So if we can already include the mfd driver and related DT it might be
ideal.

-- 
	Ansuel
