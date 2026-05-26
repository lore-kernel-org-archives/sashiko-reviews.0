Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB103DA7EE
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797318; cv=none; b=Rg7miQgUCqGjzokKph+2b9cJRm3/vhb3cd9z+bsGhkKJ0BOsGuP86s5j3AuwJWPHf3cgJpkbboW2YQTTe27LD7QTtk85OZtJwL85xZAI2wqNEKaINVBzL/qQu6BIg+16VoAKUm+vkXIVcqc99Jmg82zJ4qnpbKBEV8MS/YIQSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797318; c=relaxed/simple;
	bh=J9GlkG8GT5J/NLnjVaOtJKJFRf56bS6AEy0RSL8EVSU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s14nBPv/sGja0DFKqfCwpxxySmy6Z4V8wxCTg8BxtLM4SMZgQF32oah76oB+ahm7+T5ay+CarmF/tN5L9+kT5QNlTA/Ym2WAwh1iNt2kUzuIqPoFBvKCremXXuNjPpH1kEN/95PAwQfG3GLRHpTIDQvTeB+Q1UXUgBmwO/FlZqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XASqwVqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Myy4uAI4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XASqwVqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Myy4uAI4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8UY6p3603979
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 12:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ck93GVFMvnl1I3EtxCbDK/JyBfi+pqukNpdtkiLrZ7Q=; b=XASqwVqr0EqSlH9D
	N71d+vV6ha02i5xif4DgimnuLSRgiBfN/T4ONB0vUNZduTO1Y4OfHJVLlfciaGfs
	6oEDDLJIxhrc5lj6MMLDih4Za83VonHXIWZzSvJjvRmOJvyjGxCAG1wyHI2NUh0N
	5IDt/qmKRl0aUFT+ajepz5RC8ja5Li7x5sWaBWVIe19jMCXpT1UiYjivyTA1WOkM
	SFNaY8Y9FSqj0UMuQ8xOTnCwL1fTCW/AuMYal81aT071KxBE8eV1o2QI4jI+aepZ
	LL0I5wA+cD4RMPrLVtoBO0ckIQ/d5G/dBg0pjMu3cvhbEupF1+9UfQpR1+vKJp3V
	s0eVqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqm1t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 12:08:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so10224477a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779797315; x=1780402115; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ck93GVFMvnl1I3EtxCbDK/JyBfi+pqukNpdtkiLrZ7Q=;
        b=Myy4uAI4b6cosr2P2E/vluLNPG9limcyshBVoT6BoJqlYb0ki/jcdmbQ3tSQidp0cQ
         msY1ttIrTPp77YpaSBh/FN+eS9cL4s4KB5FjT7JtyGNf+YS/UiRGunkJbQKb9ci7HifS
         RYrg2Djt7CZcRGtjLOaFlZwNxDgnmju+JHEFHO/Hvj3PH6e8McLM4w/vbmzv65Iw+PMb
         N7N7dvXj4wItXpdTI7gFgSCt5tjTvYSJccwxvAyKUlRJPQRNgJu+POEYcngVaW0x3NtZ
         hlLoYJQmkIbw5R+UlSYoa+KG9LFxwdv6ZaZJHUz1Jxjh1Mu32nBB5/SfqIrdJl5Mz6kZ
         espQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797315; x=1780402115;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck93GVFMvnl1I3EtxCbDK/JyBfi+pqukNpdtkiLrZ7Q=;
        b=TV7u/qjCevEHZdjDJP8n9cPVMLB6zbVKkDIes3toZBIclsqNOjMJFDp/7YQKe5yWLo
         4PmKA734UI2azJ3T7VUH8A2JliwTmbd57qsIDzQuj2Rd21ixhVsXJsHRhB1CLVew5JNU
         AQX7vwzOqHahZMEYxJ6YpQXdMzaO69PNzxX88pW/EBnPsFOlYBvw7MukbBM1I6bh1Mop
         kYKFsLBPDyTsACIco9EPixGcpt8RjmrO2crEyKNIREvQI1jd48AZ0P5+8ShAvzRO9iYd
         gJvz6nSyvFrFofD6shJ3Knsu4o5iwSbbp/ODJIib9RfMa6PyySaL07X28cOuODhkLgIl
         lDQw==
X-Gm-Message-State: AOJu0YzQm0bdYAgh5gdZ/bEQ3YhaotNnoTKwG+PC+ohKFpPkn6u4kP2o
	m2j9i0oBgO/Eh+LT0sd0cA442k+Q0MKs13XsCjFCcTPywk3yD1cs7C5qcojeJb+8Wm8bmA4UBCj
	OIxP1i9xWvflxeA/RT5UGAPDugR38Uq3LxrbsO/+QJkNZFAqHqOLh2mv7YlhQB6IbP0KpE1DyhU
	zLnV0=
X-Gm-Gg: Acq92OEPNDISXgyOTHMrWuL10AMo3l59yzLI2OCO/wFaJGLd7mupAFAUNZ68P9lcVEA
	qXG9WPQkMEI/WtsmU54Zik4VWBLzwoJ2IYR46mXURSffgUohpOIOOFXgXwnPEZBw/FVtEpMLbjm
	dqGlDqewnbFubrwWIi15Sj91qIi83hjKTRxjnEZJ696mV7B8jXopvpor0dAO8UHmi8gVO1Vifkf
	waLg6I58CY85RrfUsBrXPEU7brSYUGwiqXvD+vpMvWLCGVeVzlK3gpc6ZzeMzb2mGSS0t+5G5LN
	UEkQs7a9JFxoqQD4GF/drHYd0jx8fPJq4/TCZV2QPmuLCjTupnzUi/ijVMnc2kHVBVkGVqXIvGR
	39mlYW9vDWNOdpW7i5YPOFHqKAC2W+oPGnzrGTFG4KFPib3Yg
X-Received: by 2002:a17:90b:1a84:b0:368:6998:b49e with SMTP id 98e67ed59e1d1-36a6745ccccmr17923470a91.9.1779797315517;
        Tue, 26 May 2026 05:08:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1a84:b0:368:6998:b49e with SMTP id 98e67ed59e1d1-36a6745ccccmr17923444a91.9.1779797314922;
        Tue, 26 May 2026 05:08:34 -0700 (PDT)
Received: from [10.219.56.98] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7b92sm12314353a91.12.2026.05.26.05.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:08:34 -0700 (PDT)
Message-ID: <13632cba-507b-42c2-9754-21dace0c60be@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:38:11 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
 <20260516130251.DED6AC2BCB3@smtp.kernel.org>
 <72a2dc38-bfaa-4027-9871-0fb387242de2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <72a2dc38-bfaa-4027-9871-0fb387242de2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a158d44 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dVmKxVKBsDr991kcCGAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: lJhruofldq7JhnXq5aZS0kRttXmweQTA
X-Proofpoint-ORIG-GUID: lJhruofldq7JhnXq5aZS0kRttXmweQTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwNiBTYWx0ZWRfX3O/osMN0JeQz
 zW1Erp7/izNyRiZq/LTpg6yK3BagSc5OXd3420YCkBXyVgDNI6zJ2uXgkInxM++n8Zdk1qP7+jH
 AJnvXpKaaGrM7KGe33SetcM7qOOr5SodwgNgAQ3Z3yme/6YI1JA84PuMu3Q7hDHeGAwdu+wJFO3
 lnjCluSYc5X7N8F4HEb1ZGHn5MrMqfO+VrEdYugsDBYcHpo1ssXilYlNUCKBSIF+u23R+LzWbly
 /hnZFq8h93L3wPtGd15qnOWbIBzvcS71HPzJTZPsVRgq0miXlMxWaqH1PDohXCHlBCWrCHOhWOj
 Im9Dyteq6fX1GafSSndflyPg6DBMzc6rn10BYFdIPPhMvuMw94UoJHrS2G8S/GifNDGmlhxfRy8
 JSvEj8DfMQP/+g2Fn/mDLCdcPIpU/utEQ5XEzgPWGw+i3n8s2PUiiAbSWkfXwIji/KC1WRKAmGM
 6q8CHypTLjroA5CxDEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260106



On 5/23/2026 8:11 PM, Bibek Kumar Patro wrote:
> 
> 
> On 5/16/2026 6:32 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential 
>> issue(s) to consider:
>> - [High] Dead code `-ENODATA` check in `arm_smmu_icc_get()` causes 
>> probe failure on platforms without interconnects.
>> - [High] Shared IRQ handlers access SMMU hardware registers while the 
>> device might be runtime suspended.
>> - [Medium] Interconnect bandwidth vote is not released during system 
>> shutdown if Runtime PM is disabled.
>> -- 
>>
>> commit efe802bf0c93309aa584a5eb41c34c9788a6e837
>> Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> iommu/arm-smmu: Add interconnect bandwidth voting support
>>
>> This commit adds support for an optional interconnect path to the arm- 
>> smmu
>> driver. It votes for bandwidth while the SMMU is active to prevent 
>> register
>> access failures during transitions. The bandwidth vote is enabled during
>> probe and runtime resume, and released during runtime suspend and errors.
>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/ 
>>> arm/arm-smmu/arm-smmu.c
>>> index 0bd21d206eb3e..aedf5edf8f9b2 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> [ ... ]
>>> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct 
>>> arm_smmu_device *smmu)
>>>       }
>>>   }
>>> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
>>> +{
>>> +    smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
>>> +    if (IS_ERR(smmu->icc_path)) {
>>> +        int err = PTR_ERR(smmu->icc_path);
>>> +
>>> +        if (err == -ENODATA) {
>>
>> Is this -ENODATA check correct for handling missing interconnects?
>>
>> Looking at devm_of_icc_get(), it relies on of_icc_get(), which returns
>> -ENOENT when the interconnects DT property is missing, or -ENODEV on ACPI
>> platforms where dev->of_node is NULL. It appears it never returns - 
>> ENODATA.
>>
>> Will this cause the driver to unconditionally call dev_err_probe() and 
>> fail
>> to probe on all ACPI platforms and DT platforms that do not define
>> interconnect properties?
>>
> 
> ACK, good catch.
> I will fix this in the next revision. Instead of checking for -ENODATA, 
> the code should handle -ENODEV to correctly cover the case where the 
> interconnect path is not available, and emit a non-fatal warning 
> accordingly.
> 
>>> +            smmu->icc_path = NULL;
>>> +            return 0;
>>> +        }
>>> +        return dev_err_probe(smmu->dev, err,
>>> +                     "failed to get interconnect path\n");
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
>>> +{
>>> +    if (smmu->icc_path)
>>> +        WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +                   ARM_SMMU_ICC_PEAK_BW_HIGH));
>>> +}
>>> +
>>> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
>>> +{
>>> +    if (smmu->icc_path)
>>> +        WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
>>> +                   ARM_SMMU_ICC_PEAK_BW_LOW));
>>> +}
>>
>> Should arm_smmu_icc_disable() also be called during system shutdown?
>>
>> In arm_smmu_device_shutdown(), if pm_runtime_enabled(smmu->dev) is false,
>> the driver manually disables the SMMU clocks via clk_bulk_disable().
>> However, a corresponding call to drop the interconnect vote doesn't 
>> appear
>> to be added to that branch.
>>
>> Could this leave the bandwidth vote permanently held at
>> ARM_SMMU_ICC_PEAK_BW_HIGH during system halt or kexec?
>>
> 
> ACK, adding this in the shutdown path would be safer.
> It should also be includes alongside clk_bulk_disable() in the "non-RPM" 
> else {} path of arm_smmu_device_shutdown().
> 
>> [ ... ]
>>> @@ -2308,6 +2358,7 @@ static int __maybe_unused 
>>> arm_smmu_runtime_suspend(struct device *dev)
>>>       struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>>       clk_bulk_disable(smmu->num_clks, smmu->clks);
>>> +    arm_smmu_icc_disable(smmu);
>>>       return 0;
>>>   }
>>
>> With the clocks disabled and the interconnect vote dropped here, is 
>> there a
>> risk of a bus hang if a shared IRQ fires while the device is suspended?
>>
>> The driver registers its global_fault and context_fault handlers as
>> IRQF_SHARED. If another device on the same IRQ line triggers an interrupt
>> while the SMMU is in RPM_SUSPENDED, the handler might attempt to read
>> hardware registers (such as calling arm_smmu_gr0_read()) while the 
>> SMMU is
>> powered down without an active clock or interconnect vote.
>>
>> Should the interrupt handlers use pm_runtime_get_if_active() before
>> accessing registers, and should this suspend callback use 
>> synchronize_irq()?
>>
> 
> Seems like this issue predates the interconnect voting patch and is not 
> introduced by this series.
> 
> The clk_bulk_disable() call in arm_smmu_runtime_suspend() was already 
> present prior to this change. Introducing arm_smmu_icc_disable() does 
> not alter the risk of the race condition mentioned above.
> 
> So as per my understanding this comment can be ignored for the series,
> Will raise a separate patch with the proposed fix on this suspected race 
> condition.
> 

There's a separate thread already ongoing over this issue [1].

This bot warning can be ignored for this series and let the discussion 
continue over the mentioned thread [1].

[1]: 
https://lore.kernel.org/all/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com/

Thanks & regards,
Bibek

> Thanks & regards,
> Bibek

