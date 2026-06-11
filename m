Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B06380FFA
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781222095; cv=none; b=bC6Bayl9BfruczwunfnerXUtWdgkrvFJuCh1vawq1303/Ca1Y1EZyXGL1SgHQGckMiGvMcPIsmTeUDfKpRB4R18NdPelDW90ESmdHdLMgTQPz+5msid0/Y3i+12lu0yNTCla0Xd0XtGy0Uzu83pMynEbnAM7vJqxyzEVxHzjLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781222095; c=relaxed/simple;
	bh=IKjZ6L247TPL4+PUB7DXIDxyOQQw5lXuhwoYvV/uinI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jzuw6pKXCZu2ZGpUF+kZEB42fb9/UOavngvKjTj3Ra/4/CK3K8kmQssB1V+IvpjvIlRwvuiGQ9bJVCGfwqJ22cLaW1kJkHof/KD2Ym2emKKmfoGIXTDkIWYAXb2D8lnJOe62uSsZAMBc40kRdcojRWag5IgBdRLpwGB48ImJrIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HWab/51B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HWab/51B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781222091;
	bh=IKjZ6L247TPL4+PUB7DXIDxyOQQw5lXuhwoYvV/uinI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HWab/51B5I2v4yAof7DF0lfJgb9lrxGvUxkih+FGVe+d2u8rdW7aSbADEj7/D+6OW
	 KKnaaJsBEtItZJTCnuo9fHyefNMKB40sQhYm7a9GwnLFckf6CpGTfI1edGAkB6IWUw
	 dFinHECgS92uxIEylD+DBpcCyT/rmfCsh74PggGZCiKFSV1kIqndDbUZjCBN5aq703
	 1Y7YjuQM/eFVwj6BgYFoGnRv3P1FdnEMSoH1+X2NEsL32Y0l7USK9jCKruTnt2/it+
	 30m4XdIjGnlbYpsn2TA5JRPkmpuRFaYpd44bUt14HZ9sFp8gSeOjZTb5PMgzBFJX/z
	 586FwHTyMeTBA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8272E17E091C;
	Fri, 12 Jun 2026 01:54:51 +0200 (CEST)
Message-ID: <93c36e34-f63e-43ed-9284-82104629b72c@collabora.com>
Date: Fri, 12 Jun 2026 02:54:51 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for high bpc
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org
References: <20260611-hdptx-clk-fixes-v3-1-67b1b0c00e16@collabora.com>
 <20260611144311.561861F00893@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260611144311.561861F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/11/26 5:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Potential divide-by-zero when computing SDM fraction if bootloader leaves specific PLL registers uninitialized or misconfigured.
> - [High] FRL_8G4L_RATE (3.2GHz) cascade mode is not handled correctly in clock rate recalculation, causing it to return 0.

It looks like Sashiko is improving, as it didn’t flag these issues during the previous reviews.

I addressed them in v4:

https://lore.kernel.org/all/20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com/

Regards,
Cristian

> --
> 
> commit 7c989d5f5cf68e3aea19b9dd58be7c8b907619aa
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc
> 
> This patch updates the rate recalculation logic to read the bpc value directly
> from hardware registers instead of relying on the uninitialized HDMI PHY
> configuration. This resolves incorrect rate calculations when bpc is higher
> than 8.
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 2d973bc37f076..710603afff866 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -2168,7 +2168,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  	struct lcpll_config lcpll_hw;
>>  	struct ropll_config ropll_hw;
>>  	u64 fout, sdm;
>> -	u32 mode, val;
>> +	u32 mode, bpc, val;
>>  	int ret, i;
>>  
>>  	ret = regmap_read(hdptx->regmap, CMN_REG(0008), &mode);
> 
> [Severity: High]
> This is a pre-existing issue, but does 
> rk_hdptx_phy_clk_calc_rate_from_pll_cfg() fail to handle cascade mode for the
> 3.2GHz FRL_8G4L_RATE?
> 
> When the hardware is configured in cascade mode using both LCPLL and ROPLL,
> CMN_REG(0008) has LCPLL_LCVCO_MODE_EN_MASK set.
> 
> The function sees this bit and assumes the rate must be determined solely
> from the rk_hdptx_frl_lcpll_cfg array:
> 
> drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:rk_hdptx_phy_clk_calc_rate_from_pll_cfg() {
>     ...
>     if (mode & LCPLL_LCVCO_MODE_EN_MASK) {
>         ...
>         for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
>             ...
>                 return cfg->rate;
>         }
> 
>         dev_dbg(hdptx->dev, "%s no FRL match found\n", __func__);
>         return 0;
>     }
>     ...
> }
> 
> For the 3.2GHz config, it searches the array for an entry with pms_mdiv of
> 107, finds no match, and returns 0 instead of falling through to the ROPLL
> calculation.
> 
> Could this bypass the ROPLL calculation and cause the clock framework to
> register a 0 Hz rate for the 3.2GHz HDMI mode?
> 
> [ ... ]
> 
>> @@ -2266,6 +2266,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  	if (ret)
>>  		return 0;
>>  	ropll_hw.pms_sdiv = ((val & PLL_PCG_POSTDIV_SEL_MASK) >> 4) + 1;
>> +	bpc = (FIELD_GET(PLL_PCG_CLK_SEL_MASK, val) << 1) + 8;
>>  
>>  	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
>>  	if (ropll_hw.sdm_en) {
> 
> [Severity: High]
> This is a pre-existing issue, but could this division trigger a
> divide-by-zero panic if the bootloader leaves the PLL registers
> uninitialized or misconfigured?
> 
> The calculation uses div_u64() with a denominator read directly from hardware:
> 
> drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:rk_hdptx_phy_clk_calc_rate_from_pll_cfg() {
>     ...
>     if (ropll_hw.sdm_en) {
>         sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
>                       ropll_hw.pms_mdiv * ropll_hw.sdm_num,
>                       16 * ropll_hw.sdm_deno *
>                       (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num));
>     ...
> }
> 
> The values ropll_hw.sdm_deno, ropll_hw.sdc_deno, ropll_hw.sdc_n, and
> ropll_hw.sdc_num are populated from CMN_REG(0060), CMN_REG(0070), etc.,
> without any zero-checks.
> 
> If the PLL is enabled but these registers evaluate to 0, it appears this
> would cause a panic during driver probe or when the clock framework queries
> the rate.
> 
> Is it safe to directly trust the hardware register state for this denominator
> without sanitization?
> 
>> @@ -2280,7 +2281,7 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  			fout = fout + sdm;
>>  	}
>>  
>> -	return div_u64(fout * 2, ropll_hw.pms_sdiv * 10);
>> +	return DIV_ROUND_CLOSEST_ULL(fout * 2 * 8, ropll_hw.pms_sdiv * 10 * bpc);
>>  }
> 

