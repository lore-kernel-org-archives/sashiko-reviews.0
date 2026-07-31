Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21417262E
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 02:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785465416; cv=none; b=EbUdotMHIUgzPNGlpVxgajhcdohlgjkOGqO7H52ltIKFR2nZDsCgwClbQlnPJYxLYomx5Yzy0xJSX8pgXkkjOwpeZ5k7LB6FxILEZUIP/jNPkk/IaL6c1NEL5H6jJo9UYRHBuvnVF6Q5rSwLDotwa3X3GFHBjKOoPkyWDk1iqQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785465416; c=relaxed/simple;
	bh=G6DDbpU/eMan3J4KXWpDKh3EGKH0mKWPHGSIu3+pWbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggXXGIAmIlanUI6LSu8JaOaV8nTC5zx1isX4tVs/QQ0+f9x1+ObgRznXEPn8hjow0ttUZxbOhYDJa8CfryRxnoyqlSZjstAQEH//fuO5nlkCjYbTnCQBwKNUnVHA+KY1Bq20LoVnGmj6kwenxd3HJUNbZA0VGEQyhyXG+wnWZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EjNqJsVo; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EjNqJsVo"
Message-ID: <fcd49b64-d800-4d1d-a08e-90c860ab4b13@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785465412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3PLcxxm3N/nenQ1bCzi/G1Oztr3FNxNhkRIkO11TYfI=;
	b=EjNqJsVoxSbLNcp3TsF5fjXU6H6WHt+YbNZTt54p4YJRYQtR6dVeUsdGolo7RRVkEExU3i
	Ki5ZLGsrsQAdWJEFQsLNYDq/uBSOsNIdwyRSD+KDhnDrwqaTJ8P0bhybohOg3gw4gzUGwO
	Hi/YjovPKPgyY4pcxEGpU5LT0sKW0Sg=
Date: Fri, 31 Jul 2026 10:36:42 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] mm, memcg: fix memory.peak reset clobbering other fds'
 watermark
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
References: <20260730115314.1069089-1-ridong.chen@linux.dev>
 <20260730120627.3B06D1F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260730120627.3B06D1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 7/30/2026 8:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Lockless readers in `peak_show` can transiently observe a lost peak due to an incorrect multi-variable update order and missing memory barriers in `peak_write`.
> --
> 
> --- Patch [1]: [PATCH] mm, memcg: fix memory.peak reset clobbering other fds' watermark ---
> commit 15d8c2c42e3dd5de2e4db8178cc6e094af81f2fe
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> mm, memcg: fix memory.peak reset clobbering other fds' watermark
> 
> Writing to memory.peak resets the peak for that fd only. Each fd is a
> watcher and reads back max(its own value, the shared local_watermark).
>      
> peak_write() resets by lowering local_watermark to the current usage.
> To keep the other watchers' peaks it then walks the watcher list, but it
> stores the current usage into them instead of the old watermark. So once
> usage has dropped from a peak, a reset on one fd wrongly drags every
> other fd's peak down too, even fds that never reset.
> 
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 8ff285e872ca9..7d7b6bf200805 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -4740,7 +4740,7 @@ static ssize_t peak_write(struct kernfs_open_file *of, char *buf, size_t nbytes,
>>   			  loff_t off, struct page_counter *pc,
>>   			  struct list_head *watchers)
>>   {
>> -	unsigned long usage;
>> +	unsigned long usage, old_watermark;
>>   	struct cgroup_of_peak *peer_ctx;
>>   	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
>>   	struct cgroup_of_peak *ofp = of_peak(of);
>> @@ -4748,11 +4748,12 @@ static ssize_t peak_write(struct kernfs_open_file *of, char *buf, size_t nbytes,
>>   	spin_lock(&memcg->peaks_lock);
>>   
>>   	usage = page_counter_read(pc);
>> +	old_watermark = READ_ONCE(pc->local_watermark);
>>   	WRITE_ONCE(pc->local_watermark, usage);
>>   
>>   	list_for_each_entry(peer_ctx, watchers, list)
>> -		if (usage > peer_ctx->value)
>> -			WRITE_ONCE(peer_ctx->value, usage);
>> +		if (peer_ctx != ofp && old_watermark > peer_ctx->value)
>> +			WRITE_ONCE(peer_ctx->value, old_watermark);
> 
> [Severity: Medium]
> Will this update order create a race window where readers can transiently
> observe a lower peak?
> 
> In mm/memcontrol.c:peak_show(), readers locklessly check these values:
> 
> 	u64 fd_peak = READ_ONCE(ofp->value), peak;
> 
> 	/* User wants global or local peak? */
> 	if (fd_peak == OFP_PEAK_UNSET)
> 		peak = pc->watermark;
> 	else
> 		peak = max(fd_peak, READ_ONCE(pc->local_watermark));
> 
> If pc->local_watermark is lowered to usage here in peak_write() before the
> watchers' peer_ctx->value fields are updated to old_watermark, can a
> concurrent lockless reader in peak_show() interleave to observe the lowered
> local_watermark while still reading their old lower fd_peak value?
> 

It seems this issue exsit already, maybe we should add 
spin_lock(&memcg->peaks_lock) in peak_show()?

> If they observe both lower values, this would temporarily violate the
> monotonic property of the peak metric and return a lower peak than expected.
> 
> Should the watchers be updated with old_watermark before lowering
> pc->local_watermark to usage, or are memory barriers needed to ensure the
> correct order?
> 
>>   
>>   	/* initial write, register watcher */
>>   	if (ofp->value == OFP_PEAK_UNSET)
> 

-- 
Best regards
Ridong

