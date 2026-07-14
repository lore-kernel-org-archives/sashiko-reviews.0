Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BC37D128
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027223; cv=none; b=Ldi5boG9ZgC4+8QSo2xFrEoLjdHAOA6ZfEoo7nZvqLuBQHsD40je3PtM/XHEPHFgbJrdYH63KTBJ6zZfpCvFlVo6QVeZ+3XJ7iZz5dt7WXF1yZWMc1ZTSBFY1uzoEW1i4SNWH0Te0g4bRgL3Mwxnetf6QCZKNr9j9iZjiM1g3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027223; c=relaxed/simple;
	bh=/oCGcbO92CXJxfjee+oJlAh76ENlf90mIXAMCYrOx/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnZO6GIoEtE2TkiutiEMxqJp3k/zh/EI12zDT9Be0/KfBgJrGERyP831EIQCAuUefBZ0ohnlzuAPSWKr+YakaXzEC92jwgKO+rVTJPVZ15w8JeoXksVpLByD7H2KCv566OdLPvz+vfSUb7qJPcnP7biGv89ORmBjA0llH2w83m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fukgx8a0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQe5as4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fukgx8a0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQe5as4o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSwX3740454
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w40NiGxj6RTgqfp65+txKyvRxDgIluHYs0R3BmaIUuU=; b=Fukgx8a0y5FjnFXM
	8Xg0LeLvtLFi4iWNBJ7b6VjO8N7BA9t5v3HCo7yf355UbMZ/Zvm0T6vowuZSP1Nj
	O5KSjOu0YeThYW1P2TU2U1dLYphOpS6mCf1BNO1RGDbFsV4HE/3XXz4sp+vz8kaj
	FMDHF9FG0lvADK2zNcbUwrtrBgkAka0SdnGq7plB9/ksxJB6hjdveosQp+5kcd+n
	AwLP6Z2UJ/9Tg6CM5yVd9sHD9YQgyRSIeq5qpaXrVk5QugkDZ/xQ8eOcMr/lKL9y
	psqeIQw2W+2MABT/9tDibUJ1IIPxXudOwFSBzI9Vlp8ZcGIMSuceSF7omOqbjxw5
	e6XPdA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde09mhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:07:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so1364641a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027220; x=1784632020; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w40NiGxj6RTgqfp65+txKyvRxDgIluHYs0R3BmaIUuU=;
        b=ZQe5as4oouhwBh7JQfeq6w2EBi63P12LtuiCx+zNeGvuGW2WT9A3zNn/U3Se+7H61A
         GtXTGi7YjZwQRwlIY1nCkjCyTI2HE8Pky0gwnb9rPgPbgTLFCJwrtN823qfGsku/t1U+
         Mqjs+ehmi+LjQ8ZV1P284NoSTdxE4Ro7Uqq6iqU8NAHW0RVcCHROr1TQgaHLaqdBBZ3R
         WSy5tSB+5IpFcYmFZaXXY/DcryrRSTZnW/sTnUYnA/ss+M3tUB6rQQ+5clxLVIKHlRV/
         2olHGofueiPMrpHGeBDAJJAz8Zusns2r4GKPdI1Tw0xHsxi8x3d40zCjBzbKJujioOjB
         /sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027220; x=1784632020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w40NiGxj6RTgqfp65+txKyvRxDgIluHYs0R3BmaIUuU=;
        b=m/AvWpXk7YJtunucroaZxJqEgjG1Kd/X8QVFTgbjR267dBbtPLzcY1q7/ZtHv6cVcK
         YLyIy5Ued3XICzwQj0r1lhevV8G2pjrYII6gRlPhvie6XhgWt8LIxZXqK1evKfxiEyDc
         dbWYuSx92k7nMzqhpcfyan8f3SxQPMMopYaEfx4VoE9g8ZQkdiMYRu9pEP2fZ0AQ1H1Q
         PdKmY52UkZJfoyvP3dcS9mIVoFWoyrbyy4icZ/rJR4TWTJZ4oH1ZfKX+MyGgNqyy9xLl
         5U3EyoKU6kx+7x4Gpli4buHsN1epolNb+wp31DsE8+r2g81VlcVy+anVh6olZ24ZcJy5
         5oJA==
X-Gm-Message-State: AOJu0Ywj5laf7drMaL7pBzNIy+YsVExkzprVaVnnCPyaATEyPwhX2bBg
	Ra1xQHJA+vwyQIzL8C8VyrT8o4vJCzAeJmVk+JW7dCe1+Cgh/4gED29pDfBDLV6+VwsRQ474JkP
	60yPEb3/359EG+Wixq58aT3LckhN/IQVEgeRJY87fNFbba3pC2Oxr6NEOUJOysmlwTAwEdXJi95
	UCkwg=
X-Gm-Gg: AfdE7cmIz8gajyQUFgie0w1smAJ5YiJaDrHwsf1Om8+bjc2+fZWCSIl4ba1iqnCG/DW
	5GQr8J23z4JmRxO9nmiP2uQQLQepIro9Wz/AUUudZ21DIEB1IotlAAlbMo7YtrtYiMAdCuDJ0Xw
	J92vMDjXjSav8PfsLmd4FYmKOuyCwKTK7R4424a5CpWpsmlFedtR97Hi5hEdtBsOKU7bFM/nQfi
	czkGQLGikI6Wmm0vH7be15l266BV9YVV4+LpmJACSDQHXC2YrTqAruclzwBWaBjB/nd12d7avts
	CppRA6ji+vzctqzfpR2w54JHPS2xoJnXXEi6HycnAlSi5MZi5MpvMM5rX2Dn/KwHv9SltsJs5wi
	QfiaRb+E4jcWyrOTA9AlR7n0eL1M/N2jY6fkzDJJ/SyFa
X-Received: by 2002:a05:6a20:7346:b0:3b9:545d:c006 with SMTP id adf61e73a8af0-3c110009a30mr15146524637.15.1784027219833;
        Tue, 14 Jul 2026 04:06:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:7346:b0:3b9:545d:c006 with SMTP id adf61e73a8af0-3c110009a30mr15146485637.15.1784027219359;
        Tue, 14 Jul 2026 04:06:59 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86158936eec.19.2026.07.14.04.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:06:58 -0700 (PDT)
Message-ID: <b4812174-4316-4ee6-9342-ad85ff9a2a32@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:36:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
 <20260709152938.B4CCA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709152938.B4CCA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX7/+gRS1qTmS7
 stTtf4zT3RosWtpgChn+AXeq3Vt2NaUBcBnkys+ld0+Fr59LKZSj1RtlaTb3vu0SQk1LR38sHBh
 Wx6/a0BrOTRFECB0hPNLcUH6gyn/cf4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfXxuI45QeX4XSn
 KGUEWi9BcucB6r7AAxIBcz0xbFLkrPgN5MsCM7gdzK3tnCoZUL6kjFBEWH34dfBqtuYF3kkM2Wt
 tUGeBUl8p/GgY+aM+tUjhUAGPMN0dqnxPWqf6z77S0yx6eVc2svXGoXaICkLL/dhQFj/ecKj2NA
 dymLQ5O3BWi3BqOTGpml6STbNuibMx3tQxdBQ3yr1/B/pAFwQTomVQz/Iah0y20am6V4CcT3xNN
 f7cSxrOt02g0QO7YlklGz37613vLRGiHaNxVWU5TgFV8k7WJ21Yhz2alfYxpTZcZXgiwF0650h5
 MVKSE3Kq89VwLu0SAq93YL8ZdVLd5v7mcZPQa6nf62gTIftFQIQEq7pWxLCnwIt2ViuA7nO9wUq
 tPqFRraYxZXw4cwrCip3bqg7L5HJzV7N6W0RrMbGDa/OjybzPhEHuaOFaE/4As2lvWjTWMVMqGA
 j5VO7LbyqrJTscDdm1Q==
X-Proofpoint-ORIG-GUID: I9gfto6J3R-o3TBDMHQivbvBbteYqb68
X-Proofpoint-GUID: I9gfto6J3R-o3TBDMHQivbvBbteYqb68
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a561854 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=29mSHvePwSPkv5shI3oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140115



On 7/9/2026 8:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using `iommu-addresses` without a `reg` property inside the `reserved-memory` node creates an `IOMMU_RESV_RESERVED` region. This explicitly excludes the 0-600MB IOVA range from being allocated, which completely contradicts the patch's stated intention to limit allocations to this range.
> --
> 
> --- Patch [11]: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to child nodes ---
> commit c2708742df23b3eb0cc33ed47303581c81143971
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8650: Move Iris IOMMUs to child nodes
> 
> This patch separates the Iris VPU streams into pixel and non-pixel child
> nodes to enforce different IOVA constraints. It attempts to limit the
> non-pixel stream to the 0-600 MB IOVA range by adding a reserved IOVA
> range node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 447b788fcbb96..f9c03de1317f1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -1849,6 +1849,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>   			reg = <0 0xff800000 0 0x600000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
> 
> [Severity: High]
> Does using iommu-addresses without a reg property in this reserved-memory
> node actually block the 0-600MB range instead of allowing allocations
> within it?
> 
> When the non-pixel device is initialized, iommu_dma_init_domain() calls
> of_iommu_get_resv_regions(). Because iris_resv lacks a reg property,
> this function returns an IOMMU_RESV_RESERVED region for 0-600MB. The
> generic IOMMU layer then calls reserve_iova(), inserting this range into
> the rbtree as occupied.
> 
> If the 0-600MB range is reserved as blocked, will dma_alloc_attrs() for
> the non-pixel stream skip this region entirely and return IOVAs strictly
> above 600MB?

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash

> 
> This appears to contradict the stated intention of limiting allocations
> to the 0-600MB range, which could guarantee the very device crash the
> patch aims to fix.
> 
> [ ... ]
> 
>> @@ -5231,6 +5235,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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
>>   			iris_opp_table: opp-table {
>>   				compatible = "operating-points-v2";
> 

