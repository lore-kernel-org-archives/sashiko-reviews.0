Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3886439099C
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398730; cv=none; b=jZ3RkeJNo7KxnCVsVdLur9Iurnf7YrAIWQVaUsXbm0+4WQAnMVj4E3VQ9xZBd1IylL3gjWGgiVC5WHycH7gDVpdH1uDePJy16HOuKECwsop+CXSG6G1NO91+c51N3xU3n4IF98PKVVt10xd8e0AabLTt8olfcEcypYujFYDGMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398730; c=relaxed/simple;
	bh=9CosrZGhuTRoiOYGOYp0f8Qa00ftOgzrS55EfCzx8zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWrh/O/JBz6RKr0+Pk1FMNxqLcHx9XIiynpxtVY6q/1ztI/UuLEh3ZB8yZnO1boC1gcselPY9z/WjtV9FzmewSQ0l14DMaHumcRAISrRR1Xrg1v//lqlUwTAzeI35ENcK/QA2PWwbhyf8TIOlYY3GrTDPIx+S0zuF4Bw01Tps8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LqX0Ritm; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LqX0Ritm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792398724; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8btRrBANQFJ4TVFAw+E3HojIvzA7sK1wLtV5SsUh27c=;
	b=LqX0RitmL3NhHMnRUVhv5NImQV7NBKy7pJ8praoAGr+ynr/Z43dsM9Arwv8K3+ywYKWc/lszgaTTGLG2YG+U2KVBkjCZrBmEqHyjDab0J2q++NYKpkt1IijyfjAvOcEdthU6FfPrMRPHSYPpy473hBP9LETbPs9Qj2iL+h+UL3M=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XD3ChZH_1792398723;
Received: from 30.178.69.0(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XD3ChZH_1792398723 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 16:32:04 +0800
Message-ID: <5fcb6263-e907-45b5-9ae4-42c8c249f973@linux.alibaba.com>
Date: Mon, 19 Oct 2026 16:32:03 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] nvmet: add an FDP write translation tracepoint
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261019033624.402337-1-kanie@linux.alibaba.com>
 <20261019033624.402337-12-kanie@linux.alibaba.com>
 <sashiko-outbox-176589@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-176589@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/19 11:48, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] nvmet: trace_nvmet_fdp_write_translate() called on non-directive writes
> - [Medium] nvmet: missing bi_write_stream copy on chained bios in nvmet_bdev_execute_rw()
> --
>
> commit 910a51c080606805fab754e08158c76023d49e00
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: add an FDP write translation tracepoint
>
> This commit adds the nvmet_fdp_write_translate tracepoint to the bdev write
> path to report the placement identifier from a write command and the backing
> write stream it is translated to.
>
>> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
>> index ff480f9ab9906..139be9edad969 100644
>> --- a/drivers/nvme/target/io-cmd-bdev.c
>> +++ b/drivers/nvme/target/io-cmd-bdev.c
> [ ... ]
>
>> @@ -302,7 +303,10 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
>>  	bio->bi_end_io = nvmet_bio_done;
>>  	if (req->cmd->rw.opcode == nvme_cmd_write &&
>>  	    nvmet_fdp_enabled(req->ns)) {
>> +		u16 pid = le32_to_cpu(req->cmd->rw.dsmgmt) >> 16;
>> +
>>  		bio->bi_write_stream = nvmet_fdp_write_stream(req);
>> +		trace_nvmet_fdp_write_translate(req, pid, bio->bi_write_stream);
>>  	}
> [Severity: Medium]
> Should trace_nvmet_fdp_write_translate() only be called when the write
> command actually carries the Data Placement Directive?
>
> The commit message notes that the tracepoint "reports the placement
> identifier carried by a write command with the Data Placement Directive
> and the backing write stream it is translated to."
>
> In drivers/nvme/target/nvmet.h, nvmet_fdp_write_stream() checks the
> directive type before treating the upper 16 bits of req->cmd->rw.dsmgmt
> as a placement identifier:
>
> static inline u8 nvmet_fdp_write_stream(struct nvmet_req *req)
> {
> 	u16 control = le16_to_cpu(req->cmd->rw.control);
> 	u16 pid;
>
> 	if ((control & 0xf0) != (NVME_RW_DTYPE_DPLCMT & 0xf0))
> 		return 0;
>
> 	pid = le32_to_cpu(req->cmd->rw.dsmgmt) >> 16;
>
> In nvmet_bdev_execute_rw(), however, trace_nvmet_fdp_write_translate() is
> invoked for every nvme_cmd_write to an FDP-enabled namespace without
> checking whether req->cmd->rw.control specifies NVME_RW_DTYPE_DPLCMT.
>
> When a host issues an ordinary non-directive write (or a write with a
> different directive type) to an FDP-enabled namespace, won't this still
> fire the tracepoint and report the upper 16 bits of req->cmd->rw.dsmgmt
> as pid alongside write_stream=0, making non-directive writes
> indistinguishable from directive writes whose placement identifier failed
> translation?
Well, yes, fixed in v2.
>
> [Severity: Medium]
> Also in nvmet_bdev_execute_rw(), what happens when a write with the Data
> Placement Directive spans more than BIO_MAX_VECS (256) scatterlist
> segments and has to be split across chained bios?
>
> Later in nvmet_bdev_execute_rw(), if bio_add_page() cannot fit all
> segments into the initial bio, a continuation bio is allocated and
> chained:
>
> 	for_each_sg(req->sg, sg, req->sg_cnt, i) {
> 		while (bio_add_page(bio, sg_page(sg), sg->length, sg->offset)
> 				!= sg->length) {
> 			struct bio *prev = bio;
> 			...
> 			bio = bio_alloc(req->ns->bdev, bio_max_segs(sg_cnt),
> 					opf, GFP_KERNEL);
> 			bio->bi_iter.bi_sector = sector;
>
> 			bio_chain(bio, prev);
> 			submit_bio(prev);
> 		}
>
> Because bio_alloc() initializes bi_write_stream to 0 and bio_chain() does
> not copy prev->bi_write_stream, the continuation bios keep
> bi_write_stream == 0 while trace_nvmet_fdp_write_translate() reports that
> the request was translated to the initial bio's stream.
>
> As a result, blk_rq_merge_ok() will reject merging the continuation bios
> with the initial bio due to the mismatched bi_write_stream, and
> nvme_setup_rw() will submit the remainder of the write to the backing
> device without NVME_RW_DTYPE_DPLCMT (placing it into default stream 0).
> Should prev->bi_write_stream be copied to each chained bio in
> nvmet_bdev_execute_rw()?
Same as before, fixed in v2.
>>  
>>  	blk_start_plug(&plug);
> [ ... ]
>
>>
>>
> []
>

