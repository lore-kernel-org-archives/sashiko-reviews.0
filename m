Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20D3ED5D6
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013832; cv=none; b=dmWDsFwnb0e1KtbVpL/B6oR7UD6jhs3h3T5dIeSJOoslaUk7VDfWyoFkMndbQDlEsuSvo0LmpgDfmQdORYwXuTPFNSb/7bR9CutvYcIgOAPvlqjq4eb0tCZ7UABoNiz3FfYY9AHbKyh9UMq7j8J9CznOgZVQJ1YocCIoV5byy8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013832; c=relaxed/simple;
	bh=XL9p2IkZ32KmxlLmmFtMsvWL1B7KGM8TtwKZk1gBw1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8iP2lsPEqikaUMI9Oj5q8JUtLje6T4lrBLBLWcxMj2p4Z9TRg25s6vtOHVeWdj9wOJutGYh+0xf1GYW9hEc9QqF+fMN1AVIlNbvBReQDIP1f4d3uL22o1ue4YdYWedjseP4O/D5hb+PiW8ynQ/QNviijO7bPE6Zb1jwNZy0a7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEDhWo+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSxbWft7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEDhWo+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSxbWft7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SaAx4005282
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 07:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tdz6q5jPnq6PpgNSf1s8jqzqfKCmVESx3Qk58j+qMoM=; b=cEDhWo+JVA/BiPDd
	0aYQ8pgBl5dH3x19afFnTUbnXj/H/bV71Ulf0RbluGHez3rhx1aRaxB+o88n5Ebv
	6+NalHur5tcanxhyQ5u/Paq6i85xRi9GY3SleFfnaneQUum+xR2QA2/0YmH4bEHc
	KVJ23vz5lp0JuNRZyOOwkiL7+2YTXmW5axgi3l4cYHwbEw12cGujWKwoum4wW4eZ
	8+uvR1p6npAElmD+I/D81worxOjRJCkElqkUn6+hs9OL36q5UqMf174NOaYLKujk
	/CS9DS08+Jrvb0I+478mptONxMaEdYNfboudOnbngceZXZ95LiV2Jx2f1SXgIlUR
	qXcrNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ctkcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 07:23:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so6253306b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013830; x=1784618630; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdz6q5jPnq6PpgNSf1s8jqzqfKCmVESx3Qk58j+qMoM=;
        b=FSxbWft7/FahEm8i+bSN75tTiPzjPCaCoNC4+T/QeUU2ekpCZM4Z7ns7r6vohcjS9t
         GepvP8Ubg3+frPuE1JRi3R80P7Uwfvu+g1UWs2gIxsxiI59HtlYnXzBFsV5dAfJJeZoV
         l4RVcbKN8Gytt3uOwtETVRKyDQNsl9dUAwzVstzillmWIbs5jXfV8G5gNcAzBrIIKwi/
         5Pi9Cg6Zqb2EnGqT6qHmFUzXsOmQtTGJgGm9fHC57J/xyi1hFVLmWayTNeCojmvSvFGq
         p0q1OPhJoUizKlvw64cg0Os058vlAWOSgHDXzwYAY/w14dTTMcDAkfr3lNM41Bf1h7gm
         XRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013830; x=1784618630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdz6q5jPnq6PpgNSf1s8jqzqfKCmVESx3Qk58j+qMoM=;
        b=nSTgtfcVEjqkIvP0Aq6hqxRCKgeoPc0XW1L53d77ZiniD2c67pgc7cBSehBxi1qBHh
         LDFbH6DobzbcojfOGaCwUsLmwytjYwkK9FCGAWywkMZDrO2OLLCyNVPYwkRIqrDB4DpP
         hGj46avrd6PE1iVBPHOCOIBIgNBctYKRNBTVaY/RrAWlhVPjKIlQ6rIGwwG7u2VbaHCY
         0zE3qzxS6iQm0DY+7NLHKoPvmuhNgChWTIZUcoVWczHByXBuUgjQ0Aw1LugyqFRyo/cV
         BoqnD+NkQGlxaAzGvVF9ryW2cy2dC39I767rAioQB6sBwSObbwE95UMC+Uk4eVJCr+3Z
         fmLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjJpCUFh4oEDwZ6gI81XazOqnAESnNgSVuJ6S1kmXOWq9joRXTk7yNMFGxjj3c1chirUoczKvHqJmZMeYIu2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpu8MKARAFkB/7zM9aTdMpNlBzDKUQS/CXPIhrbdeCJWaXeoe1
	Y/GlJtOXYFUpw3zOALsesQMqC0rVeF9x/29UuA/dhURtgtbGV+1Fi4pNC13fihcADZfriG2ihhC
	OeSjFia9WYv8a2woaGC1cxz7ok4iSYDA6unYBxyFwRZiDdA7MUmpqsfOCakd0a523ykZ0GgI=
X-Gm-Gg: AfdE7cnpYlbeuesMOIpbE1kfsztNqTnB+/aXty5l7Qc/rgZdcbGQX1cb9dNzdP0ipWK
	ztAon6nN5jzrdiEpb0erc7uenI66Ox9hbuYANUOuSNnFZCNMBeFpWK9VAsmvIGURt9a5x5z/Ecd
	PVlnXX2O800vlCgXqAYGIql/WOBGN+U7JLnno6KiyM6SeFYbpYR7HThGkocKvQ3loMBZeSJ4d1L
	9O99dxJPmIllqZf1vxYu+VV7pMtSBItScsuXUILUdg+l1P+JYtvFG1Y74i7KyYVMgM7AICAkzrS
	PkVgB8Vak005ou0KucKMapyFgT8I409hx0W4f2EBWMXqoWoiazXhOhyhRwQX0yOtHAbf1TyKqfH
	TRHtM79jpL/4rsiHuP/dSyg/+vDaEji13pIJsvwPs1Xyc
X-Received: by 2002:a05:6a21:6b0f:b0:3bf:6c05:aa with SMTP id adf61e73a8af0-3c34d8935c4mr3214593637.57.1784013830198;
        Tue, 14 Jul 2026 00:23:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:3bf:6c05:aa with SMTP id adf61e73a8af0-3c34d8935c4mr3214561637.57.1784013829790;
        Tue, 14 Jul 2026 00:23:49 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm83688207eec.0.2026.07.14.00.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:23:49 -0700 (PDT)
Message-ID: <36f74f0a-3dec-4e3c-9f3e-2ae5a0c6970b@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:53:45 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
 <20260709135418.9421B1F000E9@smtp.kernel.org>
 <slmagkascgpr7wmuifdrkhhbbiceqqvfqg5n4boqui54sbgzwi@4sntjn2rddu5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <slmagkascgpr7wmuifdrkhhbbiceqqvfqg5n4boqui54sbgzwi@4sntjn2rddu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gEmg_pW9m4BOnTw2cDsJkM0M14CaExrr
X-Proofpoint-ORIG-GUID: gEmg_pW9m4BOnTw2cDsJkM0M14CaExrr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX9X9u5v8YFA2a
 v7cHTp+9hUqqixv9Gz+ycNIOP4Ku83UvhBs4qbaVw9aOgDBLcMLFW9CWyWxe8323xLGUNGkBKu9
 TIJoD3Ddp0oJfSBguDoQ+sCbz3CXq9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NSBTYWx0ZWRfX5kM8HNiV2XCT
 gcBa57Jj1gE0Gp4qABq0H7lVuk8OyRo+VvDUyTW8FvwQzKodD3z9Qlbc+uJBta+wJi9B8eM0jp0
 Su9F5OLTOdT6yGL0HuRdyvqO+S5VrJKmIHYSJuYZOpBAMO4RISPhNivPxlVOeUp9dpvYdSr5vpR
 TwfG4ERj0jWxToFMhcyzIKZ+qrDRpyy4lSSu7DCvC1boXSFMsnQwHYoiw2jC/drEPDFt6vwH7CV
 lH9AnW3jjvUVrsyBoYrsAROtKrFQzw28+OiV29/JZ+GOIr0I8YfHKgM7/Q5JWC/0zEvZgz0CFv6
 YmS3RfBehsAoVf0f1JBMEvQ38dtc4Z8YEzh88FUKTO/wpF2APuXioXg6YzHwMXMmS8+uxVrNhEI
 u1ZEDpji8ydhE04syNov5UmqVN5/vBNBy9dywShnB0e4C5lx/AeAjDdCCrWYjfb3V/Ylx7GFsrb
 Xz6A3G9eGoASepNEVcQ==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55e406 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=AIMNfybrAyUUqzaXpIoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140075



On 7/10/2026 9:42 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 01:54:18PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Unregistering context bank devices in `remove` while V4L2 FDs are open causes DMA API mismatch and IOMMU faults.
> 
> Please fix the runtime issues. It's not the first one being reported by
> Sashiko. Please go through the previous reviews. I think the nature of
> most of lifecycle issues is the same: corectly handling device removal
> vs userspace lifecycle.

The runtime issue here is nothing specific to the subnode approach we 
are adding in this series. I can look at it separately, or if you 
already have any proposal to address the same, please post for review.

> 
>> - [Medium] Hardcoded platform device ID causes name collision if multiple Iris instances exist.
> 
> Dreams... But using PLATFORM_DEVID_AUTO makes sense.
> 
>>
>> Pre-existing issues:
>> - [High] Missing cancellation of sys_error_handler delayed work leads to Use-After-Free.
>> - [High] Use-After-Free on `iris_core` during deferred V4L2 close due to `devm_kzalloc`.
>> --
>>
> 

Regards,
Vikash

