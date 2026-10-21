Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577737;
	b=Uv7cDU9K58sNTvXsy89Aj0Le01sBHN0ICK7ZrwhhjxOECAUYatZl/fVMGHQYRrTYILrb
	 wzj+7GAz+nrUFzHt+E+opX2fvJQEibRwcHqTA1Pul45pbVpcrpD6n+ViK9UELnLwQUX+3
	 45hgyGDsrZSRVwgKaracaC3unn8dd6urAke1DwjM2hzShu0HaeVMCpSdzm+HnWYkSoQx9
	 7UyOmW4KMIVfmkjp+riM1kAxY9y2XXFpNwLWVW6HQnO9VvUGzZjgX4Nz6a8dS1KEnz+X3
	 gmw+lct51H1EGSGmigLPh/WNb8bks/wahAPVmFnkZnsX8TZsbFJ0jhOpNy7JgK47CwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=;
	b=TBuWfwGU4HU5vgcq3b5SGQQMCuTX1Nxyf/nXdiJndy7Ucry1Qkh8je6uSPECXzzIlyN7
	 /YQGEyMsGN7VghLqlspYN4NQGDdqIpqUZwaPkAc0o8IPPD5lyByzB3Gk20sDjhOOiVRUr
	 IYWZxHrQO3J56sQw6ZPQph+GE8TLLgd+QDX1Tbr/YCelpbqqzgtDsueB+SlYoQ+y0Xh5w
	 20sqUGrrVWVIivzBd9V4XwdHeH0iff8xwnQH0nPzRjkMw4/O1GxZhm9Z6FMrompnh+jR2
	 zFT1jq4SFEYGBsA8fuSNPWCc1N2XoCN/Zt/fC2r/b9MNIfOzaNZ+sDdVfcMFiAeCjWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjfTWkdO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dFQ4XIyh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAE3606A31F
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BAE3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjfTWkdO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dFQ4XIyh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6Mrp3621183
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=; b=pjfTWkdOnXjiMyxe
	CbrTorlcTfm6p8dazhPPSx58tDtspamwDRmSZiuvaFxMztwQadG4+WM4nWq4JAJj
	fhkMSy/XUf1ad4RBE49udduBMwH0eMQM5KqtwbaLGb/1mXNd5gloiAgxr6qJQ7gZ
	J1WBPtzazS1v1C11CWxeccYMtHUXDDda2GNgHxBjlUTHZNYTKyngBIl2EEt8STEu
	OTGSYV0qWiKuemGnrmFfkDjgn55yVEu3iz9C8UVHUt7CZVWyVoLOrVghloRHmVa7
	SI9yH00apE2DNPmX5NpfZCUs+bvukzQWrDmIDYHvyq0TIRKWxD4b6DowNTxte6Ks
	42is+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3twp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:15:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac16335199so571823a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577735; x=1793182535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=;
        b=dFQ4XIyhd5Gco2mFnsRH8DtM2w5F/xoX6rkzYx3kkgsiA5dGxd0AUILfJ/Cgky0y50
         K/gcwzSkoT5zF9HglVOJXZe+uVtj4rvicK+5wcYUMrskNzMBSdRwyBEvY72OYk4/Uu6G
         QEnQCn0u31DsIfOmS+xAueTPbWj3qs7IDxbBd3TilAxE7DfDGEGFK9JXi+pitFQ5l9Lp
         H3AyBbouGF2xZ7yN2Yy+gJRXXTAoe2As0nY6nNognrq/6IeEDfzVMn6kz8noJoDfmJOm
         kLmv09wbkYpEHEkWUMSSh//wPpKjggHcw1iLjaQOywjVKiemB/jul7x2lT1KezBQ8Xzk
         vFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577735; x=1793182535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhoI8znfXdGm+yPN6uFO9tAaso3xMr1cOltvpbG+UDI=;
        b=vhmGsBgOt/oPaCx5o5uHmSZG4bLl5GensKZx9RO1tltFMVmk+1zjFzJQCL+VKIU+sW
         DdfEK7LRcm2kMe3Gq90n1go9eULrNPprmQPmlpseAEANEUKL1/KNUD9OpItcNhz2j8t6
         0zxl1TW4NQQ2Ongl0dLt5yUo/a4UPAZqAlpbixwVJavGk4+4GZTQIOzmr0+QGcMPZJh5
         CurjVe7jSsF0OwD+i925DCqo3C4a2+joPunCA6zRtLr2mMIEPyuGYlZ6rJrlNyWA+K/L
         VrKzrye7b1qs6AlTRDx47xW/GIuATMuwpNeKsGVHP/egTUGXwzKw/lKNCI+GNwBV/IcR
         bEOg==
X-Gm-Message-State: AFq9FYIHY1aYcIbTGSd5i1UVp6DiWIH3t4W6EBeiVdnibHFhmQTKxlUd
	+CfzBVvXCXJmhEIkoeXiRAqzsJnANO6AcebT3ktOHIyt8CJsAVIX0z5JMy0ujlAmyHbmPHSARux
	xdNz5Qv0vQv8/nCBMWJWPoNWyPEIY8eoAaNfZZL2MbbuNrMKR5aBQBtbsFHpueQ3wcisgw7Jkrl
	Pt7/w=
X-Gm-Gg: AYBFou3BVPN+cjsUf06JexhwaO5P39NLVpJGBpBz5pV2fNWjOA8v4imZgbwL54Oxve/
	smHfvFzxQP9/ykzTX41wdrudoeuDDTm9y8u8Oeq15+kmdJqreEl5K+5jUIeel3JNWLB5DYb+y2/
	rXOGg4DSsRoYrE+/ZQgUUSeec8fVZmXbvznEk70pAeZVw9D/PpRqBMxphK+HprHwUxgJLO2u2eA
	nub55/3AMEuUOmueyCzuZVlp+EtArkhh69l2axVrhE5JNZjpYl+DQ3V8bfhsA/fuoli0UuJGJbR
	FH4/+QUSL27p7WWTylOv3Ra0OBaZX8LRGdiJK2v0e7jmoCkFFeknIfx0fkM7moSuY6O2DNX9dWA
	U5uApVDjpSrQIMqi47T/CMt6flrLYLqQ12A==
X-Received: by 2002:a17:90b:28c3:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3ad86a44f73mr1374798a91.0.1792577735499;
        Wed, 21 Oct 2026 03:15:35 -0700 (PDT)
X-Received: by 2002:a17:90b:28c3:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3ad86a44f73mr1374758a91.0.1792577734155;
        Wed, 21 Oct 2026 03:15:34 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813de463sm3759170a91.13.2026.10.21.03.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:15:33 -0700 (PDT)
Message-ID: <40f9ba00-929a-490e-b578-f88867be383b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:45:30 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-9-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173678@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173678@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX0eTEMH0ZcR82
 fCq+yefF48efDaPl6wYpRPjbYvIcSFNSS8nXsqBVs2kotL2HfS8C42pkJLGtzldGtobLTcg8yg6
 kf1GCkktwCOF3Y4+gjcC0pUwvBZcZubZKL+iZlWQ9NURDmmVibgnHk0Mt3dufsni2UA9Eg0eDaB
 ZQfNcKdM3R5kJHLqqQO1PMwHOL71D1GTz0LTF3v/n+IrKenoEZcqRcYW1mmdZ3OwusEjxIcoLsF
 p9XrhWDoodSd2XXewNPd9P57zMCuPHWaFohOyqT4rZDFS37i1axIUt88q8LTgkPtcnkMB6jlMZz
 JMeWvNb3qb15zQ5elBje+qsLfhZaCqOnxrtwyX4QRF9fhB2QWeISb3dNutFU3MNKblwtAF8COGG
 XouLQkA/CBFVNgsTAoHd/l0P5LgyWYP+44YZOq4dcZ3XWMMl9OeKI+62fuuh8hv8INrWh06bCKH
 Hi8sOYI+BxKIoJ0m8SA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad890c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXZuLjuy80gFrzuPV9sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: zOliVC-eWr_kePxLSTbU1k1bukRYhKvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXzBYrIdAfJTc5
 uwqgeGdt56FVgVeuC1AYKO9kJKcWao3Qhjs/jaozIlVCVxhXBqe4ocUYxBl0yed9eS5pux2UmqG
 wtYL23XxGqtCZToZtk+UgafRJgPw6Jo=
X-Proofpoint-GUID: zOliVC-eWr_kePxLSTbU1k1bukRYhKvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040



On 10/16/2026 9:05 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ath12k: data-region loop incorrectly intercepts all memory chunk types
> --
> 
> commit 1f2202b158e5c8168f0cae90faae57bce35a9612
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> wifi: ath12k: add support for unified data-region memory allocation
> 
> This commit adds support for devices that provide M3 and calibration
> memory through a unified data-region reserved-memory node. If the
> data-region lookup fails, it falls back to the existing per-memory-type
> allocation scheme.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> [ ... ]
>> @@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>>  	const char *rname;
>>  	int i, idx, ret;
>>  
>> +	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
>> +	if (ret && ret != -ENODATA)
>> +		return ret;
>> +
>> +	if (!ret) {
>> +		avail_rmem_size = resource_size(&res);
>> +		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>> +			chunk = &ab->qmi.target_mem[i];
>> +
>> +			if (chunk->type == CALDB_MEM_REGION_TYPE) {
>> +				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
>> +								chunk->type);
>> +				if (ret)
>> +					goto out;
>> +
>> +				idx++;
>> +				continue;
>> +			}
>> +
>> +			if (offset > avail_rmem_size ||
>> +			    avail_rmem_size - offset < chunk->size) {
>> +				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
>> +					   chunk->type, chunk->size,
>> +					   offset > avail_rmem_size ? 0 :
>> +					   avail_rmem_size - offset);
>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +
>> +			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
>> +							chunk->size, chunk->type);
> 
> [Severity: High]
> The commit message states that only M3 and calibration memory should be
> allocated from the unified data-region, while other segments continue to use
> separate regions.
> 
> Since there is no check for the chunk type here, won't this unconditionally
> map all memory segments (including HOST_DDR_REGION_TYPE, BDF_MEM_REGION_TYPE,
> and MLO_GLOBAL_MEM_REGION_TYPE) sequentially from the data-region?
>

The data-region is defined for QCN6432, and MLO is not currently supported for
QCN6432 on the AHB platform. Therefore, the firmware is not expected to request
the MLO_GLOBAL_MEM_REGION_TYPE at present.
HOST_DDR_REGION_TYPE is expected to be allocated from the data-region. The intention
is to allocate firmware memory requests from the data-region, except for
MLO_GLOBAL_MEM_REGION_TYPE, which requires separate handling.

The MLO-specific memory allocation can be addressed as part of the MLO enablement series for
AHB devices.
 
>> +			if (ret)
>> +				goto out;
>> +
>> +			offset += chunk->size;
>> +			idx++;
>> +		}
>> +
>> +		ab->qmi.mem_seg_count = idx;
>> +		return 0;
>> +	}
> 
> [Severity: High]
> Because the function returns 0 here after iterating all requested memory
> segments, does this entirely bypass the fallback code below that maps the
> dedicated q6-region and mlo-global-mem regions?
> 
> Could this lead to device initialization failure if the data-region is
> exhausted, or place hardware-specific memory segments at incorrect physical
> addresses?
> 
> [ ... ]

The expectation is that each firmware memory region is allocated either from
the data-region or through the fallback mechanism, depending on the region.
> 

