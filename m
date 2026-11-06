Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951027;
	b=fJNj/69KZ5lKr5XkOtxq5Vqso97rvPycSoZh5eVjxiZa2nuPfrXrW+IP0iibCRTTW07b
	 Rj9kmyfdWe6Zemrr72I/vGa92/EL/WOc6yFgHXqnmOyOqYVOsYwUuoYl9+0AhlJT+tJNg
	 6IHs/DSTs+2MG5u1xNst+Wx6ACZhOnBmnWu5ATX86bodMyyjajsvNqCx1QLQcpJGTGhe4
	 SIJJFJz2cJ9rrlScElC/8tZfwiFyvRTXGzm3SXb05Yf5BDEjmXmR0ZncG9LKmYbQ9cbwB
	 5J9vdBVk+K4KAV0DNXXEimLbfwA4JQHGi/VQLq8X385UbryF7269Kzi2kVpCtUr8pKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951027;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pQ493reg1DFWSPby69XzCWASVouZmLq1W+aADtj60OE=;
	b=zBVsIxSXIrmKMqIT1JQNKUo4pVmIy5QLVHPkjJT1nreOrxh9LjYnhl/9ufOlfzLVB+un
	 BBb81wqSaJJC8j1xN8rxatf4Upc2Gij0ljQ+qRH7Uze9RFpk/6yehDuRqF8YM6SaS5Grs
	 zbSieGPvSYFGxWtTTXZwy+CMYotGnuo863gdlSok2P5hM/KlhoYNFN+1deCWXfi7wEnzr
	 BAP4vEnuHuczL3zFjGzq1+9/yRnk4Y78PVgDp8/wFp/2www5ukfiu4PdSsqBhRtz6T8gW
	 VbNwmbIMW6rL5uZgQmJBQKMaADtBv7Mfq43zyuCh9mAiCWNY9N6ukJM4MrC7OvUpq3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UUslPJzJ;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5ED606A330
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 07:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UUslPJzJ
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=o9Tmykt3lhCIaXXKkm5ZZA+SVo0MxKGt6zqyZUr8nlc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793951024; v=1; x=1794555824;
 b=UUslPJzJsosbxl4LiZgDzuNLV1FVGk2DOY0WYsTMTq36yXOBkwDrQPaDUJDvAU+iwqhKds3j
 FCFvH3005Nvt6h9U51/e+Xb7AkapHPYzZ0wWlkwJHuF11Er6SOJ/RBIztOf7P6C9TCcanA8YMrn
 jLG9y/fYc64cHri8M0MpjY8o=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 047cd03742201f6e;
	Fri, 06 Nov 2026 07:43:44 +0000
X-Mizu-Trace-ID: 047cd03742201f6e
X-Migadu-Flow: FLOW_OUT
Message-ID: <3bccbb5c-bc3f-425a-b8cd-42342ca71f42@linux.dev>
Date: Fri, 6 Nov 2026 15:43:41 +0800
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
Subject: Re: [PATCH v2 4/4] mm: hugetlb: fix cpuset violations in gigantic
 surplus allocations
To: sashiko-reviews@lists.linux.dev, muchun.song@linux.dev,
 osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 azpijr@gmail.com, lance.yang@linux.dev, Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-mm@kvack.org
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <046fd77e49ee8bb35e3bcc4104b9275d2e72ea5e.1793850539.git.zhengqi.arch@bytedance.com>
 <sashiko-outbox-198588@kernel.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <sashiko-outbox-198588@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 1:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] mm: hugetlb: empty nodemask passed in alloc_buddy_hugetlb_folio()
> - [Medium] mm: hugetlb: MPOL_BIND violation in alloc_buddy_hugetlb_folio() on cpuset race
> --
> 
> commit 6e27dfcfc4f6238bea6b6e8639c15188d8d94295
> Author: Qi Zheng <qi.zheng@linux.dev>
> 
> mm: hugetlb: fix cpuset violations in gigantic surplus allocations
> 
> This commit intersects the allocation nodemask in alloc_buddy_hugetlb_folio()
> with cpuset_current_mems_allowed so gigantic surplus hugepage allocations do
> not allocate from nodes outside the current task's cpuset. It also retries
> failed allocations if cpuset_current_mems_allowed changes during the attempt.
> 
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 6fba92b0f6749..09b64f7c11dd2 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -2181,22 +2181,33 @@ struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
>>   		gfp_t gfp_mask, struct mempolicy_interpreted *mpoli)
>>   {
>>   	struct folio *folio = NULL;
>> -	nodemask_t *nodemask = mpoli->nodemask;
>> +	nodemask_t alloc_nodemask;
>> +	unsigned int cpuset_mems_cookie;
>> +
>> +retry:
>> +	cpuset_mems_cookie = read_mems_allowed_begin();
>> +	alloc_nodemask = cpuset_current_mems_allowed;
>> +	if (mpoli->mode == MPOL_BIND && mpoli->nodemask &&
>> +	    nodes_intersects(*mpoli->nodemask, alloc_nodemask))
>> +		nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask);
>>   
>>   	if (mpoli->mode == MPOL_PREFERRED_MANY) {
>>   		gfp_t gfp = gfp_mask & ~(__GFP_DIRECT_RECLAIM | __GFP_NOFAIL);
>>   
>> +		nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask);
>>   		folio = alloc_surplus_hugetlb_folio(h, gfp, mpoli->nid,
>> -						    nodemask);
>> +						    &alloc_nodemask);
> 
> [Severity: Medium]
> What happens here when an MPOL_PREFERRED_MANY policy's nodemask is disjoint
> from cpuset_current_mems_allowed (for example, after moving a task or
> non-leader thread to a cpuset on different NUMA nodes, since
> mpol_rebind_preferred() does not remap pol->nodes)?
> 
> Unlike the MPOL_BIND branch above, this path does not check whether the
> intersection is non-empty before calling alloc_surplus_hugetlb_folio() with
> &alloc_nodemask. When alloc_nodemask is empty:
> 
> 1. For gigantic hugepages, alloc_surplus_hugetlb_folio() performs a wasted
>     pass through CMA and alloc_contig_frozen_pages() with an empty nodemask.
> 
> 2. For non-gigantic hugepages, alloc_surplus_hugetlb_folio() ->
>     alloc_fresh_hugetlb_folio() -> only_alloc_fresh_hugetlb_folio() ->
>     alloc_buddy_frozen_folio() -> __alloc_frozen_pages_noprof() fails the fast
>     path and enters __alloc_pages_slowpath(). In check_retry_cpuset():
> 
>     mm/page_alloc.c:check_retry_cpuset() {
>     	if (cpusets_enabled() && ac->nodemask &&
>     			!cpuset_nodemask_valid_mems_allowed(ac->nodemask)) {
>     		ac->nodemask = NULL;
>     		return true;
>     	}
>     }
> 
>     Because cpuset_nodemask_valid_mems_allowed() returns false for an empty
>     nodemask, check_retry_cpuset() treats it as a raced MPOL_BIND nodemask,
>     resets ac->nodemask to NULL, and restarts __alloc_pages_slowpath() with
>     __GFP_DIRECT_RECLAIM masked off. That wakes kswapd across all nodes via
>     wake_all_kswapds() with ac->nodemask == NULL, attempts an allocation on
>     non-preferred fallback cpuset nodes at ALLOC_WMARK_MIN before the normal
>     fallback pass at ALLOC_WMARK_LOW with reclaim/compaction runs, and
>     increments HTLB_BUDDY_PGALLOC_FAIL in alloc_buddy_frozen_folio() if that
>     first pass fails.
> 
> Should the first-pass alloc_surplus_hugetlb_folio() call be guarded by
> if (nodes_and(alloc_nodemask, alloc_nodemask, *mpoli->nodemask)) so that an
> empty intersection skips straight to the cpuset fallback pass?

Right. We should skip the preferred-node attempt when no preferred nodes
are allowed by the current cpuset.

> 
>>   
>> -		/* Fallback to all nodes if page==NULL */
>> -		nodemask = NULL;
>> +		/* Fallback to all nodes allowed by the current cpuset */
>> +		alloc_nodemask = cpuset_current_mems_allowed;
>>   	}
>>   
>> -	if (!folio) {
>> +	if (!folio)
>>   		folio = alloc_surplus_hugetlb_folio(h, gfp_mask, mpoli->nid,
>> -						    nodemask);
>> -	}
>> +						    &alloc_nodemask);
>> +
>> +	if (!folio && unlikely(read_mems_allowed_retry(cpuset_mems_cookie)))
>> +		goto retry;
> 
> [Severity: Medium]
> Can pre-intersecting alloc_nodemask with cpuset_current_mems_allowed cause
> non-gigantic surplus allocations to violate MPOL_BIND or use a stale nodemask
> when cpuset_current_mems_allowed changes concurrently?

Yes. We should preserve the original policy nodemask and check cpuset
constraints separately in the hugeTLB CMA and contiguous allocators.
This avoids losing policy information or restricting retries to a stale
cpuset snapshot.

The plan is to:

1. Add optional cpuset checks to the contiguous allocator.
2. Add node-selection checks to the HugeTLB CMA allocator and enable
    cpuset enforcement in both paths for HugeTLB surplus allocations.
3. Keep policy fallback at the policy-aware callers and retry failed
    allocations when cpuset changes.

I'd like to address cpuset handling more comprehensively across the
HugeTLB allocation paths, so I'll drop patch 4 from this series and
follow up with a separate patchset.

Thanks,
Qi

> 

