Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6972C477E2A
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036901; cv=none; b=YakNE+H7lUyEj5kEaMMM2/0F8r/8QIU6Kx6N3LeEEX4jVkMjoQyeY4FklTtI1L0Zan+ZGIVg2raNqDvaf80D58lPXQqaHFR2MouiLGNSLS7eCU/XJ3dE8UWBSNocJ7MnI9mGrrzunESraEsqxe/u4DhRAByIab1UTIw8BBpEppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036901; c=relaxed/simple;
	bh=OhX5Vz80AZZ9G3vejO5AFLXV9ypVvInloDvuW1jn7D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYZObKGY6RD37roeo2IIauyHxq2IWBK6F767DOcuuDcfTKMHg/xal0W7tPtN6AetcSTJv7IBCCKLEyFLacHm2zr/JLhWXz5L/JirvQ5Wb1Bm7caf4SiBA8EBrXR8pi63uI8QNsLS+NCW6medloNpGY1X45huZfYfMQ46En3MDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFj56X4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQUcgH0o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFj56X4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQUcgH0o"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED3c0N580236
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qryvjUpCDzgKV4fgQwaIiWJ1Taxd0ZMgBY1VIfSBwJg=; b=EFj56X4hQW1+F/Pi
	duH12OYi6QMvFpyhpm8omAu1lCVOiEz2AYaPgmOOyBMaZqIZnuouGH81/sewTxWD
	DsVw0/YyPnT53HDaS3jy6DWz9TlvxDAiuCw1o0i5kzZfqeLg8Vk5WwNoQ32VhpOk
	mD2uggRKO4Ec5VNhMdPV4DQm++6nSlnqm9i31QQ4DQ0aLUOOKWS6cS60DvYxED9a
	/an6myas3qvkVdB9B8vHy6tPWF3j0a4DIvcUqQuf5ghdmykoidebJIk8tXYBMaFV
	mGqgDGExG+4dhQW2cKpY0XZqdv6jsPyQuxxS4MH5vLMjBhAPb1UWxmr3QMUJUAKr
	IKIWTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr0794-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:48:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso2362606a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784036898; x=1784641698; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qryvjUpCDzgKV4fgQwaIiWJ1Taxd0ZMgBY1VIfSBwJg=;
        b=eQUcgH0oVi20/9XhjyxlFpthesENQpQtxDiL7Je91eHC7rzCPBJz4fHR2l2gcSsBnp
         3JYefvoT6XoA488gMwIfpMOx5BkS37CD4UEa6ysQpbYYmJ0bPQ3yRSQ7l/YiWsjj+LfU
         IKZxPHHS/eRtYrrGjMiIidjb72Ixmvjoz9gay8GYQvUvyKJF5J/VLITTCST0Jfafpd66
         gIO3zoylIpc9nmXdBu8m5p+OESHBCjmNcvRddtvGGaUYWSKUwBEcMQwA+mz+gkTdRbJt
         h8MBgM+TJLgbAaXERYk8M4ZYXEZSlte2rOI+YmyzByFcDT+Qu1bRLaz/B6ureTEaDe2J
         OkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036898; x=1784641698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qryvjUpCDzgKV4fgQwaIiWJ1Taxd0ZMgBY1VIfSBwJg=;
        b=OTyjLeVN3JIiU4panq5J1suPybLynaaAE3XltZXdPyc0TtIYHQA5wsDrwPNzML88rU
         z3mFxFBExOa2ZDDDcVePu3EGcoL6O24ZBnjBMxAD1nKOAXKv3HKC+3CQEU8k2RlGs0QP
         DFuhlaBM3ZUuUeiRbzgqiqUZfeh//tfxO3aVaFY0Wk6ZvcNvC4LZglij3rIUNvmLygEY
         i1i5fQAEraldrD3uTJJLVvbLGbbMRqWPp26qeNFti5NOELwT07r4ciDThDH5P9b9AXPQ
         BehdMPwWWmolmW0aFhFq33+EH9gZGAtIsCl3Sa9d1NuwMvaJObDaCTH3HcKN5oIf5Umy
         dpvg==
X-Gm-Message-State: AOJu0YwGBDUlnPkr679dUEsVdykoB0W6SwNrnKShtga0SZtmcJ5t5gCe
	0sbE3fqnUyPhMsYSHkZv2r4kWocp7dM6HLNrjwLsqAhGi+bBsNvKb1o+C2YN5/XpyQSmjl8dzg5
	buzVsdhk493EbtXBpIcOMFimmaqsT6jT6Juzk1x3sj/H9MwzC3Arb844xW+Ecv8bp3KCbQr/rNN
	BbpAQ=
X-Gm-Gg: AfdE7ckSI2zOPo/7PLmvyoCcjfV3cs7uagOh5nJsgn4xStTy6CLxZFftcccZmV+z6Dw
	AFiwhFH9QxRku4hrmhrA7mPDoCvpM1ye6R3L1HCduy2fCFhtBaca3sXlLWjR70MXOX7vivHR33P
	SzvVuGBrJFhBqLIFzcbNvLdAoNOGks9ZXsdv3N/3vTTZ34damy5LHEhdWenC7IadQwq62gsXBW7
	v+ri8T0M88CuncApROsZ70DklJkXgnCYlurDYqSKJn8kcs7u+lmHzYRek2hHGM6HHv/HwAhSCSr
	PuPAikAzAizQeg9qX4ZEZsPXMEADwu+r+sMVM1Gkek2t1Kv4jUIhnl3s6z7pOsbPb1xoUL2Uqyz
	6MjemMSYk2sbypdrTghyGQLBnMd9w+X7Z+AitYtuXslc=
X-Received: by 2002:a05:6a21:7486:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c110774862mr15138781637.36.1784036898254;
        Tue, 14 Jul 2026 06:48:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7486:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c110774862mr15138744637.36.1784036897705;
        Tue, 14 Jul 2026 06:48:17 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm37311325eec.23.2026.07.14.06.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:48:17 -0700 (PDT)
Message-ID: <d6ffd6e7-2513-462d-8474-9d24c0c3acfc@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:18:13 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
 <20260709134355.3FA4F1F00A3F@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709134355.3FA4F1F00A3F@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX7Rqu/PtrJloT
 fEwrq7vQVJFqq4zaFYVqlSSnOWGsfptFkm/8to9L1sfgA7XzQO2BBRwb/Ep5NC5nBKm7SHRl7kQ
 p9uzGEebyBELT17fzqmEAC5cBdvIIto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX5k4Qwou9AwxM
 urAClV2LrRWb0ifqF/Us1DJZVQy0B9bFGgCxuQWgCuogj9WmuJQeJ6ATiuafaLlAnrB6TMhnIte
 uo1PHa/9HDotPoSPe0bHOe59/QXwT06hwpEPdBLI7g/ihjq6D3NHuhHGyw1bCBYc0ZEmhdBDC4f
 4ch3ixP3EPcP7Ay7pVURvhX+E3zDWns61LTA688DdeAoIQYygBshCvO0B3tEl52YH61yHLMQkCx
 4qwtVVUcN4FnJ5CvLJ4Prbos8T/FS8pQj+PJiARPBSfeCZyFxyunsUyBSXwEcT2EXpezDstdjgs
 Tb/Y0kiV5ZpJDoSSmaguVhlpI5SZxwbgXkX9lxJMmnSyLJ1SIr9gmLf5ufedeKdVQorByLAcq/i
 TXhQwZxuwQSl+VnlBjPQLT7iQvBOEMC3TWGsKA4mhBXb7jay9C7rBKyqmOcmyHtVfjVtV/d4n/W
 usr3mR6A5Yd/JiNOmpA==
X-Proofpoint-ORIG-GUID: rPGF9RTcvHI0OqFqOzL8AOOLtEtBQauJ
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a563e23 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mXdisibVqaxe05F4JQAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: rPGF9RTcvHI0OqFqOzL8AOOLtEtBQauJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140144


On 7/9/2026 7:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing DMA segment size configuration for newly introduced subnodes.
> --
> 
> --- Patch [5]: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core device when IOMMU is not mapped ---
> commit 767f9e3fe023f5e91b49d0a9ac0e6e7678556f9b
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
> 
> This commit conditionally skips setting the DMA mask on the core device
> if it does not have an IOMMU mapping. This addresses platforms where
> subnodes are used for IOMMU streams instead of the parent device.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 0bce4fb1786bc..828e020fc79a7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -309,9 +309,11 @@ static int iris_probe(struct platform_device *pdev)
>>   
>>   	dma_mask = core->iris_platform_data->dma_mask;
>>   
>> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
>> -	if (ret)
>> -		goto err_vdev_unreg_enc;
>> +	if (device_iommu_mapped(dev)) {
>> +		ret = dma_set_mask_and_coherent(dev, dma_mask);
>> +		if (ret)
>> +			goto err_vdev_unreg_enc;
>> +	}
>>   
>>   	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>   	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> 
> [Severity: Low]
> Since the DMA mask is conditionally skipped for the parent device when
> subnodes are in use, do we also need to set these max segment size and
> boundary limits on the subnode devices that are actually performing the
> DMA?
> 
> If an application imports a large dma-buf for video streaming, the subnode
> devices appear to inherit the default 64KB maximum segment size limit. When
> vb2_dma_contig() calls dma_map_sgtable() using the subnode device, the IOMMU
> driver might attempt to process segments larger than the unconfigured 64KB
> default.
> 
> Could this trigger a DMA API debug warning ("mapping sg segment longer
> than device claims to support") and introduce unnecessary CPU overhead
> as the IOMMU driver evaluates splitting the mapping?
> 
> Would it make sense to configure these DMA parameters for the subnodes
> in iris_create_cb_dev() as well?
> 

Ack.

Looks quite hypothetical to have a buffer with 64 bitmask, but good to 
have the dma mask configuration for subnodes too.
