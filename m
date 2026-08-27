Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943DD37A83A
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 01:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794166; cv=none; b=GXhbJ4DQulGT3ifH+0ZbNKjsty9eCSv1pSPpRQwL6EyDvO8lQ+apqX3qSNwofrNHt82biL2lSg/KfQqqlpvK2OLVUs+Wu9yO5Egzp2y7coFzYX2J7WMX5kyxYkAY7E1bMqInZPhiyrWqFm9QwFDAOFqU9ul9BCNnsl/VpSZx6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794166; c=relaxed/simple;
	bh=ty7M5gzOIO5H9mgZxPQZ/JV3HDbpyWkFk0E9P6s6O2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8iHtZCp6+SN8DmHtQ0ne3Wzp1VVcRNLTZgryoyGM7mEYxsP0+BQzD/MAQheTgeXmyUEIzQ9qti6xFGKBHbpbtAPdzo26hSKoIsPHpz5IdW6DsP+E6NHf2tFTp9rq7cWdi8AHgoq1PtEJUp8VgaLZrbh9A+nBPf5t7GKSq2nbqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HytpGnmD; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HytpGnmD"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ty7M5gzOIO5H9mgZxPQZ/JV3HDbpyWkFk0E9P6s6O2A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787794160; v=1; x=1788398960;
 b=HytpGnmD8Zog6jb3sj/ugriQJYZ58cVmRzTuOJpS2qCV1/iYso0ZzIs6zV1/YsaickZwRz74
 oZh35evMSJMuceD+RRNZbUpsD4g8pluyl5NA3qgXEZ6iGwUAI2QVZWdwSG6x9ulnYj5/W23Hn8W
 lHjzvnwzbTeYFeQz1f0gkPPA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [10.63.107.123] (14.29.108.92)
	by smtp.migadu.com with ESMTPS id f04850b71e0deefd;
	Thu, 27 Aug 2026 01:29:20 +0000
X-Mizu-Trace-ID: f04850b71e0deefd
X-Migadu-Flow: FLOW_OUT
Message-ID: <0c606cf9-2b5a-4549-8ab1-0be619487412@linux.dev>
Date: Thu, 27 Aug 2026 09:29:13 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mglru: fix ineffective memory protection for
 non-kswapd reclaim
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260826133054.88529-1-ridong.chen@linux.dev>
 <20260826134733.051941F000E9@smtp.kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260826134733.051941F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/26/2026 9:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Integer overflow in `effective_protection()` calculations on systems with >= 16TB RAM.
> --
> 

Thanks for the careful analysis. You're right that this is pre-existing in 
effective_protection() and not introduced by this patch.

I'm not sure it's worth fixing in practice, though — the overflow requires 
systems with >= 16TB of RAM, which I've never encountered
myself. So I'd rather not fold a fix for it into this patch.

I'd like to hear the maintainers' thoughts on whether this is worth addressing 
separately.

> commit 0b95b34e75bd94d348d96210ff25235304802608
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> mm/mglru: fix ineffective memory protection for non-kswapd reclaim
> 
> This commit fixes a bug where memory protection (memory.min/low) is silently
> bypassed during non-kswapd global reclaim. It introduces
> mem_cgroup_protection_path() to compute emin/elow correctly without a full
> tree walk.
> 
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 11b85f4b6828b..a334974333cb6 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -5197,6 +5197,48 @@ void mem_cgroup_calculate_protection(struct mem_cgroup *root,
> 
> [ ... ]
> 
>> +	rcu_read_lock();
>> +	for (i = root_level + 1; i <= cg->level; i++) {
>> +		struct mem_cgroup *cur;
>> +
>> +		cur = mem_cgroup_from_css(cgroup_css(cg->ancestors[i],
>> +						    &memory_cgrp_subsys));
>> +		if (cur)
>> +			page_counter_calculate_protection(&root->memory,
>> +					&cur->memory, recursive_protection);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since we are relying on
> page_counter_calculate_protection() here, is there a risk of an integer
> overflow during the protection calculation on systems with large memory?
> 
> Looking at effective_protection() in mm/page_counter.c, the function uses
> 64-bit unsigned long values to represent memory limits in pages:
> 
> mm/page_counter.c:effective_protection() {
>      ...
> 	if (siblings_protected > parent_effective)
> 		return protected * parent_effective / siblings_protected;
>      ...
> }
> 
> If a system has >= 16TB of RAM, both protected and parent_effective can
> exceed 2^32 pages (since 16TB is 2^32 pages of 4KB). The multiplication
> protected * parent_effective will exceed 2^64 - 1 and wrap around.
> 
> This also seems to happen in a secondary distribution path in the same
> function:
> 
> mm/page_counter.c:effective_protection() {
>      ...
> 		unclaimed = parent_effective - siblings_protected;
> 		unclaimed *= usage - protected;
>      ...
> }
> 
> Here, multiplying unclaimed and (usage - protected) can also multiply two
> page counts that each exceed 2^32, causing an overflow for the same reasons.
> 
> Could this overflow result in a drastically reduced effective protection
> value, effectively bypassing cgroup memory protection and causing cgroups
> to be unfairly reclaimed on machines with very large memory?
> 
>> +	}
>> +	rcu_read_unlock();
>> +}
> 

-- 
Best regards
Ridong

