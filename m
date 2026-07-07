Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5337DAA9
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 16:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441787; cv=none; b=GWdrZkPn7ClJmy1qy7jIAvfQmvTwl6aMJJm8Tw8v9nb+DMda6fzXz3UBDxihEqrOYTkUdcNYSlFI9vH6MJLxi/PGHDkLgn/VhqM1TPQ2KaGr/QKLyP5CC9yt1ibtkwm7lqSsBKda/QkZ3+flS0dEPnLPoYCUZrS/rgU888WXrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441787; c=relaxed/simple;
	bh=lXR+uBa4T4h7kmIlSIy3J99lNAJBI1qMHaeA+DIy39w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmpWYdKUBUkiUjqpJHYHdYmzkZcvJRAAuNGLLGkm2eZPJOHdl9DyNUkufJl2vebxU3qwmO13Rso3vjVKI5YEKNm/e6tnrLEDGv07GBNr/1ZbQdsCfLqtHDc1U+OiFvt/V+0Jp+MO5lwWIwRD1cnU6V7HFea2MoIvcWySUFDavAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FBEG/H7x; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FBEG/H7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783441784;
	bh=lXR+uBa4T4h7kmIlSIy3J99lNAJBI1qMHaeA+DIy39w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FBEG/H7xKexOsLwIjoQOfeRxw90mu2YHRS/9ypDKddgLwkjtajT0lpEL5qPgKLTUH
	 iKc+Y2XwV3QXywOZh07i+etD03MMFz4u3NQNyEVV3GHKBGTs+E40TNtrlrTfVPILrB
	 5RWNblRndxxFShkO6rCFSLq4qKdzbpDvmAj+F8y0ZTHQgiXlhXu+edI6QUsqeXkTBO
	 C3UgLGpbxl5vli09fnnBFQRMRYwCa61j8+0Ms4nc12rlBHx0hsj+vR+k0LLv1SCST5
	 PlBmWEarUMlED+IpyHXU0vyS+VItokWlEkVURq3KJXFsEv/AHK8xjBbmKKZUyAW8JD
	 PNQdaPBtbheHQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C64E17E013E;
	Tue, 07 Jul 2026 18:29:44 +0200 (CEST)
Message-ID: <48e80ac6-193f-4d57-99a3-21794648f1fa@collabora.com>
Date: Tue, 7 Jul 2026 18:29:43 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pmdomain: mediatek: Add support for MT8196 HFRP
 DirectCTL domains
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
 <20260707155535.199383-5-angelogioacchino.delregno@collabora.com>
 <20260707162058.C21991F00AC4@smtp.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707162058.C21991F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 18:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Resource leak on error cleanup due to dummy `sta_mask` in simple power sequence domains causing `scpsys_domain_is_on()` to incorrectly return false.
> 
> Pre-existing issues:
> - [High] Kernel panic during probe error cleanup due to unconditional dereference of `pd->data` for `HW_VOTER` domains in `scpsys_domain_is_on()`.
> --
> 
> --- Patch [4]: [PATCH v2 4/4] pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains ---
> commit 6f2aa6326ce2b3105bc55383da9b0e0d8b25e2d6
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains
> 
> Add support for the power domains provided by the HFRPSYS Power Controller of
> the MT8196 SoC. Those control power to the eDP and DP Transmitter IPs.
> 
>> diff --git a/drivers/pmdomain/mediatek/mt8196-pm-domains.h b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
>> index 2e4b287206596..d704c9fa93374 100644
>> --- a/drivers/pmdomain/mediatek/mt8196-pm-domains.h
>> +++ b/drivers/pmdomain/mediatek/mt8196-pm-domains.h
>> @@ -602,6 +602,27 @@ static const struct scpsys_hwv_domain_data hfrpsys_hwv_domain_data_mt8196[] = {
>>   	},
>>   };
>>   
>> +static const struct scpsys_domain_data hfrpsys_domain_data_mt8196[] = {
>> +	[MT8196_POWER_DOMAIN_EDPTX] = {
>> +		.name = "edp-tx",
>> +		.sta_mask = MT8196_PWR_ACK,
> 
> [Severity: Medium]
> Can this lead to a resource leak during error cleanup?
> 
> The MT8196_POWER_DOMAIN_EDPTX and DPTX domains use simple power sequence,
> bypassing standard PWR_ACK polling. To pass validation during initialization,
> they are assigned MT8196_PWR_ACK as a sta_mask.
> 
> If this bit is a dummy and not automatically driven high by hardware for these
> specific domains (since it is never polled during power_on),
> scpsys_domain_is_on() will perpetually read 0 and return false.

Why Sashiko assumes that this is a dummy is bogus. Why should it ever be a dummy
and why would I add it if it was useless?!

> 
> If a failure triggers probe error cleanup, scpsys_remove_one_domain() would
> skip scpsys_power_off() for these domains because it incorrectly believes they
> are already off. Does this leave the domain permanently powered on in a
> corrupted state and leak prepared clocks and regulators?
> 
>> +		.sta2nd_mask = MT8196_PWR_ACK_2ND,
>> +		.ctl_offs = 0x74,
>> +		.pwr_sta_offs = 0x74,
>> +		.pwr_sta2nd_offs = 0x74,
>> +		.caps = MTK_SCPD_SIMPLE_PWRSEQ,
>> +	},
> 
> [ ... ]
> 
>> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> index feba436279c54..55e7478804236 100644
>> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
>> @@ -1258,6 +1258,10 @@ static const struct of_device_id scpsys_of_match[] = {
>>   		.compatible = "mediatek,mt8196-power-controller",
>>   		.data = &mt8196_scpsys_data,
>>   	},
>> +	{
>> +		.compatible = "mediatek,mt8196-hfrp-power-controller",
>> +		.data = &mt8196_hfrpsys_data,
>> +	},
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could this lead to a kernel
> panic during probe error cleanup?
> 
> If a hardware voter domain is probed successfully, it is added to the probed
> list. If a subsequently probed domain fails, scpsys_domain_cleanup()
> initiates rollback, calling scpsys_remove_one_domain() on the hardware
> voter domain.
> 
> scpsys_remove_one_domain() unconditionally calls scpsys_domain_is_on(), which
> attempts to read pd->data->sta_mask:
> 
> scpsys_remove_one_domain()
>      scpsys_domain_is_on()
>          u32 mask = pd->data->sta_mask;
> 
> For hardware voter domains, pd->data is explicitly set to NULL, which appears
> to result in a guaranteed NULL pointer dereference. Could this bring the
> system down during boot on unsupported or failing hardware configurations?
> 

I'll send a Fixes patch for that.

>>   	{
>>   		.compatible = "mediatek,mt8196-hwv-hfrp-power-controller",
>>   		.data = &mt8196_hfrpsys_hwv_data,
> 

