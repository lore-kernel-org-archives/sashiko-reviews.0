Received: from mail-m49212.qiye.163.com (mail-m49212.qiye.163.com [45.254.49.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26183EB0EC
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106469; cv=none; b=e6O8tOhwo1dYwBYBlfUmtx/SOxlXRrbdIFaSq1v2qUqkuu5QgEspSTYndjoyRTCsLsxmC8XvY8G38awQuzrbVmbI9fyfz4WdYg3fe1TTAClpokLU9Kx4l6eSTxWgBX3YCt56H+7HsoT7ZcNb17nmOvVap+mt+nHHRGRt12EmotM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106469; c=relaxed/simple;
	bh=H2qnXEImwoz2zrzCd/qOrzTqaRIv16NPS/LflTFmdns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rycafWAQ4vr3Ew++vhZgV58uRHpc57vdylNgK6m6w0tigb6t1Oy98ssfSK5OLkBt12OKE73a0joeM5GqlGdGW+blrTy7wZe2BGhcuZTnuEf0URZdM3DRKEzgdjoXoZA4+Kd2GoUgDRxmwslU75uAXkBhO1Nb12dWg5u3lJgnGAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=D5eEkzfW; arc=none smtp.client-ip=45.254.49.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="D5eEkzfW"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4644b288e;
	Wed, 15 Jul 2026 16:32:08 +0800 (GMT+08:00)
Message-ID: <00d3f58e-73bb-41da-a2df-dfeeca644b6f@rock-chips.com>
Date: Wed, 15 Jul 2026 16:32:07 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm/bridge: analogix_dp: Restore mandatory samsung
 DP DT properties
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
 <20260707040613.1992841-4-damon.ding@rock-chips.com>
 <20260707041711.4F7351F000E9@smtp.kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260707041711.4F7351F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f64e79dc103a8kunmb5bc9ffe10ec8e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCShhLVkpIGE5KGkkYQktLSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=D5eEkzfWlQsu8P+ISq0oa6wJ8Fp89x3afKPHLzKZvgX2lw9+6aZwVlxKVWZEnPs8FJw9gB1HyUInUGo5sG6lF8usQP/Cti1YYzJXaqiAg3P+iHzT5vpLiFPZi78Tbf+TYkyKnMW/6neIZfvs9qsVEtaBK6JQyK+xJMcYCB+BA98=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5k3VLyTE2W0brh6QXzfvnZyb5UNm/t6xk2HiFeq09E0=;
	h=date:mime-version:subject:message-id:from;

On 7/7/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Failing probe when deprecated DT properties are missing breaks DT ABI and prevents their deprecation.
> --
> 
> --- Patch [3]: [PATCH v6 3/5] drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties ---
> commit b573dba50acc6087122ffa4a65680322f4d004f8
> Author: Damon Ding <damon.ding@rock-chips.com>
> 
> drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
> 
> This commit reverts a change that made the samsung,link-rate and
> samsung,lane-count properties optional for Exynos DP. It adds error checking
> to fail the probe early if these properties are missing, aiming to prevent
> link training failures caused by zero values.
> 
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 8cf6b73bceac0..293d8adfe9856 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> [ ... ]
>> @@ -1258,10 +1259,14 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>>   		 * NOTE: those property parseing code is used for
>>   		 * providing backward compatibility for samsung platform.
>>   		 */
>> -		of_property_read_u32(dp_node, "samsung,link-rate",
>> -				     &video_info->max_link_rate);
>> -		of_property_read_u32(dp_node, "samsung,lane-count",
>> -				     &video_info->max_lane_count);
>> +		if (of_property_read_u32(dp_node, "samsung,link-rate", &val))
>> +			return dev_err_probe(dp->dev, -EINVAL,
>> +					     "Failed to get samsung,link-rate\n");
> 
> [Severity: Critical]
> Does failing the probe when this property is missing break the DT ABI?
> 
> Since samsung,link-rate is a deprecated property, a modern schema-compliant
> Device Tree might intentionally omit it. If a system boots with such a DT,
> this check will fail the probe with -EINVAL and disable the display.
> 
> Could the driver instead fall back to hardware maximums or sensible defaults
> when the deprecated property is absent, rather than returning an error?
> 

I'm afraid it's difficult to provide a universal sensible default value 
here.

The samsung,lane-count and samsung,link-rate values vary significantly 
across Exynos DP device trees, so a generic fallback to hardware 
maximums cannot guarantee stable link training.

Even though these two properties are marked deprecated, all existing DTS 
files in our projects have already populated them completely. Moreover, 
the current link training logic relies on these two parameters; omitting 
either will directly cause link training failures at runtime.

Therefore, retaining the mandatory property check in probe is a 
reasonable approach for now.

>> +		video_info->max_link_rate = val;
>> +		if (of_property_read_u32(dp_node, "samsung,lane-count", &val))
>> +			return dev_err_probe(dp->dev, -EINVAL,
>> +					     "Failed to get samsung,lane-count\n");
> 
> [Severity: Critical]
> Does making samsung,lane-count mandatory similarly break backward compatibility
> for valid Device Trees that have intentionally omitted this deprecated property?
> 

I don't think so. Missing either property will inevitably cause link 
training failure, and all functional DTs have these deprecated 
properties filled in already.

>> +		video_info->max_lane_count = val;
>>   		break;
>>   	}
>>
> 

Best regards,
Damon

