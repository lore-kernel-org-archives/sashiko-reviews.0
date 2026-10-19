Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D904DEC3A
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408416; cv=none; b=cBS0vFFnXb2YsNC47/9+uhVfx/T3AvJpSRR84rNVb/EwNsI7VDlqFyM4SEyggoH+kP1+z0Gb3hARFQJT9Zz23c+kz0H0LhTnqVxPMnbe722ZLfHc+BKE3EGLCVfxuSMPM9uyOnOzwgwIsPNVBZod//pzwD/CrvyZYufTIvoFe78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408416; c=relaxed/simple;
	bh=RskFli7wRvmFGEcH2wafwaWlCffagIlIOYDMSEyC904=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHy5A6h6LzDwfS+UZBwTGxhN/DANJp8b0aalgXW5+S8FxIL87i0rVHsfIXxWA2tXJoP1zWQl7U+M7ljo8HzZ7mUcr8Qb63PS4dgNgj+DaQzLQmetIQksSPKhX6P/LWLZVUnBDfeX883k1lCczYml9xDtKwBriuZssukhMoDD7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZDpTzvuB; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZDpTzvuB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792408403; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LgnfQ8wTBplOdukELUJAbNGTXtmsm4PBQs4E3Txr/1U=;
	b=ZDpTzvuBKtestNaJHdiW2BmlsRfs5e1Xvaxw2JJcyh8j67t0In0/jhMtjS8nqwYc9LNv051HuvVKJk0+nvGIzPHdZvi8PXGOpPcpAYIex2TfY1Esjs0bYh6kVUEXIHNeoOmFgx6j3IzgXtEQRjBKFIgnYw/2W1Y4zKs7BB83ytc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XD68rJ0_1792408402;
Received: from 30.178.69.0(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XD68rJ0_1792408402 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 19:13:23 +0800
Message-ID: <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
Date: Mon, 19 Oct 2026 19:13:21 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nvme: document the service-time iopolicy sysfs
 attributes
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261019075607.808947-1-kanie@linux.alibaba.com>
 <20261019075607.808947-4-kanie@linux.alibaba.com>
 <sashiko-outbox-176783@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-176783@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/19 16:13, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] nvme-multipath: nvme_failover_req() clears rq bytes before in_flight_size sub
> - [High] nvme-multipath: in_flight_size underflow in nvme_mpath_end_request()
> - [Low] nvme: missing service-time in sysfs-nvme iopolicy ABI documentation
> --
>
> commit 5acf4057a11f40dc3e2cd32f04002286c4084ff4
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvme: document the service-time iopolicy sysfs attributes
>
> This commit documents the new in_flight_bytes and relative_throughput sysfs
> attributes added for the service-time NVMe multipath I/O policy in
> Documentation/ABI/stable/sysfs-nvme.
>
>> diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
>> index a2f5d0710db40..adaf292c8c67b 100644
>> --- a/Documentation/ABI/stable/sysfs-nvme
>> +++ b/Documentation/ABI/stable/sysfs-nvme
>> @@ -326,6 +326,28 @@ Description:
>>  		currently selected path. Returns empty if iopolicy is not
>>  		"numa". Requires CONFIG_NVME_MULTIPATH.
>>  
>> +What:		/sys/block/nvmeXcYnZ/in_flight_bytes
>> +What:		/sys/block/nvmeXcYnZ/relative_throughput
>> +Date:		October 2026
>> +KernelVersion:	7.5
>> +Contact:	Guixin Liu <kanie@linux.alibaba.com>
>> +Description:
>> +		in_flight_bytes: Shows the number of bytes currently in
>> +		flight on this path's controller. Returns empty if
>> +		iopolicy is not "service-time".
>> +		Requires CONFIG_NVME_MULTIPATH.
> [Severity: High]
> Can ns->ctrl->in_flight_size permanently leak in-flight bytes when a
> request fails over in nvme_failover_req()?
>
> In commit 211891d7cca0 ("nvme-multipath: implement service-time iopolicy"),
> nvme_mpath_start_request() adds blk_rq_bytes(rq) to ns->ctrl->in_flight_size
> and sets NVME_MPATH_CNT_ACTIVE_BYTES:
>
> drivers/nvme/host/multipath.c:nvme_mpath_start_request() {
> 	...
> 	} else if (iopolicy == NVME_IOPOLICY_ST &&
> 		   !(nvme_req(rq)->flags & NVME_MPATH_CNT_ACTIVE_BYTES)) {
> 		atomic64_add(blk_rq_bytes(rq), &ns->ctrl->in_flight_size);
> 		nvme_req(rq)->flags |= NVME_MPATH_CNT_ACTIVE_BYTES;
> 	}
> }
>
> When a request fails over (for example, on NVME_SC_ANA_TRANSITION,
> NVME_SC_HOST_PATH_ERROR, or a dying queue), __nvme_complete_rq() calls
> nvme_failover_req(), which steals the bios from req before calling
> nvme_end_req():
>
> drivers/nvme/host/multipath.c:nvme_failover_req() {
> 	...
> 	blk_steal_bios(&ns->head->requeue_list, req);
> 	spin_unlock_irqrestore(&ns->head->requeue_lock, flags);
>
> 	nvme_req(req)->status = 0;
> 	nvme_end_req(req);
> }
>
> Because blk_steal_bios() clears rq->__data_len:
>
> block/blk-mq.c:blk_steal_bios() {
> 	...
> 	rq->__data_len = 0;
> }
>
> by the time nvme_end_req() -> __nvme_end_req() -> nvme_mpath_end_request()
> runs:
>
> drivers/nvme/host/multipath.c:nvme_mpath_end_request() {
> 	...
> 	if (nvme_req(rq)->flags & NVME_MPATH_CNT_ACTIVE_BYTES) {
> 		atomic64_sub(blk_rq_bytes(rq), &ns->ctrl->in_flight_size);
> 		nvme_req(rq)->flags &= ~NVME_MPATH_CNT_ACTIVE_BYTES;
> 	}
> }
>
> blk_rq_bytes(rq) is 0, so the failed-over request's bytes are never
> subtracted from ns->ctrl->in_flight_size. When failover occurs without a
> controller reset, does ns->ctrl->in_flight_size remain permanently
> inflated, skewing nvme_st_compare_load() and the in_flight_bytes sysfs
> attribute?
Right, fixed in v3.
>
> [Severity: High]
> Also in nvme_mpath_end_request(), can ns->ctrl->in_flight_size underflow
> to a negative value if a requeued request completes after a controller
> reset?
>
> When a request started under NVME_IOPOLICY_ST is requeued via
> nvme_retry_req() -> blk_mq_requeue_request() (or via BLK_STS_RESOURCE after
> nvme_start_request() in nvme_rdma_queue_rq() or nvme_fc_start_fcp_op()),
> the request returns to MQ_RQ_IDLE while retaining RQF_DONTPREP and
> NVME_MPATH_CNT_ACTIVE_BYTES.
>
> If a controller reset occurs before that request is re-dispatched,
> nvme_mpath_init_identify() resets ctrl->in_flight_size to 0:
>
> drivers/nvme/host/multipath.c:nvme_mpath_init_identify() {
> 	...
> 	/* initialize this in the identify path to cover controller resets */
> 	atomic_set(&ctrl->nr_active, 0);
> 	atomic64_set(&ctrl->in_flight_size, 0);
> }
>
> When the request is later re-dispatched, nvme_setup_cmd() skips
> nvme_clear_nvme_request() because RQF_DONTPREP is set, and
> nvme_mpath_start_request() skips atomic64_add() because
> NVME_MPATH_CNT_ACTIVE_BYTES is already set. When the request finishes,
> nvme_mpath_end_request() unconditionally subtracts blk_rq_bytes(rq) from
> ns->ctrl->in_flight_size (unlike nr_active, which uses
> atomic_dec_if_positive()), driving ctrl->in_flight_size negative.
>
> In nvme_st_compare_load(), the negative s64 is then assigned to unsigned
> size_t:
>
> drivers/nvme/host/multipath.c:nvme_st_compare_load() {
> 	size_t sz1, sz2, st1, st2;
> 	unsigned int tp1 = ns1->ctrl->relative_throughput;
> 	unsigned int tp2 = ns2->ctrl->relative_throughput;
>
> 	sz1 = atomic64_read(&ns1->ctrl->in_flight_size);
> 	sz2 = atomic64_read(&ns2->ctrl->in_flight_size);
>
> Would this wrap sz1 or sz2 to near SIZE_MAX, causing
> nvme_service_time_path() to avoid that controller's path while reporting a
> negative value in in_flight_bytes?
Yes, fixed in v3.
>> +
>> +		relative_throughput: Shows or sets the relative
>> +		throughput weight of this path, which the "service-time"
>> +		iopolicy uses to estimate the path service time as
>> +		in_flight_bytes / relative_throughput. The value is an
>> +		integer in the range 0-100 and defaults to 1; assign
>> +		higher values to faster paths. A path with a value of 0
>> +		is only selected when no path with a positive value is
>> +		available. Reading returns empty if iopolicy is not
>> +		"service-time"; writing is accepted regardless of the
>> +		active policy. Requires CONFIG_NVME_MULTIPATH.
>> +
>>  What:		/sys/block/nvmeXnY/delayed_removal_secs
>>  Date:		May 2025
>>  KernelVersion:	6.16
> [Severity: Low]
> In the same file (Documentation/ABI/stable/sysfs-nvme), the entry for
> /sys/class/nvme-subsystem/nvme-subsysX/iopolicy still lists only the three
> previous policies:
>
> What:		/sys/class/nvme-subsystem/nvme-subsysX/iopolicy
> ...
> Description:
> 		Shows or sets the multipath I/O path selection policy for
> 		this subsystem. Accepted values: "numa", "round-robin",
> 		"queue-depth". Changing the policy clears all current path
> 		selections. Only available when CONFIG_NVME_MULTIPATH is
> 		enabled.
>
> Should "service-time" also be added to the accepted values for
> /sys/class/nvme-subsystem/nvme-subsysX/iopolicy?
>
> هایی
Sure, changed in v3.

