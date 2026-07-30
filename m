Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428873D9680
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401182; cv=none; b=h8Qmeq91x+6+hJGPqhK3Vyznrv9rxWQIvtvVvlMALnFPM2qNEjzlIcjL7lL/hVYkc+pxFWqfbGfm2b503b4y2AuE+Fe7Gc19jP6RrKvcChVPX9SE5ntE5QtO9Og2LnYCq+S9e98DjQSpE1WtjY1xt0n/uEB/hikTaYWFEydi2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401182; c=relaxed/simple;
	bh=u/3Gho46m+IKsLGDs1Odd9EXyYYA4N3c+swlMMYhuLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxNKqVnazMQGGCPFoZNQkMCLP9AF32s+2mn39R3zkqUsUexq4lQgIE6w49KYrHfj1WuJCKVpEMcq9Nyu9GCWs2AZE/5eIilkhMAHtXGin0WCvVJrslWKJImrrw+nRKNFqolqv1oImzILXFiwi45LgeV0G1YApGbwRIrWI3y+4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ8K2ym9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkDIjV55; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ8K2ym9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkDIjV55"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7xbEm354056
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKH6sZ6qLExth2yi+RD8M8xlUwBXb9XX9ejIrfjRgoU=; b=DZ8K2ym91W0CX9dS
	B68QNMuqDHLM55CQH9//XbRMerBlvcNrKLhDthojZThZ6qtVGIv565dl17WGNgVk
	tRqXxe8AaIptIZrCMKAGyLTRfuBFXFAKjwW9uqlzS9hbbt0Ybnnv41xYuUtWxlXw
	vdeikl3cn31oyek5RLirGNn6W19NuWBoKV1WGoTsLng4enc3XgmF/u41J6J1zPLA
	RhTYHQamRRq6gS2dlv3KLazk+UOQ31nfUK1Qb2JH+z/+y6ge5aReEpoDmnet/T+4
	p59QKVGRLdmX2Cac0qREKJOrDNhR1TJXaxMr53U4c69pFRkSrkjiFql0ZAkH7Kc/
	s8M4gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2q6g6ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:46:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso25975945ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401179; x=1786005979; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKH6sZ6qLExth2yi+RD8M8xlUwBXb9XX9ejIrfjRgoU=;
        b=PkDIjV55qW8QiZl+g6A/tmA93Ljm/4usdXAMPzkXIQmPwyZ/qkp+oEUO01wcgwSbk4
         l+TsQmBNXQLSiZFxcIUQn61q5ua2DBtyrILZfcVjXRwv5YOExOZzR+KKVDwm62PsaNuF
         PkIHuWoaQHnRLdRlZuYyNjIdCu0ULujR66bvJeyBYoMuMD2PCH1znGVXp8eAkK9wbPcg
         ypGGO1SpSMWsz6nElGVgFVM9PU67koJ8so6M5Xe+gARnHwUXhiQm0CXr09ziVw5mTWXZ
         m8+/hnrfTBdfmH3Bwrr0o1y+ksJBRVIKC4k0i7pwgX95o0RSZ7m59XP28HGgRGX/F2AQ
         1kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401179; x=1786005979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKH6sZ6qLExth2yi+RD8M8xlUwBXb9XX9ejIrfjRgoU=;
        b=TMkHKzVPv81ZfSW/vOWJUI/H/lRszr9uEkqagEfwpnhP9dJ2hTTAgYGSRclLecr4x2
         Kue1z/KktS1N3Z4cFXyb+5YtSp3AALkmF7C61YrXLkH1yxjnTkjLCZ6baqd9vaEbO14F
         lbSIDCuYRKadMSjqSpQ/8AzAeoh0YrvX6HLpy9mw341x1EyD4y0ekd+2Bbdbx+mjLxHk
         9wzv1987sW+CdoU+lHa9Iox1AAuW9G+QBAKhh09s9VAzcEnyjxHx1zHKvYOWLZzWxCEh
         i4mvWLCTQX+UESLwbVTiwlDUZDRI8XDAvGHXuIno9xD285FkaRbWhEB8JW9ro/Sr8TkP
         wKNw==
X-Gm-Message-State: AOJu0YwNvq9L4lcSgF1IGrW9hi1rKxH+KUX6mtsP5OTjMieovzsmDT86
	kHoKEMNymjuGQAEWCnuxaNeoQ+5lmgdFCo9k7O3GOyWTIIu+xLV1fOxrkzfuIh9dF8Istf0TA91
	14TrYkPDDxX0ZKHIgtnQyrTGAUEZWzCPcErl5jeJWF6jkNQFgiRpdACuXMCaBQcBeRofiYNt6fm
	s+AVRcOg==
X-Gm-Gg: AR+sD11rHL1or84yW72L3MntQBajttZrZf07A/zwRuBIdYxx/ewnKspKPl15r8VKKUu
	yLBIVf/y/D8X5FgUCZGwOLqaC5/2LA/wi1QrimRg5thmLPxSqFadYXVtvQNGLmYGP2K+nQ4mD5C
	PI0lE3TWIjzHmFI8k8YOP/0ypoIZaUVwM+fxjYv1hXkpX3fvkGg8EZvsKNmNBK9lOxqEKjArh3a
	JqWOkSvSWUFYU0jDmJrk03vYVFRdDT5jkLpzYCOMdJOj+LMzikUz03fPhm89VuwQHuIFVRyXRfG
	CTMzYNmjbRWHPMCmhtaGDbYNC+eal4ZsyQ9rQ7UQ2q8/q68T+UUUsr/UQ5DTzthz1ruPOoXwOzC
	5uKd4f/lLNxtdcvHNYiuEAl0fUoBZsAxR70lfUd/C9aIej4rPoWf9zlx3f0IUOnBHz5vQHGXG
X-Received: by 2002:a17:903:2f81:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2d035d0b929mr16894275ad.44.1785401178780;
        Thu, 30 Jul 2026 01:46:18 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2d035d0b929mr16894045ad.44.1785401178322;
        Thu, 30 Jul 2026 01:46:18 -0700 (PDT)
Received: from [10.133.33.210] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a7e333sm23267925ad.36.2026.07.30.01.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:46:17 -0700 (PDT)
Message-ID: <bb8ce65f-755f-4f47-9f0e-5421d6856b76@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:46:11 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality for TGU
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-7-songwei.chai@oss.qualcomm.com>
 <20260730081830.43D6F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730081830.43D6F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MiBTYWx0ZWRfX07KzBHFGUSIJ
 tja/3qPdkb6BShUeWBPDk8R+Oen/A2ENOQfPBKLbuTt8ti8j3n7ipocF68l2Jc8R7wXcR4GUN58
 AKtLJxQxgxs9kG8oNO5y/NcF3KP/XPxVBdNJKF5zjiwnS6BJ398bOx3B+qIbG1gR5sYTYKEDy2C
 U5U2UdWBcJn7KpsIXb8W4/IZMOICUW7ZkxMB/+vdBkYQHb7nfPQiwn5RSqp7FFKxm3csA4Ht0u8
 iUPN6UrdaQbEUTbl5dgVz7tJws90REL6b83jh1dBeL/69OkEK8Ecp+iu0ibpNrPZ5R928A96VRC
 avVSqs/kdEWgiyfigq3EcruTREqDi3eo7xST0YZtluGKfroqVJpvWK5aDiuDsDNUuG/R+A/oS/7
 cecS/tGQ3KeDKxsPFTduMoJwocvLdVm46CigdkJTOAQkI2xx8cS7uygUSNDw96HN53dbAjkUr3c
 6+5RVkuzcIC34swdXpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MiBTYWx0ZWRfX/hXcGwtC4T7s
 xvSatfl5wXg61irvuAq/7GUguwjqZf2T/+gcr7s9KWPcpvDO0xw9MtQWdfPQZTACNivqy4EKCnQ
 sAMU5tzQZctlHRQqHTJ+dTakTvDnojs=
X-Authority-Analysis: v=2.4 cv=KYTidwYD c=1 sm=1 tr=0 ts=6a6b0f5b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=spI2WGiqmeZJrFT2-h0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mcjiclOHE6nscxRvqgU8QKJyxo9801js
X-Proofpoint-ORIG-GUID: mcjiclOHE6nscxRvqgU8QKJyxo9801js
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300062


On 7/30/2026 4:18 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incorrect mapping of missing hardware timer and counter registers causes out-of-order register writes.
> --
>
> --- Patch [6]: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality for TGU ---
> commit db9df0865ab2140ab0eb7823166108ce956f637e
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add timer/counter functionality for TGU
>
> This commit adds timer and counter functionality for each step in the TGU
> driver. It determines the number of timers and counters by reading the DEVID2
> register, allocates necessary memory, and exposes sysfs attributes for user
> configuration.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 7f0a74514e40f..ea83273a628c5 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>> @@ -236,6 +266,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   				drvdata->base + CONDITION_SELECT_STEP(i, j));
>>   		}
>>   	}
>> +
>> +	for (i = 0; i < drvdata->num_step; i++) {
>> +		for (j = 0; j < drvdata->num_timer; j++) {
>> +			index = check_array_location(drvdata, i, TGU_TIMER, j);
>> +
>> +			if (index == -EINVAL)
>> +				goto exit;
>> +
>> +			writel(drvdata->value_table->timer[index],
>> +				drvdata->base + TIMER_COMPARE_STEP(i, j));
> [Severity: High]
> Does this code handle sparse timers correctly? If the hardware implements a
> non-contiguous set of timers (e.g. TIMER1 is present but TIMER0 is absent),
> tgu_set_timer_counter() will set num_timers to 1.
>
> Since num_timers is 1, j will be 0 here. This writes to TIMER_COMPARE_STEP(i, 0)
> instead of TIMER_COMPARE_STEP(i, 1). Could writing to an unimplemented
> or unclocked register cause an asynchronous external abort?


Clarification：
All three comments point to the same underlying concern: that sparse 
timer/counter allocation (e.g. TIMER1 present but TIMER0 absent) could 
cause the count-based index to map to the wrong hardware register.
However, according to the hardware specification, timers and counters 
are allocated contiguously — TIMER1 cannot be present without TIMER0.
The same applies to counters. Therefore the sparse case cannot occur, 
and the count-based approach is correct.
>
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < drvdata->num_step; i++) {
>> +		for (j = 0; j < drvdata->num_counter; j++) {
>> +			index = check_array_location(drvdata, i, TGU_COUNTER, j);
>> +
>> +			if (index == -EINVAL)
>> +				goto exit;
>> +
>> +			writel(drvdata->value_table->counter[index],
>> +				drvdata->base + COUNTER_COMPARE_STEP(i, j));
> [Severity: High]
> Can the same issue happen for sparse counters, where we map to the wrong
> hardware register if COUNTER1 is present but COUNTER0 is absent?
>
>> +		}
>> +	}
>>   	/* Enable TGU to program the triggers */
>>   	writel(1, drvdata->base + TGU_CONTROL);
>>   exit:
> [ ... ]
>> @@ -316,6 +370,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
>>   		drvdata->num_condition_select = TGU_MAX_CONDITION_SELECT;
>>   }
>>   
>> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
>> +{
>> +	int num_timers = 0, num_counters = 0;
>> +	u32 devid2;
>> +
>> +	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
>> +
>> +	if (TGU_DEVID2_TIMER0(devid2))
>> +		num_timers++;
>> +	if (TGU_DEVID2_TIMER1(devid2))
>> +		num_timers++;
> [Severity: High]
> If TIMER0 is absent but TIMER1 is present, this collapses the presence bits
> into a single count of 1, losing the index mapping used when writing to the
> hardware registers above.
>
>> +
>> +	if (TGU_DEVID2_COUNTER0(devid2))
>> +		num_counters++;
>> +	if (TGU_DEVID2_COUNTER1(devid2))
>> +		num_counters++;
>> +
>> +	drvdata->num_timer = num_timers;
>> +	drvdata->num_counter = num_counters;
>> +}
