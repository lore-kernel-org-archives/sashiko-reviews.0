Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BB2DCF61
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841762; cv=none; b=YrnT+dZccM0mjDmqNuhtzkMeOuiNw58tsoTS1JIDWnAHYL9g82ErXL6RoTErLBcBvXSDzi0ORcCv4ugs65gQkUq3i9fwpDegZqZG8HRndtfdr6cQZyW3R7MIsq/1NdtjVPNl9yLYJFVd5HqKGLOBXlqaKI19w/pBBLN4fkjiuqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841762; c=relaxed/simple;
	bh=Be+gSqsCXF3W1EY3lPrtTKJcU1VhyJPNRTZ/2IeFKC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dj8bjAVb57mSeSMdEyNcx0qzb89oZUeSGBt6JcA4Muax/DwmLxulSL//vwKeivU5aInWeSOMT/innqeBn40GGA1kzatifpsZ6qS+G/gAbwuapknkPV1rTYvPhVd+GYQjC/4gtvK8er/liqqSk0FCcJXXOLOxjX0MJI5CSGnuLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OIYLS2vV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OIYLS2vV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784841758;
	bh=Be+gSqsCXF3W1EY3lPrtTKJcU1VhyJPNRTZ/2IeFKC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OIYLS2vVtrNOBr22n96r+e/ff8aj9PUiMyyJsLL50u/F7l53MHmhgw/r+8tWT1sJ/
	 QptF7LmQ2NMWR2i47SiIVBCsth83lbky5BlbzZJ7lSucn5DFwRwZzfLsdSg10IzYW0
	 22Nw8bJ4XDj1y8DHUmU5BQjc2xWFETta5hYrwBJTkE64jC2AS+3Ro9MMIGRILez8pm
	 nJ7W12G6x2gFJo4WWFzCgHF/Mj4W/sS1XeJg+25B+LYxE5oIoiXkQDyKpnuMRztDMf
	 ymlpWSk951m7jfjP/SjGd9jv7q9tHFj/WAZUee/uuNHOosVBIuRlQB7HDawr3dSp1j
	 GQZi1LHAIeeag==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5330D17E0A45;
	Thu, 23 Jul 2026 23:22:38 +0200 (CEST)
Message-ID: <0afce8ee-0277-4fad-adbe-ceb064f66437@collabora.com>
Date: Fri, 24 Jul 2026 00:22:37 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] phy: rockchip: samsung-hdptx: Guard against clk
 rate integer underflow
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org,
 linux-phy@lists.infradead.org
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-3-8e786067865f@collabora.com>
 <20260723195717.8E1AC1F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260723195717.8E1AC1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 10:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] rk_hdptx_phy_clk_determine_rate() incorrectly returns a clock rate directly instead of 0 on success, violating the CCF API.
> --
> 
> --- Patch [3]: [PATCH v5 03/10] phy: rockchip: samsung-hdptx: Guard against clk rate integer underflow ---
> commit cf68603e6625cb39a98418e9f792a4e2e373dfcd
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Guard against clk rate integer underflow
> 
> This commit adds a check to avoid an integer underflow in the ROPLL
> hardware state calculation. By validating that the computed sigma-delta
> modulator offset does not exceed the base frequency, it prevents
> returning excessively high clock rates to the Common Clock Framework.
> 
> Closes: https://lore.kernel.org/all/20260611235702.0E9691F000E9@smtp.kernel.org/
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 44e99343f2499..fcf04e9814cc6 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -2280,10 +2280,16 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
>>  			      ropll_hw.pms_mdiv * ropll_hw.sdm_num, val);
>>  
>> -		if (ropll_hw.sdm_num_sign)
>> +		if (ropll_hw.sdm_num_sign) {
>> +			if (sdm > fout) {
>> +				dev_dbg(hdptx->dev, "Invalid ROPLL hw state: sdm > fout\n");
>> +				return 0;
>> +			}
>> +
>>  			fout = fout - sdm;
>> -		else
>> +		} else {
>>  			fout = fout + sdm;
>> +		}
>>  	}
>>  
>>  	return DIV_ROUND_CLOSEST_ULL(fout * 2 * 8, ropll_hw.pms_sdiv * 10 * bpc);
>>  }
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential problem in
> rk_hdptx_phy_clk_determine_rate() located nearby in the same file:
> 
> drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:rk_hdptx_phy_clk_determine_rate() {
> 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
> 
> 	if (hdptx->hdmi_cfg.mode == PHY_HDMI_MODE_FRL)
> 		return hdptx->hdmi_cfg.rate;
> 	...
> }
> 
> Does this violate the Common Clock Framework API contract for
> .determine_rate callbacks?
> 
> The .determine_rate callback is expected to update req->rate and return 0
> on success. By returning the rate directly, it appears this fails to update
> the request and instead returns a massive integer.
> 
> For FRL_8G4L_RATE (3,200,000,000), casting it to a 32-bit signed int would
> wrap around to a negative value (-1,094,967,296).
> 
> When the clock rate is negotiated or set for 8Gbps FRL mode, CCF could
> receive this wrapped negative value, interpret it as an error code, and
> cause clk_set_rate() to fail entirely.
> 
> Even for smaller rates that do not wrap, leaving req->rate unmodified might
> bypass rounding and cause downstream failures in HDMI configuration.
> 
> Should this instead update req->rate and return 0?

This is implicitly fixed by [PATCH v5 05/10] phy: rockchip: samsung-hdptx:
Handle uncommitted PHY config changes. If a new revision is required, I can
provide a dedicated patch.
