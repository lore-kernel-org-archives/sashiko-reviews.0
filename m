Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B23146A66
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897122; cv=none; b=Il+shHc6vY7+v3bthbFmN4mIkDYHHFOi8RGuvtYYs/lT952gw/G/vzpZP+qWnah+1h1SxuwxxbU8iaVV6dHk6wx0gnLjp+Yn+t2kVlxHsikEU6675EVzwAtf9nd0ic3J6ekHap1ERwsW+UG2BzV7FtQSItsSV7cPG9XzNrYDYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897122; c=relaxed/simple;
	bh=KPGNczJBcKa5n33vVRzqAOS+owv898/wiOzqL1lwvJo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aBpJjzQmWivexNWU8UNZrwvNHbfoEvrDNE6RfASc43LVf+/jsAKA4ozXZdAfqeNYBc6q0CNuCuebE7AX/3ZUdrzgBfpVNhy2SEhYqRR0MzpVpMFuSPRMsvlxi2FONh38W94UJJwMTP86uBgw47HnHIH8dKKQMZwnlTQca5e9uC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/74z34k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hf8K4hCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/74z34k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hf8K4hCN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EYXi1575359
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39xli6mKUWevjHUp1QKqTq7XuCw/7UBNPDjl33iPSHY=; b=R/74z34kdgk+lspY
	cvCfWHOUmQ/FCfyIHkIrokwHJbXNwGxX9/kryqdNtUAsNpf2yOaj2WhYRgh9BeLK
	G3MkHrq6Uf0uE8aZNaMj3SYR5+4aXDIFSyBKLe8aAtK6RVDv78BdV4HIXhSs+92K
	LQRjiJjez9zU5F7AdkXPlMpkvAQJbeo1sO/MlYY3X40UzM+3+YUlpxkKW9r967ku
	E3iQPVY18iz04JzLBps2E/iCIPG/ZHgolhz+7rCYlnU+IJqJeW/3SCRab/Vja5Ha
	EoyjZvI/obskK/fRATpFTTfh1XNhw+Ov+UZgtA5cRlpvQYdoFnKSYWbB+GSseUWS
	hQbhLQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxfy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:38:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c129b3so1816792a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897120; x=1781501920; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=39xli6mKUWevjHUp1QKqTq7XuCw/7UBNPDjl33iPSHY=;
        b=Hf8K4hCNd0iOMj8SXALpzQOrM3M6A7Z9rjlEdh+2uSQpy4VK0J+FrMcO8Flq8LQE5u
         9WiEqdrqXOdK9IaPbCzsRcknEkNo+bFLzS4N2Yx3W+E5dKFSk3Gl7Iqi7itu+ZuqRaqM
         i4NbT8DQN1Eru1GHn9sA9Picxi/DA7dWO+5r2dRMWljG7EGE3/wV1S0jWs2Vg8tTOHAT
         RLMv55Gdtx3WbW4FhLZi4R4VaUDkS26pH2mXRe4bvntZAPiNvqvefF5S/KnhzLA+6qXW
         7FxRorTucXv1dLJdQX/DmCWmPtqlLjk9GMyKYwprRgrzObOAxRHK1Snl1noxo9V3LDZU
         du4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897120; x=1781501920;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39xli6mKUWevjHUp1QKqTq7XuCw/7UBNPDjl33iPSHY=;
        b=SFLdAeO5K2qqjfGl+ColVJXS3NVnuI/4Z13rTQkhSGynMIbVA85BpcrQLulig9kgOl
         ujR2pkyrrEV5JwVwAcJ3CChy+ffGCfnGJxwOPvh3LHi0pTpQYYGPI4W+fyxdakSzl1Jn
         ZYw3T+W2MIFclKqK78N0U66YCXv6BNmCknw0pryNaXesk4GvcZbT8J3Fdkk/pm+m/E5r
         VFhha+7P8A9DORroimsTv+bS5ezJeBdvp1st7es/qsYHsO9CCAeqzk4Nz7aBijcxpnDn
         V1XpyiRxTqAAAROWGb2iXYIQRj/rEsBO2J5m/F5NbNBwtx5ps0tzZ2fiJUyZvYH4JAzI
         pntA==
X-Gm-Message-State: AOJu0YzfOKqOLdS3DTjW2HHVrYIDePo2+C7WiXCgRBd91YxJtNH3bFgG
	ypbNnqujvW/Pb7X3DDaI/aaJf8AooWKar9qVVAWj9fYQGB1YDhqIwwvBxIJPUuTxFx0Uyf9VEaH
	GtlXu3e7lwn0i3QYdU+ZMIFGCg9DLmMIg77ZfjDaKM6gmvzDFcftXUaHFvpGmdiiBRX3WG00llr
	pBm7E=
X-Gm-Gg: Acq92OGyfKDpudG/tONZbNtEh+UcPRYOAREIQPCLF8pu8kSkQLgZTr41JnUKnTKZzSr
	O15gbCW8HZo5neGfVH7f3sklvOI5t3qYExBxW34qbTPIUq0FEVZtWMf5UeFsd5wOwYWEL/5udDi
	lvAPDQGIsFBAh9IPUESVeBtV/Bx4mRW6SITEyAdn2TILV2AspMCcqBJGYJIdChD0YK2sfbogMjx
	AZgf5szFJuVzFsZvcFLscPAz34fEk5Q93VeUs2aAWuGSE/h2gZ2E12sxtata4OatY7prXKFuXP2
	qSxh+cI/ZrVOSs8y6Z+egMGAekDRgS9Pavgh/HZP30EixvExT8CB1GWaUVhuqppDPs3BakPs2+N
	PqmVPiumRdHDtsd5ePY5GX51ZDT9q8CBBhigiJDkZQxSWVU+yU3pUUUvFuylVBghD
X-Received: by 2002:a05:6a21:3998:b0:3b4:8549:4fe4 with SMTP id adf61e73a8af0-3b4ccd750a5mr15789210637.18.1780897119650;
        Sun, 07 Jun 2026 22:38:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:3998:b0:3b4:8549:4fe4 with SMTP id adf61e73a8af0-3b4ccd750a5mr15789167637.18.1780897119168;
        Sun, 07 Jun 2026 22:38:39 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm16652381a12.19.2026.06.07.22.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:38 -0700 (PDT)
Message-ID: <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:35 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143923.58E1E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX/XgWka+XMjHX
 braJGa4TGr3bPNcYLGsWH1UVxD4Wsw+v5s9TKnn4AxpvBYV4vOOBr7bOgNEFvDTojXf33ozbxDo
 WpxzQ3lfSLN376o2pa7kOxUWSh0lEwR6E5tnzxDCHdkuijyTNHVr/iAyjs46fEauDTeNcLmVNgV
 VF8VsCTgotNn4i1VvluLY8mR/soGdLvDalKu++1aVg8IIqCZ/7WxrECJJV7eINupaJBiIk6/ynk
 HGDqc6sv4UeWlbo+ZXJk5V07jZCRCAb1/e8dolBY1P0ChFwG3VaVbjEC7iOFY56jZ0mT3mcROpk
 9j3GacDlvVI/WZ6gWfFWdfd9P3ksZKeGPtEfG/J4PSXho7jAn3jhnyHl2m+3tco9QNHJ0BxGYpp
 2HRhq73dUl96Vj4vc8kjLcmDqjbabaau/hITNnZkDO9+d5rr2arddWy7n4NZM1a71s9JreUPF2p
 n+qpETK12Dgh/a+ZAug==
X-Proofpoint-ORIG-GUID: 4-9HhQNb2tXwEYZz7mV-W3hRcdTvfcOk
X-Proofpoint-GUID: 4-9HhQNb2tXwEYZz7mV-W3hRcdTvfcOk
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a265560 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QttUXbZITexGozAVDd4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080049


On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> - [High] PAS metadata memory is permanently leaked upon every firmware load.
> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
>
> Pre-existing issues:
> - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
> --
>
> commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> media: iris: Enable Secure PAS support with IOMMU managed by Linux
>
> On platforms without a hypervisor, Linux drives the firmware loading and
> authentication steps directly. This commit extends the Iris driver to support
> Secure Peripheral Authentication Service (PAS) on such platforms by creating
> the firmware context device and mapping the IOMMU when the firmware device
> SID is present.
>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 1a476146d7580..8bdc9273036ce 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
>
>> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>  		return -EINVAL;
>>  
>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>  	if (ret)
>>  		return ret;
>>  
>>  	mem_phys = res.start;
>>  	res_size = resource_size(&res);
>>  
>> -	ret = request_firmware(&firmware, fw_name, dev);
>> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
> [Severity: High]
> Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
> during repeated iris_core_init() failures?
>
> If a subsequent step in the firmware load fails (e.g., request_firmware()
> returning an error), iris_core_init() returns an error, but the device remains
> bound.
>
> Because iris_core_init() is called upon opening the V4L2 device, userspace
> could repeatedly open the device, failing each time and allocating a new
> pas_ctx without freeing the previous one.

If the dedicated firmware device is not there, will check and skip the repeated
allocations.

>> +	if (IS_ERR(pas_ctx))
>> +		return PTR_ERR(pas_ctx);
>> +
>> +	ret = request_firmware(&firmware, fw_name, fw_dev);
>>  	if (ret)
>>  		return ret;
> [ ... ]
>
>> @@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
>>  	ret = iris_load_fw_to_memory(core, fwpath);
>>  	if (ret) {
>>  		dev_err(core->dev, "firmware download failed\n");
>> -		return -ENOMEM;
>> +		return ret;
>>  	}
>>  
>> -	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
>> +	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
> [Severity: High]
> Does this permanently leak the PAS metadata memory upon every successful
> firmware load?
>
> qcom_mdt_pas_load() delegates to qcom_scm_pas_init_image(), which allocates
> DMA or TZ memory for the firmware metadata (ELF header and hashes).
>
> The SCM API requires the caller to free this memory using
> qcom_scm_pas_metadata_release() once authentication is complete. 
>
> It appears the iris driver never invokes this release function.

This is discussed here [1] and finalized that no changes needed in this patch.
[1]
https://lore.kernel.org/all/20260415074140.46bg27tzbuyzjq3d@hu-mojha-hyd.qualcomm.com/

>>  	if (ret)  {
>>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>> -		return ret;
>> +		goto err_unmap;
>>  	}
>>  
>>  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> [ ... ]
>
>> @@ -95,16 +133,31 @@ int iris_fw_load(struct iris_core *core)
>>  		if (ret) {
>>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
>>  			qcom_scm_pas_shutdown(IRIS_PAS_ID);
>> -			return ret;
>> +			goto err_pas_shutdown;
>>  		}
>>  	}
>>  
>> +	return 0;
>> +
>> +err_pas_shutdown:
>> +	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
> [Severity: High]
> Does this result in a double invocation of qcom_scm_pas_shutdown() on the
> qcom_scm_mem_protect_video_var() error path?
>
> The code calls qcom_scm_pas_shutdown(IRIS_PAS_ID) explicitly before jumping to
> the err_pas_shutdown label, which calls qcom_scm_pas_shutdown() again.
>
> Since core->pas_ctx->pas_id is initialized to IRIS_PAS_ID, this results in the
> shutdown function being called twice consecutively for the same PAS ID, which
> could trigger TrustZone errors or corrupt Secure Monitor state.

It was missed during rebase and resolving merge conflicts in the previous
series. Will fix in next revision.

>> +err_unmap:
>> +	iris_fw_iommu_unmap(core);
>> +
>>  	return ret;
>>  }
>>  
>>  int iris_fw_unload(struct iris_core *core)
>>  {
>> -	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
>> +	int ret;
>> +
>> +	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
>> +	if (ret)
>> +		return ret;
> [Severity: Medium]
> Will this early return skip the required IOMMU unmap logic if
> qcom_scm_pas_shutdown() fails?
>
> Since the caller (iris_core_deinit()) ignores the return value of
> iris_fw_unload(), the driver proceeds with teardown while permanently leaking
> the firmware's IOMMU IOVA mapping.
>
> Software resource cleanup should likely continue even if a hardware/SCM
> command fails.
>
>> +
>> +	iris_fw_iommu_unmap(core);
>> +
>> +	return ret;
>>  }
> [Severity: High]
> This is a pre-existing issue, but I noticed that the sys_error_handler delayed
> work is never canceled during driver removal.
>
> Looking at iris_remove() in drivers/media/platform/qcom/iris/iris_probe.c:
>
> static void iris_remove(struct platform_device *pdev)
> {
>     ...
>
> The driver initializes core->sys_error_handler on a delayed workqueue in
> iris_probe(), but iris_remove() unregisters devices and destroys core->lock
> without calling cancel_delayed_work_sync(&core->sys_error_handler).
>
> If the delayed work executes concurrently with or after iris_remove(), will it
> access freed driver state and attempt to acquire the destroyed mutex, leading
> to a use-after-free?

This is not introduced with this patch.
Will check this pre-existing issue and will post another series for this fixes
if required.

