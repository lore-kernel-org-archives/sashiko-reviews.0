Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5EF492502
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635801; cv=none; b=e1P+16R59JfZGDoSJpmpRzWrc1ReMbANbgOo0QR10SJ16mLjpVr5mNMwkbVifVEcwctzXzPdwouY65FOAqHOAXMVsmzUcma8KsWon5zTdYy5bJMWN5V+r62FA+1jrLw7rf3DXUWvBZr7dmYG6WDZ/nky2uBZP0F7Twh3f2UzLlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635801; c=relaxed/simple;
	bh=TkghKW34Ae8dhmgFODzqJ8yvhyMA95PTiN7gNbTbYLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbVnTTD9H8Uy7M7yoaInE+hp9Qq+QqzJ2u61FOxdgtLkaXD8zf8s5n/yBJiylamZ2qvbp7RoQvX110SVpo0epamZSkGRA76FuVMbBSxMYaVwCs3LFZpXrK7B+QuNDcJ+c3f33+3Uz2HqEpTUkpiLxoB0BSzprxPA7uOpN25ObQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWyaQxff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6DG2JgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWyaQxff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6DG2JgS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARPge945933
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2BKiv0V4rnOv6ApIBCWG/AnzLFZwDSjqmoDIXFVpxk=; b=nWyaQxffTKUPfive
	XVF72e7AFTNROIsgkiZVpxv82q2Zs3qXP+jUYoVR2HVlXGWiOKUrLAACE47DSPou
	KCit2eqmb1wczAyQ/o1L0VtUQhiipitUJY4+6zgdZAnqhxJ6SUF8jdimJeT7JYWX
	Fvh/IdEFWGD/byIG4cLrZn/OaYiQi/MedoLDOlT8LPyze2hsGFz3i+RDY4IMmRQ8
	/jCkj1Crfp6gAQQSVmYzn2OoRtzFYpc1J15qjpQuQ/CKENaAi36Hqzk+t82+M5Os
	QXQT7evtlJErPwSGCbWnyAkc0jtBZxQmgYoLeWZqVkhGvL/RqG79dnXJaUWY7NMw
	t5C3Bw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es27ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 12:09:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso2536695a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784635798; x=1785240598; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2BKiv0V4rnOv6ApIBCWG/AnzLFZwDSjqmoDIXFVpxk=;
        b=f6DG2JgSjlncSG1eGsOuRsbB+5dpAhIHSQS5Inial/PPD6gSdoxJ0hsoh8UdjkRbiT
         rP/y1JoA//vQYb5U7nmk1hgJSNfOg8Jo3Jso28ISjWAqeJcDV4jZOOL54wpvd1eBnTsQ
         4qYxpf++WXO8L3HtgsJYb1I4B8hUzR3Vp6wEIc9+xwgCgHjwmhiEkgHNj1hk21uzyYxA
         4Wti/6/NurXtJKZdBOJKMvP3p0eDOTuOnRp4KrXLwJ4LhjnJokceD0dslM8h/kX8XeOO
         aQ2c1yG3M1mEI4f8PKGbBieSajgDdPbLtv8BvkkMgcyf6zSflT0NbfwqQx9EqUz3pKrs
         y+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784635798; x=1785240598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q2BKiv0V4rnOv6ApIBCWG/AnzLFZwDSjqmoDIXFVpxk=;
        b=PahuxcS+2huhN4pKl7Gpi3XeKl19jxvsDt3ZPTHllkMpjca7hkyUa4YRecF1C879Dw
         mMHXycWfLe/IqBdmkcBc01VX0xZ4y3MCnh+HWU2tRfR8gNECCZiCGv23M7G/3fr9ZWxi
         PJcpbqE8WTD1Y4KfopSdsDc+3exdhaso8by5FXw27JCWeV8lZSGtB8G7bXZG4k524Kfj
         JmrppIs7rnioWMniGyWxBHBeYkoGXDYu28eLGg0DG9kTmVuzPPSYQjMOGclcQaHJCiw6
         AfwhM2neO0/2qxBnVxEe+VYv5Pwsv5ieH6gn6pSEktJTkX4/s0JvnvUyi1HUV4n94I55
         5Ikw==
X-Gm-Message-State: AOJu0YzeUkPJ3la0tZp9SL+TVZiz9JTCmYqwVQQUhweGoP5b7T2aipyk
	8aWsGzZevsVP1pD7LD3dzC9ZfHwshSTH2PnIaty0lhOI9wiHuYSFmTdWr3d+ru4o1iuedE5f6Am
	W+pXzyxLR5H8Yv7oxvLH/ngxy/rt4RVbphvKiF4UMUd7WKEb0dARm3JkK2Aoigusjw0XX4rnQVy
	6D6II=
X-Gm-Gg: AfdE7clXP+pI7ZZaPgrZo8yaVta8HBn76dOmX/n0YUGxUK8t8eoPNvZOkreFH4V8B8u
	h3Xm2PH+x9YtEoEAL2UGeChgs/6/KJ82tMD61vBi1icsRgd5VG+OPquG+jcJaiKSglX2m4o6vr1
	idyE7vaNpT/0gbLILLNU0i3PW5ulJ2wrrtzs1m1feae2GqsH4sBrO/QBYZEFtF0OF9w9kikZDdu
	lok3M2atf/9S0GMlKsSNVJhec91LSX1WNnjdrUiTlIjiK1VKlq5eZvEiSUykvjpVLRvMIVQY/Kf
	GnQeYlZA+prdB51JZwuR1s540gEMjNl4050IyMLlUPulLkrwYQzCJ2phVnC4rI+t7nVwVDxcr3Z
	ClOvNzROs/vFuJSK/ONP2Nh8nTYjCqgSSVg==
X-Received: by 2002:a05:6a20:4391:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3c3ad795734mr19450693637.9.1784635797945;
        Tue, 21 Jul 2026 05:09:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:4391:b0:3c3:9070:96bf with SMTP id adf61e73a8af0-3c3ad795734mr19450652637.9.1784635797316;
        Tue, 21 Jul 2026 05:09:57 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519ae8690sm5840485a12.16.2026.07.21.05.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:09:56 -0700 (PDT)
Message-ID: <f31eb279-a30e-4c90-b4f9-faa1637a14d3@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:39:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-3-monish.chunara@oss.qualcomm.com>
 <20260716144010.1DC4F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260716144010.1DC4F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f6196 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LlMWuZAxIuqBxL2dApUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: CLSDkEbDOF2rc7u3OKpgyQD9M2CrRqc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyOCBTYWx0ZWRfXxeC24bvEZjuW
 a1okSzR0e4tt5kdm/kPOph9INS6Fx6U5UAF7KYq5D27pAO2OWYNLqv2xfOzzFMXs7NAw6vqWcHo
 Bz9G2PqObCzhEeEl9nuvxuv0f00jv8vjRcbhh37KZOWx1zmr4evI/EEmqXKU61FVBXGtjqAltz4
 XATZjvavvg3h3L/X1/wRTYLBpdIfOlHCPBl8ulOsw+vjpXwB4/e/lbsFeNKBNtrLYWNlXbrrhBw
 +1ITP4puvPtLPfVb2FKGuMOo/UZovSh2Td9oB2HJbkctylLVQ+5d/46QBO8SgDczi5zsHY7CMum
 rZW9YkVDROlhzZNDBUOSN+0RHw1E8AMi5vFmMb5TeA1tnL5j1S6AHgD+qYAOXZXWlq+jPXexD0x
 Ble+sr4yE2m59mC82G2sQ8hHGnHGawWpDUOp2mHUPjuDtwUM8mWxB+bCFyhxpO1j+jwImVOzcf4
 CVLZ0TQ2IKR+4tOfz5A==
X-Proofpoint-ORIG-GUID: CLSDkEbDOF2rc7u3OKpgyQD9M2CrRqc5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyOCBTYWx0ZWRfX+UJseuqZlCAz
 EbEM7SsuuXYDlHLg5NRYeHjK6NYerRc4oMdHcTf7lFvHQ86bNdCuab/LG85i8OVuPPCgNn2lhlS
 LPtxDTmtLKoG0fHrxWaDO1vKDyUnv7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210128



On 7/16/2026 8:10 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Removal of eMMC configuration from base DT without a replacement overlay breaks eMMC users.
> - [High] Dummy `vmmc_sdc` regulator fails to control physical hardware power.
> - [Medium] The `no-1-8-v` property contradicts the 1.8V hardware regulator and renders added high-speed OPPs unreachable.
> - [Low] Board-level overlay improperly overrides SoC-level OPP voltage corners.
> - [Low] Adding a new 202MHz OPP without deleting the existing 200MHz OPP creates redundant entries.
> --
> 
> --- Patch [2]: [PATCH V4 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay ---
> commit 999af06615677bf3f3fbc5349952dd6ad0631932
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> 
> The monaco EVK board supports either eMMC or SD-card, but only one can
> be active at a time. Make the base monaco-evk.dtsi storage-agnostic by
> removing eMMC-specific configuration from it. Introduce an SD card overlay
> that enables the SD Host Controller Interface (SDHCI) for SD-based storage.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> [ ... ]
>> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
>> +
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> [ ... ]
>> -&sdhc_1 {
>> -	vmmc-supply = <&vreg_l8a>;
>> -	vqmmc-supply = <&vreg_s2s>;
>> -
>> -	no-sd;
>> -	no-sdio;
>> -	non-removable;
>> -
>> -	status = "okay";
>> -};
> 
> [Severity: High]
> The commit message mentions moving media selection to overlays, but only the
> SD card overlay is provided. Does this break default eMMC functionality for
> users of the base board?
> 
> Removing the eMMC configuration from the base device tree without providing a
> replacement eMMC overlay leaves eMMC users with no alternative, preventing
> the board from booting or functioning correctly if it depends on eMMC.
> 

eMMC configurations are added via separate overlay which is added as part
of patch 3/3 of the same series.

>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>> new file mode 100644
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>> @@ -0,0 +1,72 @@
> [ ... ]
>> +/ {
>> +        vmmc_sdc: regulator-mmc-sdc {
>> +                compatible = "regulator-fixed";
>> +
>> +                regulator-name = "vmmc_sdc";
>> +                regulator-min-microvolt = <2950000>;
>> +                regulator-max-microvolt = <2950000>;
>> +        };
> 
> [Severity: High]
> Will this dummy vmmc_sdc regulator fail to control the physical hardware power
> since it lacks a gpio or vin-supply property?
> 
> Without physical power control, the SD card might fail to power up or
> experience intermittent power loss if the physical shared rail drops during
> runtime PM.
> 
The regulator used for SD card vmmc supply is a direct fixed always-on
supply of 2.95 V. so no gpio / vin control is required.

>> +
>> +        vreg_sdc: regulator-sdc {
>> +		compatible = "regulator-gpio";
>> +
>> +		regulator-name = "vreg_sdc";
>> +		regulator-type = "voltage";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <2950000>;
>> +
>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
>> +		states = <1800000 1>, <2950000 0>;
>> +
>> +		startup-delay-us = <100>;
>> +        };
>> +};
>> +
>> +&sdhc_1 {
>> +	vmmc-supply = <&vmmc_sdc>;
>> +	vqmmc-supply = <&vreg_sdc>;
>> +
>> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
>> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	cap-sd-highspeed;
>> +	no-1-8-v;
> 
> [Severity: Medium]
> Could the no-1-8-v property be incorrect here?
> 
> It contradicts the 1.8V hardware regulator (vreg_sdc) configured above and
> prevents the MMC core from ever utilizing the high-speed UHS-I OPPs defined
> in this overlay.
> 
Current configuration only supports HS mode for SD card. UHS mode opp values
are supplied as per actual clocks plans which would be required for UHS mode
enablement further.

>> +
>> +	bus-width = <4>;
>> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
>> +	no-mmc;
>> +	no-sdio;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&sdhc1_opp_table {
>> +	opp-100000000 {
>> +		opp-hz = /bits/ 64 <100000000>;
>> +		required-opps = <&rpmhpd_opp_low_svs>;
>> +	};
> 
> [Severity: Low]
> Does this improperly override the SoC-level OPP voltage corners from a
> board-level overlay?
> 
> Operating Performance Points and their required voltage corners are typically
> fundamental properties of the SoC silicon, so modifying them here might be
> semantically incorrect and cause instability.

This overlay would only be applied for SD card use-case and these opp values
and corners are aligned for SD card scenario.

> 
>> +
>> +	opp-202000000 {
>> +		opp-hz = /bits/ 64 <202000000>;
>> +		required-opps = <&rpmhpd_opp_svs_l1>;
>> +	};
>> +};
> 
> [Severity: Low]
> When adding the 202MHz OPP, does the existing 200MHz OPP need to be explicitly
> removed with a /delete-node/ directive?
> 
> Leaving it intact could create redundant, overlapping entries for the same
> voltage corner when the overlay is parsed.
> 

Other entries can be kept intact. SD card use-case would only use these values
irrespective of other existing values.

Instead of introducing a new opp table, this table can be leveraged.

Thanks and Regards,
Monish
