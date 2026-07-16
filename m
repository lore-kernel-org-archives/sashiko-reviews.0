Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1930C637
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784172330; cv=none; b=oYCvdqccf4BZmB49Lj9/h3uYvOFp0RQ6bH83FCNZRMgMQFygI2nsY8AIeM79LHbCfPQrU7D2T+9GTcu/2fUysKZTQUQy53BszJYIHfmMJqg+5CWq0Mqwb39owJhu3k4VSEWFFP+daIstadMr+LLo9MXZPCEILlxE9cQJ8eTcHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784172330; c=relaxed/simple;
	bh=JJJqpdOoOWRkbbqhEFoEULmuzOBL9e8cVVq+8PgWqQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EO9sKhbCSq3N1Kzbj7gEL4oZjqlutAF/UipuSvr7v49bpW8dkLwRLFyjfA3blP59wiVZkQEjFMa2mhizpHXsZiHq3gJjfH7nvJhioopIJUF9QHlysrJkJVx3AYmYU2i6swxadE6WzykFwGOtyQNmW6xp95Wd4b2V7fML+wwYaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LnyxeJJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kqg+KihM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LnyxeJJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kqg+KihM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XZwt858358
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1ybYc426zROeJ2cJ654qj0Tvm1CL4rw4t5xtxWhRtk=; b=LnyxeJJ1am22rRlJ
	kj9iIzzTcvPkHUqsBgKwKNqgwOycQ+uu+WxltiVERTdCS5LwSsWXRQEulZ+Q2QNb
	kFlz0TkG0Woa6XSakMVRhKdVmHM0ArN3Fr+jZX6nK1bhXRb9IuTMQX/ao2Kglyql
	XszFK+H9KPqtO1rME5J/8c80McDzhLRjh1yBRJPEwTBZJdtaSiCqAroyJBC/QVs2
	+AlISUZOkbBr6UzNVPRIofzvJUcB2h9tRQOxIukPZ5OUrhy8FAivK0in0hmpb/kT
	cP9uZPc00+qMAAoy3G3Yivld0twMjZNRcV3CVFVBKXtZSb63ns8n1vPJ+O7A6n+n
	3z9UBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed062c0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:25:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so3650665a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784172327; x=1784777127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1ybYc426zROeJ2cJ654qj0Tvm1CL4rw4t5xtxWhRtk=;
        b=Kqg+KihMgwzFfcx71S7F38yC/mSV9wsSwtHgOpOLnoIkuJBpHfkVaUhClCQuG18z5I
         U1VACL8tKk5kJH/zNDOFVY3tV7gnBQpzdZqoHI7KHt8huU1SH9j1sm8nNt+oXs9gJiIG
         JEGHSnmhEcw6aIhl0ZlLiLsU+ssYaqJkzYjYiSJAAHVyvc+n0n0gzP8/ZaB+lZEpBY5z
         IE2dKaqySdVZVdwxSI33lpLCp5y6fkkQpCJ+AOzLLYAOf18pFl0U8PwyCZHxGF25FnQY
         q2QYypn+0d5xOhdaHocjcG1rxIRZlD1gxwYKvGRN8ey3Flt9K56WfHz94W8Y4TU2p23O
         Z6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784172327; x=1784777127;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1ybYc426zROeJ2cJ654qj0Tvm1CL4rw4t5xtxWhRtk=;
        b=VytaUg1GyMsN1r904qyLP44Es1rDtf/dC5L3UPDcDKDINdCvm1k3nml2nVXkhQp2xC
         FD3jMRLa3suzVgLfG8e//LXMffQEKhwo06l0rDArwSHs6gJxCTXmrhceLjjYCPevDtcp
         5bjGVwInCT6ECqH8apvmKU2p7wOtmMFMCYR841BoUNHj8OwrPBA+zUCbytdQlY1nNj87
         +dP42AR3G4FpCCm1b9Hbi3fBM4SP57z/TZvqsi4PfJeaUqte3EQCr0QRc9K1o7JpFCWl
         2802vdlq9ppBCcA83fsAzDuF4SHODL3mn8/IWEJJWXp36qqR6vH5YAb32rOgkOkWl1bG
         Cm+w==
X-Gm-Message-State: AOJu0YwIhiHskfLuEgypCLO2lFEnzPZTE5cs8MGSgRqiCLwCg6pV+fSI
	piqoIzef7pNQDKPQFCDJe4NUJOm+7/k/riWEKhNpHRmGNGGBRFUtpbTbn8WnPEq5sc84ksgwF6R
	eR5/14P1YfGx4LThvvJSy0tymkUoiAwItnk3JGAbwR68iPXS7Dli8dPQ7n3H5F4PK9Zt3bIsNo0
	dT1KQ=
X-Gm-Gg: AfdE7cmh0u/cbFTcvoQ+t5e1Z63R8/x/KCUpzJFQiC1JZRsINUQ5OW3LSVlfXmKoBqT
	S0TZayhxz/iRA4+AfZ1T/MkNB2tFtfwaZJA7XV3DXjq86u2nhul34YVgRRJhLnKWuWeBGOfD7bW
	ZhcLWEuBIpaajr9vUPoK5Ly4aBMojUiVU6+TT52rIRmtpS6s1xol6DXFA64W8D6i0o1ydNjrSVt
	twCFug583W0KfeoLSn2sBlhYZ3fcQze1E4CmF7CS/6l5MX+PuPA3agNweTQ7OtR06FevK07vEvY
	dKWCdoHbNVL9J0WYkd8fxwXwZ6Ul2EilHNuAQsJOg/3mL2fFeSaKfqi3SIjZV8Uu/ULOpIi5r56
	AMS8YeEeGDGovv0OwH0zm9DixyZ88cEL2
X-Received: by 2002:a17:90b:58cd:b0:37f:9cdf:f0af with SMTP id 98e67ed59e1d1-38e17e675fcmr8351614a91.30.1784172326838;
        Wed, 15 Jul 2026 20:25:26 -0700 (PDT)
X-Received: by 2002:a17:90b:58cd:b0:37f:9cdf:f0af with SMTP id 98e67ed59e1d1-38e17e675fcmr8351590a91.30.1784172326302;
        Wed, 15 Jul 2026 20:25:26 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c0702sm6022581eec.22.2026.07.15.20.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:25:25 -0700 (PDT)
Message-ID: <33d2e2dc-949a-c570-77ad-cb7aa31de110@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:55:21 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 06/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-6-8cf2cbe12a07@oss.qualcomm.com>
 <20260715143702.5B4871F000E9@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260715143702.5B4871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzMSBTYWx0ZWRfXwRT06e88vty6
 iek2i/yZO0xrbBvTzslBxxqK1DD3pf10R2zVvsnFaFaNzWcwNVi5xi+B1kwLNEtn4ZEsovpA67m
 Ju4FHqRfX38BhN2Akyb2Wiw4k+cVqTg=
X-Proofpoint-GUID: iAlM-P9z07PieuNYQrdAjptG5dUTs0AI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzMSBTYWx0ZWRfX3GK55JIXwN6X
 cDKpe02JQHUYWyXTfDVsH8Gr1MBjLcp8bSb4fJJxyEXU4HIk2o+zobodedTw8zE6tm+wfT/6M6o
 inwYeFl2qCXGMww1Yr3Jbw2RFeJDxuGM1LpaOgHprBdFU+8ncNcdHHjWHKe4zxeB3gwLF/J8KIR
 MYWVtROHAK2+uelOrMnT8IWbsJgEjAc1HvOi0BT6HMaqRacZ7EuwyawtX1lkCjtPN1fWpi9YUIE
 5dpwXRBods+/8nsNhMOMTZ+2GbTHcD9b3KixM2D2UIYZJYdH96nnAVHxKfuVnrYaUrtr1FAdEn9
 BV5TrrmRvg28M1UKtw8iJ9kXPYzYSZ6oR9VvKWEZ9zgaffj5Ih75CUx3BGf9p824v3BBb5XASAx
 N0uOl6vdyQ7kGF4aYf/ea4qxOHF82dkOwTNoMyJZfUM2E/uh6t9maoxLAPE2M8womp/VJ0CGidk
 ROGSUPf3J8WHpbA8nXQ==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a584f27 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lvrHWu7ls6kq8uvtA70A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: iAlM-P9z07PieuNYQrdAjptG5dUTs0AI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160031


On 7/15/2026 8:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] Missing cleanup of PAS metadata DMA allocation introduces a memory leak on every firmware load/unload and load error.
> - [High] The `core->fw_dev` pointer is added to support Linux-managed IOMMU mapping for the firmware context device, but it is never initialized anywhere in the driver.
>
> Pre-existing issues:
> - [High] Missing cancel_delayed_work_sync() for sys_error_handler in driver remove path leads to Use-After-Free.
> --
>
> --- Patch [6]: [PATCH v9 06/14] media: iris: Enable Secure PAS support with IOMMU managed by Linux ---
> commit d784ba63809fa89007c5ca51f86bf7421bf5d466
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
>     media: iris: Enable Secure PAS support with IOMMU managed by Linux
>     
>     On platforms where a hypervisor is present, all Secure Monitor Calls
>     (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
>     registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
>     (PIL) memory region so that TrustZone (TZ) can access it, forwards the
>     authentication SMC to TZ, and upon return maps the PIL region and
>     triggers the co-processor bring-up sequence.
>
>     Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 1a476146d7580..56c477b36b619 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
>> @@ -15,11 +17,14 @@
>>  #define IRIS_PAS_ID				9
>>  
>>  #define MAX_FIRMWARE_NAME_SIZE	128
>> +#define IRIS_FW_START_ADDR	0
>>  
>>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  {
>> +	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
> [Severity: High]
> Is core->fw_dev initialized anywhere before this point? It appears to be
> allocated as part of struct iris_core using devm_kzalloc(), but never
> assigned a value in the driver, meaning it will always be NULL and this will
> always fall back to core->dev.
>
>>  	const struct firmware *firmware = NULL;
>> -	struct device *dev = core->dev;
>> +	struct qcom_pas_context	*ctx;
>> +	struct iommu_domain *domain;
>>  	struct resource res;
> [ ... ]
>> @@ -53,9 +65,23 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  		goto err_release_fw;
>>  	}
>>  
>> -	ret = qcom_mdt_load(dev, firmware, fw_name,
>> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
>> +	core->pas_ctx->use_tzmem = !!core->fw_dev;
> [Severity: High]
> Since core->fw_dev is never initialized, will use_tzmem always be false,
> causing the entire iommu_map() block below to become dead code?

core->fw_dev will initialized in iris_vpu3x_init_cb_devs function before
reaching here. It's there in patch-11.

>> +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, NULL);
>> +	if (ret)
>> +		goto err_mem_unmap;
>> +
>> +	if (core->pas_ctx->use_tzmem) {
>> +		domain = iommu_get_domain_for_dev(fw_dev);
>> +		if (!domain) {
>> +			ret = -ENODEV;
>> +			goto err_mem_unmap;
> [Severity: High]
> If this error path is taken, will it leak the PAS metadata DMA allocation?
> It seems the caller is required to free the metadata allocated by
> qcom_mdt_pas_load() using qcom_pas_metadata_release(), but this call
> is omitted during cleanup and error handling.

It was discussed here, not to add metadata release call in video driver.
https://lore.kernel.org/all/20260415074140.46bg27tzbuyzjq3d@hu-mojha-hyd.qualcomm.com/

>> +		}
>> +
>> +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
>> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
>> +	}
>>  
>> +err_mem_unmap:
>>  	memunmap(mem_virt);
>>  err_release_fw:
>>  	release_firmware(firmware);
>> @@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
>>  	ret = iris_load_fw_to_memory(core, fwpath);
>>  	if (ret) {
>>  		dev_err(core->dev, "firmware download failed\n");
>> -		return -ENOMEM;
>> +		return ret;
>>  	}
>>  
>> -	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
>> +	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
>>  	if (ret)  {
>>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>> -		return ret;
>> +		goto err_unmap;
> [Severity: High]
> Does this error path also need to call qcom_pas_metadata_release()? The
> metadata does not appear to be released here or in the normal success path.

Above reply applicable here also.

>>  	}
>>  
>>  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>> @@ -94,20 +132,31 @@ int iris_fw_load(struct iris_core *core)
>>  						     cp_config->cp_nonpixel_size);
>>  		if (ret) {
>>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
>> -			qcom_scm_pas_shutdown(IRIS_PAS_ID);
>> -			return ret;
>> +			goto err_pas_shutdown;
>>  		}
>>  	}
>>  
>> +	return 0;
>> +
>> +err_pas_shutdown:
>> +	qcom_pas_shutdown(IRIS_PAS_ID);
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
>> +	ret = qcom_pas_shutdown(IRIS_PAS_ID);
>> +	iris_fw_iommu_unmap(core);
>> +
>> +	return ret;
>>  }
> [Severity: High]
> Does iris_fw_unload() also need to call qcom_pas_metadata_release()?
> If the PAS metadata context is not released, won't it cause a memory leak
> on every firmware load/unload cycle?
>
>
> [Severity: High]
> This is a pre-existing issue, but does iris_remove() need to cancel the
> sys_error_handler delayed work before destroying resources?

Yes, this is addressed with
https://lore.kernel.org/all/20260604054708.42426-1-dennylin0707@gmail.com/

> If a hardware fatal error interrupt schedules the work, and the driver is
> unbound before the delay expires, it looks like iris_remove() will destroy
> the mutex and free the core struct without calling cancel_delayed_work_sync().
> Could this lead to a use-after-free when the delayed work eventually executes?
>
> drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
> ...
> 	iris_core_deinit(core);
> 	...
> 	iris_deinit_cb_devs(core);
>
> 	mutex_destroy(&core->lock);
> }
>
> drivers/media/platform/qcom/iris/iris_probe.c:iris_sys_error_handler() {
> 	struct iris_core *core =
> 			container_of(work, struct iris_core, sys_error_handler.work);
>
> 	iris_core_deinit(core);
> 	iris_core_init(core);
> }
>
