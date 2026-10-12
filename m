Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF61443C29
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789912; cv=none; b=H7QY2FJDK0QinArk/3EGq6WTTvPghlSd5h/Ma3LnoWujyBqAjAaMCi3M949xqb8PbLtFVktIDr2mNQP/qQKsuh0jMetIJJoG/TJsl9CsB3sTjEVuVK4paEfSrqP5hd2xP7eoeS6T7fgroor9S76brLuLASTeuZd+N+4iaWbzN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789912; c=relaxed/simple;
	bh=hEdQqbGZT1mBs074Be6CoQP3CZwoEub5t70to2oEx74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8BYzf4UXI859jdfga1qpiYaYqlhgvdCRmQESqu9Rf6VLwsou7LEEKuBB6bj9eJ8qepmAo0Vxypy9aZNbpg8ReDnqQoY1cnKRjuiO/Ckgbbg1uioAIBzp18E0nmRX7VEr2puk6FEJTEZ+AE2g8wOwClf2EToa1eWB6B1IlK5Z2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuC05lsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhopYd7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuC05lsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhopYd7w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55pCe302995
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOLBtsjSgsUhKw91rtETWlZx1b7vowcBkkj5e27BbJ8=; b=MuC05lsRPOh01+Of
	nw58vjwozJMOfVbOoe6pVTiD0TCWH0iuZbvpen7NXuZrL7n22EsvQN3h6gX5IFFo
	fUZneOmOe/SVJ8PgXmWfN1Len3DR1DdQGrBIreOGhomF8ZZbrOufK5v23sCxP01z
	ZB7tFZkKCeSC2unqOfZ6Xr8qAxFYFNkXEsNj3VVoWxSGZ6VvQ2ei6PbMI0n9Tmiy
	CsmRTjxSVgg9561Ht3PHy2Q7VQmaJ1tQfXl9kRFLJHHAJ6A8uTLATzYiXDJf8WeM
	r/Gvv8eLik1JdmRKetXtCC7NCtfRK8kzB3w+v0iqwydg+PtYFyJoXjk9L1iMsPbl
	dChteQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dhj3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:25:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2217610a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789909; x=1792394709; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOLBtsjSgsUhKw91rtETWlZx1b7vowcBkkj5e27BbJ8=;
        b=AhopYd7wyYteC29ib9UFOlrHPLzpW4r2hgbwxqA/UrsIHjgwccILZ/T3Cvk49riwOG
         OsFaMLH8wgHQHQFxTlCyuh9EoSR5MsqaSVwKpaj1OxuHFWcc+m2nu7tjVKzBgSfaHK1H
         mmZEv5aBok6nw5jibpWcxxEe9eglmQ8MqYjsG+VJbXcnvddWm6x8jweQ0KThatmBaZxy
         bbzFtinUkkxii5zxnPrBImGfTckfYxYAES6/HE6gIe0ud+R7Jrz5YFErh24aoH6elzLG
         jO3I4ljWIBi0jJl6pj5VxhED3E+OKCl8Wq+cPq86GnASKPtAoVDdsvcTk+H2Zqcba6WH
         zKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789909; x=1792394709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOLBtsjSgsUhKw91rtETWlZx1b7vowcBkkj5e27BbJ8=;
        b=V3oR8+BAm2cFZRVXrUg6E8/4tXR9S7k5ZoEiZeuB6L0AMnFPnkuzlnT2NbUVU7vW2v
         seVxINytgEn8XwNEoxpT53Dq9a5eWc5uNUXN1YSDNrZurHQhqtk+ajXNUD4C0fuykRTR
         k5f1s8yB/tvfnmBvsgUT4XiANDKq2tNyWHfV17+Ukomy1J/HxJ2hdje5vZHZh0tiRo6d
         ZWpeMIXGaFlll/xCyoV110aIx2YUWo4USO3CUrhL4gXkrX8B52z2So/fmrtViFoLIQB5
         tcbVg3jh3dlL6HBBOp/IIIEGbdxYAWuGxOgalXvKWwZEu99kjMii6RXbGX1UrAc2lovG
         qsqg==
X-Gm-Message-State: AFq9FYJsvxr1H8qDmvg7floOO1LCagUmRV7MKvsfjECHfVqVt/S9bkVN
	LMBVebXXYyP0MlayE3qweyZGsVx0r+9ejtkfqRG1P1wITFkAyg6fGNBPhNbv0fZ2yaijUMqL/kP
	6rwCU5z2N8cmFuxFWWDa8gmGR4Fk2urZK9DiM9y6XlHzvoe/nefjKOMiof3WRWB9MhOwOzT9fh2
	6+VTw=
X-Gm-Gg: AYBFou2H+d1HW6i5mUvO3ZOweDjXeFqCouVdPL7WAOhQ6h0hFNi8np6Mra7L14QnjZh
	MqwpfZo48uLPTnYtb/vE1YZYHE6i7tJ829qKBbqKGrAVo+r9LacUBnMuRCwoUUJ9zlL/Lo6j/dP
	LVXolPGq5vv1Qk147DyPWcu+9b+xDTGQ5fyhwxjd6SuaL6HDypJcdHMsenJ+fcGWQ65SMj1tOJ8
	beLeyfezMBzZukllGG1N3jE2780X13V4M9kEn9IATP/1lXPhna/An9pkC7Ha9wJ8EJahjjBwuOJ
	IK933+R6+31NND+N2tDmf0vkI3X6yZo/CBRjK2VfSU12Aabv9QvUsdtQ0KTVxodlxHXekVfI3KB
	qECVT5PHpUq2Jm6pS+CWgbR/ro1mBB8hrzg==
X-Received: by 2002:a17:90b:4d86:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3ab3a2fe72dmr6631476a91.4.1791789908518;
        Mon, 12 Oct 2026 00:25:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3ab3a2fe72dmr6631459a91.4.1791789907913;
        Mon, 12 Oct 2026 00:25:07 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm15769738a91.17.2026.10.12.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:25:07 -0700 (PDT)
Message-ID: <67892660-8ad2-4d53-9b87-dcd81d06e746@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:55:03 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-9-2c5797b5e4ac@oss.qualcomm.com>
 <sashiko-outbox-164021@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-164021@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX6aM/9/6hsMke
 jd0DDeAAbDiZcyXuKip+69kb2yY/ZLKxZniZZHLNNj2BqbEoiQRqjxQ7K+55LVLZTWQ1euEvw3T
 auVeJIHwE5usO0sRe0fR5c/8qROoAbv8pu3GMzGY4/l4gX7BEdD7VcVAnbwfacbbCwaeom/zl2q
 hamrZZ578RoTAX2StReJq+qKTp+Ku8SWpqtPVc7f4AktO9/mu2pmtgygL1n6qYVha47WrEPGvHF
 KGLIaktvU4ZFsDI6zVa2D4PKQynH1Q9na9B9zEBsTT7k9kd48CEzxu6s/LmVDXgWgzAp7VuoUp+
 QWEh2mgtMzGqdGvLPfQo4+XXhrrIQ1nBI84qcHSlv84NTrkk9yeoSlcECFWq6f6Wl7C1g3Xy49s
 yAixXYccPIc6CNeCUPhoqK5UBMMk0AxboM1sR5gYunkDf0mXdaMwx7vWSZ3/wYb4ewaxIhVIx3C
 hJgF+zRLDricOXyY9vQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc8b55 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LXZuLjuy80gFrzuPV9sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VnEAl5s6meSLg6XsEtGw38bPQhDnsT4r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX4BIqFuYN0Lmh
 7RyzvRAefJxulaTgeW5TGp8Zg1p3Z9eV51jpcGRP3RcQ6FsU93sA6ZL4LIdlOuvHzwaqlN327rM
 gF6qQ4a/T6DGEwYyiOdy+OP7oHaRGss=
X-Proofpoint-ORIG-GUID: VnEAl5s6meSLg6XsEtGw38bPQhDnsT4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029



On 10/8/2026 4:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wifi: ath12k: qmi target mem data-region misallocation
> --
> 
> commit 889e203c71e56c91154908ff956ce486dc098cf4
> Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> wifi: ath12k: add support for unified data-region memory allocation
> 
> Add support for devices such as QCN6432 that provide the M3 and
> calibration memory through a unified data-region reserved-memory node.
> If the data-region is found, allocate each memory chunk from it sequentially.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index 817bd820623d2..cc488cfe2b2fb 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> 
> [ ... ]
> 
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
> 
> [Severity: High]
> The commit message indicates that calibration memory is allocated sequentially
> from data-region. However, paddr 0 is passed here and the region's offset is
> not consumed. Is CALDB intended to be allocated from the data-region or
> mapped to 0?
> 

Since ath12k does not currently support cold boot calibration, the firmware is
expected to provide a paddr of 0 for the calibration memory in this case.
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
> This loop maps every chunk type (other than CALDB) sequentially into the
> data-region without filtering by chunk type.
> 
> Since the commit message states the device tree continues to provide
> separate q6-region and mlo-global-mem regions, won't this incorrectly map
> types like HOST_DDR_REGION_TYPE and MLO_GLOBAL_MEM_REGION_TYPE into the
> data-region instead of their dedicated DT regions?
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

