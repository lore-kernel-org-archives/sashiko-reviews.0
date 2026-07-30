Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD5C42FCD6
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416956; cv=none; b=LPHe19CHBHwOjBuwcy8X+dsbgI+RoDITvUewiDL3sDJMUESGKAceg4og7VekN7NUQmTIkcVohsMboO7jgC2qeM2nZjEBO6dy3hey7sajXt+oozYpB1/8qQgUgKRFqxDvynFVsUQCJmlIcHnRnXwh3bLEfl7hW5iRnE+D4rYjt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416956; c=relaxed/simple;
	bh=GpgXBBrgTsPZYKnVmLmv1eLcstloi8OyBMAthHlNGjA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JO4Qv9AlaFIcmOJQqieJ9YOedwP2PTr/vgeNtFFUEsbgMR0UGWm2iMWYZwpm4U9mm1Sxm7yoKrCfZ1dKHC+rjrtDceWKTfeoM3Qu2t5cqprTqIwx1x0r5YZjTPvhJoSDjZMbHCCTbP9QDtVH74j+FXk9KdWjMy4JOwVhBDIiOlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxMPAmRl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foa5mOLn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxMPAmRl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foa5mOLn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCPZH81986192
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXyVoK9DylIws6i/AdoP5jwmCImOFAT3GjuXpCd+LTY=; b=gxMPAmRlIG3dllfb
	4SxCb3CcnO9o4xFnWgK5i+aOu//3nJ9oBUwp19IBXkK18G48oTwTz+pZuCyaUYEx
	kIJnXYQGnqVJepAOMicCgw8XN38xaFC43wMt5kP0Brmuy2Sh1zHWx9bboHdfm+qb
	J/yQZJGPB3Oh8SkGJtC3cxY5qS56ME+kflNh7KlhgpO1p1WYfIt1ehl1naieHtTG
	fUncjQUAU4Pc0iQgI1tGq4NhcQNaKz0vsc166Rj0qesbahj/SAaJu+0LyPrGjiVZ
	NnTtwyIrw8sJ7wBwkgRhcn1SQJVFMnMRo8OKADFalYpTq/FrAryKhvIGxJrzXL4m
	iJwidw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ky861t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:09:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a3514f912so3845488b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 06:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785416953; x=1786021753; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXyVoK9DylIws6i/AdoP5jwmCImOFAT3GjuXpCd+LTY=;
        b=foa5mOLnrXTqBRZXhC8UOb0a0/x4OllU5vvsliQCxmEEZ51CP+EojUv61jWnUpkfeS
         cZqQBmlaoF6EKCZXNkewf+Y33ncQJRtteCPoLTBCsYRdxBmi/dOCgJ+sWlNU8gDgT6pR
         pSb4BPKBl1kHafjM9j6qO+QRjA1rJZhDhVHuMWVudNkyZLhjUSNc0AuTeqZNPQ5kb2xR
         20krs08jyxfSgDCp9dK6u4jNL8qizj4St91zeclIHUDJcMGKHIq2o2LT5vZh4Zc106rt
         hU6Jl13HT7knYRhIgu8Oe7+zh+HFtuTMWiBbHkZh7LFZdS54Eqpap+3HgyyNJT4R+bnb
         PSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785416953; x=1786021753;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXyVoK9DylIws6i/AdoP5jwmCImOFAT3GjuXpCd+LTY=;
        b=EjxSKLN3d6kecMXMDKg6GAaGgsGAsUO55uKun0AkcA7wCFsfU+z/KlyjErKJyMK1JX
         kjqp63JQvg0D+nG/yt8aqN8J7DsAE8qtO2/DJ+ojEC9il4LVPMeLbQgzqwLsMspGjcMt
         FLv91A05lSm4hTlktGNgicXXXXI2DLrhG3u4cUd38pQwNYIm/MPMOcC/HAs0n93JG4tk
         IzLd21YkAgv3W9EFNnyylSVFeniTUc9KcY6FwHcv0P3fFkBIG8u8ZdzhYmg2ZsTAsaO9
         DHNY/9vk5Ck26EXHooBovuEdoKPDKcHw5k9MW4RkeNX8DD5czZTkVI9cILdcazJ56h6/
         vjVQ==
X-Gm-Message-State: AOJu0YyLk7HOKRyq9EF0J9kT9T9+WTsP3pc61exbbizZx/c7qA7elMWU
	VsQQCgr+ePP2VUronql+4MOeF8l9BnzVqCGaaRxK0B9b/DPfSBcBVCSqUVy6o/o0TI/4n5bDR8R
	tgfdK6mNpjm80MPx179H/+ZNRNoNRuog1lUaV1eJ65eI4ngekWbyWrxt9c7r6BvXt8EHSKYyZA8
	30NqRaoA==
X-Gm-Gg: AR+sD10ny/DxlJv5OyLVfdNRKEiCrY9tKcY5owzu84QIKjXCoMzT7UXqg4a1I05iBss
	Rw3BUGE0YKOO+3Pi1Kr1b/BfmiJOY0L3OUjIkhipWLnNj8kAbrBDyfYbVBTsDvyezVudbFOqcsJ
	HjBJl5FLM2tzbDSTv/q7cAfEbsBRMmuDs71WwTMtBDeaYi/d7DaXX9vpFs4O/1p3z12jy01I2BY
	2dH05GrNrb1IBCXYMfBqTzjMcv2nzDrnoVStsTtKjcdptu63yhxsfJGuL5M23v5tLnQBPQ5d7GI
	xAFG5OXc7l4p4e8m9fVBskXJCk3I1p1eJJxPiEGKsncmu+AdaxywQ9FqThWt1jV22Yuo5cYtMH9
	vK+znqlT5zI9jI+2Dp2yO2bb+Lg6z/NNOwPME/gXQxTqV1AkKvGnUJkfLwbNA0cH1
X-Received: by 2002:a05:6a00:94d3:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84ebc40a397mr2319865b3a.70.1785416953342;
        Thu, 30 Jul 2026 06:09:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d3:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84ebc40a397mr2319832b3a.70.1785416952816;
        Thu, 30 Jul 2026 06:09:12 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373ad9sm3095740b3a.40.2026.07.30.06.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:09:12 -0700 (PDT)
Message-ID: <546a6c0e-889e-4f38-9ade-805529c1ae78@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:09:07 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-5-a8b8679d215f@oss.qualcomm.com>
 <20260724151928.CFC1A1F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260724151928.CFC1A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OSBTYWx0ZWRfX09fXYzTd2sjP
 7jZrfs/rMw/hOLVxa1mqAQRobV1eiw5GjPACW+I1yL8EVA5ostzmiCjtiQEIXO0N2P6CbT73+0M
 ZH+nPJSLQGR9afvQitX00lHQQySOybwCTA+zi9bfJpnNwvNz9dz1F/qq6ZKIq0xoSqx4FYGjKXV
 VwjyYbSxxo8NgTFM98uZVEzkcZITkjUtQpSiPWAjRlJVSYpFMKv4oC+bqEnZrx7hH9kn9nbxyFV
 n3c60K0c4WXnLhj3wpMVa8X1zX7hd3qwuiL9xYVB23Wju5cr0l9zRkm+cu/GRO9yRVtbRglyzez
 Quca4aI3MLjMA2hhI9PMUAVTyLyiCXVASlkIYXTv5S33XOjTVEcLOG10daw6wkK0KfCMkVVJ+wF
 DjWVMFqXF27ITmu5DQxNxz6Tij4VoCYtcfJu9P8N801LQ+V4dRjH6D0xmKit24+FEg3jlGGsk/4
 iQBGPwG/wEBs0BOBa9Q==
X-Proofpoint-GUID: OpGMlYkZMXZNPOSjlguX1Wzs5fAEtjOw
X-Authority-Analysis: v=2.4 cv=ctOrVV4i c=1 sm=1 tr=0 ts=6a6b4cfa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9GuRNae2Cp1ORx1i7rcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: OpGMlYkZMXZNPOSjlguX1Wzs5fAEtjOw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OSBTYWx0ZWRfX7Uk9TFp3h0oR
 HefSpIaH2LaGKHxZZmvudWZRO83ploB0wVoMVM3oo7YiFdKMCQDotmdY2Ly82h/SA/u1KevhOlV
 +nUB3qx9/iQGWaO36qFKKS6GBl6Gyig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300099



On 7/24/2026 11:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using DIV_ROUND_CLOSEST_ULL() with a 64-bit divisor causes a divide-by-zero kernel panic due to 32-bit truncation.
> --
> 
> --- Patch [5]: [PATCH 05/12] clk: qcom: ipq-cmn-pll: Add PPE clock support ---
> commit aed5f1938300824fb26726205b9e4ce2ebf415fa
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PPE clock support
> 
> This commit adds support for the PPE (packet process engine) clock,
> which is derived from the CMN PLL output. It uses a configurable 6-bit
> divider and shares a frequency control register with the NSS clock.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 3df326c22fbac..020ad12ca1f2b 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> 
> [ ... ]
> 
>> @@ -462,6 +463,83 @@ static struct clk_hw *ipq_cmn_pll_nss_register(struct platform_device *pdev,
>>  	return &nss_clk->hw;
>>  }
>>  
>> +/*
>> + * PPE (Packet Process Engine) clock operations.
>> + * The PPE clock is derived from CMN PLL rate / 2, then divided by
>> + * a configurable 6-bit divider (8-63).
>> + */
> 
> [ ... ]
> 
>> +static int clk_ppe_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			    unsigned long parent_rate)
>> +{
>> +	struct clk_cmn_pll *ppe_clk = to_clk_cmn_pll(hw);
>> +	unsigned long div;
>> +	int ret;
>> +
>> +	if (rate == 0)
>> +		return -EINVAL;
>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * rate);
> 
> [Severity: High]
> Does this code overflow the 32-bit divisor limit of DIV_ROUND_CLOSEST_ULL?
> 
> DIV_ROUND_CLOSEST_ULL relies on the kernel do_div() macro, which strictly
> truncates the divisor to 32 bits on all architectures. If a caller requests
> a large rate (e.g. 2,147,483,648 Hz), 2ULL * rate will have its lower 32
> bits as 0. Could this regression cause the divisor to truncate to 0 and
> trigger a direct divide-by-zero kernel panic?

Good catch, DIV_ROUND_CLOSEST_ULL internally calls do_div(), which
silently truncates the divisor to the lower 32 bits on all
architectures. If 2ULL * rate exceeds U32_MAX (e.g. for rates ≥ ~2.15
GHz), the truncated divisor could wrap to zero, triggering a divide-by-
zero kernel panic.

Replacing it with DIV64_U64_ROUND_CLOSEST() is the correct fix — it uses
div64_u64() under the hood, which handles a full 64-bit divisor safely.
I'll update it accordingly.

> 
>> +	if (div < CMN_PLL_NSS_PPE_DIV_MIN || div > CMN_PLL_NSS_PPE_DIV_MAX)
>> +		return -EINVAL;
>> +
> 
> [ ... ]
> 
>> +static const struct clk_ops clk_ppe_ops = {
>> +	.recalc_rate = clk_ppe_recalc_rate,
>> +	.determine_rate = clk_nss_ppe_determine_rate,
>> +	.set_rate = clk_ppe_set_rate,
>> +};
> 
> While clk_ppe_set_rate might be protected if the clock framework previously
> clamps the rate via determine_rate, this patch also points to the shared
> clk_nss_ppe_determine_rate. 
> 
> Can unconstrained rates passed into clk_nss_ppe_determine_rate from the
> clock framework (such as via debugfs or a malformed device tree) cause a
> similar truncation and kernel panic during rate calculation?

Yes, DIV64_U64_ROUND_CLOSEST() should be also used to cover this similar
truncation issue.

> 
>> +static struct clk_hw *ipq_cmn_pll_ppe_register(struct platform_device *pdev,
>> +					       struct regmap *regmap,
>> +					       struct clk_hw *cmn_pll_hw)
>> +{
> 
> [ ... ]
> 

