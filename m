Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53F254B03
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409197; cv=none; b=o8bzWm5+s5IpD0OnbKuPZkkJkbcp9g88Va7EiLhyXXPwCawNulWUdgojKiHtSsEiZTi3dbh8+nTrqxz/c7VxAbUMDM+BZeQCkL38YKM3Cbf6o10Eed25ASp9WqSgrQHc70+I3+5zabfhSFNtKS3WZpz1d7IqslhBnJSeTFT/aSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409197; c=relaxed/simple;
	bh=5/UqRT6LYOStu6PovJuPgMB+EryHc9ADHHCpQK27Tzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUD2UVujcox/ToiSerPtJH/gmnaCS1o2gM318Rjnzm1ddQrpCIUoZMTn8nHlD9ZZVPCvg3b3ZCzet+FJS0d45RH2WnVQdYA62GCU7aRZQfM9HVXR0XseeCsf17aJu1UMco6Pf52qXuQD0Rzu1IcPGK9wJ9eP0lPDqoXkqZzuc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8M5RFOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0kgDG/A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8M5RFOt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0kgDG/A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6PMCb3747219
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 07:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7e/aY11HQgzVEE1SbOUx4gdT0DTZ6TfGjOfnrsBzMR4=; b=Q8M5RFOtDc+rcmyA
	MS0iETQciwEaKOODKRpnq0js538SrGx+qkvJQqYgHLizOrG4RqQIs19szg1Rqub5
	GZ3uoWyIPg//G0iuZ/elr36lKG2Lnsa1Cu8F1lGY8NLrzQDWkz4J0fHKQ3luVsDQ
	KymkuFOCgMdS2r1RlubbDuTMUQiHj6Q/JoHU8rW3PT7MNVWGdleFY/lF3rG8a+Nm
	IPsavzg3jNjP/TPRTDK20GfcSCZFDSzmVi4AbGXPn/U1n+C3ApmKnigIoeSUM7EV
	XdMh0Y0H2jhaQ7w2FUhlXTIdgWJWk1gOfqNGY5+qFDulmQcy4+7Y6eFYN/CJs5f4
	C47PAg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526gj9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 07:53:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso972784eec.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790409193; x=1791013993; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e/aY11HQgzVEE1SbOUx4gdT0DTZ6TfGjOfnrsBzMR4=;
        b=e0kgDG/APnIxc+tdyAnvfkS5fWZ/+e67dmBqWlPSxsR94aQcqN9jt5pnAWR2pyZyaY
         dRiW0NsVwo5M1zXi8p57Nu/iEbf7JP11UhNX3YTBSaG12QMuIHlzFLTOWzmh/jKpTJi6
         uOxejiocEVFdI9gO0L/vxOBVt0HiNIVdRj3ZNWOrEp7CfFlXEbpNU4DHQfZ0fKRYZ9Oo
         Hje6F5n8k4SDEKeDSYuVHeqZnnDQFy5KpqeezfqU1gYrxAFjYO8+aFA64KSgcVyYCOtX
         thXHl9wBxCFUx8ubI3zj8Rb2Z5rXIxjiIGYHpZ8+QyXSa2pQeDv4H8c/BedHFzQIwFHA
         FKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790409193; x=1791013993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7e/aY11HQgzVEE1SbOUx4gdT0DTZ6TfGjOfnrsBzMR4=;
        b=dpA3DRb05x6A8rOCOoR/g1uI1k564w7Ct01QvARWzJ/psuh5j9VcRT+1Id/P4MmN21
         6l++iDR5B54u4NDgSTE/tDwmsHZa5tZuCTYI8QGEfHcJ+JdltlaN/zxM0LhEIjReTToS
         qd1SWzlHEFe0J5mTMe+7np/VRH+NbNvT/x+JEbO++g/yBnOXXCOOTzgctJat1VoB9A6f
         RQbHbMzX/ajrLV+yrrX/YRdq8EEo8h1v+QwPNgmXiwH6gQV/zAdFWin13cHqlfSVfCJq
         edHmpZSq/X6c1vP25+TYN0Eut0HiNiLuleGHwz1CsoL617VJlxvU1Zd8jI7isfhqiehj
         nXBA==
X-Gm-Message-State: AFuF++mbjnFgz6IATnW2LwopLlMiTgkr77ZJvJHhk0L3bPz5Bm9HYQ7j
	zC19v+i79czHub8ZeToBm1OUmDO5XOnybw3kR/KCtjWTU6lORGAHpHwP52uUoTFZfyReyrPIA0n
	+LI4UrSiNQQsaikgcByRnGEhYtTsBYaS0xMPjMI0AcNPrP88ZOC06en3WruPGdLhLSy1Z+mc5Q4
	AHmvY=
X-Gm-Gg: AYBFou28YoS7Mg2jhZfc2+JKZantnm5jbpPPkugibKxA2Y0Wr8iQcvLb91ReKYx1ddm
	u3DYAcDyrTAjl2nO2LdIiEqmPjYJp094kb+SBzbow/0hDLwz5fBHxzHczJBGwPOup00uFHNlV1A
	0Rzka/fjCTVcFZzl9VTo/BZU/5N9oW0FuKixURVbmMdrHjSUyVJv048zSMSuKatI1zY9DRA9Sfe
	WYd5dPUzYX3MMmGjKlasbxfyEucbnh3Ivhbik/6gbu5adqOO0Cpf86D1kJlwAhgyEosNZ9lwixD
	GTks7bnkY7DqvB9dz2GL9K/x4Qa8ZlBWdW5n8KMocc5l1r80W4ZuVUtpUC7+Hf56aVsfbLf+1bt
	RzPJkOX2sQh06ooSkWswFbZOxbrzY550=
X-Received: by 2002:a05:7022:418c:b0:141:9d33:f1b8 with SMTP id a92af1059eb24-146cea5df96mr3264253c88.12.1790409192709;
        Sat, 26 Sep 2026 00:53:12 -0700 (PDT)
X-Received: by 2002:a05:7022:418c:b0:141:9d33:f1b8 with SMTP id a92af1059eb24-146cea5df96mr3264137c88.12.1790409191102;
        Sat, 26 Sep 2026 00:53:11 -0700 (PDT)
Received: from [192.168.0.14] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343025a591csm3792326eec.12.2026.09.26.00.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 00:53:10 -0700 (PDT)
Message-ID: <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 13:23:06 +0530
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
To: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260926064755.4AC931F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab779ea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EhbyzWJOQatpsXQnGIAA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: erLFVpEw16p1UmImWFNTMNb8-wzaSafE
X-Proofpoint-ORIG-GUID: erLFVpEw16p1UmImWFNTMNb8-wzaSafE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzMSBTYWx0ZWRfX5mavQ/Tm+dgl
 kVljKG7HtU8LSFWYZiCn00RTSRJ6FP5Z/oC4WyHnivjSlVYhOOGTZqEmPJqU5fdJz+hvMRBD/9Q
 E3qezDh9jh7ZAltT31UrRhvdve5d9Mq0Z5E8PZKum9RIE52e2S0fO/uEQxA4hCzv6X1rq0qACNF
 ojdckg4WZOW7jx+Gi9RI/oyseXtLrt7DZFcxg9X6NDHVNg+1lxkh1JXKJoE+tcO9r3NifAZEXqV
 K6O4nLiBuY80irBk2WBGjNhiiYBQcwxtzxdpUakTbY3ThbITRJ/KQ0qlr0mi0VTY+87baEULdpo
 schD3JN/HEIaKVcKMI5YN/ebM7yoaHjI4brQArANzOeOg0io4N5L9EhmShJGNYW21t48efzIet5
 TXyM0g8tPVOzLduJSUeN16MPvtE0hGXbNBM9pwn8j/fgPMzBTQ6vOiU/MlPYWzizxF6XtcwNWXV
 Gr5k2zes2VGS5QNGRYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzMSBTYWx0ZWRfX6FS4HzRz1ac9
 WFFFflxD5gJylwoPi9Y8KLTjUxMF4oyVPEjQYiVRAbSgoFSQM9+AVGseECSicE8s7YhyHsmfxuA
 l4pqGUim0AF1fBkogPatIPWlYjLqH3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260031



On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> --
> 
> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> iommu: of_iommu: Add support for "iommu-ranges" on a device node
> 
> Add support for "iommu-ranges" on device nodes to specify usable IOVA
> ranges directly when there is no backing "reg". Introduce logic to derive
> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> to be paired with a "reg" property.
> 
> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index a18bb60f6f3df..9766a6944d0e1 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
> [ ... ]
>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
>> +{
> [ ... ]
>> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>> +	if (!maps)
>> +		return;
>> +
>> +	end = maps + size / sizeof(__be32);
>> +
>> +	while (maps < end) {
>> +		phys_addr_t iova, iova_end;
>> +		size_t length;
>> +
>> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> 
> [Severity: Medium]
> Could this result in an out-of-bounds read if the "iommu-ranges" property is
> malformed?
> 
> The loop condition checks `maps < end`, but of_translate_dma_region()
> implicitly reads `na + ns` cells from the maps array.
> 
> Does this loop need to ensure there are at least `na + ns` cells remaining
> before calling the translation function to prevent reading past the buffer?
> 

This function intention is not to validate the address and size cells here and
it's not valid to read those properties here. If the out of bound ranges are
there, then it's part of dtc checks that dt node contains invalid ranges.

> [ ... ]
>> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
>> +		if (pos->start > next) {
>> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
>> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> 
> [Severity: High]
> Can the length argument overflow on 32-bit systems?
> 
> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> 
> Will this truncation result in a reservation of at most 4GB, leaving the
> IOVA address space above that unprotected?
> 
> [ ... ]
>> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> 
> [Severity: High]
> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> to its lower 32 bits on 32-bit systems?
> 
> If the remaining address space exceeds 4GB, this truncation could leave high
> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> IOVAs.
> 

size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
set the dma_limit max range in that case.

> [ ... ]
>> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> [ ... ]
>> -		 * The "reg" property is optional and can be omitted by reserved-memory regions
>> -		 * that represent reservations in the IOVA space, which are regions that should
>> -		 * not be mapped.
>> +		 * "iommu-addresses" must be used in combination with a "reg" that provides
>> +		 * the physical address and size of this memory region, for an identity 1:1
>> +		 * IOVA mapping to that physical memory.
>>  		 */
>>  		if (of_property_present(it.node, "reg")) {
>>  			err = of_address_to_resource(it.node, 0, &phys);
> [ ... ]
>> -		}
>> -
>> -		maps = of_get_property(it.node, "iommu-addresses", &size);
>> -		if (!maps)
>> +		} else {
>> +			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
>> +				it.node);
>>  			continue;
>> +		}
> 
> [Severity: Medium]
> Will this break existing device trees?
> 
> This explicitly rejects the previously valid 'no reg' device tree
> configurations. Existing device trees that validly relied on
> "iommu-addresses" without a "reg" property to create IOVA reservations will
> now have their reservations silently ignored.
> 
> Could this lead to the IOMMU allocating IOVAs in reserved spaces, causing
> DMA faults?
> 

This change is intentional and clearly mentioned in commit description.
dt_schema is updated accordingly. It was discussed here:
https://lore.kernel.org/all/CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com/

> [ ... ]
>> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>  				}
>>  				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>>  
>> +				if (type != IOMMU_RESV_DIRECT)
>> +					continue;
>> +
>>  				region = iommu_alloc_resv_region(iova, length, prot, type,
>>  								 GFP_KERNEL);
> 
> [Severity: Medium]
> Does this newly added check actively block pure reservations?
> 
> By enforcing that only identity mappings are honored, does this violate
> backward compatibility for device trees that used pure reservations?
> 

If the pure reservation is carveouts region without reg, it is not allowed,
which is aligned as per the discussion. This logic now handles the case where
reg indicates the iova reserve range for direct mapping.

Thanks,
Vishnu Reddy
