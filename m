Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3A52ED2C
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866907; cv=none; b=IBCa6DQS4mWREVW0zUWd8apKcQfu52M/0JByuUdborEUSzoXhDIFvxqG2r34f0yJzXawwx4D+mq20x8LsQanpP9AoyXQM37sY35B6yOgK/osrmdjFk/cSk/y42EepWkuZt84je+uroYA4AUkbx8PTKwlyXrM2VxN0YKZAW1qNNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866907; c=relaxed/simple;
	bh=fAhkWbsPjSJ37MAF4sRRX1jqmnl1njf/zk439tgUIco=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DS4yn+CpEyZaHHCRYyMhn1gEu5iFvgS7r/7GOXy+4EFZdwH8VarHyt4Mph1AvLXSEvQlVw9to1ByFAdubveZE/GJvswqHziLGaEEijnk5MGyj5RjwaecEMp51AbPbLgMIxTyNPyxsYiNLMDasSy+DDY4CGXt4XUCqvBVsZd9FLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IyNMS0fe; arc=none smtp.client-ip=95.215.58.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IyNMS0fe"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=fAhkWbsPjSJ37MAF4sRRX1jqmnl1njf/zk439tgUIco=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788866894; v=1; x=1789471694;
 b=IyNMS0fefNhlwxJoyRKbqB5Pj1q5EmWVK+7NR1OIthKmwU3PXhbNmgHzeIlo071UBNT4A6wH
 YPnLTVONOsGi9ZIZ/HPpmMPqeNJ75p7XG0zif8KJAHo4J/daYT4lrOnIhZCaLAhVA2iHu1p//X3
 /nqwtCJtmxwWapamReoUfv8k=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id cf2611976bfe62d2;
	Tue, 08 Sep 2026 11:28:14 +0000
X-Mizu-Trace-ID: cf2611976bfe62d2
X-Migadu-Flow: FLOW_OUT
Message-ID: <77c43306-ae89-4919-b7cf-9188165bfbb7@linux.dev>
Date: Tue, 8 Sep 2026 19:28:06 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org
Subject: Re: [PATCH 1/4] blk-iocost: charge flushes as pageless random writes
To: sashiko-reviews@lists.linux.dev
References: <20260908022135.1429281-1-cui.tao@linux.dev>
 <20260908022135.1429281-2-cui.tao@linux.dev>
 <20260908023455.786E01F00A3A@smtp.kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260908023455.786E01F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/8 10:34, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Charging dataless flushes disrupts the cgroup's sequential IO detection by erroneously updating the IO stream cursor.
> 
> Pre-existing issues:
> - [High] Unthrottled REQ_OP_DISCARD and REQ_OP_WRITE_ZEROES operations allow cgroups to bypass iocost limits and monopolize the block device.
> --
> 
> commit f7f33b205abe22d686461a97d252f89e87ee7d72
> Author: Tao Cui <cuitao@kylinos.cn>
> 
>     blk-iocost: charge flushes as pageless random writes
>     
>     Standalone flushes issued by blkdev_issue_flush() are represented as
>     dataless REQ_OP_WRITE | REQ_PREFLUSH bios, which
>     calc_vtime_cost_builtin() prices at zero.  The flush component of
>     flush-heavy workloads such as database commits, journal flushes, and
>     metadata sync is thus neither charged nor throttled: a cgroup at 1% weight
>     can issue ~510k flushes per 12s, monopolizing the device while iocost
>     reports zero usage.
> 
>> diff --git a/block/blk-iocost.c b/block/blk-iocost.c
>> index 2745bffcd5eef..abc512532ed95 100644
>> --- a/block/blk-iocost.c
>> +++ b/block/blk-iocost.c
>> @@ -2533,8 +2533,8 @@ static void calc_vtime_cost_builtin(struct bio *bio, struct ioc_gq *iocg,
>>  	u64 seek_pages = 0;
>>  	u64 cost = 0;
>>  
>> -	/* Can't calculate cost for empty bio */
>> -	if (!bio->bi_iter.bi_size)
>> +	/* Dataless WRITE|REQ_PREFLUSH (standalone flush) is priced below */
>> +	if (!bio->bi_iter.bi_size && !(bio->bi_opf & REQ_PREFLUSH))
>>  		goto out;
>>  
>>  	switch (bio_op(bio)) {
>> @@ -2544,6 +2544,15 @@ static void calc_vtime_cost_builtin(struct bio *bio, struct ioc_gq *iocg,
>>  		coef_page	= ioc->params.lcoefs[LCOEF_RPAGE];
>>  		break;
>>  	case REQ_OP_WRITE:
>> +		if (!bio->bi_iter.bi_size) {
>> +			/*
>> +			 * dataless WRITE|REQ_PREFLUSH: standalone flush;
>> +			 * at least one page so fast profiles still charge
>> +			 */
>> +			cost = max(ioc->params.lcoefs[LCOEF_WRANDIO],
>> +				   ioc->params.lcoefs[LCOEF_WPAGE]);
>> +			goto out;
>> +		}
> 
> [Severity: High]
> Does charging dataless flushes disrupt the cgroup's sequential IO detection?
> 
> Because this patch changes the flush's cost from zero to non-zero,
> ioc_rqos_throttle() will no longer early return for dataless flushes:
> 
> block/blk-iocost.c:ioc_rqos_throttle() {
>     ...
> 	abs_cost = calc_vtime_cost(bio, iocg, false);
> 	if (!abs_cost)
> 		return;
>     ...
> 	iocg->cursor = bio_end_sector(bio);
>     ...
> }
> 
> The cursor is erroneously updated with the dataless flush's sector.
> Depending on the flush's sector (often 0, or a metadata sector), subsequent
> IOs could be misclassified as sequential (undercharging them) or random
> (overcharging and unfairly throttling them), breaking detection for workloads
> that interleave flushes and data.
> 

Right, this is a real problem. With this change standalone flushes
pass the !abs_cost check in ioc_rqos_throttle() and update
iocg->cursor with the flush's sector (usually 0). That breaks the
sequential/random detection for the following IOs, and cursor == 0
also defeats the !iocg->cursor sentinel in calc_vtime_cost_builtin().

The cost calculation itself is fine (the dataless branch exits before
the seek computation), so the fix is simply:

-	iocg->cursor = bio_end_sector(bio);
+	if (bio->bi_iter.bi_size)
+		iocg->cursor = bio_end_sector(bio);

Will fix in v2.

> 
> [Severity: High]
> This is a pre-existing issue, but do unthrottled REQ_OP_DISCARD and
> REQ_OP_WRITE_ZEROES operations allow cgroups to bypass iocost limits?
> 
> Unrecognized operations like DISCARD and WRITE_ZEROES fall through to the
> default case in calc_vtime_cost_builtin():
> 
> block/blk-iocost.c:calc_vtime_cost_builtin() {
>     ...
> 	default:
> 		goto out;
> 	}
>     ...
> out:
> 	*costp = cost;
> }
> 
> These operations are assigned a cost of 0, bypassing cgroup IO throttling.
> A cgroup could issue massive amounts of discards or zero-writes, monopolizing
> the device and causing a Denial of Service for other cgroups.
> 
>>  		coef_seqio	= ioc->params.lcoefs[LCOEF_WSEQIO];
>>  		coef_randio	= ioc->params.lcoefs[LCOEF_WRANDIO];
>>  		coef_page	= ioc->params.lcoefs[LCOEF_WPAGE];
> 

