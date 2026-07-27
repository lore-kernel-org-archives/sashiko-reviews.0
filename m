Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343313E41A
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127542; cv=none; b=coB7oeE2GSJGsDDQCPW3EFUl4gYVt0dEkxbmgfv1wvOF5wqH+BEbm2vZztDf9BAiLLf8+qbE98vvhpjtDy1iKj2ZkdC2Zb9VYm8q5Qu4FUiFl8rGapbOfNTqVv+igfbRuoPlJak83kAxS/BFKytKUK93WVOHtyWiTKFeCYGL8YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127542; c=relaxed/simple;
	bh=OkW+cX+gS0kBDcV6nDeljLGq0m/6QdKnrEVj81G78Cw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gGmDTqppbyehM99JZI9XZvVGvcBP3bdN7DAq8P4c0KSNdz0AdBGqazA9wVSHok7FTTXRLKDOka/b6RUAFbOxqSaE9ACo065vMtGpxJKlPQ2fNEsJYukDS+qcO2qcjlGu81OYh4M6sxSczPYqNqxcY33CCEjgg/72AlFmNsXeetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEEknjCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9FO4+wM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEEknjCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9FO4+wM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fgnF2175552
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq5K/HQyci9JZnB+A0dArWLShtBEpz2XoUszBdMr7Vs=; b=EEEknjCNQqV3VNQ9
	rie+BNjaOSG7NCX0SAP0TSquEgSJqe6iRJRH8JtMt7Ihv2033JEDkxb1Xb/g7ZE7
	d6IWV62w9OsWNObB4K4Ot3mg4pJOju4SQExmVX6M9mIj1yM8NyrbFSNoHZxyYeg2
	vX7Tamrb+1DHdegm5NLL93ggO2kztrN6sYAMNIh2kgpwVaGRAf5X2r0PhBObRkZ2
	MrFz4pInwMxNm1yAVIfKWDuyqxmh/kHBQXYHrmUZ3i5Pnrir+0DPf/oLS5mvvLKd
	43VNjyHYQSLU1OoSeKmhI9YwbjFxJerOJuaAi3XIsh3QsrvObYd9336v0WyOvdyV
	GxToQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwevc0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:45:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccd1958e8fso31520685ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127540; x=1785732340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nq5K/HQyci9JZnB+A0dArWLShtBEpz2XoUszBdMr7Vs=;
        b=e9FO4+wMLQGelOslXyJqYhrM6i9GTbOfqTeW3unXRSvMrF+z/5DQBI8IsWNq7FDNcm
         y8zcLC7nW8Ny1r9lOPs3QEiRxvrkK1q+KnETyreof3mh+XTcOnhqJkphVfmH2Vsqa94O
         piJjTvpYfiuEXjT4wIxQYUt4Y7GQGTaKp03leLpP6fVIYKIz5TiOLDRlBMVbKrtkZVHm
         A+E3BmP0czIPT4s0YlprBXcxdo7OJLFSt1YlfELxOEsURSUuvvlMxEd1xYUJ7VUPpjqy
         piB6JB0J02EPgFYm9ksWyFCfTF/Bklh4i9gsofAplj4U8UtHP8PUfiDmGoCxZkoCP0vm
         1GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127540; x=1785732340;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq5K/HQyci9JZnB+A0dArWLShtBEpz2XoUszBdMr7Vs=;
        b=LojAkeD0hhgcAalrleQ5YIThiUxDaA+kTbVm527xFPIfNjNutfsiTjj7QrodgSsqOs
         IG2cO9bLkpOSZ5n30pCJQPJkC6w8m48Ny5J9E/JuTUoOhxlkyFHdpc47BPJbJki50dJj
         UqnLE8G0hKPP9vji2cIFnPfriihEVLxUZczM6Guurh6XLT0bOKMlCBQ6fi0sjFZGFCCH
         QutjEJB8kTe3DUBVgUr3oddK/rWlK/5CCeztWtxzM+L3iadyruREtms8NwBptOAWyKgI
         8tr1F3kUOsXM4dT1fsJgVwN4nIBsnzBXYE3RxuTuoOnTbyCWRmyVBSc425Rlpe0zoFgS
         U1tg==
X-Gm-Message-State: AOJu0YyxYKDF3uSs+MJ6foB4CmSsMYTwhGZ2sMKM8tLOIwJvwln2gGBN
	+mEi0j6uXhhbW6aZ3OAVB8zy1tGxeb2gXZ3Qe76oQKTjcu0bY+PpDRle7Bad2gTkIwC/mNU9PTP
	hy+YgyzYxmOvkjEOAbrlZKV4hpUC0r2B2v3M5aL7qvP/kMILYgU+zP96pJ0oiwTDS2CMXcVV1ab
	WTTlw=
X-Gm-Gg: AR+sD120p6XiNlu4OI4CylTs5X2Yr94ZA0BrjnZsodgp11/L4ENIQfrM1pDyFvLVLkU
	5Ah87RJsIRcAY1+UFRgii76O/cqIyXhRyFMPy9eLNwjTblBKo9TGDacRDDaDiRuM46RJqV5DuIT
	lZZTOhRkRTYORmDsQHNcGFWc8gMxBu8hvRnSRuVcUfbQFkXHMox9Kb1vrjD2zegxqmQoRegEwRr
	yqMGcriJn8kM1vkqfw7qIvfBUniQdsKMDYoSDv2lGKPSWUgx98T1cgr+MVgNO6cDRlD3/X22GrH
	+r8/G3UY+KCl5yayb/QNZGwHf68TcChVS/9N8wN6aQa3WYBKpORBIjGkRqPR55S8Y1X8BiOOXcW
	UvRa7iLrsVsL7Zmic+I6rQAMPsz4I5gj7
X-Received: by 2002:a17:903:234e:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cfde683786mr66091055ad.2.1785127539683;
        Sun, 26 Jul 2026 21:45:39 -0700 (PDT)
X-Received: by 2002:a17:903:234e:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cfde683786mr66090915ad.2.1785127539254;
        Sun, 26 Jul 2026 21:45:39 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm26441512eec.11.2026.07.26.21.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:45:38 -0700 (PDT)
Message-ID: <04ec7e69-3225-1a5a-e19d-561e6f74f643@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:15:34 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 06/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        media-ci@linuxtv.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-6-de451559e88b@oss.qualcomm.com>
 <20260726060844.53A711F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060844.53A711F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX1+phI0NgEXw/
 KinwfHG5NK4OXKJ1rY2DSnb0u0BkjcAY3gUY4iv5OxnN8tCiWaycM8nRrxdV8TVLAkAmTuy/SoI
 YTQhrAdxzd4upSRnBrto1NSHqc0xIAkr6OxFXrfj4wvqREVzj8XoFlu7YA6lglwGndCLvihorJd
 19D2Xvk9U8Rw+QxVmFJiwFg9sH5wsEtOQxasWNS3wu6QyPD2ybG+qAHvDOfKtfVE8fl6x/z9Pvy
 9z3D4pLg3XDpnu8YvILCLmuakWZN0dy2NhUYpVl7+9e5aUFvNlJ/F5p19Wp41mihvFQvYC7OC9P
 lAg6GIevi8Mu55ba8E6Ry+ncX7xAgcjbw4yELQn5CY+1CYmEC5QpImnZgsjjdfsRfbruJgKyF/K
 a/QNMXcUoswAgXHbQskJp0Boyvwlh+A4wQTLN0ZtqtmGZ1EX7AKJ0GVPQD1pVCIB1U7mqzswZ+n
 kjZ+UzSQeapWX9dp0rQ==
X-Proofpoint-GUID: HgAqpcpmLpWJr_5oRUYhlqmlBtUWvtkb
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66e274 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y12TZTguZad93lnPc3EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: HgAqpcpmLpWJr_5oRUYhlqmlBtUWvtkb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX0ebYiU5CyxFM
 B+O7CKbSZ0ee6Bp6SglTkMV0SMcL7+Z9pVncP9zbp9dkNBU0ZoMDewbcVwipqTGSkMtjlU1xAVz
 XjDfY38zWGYmUk6rgaRQUyBo/ADbVvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:38 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete Implementation / Dead Code: `core->fw_dev` is never assigned, rendering the direct IOMMU mapping feature entirely dead code.
> - [Medium] Potential NULL pointer dereference of `core->pas_ctx` in `iris_fw_iommu_unmap` during asynchronous error cleanup.
> --
>
> --- Patch [6]: [PATCH v10 06/14] media: iris: Enable Secure PAS support with IOMMU managed by Linux ---
> commit 4079c73feb157bb490aaa33ca1d6e4970df1c4f7
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> media: iris: Enable Secure PAS support with IOMMU managed by Linux
>
> On platforms without a hypervisor, Linux handles the SMC mapping and brings up
> the co-processor directly. This patch adds support to the Iris driver to
> manage the firmware context device and IOMMU mapping directly when the
> firmware device SID is present.
>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -85,6 +87,8 @@ struct iris_core {
>>  	struct device				*dev;
>>  	struct device				*np_dev;
>>  	struct device				*p_dev;
>> +	struct device				*fw_dev;
>> +	struct qcom_pas_context			*pas_ctx;
>>  	void __iomem				*reg_base;
> [ ... ]
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
>
>> @@ -53,9 +65,23 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  		goto err_release_fw;
>>  	}
>>  
>> -	ret = qcom_mdt_load(dev, firmware, fw_name,
>> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
>> +	core->pas_ctx->use_tzmem = !!core->fw_dev;
> [Severity: High]
> Is core->fw_dev ever assigned a value in the driver?
>
> It appears to be declared in struct iris_core, which is zero-initialized,
> but I don't see any logic populating it anywhere in the codebase. Because it
> remains NULL, !!core->fw_dev will always be false. Does this unintentionally
> make the subsequent direct IOMMU mapping logic unreachable dead code?

core->fw_dev will initialized in iris_vpu3x_init_cb_devs function before
reaching here. It's there in patch-11.

>> +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, NULL);
>> +	if (ret)
>> +		goto err_mem_unmap;
>> +
>> +	if (core->pas_ctx->use_tzmem) {
>> +		domain = iommu_get_domain_for_dev(fw_dev);
> [ ... ]
>
>> +static void iris_fw_iommu_unmap(struct iris_core *core)
>> +{
>> +	struct iommu_domain *domain;
>> +
>> +	if (!core->fw_dev)
>> +		return;
>> +
>> +	domain = iommu_get_domain_for_dev(core->fw_dev);
>> +	if (domain)
>> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
> [Severity: Medium]
> Could this lead to a NULL pointer dereference on core->pas_ctx if
> core->fw_dev is properly initialized in the future?
>
> If an early failure occurs during iris_load_fw_to_memory (for instance, if
> of_reserved_mem_region_to_resource fails), core->pas_ctx is never allocated.
> If a hardware watchdog or spurious interrupt fires concurrently,
> iris_hfi_isr_handler could overwrite the state to IRIS_CORE_ERROR and
> schedule iris_sys_error_handler. The error handler calls iris_core_deinit()
> followed by iris_fw_unload(), which invokes this function.
>
> Should there be a check to ensure core->pas_ctx is non-NULL before
> accessing core->pas_ctx->mem_size?

If iris_load_fw_to_memory() fails for any reason — including pas_ctx
allocation failure — the caller does not invoke iris_fw_iommu_unmap(),
so core->pas_ctx will never be NULL here.

>> +}
>> +
>>  int iris_fw_load(struct iris_core *core)
>>  {
