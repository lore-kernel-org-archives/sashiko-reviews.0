Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68A369D5C
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064439; cv=none; b=iN8oseC3xx41riWdGyMjmc25Iby+eicNeX6NdX9d6Uo2FImB4tFOjtwzMhZpFcjK9hGlf4wPpePYKt+7snTFbVlEkl3/rg6j4FDwIp/fezAJ66cwuupGd/UiB9nkUqlaoQkqHWFDdT+OvxkGEFg7xJ7xsPmZk3QGIo/KdeOIAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064439; c=relaxed/simple;
	bh=M7na0t4nNmsWcWw8gALyPoBT0+6yZi9dTf+T9WdIh84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0R1JdeOMSa0BOU8qfXHkNBHtuGfCaARw7JEoeYulu/OCo7dvNRgJ4InSEZSGG3L16b5q0VJfm7sOZLCVvx0e5ryAenYveuEdvo69USfatOh14Oz2IHLatyshXNS7qAxKpW9C7aARL96APFApamfRdLNlC2WsILf/K7UMK5gKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1kmviXm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5GTBNKq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1kmviXm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5GTBNKq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663686aF3053703
	for <sashiko-reviews@lists.linux.dev>; Fri, 3 Jul 2026 07:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahWXncPWGfiDGqR+LWTOu8pR2UuYY74gbbZD9oX3OsQ=; b=I1kmviXm+WTo8yo0
	ANpXEkYrcYIEnYtZxRlagsBzRO+nGos3SyPFyhpSPVO1Lfkwyn8o186NPeJjuQgC
	nmmMhqBVmibdXoee7SOuQzPdUjxVKKL7S6tZjdecpWjvIhFFsJ2f0wPcAF1j5oiu
	1ScAc8zBVskCSIsvKteqX2Ko27V3K+ht3amzH16TaCJ/tPj4FJH46BZ8wCe18uat
	PuTUwczla/Cz2bI5VWNhGuVcy+4SDTTl2DYmLaTIxXTicXtpNqAztXYSu9t7z4jz
	8ZZClM+B2wUFq2FWXDDgWTXjZSn144ma2teZy6nvACUnuZn1SfjVsUe3YvuwAvp5
	o4HHjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00bmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 07:40:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso615684a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064437; x=1783669237; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahWXncPWGfiDGqR+LWTOu8pR2UuYY74gbbZD9oX3OsQ=;
        b=P5GTBNKq/SSxLf9fMy3MiWkfI2u3vnuI2Nk9Na5HR6uPlqiHEwUWhR9sM7yxuXNPON
         V7wQtVx5fZLRytRULHP50W6lE0eqLY95KY4RgzcjrZf0PtLLZF6+Igq02QspOWBXyMyR
         He+PjerYCNcd8CKacOB7UZ2xbya7DgLeyxGZ2NUxrGn3NsWl1AzmU484z/1DsdKRKeBa
         WBLTm/my1iCbrNqXyNg4jz8O/2ewAa9V/4cqqEaIDum9BYbuURS9TBqb8YEeMbZjzc/o
         njw8r+xpc9RWIer15hTtP8N0UuMINB3bb8US/Ywil3HQM+BmjAKrQ5e3JgITNoaY7Hbu
         V1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064437; x=1783669237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahWXncPWGfiDGqR+LWTOu8pR2UuYY74gbbZD9oX3OsQ=;
        b=W11tW0uDKpOTACoVQ4FvUEQB4xrzKz1uqEkwhlbq0HgFgQ3UdnssQbcUJHc3FBNy3Z
         Phy7PhcblQ8AYg+VSn+K8i062JCu5t/bcslO4OcWLproBQF5vlZAK9YPnFA083dTFdbr
         hHKVzJG3HrZ3e79ElzygThIrU0GonVz3ncy4EvHh+99LreNZZWtGmywPUpuMPeuar9OY
         UJc8HqcsZ1SVL87vVha8QOoVJbyD9bcoTNfczMZVE9yYxIxSqD2E+QsmSc+ydZluIbWs
         avLteL3+78HvWxGvmA0NqP2W2Ml5YeRfmYi3zG0QUuHKhD7tOBqArKPsaw1DCp6QmbTZ
         byJQ==
X-Gm-Message-State: AOJu0YyqwrxDFZWsdVP+T+L44hXi68mC6ncHxfc0yuDyu7E4PtW/F1WC
	uyEjmte/ijH4Fv+mXIycutuLYqr73IqYfSzaBD7zE6qdjqHF3YVkOdSfE3mqkZvdIKRjN1UBnRl
	+e6TWRubr7C+f36A1fEX7LiZZFAcjvZfYNP0NMwvE700fJuKniZJ/4xAgE63AyzmfKuQVNHykbj
	F+m7k=
X-Gm-Gg: AfdE7cmIF2pOqYVYFS01uHufq6Ob5DjoWW9HQi/Vvz1KvlXam4dWiMy6LpRv3B689B8
	sbWCQQANbLYksLEOCdAX1QecQu6HZS33ROtXbHasWf36jnzawobZHnZiU9cVb/ND0IHqzkSHbTN
	SWPUgQvecWGcdW7GmMGY5guZCzWMdeVige1j7lHRmtiiHeaaAsA8oNpaXZoqSonJRBD124Chd/p
	GslegaeTsdW7EO9vHL/yVYqIpkTeEaC+d+SVF7vb3LaCRcsI4nrCXj8mPtu/R11OLPRbv//057a
	7zWyKf1P9Xhu1cqD3QRZakOqK5MM2U3XxhBzqpDu9UtMstMcG748VnyHAqfziAcL8cfzjjZ1sFa
	rOQGLAjx+BkKntOpI+OBTQb9f+SLG8iNJtFwIP2NzagN/pEwEZStMt5bru7NBcY5VrlbseMm4bv
	RoWEpp
X-Received: by 2002:a17:90b:534e:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-380ba84bbadmr9770730a91.5.1783064436831;
        Fri, 03 Jul 2026 00:40:36 -0700 (PDT)
X-Received: by 2002:a17:90b:534e:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-380ba84bbadmr9770689a91.5.1783064436245;
        Fri, 03 Jul 2026 00:40:36 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae6e2bsm579618a91.2.2026.07.03.00.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:40:35 -0700 (PDT)
Message-ID: <080fb007-e441-402e-a384-7cadab2121c5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:40:33 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Maili
 SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260628-maili-smmu-v2-1-87448a7678ec@oss.qualcomm.com>
 <20260629070306.E29141F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260629070306.E29141F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mlm0wlHbOz5H22gNTV-UtRgLXE10jtuq
X-Proofpoint-ORIG-GUID: Mlm0wlHbOz5H22gNTV-UtRgLXE10jtuq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfXws92QIk9Kv4a
 Gjx6lLGVji+aD53ajdw5850cWa9JtSpooTpEhLnJXI6QIJqUHshMIFpQpLPtP/BMKfgLKQIJsGC
 uHuiJ38LgD6HsdvqUwslZULkJySDCk0=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a476775 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2SfD81yUdUcrJK8MhtQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX8DEW7qDaRTk5
 YPrv1LqCpuUP6esuJx2VQtbOdz6cG+jCmIQ2gdc3SN8nisvulCTFnHP9uJclRb/SxBjWBzNajjw
 UO4/D3lLyBb1Tjh9Rl6b/eBw+0aUgt3Fja4tDdbovUE8JStObo9tCKyxR64a4NJCp29axILzAez
 SLYkzCU3T9nUBJDq1Wi+7Kl42McBKxp4ZdvwEnNF9Ao4o759L0u4NynJvO5RH08wH82CntxDRMF
 xLKdIgGCwzgVXXluuulh+L9987fhok8aqSmvkahDg8C3NTebfsb4teoiXdtltX/Ke58O5QVFikI
 C1Kij+1Q1DDSsr5c6HG0Keur4HeWnTnaTUaaHWhlbw3LMIDTkaDvr47J4PxwAecbXUC6Jl7P7Xo
 U4tTjPL4xCifjMSf1ZyXoT6MyhQnQYHhY+u3dh/OxK1MXO5/EaJ5Hq0hpKkb9WETgpX+2skRB7Q
 S2uhhlPFfs5vsIQ1O8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030071



On 6/29/2026 3:03 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The new compatible string `qcom,maili-smmu-500` was added to the main list but omitted from the `allOf` conditional block that disallows clocks.
> --
> 
> commit 5d07ecfd0f829393f9b6baedb17d072c42c1deab
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
>      
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a701dec2fa0a4..c48e9de1a2bd5 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -39,6 +39,7 @@ properties:
>>                 - qcom,glymur-smmu-500
>>                 - qcom,hawi-smmu-500
>>                 - qcom,kaanapali-smmu-500
>> +              - qcom,maili-smmu-500
>                 ^^^^^^^^^^^^^^^^^^^^^^^
> 
> [Severity: Low]
> Does the new compatible string also need to be added to the allOf conditional
> block that disallows clocks?
> 

No, we should not do that, it will conflict with the following up gpu smmu binding
that fallbacks to "qcom,adreno-smmu" and requires clock.

Thanks,
Jingyi

> When qcom,maili-smmu-500 is missing from the conditional block that matches
> other similar platforms:
> 
>    - if:
>        properties:
>          compatible:
>            items:
>              - enum:
>                  - qcom,eliza-smmu-500
>                  [ ... ]
>                  - qcom,kaanapali-smmu-500
>              - const: qcom,smmu-500
>              - const: arm,mmu-500
>      then:
>        properties:
>          clock-names: false
>          clocks: false
> 
> Device trees defining qcom,maili-smmu-500 that incorrectly include clocks
> might silently pass schema validation during dt_binding_check.
> 
>>                 - qcom,milos-smmu-500
>>                 - qcom,nord-smmu-500
>>                 - qcom,qcm2290-smmu-500
> 

