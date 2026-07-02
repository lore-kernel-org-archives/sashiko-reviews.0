Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED038D412
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985578; cv=none; b=CAiHw3MHYiR8UQOh0gndypfzcCdVXqL0chVpjuNxr9usjtc/4yc+Xsvf3C4cRfthh0E3B3wEXPwlHbTp9i+KgYjIkexh5M7jt5yjt8y9V5muM3YIjqnaydmq4aHrxV0wHwfdVHvUO+61zIrM6f0O0RFAT4WFyoMPMyB239/9ZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985578; c=relaxed/simple;
	bh=3kTg9Clc/kX5YvhhLRAxEwnOc1O63N2NGMZM12Uz9RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljRQIZwW0/BNNAoQy0+QbV6TFFpDKvX8GiijEBshGkDpG8SMfn8uu/8Ql91hdG7RstJv8/FYD9yNq/bNbyxVm+BaUW+ZBcVZBSkKzodfDZWyREFHYCyKhjP7cvv2w3vJYBThr/NKHzg3hKpHzUXnD+qMO2Fb3vzYLWNflz9v/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrXvNMbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEm8S+Qr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrXvNMbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEm8S+Qr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628dDk23050058
	for <sashiko-reviews@lists.linux.dev>; Thu, 2 Jul 2026 09:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVZnNLH/u8ARJd8RUcFAIiRiGptznjc10KJ4uCgQGko=; b=mrXvNMbSGTLffYn/
	aU6P1GhRv0C8U6e5JL/bUqxKPs61VcMDYXeJQo7RIvUqjgwiMbPMNXO8yqK92fjj
	BuFgQS7M2nGdUiKOdJ73dH9fKCFxQvPWLoqpIG+Q2zfzKznollhoDphiwBe8nWcB
	upgFOj1uIkCm2rDwz1ufHT7IM7ixf2AYVdFls5N7S0VRFoXeCuiuwHH1Y7Wa+B88
	lPCJz1xtqe32M4I2UoJ6KIK3s5eh62pFdFYvJZxX2lq/IvD4frwUNrl4EfvT4qNx
	3YzYI3rrueYPHsQpA7lqG5nahR74BKAkTA0IbTLrVl+6r7YyQCY868zm27lFS9Ot
	vG0IoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541v2jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 09:46:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so1383904b3a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985575; x=1783590375; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zVZnNLH/u8ARJd8RUcFAIiRiGptznjc10KJ4uCgQGko=;
        b=UEm8S+QrAt6E4p0oxtd1tUe+oPOEShTYQWqIVRm1nseQYMKLjtRqY2wP/dh7kdfWiE
         vjYM/8BhHi0HF0ejbjIT8iVvP9tTLC0dHbFkBf772rhisoD8hzQSYskZRMV1w7CWFHrO
         mDPNVQiN2QW3RyOvTfV11FhFwqWANZAOGg2XB9uE98ZqLs83UWbqWDt31rkgVaVijDC4
         7MbCtG/yBzNbJi+iEdTGjZ8Clnf7JOdmcnqBxdSa6qvrIGOmedfzmNwKZxzIVQ0Xt+S1
         5wWmtpQSboCAxMVKvEag9fRWzLRTMFIVbwv7KLaY4PDUh3fWMuS+EczMzr7Zc04ABV9R
         h3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985575; x=1783590375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVZnNLH/u8ARJd8RUcFAIiRiGptznjc10KJ4uCgQGko=;
        b=dFn8KeZqO9iNCP49oWRyNUWyhRNMmwO3f4hskaS75Q+Ii3ndUD4hdo3xYI948TcLTu
         1NRfDIDnB0/8NGbAYOF/7w/d1vVYaam9fFZLw0H0GjrA1nYXZOfhYvaX2jAD7B7LWdcJ
         mVovsuW3tJ19iO/wAIOwCrEqgX6YFeWngm8H617TFXg57nsZa7z4LSSDASPPJlIWgEnD
         epcIXdgr94KVqs9j6Gz6SFZUSNIhMrAVLmSyNUOcuQirxPHHjDoTwQOU0V1OB+D+XuEV
         qCVL3Q00cT/7s0Y8P44BOyEgb7E7opWJYzqZbYUyVyhPrqeKxg72+IXQXcZhAs6j1wgS
         Wwwg==
X-Gm-Message-State: AOJu0YweHUNqA4gDtRljG4puU5ERyiC9xVLdW4viPHjHbqwOtDEYJy1g
	QjWwQOx5Y43Hx9KYzpilNJ8YiwMjSoLJ9Fxtl6xRSOXS/rfEswgpeIFHaZk4v1sOmUV0QLn9ogn
	+CXRUbqJ7yzNangVAOqUDsoHQEtglB0zRqmeX6zOotaycZyyhFGJqdPFrr0fMwj3INrkh6yauP6
	MiaYQ=
X-Gm-Gg: AfdE7clG6VPVgL5zA41UjeBqTxYU7wIbiMzt7jtMw4li4COMlHPhF5JGXNSL0yC8G/m
	I+oCRX3cS3BW3DNtJOGD1WVZBCRxqlifDK+zKKtEUVJifE/MSss+Y0EAFMeFNtjUxfUIN8GkkjC
	lXW0eQV5Q5PEg2LfmijU+6n+1S8hcYC5PYzYvv+aLpvxaq4SpOLqNzBTrRjt5Z1LXKX/t1ZKO8L
	Oo8mENmXH27Qsd31XY9Qx5YcJi64L6ENQVoWUqcbUIQ8GulMs+62bjCQqtY6X8pkKoBwQZOKcXZ
	Uouc5V/NKNHrSzwXqvACUr9ujQPoXyiCQ3uRPGHYFSxCNwtrMN10qAdyptH+YEgFJMQDQBVeWAn
	pgmiZzTcmNqRViTm9axZ7P2fPljZbn0xW4CiKxG9M
X-Received: by 2002:a05:6a00:a1f:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847c0a03e2fmr5163654b3a.58.1782985574709;
        Thu, 02 Jul 2026 02:46:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1f:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-847c0a03e2fmr5163621b3a.58.1782985573855;
        Thu, 02 Jul 2026 02:46:13 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.29.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb97d96fsm1104140b3a.40.2026.07.02.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:46:13 -0700 (PDT)
Message-ID: <0261818a-0aef-49ca-9884-ffbcf2968b22@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:16:10 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
 <20260610112607.62D8F1F00898@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260610112607.62D8F1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iW2ldcIapxTGSpmakYzXc1olbac1WQ1u
X-Proofpoint-ORIG-GUID: iW2ldcIapxTGSpmakYzXc1olbac1WQ1u
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a463367 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=1qKOYMtCOh3zOq8T1Y2cZw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E98MCR8XraImtk7OjrgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX2Z1uzczDqMEB
 zZn4/fwI+kNIk5jc0+g4pkLmN2qnJv/UCTsbpbfpfiMF9vpZONeUMNpd3jKXM5OgfDDhWaSmqma
 IL6vVICVxHewTqcPBEH5tNk07R0AG4cfIJyqr9Tap7OpaWLvHT47JigoXo/EmHgBEVotNaOk0KC
 Q61Pj0l7mOj8YfxTPAIUNBnsclQUbJD9P6ArbbC1vts5ftNenjLqp473ToJ/zogQJPVEHJn3h4f
 aK+zY4uNNiaUe7DbOJg2FbP/WplbJfoIsrP4XmBN4lLJMintaXUP1Sa9sM3iSP6ygNYpAsogXAu
 teeSCk3Xtgo45st5RKF8/BcacrVBQXrPBXsXDrNszPfbM7tbysuD6CPTH+ZBewK7LFoiyiigjru
 o+WL61g1U/k8S5DSoX2LJBjG9qCSjm9qrZB8WxF7eNUj3n/PEwZWQOQTKXwysopltgSb5fqZFxE
 DMGkEGMTFLKZNsPK4sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMCBTYWx0ZWRfX2DqHWbfCkLr3
 i4yRWxuy+IR09sMfx0R7ya0Aj+jk2g2hy33DhJzAUuGmiZkaVICFRfGAbNsciOZE509wXRsWgCM
 lXhRhWEFQWZkM72exHWkwgvBNvp8zYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020100



On 6/10/2026 4:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing `resets` hardware reset property for the `sdhc_2` node
> --
> 
> commit 3328d962d23c195e0ded6a5fa736fc357bc968ef
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add SD Card support for Glymur SoC
> 
> This commit adds support for the SD card on the Glymur SoC and enables
> the required pinctrl configurations.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 20b49af7298e9..0989fe39e7ef7 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> [ ... ]
>> @@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		sdhc_2: mmc@8804000 {
>> +			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
>> +
> 
> [Severity: Medium]
> Should this node include the resets = <&gcc GCC_SDCC2_BCR>; property?
> 
> The SDHCI-MSM driver typically uses the core_reset (fetched via the resets
> device tree property) to explicitly reset the SDHC hardware block during probe,
> ensuring it is in a clean and known state.
> 
> Although the driver requests the reset as optional, omitting it means the
> kernel cannot reset the controller. Could this lead to unpredictable controller
> behavior or probe failures if the bootloader leaves the block in an
> inconsistent state?
> 

Updated in v2 : https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com/

Thanks and Regards,
Monish

