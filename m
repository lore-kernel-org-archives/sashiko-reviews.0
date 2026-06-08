Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A3386441
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899309; cv=none; b=T/5Pj4Hz9eCgLPANlv8konQWu1Oph0ICQmSEHkH9YX0DrCyYWtvcHDebwnK6m2FGQ0MMBuYo4aLyfwN9k+kMCVkPCj5HmJBF5xe/ETNducgUbssi+LXbEPFyFkTBZKWATbgln7z/U0TBV3NTV7rhegdsnevaY86flTxG0AuxWW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899309; c=relaxed/simple;
	bh=JEfr1WcPyptknpcLlK/YZlaRlnMjcAUayOk+d1ct/pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoGpFX1rUQkLA5MPQ7xdTA5iqhV8gcYjw4EylyxEcqZTj0se6pP3uIjnfV5gWVy3/PKyyj/VjC6YBlGwyS3Rouv2sthKKWc4iqqcxwKkFGkGzHd+PaR0XL5kIOLVPcIVFNXEm9y1MR3M7cG4x97PHYpu3f1ICT2pJ1yo2T2ZBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTMMv2r6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STWFFxy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTMMv2r6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STWFFxy0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GlKF1933588
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExETEUVpBVZTy6Hv/NDQ/5WQWMbvebkxoNs1PpcJ2AE=; b=FTMMv2r6BvnEyOkG
	j9kFssqUR5myQ94L/y17wbLncaiAE9HyBasdi2lbeB4BX2ImpTJQobq7NP0xKNlj
	/SlxBKtN9M2M2hoqOJhFY3SFpXsDcaV4vPAxX1rUwiHe0Ue9qxnJ0yj7ynrPt3oX
	9ZY9LCwThf5FJdra3g5abvcfw/teI4ER9H5Iv4OT1b/mycU5u+koE/q+494po3mo
	YWqyjEFPtVGOW0Ppx4U6sxBGOZsjUwb8i22YkM6r0DCkZpx1HC7vYe6/8iPjx2/O
	0rmChlPUOtUyQcRmgmkd1Qe2AdqQJuJCyNFAN0EfCYewAoOe1PnHweUWYWrxSFVC
	CJY62Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6b4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 06:15:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85c530ddebso2403195a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 23:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899306; x=1781504106; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExETEUVpBVZTy6Hv/NDQ/5WQWMbvebkxoNs1PpcJ2AE=;
        b=STWFFxy0jCYqkd089ozv77nqUc83qUqGclnbWQN+ZsClSNoPaXTfc9V3+vn0GBhkTz
         LiJwgZjSpRF0s1ApMQ66IRQ6iWZQZqu5X0HXYVm2KCsXxWJCTkO72KWeDmijArPKMGb+
         zFUrvMaX4Jm7VUjNzFbVernKs2rx55PKu8cV2qBnOy8JQyNxulqaqJQ6kldeXhJnSqZz
         z2kXOFsRDsNDO1KAzY8rNmlkqwIkRUCBTib/v684JvoYnhyrmNUZqTYT7haMuSfppGs7
         yD1jkK+1ItDTYkKOvHlhqCbABpJlMSQQXK3QyVDsCfhgOB4DahN5rrkLTQoX34S7K4Qy
         C3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899306; x=1781504106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExETEUVpBVZTy6Hv/NDQ/5WQWMbvebkxoNs1PpcJ2AE=;
        b=AViBWA3G+e56+VRHxvktfvk/pPXDDyR73DKNMeQrkN1FvIEfIX0WbHe2XMeQ9TjmZM
         /a0aqsJfFEl8DCJn6NfpwS/dFOPIFL/vtke5p6KAyk+GK5tcrBDcTH8UOJHT35Oksra1
         CQHs3CH6Z3jd4wqs7FjOANZsrJ21BBOECHxkrcmtCjo31Mq2CiL8fkxJWFGqIg/AWdbV
         6pG1Y+ELL9XZZhkcGJ/w7F3u4jScCTRui4UIBIrNDQxrLnY393Zo7Kdxgke36kwMNPjH
         tWwgHBT85ovDl/p/JCFojlyNXemcpb79pcEAG8CX1pnAwXZa8rE3kE3MrkTFvQh0DaUj
         90vg==
X-Gm-Message-State: AOJu0YxgPFuHnZ8+OviLYsuQNwarGCo0UoudQsHP32aWInQcYUuZN8df
	mtOezS0ptnTUJGD26Ti3PKiOzUfy1UsA8WYrxwG7MoS4yinKCR4ei3BvQPGXAoBg6TNX22GrY7e
	LbNzVQuqZwnPAXVyTikYogbN2iCsg6TdTxFPotuZfdncgGRiSzAD6aZ6xDdQCQN7X0j5BuXk=
X-Gm-Gg: Acq92OFGph8jLLTWIf/+2Md1zp7AJS7efZ/CZWOHkpeQa3KMD90EuPrCfdiILxMhqdI
	5SWWhMljCHMDz3QLva+fTW/NyLo9tiCoycOSiU7H96fXZfGDgIfg6nva4O+REDF8Mqcw+wvHC37
	txd8oF6mMhlmnh2NP7ymGZPWAiaR+8zAoT3xfVBJjzllK5k3lthLuHT0G3UYwSGJbZfsdzRr2Rz
	Elrc4OtWM1JEyUdQG1wTveu423AEnRdwuDyyGmUoVGEaF+LZaCWQFmWTcrlz6lPE2zQY8R0kkAP
	+qaj8PRgsMZR3LaOc216bzMT1dmNMIA/tmunfbys8JFDqkP3hJJnDDz5Eif9fPEt8b8ASLO9JK7
	Uv8yzddQ4PsNy/cLX9L8/to5mLQPgq1MjFr7cwUsQw+zrjxVqNalsTnXHru/bli1n
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr12661118b3a.37.1780899305791;
        Sun, 07 Jun 2026 23:15:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr12661085b3a.37.1780899305277;
        Sun, 07 Jun 2026 23:15:05 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm16989771b3a.54.2026.06.07.23.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:15:04 -0700 (PDT)
Message-ID: <9b66e9fe-5288-0f9b-ac04-39452ee10e9b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:45:00 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
 <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a265dea cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5C0ElrtqdOlKzEHoQjoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 5tLk_86U-qHF8IVCcHjqlU0yBsDKcDC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NSBTYWx0ZWRfX7Nkzc401zn7U
 ZCSbswqVkL63SDDIfOgpT1hoVCnqjI4GzArtf221HHRlwf/pVW/4vjhoPRrJ3UiNIpv/ZqSVn3e
 TcahNTVf31cBKNRPJr9i6KxL09moGJfh6e4EXGC2Is/Qj+hzOxvJDhwKGHNe93IBLMZ0J+GO5q2
 R8zHxVO/gIGx67HJcTSDHlTJZYxnKgtmjAHRHyfYRXBZb7uYbgeKtpWZDmlbo1Xjpt+/3uvE874
 in2SBFS3WypwPwIzFsM6A7DFj76uWekoc911ec3sxSCt0ahYLTP6kLhpsyWxSDd4izJtcaLFaCQ
 IhlNWS/uaLU42kvszcixI2eQPetwI6zXvDeYa8DXzcJmRYSuem7ZFDX1p/a3QIsyXWgh8qXnfCW
 YxJ42N/Z4OXYHlkz5xNSmFQHNuepR5GVWV2l4tliFdd3bGi4CcSejNiXJxN6bTBc0OrjeIM+vX7
 KnRVgA3fWXJRpYTZ27Q==
X-Proofpoint-GUID: 5tLk_86U-qHF8IVCcHjqlU0yBsDKcDC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080055


On 6/8/2026 11:25 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 11:08:35AM +0530, Vishnu Reddy wrote:
>> On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>>>
>>> New issues:
>>> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
>>> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
>>> - [High] PAS metadata memory is permanently leaked upon every firmware load.
>>> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
>>>
>>> Pre-existing issues:
>>> - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
>>> --
>>>
>>> commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
>>> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>
>>> media: iris: Enable Secure PAS support with IOMMU managed by Linux
>>>
>>> On platforms without a hypervisor, Linux drives the firmware loading and
>>> authentication steps directly. This commit extends the Iris driver to support
>>> Secure Peripheral Authentication Service (PAS) on such platforms by creating
>>> the firmware context device and mapping the IOMMU when the firmware device
>>> SID is present.
>>>
>>> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>>>> index 1a476146d7580..8bdc9273036ce 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> [ ... ]
>>>
>>>> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>>>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>>>  		return -EINVAL;
>>>>  
>>>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>>>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>>  	mem_phys = res.start;
>>>>  	res_size = resource_size(&res);
>>>>  
>>>> -	ret = request_firmware(&firmware, fw_name, dev);
>>>> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
>>> [Severity: High]
>>> Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
>>> during repeated iris_core_init() failures?
>>>
>>> If a subsequent step in the firmware load fails (e.g., request_firmware()
>>> returning an error), iris_core_init() returns an error, but the device remains
>>> bound.
>>>
>>> Because iris_core_init() is called upon opening the V4L2 device, userspace
>>> could repeatedly open the device, failing each time and allocating a new
>>> pas_ctx without freeing the previous one.
>> If the dedicated firmware device is not there, will check and skip the repeated
>> allocations.
> No, the path is the following:
>
> iris_load_fw_to_memory():
>    devm_qcom_scm_pas_context_alloc() -> succeeds
>    request_firmware() -> returns an error
>      return
>
> Now you have a dangling PAS context. It will be freed only when the
> driver is unbound. If user is persistent, the driver can eat memory and
> possibly other resources.

Agree, Will store the allocated address directly into core->pas_ctx and used
for next time instead of allocating again.

>>>> +	if (IS_ERR(pas_ctx))
>>>> +		return PTR_ERR(pas_ctx);
>>>> +
>>>> +	ret = request_firmware(&firmware, fw_name, fw_dev);
>>>>  	if (ret)
>>>>  		return ret;
>>> [ ... ]
>>>
