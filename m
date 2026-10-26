Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792981400;
	b=pbNL502MfNzYi6cigqx68FxdT3fw0n4swZRdmqpEeRw5G8e1Yl5PC6QkIuZYxa2jGOt3
	 r82TSjXH/ynRDQSj2uOyBIN3jx+MwQn777PNcxK9/F8EUiQ7RkFUhTZiepzK+i8UqGolx
	 HuMb+i+YnHYav2bYxck/Cxe7NE9QwX6I5uWMfPJ+V9Pgdk9d4pc238wXFt0ua4atC17FZ
	 7vXp/XH+hW1aFPjOVXlLfV0Ishc6V0sXyHUsOLSeUmRD5CcSSIXHMQJigGGWT4bAR4Bna
	 P0/I2khU7mPUCTEPry+UM6v0RM4UgA1rOAwZw01NX9KhMlmJAfXjYQJZSTXBEyh81oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792981400;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=elmfdS022HstbVzk6RiFFEFE1FQjIrkIkJgFf2iK8XQ=;
	b=LHiW3MojR6+Wk8cE0Q/BZHWqXhEvovX50DsRzdFVBDTFzw+q1D1dKJGNYtMVxMI+5IMA
	 CDmb/eUjEfoB6x8GwYjAp3wiKZnPEm0YXiMTQcaOhtl10WJ9nzNc4wAsU7cenyxpA/ott
	 S8pUfybbf9USLiIkxCaEoJhngoriSZmtq7vdgwL/CqmR482sbqsoGENUlXtSt/JU5btVh
	 3vfcdI6dJA1LFLFgI7t64HA+xm6dis4UGicwxupwUhr8ldK4+hDZkvHQAOAGll3wAHYbT
	 wmW6f45EBulzBlK+un2gNszpeBYL0LsjN7gMhrRhvtLCHvb5xdBqyCBMY00zW0pbXGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JjgwJ6u3;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892C606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 02:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C892C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JjgwJ6u3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792981390; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=elmfdS022HstbVzk6RiFFEFE1FQjIrkIkJgFf2iK8XQ=;
	b=JjgwJ6u3qGpc+gfCypmGgtV8HsD6xZK1JZV9EtdwiTNA97h6y5cSIid9fN4FaVxCxm3O2fKoOqhf06Wb8HUtDu84qawKv2Y9eKX5bKb4It/NN/n4xPgJAcfOyCw1u1knVzG9JlFOiTF2eItnrpPOmCF7NKDVvQoWzvZ4wxijOV8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XDRS1yY_1792981388;
Received: from 30.178.69.120(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XDRS1yY_1792981388 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:23:09 +0800
Message-ID: <eca58abe-10b8-4012-b3d0-8ef0cc9be63e@linux.alibaba.com>
Date: Mon, 26 Oct 2026 10:23:08 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] nvmet: serve the FDP log pages
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261023080251.2606443-1-kanie@linux.alibaba.com>
 <20261023080251.2606443-10-kanie@linux.alibaba.com>
 <sashiko-outbox-182526@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-182526@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/23 16:37, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] nvmet: unsanitized cmd and truncated transfer_len in nvmet_fdp_log_forward()
> - [High] nvmet: broken partial/offset reads and unbounded kzalloc() in FDP log handlers
> - [High] nvmet: check NVMET_NS_IO_LIVE instead of ns->enabled in nvmet_fdp_lookup_ns()
> --
>
> commit 6fe9b61853a62f18f9ae3bb5a0ad4dcfebf1822f
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: serve the FDP log pages
>
> This commit adds support for serving the FDP Configurations log page
> from the target's namespace configuration snapshot and forwarding the
> remaining FDP log pages to the backing controller over its admin queue.
>
>> diff --git a/drivers/nvme/target/fdp.c b/drivers/nvme/target/fdp.c
>> index 807f54c73c4e1..011f022e857aa 100644
>> --- a/drivers/nvme/target/fdp.c
>> +++ b/drivers/nvme/target/fdp.c
> [ ... ]
>
>> @@ -355,3 +354,100 @@ static int nvmet_fdp_init_backend(struct nvmet_ns *ns)
>>  	return ret;
>>  }
>>  
>> +void nvmet_execute_get_log_page_fdp_configs(struct nvmet_req *req)
>> +{
>> +	u32 lsi = le16_to_cpu(req->cmd->get_log_page.lsi);
>> +	struct nvme_fdp_config_desc *desc;
>> +	struct nvme_fdp_config_log *log;
>> +	struct nvmet_ns *ns;
>> +	size_t dsze, total;
>> +	u16 status = 0;
>> +	int i;
>> +
>> +	ns = nvmet_fdp_lookup_ns(req, lsi);
>> +	if (!ns) {
>> +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
>> +		goto out;
>> +	}
> [Severity: High]
> Can calling nvmet_fdp_lookup_ns() here and in nvmet_fdp_log_forward() race
> with nvmet_ns_disable() and nvmet_ns_free()?
>
> In drivers/nvme/target/fdp.c, nvmet_fdp_lookup_ns() checks ns->enabled
> under rcu_read_lock() instead of test_bit(NVMET_NS_IO_LIVE, &ns->flags):
>
> drivers/nvme/target/fdp.c:nvmet_fdp_lookup_ns() {
> 	rcu_read_lock();
> 	ns = xa_load(&subsys->namespaces, endgid);
> 	if (!ns || !ns->enabled || !nvmet_fdp_enabled(ns))
> 		goto out_unlock;
>
> 	if (!percpu_ref_tryget_live(&ns->ref))
> 		goto out_unlock;
> }
>
> However, in drivers/nvme/target/core.c, nvmet_ns_disable() clears
> NVMET_NS_IO_LIVE, kills the percpu_ref, and runs synchronize_rcu() and
> nvmet_fdp_exit_ns() before setting ns->enabled = false:
>
> drivers/nvme/target/core.c:nvmet_ns_disable() {
> 	if (!test_and_clear_bit(NVMET_NS_IO_LIVE, &ns->flags))
> 		return;
> 	...
> 	percpu_ref_kill(&ns->ref);
> 	synchronize_rcu();
> 	wait_for_completion(&ns->disable_done);
> 	percpu_ref_exit(&ns->ref);
> 	...
> 	nvmet_fdp_exit_ns(ns);
>
> 	mutex_lock(&subsys->lock);
> 	nvmet_ns_changed(subsys, ns->nsid);
> 	nvmet_ns_dev_disable(ns);
> 	ns->enabled = false;
> 	mutex_unlock(&subsys->lock);
> }
>
> When nvmet_ns_free() calls nvmet_ns_disable(), it immediately erases the
> namespace from subsys->namespaces and calls kfree(ns) without another RCU
> grace period after ns->enabled is cleared. An RCU reader in
> nvmet_fdp_lookup_ns() entering after synchronize_rcu() can still see
> ns->enabled == true and call percpu_ref_tryget_live(&ns->ref) on freed
> memory.
>
> Additionally, if a reader in nvmet_fdp_lookup_ns() passes the ns->enabled
> and nvmet_fdp_enabled(ns) checks while the namespace is being disabled, and
> the namespace is then reconfigured with FDP disabled and re-enabled via
> nvmet_ns_enable() (which re-initializes ns->ref),
> percpu_ref_tryget_live(&ns->ref) can succeed after nvmet_fdp_exit_ns() has
> set ns->fdp.backend_ctrl = NULL, leading to a NULL pointer dereference of
> ns->fdp.backend_ctrl->admin_q in nvmet_fdp_log_forward().
>
> Should nvmet_fdp_lookup_ns() check test_bit(NVMET_NS_IO_LIVE, &ns->flags)
> just like nvmet_req_find_ns() does?
Sashiko is right, same as patch07, changed in v3.
>> +
>> +	dsze = ALIGN(struct_size(desc, ruhs, ns->fdp.nruh), 8);
>> +	total = sizeof(*log) + dsze;
>> +
>> +	log = kzalloc(req->transfer_len, GFP_KERNEL);
>> +	if (!log) {
>> +		status = NVME_SC_INTERNAL;
>> +		goto out_put;
>> +	}
>> +
>> +	if (req->transfer_len >= sizeof(*log)) {
>> +		/* single configuration, 0's based */
>> +		log->numfdpc = 0;
>> +		log->ver = 0;
>> +		log->sze = cpu_to_le32(total);
>> +	}
>> +	if (req->transfer_len >= total) {
>> +		desc = (void *)(log + 1);
>> +		desc->dsze = cpu_to_le16(dsze);
>> +		/* FDPCV set, FDPVWC clear, RGIF 0 for the single RG */
>> +		desc->fdpa = 1 << 7;
>> +		desc->nrg = cpu_to_le32(1);
>> +		desc->nruh = cpu_to_le16(ns->fdp.nruh);
>> +		desc->maxpids = cpu_to_le16(ns->fdp.nruh - 1);
>> +		desc->nns = cpu_to_le32(1);
>> +		desc->runs = cpu_to_le64(ns->fdp.runs);
>> +		/* all handles Initially Isolated */
>> +		for (i = 0; i < ns->fdp.nruh; i++)
>> +			desc->ruhs[i].ruht = 0x1;
>> +	}
> [Severity: High]
> What happens here when a host performs a partial read with
> sizeof(*log) < req->transfer_len < total (or req->transfer_len < sizeof(*log)),
> or specifies a non-zero Log Page Offset (req->cmd->get_log_page.lpo)?
>
> Because desc is only populated when req->transfer_len >= total, any partial
> read between sizeof(*log) and total (such as reading the header plus the
> fixed portion of struct nvme_fdp_config_desc, or reading the descriptor at
> a non-zero lpo with transfer_len == dsze) will copy all-zeroes for the
> descriptor, even though nvmet_execute_identify_ctrl() advertises LPO support
> in id->lpa.
>
> Also, passing the initiator-controlled req->transfer_len directly to
> kzalloc(req->transfer_len, GFP_KERNEL) here and in nvmet_fdp_log_forward()
> without bounding the length or passing __GFP_NOWARN allows a large SGL
> transfer_len (for example on RDMA) to exceed KMALLOC_MAX_SIZE and trigger
> WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp) in the page allocator.
>
> Could nvmet_execute_get_log_page_fdp_configs() instead allocate total bytes
> (which is bounded because ns->fdp.nruh <= U8_MAX), populate the log header
> and descriptor unconditionally, and copy the requested slice based on
> nvmet_get_log_page_offset(req->cmd) and req->transfer_len (similar to
> nvmet_execute_disc_get_log_page() in drivers/nvme/target/discovery.c)?
Don't make any difference, so no change in v3.
>> +
>> +	status = nvmet_copy_to_sgl(req, 0, log, req->transfer_len);
>> +	kfree(log);
>> +out_put:
>> +	percpu_ref_put(&ns->ref);
>> +out:
>> +	nvmet_req_complete(req, status);
>> +}
>> +
>> +/*
>> + * Forward an FDP log page that the backing controller owns, addressed
>> + * by the Endurance Group Identifier of the backing endurance group.
>> + */
>> +void nvmet_fdp_log_forward(struct nvmet_req *req)
>> +{
>> +	struct nvme_command c = {};
>> +	struct nvmet_ns *ns;
>> +	u16 status = 0;
>> +	void *buf;
>> +	int ret;
>> +
>> +	ns = nvmet_fdp_lookup_ns(req,
>> +				 le16_to_cpu(req->cmd->get_log_page.lsi));
>> +	if (!ns) {
>> +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
>> +		goto out;
>> +	}
>> +
>> +	buf = kzalloc(req->transfer_len, GFP_KERNEL);
>> +	if (!buf) {
>> +		status = NVME_SC_INTERNAL;
>> +		goto out_put;
>> +	}
>> +
>> +	c = *req->cmd;
>> +	c.get_log_page.nsid = cpu_to_le32(0);
>> +	c.get_log_page.lsi = cpu_to_le16(ns->fdp.backend_endgid);
>> +	ret = nvme_submit_sync_cmd(ns->fdp.backend_ctrl->admin_q, &c, buf,
>> +				   req->transfer_len);
> [Severity: Critical]
> Can forwarding a raw copy of *req->cmd with the 32-bit result of
> nvmet_get_log_page_len() cause the backing NVMe controller to DMA into
> arbitrary host addresses or overflow buf?
>
> In drivers/nvme/target/admin-cmd.c, nvmet_execute_get_log_page() checks
> req->transfer_len against nvmet_get_log_page_len(req->cmd), which computes
> the byte length in 32-bit u32 arithmetic:
>
> drivers/nvme/target/admin-cmd.c:nvmet_get_log_page_len() {
> 	u32 len = le16_to_cpu(cmd->get_log_page.numdu);
>
> 	len <<= 16;
> 	len += le16_to_cpu(cmd->get_log_page.numdl);
> 	/* NUMD is a 0's based value */
> 	len += 1;
> 	len *= sizeof(u32);
>
> 	return len;
> }
>
> When the 32-bit NUMD value ((numdu << 16) | numdl) is >= 0x3fffffff,
> (NUMD + 1) * sizeof(u32) overflows u32 and wraps modulo 2^32. Meanwhile,
> nvmet_fdp_log_forward() copies the raw command (c = *req->cmd) without
> clearing c.common.dptr or c.get_log_page.rsvd2, and passes the untruncated
> numdu/numdl to the backing controller:
>
> 1. If NUMD wraps len to 0 (e.g. NUMD == 0x3fffffff with a 0-length SGL so
> req->transfer_len == 0), nvmet_check_transfer_len(req, 0) succeeds and
> kzalloc(0, GFP_KERNEL) returns ZERO_SIZE_PTR. In __nvme_submit_sync_cmd(),
> nvme_init_request() clears NVME_CMD_SGL_ALL from c.common.flags (switching
> the command to PRP mode) and skips blk_rq_map_kern() because bufflen is 0:
>
> drivers/nvme/host/core.c:__nvme_submit_sync_cmd() {
> 	nvme_init_request(req, cmd);
> 	if (flags & NVME_SUBMIT_RETRY)
> 		req->cmd_flags &= ~REQ_FAILFAST_DRIVER;
>
> 	if (buffer && bufflen) {
> 		ret = blk_rq_map_kern(req, buffer, bufflen, GFP_KERNEL);
> 		if (ret)
> 			goto out;
> 	}
> }
>
> In nvme_prep_rq(), blk_rq_nr_phys_segments(req) is 0, so nvme_map_data() is
> skipped and the initiator's raw c.common.dptr (prp1/prp2) remains in the
> admin SQE with NUMD >= 0x3fffffff, instructing the backing PCIe controller
> to DMA the log page into initiator-chosen physical/IOVA addresses.
>
> 2. If NUMD wraps len to a small non-zero value (e.g. numdu == 0x4000,
> numdl == 0x0000 so req->transfer_len == 4), kzalloc(4, GFP_KERNEL) allocates
> an 8-byte slab buffer and blk_rq_map_kern() maps 4 bytes, while numdu/numdl
> in the forwarded admin SQE requests 4 GiB + 4 bytes. Since PCIe admin
> queues use PRPs (which do not encode buffer length), the backing controller
> DMAs the full FDP log page past the end of buf.
>
> Should nvmet_fdp_log_forward() construct a clean struct nvme_command (or
> zero c.common.dptr and rsvd2 as nvmet_fdp_io_mgmt_forward() does for dptr)
> and derive numdl/numdu from a bounded buffer length (or use a host helper
> like nvme_get_log_lsi()), and should nvmet_get_log_page_len() avoid 32-bit
> overflow?
Sashiko is right, changed in v3.
>

