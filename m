Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288217;
	b=e3a3Nq5Ud2XftqtpICQl5rMnNkuQtT6A06t6uzQt0ERrQhV+fAU4n4CLRI8OieoOU8NN
	 kG1ymoZC2KfsrCo3JKm/ZiCdYIlEbN28N2BAg9VU8xgUvyeFZrwN7td9Yf/fjIrpvGiUQ
	 vd58am9JFwFiEe+tY99e4J2r3C00MHG/qy7pRlCVwWB/cuCbYEaCg8Hw3Tth9uj3HTdcn
	 n9miKm3t5vGroy3r27FNZOJp7PkuORxPfNEElRlCHUMpEJisw4Mt8aNWMcsjzFCw8VdGW
	 uzFvt5jK+Ela0/uhrL8aikeHx07TL0zJxQq1MU6Qgm52G1UTVOhWeejnTSBbJWe+37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288217;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mUUS34uZWnEY96z4Lqu7qa+dFbeTo5NjdrgLwu4TMy4=;
	b=jFL/fbWx8VHocez1k3ugjGLfBGje/VuY0LzlYVdOTb2sxg1BI6d0XUnWiv2Fpye/l2un
	 M+a9VEDcHtd5ROueM8veCFq1pC36gAlpQcgsepnZzE6zSx5uHP1ZrwaHQRtuX6J1I7AXQ
	 bvVQqX90/uYrTrmpAGHFYtIxPqyscmXQzK4uG1mhnUdLOmp0NVwbMUZ1BNzqUJ2twu+qI
	 M3rSZ3ExT6MeyN+7RybqdG8Of1MIPTL/6ko0GWKKAqGHatLd7t3xoUvxI4rqu4O6+Laz6
	 0FiTKhkrfFhQRSU06mdSKrhHgb9F0aZfLi/k6g1O7cb8L5KA1lJnyiIa9ZI+D+O8PDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=RohhYpvv;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881E606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 19:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6881E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=RohhYpvv
Message-ID: <a2a8fefd-b589-444d-96a4-f679ab5c9946@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795288214;
	bh=8y0heA0u3ZMdaEjr38+zX0yS05Hb8knX6np75X1lRvU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=RohhYpvv9RadrymbNJo6Qxw+FczCEVwhco12YIXZkMV3lPg5fzO2zo8xhxGf+YPsD
	 OVUJwSqBXpMk+DJZTvezI3yDG+W4zcaQbOI0m6LaftP/AwT7sjS+HKkUWWsndd05W9
	 ZPViQuLSAYZQQ4+ajv7Y3Go0Rxh0X778e6B6n5so=
Date: Sat, 21 Nov 2026 20:10:13 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 08/11] drm/meson: dw-hdmi: Use the generic PHY
 framework for the HDMI TX PHY
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
 <20261120-meson-drm-create-hdmitx-phy-v2-8-93d622d9bb07@aliel.fr>
 <sashiko-outbox-225914@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-225914@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 20:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] drm/meson: dw-hdmi: missing PHY init in meson_dw_hdmi_init()
>   breaks CEC/ARC
> - [Medium] drm/meson: dw-hdmi: phy_init() leak on error path in
>   dw_hdmi_phy_init()
> --
> 
> commit 9c4e52bbd305f6371ee6545c479c9a84e6845324
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY
> 
> This commit converts the Meson DW-HDMI driver from direct HHI register
> programming to the generic PHY API, with a legacy fallback when the DT
> node lacks a "phys" property.
> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 20a821936b3af..1ca1ce6173563 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> [ ... ]
>> @@ -364,10 +276,18 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>>  	unsigned int wr_clk =
>>  		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
>>  	bool mode_is_420 = false;
>> +	unsigned int pixel_clock = mode->clock;
>> +	union phy_configure_opts opts = {};
>> +	int ret;
>>  
>>  	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
>>  			 mode->clock > 340000 ? 40 : 10);
>>  
>> +	/* Setup PHY */
>> +	ret = phy_init(dw_hdmi->phy);
>> +	if (ret)
>> +		return ret;
>> +
>>  	if (drm_mode_is_420_only(display, mode) ||
>>  	    (!is_hdmi2_sink && drm_mode_is_420_also(display, mode)) ||
>>  	    dw_hdmi_bus_fmt_is_420(hdmi))
>> @@ -392,19 +312,22 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>>  	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x2);
>>  
>>  	/* Setup PHY parameters */
>> -	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
>> -
>> -	/* Disable clock, fifo, fifo_wr */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
>> +	if (mode_is_420)
>> +		pixel_clock /= 2;
>> +	opts.hdmi.tmds_char_rate = (u64)pixel_clock * 1000;
>> +	opts.hdmi.bpc = 8;
>> +	ret = phy_configure(dw_hdmi->phy, &opts);
>> +	if (ret)
>> +		return ret;
>>  
>>  	dw_hdmi_set_high_tmds_clock_ratio(hdmi, display);
>>  
>>  	msleep(100);
>>  
>>  	/* Reset PHY 3 times in a row */
>> -	meson_dw_hdmi_phy_reset(dw_hdmi);
>> -	meson_dw_hdmi_phy_reset(dw_hdmi);
>> -	meson_dw_hdmi_phy_reset(dw_hdmi);
>> +	ret = phy_power_on(dw_hdmi->phy);
>> +	if (ret)
>> +		return ret;
> 
> [Severity: Medium]
> Do the error returns from phy_configure() and phy_power_on() leak a
> dw_hdmi->phy->init_count reference?
> 
> When dw_hdmi_phy_init() fails, dw_hdmi_setup() leaves hdmi->phy.enabled
> false, so dw_hdmi_poweroff() never calls dw_hdmi_phy_disable() to balance
> phy_init() with phy_exit().  A non-VIC DMT mode with a pixel clock below
> 25.175 MHz passes meson_encoder_hdmi_mode_valid() but is rejected with
> -EINVAL by meson_hdmi_phy_configure() -> meson_hdmi_phy_find_rate(),
> permanently elevating init_count so subsequent phy_init() calls skip
> hardware initialization.
> 
> [ ... ]
> 
>> @@ -623,10 +542,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>  	/* Enable normal output to PHY */
>>  	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>>  
>> -	/* Setup PHY */
>> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
>> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
>> -
>>  	/* Enable HDMI-TX Interrupt */
>>  	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
>>  				       HDMITX_TOP_INTR_CORE);
> 
> [Severity: High]
> Does removing the initial PHY setup from meson_dw_hdmi_init() leave the
> HDMI TX PHY uninitialized whenever no HDMI video mode is active?
> 
> meson_dw_hdmi_init() pulses reset_control_reset(meson_dw_hdmi->hdmitx_phy)
> at bind and system resume time, while meson_venc_init() zeroes
> HHI_HDMI_PHY_CNTL0.  Commits 04703bfd7f99 ("drm/meson: dw-hdmi: power up
> phy on device init") and 08001033121d ("drm/meson: dw-hdmi: add bandgap
> setting for g12") programmed HHI_HDMI_PHY_CNTL1 and HHI_HDMI_PHY_CNTL0
> here because CEC and the G12A ARC/eARC utility pin need the PHY
> initialized even before the first HDMI modeset or when another display
> interface is used.
> 
> With phy_init() deferred to dw_hdmi_phy_init(), which dw_hdmi_setup() only
> calls when enabling an active HDMI display mode (and which
> meson_dw_hdmi_pm_resume() -> dw_hdmi_resume() does not call), the PHY
> stays in its post-reset state at boot and after resume whenever HDMI
> video is inactive.
> 

I will use v1 code and add a device link to solve suspend/resume order.

-- 
Best regards,
Ronald
