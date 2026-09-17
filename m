Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7BE4AA566
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647479; cv=none; b=nrG3mT898vhLlW6BuRtrWe7PyE8B1OYy/LP5+DInjmul9sbgIaKe/Joq+XOcODoLZCUOLZ2ZtIMAQu4+T7knWotnEvSVXmq7D/H6B1D5OyqYcADD+KNWm5Wql4A3PU3ucgmuuwWmPIXsvKNytTMcTMLxR9hf6c+c8gLhjuSHqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647479; c=relaxed/simple;
	bh=mFXQRplK7Tru4IGa/IeoLc1eJ1PO9FZp1wQMKUl8n5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obsQe+bxm6MbMgu2w4H40ZeelK1Ri0y7ofgGn6nVGetRkO85HRmNmHD7wZzGFg4PkIPYhOE2a37QPLq3WJaRQXYEk7qAzqZstas+ufxQV2tpnCNTh+UrAZHQ+c2UKNCMXaHvg6JIx49tiosjUW9I5sKiRJUfD2mW8VahT9ygaKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QV32/7r6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZTlSIIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QV32/7r6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZTlSIIL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZSwH2410420
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 12:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knfojBFIONKDfO3+XeI2J2qQx98XKylUoNvwAISaqCM=; b=QV32/7r61PCxOWfn
	Bhel+CmW3ILGi2CDlU93qFE2CruF8lhsar+m/pMKU6QBoV/swqBZxWuUIjgk8LgQ
	R/8HCilhpOCEt1e/IUiLlMh0aBhJRiWj+KhrTmpVMKQ5IhMJRWeXMYLeK/u1iCV2
	VSb9KqhLCFGx2QOKKmeTy8dyqjVhbs6fieWrOv9MXBaf0QvGt/cQtTTMDAK9ecpG
	SpPCrwCCm1tP3weFP62emNuniKYbyKF4/enG5psCwYBBoC1WwHbW4oea1egI+PqM
	lG5LKn1j7i2aJpZsnxizhmC3wzR7iVQsTON5jhhMJLGZla8LBcCociWnI97Mr7Y3
	DbuIvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gpxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 12:17:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so15841315ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647452; x=1790252252; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knfojBFIONKDfO3+XeI2J2qQx98XKylUoNvwAISaqCM=;
        b=JZTlSIILlEymuvPU6ZrfeV8qPp67VDk847BfU+6rIxgXJ0MxJqrK1kSi4McCffiTBW
         wqQJwVThl4pc/MjSL9QCCgBoQzmrek+SluNhsvwt8LUNnjDNG1lxm2PQjYjES7evIV88
         XfCP3YqF8cjrPKLIwCvCZVckpa5MClzIOg76SdLYNYoqIWSuyDKWdiTMV3FaBu8rLill
         Pnx6oKzL9b9PJdN5KTzIKzo+hj5lqIbNW9SuFNEvcfV870Ob3nbFXb68+jtAwzFLobiv
         G2DyY20NE8Tfs1YKgKJSq5rk+eGdYrq9qOVxhswqC8yUF//FrznIS+fAeD2uU8BCPBu7
         700Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647452; x=1790252252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knfojBFIONKDfO3+XeI2J2qQx98XKylUoNvwAISaqCM=;
        b=EEEQ6luAXy8Z8l6EpYdYcG1yBz3Ih01pp25Y/sXVVCla4XTub8obGnzHaaWJT/piex
         3e9WyUALDlh6twAQFFkWenxI+o3xpdf3LJT/Jiw/sOPNlmsDnvAOy676qApbk5ZVOGCE
         FVqHrHeuQ/znB5OswbiNP7KpsxErwPknq6CMDkEB9aTX7xtm3UoEjKT8jnJdLIzRktLM
         g7MFsxIaU+eLb3O6ZkHZEn3VC1JqlRRPp9Y5/lVou6N64OKpkkPaPHj7zQXFKD8cd1Vb
         GOlmV0fCYOFC+C1nW1ZZTk1I9sM/2kZ2Sjpntk8N1pMxhVt+vQzKKm0jf4kFbtsi4bTp
         kIzw==
X-Gm-Message-State: AFuF++kzvz96hG6ORs6eA/2zg4c2b/gA6j4l7fkwwZ+BU6JzbOC+lZM8
	XFq64LN8wS4GrGNFph6sAy6ohI4y09fc43URNvs/7Q4z4z2iyMRAuOPNFPxUWb+iGhEFUwQrozq
	CbqbF9975c+fHdcK6SDlihzBaO27QgZxO+VfZ+D3aRmkLNswrooM7GCWK1/3ftqoYgld/GZ6Krh
	1OvS8hVQ==
X-Gm-Gg: AYBFou3hjc6jAjDAszlWgvMBCFNVUsT570L1pO5XkoBQiUR1odcXTYOi55H/rVC/hno
	wpwn8/MQ9kbb+atX9cj6vfvJVD8OREswDnhcvFYYng+7P4bp1IDGg95m/ksR1U5uSDBp+6RETcZ
	vsmEsNqCvugdkCFz+RjnJHfJckndt0s8MWBTybSVhjv1E4i5v2/EUAkOszCa8eJvQpbRNMO5LoD
	UZBCqlsVAoi/7EHAAS7cZXSREkFa0z6bSeC5RZShMSjRQWKlFnD0/0sEem3VEvIIUeiMkIuzfYW
	MUHUP8Mdb5WNymHxYkmvEUwWu2fAd4ur2KnWbn1uTR8lU/V+2+FFXq/LgBHDjJY0SlxKQl4gCNj
	YkxbEYthgROEaP8XF7ahmvxaQjh4tBmF9wp0nFUDLWSk/fUgBLRxACungEg==
X-Received: by 2002:a17:902:ec87:b0:2dd:ad73:5b69 with SMTP id d9443c01a7336-2ddad735d3amr1179175ad.25.1789647451546;
        Thu, 17 Sep 2026 05:17:31 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2dd:ad73:5b69 with SMTP id d9443c01a7336-2ddad735d3amr1178785ad.25.1789647451068;
        Thu, 17 Sep 2026 05:17:31 -0700 (PDT)
Received: from [10.110.122.88] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f12117sm25529505ad.70.2026.09.17.05.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:17:30 -0700 (PDT)
Message-ID: <b133206c-51e7-4877-be14-a4081e9e7cd7@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 20:17:27 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] virtio_blk: Add control virtqueue support
To: sashiko-reviews@lists.linux.dev
Cc: Eugenio Perez <eperezma@redhat.com>,
        "Michael S. Tsirkin"
 <mst@redhat.com>, virtualization@lists.linux.dev
References: <20260914133733.15429-1-linlin.zhang@oss.qualcomm.com>
 <20260914133733.15429-2-linlin.zhang@oss.qualcomm.com>
 <20260914140213.398941F000FF@smtp.kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260914140213.398941F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KsgFfvvdAEYhC6L0FH-D6R_7phesz7zt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfXy18reXoKZFuB
 lae3u3YXWhBe6vIIFRScdnOgIRLGvh3VH50TxbKEyZdT7ZrgM12OCVT0dCSd+fBVdVaPqBS2cN3
 +yqtOxhqkJkWl0LfmigUu2apsEsla+nMIHgulinNabHx3iPnUjW5WPksCUr60SCxImI1lkDD9vA
 G4rBJFPJm7+KRbVIHzFlqMm1wKKzyTfB5Jx0Qkwj+bydWUjinSliV4+VLclj5HJI2LH+GfLiDQh
 TLumpgL1bFfO7EopfrMsuiLh6bOBHgNwMmc4vBXEh2y94PNuXLxnMLaS8twWkPxk1d8wwAGxl4Q
 jVbC6Xs3iKiw4grcvSZfzKYVUNV/JMGxzvxAOoR0O78U1l7j/EQlRpM+v42JjmeVrfzmG/S/vDW
 WQc73envv6OuSYT0CbJu5VbZUC6j2bHmH990EuZQ99ZvGj/NMI1Fxdrdy0/oZiDjYZJMvglE1Tq
 /EHFs7IpimrgWxRXr5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3MSBTYWx0ZWRfX03pQ6HpGvnik
 hTgWIKEKgbiDg0Sinz0YQ/QmkCzYv6RKDuCkldcbeRji3KtPAk7aZZGc17cmvCT/+13FFMbdG9B
 hwc7Ck7ldxI82ObGsLFqJKfmUdxJ2yA=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabda5c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2u0DQsLCC9M23k4N1EAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: KsgFfvvdAEYhC6L0FH-D6R_7phesz7zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170171



On 9/14/2026 10:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] DMA cacheline sharing causes memory corruption on non-coherent architectures.
> - [High] Erroneous teardown ordering causes valid in-flight requests to fail with I/O errors during suspend.
> - [High] Unbounded wait in `virtblk_ctrl_vq_request` deadlocks device teardown if the host is unresponsive.
> 
> Pre-existing issues:
> - [High] Use-after-free and double-free of `vblk` in the `virtblk_probe` error path.
> --
> 
> commit 36271d203fcaee50a88fd7b53aa73dbbba25cf7c
> Author: linlzhan <linlin.zhang@oss.qualcomm.com>
> 
> virtio_blk: Add control virtqueue support
> 
> This commit adds support for the optional virtio-blk control virtqueue.
> It allows the driver to manage control-queue requests independently from
> the data path, preparing for subsequent inline encryption implementation.
> 
>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>> --- a/drivers/block/virtio_blk.c
>> +++ b/drivers/block/virtio_blk.c
> [ ... ]
>> @@ -110,6 +123,12 @@ struct virtblk_req {
>>  	struct scatterlist sg[];
>>  };
>>  
>> +struct virtblk_ctrl_request {
>> +	__virtio32 type;
>> +	u8 status;
>> +	struct completion compl;
>> +};
> 
> [Severity: High]
> Is it safe to place DMA targets (type, status) and CPU synchronization
> primitives (struct completion compl) in the same struct without cacheline
> alignment?
> 
> On non-coherent architectures, could the DMA API unmap operation invalidate
> the cacheline and destroy the CPU's unwritten modifications to compl.wait,
> thereby corrupting the waitqueue? Buffers that are targets of DMA typically
> need to be cacheline-aligned or physically separated from CPU-modified
> lock/sync primitives.
> 
> [ ... ]

ACK

Update  struct completion compl to a pointer of struct completion compl.

>> +static int virtblk_ctrl_vq_request(struct virtio_blk *vblk,
>> +				    struct virtblk_ctrl_request *creq,
>> +				    struct scatterlist *sgs[],
>> +				    unsigned int out_sgs, unsigned int in_sgs)
>> +{
> [ ... ]
>> +	wait_for_completion(&creq->compl);
>> +	mutex_unlock(&vblk->ctrl_vq.mutex);
>> +	return 0;
>> +}
> 
> [Severity: High]
> Could this unbounded wait deadlock device teardown if the host is
> unresponsive?
> 
> When called from a block I/O context, this thread holds a reference to
> q_usage_counter. If the host hangs, del_gendisk() in virtblk_remove() will
> freeze the block queue and wait indefinitely for q_usage_counter to reach
> zero.
> 
> Since virtblk_ctrl_vq_drain() is called after del_gendisk(), wouldn't the
> system deadlock before the drain can recover the stuck requests?
> 
> [ ... ]

ACK

Add abandon flag in struct virtblk_ctrl_request. Set a 10 seconds timeout when
sending a request via the control queue. Set the control request as abandoned
once it doesn't return in 10 seconds to force finishing the caller in the control
queue, so that q_usage_counter in the data I/O thread can decrease to 0, unblock
del_gendisk() finally.

>> @@ -1553,6 +1713,7 @@ static int virtblk_probe(struct virtio_device *vdev)
>>  out_free_vq:
>>  	vdev->config->del_vqs(vdev);
>>  	kfree(vblk->vqs);
>> +	vblk->ctrl_vq.vq = NULL;
>>  out_free_vblk:
>>  	kfree(vblk);
>>  out_free_index:
> 
> [Severity: High]
> This is a pre-existing issue, but does the error path in virtblk_probe()
> trigger a use-after-free and double-free?
> 
> If device_add_disk() fails, the path jumps to out_cleanup_disk which calls
> put_disk(vblk->disk). Because vblk->disk->fops points to virtblk_fops,
> dropping the last reference invokes virtblk_free_disk(), which frees vblk
> and vblk->index.
> 
> By the time execution reaches out_free_vq, aren't accesses to vblk->vqs and
> this new assignment to vblk->ctrl_vq.vq writing to freed memory, followed
> by a double free of vblk in out_free_vblk?
> 
> [ ... ]

It doesn't lead to use-after-free or double-free.

Because
  1. put_disk() calls disk_release();
  2. disk_release(）calls disk->fops->free_disk() only if GD_ADDED is set.
  3. GD_ADDED is only set in add_disk_final() after the successful call of
     device_add_disk().

GD_ADDED won't be set if device_add_disk() returns the failure, then
virtblk_free_disk() won't be called. vblk->ctrl_vq.vq is set to NULL before
free vblk.

>> @@ -1593,6 +1759,8 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>>  	struct request_queue *q = vblk->disk->queue;
>>  	unsigned int memflags;
>>  
>> +	virtblk_ctrl_vq_quiesce(vblk);
>> +
>>  	/* Ensure no requests in virtqueues before deleting vqs. */
>>  	memflags = blk_mq_freeze_queue(q);
> 
> [Severity: High]
> By calling virtblk_ctrl_vq_quiesce() before blk_mq_freeze_queue(), could
> valid in-flight requests fail with I/O errors?
> 
> virtblk_ctrl_vq_quiesce() sets ctrl_vq.dead = true. Since the block queue
> is not yet frozen, in-flight block I/O requests that haven't yet submitted
> their control requests (but have already incremented q_usage_counter) will
> encounter dead == true when calling virtblk_ctrl_vq_request(), resulting in
> -ENODEV.
> 
> Should the data plane be frozen before the control queue is marked dead?
> 

ACK

Move virtblk_ctrl_vq_quiesce(vblk) after blk_mq_freeze_queue(q), before
virtio_reset_device().


