Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979470;
	b=ThMpPt20t5sJwgq+T9kE7FJXapgD709yZv56djdqn/bEy7WV4Q/hB2GWvcCvr85olCLm
	 pu7b474eCTHIA5BCka5RDPpbOPPNqOvWvUNCWI3PizkSeABVopOTK3eV6yGsm+zmbRymu
	 Y+8WCeRpZi1aqFGE06kla/csJ7UFi3Y89s8kP2YQc+CpXyIHbpfqfLBq0SuQoYnaj7pkn
	 lnTuluCNgMprZk4OZCp0E96Nmcf/DUFu+7CY3Jzqe3waC4PbdruLAL95QyijP7nU8eTKe
	 bRj3SQffV6vKhs8dhaD15TdCzWKrSoI3t+y+YajXe2SWptLSlZYD5/juQ7LffengVaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=;
	b=IjOexnicLQGM4wlh85jm7EY5VmL7tJJxGCLxZYU7jKM/Zer5c9LCtOpetifBDf0Wbzk7
	 IzgBaSOKQ3tIm6pjMfQs6kKXC3OHlftUhqJZJbVlTFDcDLQOp0/VQT8Qj/LLL+Wp0R6DT
	 vBQvA7Q5HbiuKD9768pJbBTZxoWRFxPoqcESBBwu4d0PPoURFtzLtdv7poos3hg40aa7x
	 dctkqnMdz1/aV9kkFzN29xN6KzB/sAs84cyAesiZU+koNEFweW+t8OrJq94PsqHiyCtRT
	 S6zIRbPSUMs/KJnYQiGTzGLTiwIAx7bjXCSDOISeQv96jlNwG/0K+Ad7lZad0MQn8Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eDrIe/h1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcV2zoYF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD8606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4AD8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDrIe/h1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcV2zoYF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V13d2106293
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=; b=eDrIe/h1HmIOKoVk
	+kM9SNQC111PrHqAVEZobsOf/0r25xUam3RDp0Jx8cHSPs33cHmGlTL5M3PPJgi6
	yWGgxiXhdiHcRuOLmge12ISL9iUBacGyeisMjleQ1kQgN/f6Zi6ZrJ6M7iCek/U+
	17cZB3GQIPtwtIatBJMotwXW5Aj/JLErvRTdSI5OShqSHM0FwtB3d0kSwe8+fjMD
	+vQ9B1qeix8jMuqoAiO7FasLc6YBBy2Gdj8TOXgKoE8sCZ6JPUiY/gUbHxQzirq2
	LOVJE4GbT4q3j3gniFtID9fPTv/hWEkkoz9um1d5IJV+LjeNdgoG4LhpI78hguvz
	8Um4mQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8safq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so9074385ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979467; x=1795584267; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=;
        b=bcV2zoYFe8svNDOQBR+XTHOofTbxGSy2sg2bSSkMbdf/TGak3agYN11539vyZZMsqg
         tQ62L6d6ZFg8SfiZ8y/5SIs9pajHv6SiK65a2xA+CG1LRPSjsm4wy5ml5bFfIEs1uwz6
         RwPG/64zip1hZ8yHmEYbJGDwSqPZQ0OGHrxjm6XuiG55IvX+5qgflcnqzeCCMGIcagf8
         aH4LKKQVCTUcgKUQq0qS4f/9Dpu2zYIVt63IJE8Uq8/6C9hP2jRDYGTHPUGun+9ioad4
         Yy0fdGH9GF1O3osptIxmpPrAa8RivblH3nzgc+WjFNaa+B5pjK7Xi7ysB+9avuh4twkq
         SdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979467; x=1795584267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDa1tTlXlIVUkY6LGmA3ONPL3YmHJB2Ffd6PDt7KNps=;
        b=LnaD+nAQnc5yLymq8yzJ/qMsruFe1ngCSJPvCP/gT57eb8ITTIHd2/wIbJ6pH2Fw7Z
         +FaMBqItLq2K0pbxOHaFNfqk5bLK/YamwmbouBwGSZCr9IsRYvYiV6bX8jzA9lGXG7eb
         Q/JPrRTLQ+xMctHcf7XSHdI0UJFPsrKVbe9pDq230pgBxT4WRTZH1b+2bFca5r4oW0MC
         AJEjJ/ANekHPxGk0Vicx270M9YlD7EV7M6Thi2FgpAvh1aQi0uQlHdW1soyXPLsXFhTy
         qZg2u3KwRoJkvF8trjE8msVbd9bhI4y9fbQOb1N+FKlNJh9n93GyVBijx6xpAhARJlDO
         76hQ==
X-Gm-Message-State: APuU4Z8VpMHLvhXGqVxa1BDq1c+y1V+Pi+/YYC5dYphWNID7gMO1Cdrh
	JrixyUaE8hQGVdEZO6vh4HtM/cMJz7uXM1ZHw3tQL85hGNGTkDaKuhqLOk2cUSWnb+AiZQkuHNr
	alpifdFQjMBJhfh3x6Aa9xh5iV/R3LptJuzkgZ/+N1aTVogxgYgTTgV+B7k0mY8BMRpWOfSHDSJ
	UIF4A=
X-Gm-Gg: AZFdTZdyndpsC5DBfgDLVJcJSG/6/pAg2lmxckLe7mAjQz536Q7IZDCkUZJWWkGIgy7
	nN9uOCgcGjsKXclL4xoZl+4kj7thQh8/i89wL/Y1x/bnHjCsNl/q56Zyg+muT+Kb6ASa+c1eLfk
	dnGLQGvWZ1MFOkcwc2+Jxasrth+zzLQbqxzPCl8TySrGCcc2XeKa4fXH/JI8cd9jB2jLMKLL1pa
	GMaFg95OPeaqsfjq9moj5JCVkbSVktI2q5DExMl1uNjAZWD6FORT7mA+41XO1J7W7osFx5+ilK0
	kY1VmmI1A9l9P2VaP/FtsqfaQ6WwO/byTqXxchjGGbEXTyYqwQciqnL8p4X//sMEDfUOC7g3QN5
	VMxkwQXYcPhcDd6MxIPcAkuxA/hrAVkhnQGX5zIQfvdsYKRfW3A9J6OsEnvPscF7wcq1ktpfIDW
	vrsnyOZ9xIFQ==
X-Received: by 2002:a17:90b:2d86:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3b3d07cb3b0mr1645562a91.45.1794979467303;
        Tue, 17 Nov 2026 21:24:27 -0800 (PST)
X-Received: by 2002:a17:90b:2d86:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3b3d07cb3b0mr1645545a91.45.1794979466761;
        Tue, 17 Nov 2026 21:24:26 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2203083a91.15.2026.11.17.21.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:24:26 -0800 (PST)
Message-ID: <94b45a52-7742-424d-9d4f-ac2df24097d6@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:54:23 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 15/15] wifi: ath12k: add Wi-Fi 8 PCI driver
 scaffolding for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-15-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210942@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210942@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 30IRvPz0O9y6-oQRAR-kA7VAMD-XxfTG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX/0hjvSsAW0J4
 aNpYCgF9yCVUxUWPRsAh68fQxwdajKV2dxUV4rDDiPN1pJpFljVh7Uyz21dY+kvYi30jGnvCnqp
 thhb/R2t1XGoOa30yBwjEfIgloSfeRo=
X-Proofpoint-GUID: 30IRvPz0O9y6-oQRAR-kA7VAMD-XxfTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX1eMEzG9zorYu
 dCVLqBGwBUA6thXSjaLqNvXeWFv8MvoLJWfeA/3cdNbnHZk/NUDKhru5Zq3nWgWt1LfTmIEe4GM
 QdTgIVkeFysFQEo3rkVfMMO6vBelDpjxANt5UJsFtzyLe9uN/xCpGw2/JZuuf55kTQmTURzJc/v
 XIwX62pt/yqWPHk+Qrj1Udq7km25epoPqBQ72jLXUbhC4s+xKVz5O9JQBOji5fIKGrAqF4Lv7ru
 EoOrCaO4Sn98svtMbMfcDuuI6bHoQFwo0U0xTKQV2zqxaLhqAso2m5APGpzo4TfRf8Zj7FOrrxn
 4pynGlNe54Oec8FVcwwAOwdFroZoKu1CR6/NXkcY8Y7JB7ctXUAbJVSHZ0FSjLw/0fYluVSnOyp
 8gr5S9kz8qZnDoGqgpEVwm8Eb95sL/TPu/IqS5fflFnxIOfJj+rbKhekHlIgaqU7DonaBgKFF8B
 26jH3VapzyUr3LNO9EQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd368c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ghQirqQZvRoX2FQxpe0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 3:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: missing arch_init and arch_deinit in
>    ath12k_wifi8_pci_driver
> --
> 
> commit ad19b62d9fe2e5840dd771d3681d43b9adc7965d
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
> 
> This commit adds QCN9575 PCI window register constants, implements
> ath12k_wifi8_pci_probe(), and registers ath12k_wifi8_pci_driver in
> ath12k_wifi8_pci_init().
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
>> index 3975081d167b8..fd0489f8333f4 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/pci.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
> [ ... ]
>> +static struct ath12k_pci_driver ath12k_wifi8_pci_driver = {
>> +	.name = "ath12k_wifi8_pci",
>> +	.id_table = ath12k_wifi8_pci_id_table,
>> +	.ops.probe = ath12k_wifi8_pci_probe,
>> +	.reg_base = &ath12k_wifi8_reg_base,
>> +};
>> +
>>   int ath12k_wifi8_pci_init(void)
>>   {
>> -	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
>> +	int ret;
>> +
>> +	ret = ath12k_pci_register_driver(ATH12K_DEVICE_FAMILY_WIFI8,
>> +					 &ath12k_wifi8_pci_driver);
>> +	if (ret) {
>> +		pr_err("Failed to register ath12k Wi-Fi 8 driver: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>   	return 0;
>>   }
> 
> [Severity: High]
> Does ath12k_pci_register_driver() always fail here with -EINVAL because
> ath12k_wifi8_pci_driver omits .ops.arch_init and .ops.arch_deinit?
> 
> drivers/net/wireless/ath/ath12k/pci.c:ath12k_pci_register_driver() {
> 	...
> 	if (!driver || !driver->ops.probe ||
> 	    !driver->ops.arch_init || !driver->ops.arch_deinit)
> 		return -EINVAL;
> 	...
> }
> 
> With both callbacks left NULL, ath12k_wifi8_pci_init() fails and
> prevents the ath12k_wifi8 module from loading.
> 

This is a false positive, since the DP changes will add these ops.
