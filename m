Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321244D4890
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778207; cv=none; b=Jnggl2Hxi8RDpomA+osdvvll2rRwGiWrGADZ6fdxkc5PPOfqb4WqArS8dLBEMNJ47HysA2pfToustkGz+r2R151ASNZqmRDeoJc3tFHV1jY7MfOG2ogNVjyCH8wPhxXc4zVjvw4UGg2ME1YTbz2iLWDcLtnSEYl4ttqz+3MJIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778207; c=relaxed/simple;
	bh=iqtSTD6OUVhHsuOVFBZRomoc1pV+EhDwDeQhI7v2B60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDpag6I7Pj/s0uvUwYzAPEfMi5MH3Pt6keYWGE5LlPo7g2uI8QduI6rq/BJXh1k5TK4Z3zKN8gO7rt23kHKY57MWM8elnbuZz7a0Iwqm5KOSrtajtodbTGgLZTi4ElMQ+q63/l2eNxSj4XPYYTaHCB6D1hTtAp26dWCn8QbAkPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/E9aISu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJRW2+4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/E9aISu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJRW2+4K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE03Z02405910
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dKTowMYQvfYuqv4dK+vY7KJhOttZlfJWenJ4O7Vbwg=; b=H/E9aISuRD3tFJVR
	qXrqYGHMnZllbufIOsN6kXaaMCcijMS1AzFmhsqdGj4IQO56mGauhv1F+RmxtXsR
	6Dlaxaxqlv/ZO3MKu4FAqCC6a7DXXU5KC2UHy7EmxDEb1tnCPD/33gWsaFOABArq
	RVM0IhjZwXPLbrwRvz/d/3pLZp9lnpGlb7tw+8G2tpsuMu+/O0JvvwymeUKSET3h
	S4CEUYbGLCN7fWtTq4BbuMShzVpWz96zqPQdUdu75yuQpgSh/Z7RaZyNNlO4QP5C
	t+SCOr+Mucb53mApRhMb5WTMqMiDBH7ZFjDEumy/yGBbSeH7ua+Zkl7f7ZvrMDvh
	4YxS9Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c1sm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:23:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso57283515ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790778192; x=1791382992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dKTowMYQvfYuqv4dK+vY7KJhOttZlfJWenJ4O7Vbwg=;
        b=IJRW2+4KS/wwOCEoryhJih4sdCPo6ffrugkHvmcFi+DIbz9+VwRjXgc9RbPPwKLMal
         1J8P3gBEklEYi64SIC/tS1ac1lkvwCnTpgheus4zw1qDQ010vYrCxjvBXtq87ZAaMsAN
         OT//ooDqCIYiYMuimzfYJOcBDQCd7NCjD/Bsn+nXCvfszHeGGVt+7aqeoguPm6E2D1Wn
         dT132bXcUym9H4cn5v4fNz27mv8haJElo+wwwa5Tmn9oRIKgkAAyFJyqnWM2aE+i31jn
         Z7CIROMOeijfcHv12shftkQwJ2HpI/5HiZCVnotMhR/Sfc8F2FosOjXfgSK9tg70VQOo
         TN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778192; x=1791382992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dKTowMYQvfYuqv4dK+vY7KJhOttZlfJWenJ4O7Vbwg=;
        b=S/gLLl8nb/qehRrCG+5jFei5+rYZ36uOiCN8q+8bvLTnCKi0MKAkXpnzAguUFEXP8m
         AK4qJpqx2CXGWUqBy2ldTsLq4o4FXlHDwvOI8Hktn3zxPfq8UXzt4RY8G1wYQaNk7bTm
         1lAEZpfVadfSGPLqMlsVJZwMPt4eTA7ytX9BUv1qdjsYM5kL1rteluTSk+b40gkC+NKz
         jPngUuTn+KPPunSO9y1u0KVH8Dfwz4BjwmalVvuNJTcU7qrzRNojuS3AKsVy0tUoG+d6
         QRze7opjmFn2PI4Z1CPQFiq3xIKdETsbRX5nhuypff1VcvvAZksOyJZG6wxIO8et8TSC
         JhgQ==
X-Gm-Message-State: AFq9FYIsf/ZQz4NUrT02uT4/ykVabnkXiGhvya1d9sX1GdiWmWmUr7f/
	Cr4Bv3Ha8Xkq9817oypcpX9UVZhb9earDc6AuWWbzwXssfMTvAVMDksBIH2GFazGJMO5XpqVZo+
	IH4DVPk96BE4bGP8njC9bmtkiUdjE6/1J5LB080GVHS4MwFCJ4xFEGeEYXQcScgNTgauXCY8+Ec
	W6mu8=
X-Gm-Gg: AYBFou0wt77WUh2i0CdKIG3JtNhmZqMyumH/FqPWqLMmU6eYR+63Peyw+GMsJZUUina
	Ax6yj2vtOPwmO0OTz5ZcxGXnaV+93YliHakiNeHDKJQJshfxe6hPI3znUdN8LiUeoKfBaebOrE9
	/D+l5FprLnV9TDoluJqtM0SWnTOoSAl4BFontDyTUq4vOULhuXYU1N4VN1gtE+VXSo++yjMDK4Y
	zgHW/dmKbrRIZbxtySf3aFRMWBqYC3Jl2GDnJXdffbD+pbQV9hVxJ+y5oyotxZnv7XbzYLyjTjz
	OykyBGVLbfVGUOfRIBI0uaSNClewb5mXyehK+wXxb0WZrwgq21N6Hq6nz/uOUyCSAExgeKFWfNS
	uL7GkaE9s35KPxMAcrpjpYHGhUhvLag810Gs9Rx8AMrFtPkO/K5dft1yLkyNOKrM=
X-Received: by 2002:a17:903:32c3:b0:2df:964a:fd42 with SMTP id d9443c01a7336-2e2e4b5e112mr12495945ad.38.1790778191013;
        Wed, 30 Sep 2026 07:23:11 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2df:964a:fd42 with SMTP id d9443c01a7336-2e2e4b5e112mr12495585ad.38.1790778190243;
        Wed, 30 Sep 2026 07:23:10 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d2desm8727315ad.12.2026.09.30.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:23:09 -0700 (PDT)
Message-ID: <cc620871-e6cf-44a4-8026-ff42f35efc15@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:23:05 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/11] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
        neil.armstrong@linaro.org, conor+dt@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-11-dcf3fd37f76c@oss.qualcomm.com>
 <20260929060743.537E11F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260929060743.537E11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXwZvws8fx9rq5
 KgiUU10sxXjkKsjEWKunrkBjxUau9mOfF4CYQ7I1A+pg9zKSgttxU34AaceiIs93t5n5sh9wgY5
 gC9hoHg9pmhWAE/qGcHLloCGxI0MiR0=
X-Proofpoint-ORIG-GUID: w0P0uCyyHYfzX7efwA5wCRNbCeWP_1M_
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd1b51 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dezkyaf-IGWI9O4KkrQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: w0P0uCyyHYfzX7efwA5wCRNbCeWP_1M_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX8tvogNcJ41cc
 XsgAlojTvUGtQMRe7lK0dYVazJqsZ8t32wQQMYW3qds5JamhbKBgPxQaWRbnEH387T8ScSkdSv9
 YVcNQ0V/Lo9sAwtWegBV5e9cKodI1MQm3UKhScDjYpZtZDp7QKVyJfwsufmRdof0GRtzAvgn3TV
 RTgoim6SIYjfgxtItCAipjSP1q8C9V8WHR+QGSfZY75d140KAf9Ci1qcunIoKa8W6KtCgDtf0XR
 J5fkHcgwPHRlKJb1BjbmdESZMkBhINw+2its/4VZVVApidoAOTPrWNKkiNGJQ9evNhkd1pGJh6l
 r4z7/hvmH4qwscTslvx3SmEUpQ9V+mi6oET1ithlMZp4lmeMVgYUpG8Bf+nmjE0IyfYlsujm6Mp
 K+MHIVRK/+ceIHqzVO3ChSGxVsNkqv/+v8EhRdjvB9VZLxX/rW2Uhoa9p6gJ98iFfYyWgBE/2ys
 BBi13YUBc89qWHX3DqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057

On 9/29/2026 2:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dts: devicetree node names incorrectly use underscores
> --
> 
> commit 185a6cf958fbea99362a9e2c9f3989dad4362d3c
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
> 
> This commit adds TLMM pinctrl states for the camera master clock GPIOs on
> Kaanapali so camera sensor nodes can select the proper MCLK pin functions
> when enabled.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index c19945bc438eb..bbcd5a622f0b2 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> [ ... ]
>> +			cam_mclk2_default: cam-mclk2-default-state {
>> +				pins = "gpio91";
>> +				function = "cam_asc_mclk2";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
>> +
>> +			cam_mclk3_default: cam_mclk3-default-state {
> 
> [Severity: Low]
> Does this node name incorrectly use an underscore instead of a hyphen?
> 
> Devicetree node names conventionally use hyphens rather than underscores.
> The previous nodes like cam-mclk0-default-state use the correct hyphenated
> pattern.
> 
> Using an underscore here and in the subsequent cam_mclk4 through cam_mclk7
> nodes will trigger dtc style warnings (node_name_chars_strict) and fail
> standard devicetree style checks.
> 
>> +				pins = "gpio92";
>> +				function = "cam_mclk";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> [ ... ]
> 
Yes. I change original names to align with Glymur style but makes this 
mistake. Will fix it in next revision.

Best Regards,
Hangxiang
