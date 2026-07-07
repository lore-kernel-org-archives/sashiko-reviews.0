Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946141B361
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431084; cv=none; b=eAYWvc640j8mU6x9IOhKc/7TerOakIVQJgTIqwUDSCI/+n3R5+nGStbCw8NZYg/KPNmPT67zV8q+4yqMZWpcAzulCvVlQfYEG6AY3Z8Zmz656JIUU5n8m8cibyNnt2Llbs5G9Vs2LQCzFSETLyk6TfdnSCqIZqp/uAWyu8n/03U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431084; c=relaxed/simple;
	bh=M+ZrPoiW6rlYRXjSW1gpoBUCFx+W1q0N97Q00cc4x1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=li/A6wd4CZSlk8/HsK2/wreVvXMLlFOYAoqin0Eb1m6pp+CZCKIxqbZj5khF7Roe4ZnDnFX1CWjE2qzFJZIlNVwBD9MZw0WTm5Lr4Dv7oOzqzNwakSe9IOA25keBlH3nN++jhL0vpwxrmW7PJd9TWIBFFV4nk+M7Dw9k7IX+NZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN8s/Amn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpdGBOY2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN8s/Amn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpdGBOY2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9LXw3740874
	for <sashiko-reviews@lists.linux.dev>; Tue, 7 Jul 2026 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4AYMjNCcKL/iIFYSfunYwZHGVVPbQuKrOjygxjVtYs=; b=WN8s/Amn7HSYv6ix
	XxXG+U988E4Ibnqsw48cD4m7wz1B66Q73LbW4efotby8SmN32dTXy41j+rr8GKem
	fo3rLRpdOEyKSosgHiNro6mlo6VpGKHOqNeUAW5rcqNk5LoDh85h3bBbm/hSm3W6
	f8gkV+ULrvCiMQAPIvbjlFQ2pz03SC1Cl31yfJOUUS8UTmwQGASQo7e1ht5fSjQ/
	UNYIwXlgcsPPD5LyE02iGEMnx0YfBuyVDjxw+wyYZET0xQufGTQ9YaAYog3vwwb4
	4T7ISC/MpkCiXhdqncQ21NTLVpQSRUJpywZF2aK+ppGGn4NInW8C44latQGFxZRC
	79Vq9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9ny6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 13:31:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8465695b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431081; x=1784035881; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4AYMjNCcKL/iIFYSfunYwZHGVVPbQuKrOjygxjVtYs=;
        b=jpdGBOY2RuRuk4z6bTsFtcW0Wo7jCvdWZ/aak7+4PJ0EbmGVrybtXMYtS6M/TUavtK
         WB2WLkniBprp/Uv2Dyj3I0oKoTrP8SIOeXYHRKZeHVgCcSe+PBJ7zGa0jozdVEI0UIpa
         NZZYwbGcPNDrJoPhfRxqK2TKxx2fQ+1WuEW6OVZPIS7TN1JaOb6GT2RktB0VXdGFWOh0
         dKlUpHuPfuB5v0NXIbzfyHsruZFyp1CXwDsbhmTnHKMZEPlfhB/pRu3w4f0BIEN9JJ+9
         VOar4gLC91T9t1OfDsLZijoKHomfJ6Zd1hxLiRmWA30BHagunckKZNh6mlhvEtwzvvL6
         sCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431081; x=1784035881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4AYMjNCcKL/iIFYSfunYwZHGVVPbQuKrOjygxjVtYs=;
        b=lPY55XP6GicJm4roisC66T5zj02n0OqC45FlthXHriBj7YviTQ9U5Hkw/FLcfcyoxX
         aqZO+5lSKxiAEI7IzlnDprvkUjLoLFUpmd0dskS5oNdyRXuHYuNF6+B1fOydUhZEAIGM
         /MHiiAPUldJQ6B0dP6qcl1JnwP6l5T6Y/aMZ53clpIhMW4aWIWsh3+GmyKS5EAi0HsSZ
         2B9jUGUIqwVlyTM8ia/GHGtaNuX5BGe0M6UPKdQ/xKMXJ/xLaBPJOtsiZfXT4fgHAmti
         mH7pnRaZGUz+dp6oMqvU4oY2A3Wm/lo6V9hLL19RsZyFASM78Ek0hodJBFhk82boMPjU
         8H7Q==
X-Gm-Message-State: AOJu0Yzwpij91chz3izYu5oNKpgTFS7H5NJVSio3R89HNsnYtfbE743l
	G3b7uaNWMpUsHjIohdhk30gzcSJ3uBcEZE1BetZGAn+G9EZ5TIA1TcrNfaWHwM+9HIxoFeNdCCk
	RCfeL0EKGF+byTa9C7EjxZf307FS1id4vilHy2ZwgJfvJpdtmzwpdbJ8B6CpwqeaXjGwqsKw/Gc
	dPZwM=
X-Gm-Gg: AfdE7cmYqRAN5/Puw9Da+mnQ5MJrfptU8yW99E37C53rMVBdSwh1qJIRqWylun9wGuD
	ZT7H4l5buJbdpEJf12G6anXENCG2mX/d5TR46iCTphop9OcwpNKkrxypZOq8IC0s+DTK6J5sldo
	3oc9IvxPKDH5ZvTfmupyBA4KNDxSzURqEWI0g2B6FgJe2+k2q1WpRlBfTXBKgPu+MsoU5JXPDlW
	Ql+2i3JON25fl8j/hEUr0hD0Q5kQSzWS0eQAbDpZc1D1DX40uWLoNRqZFLmJgKGAu8JPC9pMURl
	9/cCBAthVaY5Nabu5YeZh6pQVjCzd5Cr0F6Yi5PLC4vTDhPFHA+EvUl84BuQK3HngZrYNMCpZP5
	QCJgB01AE8I6gaEzu8wPgtrCAzWixIGVRy8lMFQN08EU=
X-Received: by 2002:a05:6a00:2301:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-84826e13ba3mr5007837b3a.42.1783431081232;
        Tue, 07 Jul 2026 06:31:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2301:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-84826e13ba3mr5007745b3a.42.1783431080083;
        Tue, 07 Jul 2026 06:31:20 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96c0fsm5451255b3a.20.2026.07.07.06.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:31:19 -0700 (PDT)
Message-ID: <6e343fb1-5192-4a5d-b6d2-635f9adcfe9e@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:01:16 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
 <20260614081743.5E1141F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614081743.5E1141F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SmN0MGIHj95_Pi24RGU3atCaD7rlFPm9
X-Proofpoint-ORIG-GUID: SmN0MGIHj95_Pi24RGU3atCaD7rlFPm9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX+r87LIwSPOHS
 9jXIJ7+F3zYVtNf6YrJdU3bXLFg6UcLZ6sH42TvMQ+kI6eaT0bi6gdazBKFpZ6083W+HsPV9kNl
 dMYvfx3edE0b+FWapmmoxwZeDPqxLMw=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cffaa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wJasU89hPeDluGEzl60A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX75XCFrbSMoWP
 YwAeH926M+DzOsQrDmpOvd6c/v6r7ef+rsHstxPk7l8n1zV/meAgh86RyY0ZBWG3rIXRAcbgn0V
 D8fV95Cx9C1wiCpCQxE/BrxmMqIMc+ODWKvFKGvJR+J+h7pg1L4lzcxlNTdXkiHVlob+SXGr+So
 Z45IPxxeDFOlU1AOOiElHi9nlgCysoMBezks5z5YPoGHlBZMkQw4A3hrCnp0/9LP2d2riivevoR
 h0fWWlx0zX/Irxw2HoI2poiAFuCBmpEUueNcqZEyKpMDefs7AfRRtQDL2pXK4va2P1Bjduacr+0
 mrbi06M1JpBLqLD3jaqv6/GhULovfLa6sAeEPPMFUzp4PLL5kObYzWVpQGUGIdiDIRnOTimdP8V
 BciwWgXegPRsymrKVPQv6Ms0OxA3nj5s1ZOhGmpzN05I6zfM6Abrjb9HG+3Yt/uL23sDyGWiDfv
 tAZrJfdo/Fo4kyD0o4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

On 6/14/2026 1:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing Thermal Sensor Provider for VADC causing thermal zones to indefinitely defer
> - [Low] Devicetree Naming Violation: Underscore in node name
> --
> 
> commit 7b5021a0220835eeee60f0b85faf679ed9b09977
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: hamoa-pmics: Add ADC support
> 
> This commit adds the ADC node and defines channels for die temperature,
> VPH power, and system thermistors for PMK8550, PM8550VE*, and PMC8380*
> PMICs. It also defines several thermal zones corresponding to the off-PMIC
> system thermistors.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> index 6a31a0adf8be4..2e746ede850f8 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> [ ... ]
>> @@ -189,6 +191,90 @@ trip1 {
>>  				};
>>  			};
>>  		};
>> +
>> +		sys-0-thermal {
>> +			polling-delay-passive = <0>;
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> [ ... ]
>> @@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
>>  
>>  			status = "disabled";
>>  		};
>> +
>> +		pmk8550_vadc: adc@9000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x9000>, <0x9100>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#thermal-sensor-cells = <1>;
> 
> [Severity: Medium]
> Does the driver for pmk8550_vadc (qcom-spmi-adc5-gen3.c) actually register a
> thermal zone provider?
> 
> It looks like the driver currently registers IIO channels but delegates
> thermal monitor capabilities to an auxiliary device named adc5_tm_gen3,
> which currently has no driver in the kernel to bind to it.
> 
> Without a driver registering the thermal zones via
> devm_thermal_of_zone_register(), will the generic thermal framework
> indefinitely defer probing for these thermal zones, leaving the system
> thermistor monitoring uninitialized?

It is true that the auxiliary driver is not yet present in the code, so
the thermistor monitoring functionality would not work yet. The main
ADC driver functionality should still work.

I have this patch series for adding the auxiliary driver:
https://lore.kernel.org/all/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/.
I can make this DT series dependent on that one when pushing the next version.


> 
> [ ... ]
>> @@ -301,6 +525,18 @@ pm8550_gpios: gpio@8800 {
>>  			#gpio-cells = <2>;
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>> +
>> +			sys_therm_0_gpio3: sys-therm_0-gpio3-state {
> 
> [Severity: Low]
> This isn't a bug, but does this node name violate devicetree conventions?
> 
> Devicetree specifications strongly discourage underscores in node names,
> recommending hyphens instead. While the node label (sys_therm_0_gpio3)
> can use underscores, should the node name be sys-therm-0-gpio3-state?

I'll update the names to use hyphens instead of underscores.

Thanks,
Jishnu

> 
> The sibling node sys-therm-1-gpio4-state correctly uses hyphens. Leaving
> the underscore might trigger a node_name_chars warning in dtc when compiled
> with W=1.
> 
>> +				pins = "gpio3";
>> +				function = PMIC_GPIO_FUNC_NORMAL;
>> +				bias-high-impedance;
>> +			};
> 

