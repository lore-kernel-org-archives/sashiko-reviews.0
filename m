Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C23F58E0
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 01:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595629; cv=none; b=TbMMP+kNjASR1tLW2sj82kgp9kMRID1i+v9ORJ4QFgSBD4DdOoyavnWFWUOJPxoSFogPatfPAeccgOSyRLe+V3nhg6IzOHIaN3YfsrRtC8D/qeOy2qitNF6sACIqCwwZ6Ziz9uYjzPKz5QbppsGMo8pW//QxNL4Pm9Xq+SILhUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595629; c=relaxed/simple;
	bh=9KoC10LJtSeDEGSTTKojoNONjqdolpEmv27FZiRX0K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLn24VMN1fzUoU2+eWqtV1KU2fSes1/MJKOPfeZkDnAjUWK6EKKLgtQhzOKcwE6o2r49dL9jYseqVW5gPEDdfbnoYNPPntLX9xNDI/7BoWohesHRlt9kpF6/mMFI7Bg2lOMLWbpGjxYceq+gWrPvuHr9/MCE6OD3267nASh4K18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyrhOJxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNKJRHi7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyrhOJxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNKJRHi7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND36X046582
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 01:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIFQW66lWasQ4teYy7kGfOEnxcGwdViOIr1+IS87Wp8=; b=XyrhOJxz/4gBeB2Z
	SNOTGyX3iAQtgBoGbG6pW2Xm1FVMiLTJ5LFZb0Zl8pO8WYIsQ9CRnmVWZhKL91rx
	hxFsDl14Qz9jfX7MJVsLRt6ofah+2Vzg+fv4KoqTkATfXCwskKDCnz9E+RsYhMFj
	jTjsLyl9g9dI+CzdE4pTF3t6gy4FWuRHYvfnXj6VcfmXePKfnnT7KNYPQ05PYEzy
	zUbbxBVXNdae5BMEhWg8Y9vqWOGI3TvJzru/JdUEmKYQXGcZMhbSGH0Rz6F7ONPe
	NY6AGv2fYBE/tti6f+ohFcA+s06UrH1XvROKleCm/TOjWE+i0X9dbHeipqro1kPz
	GJP/sQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5shqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 01:00:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so232288465ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784595624; x=1785200424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIFQW66lWasQ4teYy7kGfOEnxcGwdViOIr1+IS87Wp8=;
        b=UNKJRHi7wKOWwC8XZqu0N64ObgBw4Z+brMwm1u9w7/OvnmmEEBIAFQuKnNaVt1NpfW
         6nh3Nm4gRWNT0JqiIv+dVftG/GX23C5w9F+2d1cbVd8wDiZxq3Fg5i5KB8XFZGQuBvTb
         UpVvxSn1aSBLmA0HTVTFJh5xNSvCQWYliRlvupobzpIckeZR/vQn5jee5l5OI/VRF5lA
         blQTMqxn/iDYWRlDZOzQ/3Ss3CIiy/txyekygAEsm5VtzywxfD+TScCI5j9WdZ8iBbA1
         eQUdhWvaJh+bN6yvtTjlfY+sw8eFsfublUChb+F4GIj1YayqCuc7VT86oE3Y74yq6V3E
         88lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595624; x=1785200424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIFQW66lWasQ4teYy7kGfOEnxcGwdViOIr1+IS87Wp8=;
        b=UBGAjd1WwOdA26N88d+KJA0x7k++KsUhOmHug5cf+UONQmF7nlny6UZakXMst2zim7
         4uBwUDq3v1Y08OSSMZqRM7pCUFfecS/U+J24NfBdnSkNBzl2XiIXrc26uMGP0b+kKGju
         vH9nXSXEymqwdtvHmp8Qfs4MWUNXyoBZBKWo3wqr0Nh6h9hNo1BO0eDh2FZX8neM+m8p
         GxZwqjizp8qEVEvB5lz6LjAGyAnLwTjrlZi1rYsQf8eql6lVg8JEHbgPR4uJQC7x7zIn
         MGnQ8x3sQZCOzKcgZI1nETHYzVVMqRwgNaAx3/PHwBBLQ5jiRyXeQarav0sqKRkpq1gJ
         jI/g==
X-Gm-Message-State: AOJu0YyKfIxRjb4KrQqyouQyFS/uGb/zSoYJMqvmhB1cY2UfrOEF+IQu
	ZH7rhHJshTQa6H+/EH+Zs4/H6MP8pMxOO1JWIMo4h3s8UzSxtAX2H6mCyEJvX5nJeas0CqQzVls
	f8PPNsgVcIAkMzeo4v45vpKtSvvl/DgBaGfjaF6eRJ/j0YSUiSJ6xFkTqW4sE30euW6DsT2FmGP
	rgHOU=
X-Gm-Gg: AfdE7ckGhGELuQ7mDAO8b+v77sa3Oh5X0hSMOtpBMYK/NTLztbIWqn+C7MGMbG/n4Yi
	WE2jzt6Iv3bCMtVatc4y6g0bRW7S2SLuMYTLB7biELcIay0vCldfnRxjwra5APzl26XM//x7L1L
	wyJyosibp8InO6nDZFzZs8XLHK9ZqsLpcx6FsZ7BcLKbPjhYFN3Mi3fSQIfEpx2ZP0WBKClm1+y
	mLoUttyFEDKLPq2gh/zA//0DTywck9bjK+7WavNvM3ZngC8H4ryjqdILoz2busKfwpuUyN6X56p
	ZNa5iYikluJytAaTlafAZKo3XJAV/Fo3/GFz4aRY1v2gX48ZCaaKf+lCLZlT1zYyG+eJEnULa6y
	kri5BS7K0uz2tMYEd5veYzkSXtFSv6rE=
X-Received: by 2002:a05:6a20:cc0b:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3c3ad66a4ccmr17599896637.11.1784595624111;
        Mon, 20 Jul 2026 18:00:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc0b:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3c3ad66a4ccmr17599830637.11.1784595623410;
        Mon, 20 Jul 2026 18:00:23 -0700 (PDT)
Received: from [192.168.0.5] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm37644053c88.3.2026.07.20.18.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 18:00:22 -0700 (PDT)
Message-ID: <7bec94ea-a5b9-be03-0e40-5de8262d2197@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 06:30:18 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
 <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
 <20260716165434.GA290489-robh@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260716165434.GA290489-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAwNyBTYWx0ZWRfXxplhZth0M5kK
 Svu3B2bP7/GY/aaTaOV1IxxuqfjhbBgZGttwM8H8yvd8KzwrReGweyO0z7Izvmc2J9q1rgjt1jH
 7dKPt2tWmBpt33E52czG13htmXc28dfE5b9fnRgYssL+S6u8RdB1ISdhgtnWid2Hus/snig/6uN
 G5r3KTL3I1a/TobRCqvSXIEZJhyzKsC4D+u++HS0ukUUVxOJsNDJmikNbj4I4vLgdlYB6f7Yhfb
 KH4g3s+RH1H32SkTaJmsLJVdAjKbXReDfsdkJ3LOqdsI2xoAgvTCVclibHj+iOfAP8DGKw69DdS
 ryJF1qgbazfYbBakq8ZMk3dMUYQRAR/+uNnMlTpJGiHC9W3RiKR+0f3W/+fvobSQ7xFgSqGZNwF
 UUBSaId70oVkmvxRnMCH4jCO3Vt5A1ZX3kScxKb3JFhY6CAWH/5xy7KzyWKmmexK7GhwyYoGEht
 RvxHsDwXyiBPCLCTzPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAwNyBTYWx0ZWRfX5KHZ985XWSs7
 1H5tfLPpuHHXuGObqVG23tA7UDVe9y2jJMs7eL/Usy+cYMm6XEulMbEvB7GFWP81DyEEkt4OTua
 /xRHbNW75N3wfq84USmqe/v8IUdFhSs=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5ec4a9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UXIAUNObAAAA:8 a=waDrRbdePDZ9fwWd1tsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: 0o4-kYoqxULxQ1gbdc4XzSXivQhGRkWn
X-Proofpoint-ORIG-GUID: 0o4-kYoqxULxQ1gbdc4XzSXivQhGRkWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210007


On 7/16/2026 10:24 PM, Rob Herring wrote:
> On Thu, Jul 16, 2026 at 08:37:17AM +0530, Vishnu Reddy wrote:
>> On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
>>> --
>>>
>>> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
>>> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
>>> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>
>>> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>>>
>>> This commit adds the device tree binding for the Qualcomm Glymur Iris video
>>> codec. It introduces a new dual-core architecture requiring additional
>>> power domains and clocks, and updates the maxItems limits in the common
>>> venus schema to accommodate these changes.
>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>> new file mode 100644
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>>>> @@ -0,0 +1,255 @@
>>> [ ... ]
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: cpu-cfg
>>>> +      - const: video-mem
>>>> +
>>>> +  '#address-cells':
>>>> +    const: 2
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 2
>>> [Severity: Low]
>>> Are these properties necessary here? The schema strictly enforces const: 2
>>> for #address-cells and #size-cells at the root node, but none of the child
>>> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
>>> does not define a ranges property. 
>>>
>>> Will this cause the DeviceTree compiler (dtc) to emit an 
>>> avoid_unnecessary_addr_size warning when compiling device trees using this
>>> node?
>>>
>>>> +
>>>> +  non-pixel:
>>>> +    type: object
>>> [ ... ]
>>>> +        resets = <&gcc_video_axi0c_clk_ares>,
>>>> +                 <&gcc_video_axi0_clk_ares>,
>>>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>>>> +                 <&videocc_mvs0_freerun_clk_ares>,
>>>> +                 <&gcc_video_axi1_clk_ares>,
>>>> +                 <&videocc_mvs1_freerun_clk_ares>;
>>>> +        reset-names = "core_bus",
>>>> +                      "vcodec0_bus",
>>>> +                      "core",
>>>> +                      "vcodec0_core",
>>>> +                      "vcodec1_bus",
>>>> +                      "vcodec1_core";
>>>> +
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>> [Severity: Low]
>>> Does the example need #address-cells and #size-cells? It demonstrates their
>>> use without any child nodes containing reg properties, which directly causes a
>>> dtc warning during dt_binding_check validation.
>> Without #address-cells and #size-cells, getting the below kernel warning prints.
>> [    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
>> [    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4
>>
>> [    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
>> [    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8
> Then the kernel is wrong.

Hi Rob,

Looking at the iris DT node from the link below:
https://lore.kernel.org/all/20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com/

The iris is the parent node and non_pixel is the child node, which does not
have a reg property, but does have a memory-region reference containing
iommu-addresses. During of_translate_dma_region, #address-cells and
#size-cells are required from the parent node for address translation.

As per the Device Tree Specification:
https://devicetree-specification.readthedocs.io/en/stable/devicetree-basics.html#address-cells-and-size-cells

#address-cells and #size-cells cannot be inherited from ancestors and shall
be explicitly defined at the parent level. Therefore, adding them to the iris
DT parent node seems appropriate in this case.
Please let me know if I am misunderstanding something.

Regards,
Vishnu Reddy.

> Rob
