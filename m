Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B549739A
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398431; cv=none; b=fW1m2qOzJFC2HBU+GxpdzlnaNHrZyKIw0kiXUIwOVQhNCrnRJOkbdzG+cHnRLbNaDTGtEoX0UtIWsKbBEH5fBTIJexhlZDzLHEQqbp7dVYNTCYktw3gSfXHN50+fDQxGLASp+qJFXQSpoOMFv0+6CtW5oB3poml89PtAOg4wHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398431; c=relaxed/simple;
	bh=ZAs3C6Cq5AOaK0EGffB8Ba29lQAcu8xbuBVkcS5pdUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONEBlVpDX6lT3rnsdEHijZemUHTzh7okpsL2S5HtEoMQJmNDOECcQ5K/8bSg0ZhvRfAYmaYl9Lsci34NcKI/YNGqy9zVYeCTFgcPjG+fESm0pbcGlN/K4XF7N59efY5snEPbxrK0q1+5A9bPQez+HoREyMkk16u63n+w6NqpgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZlTsGbzI; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZlTsGbzI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792398422; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=y/cn1nw659hfdNL/u62UUjysTFQXLAmpwE8Xo3BKvYA=;
	b=ZlTsGbzIdz3ejAx+6AOxpL7a2ET0rJVlT4B65aorD/q2q5GtZhqejBqiIpLJ7wdguUYsdma/WrkyLXDd2Bb1nD56LUaoxG92IdLDPkZY0JFsR84DLRhaMBZMscTYQ94ifx+05yIWDeGsKEjQlWlwkHoe1l8BtwDu3tyOWY9QOGs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XD3.0Wx_1792398421;
Received: from 30.178.69.0(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XD3.0Wx_1792398421 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 16:27:01 +0800
Message-ID: <1cd9132b-1c79-4073-a708-94fa333f2375@linux.alibaba.com>
Date: Mon, 19 Oct 2026 16:27:00 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] nvmet: translate placement identifiers of writes to
 write streams
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261019033624.402337-1-kanie@linux.alibaba.com>
 <20261019033624.402337-11-kanie@linux.alibaba.com>
 <sashiko-outbox-176586@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-176586@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/19 11:44, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] nvmet: bi_write_stream lost on chained bios in nvmet_bdev_execute_rw()
> --
>
> commit ee4faa4396ddf960be1a3f58157a725fb3691c6f
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: translate placement identifiers of writes to write streams
>
> This commit translates NVMe Data Placement Directive placement identifiers
> on write commands into block layer write streams on the backing block
> device when FDP is enabled on the namespace.
>
>> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
>> index f2d9e8901df4e..ff480f9ab9906 100644
>> --- a/drivers/nvme/target/io-cmd-bdev.c
>> +++ b/drivers/nvme/target/io-cmd-bdev.c
>> @@ -300,6 +300,10 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
>>  	bio->bi_iter.bi_sector = sector;
>>  	bio->bi_private = req;
>>  	bio->bi_end_io = nvmet_bio_done;
>> +	if (req->cmd->rw.opcode == nvme_cmd_write &&
>> +	    nvmet_fdp_enabled(req->ns)) {
>> +		bio->bi_write_stream = nvmet_fdp_write_stream(req);
>> +	}
>>  
>>  	blk_start_plug(&plug);
>>  	if (req->metadata_len)
> [Severity: Medium]
> What happens when a write command spans multiple bios in
> nvmet_bdev_execute_rw()?
>
> When req->sg_cnt exceeds BIO_MAX_VECS (or bio_add_page() otherwise fills
> the current bio), the for_each_sg() loop allocates a new chained bio:
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
> Since bio_alloc() initializes bi_write_stream to 0 and bio_chain() does
> not copy bi_write_stream from prev, won't all subsequent chained bios for
> the write command be submitted with bi_write_stream set to 0 instead of
> the stream returned by nvmet_fdp_write_stream(req), preventing them from
> merging with the initial bio and routing the tail of the write to the
> default stream instead of the host-selected reclaim unit?
>
> [ ... ]
Sashiko is right, fixed in v2.
>

