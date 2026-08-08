Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6111033F8BE
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786182516; cv=none; b=mpzU3hbr6k0bnybpBxWHqCRiF9CMZCO7P3sumiJ2Kz0+NWNdZ+bK1uy+IpTIVyMTmHHownv8ZcmbbBj0RwBqoX/d/NoSD5+OrwiO0a72xl3nVVaCZburt2vwt3j1Jix81AmRAncCOLBB5DMwStPJLv6TBfom+JiQTdg7NNZNjKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786182516; c=relaxed/simple;
	bh=1WlIKANitIt6BxCAY90/+DfpQY23q0YzpILseKP9rPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URXomTwLhufhm2Xab5lrXOC8R0fsYRI7jrCZiNUJB0O5KrnOfHgnV5ir3a/41JYIOQ7iurxZGCmm8U6uc2pM43iIAa4GvNrbj2nEVD1YOpjbnJEyMhltYpui15rjlLIDVQU6dZLQ7BBm2H69hWA4o69scMkL0i3l70a4A48O6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBza9/gx; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBza9/gx"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so142143a91.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182514; x=1786787314; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuX8DvPqFSCV/Qm9OlvDCFJ10OiDMwD+oDVvHWCPJn0=;
        b=IBza9/gxIlSByd7hPnlggpSjmwaQ9mvFkfT0t0+jmjPMg86yOhAzb2y/qoodJvujLa
         QnHauVjuRpl11WkIppIl+MQnOt79n6YRRsPkbX8Xg5bTy5CvwFQ8/Vb7kmcawWmuOhC9
         urQtvqkiuN7DklWehlY8cQR28axWtyQpp9Z6KNYMxOshrMZTAi2Imxd8KDvKn5igj3M3
         X2Hkuauq93RQe0gKFYFWiyqKcx4kOw5d9s7bDQYFdXrvfjDwT8Jc61qyyJcsNL10eL9Q
         G1TQvJJfRUqIIZPjdL1lOxHPiv6KdZgaRhOjBHM1MG0j2kVgvpFEXl1p9VQas123w8DL
         oQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182514; x=1786787314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuX8DvPqFSCV/Qm9OlvDCFJ10OiDMwD+oDVvHWCPJn0=;
        b=fn5bxzNfNJaBjThZtolXss2A71xMvOBnhHUVkkVhMpChrQ8iRvujcYeRhr2iX8m3N6
         3RY8A7QzJbACvE2VU2uLNtdx/Gis1znBS1+m4FJYmA7nh+OmnHZ1kQ5fqnVSxjwFLSkV
         ED9J4OiQH1+vq0eIdnpATYTE3es82gtaU6w6da8QuJF1hKNmQCPogOHvVc8h+D17VhrI
         RxVIv6NWf56EAf4PvP8tg44tUivBWkg/u8EYDaR6+ZMIm6j6U7i1zekQS/3V12IV/rCA
         OVaf/1zoWsnR+z4FNZGjzQE6qzM4Dg6vB58l0yYbnyjp8G20fKTJZfGiX7UBzqc8M0h/
         hx3w==
X-Gm-Message-State: AOJu0YykdNGVJyHA5ddYGP44M39CX0FqE5RNvqnLZLyZKCbyPFlbHMk7
	8BSi5Kgd0WZ/0GABts14ExyoZ95+qgaoX3Hr8ImDWGapLNRA6rHVP6YrlNC2oV1v9AA8yQCj
X-Gm-Gg: AR+sD13IDgSYh7XDgdHS0NiYqX6BFEqR7FtWX3XNmA/EkhEusif8vgJu08OxGGwGGyT
	+ZJwMFWfzsM0g5TYRXmsP2HAYubOBlTBa2y+sr3B5Ltyq0TReLyuDsnf7Ab/FtE2QQNJCV1K0iW
	ACb5qeJYJQfgkF2nqdB9sA4xFwQsW0Vh1qaJRSEvQtGkswJRjYvLn32rrqUU8ROfWqCzt8A7kCk
	+XIbs+HPdlF2QghLvxRliPwJEaivqdWIpVheBks0QJ/PP4uuZsc70Sqb0iMedWANblglIRzwuTS
	FMv1yfMwfA4sXnQU+4QW9nzJPTUblpacYxn09KQvVTpnIj9UwK1RFu9l7TQ69KTkA9PotML5JbS
	LU6zHYxsUrUXD2AMB4axMkH6l+XfTfNmpbzLHgumLf4Mt77AI0wTvUSaqyNtd9MKqI9UZSMlIKT
	uZ2fXUgKd2DPMpLT4FoU7xLsb5xumevKeKal5l/hAu0qokmEkTWQ==
X-Received: by 2002:a17:90b:4b91:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3909d7a4839mr13994758a91.1.1786182513598;
        Sat, 08 Aug 2026 02:48:33 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b13b0c74sm2266456a91.0.2026.08.08.02.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:48:33 -0700 (PDT)
Date: Sat, 8 Aug 2026 17:48:28 +0800
From: Cody Kang <codykang.hk@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, vkoul@kernel.org, 
	linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, 
	devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
Message-ID: <gsv53gzsbs4selyf5ws3f77ff7odhf6xsbf62qb6tcftns7ibc@dpop7iwzwvzb>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
 <20260725050254.9F7091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725050254.9F7091F000E9@smtp.kernel.org>

On Sat, Jul 25, 2026 at 05:02:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] PHY provider is registered before probe finishes, exposing it to early concurrent access and potential Use-After-Free (UAF) on probe failure.
> - [High] Lack of driver-level synchronization between CCF and PHY frameworks leads to concurrent hardware state corruption.
> - [Medium] The MPLL (main link PLL) is powered on during PHY initialization but is never powered off in the power down sequence.
> - [Medium] Missing hardware state cleanup on error paths in `k3_inno_dp_phy_power_on` leaves the PHY powered on.
> - [Medium] Rate configuration functions unconditionally power on the PLLs, overriding the logical PHY power state.
> - [Medium] PLL programming functions do not poll for hardware lock before proceeding.
> --
> 
> --- Patch [5]: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY driver ---
> commit 31db74eae7dc59ddc61373dbe3e2c6c1e6966ccd
> Author: Cody Kang <codykang.hk@gmail.com>
> Subject: phy: spacemit: add Innosilicon DP TX PHY driver
> 
> This commit introduces the SpacemiT K3 Innosilicon DisplayPort PHY driver.
> It integrates the PHY as a child of the DP controller, registering a PHY
> provider and exposing the pixel PLL as a clock provider.
> 
> > diff --git a/drivers/phy/spacemit/phy-k3-inno-dp.c b/drivers/phy/spacemit/phy-k3-inno-dp.c
> > new file mode 100644
> > index 0000000000000..9dd62edb7a5af
> > --- /dev/null
> > +++ b/drivers/phy/spacemit/phy-k3-inno-dp.c
> > @@ -0,0 +1,948 @@
> 
> [ ... ]
> 
> > +static int k3_inno_dp_phy_power_on(struct phy *phy)
> > +{
> > +	struct k3_inno_dp_phy *p = phy_get_drvdata(phy);
> > +	u32 lane_en;
> > +	u32 val;
> > +	int ret;
> 
> [ ... ]
> 
> > +	ret = regmap_read_poll_timeout(p->regmap, DPTX_ANA_MPLL, val,
> > +				       val & DPTX_ANA_MPLL_LOCKED,
> > +				       2000, 10 * 1000);
> > +	if (ret) {
> > +		dev_err(p->dev, "DP PHY core PLL lock timed out\n");
> > +		return ret;
> > +	}
> 
> [Severity: Medium]
> If the MPLL or PREPLL fails to lock within 10ms, this immediately returns an
> error without restoring the power down bits or XMIT_EN.
> 
> Since the generic PHY framework does not automatically call phy_power_off()
> when phy_power_on() fails, could this leave the hardware running in an
> inconsistent state and leak power?

Real; will fix in v2: the lock-timeout paths will park the lanes
and the pixel PLL, the same set power_off parks.

> 
> > +
> > +	ret = regmap_read_poll_timeout(p->regmap, DPTX_ANA_PREPLL, val,
> > +				       val & DPTX_ANA_PREPLL_LOCKED,
> > +				       2000, 10 * 1000);
> > +	if (ret)
> > +		dev_err(p->dev, "DP PHY pixel PLL lock timed out\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int k3_inno_dp_phy_power_off(struct phy *phy)
> > +{
> > +	struct k3_inno_dp_phy *p = phy_get_drvdata(phy);
> > +
> > +	regmap_write_bits(p->regmap, DPTX_PHY_CTRL, DPTX_PHY_CTRL_XMIT_EN, 0);
> > +	usleep_range(2000, 4000);
> > +
> > +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL, DPTX_ANA_PREPLL_PD,
> > +			  DPTX_ANA_PREPLL_PD);
> > +	usleep_range(2000, 4000);
> > +
> > +	return 0;
> > +}
> 
> [Severity: Medium]
> Does this power down sequence omit the MPLL?
> 
> The k3_inno_dp_phy_power_on() function powers up the MPLL by clearing
> DPTX_ANA_MPLL_PD, but this power_off function does not appear to re-assert
> it. Could this leave the main link PLL running indefinitely when the DP
> controller is suspended or torn down?

Intentional, and it took a board round to prove it: the MPLL also
feeds the 16 MHz AUX reference, and the controller parks the PHY
through power_off on every link drop while AUX still has to serve
EDID, DPCD and panel detection. Parking the MPLL here kills AUX
from bind onward. Will add a comment in v2 saying so.

> 
> [ ... ]
> 
> > +static void k3_inno_dp_phy_program_mpll(struct k3_inno_dp_phy *p,
> > +					const struct k3_inno_dp_mpll_cfg *cfg)
> > +{
> > +	struct regmap *rm = p->regmap;
> 
> [ ... ]
> 
> > +	regmap_write_bits(rm, DPTX_ANA_PREPLL_CTRL, DPTX_ANA_PREPLL_LOCK_BYPEN,
> > +		FIELD_PREP(DPTX_ANA_PREPLL_LOCK_BYPEN, 1));
> > +
> > +	regmap_write_bits(rm, DPTX_ANA_MPLL, DPTX_ANA_MPLL_PD,
> > +		FIELD_PREP(DPTX_ANA_MPLL_PD, 0));
> 
> [Severity: Medium]
> Does unconditionally writing 0 to DPTX_ANA_MPLL_PD override the logical
> power state of the PHY?
> 
> If a DRM driver configures the link rate (calling phy_configure()) while the
> PHY is logically powered off, this will force the PLL to run and
> desynchronize the hardware from the PHY framework's power state.

Not reachable: the PHY has a single consumer, the parent DP
controller, and it only configures rates from the enable path,
never while the PHY is logically off.

> 
> > +	usleep_range(2000, 4000);
> > +}
> 
> [Severity: Medium]
> Is it safe to rely on a fixed 2-4ms sleep here instead of polling
> DPTX_ANA_MPLL_LOCKED?
> 
> The power_on() function polls the locked bit for up to 10ms. A fixed delay
> here might proceed with an unstable clock if the hardware takes longer to
> lock, potentially causing display failures or link training issues.

power_on polls both PLL lock bits after programming; that is the
lock gate for the whole bring-up sequence.

> 
> [ ... ]
> 
> > +static void k3_inno_dp_program_prepll(struct k3_inno_dp_phy *p,
> > +				      const struct k3_inno_dp_prepll_cfg *cfg)
> > +{
> > +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL, DPTX_ANA_PREPLL_PD,
> > +		FIELD_PREP(DPTX_ANA_PREPLL_PD, 1));
> > +	usleep_range(2000, 4000);
> 
> [Severity: High]
> Is a driver-level lock needed to synchronize access to the PHY registers
> between the CCF and PHY frameworks?
> 
> Since this driver exposes both a clock (via CCF) and a PHY that share the
> same hardware registers, concurrent calls to clk_set_rate() and
> phy_power_on() can interleave.
> 
> If clk_set_rate() begins this multi-step programming sequence, a concurrent
> phy_power_on() could clear the PD bit while the clock is still being
> configured, corrupting the hardware state.

No concurrent callers exist: the single consumer serializes all
clk_set_rate() and phy_power_on/off() calls through its own
modeset path.

> 
> [ ... ]
> 
> > +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL,
> > +		DPTX_ANA_PREPLL_PCLK_NORMAL,
> > +		FIELD_PREP(DPTX_ANA_PREPLL_PCLK_NORMAL, 1));
> > +	usleep_range(2000, 4000);
> > +
> > +	regmap_write_bits(p->regmap, DPTX_ANA_PREPLL, DPTX_ANA_PREPLL_PD,
> > +		FIELD_PREP(DPTX_ANA_PREPLL_PD, 0));
> 
> [Severity: Medium]
> Similar to the MPLL configuration, does unconditionally clearing
> DPTX_ANA_PREPLL_PD here override the PHY power state if the clock rate is
> set while the PHY is logically off?

Same as the MPLL case above: rates are only set from the enable
path.

> 
> > +	usleep_range(2000, 4000);
> > +}
> 
> [Severity: Medium]
> Is it safe to rely on a fixed delay here instead of polling the
> DPTX_ANA_PREPLL_LOCKED bit, which could lead to proceeding with an unstable
> pixel clock?

Same: power_on polls DPTX_ANA_PREPLL_LOCKED before the sequence
completes.

> 
> [ ... ]
> 
> > +static int k3_inno_dp_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct k3_inno_dp_phy *p;
> > +	struct phy_provider *provider;
> > +	struct clk_init_data init = {};
> > +	int ret;
> 
> [ ... ]
> 
> > +	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > +	if (IS_ERR(provider))
> > +		return dev_err_probe(dev, PTR_ERR(provider),
> > +				     "failed to register PHY provider\n");
> > +
> > +	/* PHY takes a 24 MHz reference clock */
> > +	p->ref_clk_khz = 24000;
> > +
> > +	/* The APMU pixel-clock mux references this clock by name. */
> > +	of_property_read_string(dev->of_node, "clock-output-names", &init.name);
> > +	if (!init.name)
> > +		init.name = dev_name(dev);
> > +	init.ops = &k3_inno_dp_pxclk_ops;
> > +	init.parent_names = NULL;
> > +	init.num_parents = 0;
> > +	init.flags = 0;
> > +	p->pxclk_hw.init = &init;
> > +
> > +	ret = devm_clk_hw_register(dev, &p->pxclk_hw);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to register pixel clock\n");
> 
> [Severity: High]
> Can the PHY provider be accessed by consumers before probe completes
> successfully?
> 
> The PHY provider is registered via devm_of_phy_provider_register() before
> the pixel clock is registered. If devm_clk_hw_register() fails, probe will
> return an error and devres will free the driver context struct.
> 
> If a consumer driver acquires a reference to the PHY during this race
> window, it could retain the reference after probe fails, leading to a
> use-after-free when it attempts PHY operations on the freed pointer.

Taken: will register the PHY and clock providers last in probe
in v2.

Cody

