Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E313955F0
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 02:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786674267; cv=none; b=Z3xHHT5Kvutbvf4+HneQ07pMkG+2AKOerJUYuRnMqzIAwF+a73ipxjLglJk6V+u/mxirWTxBV2UolxLF7Wysh6IBTJ9cyv+bnZDrdyx7bEQtZxxK5sd+g1sBfb07N9m+NYYvJQtVMlcPTdX4nfV9mCLd/+3sFnXxY3x4Q6SEqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786674267; c=relaxed/simple;
	bh=it++sijRvMVX8NiuYX2uRgC/XtpOr5/hXBcRaK+sGcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiOUfWRPINhlpRwBLxleDRS/Wh71mvx/f0cwZxvmbWATrh6VGsgN5b74ROh+GPfeih52be1t5JRLygRiwKbHRspL/ut9re8HxVhkqZZ75Opn/U9S6my222xCCHxXLChh2EvW1MPLjErQ36jiIV6Il2+zhusuxikMouA4ahL2+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n1M+QLsk; arc=none smtp.client-ip=91.218.175.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n1M+QLsk"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=it++sijRvMVX8NiuYX2uRgC/XtpOr5/hXBcRaK+sGcs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786674264; v=1; x=1787279064;
 b=n1M+QLsk1M9ogxxilu9rBcLEHgkTaJafwPUN6j3CF+Q3UvAfFhdha/cqu4oWijqbiLRkGNeK
 Ks5e0ISWIr2edr4pihT9ucG8LkvvC00OcY+x6wxDFt8Z1DD7uxgi000eVyie02jZarvhCwn0r8E
 J1KoWW6F39OgwqFH2WWfMvas=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [10.63.123.245] (14.29.108.90)
	by smtp.migadu.com with ESMTPS id d599602b708e17fa;
	Fri, 14 Aug 2026 02:24:24 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <dc4d93f8-f428-471d-bf83-0f45ff737680@linux.dev>
Date: Fri, 14 Aug 2026 10:24:21 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] memcg: acquire peaks_lock when reading memory.peak
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260814012924.2388613-1-ridong.chen@linux.dev>
 <20260814012924.2388613-2-ridong.chen@linux.dev>
 <20260814020621.D20891F000E9@smtp.kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260814020621.D20891F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/14/2026 10:06 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] peak_write() overwrites pc->local_watermark without preserving the historical peak for other watchers.
> --
> 
> --- Patch [1]: [PATCH v3 1/2] memcg: acquire peaks_lock when reading memory.peak ---
> commit 4ced2059ac574bcfd14e2b9ed8899640facbe49f
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
>      memcg: acquire peaks_lock when reading memory.peak
> 
> This patch fixes a race condition when reading memory.peak or memory.swap.peak.
> It acquires peaks_lock in memory_peak_show() and swap_peak_show() so that
> readers observe a consistent snapshot of local_watermark and per-fd values.
> 
> [1] https://sashiko.dev/#/patchset/20260730115314.1069089-1-ridong.chen@linux.dev?part=1
> 
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 1d3339520809f..0495b844c3750 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -4712,8 +4712,13 @@ static int peak_show(struct seq_file *sf, void *v, struct page_counter *pc)
>>   static int memory_peak_show(struct seq_file *sf, void *v)
>>   {
>>   	struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(sf));
>> +	int ret;
>>   
>> -	return peak_show(sf, v, &memcg->memory);
>> +	spin_lock(&memcg->peaks_lock);
>> +	ret = peak_show(sf, v, &memcg->memory);
>> +	spin_unlock(&memcg->peaks_lock);
>> +
>> +	return ret;
>>   }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but while reviewing the peaks_lock
> synchronization changes, does the shared peak_write() path permanently lose
> the historical peak for other watchers?
> 
> Looking at peak_write() in mm/memcontrol.c:
> 
> 	usage = page_counter_read(pc);
> 	WRITE_ONCE(pc->local_watermark, usage);
> 
> 	list_for_each_entry(peer_ctx, watchers, list)
> 		if (usage > peer_ctx->value)
> 			WRITE_ONCE(peer_ctx->value, usage);
> 
> If watcher A resets memory.peak, peak_write() updates pc->local_watermark to
> the current usage. It then updates watcher B's tracking value to that same
> current usage.
> 
> If memory usage hit a peak of 100 but dropped to 50 before watcher A reset it,
> won't watcher B incorrectly read 50 instead of the actual peak of 100?
> 

The patch 2 will fix this issue.

-- 
Best regards
Ridong

