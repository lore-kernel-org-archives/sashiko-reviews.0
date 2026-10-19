Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C963FB7E0
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386065; cv=none; b=Ztwul4GyUFYpLBPNkE2L34yZAQ1z5JLisapYxVGYfwW1UaDJ/RLwuArvI8Z/4vraeKo2fhnzNG4TGxlDI6Xh+LoXukZ9xXNmW0+EdFX/w1VYah2SG1PtCnLKDLAsrLB4cGsA8b0dj6sXw1MQw6zvtais+tckrS3PBsupp/nRrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386065; c=relaxed/simple;
	bh=qg0/cscURycJsdkMQrebTh46raKvBmrkckbAtyxDaII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hfNZpug1yLu1YKQtkyTeVWANqSonmJNUBYpPStY7C4IsNMQ0Ys8cjjFR0dv5LOfVT2+g5wICOw8SSghJN3HRczsGKnMKqiIVYW/Qdrlpzcw7VvH7y+wtLJWJLt2tsgOrl6+XBAg/RFbqzFM/OhN11ThDVsP2Il7mmcvlUbP7UR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxeqxSrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aG2Mjzu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxeqxSrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aG2Mjzu8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j05R1177367
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=; b=JxeqxSrY1RnVQSTB
	xHba8KncJxS5Qchn0yc/UDxrVpQ3MDVGS4QOkSlZemnLCS6tsJb26e5EF3ZTFhnl
	HzfX8ch/4ZtPE04TVAf6oR2e0w3Uwqvy38/YDfhVEGNmI+47k7oq2Rn9bmdigDR0
	4XmmItPMzPwdYS5l48bQcTuh1JwcWlWrWqHmK7mLrTvAovBMTWKCVzm/rjVITcp0
	PAjqxc/48O+BXGR7ZYHa0ap+akp9SoT5PRQf99vbhEXXP1xvfe2xIn4RbcN3oNvN
	hCb0wBfSHy4bkcMNW8Jr+oyAzz0TQHGzqWElFVDGfmC1Z1shtooSA9uMVMXDyUMu
	KnvRzw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se4svh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:00:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f67358eso17395295ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792386057; x=1792990857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=;
        b=aG2Mjzu843brdAuLTiFyZ8nwCAjVYLe8uSonNulrx9eFleA1E/gdpCq4k/LYIdbpTC
         ytK+6QC/S7wFthgyZ5hE64hJCo5B2pl15DSNsreeHuyrIyQONcL3blhLMcDaeRhQSDWT
         v2tJFohAForwjCrujpgkZd4muGDdBfCb1DBKe8UTJjFyJmKFzBt70TlslRNO04W3Aiid
         d3bVz4vEPDAGNeevTtxaGWRC+6kNVElK7F95cFAWktiqrzsManZHQmIz3cVdds4bYO2N
         uFGqUuX5kkUc3XicLT6wT1tsRUHtQSGA6trm4TnMA580m9NxaARe0G0kld8GyGBWVHrR
         KaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386057; x=1792990857;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poibRC5zVcH9qn+EiHq8IXMXYpqGERkP64AbTqP792M=;
        b=sO0YKHqqZ1pBG6ozp7+9mt9GM0h0krUNxuD51Ob6SPuVvZ5hXrnRj0Env86Kcr4ruz
         f2gPh+MIvx0OT4nEPp+K7cFgtfKzUlgfdsy1RnRHoiYDCnCmvMDptRop89diuoOHPrgk
         HVzi/4whFB30hbdND71IuaGD4CAji+29abMs/GNKdbmP9v0RRwVtDCoioYmnGvQRZ9yL
         E+yZkBou7e6OPxudyXV4vETkjcFTtkOd+zmGvxFKeIxgBasUubbocMpfHdBMfsIav5XC
         Ss6H3gKRc4CEjcmLkSY8iXJwmod6KBN5jdBQH0W/y98iDmdMo+rOc4v1Wn8KhBLtcLWY
         7YLw==
X-Gm-Message-State: AFq9FYIx9bW3DiLB/KUTwzPqPQqsamu77hVG49RcrqxverCZzVxCpKYt
	MU4Idv3uOZ+MPB/SAl6KQJvF3WaSNCjnvcS4waQ3NVLRn+cg0Rsrjs+naCqP+CwNqLbGGQ9bRjU
	hCADzVayZyk3cVsK8r6aWqqaj4fN17tvqU/akQWDduPeou3A4d6C1SMBVWdQOwrpuvcVmizP2ax
	Yu8ok=
X-Gm-Gg: AYBFou2s5PZ70yRnziCYvFnHJy18euYAFzec6zRMUu2m6kCCGsK+UJWLNuMOLHhjidM
	JIR6MczWCzQbHHYvcegn0f8jES/vW12+fZC0SjGez2nE9hUGIFwPa3qlGe0qYW+ERff4f+gRU4l
	bHuI1vgDTTVnlrjw1g+a9BSGAF35rTwHNK8UFPQZziIfu4xKZBqUVNFJ6tn7/Ddret5Op4/Wjbt
	JOnUBPF302kK0K+lK6OtY+8ZGQgC649RMXw05TlPiFn1nnlVlBzM6yOy43IywzYnbf7NKtjcYf9
	8wmYpYC7UuCB+QIs61jUeXEvbLNXYwNmD1kG+3BXiOyLBxBSJ8j2Qj97pg54v9F+Q7cCdZZxlnH
	eGzop7Ppdr5lF9UzVlxp/a3TDZurZ
X-Received: by 2002:a17:903:22cb:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2e9a6d3b0c9mr57043745ad.57.1792386057418;
        Sun, 18 Oct 2026 22:00:57 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2e9:5d1f:dffe with SMTP id d9443c01a7336-2e9a6d3b0c9mr57043315ad.57.1792386056791;
        Sun, 18 Oct 2026 22:00:56 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e878910sm33730395ad.61.2026.10.18.22.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 22:00:56 -0700 (PDT)
Message-ID: <e4c681f1-b516-4a0a-8ddd-4885e428e748@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:30:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, lee@kernel.org
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <sashiko-outbox-171155@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-171155@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kr_2cMfSFYO4Zks27-LarhfM1AfymIHR
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad5a40a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oUrbEBrvFYUpg2Fk8RMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Kr_2cMfSFYO4Zks27-LarhfM1AfymIHR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX5Iq6lMrAdJQz
 jOpvYPu5PhCOTLLgXDmUNBaT0oLOp5zJMOLktpS1zfvi2h7rPtwofcvSLJS2a6duG3LzqQz0Il5
 K7AYn07aXDZHYM55eRuSH7v3VScYL5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAxOSBTYWx0ZWRfX1kNWBl+6PPlB
 bs1FLQuMOUJ+UnNv7UiQuk2CdO9p09oF4bJszfp9gl7NnKQNCUJoNk+5SQrOXufcbTURqzU5MpN
 ts+E0RLBJ4PDozE1Uxe7SOmNylSujcvF7jRlwalRlGS7RTaguPMkuU8u7AD+bz/cmcY0KT565hw
 hP1NsTzdwNNNlLkz88fHAoKa996jazvA2AEZy2X9PZsuZqe6tPcvpexpHkZs6tWFkWP0GGpLBCT
 CAkJ9Ux7U4NhDoaPtlnBEKGSiO4hYE1ln9hbJudJ9JcTxixeGfrU6PLjeHmM2VPLR6SZaZtFfHg
 38FPnxdB3R82hhV3xcjvTgBjYbXbcfwKNjbXR6jjAqb+thQDqBXEvnYcKuLOut21CHA+HmP3btp
 z5K6jFtnjVKiRG/VWYANYFxi0tgUMFLps8Y+YbMyp5mJQIcT0sVpExnxA5QjOFK/z6pzXEn0qYD
 ga+Dyrc5WevvtFt1zEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190019

On 10/14/2026 4:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: silent fallback to PM8008 on non-DT PM8010 instances
> --
> 
> commit 4e77301709b8663667033b7dfed82cf937a2d7c5
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Add PM8010 support
> 
> This commit adds support for the PM8010 to the qcom-pm8008 driver. It
> incorporates PM8010 specific IRQs, MFD cells, and match data to support the
> new device type via I2C.
> 
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 2d6c01cf54f32..4179427f38911 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
> [ ... ]
>> @@ -180,14 +218,36 @@ static void devm_irq_domain_fwnode_release(void *data)
>>  static int pm8008_probe(struct i2c_client *client)
>>  {
>>  	struct regmap_irq_chip_data *irq_data;
>> +	const struct regmap_irq_chip *irq_chip_desc;
>>  	struct device *dev = &client->dev;
>> +	const struct mfd_cell *mfd_cells;
>>  	struct regmap *regmap, *regmap2;
>>  	struct fwnode_handle *fwnode;
>>  	struct i2c_client *dummy;
>>  	struct gpio_desc *reset;
>> +	unsigned long pmic_type;
>> +	int num_mfd_cells;
>>  	char *name;
>>  	int ret;
>>  
>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
> 
> [Severity: Medium]
> Will this silently fall back to TYPE_PM8008 for non-DT devices?
> 
> of_device_get_match_data() explicitly checks for dev->of_node and returns
> NULL when it isn't present (such as devices instantiated via ACPI PRP0001
> or swnodes). A NULL return evaluates to 0, which matches TYPE_PM8008 in
> the switch below.
> 
> This means a valid qcom,pm8010-i2c device instantiated via ACPI or swnodes
> will be misidentified as TYPE_PM8008 instead of TYPE_PM8010.
> 
> Could this use i2c_get_match_data() or device_get_match_data() to ensure
> device variants are correctly extracted regardless of the underlying
> firmware representation?

This driver is intended to support DT-only instantiation right now, so
we don't expect to have instantiations via ACPI or swnodes.

But anyway, to avoid the ambiguity due to NULL return from
of_device_get_match_data evaluating to 0, I can add an explicit
check for its return value and fail probe with an error if it
ever returns NULL.

Thanks,
Jishnu


> 
>> +
>> +	switch (pmic_type) {
>> +	case TYPE_PM8008:
>> +		irq_chip_desc = &pm8008_irq_chip;
>> +		mfd_cells = pm8008_cells;
>> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
>> +		break;
> 

