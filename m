Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABB3F4114
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692522; cv=none; b=iLy/Q0liN/f63JsiGZVtO3OuAZSoE7JemkDdNLOhlKDQYKWjWNwVCo46sVEjzbJMocxKNr6foiB4IkVx/Zm8E0OUzQPJL7YTpB6ZWaaX1oDLq4DNf5g4VPk+GQmdwZOem4Yn+sm6x57tPpvDoe2L8Xlaht7xKY6bnNw6qob2GfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692522; c=relaxed/simple;
	bh=ETtkUcliRC63eAZF9QVpf4cgvbdnySylqjotlgZBxLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vocx19AI/+dr9APyYNoHeiQAPfwX9/3RkHcwtESWiAW3bIdm2H1TX9QVEcX9fV4WC98xt1Itoi72HyNQGa4zLXiVK9+ITaWHlpdmqoFuuKZTP+yxOZJZSPl8kwt0PxwK+yVihGRZihof5p6ahZO+iVAcirAxrI9jgLOuZtipnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IpGq2UHU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IpGq2UHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778692514;
	bh=ETtkUcliRC63eAZF9QVpf4cgvbdnySylqjotlgZBxLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IpGq2UHU2xAXLTnRRocGEMC4d9zoyp/3sljXKeqDvw7n4b+VABCp8gB94eYWQ2Ddr
	 hOy80EZoPiRO/FNbjV0dxPvQ0RmwAw1Np4ts1FJkR+Kx/39B9Sg9Qk8NiKyi2zsKnr
	 1nRftPbSKYV55MU+UnK6iVTWgaXH627pfaLPXjsJk72DvohPXZbfcvhdELO3aPAZuE
	 8VXXPBk5eCIiAEDfQXoecQ8Wj6Urcm5L1/gY1ZM03Z3yJlXM+6ZvbDUsHzLi+74xGr
	 aXf1BfIQk8y/UcFOzN4d4ketlMa1ehoBejhAlL6DHtqVzv8shdDnHV1ZACIvGxpwcl
	 ZMQz3qn1ZV6Eg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5500017E04F2;
	Wed, 13 May 2026 19:15:14 +0200 (CEST)
Message-ID: <2e54875b-e31c-4e03-b377-026580ceb1b9@collabora.com>
Date: Wed, 13 May 2026 20:15:13 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org
References: <20260511-hdptx-clk-fixes-v2-2-664e41379cab@collabora.com>
 <20260512235710.A6AC1C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260512235710.A6AC1C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/26 2:57 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Abuse of CCF determine_rate corrupts the clock tree rate cache.
> - [High] Ignored return value in clk_ops.prepare masks hardware initialization failures.
> - [High] Missing mutual exclusion between CCF and PHY frameworks causes concurrent hardware corruption.
> - [High] Unbalanced PHY usage count on lane mode configuration failure in rk_hdptx_phy_power_on.
> --
> 
> commit 53b6461d3d35f9f83438d0a57cf5379f7c1fcba8
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
> 
> Any changes to the PHY link rate and/or color depth done via the HDMI
> PHY configuration API are not immediately programmed into the hardware,
> but are delayed until the PHY usage count gets incremented from 0 to 1,
> that is when it is powered on or when the PLL clock exposed through
> the CCF API is prepared, whichever comes first.
> 
> [ ... ]
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 7fb1c22318bbf..12c259d9544cf 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -1347,25 +1354,22 @@ static int rk_hdptx_phy_consumer_get(struct rk_hdptx_phy *hdptx)
>>  		return 0;
>>  
>>  	ret = regmap_read(hdptx->grf, GRF_HDPTX_STATUS, &status);
>> -	if (ret)
>> -		goto dec_usage;
>> -
>> -	if (status & HDPTX_O_PLL_LOCK_DONE)
>> -		dev_warn(hdptx->dev, "PLL locked by unknown consumer!\n");
>> +	if (ret) {
>> +		atomic_dec(&hdptx->usage_count);
>> +		return ret;
>> +	}
>>  
>>  	if (mode == PHY_MODE_DP) {
>>  		rk_hdptx_dp_reset(hdptx);
>>  	} else {
>> -		ret = rk_hdptx_pll_cmn_config(hdptx);
>> -		if (ret)
>> -			goto dec_usage;
>> +		/*
>> +		 * Ignore PLL config errors at this point as pll_config_dirty
>> +		 * was not reset and, therefore, operation will be retried.
>> +		 */
>> +		rk_hdptx_pll_cmn_config(hdptx);
>>  	}
>>  
>>  	return 0;
> 
> Does dropping the return value of rk_hdptx_pll_cmn_config() mask hardware
> initialization failures?

No, it's done on purpose, per the comment above (the error is not critical at
this point and we don't want to bail out too early).

> 
> If pll_config_dirty is false (for example, the clock was previously prepared
> and unprepared), a subsequent failure won't be retried later.

The retry is done either by rk_hdptx_phy_clk_set_rate() or
rk_hdptx_phy_power_on(), whichever comes first.

> 
> Also, if a caller invokes clk_prepare_enable() but not clk_set_rate() or
> phy_power_on(), will the hardware remain unconfigured while CCF incorrectly
> assumes the clock is running?

That's not a valid usecase, the hardware will be eventually programmed by one of
the two functions above - the clock provider is dependent on the PHY
configuration, which may happen after clk_prepare_enable().

> 
>> @@ -1700,16 +1704,20 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>>  		if (ret)
>>  			rk_hdptx_phy_consumer_put(hdptx, true);
>>  	} else {
>> -		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
>> -			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
>> +		if (hdptx->pll_config_dirty)
>> +			ret = rk_hdptx_pll_cmn_config(hdptx);
>>  
>> -		if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
>> -			ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
>> -		else
>> -			ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>> +		if (!ret) {
>> +			regmap_write(hdptx->grf, GRF_HDPTX_CON0,
>> +				     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
>>  
>> -		if (ret)
>> +			if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
>> +				ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
>> +			else
>> +				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>> +		} else {
>>  			rk_hdptx_phy_consumer_put(hdptx, true);
>> +		}
>>  	}
> 
> If rk_hdptx_tmds_ropll_mode_config() or rk_hdptx_frl_lcpll_mode_config()
> fails, ret is set but the else block is never executed. Does this leave
> usage_count unbalanced and prevent the PHY from being powered down? I noted
> this was addressed later in the series by commit "phy: rockchip:
> samsung-hdptx: Drop TMDS rate setup workaround", but wanted to point it out.

If rk_hdptx_pll_cmn_config() above succeeds, it's very unlikely any of the
*_mode_config() calls fails. The indicated commit does indeed eliminate this
theoretical issue - I can still handle it in this patch if a new revision is
required.

> 
> Also, does this logic introduce a race condition between CCF (clk_prepare)
> and the PHY framework (phy_power_on)? The usage_count is atomic, but there
> appears to be no mutual exclusion for the hardware configuration itself.
> 
> If Thread A calls clk_prepare() and increments the count to 1, it starts the
> lengthy rk_hdptx_pll_cmn_config() hardware sequence.
> 
> If Thread B calls phy_power_on() concurrently and increments the count to 2,
> it returns immediately from rk_hdptx_phy_consumer_get(). Thread B will then
> evaluate hdptx->pll_config_dirty, see it is still true, and concurrently
> execute rk_hdptx_pll_cmn_config() while Thread A is already modifying the
> same registers.

No, that's not a valid usecase - the calls are orchestrated by the DRM subystem,
which guaranties the sequence of operations, e.g. configuring PHY (w/o HW
programming) -> setting clk rate (w/ HW programming) -> powering PHY (w/ HW
progamming).

> 
>> @@ -2303,8 +2314,19 @@ static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
>>  {
>>  	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>>  
>> -	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
>> -		return hdptx->hdmi_cfg.rate;
>> +	/*
>> +	 * Invalidate current clock rate to ensure rk_hdptx_phy_clk_set_rate()
>> +	 * will be invoked to commit PLL configuration.
>> +	 */
>> +	if (hdptx->pll_config_dirty) {
>> +		req->rate = 0;
>> +		return 0;
>> +	}
> 
> Does returning req->rate = 0 here corrupt the clock tree rate cache?
> 
> By returning 0 to bypass CCF's optimization and force set_rate(), the Common
> Clock Framework will cache 0 Hz as the actual hardware rate and propagate it
> downstream. 
> 
> Could this cause downstream consumers (like the VOP2 display clock dclk)
> or rate change notifiers to receive 0 Hz, potentially leading to
> division-by-zero errors or broken pixel clock math?

No, invalidating the CCF rate doesn't have any negative side effect - this is
very short-lived state which ensures a set_rate() call from VOP2 is imminent.
This is really necessary in order to address the usecases described in the
commit message, e.g. pixel clock rate not varying with bpc (from consumer/VOP2
perspective).
