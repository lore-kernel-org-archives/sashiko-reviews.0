Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C34CB8C1
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616348; cv=none; b=GtAHir8sDu4CtVE4eSVBIgqkLMqYWTr9iGAKMmQUIIseSUGCgDNfhx8oCKDebVI44PA+GN+VZAbDL04PU2tKErzLmzX0Ka5zzy4l/aHU1PomPKhhNbcDXaSV0TMZ61u8Lc+zOBtK4XIDkBde+TpxdF9Wr4QK8BGMkj7FBHX6ckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616348; c=relaxed/simple;
	bh=1gRmMOSALOO8kWr+qFYo+vdYVpTz5xADVyG/bR77ZKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKQsqPLbauIl2i5nmrjtdmvpx5Bb4Sz45Q3Vl/Gosh8CPxZyyfthuLg2E36M4kf6QT3e03sESZT9hU2RiDU++Q0lk0on1WugEfx/3OvePpdj75v0NxAQ7HDmSTNQN8aitDb7D6wc/bxi/CysPzGz9VNv9j7aWy2T0sZ8XKulo/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKxPE1KH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+CrO8YF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKxPE1KH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+CrO8YF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdx062863983
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrlqumGM5X03kg0nz3nd0uynpjwzXPZ61drZE/UEkGI=; b=aKxPE1KHGDzK5rDa
	yfNLgL9PuOvv1V4ilVktiJtonWFzqVNM/KMd/TY+xCXb8PZysfUBirC5tm9K44yc
	XE5Rw125PK0r4Pce/0hJKZh6tx10AEaV9wVk15WzMiIC0DF+44FhofmCdS/qGfJC
	uqIpmAaciv3E//3eXZxpiKpp1bkas+95XtM9u8X1AqK3l4hBRYsjDATABp7mhDDl
	JxKcWpfL50EFRBy935GsTVOMqbFgoh3mLrZARTNe5vE396zCGmlRehznm9OC66Qg
	XoQSUBxlZ/f3dShKRQ7J6iPPrRAJ6evATMcSl222+jq8lA9YIbKBfQc/MGUgo8g6
	8avuEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t2pxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:25:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso4784044a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616345; x=1791221145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrlqumGM5X03kg0nz3nd0uynpjwzXPZ61drZE/UEkGI=;
        b=L+CrO8YFb1Ff6+kcWcR8cvtsDYE7foS5C5/JF7PxvyRwS+euUbuqoT4o9LbYQfpbQG
         bhxy8Ja8LJARiM2iZdzF2EZmz8Vrmr+2GgVGqR+ii0Z7L5Kx5vtoiloGVMpxgkRqsRA5
         NoADtMpBe7jVm8PLIV3d5IrIgVQ2t6cbJrCzbr+CIbWQVBne/kBQLXD75eAwrN0ZSwdx
         ojXnIsYRO3ZUnaE2Vk4tNE81Q+hcZxOzBxJih47D1pjOJ0Qpm/mV8UtHNQRBO3ptND76
         Vm1+ShECzNE8RsEMvkKota5LPDRc3b92021T67RVgT+0EvsNxcuUsOUJm+VvT7/RoU5B
         J6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616345; x=1791221145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrlqumGM5X03kg0nz3nd0uynpjwzXPZ61drZE/UEkGI=;
        b=z0hcSb1qziEHExJJY9SKjHLiCta3bP6FV+3j1TTfE1x/ckRxC4UUufi73traClSOcu
         wODwLbXp+jGpu/Naf54iUXKm6uXicVn9VEGuN/O4sPQx1UOLq985Q5bbzjqIDcquPRDm
         +PFqJqyZ+qk+6InoedWfS1T8Zy4H54oooM4/1WBLj+lVHa32rEgtfQttKyTau0CZuriT
         Mg67KwRhoAEoMyWa0zJL1VWMtrllRrfzq8TYjjBIvt0AnixzP6QiXyQNzv2PKI3owi4R
         DskqgSEywVeKUYqexrJNcbFtpc+hhRldHsNMs1EZu42QEZ0UVXCYq2ZJh3psRjByMT+r
         XNvw==
X-Gm-Message-State: AFq9FYJtTiwQO66WSdaXB0pfSorx7dsdR0G2W3ttvTLNnr020CjrJDBL
	aOdyRbbRUR02Mly+8x2RjlNXiKSJptIw+J62VVq6a4iuyNsQG4JzwzWEqr4BcMlH0hI+n6neRB8
	Bo4KIYiN2+ADGtO1SKKDJNn2CqVpmFn25RbSPkz/LZ144EzpxZ89w4H2MUJ4WvZuDNyXZxPfRyb
	Hl/pM=
X-Gm-Gg: AYBFou2CQg6syCO70KI+1+hs9Eu9RAiF0hGpUPjd9NI0sbF78ADqHsFZILRq+brjCOV
	yhnfinM5/0+JEaD3e97PAmYl1iXQz3N+xywm8BwQ0IJ21Qe1YPJdRrja8Cwekq87zHirpmK2if2
	MPm0AaKHhBVjpW4rwHtbcBMe5JJpAlU8pkiE/gKdOYzCmIVmUKXszBAQgOQrFLdhWOHITpIzTzb
	wyRZuzoPuoFULbWzflOoZH6KarAPZjDm4imwSNTpHIiWfN5bB8mLrzYJgsON0/9IEy63uepBJMP
	X2jOnfo7fIICrDHpW2VvV/OrNkZwYYVNX29TC4nyf4YzVPOTmmzC/snYekEH17nGDcPzKkPEY1e
	3jJlUbmEpGh7B6vY0pi0K9MUysPTwYzKP6Q==
X-Received: by 2002:a17:90a:c887:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a0d5a90e32mr7092873a91.57.1790616345203;
        Mon, 28 Sep 2026 10:25:45 -0700 (PDT)
X-Received: by 2002:a17:90a:c887:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a0d5a90e32mr7092849a91.57.1790616344471;
        Mon, 28 Sep 2026 10:25:44 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986ee2f7sm482725a91.16.2026.09.28.10.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:25:44 -0700 (PDT)
Message-ID: <18a5d9c1-1ef9-4dea-8ff1-78d298a6465f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:55:39 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: sashiko-reviews@lists.linux.dev, Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-2-b24e2348e8e1@oss.qualcomm.com>
 <20260928062639.3753D1F00899@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260928062639.3753D1F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX9wLCXEZXSI5W
 5s6UmXgjYe6XxKJI2OjNRNZcEe2wlnNrVhBwIGXh+6aWXWzjrsf7vpFA5DhrWYQTwwj9WPxUS/o
 EgwoSDI+tNHvSrl++2p+izpVjGbMllhkrSWf1CcIofeYNNUIWahfKhTuN/oPiw3wgaVYrOskpHO
 FQNO1Bvqrp7gQB2pQ6ACbS/9jlVfQbXTA8CsxUKfaP47fVQywCEh8gRkYZd6305RI5lj3l0lVyO
 3RkrIUg4d0HCRTZZr8zIh1D2juZR3h8v+4tUMmsaFhxcXKF8ECgqGLgMpV1wk+DP0jOfoN1bejG
 epSceH524DdZR3eb6esddI5bjRb3S01tCAIlQUEdY5J0YAt94egLB0JtkiSISQ69QacvBjmwNu5
 E5gh1UGb9TRHismnjtWm6PxgrN1lncyUGX8nASvKzOXLgF4Z1peYh47EoxGYm6mmpiCMK+Fnkkw
 hLLzaR4oEvO5gBWAYqQ==
X-Proofpoint-ORIG-GUID: gIiNp5zRounBUoV02XxEMBOo-j7cnYfS
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6abaa31a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=0iu8UVjuSkuIMUlAYuuJCw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BXv5m9y5FIUjoEO0wCUA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: gIiNp5zRounBUoV02XxEMBOo-j7cnYfS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX0nLqYjnxM94o
 kNSpc68uQnf3RrqsPE5L/M8aIZJ3yY0erU2GQ6tEycvpx1YAxfACOiJL0QYzVVStue0sWsr8dhN
 zr7ss56iiW+KnGXprwDrtUPkH8ZFds0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069



On 9/28/2026 11:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] power: reset: reboot-mode: duplicate sysfs entries for predefined modes
> --
> 
> commit 613bc6d4edd9d0928986367eb5de6c3fc84d4d4e
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> power: reset: reboot-mode: Add support for predefined reboot modes
>      
> reboot-mode based drivers can define a reboot-mode by adding it under
> the reboot-mode node in device tree. This limits such drivers, to define
> any predefined reboot-modes statically within the driver and creates a
> dependency on device-tree.
> 
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index 328fa37598df3..fd61de2263836 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
> [ ... ]
>> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>>   	return 0;
>>   
>>   error:
>> -	reboot_mode_release_list(priv);
>> +	reboot_mode_release_list(&priv->head);
>>   	kfree(priv);
>>   	return ret;
>>   }
>>   
>> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	const struct reboot_mode_entry *modes = reboot->predefined_modes;
>> +	struct mode_info *info;
>> +	size_t i;
>> +
>> +	if (!modes)
>> +		return 0;
>> +
>> +	for (i = 0; i < reboot->predefined_mode_count; i++) {
>> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
>> +			return -EINVAL;
>> +
>> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
>> +			return -EINVAL;
>> +
>> +		info = reboot_mode_create_info(reboot->dev, modes[i].name,
>> +					       modes[i].magic, modes[i].count);
>> +		if (IS_ERR(info))
>> +			return PTR_ERR(info);
>> +
>> +		list_add_tail(&info->list, &reboot->head);
> 
> [Severity: Medium]
> If a predefined mode shares a name with a device tree mode, does this
> unconditionally add it to reboot->head, resulting in a duplicate entry?
> 
> Since reboot_mode_create_device() directly iterates over reboot->head and
> copies these modes into priv->head:
> 
> reboot_mode_create_device() {
>      ...
>      list_for_each_entry(info, &reboot->head, list) {
>          ...
>          sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
>          ...
>          list_add_tail(&sysfs_info->list, &priv->head);
>      }
> }
> 
> Will this cause the reboot_modes sysfs attribute to emit duplicate string
> values (e.g., 'normal normal') to userspace?

This is documented in header while adding pre-defined modes.
Should a developer/SOC vendor take care of this instead of making this 
code complex?
Will wait for more reviews on this.

thanks,
Shivendra
