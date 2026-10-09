Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5862739768D
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544476; cv=none; b=tK5FCMKr1NsHq5WJeI7dXgfk7Q4kqYTqzBOeTdTXPObchYjEly89rPcZ7JGEFYuiDXY6+CHgMm4qBd68A/WTwFl4kiYVoRdtGDkbh9sH1COAEUerwO0279M8vZtVCthx5sh8pBXB3MF8WBpEw3MW+nnHSLwN5ntpHGtyhMWKptw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544476; c=relaxed/simple;
	bh=P2S2YL9lOzP4PisLpp+V5WbwauQ63zNIBD6O0OWtFnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+ppprQfSYuSKAbzCqsEKAvdN9rjFqKDBmeK2/lW0nrwjir20/daXH4n0ByeU0ttps+XzzWQe5m9mkmELCd9X/p/GneTSVVJ6SdAUtGFHeFA6pQzS7cruhMZT0S/yb96cHyBBAMmOyoQat5ILHpvYZz6TTX0OnQ/QOVwAff7aAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU/rR5XP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XG0oFqeR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU/rR5XP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XG0oFqeR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KRcG1252625
	for <sashiko-reviews@lists.linux.dev>; Fri, 9 Oct 2026 11:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/4FqmR92zRJCg4Pa51Uy/gXBiH7SnkiLGj42T8GY/k=; b=WU/rR5XPmztIEQm7
	uH3cCV3RrViBH5JwGf1XxGOvAukMOixNRTf9WKq08dLbuKdPkLV/EuVJzVaIlCUD
	HWTNOD81lFq9fF+9G0jPAhYIpblPngzoTU0EylSzJS7hjsECr6yispjiL7LRdcEj
	ZbC3encsyCLg6KVy0BaDAfiCl602QOQoFHa7nSviFOhWaeBuUB1fsplccSru0ifR
	8gAoQnv88yegzTFBmXNxnQBRJaV+lYwC1KQHaf8R1NpXosH9cSl5S2lVNMxdxsrg
	x/9nN0XySuQf3X+MoKag558Vn6IBY9VevXUfp8Wd2boMxfc/rlgWZu/vQsQzCMMi
	yGLE1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj4fc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 11:14:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso7643371eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791544467; x=1792149267; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/4FqmR92zRJCg4Pa51Uy/gXBiH7SnkiLGj42T8GY/k=;
        b=XG0oFqeRJb7lix1Kkxe2/FEvY/zJhdJfsHHEPFH+kWz6evPqVquFZ/kRnC8JzkTy9z
         +45RFrK17clxoq2FZR2dcWlBA4mkOHvysz3IgdTyiwLBs3eFEGstPgLI1FHQjxZ1+we0
         SEB2BFkRj0u2Sewe3WMCMyTQZWdNhGPMwOCMN9IiTUrFAknBxTiHLyIA7qbpqqJLJhV1
         /5/oyOg8+Fnqx2CSzH2TkeMNEAnSzGqYpztYpCg8ZpZzBl/yVILbAx+Yg1ya5d6lu2RO
         Ob9c3un8p/sZcfez3/IFCdQVfarU8E21b5vcy7TMbVdOoERPlWZKoG7RJY5J1oEhI4Zd
         Y7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544467; x=1792149267;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/4FqmR92zRJCg4Pa51Uy/gXBiH7SnkiLGj42T8GY/k=;
        b=EY/dwzkASetcOQxsMCxxejtp3P4MoWzCYSdrifKbK4p3RUSg5SfRsRXriUataBT2hu
         vM4UcFUvLma0oIDpO3fdwD/EbLuN/R+GiOzkFyTEmmiVNuqR2i2eNKfwwyXTzr64n7F5
         fp9UapNSgjkJShLlfOXCwugBZfsF2fnjG5BZ4zFLilf26SrL4p09jnI0xxnXrgH9CnxZ
         6VmZnm1vfRe66Uvc4Hy7AkoRZ4Z/ri5Lc05S0MS/WO4enjiXICfXsSn6iLmFEDvcG1k+
         IP8HVTWBXtE03KGDMEjgWMqgiDywYAeUOt3910K+FV9g+wfzHQoAWDsVKfsZMwSu3u4Z
         H5zQ==
X-Gm-Message-State: AFuF++mF63bKfPIMb0lTgxEurIS+rChCjfGgunSpxBQ6CcDdX3Wb0cLS
	X2e0Ok/tC6GNnn+793fUenAFjPg2f3Kd/YPApY484e3eNmWBIKSJ47bkt+W9n3egRg2lv9cmlY3
	P89aLmaOtHtNbTCx+esj27pLdbsgfhxdLQD3MLn6+L8WuvJtfSDLc65gvDDR3b2umN+h7dpo=
X-Gm-Gg: AYBFou0l1vIYEH+cnZW7BrYxKtfWAJquH4p0HjEUYi33IUheREnpuaxumbkYPcWgSV2
	YgjBJEniqArjLZsvjvC0O0vHYOrjaxCQJCZWK+z0jJUc5FW7aNAqqQZeGdE8DY2Tm9CQII95zG0
	t7qO2NwE+uU8OSv6l50TMqNbUySM0baMkbvs3xBHVw4mM7GHcpCWRHFW12J5pxcAF8Ml+GUiFB+
	hvRDKnkQPPfpdrgs+3qJQV9L2FJbPTBb85Kydn/ClY7mBGMxKl5/Igw8epR3oPnCsHCWcGz9Hiy
	f535bIftB4JKRvswLrxtWzpBbE3AmZNVTC8niAJITyWVUu2GPrKo7ts3s7jFPcaNneOLbHeCKAu
	5DY0Ktl0FEDlNTW3EFm6OTZaPSwVGPbY=
X-Received: by 2002:a05:7300:ce02:b0:351:4d3f:723f with SMTP id 5a478bee46e88-3537e03ef20mr2147649eec.13.1791544466412;
        Fri, 09 Oct 2026 04:14:26 -0700 (PDT)
X-Received: by 2002:a05:7300:ce02:b0:351:4d3f:723f with SMTP id 5a478bee46e88-3537e03ef20mr2147625eec.13.1791544465755;
        Fri, 09 Oct 2026 04:14:25 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm9109354eec.9.2026.10.09.04.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:14:25 -0700 (PDT)
Message-ID: <9b15a39a-eca2-d26e-e060-d32879179b00@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:44:21 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 06/13] media: iris: Route buffers to the matching
 context bank device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
 <20260926064921.976721F000FF@smtp.kernel.org>
 <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
 <txowl3kctv2oca5gqqtiuabh3bffqbb5ntbsfeele5bclzaxrx@4pfvzkccpybj>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <txowl3kctv2oca5gqqtiuabh3bffqbb5ntbsfeele5bclzaxrx@4pfvzkccpybj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX5Oy3XAqnTSJE
 Dxjw7Ko3/V/k0J3cdMu4J6JO9D2ZKoc/yHPdxJ8FpHM42p0q70+aLXg99OkeqlsHrg50BF/fXm7
 BYVqf5hcEZtqi5kZgZhHpH7PP9iO0TDOVKYl0u5uIocGfSZFdJMLJk3fisjzqZsJ+PEaQN1iY1i
 7fhknPPzT2l6GjfRajwUb0JTVAYnRK62kB2vh2My4vz16Z5aLx9PdvngvopflYWpIoZ5NqwEP9e
 wN0sihQ1eRp780M9+1P0S7tAS0bNgGvzU22rsyl1SQLMsvhekz/mTsS/ytO2Zl6sY/gSpXOZ5Q2
 v+lJXwgXJ0hkevVj1j3muGn7ZUUifMHr1J+Sk6lJVOP0WpfqrDKO5OQGoZoXvTO6JKKBFhDObNv
 B/3PWqZuWuQXP9ueQF8rU0H1LDmUKAU2CEJF5XpEcRu2NjXwzqb66GhQOGSTGglLvNS4pMvM96g
 L6oHIyndkEeP8UQ3ZVw==
X-Proofpoint-GUID: kbUEUPJKLhNZiUMET0-UQqDX2ncfl5MM
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8cc93 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lh3Vmvx1oRNcEU0KFpoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kbUEUPJKLhNZiUMET0-UQqDX2ncfl5MM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX2f3hOoHBL5R3
 PB5LyXYmxjnngqMk/MK/CgG/HtXC+T7Mrsa+PlW9tLIXaH46aS5pAbQfe//Tp0lsERUANFkSl1j
 kThI1anu33d1nfIY/HiFerHUUFycv/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090044


On 10/8/2026 3:48 PM, Dmitry Baryshkov wrote:
> On Sat, Sep 26, 2026 at 02:01:21PM +0530, Vishnu Reddy wrote:
>>
>> On 9/26/2026 12:19 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [High] media: use-after-free of context bank devices during deferred V4L2 cleanup
>>> --
>>>
>>> commit 720de65140e46882c5d0651161ef771fcb1189a2
>>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>
>>> media: iris: Route buffers to the matching context bank device
>>>
>>> The VPU issues DMA through several SMMU streams, and the hardware does
>>> not give every stream the same addressable range. The non-pixel stream
>>> cannot address the low 600MB of IOVA space, while the pixel stream can
>>> address the full range.
>>> Add iris_get_cb_dev(), which maps a buffer type to the owning context
>>> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
>>> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
>>> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
>>> BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
>>> inst->domain: for a decoder the input is non-pixel and the output pixel,
>>> and the other way round for an encoder.
>>> Fall back to core->dev whenever the relevant context bank device is
>>> absent, so platforms still describing "iommus" on the parent iris node
>>> behave exactly as before to maintain backward compatibility.
>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>>>> index eb8de60c1177f..6e03d13ac1a79 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>>>> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>>>>  				       enum iris_buffer_type buffer_type, u32 index)
>>>>  {
>>>>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>>>> -	struct iris_core *core = inst->core;
>>>> +	struct device *dev = iris_get_cb_dev(inst, buffer_type);
>>> [Severity: High]
>>> Does this acquire the context bank device for DMA mapping without taking a
>>> reference to guarantee its lifetime matches the buffer?
>>>
>>> If iris_remove() explicitly calls platform_device_unregister() on these
>>> devices upon sysfs driver unbind, and no standard buffers are active, their
>>> refcount can drop to 0 and they will be freed.
>> This is not true. Remove callback cannot complete if driver module->refcnt,
>> refcounted during open, and not decremented with corresponding close call.
>> iris_close() would call iris_destroy_internal_buffers() to free up the buffers
>> before un-registering the device.
> I don't follow this comment. There is nothing about module removal.
> Sashiko here (and in several other comments) tells about using the
> `unbind` file in sysfs to unbind the driver from the device. The module
> is still present in the memory, the module refcount is not decremented.

Thanks for clarifying the comment. Detaching the driver from device at runtime
might leave the interaction with hardware unclosed.
Would prefer adding something like this
    .suppress_bind_attrs = true;

Again, this is not just applicable to sub-node devices, but to parent device
too. Sashiko should classify this as a pre-existing issue.

>>>>  	struct iris_buffer *buffer;
>>>>  
>>>>  	if (!buffers->size)
>>> [ ... ]
>>>
>>>> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>>>>  
>>>>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>>>  {
>>>> -	struct iris_core *core = inst->core;
>>>> +	struct device *dev = iris_get_cb_dev(inst, buffer->type);
>>>>  
>>>>  	list_del(&buffer->list);
>>>> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
>>>> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>>> [Severity: High]
>>> Can this result in a use-after-free of the context bank device during
>>> deferred V4L2 cleanup?
>>>
>>> If standard buffers are active, videobuf2 holds a reference. However, during
>>> deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
>>> buffers before iris_destroy_all_internal_buffers() runs. This drops the
>>> final refcount, freeing the devices.
>> iris_destroy_all_internal_buffers() frees the internal buffers which is managed
>> within the driver outside the scope of v4l2_m2m_ctx_release().
>>
>>> Will this fetch and dereference the freed device pointer, passing it to
>>> dma_free_attrs()? Additionally, does the devm-allocated core also get freed
>>> on unbind, making inst->core a dangling pointer here?
>> Unbind will not happen until iris_close() completes(explained above), which
>> avoids this scenario.
>>
