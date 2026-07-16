Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C5438036
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212226; cv=none; b=RCC4q/ZxX6+Gg9dInPaHI26zkij7iyppFAWMY19tf5kKkkqWESx2jtatkCbX7oZfkCnmU3L5in9nqfhWg2gORLrrFaOPuyatGkbdOQzclyP5yvQYwYE0UrR8PPK40IL73KnODTxU0IWpsyXr3zvK4bbt8OH7aZROD18mS+eSzuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212226; c=relaxed/simple;
	bh=1VYCKCrAyEhpsBy/ENyJCD4sKWa/IVk24XytgZK6qb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwVHxAobk/g/Cc3EycbMx6aHiJWQmE/fUJxHKV67jC95+iMlLvNlSdErXGdxGOXGi67EcMiTbbK5p2XyXdzLkrb43SV/CIFgDZHWQz0C4kAbI9W7dr/9sw+n9sLazfJquDtvCIEFODaCSib3cwuewcRZgfjbh+WhXNROIMxIssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIy9tnhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIzwDQiO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIy9tnhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIzwDQiO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJgDs3043083
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgdrdr4wElfalXkygqDmbCVsaSzd4hqWwtTE1Q1Yb9A=; b=iIy9tnhj6Mslhz5E
	RRafDU9EzghUQladYzSkiSHTrnLC7MWI1wCGoIje7bt0zii6JknWtCCWnEi8McE5
	pGSZaVPI1Xhx6HJBNSc8XfB2LlVEGaAAlYvIjfICyrnav5kGu2FXfnBpPS5l/gMf
	vn1azsBn8y2W5dzaModRYpFfJW+kEs9BTO9LNB/SVV8OEo3KbtKk3RFmCkvDop9Y
	8IVd1g5phvIL7dOWEtfo9XJ5J6l7CFEpQPe0AFJjRThozer2JujBZuUmfdxThF/R
	VUHtFih1ZRFnI+B0J0AuiUqkBmRQG0pYS8DJ1xnUZl0CpdFPC9zBwIvMBT9JnefX
	Q55RFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1vns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:30:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce870a060so120376485ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212223; x=1784817023; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgdrdr4wElfalXkygqDmbCVsaSzd4hqWwtTE1Q1Yb9A=;
        b=LIzwDQiOD1qjHtmeOaf5kK/pITeB2HWEf1thsCv20rzpJT2ZI3lmKiNZe8teVZg6aw
         SSbBFpmh1AZOEE2JhLGX4clk16JQOAcxpr1TRtZ4jopyxllskXwpgXB2IesqnGDcWNgL
         wSktOqBXAPWn0Beq1IG7YkHPlmlnn/iyexh1GCxPNbcTGhavyFtw8IKigHrLTbsUsGxv
         d2X1m45kmAwdLTbhUh4o7qX8itiY9yzCI8IqEqDJisn/Xpl24PrPSIrtB6y+Wuna9TER
         k/S9/0l4az2pbh1UwGnmDzK7x+7n96HQoBQVioWG7kB8Q2Do9ajOrH1w3r0CHAfkSdXm
         PvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212223; x=1784817023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgdrdr4wElfalXkygqDmbCVsaSzd4hqWwtTE1Q1Yb9A=;
        b=cKsYUDTxFNd7uTKmidiHBQ9SgH26eEr+Az0OigKRxp8VjK/PLvp3lna5bzw4Fq3oUa
         iLwpsfx27w64J/+9nHwR0htK2B0ldjytoo6hBXwbpB2cfWj1uhU1Dc6g3eNJ1d7GXh1d
         vBjWyrwwR5q99OikDqPv3bWeUGZ1f0nx2CePG5blWTQruRLTkJMa4HtXz0NO3X2aC2ZA
         M5swjrKwkB45FPZYaBP0yCCCrN3Cw9curgcnGVGI5bXBr1ygTzAcbAqmh/DRtS+336sb
         9uqh35DCECzsZzJ2jK67Ol3B43QVigSPSJMdKBlJBONnfTi1RPU9O+QqO4DhAfCrUqo9
         UNNQ==
X-Gm-Message-State: AOJu0YyHpPPeGf1osUP+m85dJp2Go7MVdnkTIAI3VlcjxQSzl4PgzzvO
	yVZ6P5XkODFVREMxTuLz2uLdYD5BOOTi3Ubl8Q9gti4CQhGig6zndV+tKtOfZQmh4gHmCPv3/Og
	1aIv5EG6zmFausmOVHEnWM89I44coN9rDSzxxWDE6Fa+QkdHHnu7+tksfvVGm3jw1bBW1GQVPc9
	4uLRc=
X-Gm-Gg: AfdE7cnJG7/e7wL2f3tgvjvlXDzejZxA0ZDjBQpH5yHv6/+r+S/MKcM4EHvEkvCo5De
	zT3DipAsCQHvwpJBNuAUFSyBXShcvs6TSRjADQ2/gi8kCllLFnD0U+WPGZcAky95XI24/TDP0bT
	n5lfcYfvU+iiKblnZ7NjyZdlMsKCHn7tG2KWevw5QADS+UexqBvvuh04E/lBVjjd1CoU2V5vOWE
	qc+/htrs5iK4Xi8PYFke44WMgH9bpMDKMLcJlszsGzlg3ojG3gCQ+GmXuFTyCQSDFP4kAnp5psd
	+qdcJ1cHibKrBn2KkHabZuu1V0Dw/NNnkAwI0tKtFqku/aGBGfhLyxlWRO/2Mew5WYdus64d4eI
	P1VWqKDorjnSj+attq9n10AOve9fWcOaw
X-Received: by 2002:a17:903:f8c:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cef14b7f75mr102033115ad.41.1784212222705;
        Thu, 16 Jul 2026 07:30:22 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cef14b7f75mr102032485ad.41.1784212222185;
        Thu, 16 Jul 2026 07:30:22 -0700 (PDT)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e393bsm21100175ad.7.2026.07.16.07.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:30:21 -0700 (PDT)
Message-ID: <ab694e97-6e59-439c-967c-c2ec90019f96@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:00:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-4-monish.chunara@oss.qualcomm.com>
 <20260701082916.A892A1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260701082916.A892A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f5dBiByhuRXzJsL5VH8qnrIpnFXVxBui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXzB77Nloa8ijk
 qTqC+xBsBdW39CkMchd9xfIoJwGT7iXhIv/Oz1aoWs3chiq5N9tUyMVwEDyjwHtIrnckwaPhA7q
 V+tBxzmNlNcCSg3T0/S00a2cDCsihTHMnYD6Tqh1pDLeynFhrToqQde7mg4L41nF9GRJ2s7Ipdf
 PS9GKbtG6str9DsZaGIl9E0FgXVTNToaVWdg1tS6Bp1J7yc4pyMOuaJbrVJRlwvIQczy1lZrA2W
 7KNTXNj/P+BrI8gUgw393pp+CulNV13vc3KedJV1mOTEsz9us9enk2mopj5oRGCKUS8w9KzTwDb
 SCPpNi+nFJD5Luwn8Wxl7P8HQqoXZrh29XxDOi8kijeozVguAD7y40mQvdiwvbvsyLrljluHeAS
 +0LEXAi1p2QENLYhYXDB6kNGQ1nF+l36EZxpW6nD4aa7zogIrPrgg+Il2iS2rkfD2pfZ2bfpo+r
 yO9Evif3kjD/ki0J4Rw==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58eaff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xqg8VznY_0t-hhDNkJoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: f5dBiByhuRXzJsL5VH8qnrIpnFXVxBui
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXzPwkRyp49O6m
 HpPqdkb51Wf00LSBmEOEAEcUxUa9ie+zK1D5dzUkeuRV73+xKw9yiIEczRMdZ3iWGoXL6AgLN8l
 PsM0oIkEPaV14ocxV8kLJ9CjQEVcqyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160149



On 7/1/2026 1:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Duplicate regulator node creation and label shadowing in overlay.
> - [Low] Redundant device tree overlay duplicating base configuration.
> 
> Pre-existing issues:
> - [High] Conflicting device tree properties silently disable SD card functionality.
> --
> 
> commit c17f3092c8fef709ae2384b75b1582cdb37b5837
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
>     
> Enable the SDHCI controller for eMMC functionality on the Monaco EVK
> using a device tree overlay.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 0b60626369190..a341d6dab6150 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -71,6 +71,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
>>  monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
> 
> [Severity: High]
> This is a pre-existing issue, but does applying the monaco-evk-sd-card.dtso
> overlay break SD card functionality by conflicting with the base device tree?
> 
> The base device tree monaco-evk.dts defaults to eMMC and hardcodes no-sd and
> non-removable for sdhc_1.
> 
> The monaco-evk-sd-card.dtso overlay adds no-mmc and cd-gpios, but doesn't
> explicitly delete the base boolean properties using /delete-property/.
> 
> Because overlays don't overwrite or delete boolean properties without that
> directive, the merged node would retain both no-sd and no-mmc, which could
> completely disable media scanning.

Update in v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

> 
>>  dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
>>  
>> +monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
>> +
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
>> new file mode 100644
>> index 0000000000000..cb2566ac6923c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
>> @@ -0,0 +1,37 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/ {
>> +        vreg_s2s: regulator-vreg-s2s {
> 
> [Severity: Medium]
> Does this create a duplicate phantom node instead of merging with the intended
> base regulator?
> 
> The base device tree monaco-evk.dts defines a fixed regulator node named
> vreg-s2s. This overlay defines a new fixed regulator node named
> regulator-vreg-s2s and assigns it the same label vreg_s2s.
> 
> Because the node names differ, the dtc overlay compiler won't merge them.
> This could create a second phantom node at the root (/regulator-vreg-s2s).
> 
> Will local phandle references to <&vreg_s2s> in this overlay resolve to the
> new phantom node instead of generating a fixup to the correct base board
> regulator resource?

Updated in v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

> 
>> +                compatible = "regulator-fixed";
>> +                regulator-name = "regulator-s2s";
>> +
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +        };
>> +};
>> +
>> +&sdhc_1 {
> 
> [Severity: Low]
> Does this overlay duplicate properties that are already fully configured in
> the base device tree?
> 
> The base board DT monaco-evk.dts already sets up sdhc_1 for eMMC with
> properties such as no-sd, no-sdio, non-removable, vmmc-supply, and
> vqmmc-supply.
> 
> Since this overlay redefines all of these exact properties, does it offer new
> functionality beyond supports-cqe, or should the base board DT instead leave
> the controller unconfigured for media types so overlays can correctly apply
> the specific parameters?
> 

Yes, updated base board DT to be storage-agnostic in v4: 
https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

>> +	vmmc-supply = <&vreg_l8a>;
>> +	vqmmc-supply = <&vreg_s2s>;
>> +
>> +	supports-cqe;
>> +
>> +	pinctrl-0 = <&sdc1_state_on>;
>> +	pinctrl-1 = <&sdc1_state_off>;
>> +
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	non-removable;
>> +
>> +	bus-width = <8>;
>> +	no-sd;
>> +	no-sdio;
>> +
>> +	status = "okay";
>> +};
> 

Regards,
Monish
