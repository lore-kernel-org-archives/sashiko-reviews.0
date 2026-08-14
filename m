Received: from mta1.migadu.com (out-62.mta1.migadu.com [95.215.58.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1799F7E792
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681153; cv=none; b=gX/n663kcUAbDvIMdln7OHeMuGX0nODRJR1AuUQu5jNjMZFjkOtzBFhw+xz31ah+04KNWGrhJRpdvk4S9WuTns2VRkZOSi9AmK+DdeuZp3zImOTG/vdMIC5RxQvPo2KVr4rg5fATaqC7QCUY26QRImF6aURg7iEj5jSOIoSsjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681153; c=relaxed/simple;
	bh=IVPmquKdnfAc0rhx5Mx3Ocp283/Ti0L/9S+/+rdrMQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcgSnDwCCh3+WRHetizLxnSsKpD+AEPbBAHURVoTrPqc4pccMu2oinhhKlHpsi6IG4J1Afbkklo/8pbyNlTTeKzI6Ou7N5WPn+9AlphQH7OE3yRsDZIV9SlmzQ1fmj9LIVcbgV7GQLQeaxyeVH9WPo7Amg5qb3X0/2Xpo4+Ac2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A4L/LO2n; arc=none smtp.client-ip=95.215.58.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A4L/LO2n"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IVPmquKdnfAc0rhx5Mx3Ocp283/Ti0L/9S+/+rdrMQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786681149; v=1; x=1787285949;
 b=A4L/LO2nmzqgJcyYyXRvw+6YzVKr6lW/fv5pCS5YWf7CK/dmtHBq9XCyVsTiJwHYY3cgQPcX
 sb42AWS8yyCze8s7tdMtEjBMJCPCWdEpm+GGB7uAot48BOIxHQUDWe9a+D3SQAsX0xCv1UxHRsk
 5BJ5X+XYW6chCmI07Oklv3Nc=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [10.63.123.245] (14.29.108.90)
	by smtp.migadu.com with ESMTPS id 65a5bc5f56dafcf0;
	Fri, 14 Aug 2026 04:19:07 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <516dd300-5bb7-4550-8e79-50de6e6b2c28@linux.dev>
Date: Fri, 14 Aug 2026 12:19:04 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] memcg: acquire peaks_lock when reading memory.peak
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260814033005.2481920-1-ridong.chen@linux.dev>
 <20260814033005.2481920-2-ridong.chen@linux.dev>
 <20260814034812.19DEC1F000E9@smtp.kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260814034812.19DEC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/14/2026 11:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The patch fails to address a data loss bug in `peak_write()` where a reset permanently destroys the historical peak for all other registered FDs.
> --
> 
> --- Patch [1]: [PATCH v4 1/2] memcg: acquire peaks_lock when reading memory.peak ---
> commit 8f5f0ca96603012cd51c47aee8957e3a77182ee5
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
>      memcg: acquire peaks_lock when reading memory.peak
>      
>      This commit fixes a race condition where a reader can transiently observe
>      a lower memory peak. It acquires the peaks_lock in memory_peak_show and
>      swap_peak_show so the reader sees a consistent snapshot of the memory
>      values.
> 
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 1d3339520809f..1546993168610 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -4713,6 +4713,7 @@ static int memory_peak_show(struct seq_file *sf, void *v)
>>   {
>>   	struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(sf));
>>   
>> +	guard(spinlock)(&memcg->peaks_lock);
>>   	return peak_show(sf, v, &memcg->memory);
>>   }
> 
> [Severity: High]
> This is a pre-existing issue, but there appears to be a data loss bug in
> the peak memory tracking API during resets that this patch does not address.
> 
> Looking at peak_write(), when one watcher resets the peak, it updates the
> peer watchers using the current usage instead of the old
> pc->local_watermark:
> 
> mm/memcontrol.c:peak_write() {
>      ...
> 	usage = page_counter_read(pc);
> 	WRITE_ONCE(pc->local_watermark, usage);
> 
> 	list_for_each_entry(peer_ctx, watchers, list)
> 		if (usage > peer_ctx->value)
> 			WRITE_ONCE(peer_ctx->value, usage);
>      ...
> }
> 
> Does this incorrectly discard the historical memory peak for all other
> registered watchers when any one watcher resets the peak?
> 
> If memory usage spiked and dropped before a watcher calls peak_write(),
> propagating the current (lower) usage instead of the old
> pc->local_watermark would cause the other watchers to lose visibility of
> the spike. This could lead to userspace tools like OOM daemons
> under-provisioning memory or failing to detect usage spikes.
> 
> Could the loop propagate the old pc->local_watermark instead of the
> current usage to preserve the historical peak?
> 
> [ ... ]
> 
>> @@ -5858,6 +5859,7 @@ static int swap_peak_show(struct seq_file *sf, void *v)
>>   {
>>   	struct mem_cgroup *memcg = mem_cgroup_from_css(seq_css(sf));
>>   
>> +	guard(spinlock)(&memcg->peaks_lock);
>>   	return peak_show(sf, v, &memcg->swap);
>>   }
> 

Thanks.

Patch 2/2 will fix this issue.

-- 
Best regards
Ridong

