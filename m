Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAD3F9278
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457814; cv=none; b=Hw8rE3MFFq0/nV7Q5sMquq1uHAbvAo//j2rcAnXXONMmQEML64qLBFjWldZv9bFg683glHb85+reTfnN8xko/zle2yXD3Lsc4+t6vGZMX/Mu1W01o37UpTAN2fduc8Ziye3pWPCCPApvMWs7+Qzim6RxoLGV3nx+C5xxL5r8h1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457814; c=relaxed/simple;
	bh=wJlvb7XZYh0kYJvDm0txppf9AxV/Q8OL54PZ9T2BfV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKUF5klfVfwKk8reOTXrOab8h5IERMG/MO/wR7Kz6CYIeFhDh/HK9P0SF6DRgx9OkyXdbQiX0NbCRFwlAAcaNszMikM7u73mKf6Xt6ImVz9mcGmZjGcnLXeM+M2iS5L6QFFXkfvS8dVcieLXter2QED+n6Dqojw4j/PoDKKlwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3cw3zR8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCRq6AEf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3cw3zR8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCRq6AEf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbotR2509680
	for <sashiko-reviews@lists.linux.dev>; Thu, 8 Oct 2026 11:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2xih7xm5C8vr4li+BnM2KTiURVVghrspg38JJXxsSE=; b=B3cw3zR8jdKu3bh/
	hTQVsZ2SazQEeoRofd85u7hdbHG59A3hToVunf44JORJpFwTQ8H5hSXtHeXqOJWe
	gR3lJR5qg1m3suEc2rOhvSIFVQBb9NiGHWtfLsQ2HvjJcm8qJ0hGDap0dXDGa1Mm
	a7Z6mEMTChI+Avu9PE4C+bwwKVTr2UjoinjdMb40GHCDIyX7/M9GKUk7WUV25Fe1
	gITgKZahRZbWOz284txCw8Sfmo8rv73aYMDFksGe80+ROXXqpRJgCE8ZFGsXtP5Y
	Fp5dpU/kD8rcWAzXHQEwLfothwSadHfd4kzF2/rP5wAiezt1GmWHB5E5SQorx4UF
	MOttNQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jknd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 11:10:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so11022623eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457809; x=1792062609; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2xih7xm5C8vr4li+BnM2KTiURVVghrspg38JJXxsSE=;
        b=dCRq6AEfe55h6vMhbVLovmJceLl02rRDrNVvgwVTbHKaFXsFIF5DH88BhnGIojTsiO
         KQn6rkhHxWZwTFxj7kQO4H/+i48eAhqnBNCBEP90tC6o7vv4i++4A9RAS32JcgSGivn7
         z8YUHu5ZsF5StzUkb7vBODZcx5x0cDRjmPdhAFf174wrKUKITLaW2cviFLRVDS1Zk4fZ
         pk/kK9c7CCW3mTdrXHTiZ+gnmfwVdCQYbrbbhiOIcNkGpSOAvDBLneO7K/Fn5MnEcRzj
         xR+EKjEOJEQvcXkRYJgCvmwaXEGia53LF8cqZ8gYd1JlW6Y7Ozvkzwwg9OlI9bfB6tyc
         8/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457809; x=1792062609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2xih7xm5C8vr4li+BnM2KTiURVVghrspg38JJXxsSE=;
        b=B80zWemy8C8KJrPN+HMi4U26uAlY5BIChjjR5fwh3oIcRZwGNJzvcFCZVqh+fE8rWw
         NQC6lVnYKRYpxTpP8wckVBv8aGRM7UTs/NUBTg5VLTvhcziYD2iH2HOLnq9DgqmBiS6X
         L3QZyOjh2e4GZPocpYdvFsAB7TvHqD+BmVCT+VAX4ywtnHVdX/TP3SuBysnTdsR/xGWu
         Ej1apGA03CiJTOldozJr7LS7ZuQeDjhsMIpk09bkMafxH/ou+3gSHZApmVv34PrtFMW9
         H2OGULaWsTcivjvh4UJWFF144ksuUIMijUK6tGGTIFPWFDu0SHOnSP1jRgSyM6soBY8X
         IlIQ==
X-Gm-Message-State: AFq9FYJs//KCWwF9kVzYTVEGYqKBQBkPCjXd1bYKFW97qFJcbBorEJji
	abqFjEeZkDwbpelcwr5wC2N0N004uexZD/RM/2/njwtCTyR3RJoph65OqAbgxmHLBwo0NGJ44uE
	TF5eTdnCFOIYu53MEQG4KNMHtpkK2aB/1bDU5PzgZYPcFDLJV0D+mK5UfQBqWAxj7Bp+exNGyTv
	3dudJ7zg==
X-Gm-Gg: AYBFou0sXv+91L6nw+8tKgjH/74178Hiohcw1Ya6M4IcLPYMe7Gqj+AfeAHGKDQtAEa
	1GJkgpuxMmZ9dd2WGji0t3dRxRsYlA3/4SZCgrqcoGJT8V0Gdi7Cpr4qXGQIN+snbH16v6cRWqC
	1Uq7G0SKwfcA5ZuJWnhrOy6c0jOaSVpq6ZzZKIDNtHN2DcEvc45U81cZEaXr7Ardeqggs5Bxs4c
	ElvAtw8YwMYDPe46nH0ILZB7UAmLLpZ8iomTqmZ9zWVHty3H8fMp641axlvl31+kskCinD0wOHY
	9sxZde7uAscg7fzSzytRfk+zvNdWLx+YG77Kd893XTWfjrgn5q9XkdSxcaYGlAvfwburq6b2sBR
	SNZdwWJUCUXOATQ86ljL3qlbuz6ESLTj3IqRh6J932w3ka1iWgf+NRG+s
X-Received: by 2002:a05:7300:e9c4:20b0:34b:401a:4648 with SMTP id 5a478bee46e88-3515de3b344mr6072891eec.20.1791457808883;
        Thu, 08 Oct 2026 04:10:08 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c4:20b0:34b:401a:4648 with SMTP id 5a478bee46e88-3515de3b344mr6072850eec.20.1791457808052;
        Thu, 08 Oct 2026 04:10:08 -0700 (PDT)
Received: from [10.110.12.176] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af26f10sm17742632eec.13.2026.10.08.04.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:10:07 -0700 (PDT)
Message-ID: <227923b6-8fbc-47b0-9ac1-e52785a4cc61@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 19:10:04 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] virtio_blk: Add control virtqueue support
To: sashiko-reviews@lists.linux.dev
Cc: Eugenio Perez <eperezma@redhat.com>,
        "Michael S. Tsirkin"
 <mst@redhat.com>, virtualization@lists.linux.dev
References: <20260920122444.2549493-1-linlin.zhang@oss.qualcomm.com>
 <20260920122444.2549493-2-linlin.zhang@oss.qualcomm.com>
 <20260920123505.012D31F000FF@smtp.kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20260920123505.012D31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac77a13 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xidzSydqH__qsm9hblAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX5ojN8NqEDwy2
 gH1CXJsnGnPO2e189cIK56BGtuxHC3K3fzNFf9fzhbBhd5tp1Lc+Dm6PPjVYO7TJ3Fb/rkdEEva
 DR3T6YX7jfMDtSOoOQ9XVmEvZt5CJyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX41o9GRbkzUxc
 wgL0yz8oS2nAKXjU6IpIGxVRNMV+PBV1XFSVQ28olB9PPTfR9MK6K2RmJozQVdiVSPZm4EW5gWp
 4TU7jbfi9taVgEq3Ckl5f82XS/0rqb7jMjrYv6kwdm5jORJUjvUGAJUiXmsb0e2Yf3fz6DePVyf
 cflI+TjCVy2Y41DwXIGDLgVGJKOMvO/m0y5SqABbL9rxcqBieZZHiGaTGnL8jTlT7P/75264Wgg
 tZqzycMy6bMzIktaaxJr/1laNbpd4ngPZiWuxxZGAUjxZJs5AcsCf+uEjgckxACkvfIFLobQ9VC
 Z8Ea0YSertjhpY7MHdLyf6Vk7bleAT2dRiEMOfnRX/C0HjcPwxkxh8rBqwlxNpX+PfHOKlEfL4Y
 6GNTsFvTHkW4BvYU2I3D19v6PUzP6yT81haoQTYfW7daVy/rsOjkgxKT6JrEbq+fcypkBqoIWV2
 NEeHarkyZwpRLcNbxcw==
X-Proofpoint-ORIG-GUID: EJJ9Tj7Y__fgeYz0x3r_0JKQqgkVKCTa
X-Proofpoint-GUID: EJJ9Tj7Y__fgeYz0x3r_0JKQqgkVKCTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044



On 9/20/2026 8:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] block/virtio_blk: DMA coherency violation on creq->abandoned
> - [Medium] block/virtio_blk: TOCTOU race in control request timeout leads to memory leak
> --
> 
> commit e5e45f06d7dfecf78d290eb12655787cf1bee763
> Author: linlzhan <linlin.zhang@oss.qualcomm.com>
> 
> virtio_blk: Add control virtqueue support
> 
> This patch adds support for the optional virtio-blk control virtqueue,
> allowing the driver to manage control-queue requests independently from
> the data path. The control virtqueue is intended for a subsequent inline
> encryption implementation.
> 
>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>> index 32bf3ba07a9dc..2fad86e8f7a9a 100644
>> --- a/drivers/block/virtio_blk.c
>> +++ b/drivers/block/virtio_blk.c
> [ ... ]
>> @@ -110,6 +123,20 @@ struct virtblk_req {
>>  	struct scatterlist sg[];
>>  };
>>  
>> +struct virtblk_ctrl_request {
>> +	__virtio32 type;
>> +	u8 status;
>> +
>> +	struct completion *compl;
>> +	/*
>> +	 * Set when virtblk_ctrl_vq_request()'s waiter timed out and moved on
>> +	 * without freeing this request. Whichever of virtblk_ctrlq_callback()
>> +	 * or virtblk_ctrl_vq_drain() later retrieves the buffer must free
>> +	 * @compl and this struct instead of calling complete() on them.
>> +	 */
>> +	bool abandoned;
>> +};
> 
> [Severity: High]
> Could this cause a DMA coherency violation? The struct bundles the
> device-written DMA field (status) with a CPU-modified software flag
> (abandoned) within the same cacheline.
> 
> On non-cache-coherent architectures, if the CPU writes to the abandoned
> flag while the device is actively DMA-writing to the status field, it
> could result in cacheline tearing. This might lead to either silent data
> corruption of the DMA-mapped response or loss of the CPU write.

ACK

Fix it by moving both struct completion and bool abandoned to a pointer.

> 
> [ ... ]
>> +static void virtblk_ctrlq_callback(struct virtqueue *vq)
>> +{
>> +	struct virtio_blk *vblk = vq->vdev->priv;
>> +	struct virtblk_ctrl_request *creq;
>> +	unsigned long flags;
>> +	unsigned int len;
>> +
>> +	spin_lock_irqsave(&vblk->ctrl_vq.lock, flags);
>> +	do {
>> +		virtqueue_disable_cb(vq);
>> +		while ((creq = virtqueue_get_buf(vq, &len)) != NULL) {
>> +			bool drained = false;
>> +			bool abandoned = creq->abandoned;
>> +
>> +			if (WARN_ON_ONCE(!vblk->ctrl_vq.inflight)) {
> [ ... ]
>> +			if (drained)
>> +				complete(&vblk->ctrl_vq.drained);
>> +			if (abandoned) {
>> +				kfree(creq->compl);
>> +				kfree(creq);
>> +			} else {
>> +				complete(creq->compl);
>> +			}
>> +			spin_lock_irqsave(&vblk->ctrl_vq.lock, flags);
>> +		}
>> +	} while (!virtqueue_enable_cb(vq));
>> +	spin_unlock_irqrestore(&vblk->ctrl_vq.lock, flags);
>> +}
> 
> [Severity: Medium]
> Is there a race condition here that could lead to a memory leak of both
> the request and completion structs?
> 
> If a request times out exactly as the device completes it, the IRQ thread
> might read creq->abandoned as false, unlock the spinlock, and get
> preempted.
> 
> Meanwhile, virtblk_ctrl_vq_request() wakes up from the timeout, acquires
> the lock, sets creq->abandoned to true, unlocks, and returns -ETIMEDOUT.
> 
> When the callback resumes, it checks its local abandoned variable (which
> is still false) and calls complete(creq->compl) instead of freeing the
> memory. Because the caller already discarded the pointer upon timeout,
> both creq and compl would be permanently leaked.

ACK

Lock the whole code snippet of do-while statement.

> 
> [ ... ]
>> +/* Submit a control-queue request and wait for completion. */
>> +static int virtblk_ctrl_vq_request(struct virtio_blk *vblk,
> [ ... ]
>> +	if (wait_for_completion_timeout(comp, VIRTBLK_CTRL_VQ_TIMEOUT)) {
>> +		mutex_unlock(&vblk->ctrl_vq.mutex);
>> +		kfree(comp);
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * The host hasn't responded within the timeout. @creq is still
>> +	 * owned by the device, so don't touch its DMA-target fields or
>> +	 * free it here. Mark it abandoned and hand ownership of both @creq
>> +	 * and @comp to whichever of virtblk_ctrlq_callback() or
>> +	 * virtblk_ctrl_vq_drain() retrieves the buffer later; unlock the
>> +	 * mutex so subsequent requests aren't serialized behind an
>> +	 * unresponsive host.
>> +	 */
>> +	spin_lock_irqsave(&vblk->ctrl_vq.lock, flags);
>> +	creq->abandoned = true;
>> +	spin_unlock_irqrestore(&vblk->ctrl_vq.lock, flags);
>> +	mutex_unlock(&vblk->ctrl_vq.mutex);
>> +
>> +	dev_warn(&vblk->vdev->dev,
>> +		 "control queue request timed out, abandoning\n");
>> +	return -ETIMEDOUT;
>> +}
> 
> [Severity: High]
> This timeout path is where the CPU writes to the shared cacheline while
> the DMA operation might still be in flight. Does this trigger the DMA
> coherency violation mentioned above for struct virtblk_ctrl_request?
> 

ACK

Move struct completion and bool abandoned in struct virtblk_ctrl_request
to virtblk_ctrl_completion *. one time kmalloc_obj() of
virtblk_ctrl_completion * allow them not in the scatterlist.
