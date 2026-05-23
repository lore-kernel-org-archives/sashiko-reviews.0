Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028542DC32E
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779547284; cv=none; b=rIWlkQl2S2HJUDql6pdm1t98rcnWYBY1ymA7BrvHbLMjYJM5pNkPPVzEvahhfY/UVLDEONUiUT8tldoL3goQ4owOW0bpIZC/OggaW/V6HRwZVIDdHRtxm3x05mVcW2gcmcOwSSUtOHwtWj9QkkpkjsqIKNZd024Eg7LSy6byRGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779547284; c=relaxed/simple;
	bh=+BkeoBaipQBBJt0lJ/JSFDjPNnCrS3L369h22Ot3r6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSa6E4lilXavGrjvJYfCcLGa6ZImN5YpU3TnFnUNbLJCsl/NyD3AzS8zXtU6skUOufaUa4jsmTVdGTfGLAwrd22WQ5b0C998pC3g1hx6EV1ga+xK6IbtFtqluFaIdNPw8aDDwuQo8othbzvRN/u2QGM4u5tH+bLgUrhZIdlv7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS33Uu+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBcwnQ4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS33Uu+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBcwnQ4k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N7sY1u1280558
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 14:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnO/sXJdMaQSW5DY5kS69t8JL5v3+00rHQWHLmqTJoE=; b=lS33Uu+ENsVwRNYM
	HKrwa6Zvau5jrFUjwIACV7fSrHWnqEwLvrakANH8LAW14gJXIRWn8VGiIGaHvKyM
	bbi1khbb5lUkoT5AvSMwMtvbvjJ+jc7lGasqt6sMNopyGHd5LjG/Cde+Yn/n8liB
	Xjj0Gb9K77pwdWVsLjcWYgo/ZigQ8a5szXea4SVg4LyHQB4dmuosbDwqcVr0hQi2
	VQEO8QpV5CA9u3MDsI4Mj8p3P8nNHwhCQji5taOk4+1sOgIafwYRHfhR9wTOeNnB
	oMRo+Q3nvLGuxyZrw/uTvMzwWNMsniyP6NjCV1TPWIfPZXFGDIBvpUPKnNxHOs/V
	5d+SaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w0pmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 14:41:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso12546130b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779547280; x=1780152080; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fnO/sXJdMaQSW5DY5kS69t8JL5v3+00rHQWHLmqTJoE=;
        b=ZBcwnQ4k1xjT6jexY3beya6PfUtbke2rZF7px60Zi21gMETYdvZCbZ7f/+IfIglfH3
         peHqXp3kaxneN/QH8ULXMhpWBqfwrMMuroEIqrniGBHWXKklyBW6fNl1ubpqdMqI+7Qr
         TV02UC3GAM3M6l0Je7bnsirA9nqZZzUCKc6kYWcmJxJI2/u78IraSzsk8gtZOA1zHyD5
         /nNuiAUtc5zwbD9CfPh8jxjE5QYvUjzS+gWGXADJEvXK7XfnP1hfV99vHGYtAKGNIkHy
         JO1bflVq19MuQJSyJ8/VvOZGeUe+l3Q3Bv/SFHuDKhVSRgnTojb2FVWEnBQqrh0tFchA
         gJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779547280; x=1780152080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnO/sXJdMaQSW5DY5kS69t8JL5v3+00rHQWHLmqTJoE=;
        b=fkyaEG465P0d4NAFvZKalPsmpeFPvVznyTMEtnyWhRA88uWIMgB9iArXRMajhftaf4
         Y4Rj5LYZFyyjhZfp5wV4dtIFjM8O9U9FznurYPgZndXfBlHrWuxabpgDeUTqqS+KCYr6
         VowpFsL6CzMtKbZ4XjHVGB4rsECzBsAifEeLC+YlMCdHN+JgLqu/1LrdKoeAC34lqY6V
         8/vNNOR9iRhHaoxJ4RyFEfa2llAGPMl2blnlSmz1TuHmTT2XXndRgc3v2E+tvoU3Ba+w
         t7cbnJ0SAFqlUHAd7RZQUTWk3TINcByMXgE3PAdtnxaTypP1jUGJpb/Wnu63w3chq6G9
         pOoA==
X-Gm-Message-State: AOJu0YxYG7GINyoBcy3okWFi3dmpAbVdIQx10Hmg+L5t3QjFsbLhUcGw
	dgfXXtFYthBk5CVNIYJnuFGDMmeow/rHDIdFqZs+o1ICAyRL/p2dpsxiXo2ol1pbXWVGYBaHU7H
	QwVFk5iM23mDK7ibL+DM2DwFDmV096wl2Byl8ExZJUKMRXi8NCfjL2QtlQqWpwS0F3Kp5nZRj5V
	VZljVEuw==
X-Gm-Gg: Acq92OGtdYf79SFp+/uPDxFG5A+GB9Wd+nxx8/dG+i5hIx/1pE7FI5DVfhRtqLd0kHp
	Zca3NeMXtoAqtz4fWlf2L9kocb8NwK+7gy2rlnN5T7JTfSa/5KneL0je57lnodM/Jr5nKcu3UCB
	lJQAxqL50aemawtTb8u0X2HI8jxcmBIaxdyyeHuGYZsgUA4zd22JvERlURQdu9Pb3TyNZ87FJqQ
	6TJAnH/M+4rhWbCE8qu7WP9TzUkFBYKlvLAiuF6ARD+Fq+nL+3040LMRxvTA4ojx97nGZKXU+df
	OEmcPaRSOagYJu4tcRYDY803d0Sq5by1tr2TZGxnmoD6dsrMF9rR2iWRhFI+G5xFZ3WrUICCQmK
	tQ1Dbx4JrZLHAhS+uuIZ1/I4YqcmTCpC9r7AebreaCuhbVM3n
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr8015922b3a.21.1779547280488;
        Sat, 23 May 2026 07:41:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr8015902b3a.21.1779547279948;
        Sat, 23 May 2026 07:41:19 -0700 (PDT)
Received: from [10.219.56.98] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af0506sm4845416b3a.16.2026.05.23.07.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 07:41:19 -0700 (PDT)
Message-ID: <72a2dc38-bfaa-4027-9871-0fb387242de2@oss.qualcomm.com>
Date: Sat, 23 May 2026 20:11:14 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
 <20260516130251.DED6AC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260516130251.DED6AC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a11bc91 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SlpPlKqkm7dTB969m5wA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDE1MCBTYWx0ZWRfX93GFU3OuKJ5m
 fa8bU4bt+8os7vAgTDQV4Wgt/jBPmW+wSZ2gnL1C2S68GFYje3/wo/ck9+T6uj26DF/0Z3+mMhu
 rJ5h3BG19sc2+lHZ7SDBCZxmg+1q8WNgDUh6eOPL7HaXJ0b2M/uIrMiJHbOc8fjSrzeI2HHNxh3
 yA7MMlBphtZWtGYMqhB/qLppPhgpz4LhPYqlg7SEH8TJTZyVjhSB6qCdffX6UOwkcX38YjWeVVq
 vQw9mfMrOAOs/zDUTbsgDdBqBfP63NRZZWJvFL/6FrKPBBJm6ksQZjz6qUUQ1QRZLHOpLC9TVKp
 aiZ+Iswy5RXY7v47yNvDYRwAK/BW3cGQjzAa1UYPYG7xzLFlBmIovCZjWcmISU/xPOqwgB0JeBj
 cz+QiWvTPgx9c2OzS/yG/lJhLQTZ3wB7KLsGFPk33awSRrTJ4pw1B3tAWERM0uwo2a+ZK7Gynxm
 XmEI8MN7mjYGlQdp7/A==
X-Proofpoint-ORIG-GUID: nBD9E3SKf81AR3SIPTZggWn4FHAIAGog
X-Proofpoint-GUID: nBD9E3SKf81AR3SIPTZggWn4FHAIAGog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230150



On 5/16/2026 6:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Dead code `-ENODATA` check in `arm_smmu_icc_get()` causes probe failure on platforms without interconnects.
> - [High] Shared IRQ handlers access SMMU hardware registers while the device might be runtime suspended.
> - [Medium] Interconnect bandwidth vote is not released during system shutdown if Runtime PM is disabled.
> --
> 
> commit efe802bf0c93309aa584a5eb41c34c9788a6e837
> Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> iommu/arm-smmu: Add interconnect bandwidth voting support
> 
> This commit adds support for an optional interconnect path to the arm-smmu
> driver. It votes for bandwidth while the SMMU is active to prevent register
> access failures during transitions. The bandwidth vote is enabled during
> probe and runtime resume, and released during runtime suspend and errors.
> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0bd21d206eb3e..aedf5edf8f9b2 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> [ ... ]
>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>>   	}
>>   }
>>   
>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>> +{
>> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>> +	if (IS_ERR(smmu->icc_path)) {
>> +		int err = PTR_ERR(smmu->icc_path);
>> +
>> +		if (err == -ENODATA) {
> 
> Is this -ENODATA check correct for handling missing interconnects?
> 
> Looking at devm_of_icc_get(), it relies on of_icc_get(), which returns
> -ENOENT when the interconnects DT property is missing, or -ENODEV on ACPI
> platforms where dev->of_node is NULL. It appears it never returns -ENODATA.
> 
> Will this cause the driver to unconditionally call dev_err_probe() and fail
> to probe on all ACPI platforms and DT platforms that do not define
> interconnect properties?
> 

ACK, good catch.
I will fix this in the next revision. Instead of checking for -ENODATA, 
the code should handle -ENODEV to correctly cover the case where the 
interconnect path is not available, and emit a non-fatal warning 
accordingly.

>> +			smmu->icc_path = NULL;
>> +			return 0;
>> +		}
>> +		return dev_err_probe(smmu->dev, err,
>> +				     "failed to get interconnect path\n");
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
>> +}
>> +
>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>> +{
>> +	if (smmu->icc_path)
>> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>> +				   ARM_SMMU_ICC_PEAK_BW_LOW));
>> +}
> 
> Should arm_smmu_icc_disable() also be called during system shutdown?
> 
> In arm_smmu_device_shutdown(), if pm_runtime_enabled(smmu->dev) is false,
> the driver manually disables the SMMU clocks via clk_bulk_disable().
> However, a corresponding call to drop the interconnect vote doesn't appear
> to be added to that branch.
> 
> Could this leave the bandwidth vote permanently held at
> ARM_SMMU_ICC_PEAK_BW_HIGH during system halt or kexec?
> 

ACK, adding this in the shutdown path would be safer.
It should also be includes alongside clk_bulk_disable() in the "non-RPM" 
else {} path of arm_smmu_device_shutdown().

> [ ... ]
>> @@ -2308,6 +2358,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>   
>>   	clk_bulk_disable(smmu->num_clks, smmu->clks);
>> +	arm_smmu_icc_disable(smmu);
>>   
>>   	return 0;
>>   }
> 
> With the clocks disabled and the interconnect vote dropped here, is there a
> risk of a bus hang if a shared IRQ fires while the device is suspended?
> 
> The driver registers its global_fault and context_fault handlers as
> IRQF_SHARED. If another device on the same IRQ line triggers an interrupt
> while the SMMU is in RPM_SUSPENDED, the handler might attempt to read
> hardware registers (such as calling arm_smmu_gr0_read()) while the SMMU is
> powered down without an active clock or interconnect vote.
> 
> Should the interrupt handlers use pm_runtime_get_if_active() before
> accessing registers, and should this suspend callback use synchronize_irq()?
> 

Seems like this issue predates the interconnect voting patch and is not 
introduced by this series.

The clk_bulk_disable() call in arm_smmu_runtime_suspend() was already 
present prior to this change. Introducing arm_smmu_icc_disable() does 
not alter the risk of the race condition mentioned above.

So as per my understanding this comment can be ignored for the series,
Will raise a separate patch with the proposed fix on this suspected race 
condition.

Thanks & regards,
Bibek
