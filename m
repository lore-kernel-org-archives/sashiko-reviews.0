Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E2314A60
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 02:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466099; cv=none; b=iSWaWeNGSBSMnSIwTDmGQPty5p0b+lGAOHC9Q8vtX4HKC8gPMYM/7elK6W7RPxl4wTiFQnKevu+nMektWoDNkz8YD9uBeqMCD/ANM/XJ7V/xfGywEGbUiNC7Op+rSeAQysWJiJ1nxcK23yKGPgt43x+ERaPm+z6F7LUS1vQaVjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466099; c=relaxed/simple;
	bh=ZgwiyRj7FLmHtrjyUzYaLeGUpC30Q31E4oVMlIii8Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sny6yBoAWm63BJUu9Prdn/M3SNCjSLwSQcFT2LerJLiJ0DaWWHfpy+bGLAy/JrmyQtrrYIkoBsw8m0LGk8MtryGvNjsBjU0np77tBdhjAAg/Hpe0kVCX4SOWHPPfLWZlD3trfTdBmLWbLrSrcnLpl6Px0bhEQ8UEN2obgzcFSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Glqe1lM9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxKylMLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Glqe1lM9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxKylMLz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2GLUx2637248
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 02:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qt/5MatpNOCdKRPB1kLriXHjIY6fXa5r1g6k9xmfSwE=; b=Glqe1lM9Ja8PpnbQ
	ipKc+IlP8oSWM8P6FBi0jplvttBdKkaGqxLhbx7w8wJoahhDm9Fk7eW/wEPGH5tf
	Vlg+6LmKlx3U4B+s47pvSGjm8c0ltwJtPHER883kAUSi0Bjal0Mo0Ipfvqn8jEj9
	hzal9kWvXL0jDibHavPl5FtBK0WdmZoMlK0K3j/LYliIqtVpwDHpa2jsDS5HCalQ
	CqUO5jPyr6b442+EnQUg1P1SAZ1RnuaTpT7GfcBr27RxqTNypWdzlmFHG08kP2zU
	e7lBesF4TkYzOU9TKDDoc0b9pJWck/kqRf7+0yxifGqzydU3oSDCG7nhA89VNflu
	EZpbsg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjsc039t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 02:48:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so5817155ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466096; x=1786070896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt/5MatpNOCdKRPB1kLriXHjIY6fXa5r1g6k9xmfSwE=;
        b=UxKylMLz2ehn3BRPgPqurFqFGGUhD36p+zwYIGxsjJaxVi2MK2W7PiCmBwhue+dJhK
         yBgJ/IWOGU1cMG4lp1cl0nsDAKViQsRsaYximOvujpQlIGAE8AIaoFlm1hY97a/7ZZb+
         Md+cr8co+YPfTZ4UQjSbljqVOetaR3ixy7HnnEOJdMouGVY0MH/zoEN1dSks8ya6SYy9
         XjPLwsS+KcyewmZdHIr7CnC9NYZzcWlqrGGIRwqPm5Ql4K1FNcRK3uOV8yv2SdsvGYVG
         81LPfSjcYBdFs+1kidWCD8Mf5M3Y+gyXwsd0OmC0rqMWr8vQJy/hLKruBjTdyiyvysaC
         m1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466096; x=1786070896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qt/5MatpNOCdKRPB1kLriXHjIY6fXa5r1g6k9xmfSwE=;
        b=MVxWatBqh0HKIpHVxMrXZeILiZz627hvsmLtRYkgA+glegfcYEYR9KzGK6ft5aubB4
         /GqbIbjuMccjVFQUQTGOmsxGkD/16dAhORjTaMZOnNR5CLuml+2WOu7EJrN33IgkeR/L
         FAMYX2wXuaDNcLAVEVzTE6r/lqx8AnSoQHPvtmGh4JuGuRTJg0cNhnAlsgQAqksrwlgs
         tatW7pn1y/hBGB9/BZXdmCsmFnObfoklhrYr+4dqcDK4GtnEMjatzEkJvbhG0zQqEFil
         eHUmyXRXJoLH3os7HkbLidJY5Ma8PXNRCM7iyfeB40CXqsLB4AUccVZ0T0EnPrJgxRSr
         ldfA==
X-Gm-Message-State: AOJu0YyTi0/Xdod1Sf2tEn7HcQXLfm9JKVhFkfRjbwT2GjpAyUOjIDyT
	jwFghtKQ7YnnYcTCETDcTE3IunY4WZW8CL+8LNFn0Z/YvhlvsZ3CWoolaPx/qsADDJ9VIdvxLJJ
	ZyLHCPf7CaRFg55CjP+mbThg6S+jdWiEAqqygyiEZCiaiELjeoqvBdWixBo0k5aNYK56TgPYh93
	M7yLpYqQ==
X-Gm-Gg: AR+sD10GR4gOn/W7pXlNZ0XMRMuKYuvACdzlPyE3WVR3f2IWAtbSYdFOF5Fu48z5APO
	3o1ZE/T5kDjPFt8JenRWiPu5YMKOtWpCVFTJWyN0voYmRcAJk+Y8qnqdahtKhVlENMHhnvUhTB8
	kENeirTxCzVeTLyAD9kyCPNfF3FNpbOyD/9Mr2a/lIY1IVze48CZqTVQH+EQ3VHyG/hEe3gsqJI
	TY5+9+H61YscyKgXHV/0qUowUzefOdw77iw8kUWxUtRxI4HJiE4PFNTlZo2mDsb4Tq2ZQpO1JMB
	S6iwVtGNFmFOjDGfk8EabRhjDFArE3duF80eF8wty03q6DVObD2Gi9GV7tC9jbLI8G6yZeWCr6f
	Ur2xIL5LFFqurBwbOw1koSxOG21KMatm58yJLQvNX6Se8Not8IokiJ1Bk85pz6zQ0j56teh8=
X-Received: by 2002:a17:902:f602:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d046d67890mr3472175ad.5.1785466096078;
        Thu, 30 Jul 2026 19:48:16 -0700 (PDT)
X-Received: by 2002:a17:902:f602:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d046d67890mr3471975ad.5.1785466095585;
        Thu, 30 Jul 2026 19:48:15 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047abcadasm588365ad.51.2026.07.30.19.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 19:48:15 -0700 (PDT)
Message-ID: <e6906c57-d17f-475f-89d3-d2e8550735ff@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:48:12 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
 <20260730081507.B1F911F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730081507.B1F911F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GtVyPE1C c=1 sm=1 tr=0 ts=6a6c0cf1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FA5ksZJBM4DXSn_ndQAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 94B3GrLJ9bo3nT9g4LID7exvXt2De_WJ
X-Proofpoint-ORIG-GUID: 94B3GrLJ9bo3nT9g4LID7exvXt2De_WJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNSBTYWx0ZWRfX/OyDxXSLe2ZC
 s+VcK+p9SuZQ9Rl/53xuyCt7c05eJdnHpD+RfcY4vHLaFFwaRW2Wr1qMn/uSHpgooN5bncKmWQA
 nvy9ux1TtsPGqIexbuCHZYAGq3YsrAv1/KpKZ4zMsHP2zF5HWTm1tJengfyCUlWfDeH9fuI6+cp
 b+gUCPYE8EKbu87CTyBs+dMhTJwDi+W1cWVN3lqmEiJjiOeaO1op0ifU6ajmQN96bSyzBc8z7NY
 xHOiHaQsMJEbNg1nEKtEn6D3aNX5SpREh1PdsfTfKmL0qDpJ4g6+NqUolmyvqeclcIsxZvOIArN
 fNz0nEd09shDvWLPcvY46wMtjHQzvAtseMT5xdsgMKnwbLgxRFx7aoAjfZWmvaq+S2aPziBkXLh
 6iXhf+CEi0jC7blOJzb5Ew9wtIAzvBLJpd91C85YE1n5iZYlwvgLyHzmQrL2Cx0XbZSL0OVxAL0
 RU4YoHzj/D/ZTZ4eKJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNSBTYWx0ZWRfXwnNIv/wUEbsx
 TJ9kiYt7KENqgR2a9XL0OMji0PxupSfyPKlk1nUSoI0z9aLj2rDOr77OqKVZRG4ij4ow749E4od
 kNm4fFLhP27IzRx2IyQxz6E/93BAnqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310015


On 7/30/2026 4:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The binding schema omits the `interrupts` property despite the hardware description explicitly stating it can generate interrupts.

Clarification：

The current driver/DTS does not actually use an interrupt line (it only 
uses CTI trigger outputs), so there is no need for the binding to define 
an |interrupts| property.

> - [Low] The schema claims `arm,primecell` compatibility but uses `additionalProperties: false` without referencing the standard Primecell schema, incorrectly blocking valid Primecell properties.
> --

Clarification:

 1. I checked the format of the |arm,coresight-*.yaml| files under
    |Documentation/devicetree/bindings/arm/| and found that they all
    claim |arm,primecell| compatibility, yet none of them reference
    |/schemas/arm/primecell.yaml|.
 2. In actual DTS files, properties defined by the PrimeCell schema,
    such as |arm,primecell-periphid|, do not normally appear. Therefore,
    referencing |/schemas/arm/primecell.yaml| is not mandatory.

>
> --- Patch [1]: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace ---
> commit 1cb0b1557ad8efca643aa36dee2d1b84f9c415b0
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> dt-bindings: arm: Add support for Qualcomm TGU trace
>
> This commit introduces the device tree binding schema for the Qualcomm
> Trigger Generation Unit (TGU). The TGU monitors signals to identify issues
> and can generate a trigger into the CTI or interrupts to processors.
>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> [ ... ]
>> +description: |
>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
>> +  to sense a plurality of signals and create a trigger into the CTI or
>> +  generate interrupts to processors. The TGU is like the trigger circuit
> [ ... ]
>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> [ ... ]
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,tgu
>> +      - const: arm,primecell
> [Severity: Low]
> Since this device claims arm,primecell compatibility, shouldn't there be a
> schema reference to /schemas/arm/primecell.yaml# included to properly
> inherit standard PrimeCell properties?
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
> [Severity: Medium]
> The description above mentions the hardware can "produce a trigger or
> interrupt", but an interrupts property is missing from this list.
>
> Will device trees that legitimately specify the hardware's interrupt line
> fail schema validation when additionalProperties: false is enforced below?
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
> [Severity: Low]
> Because arm,primecell compatibility is claimed, should this use
> unevaluatedProperties: false instead?
>
> Using additionalProperties: false without inheriting the PrimeCell schema
> will block valid inherited properties like arm,primecell-periphid from
> being used in the device tree without validation errors.
>
