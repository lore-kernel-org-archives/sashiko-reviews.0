Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290294;
	b=hsHcQ1kIk0A2bHED4dGIvP26ETrI+4gwacn8rlF+9oMRBsym4UfGeGZJ5X7jLs5bTnAe
	 DFxqP5MxY+Ox92gP81rJhaKwtvXEBpxieHbWv+mGFKjAS0TosP34ryTWMetMAJB+AGGww
	 XHu6mNvfUCGDBRlvepMTea5asnyvqXd7OB8TgMN/tbnMP7o4wqO5T4AFSyIVlfcWTi5di
	 FHCL42NnzgFDHX0obKC/yci4BY1QY4xU6n51KL5TFNJU+wN1q6rW3Uz/3PIRhlEnoyVp2
	 0pakpQBG8Pq8skoqfcJK6jOO0rYPo0n1iX/JABEkGronqkTp/Tpafr5pJ0T5tjUgDhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=;
	b=yHfkg2sPm4dFXZGTUBhrKRv/LcmbVXyzAt3mPclvBsX3h9ikOmAzI53q+uR0gN4xJSrW
	 2rxeTpO6GJ7ZyZz/MSAwYu5Zal1zqjSr9ww32TwPfT4aYos+EvvCSBZPu59RmCp2kxxc/
	 fSudt/CDWR4CYT5kJMIApKoPboasFKIkrM3oFnNohdi4ELDDeJ7MjNw1KOp5IvDfL2XNW
	 2N0ICogGY2dQ3T+PYVOi9VSoMUa/UmBBmbMGixhMaVKeA9D6Dl1pqXU0vQcLxAG0SZU/7
	 k4ordUNGRUPI5Yf565vQ5iJ8QqnTKa4Q1ePQVEstv9V+bQnU64WT0JcRm6GNQmom4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kyt+84yc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWyiBTmu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61001606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61001606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kyt+84yc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWyiBTmu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ACIR2928648
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=; b=kyt+84ycqclKfaH4
	u7uAWPXvVrHYt/r/YSeTlrW3ppiLD15czffeAWU7EQADfuV2NGhhYPzhDWeTFfND
	2HMm6cMOWjzP8vw6ftiwAFEnUQYAYI49txSwOzze5zQlhTpolUM8Rlk43nRKECOw
	1s6JjkWJRjOj4DI13eSKoP1xRgZJySBOaPYs6P9yEuASHFo/e5F3sVMXw+TWcpLQ
	kTIviImO6HeIKL1y4SDM9igqyrZSBZa2SXowWbxcnxaSD22MGXJwv3ublnssBz0e
	QTFxOBSXJHlAO7tC8PCJQYyZLVf8RleaRDm5w9cpqDVuK+U+4DiVNGyJcIx5UHpg
	1SQGZw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx837uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:58:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so2871110eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 21:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794290292; x=1794895092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=;
        b=BWyiBTmuCl0Un5VEPSFl1MOaBZ8lBIrz8tK3zBpUGydqu0mNmD+0GCyqtIWQHS3udm
         AI/8S95hAglKkbRPF2hSJhHXCvS0bAthJqsQXvjA0YIXNJtK5Meia4Hn5ct1d//8+hsX
         6dbNT+oNMNrE3XZzJmOaXVhWmXNqLTofJsLoQWTqQGrvjKpYQN8bIH/CYq2bQH8dZOzH
         2wXY1qmKfb23lcihc0OeQAXASZteXkTHfySTGK8UDjAbncl13B2Ai72C0sQw0FANFX65
         OPAZN/J457MthTd9pxgsOzcx5I7ThtQmfr+PTU5LzbXx8iy6/+4gYEtg71hgpTVyPu+y
         1q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290292; x=1794895092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=;
        b=pG+4gpR8XNuhMZEnhBy1oVkAeEIE31WfmWkx3nkAssVh5Ktj2sZr1E8GeoujHesw+n
         QFfKMA2Sw5E1FNrzexkRxOqS80I4R+hjJauDMtEqOW3DTxtDLjWetBNnZsPKGchcYQsU
         wj4Sbd0h9L3K9r78XyFekIKnqRXXGVl9CRGcZuwxpr2xKeBl0YQfyLu9mg61C9Lq5f8D
         qVkhjQA24Ps/XBVuYLYkvVY52STjJOod1/vYx41sITHtpr7TZqHjHRsLAM7kUegCcCd6
         3YYUKrcXNEbN1YQTIpSv+NYlT2fnWPI1gcFPuevjtF/xmDSOXOYATzuvqfKpt3avCizA
         UrGQ==
X-Gm-Message-State: APuU4Z+W+WMclEcLMo4omo2XcyyUskRkgnXP2tQvInDIVEYweAos3q7b
	2yOF1ACfvxB3vz/NaaCUJvTFdYNMUKleSk60VpcOyXcgw4t/QwUJ3dkdlkvK1LAkvynuV0A3eCl
	sp3dvH/QBgKWqgmBLBho11wHGOyuWletf6X9ektVV7S9Q4w40JEF26UDVvnnWQf9Us4UoL7aYrD
	fbmGs=
X-Gm-Gg: AYBFou3jj7y7rW7NaUV1gbFbc0jGAIXvsc11rn/urMItEum/JEn41md5cE0hGXaGGS9
	S3qnsVcAf7CyRYShhuWN/QcpT6VEnFG6BE0ktCLwDFsXPUbfhiUsYwOpYGU1vKwFlGFwR/SkAti
	dYeXIAZ1ZYttcvvsYFamH363Flk8mNtWHHAC/A2UZR4Nnv/FhNEeoPp/G0+7zI6liYGu1fSWXLL
	5l9Did7NBeC6wFBSl39Rf6bgM1XQWHvc7j+4J3B3fxnt18bi+7qaXBJjq+ft7/FcI9UBwcxnMI0
	qtELjz1PFQViXzbrzoRkCuqf93z7lH+rlotgliFgLnnPsQQXIH+y8WDF/+daJuN1+ew7wVQqpyH
	W7ct75dIqZKuht/gLEEjcud9WnaG26LwtDq+gt5MwxedeiJoRWML3uxYqScln1WBU/PC1k7WcLE
	Uw
X-Received: by 2002:a05:7300:80c9:b0:36c:c434:b6b8 with SMTP id 5a478bee46e88-37520714c12mr2860410eec.26.1794290291748;
        Mon, 09 Nov 2026 21:58:11 -0800 (PST)
X-Received: by 2002:a05:7300:80c9:b0:36c:c434:b6b8 with SMTP id 5a478bee46e88-37520714c12mr2860340eec.26.1794290290761;
        Mon, 09 Nov 2026 21:58:10 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm4553504eec.14.2026.11.09.21.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 21:58:10 -0800 (PST)
Message-ID: <ab03eafc-05ba-40d8-9e5c-913a0f21741c@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:28:06 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
 <sashiko-outbox-197413@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-197413@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2b275 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uBLy8x19ab8aOH_KWq0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ZrIawC9H_qAZHJv37ifzwxY07Wx9TZa3
X-Proofpoint-ORIG-GUID: ZrIawC9H_qAZHJv37ifzwxY07Wx9TZa3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyMyBTYWx0ZWRfX6TgnKbt6khil
 VmyFE452HE8V8ZzqiHn4O5m+vd1s9UMWiuDKypEGSlJfmSujnJoOung7G7EOijppaw+IMk6Td7g
 tr0I0wk7qE8HdeULHl2hgl7WiHOKo6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyMyBTYWx0ZWRfXxFHAhKIu+gTE
 RP7HhuPla4GP78fICCvWE+EwUHDVjuZxt0hr/EO/NGum9YswWW8c/k1Bzxfxi4EiZqdB42Rs0SA
 +PwE3a3FUlcK6QSjM3iaGw1LgSgfbnhvth+BbnnlcvgKRgxnyX+mK+V0Hai35lVpBLcPdjkLfFi
 e+Y4d3LOi5lHd+HocRvEznzQXsm/DzcPk0kfqvjwHG+r9KhNQT4BAgi0STxVkDTssaqCKvIBdam
 7ZIbannnpuBaNd8tPH98gIE4WxEvhxfTRFSqiuvDWnW3kZQcfvT9+WjsaDWcVlN0qPm9O7ua3Qa
 u/yBel7k9Gw6pcU5zYvHIzO+aT2UKhFKWR+ZS1pU6Wf31DRLaf1y8NKkbmMHDBb3IXAGCXUkicH
 UIt0Q5yWOi7lJrCipCl32iERFjuNESa7F18p0w5+ncnUaBu8DSwLI0X8+TRNI9mpPtgGNwjTjqJ
 obfqxIN1SipX82aQlIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100023


On 11/4/2026 7:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dt-bindings: remoteproc: qcom,sm8550-pas: missing iommus for Glymur PAS
> - [Low] dt-bindings: remoteproc: duplicated iommus rules and unwieldy conditionals
> --
>
> commit 95697c560209b6d85ebaddcbbc163e85e3f0686b
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>
> This commit removes the common iommus maxItems: 1 constraint from
> qcom,pas-common.yaml and adds per-SoC iommus constraints to
> qcom,sa8775p-pas.yaml, qcom,sm8150-pas.yaml, and qcom,sm8550-pas.yaml.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b7206..711c2f723b179 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -106,6 +106,8 @@ allOf:
>>             items:
>>               - const: lcx
>>               - const: lmx
>> +        iommus:
>> +          maxItems: 1
>>   
>>     - if:
>>         properties:
>> @@ -126,6 +128,8 @@ allOf:
>>               - const: cx
>>               - const: mxc
>>               - const: nsp
>> +        iommus:
>> +          maxItems: 1
>>   
>>     - if:
>>         properties:
>> @@ -144,6 +148,8 @@ allOf:
>>             items:
>>               - const: cx
>>               - const: mxc
>> +        iommus:
>> +          maxItems: 1
> [Severity: Low]
> This isn't a bug, but since every compatible in
> Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml matches one
> of these three allOf branches (covering qcom,sa8775p-adsp-pas,
> qcom,sa8775p-cdsp0-pas, qcom,sa8775p-cdsp1-pas, qcom,sa8775p-gpdsp0-pas, and
> qcom,sa8775p-gpdsp1-pas), could iommus with maxItems: 1 be defined once under
> the top-level properties block instead of duplicating it across all three
> allOf branches?

Yes, that makes sense.  All sa8775p compatibles use a single IOMMU 
entry, so there's no need for it to be conditional. I will move it to 
top-level properties in next revision.

>
> Also, in Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml and
> Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml, adding more
> per-compatible if-then blocks into allOf makes those single binding schemas
> increasingly unwieldy as variant differences grow. Would it make sense to
> split divergent variants into separate schema documents rather than piling on
> more conditionals?

For now changes are small, only a few targets support booting Linux at 
EL2. If that number grows in future, I will split divergent variants 
into separate schemas, if maintainers prefer that.

>
> [ ... ]
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 99e9aeeb4f62c..dd81ecdb8dc49 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -317,6 +317,18 @@ allOf:
>>               - const: mx
>>               - const: nsp
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,x1e80100-adsp-pas
>> +              - qcom,x1e80100-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
> [Severity: Medium]
> Does removing iommus from
> Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml while only
> allowing iommus for qcom,x1e80100-adsp-pas and qcom,x1e80100-cdsp-pas here
> cause dtbs_check regressions for Glymur?
>
> Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml also covers
> qcom,glymur-adsp-pas and qcom,glymur-cdsp-pas and sets unevaluatedProperties:
> false. In arch/arm64/boot/dts/qcom/glymur.dtsi, both remoteproc_adsp and
> remoteproc_cdsp specify iommus:
>
>      remoteproc_adsp: remoteproc@6800000 {
>          compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>          reg = <0x0 0x06800000 0x0 0x10000>;
>
>          iommus = <&apps_smmu 0x1000 0x0>;
>          ...
>      };
>
>      remoteproc_cdsp: remoteproc@32300000 {
>          compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
>          reg = <0x0 0x32300000 0x0 0x10000>;
>
>          iommus = <&apps_smmu 0x2400 0x400>;
>          ...
>      };
>
> Should qcom,glymur-adsp-pas and qcom,glymur-cdsp-pas also be included in this
> conditional so iommus remains evaluated on those nodes?

Yes, confirmed that. Removing iommus from pas-common breaks dtbs_check 
for Glymur because sm8550-pas.yaml has unevaluatedProperties: false.
I will add the Glymur compatibles to the iommus conditional in next 
revision.

Thanks
Komal

>

