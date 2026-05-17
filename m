Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB5A2BEC52
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 18:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044106; cv=none; b=c1yn8XdVA/DNLme+Unn3XOSoRsaQT/VhXa7iBknRiJmuefaAGGFkMTlAHfD7qCdPdvJYX8WnqtqkoZwx0UEBZDPoBAk9kQ9+ObDbYNowkzmpB/u+l5hHg1aitBPkvQjAybbT9uwFya8KXWvU0IXZ+9HhA28iaPq9gkkWS6nG0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044106; c=relaxed/simple;
	bh=UM1+She3vV47eJLvWlxHmDcU7oUXlpVPDW5mtW7orS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIEhi1JWV53yxZac03v9NKpY/SeQx/8ovpj9hHeg9pTd/y415kQsJMYQvRNe7wfmtuu731492z0UeHCOHeG8eZCzqG7ooa59EBCDnda+g+kbmHDA71rAYTOj6e0MiWVkHJ6l6z+GASIuRgZUQPIkUREWA5d6ceepUUv2+s5kwCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdhC3kJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMQhGvPs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdhC3kJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMQhGvPs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GILfWO2575032
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 18:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvotslgmuBxMjV4vyIrw83t49BBKhTWX250EySC5IBU=; b=BdhC3kJZ8j191vgZ
	wXQhTlW4q879b1VEnlS0m6NYHU9Y8JvKhOekIBK/8/osCzUghd/GXNK2T/oYOBZp
	1WCO22orpCnV6aoAudY1KbOLSh8n9OQIqgby2BpV/ltpOb2DicKksNvUElWck0u8
	bH15I1sbH6fb9NqQsY9VxtYG/6dVnbof1UMuEU/MJAkNIy7m8An6mNSv+jM8NNub
	H4bo3uqngLmozCQD1T9WuUIyxBZiW6OsMEexS8J+U4uiQheO7l/j5/fvdYr5SfRe
	cFAjTKX3erdcpPunEz7Ec0NNCel/6KzS1g72Dkc7aIi73cnNulkWagZT7Le3SAoM
	lGMZJw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvyudx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 18:55:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c827bda2e60so638829a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779044104; x=1779648904; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvotslgmuBxMjV4vyIrw83t49BBKhTWX250EySC5IBU=;
        b=LMQhGvPsAKCI2B90xa+Ktz/akx89prIpigtfOcW7Fr628oZvllFrcOM3Ig7klUk5XJ
         S5EPTvxAd6kZPihzbmBSw41OU/Y5Zfb4lMF1lbASrXLDkK/B8OE7lS+SDBrTw/MMTG9c
         TPKQ6AwMnEIG8I52xUwHY/wFg7dxt2jeWt7Tw6YtKBUnCz9aNVy9x3Vkr5mEVWmwHUwz
         n0s5jGgMHokNeMmkigQxSCEMF4wN8ENXatI8O5OjpLPK+Bme0pW8Wy346qk6ybViJjX5
         yOr2Bbqn5MpgW9F6tXBKmPgQT+NUHtp7da9TEShwASDhxfFc+QNkkSQTayPp1gjka6p6
         VUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779044104; x=1779648904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvotslgmuBxMjV4vyIrw83t49BBKhTWX250EySC5IBU=;
        b=c80x3lytnHsi+WI9v3FXlG72CPqdj/10jIqyCco9+Fgu15he8/nrnDpR1BSNC2JqwJ
         sbyWMreMOxEuv9v68gnF1UjEibFhE3fXnrSyjtMMkxcq/M6vC6H5aHs4Zg0uxwyIqi+S
         dlVi9hCCfYnoXWKvHx/RHfSVH7TqyScIzxHsvF3O33VmSCiF8RE5xIfVZvsmxhlzkTX+
         kdt71ybBYgtYc38aXHvTvEDnEJCowVT0sKOnrZQS4g/98QbSpnHYQ/RFRiGDRPf/LjJg
         arsJyth7R2Gjw3piD5mwzOCBN9geWn67dA5S7loa+HJWVLbskoL+THrA4iCZSHtT60Re
         FBnw==
X-Gm-Message-State: AOJu0YxVx2C41+7Gmf8pP+Y7EomLDoH15kq8rVJ+DAI/VxUJhbVwNu3m
	vGYbqe2xUX6mdbqlrSGk7peLmi8yh3mijX3l/uczCDsNOy5UwPZ/PFjmBLtAbq/yAyP/+GLsQzP
	73ZAE/yg7KVOdJ0yKZKlqqfjfKjlchPgSHVsXsMb5S47jWoXTaeFp8sKgPUBKsUsq0H5zs7QxHN
	ZNYnU=
X-Gm-Gg: Acq92OH2PEcCqfOJkSh48wg1uKVOyQNns61FnFI1H7R8MUvAkWJtY7nzovlzncE+YOo
	ihYaiS15y3OTurqs2IAF25qmuEf80WpqC0zjE5RZGVq6USh9jVZMQTdgzYS60cdYiQDTWaDImIf
	wIItERovd2gOGIDRjmJ2NDFykagFIphACWolLoz1FfN/ep47CBnIwW6FqHEcu4J517/mBHoP8Pp
	x5yvsx6ZE28lvCL9FcCC7PNfnUUVsahmvumgDWG5AyspsWbPgYJ0d/TH5wfeXvM/xig2bGpxSP/
	pDQYryxcoi3RG+9uOpBSycwTU6ZvTzy064Y/2fRVwJSMGepamBDTxhFWwipSHNlNqikvNz8pLdZ
	ds9RhUu8pdCmot7QZ21hOxqyGRNXHpl4AMWPnXX0sHSXTurUwYhE=
X-Received: by 2002:a05:6a00:2793:b0:837:40f6:cb88 with SMTP id d2e1a72fcca58-83f33d39d8cmr11942504b3a.26.1779044103497;
        Sun, 17 May 2026 11:55:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:2793:b0:837:40f6:cb88 with SMTP id d2e1a72fcca58-83f33d39d8cmr11942486b3a.26.1779044102990;
        Sun, 17 May 2026 11:55:02 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.235.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663cfdsm14550673b3a.9.2026.05.17.11.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 11:55:02 -0700 (PDT)
Message-ID: <17e87f6e-fbd0-4787-aab9-d3a32de44887@oss.qualcomm.com>
Date: Mon, 18 May 2026 00:24:56 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org,
        vkoul@kernel.org
References: <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
 <20260513040623.03F36C2BCC7@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260513040623.03F36C2BCC7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDIwMyBTYWx0ZWRfX1TTh3dgot7Mi
 D7mR6cyZF/ZsHipnHAwUcZ5JS/9Hk+1DrG8/xVBev+goUhmcnYBAyUiLLs4trtRVGCZMTX1GCCc
 Rt1LmIbALTet3fdpepDnKLjKswnADPKvNFP2UxmS2M5+DU0hnc/pVfy2ud1rqZGsOwAeMX1Xbue
 1yaTpcDnaTLNkJ8SuTrcPvRjBxicdSMXesuslY5RFpbVgC9LyuVl2xmB7iaf5hZu3w2he7Y/TRa
 l8M8L+UgEN2pWftPaUeW1UnBvdazsW0JzzmBa4WQ9x+H5de4ekomJWnBb++rp71GSgWFKrCvDbF
 yxhoI226CrgU4KvCgMFsms4C1R0Rlr05PD0gGZD9lzXPupwiAMiWghi1hbgAbEGhf6H8xBqPjMe
 TS913pbnos4HlpllNAz/dVxIEIoibtcKEMXHUrXVXVU8kmdFZscRpRMy313he2CQFdPLPXaWgAd
 8BJegMZv7Uoc6Wb9KHw==
X-Proofpoint-ORIG-GUID: g_e_xz_VnWJR6GSTmK_eyie6Ir_ZaMP1
X-Proofpoint-GUID: g_e_xz_VnWJR6GSTmK_eyie6Ir_ZaMP1
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a0a0f08 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=g4/7f0GlZvY0MGcqtTB0Sw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Btu4tQq9WNLzPClb6kA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170203

On 5/13/2026 9:36 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Invalid PPI interrupt numbers (1, 2, 3, 0) are specified for the ARMv8 generic timer instead of the architecturally required numbers (13, 14, 11, 10).
> - [Medium] The `sdhc_1` node incorrectly uses RPMh interconnect tags (`QCOM_ICC_TAG_ALWAYS`, `QCOM_ICC_TAG_ACTIVE_ONLY`) on an RPM-based interconnect topology.
> - [Medium] The USB SuperSpeed wakeup interrupt (`ss_phy_irq`) directly references the GIC instead of routing through the MPM, breaking system wake-up from deep sleep.
> - [Low] The `sdhc_1` node uses the undeclared macro `RPMHPD_CX` for its `power-domains` property, which will cause a Device Tree compiler syntax error.
> --
>
> commit e2ee94ef3a5741f2cb9aae14dbef52c5f4a760f1
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Subject: arm64: dts: qcom: Introduce Shikra SoC base dtsi
>
> This commit adds initial device tree support for the Qualcomm Shikra SoC, an
> IoT-focused platform featuring a Cortex-A55 and Cortex-A78C cluster. It
> configures RPM-based power and clock management alongside various peripherals
> like USB, eMMC, and the generic timer.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> new file mode 100644
>> index 0000000000000..262c488add1ec
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> [ ... ]
>
>> +		sdhc_1: mmc@4744000 {
>> +			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
>> +
>> +			reg = <0x0 0x04744000 0x0 0x1000>,
>> +			      <0x0 0x04745000 0x0 0x1000>;
> [ ... ]
>
>> +			interconnects = <&system_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
>> +					&mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
>> +					<&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +					&config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> Since the Shikra SoC utilizes an RPM-based architecture, should this node use
> interconnect tags from qcom,rpm-icc.h (such as RPM_ALWAYS_TAG) instead?
> Passing RPMh interconnect tags from qcom,icc.h to an RPM interconnect provider
> might result in unhandled parameters or silent bandwidth request failures.
>
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +
>> +			power-domains = <&rpmpd RPMHPD_CX>;
> Does this power-domains assignment use an undeclared macro? RPMHPD_CX belongs
> to RPMh-based power domains, while this platform relies on RPMPD. This looks
> like it will cause a dtc syntax error during the build.
>
> [ ... ]
>
>> +		usb_1: usb@4e00000 {
>> +			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
>> +			reg = <0x0 0x04e00000 0x0 0xfc100>;
> [ ... ]
>
>> +			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
>> +					      <&intc GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "dwc_usb3",
>> +					  "pwr_event",
>> +					  "qusb2_phy",
>> +					  "hs_phy_irq",
>> +					  "ss_phy_irq";
> The mpm node correctly maps pin 12 to GIC SPI 422 for the DWC3 ss_phy_irq.
> Could routing this directly to the GIC here instead of hierarchically through
> the mpm (e.g., <&mpm 12 IRQ_TYPE_LEVEL_HIGH>) prevent the hardware from
> waking up from low-power states upon USB activity?
>
> [ ... ]
>
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +
>> +		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +	};
> Are these PPI interrupt numbers correct for the ARMv8 generic timer? The
> architecturally defined numbers are typically 13 for Secure, 14 for Non-secure,
> 11 for Virtual, and 10 for Hypervisor. Using invalid hardware IRQ lines here
> could prevent the kernel from receiving scheduler ticks and stall the boot.

PPI numbers (1/2/3/0) are correct for Shikra. It uses the same older 
Qualcomm GIC implementation as sm6115, sm6375, sm6125, and sdm630, which 
all use these timer PPI numbers.

Thanks
Komal

>
>> +};

