Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC237C10C
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842844; cv=none; b=ksRYu+vTxF9hiUPFzOxmRX5+ROF1BpuohZSgvLO01wcspMc8nYjG5GKEq28aeF2Qt9hPGYfTygLhDSc3WJ1X/mDkiBPsGOC4qwvyAXab6Xo9RN8lRpp1h+hokyaSO+YuhY6ESK/8vCUFkke6PTViacZ6ahOBD9Ke/+p5QfJeOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842844; c=relaxed/simple;
	bh=n02lSdrJE18bk9bwyblvyrnWY8T3kaeiz2mnrrxr6QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UR1ufHpu5xrok3260N1lUTGurgU7PwGVuS9mJklramNvi9ntuIPbsnl+9qrmxa6m9FU5OuW8FcGrfMxTEtYKV735TJkx3fIXSaxKHJxlUHOyukGvqJFO+S92tF+MNjgLNmS13mke+CWQ15l418Fs6SKRCL6+KXPoDNJnOa2VjbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WG5M8L74; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WG5M8L74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784842834;
	bh=n02lSdrJE18bk9bwyblvyrnWY8T3kaeiz2mnrrxr6QY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WG5M8L744Blls+YL9WnJNCN/R35atkO47KeCDuA0MeEa8EVPEYi2xKjHKIA25NnbI
	 S2IpDuzPA+ERQDyViCzIvlA8jFtQqsMYsYTFB1e4VAKv59qyO1bMgpe54HJs9KL/EW
	 f2vRUW58OwP+kXmcbxGSGWUJxXWRWwhrFdCZRiHHmuy3MvVTc+TcEkQwy4sJvfZwmD
	 eLjGKZ3pkPgHjrujS//SIYKCxCLrKXqF7T3XeURimrOdvk9x/tAYDN7VxSX0uONkNH
	 KuPzDVlcWPTWqnXBHvxzkzyL9tpNnbwhKWMFpjrGQ9O1lH2yAoURWZqvT/HS+N1E0A
	 Ud2J9jC5qGmuA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EA0217E1029;
	Thu, 23 Jul 2026 23:40:34 +0200 (CEST)
Message-ID: <6e2a0368-89e6-4fba-9ec5-2c525ced0e34@collabora.com>
Date: Fri, 24 Jul 2026 00:40:34 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-2-8e786067865f@collabora.com>
 <20260723195546.7E6B41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260723195546.7E6B41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 10:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Clock rate determination fails in FRL mode due to returning raw rate instead of 0.
> - [High] Unintended state mutation of `hdmi_cfg` during `determine_rate` read queries.
> --
> 
> --- Patch [2]: [PATCH v5 02/10] phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate ---
> commit 3aac52ab862cd2c54c76fff590e3524e49936631
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate
> 
> Calculating 'sdm' fraction in rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
> could trigger a divide-by-zero, as it uses div_u64() with a denominator
> read directly from hardware. Provide the necessary sanitization to avoid
> trusting the hardware state.
> 
> Link: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 710603afff866..44e99343f2499 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> 
> [ ... ]
> 
>> @@ -2270,10 +2270,15 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  
>>  	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
>>  	if (ropll_hw.sdm_en) {
>> +		val = 16U * ropll_hw.sdm_deno *
>> +		      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num);
>> +		if (!val) {
>> +			dev_dbg(hdptx->dev, "Invalid ROPLL hw state: deno == 0\n");
>> +			return 0;
>> +		}
>> +
>>  		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
>> -			      ropll_hw.pms_mdiv * ropll_hw.sdm_num,
>> -			      16 * ropll_hw.sdm_deno *
>> -			      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num));
>> +			      ropll_hw.pms_mdiv * ropll_hw.sdm_num, val);
>>  
>>  		if (ropll_hw.sdm_num_sign)
>>  			fout = fout - sdm;
> 
> While reviewing this patch, I noticed a couple of pre-existing issues in the
> adjacent rk_hdptx_phy_clk_determine_rate() function:
> 
> drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:rk_hdptx_phy_clk_determine_rate() {
> 	...
> 	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
> 		return hdptx->hdmi_cfg.rate;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this violate the
> determine_rate API contract?

Already answered:

https://lore.kernel.org/all/0afce8ee-0277-4fad-adbe-ceb064f66437@collabora.com/

> [Severity: High]
> This is a pre-existing issue, but does this mutate the driver's internal
> PHY configuration state during what should be a stateless query?
> 
> The determine_rate clock operation must be a stateless read query
> (clk_round_rate). However, passing &hdptx->hdmi_cfg as the output parameter
> to rk_hdptx_phy_verify_hdmi_config() modifies hdptx->hdmi_cfg.rate and bpc.

This was part of the workaround removed via [PATCH v5 08/10] phy: rockchip:
samsung-hdptx: Drop restrict_rate_change handling:

-	/*
-	 * FIXME: Temporarily allow altering TMDS char rate via CCF.
-	 * To be dropped as soon as the RK DW HDMI QP bridge driver
-	 * switches to make use of phy_configure().
-	 */
-	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.rate) {
-		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = req->rate,
-		};
-
-		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi, &hdptx->hdmi_cfg);
-
-		if (ret)
-			return ret;
-	}

