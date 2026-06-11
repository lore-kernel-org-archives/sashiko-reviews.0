Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4768940861F
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187090; cv=none; b=LUK0YqJxbV36oCH9jKAgMk0HVwAxzJW/YSw1GnTh+/IcVYnlZj9cUqAb+83c2MiVTu/lQGs4YdDMT6codbHFBilUG6Rw9RdwmcKyABVkLyAdulJqshL0n7eNYsBLyqKaKDmKAv1SdbJFlQDFICJWNTziSIAess6vBXdtdWlvcgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187090; c=relaxed/simple;
	bh=W7EGVJuT/r3agCU+HVq3EU1ny2saXdSuciAfZkVKCaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i14HINn1yH/CAZpePOKpohOuTGQuP2ZDoqk3QcyAVqhBwhtoNG/yWGwmbeBKQjR648wtySBD0M6ofETux7imI6BfUDAekmL86nPYG7VyMqXgjP+EiiUorlevyGlD7IzJ0EG8QbPY8wOZCCc7xlVPaAZCzw1jwxO999zYE3XZesE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qOmq9GBJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qOmq9GBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781187081;
	bh=W7EGVJuT/r3agCU+HVq3EU1ny2saXdSuciAfZkVKCaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOmq9GBJYbhAAcsggdtw/CtOU7Rsb5WeSSfYg/SRateggR45l6GsRoT++lLB7Ja2P
	 vu5jUNZtSwj6YRdOu3pE4BzhuxVNDNG0dEgWAjuJ+CAIMq7mBixI5K3flc77LYk2SO
	 7CoE7FKFbeSX8HgkefOlbK+eGA5g7MbSXhfwLNz1R5cy9ZlBQmL8QJJo3NYt6pKM6i
	 ssjrqGBvRGB6ARpcHbrnPtAiIoBWqVk72X7vhRgydfEXb2ad0tBPZpIs9HYrtxjA+m
	 3kCqhhkHYcQqTBYxQHV2QFVTXkckvJHh2/2079r7EJvXqQh1KlV9YHrd+htDMPC7JT
	 4DyrGr4coDiAg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C5BC17E03D7;
	Thu, 11 Jun 2026 16:11:21 +0200 (CEST)
Message-ID: <88624071-de6b-4fd1-9984-f79270c2979f@collabora.com>
Date: Thu, 11 Jun 2026 17:11:20 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org,
 linux-phy@lists.infradead.org
References: <20260611-hdptx-clk-fixes-v3-2-67b1b0c00e16@collabora.com>
 <20260611125215.9BE6C1F00898@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260611125215.9BE6C1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

TL;DR: This is similar to the review we got on v2, i.e. no real concerns, the
series can be safely applied.

Regards,
Cristian

On 6/11/26 3:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s)
> to consider: - [High] Ignoring PLL configuration errors in
> `rk_hdptx_phy_consumer_get()` leads to silent hardware failure and violates
> the CCF API contract. --
> 
> commit 6b14268a38889c73eedd6c085d780316eb0e7c3c Author: Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Handle uncommitted PHY config changes
> 
> This commit introduces a pll_config_dirty flag to keep track of uncommitted
> PHY configuration changes. It ensures that changes to the PHY link rate or
> color depth are delayed and properly programmed into the hardware when the PHY
> usage count is incremented.
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c index
>> 710603afff866..5295d5f6f287a 100644 ---
>> a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c +++
>> b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> [ ... ]
>> @@ -1347,25 +1354,22 @@ static int rk_hdptx_phy_consumer_get(struct
>> rk_hdptx_phy *hdptx) return 0;
>>  
>>  	ret = regmap_read(hdptx->grf, GRF_HDPTX_STATUS, &status); -	if (ret)
>>  	-		goto dec_usage; - -	if (status &
>>  	HDPTX_O_PLL_LOCK_DONE) -		dev_warn(hdptx->dev, "PLL locked
>>  	by unknown consumer!\n"); +	if (ret) { +
>>  	atomic_dec(&hdptx->usage_count); +		return ret; +	}
>>  
>>  	if (mode == PHY_MODE_DP) { rk_hdptx_dp_reset(hdptx); } else { -
>>  	ret = rk_hdptx_pll_cmn_config(hdptx); -		if (ret) -
>>  	goto dec_usage; +		/* +		 * Ignore PLL config
>>  	errors at this point as pll_config_dirty +		 * was not reset
>>  	and, therefore, operation will be retried. +		 */ +
>>  	rk_hdptx_pll_cmn_config(hdptx); }
>>  
>>  	return 0;
> 
> [Severity: High] Is it safe to ignore the return value of
> rk_hdptx_pll_cmn_config() here?

Yes, this is done on purpose since the error is not critical at this point and
we don't want to bail out too early. In practice, this shouldn't happen, unless
the hardware is faulty, in which case the kernel is likely to crash before
reaching this.

> 
> If rk_hdptx_pll_cmn_config() fails, we return 0 to the caller. This causes
> clk_prepare() to return success to the Common Clock Framework even though
> the hardware failed to initialize. Does this violate the API contract?
> 
> Also, hdptx->usage_count is left incremented despite the hardware failure.

That's not a valid usecase, the hardware will be eventually programmed by
rk_hdptx_phy_clk_set_rate() or rk_hdptx_phy_power_on(), whichever comes first.
The clock provider is dependent on the PHY configuration, which is expected to
follow clk_prepare_enable().

> 
> [ ... ]
>> @@ -1700,13 +1704,18 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>>  		if (ret)
>>  			rk_hdptx_phy_consumer_put(hdptx, true);
>>  	} else {
>> -		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
>> -			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
>> +		if (hdptx->pll_config_dirty)
>> +			ret = rk_hdptx_pll_cmn_config(hdptx);
> 
> [Severity: High]
> Will this retry block actually execute if pll_config_dirty was already false?
> 
> If the initial rk_hdptx_pll_cmn_config() failure happened in 
> rk_hdptx_phy_consumer_get() when pll_config_dirty was false, it seems
> pll_config_dirty remains false. When rk_hdptx_phy_power_on() is later called,
> it checks if pll_config_dirty is true and might skip the retry entirely,
> leaving the hardware in a partially initialized state with an unlocked PLL.

The hardware is not really useful without rk_hdptx_phy_configure() being called,
which sets pll_config_dirty to true.

> 
>> +		if (!ret) {
>> +			regmap_write(hdptx->grf, GRF_HDPTX_CON0,
>> +				     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
>> +
>> +			if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
>> +				ret = rk_hdptx_frl_lcpll_mode_config(hdptx);
>> +			else
>> +				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>> +		}
>>  
>>  		if (ret)
>>  			rk_hdptx_phy_consumer_put(hdptx, true);
> 
