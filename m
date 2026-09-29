Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE3E41D4F4
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663261; cv=none; b=l2MvJHl1mT0WPf63pBg4ppQXim9iOXIefGFYUjT0PlwFHHFpQRdA3Foc9NoOHP4pE0knyqQKQr1/bRIfrNfKvLwyeb9EVSUKTC1N8/eMfcYY56/8aWP178eaklHjwi1VosWopFbmvi3ZaUkOBXL3AQP0b5a8jpY9jgAx7bLqthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663261; c=relaxed/simple;
	bh=Y3v1B3nfPvaOW1ksb91wXH+WD6N0VB7OxuQ1MxfTa0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k66vDc6FJCDNqlTmZ624xO0WQx8K5Gcc0rzArs6Tsazy7N1hIc/hV3ROw/64k4MDWsC48WDPUoMuUDUe5fzO1W5nRniDdGj9B/3TsfKdU19u7rkOrpPlBG9tCtP+R1ItZutTwrC6+AysRRpZBC2v/sedS7Igwb18sopIi23Xg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8p/NClP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4+QBBk5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8p/NClP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4+QBBk5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47HMp3643395
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 06:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qb/axtgMA9zbWBioNFkhk8Pb8rwsYA1UmAFuy2+Kzo=; b=f8p/NClPX+iE9efi
	hQDdD2nRku/ZneUsvfN9J2/8wBKvNuwxs4ZVWLe3xOdYh/gprlxZ5Oyb1/McRffX
	K9RGK3mxzFvmebxKR7jhMXefQ5a2LUUpEkRqZWiFwuanAXhEYCTOyoV0qaDG6eq5
	+2cK1CSCCcwHxgGy+mHN4eTeXOezhfYavWgu2dL7nXU0EMBoSuoBvHRwVgByazKV
	Gzd3T9Cp6PSU9LcmsqM6PO48HV0Ks+rlz2jOtY3B0n0hk+yEluLF51GkpfWbS8Ad
	QPfarDArF2CJMP6vthoUPUhRpz0sYJwHeQ8Vehiy6T2+Vph5I8KUL/kNMZSWB2o8
	1OYGkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4shge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 06:27:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6167006a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790663259; x=1791268059; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qb/axtgMA9zbWBioNFkhk8Pb8rwsYA1UmAFuy2+Kzo=;
        b=W4+QBBk5YBrLrTPBKo7f/7ehlm9YNuwrOIpYXSu63oY+YRwBOHFAJpsiI+avIA9B4V
         +/B3p6kP8AyRIWNsva3TGDoK/IrDBUmi+1waNDHT14p7BbdketOykf/cOF6xoIJb0Phm
         bBx4HvYkNdym638jjrk6W5hmy1p8aJdeZmTonVWTfNRPJra3fkljEUzmIkQ/FzXq0kNz
         k2qoybH56OB8ZhdIuHLarfYizM2GNAAdbMo2vQy3Wp+lp55s75npugKkB6rFjn6Yynty
         +M3nLqK3Qiovf+1p2CI3FTCyaLXVEZdJM34+pPGbrnWPLcUfH5r7yS0yDqPdhx1zmigs
         v11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663259; x=1791268059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qb/axtgMA9zbWBioNFkhk8Pb8rwsYA1UmAFuy2+Kzo=;
        b=nKNcqXbnanWvFnN7ZsKXIEpVjLgJdqwN+eKplILA1OR2Kr1ny2PhzG7VkohBoS3NLN
         o6f7EM0cx9bqQKXfyMBhRDg8uur7gyaaFa79uKqrDVelB4XBTtdQ2IijGwQEuq2JDwO2
         HF76OhaM7X/xnL1YjP2LGvFkjihy7a8DqRS5AOVxCE0IHDXhqTccSEv+mHuWeZtBJQti
         pl3INZPoii6ei6HuiQDNK0w3g0TT9304oDvlhoDb4sFy1gTg69yD6uwsHeXkc+yHC2rm
         yFErJwKezs36NrD0pZAvmwU+Wy59fgY88qCR9eIKfyZ3EEZncd5oad10nj18CCw0hFHE
         5iNg==
X-Gm-Message-State: AFq9FYJ9HyIgJmbEtLyXc3oVtsvpKRfnu7RpEZjqzy/t1rb6xYfDBY3B
	w2CVZEwhztwvkSTpPa9lAjQgkwZBNgNELbGfmRUdmkc+O/l9mpGObg049419OB1sNFbKAyUitfS
	SOS6Ex+Tbx8GohK9C/d/g7T3vUzh4377i/wUmAFvAMhmy6s/o/5myFwByFovgtpg62MFvTJCiJS
	KquEE=
X-Gm-Gg: AYBFou2ihsvHlSLY0rFsw3/89oymRCpb8ENvkKLudj4xYOgtwVA+WRsM8v8003cgDz5
	umEp6b+Zps7bC6x7VBMCBq3Kwux1A7DNyEEUx8ukIlWyXNojslUaf1zitTvKccq3Z8dOTGgrdDw
	Mbm9w8PVul3a2gIdvVBLV3ZkO7vqJmxgcB/Qw52es53c7P/mM+SqaV9T0ie8xSmqwgmsuDJD8zB
	A8T2ibOzyYtDl1/Zk2XvVFcsMwm/TySgKZ2F+hfyn74X5R2wZhODcg0UUtE6rR/zHCpzhFj9/IC
	t3zTZ5dTwZwspQciw5EIff/5os6aBy8XANEPgn/TjhjAdNpzYG+9xOfIGRroDbHZCAeclSrh60N
	JOeBXGvPyFJlyYqkJ/bVEYuImd/w=
X-Received: by 2002:a17:90b:2e8b:b0:3a4:a045:27c9 with SMTP id 98e67ed59e1d1-3a4a0453437mr1052929a91.27.1790663258731;
        Mon, 28 Sep 2026 23:27:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8b:b0:3a4:a045:27c9 with SMTP id 98e67ed59e1d1-3a4a0453437mr1052915a91.27.1790663258300;
        Mon, 28 Sep 2026 23:27:38 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4982d14b3sm3350642a91.16.2026.09.28.23.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:27:37 -0700 (PDT)
Message-ID: <9f689148-45b2-4778-b6f3-3ef2b870758c@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:57:33 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
 <20260924124118.858F41F000FF@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260924124118.858F41F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX7oKPNBhf4QNy
 chJeKsZj3jlnIlbdLLiSY46xUajIQxsj8UZetwO4R5WUO4hF68DbSfyZ/nFp3ooK5sKo73pryT2
 vAc/aR4UHn6U3SR7wntdfHxHYrpuzPU=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb5a5b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eshuTizPadOJQDWpBy8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX8VZPprwgRdnw
 /wRCnwOvzEjwFA5M48LTvEfBBuaK2qUwSQ7JnGWoHFkcGlmT3plBZ64JcW4Auuda6AWSsauAgPw
 waxXG7xa61WxltopRR/T5ml0pAwRevGJ80UmCM/eBa0cUdbHc4xfU0MQyTwcAwYUrvd8KGhpku5
 I944ehrlFrI+kz/du5SqJlSGt8E6+EOl6o3KcEQng1SU5LyD0jP9Va3/+7LAif/8HOSJrmfdHp2
 ytTKv0iAFZG+1wPAM/ajxhGCMl1isLpa9p/loEKZPOoa0BkzLzxI1d+dCZ/er3JploKl7TlkDsr
 NDw0pEMmFv7IEEfo3faxB8bN4B36qJyazgTEjBwQ3Y2x0/QPhmt0V562P032scE5eFA9aO4TzAQ
 IjxSpV0Ij9AdUWSGHJ7mBk10dX+dLEeCN4McHgRM504ItGtgiuIGwgUW2vFIzp8AALr9XjEJNnd
 rjB7b3pzgrDXLuNoADg==
X-Proofpoint-GUID: S83ALao2WeN9BY127dNZwO1grPE-IHIo
X-Proofpoint-ORIG-GUID: S83ALao2WeN9BY127dNZwO1grPE-IHIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290025

On 9/24/2026 6:11 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dts: I2C GPIO expanders placed under UART node
> - [Medium] dts: I2C addresses mismatch hardware compatible strings
> --
>
> commit 32fcaaddae686bf893114a2f4648aee0e464eb7f
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra-evk: Add GPIO expanders
>
> This commit adds definitions for TCA9538 and TCA9539 GPIO expanders used on
> the shikra-evk board. It maps them at various I2C addresses.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> index 0115fc9095b3b..04faf09b21ae0 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
>> @@ -29,4 +29,32 @@ tpm@0 {
>>   
>>   &uart0 {
>>   	status = "okay";
>> +
>> +	expander0: pca953x@38 {
> [Severity: High]
> Are these I2C GPIO expanders placed under the correct parent node?
>
> Because they are defined as children of uart0, they will likely fail to probe
> and cause device tree validation errors since UART controllers do not
> instantiate I2C devices. The commit message mentions the I2C3 bus, should
> these be placed under a node like &i2c3 instead?

Thanks for spotting this.
GPIO expander nodes are incorrectly placed under uart0. I will move them 
under the appropriate I2C controller in the next revision.

>
>> +		compatible = "ti,tca9538";
>> +		reg = <0x38>;
> [Severity: Medium]
> Does the ti,tca9538 compatible string match the hardware at I2C address 0x38?
>
> The TCA9538 hardware strictly uses addresses 0x70 through 0x73, while
> address 0x38 typically corresponds to PCA9554A. Using a mismatched compatible
> string might cause failures if chip-specific quirks are needed later.

The compatible string is correct and match the hardware used on board. I 
verified this against the board schematics.
The comment appears to be based on TI datasheet address assumptions, 
which are not applicable to this design.
Thus, no change is needed.

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
> [ ... ]
>> +
>> +	expander2: pca953x@20 {
>> +		compatible = "ti,tca9539";
>> +		reg = <0x20>;
> [Severity: Medium]
> Is ti,tca9539 the correct compatible string for address 0x20?
>
> The TCA9539 hardware strictly uses addresses 0x74 through 0x77, whereas
> address 0x20 usually belongs to TCA9535 or PCA9555. Using the wrong compatible
> string can inaccurately describe the hardware and lead to issues.

Same applies here.

Thanks
Komal

>
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};

