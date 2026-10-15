Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCAF50AC11
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058248; cv=none; b=j6rPvrSfPilZKW9msfYuP4BlAWA9B1BLJyF/rzKwxKqfRh296faDAuxEInCQwoMUJkcv088YjKUxU7HDKO998WwxHPSErnvENvYKj5XVk5rWUwIidVRSNabhj83htjw+Lab8vlJKLuEaueFS9MptW1B5HvNGsB/M4QP/AaqZCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058248; c=relaxed/simple;
	bh=m7fBCYwiDQPfOfvCg2NYD/p0ZQsHrQGr866hOEFXRQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0yRQUcbMDqcVNZugx2BRMhPZaSZcyF0kBGBVEM2GJzyRFgXT+UoWGRhyw2Ys4xXAsiXKYbeUvELsPbZhS22IpAUVxnaCPUOTygu0Un2Injq1o8ofpmEZcQNOF3MRBj66EkI0XnbXwNEzqvxf22W4CRHrPcHn6AmtyfI7UIqyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+/qZHXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8lLtptY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+/qZHXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8lLtptY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jkgt3510574
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rthR7zp/u8hmriUiION4Kj0UucDTPcu6h2RFbe5VXg=; b=C+/qZHXL8cJkWiw5
	LpqOlB9iXvRGtnn8ME99s+jcjvbiqJKqSAWKGlCeovY6dYwC/2kQy5tIXNl2SEMU
	6UOtLRPtuaJA51MAecAKnaghh38mx53dMCEfcPbx6+0aoz8E/adv7Ck1j278NJaV
	ZV2dIUAh98oqj++qSeLMbIajqhH9wDLMWZJM0kua5S9mDCk98cZH3/QVnPy2bRuv
	a5d7oL7C8r+vqw5mR/ORtTWMu2ZVe1TyhNT6iti/ROpXYoYekwlg5yPErxRTLa9x
	GxbXTdimVBv1xw558/U9lHwb9sOezK//IOUb547hkRy5pIBUn+tPfGq6LLmVgVya
	4cSaSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9ebs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:57:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso6169161a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058239; x=1792663039; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rthR7zp/u8hmriUiION4Kj0UucDTPcu6h2RFbe5VXg=;
        b=G8lLtptYYiFIgC0U5Dbhf7YGxZMeC1dyo85PjLrFATp82yb/kPXERPpz9ydJNv+t5A
         vKMUD0cFpuEMXwkOnJ5w/cVtqowYbV1Szj10q08U6rbBVqYx1QIpWf8lJnYZwguOQOKL
         GH7JVK6fQu5zRtBeipx6GdMgatQSN6ucP4cGXHVJkfZqnx8z3qKd45Y1ZSvf45Cl+wlk
         7NMVAMr7AKDe4CxPu21yomJVQzDlkdXUd8gOL7iycoPNriG0c5qCjlWUpoxQxPfcges2
         TuIHdhGYfluNAJrea4bzV+4H0OQ0Er2R0z/AP28wHvpYA6nIOP7y/XAgQB1FWdurm5IU
         3bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058239; x=1792663039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rthR7zp/u8hmriUiION4Kj0UucDTPcu6h2RFbe5VXg=;
        b=JQKvD2WEjIZOF5BToi1n6+VuDLvpF3dqmI6Yh2vuEVA3JzrbC4aqIz0wLP85fp0S/Q
         TZL8BMmEdRfht5kJQXGIVPjPGnSurxhK8YcjFCQySsDB7Qf4ofj2g0LvvSLbHNDo/fK0
         fLkwFTxrWq+4OS4m194YvDaIWs0y93gWGsyRZiHAFrOz6yC2yjxD2XjuVwt0C5KAoVLP
         fC1WbPWcOe17NwE4o92b0hHDmnjGuTaWhTjJ6EW4GvUDj/rYWD5Q+XnXWVY4JBwcBBf0
         DBzu1nfYVzeOluMaQKF0jJDvMkhoRqQrjlr8YqvG6IrOnvUWZtbAP49INrbrBeUBMy7G
         jsUA==
X-Gm-Message-State: AFq9FYInvu9aKtjAQFsEjqLgdFMyzrZKng+nQLIT/ZpkuBKOJpBG189V
	IwWIJHLoRwhHzrid0R2xIi8i59Y+/32FRwUetnyXbs1GW8IQnbGGOWd2nEO7D2G7Togeo7R61YM
	UpduP9w34QVPaid0I56mXJuDBrP6m2vnuzj8M7j12eMDVUSlb2S+2IzqyujyMeuAFxY5saB/53q
	KEXME=
X-Gm-Gg: AYBFou1tzospptf14+3WuNouPKlDs8kbShXX6mjhjZ0JM94AshnZ6FZsM5WXnQ53VYU
	CxemguRGi66FmiUHUyZe6Sdmr54ojFZVMousB0PdR3SGPLekxA21uKSIHQRWTfGZ3ucVYwFozbX
	+kehE4RmE67WWhlRXVyXIdx13af8N6rWW61u2CUWmmDcJUgZj//a4Jv5j94AQeu7jDiRmXu/imi
	+7NrDhDbIgbKBgnpdFrkME2r75DKsLa4aY4H/MBFPHuQP+ZqiYjDZjX9FsG7AYN7HLugnumqaXx
	fpIuTymjSxSijDicFKBpvTWzVSF7b9pwYjbm/acM2EyHgHIn1Q1quSSO3slbecjxdKWvSFL+JSU
	oTLMQh9V5J/pTGFLl1RLEIAFM0yoxZp8gm0X8A8+ilyOmOTp2cJ+vSZ+C4/iT2Oq5ZysvObcQyK
	XL7Bo7k9kMt4k=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr16168841a91.41.1792058238766;
        Thu, 15 Oct 2026 02:57:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr16168815a91.41.1792058238213;
        Thu, 15 Oct 2026 02:57:18 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7311sm3666246a91.4.2026.10.15.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:57:16 -0700 (PDT)
Message-ID: <f5b4aa7f-16e6-47ca-94c9-c361d40ca81a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:27:13 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
 <sashiko-outbox-172329@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-172329@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qsoVsMAuaJxDpkVzwh3aivddcw2MNOje
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0a384 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fJN0sLsdM5QiqpGE_s8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXwJXU2GuHXZzV
 dDjZ/YlOI+JEwQHu+8b6fMTHblamviIQ6w1JfQ06PS4a/tx5LnQZ7rYAceBoCjh9psN9OyRq9Ki
 knsBN/46iN7FzuQ/P9Yf73zW9N92W67aK2R1mVZcUj7zDIxrPbSxOL6sG7+9FC3BCg0rdMUQcew
 pOqCePuinz/xwSNMHoAs886AVWNxakCm651xhwmStspjWgx0vvP1tt17ar2/QKiz2A8pW1Bluob
 L6dLv1u9NVFFowAlsNg0LYqfmlVjTLub1QZCUc6flft082w0ZaggEB9dU/ehDgIz1O/SDm0uJWN
 sKIAJpctriBFH6opJUKPJAFnKzA6pktO2wjNA+zuagoSjqpaOT536nbjZeHdK2lLOXFqYQCl05Y
 J9oIbLuKeOEVIz5jQNp2Wkqi1KF1GJ1504Z7IMWNysaauwI5XpdYSkalE+GmWZHRAK67bBgPoGZ
 wRaLXJMSyEdBoT9dvtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+7LeOd7v70LI
 EXqO+oIjAkq7Er4dav1YXQuOKw5VvY9VxtZ2F58f5apaSXnoU/FxUBCmuPOZTSIb6i2MCXlKvCb
 B8sMsfsU/HQlfPU+A7wSsJ42p9U8kIs=
X-Proofpoint-GUID: qsoVsMAuaJxDpkVzwh3aivddcw2MNOje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039



On 10/15/2026 11:35 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] qcom_q6v5_pas: NULL pointer dereference due to early returns bypassing context allocations
> - [Medium] qcom_q6v5_pas: Memory leak of firmware objects on successful load
> --
> 
> commit 3f3270df945541b7e62ff38a77d04e462e6bf823
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Support secondary images
> 
> The PAS remoteproc driver currently supports one primary image and its
> optional DTB. OOBMSS additionally requires the secondary image and DTB
> to be loaded, authenticated, mapped, shut down, and released through
> their own PAS identifiers and carveouts.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index ca8e61254c449..0bce2f0d5b4aa 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> 
> [ ... ]
> 
>> @@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  	if (pas->lite_dtb_pas_id)
>>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
>>  
>> -	if (pas->dtb_pas_id) {
>> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = request_firmware(&pas->secondary_dtb_firmware,
>> +				       pas->secondary_dtb_firmware_name, pas->dev);
>> +		if (ret) {
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = request_firmware(&pas->secondary_firmware,
>> +				       pas->secondary_firmware_name, pas->dev);
>>  		if (ret) {
>> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>> -				pas->dtb_firmware_name, ret);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>> +	}
>>  
>> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +	if (pas->dtb_pas_id) {
>> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
>> +				       pas->dev);
>>  		if (ret) {
>> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -			release_firmware(pas->dtb_firmware);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>>  	}
> 
> [Severity: Medium]
> When qcom_pas_load() completes successfully, it returns 0 without calling
> release_firmware() or qcom_pas_release_firmware(). Could this leak the
> firmware objects and their underlying buffers?
>

The auxiliary firmware is used later by qcom_pas_start().
I will release it after the final qcom_mdt_pas_load() and on error
paths.

> [ ... ]
> 
>> @@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>> -		qcom_pas_shutdown(pas->pas_id);
>>  		goto unmap_carveout;
>>  	}
>>  
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>>  	pas->firmware = NULL;
>> @@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	return 0;
> 
> [Severity: Medium]
> Similarly, in the success path of qcom_pas_start(), should there be a call
> to release the secondary_dtb_firmware, secondary_firmware, and dtb_firmware
> objects before returning 0?
>

Yes, I can release firmware before returning.
> [ ... ]
> 
>> @@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>>  	if (IS_ERR(pas->dtb_pas_ctx))
>>  		return PTR_ERR(pas->dtb_pas_ctx);
>>  
>> +	if (!pas->secondary_pas_id)
>> +		return 0;
> 
> [Severity: High]
> In qcom_pas_alloc_memory_region() (just before this diff hunk), there is an
> early return:
> 
> 	if (!pas->dtb_pas_id)
> 		return 0;
> 
> If a platform defines a secondary_pas_id but lacks a primary dtb_pas_id, will
> this early return prevent the allocation of the secondary contexts?
> 
>> +
>> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pas->secondary_mem_phys = res.start;
>> +	pas->secondary_mem_reloc = res.start;
>> +	pas->secondary_mem_size = resource_size(&res);
>> +
>> +	pas->secondary_pas_ctx =
>> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
>> +					    pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +	if (IS_ERR(pas->secondary_pas_ctx))
>> +		return PTR_ERR(pas->secondary_pas_ctx);
> 
> [ ... ]
> 
>> @@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  	if (pas->dtb_pas_id)
>>  		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>> +	if (pas->secondary_pas_id)
>> +		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> 
> [Severity: High]
> If qcom_pas_alloc_memory_region() returned early because dtb_pas_id was
> missing, could pas->secondary_pas_ctx be NULL here, leading to a NULL pointer
> dereference when setting use_tzmem?
>

I will add condition for allocation instead of returning, so that we
won't return early.


>> +	if (pas->secondary_dtb_pas_id)
>> +		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  
>>  	if (desc->early_boot)
>>  		pas->rproc->state = RPROC_DETACHED;
> 

-- 
Best Regards,
Anvesh

