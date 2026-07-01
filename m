Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B32481254
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911146; cv=none; b=SXlwpTgJwqQiirg5DHl8QRZZ4K585QUFkQ0NWTsulcu5msIQPLYZf47rcR4fn+MfEsYaXwno/4FxI8Ju5VnyGJRJVCsaaYpW+crwGPKC3qt6fModFHOqsBbD4ETql5ln9OHpoOO4pmKA/SXHlbUiOpL7dbFv0HDe8CgecuEypc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911146; c=relaxed/simple;
	bh=2TFsYZO4NySggQT0nmGGX5Zrgtoi302hD0gNKtxiFAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcUDj9eVmFFsy1/lhOna0xQzR4dHVG83/3zbXdg7CopCPBrNmIOd17HLJGlFh3wKjId6HM01oCZqE/yHpZwQfQz56EqejKX2dvaCbj8Fjswc8hX4X2wJ8n4T2wo8N0A25Gu0u0X/1IDA3CT2HUz5sNBwcXHhVureUsQfD6hOrO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JJ+tc6u1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JJ+tc6u1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782911143;
	bh=2TFsYZO4NySggQT0nmGGX5Zrgtoi302hD0gNKtxiFAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JJ+tc6u11BKVPiwEWEuktqapukuGl57AoCrzsbNrc5x11ylUWDBwbT1xqkuWLxr5z
	 apc8zzb+9cMdrxr2LYEy55AZ9341QjIMu72qrsRiUGlmZM8VeseHlNm9asv2GiPyMl
	 FSmoLiT8+JXdgqpwYozAFzKUHMv/CHfEXwmakUHBDqkPaqBmoHXSCcUL7xT8M+ENeJ
	 DwS7OskuMhi02YSACSKsrRq1WbQHntX4MC7B12FbOS/5Yl0/gBFRCr8jl/kRfH148o
	 CnIZjr5Hq68kvNu3ovtzoGXbGzRCElDkFlR6QfsHP8j/x6iJM+CcJ2QKwc7RWMqLhz
	 OyjM2UgG9fH+Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BDDA17E0114;
	Wed,  1 Jul 2026 15:05:42 +0200 (CEST)
Message-ID: <92153ec5-f848-4a83-b470-c29ac974c7b9@collabora.com>
Date: Wed, 1 Jul 2026 15:05:42 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] phy: phy-mtk-dp: Rename regs to regmap in struct
 mtk_dp_phy
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
 olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-3-angelogioacchino.delregno@collabora.com>
 <20260701122658.307E21F000E9@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701122658.307E21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 14:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing NULL check for `dev->platform_data` before dereferencing.
> - [High] Missing `remove` callback to clean up PHY lookup leads to a memory leak and use-after-free.
> --
> 
> commit a1a96e429cf3345472aae1b06f6ffe5b31edee81
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
> 
> In preparation to perform further cleanups and to extend the driver to
> support more SoCs, rename the regs member to regmap to improve readability,
> as this is a common name across many kernel drivers for a struct regmap.
> 
>> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
>> index d7024a1443358..bf7b3a95e72d2 100644
>> --- a/drivers/phy/mediatek/phy-mtk-dp.c
>> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> [ ... ]
>> @@ -176,7 +176,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for dev->platform_data to be
> NULL here?
> 
> Earlier in mtk_dp_phy_probe(), dev->platform_data is dereferenced directly
> without a check:
> 
> drivers/phy/mediatek/phy-mtk-dp.c:mtk_dp_phy_probe() {
> 	...
> 	struct regmap *regs;
> 
> 	regs = *(struct regmap **)dev->platform_data;
> 	if (!regs)
> 	...
> }
> 
> If the driver is manually bound via sysfs (or otherwise instantiated without
> platform data), dev->platform_data will be NULL.
> 
> Should the code validate that dev->platform_data is not NULL before
> dereferencing it to avoid a kernel panic?
> 

No, that's not crashing it, because there's a NULL check anyway just after that.

> [Severity: High]
> This isn't a bug introduced by this patch, but does this driver leak the
> phy_lookup struct and leave a dangling pointer if it gets unbound?
> 
> In mtk_dp_phy_probe(), when !dev->of_node is true, a lookup entry is
> registered:
> 
> drivers/phy/mediatek/phy-mtk-dp.c:mtk_dp_phy_probe() {
> 	...
> 	if (!dev->of_node)
> 		phy_create_lookup(phy, "dp", dev_name(dev));
> 
> 	return 0;
> }
> 
> However, mtk_dp_phy_driver does not have a .remove callback to call
> phy_remove_lookup():
> 
> drivers/phy/mediatek/phy-mtk-dp.c:
> static struct platform_driver mtk_dp_phy_driver = {
> 	.probe = mtk_dp_phy_probe,
> 	.driver = {
> 		.name = "mediatek-dp-phy",
> 	},
> };
> 
> If the driver is unbound, the phy_lookup struct is leaked and remains linked
> in the global phys list. Since the phy struct gets freed by the
> device-managed subsystem, subsequent device probes iterating the PHY lookup
> list would trigger a use-after-free.
> 
> Could a .remove callback be added to unregister the lookup and prevent this?
> 

That's right, but I didn't create this issue. I can fix that in a later commit
just for that, even though this code path is dead when using new style devicetree.

>>   	if (!dp_phy)
>>   		return -ENOMEM;
>>   
>> -	dp_phy->regs = regs;
>> +	dp_phy->regmap = regs;
>>   	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
>>   	if (IS_ERR(phy))
>>   		return dev_err_probe(dev, PTR_ERR(phy),
> 
