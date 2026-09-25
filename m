Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C15F3B8959
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361532; cv=none; b=MbisCGuGvD2+KFD6S0+XHwtlxUerO31/NTtdABnP1d1j7LBAVD+pmOG/4z0t/PU7J7C25KppTXQitSWIsTo2amLqF/U0j23x1X91OCqrCnxQfYdDcepJ9MJQfWhXNtKktUS4skDKZTGNgrLNfYMAPhJJmxtpoowDvM1qm+OfEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361532; c=relaxed/simple;
	bh=dzPcdCovS7Lzc6OZdecytRoeB+rYTj4DjsoekH+cORk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQAHQzncGoDV2iYG6LOAgg4OW+IyVRKFKdkbS5r1MgPMaTPrd7LAyknUQJyKK9L9KanzirWnmzLu/8E2Hg+vs/kyR0ohNQaVe0chvz0JaZ1YTWNTvm0aDgd08EaxWvthLZHU4BqMJ/0pzsOcNMaqLJbANUxavEHgOM8vFJF42aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1xVYDny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCXoAHk3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1xVYDny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCXoAHk3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0nHx2124526
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 18:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cIaDPB2jrjmKp92BAerGSKxYnwWAOS+LZ4WV2GDak8=; b=l1xVYDnyYU4ON9kA
	6cX5tmolXrT3tPqzN91+rAuZjGTEapyzC0KeqDv6M+eI9fTOYXheLGfFudbJosS7
	CCqumcJ6J3FTRwRwzAbIaYy+Q9UqNmwunFlU98p+31OCgj5G6yl/VpW6Y3MfmzXl
	vknHzRit1CHEGEJ480Cfsyihj9ybc3icO0xOmUwIUajKR627Io7faKQjttOSejhm
	tmeKcvqO7ARHtqK20IX7upWV/I9HPQkeQIrne9K5rZlc9cHmuhypgflXS7zS98eO
	WVDnqB/9hcV0YajMNGSk+3yzxc6I+OEz8urtbL0uok6PlUU4Sv5lJ9uU0H/7cz92
	33+L0w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq0aryj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 18:38:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so310308c88.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361529; x=1790966329; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cIaDPB2jrjmKp92BAerGSKxYnwWAOS+LZ4WV2GDak8=;
        b=gCXoAHk3UJVVvPEnwwaRrFU0fmdQ9ExaKdITYLNl6wb72KjG4rdWxmrcSE9nuqOChr
         s5FO/RSnKQU1vXxb85h3T7Hh3j0/nDPEZD9T1l8gKC8uWDLV2CqUU08H6BUaHE2cF+XH
         Sc32TPr9Ee7aec0bLfqjy3t7zTu5PZakeUfCJd4lgrWibcJgs00Uk1frFuQEKpuI5Pte
         jXa6c0tEij+MgF+6DRkyCFz8Ii6QbTxWIzCfvnWQsbxPw718A0ViR9gi2KpqBI5n7iXw
         iBwgya9fS7ACIx2AneNTgaqb74pHzF9583kpHjBf2CCTcDDH4RoAFbKOZsPyDnHOw41u
         WSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361529; x=1790966329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cIaDPB2jrjmKp92BAerGSKxYnwWAOS+LZ4WV2GDak8=;
        b=mca77NdmSYnVtXdwt/b/5lVFadSZr331IsCRk1owi40tesD0TTOagDV++gByC6pHcc
         O6Mr8kGWDoJTZwWrQdk7pQroPfY2ymAt+itMfKyXZD5KPtea/2DQhqJq2w40WNbOjlve
         94ZtLHCNRn4UW1ZwXVr7yxUZxKwASrbhN0g8IJH4umxzYZQbqYQjCLCS+rF1WG4QgDtq
         6lJl3I9e3RTJ/jo8ngZjdJWKwigAw2Rjqh/LG5BSWAZPPrOFzaqD6oBBMkxqB/VGpxQR
         N09WgNT4Tv6DNdhybyKhje/4RN5ZbtQfWYgLuVWeHUzBz5tuOa0jFrKt1TpzMo0wSzCt
         hR7w==
X-Gm-Message-State: AFuF++lmxw1gA0HdT3DyJ9M7zwzBCFAo7H6XKT2gtoi/CDM/Uf+mzMwL
	xU2kNfYq8lHPizCApiZeqcgF34oK3S4sbener0xU9o/9BgRJORYwsZSaoNBwXcg9XOxBDRFrV9W
	2Q/7kKRB8Lnd9owBAlyVK6s1FEF387jHJS6w+5Rsg7HWKxzu+AOlFBBR+/Vurba6SKQW68/KeSE
	jfWbU=
X-Gm-Gg: AYBFou2ViaWR/qOE6+6kSUuspm4xaU+AOWyuX9iK1U3/pLG3Lr4IjPBhq05cP486c0X
	9Uo5SIMy14vlb8fLhbEHi7jfZXol4UBAYUa7bXDTSk5ar1EsGhMYGE6rVR59OjHZaIvdrJs/pGO
	R9Ytpe9MCFtt+INzeax0u9naHi30olflF//JO+XoFbNXGHCBxpIjgBrdrFogeBWf+AMIqBF6WdE
	fBnXF/ccDKHb5KnvoFSSI8Ro4/O5vGz0CwswRUzeBNlxE+HUWx4vY6AA2+fKj9Jdd9AOF+mQ2xa
	JAiLILfQx9ToB4mapNyTrQKZfUh3JzO7aE7APJUVkEv5IoHs+q4y6xmMM3cXnaBpdgujtDSHsQz
	IW1ulVcPIxq5NQhFGU9awJfsZ
X-Received: by 2002:a05:701b:2701:b0:144:ed03:7bfb with SMTP id a92af1059eb24-146ce58aa89mr963664c88.12.1790361528448;
        Fri, 25 Sep 2026 11:38:48 -0700 (PDT)
X-Received: by 2002:a05:701b:2701:b0:144:ed03:7bfb with SMTP id a92af1059eb24-146ce58aa89mr963587c88.12.1790361525878;
        Fri, 25 Sep 2026 11:38:45 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm7915199c88.12.2026.09.25.11.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:38:45 -0700 (PDT)
Message-ID: <f14d9570-33ee-47f8-b0aa-baedba99e74e@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 00:08:40 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-4-0fa0bfd8d315@oss.qualcomm.com>
 <20260924212222.76B251F000FF@smtp.kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260924212222.76B251F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX/LR9wTfg22gO
 /5vw2cMcw623X8w8cgj33hLrsOZPyPr2RGdJ1jvgWjCB+fvwqRqAfgjPAbiPZtJzYUhvFNJLg8M
 b1R7eB2S/B47/JSrHyd/2cxpCbAIvMI=
X-Proofpoint-GUID: 3fR93OH_uFny1DtX8u67snwQKR5Fk5Qr
X-Proofpoint-ORIG-GUID: 3fR93OH_uFny1DtX8u67snwQKR5Fk5Qr
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6bfb9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bUMPAlxNVlhmAh4efsYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX2btD76N2dFJA
 0AdwF4sHlsqCkES/djSS4+Qfgs/nwtMGAxszQ/JJL3YP/h9gqGHoouDd893e8ZuDSWiqTE2qho6
 qUhLlxS5Mz4fId5s+M123/KtaKTwu3mTGhuEe0TgItPlImeiIbaaCLiHK0EKvnW5qzGVwqktGK4
 eqLQoIFwK+UnN2r65DG4glaCVi/6ZLxam6hF5BYmllZ/3IKsJm5SoILhgLGKzNphJjusHUlTdAy
 8rkrmGq2cLLQWnDqzwTe+QtGyqCa+aYxgC+XLemKGopR097EvqEOXytGdRO/WADTa51qfZF25nu
 VH38Er6/JsseymxnOitq49rUPxnCJWSrb6NAWCx3ApAfpTZ3gmDcUzv1cGkmvmhv3YaliI5U/I2
 J+poeby6YNzcaLvEDd7e+rzJOMl2VHzZdjzHYPE/p8GE3nCcPxvT4CDdpAXbyneGFtLaySskJpb
 1DpdH9oMDycfsp1RCEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250074



On 9/25/2026 2:52 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: display/msm/gpu: missing compatible string in reg constraints block
> --
> 
> commit 31fba47631141728d25d3c820a8da841bf562a70
> Author: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
> 
> Adreno X2-85 GPU found in mahua SoC belongs to the A8x family and
> is a smaller variant of X2-90 with fewer slices and smaller internal
> memories. Update the dt bindings documentation to describe this GPU
> along with it's GMU.
> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index e5efe2d35ddcc..8a103f998dd87 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -452,6 +452,7 @@ allOf:
>>                - qcom,adreno-43051401
>>                - qcom,adreno-44010000
>>                - qcom,adreno-44050a01
>> +              - qcom,adreno-44060000
> 
> [Severity: Medium]
> Does the new compatible string qcom,adreno-44060000 also need to be added
> to the earlier conditional block for the A8x GPU family?
> 
> Documentation/devicetree/bindings/display/msm/gpu.yaml:allOf.if
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - qcom,adreno-44010000
>               - qcom,adreno-44050a01
>               - qcom,adreno-44070001
>     then:
>       properties:
>         reg:
>           minItems: 2
>           maxItems: 2
> 
> Without it, the device tree schema will fail to enforce the correct register
> count of exactly 2 regions for the new Adreno X2-85 GPU variant when a device
> tree node is added with an incorrect number of reg regions. This allows
> invalid nodes to silently pass validation.

Ah! Missed this. Will fix it in the next rev.

-Akhil.
> 
>>                - qcom,adreno-44070001
>>  
>>      then: # Starting with A6xx, the clocks are usually defined in the GMU node
> 

