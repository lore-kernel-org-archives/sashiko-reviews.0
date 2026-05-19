Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AB047CC8E
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184192; cv=none; b=bRp8FC6eICmScQOf5hi6Nh0cEM4xkI/JdJxX7osYYMZa5e22Ip7QTRJWfrGIQ1naqxkciIIGkkhLp4g9N09C16dsjBdjehFWmp6KuC8NNzMmjMxrLtxOJV5HrQ/hl7nZYSOHhBmLgqb5qPoEJ0NA+gZlMypvOoLY7NrqimRtIWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184192; c=relaxed/simple;
	bh=IE6y29krFs7/CtIxj8/P8WU7kdj0mN1A0foV17+ef0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AznE322v3tsMfNW4LTx1+Jl9IwpTE5QIsBiGXcLW44VEoQA7CV+1NptD4HfJYeibTD6XchnEV/5/+d6/5xneflesd63N/0sG9OrmC2Fa8AIQBbavPaAYltUyyNijQtWOPNX0OTwc0qMfz0Gbj9tDonJGofs9zWzwEBiieYFjjgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pISHkWUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmAM7YJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pISHkWUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmAM7YJ6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4sXm2254340
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 09:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBtjktn/3wn6yr624wkAeDkkUIrRoZ3BsNhBAG45sVA=; b=pISHkWUPdBue0n01
	/v+xPTDZ3RzcD3gBuSSDVUfiqPAFV1mAwVVTMVv+NA1UGFoc3K5p2dYsLrBBMSx3
	mAHkdgFXdyTmcm6xHT6rJlill3+NJeOSyMJ9Q2iEI+oYtfUeZxrc6U4cUXv/EcF6
	FcbaZ84ZXlzestGVKPUzE7QMnSb4muh3vzj11lLKUBIdbO8PXnHUWRncbjM3co7U
	crJTGv3uS7A1hr0jpg8iQMBZKPj4cD+47SzyTasSSqZN0JALKP35+c0EgUp5u0lu
	c7lJMYpvUAXKq4cnSYHzpz7a+zFlvOs5zdtdKFyvip9r4Oxw2vWcHgIUcR8aStd1
	ezDbpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87s8rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 09:49:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b99eb06178so86563835ad.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779184189; x=1779788989; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBtjktn/3wn6yr624wkAeDkkUIrRoZ3BsNhBAG45sVA=;
        b=UmAM7YJ6yKoWmhl66MFIGU9RBIYm2DUo3tPjia2vDvvrhgOiB4UED9wHsCd2JAI+6L
         rrZBbV8+9HB7g0n6BUQposx9Q0QE6SKSS7C3W7iIF/+RRJnmiigRdbomSxjuCS7a2VFk
         qhwm7aQTn/XV6Ug4KVq79jbLzXyZmBrT4h9flGs+Im+isTUbIjoGuiJRKDQqz/wpNaIj
         Wv+i92hwspnJsL4cH0UfizzDYsDqHzWzejDiUe7zhPWbcAp08RJCMa9/VtRkK+otddPF
         92Ivm/gjjOaeLN3V1mIYQI59Rx7BtsfNeErBT5aS9O9ZVFt+q/17H/mpdiYSHQNmQWK7
         FX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184189; x=1779788989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBtjktn/3wn6yr624wkAeDkkUIrRoZ3BsNhBAG45sVA=;
        b=l/hqzSobsqH093xagSeGYq9GaFE8zzaX9bsno15mczDWuzvw6NIE3HctD51KKzAX2J
         SnxzvPT5n/vesfNlkyIf2xKmpNB1PM+AijNlIOTJs8Sfv9aXcQ9EhJ8YDMX+bFyGgR1I
         F7cELGtV6OyYgJmn5/FUHN5BrJokPfhTWNGJYjfOuLDGIft0HwoxQGTtBPE8atcODVQ0
         lJrIzVduXXCJgu8jpjxbIvrzdjV4TIqz1Q9npqn4ZO8t5GOOoiUCD7CjI0wsLhqz7qwQ
         CuxzeM6HhAAKSw26Ncto/Za6bb8Sr4xtMjuToV0QmZXLohNbooS5d8FunCMkhCC+OT5R
         HERQ==
X-Gm-Message-State: AOJu0YzWeq/WZo9OGUlnkEQ4q235dcpltS8R51XlWyMD/T7ToHsSnhxS
	a7OgznJCXXm3y4zOdBOJQLkZ4tUXhzE1Z3WUVRmCVaoNBTJieM87F2cchfDkheqFo9UF5tTA5bw
	UMHzRJuzy608AhCW076uVcvvuZKgHM01UIxGNNy+TvRT8yKkQaBM+AcW+GTuNt0xChhf3x+ipsC
	K7We4=
X-Gm-Gg: Acq92OGU87L0E0Ltrsp0ikUOebQg2oUaWdEn/7ILNu7r417DQJpHDiWU3ztVFQXXQ3v
	sNZ0+ZNdFbRyriFX+S5TeEH5EPGyZs//nXsFC87B7UpQ10epf9UXKrCyhZbMD99tt2HZVfNJxKE
	aO21tZfAHwUw2wP40cqFSIFIXDGGoPgr1sVKukLID4wIUuKpwGADo7NCTQ9MR7n74MOHGiYINYW
	tjjGCqG73gsSmBXUVQP9pLh8zXjDjdnC3PgQIBCvmh+drePptEKiWTg1Ur6+8WChLjVm+xmn4rk
	nQXAwdJ0wIm7nmgnsZ3P1VKjY5TteWr89fMXjskYhQq2v2KWSxmfqM85EYzEaoEd2Rxg0yjztZ1
	9+hJSIgKgWtWnmw+ZFvxh9vrd+gegGu2d6vCEHbIprKgHHwGMSRcm+VRVEgo=
X-Received: by 2002:a17:903:44cd:b0:2bd:6732:6817 with SMTP id d9443c01a7336-2bd7e8d3578mr136422985ad.23.1779184188789;
        Tue, 19 May 2026 02:49:48 -0700 (PDT)
X-Received: by 2002:a17:903:44cd:b0:2bd:6732:6817 with SMTP id d9443c01a7336-2bd7e8d3578mr136422675ad.23.1779184188242;
        Tue, 19 May 2026 02:49:48 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6b8fsm186570885ad.46.2026.05.19.02.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:49:47 -0700 (PDT)
Message-ID: <0f79dcff-0676-4e83-8f85-6345313f75d6@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:19:42 +0530
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
X-Proofpoint-GUID: NFHh8REaF2KuavP-jFZDwuZkOnL2TtqG
X-Proofpoint-ORIG-GUID: NFHh8REaF2KuavP-jFZDwuZkOnL2TtqG
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c323d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Btu4tQq9WNLzPClb6kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5NSBTYWx0ZWRfX85q6Ujz4ZOLn
 Z6pwJaG9BgxKJfebuxFiCWBQSbK138lm6/wDXtKxs5u806lCygkC5zR6HhuRSe/9unz779/z5Ef
 +1LvgfMEnEkENeSi+T73e3k6H5E4NBZqBjry5X2UVSkLJdh/JdfXQcj6px1k5iHst3/c90MIUCs
 r6SGsOmDxANKsfUqCN2dYiy0uNgzxUxg5l/y8PjePvDingfDah0cMzDv8TYpM01IZ5KuBprd6v6
 qOYTwXZwZy0Ip79SNwE7x2SbG6buL/9tehvwyd8VYwjfPrLLDKuLkbP3NtlmBLf9416QqZMCA4g
 vh91ouS8wh77OOnHQLSAcHptyn9sC+H/VECLvRGnKpCWQm5+ZsSwu5UTun5FQt/0KwGLMcg/oWq
 j/2qBnyLgx+nN0gVJNPIWtn7MswP9ILNQmFDhdVGr81RDXBN4ydTtX0oc0FrC52kNXt9IfN/f1w
 Vuximrj4uR4lNFdiTNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190095

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

ACK, macro to be updated as per the RPM header. Will update in next series.

>
>> +			interconnect-names = "sdhc-ddr",
>> +					     "cpu-sdhc";
>> +
>> +			power-domains = <&rpmpd RPMHPD_CX>;
> Does this power-domains assignment use an undeclared macro? RPMHPD_CX belongs
> to RPMh-based power domains, while this platform relies on RPMPD. This looks
> like it will cause a dtc syntax error during the build.

ACK, PD to be updated as per the available and compatible power-domain 
as per the architecture.

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

ACK, will update to use MPM for ss_phy_irq instead of direct GIC for usb.

Thanks
Komal

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
>
>> +};

