Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FA53BFAE8
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127499; cv=none; b=jaX2LvQFbeqPRp7sm2G14YsEd0R6d8ZICktA8gsK0OFPeowUMKHOe+cLG4Ry90J3et4vFQJIa0xKpcaE8S7axNMaFiyVXEq3i8njfDmGY2oA6MRoRM+zdvVV8R+2XgB96L81ui8at/NIFeSD3N+Q8Y4B0n90RuGxOt9V8JZDg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127499; c=relaxed/simple;
	bh=DJu0fphhdGpqRNcFSpC8ecp1oPEeAn4fhmmryomrNrI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hLXJu8GhuVw06YbZD+jZChH9tUnwBPgGqwi7sBFRlKEeOUsKdzIt9AT12+MLuh2AUMsVKbUdYU4Op72GfzMVF5kdiJIUrIFrE5aJZ6/7cZQSeSdOM3LwGqi5KPchHFsQJ18UicuHxdR7/beBjcghjZePC8FNDnpPlcQnPtAn6Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbHpb2Zn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbwM4rVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbHpb2Zn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbwM4rVp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fs692240238
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bqSX1rauS7IdDiUq8LgE6Re8JbPIik/s914JJLeAfs=; b=gbHpb2ZnMI0XMyxL
	joue6o0m7Cv2LS83sx7nwmwOIWhCRkE4Btx6g0SCW/0kKR0LbDl0z5iHW0FMJuPq
	wltT/PfBFQxgoX+Pf9ZgxBB94PVm2+dXNkUSyMVd+JvGyzV17ih9XRSazbn2qUZ0
	qLKq8YbcCtI2rdYq5UUSrdwJ3e26uNvejOGqBo8qDp4MO9jvDGFaUWVSmx5daGSR
	vSJX75NaXwCLORZ1+XnVSmciiBSHoYHIKlHex1ewGkOu+pNjcd8Iy2ZGLk+VxRMa
	Kh/NzB863YpNRSxO82WpVXKUiNqTLvDlF9fbhTKrGuP3efhmhUrF2nb7eHV83Msn
	41zS9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs0t5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:44:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e01a62d99so3180776b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 21:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127496; x=1785732296; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bqSX1rauS7IdDiUq8LgE6Re8JbPIik/s914JJLeAfs=;
        b=LbwM4rVp5ERMBPCtpC+RyrJEk09ptKM3voAi/HaPDDKkYOl249WBJuZqGr2vjCzi/x
         ayeNlj+BdK8UVpwRZN/lhtBL+lCR0ohv7h5EcKf16MlBEWsuTZMvxcMSmOpwEik7NJCD
         NEsNSOEnkt8rfn/FrcdsJkmwFUpiwb+Vw0UzQa3/Gg24ggkBSaDz4zy9Jg8734/m82Rf
         XPNOcex/jLBXxsEASQ7sJ3TVNgJzVPOMpS7aNmPBVHOSR/GXTdmyN2/DFXZfb7jM4b1r
         yKTpOpKMmjR88kP8t2s5SGFZvZAJ4R7ZCpMw10qnlSMShjoTNf/TbCANbt0MNShiPI69
         XrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127496; x=1785732296;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bqSX1rauS7IdDiUq8LgE6Re8JbPIik/s914JJLeAfs=;
        b=SXk6dq+pzCRqjeNwVEJfMlc1JZ5vjiBJaRgxHPRm8VyVs0v4q6qZkhiSBWhoDuU0Oq
         GZaFliWNGo8tZrctxRLiOkduvQGZUF5uNc5N0q7cXd1/MIIY2rrptQJDD7l/Y9TJbxrA
         MpxBbvlG72VF6TsvYR42YPch3fRvivFdPivaRm7SC7AzBX1euIyNg2AvYQajDSBpiuxj
         +J9DPdGdnie1uFWaD2a4dID+ib+Yn9d0mYru6lEspzrDTc2yWBndZEZJY4gUsGF4Q1QW
         KVRniwrbVQLHUlMMIEscsdP2ZwLo/JjV9N7c4hkRYTzSTb9/ObMZEvRU9xh72LJmqou4
         l+ag==
X-Gm-Message-State: AOJu0YyDHj0y9gmjoOKIN0ZhxKZPjQIr35WQCZlxiorzVe8OPrTNH9EG
	RBFdgmxx5GVZogzIe4rm87LDsisjjQaOTH6t7UA5Ex2d6pPPhjj61H2mB9pGGNRz0YXbLxkrs9O
	DCTedJOOoYogYGRCtnwrCdvrOqFhKUTnZLNLz+RnNf91FUhCQycoFnKS7g5jxr0SdROle0wpxIw
	TwU0o=
X-Gm-Gg: AR+sD10Shx3XW5mxD3rIUs23ihpP23l5Q2M3fLgleXx28FrYdJnAfWa3xSrHU1/lgWE
	JsIVDxFaaOiE49PWmceOP20RhBIWmU7JQopAyK3GLhcFG/bIahBnpR0TD0kcV3K/jRYO28bYSyD
	pT5P7UJIsEnbuKY9+qbesqghLc6qcI3sTGmrhcQRgyjkpH+bjS2MgAJ5SLX800NUA+O7tqFc4l6
	9+liRNdzIJCF3o2nXF5lnSWxvArBx38+smJsCicQKpWVROiXQLw87SplAtHcCEliHg/DwnR0Mhe
	2wfKXUQuweXRWgM/zdMUWMiDq3fjlloPJ7uSVaRH6p0zdKCQrv/ZJ1TWZgIL6WMsvf6BSNckjYx
	i63HDMD0AqVdilc/Ts8k3FQMKCRrsqx5O
X-Received: by 2002:a05:6a21:4584:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c67dd6a0a1mr5354590637.30.1785127496327;
        Sun, 26 Jul 2026 21:44:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:4584:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c67dd6a0a1mr5354575637.30.1785127495877;
        Sun, 26 Jul 2026 21:44:55 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm78908471c88.15.2026.07.26.21.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:44:55 -0700 (PDT)
Message-ID: <3cbd26d2-fb86-19d2-2104-c10fafe91080@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:14:51 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 03/14] media: iris: Add helper to create a context
 bank device
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-3-de451559e88b@oss.qualcomm.com>
 <20260726060308.649101F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060308.649101F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfXwzjx2Z4Ob5wg
 7csTFpDfOjkpm4QJcm14YrINAy9M9zzzsExbB128mvGMC51Tvoc6uaXJDF+cRIHzfr5Dv/3BHig
 Upv5gDj3cdao0hlP87RSyt5AYplA6c0LhPJVgcaW2CK87I0f/XUJWV1zEkvIIVqRaT0wE+ECFLf
 Ld+p0dbcinPfvzrhYLSENmnUeX7L2Pp8qCP1HfUBTJSGWkzwIZjvhEoEvrzS/Ke0V9LVj1nIYjY
 Kdsp4EIzUjvlW4jUCculJcYn3VIgo//+fF/YrwAVqINsbhx/RJEoDwMSd0G5/7J7dKkt14UrEgv
 xZ0U4MIt3AjRjOFXFZL8wByndsC/MI/zmLIfLiIGpXSpTM3a0YOm0TYQQJCdT7wCEnZ5P5MU8rq
 zJAEIMhu88hlptdR9uiI/08354OWuuwUZnJ7ON4oor3lTUaRV6OfBY/qBYfvssEjqxhhDh4+2DH
 8oUekxorv2MQnH0PxBA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a66e249 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qCBZZcZFAZ3g1NYsHNkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: kOXGRNVJqVyYov0vRZxr1F-RxqQOQYNO
X-Proofpoint-GUID: kOXGRNVJqVyYov0vRZxr1F-RxqQOQYNO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfXwpFQhXzFAp4A
 dUUyatPgL0j9NWVKmJ9R3gyQI3acXNmDtbfuD7tiSjpYzlROGTZQE//YZpkre9wx32oRHPeHrWc
 7wAt4kRvU12aqo/U+9GMxPU1BEFBqQs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The newly created context bank device is never attached to an IOMMU domain because `of_dma_configure()` is not called.
> --
>
> --- Patch [3]: [PATCH v10 03/14] media: iris: Add helper to create a context bank device ---
> commit 461ae3ede65da976a81591c71089c7621d163869
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> media: iris: Add helper to create a context bank device
>     
> This commit adds a helper function to create a context bank device for the
> iris driver. The subnode in the device tree is registered as a separate
> device so that it gets its own IOMMU context for mapping pixel/non-pixel
> buffers.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> index 773f6548370a2..a685915a19e9b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> [ ... ]
>
>> @@ -141,3 +142,30 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>  
>>  	return 0;
>>  }
> [ ... ]
>
>> +	pdev = platform_device_register_full(&plat_dev_info);
>> +	of_node_put(child_of_node);
>> +	if (IS_ERR(pdev))
>> +		return ERR_CAST(pdev);
>> +
>> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>> +	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>> +
>> +	return &pdev->dev;
>> +}
> [Severity: High]
> Since this subnode device won't be probed by a driver (due to lacking a
> compatible string), it won't go through the device driver core's
> really_probe() which would automatically call platform_dma_configure().
>
> Will this newly created context bank device fail to attach to an IOMMU domain
> without an explicit call to of_dma_configure() here? If it isn't attached,
> could subsequent dma_map_* calls using this device bypass the IOMMU or fail?

This is not true, please refer the other path

device_add() (called by platform_device_add(), which
platform_device_register_full() invokes) unconditionally calls
bus_notify(dev, BUS_NOTIFY_ADD_DEVICE) in core.c. For any device on a
bus in iommu_buses[] (platform bus included), that fires
iommu_bus_notifier() → iommu_probe_device() → __iommu_probe_device() →
iommu_init_device(), all at device-registration time, independent of any
driver binding. And iommu_init_device() explicitly handles exactly this case
dev->bus->dma_configure(dev);

