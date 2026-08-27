Received: from mail-m32115.qiye.163.com (mail-m32115.qiye.163.com [220.197.32.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905B424D74
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 11:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829289; cv=none; b=NN1kyClt8zXsagMHS+hWUPQcgkdKVLb5+Nm+u8/o2b0XTp1hN5fVIwPGOcmzdApr560x/wM1A2wjrZSML9HcWyX9HIB4FZGwSqr2ydF9HZDQ8YDrCKP8pJaVnr4VQ513lgPQ01h4p10iuNruEiiGPPmj7XzO2earOFDJiRLHbSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829289; c=relaxed/simple;
	bh=BBKKM0ZDn2pqo54oLPb89Es3xRCNLbPnAWrw8wE2RQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOjVhUiIP4dYiP+2BhRJZBx3wQNdEjt6GoAu0ZMm89WoPNncJ1L5E2CvM15ZDKjTFe7Sqw0Z+7NhJzeYW0auY+PmQ5+g173RtuB3InBTOgnwnQfLU6TYGuzVRWuYUsUCHOzdDJEJhs8xw4BI//W2bZFRSeslHKC0dJjAbM2PxlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gs4IHsD5; arc=none smtp.client-ip=220.197.32.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gs4IHsD5"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b8f957e7;
	Thu, 27 Aug 2026 19:09:24 +0800 (GMT+08:00)
Message-ID: <d54dae7d-f3dc-40ac-ad72-f23868fa5f84@rock-chips.com>
Date: Thu, 27 Aug 2026 19:09:23 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm/bridge: analogix_dp: Restore mandatory samsung
 DP DT properties
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
References: <20260707040613.1992841-1-damon.ding@rock-chips.com>
 <20260707040613.1992841-4-damon.ding@rock-chips.com>
 <20260707041711.4F7351F000E9@smtp.kernel.org>
 <00d3f58e-73bb-41da-a2df-dfeeca644b6f@rock-chips.com>
 <DKSQUNWA86GP.9NHE4ADGYLQH@bootlin.com>
 <ba494eae-c17f-4a15-8276-fd5dfb372337@rock-chips.com>
 <DKSXCKHFS3T7.2UK43K8F0TUGZ@bootlin.com> <aocKgCU2hw1jJsKl@venus>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <aocKgCU2hw1jJsKl@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa042e90a8403a8kunme0b69f6311bb84
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSR1NVkoaSElOSkkaHxpPHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gs4IHsD5GvhlBzMlLhhj5A2gKT+f3Fn+AIPsUiZJA1sHO10idfEAPwlNnYgiXeFXP2xceN9v2sG7t6CUpsKbPJxGpHPgB8O/K4RbQ0BTmXkAKDcmdPb2idOm/4ckAp21QI3Y3PB+G6dqwWexEnF9rfcWQFQebZkKT8rmBaG562k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hjRIxPu01Q9qqkob0PghGVW0TERRSPGYyt3hiaGCLcM=;
	h=date:mime-version:subject:message-id:from;

Hi Sebastian,

On 8/20/2026 10:45 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Aug 19, 2026 at 02:37:59PM +0200, Luca Ceresoli wrote:
>> Hello,
>>
>> On Wed Aug 19, 2026 at 10:19 AM CEST, Damon Ding wrote:
>>> Hi Luca,
>>>
>>> On 8/19/2026 3:32 PM, Luca Ceresoli wrote:
>>>> Hello Damon,
>>>>
>>>> On Wed Jul 15, 2026 at 10:32 AM CEST, Damon Ding wrote:
>>>>> On 7/7/2026 12:17 PM, sashiko-bot@kernel.org wrote:
>>>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>>>> - [Critical] Failing probe when deprecated DT properties are missing breaks DT ABI and prevents their deprecation.
>>>>>> --
>>>>>>
>>>>>> --- Patch [3]: [PATCH v6 3/5] drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties ---
>>>>>> commit b573dba50acc6087122ffa4a65680322f4d004f8
>>>>>> Author: Damon Ding <damon.ding@rock-chips.com>
>>>>>>
>>>>>> drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
>>>>>>
>>>>>> This commit reverts a change that made the samsung,link-rate and
>>>>>> samsung,lane-count properties optional for Exynos DP. It adds error checking
>>>>>> to fail the probe early if these properties are missing, aiming to prevent
>>>>>> link training failures caused by zero values.
>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>>>>> index 8cf6b73bceac0..293d8adfe9856 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>>>> [ ... ]
>>>>>>> @@ -1258,10 +1259,14 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>>>>>>>     		 * NOTE: those property parseing code is used for
>>>>>>>     		 * providing backward compatibility for samsung platform.
>>>>>>>     		 */
>>>>>>> -		of_property_read_u32(dp_node, "samsung,link-rate",
>>>>>>> -				     &video_info->max_link_rate);
>>>>>>> -		of_property_read_u32(dp_node, "samsung,lane-count",
>>>>>>> -				     &video_info->max_lane_count);
>>>>>>> +		if (of_property_read_u32(dp_node, "samsung,link-rate", &val))
>>>>>>> +			return dev_err_probe(dp->dev, -EINVAL,
>>>>>>> +					     "Failed to get samsung,link-rate\n");
>>>>>>
>>>>>> [Severity: Critical]
>>>>>> Does failing the probe when this property is missing break the DT ABI?
>>>>>>
>>>>>> Since samsung,link-rate is a deprecated property, a modern schema-compliant
>>>>>> Device Tree might intentionally omit it. If a system boots with such a DT,
>>>>>> this check will fail the probe with -EINVAL and disable the display.
>>>>>>
>>>>>> Could the driver instead fall back to hardware maximums or sensible defaults
>>>>>> when the deprecated property is absent, rather than returning an error?
>>>>>>
>>>>>
>>>>> I'm afraid it's difficult to provide a universal sensible default value
>>>>> here.
>>>>>
>>>>> The samsung,lane-count and samsung,link-rate values vary significantly
>>>>> across Exynos DP device trees, so a generic fallback to hardware
>>>>> maximums cannot guarantee stable link training.
>>>>>
>>>>> Even though these two properties are marked deprecated, all existing DTS
>>>>> files in our projects have already populated them completely. Moreover,
>>>>> the current link training logic relies on these two parameters; omitting
>>>>> either will directly cause link training failures at runtime.
>>>>>
>>>>> Therefore, retaining the mandatory property check in probe is a
>>>>> reasonable approach for now.
>>>>
>>>> I'm still not convinced we should turn an optional property into mandatory,
>>>> after having been optional since 2016 (based on the commit in the Fixes:
>>>> tag).
>>>>
>>>> The sure thing is we cannot break existing devices which upgrade to a new
>>>> kernel.
>>>>
>>>> Se the question is: if a device is missing one of these properties, or
>>>> both, what happens? The video_info->max_link_rate and/or
>>>> video_info->max_lane_count will be zero, correct? And if they are zero, is
>>>> there even a remote possibility that the device will work somehow, maybe
>>>> only with some rare low resolution or whatever?
>>>>
>>>> If the answer is "yes, there is a remote possibility that one sich device,
>>>> with some maybe rare configuration, will work", then no, we cannot make
>>>> this property mandatory now. There can be devices out there working without
>>>> these proberties, and they would be broken.
>>>>
>>>> If the answer is "there is no way at all a device can work without one or
>>>> both properties", with a good explanation based on the code flow and
>>>> hardware docs, then we can consider this change.
>>>>
>>>
>>> Sorry for the confusion, I just submitted the v7 series which crossed
>>> with your reply.
>>>
>>> To answer your question: there is no way at all a device can work
>>> without these properties. Here is the code flow when either
>>> max_link_rate or max_lane_count is 0 (helped by AI):
>>>
>>>     analogix_dp_commit()
>>>       -> analogix_dp_full_link_train(dp, max_lanes = 0, max_rate = 0)
>>>
>>>     analogix_dp_full_link_train(max_lanes, max_rate):
>>>         // Read sink capabilities via DPCD and sanitize them
>>>         link_rate   = read_dpcd(DP_MAX_LINK_RATE); // >= 0x06 after fixup
>>>         lane_count  = read_dpcd(DP_MAX_LANE_COUNT);// >= 1 after fixup
>>>
>>>         // Clamp by the limits from DT
>>>         if (link_rate > max_rate)                // 0x06 > 0, always true
>>>             link_rate = max_rate;                // link_rate = 0
>>>         if (lane_count > max_lanes)              // 1 > 0, always true
>>>             lane_count = max_lanes;              // lane_count = 0
>>>
>>>         // Configure TX with the zeroed values
>>>         set_link_bandwidth(link_rate = 0)
>>>             // writel() is only executed for bwtype == 0x06/0x0a,
>>>             // so LINK_BW_SET is never written and stays at reset value;
>>>             // phy_configure() is called with link_rate = 0.
>>>
>>>         set_lane_count(lane_count = 0)
>>>             // writel(0, ANALOGIX_DP_LANE_COUNT_SET) enables 0 lanes;
>>>             // phy_configure() is called with lanes = 0.
>>>
>>>         // Program sink for link training
>>>         drm_dp_dpcd_write(DP_LINK_BW_SET, {link_rate = 0, lane_count = 0})
>>>             // DP spec requires link rate in {0x06, 0x0a, 0x14} and
>>>             // lane count in {1, 2, 4}. Writing zeros is illegal, so the
>>>             // sink cannot enter the training state.
>>>
>>>         // Training loop
>>>         for (lane = 0; lane < lane_count /* 0 */; lane++)
>>>             // loop body never executes; training_lane[] stays
>>>             // uninitialized and no training register is ever programmed
>>>
>>> Since the sanitized sink values are always non-zero (link_rate >= 0x06,
>>> lane_count >= 1), the clamping with a zero maximum unconditionally
>>> forces the training parameters to zero. Clock recovery can never be
>>> achieved, so link training fails deterministically.
>>
>> Thank you very much for the detailed analysis! To it is enough to
>> proceed. I'll review your v7.
> 
> Can't the default for missing properties just be changed to 4 lanes
> and 0x14 rate and the DP link training would automatically train to
> less lanes / rates based on hardware capabilities (which would
> render the properties basically useless except for a small speedup
> during link training)?
> 

Sorry for the late reply.

What you described is already how the current link training works: the 
source reads sink‑side lane count and link‑rate capabilities from DPCD 
and configures accordingly.

However, &video_info->max_link_rate and &video_info->max_lane_count 
represent the source SoC's maximum hardware limits, not sink capabilities.

Taking Rockchip platforms as an example: RK3288/RK3399 support maximum 
4-lane 2.7 Gbps, while RK3576/RK3588 can go up to 4-lane 5.4 Gbps. If a 
panel supports 5.4 Gbps 4-lane but is connected to RK3399, link training 
must be capped at 2.7 Gbps because of the source hardware limitation.

Exynos DTS files also carry different values for these two properties to 
reflect their respective source-side maximum capabilities. Therefore 
hardcoding a fallback of 4 lanes / 5.4 Gbps is not a viable general 
solution, as it would mismatch the real hardware limits on various SoCs.

Best regards,
Damon

