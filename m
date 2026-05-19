Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC913E1218
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178836; cv=none; b=koqCC9NsW49af7iEbIjf2C3ZQkrnxHcm2X4VRhbnq3IWqAgT638Ssc/jaCy7qNxjc158AfhCBP5nVLrFnYEIhiza6OsKMR3FuqFbcQnQm2dpjjjELk7NOVK43wXJfFrtNlFSlLnX344ao/meP/4z1fWEj5wpgZZslVJuX56y5Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178836; c=relaxed/simple;
	bh=G1Luxo9lVsUFDWVEKt2VNQRRsf5v6MvgU6dc4C0JyeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxW+ihNyY7nld79nt+Rm0ne/l1k3/p+nnmaYCegB9g65Bz9MhS2dkWlVSspZRpW4eunCknWjVeGMzF9soLng8Dg5Wbw26e1N5x+Cb/hQsaGjybdqt7vXyNITqzQR4DdsGPTJcccVVjPPVdqmI38L86fRNBNjSjqLohRFAYK1YvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVzhDnhO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W6plSYAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVzhDnhO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6plSYAc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4jiLs1250850
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+vrTuxhayOInU+FR/NNaunRmJBDSteRLl/CAKvzQSQ=; b=SVzhDnhOs4GkEMCe
	Fb9t5lZf3oxJxthzZXsqoBTtx2ONG2OHY4tc2DJ8bvRLoneD+bPCnYfPHng/uP3k
	RugTq7Wd0gslVnXd/XU/ow3HnDGBk4U8xL4bV1BEtYKeiFBHDvSONWo1M6nI9fbX
	ytjRFyRwgpz+i7aliuaZpMWhlxYP+YO0idZ45brw/VklgtybGRgxPQkslJCQwbiw
	/JOFFE72/bvlnJ053Z+ed4g2N70uB4jE2+JWVwz1MRaruN9Rsc/A1Iga0s3UM4Kr
	pjwTeW5TOBUlgPcbsAiKNQR1KNyzIqrWcVuzFLm0cT/SvD+vI/u4Jjy7VVPIFc9f
	RoQUVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0m6je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:20:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b5d6bb45so14144451cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779178833; x=1779783633; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v+vrTuxhayOInU+FR/NNaunRmJBDSteRLl/CAKvzQSQ=;
        b=W6plSYAcAIcicgIo5+6IOBQ2zhgAC8SAymPlKwjLsQIjoShjQTODh8IJKE+4Zb3cFF
         xqxSbMI2pr4Frax+V7MSHGEVtOR4c4ccZU4WtWaevj8LH/JPs3VDGXqCvX9GaYdB/70U
         8Pb7xP/oe+GUMiQAbIehVpeRkGx7N9NPBn69ClauquZNTEixjXoJ431fISkmJoudO1T8
         6dpawwOJ88p3XUb+2ftX3/qN3VutJfYSzchwXDsfjkqJjtwxH963l0gpLPxBIGBHDRKf
         GqeRN45FVY4jbfGpdxOXYa8aQjPBnAke2+p/vIoIy2SPKgn/9qhZ1guH684Z2cSz0MyP
         4gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178833; x=1779783633;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+vrTuxhayOInU+FR/NNaunRmJBDSteRLl/CAKvzQSQ=;
        b=s4PXYOI1B1/hKFYqngNsADtBK2vVQxmz+hoxQctEQwi4BuIUhe/9OmYdjtZemhq6aP
         lIuE1O06i55klnCpEEHoutb4ZYFZXPyDxnueCe+sggVjq+imM8FCrOzZXD1r2J8jxiZv
         ThHItpTYUF6txj//6C4La4GM50uy9Fqgiyg3PZybf6Plan2uCqwPHwhbfmdUcQl3/aVu
         3/SJ2YrXlp3OIQDKCioIohR/swyC7xbejaIBkx1YD5LJWB+P3QuyKteCzdDDbb8g1u8m
         QC/nLs7TO0zJapxI+1jzekhPQrNJ8YXopRYFberS/HnE/aYf0wDCdvlS6DwWQXZo7tWY
         S+Iw==
X-Gm-Message-State: AOJu0YxA7k6kxiZ0o8nsUXcnYbxdK59Zv/XC9EnGaunHP8lC/jVyh/dt
	lTZiSR2os6P1PKEaBoJ6l1MpvBpuN+F9TYq0MtTZaQLy+a+kSWLNg3ZK3QqRc9D/nvq93NFD9gj
	kbQJxa2qIeI/s3mnpIsOF9y+Kc1SwZ11gyqsVJOBqeFytva0NKk3BUHKGNc6U+c5cLQ6qGOLmrY
	EBZs0=
X-Gm-Gg: Acq92OHI1gOOa9rlFGzJbDgE5GGwAKHBLrlDjt8DBkcHALieU6PFhlvjo7R+iTQHsq4
	pUod6eEZc1KFml5g65+HSwL8AxfHuT5cciyEan/KuDlGTjWkrk4ws8Hxi/dUeL1Ph+LH0u8xWsj
	PSqo537AAJFMZRG+4Ss4h5VxU5UsO2MmWauoEiYwwPrT1N9pm1Kd/i6E862NS+CwY5dXn9onqeZ
	p1vD9mv03KfSnYohbxK8rLgaXr4ChMYpaWO9LBj+J/bPX4TDbv1RHQQKpHDePjOU+aNBP0SmeFq
	99DIqI1dmexlEm72BC1xsoYbkG2JlfUt5NkPrdLMLQBLDAB5Glxk5k7wilHtZAkITseUr/IxszX
	NF/FC07HFNzNXbUC/zkb6dkQ/Duth9CToLVjP0iRDKH9fPVLn
X-Received: by 2002:a05:622a:2505:b0:50d:8905:7cc7 with SMTP id d75a77b69052e-51659eda415mr211474181cf.0.1779178832773;
        Tue, 19 May 2026 01:20:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2505:b0:50d:8905:7cc7 with SMTP id d75a77b69052e-51659eda415mr211473911cf.0.1779178832288;
        Tue, 19 May 2026 01:20:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53804aesm293171225e9.15.2026.05.19.01.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:20:31 -0700 (PDT)
Message-ID: <db084685-0a96-4aa0-bde0-3c9c3f72b63b@oss.qualcomm.com>
Date: Tue, 19 May 2026 10:20:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260519074113.61464-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519080008.96CDCC2BCB3@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260519080008.96CDCC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4MSBTYWx0ZWRfX41AMKGhBSaV0
 qxFbb4nldk73Uvd+dgp2U9w325VaWHHeEic71WuqJcdx+I3dRkTFwvh1qoyfDko37izIJzwrzro
 Jckf7Q35IeQ2933LwgVnhFLVi5XKSU1Irbit4BRfOF17Efr/XFfDgDZpysXdzyrdNlmMfR2p10k
 s0RV1XPRMwR6mm/fsKOK2lKYVnLP6bVpeuZwPWPZmxKpAX8YRNIGP8SmdQKwJB44oM0JaAHr71x
 QoiajFnrwmywSSlPcDXW55QJHmD6rWuLCQIljC8/VyeYaaQDjJIPq9Ar5WA7pyLN/INcfznab7a
 6JsrxX8Asq4FtbVb8F5FnepTwdJesCSvFje8Rvz9r7O2JM/e/RrFZTdXmJ8vKfmib0QOh4Uy8w6
 dT1NY0wEZ4N18NZrGDYPndwqiBs2iO3dMzdNQheWGQ3dbMFAUnyzL0vWGhC3apP0715446tsHhh
 ec5vlxTzQakdH1KeiMA==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c1d52 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lo2ZweVzeSzmAno-604A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: S19wfVjocWaSP80MSuVbfC8LJyzQ-GWF
X-Proofpoint-ORIG-GUID: S19wfVjocWaSP80MSuVbfC8LJyzQ-GWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190081

On 19/05/2026 10:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Omission of AP variants allows invalid clock properties to pass validation.
> - [High] Missing clock constraints for `hawi` and `kaanapali` Adreno SMMU variants.
> - [Medium] Redundant and logically contradictory schema constraints for `sm6350`, `sm6375`, and `eliza`.
> --
> 
> commit c2f0647af32a181995cc73fd00080208d48cecd5
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
> 
> This commit updates the arm,smmu.yaml binding to add missing clock
> constraints for several Qualcomm SMMUs. It specifically targets variants
> that share a front compatible string but have different fallback compatibles,
> restricting the clocks property where appropriate.
> 
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547c..ed0d10157bd61 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -566,7 +566,9 @@ allOf:
>>        properties:
>>          compatible:
>>            items:
>> -            - const: qcom,sm8750-smmu-500
>> +            - enum:
>> +                - qcom,glymur-smmu-500
> 
> Does this regression omit clock constraints for qcom,hawi-smmu-500 and
> qcom,kaanapali-smmu-500 here?

Kaanapali I can add, for Hawi I have no public data. I can try to dig it
somewhere...

> 
> These compatibles are explicitly defined in the top-level schema as Adreno GPU
> SMMUs, yet neither appears in any conditional block that validates Adreno
> clocks and clock-names.
> 



Best regards,
Krzysztof
