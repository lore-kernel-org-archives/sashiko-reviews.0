Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172030C61B
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287773; cv=none; b=BgTvJgkp4nXZUqPHbnXTAcH6anQX0hoPPnHii4zQABWqzutRGUo49zHmsxq0CeBRIKAUJkZV5XUvlw97HWWtYYVruZUBN8LLtGeErm4b0Zralh9AJrCVl6k6hak3uXKdNC6Yrn1O2gNGyGJMJ9+dvIO2AzBPaCB0t30wqvaDgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287773; c=relaxed/simple;
	bh=U2yc0KcbhSZBDY/xYEY4BJ0bMe1yyN4EPBb8fIWxpbA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VDf7ZR//YbAMO4yb62lv2ksLvSA20R58f7tACNQ6BIYmokwyzIDKsLnzITEtXtQi+CPDqr9kzRBiNnEjeHSPgixIyOj0Tm/X5typkE9w+zQQWQV7JqXLMziwNXXpfnKf8vFjZWbuuxBfUaVQpyyQW5C0/W6VyQiBPlOMGfrPkuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6ItmrlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtetIGp9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6ItmrlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtetIGp9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCktJR1725708
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 14:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8D1RMRGTDklreIj360k58wLO9RFfoVV611CHARC27Ro=; b=N6ItmrlDHmFSOX09
	XlWAE0S2O8lB4mHWfLrDXEKxnJ61m5hUpB10GjuGYrsCWsqtIWdtuP6quhVrN9X7
	fmQ8r4KWkUrNRpZIQiG95iKT//2JtDtjbJtq5mOgZEywwghJ2ynHUGuA7pR7qBtF
	9ZAB+lG9m60kMs1z1khZPcm0je0eCRfsYSplonk8gd8EcL6XRiff0UaRMCHE3KZS
	g262Fa7xB7Nl7pUMsotS2reUsCP9nWO8dfov2gTIWycmFlQkc+9ANZVucC2taTTf
	l2mWc0b3pF6RxT6MYd17JQvfyUVvbxozX50IAKUn+PrUgrKXqgD3II/MPdOy9WPq
	OuZJBQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn6an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 14:36:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc8572552so8102099241.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287767; x=1779892567; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8D1RMRGTDklreIj360k58wLO9RFfoVV611CHARC27Ro=;
        b=EtetIGp9qbSM+Q7WV4kEok+qdutIPfVS2WgbbeJdYqLyNuJ1At1XJAKoJ2nT71JhSX
         9UhYASEfcXeuc/mjUMm/2mPKOC71B4jAl/a2kivfdGeLnqwUsUfd+dIBDnso4OSZ3FLj
         dV8mRyT0USNBwaX6uW7iBz/eCTKFe7SMP+9dq/PuHyfwwLsP6Ycq9eJfOkHMN3NuVE4b
         TuK9b89ocvjeltSdri2daMGbVwnySM1v5eD6Wt3bHrMsmlZu1ddqu8zvewecq4ZG2rTm
         U09Vw3fIGJ1ZGUHSa4L4d/BbJ046Zy3T/AfipEEHX6lME6Ok3vL6TiJYU6S5pkNQf7X3
         GZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287767; x=1779892567;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8D1RMRGTDklreIj360k58wLO9RFfoVV611CHARC27Ro=;
        b=mRi2+rsIoaS9S1rLDcyKdKV3dKZL7QFISyYDYVv3j1XNfapgcwjZ2inSMTzpUbkhnT
         WKmDwwqHtfI6IZFJPi/3vSoxDiUdQSQTyPk6ll1y68cTBz81Cpx+wjp4oQgEmGsputu2
         L3jB9jFgQfrEB9vZ2q7lfesBh66UZ35aTvDktczCfCBHNk8a0jhM3cBDgp4MTDveRjYw
         wsrDZjtJW7qKRcFmYjm1ORyLkKM+uoRr9rQirp5Glv89WLOimuvr8/2IvDtGSGRjmojI
         BLDTc2SX6LXo0AfqOvrlsthiu41IoZmIVWbriV+WI4jw/G6jEh6dg8SB2QHHW21sb13L
         Bw2A==
X-Gm-Message-State: AOJu0YyE8onwY1Tmw2OuAmX7qDnn12JEwY+y1gsAAlE4iXT+h40jmI0W
	yECIhzWyY7b+nZUTHteejPsX8y6ic/TSvsgoR53fF9rN4q1ujmU18VZAlPYOyqPSO6uYbGLAExn
	29LxSYiSgr0/nuYHH00/x3taoaqxHSE9w7YDO1BITdIovZQBof/rfAeI9KYsL69tvEGHefwoyef
	iY5ys=
X-Gm-Gg: Acq92OHOAF/flq42Yvf+mzPQYHdWlN/XbLnzFjrweq0qo7zdLTc3Ip8Yt9HUtXgeMP/
	RAEnk3AoluTCza85O/XJEufr0LYuaOiKf1D8Db42Atf/j90fyVYVAFf8g+wsGaPrZ5N4Ao32fd6
	Of36IF6+mu0HH9TNRTTm7mPOhKc2RVVd1Xuknl2HP5009JKQA1DtUuoz1al/13Rg0j6qPIPvnnz
	+eSiBz5Vd2NBRII2W46CN97OhhoKywxPy2+p+hfGv+TK3E/nN5w3HI1CT5XHpS8A9mbHlnJ4CJj
	ZE0ga6yWYLvcB8XdzlVk7f33ucTMNCrogd0aRtc6CoyANf1SPHCbOBaJpHRAfrKoHTjq605AltL
	3c2I0PiSOh42vUHpfcsahpxk7KMD0D7EBYpTeUj2tpjPWX3B6lxVVEqRX5Hs=
X-Received: by 2002:a05:6102:6e85:b0:606:49d:1861 with SMTP id ada2fe7eead31-63a3fb9d96cmr11783776137.27.1779287766627;
        Wed, 20 May 2026 07:36:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6e85:b0:606:49d:1861 with SMTP id ada2fe7eead31-63a3fb9d96cmr11783718137.27.1779287766047;
        Wed, 20 May 2026 07:36:06 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc46aab1a5sm3305396d6.7.2026.05.20.07.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 07:36:05 -0700 (PDT)
Message-ID: <a066fd7f-666a-4b83-84b5-1fce7cd0cccc@oss.qualcomm.com>
Date: Wed, 20 May 2026 20:06:02 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
 <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
 <2f490d31-07c6-435f-b96b-0857471c03bd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2f490d31-07c6-435f-b96b-0857471c03bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfX3LUXYj9tPTer
 A5WxAkapSB31V3+owySh6Czlzp5rbbRAdD4ratNYyCNL98E18gQDuQeQLAYOUwOoQH3PhYsyB39
 OPbxmB1PbUh8YoEg2Aatde4Dj9951gni8/oGVKUGvcFxQizLn0TO6Id4klvi3sbSTIfD+PQI2RQ
 0GPKsi/3Y0pwSeIQIM5M4q5+7f312jlB3LHxc89JGsaW7mhoeh8dQRXQcRqJ5LR3cQDv7uoE4A2
 pFkk6Lvj3Molvi9PHbxJhwv1mwDrXo1ZeqUzOPiNnbDu2WTtG1wVb/h0PUmzCyHgtEWpj+k2TfG
 jGNsjJuZOUfHGXULRILUbN1KiIFvKdCb8zvMRfeP9JXoC6GPtv9C+uzSG/xDZKls8VyGw+f+qpD
 8y4/EPhHfZ/qQXHk1bJn5J8O9vEejVcfG4cffrKdlJhFxkaJRgTve86F3CPA1DXt+et0Uk/XFz3
 EBYTDsjczuxB6W+1FzQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dc6d7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NYVHFnyteZdQxSc_kkUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 22lJN8Pc6D-68qrqjB6uztPRhAy3WTOA
X-Proofpoint-ORIG-GUID: 22lJN8Pc6D-68qrqjB6uztPRhAy3WTOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200141

On 5/19/2026 2:46 PM, Komal Bajaj wrote:
>
> On 5/14/2026 3:36 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [Low] The device tree binding example provides two interconnect 
>> paths, violating the `maxItems: 1` constraint inherited from 
>> `qcom,pas-common.yaml`.
>> -- 
>>
>> commit 6b248da80633195199f478d98724a0590dfdff63
>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS 
>> remoteprocs
>>
>> This commit documents the bindings for the CDSP, LPAICP and MPSS PAS on
>> the Shikra SoC.
>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml 
>>> b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>>> new file mode 100644
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> [ ... ]
>>
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> [ ... ]
>>
>>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>> +        clock-names = "xo";
>>> +
>>> +        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
>>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>>> +                        <&system_noc MASTER_CRYPTO_CORE0 
>>> RPM_ALWAYS_TAG
>>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
>> Will this cause a validation failure during make dt_binding_check?
>>
>> The qcom,pas-common.yaml schema, which is included earlier in this file
>> via a $ref, restricts the interconnects property to a maximum of 1 item.
>> However, the example block here provides two interconnect paths.
>
> This seems correct — interconnects constraint in qcom,pas-common.yaml 
> is currently set to maxItems: 1. I willl update it to maxItems: 2 to 
> accommodate SoCs that require two interconnect paths.

Revisited other Qualcomm platforms hosted in upstream, and it seems like 
we don't need explicit voting on system_noc from remoteproc (voting is 
already taken by scm).
So we can keep only one interconnect entry.

Thanks
Komal

>
> Thanks
> Komal
>
>>
>>> +
>>> +        power-domains = <&rpmpd RPMHPD_CX>;
>>> +        power-domain-names = "cx";
>

