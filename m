Received: from mail-m49244.qiye.163.com (mail-m49244.qiye.163.com [45.254.49.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207A48F845
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313186; cv=none; b=nWUHzitElLIz7G/aD0HIbpOwJ5OAWR4WmdXpVX2mjwQPWNx+5qXZeUGfY5yfLKJOWqoXP28mEu0KZB3GC2+P7Xn4/kuGeUtvmGSoosyNghxIyMB6dt+ejpu/mOuYNsWGtO49v1oThjlAANT2Oks3W9M3MV5OOmPQVXsrVQ0LT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313186; c=relaxed/simple;
	bh=p8N0t4O2y/Kch4MhPfBGm6ZNWEP4bCFA0eT4m6iWnyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKvtESVvRfXVB0TNcAEZKjhJ+x2wEzjxDYZHbLovfHrPEqHN0pLSOf5flJR4r42YI1gfPzdI2ToZewe58xFnTPkMkmuWaMFfUhqjwvGB4y6ExWB2Pt3CfAMW0t7AHnW8+v1QF/S7L/iCZYN4EapCbHp4ET99N5ImDPDxo0qGrsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hXS5SXgD; arc=none smtp.client-ip=45.254.49.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hXS5SXgD"
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ad248d70;
	Fri, 21 Aug 2026 15:16:49 +0800 (GMT+08:00)
Message-ID: <31039a3a-05ca-4a98-b5ce-4cddd4f411a2@rock-chips.com>
Date: Fri, 21 Aug 2026 15:16:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for optional
 data-lanes mapping
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-6-damon.ding@rock-chips.com>
 <20260819080422.816771F000E9@smtp.kernel.org>
 <f0151ee4-f660-43d2-a49d-13ab2ad12dbc@rock-chips.com>
 <DKSXRX52W03E.2II5M5DIT6E1C@bootlin.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <DKSXRX52W03E.2II5M5DIT6E1C@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0232df3b003a8kunm8622f394452441
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkIYVklMTE9LGkpOHU1MTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hXS5SXgDwxi+HtZ2N9rPsD5Ccjov+gjZXmssCncqMbpYAYtgXoEUMyZP5AncLXH+RQxLN/+fWZqugxOCUV4hwGeqdpBGkjmObJ7du9JNtYwMDLxiznHIra7sQH4bC360/YsROFUK3E8RIJLf7c1vRxq18w4JrCJeCnPX+itjlys=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=I2StsAsz5/fFec+eWCjU0PPcXhFTakynsGrQu06Dbi8=;
	h=date:mime-version:subject:message-id:from;

Hi Luca,

On 8/19/2026 8:58 PM, Luca Ceresoli wrote:
> Hello,
> 
> On Wed Aug 19, 2026 at 10:53 AM CEST, Damon Ding wrote:
>> On 8/19/2026 4:04 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] Logic error in hardware lane mapping configuration causes inverted assignments for non-symmetric maps.
>>> - [Low] Device Tree endpoint lookup inconsistency when querying lane counts versus reading properties.
>>> --
>>>
>>> --- Patch [5]: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for optional data-lanes mapping ---
>>> commit 1c15eb6132eedc3d606168644e5f97918c8e3651
>>> Author: Damon Ding <damon.ding@rock-chips.com>
>>>
>>> drm/bridge: analogix_dp: Add support for optional data-lanes mapping
>>>
>>> Parse the optional 'data-lanes' device tree property to support
>>> custom physical lane mapping configuration. If no valid configuration
>>> is found, fall back to the default lane map automatically.
>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> index 039e076d2b8ab..cb06347196cef 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> [ ... ]
>>>> @@ -1240,6 +1240,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>>>>    	.detect = analogix_dp_bridge_detect,
>>>>    };
>>>>
>>>> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
>>>> +{
>>> [ ... ]
>>>> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
>>>> +						   video_info->max_lane_count);
>>>> +	if (num_lanes < 0)
>>>> +		return -EINVAL;
>>>> +
>>>> +	endpoint = of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);
>>>
>>
>> Hi Luca,
>>
>> Thanks for taking a look at previous v6 patch series. This Sashiko
>> warning was also present in v6. Sorry for CC'ing you out‑of‑the‑blue
>> without prior heads‑up.
>>
>>> [Severity: Low]
>>> Does passing -1 here potentially retrieve a different endpoint from the one
>>> validated with reg=0 above?
>>>
>>> If multiple endpoints exist on the DP port and the target endpoint is not
>>> positionally first, could this mismatch result in reading the data-lanes
>>> property from the wrong endpoint?
>>>
>>
>> For Analogix DP, port@1 will only ever have a single endpoint.
>> Multi‑output configurations are not supported by the hardware, so
>> passing -1 cannot select a mismatched endpoint. There is no risk of
>> retrieving the 'data‑lanes' property from an unintended endpoint.
> 
> I understand (1, 0) and (1, -1) will always return the same node in the
> real cases, but why doing it? Use the same indices both times and avoid
> future readers scratch their head thinking why it's different and whether
> they might report a different node in a future case. Also, if parsing a
> broken device tree, you may point at two different nodes here. Keep things
> simple, readable and reliable.
> 
> 

Thanks for your comment.

Agreed, inconsistent indices are confusing and unsafe with broken DT.
Will switch of_graph_get_endpoint_by_regs() to reg=0 to match 
drm_of_get_data_lanes_count_ep() in v8.

Best regards,
Damon

