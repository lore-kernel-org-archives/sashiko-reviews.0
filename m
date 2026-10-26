Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792981228;
	b=E6DAY2TYymDczSNHfFSFg/kb0O6X7oNbybz/mEH1MDnbRvxb50+5HEP8Lghs1k399pZ6
	 SlBIgXAsQvWkvGe7YR9TtnAoPbsbPfXVSRQYxxrtix2QOGpdjFvB+rBq8aVDu4VakIfWI
	 OOedanO1XaFttfw51FC3rAWyY/Vi/2xl0YJL1sBn+lDFKrh9VMBN/OvyAPJCMmvnLE7NT
	 8FoURLZe54KPx+eWCd6EhzoL+CrmkGkbSEl34w87pAIZCNuk32PrIjCzPcc8kQc1r6UE7
	 24Q5B8aAjI5vnmf3ZmlS+XZx/HdiBhAm7CubeKGR6h64PgkA5RFKguMwT7ial5R1tqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792981228;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uk+OQKArABz4pC4k2d7qhYktDL3y/EfDkzrgX0GFZWY=;
	b=WaYafCXpA0pDWUlrzgk/P8C7CuYwF9fDWgr8yQ1QfBLmKRCZGA80yTyF2tPWZF7oPF3T
	 W222czmDvl/IMHBF3x7aM0Fb6X6t21IggGEs2vVV2vC32IYW5VvIpYeIQ0ggRn/wIopK1
	 +dt9oaCIbDbNcUYPrKNSuwIO4RnBEpaqk8OiH4QHnlK4YpyES5In7tOvTSekIktncll0F
	 7bd1YAVxosxX0BN3MmXhY9QpCSjAxj7WnHxPgjQ8qc2XSrLpYO+a3Q5EPVykps2/xRblO
	 1gy/tY6CB6xl7/+XH7zDEzjUU70LemdnCSHO5rogx1aI+0ZaC13VQJa7GvEWsnmEgDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xZZcuZsR;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66500606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 02:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66500606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xZZcuZsR
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792981218; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=uk+OQKArABz4pC4k2d7qhYktDL3y/EfDkzrgX0GFZWY=;
	b=xZZcuZsRSsQeBgPqeGBaBhgg24q6sXgL6pSkV/fQ+hPkoTQNqD8SfwXNipN/Ugx+PxSU7D6SJCJ9QlAM1+B1/9FUcgUYBJkdH3ct5U6/489VtIkWsigXhWKHTEFsnuHpqQBHpm8KkpM1MpEP2mP6m3gOLglxrcRTPqb2k+NLCXI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XDRPopS_1792981217;
Received: from 30.178.69.120(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XDRPopS_1792981217 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:20:18 +0800
Message-ID: <01029658-3f47-48c7-a3d9-10c542e116a6@linux.alibaba.com>
Date: Mon, 26 Oct 2026 10:20:16 +0800
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
Subject: Re: [PATCH 08/11] nvmet: forward the FDP I/O management commands to
 the backing device
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261023080251.2606443-1-kanie@linux.alibaba.com>
 <20261023080251.2606443-9-kanie@linux.alibaba.com>
 <sashiko-outbox-182525@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-182525@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/23 16:37, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [Critical] nvmet: 32-bit overflow in imr.numd transfer length calculation
> - [High] nvmet: I/O management commands bypass persistent reservation checks
> - [Medium] nvmet: check for exact RUH count match in nvmet_fdp_init_backend()
> - [Medium] nvmet: fdp: validate MO and FDP state before checking transfer length
> - [Medium] nvmet: unbounded kzalloc() size in nvmet_fdp_io_mgmt_forward()
> - [Medium] nvmet: nvmet_io_cmd_check_access() rejects nvme_cmd_io_mgmt_recv on ro ns
> --
>
> commit 4f84fb2c45be67fb452f4d8f98d902624309a456
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: forward the FDP I/O management commands to the backing device
>
> This commit adds support for forwarding NVMe FDP I/O Management Receive and
> Send commands to the backing NVMe namespace via a staging buffer and
> validates the backing FDP placement identifier mapping when enabling a
> namespace.
>
>> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
>> index 14f55631cf502..cdf5a4c183edd 100644
>> --- a/drivers/nvme/target/core.c
>> +++ b/drivers/nvme/target/core.c
>> @@ -1110,9 +1110,22 @@ static u32 nvmet_io_cmd_transfer_len(struct nvmet_req *req)
>>  		return nvmet_dsm_len(req);
>>  	case nvme_cmd_zone_mgmt_recv:
>>  		return (le32_to_cpu(req->cmd->zmr.numd) + 1) << 2;
>> +	case nvme_cmd_io_mgmt_recv:
>> +		if (IS_ENABLED(CONFIG_NVME_TARGET_FDP))
>> +			return (le32_to_cpu(req->cmd->imr.numd) + 1) << 2;
>> +		break;
>> +	case nvme_cmd_io_mgmt_send:
>> +		if (IS_ENABLED(CONFIG_NVME_TARGET_FDP)) {
>> +			u32 npid = le16_to_cpu(req->cmd->ims.mos);
>> +
>> +			return (npid + 1) * sizeof(__le16);
>> +		}
>> +		break;
>>  	default:
>> -		return 0;
>> +		break;
>>  	}
>> +
>> +	return 0;
>>  }
>>  
>>  static u16 nvmet_parse_io_cmd(struct nvmet_req *req)
>> @@ -1154,6 +1167,17 @@ static u16 nvmet_parse_io_cmd(struct nvmet_req *req)
>>  			return ret;
>>  	}
>>  
>> +	if (IS_ENABLED(CONFIG_NVME_TARGET_FDP)) {
>> +		switch (req->cmd->common.opcode) {
>> +		case nvme_cmd_io_mgmt_recv:
>> +			req->execute = nvmet_execute_io_mgmt_recv;
>> +			return 0;
>> +		case nvme_cmd_io_mgmt_send:
>> +			req->execute = nvmet_execute_io_mgmt_send;
>> +			return 0;
>> +		}
>> +	}
> [Severity: High]
> Does returning 0 here bypass the persistent reservation access checks for
> nvme_cmd_io_mgmt_recv and nvme_cmd_io_mgmt_send when req->ns->pr.enable is
> set?
>
> In nvmet_parse_io_cmd(), the earlier call to nvmet_parse_pr_cmd() only
> handles the four reservation opcodes (register, acquire, release, report)
> and returns 1 for other I/O commands. The actual access enforcement and
> per-controller reference acquisition happen at the end of
> nvmet_parse_io_cmd():
>
> drivers/nvme/target/core.c:nvmet_parse_io_cmd() {
>     ...
> 	if (req->ns->pr.enable) {
> 		ret = nvmet_pr_check_cmd_access(req);
> 		if (ret)
> 			return ret;
>
> 		ret = nvmet_pr_get_ns_pc_ref(req);
> 	}
> 	return ret;
> }
>
> Because the new switch returns 0 early, neither nvmet_pr_check_cmd_access()
> nor nvmet_pr_get_ns_pc_ref() is reached (and req->ns->csi is not checked).
> In addition, nvmet_is_req_write_cmd_group() and
> nvmet_is_req_read_cmd_group() in drivers/nvme/target/pr.c do not list
> nvme_cmd_io_mgmt_send or nvme_cmd_io_mgmt_recv, so reservation conflict
> checks and preempt-and-abort reference tracking would not cover these
> commands.
Sashiko is right, changed in v3.
> [Severity: Medium]
> Also in nvmet_parse_io_cmd(), nvmet_io_cmd_check_access() is called just
> before this switch. When a namespace is write-protected
> (req->ns->readonly), nvmet_io_cmd_check_access() only allows nvme_cmd_read
> and nvme_cmd_flush:
>
> drivers/nvme/target/core.c:nvmet_io_cmd_check_access() {
> 	if (unlikely(req->ns->readonly)) {
> 		switch (req->cmd->common.opcode) {
> 		case nvme_cmd_read:
> 		case nvme_cmd_flush:
> 			break;
> 		default:
> 			return NVME_SC_NS_WRITE_PROTECTED;
> 		}
> 	}
>
> 	return 0;
> }
>
> Should nvme_cmd_io_mgmt_recv be permitted in nvmet_io_cmd_check_access() so
> that hosts can still read Reclaim Unit Handle Status on a write-protected
> namespace instead of failing with NVME_SC_NS_WRITE_PROTECTED?
Per NVMe spec, the io_mgmt is not in the write-protection whitelist, so
should reject here.
>> diff --git a/drivers/nvme/target/fdp.c b/drivers/nvme/target/fdp.c
>> index 5008294984885..807f54c73c4e1 100644
>> --- a/drivers/nvme/target/fdp.c
>> +++ b/drivers/nvme/target/fdp.c
> [ ... ]
>
>> +static u16 nvmet_fdp_io_mgmt_forward(struct nvmet_req *req, bool recv)
>> +{
>> +	struct nvme_command c = {};
>> +	u16 status = 0;
>> +	void *buf;
>> +	int ret;
>> +
>> +	buf = kzalloc(req->transfer_len, GFP_KERNEL);
>> +	if (!buf)
>> +		return NVME_SC_INTERNAL;
> [Severity: Medium]
> Can an initiator trigger a page allocator warning in
> nvmet_fdp_io_mgmt_forward() by supplying a large matching imr.numd and SGL
> length?
>
> In nvmet_execute_io_mgmt_recv(), nvmet_check_transfer_len() only checks that
> (numd + 1) << 2 equals req->transfer_len without imposing an upper bound. On
> transports such as RDMA or FC where req->sg is allocated from discontiguous
> pages via sgl_alloc(), a host can supply a transfer_len larger than
> KMALLOC_MAX_SIZE (for example, 8 MiB). Passing that unbounded
> req->transfer_len to kzalloc(..., GFP_KERNEL) without a size limit or
> __GFP_NOWARN will reach ___kmalloc_large_node() ->
> __alloc_frozen_pages_noprof() and trigger WARN_ON_ONCE_GFP(order >
> MAX_PAGE_ORDER, gfp).
>
> Should req->transfer_len be bounded (or allocated with __GFP_NOWARN) before
> calling kzalloc()?
Sashiko is right, changed in v3.
>> +
>> +	if (!recv) {
>> +		status = nvmet_copy_from_sgl(req, 0, buf, req->transfer_len);
>> +		if (status)
>> +			goto free;
>> +	}
>> +
>> +	c.common = req->cmd->common;
>> +	c.common.nsid = cpu_to_le32(req->ns->fdp.backend_nsid);
>> +	c.common.dptr = (union nvme_data_ptr){};
>> +	ret = nvme_submit_sync_cmd(req->ns->fdp.backend_q, &c, buf,
>> +				   req->transfer_len);
>> +	if (ret) {
>> +		status = ret > 0 ? ret : NVME_SC_INTERNAL;
>> +		goto free;
>> +	}
>> +
>> +	if (recv)
>> +		status = nvmet_copy_to_sgl(req, 0, buf, req->transfer_len);
>> +free:
>> +	kfree(buf);
>> +	return status;
>> +}
>> +
>> +void nvmet_execute_io_mgmt_recv(struct nvmet_req *req)
>> +{
>> +	u16 status;
>> +
>> +	status = nvmet_fdp_io_mgmt_check(req);
>> +	if (status)
>> +		goto out;
>> +
>> +	if (!nvmet_check_transfer_len(req,
>> +			(le32_to_cpu(req->cmd->imr.numd) + 1) << 2))
>> +		return;
> [Severity: Critical]
> Can the 32-bit calculation (le32_to_cpu(req->cmd->imr.numd) + 1) << 2
> overflow here and in nvmet_io_cmd_transfer_len()?
>
> Because le32_to_cpu(req->cmd->imr.numd) is a 32-bit unsigned value, any
> imr.numd >= 0x3fffffff wraps around in 32-bit arithmetic before being passed
> as size_t len to nvmet_check_transfer_len().
>
> For example, if a host sends imr.numd = 0x40000000 with a 4-byte SGL
> (req->transfer_len = 4), (0x40000000U + 1) << 2 wraps to 4 and passes
> nvmet_check_transfer_len(). Then nvmet_fdp_io_mgmt_forward() allocates a
> 4-byte buffer with kzalloc(4, GFP_KERNEL), copies req->cmd->common into c
> with the unwrapped c.imr.numd = 0x40000000, and submits it to
> req->ns->fdp.backend_q. On a PCIe NVMe backing controller using PRPs (which
> only carry the DMA address in prp1 and rely on imr.numd for the transfer
> size), the controller can DMA the full RUHS payload past the end of the
> 4-byte slab buffer. Similarly, imr.numd = 0x3fffffff wraps to 0, causing
> kzalloc(0, GFP_KERNEL) to return ZERO_SIZE_PTR and submitting a non-zero
> numd command with an unmapped buffer.
Sashiko is right, changed in v3.
>> +
>> +	if (req->cmd->imr.mo != NVME_IO_MGMT_RECV_MO_RUHS) {
>> +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
>> +		goto out;
>> +	}
>> +
>> +	status = nvmet_fdp_io_mgmt_forward(req, true);
>> +out:
>> +	nvmet_req_complete(req, status);
>> +}
>> +
>> +void nvmet_execute_io_mgmt_send(struct nvmet_req *req)
>> +{
>> +	u16 status;
>> +
>> +	status = nvmet_fdp_io_mgmt_check(req);
>> +	if (status)
>> +		goto out;
>> +
>> +	if (!nvmet_check_transfer_len(req,
>> +			(le16_to_cpu(req->cmd->ims.mos) + 1) * sizeof(__le16)))
>> +		return;
>> +
>> +	if (req->cmd->ims.mo != NVME_IO_MGMT_SEND_MO_RUH_UPDATE) {
>> +		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
>> +		goto out;
>> +	}
> [Severity: Medium]
> Should the Management Operation (ims.mo and imr.mo) be validated before
> calling nvmet_check_transfer_len(), and also checked along with
> nvmet_fdp_enabled(req->ns) in nvmet_io_cmd_transfer_len()?
>
> In the NVMe specification, ims.mos only encodes NPID when ims.mo is
> NVME_IO_MGMT_SEND_MO_RUH_UPDATE; other MO values (such as 00h, No Action) do
> not transfer data. Because nvmet_check_transfer_len() runs before checking
> ims.mo (and always expects at least 2 bytes), a command with an unsupported
> MO and a 0-byte SGL fails in nvmet_check_transfer_len() with
> NVME_SC_SGL_INVALID_DATA instead of NVME_SC_INVALID_FIELD. Likewise, on PCI
> endpoint targets, nvmet_pci_epf_exec_iod_work() uses
> nvmet_io_cmd_transfer_len() before req->execute() runs, so returning a
> non-zero length when FDP is disabled or MO is unsupported causes unnecessary
> buffer allocation and host DMA before the command is rejected.
Sashiko is right, changed in v3.
>
> [ ... ]
>
>> +static int nvmet_fdp_init_backend(struct nvmet_ns *ns)
>> +{
>> +	struct nvme_fdp_ruh_status *st;
>> +	struct nvme_id_ns *id;
>> +	int ret, i;
> [ ... ]
>
>> +	if (le16_to_cpu(st->nruhsd) < ns->fdp.nruh) {
>> +		pr_err("the ns:%u backing reports fewer handles than write streams\n",
>> +		       ns->nsid);
>> +		ret = -EINVAL;
>> +		goto free_st;
>> +	}
>> +
>> +	for (i = 0; i < ns->fdp.nruh; i++) {
>> +		if (le16_to_cpu(st->ruhsd[i].pid) != i) {
>> +			pr_err("the ns:%u backing placement identifiers are not identity mapped\n",
>> +			       ns->nsid);
>> +			ret = -EINVAL;
>> +			goto free_st;
>> +		}
>> +	}
> [Severity: Medium]
> Should nvmet_fdp_init_backend() check that le16_to_cpu(st->nruhsd) !=
> ns->fdp.nruh rather than only checking for fewer handles?
>
> In the NVMe host driver, nvme_query_fdp_info() clamps head->nr_plids (which
> becomes bdev_max_write_streams()) to NVME_MAX_PLIDS (U8_MAX):
>
> drivers/nvme/host/core.c:nvme_query_fdp_info() {
>     ...
> 	head->nr_plids = min(le16_to_cpu(ruhs->nruhsd), NVME_MAX_PLIDS);
>     ...
> }
>
> If the backing namespace has more than U8_MAX Reclaim Unit Handles,
> ns->fdp.nruh in nvmet_fdp_init_ns() will be U8_MAX while st->nruhsd returned
> by nvmet_fdp_backend_ruhs() is larger than ns->fdp.nruh. Since
> nvmet_execute_io_mgmt_recv() forwards the backing namespace's RUHS response
> directly to the remote host, any extra descriptors beyond ns->fdp.nruh would
> be exposed to the host without having been checked for identity mapping and
> would conflict with the target's reported nruh and maxpids.
Sashiko is right, changed in v3.

