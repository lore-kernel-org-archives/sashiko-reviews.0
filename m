Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7D0426D13
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417403; cv=none; b=YJmhdrBCms5nnGwRABacqANyezPl6sJHwJ4pbVPx62ML8oY7RekpRmukaGWtgRofpmu1eFrPqBKHoLgQvcQukcWSidxeYejGyZ06MzNjoUnjIPoh44ciEpx0ziZMAlzzq9V7OisvaoG75SSIEa189c+sMneM7GvzTqIA7fwX+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417403; c=relaxed/simple;
	bh=5eOyDQoJrw5YYOkzYcTNWz8jp8C5rN8jkUTDfGDLP7E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LxQkZOCJ/yo1KoPosFMSV70Z2//Q8wXe6bOIFaNXaorAeMzEbEvSk/WLkHSo3ZGnCV9LanjVe7dxx+Nj5vP0YGzzz2mA45aUTPzxhT4t5M5BnyQwvMi4w0M8Rm3+VARIOFW04m8xLbbD/S855u3S8ouKW+eCvfq1mIu25vzyc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qbg/Rggq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2ng4tmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qbg/Rggq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2ng4tmH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDJ7S716096
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5v36SM2PBcL6vte5TmMFSwAC0hmYbuFw7H8GsnB79E=; b=Qbg/RggqO3fLJZ38
	aBQslvRZAPCc0LyGBdwv5bLYvBsSk2SYqx2BOt8kURmfMJO+08We7e77iv1j79SE
	d9bm3xXxS6360fzosXvC73O+bxcT+YtamrXPr2dFH8B345uIVLNCNc/9bAPF1LQN
	TC2QEdsvzFD0uerNGcAQt7hHjCLzxac4DouGvP9WNUqlmWFO7XKQM8/i87l4sfII
	JGz+BnIxHQ0HuWvcjAsz1frRHRFCDQzZnJQWr5fMuYDILddydb5uu8g14bdbkDZP
	0AjLCDCc0PDJMHgUXIh/NseCOQ1XoU2zlXgBVOWBGJ5HY5jxVuCSexTd5SmpuBMM
	kkGuxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ucr4vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:16:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so3112104a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785417400; x=1786022200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5v36SM2PBcL6vte5TmMFSwAC0hmYbuFw7H8GsnB79E=;
        b=Z2ng4tmHCCIX+92dplRCam0a8Gp5SabAqu8dXxJPqC+WhRA+sUN3MAoSwkusPFkBhR
         ExotiStbTOoa8eqGqcDe1cZfA9roCwJzfH6yT0vSKiCSpooZCi9thVHhtNCU8zTqF6/k
         n2crW+ej5VpS1BebdxEjEW3XZgyi2ZLgmWgi70Ch7S703vnl4ZJZTzl6er89e92SStii
         gBuzWHdM2xmnqgggedpRCMVCoTb3bjxUkEXF6AafVgLKGiWRugWYT8Yv5OkAX9B5qB+o
         QOYVTGCft5LyG7uhjBQoX4z4VAiDw8gCu3aJ2gs01cIDtMVzMgfVPQcSB5qbgZbGA3CI
         IgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417400; x=1786022200;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5v36SM2PBcL6vte5TmMFSwAC0hmYbuFw7H8GsnB79E=;
        b=jT7jXr7SNF8CdFUaO03mtwGJMM0uiREnTXaJ1/W1oqo5QWrQcXaPQrH3+uhd80lfXJ
         ckGFiW7ncAWkgpX2f35XckFMMiDZp0EF14yYkqVj8D1tM6AA99pLX9A3T+Fb1/NMeyWc
         za34VHQpYr1DQ5vX4HSIGgHwpSQEcNCCwA384PSp5elzxCIlT5cZI8mQLBn95JeyGYmR
         k1zYh5eeYBeOhDAHq840GJvqpOwrZEEaNRmNM0/QNnDmApOjALwOIGGSpmaG81+TSxlN
         rRhgQyEIzwYZzugnWYekrYVHStQiou/5Mms9cDipzBMbZia+1rK7rOSedoTE3nVzWjMO
         +MrQ==
X-Gm-Message-State: AOJu0Yw0hj7MBcyamIMOf+Lsi6Q8BcsEhNqUCFQQg/rlY5343XNewziW
	AWJ1ETRXdvmFEKncY4OLyuq37Ol6MNgfus/UyduwuG8KrkmvF0SWJBtK7OzwdbKwKI26RzaDYEM
	Ybm26zqo/e2ER5L2qWfGEil62H+NbndgiRyMac4zp94SXqlcsOoM0q4I98HmEDsgKauzB1xPv1A
	MfaIJuvg==
X-Gm-Gg: AR+sD13FmYNb51kZJOEUMURkoLLXp6NeyZLWXpO6f0tZ1jDsgSmTK4qe8swCh2P/5Dd
	9jNOqKhPzXM95BbCMVi7+vkH7derBmLy8Refz0Fe5Hyh85cTCmR5jZ1F3Mb/DdwMCRg4MUu07T1
	B6ei9huueEf2spdklSUreU3QDKDojyytKoMQzktBK6y5Z7ZyZ+hVCVXM+xgVfqAoc8aWw/UgCm9
	h5N8J5lcsxzUWM3jAYcn6jbGNw8/zMQZbg8U2+p1NUht3o66CeLfgC7Gb9iH6h6pSAfZKXiFFsx
	kh0XD6FK7HmePvKUYMf5rC4G8m8JpPyZE+X+HpjjiKrF5tN9/CgmJQVopf5HuxG6JtD8/X1QVW8
	Mb7FilVAfCMecAafacaq4v13Ih3w6miZjUrIO1bNifYaknaX9YqWV4+z54S+QUxr1
X-Received: by 2002:a17:90b:518e:b0:38e:6ab:32e0 with SMTP id 98e67ed59e1d1-38f9c076d30mr2061942a91.39.1785417399915;
        Thu, 30 Jul 2026 06:16:39 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:38e:6ab:32e0 with SMTP id 98e67ed59e1d1-38f9c076d30mr2061904a91.39.1785417399499;
        Thu, 30 Jul 2026 06:16:39 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b770e33sm1081996a91.15.2026.07.30.06.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:16:39 -0700 (PDT)
Message-ID: <367ecac8-80a8-49bd-94f2-6be37e81ee5c@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 21:16:35 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
 <20260724151502.E83701F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260724151502.E83701F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMSBTYWx0ZWRfX004gonto87HT
 4sxXXidc66cc+X0cakkFhfBRgdF32J9fjBM7DLsQiwQNEkFgq6XrvSOfn1C5+AIu5DVUDoGTFV7
 C36JSgvVYqCUymlhGi3uif329PVgdKs=
X-Proofpoint-GUID: Jnxz7QsHZTMHyWEFG-id94jcSfhpmlB9
X-Proofpoint-ORIG-GUID: Jnxz7QsHZTMHyWEFG-id94jcSfhpmlB9
X-Authority-Analysis: v=2.4 cv=W6QIkxWk c=1 sm=1 tr=0 ts=6a6b4eb8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QqhB9etXKecXXbLWvLgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMSBTYWx0ZWRfX9gTt1HDNLfC7
 lmCL0Ug+Db+wyT5Iulqah8OZThk7y51OXyVXtn6FwbFhBhFikK2CxxemtX8rPBvXglNpJvNE/05
 3sKfRuz88R4TKylpwJF3oqekavhFAngeI8jF8vNHmG6i46hwxFP3TjTpMhTRHPH/1Ba+j5elmvq
 afire3UWNGqDDBVuPfiRFYXsEDKsLZhwLyKdhs3OcSaDwurFRYmJYObvzS9nEv5OG1nK+a4Ai2t
 RVxOUIZxV/eIU5N8dUIxy35pODmxgXM7MqpFr2s2+CogjJyZvVqttM/eTS7eL1+XrBheGRKn/xC
 c1v6hkxUDZx5z1GLBpLUSUb6kPV9953LDkU2UiEqF5I9rY4JLHUxlFa1shF1C9PcRJ4qHp2h/hY
 /EPqrv2/+akO6+Cc3bJZT2nW9ljo9+QVgI4NuADU6clYlZPeMLt1HhdyL39dKUTVZFp0nH/urRD
 zLn0LWZ/A9pEjgNrEMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300101



On 7/24/2026 11:15 PM, sashiko-bot@kernel.org wrote:
> 
>> +static int clk_nss_ppe_determine_rate(struct clk_hw *hw,
>> +				      struct clk_rate_request *req)
>> +{
>> +	unsigned long div;
>> +
>> +	if (WARN_ON_ONCE(!req->rate))
>> +		return 0;
> 
> [Severity: Medium]
> When req->rate is 0, this returns 0 (success) without updating req->rate to a
> valid boundary or returning an error code like -EINVAL.
> 
> Can this regression violate the clock framework API contract by falsely
> indicating to consumers that 0 Hz is a supported configuration?
> 

"-EINVAL" should be returned in this case to properly reject the invalid
rate request.

>> +
>> +	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * req->rate);
>> +	div = clamp_t(unsigned long, div, CMN_PLL_NSS_PPE_DIV_MIN,
>> +		      CMN_PLL_NSS_PPE_DIV_MAX);
>> +
>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2ULL * div);
>> +	return 0;
>> +}
>> +
>> +static int clk_nss_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			    unsigned long parent_rate)
>> +{
> 
> [ ... ]
> 
>> +	ret = regmap_update_bits(nss_clk->regmap, CMN_PLL_NSS_PPE_FREQ_CTRL,
>> +				 CMN_PLL_NSS_CLK_SEL,
>> +				 FIELD_PREP(CMN_PLL_NSS_CLK_SEL, div));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return clk_cmn_pll_ana_soft_reset(nss_clk->regmap);
> 
> [Severity: Medium]
> Does updating the leaf NSS clock divider strictly require a hardware-level
> analog reset of the parent PLL block?
> 
> Calling clk_cmn_pll_ana_soft_reset() drops the global PLL lock by toggling
> CMN_ANA_EN_SW_RSTN:
> 
> clk_cmn_pll_ana_soft_reset() {
> 	...
> 	ret = regmap_clear_bits(regmap, CMN_PLL_POWER_ON_AND_RESET,
> 				CMN_ANA_EN_SW_RSTN);
> 	...
> }
> 
> Will this regression interrupt other derived clocks (e.g., PCIe, WLAN,
> SYS_CLK) and cause link drops or system instability whenever the NSS divider
> is dynamically updated?
> 
>> +}

I will remove clk_cmn_pll_ana_soft_reset() from all output clock paths,
as it is unnecessary and has been confirmed by the HW team to adversely
affect other derived clocks.

> 

