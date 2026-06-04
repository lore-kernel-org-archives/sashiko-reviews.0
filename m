Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC353F4100
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563490; cv=none; b=spfIn/L2Cllu74vg86dPrZTapxGmxtD0xgR14+kNprnTNH7W8QstQ7PU23SuI6NfNPfSC3D2R6DXMLN2o3HGFDzx1YK2e2ChzilOoygZFRYuFBXvvbeO6z5klAhvw0cFMapuPjmZBGF4g2zq5qQp/RF2c8d0DoqwpOdFNQSXcwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563490; c=relaxed/simple;
	bh=tTiYS27nSnpEKs9wnlbHd155zeIpJLCxQNIRoDP37HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RT1Eu+uju13UQF1UIa1FOIytpiAd13KSFH03W/kH+zBOD+RSk5Ct+/PuZ4jHYElxT3fwRGwmwKBjQJG6THWrwcyHXEEWFPyQzGodFJw62wTUN2XfnhK8LtV3Bs0SKzm/AtMFP6uG3oy7Aq0tmnRkGd6FGg82QykcP5RPr+8eqFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdryVky2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOPYhv/0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdryVky2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOPYhv/0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543xmHL1993560
	for <sashiko-reviews@lists.linux.dev>; Thu, 4 Jun 2026 08:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrZ00qlB+fsN6ClHGlnfNiEqXVZZKRHWDPPLYfu/Wyg=; b=BdryVky239977hUZ
	/hpYhIeCEFwVlgkaWv9LZprOGTTZeQEMaAqmXvc7hgD9XrEFg9sqEyeAk+kHzgNH
	rpGT5Dye+KDplgfwhrleaTF4L0gmbP7jinkp7ob8DWmvhre0HOCABHnWxfEqCLr7
	TRS6/YNzC5uEZ/bBM04mmG3Cs+L5egD18kP1+Uu2WPYR3wVJg9bAoSi8osuaADA4
	7Yw6N+7JBL8nhGByNhYqYhPTS9zSHv8j/Yyx2WgOWy+1uLjAiZEWz5PAE1VC7c6F
	xE01tpdSyzlf4yIPjwrQDvb0leA3A+a8QiUox9mnBHQeeLpKHo6PeGi5LtJmtYIN
	TENIVQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8ptt84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 08:58:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so387182a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 01:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563487; x=1781168287; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrZ00qlB+fsN6ClHGlnfNiEqXVZZKRHWDPPLYfu/Wyg=;
        b=UOPYhv/0VujjbGDbGEOQXMNVnJBJFymN84sIXEGwdt/6XZLMG9PyeM+1zDDQ4E6N45
         dPbgcK9pu0ZMDV4qbuK4OoYB0s6eNwMKgOprmBLvKwLDt2UA0eyVbPr/KXnhCO6RFcxi
         Er3UtpDhu0ZnXFB8BxLVvwLXFeTx0wR3wTyKwc4UWXZ6PSS8iUjq8Zc5Z4Nd3QPQsFT2
         x2U1p7VJa45RgSYxsfEy667Kihqx4f17NJotoTUc3O0xPjUBWxhD/8jMUkk2rKlpMiHi
         f7l4imfBQuxjghLLsj5INNm77shAll4W5LJ5Be66vg7gt5u8ik622oyTZ3lfUu17gJb+
         PdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563487; x=1781168287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrZ00qlB+fsN6ClHGlnfNiEqXVZZKRHWDPPLYfu/Wyg=;
        b=YzYc9Yxu19uToA7vI6oNgB/VovDz+HCzKespJeS6jVdAPxqr9xJXFU+zS1XjrTUAFV
         RohWZWF09A/OzYRnIX5twxw7LJGSqcgbRsktV5QOfnNZItc8k9rk6qxJjJW7PJZrS2mS
         7j0riO0EDzMuTAw3enR25c2xWLfdQCxdpl9ENTRaWKwcStQ8ha2XFyGqppiao0qKp/G3
         Rt2/eo6f5KaZVsFFWraiQv2QbHuyF8PABLsGVFElyIK55iEdgQlnZBRQjg/5pOGkgHjY
         l+U6wwmcwAgRsZciTCn3jLthM/03TaVBHO1e73hcKkcM1CnNbfMPzbCl/+Gmt/Uf4UZD
         fZ5g==
X-Gm-Message-State: AOJu0Yx60YaUjxCpyM9G59iWH3TeSyQdm3m1xjcBFW1aOGzTypi+oTe/
	WN8PndJogpBiAHvKaYPjhu7U8cWK/fKj9B8lZGfRwykMtJJIM75hm8pUzjTk3MzZp4zBSyjwwcw
	t5dtLAhK2lmQjIGYa26VYZ9YK4tbZDpLBmtqtM709SKF3NEM8J0JqEJMe3rYxdoJFJo3XVqCc08
	74Huo=
X-Gm-Gg: Acq92OFNtE3o+FF6CiESbCi4bJn/J/AoQwOtQ6QYPk6eYOu0APkLqER8uzyY+Op6qTD
	Yvfn7gkoHJB9XL56RiT1hAppEc7fXzmnlP5e4vSVAyjg2rt9n2yh76YL1OB/3Ez8JwgnQAD/f8m
	zAvEQWMhUuWG7A8Z5fHQsmSpfIBfKK+0VRVr8hPS3vRRhdyeHgyqc22YrAHZwAh2xDBMW2px7Tv
	nRA8soepv7ryXc/4RilMnvvq/zLpBABXSKq0ZTm28Un2OZoXG6NRD47BRJdpipNo2/c5iBD6Kxj
	/1Pp1nC0e3TCqFPY/GwuLEkGyqG1CfjpqRvTnbsNir8FMT3BGYTVvvzI45p5B9HwSkeQiab5QTg
	kVU708U1rGAKAk843YiVWjSUa/YYzccyICDGZjbGKaMFarKkjfR8T9zG+9rANQVNY5Tb4lo8kvx
	if
X-Received: by 2002:a05:6a00:4510:b0:842:7324:e679 with SMTP id d2e1a72fcca58-84285015ca2mr6666491b3a.50.1780563487273;
        Thu, 04 Jun 2026 01:58:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:4510:b0:842:7324:e679 with SMTP id d2e1a72fcca58-84285015ca2mr6666464b3a.50.1780563486722;
        Thu, 04 Jun 2026 01:58:06 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882156sm5250343b3a.33.2026.06.04.01.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 01:58:06 -0700 (PDT)
Message-ID: <35f1ff50-74f5-412f-a52b-9906fda0edb7@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:28:03 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <20260602164512.9F1CC1F00893@smtp.kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260602164512.9F1CC1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sFdqypWlIXP2KaWullJflIVYEGY7LluI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NSBTYWx0ZWRfX8Etwqu9vMr8n
 FLp1ABFT5x6YHqw7z0ES9aWiiCqBDHEszJqwtmBqN7iFgxXnL0Wzhl4NltGWpjVmJ0UvhFxPC/n
 4BPIhGQo6KcVKhheeEJ22ABVmk01arsEwVWD7mdlqJrq+JUOpiKEiXLzNokwLGZtAHBKjum1yUI
 cPFuWI7KlVs8aXIMVrqb4e0xiQ5gvOp31HWL+0ZxGhD9mhIKM8+dkHzfZIaGYrHEhuefFSF09ee
 Ovw593Vd7ndQisEPElaOP6gVVKfcvjttdxvdlI8YcCWogGB+n6Aqqvp6A/sEZqb+gqegH6j9aNY
 5y9gWbrJ3jGC21/9d4MZOwfwYUaRY0p+ODf6MseUTZRduu8Kk5SrEohUmDxPS+lJMrB9L4pWk02
 fmtrcxmD83nHU8Tlf7+9SqeyBDk5z5+1T3nAXqM7EdLP9ggVgIwQVen9rGRnaZaAV4pjfXLFJRc
 322Uv6rVbBFUYqNWSsQ==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a213e20 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3c7NOeAuTJp5I-PFVUMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: sFdqypWlIXP2KaWullJflIVYEGY7LluI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040085


On 6/2/2026 10:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Missing `phy_exit()` on error path in `qcom_pcie_parse_port()` leaks PHY initialization state.
> --
>
> commit a3169d2cae3bc2449e374f733bcb358e726cc377
> Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
> arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
>
> This commit updates the device tree bindings for the IPQ5332 PCIe
> interfaces. It moves the PHYs and PERST# properties under the
> Root Port nodes to follow the new binding style.
>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> index 79ec77cfe5527..7fcf632e289f0 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> [ ... ]
>
>> @@ -46,13 +43,15 @@ &pcie0_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie0_port0 {
>> +	reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
>> +};
> [Severity: High]
> This is a pre-existing issue, but does moving these properties to the
> Root Port node expose a PHY initialization leak on probe deferral?
>
> When the driver processes the port via qcom_pcie_parse_port(), it calls
> phy_init() and then immediately calls qcom_pcie_parse_perst(). If parsing
> the PERST# GPIO (now added to the port node here) fails with -EPROBE_DEFER,
> the function returns early:

EPROBE_DEFER will be returned when the GPIO device has not yet been 
registered, which I believe should not happen because the GPIO driver is 
enabled by default on the QCOM platforms.

>
> drivers/pci/controller/dwc/pcie-qcom.c:qcom_pcie_parse_port() {
>      ...
> 	ret = qcom_pcie_parse_perst(pcie, port, node);
> 	if (ret)
> 		return ret;
>      ...
> }
>
> Because the port is not added to the pcie->ports list until later in
> the function, the cleanup loop in the caller qcom_pcie_parse_ports() misses
> it entirely:
>
> err_port_del:
> 	list_for_each_entry_safe(port, tmp_port, &pcie->ports, list) {
> 		list_for_each_entry_safe(perst, tmp_perst, &port->perst, list)
> 			list_del(&perst->list);
> 		phy_exit(port->phy);
> 		list_del(&port->list);
> 	}
>
> Could this lead to unbalanced clocks and regulator reference counts by
> skipping phy_exit() if the GPIO driver is not yet ready?
>
