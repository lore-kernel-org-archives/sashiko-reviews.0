Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B147DFB3
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685269; cv=none; b=uuIoFbMEz9wuI2AGMcGplOXHlEZlLqRsjcIf4fRseGvTgyfweUwNnK7SU9V0zCug/AseKx1bYLGWR3Qbmtv+lgy8gcOlXrRu3ve7HlLQKhICZXTpBKgzhDyBUGHfjZWgb5rTSSfOrQW0c2cpTM73N9kiJMVu5mTLTDYmGcnIP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685269; c=relaxed/simple;
	bh=Xpe+7OwmMZuuj00e6mntMYVTzw2vd5zumxJHZHdvMNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ad4Kr9nRr77+VZjpwuWVMH3LEaHQx+zWRaNHLJoplQltEX2JtM7x7UxypI7HSX812lx+dbJWRTjlXSF+VqoUagI9zG/2dexHzbB0LT2VpTimplzwIq03z8Ye4JChtq5M5yXEOQI/Oxq38oyAI+P2K3GF2QQH79sFAr94966H66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2JhHYCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcXLsMqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2JhHYCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcXLsMqc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCArHr2965196
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 15:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=; b=M2JhHYCyn5lAOr3R
	n4UHLY03f7KpqCz0UFUF/L231DZ79ATU7TsN2F69dnFm/NzCBpYFW3YC+rT9tkvg
	eSTT2pp47Bq/1EtOWpJQ90jTS1/awM5ogZ/l6nX2x3G1m+8GAgqeEq9p1kS7KIsd
	7I/TzBorh2sE18uF+TWeq772WfVS4Uo0tnYC3MZl5LeN1qITI5xkD96R9o+LjNxf
	xNs+mu4Hfi/lARFJ29x+RmtqeXGO+IiOrwr4Y83qTDx/DPrC2OAw+pAWbpv3umIG
	+/TPZSvTCffuyKlZ14UHQtfDFfjuj3IKGqtREpHey4j90llAQgxHFSiQM4e0lG/4
	GNOfEQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5a0t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 15:14:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6314daf0053so2486382137.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778685266; x=1779290066; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=;
        b=TcXLsMqc35gMraJZGGf65YmT9pygxqo34pfwCh8ChC/S+V8gL8tIGiAMgrpPMCiufe
         pmcLPcB6U4hxHkDczu+zANr8VcIk6c/RCwu7n7fPaM0XUMQ8diroii0EsIvkgpiYPcDL
         8W1icaEAa7R8+Iq6VSw/Fs/2uFqRBzJx8twpSijeHyzL9i3Pz1K+SJML+H97Rv1ahhW2
         bVrDBjbXLZWMz7f5zisugzQrhe6tucOcd/FaTjrPUjyIDWnHlVnfBdFsT50KFb2UF8F2
         6WtkaLFneiZI0EBxN2Ul4j5S63ZcKtAgzzBgZLpfRHF9m9cCHy/LS5kzdPPvLQRwnDfh
         nLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685266; x=1779290066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO7Wlq2B2SPXIMNALx+ptMXqmAC5pdgtVTRF4xlMpRI=;
        b=srZvYdCEFUQDubF4qIxbSYaVE81WjoKhs5si0hEV4ljOo3XfeDtJiwbU1/g0dMsgQO
         g2t7/283j8b5f+IQqBm8gAxJh+Wt8GuPKcPI/g9FdChkNdZaifR/1K/3iYsu/QdXFSTn
         2xP5dmXCaoTEDWC1lqJciVL345ubjn/HXhYNFCVVsXyyqPx0TRUPCfMtTcmF9bqzYroI
         EIjFux1t3CZSRhUIiKStg7yhFUs+uUQKGEmf4e5eNK7r9HEvN8tKva/UVsE4e+HHaD4C
         coW3Q/Y2k6kYvN7SnbhTbCJjpxq+RFrHEUjQ9dUkpG1vFHPmYB89t3fGPpJ5xAPpGtnI
         bibw==
X-Gm-Message-State: AOJu0Yy0b2ApvDp2q9P2CaisbpcIEZYLU7qhrpFmmsbfZU0m4Ajr8Je3
	aZSYcaZLTWqp8MXpifpxnrhHSyuS+A3aJyEXzxgHU3fKSC/xtqvD0gKCfSWLTdYLZUVwNWyHfvP
	A7/EIbAwvHk/x3EMShtHcd01xYp6CJel6fNOls23qr2s3L+Ch8+m4BhK4ECAE7LnPe1TDOwE=
X-Gm-Gg: Acq92OH61nyqftZvODCjkeJTQ3jnD5/0B7xMkNtF4uBGHVVg2x/R5fl+jNmkUsjC3My
	1MhZIhBYbfFqyHXPSPbs18/cIA5822Vh9KxczHuHswaBBZFsszm1PbYxPgFmm9sYN8G6CXxXEQh
	7L39rLW5J0xwArzULUe6PC8hYMRLLpn8kx+QjVmdp9viw57hL1TweE9lsDPxN0vWMnWdhDNLodE
	QvK+CiZ5HzimdYV4tWGtc/ujnhihDmqw+2CLWAwGjkTfDiWsaIRfl1lld9V1jivZ/PAL8F4KC5q
	FDk22a1bimkt6JLb6g6Rg1bAbSIV8X4JrjF+IsXnJYc+1DC985vIQ8wP5JleGNl4hQpMPt9tMTr
	iaV+P8u0ubFh9Yh3trGmfZUaE6YCpAVPdO3KS7G8ZDhG6a/ffJDTpIye4kPpU2ccG2rSoUn+5Ij
	5pJt918zDEpyoXPb0+dgpPSih4Lb5v6hGzOheLScEP2WheoHscd0r4gmAFj/ly5w==
X-Received: by 2002:a05:6102:b10:b0:631:5ef5:8325 with SMTP id ada2fe7eead31-637a7973223mr1260308137.8.1778685264926;
        Wed, 13 May 2026 08:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:631:5ef5:8325 with SMTP id ada2fe7eead31-637a7973223mr1260208137.8.1778685264069;
        Wed, 13 May 2026 08:14:24 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95661aasm4088965e87.68.2026.05.13.08.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:14:21 -0700 (PDT)
Message-ID: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:14:20 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX4l3wCtO0Esu6
 2zFqcIfsxpTtWyEz9om9zCMGd0sIWqWnyedybRC9hO1m1dZaa+sxwaFfNd06gYAAurCJ4vDOuE1
 OUcmRidekBj5Oa9TMmYbHw+Of/n2yzlBHER3wpFsE2s0PJzZZbUXiYW2O2sOnjTxMYAosqlCsvB
 Uv9W1+tLUSNj5fleyMt6uVYPfRdNzUXqdLPoS9arUhjjqWFLcTg6Y7Gh6FgG142/jfxc3c0FeJx
 6SP/Tah1ZD1zO4D7BOsPNqTpJBMMGUl/8FqyHAb05aFERaNkpAswQbktuqWmXzYSK36RfP6eYel
 ZssTS7/Y9UpWcyOl3nq6Xb551GUHykq6oSE1tUtcWMdgw4O7lpC1Ne8Iit0Ke6h66300jHo2bQM
 5EULd0L8Gz+8dLKPHbKZf7aHyOHwnMYK4Du9F7Dg3iSSDziodbPJnvNd3GgN9WXlJVE20lEnnvD
 LPFBuB1FANjgdaZ4bDA==
X-Proofpoint-ORIG-GUID: rdUuWS05OZiOHHWZIO0jm0FlO1Qt9WP7
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049553 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G-sZjMlHS12s_U-QxDAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: rdUuWS05OZiOHHWZIO0jm0FlO1Qt9WP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130155

On 13/05/2026 17:29, Rakesh Kota wrote:
> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
>>> --
>>>
>>> commit 457abf6e7ac410430c866842e08e602ec3daaa51
>>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>
>>> arm64: dts: qcom: Add Shikra CQM SoM platform
>>>
>>> Add device tree include for the CQM variant of the Shikra System-on-Module.
>>> This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
>>> the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>>> new file mode 100644
>>>> index 0000000000000..401e71720519d
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>>> [ ... ]
>>>> +&rpm_requests {
>>>> +	regulators {
>>>> +		compatible = "qcom,rpm-pm2250-regulators";
>>>
>>> Since the commit message indicates this is a PM4125 PMIC, should the
>>> compatible string include a specific identifier for the actual hardware?
>>>
>>> Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
>>> the fallback allows the kernel to apply specific quirks if PM4125 errata
>>> are discovered later.
>>
>> This can be ignored. The compat is a leftover from the historically
>> incorrect naming.
>>
>>>
>>>> +
>>>> +		pm4125_s2: s2 {
>>>> +			regulator-min-microvolt = <1000000>;
>>>> +			regulator-max-microvolt = <1200000>;
>>>> +		};
>>>
>>> Do these regulators need to explicitly define their input supply dependencies
>>> such as vdd_s2-supply?
>>>
>>> Without these properties, the regulator framework might be unaware that the
>>> PMIC regulators draw power from upstream supplies.
>>>
>>> If the kernel dynamically manages the upstream supply and its reference count
>>> drops to zero, could it be disabled, causing an unexpected power loss for
>>> downstream components?
>>
>> And this is a correct comment. Please provide missing supplies.
>>
> As per the Qualcomm system design, the parent-child supply relationship
> is managed by the RPM firmware, not the Linux regulator framework. The
> RPM ensures the parent supply is never disabled until all subsystem
> votes are cleared.

How is this different from other, previous platforms?

-- 
With best wishes
Dmitry
