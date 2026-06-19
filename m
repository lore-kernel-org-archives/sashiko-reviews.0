Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D8346A15
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 05:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848782; cv=none; b=eJbnUt9RU1IE+uIj8Caup0wgCQZtUx/GZ/yU+DZLOntqIzqH78gft7Xm5xXaeHLnPNweiSytZ1/61YYTyoZFMGU6ebcbI/W/93xzV4aDb2lXR7PrDTb1IGRfRS/vadOUmGCPzl1ZAnB+Ux+Dh5MZ0KufABJIsZHlL5vcmATano0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848782; c=relaxed/simple;
	bh=fEyzOrCThWgarJPoycF9QcuaJndtT00vfgVkEpq/DXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0PA+/XA/a4nf093dwFFxh8EaNhDlYw4jJ5AbD6zj+XXVp/jh9MvZTqY6pqqarzh5v4Cn0VC8xoY6xN9aaIUdXwfYczaqS1O5VuK/P6A0mclt0binGN1Kh3gKEC0WXmqVnrT4tV+nqiSvur3bDWSnH/+c9G3WFGGiPvJpIopvQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEi/PO5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KziWjgwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEi/PO5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KziWjgwq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J5v36p4080474
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 05:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LAW38Z1CsutV1AW2S+IjjxuMHjg9mfmTBAH8Mvre3E=; b=DEi/PO5e29rhClwv
	ZN4v0InmvHItIrNu7M+lRLhGeOVOfO6x5YuDOYmtA3NvFdcHQ5U8y8nUP9uF87up
	8Am6RiKKVWHlS8sz+ChXycU5DvpXSP8UACNCmop55j8njz/ubBfMTpShTVmbJgqr
	r8kvLgTTcaVjHSGHBsPKOAhtE0RiLEdpyNMV9VdgrxyznBcoUC9u4fKR3/2iuV/m
	vbvq6A7KdG7S6IhG7oXnh1wcRKiPQuU2pcZHChKZ3KlcCSQs4JFizFQczJG8XTtq
	hdv8haGRuRy4NP9+1MRWxu5jdi6HlSnPm74x5I3MtADyQmZ1SEmLmMOyUyYAvozu
	j3Z0fg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22at0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 05:59:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b71dso1230436a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781848779; x=1782453579; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LAW38Z1CsutV1AW2S+IjjxuMHjg9mfmTBAH8Mvre3E=;
        b=KziWjgwqq8LcxcTWcG4dtWBxhLyrzCDerquXK/ZdC0IybYLSU4pxC0viz3ZhoUtcVb
         zHiFeDMl8YmaaUeOePW8c0trCdczgU18rTC9l5RpUaw6QIWheeeCwiXRttHtJxcBFhsb
         drNecUd6eYISkqJXbYw6mu3RsZqKG00HJCgpydWVqzHAqWr8X+GiyTMprWVkZIWn3P07
         dQuFpcDotczNX/klR+JCezmtmEuBDYQKlVGpbrseYlh5rw4NFunnaBZeWyzBrzR/Z135
         0hsKClo+V5djHAZiBb8kPfwb2bsClITnvSBQuwhvN0OOcGYS5HBuSNNwhgF9um3HRNgI
         e3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848779; x=1782453579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LAW38Z1CsutV1AW2S+IjjxuMHjg9mfmTBAH8Mvre3E=;
        b=qtMprf9gODfBb6jSfbcnxs8TZTSBzpPMU5MjqxnhF0ip0nvlgZQv1LcuQSakVb997a
         SMA5kZVk2OB3TR5p0xAO6vOaN1Vj2rlDFPIwJ959gHmK5E4cKfd+T2W9oetl/Sm9b/sp
         d/hWB9dkdFNppZkqq+gK1tkHGqC3ueK2zEv8O3AYQlKVPgpEZE49VmD0Qrg+dAg/6uBh
         rVfNpy++5G7eHYJWpEk6ok2C3RllKwg8rgKRiqkbRGctlFsBA8x9MnPJiZRWhzjLNRVy
         CeLDKRFdscjBpDnkqVWjBdg0o5QTilBUMxKPLHzwegwI3LPgDC1CF8wviTV/0w8+v5Lc
         x7kA==
X-Gm-Message-State: AOJu0YxnZYtNKOMgFMtlrOLMo9Qyxf29eNyRF28YrhQZdJs2ZtRWgBlD
	484CRewoCd57HAhQqkhbP1LCheIHroDyaPY4bpAAy3Y7s6yCXWyDMZJ29CPXkxoUgfVyipSnyjN
	q8nqev5kmnxwsZWaQg71GSuQ53kpaaXBbI79+KO0r92USNNgp2bVMqRplwJ0im8S5SXhy6omEaG
	4TBlI=
X-Gm-Gg: AfdE7cmN0J+NT2XdeWhgPv7Y4zauZw4OVE6wBUAMuKe6GgywXED+nApm4j36Lar7DLy
	XpaW1TC3F5b1DwPI9RsLluYEB1RjXEjFxFO4Ff0zVj6LD/wOumFU82Qi+8GIIpHPQ1GT0Zb6knu
	iNi957JWvxmFYCuz9tYs0cqLgQ2T8LaLjYWWknofUSELJvm6Nv9HJYJiAHttTjR615gLm3iUYPZ
	i8ntSPZEXjfGgHJfOd/aIY9czH5rC+WbJEsOqb7yGhhKXHYoOsZkHqj01csT/GztpzBIbuVrEKF
	C1fXGCEoz+w6RASOB+0e5FEtypVGKOaSnHLVN4jeEEuOdWSD9HhqVPo7hzdQkkTo+URcW6F0hyw
	c8dXk8zcflY4BHmoLmif0YSaIE0ds9Am4HNBN+b6p
X-Received: by 2002:a05:6a21:3990:b0:3b4:813d:dae with SMTP id adf61e73a8af0-3bb32321893mr2465240637.16.1781848779372;
        Thu, 18 Jun 2026 22:59:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3b4:813d:dae with SMTP id adf61e73a8af0-3bb32321893mr2465215637.16.1781848778901;
        Thu, 18 Jun 2026 22:59:38 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a89681011sm1192675a12.31.2026.06.18.22.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 22:59:38 -0700 (PDT)
Message-ID: <cbcf72a1-cdd5-4cdb-86c5-3f40cd79212b@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:29:35 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260601-spmi-mbg-driver-v1-1-b4892b55a17f@oss.qualcomm.com>
 <20260601113009.38FC81F00893@smtp.kernel.org>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <20260601113009.38FC81F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a34dacc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Mb7mJfqsfCWBU2XDFAEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5-yHhLNSyAGr1hA3w8g29YrG4V2yDVnh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfX5Ev3Otia07RS
 qSyTd0nhUf0KEpTf4lzg6o/6J2XHKFfGeGie8GuCMX1TQGOd0v393bJJBmRHqYCDc5rU5ddMEVI
 XEqK+6McXLiuZExwskJ0PADaJ70BhJo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1MiBTYWx0ZWRfX4D99i/oOengg
 pupdY/yTh6WHHXdyX7L5QGL8bLpjbvb6fjQoIFmXGb+xjHt1u5eZvLcX6j8TJUwd9Q4WTwT4GUQ
 5WRoxChPSN5D/FmXdjIbXDQuTPKeQRqkvbgcdkXZvc3VvX4IS1hwtga5S5uVCZC13Aol741YFes
 VnQAJqoyg+hjqVwwYB3Cvk6VafGOFO5TxVRTICgyBmJidYI/YMAe8+4FfuRv0LMSfj38b3/me3h
 eEUvCAdEIBA8Nx33FuU0kiJW8GDjs5KVzcsu1+4O+v27rr68eIVvljEvjMsY3QibMDsDa/YSA5C
 yJ++PzL1Mj+/NzM7AQIh8cfq+jydH82Jf1BK0Zbhk7hdMOfQ1PPquFxGzS99jZPVcXyCHeNpLtZ
 HAkutEyOizoaj4T5+qIIeoAIPur2FaQS68WRKhrCw2PBLR3b7Bo/6lwr9c0Ihqpdr9k7DsAMwUc
 o1mgkT4i/YIED2yYAGw==
X-Proofpoint-ORIG-GUID: 5-yHhLNSyAGr1hA3w8g29YrG4V2yDVnh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190052



On 6/1/2026 5:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The PMIC schema restricts the standard 'temperature-sensor@' node name exclusively to the new MBG TM binding, causing false positive validation failures for standard-compliant legacy nodes.
> --
> 
> commit 1c6b45c4d32f87b04fb868a977041acc92be3854
> Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> dt-bindings: thermal: Add Qualcomm MBG thermal monitor support
>      
> This commit adds device tree bindings for the Qualcomm Master Bandgap (MBG)
> temperature alarm peripheral found on the PM8775 PMIC. It introduces a new
> schema for the MBG thermal monitor and maps it in the SPMI PMIC bindings.
> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -193,6 +193,10 @@ patternProperties:
>>       type: object
>>       $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
>>   
>> +  "^temperature-sensor@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/thermal/qcom-spmi-mbg-tm.yaml#
> 
> [Severity: Low]
> Does mapping this generic pattern exclusively to the MBG thermal monitor
> schema cause validation conflicts with other thermal sensors?
> 
> Since temperature-sensor is the standard generic node name, other thermal
> sensors under the PMIC (like qcom,spmi-temp-alarm) might use it. If a node
> uses temperature-sensor@a00 for a standard SPMI temp alarm, wouldn't it be
> evaluated solely against this MBG-specific schema and fail with a compatible
> string mismatch error?
> 
> Would it be better to structure this using a oneOf block to allow multiple
> applicable thermal bindings to share the standard node name?
> 

The reported case does not seem valid for this binding update.

temperature-sensor@... is intended for the MBG TM block 
(qcom-spmi-mbg-tm), while the existing SPMI temp-alarm block uses 
temp-alarm@... and its own binding (qcom,spmi-temp-alarm). So in 
practice they are distinct node names for distinct peripherals, and a 
normal temp-alarm node is
not expected to be described as temperature-sensor@....

Because of that, this should not cause a real conflict for standard PMIC 
DTS usage. A qcom,spmi-temp-alarm node named temperature-sensor@... 
would be a misnamed node rather than a valid legacy form we need to 
preserve.

Thanks,
Sachin
