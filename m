Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB96A42F701
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441021; cv=none; b=ZYD3iXzCGozhdgwGti6zA1wCKiS5dHJiyCqkYSj1MfeyTMSj+oYble+C9alOQTUpK71xlv4RfQpL7jeloQqVcP5mfd9Xf+1XWJW9Z44KHoIah9/ibRzCHq698r/bnNkLAEtgsVKSdkUOP0y5YNyHC0yp+B+3LzqkT4YhTe+1tZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441021; c=relaxed/simple;
	bh=ndr39EnnDNyaVg4yg1bwCupKHr8Ke/XoGQGTOTChPKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4/t40OQrGeRF0nilyKpKbUnSJlrdLjpKiJk0j/QHu7MT5ZfscjW/bk34nLVBjZoZ5TcHKv5jx0ZqQD6JYX+A78cXToOpv5e1/bGAVLxXT/roNZrRJhMvVzRUnDuIat7scLYqM4fgPOxt74Aq4RiLbtiQUaZ6RDMLv2HTet3Ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PsIkaeUf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PsIkaeUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783441018;
	bh=ndr39EnnDNyaVg4yg1bwCupKHr8Ke/XoGQGTOTChPKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PsIkaeUfrvGxQz+sgpc04CLNz5da5Y1PslciCx8uYjStfb3i9x3w3EQ5ylIUI/dMq
	 vl6wkPIsQjRN56V+acJLJw+Ly+J/gSkEJAb8aaCJcFb650saonn5htIRydBSMoYqd+
	 0BmrwBQqljHbajnnuY0uP/XQyjYKJ7Mi/nJ0Kgd8EmmPU/Es4gHuDqAyNEEi2SzYiL
	 JAQutMXtnkaoQbiguUkCzXYRIHqVaxjmzcNA0zK59rypR8cwdTNC2GdccBMbcu5QQj
	 JtA5a1V99CHVLiaw3VCJollvKxoz/ZqgPZPCBjv8C9kkl9RqCTEJfcMtUTWtmJydqa
	 j+WUi6cZGE6Uw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E311017E0795;
	Tue, 07 Jul 2026 18:16:57 +0200 (CEST)
Message-ID: <69813d90-e419-4433-bc7a-948ee8345b40@collabora.com>
Date: Tue, 7 Jul 2026 18:16:57 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] phy: phy-mtk-dp: Add support for MT8196 eDP PHY
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, olteanv@gmail.com,
 vkoul@kernel.org
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-13-angelogioacchino.delregno@collabora.com>
 <20260707160507.4759F1F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707160507.4759F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 18:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing NULL check for the result of `device_get_match_data(dev)` before dereferencing it.
> --
> 
> --- Patch [12]: [PATCH v3 12/12] phy: phy-mtk-dp: Add support for MT8196 eDP PHY ---
> commit 171cadff965a41b7aba8d81fbb60622f2a8e1a97
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> phy: phy-mtk-dp: Add support for MT8196 eDP PHY
> 
> The MT8196 SoC features an updated PHY IP compared to the older
> ones, and there is one that is specific to Embedded DisplayPort.
> This commit adds support for the eDP PHY found in the MediaTek MT8196 SoC
> and all of its variants.
> 
>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>> index f5aadc5fdc42c..5decc29c77cb3 100644
>> --- a/drivers/phy/mediatek/phy-mtk-dp.c
>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> 
> [ ... ]
> 
>> @@ -805,8 +838,39 @@ static const struct mtk_dp_phy_pdata mt8195_dp_phy_data = {
>>   	},
>>   };
>>   
>> +static const struct mtk_dp_phy_pdata mt8196_edp_phy_data = {
>> +	.off_ana_glb = 0x400,
> 
> [ ... ]
> 
>> +	.driving_params = (const u32[]) {
>> +		[0] = 0,
>> +		[1] = 0,
>> +		[2] = 0,
>> +		[3] = MT8196_DRIVING_PARAM_3_DEFAULT,
>> +		[4] = MT8196_DRIVING_PARAM_4_DEFAULT,
>> +		[5] = MT8196_DRIVING_PARAM_5_DEFAULT,
>> +		[6] = MT8196_DRIVING_PARAM_6_DEFAULT,
>> +		[7] = MT8196_DRIVING_PARAM_7_DEFAULT,
>> +		[8] = MT8196_DRIVING_PARAM_8_DEFAULT
>> +	},
>> +};
>> +
>>   static const struct of_device_id mtk_dp_phy_of_match[] = {
>>   	{ .compatible = "mediatek,mt8195-dp-phy", .data = &mt8195_dp_phy_data },
>> +	{ .compatible = "mediatek,mt8196-edp-phy", .data = &mt8196_edp_phy_data },
>>   	{ /* sentinel */ }
>>   };
> 
> [Severity: High]
> If the driver is forcefully bound to a device via the sysfs bind interface,
> and the device has an of_node but its compatible string does not match any
> entry in the driver's of_match_table, device_get_match_data(dev) will return
> NULL.
> 
> This NULL pointer is stored in dp_phy->pdata:
> 
> drivers/phy/mediatek/phy-mtk-dp.c:mtk_dp_phy_probe() {
>      ...
> 	dp_phy->pdata = device_get_match_data(dev);
> 
> 	if (IS_REACHABLE(CONFIG_NVMEM)) {
> 		ret = mtk_dp_phy_get_calibration_data(dp_phy);
>      ...
> }
> 
> And is unconditionally dereferenced here:
> 
> drivers/phy/mediatek/phy-mtk-dp.c:mtk_dp_phy_get_default_cal_data() {
>      ...
> 	const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
> 	int i;
> 
> 	dp_phy->ana_bias_r = pdata->ana_bias_r;
>      ...
> }
> 
> Should device_get_match_data() be checked for NULL before continuing in
> mtk_dp_phy_probe() to prevent a potential kernel panic?
> 

Oh just shut up, Sashiko! :-)

Too many paranoid checks proposed, are we trying to slow down Linux by a factor
of 1000 with all the defensive coding?
