Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337AC221546
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127475; cv=none; b=A6xAdmP69YMyNcer2V1gbhR6WLhJNC0hqxDA0H7iJ0X5xMIbpP7hnlt/uC6NQuCQhr0lwbhTI0W1N5pFEa2P8JpqVVJRJ87y/uLYo0fdEj/ydd8MgkWdFpZYwJ5V5765kIEimbhAB/wLI8saMqgbzOWqOGTygN2Higibd249oMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127475; c=relaxed/simple;
	bh=iuXIPrSwCRp0iQ6GB/KRWeEaz8D3p/6oRtOi4qeDXfk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oSTXpEHEsGArMWG2645JbmRDOIfXMIUKhXXNkyhv2xFg8wWeduToQw+skynckIku0v2pYPAO+ydpmEQ8La+PliZvi+GvjCo7GBUoAaCZyorzJzZJCkU2/HiLiyAZyDzw6MFwQj5GSHOz2+onteWFpiyi0R2/xZPqmXVEFQjHxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAHkttkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmLW2ON+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAHkttkM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmLW2ON+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fnKU2417056
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wcb+8A+KwRe2Zf/opdn/X7rbD+wSNt1gfOSQD3ASyM=; b=dAHkttkM2rGuUv05
	FSsa6DwSKWh1Bmo6KC9ZNmi0RjxHlGNhhZkKKlS9zO8hpokv7fq/51RQv8iiEuSS
	JKDl/eSb8Mg6T98gTQuGgIFH6z8Kw+HzvVOJlO8HqPjBfVrwxJ7eCxTgdq8hvLNM
	lSquz5S+YF7vDZCnyMgZxrEfIvyo3Rts3wsRYynMc0lFiVCYdF8cSOMWzJX4U5xr
	XJ80GDIzIXnZDan/W9e+SGsXT7fpuUTMyRHExMWLafWSgZ/ngguv/cdLGxZ3Fq/H
	apHn5c2vVP3ThgbqaRNaRSsL1jWhYF3vbaBidjebjlbekphMpfpoWqT4XiToxfbk
	RvL9HQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqycj5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:44:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso1509160a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 21:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127471; x=1785732271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wcb+8A+KwRe2Zf/opdn/X7rbD+wSNt1gfOSQD3ASyM=;
        b=MmLW2ON+yovK5hX1xgIAFLv6Bb88Kt+APTboM1qHgoTVxC3hguvUvC2pIUf/knYtA8
         v/kbX80laF9MwQiXJt4HnqUhgd6Je/6wGhJzqeDhOa7EoGX72224DI+TnBWj8qg0uyc1
         lA+1aXzAhEiRI9V6BT9UwseorqrL6ccS6LsZr7MsJq8tBEnU0ywul47aJ0zVLGi0o1jx
         vNePLz3w1DPVAe71rrqpqquQ1G7DtdiP+YSVHdA9YKjoY2XHudRof7FrHHvGcF4wDExR
         W6oopmop3l2DIxfD+z1gSkmVVT6N9URmDx9lyb5w6ZcJ5kjZ2rXB9+xK0VUtEKNGjfDI
         v1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127471; x=1785732271;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wcb+8A+KwRe2Zf/opdn/X7rbD+wSNt1gfOSQD3ASyM=;
        b=EK5cxMFbhG7ZzLHPuHrX9llsG586V8Jav1j11QfP1M13yF97vFseM7eScXFzJg4P8G
         1XR3Z0b0OtN4LaL04KS6hqWlT1/EMUab9YTCxA1YNrtaJOI0xovw9To0EVdomQYwU3Ce
         ogqoGsFBBz5uwLMFDsRww+kVcBLYrt+OFwQ30i4VdIWw0xl8q7dV5axXukCmgXz9MsHp
         dvePFtcMNwe+eyTUdcRF5K3Ni+CX5oyx7jXfHZ6ioYvs5hZaFVQG+werV80KnzVtYLsl
         6fjpsnBgaCDVd6pp9YrkigbFHl8F7K9d7UepwOuDF8mSrdecuV9CIJ3hHz/XYJX93zOq
         vY3A==
X-Gm-Message-State: AOJu0YxkH+QL9ZDoPi/sqNhbDzS26RjayvSOrfK9Crl+I0T+f/7ZvVNh
	clKFmZKyFVidJuzvfu5npjcOfllfHkRnGFiw79jHIJ8pHJFlfbCVaWOLNJDisP4/10xUvo7Vc2K
	eGXNIvGTAWmhLGmdR0886jwo00CtRpyUEoVC/Z+ov+IR3boPs8SuhvnsN6r0Se5IiPGO4WKyxHH
	DsDzQ=
X-Gm-Gg: AR+sD12ampco5Mcv3HAAL/Awtn7DRTksgQ4lVbUkqzi3+Yktxu3HYl3o76t4qhjiqOQ
	+w3gi7o9qREDE2gJO7nbO4RCSAcetMLUK/wRnMMf3I8e+JmtRifudKAD7QfHQea8bonpG6oxrN1
	BqZM1deqie8vWvfPw0kEMRSvhrnQCFQklxLF8HygrgNmhebwZKeAeC1mXbZBDIH7XjyQAnw1v3T
	pcn+CHGIbnvBVDB2SPzuqsGtVbPu34tyX/eZmh9iEyfzAH+1otSd2Ednr6EcaP3sY7BzbZJypF8
	t25Bdttv6R5JtQGhGOf0eod1eHT5oVxBMBiGhybM7tMwcpyQ5mvnw2GQre3A5FkWjFTtqSil80Q
	tMx8r475tHgmmaf3Yu/rQxj8jl1iFjASn
X-Received: by 2002:a05:6a21:6005:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c67d9b3e93mr6647000637.5.1785127471621;
        Sun, 26 Jul 2026 21:44:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6005:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c67d9b3e93mr6646985637.5.1785127471162;
        Sun, 26 Jul 2026 21:44:31 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm40989057eec.4.2026.07.26.21.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:44:30 -0700 (PDT)
Message-ID: <87947a02-2012-a641-25c7-deb7b582291c@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:14:26 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
 <20260726060031.861C81F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060031.861C81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IJV45n1V91B-JtOK5O2Bsed6Jhr5gCoj
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66e230 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1scMU-huRlgI1J5wvogA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: IJV45n1V91B-JtOK5O2Bsed6Jhr5gCoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfXw1NDTuM7GQWx
 s9kEGHyPp9W6nnmN4x1/uWt1kjibbNH8jH+HyJzIryvqhGN8xM4OWSVg7RQPYw4BQs+que8zb2J
 +Zw+ouYgXnPkoIVEN5AackFBhc2Nf8Er65jtoIJJRsh5C7jDjnOEeOkTa/5Xum1hbP2yHLKZHt5
 wRFh1iqWoyLZxxyWdUu8Zv7Ph2p9ikjEhgb4StRqaSl8KvWMy0bj8nsUlrfwG40rSyGwLxHNJN5
 ZsRdoyjtpggfzsUeOgXHRsSWBYOe63ur+oO9gYfQjV1OpFz/jPjyIb3k7wt4QasND5RsGEC/opD
 HQdGPFcKXYKo6SLttW6PBLPKlyVgJsJCWu4DfMyACdjbsQQGY1n1HVlqXee6MDr80HZIkRkxpJ2
 RIPywH4LlTKIy+8BLXZ+Ubce7e5DeZF5ZuQIr7jzPMORFh2mwPNKDmGbgtltKMpyRFRG7Bg9721
 4nH8+MWjkAUWDB5it6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX8gmpJ9kI6c7W
 O50W3C88Ek6BlyvW/rTLJYrv0WBF3ZY2Ejt7O/wrSD9zJbqAup6UQ3THOH2bKFcgxH1rn8pSY30
 dMx8NufDkaHViRyjtFyGR2CKC/NkTKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270042


On 7/26/2026 11:30 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree binding incorrectly defines and requires `#address-cells` and `#size-cells`, forcing conformant device trees to trigger dtc warnings.
> --
>
> --- Patch [1]: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> commit 6a8af4611de5993b1c0f3d458ae92b3f17956b81
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>
> This commit adds the device tree binding for the Qualcomm Glymur Iris video
> codec, a dual-core video IP. It increases the maxItems constraints for clocks
> and power-domains in the common venus schema to accommodate the new
> architecture.
>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> index 0000000000000..1bb16206d859b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> [ ... ]
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
> [Severity: Low]
> Does this binding unnecessarily define #address-cells and #size-cells?
>
> Since none of the permitted child nodes (non-pixel, pixel, video-firmware, or
> opp-table) have a reg property, and no ranges property is defined, wouldn't
> enforcing these properties unconditionally trigger the dtc warning
> avoid_unnecessary_addr_size?
>
>> +  non-pixel:
>> +    type: object
> [ ... ]
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - compatible
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - "#address-cells"
>> +  - "#size-cells"
> [Severity: Low]
> Because these properties are marked as required, any conformant device tree
> is forced to include them, which will result in the dtc warnings mentioned
> above.
>
>> +  - non-pixel
>> +  - pixel
>> +  - power-domains
> [ ... ]
>> +        resets = <&gcc_video_axi0c_clk_ares>,
>> +                 <&gcc_video_axi0_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&videocc_mvs1_freerun_clk_ares>;
>> +        reset-names = "core_bus",
>> +                      "vcodec0_bus",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "vcodec1_bus",
>> +                      "vcodec1_core";
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
> [Severity: Low]
> Are these properties in the example block propagating this pattern? 
>
> By demonstrating them here, it enforces adding properties that aren't used by
> the child nodes.

iris_resv has iommu-addresses, which requires #address-cells and
#size-cells on the parent node.

>> +        non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>,
>> +                     <&apps_smmu 0x1944 0x0000>,
>> +                     <&apps_smmu 0x19e0 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
