Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96074052AA
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417709; cv=none; b=hcjkvW1shEgAuKXtNzfdWIpvmf+I7Z4gVbbuwhiZmfCc9U48+FWnEaMEK7nZ9XkkIHvdOER74PPon/IeP+yRHb+34P0FRmCBkU7XrpQ1sE9GJxFwJ2hp80SaMoZ/IDw8KFfjUZ4QQIv/2gFDx5FfO7n8ZS5swIamH6jnaw1vGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417709; c=relaxed/simple;
	bh=6eCDQHwycFwNQiCAeJevwHKMid/TdPTTKlTIdQ942Ao=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EKMRccYsy6101xzUw/6F6htrIGeB2K1k1g2rPZx3OFja+S4yvNtxT+q4sf9UyZ7OzzvdylXdSe8jZ1PnKuJUySxOQN78y7T8XS98LUbN3rIDjJ2Gsnkc//Qv2LfltynQSUOQyniw3Bt8aDJw4ZrKYdjeq5MlbkqcHpxZCabILSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHJb74Lc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kusw2hET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHJb74Lc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kusw2hET"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDLYU922060
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwPjqS2iwwL9J0qfM9lE1UqUVbWkjqsis0Cpn2cwx8A=; b=AHJb74Lcc8VyvrZI
	eKVjevHMwh2OH9yXs0MNVA3mtFMhD+PT6+Ak9jwDECoWc1v9UpgaHUGg2ifaDur4
	4EWxabJeGWKoCMfNwmpl0ftCtbxXTMsjCGRAM0PlBSeLel41nHmyLTaRIlA4bJh/
	gUdPqgehZE8K8m5y9ay3giq7slSzRsZyexRQuknHNXbGRZVE4bNHuFtbyy4amMz0
	t8JgYPkuFzzTG4mMkfqtaQY/Y42JRrdJreWcA7X35PO/c4kafYalxbVhbClEZvz1
	7UWkD+esK7MB739svrCmMY9jg0jla7+5dSqgOtBacc8tJ9BjJmh4w164DJE0nYAP
	TOfVeg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6qn86dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:21:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2289400b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785417705; x=1786022505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwPjqS2iwwL9J0qfM9lE1UqUVbWkjqsis0Cpn2cwx8A=;
        b=Kusw2hET5gsqF0ytuKk1Eg8EBTY1XiM+oV/8eHy+axm2gn3T0TKO3eYC8tWo3h75Bi
         Cn2OhKTtC3ozLfBw84V98L87V34Vc7n/uGdNkN5W8aSvn5D49y3gZ0VXH2ycIl9/ZEED
         Ac5/6MG+LAH/NIZ7ispLn/Ca6yvnVbYfP3VarcG+E+fAiLtrFJ/vdioWO/KgXLqDJc/F
         1Mch9vlB8bdgG/dTIYMBxNvF7B2jz73xVWhBGpbz0dBhGeZkgg1gBqIDgdy2xUuB7z+6
         lt0a7q3HRBQ7ugvTp+Yw8Q7cWXv64uH8k1MU6ZsFi5XK9JnZCAE2Me1PzweVATfocF8s
         DNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417705; x=1786022505;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwPjqS2iwwL9J0qfM9lE1UqUVbWkjqsis0Cpn2cwx8A=;
        b=g+EMN/srqsnlQ4wu2MnAqKg1yWdG8zlru9OJmNKnR7FjC9kwgS5fHMnLpcTQ+YlacW
         YXYV1nZsceMSvglQEWGvEUWAxa/IPAS9oSrZ+J386yHTtgXHyIk7GSS0gdVOE//HY8zn
         bh4C5jbH4czoeCwLdb60waOxce2H4slJ2GPRJG9AmlFdoS4P0Yi3eDcYK2gAqmneGYJq
         GCumfvx217KWPK1IrzXXMDIHEldzXSW53UBxwd1NLh93RsTa7ZVnLTt0P4UK99wdri7J
         VNu32wds1Buov8gmSlmUT0W+wr7LspEDrzEn7RYGn280j1uoY1PmqsN8ajZU/6mDHArI
         X/eQ==
X-Gm-Message-State: AOJu0YzMrnMzalpKSQqbED5Ciml1XucNnOVF9MdkoVOqrpkl9kYFxEaN
	N0e3pxNTfDFHIp92za1WXtu99zufKkcZaSMj7ZHkMqATMxN+LHfejk1QJSRP6Sc3O/Xd/UQSnRV
	/J/hzxg4M8zl+U4Vm6pERdxVZ2uWyXv0oFo2ahlm1F1wVaPEyzja1ImAoSaAC2TWvMLT/cr0t3p
	Ks1jMfVA==
X-Gm-Gg: AR+sD11/OPC7krwwyeol68W55xL23VB8j2LrPnaB28g1S4jga2QGorOmMbxMCL2dw87
	UDDwYm6Y2dhHwWDmfXHeDVtky6In5ysgyHXkVPFK8QA0F9hvtweX6a+XtEKZDJtW0VdRU3oi1mf
	MFh7T0fnGI7ia0xjPnRZrnm5nrcOnxJoLTzdmojQ/Wn60+IbyRJH0blYe70x06IMKPwlpdZO3pM
	XVRSXoRzgGTQR998iYwcioAdhU/DHaJt/vAod3UBW0FA+EcbpR/+Mcjsv5wJPvPdc5uRVn/in3m
	C6KCKf9fU+Z6WZ3wYENjsg7v/bgvd8S3+HQibSHIBk+BRdaVbcK2LBlq2sGTWFpXyEV7Le4jTNi
	E6yPqx0PwT7jpsz4+q7mLaFs98Xn8/RXntm1ZGvLOjreWNvjErqFyLewDKDHxLI3E
X-Received: by 2002:a05:6a00:3cd4:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84ebc2256aemr2747425b3a.20.1785417705401;
        Thu, 30 Jul 2026 06:21:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd4:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84ebc2256aemr2747394b3a.20.1785417704774;
        Thu, 30 Jul 2026 06:21:44 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa474sm3085471b3a.30.2026.07.30.06.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:21:43 -0700 (PDT)
Message-ID: <95fc42ef-2399-4448-9e75-a3709673004f@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:21:40 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-6-a8b8679d215f@oss.qualcomm.com>
 <20260724151116.0950B1F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260724151116.0950B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMSBTYWx0ZWRfXwLSls4rCpc73
 yhNg2X7W23ZXQpTkxm6KsUIsDMGTQjhgcLtMwplvuSGaIc4dwpn4/jKigrpQ+oQsHqVwDY63AHg
 vM827sZJFgpjtoDgfjQ2r9uT3xWo6iGU626hyQ4ABS5SNCDErbFmtg5ft+gNs5oNp2/oI7j+sv7
 npJcU10xXZ/MqP0kokUUAvrhutYNFXSAmNBiT0awWniteTRBDXQn863fO4Y/PrTOcCXyA8qw0W3
 WkXUXufq7StdRPAjgpxDTt7lhaagXd9J+gKlZoiFhlzPLA9P8HY2snTtLrBZv3IbKafxp1Bc9as
 sZiPzbYy1LplIQx+sVO7LF0w0nDLBalCEeIJ6VBCyUzXir1Hs6CMXegx/t4O9wQkPLu4UGy8OAK
 zS8Sq9YI9rRrUqprBgyjooqiFxVDZUCbf0B5abHrZr6rub+//aWsz08ihhZjtmX+F0+jNDmzppB
 S1qFBPxOXEnm89LPAEg==
X-Proofpoint-GUID: UyyyrZ181jQo2LVesqWmW11cVmHoTq-_
X-Authority-Analysis: v=2.4 cv=H/jrBeYi c=1 sm=1 tr=0 ts=6a6b4fea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Y55TzUOTM1hpNItK5kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMSBTYWx0ZWRfX4tfo9WUqgQq7
 qfytPqgt77iURZ4dXiQ7sTYIZfUUS9RQcP085gwD4ZVv4QUBYa/f33sHeFVRnd8QayaMSEVnaKr
 7tWiWHyWrIvUGOxhGQY1wE0UpMNXNis=
X-Proofpoint-ORIG-GUID: UyyyrZ181jQo2LVesqWmW11cVmHoTq-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300101



On 7/24/2026 11:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] 64-bit divisor passed to DIV_ROUND_CLOSEST_ULL causes 32-bit truncation and potential divide-by-zero panics.
> - [Medium] Non-atomic register updates when switching to PON mode can cause transient invalid clock states.
> - [Medium] `clk_pon_refclk_determine_rate()` returns 0 on invalid rate requests instead of an error code.
> - [Medium] Missing PLL analog soft reset when entering UNIPHY fixed mode.
> - [Medium] UNIPHY mode is incorrectly excluded from rate rounding for near-match requests.
> - [Medium] Missing error check on regmap_read in clk_pon_refclk_recalc_rate leads to use of uninitialized variable.
> --
> 
> --- Patch [6]: [PATCH 06/12] clk: qcom: ipq-cmn-pll: Add PON reference clock support ---
> commit 66c5c5bce6266424eec1b5f6855bb022b40a0322
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PON reference clock support
> 
> This commit adds support for the PON reference clock to the IPQ CMN PLL driver.
> The clock supports UNIPHY and PON modes, with configurable dividers.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 020ad12ca1f2b..1ae32052b5634 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> 
> [ ... ]
> 
>> @@ -540,6 +545,155 @@ static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
>>  	return &ppe_clk->hw;
>>  }
>>  
>> +/*
>> + * PON (Passive Optical Network) reference clock operations.
>> + * The PON refclk is derived from CMN PLL rate / 2, then divided by
>> + * a configurable 8-bit divider (1-255).
>> + */
> 
> [ ... ]
> 
>> +static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
>> +						unsigned long parent_rate)
>> +{
>> +	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
>> +	u32 val, div;
>> +
>> +	regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
>> +
>> +	/* Check if in UNIPHY mode (bit 9 = 0) - fixed 31.25 MHz */
>> +	if (!(val & CMN_PLL_PON_MODE_SEL))
> 
> [Severity: Medium]
> Could this use uninitialized memory if the underlying MMIO read fails?
> 
> The return value of regmap_read() is a standard negative error code on failure.
> Since it is not checked, val may be left uninitialized if the read fails,
> causing garbage clock rates to be returned to the framework.
> 

Good catch. Will check ret in the next version.

>> +		return 31250000UL;
>> +
>> +	/* PON mode: calculate from divider */
>> +	div = FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
>> +	if (WARN_ON_ONCE(!div))
>> +		return 0;
>> +
>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
>> +}
>> +
>> +static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
>> +					 struct clk_rate_request *req)
>> +{
>> +	unsigned long div;
>> +
>> +	if (WARN_ON_ONCE(!req->rate))
>> +		return 0;
> 
> [Severity: Medium]
> Should this return a negative error code (like -EINVAL) instead of 0?
> 
> Returning 0 tells the Common Clock Framework that the rate request was
> successfully determined and adapted, which will cause it to proceed to call
> set_rate() with rate = 0.
> 

Will change this to return -EINVAL.

>> +
>> +	/* UNIPHY fixed mode */
>> +	if (req->rate == 31250000UL)
>> +		return 0;
> 
> [Severity: Medium]
> Does this exact match prevent near-match rounding to UNIPHY mode?
> 
> If a consumer requests 31249999 Hz, it seems it would bypass this exact match
> and fall back to calculating a PON mode divider. This might yield a worse
> rate, even though the hardware inherently supports exactly 31.25 MHz.

Good catch — Will update clk_pon_refclk_determine_rate() to compute both
the fixed UNIPHY-mode rate (31.25 MHz) and the closest achievable PON-
mode rate for the requested divider, then selects whichever one is
closer to the requested rate.


> 
>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
> 
> [Severity: High]
> Can this cause a divide-by-zero panic on 32-bit platforms?
> 
> DIV_ROUND_CLOSEST_ULL() internally uses do_div(), which fundamentally
> requires a 32-bit divisor. When the requested rate is large enough,
> 2ULL * req->rate can exceed 32 bits. On 32-bit platforms, do_div() silently
> truncates the 64-bit divisor to 32 bits, which could result in a divisor of 0.
> 

Will switch to use DIV64_U64_ROUND_CLOSEST() instead.

>> +
>> +	/* Clamp to valid range (1-255) */
>> +	div = clamp_t(unsigned long, div, 1, 255);
>> +
>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
>> +	return 0;
>> +}
>> +
>> +static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +				   unsigned long parent_rate)
>> +{
>> +	struct clk_cmn_pll *pon_clk = to_clk_cmn_pll(hw);
>> +	unsigned long div;
>> +	int ret;
>> +
>> +	if (rate == 0)
>> +		return -EINVAL;
>> +
>> +	/* UNIPHY fixed mode (31.25 MHz) */
>> +	if (rate == 31250000UL)
>> +		return regmap_clear_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
>> +					 CMN_PLL_PON_MODE_SEL);
> 
> [Severity: Medium]
> Is it intentional to bypass the analog soft reset here?
> 
> The soft reset is performed at the end of the function for PON mode. If
> entering UNIPHY mode also requires a soft reset to reliably latch or
> stabilize the new clock output, the hardware might be left in an
> inconsistent state.
> 

This is intentional — the analog soft reset will be removed from all
derived clock output paths entirely, not just for UNIPHY mode. Keeping
it risks disturbing other already-stable clocks that share the same PLL.

>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
> 
> [Severity: High]
> Can this cause a divide-by-zero panic on 32-bit platforms?
> 
> Similar to the determine_rate callback, the 64-bit expression 2ULL * rate
> is passed to a macro that expects a 32-bit divisor.
>

>> +	if (div == 0 || div > 255)
>> +		return -EINVAL;
>> +
>> +	/* Switch to PON mode */
>> +	ret = regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
>> +			      CMN_PLL_PON_MODE_SEL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
>> +				 CMN_PLL_PON_DIV_CTRL,
>> +				 FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
> 
> [Severity: Medium]
> Can this sequential update cause transient invalid clock states?
> 
> There is a brief window where the mode bit is set to PON mode, but the
> divider has not yet been updated. If the previous divider was 0 or
> inappropriate, it might expose downstream hardware to an invalid
> frequency or glitch.
> 

This is intentional and acceptable by design — the clock rate is
configured before the connected PON/UNIPHY is brought out of reset and
reconfigured.

>> +	if (ret)
>> +		return ret;
>> +
>> +	return clk_cmn_pll_ana_soft_reset(pon_clk->regmap);
>> +}
> 

