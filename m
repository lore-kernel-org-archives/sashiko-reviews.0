Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335443783AE
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634998; cv=none; b=bF1lvecuxwyFwwa9r7TrpwNiBNvXSvG6tK+iSIs6iJu9PjR6VpwdI2MiSXN7xT52WPSENhYSZ22aWMXaiF2GJrAYfRvWNgVOY+BpVW9+NpSc2ybmEvtNn50fwe4aPAzWR/V+Noi5Omn0QazsmTqYBaTjCL9nC+WF0N2W3xsAsVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634998; c=relaxed/simple;
	bh=R68RRkCspHOR45G3uHhtVWDRAuvS6WIpOzyJNjoxHmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWB1ON2cmoUAmj1u6KuO/Kx7RQhpbzo7w2Hkr7wG4e8RaJh++W0xD83WYXHrSgQusfn1OmTUSNSSgjE+6A+JwK4vltkABTMI4KaFNXF/ZmNiC8sDfgqBz8RO+li80aRDxGH9jLQwfuWHhYgQFMLSmDouoxdarr1kDwCwaK+5vbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JegtUk3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAKUZqnE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JegtUk3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAKUZqnE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARuDp1252094
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NeSpfykxd+JnV2juYOjpzOXSoEdtYw7VOCfogOzWOBw=; b=JegtUk3x+zMO1TSg
	KzS7WnuI/cYcUE8VMN8Tx80+i25Aou1qvwtNJ4VO9lArIr9TxRJw3MSL/J+g0VOz
	xUxmzjP8Hax1x2wMwRD2UY9izY3q4dyAFmjWxtC0J/d/vDM9Gt67n+ymP5yLlmCZ
	adHDjkZW5j1g6XEfNqnp+OHQuSLNjQ00X95AD8JSGi5G7COGMp58cUZf22Et54GK
	BYJ1K78Bv8UsH2/a3C2bfgFLrJbIX3DkRLMDEuRdFDFNFa6bEdJuTv7PmFIdB3ES
	3K/5RG/6ESoxkLKJUILNcrC5/xNUm6zDSD90/4z85RMuzLb3AiCi307TeVFdRJaO
	dISo0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvccb1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:56:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so19356592a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784634995; x=1785239795; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NeSpfykxd+JnV2juYOjpzOXSoEdtYw7VOCfogOzWOBw=;
        b=iAKUZqnEzY4/nAqoXSmnZ4kSgobHhWMX1bV3zrN9weQHZvo/Ufcqa3GEesCVyYMdie
         +GytIUGgV+DM8TFPyYl3O7VaIHvVG3cj+u3Kl1vQeHM/lciOMgiXvG2AH1UUOwnqOzhx
         sOBEEnSydn8u7ItlrFRSKuxQ/pEUcLr50X/YktqZfET4+tgSUqgRbQCsKecg+FPxooUv
         wCIxjWwrNRsN1nqVIFK6d6dsYgL/MBfFFVeFw5pyyI/TsS4bGxsfvo8iV22PDTUx8x9h
         eZPPPuwXI624jtcYddeD7Ym+x0iZuGPQ37G+B6hL1DP34nCsZMD2qHygz3gHaCJYBFZf
         mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784634995; x=1785239795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeSpfykxd+JnV2juYOjpzOXSoEdtYw7VOCfogOzWOBw=;
        b=mPynpMx5HFcz8hL2JaxRKzirAziNJ9qaQfwmxBIe1RFwMGSoCkSqliXCvCv7IX5MY6
         fpeJ3+Odv/1MEpgIeiAIOOazv6ozjbtMUd2ImY5t4S/8sjnXFElfUTvltUufsksNgXbq
         yvELanmAnkeC2rDxfvl7DE+lcsF0Qv9cz0zgJBYDTSsOzuuQ8ud9exdBRxot+H35LSgd
         bRoZyVYwFH4PDnG+aoLRDmMifR+Qnv4JKtu4TtP9gPD7y6KQoewjY6tYWWRFV/k5sBJ/
         DSyAkut59Ay5zh165xL5lVIoB8BiNN3oI0m5CRj9RtQhyEkxRAFm/BXImO0Z8HfNCTki
         pQfQ==
X-Gm-Message-State: AOJu0Yx9+HsN8dmOUY5jKoGf4Km6Sa+2DbxOLGSvbMTKAVYjRs8Vr7wx
	WcnISHO42uLWwRkeSLLc87SInUCp5SdzhdrhjIfX+81SVN8v5kwxasTLxxMLtb48vMzI4DV8lgm
	7GGLU0dmO/wsEZ+Iu1PiTMXNXjKYeMJSH+44Cgp4pIjjupKhqH3YNvqN0asLSqf9VGrGpLnRdBo
	ONhpk=
X-Gm-Gg: AR+sD107TXzMr2Kl6AZZs/2xs7rhMCDbI8/VXAfsDrqTIrqKPlEamWcF7inEFxWW+nH
	vVwn5oDPyaMI0A2tLJUuOXJfrtQI4ParL8Q9KoDBtwWIlboCPEWCRboMBrnY3F9kXmx0+1l0ODb
	LFvSufbrXi/xgQNXioLT6kZH9JRiQp7id2dVoGUA3AZnertntZZVV8BGmlv7UOG2RpbpjW6fGCC
	SNrw4B8Elhs1d2Q1SOHBPIUhnQSjujJ/0q5JTEP7gXbrYRphi1caqzIlv0jSzADb343xZ4pk/Y3
	NZ5DoCEk9MKFYOszDVDJN4eQIrAHHwtWS+Gu3FMqelStDTVsKdoE5afXoj5RdBtbtlnmVn6sUwk
	5JamNGviquhmeiOXkqZ49BIJj3OT9aXkeFg==
X-Received: by 2002:a17:90b:5546:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38e4b5f2212mr19989849a91.41.1784634995106;
        Tue, 21 Jul 2026 04:56:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5546:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38e4b5f2212mr19989810a91.41.1784634994595;
        Tue, 21 Jul 2026 04:56:34 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92169210sm1475947a91.9.2026.07.21.04.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:56:34 -0700 (PDT)
Message-ID: <d9bff36f-4400-4b2e-8fbe-a902ca41a316@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:26:30 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-2-monish.chunara@oss.qualcomm.com>
 <20260716143511.080B41F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260716143511.080B41F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfX1FCX+bSESRmm
 ZNz1fvmFBsTn5xZ3A5/31eObJSwOQlx2bHyb3Ze3jMe8ansxzoaCCrOWUVYZ+zopSzxI6kg0LeZ
 fXWe9Fmq01hO7xYcXA3Pc1PT/mVM9kY=
X-Proofpoint-GUID: mzpuk8Dg6Kj5dhtJJIrfP7L-VF5MVTNA
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f5e73 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T0wSgTMCz-9BSj2qRU4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: mzpuk8Dg6Kj5dhtJJIrfP7L-VF5MVTNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyNiBTYWx0ZWRfXybIVz/KzpFHn
 tZKmX0WzxARBsOw5lPOC3fnOSGa8HYqFzVk/X3EzopuQbIb2dbT8TssedQ+eYsMX/ZzKwPNm0b8
 LDhqXqHmCRzHTiMc2EoyiZpOJzFqIcuv7WsR1Wde6Y1vbIgFR8dgVYNABfxk80KPFoPJCPtGWB4
 6F4JMCjEzALkS/P2SbBLbWP/+BIExugGj5VxIgaszpBwb/P8q64r1aNf1+eRkrn3O8bJVwjzqAQ
 dJ/rLnGIrCtgnYBXdY2WIrEn4ORGFf9URer/yY/YjnyHS1IKuLFXzCizlA1PYiip+4W3J6APgr2
 VGO1sOe6MvTncUcOVNc5+qsKokNR7mcdR/05qV1NUntvGeJjB5sSoXrHi2X0WwlT5+CLZLYowSZ
 5NFA7NoouczeO2RN8jYNfChN8P9T8s6YIapWcvRlQBvScfquPv+e53emoaFVt7QksO0jNAikZTl
 50ATGENcyLMFob+SdiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210126



On 7/16/2026 8:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The 'supports-cqe' property was removed from the common SoC DTSI but was not added to the 'monaco-evk.dts' board, silently breaking its eMMC CQE support.
> --
> 
> --- Patch [1]: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT ---
> commit 37093e152f8a2bb5db199eff4358061ebc24561c
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> 
> This commit removes the supports-cqe property from the common Monaco SoC
> device tree to prevent conflicts with SD card operation. It explicitly adds
> the property back to the qcs8300-ride and monaco-monza-som board device
> trees to maintain eMMC Command Queue Engine (CQE) support.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e6..e5f316897706b 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> [ ... ]
>> @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			qcom,dll-config = <0x000f64ee>;
>>  			qcom,ddr-config = <0x80040868>;
>>  			bus-width = <8>;
>> -			supports-cqe;
> 
> [Severity: Medium]
> By removing this property from the common SoC DTSI, does the monaco-evk
> board lose CQE support?
> 
> Looking at arch/arm64/boot/dts/qcom/monaco-evk.dts, it configures &sdhc_1
> in strict eMMC mode:
> 
> &sdhc_1 {
>         vmmc-supply = <&vreg_l8a>;
>         vqmmc-supply = <&vreg_s2s>;
> 
>         no-sd;
>         no-sdio;
>         non-removable;
> 
>         status = "okay";
> };
> 
> Since the EVK relies on the base DTSI for CQE support, and supports-cqe
> was not explicitly added to monaco-evk.dts in this patch, it seems the eMMC
> driver will fall back to legacy single-command mode on the EVK board.
> 
>>  			dma-coherent;
>>  
>>  			mmc-ddr-1_8v;
> 
The incomplete and strictly eMMC based configuration is removed from the 
monaco-evk.dts via 2/3 patch of the same series -
https://lore.kernel.org/all/20260716142445.2767955-4-monish.chunara@oss.qualcomm.com/

For monaco-evk board, all eMMC properties are added via patch 3/3 of this series.
https://lore.kernel.org/all/20260716142445.2767955-4-monish.chunara@oss.qualcomm.com/

Thanks and Regards,
Monish
