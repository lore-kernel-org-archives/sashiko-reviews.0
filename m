Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E73B7760
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094944; cv=none; b=REqnPvj9N58E1GptnjNUG4bIJ96f2LeWSO6WdAeGFZpweQocDcG18zfSBCloCcfXIdz3fFUprKa8deYklv4BlRD6mtB8nYTvXSSmQp12K808B6d3/vduFsZRxy8pENjH17nEzwDZB2ZPg57m/8clEb4R0bDwEGLC811Z5WzKJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094944; c=relaxed/simple;
	bh=B4Zmlu2VreGmMwudKumfsHsYVzHL9X2ieoVGQe/OCmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIlU22NEqz1w6WVPqaTL3jVDL2q6Zp+bVm76yMFi92roN67G65t6mb3xLnLS4wwNFQ0aajY71u0roe4Z0E/4unkNNrR76D08BQHbegvznCu0CIv2JojlLO95Hgu51ctHS038S8/ra8p0hwWL0vdvqovrsTvp9f1RgjS8aB0Rtdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlM6796R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKDOBFla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlM6796R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKDOBFla"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGZv2406127
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 05:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/B6IES+9ZXNm6GUIpKPEsMYXkmhaQ/SumHrsSWagv8=; b=HlM6796RnhvW2YJV
	iqrKV0vmI+rFhjQcwPOzG9JDkiGoxrgjB+2DJKHPh4TF939Sd1CL9UuEQpUK84sj
	nVRkUcFGTpNDNwa1HTn9ONaVY6qzURJd4Q0n4bGcHo33QAi6zONOmVCcc/Lviz+U
	CXefwQe1FtTfUsCtUiYHuc0ns8mP1NThDrapl0vgqDXOnx2HILpfhlyQV2xC7+fC
	gOkVJEG0hNnpv1S/8VHP9Nd+COI2YWzJnv4dqHXZvsQ9ysSfGYHl5fXPYFDsYBLC
	JXmCUQqcaiAjka6lguxr+QDlekwauUU1bcO+aMGyt1NIr1WgDM1lAZOTF+a7jyBP
	vd/AFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g24x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 05:55:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cefa1a2be6so13995875ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 22:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784094941; x=1784699741; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/B6IES+9ZXNm6GUIpKPEsMYXkmhaQ/SumHrsSWagv8=;
        b=NKDOBFlapybVtvBse3mIMqAaT5FBRtNUnKMlASu4JCxotazxCqS3mY1fmZbLj3lMSS
         hKue9xk1GEk9w7OwBckz8Z5wGsnOfnEv1IHz+qXrFEEjn2A1JZgIJXkKderb6bueYcr3
         e1/D3Tj1X2+hTcoHkp7KZeUhYgxD9NBPHw31esIz44886ESWLlqEQdA9pmrGPwUIqoDH
         lDZ6Mwj8JqLXOapPmqQuDEVduLOAvjX3r3RoptFr9J0uOlfoDb/wp0F0d/c0gQo5cK4h
         7nV8SJT1Q1w2UQHeW9k9hq4PW6fdgQbqcbjWwnZqFSPewfnAHU48wwa0Ul6/1dusFBYs
         XiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094941; x=1784699741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/B6IES+9ZXNm6GUIpKPEsMYXkmhaQ/SumHrsSWagv8=;
        b=G+WDPZZyXygC5LVbrlNgNVStnVkcdH//kbo7qbWjg67oddgDJmTCyVc53bVX8ozwOc
         DpCkcvNS8FpwTyrdiL2gG5LCRGKXfzR/dBmYq1adtwmsd6exY7/QcwCN7R1gTWChHl0E
         asjRHNTYV1gd2PuZwksWCKphNzBrLjl5VAfcyqvmBD5BRw1kE/KbT2CyKYuXgrLV1PX7
         Wnf3KkZn/Q07SVjOp65sFwCQEyY/d3nRQot6jlh+ETIKJv5uUSKyTBVJTe9cBsJZleZm
         QH1s7xXmB37PRtPMj3Kv49D+hv/1KCB17CuZlefUw2m9OKPTmz3ixiyh1yvGZqji1eng
         31eg==
X-Gm-Message-State: AOJu0YzPU+qCDn66EZNdca2JciplWWIY8t+YgYilNg8/hTEcX2IUC1kp
	ud1EF5DqF509TsVLAtlM9h3Xy+7UAHrYJq2IGRY/Q1OzETtvs/vEGdgHRmBnyI2JaIy/CoQkJzP
	llKMypOObCGcyvTsWqHpXcmh4yJnbiCiHI0vcHw6WgfMhFQSApW19LwQij3ajn6KCBM2BVUbfEF
	1k1xg=
X-Gm-Gg: AfdE7cn97s/+hh/kmXFGZP7zFVErhqMsZPr7SN6wJvcU19iq0OpqAw4GKN9PZgxOVZy
	pL2JAwlK5Lh5zH4nenfVsk+U9hANNpnGwjt6eSXMdeQTskbWGP0aqsDVyrmAybLbLISq/3quEg0
	3lXRu8WhQbTrZCIk+5gqp7ScdX/1dO4bvpYpa6RCrQvZCGMEnnHF6IKdlUYFofVPeCZsO5VYNr3
	xW6PvcJRDU8gzWjTkTPLinGAQwRoCc07cLIB9fage4p/707UjTB9G7SgnH0eBujKQQeWgtarp0n
	dvAFJm6OJFTJKvlc4QaVI0WI83pEf0PzMf7xfr474xOydOZwrGn/B5KdiGMApJn97Kz233xChwl
	ZDrMvndIwxkAXTBVfLWbhpUKpQIzU2e+5ZZ1tCw3s2w==
X-Received: by 2002:a17:903:2c8b:b0:2ca:b48f:3395 with SMTP id d9443c01a7336-2ce9f3a112fmr152899355ad.34.1784094940652;
        Tue, 14 Jul 2026 22:55:40 -0700 (PDT)
X-Received: by 2002:a17:903:2c8b:b0:2ca:b48f:3395 with SMTP id d9443c01a7336-2ce9f3a112fmr152899185ad.34.1784094940219;
        Tue, 14 Jul 2026 22:55:40 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm126360485ad.61.2026.07.14.22.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:55:39 -0700 (PDT)
Message-ID: <e34de9f0-f828-4b96-a115-27d262969a25@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:25:35 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
 nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org,
        Frank.Li@kernel.org, devicetree@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
 <20260714-b4-shikra_crypto_changse-v4-6-06a4ea97c209@oss.qualcomm.com>
 <20260714102240.B586C1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260714102240.B586C1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX2OyI4kK4c/7I
 BsYPB0s9irVJQYKQ7wZDyxChf06GdO/xH5lu6/rHHr+Ogp2DddvljiKFFuSMyjicEqXU7eCVyaK
 /lt++GJ6+ULeSzQ/T3D13a6dR5RLhf8=
X-Proofpoint-ORIG-GUID: V0jPbUZCLUI5Zf9ToFC7BEj1FzqciE98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX1CvCHQapcTkF
 MYzRrrJxLMSKTCSofkqdXbRo1SQ1Y+SnqZ/kS9KSJRFgUteJWrFEMAxRWUt9Qs0XB8RprI4Hr7D
 I6AXC9KCuKTtVu9oyYxhFBq1Yien13suAjmZlXVM+zR1zxJ1E0D4e2qsW9hV2U9i7Q7AN+r8hk1
 evM5ZR+q/dLwb68priU7vihsp0DNJBvXEYhDZ1WnvyuPWSM3DBn8WPXlXxOKQZvvrBygWRhI1Yc
 S7UYcHtuYaMFIgY/6ZS+TbO2bQkAt3D/QeEYLPlG8V4kLiZg6cLRpQx7ioeVpxFTCgUNpOkRGiz
 CJxpU3vQgdE3c9v7lpDb6lFVWEpQiqzwdTggB4zlSj9oglUag3Q1QUHUX0fNM+8upZ+dB3seM6J
 9wCpwG3aCkwum/HX5lT2B8+wzderbVkH3DZdwiLhVRGX79nA5GQia1BZM+8hNC4A668BfWIfp2k
 W8G46V3icKMUH4+RVjg==
X-Proofpoint-GUID: V0jPbUZCLUI5Zf9ToFC7BEj1FzqciE98
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a5720dd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8wWWxnHPA6uIG9S2x-oA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150053

>> +		sdhc_ice: crypto@4748000 {
>> +			compatible = "qcom,shikra-inline-crypto-engine",
>> +				     "qcom,inline-crypto-engine";
>> +			reg = <0x0 0x04748000 0x0 0x18000>;
>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
>> +				 <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core",
>> +				      "iface";
>> +			power-domains = <&rpmpd RPMHPD_CX>;
> 
> [Severity: Low]
> Does this code use an RPMh power domain macro (RPMHPD_CX) for an RPM SMD
> power controller instead of RPMPD_VDDCX?
> 
> The sdhc_ice node references the rpmpd (RPM SMD) provider but incorrectly
> assigns it the RPMHPD_CX macro. Because dt-bindings/power/qcom-rpmpd.h
> explicitly includes dt-bindings/power/qcom,rpmhpd.h, the macro is defined
> and evaluates to 0, which happens to match RPMPD_VDDCX. 
> 
> While this avoids build errors and runtime impact, should this use the
> correct RPMPD_VDDCX macro to prevent a semantic mismatch?

This is valid, though both macros resolve to 0 value but best to match
with RPMPD_VDDCX which also matches sdhc power-domains property too.

-- 
Regards
Kuldeep

