Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769219;
	b=4SqgzcMskxw7dTMDRzP6Yd6oCarHrETpzvwjOCQvkymybnUrLg//YcDSyOiOB1hDIdzf
	 HuXFFQ8wRsd1ank03+7mZRRvD17Oj0bpIwXbvZArgrPwPL1ldBYSJvFMgLmxynHvGCBJm
	 NnbOp8il+mHvkUZJy8lFjIaGz9O44KfDSOYNCWxw0G9STOtAHyUUyvzwkGkD+U8HB83oY
	 LcPNylaH2CCmm4kyIdBRr8A/Ja+VMVH7rcUQKDnPdqQJij6g8zOEVfXvKEkQ/bMBL4lVj
	 oV4kDdqWLg26d8rHEN4xNijwWVK/OEkBPBVY+Auxsa9u9FoB/dUGFCEumk4qlajsdcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
	b=ZOGUXjVqMUbXyQwb6TlBeQQiaijWox1f2NanTNOUeoZuOYTBlQ0WJ5ZYrfvbWaUrHoEz
	 urgVoC5KLNrqTspIKWZ7sClSaKXwLZkWh7Xuu35SZ1c4XN4cSz0Tb+K+oWg4N+uvBcyyv
	 E0n7MbHUQSid8pG1WuM5CjgpAp7JSFFsHgqS0/ZDAKU0JA21YudQhVZADefAFJf3f3SVv
	 PVDKGABhJF5NRtXburLZd5fDVh8/ZjZGQa1RnVK82LuY9epzOZK/+KgIQT5O/C1KkY5Sa
	 KmOpN4XuN8LYvOx3VEqB/txDgYV9xDtiP89NiZ+hL9ktkZgp9u73dWnxcuba2VNRR3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrV7kvBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/5Rvf08";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8D606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrV7kvBP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/5Rvf08
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Ggbx1475308
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=; b=mrV7kvBP9w1hd477
	3ATRoGsHdZgQo8zRAkW1QXkLcKfPktsCUShcN5r/iPdqAYH8H3GDhHmNlW68bDg5
	iVDtbjXbjVtySFsziNBdLro8A0WyvfTlZfrnXio9uOohgmHcbJANNvP2nJiHEEHb
	E6n2WMpEHfT4HLH0WKF4KUqeaBfXHhqerOUn/pfaNyDv9ySDd8wiPsFA6sPMBSD8
	txc96KEp8IZ1CFefkFb4AsGek2fw2shp8VmPkJr+jmxzS08NHSTdKJZJb8RwJsCJ
	rH2ROxsfEIOQ8UVG/MdUawvu8yErnHyEB92J6JzMOU62v3rRH3SoROGiuH3paPmZ
	0bQIvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4ht50g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:46:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so1228036385a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 00:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769217; x=1796374017; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
        b=L/5Rvf08r7u27WU7nirlWyhOeS9ToM1RSH364QCR4+G9KjXdmndSCyImCQUTnHk9CS
         VzXWGvpjc8LNCOJy9g35DxKoDDuzV+F2MbBYp8b6agYvE2ZQhfpLai3ebWJXvdRnabwl
         EoIkvyUAu+GCsLd7jYuctHr4mD030/VFeK6sONmypTr67JQ7PWPq94ryG/97WE2CMMom
         oKG1n/r/ZDHOuJ+fCevReAikA3sWpq0fuaHpNNKo9pSP31oJFdPrhZARRkwvlru6kR0q
         VAKKbRN9WTdPIDo8OF6TBhbi4Gs235E7+Q3zRLW71Gef+TirCMt6eIFn6f3cE8N6vZdD
         4VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769217; x=1796374017;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTHCsXSFBjLFbCqTrojc+ejUH1qFAVGfv0/urI9zmIM=;
        b=heSCgjpxBEesma1j9BSA5eb/kSnI+IDDp2xAtb1Vg26SeWqPAmM5kLITMv/laPwKzu
         v3g0BltgbFeSeHIDRSFwpvbcKTLzL7y2a3zxLIQ8cBSbxWbTGfvF43Whw/75Altv4L9R
         72XqWI07dLS3GUZCm8AEI9ySbYnsB5QlaDHmCREEqqEBBjCA755kVo65pQilQshmd3zO
         iYCzLTXfXFPdwSFUj/xBFkwlfbWHk/sOrfK7bqcfFu3QExycvLTSS1hZp/UejiaU2+cO
         /nimfGamB4FFC/5zJSCqHDlh6I/FFqgCLpGdWMYtyTEY4y0F8iYIKA0GrG6aqStm1CXV
         pClQ==
X-Gm-Message-State: APuU4Z+YpGU1pp/Injq7kdj4C5cSJuMglzHBJz9xUbPAv+NtwVsvp3l5
	529gfv6XiqMXuAhclnvPiHbSKbwZhkd8WcV/rNHCD9+SBiyZx3MD0dWSdNG5SyROCmMurubETLx
	duCxCGf7Nd7kz3CrlSmkrDBSeswMuMHgK23ilO7ebnT24uLAs5FFgm4TvTuboWQ1cMsKNvqBsmB
	PuUnU=
X-Gm-Gg: AZFdTZfG+ceG23muC3sawjnUDCog3cJRn/33Ccu7dAi22KugomfCKnmv/mPJbpjYDs/
	84+82k+PYTbidWxxSl9RzQ6aLqqD6gnOMtZFH0oZiTpGpbU/D7y58KD+h54oKGuny933kticzgQ
	Jh0UIda+TeRmA39g9w1SBArak04Fjzl5OIzzoIiUItQFaXEZRg7czLLB1UtLF+LyIzkEFWNseec
	/UcNTxWxLtQ3Yv6ZMpCNNUj1GQOl9oyWiTRrGJtRMDX3AaU/XLlW+9Ksdg9gm512u8yNQgWVPE5
	0V6ujRAkomxio0dk2KfFLnvG8lfHl5hXD2ouMSRyHlPU9AMmS37eFYBTyI40MqEis4nARKoJrvX
	504r6tiY3ltDXD3wlFJKblb23mCpRlXw9cUhSZU3Ys/3CTNaM83GtHeP6IO62Q2YarNO9CyTMM1
	Y0/Q==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4060254885a.49.1795769216915;
        Fri, 27 Nov 2026 00:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4060252985a.49.1795769216378;
        Fri, 27 Nov 2026 00:46:56 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm42897480f8f.18.2026.11.27.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:46:55 -0800 (PST)
Message-ID: <1f55126a-10c2-4ab8-a7d2-0511d9385733@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:46:54 +0000
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: glymur: add LPASS macros and RX/TX
 SoundWire
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261126183806.172485-2-srinivas.kandagatla@oss.qualcomm.com>
 <sashiko-outbox-236036@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-236036@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXwJzmwTRf9yxL
 H7CcyhwiK7UQ97HYQV54rqrxOQKvDcpwLgic8ZmGwHQI4HptAiPlkRdcyNEebaS0lvFWpzsS03l
 M0KgmH3ZGEIzOCwANPh+HH+ajOH/iFg=
X-Proofpoint-GUID: QqQoIKRcQEA655G7dSpQao7OFLo5MVEY
X-Proofpoint-ORIG-GUID: QqQoIKRcQEA655G7dSpQao7OFLo5MVEY
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b094382 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C1eMqFb1E5RMPDysGHcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXwiTNTjg+3dSL
 wpjqvdpW5ACQtR0RibsCFd6AhXEe92Kim3DVY3RHck32aIfyUCUYLKZZYayYujo+WI5GE4oDiiZ
 rfFdDOgudG6PDsSkYPRXrn/x4jshrc77cbyOvpw6JV2UadYqG95eVW1V9z4rO9K6OuPKd8kTUkQ
 VpVBNE/Hxy5Gf1hrXYRgp5kpS1M/doThruszK9PKNYHd/BG6pDFNioA7LmIsB/1X3+CD1jLBHz1
 gRehFd8475wd/vb9+jiAwvbexHAPiZ4ikBax2HvclOjrns12guuvurK9zItT4SCcNec8MUi4gyJ
 pOXCN7U2dyxUDbpCJNassUiGJY7PcJ7FzRQM0lBpSRrCjrBAiv3kynFu89GsKtLMsh4hBp/hm7b
 3bW+Scd6EjsRmxD+gyaPkImA9fI6Aw2IsYfIj++0AGfgNZENuypZFJQFgzIlnr0SMntHVexscU+
 ppEYefKl1KOEF6joGFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/26/26 6:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: qcom: glymur: missing qcom,glymur-lpasscc.h breaks
>   DTB build
> - [High] arm64: dts: qcom: glymur: unmatched lpasscc compatibles defer
>   swr1/swr2
> - [Low] arm64: dts: qcom: glymur: invalid qcom,ports-ch-mask property on
>   swr2
> - [Low] arm64: dts: qcom: glymur: undocumented macro compatibles and
>   node order
> --
> 
> commit b4bcd1d941eb74e432e52172d9eb6873d424ecc0
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
> 
> This commit adds the LPASS RX/TX macro codecs, LPASS audio clock
> controllers, and RX/TX SoundWire controller nodes to glymur.dtsi.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 165dfa11f17f5..e3bba14bf36c7 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> +#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
> 
> [Severity: High]
> Does dt-bindings/clock/qcom,glymur-lpasscc.h exist in the tree?  That
> header is missing (LPASS_AUDIO_SWR_RX_CGCR and LPASS_AUDIO_SWR_TX_CGCR are
> defined in dt-bindings/clock/qcom,sc8280xp-lpasscc.h), which breaks the
> DTB build for all Glymur and Mahua boards.  Also, this #include is placed

There is a dependeny of
https://lore.kernel.org/all/20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com/
patches that are acked, I will add that explicity in next version.

> out of alphabetical order after qcom,glymur-tcsr.h.
> 
>> @@ -4669,6 +4670,73 @@ q6prmcc: clock-controller {
>>  			};
>>  		};
>>  
>> +		lpass_rxmacro: codec@6a70000 {
>> +			compatible = "qcom,glymur-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
>> +			reg = <0 0x06a70000 0 0x1000>;
>> +			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		swr1: soundwire@6a80000 {
>> +			compatible = "qcom,soundwire-v3.1.0";
>> +			reg = <0 0x06a80000 0 0x10000>;
>> +			clocks = <&lpass_rxmacro>;
>> +			clock-names = "iface";
>> +			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>> +			label = "RX";
>> +
>> +			pinctrl-0 = <&rx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		lpass_txmacro: codec@6a90000 {
>> +			compatible = "qcom,glymur-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
>> +			reg = <0 0x06a90000 0 0x1000>;
>> +			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>> +				 <&lpass_vamacro>;
>> +			clock-names = "mclk",
>> +				      "macro",
>> +				      "dcodec",
>> +				      "fsgen";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "mclk";
>> +			#sound-dai-cells = <1>;
>> +		};
>> +
>> +		lpass_audiocc: clock-controller@6a94000 {
>> +			compatible = "qcom,glymur-lpassaudiocc";
>> +			reg = <0 0x06a94000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		lpasscc: clock-controller@7680000 {
>> +			compatible = "qcom,glymur-lpasscc";
>> +			reg = <0 0x07680000 0 0x10000>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
> 
> [Severity: High]
> Will lpass_audiocc and lpasscc ever bind to a driver without fallback
> compatibles such as "qcom,sc8280xp-lpassaudiocc" and
> "qcom,sc8280xp-lpasscc"?
> 
> Neither "qcom,glymur-lpassaudiocc" nor "qcom,glymur-lpasscc" is matched by
> drivers/clk/qcom/lpasscc-sc8280xp.c (or documented in
> Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml), so no
> reset controller is registered for either node.  When swr1 and swr2 probe
> with "qcom,soundwire-v3.1.0" (where sw_clk_gate_required is true),
> qcom_swrm_probe() calls devm_reset_control_get_optional_exclusive(dev,
> "swr_audio_cgcr"), and __fwnode_reset_control_get() returns -EPROBE_DEFER
> indefinitely because the resets phandles resolve to unbound provider
> nodes.
> 
>> @@ -4787,6 +4855,38 @@ lpass_vamacro: codec@7660000 {
>>  			#sound-dai-cells = <1>;
>>  		};
>>  
>> +		swr2: soundwire@7630000 {
>> +			compatible = "qcom,soundwire-v3.1.0";
>> +			reg = <0 0x07630000 0 0x10000>;
>> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&lpass_txmacro>;
>> +			clock-names = "iface";
>> +			label = "TX";
>> +
>> +			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
>> +			reset-names = "swr_audio_cgcr";
>> +
>> +			pinctrl-0 = <&tx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00 0x03 0x1f 0x1f 0 0 0 0 0 0>;
>> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00 0x00 0x00 0x0b 0 0 0 0 0 0>;
>> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff 0x00 0x00 0x0b 0 0 0 0 0 0>;
>> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x0f 0xff 0xff 0xff 0x0f 0x0f 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x01 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-lane-control =	/bits/ 8 <0xff 0x01 0x00 0x01 0xff 0x03 0x02 0x02 0xff 0xff 0xff 0xff 0xff 0xff>;
>> +			qcom,ports-ch-mask =		/bits/ 8 <0xff 0x01 0xff 0xff 0xff 0x03 0x01 0x03 0xff 0xff 0xff 0xff 0xff 0xff>;
> 
> [Severity: Low]
> Is qcom,ports-ch-mask a valid property for qcom,soundwire-v3.1.0?  It is
> not defined in Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
nope, we should remove it, will fix that in next spin.

--srini
> (which sets unevaluatedProperties: false) and is never parsed by

> drivers/soundwire/qcom.c.
> 
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			#sound-dai-cells = <1>;
>> +
>> +			status = "disabled";
>> +		};
> 
> [Severity: Low]
> Are "qcom,glymur-lpass-rx-macro" and "qcom,glymur-lpass-tx-macro"
> documented in Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> and qcom,lpass-tx-macro.yaml?  Neither compatible is in the bindings yet,
> which causes dtbs_check warnings.  Also, under /soc@0, lpasscc
> (clock-controller@7680000) is placed before soundwire@6c80000 and swr2
> (soundwire@7630000) is placed after codec@7660000, out of ascending
> unit-address order.
> 

