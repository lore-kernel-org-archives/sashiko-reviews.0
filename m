Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922176;
	b=R8OjfKb1c+8FEP8hTRaWQLOOFITxfMEx5rTG5RqFEVMAuXnjALgAuDWqMHaH3Czl7PlR
	 o5H2MqP3GiqCQNz1svY9Z5IZz0IVJvyWDNJyGMCdWej0Nyy9UX6zwsNR98MAgl3vnVdV4
	 X0Ty7PAZXHR4QwXGf+bB4S3xZmeak7PEt8WZ/0i/rhck/j90l/pvU1i3D+icQe9xPxEeX
	 mm78F/hOmJXuaA57GT6f9EwoB4aiLdhyXmkG8PsBzgxfh0dvDMm9ikFJZCWhr4izmRLOz
	 FQIjKo2xer7aLCWO71Y+RRUGX3St77zqiQqvjGQufK0BzCnppBvTWheEruySGkSwEJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=;
	b=GfjIBq5Aeg3djZVWnEC0AADZEhDjh+HU12uW80l9cbM1Ab2G/Fq9e1V37lCLfM2VFwrE
	 F0HNo+buQLs4k13+BvapUZ4Dj2cu/nHWGBfkeG8kune0Esfzo9u+/zPlQ8Gjn5NRtM5zU
	 dGwwtzPT8eP3uCo8FNwdtlWFWTL9dT28gP+g7QoYnLapLJxdaVFYEd2FBfGUd+e6B/VDK
	 CHXzi7bxaX7VKVY3P21yPvT9SVUtyVCQHAJCgarYeP/4HQ5OEWTk49i+Bg3KBOORVy/3u
	 EJjjkMmPXkNz09ONTdiCmVFrc9K5RZM42trNUBnC4ZHU2fgm5frzR5e9exPivaczobw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOcvQUSL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xb1WqFPs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11644606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11644606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOcvQUSL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xb1WqFPs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC19oP3713916
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=; b=VOcvQUSLE+9Z9sL/
	5F8C/CKmR7v/+0mlNUGXs9Y7o5SUQXMmTIuDvIsIGQups4r/u5U5csaHIHqlyfLI
	O38nnABIAHeiLwIfkYFbg5MVp9b+mqqWP3ubtPhIqIkSOMYsX00pWKmZVNs7G1E9
	x8PekpA8YYv8TZrZBwugpuduiv7oGaGCeoqaB+swFPhsqKTuCQGY/UkvofILO4RK
	PztaEjAICxdWMrnGO2ApFyilt/jOpHW7T9BFj7mOgT4cW6WANEiIAroIxDzLZzDa
	Qh7BFYlh2xNuLASf2FWpjfL8QAmclpP7VEp31vkFLkZA4icaHQGz8kqzKA0E39IG
	bTTWHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve1ksx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:29:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so3212779a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 05:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922174; x=1795526974; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=;
        b=Xb1WqFPsr+J2HYv9br4eu0bqtk0HQRPiC9pQfN2jIgtQ0eBIOd4egfCcYNDIQHZDXX
         iSLWVtxThj0jYyhplua5OWEeKLABIXpvYbMCPtQJmAhzBzVDCULmPKa3nx6isDA/id+i
         PuFpMG+0Xwx7aiiymUuULvkGa4Q0PgQeEOlGN2evWBFIXGs1d0KprIsJDVaoJsQA2/8D
         gXGiqt1W9HsgpyPMyeEKqeimgEDPuIWwcslI3lqlevNiR7YDwB+7ZVKQPgm4xE+em9iH
         priJAzsCriKCsaY//5eK6oEGMY91OBD5bytg73I0VZ3GDLDlMl4iBdbYy8hFnFfsSbVw
         HIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922174; x=1795526974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4htjm86jKJ9GrPsryQmZp/4HX30ZTQI3Y3SaQZYVdg=;
        b=jnl0rOQt2aka8wb255LQnp3tn9JqmytGbuUE2Fz4ZlCv1y27Fw0ZfA0wUCa+U3p3gV
         u8UIVIiKXL2YLRbT64MOA/5i5RNxYtuv3IlPNQyyVJS+/V55YzCArjpIXUytM5pbsB+D
         Z5PXbSBPGsa4AMGlCtSKR6VJ2/f9qtudxasRDj7LixNCHxun3Rfpt/D7Ja2Wh/C0UcuM
         EqLbtUhiv0PuzHBr4yJpgnizND0oCJ9EjfD1xQzi99qjzgM/dgjosnq3EvGHVIVbt8Vr
         C1peEyBq/Eel0J8HyYShq6J2N5QMOIjHE1J5Ike+KBqj3pdXCvodj71jgVMvZzpxhtoU
         X/Bw==
X-Gm-Message-State: APuU4Z89HTB1MzeGfB+XNVN8As1sOBxmkKjHPqtV41O8aGA4GSD/av/Y
	wqMitIJ7xTMwv3UgmvbfALL/qT5U3GgcMzBOt1FxPTObjsHbj1fHEFPL9S+8SgNyxntUjYecRee
	CXKvyCo01Fqhv4rHW0Btey1i7ic2Wuq1cOmzP16giKeXBioMwXK1B+irss1trfFqv3oJBAI3S5z
	UxX58=
X-Gm-Gg: AZFdTZfb2j4Wg1xKtIxVryC1qLFUZ8y6hUcHj7fz9PUV3bXqYejPxufosmilIiJmmOo
	yYblzJurL5XA8F3MVGl9VUzQBV2eN9u0vs79fXI480VkNVtJgSmgBtrELXIY9GVeCGL9pn2Qeez
	pwzkFWEO1aFqaRls+SJ4vDWKkGakfMrmRDpVByUDkMC1kTi22GGFhDHkIwkaC2c4b/C6VThc9HU
	dkGyHhs+SUhJdjUGYrNYC8V4m4ELZGatG9wTkJ0NUu0fxUIkXoWbf0tgWnNbpTg1ES5J3LgyNUg
	1wakiMHicWHsvvO+p9siAKyfAxKZUN4FDz5R2sWG/cqURKfW7c5fCThatf7eHmSdRvsUXpIpU8F
	1etRvv8Zfyi17yGtHDoSNa7/jVi0CZMxPWH4tmNZSSegfGYzj7eY7iCf67sbYkAgrIZ3ATTNwr5
	Sz9A==
X-Received: by 2002:a17:90b:2cc3:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b1b0d800e0mr13527078a91.61.1794922174347;
        Tue, 17 Nov 2026 05:29:34 -0800 (PST)
X-Received: by 2002:a17:90b:2cc3:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b1b0d800e0mr13527057a91.61.1794922173900;
        Tue, 17 Nov 2026 05:29:33 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a3866bsm15405945ad.35.2026.11.17.05.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:29:33 -0800 (PST)
Message-ID: <38770f99-aa88-4d35-a389-d35da0450d9d@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 18:59:29 +0530
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
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <sashiko-outbox-213017@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-213017@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MyBTYWx0ZWRfX0F+050UJ0kIi
 fniEcZ+FrjIuQdpg14HauhSVxdEfaq7DotxTa+XKkIMXEXnMQ6l49y9enb1B/tzbQPrp+6RZk5G
 sdwUTZV80KfzLN4SJs03eLhX9P2dmzU=
X-Proofpoint-GUID: JGn0lb0aCwfT1O3OKJ8HewPETj468j3b
X-Proofpoint-ORIG-GUID: JGn0lb0aCwfT1O3OKJ8HewPETj468j3b
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc56bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3N5iVQoPfUnDI5swr5gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MyBTYWx0ZWRfX1705AcuhXMjg
 2zMSUt1BjvLcBaXZ4u7J23wgVjTEjWcYFVzdafdOq/L5epz00mlAYEzWDfeaLHj5cOM1inSQVHk
 T2oZjSekgL0whSCLHLBX2ZzGy45RTw754aKxSkZhowi75QQbJKNE/tDpxjMLSlrI9RjlXovQBab
 +mBdvEuWrZQozMqv18Emdj6H+yG35Gpq0FOLCkmgvUFOQypxCpxwO506gxnEFLiWJ/0GMTvwQ4M
 CleBT42pEpw4U06kGVGNgvEs9UsMOzia8ZnprEmI7pAPgDit1jpSU7abDiAlqZPdgiyps5XCk20
 qhB0zdSOF6gTE4o3AZZ/pQzgjPSvMt7+iLRUHIdIEnq09jOtswzOg4h6ZvvJISMbYnYz4EJts8X
 9Adl61Wfiy82PnmJxNJzl1+nDTinwsi/sbOBWG0aU4ujI6Ge+zTNBZwfkZRA6Jk0dDHLk+b0SFK
 F8+DEEXNN4r7H/2a3kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170053

On 11/13/2026 8:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: remoteproc: iommus defined only in allOf if/then
>    blocks
> --
>
> commit 1ded47577cc7fa6ba7648da8e6df9b5ccd0a3022
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>
> This commit removes the iommus property from the common PAS remoteproc
> binding and adds it to the SoC-specific PAS bindings that use it.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed95..4662fe4cff62f 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -32,9 +32,6 @@ properties:
>>       minItems: 5
>>       maxItems: 6
>>   
>> -  iommus:
>> -    maxItems: 1
>> -
>>     power-domains:
>>       minItems: 1
>>       maxItems: 3
> [ ... ]
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index b20780e5e26bd..8aebc785f2126 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> @@ -169,6 +169,18 @@ allOf:
>>               - const: cx
>>               - const: mx
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sc7280-adsp-pas
>> +            - qcom,sc7280-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +          description: Firmware Stream
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
>> index 5a7c5f8c92d17..5c41c89369605 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
>> @@ -178,6 +178,19 @@ allOf:
>>               - const: lcx
>>               - const: lmx
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,qcs615-adsp-pas
>> +              - qcom,qcs615-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +          description: Firmware Stream
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 99e9aeeb4f62c..f838b98c43f40 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -317,6 +317,21 @@ allOf:
>>               - const: mx
>>               - const: nsp
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,glymur-adsp-pas
>> +              - qcom,glymur-cdsp-pas
>> +              - qcom,x1e80100-adsp-pas
>> +              - qcom,x1e80100-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
>> +          description: Firmware Stream
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
> [Severity: Low]
> As reported by Krzysztof Kozlowski on v4 [1], should iommus also be
> declared in the top-level properties section of qcom,sc7180-pas.yaml,
> qcom,sm8150-pas.yaml, and qcom,sm8550-pas.yaml (or kept with broad bounds
> in qcom,pas-common.yaml)?
>
> With iommus removed from qcom,pas-common.yaml, these three schemas define
> iommus and its description only inside allOf if/then blocks, whereas
> Documentation/devicetree/bindings/writing-schema.rst requires properties to
> be defined in top-level properties with the broadest constraints and then
> narrowed or disallowed in if/then/else blocks.
>
> [1] https://lore.kernel.org/r/20261105-cunning-whippet-of-success-e4fd3d@quoll

iommus is only required when Linux boots at EL2 and this has only been 
tested on sc7280, sa8775p, qcs8300, glymur, x1e80100 and qcs615.
Adding it at top level would allow iommus for all compatibles covered by 
these bindings. Since this has not been tested on other SoCs, so I kept 
it restricted to the tested compatibles only.

Thanks
Komal
>

