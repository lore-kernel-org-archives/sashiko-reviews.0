Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A604F4D1E
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616060; cv=none; b=Tinklof635ttS7G6kB/s7rZAhvovohV4LHPS0gEkfYkR+F1wDE+0XogZG8LOPsFlEEooC8C6H/NGlzi7CF4h/U/FFHIwmw/wC89+8KLbnjtj9aEn+AHBNpFwNJjJw0XXek5KGi/1LbMC7xITNf4Gy14aEcVjRcQVgIqIZj/7tk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616060; c=relaxed/simple;
	bh=XQFUBGLVEd7XJVcqXhVSxs6Af8dTUFJdY6Ao2nWuu9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PApqN/H5O0C5ka7c0cGu+4rJvx0e3IzdEcroryBfwsnpfa14d1kAf6ICtQO4v/ZmZgOurWTsAyLfTOe8WxSoBR722rtoJUHQlGelVve4uK8tqGlFJUTzhWv9xmSaXnJL1rhZjkqgUSlctTujxWF7BnPPcNsULvHv/zVd9REQuEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ga2yJxTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG6j9JYn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ga2yJxTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG6j9JYn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdsgi378836
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZ9Ubm2a8J1TvagIpXEzDc0W3zb1KHVr2A7Ld1gh9Lg=; b=Ga2yJxTGIPwToVHv
	BfmuO91hrbO5sWPxw4zC49K1kMY0PB4G6GnXKnyLjjqZ3YAheUQQNKsXV381Cm+9
	loYAiVzreurkNU68lNTNbioO+uqzZPDvtZUzlceRY4FEoFBspB6/phOyBSFoqmBl
	91FE8KSx5FmemdTrL7tEPLQJT4aJSGDtHo6hx3g97T3Hn3eFJ8RE/7htGLz8S+CV
	MiDJlebbHxISvefK+421PE+VMyE3EO1tkxoqwoRPEwAYwz/DcPR07ocOkzXtiINx
	InCh35dGTjvGBDsA/KuTzB2jqK2WYmd+3QvDAlj0p6VTyvq6uRenysib6f0zHctc
	N9nXDA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx39adw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 17:20:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so3923778a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616056; x=1791220856; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZ9Ubm2a8J1TvagIpXEzDc0W3zb1KHVr2A7Ld1gh9Lg=;
        b=gG6j9JYnyKr8w/AY914uELZqc66IUY2eTRCf9VNuoNpDGid67xFU6b2wtVeSrpdxzg
         spl46iv90k7l4nZjvUC94GSusUtgM5zVFW2tnrUey2Pbe+pxwxl3DP+uyD1YbTwY/Map
         LWLEE03NOu1lu/Eb2z6dAe4DvVNPELnUV4z3VjACLkcGJz6Ou91vz8IEQ9cKmy7pE/e+
         YIRCUQkPyNr4q5B54riUB1GNKK5zmedFxd9jD4+IEc+05Xkfp5vk5jFx80PyYqPzpUGD
         3xUeA+QHB9prBMs8PXFAJp40yEwfg77fUDuBEjpAFYsskDpukrhd8P5H3XIEczwG559u
         9XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616056; x=1791220856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZ9Ubm2a8J1TvagIpXEzDc0W3zb1KHVr2A7Ld1gh9Lg=;
        b=SIpVb7ir/jb4aDahrAeZ0vumkyTYSswa1Z8j+6I9s6iz/bHR94EGefpBWcrIwBr3na
         ozr74el87ykD2G2XSsNw6K4Qmp6aCIpwQJatNiORrcyGejOTh0cwAiuAA7tGkI9kdn9T
         hJPkU8nSZVnkSD7T4yRbHxVZ/lxOXwZ7xAwCF/80mPi3D4D54K8r6uPwKlgRVKV2yB9n
         JjRyV1CAvmOvyN4ZJCXJgCquTDu/OEYskXzHiXVr9hDfjH++nVUYVuuDTjabQx/sgPY2
         kSY1F2zhmimnkhqFdm88HQ1OEtMkndFpnH11a/Azwkn2N1ByO3gG9lPMBZFcixoPLbks
         AHSw==
X-Gm-Message-State: AFq9FYI5XSbSM1/jlv19tIyibU3H6zK9tEWUnGXr6mcs2J1RfDK6aask
	s9gVVVLndTMuMdZ4sFB7dl8yxmY7hJ5iDw5CFKfe26O4zTu/c/ZgjbVUDe0lKEsT118ZQk/Cfy4
	JvwnrxoCTOEAPk3hO2luhclV2YAuf1H1FS1pq9w7pm2tHpeWE5x8RA2cyZyZ/D0Ddh0IDI4hpWp
	NSdS8=
X-Gm-Gg: AYBFou3ZmUk5KVrHB9GE/op+nnjkCRLourrr1FxkmdD1gyfsD6Clb4EBY5s0WLBTKU3
	bIfuta0xIftI+sKQW8Jg+MECYWYacBx25XfYLT3KYqI6boPaZ84AWItJgQi1kde6rG9iV4FoCyr
	fD24HkGZKpBuDvLz5tCiogruNmCIDG3N/0UXh7TZ+Wlg1vtkOQs/xL1cth9ISh1EGf3lLyn8RFk
	q4CbLfegFYxQVu+Ij3FSZCkqFrDcyRHIdB/MTGHel1IUqEV14wN2vnXt5bdbr9gWYenQZHG5z80
	DlImXk8NkMAMS+KBgojf6HNNn+Xf/WaR/wfzfxheAnHumA36aZOuKw3Ikxl31mF+76bEpe9YbjI
	NiMyypaTpDyMQIecUdAc3BvY0S6flmwZKqc0=
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3957 with SMTP id 98e67ed59e1d1-3a0d65147cemr6223585a91.35.1790616055582;
        Mon, 28 Sep 2026 10:20:55 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3957 with SMTP id 98e67ed59e1d1-3a0d65147cemr6223566a91.35.1790616055099;
        Mon, 28 Sep 2026 10:20:55 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.235.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2bb1fc996sm6864525ad.62.2026.09.28.10.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:20:54 -0700 (PDT)
Message-ID: <043a479c-7ce2-4dca-ab9a-4a3b11e43005@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:50:49 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 05/10] dt-bindings: arm: Document reboot mode magic
To: sashiko-reviews@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
 <20260928062613.7BB651F000FF@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260928062613.7BB651F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX/089i1yh2NSh
 gIE6e8sQhyIEGVoPxY3jw28RDCHfZ+9G9L5tf/LmJfAi42DloK6ZwQwuHMd5Qum84e95gWPTLji
 eKmSk34Dt6VGmGf5Yv7qB0k8jViu+fPDwCBkH0eFLxOJvrOywI2EZgTiMOnA8wgzYPstdL3dvKp
 9ZZle6SNUxS8Kc51X2RGZrzJHbcSr12fVSUvdBR01i4YfPBZC0rxDZQDWuIkbxAg38z5GeiJsGN
 G61L5Vya2MFcSi6zbfMPLVsRFjAgRcQx2niK0bc7efZSFKxv2id34I3RljNPG6TbxjLUd4+gNq1
 KNjy2acrJ7cNNjCMFTjVG9XiuHCLjHgiRBPblLVbdJbgbHfW7y+rWZEUck2kurqIRVCUHt0FS1Y
 k9ZWSOm0lhmCsfXvk3Gi3IucIbj0GvhllqmVqEoEjMjpBZjpkZi05Ptqd3KkiAypUXE5dtStL3g
 M3sS0WLgp1TNqyK2Czw==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6abaa1f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=0iu8UVjuSkuIMUlAYuuJCw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_qQNA3pjuplG1EYRU9IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dKytb25g4KuCG1fuoiFUR37UrKEMWwYq
X-Proofpoint-GUID: dKytb25g4KuCG1fuoiFUR37UrKEMWwYq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfXyUP3U+6Eb3b8
 QRNAJDtd1ojq8PBdu5aA6999L1FFgXfLmF8MsGqehvHiBA3mX76rkMhlLAoUAonX1iNFBkg+xRw
 I62Eg21QjVU+1VA6evTfSifumVw8HXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280069



On 9/28/2026 11:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] dt-bindings: ineffective unevaluatedProperties allows undocumented properties
> - [Low] dt-bindings: missing maxItems constraint on mode-* arrays
> --
> 
> commit b385b6956b70c623850aefcc8ceb50fda4b87cc0
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> dt-bindings: arm: Document reboot mode magic
> 
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
> 
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index 0d04389c81faa..82ae25e7a3386 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> [ ... ]
>> @@ -98,6 +98,39 @@ properties:
>>         [1] Kernel documentation - ARM idle states bindings
>>           Documentation/devicetree/bindings/cpu/idle-states.yaml
>>   
>> +  reboot-mode:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> +    unevaluatedProperties: false
> 
> [Severity: Low]
> Does unevaluatedProperties here effectively restrict undocumented properties?
> 
> The referenced schema /schemas/power/reset/reboot-mode.yaml# has an open
> additionalProperties: true. Under JSON Schema evaluation rules, this causes
> all properties to be annotated as successfully evaluated.
> 
> Consequently, unevaluatedProperties: false in the referencing schema becomes
> a no-op, allowing any arbitrary property to pass validation silently.
> 
>> +    properties:
>> +      # "mode-normal" is just SYSTEM_RESET
>> +      mode-normal: false
>> +    patternProperties:
>> +      "^mode-.*$":
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        minItems: 2
> 
> [Severity: Low]
> Should this also include a maxItems constraint?
> 
> Providing a list of schemas to items constrains the initial array elements
> but does not intrinsically limit the array's maximum length.
> 
> Without maxItems: 3, a device tree defining 4 or more cells for a reboot
> mode will silently pass schema validation, violating the binding's up to
> three 32-bit cells requirement.
> 
>> +        items:
>> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
>> +            minimum: 0x80000000
>> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +          - description: arg3 (cookie_lo in 3-cell form)

I would wait for Rob's review on both comments.

thanks,
Shivendra
