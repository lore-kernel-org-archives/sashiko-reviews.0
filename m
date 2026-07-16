Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9C712CDA5
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171761; cv=none; b=JzuvBDgBDWteSbXyovFDqjq7pSIFXvpOt7VlBPXm7pRCvP1GBSJkm8Y0KmVZTEAX/iN1NoNWQFBBQUY7PMOqWe01KbN7WYtgd+XMq8gCs1YzafY8KUY4jtqhSB+fFJ/ubuBI4GeZxnor3ZcnTZCdhBkJsOIdW85vnSPIJ7Zqa3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171761; c=relaxed/simple;
	bh=wzs7eRnccY7xVL0hi5nxgDAwKdozrA3x3xgzSj7Kl3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LW++qiZhet1jQhC8SuMSB+7VP5Dc53Ftd1+PXzMvpjSw46KbYwIYuc4qJ6Kw2cjoZ6AGEKRg25f1gFewIeVGfjHQAdxX2JYy13cuXm+D8mvT0Snw+R06+PEXKWZrnUnTpWy4TZNLYLSmcVkM/SlcvlPCY0o8BQ08fQrdJwiNnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlT6n0wN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgESExvm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlT6n0wN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgESExvm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0q8JE1253184
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bh32wRuibasEUBhbRFIs3k6MEBIkIwy+v5ttkvaLEAg=; b=RlT6n0wNcpx2EfzT
	lYBSmfEAZwN7EZ+S2Xt0bAODZZOUDdXGp28aHlEyklQ7tlt2uze+99yj18kNfBoM
	c08PtqBVD9+ii0bMz+/Ovb0OHnKzopaULEv3RDtI0TAVRtgcT7Qz4f5ZvAAICZPO
	UtSKr7xjfBUVymoczbhA4xVYKxvuMNviBYWPcl1+R0N62bk7MPijO+9CBMHMIrtr
	QXHlOI7RThKGjhalUfB0VC1GxKw7aJ6NnvvEMnBlf8u8KV4j17YGpJP1TzZmt9qY
	DlxdmRPrrNOw1dByEJSF2KVpS+K7G+XlnbOsesynSztlphDgB5m3zMzsiNQZkVYR
	KvrBxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w8dfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:15:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so67754365ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784171758; x=1784776558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bh32wRuibasEUBhbRFIs3k6MEBIkIwy+v5ttkvaLEAg=;
        b=JgESExvmczRGO8QTRvqnQOQgBPao/k6pxfIrmnOq25Fwg6vzS2eGW2pbu1FEHG9llW
         YdlXj3k/OhqG+PUUf9bhfA/mtwpfCEnyQnIsBXe10VjTwYe/H/oKQUZCpgtHiVryW72x
         coWi3oGZFRRcF9mYQH4iLOmOHzOwyh/mMzFCWDXPrM2Q8ztgbYLQ4UK5OuqmWXYUq0la
         ZXumL9XzBnhkYZE9du6rY/R3rv55fpuPEk4omWDDgt4L74W8v8tlVkwJWsIsth5C1xGo
         uC+hWCC4o81kvhS+vFKk4XzSTiIMjT6bAVYkjZeL/TpoTZlgG4Qk+gmQZyM1C2BRucu7
         ZntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171758; x=1784776558;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bh32wRuibasEUBhbRFIs3k6MEBIkIwy+v5ttkvaLEAg=;
        b=Llj6i3bPw7v957FXyYxKCE3xuUPHiz1Atl9NQGzKZ+GuTwsgaUQHdtaOQNIMO62/ZM
         2gTo1e1bNT4aCP6Fob3i7yFXeLcMVV9pCrlxwXNhUnqk1DdWi8zFTi2o2OnggorZb8bP
         CGH/nq8uRM+PNsBEDIfVXrAp0N3qxkKzxjP3PYPN1tV8scwVbPTAe0OhQQ0YhoFt51co
         h07XkFY02pW/shlMrpJ8adlpNX1rMydCk1ZocH/QDQl6k0ZffRRX9adcbyRlg28AKWW8
         p9KmHCZpmFd7iBVdczv9/ajk/bO0OqVr+uge5iv2ATCcYfqmi+0v1RDJTRmXpYvB79id
         I7tA==
X-Gm-Message-State: AOJu0YzdogRVlpCUD5TYp0kZHFJlSpikc4+1wwfeWjYx8mk/LKYtyeGk
	urSuX3aDRuF2Y6PXRcvR8NNIdUJLD65fA3+uZ2lQRxaW93OgpMye+oit0Lub5iClRgv4RFei90J
	aREVW2o4MjfPpv+i8SkqRD+zWnRZC3WM6FEGY7p5dLNLVAapQSfcX3b0Xt9l2fjrCXpm57xgAxy
	+jd60=
X-Gm-Gg: AfdE7cnwMHxP/xspUJK6G2XqoFsgOlSEtfvbmJoqO3qQbGsnSrII1Ezm17AomYzwDOi
	RXmDJ5jNCs2XEwFXdbANTuilC/khgpUg6MvC96ux8YqhvaZUjJlbx+NIkZzI3+13QgcKJUGebEi
	wpHOx3W6EyPmyjUl4iC+lvmaexVaiG/cspaHeH7nFyUT9G4mFmTKXTTmcZGeyB2McOUjD9r/mQ2
	n4Tdiw1312DBMmDwjva9MWXmkdZ7d6n0xDjQgutL1NNUSVwaXT8Z1+Awqyz6JEPRCVDnz7qJvEL
	qJmQc1ubropVt1UDHmWIkDy1QnyWptssDaZoVhzExU8ps/CZ6aX/fW8yq4d10ZavI7UV5C7zmyX
	NLYNvLSDZkjJZBBQUvHIlsQOq8GwK4zaL
X-Received: by 2002:a05:6a21:b91:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3c3859bacb2mr2048581637.34.1784171758089;
        Wed, 15 Jul 2026 20:15:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:b91:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3c3859bacb2mr2048532637.34.1784171757526;
        Wed, 15 Jul 2026 20:15:57 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm9159037c88.11.2026.07.15.20.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:15:57 -0700 (PDT)
Message-ID: <20ea6f1b-94f6-6a42-5b3c-5f19626119ea@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:45:53 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 04/14] media: iris: Add helper to select relevant
 context bank device
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-4-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142929.1E59D1F000E9@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260715142929.1E59D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a584cee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=abcCcZLe6d7wP4lZq9AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YYM0rO2mceABiGIInid031TK4zw7kOBM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzMCBTYWx0ZWRfXxiRSEh3XuRUI
 Vg0uChoP9A8cK0WZxOIJie1iNKgglEqnaaw4KA8B3hinHQSscBkRKfzMEAzGJDG//fSGcpP2nLu
 dZvx7mhbXGaCAWTellZMbufYUfF+ohs=
X-Proofpoint-ORIG-GUID: YYM0rO2mceABiGIInid031TK4zw7kOBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzMCBTYWx0ZWRfX+8DK0vAQCGsP
 AIc/K1Et/v20ZDcJ/0kY3x6n3gS3So6y6EAxp7BntqjH5qQiuFTfsiq2JmGI6fRgk7aQWa+EEiL
 qr/SyXWNOkD4ZXsgH59yP3JL5EPmAHtztOW2GQKUlHc1Z5dSxZZL3NSPiNTHEGM3YH/UqBC5c3J
 17tBtegOQ1eU6hlCFKxImycSLJP3z3ElJWvWn6H4aki6bKUOMbDr1wzuJ+F1eIRDM8O2bZ1Hvuh
 5XMxGXg3HtxWbl4/PingibrYXUyInTXwCstR4yoEMcBK7o8HVUVGk+pNFzdlhHD+RMw4U42ipft
 zH6J+gsRSdb6OinQTp0qbehVLvKtgAEFjzToNJ793kiAF892NWFrckuvfb5ac2QCrfYamxEF+pp
 nkCC9yBQRopTPnXv2VevwOSCDOpFZUE/srpoomhX57V2piFAflpZWMoxDEbM5x19Xb2jTVfbeMH
 AkV7xwTijZz/4T4+Qkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160030


On 7/15/2026 7:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Using dynamically created context bank devices without taking a reference via get_device() creates a Use-After-Free risk when file descriptors outlive device unbind.
>
> Pre-existing issues:
> - [High] The `struct iris_core` is allocated via devres but is accessed in V4L2 deferred release paths, causing a Use-After-Free if a file descriptor is closed after driver unbind.
> --
>
> --- Patch [4]: [PATCH v9 04/14] media: iris: Add helper to select relevant context bank device ---
> commit ff67c19893e13d3ddb40ea541f363dbf54e13228
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> media: iris: Add helper to select relevant context bank device
>
> This commit introduces a helper to associate the appropriate context bank 
> device with different buffer types. It updates the internal buffer allocation 
> and queue initialization to use this dynamically selected device instead of 
> always defaulting to the main core device.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 246ad0abbac35..249c9f1d0d5da 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -545,7 +545,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>>  	buffer->buffer_size = buffers->size;
>>  	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
>>  
>> -	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>> +	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
>>  					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
> [Severity: High]
> Could this lead to a Use-After-Free of the context bank device?
>
> When a userspace application opens the video device file descriptor,
> iris_create_internal_buffer() allocates internal buffers using the context
> bank device. If the driver is subsequently unbound (e.g., via sysfs) and the
> context bank devices are unregistered and freed, the application could later
> close the file descriptor.

Remove callback cannot reach if driver module->refcnt, refcounted during
open, and not decremented with corresponding close call.

> Should a reference be taken on the context bank device pointer via
> get_device() to ensure it outlives deferred file operations cleanup?
>
>>  	if (!buffer->kvaddr) {
>>  		kfree(buffer);
> [ ... ]
>
>> @@ -682,10 +682,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
>>  
>>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
>>  {
>> -	struct iris_core *core = inst->core;
>> +	struct device *dev = iris_get_cb_dev(inst, buffer->type);
> [Severity: High]
> This is a pre-existing issue, but is it possible for inst->core to be freed
> before this deferred cleanup is called?
>
> In drivers/media/platform/qcom/iris/iris_probe.c, the core structure is
> allocated via devm_kzalloc(). If the driver is unbound while a file
> descriptor is open, devres will free the iris_core structure. When the file
> descriptor is later closed, deferred release paths (such as
> iris_check_num_queued_internal_buffers() in iris_vidc.c, or here calling
> iris_get_cb_dev()) will dereference inst->core, resulting in a Use-After-Free.

Above reply applicable here also.

>>  
>>  	list_del(&buffer->list);
>> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
>> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>>  		       buffer->device_addr, buffer->dma_attrs);
> [Severity: High]
> If the context bank device was freed during driver unbind, will passing the
> unpinned device pointer to dma_free_attrs() during deferred fops release
> cause a Use-After-Free?
>
>>  	kfree(buffer);
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 14d63dc76c9ba..26df872fb4fa1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	src_vq->drv_priv = inst;
>>  	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	src_vq->dev = inst->core->dev;
>> +	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
>>  	src_vq->lock = &inst->ctx_q_lock;
>>  	ret = vb2_queue_init(src_vq);
>>  	if (ret)
>> @@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	dst_vq->drv_priv = inst;
>>  	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>> -	dst_vq->dev = inst->core->dev;
>> +	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
>>  	dst_vq->lock = &inst->ctx_q_lock;
> [Severity: High]
> Does assigning the dynamically created context bank device to the vb2_queue
> without taking a reference create a Use-After-Free risk?
>
> If the driver unbinds and the device is freed, the vb2_queue could still be
> accessed during deferred cleanup when the file descriptor is finally closed.
>
