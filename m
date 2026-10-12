Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7427F3B0AFB
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786597; cv=none; b=Gvg9HuT1daFVKP/KEB3nSFgHRZtFwnRFiJt+vV4j+eTbvSESqACV40uLEc7e6uTd7IsGeuR38dfeOYjygRW8iMZX2QDo+k0uu93c9yMJ6WNgnjPVu/aV0UUC8zOr5EXjPgHeFrkCy8Yq+TCddwMDqNJ4F54Pdi7Zci6ULBUGLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786597; c=relaxed/simple;
	bh=TsCwhXKZ2GO3pO/mSGi0kdtxv8LXj8Rl8G7QIr19TPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgmEq5tM1NTdxlY0V/v89DmaEYbkBRhHnc7ex+3w8pkUTD/5zb0L4fVV19rQv3Pcftryw8ZQelrBA/DJPjBcmZmPjVFgevm1Ap2d2stRIcBZYxLiJMg1KyiPGlTkduJuCupbjF+hDLhnowInHuF/G8Y1oJFZarXbaJiz4WwG5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm2ehx/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQ73JDsv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm2ehx/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQ73JDsv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5YA321216094
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32sCp0/+JfKWU452Fl5U2ZWV0DPqoEuY+oD6hzQ6bN4=; b=Mm2ehx/VMYyJthDC
	xTim3UD7xbJRu/8AsQmHyxVvPwhugZJkRM6090TRBkWNu0Z4T4D3YmFV19ndPUmf
	jv7WiFa/Np8LrhjQH6FluGQwgAyBRfbs6+ym28U12IS1kcgVpBgow/Zq+gG7PJCg
	zc4vFG4RWk/IQiK19ZqUTieoR7tGwr8aRrN/sT+TEpBWZcgAKVqsc76ZXA9OoL0J
	Iz6QdQPVDkqf9D2+dwQBIaaRsln+d0v4qN7PyfoM2mfEhNwCt8K8haulIRhGCHsM
	AqlmqTaLtDJIV4CLkZ6+I8ieiMfK+QkBnMEftDPpTaEh3g1Yu2gOFSVddx7iwVnL
	dss/EQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu08bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:29:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so1167710a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 23:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791786593; x=1792391393; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32sCp0/+JfKWU452Fl5U2ZWV0DPqoEuY+oD6hzQ6bN4=;
        b=gQ73JDsvtbfumkwdweg6py6HT7vQbUuolxLXFyWMva8L7bZ8qkDeNSlyGp6KAVLL/A
         OIi1sQP2o8wCN6bZHNVQso2UlTzXTB8K7+hEbbbgT+bEB+f9aGSjZZVstOhys6J9pJw6
         LM4MmWErvbSAmLqJA9HH71dVHvLoUu2snWA2eMEvmDu0/fBn2mchaAfO29mdts3H+p+/
         w6tXkmP4d91u4r96gyXWRY/IUE5uXL2/4k0/r0YhyUgRVPVLFShe6vsNCCr0MpN8iCfL
         WTphp4ny3fDjIQQReSltj7EwYwyT//+4uRFFWPEGWdVDY4BINod8wzWoB71JMP8k6jQZ
         XJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786593; x=1792391393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32sCp0/+JfKWU452Fl5U2ZWV0DPqoEuY+oD6hzQ6bN4=;
        b=g9I5luB67zmHy1e7UwtodnCvbMxdwpfI0oCHBwy5Cyet9XrACzd548vBHABkl0HcjQ
         WsHW58uOdUFxcU+g7+8SQ2LsdiZPLT5Llhq5Ai94gR9/wq2Q5T8nx0x1azXZ7820wpjs
         zoSciPJXeNcDncoagztZv1cmNjI4TlwgvzxO4NdvWH+bao539B9wLWCIJPidB2CsD0Zd
         BJcPTjARAEkn+2sl7MKXdLeyntTHbwDI08fm/uot/ytW2cMvmzb/iMEPv5e2TbHaCOXg
         pQ7ZHgGg0dWE5n6bna4umVW+qm9rpvuqADMm0jfJ4/tb/LpdXm6uvuAOdopo2uzBErAl
         mzGg==
X-Gm-Message-State: AFq9FYJzRJdUDgPCAeBofUxoIN9LXk/DyMSpqaJyWUOfjPb4/C/afW40
	UMJq6qE4toHTgUSIGLXxGX7blLhO8EFuY3mGmQXb87UrMQpWVLBkurjkUmWY+m2LaR1IKVXVcvZ
	qss9tnG/w6ITQdsQoUaFq5sihrpCKG8J8wvKjJ/prk/5CqVSWumjYdYd55bZXk01CDwg5137Vf3
	ZNHg4=
X-Gm-Gg: AYBFou2lATezm+wX/kpiZQI/7+A1eV2i2pCFtpH+RMIyTgnb+Lz/GRe97d7Oe/likIz
	oZN+nfpkqn6Qmo8TijZmaG+g6cmAlOwKv82oZXbgjLLim979AP39O0cVmulgXlQbDwSqQSk1Xal
	iTEdL9SuRMWLkNZB3t/lMDhXJe+cYZKUMy47W5D7IGDKiHYoGZF32s4n1NgjdPn3P0Um+KS+S7c
	8r4YpKL2dHkLWq3cZ6pOKZ2+JPufjyldxVgAkM6LiKAyctNP+NmOnlF7zzt6dSKCMVpS2DZyFq9
	tjfV2FQGhZvBBZze7r/yjBdtpsOAPIQxu7JJ0sqe+fTHzuaTb0/600i8PcyeyW/Vc0XMKypYNtl
	jQGrk1NotfONbTqBuUKi0NmMbwvg=
X-Received: by 2002:a17:90b:4b05:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ab3a912292mr7453648a91.19.1791786593247;
        Sun, 11 Oct 2026 23:29:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4b05:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ab3a912292mr7453629a91.19.1791786592352;
        Sun, 11 Oct 2026 23:29:52 -0700 (PDT)
Received: from [10.239.132.75] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm3904383a12.24.2026.10.11.23.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:29:51 -0700 (PDT)
Message-ID: <bfea9e24-3fd1-46a2-aba9-39f96c79b594@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:29:48 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Introduce Maili SoC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
 <20260929-maili-dts-v2-3-965688646c4b@oss.qualcomm.com>
 <20260930064926.551261F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260930064926.551261F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc7e62 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nOADZSty9FOdcpvnO0wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNSBTYWx0ZWRfX4ta9I9RF03yn
 dj2vSqNhrgbPX7zGhCswlyomogYVbsd2QCm16N38hbBkHAvJy4HiJQPnwUiNu7eBxjJcsyb70mj
 WLBNj+911fwJSv/nueA8Sk7ywv7lAGKbGh8GPosGcjf0uzsA8il5DvP92aTZeqpU9CAuAS3Y87a
 PcZzgbYQ2aaDlL5gPIAAWIlXx+qPDQudXxRUyyfwdFZ1TPlQ03fJqbmsLfxJm1px2LWHIAw5+5a
 RwztX5+5pTvgqEgBWc24ZUN3g0287jXwccXApTJvdNqewB4qr/kI9EIbhuSA8YNJpI9BJmMB1XK
 bmJbSyaCY2eWVcmIiHjOV/lhdMl/pxJXbvIKYwQLrrHCUXBsnITCYnpX5l+Y/ikJIpHK4yFWMiM
 wXfHeJCnIAIkP7JCXPIEktXj1Wf+ygM8QfLMvjxvLIIg7YGeR3AHLWfdjM/oGwoSRz+LYgDk4SH
 z9zD5n7VYJCp4HdBIYQ==
X-Proofpoint-ORIG-GUID: oyxfdjvBmKjdi4bKhBeeE-G11bfxBW8W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNSBTYWx0ZWRfX7CJeiBDTKak+
 huSGjdSFuWIDRenZm++PUntkExqsBcGlexIIqSlNyMRTE5rBAjFPQ49pudOUomoEojxFv73P0LO
 Rea+E6Nx5gJc8VzadDBLiZgybEWAqSM=
X-Proofpoint-GUID: oyxfdjvBmKjdi4bKhBeeE-G11bfxBW8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120025



On 9/30/2026 2:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] arm64: dts: qcom: maili: pcie1_opp_table defines x2 OPPs for an x1 PHY
> - [Medium] arm64: dts: qcom: maili: impossible QUP pinmux function definitions
> - [Medium] arm64: dts: qcom: maili: gpi_dma channel masks exclude requested QUPv3 channels
> --
> 
> commit a14e352543affb0d0357fd40cb50b296dee6d5e7
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> arm64: dts: qcom: Introduce Maili SoC
> 
> This commit introduces the Maili Snapdragon SoC device tree. It includes
> various features such as CPUs with PSCI, PCIe, QUPv3 serial engines, UFS,
> and GPI DMA.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
>> new file mode 100644
>> index 0000000000000..c420b709cc7de
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
> [ ... ]
>> +		gpi_dma1: dma-controller@a00000 {
>> +			compatible = "qcom,maili-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> [ ... ]
>> +			dma-channels = <16>;
>> +			dma-channel-mask = <0x7f>;
> 
> [Severity: Medium]
> Does this channel mask intentionally exclude channel 7? The mask <0x7f> enables
> channels 0 through 6, but later in the file i2c7 and spi7 explicitly request
> channel 7 from gpi_dma1. This could cause the DMA controller to reject the
> channel allocation during boot when QUP drivers probe.

For I2C7/SPI7, its not the dma channel 7 or related of it. here it is for QUP SE instance number.

> 
> [ ... ]
>> +		gpi_dma3: dma-controller@1900000 {
>> +			compatible = "qcom,maili-gpi-dma", "qcom,sm6350-gpi-dma";
>> +			reg = <0x0 0x01900000 0x0 0x60000>;
> [ ... ]
>> +			dma-channels = <12>;
>> +			dma-channel-mask = <0x1f>;
> 
> [Severity: Medium]
> Similarly, does this dma-channel-mask exclude channel 5? The mask <0x1f>
> only covers channels 0 through 4, but i2c18 and spi18 explicitly request
> channel 5 from gpi_dma3. This will cause DMA initialization to fail for those
> serial engines.
> 

ditto

> [ ... ]
>> +		pcie1: pcie@1c18000 {
> [ ... ]
>> +			pcie1_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
> [ ... ]
>> +				/* 8.0 GT/s x2 */
>> +				opp-16000000-3 {
>> +					opp-hz = /bits/ 64 <16000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <1969000 1>;
>> +					opp-level = <3>;
>> +				};

will fix

> 
> [Severity: Medium]
> Is it correct to define x2 (2-lane) operating points for pcie1_opp_table?
> Later in the file, the PHY is explicitly declared as a 1-lane PHY
> (qcom,maili-qmp-gen4x1-pcie-phy). Attempting to scale to these impossible
> states could cause mismatched bandwidth expectations or incorrect power
> scaling votes in the OPP framework when parsed during runtime.
> 
> [ ... ]
>> +			qup_uart12_default: qup-uart12-default-state {
>> +				/* TX, RX */
>> +				pins = "gpio208", "gpio209";
>> +				function = "qup2_se4_23";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> [Severity: Medium]
> Can these pins actually use the _23 function? These pins appear to be wired
> to the _01 lanes, as qup_i2c12_data_clk uses qup2_se4_01 for the same pins.
> Assigning an incorrect mux function here will cause UART initialization to
> fail or silently misroute signals when the pinctrl states are applied.
> 
> [ ... ]

static const char *const qup2_se4_23_groups[] = {
         "gpio208", "gpio209",
};

function is right

>> +			qup_uart22_default: qup-uart22-default-state {
>> +				/* TX, RX */
>> +				pins = "gpio121", "gpio98";
>> +				function = "qup4_se3_23";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> [Severity: Medium]
> Are these the correct pins for this UART? This pairs mismatched pins
> (gpio121 with gpio98) while asserting the _23 function. This directly
> conflicts with the corresponding I2C node which uses gpio121 and gpio84
> for qup4_se3_01. This structural misconfiguration will prevent successful
> UART initialization.
> 
> [ ... ]

static const char *const qup4_se3_23_groups[] = {
         "gpio84", "gpio121",
};

static const char *const qup4_se3_l3_groups[] = {
         "gpio98",
};

gpio98 belongs to qup4_se3_l3, will fix.

>> +			qup_uart23_default: qup-uart23-default-state {
>> +				/* TX, RX */
>> +				pins = "gpio161", "gpio162";
>> +				function = "qup4_se4_23";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
>> +			};
> 
> [Severity: Medium]
> Does this function assignment match the hardware? Like qup_uart12_default,
> it assigns the _23 mux function to pins used for TX/RX that are wired to
> _01 lanes.
> 

static const char *const qup4_se4_23_groups[] = {
         "gpio161", "gpio162",
};

function is right.


Thanks,
Jingyi
