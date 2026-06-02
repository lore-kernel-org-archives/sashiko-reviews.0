Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8FA38E8A2
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388119; cv=none; b=lwPoY4lEeVr43g7n4HhciHZK+g01L6G2FWcTexCW84oYZZIzQiv5lyJHm5sszwNmn/2SDgOyu4auAUMt6KRn/9gUNtRZWOnNsjUn55wygYdukQo5N8oRhDgIiGX//sK+13r7bsZdf3wVicklGw9R767BNR1b7qRD6YhmVFJfMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388119; c=relaxed/simple;
	bh=vaGwUG7gr9h2YOrM5Mtbn+7T9ugZo8gjzRulD7csVD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n10szS20PwOrTcJAY2NU8CwUmg/OzY2OwFZSkvAJAxvanTsrc9gF1dlbquq9WBGb3i2OPq6Sa/DFLeg77RFc6U69OT5r01G/lanaYuIvIQqM0EiTv2VUcqQoDcCq+ID5esTtAQYuMdRI0lBHV0QBQxeEjFWBRpfF5mDYCz2suWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFtvBwiV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFtvBwiV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2098097f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388116; x=1780992916; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0tri8tCsiy74EQNFulBrakDi/+0isJeRmm5jzNUg/I=;
        b=XFtvBwiV6+UtAwIUDIUq8UyifDn+o3jwBP1UJAEAigGvTeI4y2E3N6i6aostY2h/wo
         lpehsde0EDQXBM87CYtMjq3tXJKIhVis2/abnAk5CFCv9/YfEsfI1dq/xzEInRFGo+zN
         lgUUeYeoHaY4Hgk0M25AkRnlzY4qIQGxWfjpHPJKQsBX7ZPVRtsMU1NZnHThbMXziimy
         gjWKuFGBDswl9O3ZYWrn14tKIcuwJTrtH65xAsCphf/zTHbppFkzbrDlWdVFGHq2ARnL
         Gyfe8hNOBTjHaa7QKbcbvvu5UyjyLydToBBEGgUQlLt3wPAOrTSEbDTBxn5ti8q2TBMv
         c0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388116; x=1780992916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0tri8tCsiy74EQNFulBrakDi/+0isJeRmm5jzNUg/I=;
        b=Hb1jKPFIiPp8Mc2PENClUyT8zGEEkgtRwWPCPMInv8uEajyhk0huifAIiaxl3gUdv2
         w4EtXCeSgsQRK5hWRu780p8wLo2x1zFGSaBXGDm0XDDyC2qgnl7u9U+EyJ7g7jEn5fRw
         9iQlhErFMCqcYclCZLODeD08lw17V7qMstlM1iiCSfGE4hK2spVZd7UaS6jkmLEkMDM6
         R8mo6RVmfp/shhjSpHA6FITW+JHELT22b3f+g1shZnwUU3tGLyvdW/jNwZUE9TU5rz/k
         R8t7eS8GTewc7+jEPpOpTf3DqdSD0SlOzjxT0sBzy45Brd5hos2eHftjyiIyFgG40BDB
         X9uA==
X-Gm-Message-State: AOJu0Ywpf5tg0OoFOuV8i8WFe0noIUS69srpUwYr6zU/lFGL9v0DE+kl
	SSiltsGXg4Yt9uVVw9tYhVPo6diihXGQyWPkXKi2F+1e0dx1t39JlgThMCItP/4E
X-Gm-Gg: Acq92OHYtmLFIbI+UKaGL5QZvwtVn5ekCseM5w2VhEEJ5oJwXhSZhT8AonJk9tp7Lyt
	R4blgUGa6Gu/EtW9Q5UW21hAc39CFoHFQ1CUA471oLyDhuXFR3RvZUVVg/rS9SjZ8LFMtIKWLYw
	QTPKRqUmMrLtGTL7GwWrvNFytl2tIsEDv2z0Q5wKa87rIL8fRDaIAW17OHMZBDtlvzTmfn5NSF8
	qZY9mPw8ZmwzEBiE8D89C45tcSdRCp1JFLiQZqwju5PbqWu4bXvx5JCjCR49SM0Pyj7caiVSuZd
	7JyLp4PvyAbdZzAu95QHmzl/3KOIEbMtEpwr217sODaQ8cJ3Vvz3IZzf3yCnCDH9Q/w8N4lX7nY
	qTwte/jyMhLEG+e2pROS0Uz0xZ2fQ3C42VKosZxoaySzMaCr/2bPJaidyqHQdaUTi3FKU5s7Po/
	V4oWGdfODYdBfukQiws6MMUYtK30CatA4=
X-Received: by 2002:a5d:5cce:0:b0:441:1cf9:4f06 with SMTP id ffacd0b85a97d-45ef6b8c844mr20729418f8f.31.1780388115957;
        Tue, 02 Jun 2026 01:15:15 -0700 (PDT)
Received: from legfed1 ([2a00:79c0:606:f600:1ebe:eb51:3a97:3b47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a065esm32352694f8f.5.2026.06.02.01.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:15:15 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:15:13 +0200
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>,
	olteanv@gmail.com, krzk+dt@kernel.org, vkoul@kernel.org,
	linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/2] phy: add basic support for NXPs TJA1145 CAN
 transceiver
Message-ID: <20260602081513.GA227859@legfed1>
References: <20260513-tja1145-support-v5-2-38720a7ee63e@liebherr.com>
 <20260514054447.A59AFC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514054447.A59AFC2BCB7@smtp.kernel.org>

Am Thu, May 14, 2026 at 05:44:47AM +0000 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The driver fails to enable the hardware power supplies (`vcc-supply`, `vio-supply`, `vbat-supply`) before communicating with the device.
> - [High] The driver does not observe the required mode transition delay when powering on the PHY.
> - [Medium] Missing rollback to standby mode in the error path of `tja1145_phy_power_on`.
> --
> 
> commit 288134e179992cb2e690ff7a97502e72f04e9d5a
> Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
> 
> phy: add basic support for NXPs TJA1145 CAN transceiver
> 
> This commit adds basic driver support for the NXP TJA1145 CAN transceiver.
> It implements the PHY operations to bring the hardware up and down by
> switching between normal and standby modes using SPI commands.
> 
> > diff --git a/drivers/phy/phy-nxp-tja1145.c b/drivers/phy/phy-nxp-tja1145.c
> > new file mode 100644
> > index 0000000000000..1e8bd169743ab
> > --- /dev/null
> > +++ b/drivers/phy/phy-nxp-tja1145.c
> 
> [ ... ]
> 
> > +static int tja1145_phy_power_on(struct phy *phy)
> > +{
> > +	struct regmap *map = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	/*
> > +	 * Switch operating mode to normal which is the active operating mode.
> > +	 * In this mode, the device is fully operational.
> > +	 */
> > +	ret = regmap_update_bits(map, TJA1145_MODE_CTRL, TJA1145_MODE_CTRL_MC,
> > +				 TJA1145_MODE_CTRL_NORMAL);
> > +	if (ret)
> > +		return ret;
> 
> According to the hardware datasheet, transitioning the transceiver to normal
> mode can take up to 40 us. Does this sequence need a hardware transition
> delay before sending the active mode command?
>
Cannot find anything related in the datasheet.

> With a fast SPI bus, the next command might arrive before the hardware state
> machine finishes transitioning, which could cause the active mode command to
> be ignored.
> 
> > +
> > +	/*
> > +	 * Switch to CAN operating mode active where the PHY can transmit and
> > +	 * receive data.
> > +	 */
> > +	return regmap_update_bits(map, TJA1145_CAN_CTRL, TJA1145_CAN_CTRL_CMC,
> > +				  TJA1145_CAN_CTRL_ACTIVE);
> 
> If this second regmap_update_bits() fails, the function returns an error
> without reverting the device to standby mode.
> 
Don't see a second regmap_update_bits().

> Since the PHY framework keeps the power_count at 0 on an error return,
> phy_power_off() will not be called during shutdown or suspend. Could this
> leave the hardware permanently stuck in normal mode, drawing power
> unintentionally?
> 
> > +}
> 
> [ ... ]
> 
> > +static int tja1145_probe(struct spi_device *spi)
> > +{
> > +	struct phy_provider *phy_provider;
> > +	struct device *dev = &spi->dev;
> > +	struct regmap *map;
> > +	struct phy *phy;
> > +	int ret;
> > +
> > +	map = devm_regmap_init_spi(spi, &tja1145_regmap_config);
> > +	if (IS_ERR(map))
> > +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
> > +
> > +	ret = tja1145_check_ident(dev, map);
> 
> Will this fail to communicate with the hardware on platforms where power
> supplies are dynamically controlled?
>

Yes, but dyamically controlled power supplies are not implemented yet.
Support has to wait until there is need for it.

> The device tree binding defines vcc-supply, vio-supply, and vbat-supply as
> power sources, but they do not appear to be requested or enabled in this
> function before tja1145_check_ident() is called.
> 
> This might leave the PHY unpowered, causing the SPI read to return garbage
> data and fail the probe with -ENODEV.
> 
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to identify device\n");
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-tja1145-support-v5-0-38720a7ee63e@liebherr.com?part=2
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
