Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C903EEAC1
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796088; cv=none; b=LNfawF05DzUkfhE1EIetthIB1R7dWIJQRVI4jDjHDqLQUUuH0yuYGQjBzbb2CncoBJK1uX5JBW6Vbq/PlhmHv9Z5kUlhJh/WiRoX40Doblvk7jMiSrpazevYlyMcnLr4FNS6hqQS8lm5mReTCsL3DPQKOpGZTKrdHG2cvuwqSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796088; c=relaxed/simple;
	bh=rxdV6IXQNuOTHyqDW7uhVC7iYku5qX4asfNL0wKuiKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq5IZc3CMYDOIbEzPTJU5JY13Cy0XW8nCOewtuQMufVM0yQMMtgauAP0fEcHVR02JKA8iubg5+BbYjUqCIY6Hk5OPvgfp2jBPAaskIJxnHEoQ4uDwNJ7wUEDu9xOZrtx6aFXBk3/XH02GWZxwReb69PM+n8k1ovwBil1wPk2aDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+zmQjlJ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+zmQjlJ"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8016d642b2so4695672a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796080; x=1780400880; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zyt8PAN+eQFyYt4CosPpxSPT4JZ001w7fyywNWbOab8=;
        b=E+zmQjlJWZ3dVL8YucRuG+XTHKB5BwyC1jjSNXAIbp/cJ234j6h2tHJV+JIpImUwpQ
         SQPzQiNu1KaE0vLVbIUtBnM4xfWYAHOfCeWAXsQsPZfLYKAQgFlGa4szj2WH7ee0CLoR
         NYSDZn6tmbxR+SaDd6aSkrhnu80qvvpH9rWxDUqMz/Iqzp6kLB5QKK5WNueM2rvM4qTg
         7OnLAKC57o5dW/+OIqgxSTmQfv08ehcrQuWw08exZjBs2nMOIWbWcnUaQnXxDv1Tzh6s
         POtBAdIxnce4tNF5fy9J/DKTwjBbbaiG0OlvaiEpjgOLY+X5731sndnlj9zqPSVBnQbp
         xucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796080; x=1780400880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zyt8PAN+eQFyYt4CosPpxSPT4JZ001w7fyywNWbOab8=;
        b=Zh8W2oZ6yM0+eB6DBbYZuFT9Q6x2JQwcAJEFZTGRO+Jlhsoh0js2Mv/v9dW/gUxz9c
         AnNeHCkQP7sTFc5kaoNXgiGGrY32Kr8n6DoYnHWR6WkFcu9CtD1UyipCeftkfnJPMpsj
         DEUlFNDilmwHBaX6MFk8MJL1iIPHGsyPBhDInl9mT4pOZsIZTVxemx3/crzB8zuiRhYs
         4r1XOC0QYVvMs6LzFqr5UnNjMUkdtKN8VzRwyBYaOs3ZJlvKRPCon1t0G/FiG6Jc3EvW
         XYWOFMeR4adDyI6GiBVSE6rv8C5XNclqoOTV5c47B/nC3B71ruRCsRgvoiMVLHsYLZxR
         Xq/g==
X-Gm-Message-State: AOJu0YxdtjpbhjdAaZsJDMm6aBdtsDzomZrHBgQTwn97qI9Z4oCGCL94
	pqiQExxRTRIDeKLf5dblGMNPNL53800+LksQQ6JmFuoLYS+oro5mJTMTsWO6Vw==
X-Gm-Gg: Acq92OE6ZtB4qoqwxeucyrBoQUNV4Uwk/RxaWwNXeUVeRT2ZF8ZF+CryeL3fc9cp615
	hhq4POaArn5/SOWR+KhsclCwEMIaXfnlEZSDrZyBuzOs8TAa2TSYGNwoVM5Vn2SdWRMDxMcyInh
	Po8kG2yqZmJ8csonDmlG7/gUog51wF0l5lGvu3SO/695zvU3F3SQiFnuEOxRgo4dOwaGu/GVnud
	s8AafMIDP9yxARwhTX7wTujLfR9q2dxAZwz3zmU7qjvb9MDWinn+xuQ26K3v0mVpxP4EVIbo98x
	/yWf2h8BDaQidw5etHVBRl4IKrJeohOs8a9ihJs6tFqUHxBWhsgiM4oN7/tHCIUr4/Zh1clsU4b
	jA4zqNNZCLLPFC270KZxhZIUDN6orE9CTo/Nf1ejb9qjYp0Q75XyaVu0DLbKhh1JEGiZtjHd9zG
	0Xe826hUJK6f9y1Pwn0FT2N67vP2DzRRRds20L34ddid7ThzfFQ0UQMyc=
X-Received: by 2002:a17:902:f709:b0:2bc:dca9:f0ed with SMTP id d9443c01a7336-2beb087b062mr149263365ad.15.1779796079688;
        Tue, 26 May 2026 04:47:59 -0700 (PDT)
Received: from [10.125.192.130] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b83sm113557955ad.9.2026.05.26.04.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:47:59 -0700 (PDT)
Message-ID: <b1ca372d-530a-228f-c888-d6d04a5c133c@gmail.com>
Date: Tue, 26 May 2026 19:47:48 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/4] mm/zswap: Implement proactive writeback
To: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
References: <20260525122242.36127-3-jiahao.kernel@gmail.com>
 <20260525135046.413871F000E9@smtp.kernel.org>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <20260525135046.413871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/5/25 21:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Premature abort of proactive writeback due to flawed failure tracking across the memcg hierarchy.
> - [Medium] zswap_proactive_writeback incorrectly returns 0 (success) on partial writebacks, breaking memory.reclaim semantics.
> 
> Pre-existing issues:
> - [High] Double decrement of `nlru->nr_items` in `list_lru` when `shrink_memcg_cb` successfully writes back a page.
> --
> 
> commit df0f700584d1310ed3a326adfe34b6963c7222ce
> Author: Hao Jia <jiahao1@lixiang.com>
> 
> mm/zswap: Implement proactive writeback
> 
> This commit introduces a "zswap_writeback_only" key to the memory.reclaim
> cgroup interface. It allows users to proactively write back zswap pages
> to the backing swap up to a specified budget without invoking standard
> memory reclaim.
> 
>> diff --git a/mm/zswap.c b/mm/zswap.c
>> index 6519f646b496b..947507b9a1852 100644
>> --- a/mm/zswap.c
>> +++ b/mm/zswap.c
> 
> [ ... ]
> 
>> @@ -1684,6 +1684,144 @@ int zswap_load(struct folio *folio)
>>   	return 0;
>>   }
>>   
>> +/*
> 
> [ ... ]
> 
>> +static long zswap_proactive_shrink_memcg(struct mem_cgroup *memcg,
>> +					 unsigned long nr_to_write)
>> +{
> 
> [ ... ]
> 
>> +		while (nr_scanned < nr_to_scan) {
>> +			unsigned long nr_to_walk = min(ZSWAP_PROACTIVE_WB_BATCH,
>> +						       nr_to_scan - nr_scanned);
>> +
>> +			if (signal_pending(current))
>> +				return nr_written;
>> +
>> +			/*
>> +			 * Account for the committed budget rather than the walker's
>> +			 * actual delta. If the list is emptied concurrently, the
>> +			 * walker visits nothing and nr_scanned would never advance.
>> +			 */
>> +			nr_scanned += nr_to_walk;
>> +
>> +			nr_written += list_lru_walk_one(&zswap_list_lru, nid, memcg,
>> +							&shrink_memcg_cb,
>> +							&encountered_page_in_swapcache,
>> +							&nr_to_walk);
> 
> [Severity: High]
> This is a pre-existing issue, but proactive writeback heavily triggers it on
> demand. When shrink_memcg_cb() initiates a successful writeback, it calls
> zswap_writeback_entry() which frees the entry. This removes the entry from
> the list and decrements the LRU item count. Then shrink_memcg_cb() returns
> LRU_REMOVED_RETRY.
> 
> Does __list_lru_walk_one() fall through to the LRU_REMOVED case and perform a
> second decrement of nlru->nr_items? If so, will this double decrement corrupt
> the global node LRU count and cause underflows?
> 

As for this pre-existing issue, nlru->nr_items could indeed be 
double-decremented. IIRC, we don't have any code reading nlru->nr_items 
for the zswap LRU; zswap only uses list_lru_count_one() (l->nr_items), 
so things are working fine for now.

This issue wasn't introduced by this patchset, but it will cause 
problems if nlru->nr_items is ever used in the future. Therefore, I will 
try to address it in a separate patch later, or ask for help if needed.


> [ ... ]
> 
>> +int zswap_proactive_writeback(struct mem_cgroup *memcg,
>> +			      unsigned long nr_to_writeback)
>> +{
>> +	struct mem_cgroup *iter_memcg;
>> +	unsigned long nr_written = 0;
>> +	int failures = 0, attempts = 0;
> 
> [ ... ]
> 
>> +	while (nr_written < nr_to_writeback) {
> 
> [ ... ]
> 
>> +		batch_size = min(nr_to_writeback - nr_written,
>> +				 ZSWAP_PROACTIVE_WB_BATCH);
>> +		shrunk = zswap_proactive_shrink_memcg(iter_memcg, batch_size);
>> +		mem_cgroup_put(iter_memcg);
>> +
>> +		/* Writeback-disabled or offline: skip without counting. */
>> +		if (shrunk == -ENOENT)
>> +			continue;
>> +
>> +		++attempts;
>> +		if (shrunk > 0)
>> +			nr_written += shrunk;
>> +		else if (++failures == MAX_RECLAIM_RETRIES)
>> +			goto out;
> 
> [Severity: High]
> If shrunk > 0, shouldn't we reset the failures counter to zero?
> 
> Because zswap_mem_cgroup_iter() repeatedly walks the cgroup subtree, visiting
> multiple empty memcgs across iterations could cumulatively increment failures
> to MAX_RECLAIM_RETRIES.
> 
> Could this cause the proactive writeback to abort prematurely with -EAGAIN
> even when it is successfully writing back pages from other memcgs in the
> hierarchy?
> 

I would rather use a cumulative retry counter (like in shrink_worker() 
and user_proactive_reclaim()) to prevent the code from repeatedly trying 
to writeback the memcg under certain conditions.


>> +
>> +		cond_resched();
>> +	}
>> +out:
>> +	return nr_written ? 0 : -EAGAIN;
> 
> [Severity: Medium]
> If the requested target is not fully met but some pages were written back
> (0 < nr_written < nr_to_writeback), does returning 0 here break the expected
> semantics of the memory.reclaim interface?
> 
> Should it return -EAGAIN instead of 0 so userspace tools know the full
> requested amount was not satisfied?
> 
>> +}
> 

Both this and the remaining selftests issues have been fixed in v3.
https://lore.kernel.org/all/20260526114601.67041-1-jiahao.kernel@gmail.com

Thanks,
Hao
