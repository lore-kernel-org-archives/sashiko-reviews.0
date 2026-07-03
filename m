Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6EA36D517
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064741; cv=none; b=GaNzHBCXKbP1JxGEiT61OivHXl/lF6iAk7snNxNxuPLOXlRRmAdQSGlxzoT2QrlAMiYUnfkKmSmZxEP8GxcHVHw2WViHPLrspBtrxkyIDQk+FGD/X2aGbMrOuUPueqNIlNyiRdsoWbqqxsh/yC6SCHprpVk7Ndap2clCPc4z930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064741; c=relaxed/simple;
	bh=AeEZ3V4kpu21LR9TDSeTfuxq1DwK4p4zspQXeevnieM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Uf7rkZDGpAUhWbFTa4U9gW0oqe34jOMtkA0KPG6qPzAub1BLcZZPkfnDMtllCIev1aCBjhONZv6DKtFYoa1Aei+xvGZSNqtMkQlcd9V/NSXvD6FC3zEC/YtPb6x9BT3VUyWS4JoPMi3NGUjnCcy2mmc/px3Y6KjvBANnv/XKPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HP15JEf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epmS0Orh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HP15JEf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epmS0Orh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635sHi63136859
	for <sashiko-reviews@lists.linux.dev>; Fri, 3 Jul 2026 07:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	curAgBqgY9P3LuxlnnGPaMje0igtmZVB7PIuoHiWYi0=; b=HP15JEf3xmcSjq7O
	DRT4Ij3N9JvvjoSd7/NXAXLCd4dnpXDmNk/1BA/wPy9/sFqvoVPmpj5EyD3si77I
	WOB9bNzuneGls4jp62Ctn5YtMV7ilvwzzTHCuRTmSuq2psSgKvqGHxtkGPEcpeK0
	dpk5sb2/J0OZFZbdDVeitJmD8HZYhOMWHsL5CRPGYU/ALZ+mRP0XNpmRgDmuW+jK
	rAPYVsHlS+taSqAaJ6f9nYrr8YeErCdzTWk1NxSfFoQ9LYOrrEbPrBqTwzWf154F
	kOKC95sUBN3Rvfi46qE6DU8hwV5M7xdq2XdyZ45pAk7rNrFUTTA8guIyVbACrBue
	omUbSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qch0nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 07:45:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca5d2474c7so6346225ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064737; x=1783669537; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=curAgBqgY9P3LuxlnnGPaMje0igtmZVB7PIuoHiWYi0=;
        b=epmS0Orhkx9pNUcnt8V3QFjwGQM2pRcHRy0P2a+Fp7gHAER6ZHb/kjnDVJCVPRxGQ2
         npqpjAmnNB5w76NjHDekdd1Mun+ZhCUfbNm1VsmVc4dNIeex0EGWWGpL/SGeigNBDWUg
         oHL30CqXFSrI4MyAVb8KVZ7lAJn7HdoJ2jKhQYmU7+1DSuAc8CYecEYkc43I0SG9+oRf
         EFY/4wyle7RQyDfr4Ug1zsKFYuGh/2bKHLf2tf5Bka8PTu2NxKhit+D/pJCqN+7G0/L+
         BUcfeuu4NBoeWWo9XeBt8CVTyWr7DhsdJDghskm6P4hyzdMoIdICpYgTX8CT17hDeMrr
         qIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064737; x=1783669537;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=curAgBqgY9P3LuxlnnGPaMje0igtmZVB7PIuoHiWYi0=;
        b=ggKHTb1CDNsZjSsa+sPoE5Q6tNLa0QyjyJFHTPGtsJ58bQjeurr4D70UXjC/NtuDeJ
         dmlE4R2SPzAcr9DmZtE8/yTd8vMKFYhZ5T9RuIjNHpFP6BaZUicrrC2kBDr+5fLfZA+e
         oiUfgO5XXYZamIXJneqCkJ1j5b4J5ov9M45X2jcHEgdfPSrwvm3QsyU9JuheWExuvbGb
         g4lBWbRaYRs+kL3Jjli/d27jnugmiKdWXu46C0ODeB2hk5PzHKNN+dqrEjqfjFRq8WwU
         lAw5LeqXIUeLNzTLvEi3NKUCD/tu+HF0SAyGacBb2K3E7zhpAXA4NneUeplUsfmyhXXM
         r6iA==
X-Gm-Message-State: AOJu0YxnccV2IvvEiM7GDo6Z2x4/noVlM+Lh7qFmv/V/l/d+46yz8bQY
	uLn+RBwdVIzx0w4ZWOGbsme8plVwkivIp4Kwm/O7nOg43jIbnyoDgiWL8PWdPnf9LuZYP8FJXvr
	+6j174mRZdBdq529jhasca24NSwB4kIf8+15au9M09o3XTx+QQWF+ruUXKCXurVJ00fU9uWLTu4
	JIpYY=
X-Gm-Gg: AfdE7clZfmYECsPPSt4oLc4fmFLHn8q4VASuWdx8xsiEYetJNlXqp13HpdO7iP9THQM
	qfrUKE4WH6j/qSThdKyzuxqxFIpGVfc6IuZE4kvu3qm/YOKS9MClSoI1McmoEVcnErPTIJBsBVY
	U2X/GPTp+dd2Xk0kin53dl2R8c7xkUjUcZKOclCeQcqUlECyBprKK9WvJtoz7yMgRbPS9Cn7dDg
	sDirAvSjH7fAZjLvEkrYKRIWmg2hhr4PHrfG8SP+FUBJlytJGsMAd+pg6bW6qp4+NNk14VmBkvX
	OOkBkrjBJRyXRxAy19Up7t169uxtHcScMWLcZZfYtbzQmtGk5DIgi//w4NDMcH0YIzipVqqDMMc
	GWObc448XNIIjD38CLWh7A1uMLFCh28NQfPlCCFGj2/q0h4OYCxZBEf1WL1GZKulfuw/jeLbqpQ
	kLj2eN
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr92604675ad.28.1783064737316;
        Fri, 03 Jul 2026 00:45:37 -0700 (PDT)
X-Received: by 2002:a17:903:40c9:b0:2ca:5d9a:ecc6 with SMTP id d9443c01a7336-2ca911de617mr92604455ad.28.1783064736848;
        Fri, 03 Jul 2026 00:45:36 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7875d54sm5297395ad.69.2026.07.03.00.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:45:36 -0700 (PDT)
Message-ID: <11fc272e-f30c-4ce2-8f66-0b56902e575d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:45:33 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
 <20260629070306.E29141F000E9@smtp.kernel.org>
 <080fb007-e441-402e-a384-7cadab2121c5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <080fb007-e441-402e-a384-7cadab2121c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oktrD0zY77UOONi-BAwCU-vHBhfZWlIb
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4768a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R9zPoKjRjOU5vlgBfkQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: oktrD0zY77UOONi-BAwCU-vHBhfZWlIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MiBTYWx0ZWRfX5WQGyEwayUda
 5OTo4Z7btW1kI/EZw2xLVNWXoRT2O6FMGFhFQw+QBB7/w3DXwSHmhfaIFdwaYF3Xew4Cm/VLWQV
 ghiAT26dkCL9z2TzayRQ3tEVy2m2cY7WSwkh2UGKPG5bHYUhd+WP3FwdAoQ0NSiY9ymrqtlv5pi
 8DltHpmsYimWWK93btlA76YSZoMneHqtowQ/3WMhBuzmvt728zbzuV1DmCbKWKFA3Ps2DZ3U9bj
 Y9i4gc8UiuLo2p7ghShgNW71qmZCYvTXEA4ZLT8VcQSz6RmhvRVWedWN2C+SlPBRq3pYtWyuunh
 ffDEECDfynwk5+Q7a7asHNmOpKBAJHHznL2CordGtKybPMYtBuADLBz+XAyaxFn+CJiiJeOildV
 5DPItWh7RyYT4u5arudcWhXxdMeeWLIrGRoQHlMbTLi/0B294c8uqqrYs3+rrxGjJjxotDuhm8f
 h84Rx2XSB2sm6d0BSdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MiBTYWx0ZWRfX/l5Dn/whDF6h
 snDG+7Av+jZdCthsLbG6WM6h4WCUSDoaF31WYPnF3xoXExTKB4pnCQm1fBUl+kY3/vlxPAzOJ7j
 nNnvbUr4FExrf+9nvEVRDg0R6YsC5ho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030072



On 7/3/2026 3:40 PM, Jingyi Wang wrote:
> 
> 
> On 6/29/2026 3:03 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] The new compatible string `qcom,maili-smmu-500` was added to the main list but omitted from the `allOf` conditional block that disallows clocks.
>> -- 
>>
>> commit 5d07ecfd0f829393f9b6baedb17d072c42c1deab
>> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>
>> dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
>> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
>> which is used to translate device-visible virtual addresses to
>> physical addresses. Add compatible for it.
>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index a701dec2fa0a4..c48e9de1a2bd5 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -39,6 +39,7 @@ properties:
>>>                 - qcom,glymur-smmu-500
>>>                 - qcom,hawi-smmu-500
>>>                 - qcom,kaanapali-smmu-500
>>> +              - qcom,maili-smmu-500
>>                 ^^^^^^^^^^^^^^^^^^^^^^^
>>
>> [Severity: Low]
>> Does the new compatible string also need to be added to the allOf conditional
>> block that disallows clocks?
>>
> 
> No, we should not do that, it will conflict with the following up gpu smmu binding
> that fallbacks to "qcom,adreno-smmu" and requires clock.
> 
> Thanks,
> Jingyi
> 

Just found the commit "dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants"
has added the block to disallow clks, will send a new patch to fix this.

Thanks,
Jingyi

>> When qcom,maili-smmu-500 is missing from the conditional block that matches
>> other similar platforms:
>>
>>    - if:
>>        properties:
>>          compatible:
>>            items:
>>              - enum:
>>                  - qcom,eliza-smmu-500
>>                  [ ... ]
>>                  - qcom,kaanapali-smmu-500
>>              - const: qcom,smmu-500
>>              - const: arm,mmu-500
>>      then:
>>        properties:
>>          clock-names: false
>>          clocks: false
>>
>> Device trees defining qcom,maili-smmu-500 that incorrectly include clocks
>> might silently pass schema validation during dt_binding_check.
>>
>>>                 - qcom,milos-smmu-500
>>>                 - qcom,nord-smmu-500
>>>                 - qcom,qcm2290-smmu-500
>>
> 

