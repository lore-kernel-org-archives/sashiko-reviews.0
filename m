Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EAB49BD89
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542509; cv=none; b=prm9hfHFwPdD4w0wb6QpArq53UsyFOEHyuAgfR7VmQMhYyT3MlnxKJxJDygig/MzNEeZ+3UNSi8yf4PlRk0V9L0ov1xPy5PwtP6Y9L4RSLKhJuqeub3h64FD+C3Me4B4DdsYGQCOdeOLtUX1fv8bAWkf5iLPFwRmoPTHYeHI4A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542509; c=relaxed/simple;
	bh=o4u80REzz74dR1Ac9L0xc5dwRRgfLloRu/CR39GaXeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TllQSb4Tw4yV8WGlelaHCYUy8Hzdw1mvnTwvgKe6saLf2r1i/UTnGlnNb7hP5OAEZJ104Evuc1tDW3BtQFZOF7wzM5xC4YrhIaXQH1CUFjpswBH4eK5l9EfWZyXJk8R59Pbkq+LZA+wHb5sJF1jj4qOVysjBV+Euz+2pqTqsfHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9C0z5Ym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXHVOuI9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9C0z5Ym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXHVOuI9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KLVU1747012
	for <sashiko-reviews@lists.linux.dev>; Fri, 9 Oct 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GJaTtqlmWuMKqarpVsRT90Dd10w/lSHTVlgtT4nt94=; b=Z9C0z5YmhSsXuK+7
	3/lyzOHqCgyElwTp2QoH2jbkvI7pzrMl7XqWmGu3to9+GFEZGpXCg6xkPxkzxwry
	mpxcWKaHNV2XUgq/6fErJVQqLZuR0YFB9GHAaOg4kif9g4hlgROUzegQ6RTYkgFb
	ugRJ68Lxcbvmcpm4sTKT6aMsL5c4w3ciShoLyxCAbgBLe8CbGBRdeJPItzhn+vKw
	yM3QXn63lJXD0Ij7uH4Fjcvm3GeuVCMSJKFrVBRXLH0XigglKsHxlW28XNfD2gtX
	z3XsgVWjWJf7oX8mIAxZp2XwVS5WW/CeCsJCxhgqTN5RsBwjNIKF8odst4XBaVjY
	uowNDg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvbfkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 10:41:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso11901014eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 03:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542503; x=1792147303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GJaTtqlmWuMKqarpVsRT90Dd10w/lSHTVlgtT4nt94=;
        b=bXHVOuI9oA2FOWoJVn67AK6HzOSxPvd5pQDy2LySTqPiEh37LApA6ApLTZU9c1A1vc
         HIIOU7vePj+WLnjnmqBJLQXCeutaPAMTTxTZQFO3+yxTvaYsoUyqoCGIRCOKPI8yrQbE
         uwUY7B6Qur15Rx0RquZpzv1rLqDlWvbPg46J+to0Aexv4D7EHnxlXR395Sz7223ZOCPK
         XSad6hY9yoZgbkLPf9UiqOM6yAAatVnDXw2AZjCqrEtbw0mnpNbvxfkxO016pw9shB4q
         OUv0elq/JvN8ekZw1zXm/vWcbwf1GByBY0jw6ro3sQqwsBbD2KHeSlqiemfkDAsdo7Gk
         +w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542503; x=1792147303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GJaTtqlmWuMKqarpVsRT90Dd10w/lSHTVlgtT4nt94=;
        b=PbQwx2yuCqbdyZNzPeE5Km/Ml+MVQ2VSnDvSrCVere84dyJlvkiOQoO0kowQt44L98
         WPc98/2ZLD0ddLUqahn51aVEITzmJg9a3D6ogO44qQ+1i/vZZjjgZWgR+p/YlbU3KVLM
         RbdrwggwnOBQ66LcAwxDoo/eTX1TQWK6/blEcacs/QC3VS2XTNnH1y1qTbo7dMCvKUai
         FApK3cmtbF1NvK1XVI5/M0FF7mmtg8R/FCgIjuOfFtLxnQ47K7H21H5xOz3cl6LOQ6zD
         zbD7hk2JtexZU+21f/4juqOZ0A1Oa3vl4p3oKwvCNLe5YJoacyQENLgJuyaod4UmGsjf
         AJpw==
X-Gm-Message-State: AFq9FYI4C9l3GI8LZawEtdBprisydrToeI5iSHBdhcx5mXg3b9iaC31o
	Apnj5/4mMx8lhXKaCAbm70jhqOcO8aDFat1T51zH8uDz7/cczrD815kHUJIidT1k8NZWWcjZhgs
	OtI9rBgvfsILMbduvTSVrMbkM1Ce6oE0Eqcsf+RHbAF18EUZJh8sKyXw8QlFu0EsL554h0jg=
X-Gm-Gg: AYBFou150MF2AuyMrgOTp9Z7PuDogcmdvcUkKF6jZUCW9nO3cSBIU6dGn25IB9ktnzq
	ZmZk80ZiRd2TXtg8Xnm35ljGzpyyLnw2i846KlluNVUlwCguryvgDEeQc8bxQHcYZVmSsqOcaDU
	o5MbETJgtN9NVCpzxshj3bV951iwjlLh7H9qbJZ1YPNCKOg8UX3Dh6GoiMjrRBoiFYivF0J8NbX
	DosqgeavfXQ7RgkAh+0HEQIkAqYpu9CBW2Qo6bPhoiQ/DGKl/nvKHrZNE7VFqUhyMLjxdp6N8m2
	ZWOdTo0hNNIqPv5CLIwVzUMnjNgQluLA6hJ1kYD+IxPo/s6v84CdNTwa6a/bo5XAnjqmWcvIQAa
	oee+pfp/NuJdEIXIcymLeMaBSvKddM4M=
X-Received: by 2002:a05:693c:808c:b0:34b:68eb:fc04 with SMTP id 5a478bee46e88-3537e042973mr2148531eec.11.1791542502869;
        Fri, 09 Oct 2026 03:41:42 -0700 (PDT)
X-Received: by 2002:a05:693c:808c:b0:34b:68eb:fc04 with SMTP id 5a478bee46e88-3537e042973mr2148504eec.11.1791542502241;
        Fri, 09 Oct 2026 03:41:42 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm6031045eec.28.2026.10.09.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:41:41 -0700 (PDT)
Message-ID: <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:11:37 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -OS2RK9akmJ4PoTrYYJTH3-LP0Iw3HJd
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8c4e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YL5nfsDHeRSAjqAumtsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX7GB72H5KtgLJ
 uBR/uo/IXTfn9T/0kWIemYEceoEj+49ab46g2uG7jeclluBEWA6lGm6GX4+HCtQmBsjou1i9CsN
 JvZ/d5fhFqR6iA12boQr3DkQ+I1TiAap2jFuJLIme47PZprKM6Hkad8zwM+Bmw3NWAPR3bxKhLV
 fkdsS5TWUNPEbUNDOFJFxAGGSKE6LF0N8u6z5qobN2hOlRfmiJ4PCwytNf9QzN7AuZ16sATt7l3
 mpfWkIe6gdAfa9LCw1wC4DVr4846mPWyH+R2EMaGXI0xh0uE1Y5FV43EPu4FuRRxc1b/FnsJ0a0
 3KcF09ldQfeeVkdCM7nU11FN8zg/mC72jL5/T1P0TWvGHt+bohbhG0XuprixyI726+CpJyONqW5
 NaLiakbp0bQ2uxLu+Z0mOTxJ8ouAMuzlHIicE37pKJbyXyrutPfcafWApdboaPm/xX5QH/8v5BS
 gr9pyZmrdAKIJQU7p2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfXxywV3bbeZbhD
 4VxQVcqIYbBEgsrDCBqnwfbKD5mOMA/Z9C4A+wt9QoQQrLqI3H3PKohFDAC16uaUOEmIlEJXZEq
 4Hbe3HJx5SNmTXqWuWBL83YCf1dG3Ec=
X-Proofpoint-GUID: -OS2RK9akmJ4PoTrYYJTH3-LP0Iw3HJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090042


On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
> On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
>>
>> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
>>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
>>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
>>> --
>>>
>>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
>>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>
>>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
>>>
>>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
>>> ranges directly when there is no backing "reg". Introduce logic to derive
>>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
>>> to be paired with a "reg" property.
>>>
>>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>>
>>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>>>> index a18bb60f6f3df..9766a6944d0e1 100644
>>>> --- a/drivers/iommu/of_iommu.c
>>>> +++ b/drivers/iommu/of_iommu.c
>>> [ ... ]
>>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
>>>> +{
>>> [ ... ]
>>>> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>>>> +	if (!maps)
>>>> +		return;
>>>> +
>>>> +	end = maps + size / sizeof(__be32);
>>>> +
>>>> +	while (maps < end) {
>>>> +		phys_addr_t iova, iova_end;
>>>> +		size_t length;
>>>> +
>>>> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
>>> [Severity: Medium]
>>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
>>> malformed?
>>>
>>> The loop condition checks `maps < end`, but of_translate_dma_region()
>>> implicitly reads `na + ns` cells from the maps array.
>>>
>>> Does this loop need to ensure there are at least `na + ns` cells remaining
>>> before calling the translation function to prevent reading past the buffer?
>>>
>> This function intention is not to validate the address and size cells here and
>> it's not valid to read those properties here. If the out of bound ranges are
>> there, then it's part of dtc checks that dt node contains invalid ranges.
>>
>>> [ ... ]
>>>> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
>>>> +		if (pos->start > next) {
>>>> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
>>>> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
>>> [Severity: High]
>>> Can the length argument overflow on 32-bit systems?
>>>
>>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
>>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
>>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
>>>
>>> Will this truncation result in a reservation of at most 4GB, leaving the
>>> IOVA address space above that unprotected?
>>>
>>> [ ... ]
>>>> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>>>> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>>> [Severity: High]
>>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
>>> to its lower 32 bits on 32-bit systems?
>>>
>>> If the remaining address space exceeds 4GB, this truncation could leave high
>>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
>>> IOVAs.
>>>
>> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
>> set the dma_limit max range in that case.
> As this is generic code, could you please adapt the code to work
> correctly on LPAE systems?

This is no different than the existing logic where client tries to reserve
greater than 32bit length on the 32bit LPAE platforms.

I'm not convinced why sashiko claims this is introduced in this patch.

>
