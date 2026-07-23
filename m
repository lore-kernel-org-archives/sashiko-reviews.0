Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9535674C
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776537; cv=none; b=LSh+UDW/5wkvUoRdGnY92UD+1FqmHpdsR7meMBtBXuNFvv4Fl8ZR09BinQWL66kkLuCJg6mvy8VtFiZlk7JZNYJ/GhGFUw4pjiIieOz6QpmPFh7kNP5+oUnRN6jWuK60L0XObYaJXVxz4Bi8+jGA9VQJhxtT3UsCPgVlfaWp0JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776537; c=relaxed/simple;
	bh=g77xlz3Ou3eS0lStyouf0hrxhpnqTCxuMlxOdNVjaPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEjvnwmo29ppnXxzZvDo2SBA2DcO1HXsajw+0M6rRoB3orACPCTNj/n4yvHbs7bRn5WC2cDimNRMTNIlzs5kkGfSpygFQsxDzpAfHP5NEo9vc692a5GvGClQkTTybYUwhU72bRAm3KdTHc85Kf7qf7YCMixtNQPXoGTJLHu/lgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fzNfRpK2; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fzNfRpK2"
Message-ID: <39904443-664b-4958-bbcf-6f38778b4693@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784776528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYugVgDFWVcrAGoYD4vJcCynuN7BS/0pNSK1oEtZlUY=;
	b=fzNfRpK2jruA7UxycxgGo6dAuCO3Gt2/0FsZw8X+ksQlS34un2aEhgbVCTG9iA8mMlmeww
	0CgKPHq6Vti3RE+Jm4PKYlIl1YYsiJnGxt8/lWvoWj+5ZbHEa0VL0CviSfNlYw24UoZhqH
	i2ncCKTrxSJ4rtFIHVt4LvC+diZOUg8=
Date: Thu, 23 Jul 2026 11:15:05 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH -v3 1/2] memcg: move mem_cgroup_swappiness and
 vm_swappiness to mm/swap.h
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260723025858.1956584-1-ridong.chen@linux.dev>
 <20260723025858.1956584-2-ridong.chen@linux.dev>
 <20260723030843.9ADAA1F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260723030843.9ADAA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 7/23/2026 11:08 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing READ_ONCE() when reading memcg->swappiness, causing a data race
> --
> 
> --- Patch [1]: [PATCH -v3 1/2] memcg: move mem_cgroup_swappiness and vm_swappiness to mm/swap.h ---
> commit f75267591a19714e861e894e81979f67ae47cb21
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> memcg: move mem_cgroup_swappiness and vm_swappiness to mm/swap.h
> 
> This commit moves mem_cgroup_swappiness() and vm_swappiness from the public
> include/linux/swap.h to the subsystem-private mm/swap.h. It also guards the
> memcg->swappiness field with CONFIG_MEMCG_V1 so it can be dropped on v2-only
> kernels.
> 
> [ ... ]
> 
>> diff --git a/mm/swap.h b/mm/swap.h
>> index abd26588abd22..b0488f7b68b5d 100644
>> --- a/mm/swap.h
>> +++ b/mm/swap.h
>> @@ -99,6 +100,18 @@ struct swap_ops {
>>   	void (*submit_read)(struct swap_io_ctx *ctx);
>>   };
>>   
>> +extern int vm_swappiness;
>> +
>> +static inline int mem_cgroup_swappiness(struct mem_cgroup *memcg)
>> +{
>> +#ifdef CONFIG_MEMCG_V1
>> +	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
>> +	    !mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>> +		return memcg->swappiness;
> 
> [Severity: Medium]
> Was it intentional to drop the READ_ONCE() wrapper here during the move?
> 
> The original code in include/linux/swap.h returned READ_ONCE(memcg->swappiness).
> Since the update side in mem_cgroup_css_alloc() uses
> WRITE_ONCE(memcg->swappiness, mem_cgroup_swappiness(parent)), could this plain
> read lead to KCSAN data race warnings or unsafe compiler optimizations if
> userspace updates the swappiness file concurrently with page reclaim?
> 
>> +#endif
>> +	return READ_ONCE(vm_swappiness);
>> +}
>> +
>>   #ifdef CONFIG_SWAP
> 

Thank you, will add READ_ONCE back.

-- 
Best regards
Ridong

