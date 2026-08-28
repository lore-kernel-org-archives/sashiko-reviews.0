Received: from mta0.migadu.com (out-198.mta0.migadu.com [91.218.175.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B840DB3C
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912221; cv=none; b=kwbCLtEGFpT5nA1nNq+fdx9z3pev7G7zntSiw4/DVuevJhSkyHdzj7dT64IJ2ZjgTSOnUL8a9Fo7ckcMCXMH4PbK53mY4VQYdXyPGBTNG55Ql6WV0TcrhlSRIJmMgYdLxs3WKF/hiH7XJ2R+sYhXEb5Sh9hnmmsN2rTMC29xszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912221; c=relaxed/simple;
	bh=V5420hYO/NVmdI8rPNYD2i5L9vtWHV4RvXT0HAKC03w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ma261cJBh3wfnHdV8yVWzcwI6XG1N8GdeRyZacUFDLAztSRUapnhE4WgfwGoMe6vn0FkcVEbxpHm/c6yl3NxLwBtPJ94hzS9ffBAIVt64p5jFJF2ctLI4Li408ZzVnUnEHNyBvhyCzWY5LPlSI2Dx7RCKzEARQNxrT04SrFT6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jdu2w6nH; arc=none smtp.client-ip=91.218.175.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jdu2w6nH"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=V5420hYO/NVmdI8rPNYD2i5L9vtWHV4RvXT0HAKC03w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787912216; v=1; x=1788517016;
 b=jdu2w6nHJFwyjsLOV3Y2v1L6nhgAYGoZtK6Qf3kb8hzAzHoVrEC1XHDzCxb6OVV/gnXDxrm/
 wIW/VfDofucc9+o8q2yDFkyXgMM7VltM5MC9qYGtN52gXgtVhJc2YTSgLK6+BSKdZZhfVjBcGzd
 j/UwoMK0SER9S3Ha6b4sQbNQ=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ed2b19f510ac4fd7;
	Fri, 28 Aug 2026 10:16:56 +0000
X-Mizu-Trace-ID: ed2b19f510ac4fd7
X-Migadu-Flow: FLOW_OUT
Message-ID: <abcf2053-8857-451e-853c-1fa9c21eb98c@linux.dev>
Date: Fri, 28 Aug 2026 18:16:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/page_counter: avoid integer overflow in
 effective_protection()
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
References: <20260828092432.1257917-1-ridong.chen@linux.dev>
 <20260828092432.1257917-2-ridong.chen@linux.dev>
 <20260828094314.C6E241F000E9@smtp.kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260828094314.C6E241F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/2026 5:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] A non-atomic read race allows the 128-bit division quotient in `mul_u64_u64_div_u64` to exceed 64 bits. On x86-64, this triggers a `#DE` hardware panic. On architectures using the generic C fallback, it returns `~0ULL`, causing `ep` to destructively wrap around.
> --
> 
> commit 37c14765d82e3cf06ff691a1063f41818d86e6de
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> mm/page_counter: avoid integer overflow in effective_protection()
>      
> effective_protection() distributes a parent's protection among its children
> with two proportional calculations. This commit changes the calculations to
> use mul_u64_u64_div_u64() to avoid integer wrap-around on systems with >= 16TB
> RAM.
> 
> Link: https://sashiko.dev/#/patchset/20260826133054.88529-1-ridong.chen@linux.dev?part=1
> 
>> diff --git a/mm/page_counter.c b/mm/page_counter.c
>> index 661e0f2a5127a..311153b0e0020 100644
>> --- a/mm/page_counter.c
>> +++ b/mm/page_counter.c
> [ ... ]
>> @@ -399,9 +401,9 @@ static unsigned long effective_protection(unsigned long usage,
>>   	    usage > protected) {
>>   		unsigned long unclaimed;
>>   
>> -		unclaimed = parent_effective - siblings_protected;
>> -		unclaimed *= usage - protected;
>> -		unclaimed /= parent_usage - siblings_protected;
>> +		unclaimed = mul_u64_u64_div_u64(parent_effective - siblings_protected,
>> +						usage - protected,
>> +						parent_usage - siblings_protected);
> 
> [Severity: Critical]
> Could this division cause a #DE hardware panic on x86-64 or return ~0ULL
> on other architectures due to a non-atomic read race?
> 
> Because page_counter_try_charge() increments the child's usage before the
> parent's, concurrent memory charging (e.g., THP allocations) can cause
> the child's usage to transiently exceed the parent's by a large margin.
> 
> If page_counter_calculate_protection() reads these non-atomically (child
> then parent), it preserves this inverted state. If the parent has
> memory.low=max, parent_effective is PAGE_COUNTER_MAX.
> 
> In this scenario, mul_u64_u64_div_u64(PAGE_COUNTER_MAX, diff, 1) could
> yield a quotient > 2^64, which would overflow the 64-bit quotient.
> 
> Any unprivileged user who can allocate memory in a cgroup could trigger
> this race by allocating memory concurrently while the parent cgroup has
> memory.low=max.
> 

Thanks for the analysis, you're right. I'll update the patch and fix it.

>>   
>>   		ep += unclaimed;
>>   	}
> 

-- 
Best regards
Ridong

