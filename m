Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCCF315D32
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 03:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838112; cv=none; b=JhjKaXyVtFTZbma78rNhjj0ftdvIQqoIz/466kEKpTwRYZ183yOFztOaDcWvzfpGdVxdjTbVMjtEf7zkN+3G3KmwXsb8/ZoZUxgTYcybqBi8eYqSZudlf0MWcjokzoPXRQ/G6bueT8hbsDz1GLTh/6z7E6kBCuOLZtPTztf1az8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838112; c=relaxed/simple;
	bh=SyhZKiR68CZ04tzIfEj/DtTdEFdN4/+8mi8sTjIBL/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SixWVUqdXV/FJKBz7hY80wkKkQ0ng/qXfizLUlMv914ABKsh1E6P4c3PQC9MTwRseOcrQAFM9HGCNOzmh9JbDOkAsPlJkbYiCtuQRhM+1WV4F9ho4HHSr6n0XDHVHnuK6SfUbLWWG8brRIqeTBaGBlLsGjLIoNXqi6r25MAxiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSZM+V4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqjPAvpU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSZM+V4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqjPAvpU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlLmq107470
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 03:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=; b=VSZM+V4Do+jdXhlN
	2d8azx9IAXqGN+B+Jdai8z71xYN2/OXILt/DaCSL3p0P199h+aw4VxYB5NCbFmaR
	0R7cBAYLyNtkJmoSteNTq//yf7tc14L1wqQfbGLuV0D9PgbrEpgNOF1oTsUqt+3J
	0UHb0n7nb29dA7CKDTmdBu2TLbn5K3e/vVnCndA7OARl/cTzykP9wWAk16dh7tcB
	2sXcKqIzEkOAwuzU6mB+7lwElhWKYSKfpCb2L3shTFMRHrI0Vzs9v3nitoNWpzld
	/xyihy9TvDT8c41fTh2bgupuavgd1II4cvRXGoBJVUcuaN/5fq2ZtRu1N/AXuAxr
	ezbpLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty336j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 03:28:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so5682915a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788838109; x=1789442909; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=;
        b=VqjPAvpUR19/Dg0r+j8FdBffip35KtFJ9APXw0HnZPKn9cbbu0N7kns8JRUaw7Kr2U
         7aM6gMVoMWu2z+p1kdpXUDnVrM/QUWHDXS4qBCytnwIdaDA8aqQdvJYuYPGPEdPN+uzP
         yaFs2eFkNDMsHUEOdia5uKgTe4JAcRY54C49O8ChgogTJWLkKsPkSVhArBToQWVv1P6e
         fNMS+S5T+PvIFD3I1heZzGJaJ2lXrSn3/0f+VE970tE8LXL+KxmsbSzzKLkwGeNxLbSL
         tBUTOnLzt9tExzU70719KduGalAk1SLwWBPjAbMIwirTJ2Fxh0AFKxOE1KsIUyEv7SOS
         he6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788838109; x=1789442909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=;
        b=QzbjGEaHHBWDI9u2raF9xRpuqeHnWutHskit6gllqdesWXwUZmsQ7GgGQOvIpkGLMh
         b4OKBqvI4beWD8gK+lzJYBIC3DvibTn+R3SREU+z/1QFXTTFXG51ToC9KpLHw3fzt7HM
         Dh4wIqAcudD41zUGOLxpanzEs3f3mE4rxToZVdXDyYBulFJzTNo+y99G+xgysRmzLDAp
         tjqqtzEM5isYYzazngcNy9Wz0fbNkPLkKLFSNRDOUkIKOfaEQ/nidaCiKDDg7P5AIG5L
         OqSLw0ee9E8+bEH/FAaXFgYvPY8gU8MWiAv0JO7vNB3c4GmlcTI0Q3V+T5wbmtshldFp
         h9Qg==
X-Gm-Message-State: AFuF++nCXt0yhx7yci0KrjnYllmf2qfGvML1y+KqrjDJ7/bLnyqSeL5d
	4gYOnS+XYD3sOAMFYdkEvNBbQXVyeesSqLb/nSSbelmRj+gJxA1wjxuT2AhutP5kIuf4nh5V52D
	QJgUeHBqiqHf5ZfNzqvRUKSsz8UxdnC/Y+Vi87eZm/+XAMqSpsBmG4sdHqeqFleLr45qVVRVKXC
	ZQE7I=
X-Gm-Gg: AYBFou3xDOwQhl7K4K+xXL1KDwbJBVk/LqQlZpOJ+D+k1gWaltMblTJLgaF+UCYYVuJ
	jmvpb0O7SxjwzEVwbs8OdUIr3HTzE7Gt6CA1NGHnEzdf67wxBPr2Iytip7mQ+WWLuqptLXFm9vt
	UAxChwIl2Bu1+9zGTri1yqfDklDLDALnQH0krrsV7v0me83z1F69JaIusH2WZUqtJEXv1h0o98h
	XB7/QeIDN0yMFXWyLIXh9A94SwP2n3Pe7sHRHMfAVSBa0ze/WQ//P2vIy+7e2x1ZDrSWQu7+ect
	vs4fXdAMg63k38ZrQsv/o3ftc1G5mj1gBviNgzrZQwziIJORLIDWwWm2TQ6jwVUeZzCMgLTxHoT
	MB4RYTTKhWTf7bAOh4jTAZy9VBmcUp1OHNqyY0Nw835GF+NgE9CIG7FaQo5iSlRr/
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr3836552a91.11.1788838109311;
        Mon, 07 Sep 2026 20:28:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr3836536a91.11.1788838108871;
        Mon, 07 Sep 2026 20:28:28 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm29612468a91.4.2026.09.07.20.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 20:28:28 -0700 (PDT)
Message-ID: <43a9f5ec-c8c2-4e3c-bc78-b980ead0ed5a@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:28:25 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
 <20260906-qcom_ipq5210_cmnpll-v4-7-aec5ed642f4f@oss.qualcomm.com>
 <20260906142559.17FE91F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260906142559.17FE91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f80dd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KbbPYYVOdocP4CsVI9sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: gRqx7yIDnnu9E_SWQ_ORnpHhxrgo-bis
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfXz4ZrgKoutmch
 TY1ANVCYLJNOtwIDlU9eJL6OLmVAET44HQzZFkn+TbnZsZqseOoKyWNXvLd4vsjNz5w+yTtv4bm
 eE4+YVMuV8b5tr/sGOkSJ/1y9F013eE=
X-Proofpoint-GUID: gRqx7yIDnnu9E_SWQ_ORnpHhxrgo-bis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX0azuvH+W51s6
 uL0w46DAoDsVDlFOizSJv+BsjQ+crXm4gTK5ittuvkWnHZ8+S+B4tnrMz+t0qsbLwtbqdXKZpnQ
 tzjF8T72iZ9Mi8ZZHM58lSz4r7ydv2Z76S4row1t/QvvKeETSOia7XxbeJIxdSTai7V68Vb4MXl
 NXxo3MVUGXI+wfTVFSvEEh7gG6FAgM/Uqx/WnsLdzCmGJRxFZkuacIa3YpPp6JVboy5l1h8RG1R
 9yHshe+v/9Ebk6LnA6Qu2Ae/Q+DTh5BsU1zc/nm/om9284weQy2sfE8gjFeB3UpcUscQYaio22/
 W0H+RQQn5zAyMz91o2SuIFGWeyeELfecyxocz/+673bXIrW5WT7ZnhKtK1D9PfUmH/1e7TI7i4/
 2P565xEugQF+Gc8L0ubaN88Qp6yBoB2BWxbJsCHRR7vYeHmk1wMf/6MYn1x05DsW9Jrd9tEiYgg
 WspFoGYPhoRO0+mwugw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080034



On 9/6/2026 10:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk_pon_clk_determine_rate() incorrectly fails valid rate requests due to rounding at bound edges.
> --
> 
> commit 9a9a4823a8ebca7e3c30590799eb2ac41ada876e
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PON reference clock support
> 
> This commit adds support for the PON reference clock to the IPQ CMN PLL driver.
> It configures the clock to operate in either UNIPHY mode with a fixed 31.25 MHz
> rate, or PON mode using an 8-bit divider derived from the parent rate.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 44d035870a89b..f12352a707f7a 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> [ ... ]
>> +static int clk_pon_clk_determine_rate(struct clk_hw *hw,
>> +				      struct clk_rate_request *req)
>> +{
>> +	unsigned long div, pon_rate, uniphy_rate = 31250000UL;
>> +	bool uniphy_rate_valid, pon_rate_valid;
>> +
>> +	if (!req->rate || !req->best_parent_rate)
>> +		return -EINVAL;
>> +
>> +	div = DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, req->rate);
>> +
>> +	/* Clamp to valid range (1-255) */
>> +	div = clamp_t(unsigned long, div, 1, 255);
>> +
>> +	pon_rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, div);
>> +
>> +	uniphy_rate_valid = uniphy_rate >= req->min_rate &&
>> +			    uniphy_rate <= req->max_rate;
>> +	pon_rate_valid = pon_rate >= req->min_rate &&
>> +			 pon_rate <= req->max_rate;
>> +
>> +	if (!uniphy_rate_valid && !pon_rate_valid)
>> +		return -EINVAL;
> 
> [Severity: High]
> Will this logic incorrectly reject valid rate requests when the closest
> divider falls slightly outside the boundaries due to rounding?
> 
> If a client restricts the bounds (e.g., via clk_set_min_rate), the requested
> rate is clamped to the bounds. If calculating the closest divider for that
> rate yields a frequency that barely misses the min_rate or max_rate bound, 
> pon_rate_valid becomes false and this returns -EINVAL.
> 
> Should this code check adjacent dividers (such as div - 1 or div + 1) to see
> if they yield a rate strictly within the requested bounds before giving up?
> 

It doesn't hold up for this driver, a PON reference clock feeds the
UNIPHY/PON that needs one exact standard frequency (e.g. the 31.25 MHz
UNIPHY rate, or whatever exact PON-mode rate the line rate dictates),
not "anything within a window." A real consumer would call
clk_set_rate(clk, exact_rate) and expect either that exact rate back or
-EINVAL, never clk_set_rate_range().

>> +
>> +	/* Pick whichever mode gets closer to the requested rate */
>> +	if (uniphy_rate_valid && pon_rate_valid) {
> [ ... ]
> 

