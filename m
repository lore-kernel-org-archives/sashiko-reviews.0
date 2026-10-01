Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC023D8100
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845015; cv=none; b=hlv7c8h1yRY5cjxje3Uaf68Ds2FBpo7nMx+IORt/vWfw5L4QLTnaDD+3Saxs3fXd6Y/aOSpXt/4H2Jt+YZ/oENduIBuv3+8WkAelGu/qWb6q9T90LLt8UFlBFfGp65y+/sIuOtxXVgEK9M+40xEd01iLMWmXgNUbVMo1b6wCk6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845015; c=relaxed/simple;
	bh=l9pxoQjA2zp6vLUsaTL5foc7U7Q68PU0kX2DGu8OKQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nImA9f/H0uy1TnAh4782Minr/LhLwVgXZX23zVTnM2subSATbrGKByJS8wEvZ6rDH456JdH+msCkz5cCeDjLnwMwdmvGxCh5CpN4pGFGjQJo7DunKVRjHT/IPyO9gdmzcgq+Am+2uY8nGMcWCpV7RG0ZUi5gx7M9iPhVceaysPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMj5WqQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igfY8bYr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMj5WqQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igfY8bYr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTqH1289198
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 08:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqUyi3SAPTfoQDkj+nga/fJDEDVCPjeXmL/XvgQVSyw=; b=VMj5WqQM43bEd6Vx
	FnCuo2n3zzmQ1XMlLajfibxObBlAE793+qjbobEsWxBx11hy2b+HhTQv0HU09RdV
	xbqKTVNe8oY2YV10Pvwu20ay9Apu12mwFqdXrmWZ0OdUPxwZtCgY0nIRZTnJR2uC
	qi9uX+1cjfCppErgK5sTV8Ev65QJoLZZwMq+zE09UIA4hHaw1ReJ4ScengXMwboP
	NwtUuLb74VC3pQJXNR540WuNDOkbCbVPi/AlHPcknR7xTV5i698kw1accDnA57Wb
	hg0iIKBflgAGF2oYLHLXweyz47y5Va8rqsyuo82Gf8VbGRVsDpm8pAy8pvMJo3E/
	3Itvdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjaxb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 08:56:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94a158dc8so90531405ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845013; x=1791449813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqUyi3SAPTfoQDkj+nga/fJDEDVCPjeXmL/XvgQVSyw=;
        b=igfY8bYrbity4l6i7wrjyK05/3tA9ubuET4dgoQn64Q/MUq7HRbB3ERWsVy++q3kg0
         6DbcFHMLGYqLWL0D1u6sltENC/yW7io4DhaL79OEg05AFUUqC8FeG+r51KhOHVQbqT3x
         U/9nzVsFdEd8MsQdjTaR/QYqCE99kPQFNuYQ4KY8Y2RAoFTcZQbmjdxK4YMbqJDLETI2
         IqZ+oBHmgYS1A6GArB0IXRCU8dloTGtdQmc4yMnzYPiH/GqeKqyVpRreMslAeyv0ZwWK
         P8W1/ZNAyug50eprJD8eWwgnl9M6O0nrx9v4WBFBhJOi409UvHIOAHD5u3Hb3YDSHX8N
         gEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845013; x=1791449813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqUyi3SAPTfoQDkj+nga/fJDEDVCPjeXmL/XvgQVSyw=;
        b=YEkN6oo1QLwaIFLdkXjAOEupIJ2kAhriTENdA9n41vf5K9cHPTCPKgErJHCOxIw0PY
         oKffKg614eukxsix0aylr+qXEt4bO5Bol/yYoHeuN6Ni+yRD3i7v1Xna6ifpi/htbKb5
         gtZA/mxdtcl/cVF3GIZX3r48YNZFHEwErLrNxVqMVqpCAOQZKdDaj9Ls9Pv4w4CgWrY4
         g7BefD0ZizmxQ0futtwoUAvW78NrnlgOPAmk1IYxBWC/HwSf+ngEXzE6tu9BE6xRPvLo
         34zK3rNFR+IB+lbDE3O5uZ8tUTLy4ZOEp5bCw57bH/EkTAjkLV9tyKtBFsP7WVSqgY1q
         y6oQ==
X-Gm-Message-State: AFq9FYI/AUeySI+aYyyln6aSDM/U8WWOLjUHC62kpU/watig15X/kdzm
	Wtb8LvCtFdEwJipmdTtJ8x5YvwblbcdoirLkE5Yi7gAKkHrOREPEt5Diza0n0CmBcvtTFXybLZL
	rQGeA3MbVKCiP463XVRMcqsBDQPup8SVjmQsqSFheBa5iN8sLU+kzvt5yEz7CSdkgPEih/EQq5U
	N7CO8=
X-Gm-Gg: AYBFou1rH2nT9p7zpcNm7YIaGoWMNsbEzx6avq9fX6SGS79Gspo9MNmB9R4GmSSyfcR
	OvPyLsRH3trGLp4EpSyicVuXW291FAdUJM/K/xo3d4Pot5I1ftUlWHKl6KMfs1y5CuFXR8zNR0Q
	9tAWPyoFTRuChT/QzmoFCzF1oTfsaZw1BKeoEn8ftPYFwbg/izEA5pcad5IuT2cnKbH/oebv5I5
	YTYnWSEbwVXxpiw7GRluHrrRgxm0aIz4GSTftoeGQB42CRYUzov5UtWsWHxtb/8YiiqUovGc/hU
	Q2bjEDRqhS+/OdtBgGKDzrH7zDePyVrBRoUtPI8lVmbALz9KLKTh71l3Ag2eoEYuNFFjt2R1IxI
	VqeAJFJZB5j8+tfzwZR9lQSchYR8=
X-Received: by 2002:a17:903:298b:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2e2e48adb18mr33422495ad.5.1790845012897;
        Thu, 01 Oct 2026 01:56:52 -0700 (PDT)
X-Received: by 2002:a17:903:298b:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2e2e48adb18mr33422385ad.5.1790845012367;
        Thu, 01 Oct 2026 01:56:52 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300ac9f91sm7647745ad.34.2026.10.01.01.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:56:51 -0700 (PDT)
Message-ID: <1a59e842-c66b-44fd-936c-6895bc1e4e37@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:26:48 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com>
 <20260929084445.877431F00899@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260929084445.877431F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe2055 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VLX9wKi361tmcy8YDwEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bBNguFVZKB1MgwGdsg3a5zmL1jzZqUMN
X-Proofpoint-ORIG-GUID: bBNguFVZKB1MgwGdsg3a5zmL1jzZqUMN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfXz/URy31VgSwx
 3es9q+cOzfq64D+RnPBICS6c22Fjk+nYxL1HO7rwPI9GLtUFo/0pMwhMJbrZ85EbpgeALVX8jAL
 BG6VbqCX4C/c3+SO9X7//+Jdz3V5Ldk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNSBTYWx0ZWRfX5FLynZzzqjsa
 YvtYApunHLvbfiVHY7N1pUcAccoYdoLDc12Fw0oHozbt5rlCKyHftLdMGLZ2FQJOb7uFj2V0THr
 dyCWXxgmORcrEL2L1/lxx2nuoH1mINDDMlXbBc2k9d/CwtCP5roOqj9CN9vtbjyXRtvze1MSyT9
 jl03sUqdZz8Hzvuh8whTKUznlA16luEu1vUaB3I+7/KzZuXXwoIRLbF2Pk/DrkwtfxilxmzNUSl
 sG0fPLgSMZrl5PSVEOiHvKE6kNlyhgRgSGsHpYkaNVbl2T8s9C03aYPP2FP5mW5QMOvOYRuRcBV
 CTHSpZbyZMZBhzywGtO3uaUsX/VY4lwlzFyA0+ayxQhv78xv2IZx4GR1r3sBlqAOShBYBkJl1kz
 HaEwhN3uclHOhm4gsqjuzPLD7WZlbGIYyLM4OgtpSPBbB0pPyXVMK0EJ2C/1k13Yyj9Cs3hh+yv
 gMyQZsF9RB8nfn/IiHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010035

On 9/29/2026 2:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] dts: incorrect hardware compatible string for GPIO expanders
> - [Low] dts: devicetree schema violation for GPIO node names
> - [Low] dts: unsorted i2c child nodes
> --
>
> commit 9c266369a865f519d07da1f291fbd2938e091d86
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra-evk: Add GPIO expanders
>
> This commit adds the EVK GPIO expander definitions to the I2C3 bus for the
> shikra-evk board. It describes the TCA9538 and TCA9539 expanders used by
> the EVK boards.
>
> Link: https://lore.kernel.org/r/20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index da484887110b0..ecc6301179400 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -11,6 +11,38 @@ &gpu_zap_shader {
>>   	firmware-name = "qcom/shikra/a704_zap.mbn";
>>   };
>>   
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	expander0: pca953x@38 {
> [Severity: Low]
> Should the child nodes of the i2c3 bus be sorted by unit address in
> ascending order? The node at unit address 38 currently precedes the nodes
> at unit addresses 20 and 21.

I will reorder child nodes by ascending unit address in next revision.

>
> [Severity: Low]
> Should this node be named gpio@38 instead of pca953x@38? The generic node
> name recommendation suggests using 'gpio', which helps avoid dt-schema
> validation warnings during dtbs_check.

Agree. I will rename it to gpio@38 in next revision.

>
>> +		compatible = "ti,tca9538";
>> +		reg = <0x38>;
> [Severity: Low]
> Does the TCA9538 hardware actually support the 0x38 I2C address? The 0x38
> address natively belongs to a TCA9554A or PCA9534A. While the gpio-pca953x
> driver abstracts these expanders using identical logic, should the
> devicetree accurately describe the physical hardware limitations?

The hardware configuration, including assigned I2C address, has been 
verified against board schematics. The address assignment in this design 
is intentional. Same applies for TCA9539 hardware.

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander1: pca953x@3c {
>> +		compatible = "ti,tca9538";
>> +		reg = <0x3c>;
> [Severity: Low]
> Is this address physically possible for a TCA9538? Configuring an offset
> of +4 requires an A2 address pin, which the TCA9538 physically lacks.

This is correct, has been verified against board schematics.

Thanks
Komal

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander2: pca953x@20 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x20>;
> [Severity: Low]
> Does this setup actually use a TCA9539, or might it be a TCA9535? The I2C
> address 0x20 natively belongs to a TCA9535, so this compatible string claims
> hardware at an address it cannot physically occupy.
>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander3: pca953x@21 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x21>;
> [Severity: Low]
> Similar to the node above, does this represent a TCA9535? Address 0x21
> is the hardware address for a TCA9535, not a TCA9539.
>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +};
> [ ... ]
>

