Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95B43F4DB
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717981; cv=none; b=IAQleTQmUNSR79jYQQ08rjEwYp4plg445rkmJLMvgQM3hwcu+qBwAxBc2zqdiDLx6wPhcIqFDhWJQBYPh9ocuLhUoIqogGM+F4fsSW+CJVUQEbrCOSBhHtCimtKrnXEijMYa2//N+IxDJwoMFBOQzB3ma4aDMT81ZQrKl2TGo5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717981; c=relaxed/simple;
	bh=TlGOa7Q4JnZWRpem8FybOSI0XTsAWwND+/pRfgVDTHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgsnU3mTMzGYVgIT7uM2BbxtA/ZeVVrdLPVMaPbCD3gC8rrxbSiBWPIXE5BXcEVwxNmpe2wo+rbp6AnDTsHVLpXu8g3IHPzj0MDqhhAKeCQ5bwDRtu2Ij3GIBk3i46H3YH1wgb1ShVqVIp5JSk6tIL1KFZtrBt6ZEnEuTpVPGAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSsq1pLE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7ZqRaZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSsq1pLE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7ZqRaZn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x6A01400195
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NLD5QZZ8/I4Gf7f08HT3hDB1lW6nFAOR1yB7m8BKXE=; b=lSsq1pLEodEksU4Z
	w1qorF4Kr9l0Fb5xhfsH5Jtmmoh4ftLrU2OvnmPqGGd+4CwSHJh0K7Wkfm2TZ6B1
	E+AIK82r/PW7Q5FWizV6Yxhq4CP1bCFFpDNiGPDuf1sbB768zdvgroaHqQQrKCmM
	xg4WUOVoq4f+wkN8TqVaIQ9vAkzuELjAcQQTeXWsxOriJrpht9F1nZW+QR/fa0qa
	Oy8HRurwbLnRHG6hkKvzBh6Qw5Kz1KhvnzBYBBMaBF4bUwYVyMkHkSZcDG03SAjS
	7eh2P0x/zNU923fjjnGkuxpw1Pmz91OVJ0clwR/Gg39tjV5c6mRtXqjnKnZjhx/K
	fmLNjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr8396py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:59:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso195770701cf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717979; x=1785322779; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NLD5QZZ8/I4Gf7f08HT3hDB1lW6nFAOR1yB7m8BKXE=;
        b=D7ZqRaZnxj6ExUKM6we7vKiy6MTluYd61ICOQ8N3AY2GrETFGgzF98SCywRNYxHwD3
         KwEg+htAoW25+YKCAeN/99X8+yWXE6ITR/1LIX7RF2kY+cRSBTIZ4gV/R7J9CBSJ+Cec
         1CMjAip8wO8kJUI6UfRIIwDkQgivm8/ljKKaFoxos9OleoApHhnXiepRZlwy3iuKA4ek
         BOhX338Ath6fcs+YdxYHsJTiOevzKPy1F+pNGyGC8CKcBkw+qiCIcALADM1tvAUmp2VO
         2dDE6OHqTCgRvGOJLoZbbL1QmTYG3g4V8K3py9xDwXnR9UE5n4jXNTvYdBrC/AR798Hs
         yceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717979; x=1785322779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NLD5QZZ8/I4Gf7f08HT3hDB1lW6nFAOR1yB7m8BKXE=;
        b=NX9R5uSL3nQl+6eaDn6LVuvUXZ74RukQU+zC5Ev2X0EnhYkQmTxS3eytgNrl2R/D9v
         euKoHWsYaVX42Myl/adlCmS+XgLvp1Ytvr/Em/jCO5UAj5nKyW+fU4rNeBJnGZtTGNmE
         43TjI2vX7yq7L2oSvLqYLfAMnfrWQBm/mwl+C1NTnRxE2QKfLtVV20fda++TuXrmkCjo
         dbKUOeFo1uz2nLHxka8oUYEzcRgiTFWuJ6gVkZCMY/T887XMOrTNN5eVzBsNIjGc1G8A
         hc5OTg9z25cBTnwkc/4dLP5gvcAS7jnLhrXlZb9T7+HCtQXmQkLteBOhjSvD3W/6ouX0
         l+HQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2/mlJW9UsrA4P4BHYWB6MMA/vNrmf6WuMHM1Q8kXYWZD5aoCwe+Ln0TmmHfdiEiXfejT3zVh2RTbTT1qTuy0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDAwR6dL2ZUzfCuP4bMQ8UAT1iyzWwEmGDb57Yj0IWPuYopawM
	DcqubYTjk2kJBSDF2f9E/qKIk1Hq0eySx6/xesfmt1YhZn9B0LEflYM8XkN6+q3VizQKoXA3SX5
	0P7sMK7IpAggYkKBGXwMt7BdENSAQFREQQw63IeuT+xhr2V4HNfCC0PoMVJ4i0QIw0vetSD4=
X-Gm-Gg: AR+sD10vB74pLKc5VacVdOICRyiHZt7thsGcF3vwZ882yFZAPANqRP7Yjw1c0yVYYN0
	0Bos2sgJdR8nfseDcpxuURqfb/UYFIPy3cr/ObRZa1gFklHR+jfPy+gLxYQYt96AWNY4vl6RQL7
	So/4G8vRO76bptsSObkx4Bar9XO73l3TQgpFcW7jrerELdraWWsxf04+6D4LRxRQDwYVTe8S+DN
	tg78qHbtyYgtypJCObt5VbjAe1xfarSTxKNU3r6sIEEPxnSTSFQjCsuSXlQ04TXBHKIuAftoRL6
	vCJkMbUu1OqLHymrKAI9kBt6s2YXDjIUC6zYUWhoj3Ykb+sPGTayYztqNppcQF3TloFrRRnluPC
	LrXGkfefYq92vSlcJf4HWgFo87COTdVVzAlVOgY4Ojoj1S5cDHQhSVAtSftsfIuZu1A==
X-Received: by 2002:a05:6214:5d0b:b0:8f3:469e:5051 with SMTP id 6a1803df08f44-90778358215mr238108406d6.18.1784717978497;
        Wed, 22 Jul 2026 03:59:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5d0b:b0:8f3:469e:5051 with SMTP id 6a1803df08f44-90778358215mr238108116d6.18.1784717978006;
        Wed, 22 Jul 2026 03:59:38 -0700 (PDT)
Received: from [10.111.173.228] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e18d4sm18438546d6.23.2026.07.22.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:59:37 -0700 (PDT)
Message-ID: <fa4eda4f-a492-467d-86c7-98b9a6d35344@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:59:34 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-10-bea261bf4e7d@oss.qualcomm.com>
 <20260720062405.E079D1F000E9@smtp.kernel.org>
 <3k7xz57peytyda7cvzfpao3j6xuhn4gyf7f43wnspdpgnrel4r@vipemh3nkoi7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3k7xz57peytyda7cvzfpao3j6xuhn4gyf7f43wnspdpgnrel4r@vipemh3nkoi7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l06HaaTrFDzwPeNpaXMxEZEgfxdxRwdZ
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60a29b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=fjmCN9aIutHrqzZMW0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l06HaaTrFDzwPeNpaXMxEZEgfxdxRwdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXzeJhi1UFxq//
 cmpPrdfghghhn2QgV0bJkwnT9dYhq84gkDr3sFi0bliYw1A1lpbgfEIuzuMO+i9MSSuv7RSvHT4
 HAtoecUq8dIT32e+oE/RIK0CIt4Vcrz2aAHpXIMk8UyN8ml49Q8oKQK1epKewdSSF73TTP0e0K8
 /mm2b+DGrOQQtuCYjUK9FeKH+U/VnOLDrhCSm6QLTl9pxYgwj6/ngr4o0PNxxnawwY8HTtiLM7+
 cvBqyBA1w7FQcYZ1NM2x1OzDDk9s7NDN5AHLVaou7J+xmBiJE8V88+t4cVv8Awqn0vhwkVZfuiF
 V69UgTPzoiNKcqfd9J1xDduLXZAE9EEKX97puB7hTLGk/e0awYmf0etQI0K0JGwJLQJBSsEar9u
 oKYIXxVEKby6AQrxsw8FYvppevWqu9n6HTXyXBd8oEV/9bCvRnOu9EwwL19jGW5rITHhtewyhuD
 TqvB9ZTw/CF7BVLRsuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXzivyqrwvHNAL
 r7i9QQJVnFgMjj8D6Vm0x/a2Gv/BqkYlLqAAM6/HiNfXpsywZjthVTll8tK57ZbsmD8XyhNcbfE
 tRv97/F6Y9qBwIt2Wl3ROqwGrhpBY0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106



On 7/22/2026 2:54 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 06:24:05AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Secondary stream panels fail to have their `hw_revision` initialized, silently breaking controller-specific hardware workarounds in MST setups.
>> - [High] Stream-specific panels are incorrectly passed to mainlink APIs, corrupting shared link state and misconfiguring the link based on leaf monitor capabilities instead of the MST hub.
>> --
>>
>> --- Patch [10]: [PATCH v8 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it ---
>> commit 07d3f4b80ae5875a958a8aceb22c9ffab07db108
>> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
>>
>> With MST, multiple sinks share a single DP controller, so a cached
>> panel in msm_dp_ctrl_private can no longer represent the per-stream
>> sink. Drop the cache and pass panel explicitly to all stream-related
>> dp_ctrl APIs.
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index ae79cbec26d19..207643fa73063 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -219,7 +219,7 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
>>>   
>>>   	if (!ctrl->hw_revision) {
>>>   		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
>>> -		ctrl->panel->hw_revision = ctrl->hw_revision;
>>> +		panel->hw_revision = ctrl->hw_revision;
>>>   	}
>>>   }
>>
>> [Severity: High]
>> Does this leave the hw_revision uninitialized for secondary stream panels in an
>> MST setup?
>>
>> Since ctrl->hw_revision is populated during the host initialization for the
>> primary panel, any subsequent stream panels passed to this function will bypass
>> the assignment. Could this silently break hardware workarounds that depend on
>> panel->hw_revision being set correctly?
> 
> It does. This should be fixed.
> 
Got it. I'll move the panel->hw_revision assignment outside the conditional.
>>
>> [ ... ]
>>
>>> @@ -414,10 +414,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>>   	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>>   }
>>>   
>>> -static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>>> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
>>> +					 struct msm_dp_panel *panel)
>>>   {
>>>   	u32 config = 0;
>>> -	const u8 *dpcd = ctrl->panel->dpcd;
>>> +	const u8 *dpcd = panel->dpcd;
>>>   
>>>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>>>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>>
>> [Severity: High]
>> Can the direct write to REG_DP_CONFIGURATION_CTRL at the end of this function
>> erase stream-specific configurations established by previously enabled streams?
>>
>> Since msm_dp_ctrl_config_ctrl_link() is called on every stream enable from
>> msm_dp_ctrl_on_stream(), it seems this might overwrite the shared register and
>> corrupt the state of active streams.
> 
> Hmm?
> 
>>
>> [ ... ]
>>
>>> @@ -1810,11 +1821,12 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>>>   		   str_on_off(ctrl->core_clks_on));
>>>   }
>>>   
>>> -static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
>>> +static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
>>> +					      struct msm_dp_panel *panel)
>>>   {
>>>   	int ret = 0;
>>>   	struct phy *phy = ctrl->phy;
>>> -	const u8 *dpcd = ctrl->panel->dpcd;
>>> +	const u8 *dpcd = panel->dpcd;
>>>   
>>>   	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
>>>   	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
>>
>> [Severity: High]
>> Is it correct to use the stream-specific (leaf) DPCD to configure shared
>> mainlink properties here and in msm_dp_ctrl_link_train()?
>>
>> This appears to misconfigure the link based on leaf monitor capabilities instead
>> of the MST hub. If a leaf monitor doesn't support features like enhanced
>> framing or downspread, but the hub does, could this break the link to the hub?
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com?part=10
> 

