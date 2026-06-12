Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B416126C02
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781223536; cv=none; b=PBLUVndnTJ7GlX/FbBDReHEwzSmArqQXmD3LJHbhuuhq/0/+4hez9CH4uDj/PkU7DgWrhVPADW9E26Rc3LxC9Kmsa9Chz8JWh/e5PEMEY1wRNFcV8kMGQ/0Au+3E/mJ1Hes8cvsW8+YWBtDrXU9uAvm81/Wg1Z8UkV5sZrumS9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781223536; c=relaxed/simple;
	bh=mSYn42qFwxcVeNAG6Q7Ssv9a2+y5l0z2gCqDv5a0n40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNwwFNPJzSD6PoXMmeGAyIE4o3YbWAaCJrtIRjMrtahnKBXVbM2RhWO+JNxXw+nZkMOMieMoJXcxRQOiGFVzwBzggxmUmHX/+3JtcCaQoMrwiPO7CyQGazhHBIWTwqcA6BX71hTEDtbkea7+q0lkYLf9Mp1NWmxsxDrhUffZKtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pQvnXBDB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pQvnXBDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781223533;
	bh=mSYn42qFwxcVeNAG6Q7Ssv9a2+y5l0z2gCqDv5a0n40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pQvnXBDBlYcq54uxYzw0Ta5dSsxMjn7YemUnO/ATA63z0i7zhSyb5UK+IlwE+5mDC
	 hlqlqZRd6mh5LEtRDGyeVUv3UXK5R9vpsABmEuSiHIwDpOoeQznd0yIRRsumM1BcTi
	 pUNCxniOe3uVkwlZBHpzUthvy3xc8cNcYVuK1GBKtkCfv+QHTqzit23tKSkdcLED2Z
	 cB8UUs8UhQQcErWoUfIdWAoNLvXD0rm7oNyRneX3Dbnocx+EuleZ7Ty5tD8kO7eeaV
	 p+6SKkq/bgpeua/67x27UucCvcIDdZ7Z3X1dTLUi2tLULFPH2se4p8wHGJeQAgnWK2
	 0sNUl/R8uo74Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E648517E03D7;
	Fri, 12 Jun 2026 02:18:52 +0200 (CEST)
Message-ID: <90ac7bbc-977b-432a-9f17-b7280e19d819@collabora.com>
Date: Fri, 12 Jun 2026 03:18:52 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org, vkoul@kernel.org
References: <20260612-hdptx-clk-fixes-v4-2-ce5e1d456cda@collabora.com>
 <20260611235702.0E9691F000E9@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260611235702.0E9691F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 2:57 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Potential integer underflow in `fout` calculation when hardware state is misconfigured, leading to a massive bogus clock rate that could hang downstream components.
> --

If the hardware reached such a damaged state, the kernel is likely already encountering more serious issues.

Regardless, I will address this in the "FRL TxFFE level control" series, which is currently blocked by this one, to avoid any further delays.

Regards,
Cristian

> 
> commit cb21c8c13b880d08d17b5ee69740229527db5442
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Prevent divide-by-zero when computing clk rate
> 
> This commit adds sanitization to rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
> to prevent a divide-by-zero during clock rate calculation. It checks the
> denominator derived from hardware registers, which could be uninitialized or
> misconfigured.
> 
> Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 710603afff866..8c044381b83a4 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -2270,10 +2270,15 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>>  
>>  	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
>>  	if (ropll_hw.sdm_en) {
>> +		val = 16U * ropll_hw.sdm_deno *
>> +		      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num);
>> +		if (!val) {
>> +			dev_dbg(hdptx->dev, "%s invalid ROPLL hw state\n", __func__);
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
> [Severity: High]
> This is a pre-existing issue, but could this subtraction result in an
> integer underflow?
> 
> If the hardware registers are misconfigured or contain uninitialized values,
> it seems the computed sigma-delta modulator offset sdm could be significantly
> larger than the base frequency fout.
> 
> Since fout is an unsigned 64-bit integer, subtracting a larger sdm in
> rk_hdptx_phy_clk_calc_rate_from_pll_cfg() would wrap around to a massive
> positive value.
> 
> Could this underflow lead to an absurdly high clock rate being returned
> to the Common Clock Framework, potentially causing hangs or div-by-zero
> errors in downstream components?
> 

