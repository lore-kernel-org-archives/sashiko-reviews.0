Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE103A0E94
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460089; cv=none; b=LWYSzPX8kr60/iSxPmvh49+j+hzo6Se9AAMTDzI/G05ZfV6sSu3bP3ggbXEJrAhfHqcpnhfymsOrgbGevd9Yb7+l4ExIsUduTuFb7KoKHU9F3nVwYKZmYseHJ18zbiFepZT02o4kPRXVuFXHymt1T6H6+v56fscdhT8HOV/YlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460089; c=relaxed/simple;
	bh=IcFROUShVBIgeGJfb2Z5AWQn533juwvp5zLQxg+1oY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkR+qV6HZEjDcUyb2LazBh+NxNdgcVyHAeok5XFHcARkeeey/VWFXHTWpz4ejXJFarOqXfcaaZn9hi1OJ7bmvo9kxrBHXB6/xp9jAwYmMZyXdHt5hUVXZ7E1MrrWuYjzmWj016Aoa1N3c8/XNW2z70XVCMfctUlknRUH2LVhNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKoFTCqS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fITfN/zB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKoFTCqS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fITfN/zB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpVfg2125149
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDhAoltlaw1s+bb8wQYhsM+Av96Qttuem2tUfK7aq0A=; b=iKoFTCqSXvCgnqfQ
	wePkIcOBt143vhk+Uq5WxLeW5XnBrzyplItZOV/RZRBzsx9Ea8eZvKnmA7WZ6Vei
	mDQYIWItIsr5ovkwKOojFKaa1Z8riLeEVe65FS+NqQ0TH2bNImDJcq/Gt6vc3eua
	x3Lwf5TMHtEkITBiAhd0RFQ+1CsX7JgdQow09iL05Rp8TvHK7pj2C5uXAYH1sB7a
	S0XdwBR/oO3Lba26wFDz4EwDbS0vrBWxs1oOQePtHZbaixx3zIGfAs87DSRdsJ/V
	2UNDi+IOtV9L+g2QZf/hWsvW2wsDsjnh9Mv+TGeejDSB9XicXjF+4WdUMiEicNpf
	WvxxIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard884f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 14:28:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8386367b23cso5201370b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460082; x=1780064882; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDhAoltlaw1s+bb8wQYhsM+Av96Qttuem2tUfK7aq0A=;
        b=fITfN/zB7kubgYvF4uX0U0RwxdjpzPX8xggGkSOcCQEG34wHjM6BmCksQ/pPtSuPR1
         6VAgMZsMYmgYmSgOGf2EYGjMtWcioTZ9mtvweYzTO668UgFD5cJ9GWBZV6bBZltF0qUI
         Rqm1uYFh/ba0x0h8vzwFa+fdDyn5GuHdNqJeu78TTLxGcoOQMCnZBsnO461mV7kWNrgP
         bhYurM7zGdA0xLi2wczNWuQLf1TiS7VedfnnQMDQjmHs+fhJ9N++uu+VmoboChBMtWNJ
         E4LJ/moZGDVYH4EX1c5zCqCenV/yFSftkp7etkHpSDOtUJcwQ9mIvKZIqmvWPrJALf4e
         iEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460082; x=1780064882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDhAoltlaw1s+bb8wQYhsM+Av96Qttuem2tUfK7aq0A=;
        b=Z1vpxkDsGuEumcmyaEubzCLh6VzltgX/kX/1duFOqocB8PZQ73rVcX067dwOFlUXqv
         hwTlt2KRXDmjn9zkIhwxS4If++lbKD3uvR0yk2kRtcyxBwSqfyrNodsGMU/PxlAZ83ee
         Ub7uxAV7UUhJq1rV1/rtSwzdjwbYKhWpiNHhY2tqUuLkuOPYD5GdCCPcBe22/78x4Kdq
         FmuLw5GyvQgSQPW79rHmRKCnR08mTbF6/5bBGOs/B0fYLNGrJIDveQefX9g0m8eDup/m
         A6qfMID5ua24yu0e+OEwD53aC6ZidV0btcC0ZwLXLT4jlLaNo/Yl01yZiFpQMyA7FhHx
         JOJQ==
X-Gm-Message-State: AOJu0Yy2tJLlO+wdxd7Mx4FrzBp+NWgpTnT+JONtq+7AxqMGpQJGkOjY
	5we6Q8UYD4ht8dAsZVpbYfr1o9fFCl++cpEVcWsskI60TY6tIYZUSj77KweB5gTm9hzIW3JlkZC
	4dN9je7TtxCyw5rkV1xoRG5wZYZdD3VacfUrlUaB3row4rxHunSVVmNZTfI1urqskcvGKsKzuTK
	b8szs=
X-Gm-Gg: Acq92OE8e+egMnep55DzGjYzmCYy7KK+KGRANuXeP0DwZSPuxkHyeRr04KMlw5JvM8M
	93GqRuwFr0n2esBu+is0I0aXFoCLYMHIG1lw4OsZ/iFxM5oIjwxodklBfR3DADslXWLpX45IL8E
	i/F2sYEjJpWSOIpRNSbMqY6YbrwWLTskuT8Rp2gz/IQjmi8orIUUyCNTrr2ZY963hmeTTjUXeDY
	EEztgBpHmqCiCsl4xmW0z+/5/GO6D7kx3fp/Um32JP3w6lt+an10N0HFyfZgZAB9Odd4HQWrG19
	FSRmAMyfMGnDJn9eptEjSNcy4lEQvqH7XZkaeDlVt4ub4CITMRlq6iFT2KvlZfdIiAlKLQ0FeJl
	dxGZnZjSkLBkn+A9oS/nCNa5f7EodIp1DnhkRPNZ4WS0Rmlv+
X-Received: by 2002:a05:6a00:cc3:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8415f5a64e4mr4193238b3a.24.1779460081897;
        Fri, 22 May 2026 07:28:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc3:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8415f5a64e4mr4193196b3a.24.1779460081319;
        Fri, 22 May 2026 07:28:01 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd8127sm2039826b3a.50.2026.05.22.07.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:28:00 -0700 (PDT)
Message-ID: <b6d9cc45-0218-4186-88c1-73a2a57f5ab4@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:57:56 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com,
        conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
 <20260519120238.1C84CC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519120238.1C84CC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a1067f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DQnpCjiGftk-ZKpXLgcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 13XYrJkHd2NRownvtejztWHZBtVwiIbZ
X-Proofpoint-GUID: 13XYrJkHd2NRownvtejztWHZBtVwiIbZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NCBTYWx0ZWRfX4BqPEFdg2scK
 L0EbweBMaCkgHJtt0GXSNZEICrjEye7P7uM7QuJKwrWpKn3jOkjSzCudG1+7QuQVKfpPGomvTiQ
 nr/S9QjsTOL07PUTMtoRWhDeU2c8S3qOc7H4h2BaR8YfoGrf1fhb8srs98SW8mmyGfkaYLrd73R
 vD8LbQKkoa56XNiuxfxKkrLwdujyAOmqPXRpz50sVN9zni//vUclU6pKEk2WfyKPE0V5Lp43Lcq
 tJ2OPCUKutoUnw8XFAG7ZmT9whN3HgwGXy8xCgGelpSYAuXqzBUKNlHSZObUhG0k4vT97JeqfYK
 mPOmiYBTvLrYh71plFikUDlv0jUs0nERS/IOVMTmwiiiB8zmP143d+1qK3fNtR+Lv9ivlotjaMd
 I4h/+LcAh2+PNGbR4wcmQxbPwQnXt/wHGysyh/XMG3xQb63fcGnV30XRkwlFHLh4ZIJalWbCKu5
 KTKe3eJm2LVma1pFLqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220144

On 5/19/2026 5:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The SoM device tree partially defines PMIC regulators (LDOs) but completely omits their internal parent SMPS regulators (S3, S4) and the required supply linkage properties.
> - [High] The SoM integrates the PM4125 PMIC, but the device tree include for the PMIC's SPMI components (`pm4125.dtsi`) is missing.
> --
>
> commit 1edd30ea88da411f667f786ef5494cebf1420c78
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: Add Shikra CQ7790M SoM platform
>
> This commit adds the device tree include for the CQ7790M variant of the
> Shikra System-on-Module. It includes the common shikra.dtsi and adds
> PM4125 PMIC regulator definitions specific to this variant.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> new file mode 100644
>> index 0000000000000..401e71720519d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> @@ -0,0 +1,112 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include "shikra.dtsi"
> The commit message mentions the SoM integrates the PM4125 PMIC, but is
> pm4125.dtsi supposed to be included here as well?
>
> Without including the PMIC's SPMI components (like pm4125_gpios,
> pm4125_pwrkey), it seems carrier boards won't be able to address or utilize
> these peripherals.

Will add in next revision.

>
>> +
>> +&rpm_requests {
>> +	regulators {
>> +		compatible = "qcom,rpm-pm2250-regulators";
>> +
>> +		pm4125_s2: s2 {
>> +			regulator-min-microvolt = <1000000>;
>> +			regulator-max-microvolt = <1200000>;
>> +		};
> Does this regulator node need to define the internal parent SMPS regulators
> like s3 and s4, as well as the vdd_X-supply linkage properties for the child
> LDOs?
>
> The driver drivers/regulator/qcom_smd-regulator.c expects supply mappings for
> pm2250 (e.g., vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12).
>
> Without representing this fixed internal power routing in the SoM's device
> tree, the core framework might not be able to correctly manage the parent
> supply voltages and states when child LDOs are toggled.

This can be ignored, refer discussion:
https://lore.kernel.org/all/20260519120238.1C84CC2BCB3@smtp.kernel.org/

Thanks
Komal

>
>> +
>> +		pm4125_l3: l3 {
>> +			regulator-min-microvolt = <624000>;
>> +			regulator-max-microvolt = <650000>;
>> +		};

