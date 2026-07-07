Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBC32AABC
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413675; cv=none; b=FmtLMzJK9/2EBI+JNaLfM5y/wbuBvvzHNfg83dYgHR+A5XJyEQXPrsjhnj8z1hcROKrMY7nYNDTr8GszUNuFlITvniNdM5gV0bPNN+XzR2LWB9fIG/fvwgzg2eeNQXWaE3r7xg7W6Q2ZmhpxMkQYDYvLEoic9ukw+/w6irBtW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413675; c=relaxed/simple;
	bh=nxdlAM8SSdlHFFHuZI2VlKm6oVz2NUgcbsHniHjemQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9NhNcO8vGUdZdr7L8QglD2p9r+4Zo1IdBU6inT36ZFylI/tLrWU0+fSPdXYz/+pbfTw4Q4bU58+Par7yLkxkfMHYC3jX0FvlzSl+p2MwOeoMdV+E64jy6pYw9i2wzdPnApX6vRhHvI37Tf3OyMRf7S6QEOdqA7NnEWeAZEI2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWN242TG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGBG6zm+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWN242TG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGBG6zm+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DnHR3205863
	for <sashiko-reviews@lists.linux.dev>; Tue, 7 Jul 2026 08:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNN0OhIdAL9mAqDWFKwov/DHAFlnKx2nEt/u+oSQymM=; b=fWN242TGxQ0YJDEH
	iftdiHghH09l+4QucOwQcf82GNLSuXhIRT+d/RoQ59Kt3TpYLlRjL1Roumx86ejE
	tZ49LJ1ISsOfcd0/XnQA0GfA3K+LNM3HQEZc5glpPmGUP6YDv7XkAy6CHRxc7BuC
	k/3oYQjb8RHqMp4U+SORy6/XEMDN87LS7zkX0vNgB0CtOZN/KPANlrRA4aGoGYju
	qstTAeczzXSuvrY3/kaS8v16gh/Ghl4ZSx5vv2sp6hXl7Jybkg5P/5BjTJQ4C6m7
	AWtB+ekk75R+nt/TS63ZaNQTJuqls2z7htuPt0L09vavRXPqF9CYUrKEsbuGqgUT
	4si7YA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3dyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 08:41:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso53559795ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413672; x=1784018472; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNN0OhIdAL9mAqDWFKwov/DHAFlnKx2nEt/u+oSQymM=;
        b=iGBG6zm+hiSVUPdrym9dGHxOx4g3uvFix/R73Qt5rxjC7bMCrITwFAfwdoyvEt/+7+
         jShRlwnmDHsyZqkzLfokik7v4iMZtmDpnNmS0nTtJDdQNtYuEAXTjrGgYmJBWljHu9q4
         Vvqk5AM0lcxTdmbHswtkJpu+9lcQZkjFWy9VH44hAVnfnLgfJtn2Ywz/s0st+l1aJeim
         nr2/vn1c8jKw09vrLIk7WEiTYS6MI/Y5h7uZO8HggY9nvJY55vXfKs/vL/qKUzzi31fv
         Ql/1BN4vE2v8yTnWW9AiOstcM+masnGuvWCuiFlVeR/AxvlgE/SX1uP5zs5kOC/kgYmH
         OhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413672; x=1784018472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNN0OhIdAL9mAqDWFKwov/DHAFlnKx2nEt/u+oSQymM=;
        b=pNUXbqIqVnloka8dZZHYzj3N/opxm7ji2tyllBj5kt4xIVbiWz4alKdTQCmvtNFpP9
         ubE1cBFo55d5agb/1MSTQy49pyG0C4hZdQRV9LCTBpX8vJnaz55KBAnoJ8yYEk7KVIeK
         Za91U1AKxu5+VvOtZq4LOIHPwNqjqGBA1bFrYlFQHIVsZePrZQeUK1sWhvDYnUikiDMe
         BrCkmu4MGs70+7Ie+QslXUJF1gziLaJICB86pYykqHfRsPZ+YbTU7RRqQ28jHDkfLzKq
         CY/qukweSACmHwUrleXaob5aRiuCsjSociBJnHxsLxgjHDHvu92NnzcAA08OLzM3dVax
         lUYw==
X-Gm-Message-State: AOJu0YzBHDiZjUuFXegEiEDZ8vyzjz3bEXDjGH88VUcTMoTEJUIHgjbK
	7uC4BUYrcU9NL4WwjrYVcQXKYfU47sqbxIQNr1a9QLntoxHV32WyygjBYss7t046sX6jPZLJjyc
	nVw/64J0v7rLkIT8V5DOjL+Vvtlud+fbIDxtJbCQQfsGsRdeatASN/+emmZHzbkk0KHiMFDJu4i
	W4ek8=
X-Gm-Gg: AfdE7cmIggzbmIXAOAvD1Z7UE/NWjEgCgNxlhdWdSBCNgC8EhiQM/Kx7wrMW9HcaHQ8
	wHgPr3pUQU9X/5m1n5A2fyDu9TaRM8s319+nRyqZco++s6yQZgjEsdFf6z2UaGbNjp9pyo5p/6W
	yLUNQtsEOWliDvOsWkAMb2CuQHsAhQ36iw8+ToPxbADjlDyP8igkjyTRICzxw8UYWBxrzrvYX+3
	33faGnm1uszHOO6l25va29YKldAbZQ85fbWLQpdwbIx8+7Ua9EYp1u/7BS2dzQm7YCyCS66ETAt
	tOnyhAbey/yFlXr/jM9pYgkwC0w2he8rrEDYk7fI691zEkGZczTD8uEMncJJ4jKMhgBhGAsZv54
	3wvbiWNh8y0p+JYLOSjsvDAFQW1zUEDytwdDKoqbKv8s=
X-Received: by 2002:a17:903:120f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ccbe3feb88mr40585795ad.7.1783413672274;
        Tue, 07 Jul 2026 01:41:12 -0700 (PDT)
X-Received: by 2002:a17:903:120f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ccbe3feb88mr40585475ad.7.1783413671714;
        Tue, 07 Jul 2026 01:41:11 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c100adsm7731085ad.32.2026.07.07.01.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:11 -0700 (PDT)
Message-ID: <6af98083-a102-4614-a853-76d27d209118@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:11:08 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
 <20260707075554.BB8E41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260707075554.BB8E41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX8qLzMmcz1uU2
 XMya74wEpVLHZ6mF6ulbn0Q6LJwj7jYRoatnKNnZQzOwkkUxAIuN6Bn1rEmTiobJoWhTyg2e3tB
 jiCC2oo/AM2DwNkUz0FRxpjisZloFUM=
X-Proofpoint-ORIG-GUID: 1DxUR5fBkQMwTsXNKxr6QXCrn-tRfLpz
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cbba8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mTcq0AEEaod-KTxo8kgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX4pDTA6giVdI8
 YdXH4mWNfTOnpqAPtyPgpzJxWNuXFAtW6kxonYmK255Qw4pJJvVFt7DxIxpufnIKt0dW6G7tzKt
 Y9e3rijsUb6/XxcSZODRFtLJppN11gBHBaO5RHnCoH5HPWP2rT7vuEhzzCyzu3puusH//pt2dIP
 K1SiSmp5xRibqozmBhfBhZfL85K2SlPQ+yByvVvifovbzXCcealz4+mDlPcPcgj1Q70lvLz/5g2
 FgvReHboizMvrxf6OvPKCsyNyytkDhQ+kc73jK4hlUtIV6qP+lNojakdQek3WWoEhq80hs9ac/Q
 r/c1WorBQnBscJeisoJAqauOVKVkcqFf1bpki/jruUUkvW/KT7nyFCX49eH/jHfUy41VanvhALs
 rpWmaWGFP9D17PqtNNHOkBT9zeAhq8BpHFig99o3uqpoPsTMs3udqO2yzPTP2nPbcgYK7xs8aEn
 8JGq6+Dhi4zMLQW2ywQ==
X-Proofpoint-GUID: 1DxUR5fBkQMwTsXNKxr6QXCrn-tRfLpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083

>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 90e50c245c0cb..3692be65cc21b 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> [ ... ]
>> @@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
>>  			qcom,dll-config = <0x0007642c>;
>>  			qcom,ddr-config = <0x80040868>;
>>  
>> +			qcom,ice = <&sdhc_ice>;
> 
> [Severity: Low]
> Does this new property trigger a dtbs_check validation error?
> 
> The Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml schema uses
> unevaluatedProperties: false. Because the qcom,ice property is not
> currently documented in that schema, adding it to the SDHC controller node
> here causes make dtbs_check to report a validation failure.
> 
> Should the binding schema be updated to include qcom,ice alongside this
> device tree change?

As mentioned in cover letter too, dt-bindings with qcom,ice property is
accepted hence, sent v9 without bindings change.
Validated dtbs_check locally, taking dt-bindings as base kodiak/monaco
DT didn't give any error.

-- 
Regards
Kuldeep

