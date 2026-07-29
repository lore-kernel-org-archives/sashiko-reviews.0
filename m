Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96CF38B7BC
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305328; cv=none; b=OuZqO9QYztXtbjKyZaYZkPOwHL53Ya8wuEiRXzjZY564k6K8Nvgk3y7S1afzsjJ63FS8OAIy+Cpim8/9wvzZA0hVR+cNAlzuLdPIhMwPnHDMWZ7cJJbL17KaAWPXEn8QYDCs++9zhU5XYO6Xz6czdfWnQMyleDAnBM9iyCUD1/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305328; c=relaxed/simple;
	bh=wCqd9p5zPYSsWUrCe1lujvwHeNUstBb6VeXADMunq5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQwqrgpJGKVxDh/J1wM0YfxYrwbJTruXtMKvoC37tldOPd7Lblyy0AnX4uzD12t3zbNOljObTSARebfY8egoiQ9Z0uyka0zFcWyahspgczf2Q78vhpdRYl6Pilob0qThE5kl7dtlEyEra9/4+7Kl1zLulKFDTDsQRyuvSxilBaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCDgWkGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp2Vsf1m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCDgWkGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp2Vsf1m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T5iiWS416938
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 06:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzehQwfIf3XW710S6XLQ6hiEA25o9knzXnXSh2cLZMg=; b=FCDgWkGQBAr/WSuE
	JOdvMTbf9TJ4fjT6O2tV9qmmnp6YWNeV0DIy6Nt4dJRuTeRIuVlwuXBmnbxh3gsB
	tmJ45JodcnClj6YSXS/cLREN7vD3gvl6IO5VesoNyzJWV75o6t123NtEkH+KfZW1
	jVaiLELp5oG1XEHvZ+k0sueo143RweQmTn88ziagIqcrfW1LJdXhCg89boUc79B9
	ecsOvc4POHvOhSXUBQOUUU4OIfSpPziBF5eWbz59WyQ526jc1urFFTV3g1RE1YBB
	4M1T2nlk0OxwydvbTHNGV3fyu17431P5Nz439gt12cwMzTQ493hWUVE4QVrcFhLw
	HwmVTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbn1r2fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 06:08:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso9150035ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 23:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785305325; x=1785910125; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzehQwfIf3XW710S6XLQ6hiEA25o9knzXnXSh2cLZMg=;
        b=Xp2Vsf1mEOCtAqABwo7SszOPkgYQgkTxbIzE7k/8nyTUtUqzM+RPhL6p1WhjmnDffh
         RV1FnHYO3csea7jJTubKuWMn+zvAHiBfRGuFsoDPoruO9foWuBy0g8KF9Y6u6ExAeceK
         4DMmSlGUYye/G/ZsqIk6qBjnZZmSjnh85eLkXwEpnJyGDyDx2qiX9doW+ZLZN3VyffDa
         8ESK3LZmVGSKBKvE384b32dkBY9M7ZbRtnxsqDEUAuMFy8KhOtk1rxJJjqQ3IAApUnzy
         KskC0zE4X8fD3rDBJYaxgDX3wEZNqAAkAlWB09C5tCy4bg5Tfn89RMjsjO6wzDS25ouJ
         FTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305325; x=1785910125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzehQwfIf3XW710S6XLQ6hiEA25o9knzXnXSh2cLZMg=;
        b=i1r9VnKMVFwcIvZWVcp5V2brKSBEUrq3JGY5gIK0bnELS6JxBCRyAPvwapum/z3GA1
         P4kzW1zIMHDBiUvAeM9FkL7WTyeRki0/Y8zDTXFbviS6vKz4P88UYXR4Pyh3FeIPCTLs
         lz1WpUDrLm5BbI/LV8dPPFI1Z1lasILKSPJgwmlJhqCayB8LAGwi6E+Qdg9eZCCPOOqn
         lO358PBQdsQL4+XT5MTtbbdjNwX85h2y8GDNNM0LZRaiRuRNsG1fZd/blNVovIXKfJJb
         DOHYKsSNDqZiwAxEREBNUanWwNZU9OSC48AZNKXnN8RTgqjNju7Q6DOsL0NpZWJVIpQq
         vQPQ==
X-Gm-Message-State: AOJu0Yz+os2xvloLTu+K2/pIoyhvqIreXT6zuEnm901dDYzVvTVfE8xh
	Gk1ZGRbpqnw1JKZwvVpytPOGIqzz55YTxQmVU0czLUGINrtOcpkJMEzPDGxsaR4h9se+t/XSQ92
	277/cL1pck/VG4hkah9+blCUrlLbJhhYbVb9geBhA0H7OneRE38GmDFrFkMGtsL+FcySqOFGV/z
	jPNtw=
X-Gm-Gg: AR+sD13Vwdap9kOXkuQPe4UmnB4Hr6MvQxj/CNkI2S2mj5GxPlDNDmJ3HycH84vkFxR
	6c4rP0vS3el4mLxt1eBNfygZCSUycz2F5qcbsJ450U7nZpk0cat7Ro9xDlSpkdip38yLdLDa4FV
	cjHmnUUvA6zIFpfMM+Q7fpt6wlbSjj8puTiTPe8ZMPoJv4mlVPO0H/cKjYsr2kWXlwVKH+lICUF
	AmraTm+Yq1URDnCoJMmchCwDiHFtA9AjzzxWQpNoHV17XIQgAIHpRUiEre5d3bZHmc9a6p78Imu
	3u6ZReTmw7IC12RLuco26RCNquOfvE+BwXtj1ZzY/hlnqXrsKfOukEVBEI+Cpk3opkRv/FB6Xk4
	LzIS0QbFfLe/q6v2RAp5McYywbNH6ymAG
X-Received: by 2002:a17:902:d2c6:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d015ae2738mr57214045ad.8.1785305325308;
        Tue, 28 Jul 2026 23:08:45 -0700 (PDT)
X-Received: by 2002:a17:902:d2c6:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2d015ae2738mr57213805ad.8.1785305324857;
        Tue, 28 Jul 2026 23:08:44 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c4090fsm5879185ad.80.2026.07.28.23.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 23:08:44 -0700 (PDT)
Message-ID: <82c8a214-8eaf-4ed7-91d9-2fa0012cd16e@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:38:41 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
 <20260728-adc5_gen3_dt-v4-4-355f0edece77@oss.qualcomm.com>
 <20260728162936.A77AA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260728162936.A77AA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA0NyBTYWx0ZWRfXyeKGKamjzsqk
 OIzJvr9CemzXWTo51hpwEZCx6C8OEZQNdbRYvT5gPie/YJfumwhVGgmo44s1j2SKRcNCAGwxxGz
 FWyLJ5sDnAFEQXfsXQfrZMlCYGO+tek=
X-Proofpoint-ORIG-GUID: R5I32LeYs2ZQikDWryZuAS44t1uyi5OA
X-Authority-Analysis: v=2.4 cv=csCrVV4i c=1 sm=1 tr=0 ts=6a6998ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hiWQV0orq5_vjTLQ2e0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA0NyBTYWx0ZWRfX4wQ1ggD0a6xU
 HcNDhcdp9aG4Q20W1EPjor7q3dVaoR/WdldCqUgXF0qfVx6rTl2YlZOyqsAncQHf0QrlWTASdgM
 IZu97rIGaE8osXUmO81XokKbc0cP50KRG4U7sTeQWfPPKrbYUInkDG0LKhXu+/jcuU6q2zZ1nHo
 1zYEk80rr2ASXohvr+dBVvCmecgHxDYwEkUGuFyvlkw0W7XYFV5RvyIobQXkaCo4lsPiO8Sl0TN
 0ABtvh2xofDOQkmY6v50xIR9FmN8Cf99Iva+TnmTbYVcYpnJ5nUo2qR4A7UBqhlyqAphG3urbsF
 4Olk918p1C3mrdaiSoTMXx8mxvKBaEbTw/DRPbNKewOH7D0ZzBnW5417HqTJJGvbnHTINAT6bCU
 V2c5AgdzajBWhq1Jwilpj6PDGOK2Qv+chcCnBqrFK5FTlHK8lVQIejl135zBC71vj/mm0bctT0/
 7AeU7ldnvLzWWAbr+8Q==
X-Proofpoint-GUID: R5I32LeYs2ZQikDWryZuAS44t1uyi5OA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290047

On 7/28/2026 9:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Mismatch between configured pinctrl pins and ADC AMUX channels for system thermistors.
> --
> 
> --- Patch [4]: [PATCH v4 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support ---
> commit abcfdfa0b33d2473870045c8d56652b236189ed1
> Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> arm64: dts: qcom: hamoa-pmics: Add ADC support
>     
> This commit adds ADC nodes and defines channels for die temperature, VPH power,
> and system thermistors for various PMICs on hamoa boards. It also wires up
> io-channels for the temp_alarm nodes to get temperature readings.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> index 6a31a0adf8be4..17d754d57e189 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> 
> [ ... ]
> 
>> @@ -277,6 +279,134 @@ pmk8550_pwm: pwm {
>>  
>>  			status = "disabled";
>>  		};
>> +
>> +		pmk8550_vadc: adc@9000 {
>> +			compatible = "qcom,spmi-adc5-gen3";
>> +			reg = <0x9000>, <0x9100>;
>> +			interrupts-extended = <&spmi_bus0 0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
>> +					      <&spmi_bus0 0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			#io-channel-cells = <1>;
>> +			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
>> +			pinctrl-names = "default";
> 
> [ ... ]
> 
>> +			channel@14a {
>> +				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +				label = "pm8550_gpio_01";
>> +				qcom,ratiometric;
>> +				qcom,hw-settle-time = <200>;
>> +				qcom,pre-scaling = <1 1>;
>> +			};
>> +
>> +			channel@14b {
>> +				reg = <ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
>> +				label = "pm8550_gpio_02";
>> +				qcom,ratiometric;
>> +				qcom,hw-settle-time = <200>;
>> +				qcom,pre-scaling = <1 1>;
>> +			};
> 
> [Severity: Medium]
> Is there a mismatch between the configured pinctrl pins and the ADC AMUX
> channels being read here?
> 
> The pinctrl explicitly configures GPIO3 and GPIO4 (sys_therm_0_gpio3 and
> sys_therm_1_gpio4) as analog inputs for the system thermistors. However, the
> channel definitions above use ADC5_GEN3_AMUX1_GPIO (GPIO1) and
> ADC5_GEN3_AMUX2_GPIO (GPIO2) with labels pm8550_gpio_01 and pm8550_gpio_02.

ADC5_GEN3_AMUX1_GPIO_100K_PU and ADC5_GEN3_AMUX2_GPIO_100K_PU are just ADC
channel names based on internal documentation, which may be connected to
different pins for different PMICs. For PM8550, the above channels are
connected to GPIOs 3 and 4.

Thanks,
Jishnu

> 
> Could this cause the ADC to read from unconfigured pins and return floating
> temperature values, while the actual thermistor pins remain unread?
> 
> [ ... ]
> 
>> @@ -301,6 +433,18 @@ pm8550_gpios: gpio@8800 {
>>  			#gpio-cells = <2>;
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>> +
>> +			sys_therm_0_gpio3: sys-therm-0-gpio3-state {
>> +				pins = "gpio3";
>> +				function = PMIC_GPIO_FUNC_NORMAL;
>> +				bias-high-impedance;
>> +			};
>> +
>> +			sys_therm_1_gpio4: sys-therm-1-gpio4-state {
>> +				pins = "gpio4";
>> +				function = PMIC_GPIO_FUNC_NORMAL;
>> +				bias-high-impedance;
>> +			};
>>  		};
> 

