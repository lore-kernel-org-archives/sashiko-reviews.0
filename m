Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B39478851
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036954; cv=none; b=eaZsR7/Y9HfigH29rMAjW3UthcltEMXyt5jLKFN+DG2DOw3w7xboSzwBZ6EV0j8uf4X2MCqZyh5U69sY84Mn3H5Ca6buL+Xs5+FcKUwfaLrSnOcIEHX623x2p+TXIKtAAwLYwBHdFlzc0iv6MPR02CJWunQk1x3lEsJhl9P/bOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036954; c=relaxed/simple;
	bh=SClfuac9ud29KuSYJXQWNmV3qEKxt55agw1QUKxry4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnamnJO3OXNvObcHv4K5HBBtltEet5An2ALdm8f9l20dEeiVcyXBee4nySEStH4cIv0ll3zg+GLU29xmIGzA+6HTrFNCo3xgZWoIRMLoDNXg06uo0ucQNf5lIhSovQrgoVo1JaiKyAKwEi4Dv3gASUO6DUKn2rYwG7z99bojwiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9Sf7JRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzpPUNcB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9Sf7JRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzpPUNcB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED5Lqm583069
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zb4BwnO9hBkM13ut4Dwv+PbiVMGnlurvOuDF7WQ+k4=; b=m9Sf7JRGshn4edY6
	lHUhOJOVk6HwqwDHCLCJRLlbkiNMJajnrLITC9Onpi4dWXhgYHriPkp7yGfvnv7P
	y1Q0UxzO9zUyRK6tmMMkXP8Pl8hT6RWgkCBUmbYVwQTUdTDG4RInKd8KRYPSe5XW
	HiCtmzeTbSSm1Los5a7I2xv2/YfguocNgPG7YR89QZfe8R/n2GxRFTdBl92Tev5J
	EAW6Ix8b0YDCGWHZcidSng1VI9Lr/xmIVsxfbvdUbHEorwbVyOJhSZwzNr+wUev5
	G8EfEGdnQWjDzhQJuvWIjdrgICADWB2sJovKBzYFiRoEguSYme3AmyvPTaZQSWYJ
	SOwHCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr07bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:49:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso6424788a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784036950; x=1784641750; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Zb4BwnO9hBkM13ut4Dwv+PbiVMGnlurvOuDF7WQ+k4=;
        b=RzpPUNcBvLSoSHbmXojWjVFbbfZGLXxyV9FHgypINt6+8XAci8Y0oFHwi70XSEJjFK
         f+7i9oxt2GQd07yvXk61fFszG8C3RMvsXy9GPF2h3s4DcBgjuCn+EGdKAiEDAczC0gMe
         phNaKyPFBQfBIB8XUFLhPJfJN3qYDSdW1vWdVXSS9Kz6GA+NezXKbPSizzEsIax+Fje8
         R8RwE8f+OrKfCYD1ot5HdZrDSRHeXqttqn2TaUeDe3drzrpHNcnDrWvRg56+oxjFX1bA
         NTHzQJDG5KlRak7ievhrUYrmdppT06tLVjFxS23+hJUTOBT/7Iwr0NLCXnnJAmR1IxwU
         LsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036950; x=1784641750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Zb4BwnO9hBkM13ut4Dwv+PbiVMGnlurvOuDF7WQ+k4=;
        b=FkZIeTNE9N5MzHH2JMdY0G9J2tzsHTUFqYt2SqX12Gg8l8kDImSECXpYOz8HN2nr6w
         ETK4sanWhIqgSrNAw9DZUFpjVDDJ9I+oukBjg83Dh0NX0nBntP96lMN7C7oxIHNZPvmj
         UNf/Hh6L0SlLTYfAX5aPd/oQO/eDjDwGEEKlnkPaMAGlZh+rvqJQhQKaVf9UlznybSIk
         iBmAVkY17GlFkNey9CDi6gPYdvUVOsREnLgvOoJ7F3tSwlLuJdjBZAgW1Wh4XxX21mUp
         qHP/6OR4vAZNp7EG+1KKh12wyxHCBkOjRF55UUuf9WZGzxqKnllx5wOk2dTCOJ26/ugq
         rZpA==
X-Gm-Message-State: AOJu0Ywn0co73DSGYlqmyP3YTnF/qrOCP9MGYYgkuk5G7HlNKIJz/vmq
	7ld3ViagErSbXgT2w8SO9V8xx/qw/5WW020KLdiCWOj4UXjKtahQbUiYHgpVDHcyaHzIYrZvRLZ
	ZgkQo/CFoC3Yv5St836Yke/pTYICLrEfNwWEei3PD7azEeLYFawRL2lLaaNJYTKfCnZnQIe+QMj
	HcGJg=
X-Gm-Gg: AfdE7cl6QHfDQwlz4tWxokQBSPyvIxDNixc/9qlFKX94g/uHrr9+HIqFpJbSf207FUx
	8bqMKe5MmXTFcjwq68GT4OyGjPcL3rx5j/GMFIQqYeg3oi6L1fx+LYmdq41lNYewyE+Se7Sl9lR
	Bly6/qwRwljk6opHgCP+tg/s8l2j9F4txI6kKlptFqGm+gI7668gXUcFuU5nRtfKSL2Q2gCkXWg
	EenkHv3MpsNCvlWVlsJvxoLqa55WhTRH8E5GA3XO+mm4zhpbVyuoWseavFSjD+k11HVNWkP17XZ
	ZviiH4+z5xr/HAu8Au1wkI4GwjQa0vbN8XSnot6ITU/wNVbdID3MmG2bjAjqwjXjZiILQJSTBw0
	kEA7u1sb0sGWivmTnWhEa1sUkav3aeNtEmWili/E1k7I=
X-Received: by 2002:a05:6a21:9f17:b0:3bf:6c08:fb9a with SMTP id adf61e73a8af0-3c110a1e166mr16324513637.60.1784036950520;
        Tue, 14 Jul 2026 06:49:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f17:b0:3bf:6c08:fb9a with SMTP id adf61e73a8af0-3c110a1e166mr16324489637.60.1784036950055;
        Tue, 14 Jul 2026 06:49:10 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm48909158eec.28.2026.07.14.06.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:49:09 -0700 (PDT)
Message-ID: <6c060ba3-7d98-4699-8203-435264097482@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:19:05 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/11] media: iris: Add helper to create a context
 bank device
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-3-72bb62cb2dfd@oss.qualcomm.com>
 <20260709131006.A21C51F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709131006.A21C51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX1Z4dDwU8Be8D
 VqA1oO7m5lO1O7C05drWxxxOn2SiQoTMmk5En9xvbPfUxvUdTB3Mk2mDmJ6LEhryYY/mJ1lf0UN
 7fySE4NgJnWxay80H8VAQRRMfkrhXEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfXzf3v/Ger5dw1
 oQMV6k8zTp5wjBokkVmGwzEJ07CO3KpHDo2JeBh5ml3P48YWcv61n41sgJn+2gujhEa/pQcArKy
 gjSrAMuIGaLMqhA+f7mXipfjObxmHCpnNi5WNSVZ4VKcnWWNoiE2zuKRqU+y8saKg2LI5fY3W5G
 e3oEOCVUl/nlycvIhmqqaLz8roicesPHdZjKrrmsD7Ld5LdqOB7kfLSIVMedB20YBOJnmo1hnSK
 NtQTQYadp6AQvTlvtz5T4NwBlepFWXURuLVa0cZJcZuh67b3eGa1XKWfHwKO3ZYLnYyWMtCTGpt
 y3dGJp95fo6i2sY3fhZSw8pZtL2EhKhf8ZKD75zH4bp/EY3ri3kHb5d266/GE2tX3jjlyiGik2W
 3/K6haxZGeKEQ1xHn6iL4RimTAmTNnuutyQCHwnC3sKyEDaois09RjprpsoeIm3/ga9rfiEZjPG
 vKBiI3JdA2K9qNnQnUg==
X-Proofpoint-ORIG-GUID: kAcYbGKJlRSaD3-mHGwmOIZtl3kuyOn4
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a563e57 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NdL5NlN59Xxin2KEPb8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: kAcYbGKJlRSaD3-mHGwmOIZtl3kuyOn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140144



On 7/9/2026 6:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The context bank platform device is registered with a hardcoded instance ID of 0 instead of `PLATFORM_DEVID_AUTO`, causing sysfs naming collisions and probe failures when multiple instances of the Iris core are present.
> --
> 
> --- Patch [3]: [RFC PATCH 03/11] media: iris: Add helper to create a context bank device ---
> commit d34d83e19b25d09de0876c75096c26d30aa90223
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Add helper to create a context bank device
> 
> This commit adds a helper function to register a subnode from the device
> tree as a separate platform device, allowing it to have its own IOMMU
> context bank.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> 
> [ ... ]
> 
>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
>> +{
>> +	struct platform_device_info plat_dev_info = {};
>> +	struct device_node *child_of_node;
>> +	struct platform_device *pdev;
>> +
>> +	child_of_node = of_get_child_by_name(core->dev->of_node, name);
>> +	if (!child_of_node)
>> +		return NULL;
>> +
>> +	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
>> +	plat_dev_info.fwnode = &child_of_node->fwnode;
>> +	plat_dev_info.name = child_of_node->name;
>> +	plat_dev_info.parent = core->dev;
>> +
>> +	pdev = platform_device_register_full(&plat_dev_info);
> 
> [Severity: Medium]
> Does this code risk a sysfs naming collision if multiple Iris instances are
> present?
> 
> Since plat_dev_info is zero-initialized, the device id defaults to 0 instead
> of PLATFORM_DEVID_AUTO. If the SoC device tree specifies multiple Iris cores,
> won't the second instance fail to register its context bank device due to a
> sysfs naming collision in /sys/bus/platform/devices/ (for example, trying
> to register a device named 'pixel.0' twice)?

Ack

> 
>> +	of_node_put(child_of_node);
>> +	if (IS_ERR(pdev))
>> +		return ERR_CAST(pdev);
>> +
>> +	return &pdev->dev;
>> +}
> 

