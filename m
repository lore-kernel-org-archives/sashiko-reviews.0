Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30AA4CA294
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559058; cv=none; b=ripMISd/JzWgVnkxhVK28R4iTzNv2wd0OflriVunivq26TNQmEiVvmCe+PluvwJs0dc1MHl/bpp9Qod8j6t3SaxJ4xD0Cn/jmPjgwW2tQwY2SGrTBKIOo4feHfzksQYTEYhYZJPnKQpdWiX5zrpJKbCklQ41UrrQBCVoOWz8qpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559058; c=relaxed/simple;
	bh=p9+KEa8/8Dyrx6vfvDzmtoHvB1DxFmQKzIxJDGWSSvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RC74/D3vBSeQqv8xZQaEYj33xOA0lpF2w19PYOEDZ4MA07930hj9nIxkCKbVcCeD0IK4jLx7fnmXYs4k/8zj/pX9vTxHTAM9rn+p++MYZliZc+Y8dvaRwAReEQ6mrXa7MNXRigugJA0pbneHDhJ5A0jz9whUt0pwTcHak6gaN9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SAUUOm1G; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SAUUOm1G"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a9a2f16ed4so2985928a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 04:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789559047; x=1790163847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OkjIpCELnuJRozHROd7rQfIVtAzAlx7qACUrTNgcPM=;
        b=SAUUOm1Gb/quKQsYvS9I5Py9ynyfRKCFfAywOXE+9+xxgQUQ2psNPSRAPJHiPo4iEg
         cKDb0Q/HEtiP1NxsH1RAV5sre1oBHhScl3VATBjFfFDgDtBMDCngU3jxEP0Rx6plWqEU
         PYlaOidEqkbPE51MVBNqSRgqkQSaHByJOqf41aX+C0IfBOU+MknGDtGPN8mmgP246DNx
         5Lv03jOT5lSL+sxNvlCN8XrKy6mAyiCVRQpcIv1AU859cQebc3zkljZMln22Gp42lHn/
         L4kUMiH/a4vv2jEX5if5fCYFDF3XN8PaneRCvt3+nBgaXfymsFbodWQ6wFv5q5LKAAyi
         sHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559047; x=1790163847;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OkjIpCELnuJRozHROd7rQfIVtAzAlx7qACUrTNgcPM=;
        b=hJB2pAwczkhP99qQDPXiEzzbG//vCIy9Pni5OwfPHitlVgXktG+/WDYsN8TrJRWDjv
         q00h6CQMfKMICCqBP/wihcd8bTgvR6H99CnG/sjAxJHQ20s4GjGdf43au9BuDI9KywuP
         Lg+34g/Md6UZU1m2suQwQMGPwxB801Ylt2DNO54eKXS67czzBHh3M0P+p/5/Ets9RdZ+
         HkgzuPAi9SbOPb96qwSvBQN40MeUxqA8mJRFrtMORD5QZsKvei5hjCi1lMDxEWBwfcIA
         PH6CDS5SwOVWlYiUZ+3zciuvFoHEZEM3ABscspeV8s5m6lnnGUhBV4+IwS7hlVT1Un+o
         RXkg==
X-Gm-Message-State: AFuF++kSZcKHpBtnEo2B6QTTXlA+UgTkI+va19FziUmhdD60vlqUniYK
	TBo9yxsO3c4OJpIXri0H067WfjfcaawBw2Xh2ixPhYg6vAFusrk6E7AAJ9b6aYkoraCq+dK2WAv
	F5BoR2Hc=
X-Gm-Gg: AYBFou0HAX0EsYVASvTNExe6ZDeJjO5ZJEz099kdX3IPD9wVs54+3pEXfBPc6qwpQxo
	1Z01Yg+4JTKN+DN9wPKeay/xDg4sk8FKdiIIDqegH2+amz0SdbaUk0ZbRoHv4yXj2vk41k4pI7G
	airxAUxNS92WZMZLzQAo2f7V2ZOReARIk47mqgixzvPLKQcNUl6w5klGEGw8K/dgfF4H4qGnSPY
	aZKIsmlXXBVhwrmL09G6cjUTTzQw6XoZCJeEZK6E4HcUMcFjp1mF5t3ZthEB2giFfUT/y+On3+Q
	yVHMCnjEEfHxleCA8RGYPvjGqL49Fh4odrlSP4hS29H2mqq4qTg3T5nQ1SFT9KTuwZHFEr0xsHz
	bq8YAoFuTNbS9uS5mB1ZQ2ReDZflF2HfEUhePc9b5QzgR+fIqEiZYuewVs/V5m16rOiZ8dKP4R4
	SI6o7/8I8IEVm1MCq590lcUzoucO18etEprgKLLYLCShwn4UW7zq1Xkd16bs0nE/llKjCksb2+F
	EXEUx3fxPuJ
X-Received: by 2002:a05:6402:114a:b0:6a9:8c23:e0c0 with SMTP id 4fb4d7f45d1cf-6aa04039ddamr3843480a12.19.1789559046925;
        Wed, 16 Sep 2026 04:44:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228de9sm1631723a12.6.2026.09.16.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:44:06 -0700 (PDT)
Message-ID: <1a2b8244-0e8b-49d0-8dce-775abb070c76@linaro.org>
Date: Wed, 16 Sep 2026 12:44:05 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 4/5] media: qcom: camss: Add support for PHY API
 devices
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 media-ci@linuxtv.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-4-e2197a3e2551@linaro.org>
 <20260906143233.523A21F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260906143233.523A21F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2026 15:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Selects a non-existent Kconfig symbol PHY_QCOM_MIPI_CSI2.
> - [High] Hardware PHY state and resources are leaked on early probe and registration error paths.
> - [Medium] Missing return value checks for phy_mipi_dphy_get_default_config_for_hsclk() and phy_set_mode() can lead to uninitialized PHY configuration.
> --
> 
> commit cc3786ea5902bcb687c49374e8e8db29c5127496
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> media: qcom: camss: Add support for PHY API devices
> 
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API. In the first instance the code will try to use the new PHY interface.
> If no PHYs are present in the DT then the legacy method will be attempted.
> 
>> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
>> index 4eda48cb1adf0..1edc5e5a1829e 100644
>> --- a/drivers/media/platform/qcom/camss/Kconfig
>> +++ b/drivers/media/platform/qcom/camss/Kconfig
>> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	select VIDEOBUF2_DMA_SG
>>   	select V4L2_FWNODE
>> +	select PHY_QCOM_MIPI_CSI2
> 
> [Severity: High]
> Does this select a nonexistent config symbol? Selecting a symbol that isn't
> defined anywhere in the kernel causes a silent build dependency failure,
> which will leave the required PHY infrastructure unbuilt.

No the dependency is described in the cover-letter
> 
> [ ... ]
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index 539ac4888b608..e00748dd83b02 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> 
> [ ... ]
> 
>> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
>> +
>> +	if (link_freq < 0) {
>> +		dev_err(dev,
>> +			"Cannot get CSI2 transmitter's link frequency\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
>> +
>> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
>> +
>> +	ret = phy_configure(csiphy->phy, &dphy_opts);
> 
> [Severity: Medium]
> Should we check the return values of phy_mipi_dphy_get_default_config_for_hsclk()
> and phy_set_mode() here?
> 
> If link_freq evaluates to 0, it appears phy_mipi_dphy_get_default_config_for_hsclk()
> could return -EINVAL and leave the output dphy_opts structure zero-filled. Passing
> this uninitialized configuration directly to phy_configure() could lead to
> erratic hardware behavior.

Yeah but no link_freq <= 0 should cover that case. I'll add the 
evaluation of the return types anyway.

> 
> [ ... ]
> 
>> @@ -709,6 +788,56 @@ int msm_csiphy_subdev_init(struct camss *camss,
>> +	ret = phy_init(csiphy->phy);
>> +	if (ret)
>> +		dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
>> +
>> +done:
>> +	return ret;
>> +}
> 
> [ ... ]
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d7..84097d82d99c9 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
> 
> [ ... ]
> 
>> @@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *camss)
>>   	unsigned int i;
>>   	int ret;
>>   
>> +	camss_detect_legacy_phy(camss);
>> +
>>   	for (i = 0; i < camss->res->csiphy_num; i++) {
>> -		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
>> -					     &res->csiphy_res[i],
>> -					     res->csiphy_res[i].csiphy.id);
>> +		if (!camss->legacy_phy) {
>> +			ret = msm_csiphy_subdev_init(camss, i);
>> +		} else {
>> +			ret = msm_csiphy_subdev_init_legacy(camss,
>> +							    &camss->csiphy[i],
>> +							    &res->csiphy_res[i],
>> +							    res->csiphy_res[i].csiphy.id);
>> +		}
>> +
>>   		if (ret < 0) {
>> -			dev_err(camss->dev,
>> -				"Failed to init csiphy%d sub-device: %d\n",
>> -				i, ret);
>> +			dev_err(camss->dev, "csiphy %d init fail\n",
>> +				res->csiphy_res[i].csiphy.id);
>>   			return ret;
>>   		}
>>   	}
> 
> [Severity: High]
> Does this error path leak the PHY initialization state?
> 
> When msm_csiphy_subdev_init() succeeds, it calls phy_init() to acquire the PHY.
> If a subsequent iteration of this loop fails, or if a later initialization step
> like camss_probe() fails, the code returns immediately or goes to an error label
> without rolling back the previously initialized PHYs (which require phy_exit()).
> 
> Additionally, in msm_csiphy_register_entity() located in camss-csiphy.c:
> 
> 	ret = csiphy_init_formats(sd, NULL);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to init format: %d\n", ret);
> 		return ret;
> 	}
> 
> A failure here returns early without calling phy_exit(). When the calling code
> in camss_register_entities() rolls back, it decrements the index and skips this
> failing entity, which seems to permanently leak its PHY initialization state.
> 

yes missed the unwind.

---
bod
