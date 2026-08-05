Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7A413784
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923677; cv=none; b=kkIeMrPqhQV0MoTh6O70j8XK/NvMuSNdMhEx6jJvHyt3x7TRaYkvabeTvViTQtCX2TiY9VWlPvtbeSPqpXHwcgSP/Z7GsUntYK0zWVmmCg/tevaYukhy34dbqq3hncNsigRslEeLM1uwVQrKO2KKKG3s7v3//0O5Wi3Xfwd1LRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923677; c=relaxed/simple;
	bh=w9eYthRmToyVxZHEBUSOSGKXlrScyZ8dVcO5adDWwHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAJAxZWluDnU7MJTZAPRKaee8Iu/rBjCTUTHzDhd/5JsVemK95NDrvtX6Lkd1Cs/gmkLhQMh0OQ4kJdp9XFbWEkn9RPzmWBML0sTEKClqc23HccDwuuWRnXS7YO81XZmOvAysabyVTqYnW51pNsIerUnC0YTQw6UQwBB8oURhVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSw+Xay2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASRq73c6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSw+Xay2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASRq73c6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758d8kO2073949
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3hZqK5iZmM+IAFacrvV9FtvLZQ1PDq+tTYoSKqDnjY=; b=aSw+Xay2CPUd7el+
	dTcROs9DOZ2B1M0TLjCLjYK3a9u1N8imEmAVD7ZojGmhIkVWOmD+NOsHVcBsD8uV
	bxeedZgshr1qw5xMnPG9iomtAGOjanMvjngWd1y+EEXQ6FyX9fJCskERERjBUm7f
	MkOuZ/q3y/jWuJdUmHoLyf4RGkUNIMhTJ01yLu1KWhh5Z1SZ5IJ4LnwbtEDO/dtM
	nzTSddRE9GYbvBge2x0yPrHyvfbCEA5xHNyXA4ECYlsGM0SY9Z3LqQYUBVr3ZNoH
	UayD/fyQqMS1JF/suBoSepD4fMSEJncGzolJn5SMXqt8p67dWEyxC5JL3AA0L2LV
	2H8zHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u46ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 09:54:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e1da97175so1177645b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785923674; x=1786528474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3hZqK5iZmM+IAFacrvV9FtvLZQ1PDq+tTYoSKqDnjY=;
        b=ASRq73c6ia6dTHVY2Kf9ZrYaEBrbC3Q2dsNQLgXjgFoM6IfVSFvUbhYTcURtr+zDfw
         KV2OlXKgOUmL5kyQJyw9SNYmK0cweiK3VrDQokCt3xoNZfrIs/ok6/SczJRcZwPV4dKQ
         GB2tVvIkyAL5peT727dQcK8oHOyJ4CXFpyANBp9I2sVy/ThPuxrmfcU4rinQkNq19FBS
         uYWtK22bdcF22DWxViWWxT2T/hL/aNMzKFg/P1y4xCTihwy6oJ2DGxyKcDeGnVIJiEBF
         f4Glqm4VysOsj3FuYlAj0uKk6QQ4JeFqYFm+YpkmHU9xBYTYPSOOkLf6U+04/EqtcqbW
         MMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923674; x=1786528474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3hZqK5iZmM+IAFacrvV9FtvLZQ1PDq+tTYoSKqDnjY=;
        b=m8VJyrp3V/ECrps6NVheQTEkYO4EfafrfOcY8EWVJTWEjtfjOYSSs3DVNzZD6lSr10
         nHq7+Yo56d1ivTYcHsSavzIRzsyGlVxiCt6EgzNASskqP9K96qqsp9H4jc5e8wmIOKTk
         chU49bSv5mh9OcXROUg9gtnqbva1aLdLgFQNF/FhPbBn/VZZTtpuTt4Q8i97gPp3guJK
         Ep3GRUUt2iX1bpNWguV0+KV6irCnjIBXT+nyYec7wIOjreA34xyjbKZ9Ei2Qqwb+uz6f
         msWnM8GhuCJhnPFJRyIJxUpDFR7ZWflm2o/lgJvteWiRfY4qU3Bbw803hUsswNMG2UKe
         Iltg==
X-Gm-Message-State: AOJu0YzDtDxo27KXZ2TB5Sj6h9f+UUc2cz7huO0i+BhJu8eRwnA0TczV
	5FLQgphVq+iSrLIIlyI0WTp0zrCkLM/G48L7U4OW3wxHEsPHv/N5qeovEqu/JRVZlno9WQ7TiIE
	560haA3elX2/yDrducJ3BM4Bds39r0tcJLioaP9rfVjVPZEbOnozJpDfW0pisEU9lTBoOBfKuAN
	TCQk0=
X-Gm-Gg: AR+sD12YPRoM7N1rd3JRS//mIA7Rnv0RV7gEM5WrXdbhDxklZsp+pObt1/r2IYjiKKP
	8JzmYNtwz11Hks2cZ19a6tPUpHLI4UJctROElJVCdFAZmvnHpVElsGu+RcTZ9yYwucbNqk/NqWJ
	W69Om6shBrMvALku5KWTfyCshbD+AJEaVpnib5dByhECyC0i3kR2okSEFqBopOaNKXH07XOU0pj
	7NV5oLaJqf54msVf+T2E85D0rKyfXNnTsgcTdfg9gGYDPp7yIqQtf0X2+0bFIISoW5ZgXjsRfMz
	HsmgllnuLIx/BGauBQdpn2yHNJVKXdAyc8Z8up+SPgeJTb1NR0T5Pa/9kd3F3OC9PU9JeIPaUuq
	Z1XSM4Sb1sTpldBmFKFFXNfie9LoHduChYYdWc84Imo9oKgfrHU1jICBJbUUhi+JsvGzFt1O/Jf
	OCyIJQyQfkmzaF
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr5504576b3a.23.1785923674358;
        Wed, 05 Aug 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8f:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84f2e009be7mr5504520b3a.23.1785923673869;
        Wed, 05 Aug 2026 02:54:33 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e507ac9sm609173b3a.42.2026.08.05.02.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:54:32 -0700 (PDT)
Message-ID: <a23ca81d-e796-433c-a1c7-ab081db05dd7@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:24:29 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <20260728175434.D70901F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728175434.D70901F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a73085b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K9zW7NHO5qA8wGy8OVMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: KS15A8RIGVsha7rdcJDv4ygumGVTdGA0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfX5Y5ME19zVhrW
 9oXmPTscXH2VxRgAKyav4fupNLO50JF0n0c6qGe7ukoYCQhl0Ccz8Jzqlw9OTkzROCzduL2xSZS
 QtFxNMDs2N9EQccdT//iOek/yKrozVs=
X-Proofpoint-ORIG-GUID: KS15A8RIGVsha7rdcJDv4ygumGVTdGA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfX0IycThWv1XLE
 LMxJ8S9igCCcyXOFhwgc2gdt0TkBHXUUZU8aUwVlJFE9OGAXTVgpXNXgaTKlrpQpdW/LSt6uyc9
 uHCE9Pr5lNKfNx2Pfm0gXV8eQS8FyP35RK2M7Gv9P/TMw/JIsTesBP7xkRxcSPQhMyvM74qAmEh
 6uPSl+m7tGV3WoUP4DCLISjymPab1Z+yf5Yr4IKFO6bZaKxngXPCOIUp7+BwBatg+Sn/tMOcaJg
 iou4WbkoEo/Lt72pKxLdtI1pjtb2BWD3T63LEj/Yx/yyBmLGxOa7zANIL2khw/U45/Uvtsv2bZ6
 Q4xnHqeiLPXLPmxy7+hC79yPddP+wmp64YvuISqVmYajsbZZ1MzlmVTR6IKmbyArQOpXPi27BJr
 cqfAZ0oIAG3E6dns/0gXmkqLJbCPPnNg/TJZja8wVJkTKyu3pC9SrtwqFPZqcGwyZ0DHKBEqg3L
 FbQbRXdiV3NNZeTFIXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050078



On 7/28/2026 11:24 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The custom `qcom,tsens` property encodes a driver-specific software algorithm into Devicetree and redefines standard phandle specifier semantics to avoid standard sensor enumeration.
> --
> 
> --- Patch [1]: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add qcom,tsens ---
> commit d7c232898faf92bef60389e6c46fc016182bd22a
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add qcom,tsens
> 
> This commit adds the qcom,tsens property to the Hamoa-based boards embedded
> controller binding. It pairs tsens provider phandles with a count of leading
> sensor IDs, whose readings are averaged to compute the SoC junction
> temperature.
> 
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> [ ... ]
>> @@ -32,11 +32,40 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>> +  # a devicetree concept the EC cares about. What the driver actually needs
>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>> +  # phandle with a count instead of enumerating every sensor cell.
>> +  qcom,tsens:
>> +    description:
>> +      List of tsens providers and, for each, the number of leading sensor
>> +      IDs on that provider whose readings are averaged to compute the SoC
>> +      junction temperature reported to the EC for fan control. Only
>> +      applicable for Hamoa based devices.
> 
> [Severity: Medium]
> Does this property encode a driver-specific software algorithm into the
> device tree? Device tree is strictly designed to describe hardware topology,
> not software policies like averaging sensor readings.
> 
> By bypassing standard properties like thermal-sensors and redefining the
> phandle specifier semantics to represent a count rather than enumerating the
> specific hardware sensor IDs, does this create an incorrectly designed ABI?
> It might be better to rely on standard hardware enumeration and leave the
> averaging policy to the software drivers.
> [ ... ]
>

Ack, I'll drop qcom,tsens and switch to standard thermal-sensors, moving
the averaging logic into the driver where it belongs.

-- 
Best Regards,
Anvesh

