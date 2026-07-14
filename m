Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F345BD71
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034151; cv=none; b=E8XfwRVLk5Gq4w4ssFD1O5IOh+mEj3c3SkHf29l1NqDY2cmTtRr2WffInVTowhpRF6qMoQpgQ/NOFl3UDdu16CUpTcCjnu5II/aOy6i71sttWLbHEZJKFS4LeDF6476vGbadJylehRF3NUPmxUyuSeE6/ywDF5jhSwty8AbOyLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034151; c=relaxed/simple;
	bh=GDta4Uhk2X4fc6/jmA/F5JrC1KIEFErRwtrKoNQ1ZJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOouANFQ5jr9GZOZEtcCdudKN9sCPW39pU7Jld1uBLehR6EHpmdN99z2fYiMmq5GxZknLtX4s7589xrlYcjnxto+YZ/rzNKhO4NR9MGfaL2bL3t1hbMH62IcP+fxHcZhTD4vUCGeDFsLroJikJ7K8OpDqK6C4YizdodW1r4PCKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXyqGxk9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMvhGiYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXyqGxk9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMvhGiYU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNj0M494330
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drji5NTNqWKsB2q0aH+BaAkELHZdH35cex72tz1Jscw=; b=dXyqGxk9fl9b36UD
	MFbKZWKSTcslrnUdUiPRtJjDBOgvYaEsIEVF52NDz+sZI4GzAu9nOAwcrNUqP+Ev
	YkfYT5mdAd5LMEFTXnjPpED3eXIRLQxq9M2FsNaFueWglq6Eg5tF16ZE99B7jGbY
	q/xt8G5ahm3EoVHKWpL5PNcHH1GYas2rNODZM00/ldXUkHc61ITCgaRmkfUSjTxk
	trEODuSLvjaIueKmWVI8j8msWm6rRRdphMnRYkdjJ/fOUPawBH8xhM3caK6lEwTG
	Xr8a9rSqCQOsTsdv7w8MLZbBQTT1YTJKY66gQIb/hr0IslE7xttXttSovkwWjyeb
	glU40w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cutgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:02:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a4d8fd6deso1291020b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034148; x=1784638948; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drji5NTNqWKsB2q0aH+BaAkELHZdH35cex72tz1Jscw=;
        b=DMvhGiYUqOAWFAq/S0ZlwcVO7qrBqMpBONuqOAcDg7f83A0+oViXdCePMLgwH2zwVm
         5w7lekfSfRDw6PqYYVDssDETrJcFOO8tdkKrlImZdlHHkJj4JdCjoUhSZw3pid+wVCMg
         yP3am6w4q4lfWPP3lALTLn82WvYxNvOUQ358W43610p38VJTiz0v3Z/BUKlagZmVPost
         G1YQ4nRezZgmeW+I2au3iakycchwA5imy4R1ZDpmTkjRtTYMeviiIBbt7tDMwwvCjuG9
         qGLlMBrqzH1DhQXckWbPNQ8+ejnDVNhBQNBxe1eRCMv8jqvLKpcEErY0ntXgBKN3Hp6e
         wr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034148; x=1784638948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drji5NTNqWKsB2q0aH+BaAkELHZdH35cex72tz1Jscw=;
        b=ZQqNfLMy2Ib1QsWgu5zJiPpFhrqebJ8F+mVPXAtYOHlTx5T6wiC3JTojkSa94XefJX
         Q+LbmSeTnnj9XEzKvtUECKEIMqzLy5ipjVEsKmpHlp+WYmlqpUHp+D1LeSgBDqTJ9OSr
         gajW1YAdZhmFWhwedvLhRm0bEo8dkwkbstDr65b+IS0pSJWy4Pl5ZY4g1KJgnjMJOpgm
         5BNa9Pt4jlzcXeW7dt0hYt0pTBEAnBoRPZIk2kZ8d57ZgYwoN4vyo1P90muRAqN9mWp1
         6qc22p99Zlmh8cG4TGCzymxAvHY03ddg0nNwYskGERMltBgRcmFudyQuaUWBFKdg8dkS
         Hccw==
X-Gm-Message-State: AOJu0Yz4yImLLMl4eUv0YuWaXgS28tEbtib0IaPod1Gob7zZZHzu9kn9
	zbIQzO4Y8hx0B51mKDfeuoduIgOGk8hjZAwYoK7HEBT+3IE9a6DNirL1bElncSTMtip1egGFGtM
	/HknDX54daylEtIxeDXToJQLiY5tweDStYBA5yyceWUOlk7dH4ZsGFYqdKbWkHubcyWx5uKeA1i
	FLLas=
X-Gm-Gg: AfdE7cnHDlSP/bzLJzIbRpzUa8iPo92/w9iyGRwUL0tbtqGelLhKxKFCQLGo9Z555ql
	b4RW21FWI1EaSktphEBvpEd/qrnopHvK0pWOWbHAc4TPj9n6WnoKF5vcM3H8ptjPBJYaA/fgbiW
	cd0bZEQKWw0zp4ZcTxIK3f5jVZP6qmgzMumN86do5m948xP/7IeYXbfdHOBa+LVDSxbeSnFXYG+
	l5diCHgStFmI/49FCoY5nXTekbQhyN8+8Hr8dJU24IoSZp82TnK0O5/zrH4ZiibHakE9hVXnSRH
	8Z2Hu/hqh0N86tKKV5tA1vZS5H38DIrk7vHpOaIco1UIOt3azKbGZyjznObWIyaUzdG1rTaGiBt
	k1FqHHi9z0b/N7LppoG+s31360i3f1aLED6aoeSDvEyQ=
X-Received: by 2002:a05:6a21:3116:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c110ad50a7mr13918538637.53.1784034146515;
        Tue, 14 Jul 2026 06:02:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3116:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c110ad50a7mr13918455637.53.1784034145754;
        Tue, 14 Jul 2026 06:02:25 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm143649475c88.14.2026.07.14.06.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:02:24 -0700 (PDT)
Message-ID: <f19076bf-5392-4267-bc6f-9698c045f9dd@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:32:20 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <20260709141034.15E201F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709141034.15E201F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ku_Dt7-i0A5AglX0zqY7roAVxcYMKVXW
X-Proofpoint-ORIG-GUID: ku_Dt7-i0A5AglX0zqY7roAVxcYMKVXW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX34FpqdfMXQ8k
 rq6vOUtM5pxN/mKGo3rASIR2eelGTSlOzc+roFg+1RgLNvb18rDu4Zn2D6ORiO1PODtQbArsR/j
 sX6NYRI5e1fVOFW0OII9r/Uj9eh4KRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX0zg81zyHODbv
 fZeyWoSU1DpwLS7EA2tOz80L5ATTSzhNVTWkakAdtr03eS8p2hhKyvFvWAp8ZzWfpgGXyXoc605
 K8EaPtjzBz2siblvWjkh1l/CNSZN+OTp5JeGFxfuBSB4pGuCVhzOIzNVhA2gcOCRA2qtT87Dxnn
 0UFL2w8UQlNys0QPoOJwQexdFzfqBwMzqBMPFq6nmcHv3yDOb9VJpaACmIJoHLsWbvFPfjJrdbB
 giCC6/4uR3rlbD0MHTnGLP50gYlbNU2D/c9DOrmbQy4TKAw6lsQg25VO3G8P/vCqxpvhY3po76F
 ENY72UoIYg57uRlh3MsolgcgK3nlRK9+ccGroPC8U+l10dueKjrxNaMxJHrxH8d3IWA/Fv0rTuA
 ZOoIH6qkTqALLUUzcjlp0LBQ89m0x92XLeUm06s3w6vIeczS1qYXZPrG2nCNIT3PVmy/7go110R
 A+3V8k5TrXF/o1NdRRw==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a563364 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9hASng3_XfuON5wlUrIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140135



On 7/9/2026 7:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `iommu-addresses` property is incorrectly used to limit the non-pixel stream's IOVA space. Instead of restricting allocations to the 0-600 MB range, it marks the range as an IOMMU reservation (`IOMMU_RESV_RESERVED`), which forces the allocator to skip it and allocate IOVAs above 600 MB, directly violating hardware constraints.
> --
> 
> --- Patch [7]: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub nodes ---
> commit 96b940efc5fae7db37d762be78144fc901472a7b
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub nodes
> 
> This commit splits the Iris VPU into non-pixel and pixel sub-nodes to
> describe separate IOVA constraints. It uses a reserved memory region with
> iommu-addresses to attempt limiting the non-pixel stream to the 0-600 MB
> range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>>   			hwlocks = <&tcsr_mutex 3>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
> 
> [Severity: High]
> Does this iommu-addresses property actually restrict allocations to the
> 0-600 MB range, or does it do the exact opposite?
> 
> Because this reservation node lacks a physical reg property,
> of_iommu_get_resv_regions() parses it as an IOMMU_RESV_RESERVED region.
> When iova_reserve_iommu_regions() processes this, it permanently blocks
> the 0-600 MB range from the device's IOVA allocator.
> 
> Could this force the allocator to fall back to IOVAs above 600 MB (or
> fail entirely), directly violating the hardware constraint and leading to
> the device crashes mentioned in the commit message?

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash

> 
>>   	};
>>   
> [ ... ]
>> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			 */
>>   			status = "disabled";
>>   
>> +			iris_non_pixel: non-pixel {
>> +				iommus = <&apps_smmu 0x1940 0x0>;
>> +				memory-region = <&iris_resv>;
>> +			};
>> +
>> +			iris_pixel: pixel {
>> +				iommus = <&apps_smmu 0x1947 0x0>;
>> +			};
>> +
> 

