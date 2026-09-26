Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42657377A83
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411491; cv=none; b=lzCn6Q3cGvz2K5Vxo2LY+hdunNBh67Jt50uxmT/1XCPCit30Kw02UZeu4CKtLFkLeJ0uZ4us68t/4Zn9grwwuo9aRG/Dnl0gIeuwntN9ewuWnm2ilwz4Nxi4Lpl7wK1qcHhSlpAcsEBWr+YEk8Wmc4NizB3EwrAO2/hNif+li5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411491; c=relaxed/simple;
	bh=Q6RnljJs7WyPx6AOXst7N2sI/86ZVVHjCuJGZA0WIyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+PNbcOI96OrFQpeLrkvQzuOKvKbe5InbIpG2YgExevPrjLa9GZaNYLcFrM7FSrqztSyHlowWAKb6s8rklyXKtM8e7ha3pJptcu9J/3ke+YGc4tNRxgBPha3HX83HbNys1tT2YRN63FEC3IwW+YnpT/cg64itav60ZLVLs7cP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGrfv/jC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdS/sskx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGrfv/jC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdS/sskx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OwSe3267892
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 08:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDMHCRd74i0puiykqzpODlN7stDhp5bygZWJu+ngLkQ=; b=KGrfv/jCNTYOftza
	ccVhwEckMxWwHC/7q6pYTj2qroB8A3Me6GJTgtSLLcUxgmOQl0If4RxzzBrc+QEi
	HfiH+htNlRlPk5WurraDoauoFP84c6cJDmz/Dv6mC5SOZJ3QHczmxTMvjj4DAw8l
	O8LRLdPPPpMTh8VH7xvHI6clOH/rTvJ5XSbRUAoqyu+bqRHNN6isLzVFhyAfZjJ1
	G3LnUrIRbyVLnT8am/j/VlCe+fbEuH1hwimntESM+l4U2h1Z873oVssgXyw24b5M
	9Iv5tS5pkNnyaiV33EYI94jK3En1e8YL6zriIR9V4BmVvJ7uvCJTNtM3msq65U38
	mkz2aA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0u2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 08:31:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3514711eec.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790411487; x=1791016287; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDMHCRd74i0puiykqzpODlN7stDhp5bygZWJu+ngLkQ=;
        b=hdS/sskxwiFI0WGiXfFcWAFp6yEm54Entz05bLGay3XRKcfS6dHtC5cMkxz8ou2iO0
         /T7PiVafZxiv6fmo3H1Fi1TJ55nUeLboKl0AOFnLznk4ewDE/Vw8h1NP3g1fKC8PZwqm
         fP4ON+hIJSOUcFg3q89ukXwUuNrsFeRuxd1l6S3yZmMIzY3xt44WbLUW/y+GTogb2Yhk
         3ZeO1w5wVvQJJIArWofVyQyLcfhwt5ZAmDRfFPqr1HMPFg/FuKz4/jtMdGj3AV3C1dXy
         WGEGA3KcjeMcjn6a2wqLHHXlq4oBobDMMuVirJDVh0lUdSIBW/GiVPXsC118EAO1XG6U
         KdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411487; x=1791016287;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDMHCRd74i0puiykqzpODlN7stDhp5bygZWJu+ngLkQ=;
        b=wqbvqFmeFj+oqzWP2hvFVhHaR7ADiSgOtSCbxIRQB9v0s43B5yXWlDRa9oMZ1AAW3q
         ib3u9JPaUMXaADA5j4wyWoTKhkpkEqc3vZGb0l4y3y48sjm0kDhKVRP8nEnCFCW8N5Po
         EhVfkPuInzEvsWlas4hnbnKo8r+4riDPUzMuEW8VeFLw9FXuEEBgSCRXy6ib4ZOHzzpp
         bzTFYmutSrT9/CCr40/b5IDtDK1J391zLZkAvPO+ZjPy21PtDrkUqMS2Z2YyIEfCSBnC
         TxnngnH6eBaOEfS/DXgfhXAiwL8XHGBN39PRAIKdSDTACcCJRH0Oc0M2TIWs4OXosICY
         FQVA==
X-Gm-Message-State: AFuF++mQsPk1Cao8WIamVMehBvcM/Ke0XzFJWZxrKjanseWr8gJZAqOW
	hs9oWzD8Te9YiERUUVvusO7FXtwAIJKUokvdwfJIsBqju6zQ1m50iopy3amrOjIPSc+liqV3g2e
	Nmqm0N07Cg1mfBI/PyK/MIhlprsJKCvVLM3g11FWA/OxJXnTtwpioJQSylei7A3gH8bXO3qYtdx
	OKDSo=
X-Gm-Gg: AYBFou1SURE79qSrcfoX8akZVyA1cyh8p8YAyKFa5I/YPbJCSq+RDxEEnXnL4GM/Tr+
	kavHNoTKVaoN/UWLS+Pp4GmjscmGnuDe+HtM2w/NP1cBcAIo05reCHQvZEWNKmTk3TK+CDDZE/r
	whGck2AGbZCCZbVWne3Hxs+hR6mPGJDilEflfgOGZ97saZ3mC6WWb9qhSuFjvm6/BnVpfOzZFil
	9K4vUefmIezz8GY8VBa2u/aw5oyLWmwDkIbn1JNeEip29LV6USFink07vHzQhHJ0DKi5pBOB3Ft
	elPoOdr4CJfhrLXB4RbMLqgmFXbkaMYBmIK+HF8tf+ppFxXbERRKK7DKc5ZIeboE4ZwTKSgoAsQ
	Tujve6iTJpHdKKLNgiEnwb4EpgP5bpE0=
X-Received: by 2002:a05:7300:a21d:b0:341:b209:9163 with SMTP id 5a478bee46e88-342735521b7mr2073298eec.38.1790411487363;
        Sat, 26 Sep 2026 01:31:27 -0700 (PDT)
X-Received: by 2002:a05:7300:a21d:b0:341:b209:9163 with SMTP id 5a478bee46e88-342735521b7mr2073279eec.38.1790411486654;
        Sat, 26 Sep 2026 01:31:26 -0700 (PDT)
Received: from [192.168.0.14] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm18998755eec.9.2026.09.26.01.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 01:31:25 -0700 (PDT)
Message-ID: <4befec0d-2e6e-ede6-64d7-58e1123eb1b5@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 14:01:21 +0530
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
To: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-6-0322ca5dc10c@oss.qualcomm.com>
 <20260926064921.976721F000FF@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260926064921.976721F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzMyBTYWx0ZWRfX53M3IcWiEzkw
 nEYhFegB59Qk3ATUqXdz9ZhURE8roG2YrfO3av6aVLy8w1itZE8wT5vlH14fU2NnwiwZ5b6pitM
 yKr6UNrcrvY/8qn3GGaY6o468MrN4hS2pfbTNqGFQB3PhDJbqAqacnk3p0XLGPz+SMGHxe9xNI0
 PgfMuW+97MmmgWhTX9c5Diamza2aKeSA5vRS64feafS8ECfGBU8LYDZU1j+mpfIVFQNdJJxOmVQ
 mw/oFJIHdWji/yeyRjwb20j8geCIQuCP6td4S37YceR6PwNSbYN/BcWjw61DcqK0c5IrBz6bcob
 aAVAgQoD0Hj1QYtBSy5LGAV2cMpUwvRpxoy3lYO8E9QupsYgMkq3nGeR24RIDxp1h5VYY4g4gjO
 D08NCsbAbw9CXQNaj7fJBZHUrW8auBKlfSnA7Tsg6gbDLIFL5j1GBeHCCFw9BVrxzun/wM/Jg/j
 E/3vcQjm7/EYW34r38A==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab782e0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qhz_HyYNjHwnG3y9hAgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: -Yamyv53coKoZTibmHD1XzdwAUuE1XYN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzMyBTYWx0ZWRfXxETijufqvU+c
 ZTQ8OIuf2zRed8YmNvW1sW+PTNE0W9XU4Hes8uE9du4EufMwiXNhEszpuObN5jfzO9duqwSY1PX
 N5NXVe87NYG2gdYIl+gXKxpHq4YwhQQ=
X-Proofpoint-ORIG-GUID: -Yamyv53coKoZTibmHD1XzdwAUuE1XYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260033



On 9/26/2026 12:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] media: use-after-free of context bank devices during deferred V4L2 cleanup
> --
> 
> commit 720de65140e46882c5d0651161ef771fcb1189a2
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Route buffers to the matching context bank device
> 
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range.
> Add iris_get_cb_dev(), which maps a buffer type to the owning context
> bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
> NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
> buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
> BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
> inst->domain: for a decoder the input is non-pixel and the output pixel,
> and the other way round for an encoder.
> Fall back to core->dev whenever the relevant context bank device is
> absent, so platforms still describing "iommus" on the parent iris node
> behave exactly as before to maintain backward compatibility.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index eb8de60c1177f..6e03d13ac1a79 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>>  				       enum iris_buffer_type buffer_type, u32 index)
>>  {
>>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>> -	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(inst, buffer_type);
> 
> [Severity: High]
> Does this acquire the context bank device for DMA mapping without taking a
> reference to guarantee its lifetime matches the buffer?
> 
> If iris_remove() explicitly calls platform_device_unregister() on these
> devices upon sysfs driver unbind, and no standard buffers are active, their
> refcount can drop to 0 and they will be freed.

This is not true. Remove callback cannot complete if driver module->refcnt,
refcounted during open, and not decremented with corresponding close call.
iris_close() would call iris_destroy_internal_buffers() to free up the buffers
before un-registering the device.

> 
>>  	struct iris_buffer *buffer;
>>  
>>  	if (!buffers->size)
> 
> [ ... ]
> 
>> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>>  
>>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>  {
>> -	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(inst, buffer->type);
>>  
>>  	list_del(&buffer->list);
>> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
>> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
> 
> [Severity: High]
> Can this result in a use-after-free of the context bank device during
> deferred V4L2 cleanup?
> 
> If standard buffers are active, videobuf2 holds a reference. However, during
> deferred cleanup in iris_close(), v4l2_m2m_ctx_release() frees standard
> buffers before iris_destroy_all_internal_buffers() runs. This drops the
> final refcount, freeing the devices.

iris_destroy_all_internal_buffers() frees the internal buffers which is managed
within the driver outside the scope of v4l2_m2m_ctx_release().

> 
> Will this fetch and dereference the freed device pointer, passing it to
> dma_free_attrs()? Additionally, does the devm-allocated core also get freed
> on unbind, making inst->core a dangling pointer here?

Unbind will not happen until iris_close() completes(explained above), which
avoids this scenario.

> 
> [ ... ]
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index fcbc60016beec..064cf0a80748d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -108,7 +108,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	src_vq->drv_priv = inst;
>>  	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	src_vq->dev = inst->core->dev;
>> +	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
> 
> [Severity: High]
> Does this assign a manually lifetime-managed, short-lived device to the
> long-lived vb2_queue context?
> 
>>  	src_vq->lock = &inst->ctx_q_lock;
>>  	ret = vb2_queue_init(src_vq);
>>  	if (ret)
>> @@ -122,7 +122,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	dst_vq->drv_priv = inst;
>>  	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	dst_vq->dev = inst->core->dev;
>> +	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
> 
> [Severity: High]
> Does this also assign a manually lifetime-managed, short-lived device to the
> long-lived vb2_queue context?

These devices are long-lived when compare to vb2_queue and are freed only in
iris_remove().

> 
