Received: from mail-m3288.qiye.163.com (mail-m3288.qiye.163.com [220.197.32.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625823F44EF
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129959; cv=none; b=V6FAzcrEBTgx8KRbDt1WSyc99ua/5l3btTMpOsEKj71ppR0mPxPQYB0+RxKmMd59aNFA32iHkkjzakMU/3vnEgZzaRjy5i/PX8Tjh/2uYIwHBh5Kkj/0d1rRO6hw61kMKAzfO/f4+y10ekY3ZTZiM1jQi0Vhc6bzJTwTr+91MIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129959; c=relaxed/simple;
	bh=+2pari/f+A9InDed14Yk6z4S5bn5gEqmS5rfItbpUjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ukas4No75nVfLWHnWhnJFk4RbGQhk7pxySVuVPHPDxgxNnHPGAr+KFwTj9ywNXNYszvJ3H8EgYd/kPgPokj8DIqxIzqVJ5mCcOapyj8Gm51QDY2kqY+RfOc+QmztXL6vV4/1um624t8U4M6/Huy+KZDoVjl38m3Tg65Sqk74jyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bGWaL0kF; arc=none smtp.client-ip=220.197.32.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bGWaL0kF"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a8bd8e40;
	Wed, 19 Aug 2026 16:53:54 +0800 (GMT+08:00)
Message-ID: <f0151ee4-f660-43d2-a49d-13ab2ad12dbc@rock-chips.com>
Date: Wed, 19 Aug 2026 16:53:54 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for optional
 data-lanes mapping
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-6-damon.ding@rock-chips.com>
 <20260819080422.816771F000E9@smtp.kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260819080422.816771F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0193a1e7403a8kunmaa6dc6ec3320d4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHxodVhgaGUxNHh9MSUkYHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bGWaL0kFdv2F1aJCSHo5LblQ8BYGWkRXUq0Xgx+AOA6nhCbje5jnq6LtjPtvynfZaO0GaFjUP9Bj7lj3/rdF0FpeHYSA4224tQmSChQ4ymGoLKlU8Fc2NYHGdDsDT2FBrTMpDz0S5EnWW9IKYOSasuZthQr+u+khrJw7hl2Uq10=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=g/T2s+HEEMdqXQKh9/wTekMXVfvnMcbFNHDnmwWBfis=;
	h=date:mime-version:subject:message-id:from;

On 8/19/2026 4:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Logic error in hardware lane mapping configuration causes inverted assignments for non-symmetric maps.
> - [Low] Device Tree endpoint lookup inconsistency when querying lane counts versus reading properties.
> --
> 
> --- Patch [5]: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for optional data-lanes mapping ---
> commit 1c15eb6132eedc3d606168644e5f97918c8e3651
> Author: Damon Ding <damon.ding@rock-chips.com>
> 
> drm/bridge: analogix_dp: Add support for optional data-lanes mapping
> 
> Parse the optional 'data-lanes' device tree property to support
> custom physical lane mapping configuration. If no valid configuration
> is found, fall back to the default lane map automatically.
> 
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 039e076d2b8ab..cb06347196cef 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> [ ... ]
>> @@ -1240,6 +1240,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>>   	.detect = analogix_dp_bridge_detect,
>>   };
>>   
>> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
>> +{
> [ ... ]
>> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
>> +						   video_info->max_lane_count);
>> +	if (num_lanes < 0)
>> +		return -EINVAL;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);
> 

Hi Luca,

Thanks for taking a look at previous v6 patch series. This Sashiko 
warning was also present in v6. Sorry for CC'ing you out‑of‑the‑blue 
without prior heads‑up.

> [Severity: Low]
> Does passing -1 here potentially retrieve a different endpoint from the one
> validated with reg=0 above?
> 
> If multiple endpoints exist on the DP port and the target endpoint is not
> positionally first, could this mismatch result in reading the data-lanes
> property from the wrong endpoint?
> 

For Analogix DP, port@1 will only ever have a single endpoint. 
Multi‑output configurations are not supported by the hardware, so 
passing -1 cannot select a mismatched endpoint. There is no risk of 
retrieving the 'data‑lanes' property from an unintended endpoint.

>> +	if (!endpoint)
>> +		return -EINVAL;
>> +
>> +	ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, num_lanes);
>> +	of_node_put(endpoint);
> [ ... ]
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index ea8401293a23a..c1344a3f013ab 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> [ ... ]
>> @@ -48,16 +48,15 @@ void analogix_dp_stop_video(struct analogix_dp_device *dp)
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_VIDEO_CTL_1);
>>   }
>>   
>> -void analogix_dp_lane_swap(struct analogix_dp_device *dp, bool enable)
>> +void analogix_dp_lane_mapping(struct analogix_dp_device *dp)
>>   {
>> +	u32 *lane_map = dp->video_info.lane_map;
>>   	u32 reg;
>>   
>> -	if (enable)
>> -		reg = LANE3_MAP_LOGIC_LANE_0 | LANE2_MAP_LOGIC_LANE_1 |
>> -		      LANE1_MAP_LOGIC_LANE_2 | LANE0_MAP_LOGIC_LANE_3;
>> -	else
>> -		reg = LANE3_MAP_LOGIC_LANE_3 | LANE2_MAP_LOGIC_LANE_2 |
>> -		      LANE1_MAP_LOGIC_LANE_1 | LANE0_MAP_LOGIC_LANE_0;
>> +	reg = lane_map[0] << LANE0_MAP_SHIFT;
>> +	reg |= lane_map[1] << LANE1_MAP_SHIFT;
>> +	reg |= lane_map[2] << LANE2_MAP_SHIFT;
>> +	reg |= lane_map[3] << LANE3_MAP_SHIFT;
> 
> [Severity: High]
> Does this logic incorrectly assign the physical lane value to the logical
> lane's field?
> 
> By shifting the physical lane index (lane_map[i]) into the register field
> assigned to the logical lane index (LANE<i>_MAP_SHIFT), it appears this
> inherently applies the inverse of the requested mapping.
> 
> While this silently succeeds for symmetric maps (e.g., swapping 0<->3, 1<->2),
> will it fail for any non-symmetric map (e.g., <1 2 3 0>) by causing physical
> lanes to carry the wrong logical lanes?
> 
> Should the bitwise construction instead be reg |= i << (lane_map[i] * 2)?
> 
>>   
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_MAP);
>>   }
> 

lane_map[] uses index as physical lane, value as logical lane.

This matches training_lane[] / cr_loop[] in struct link_train, whose 
indexes are physical lanes for DPCD access during link training.

LANE<i>_MAP_SHIFT configures which logical lane is routed onto physical 
lane i, so current register logic is correct.

Best regards,
Damon

