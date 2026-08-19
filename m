Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC7346E59
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787106380; cv=none; b=ikHwSANiPUI43XJzAZIGIGFc+v8aJjlu2Xiy7BJfV0frvR5c3HpWj/RJjlSwxOwyOk+vjqx5l6czRbUh46Qz+AFmCf8k5OLfGJzMn4mTJA1Tw+eK8MAZnTESPSi0+cKjq+ZYimGqk/v5QRsV+1v9hEKHyqx0M9PHWsRNINL57yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787106380; c=relaxed/simple;
	bh=qazxamjoH2Xy1KPVpv0kZxqu4RKm+ETWt2t3cZLYUDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cY02PhhAPOOuk/iL4svch1NMY5yOMbb31sN+cmUljjfG9HtbiGCYme6XXAbB0vieunonExPJ32Uzc83h4v83G7l+U4J93Emi9LphyIhi46QnQDGS6kMakcdyHFw3hWQSlkwFwPligOs+dE2bHjTfKIKDyTMo4pIGwou+9vQWHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EA1poLMT; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EA1poLMT"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cc80544c74so1526415ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 19:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787106378; x=1787711178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5IxWmYwvN+ZrZRWP0i8YU26WhkfeAXlzQMWL7fTyjI=;
        b=EA1poLMTXKjUqkIfliyd1M14Ik25cPHzF/uyjpQNE7/fOCK7Ra16EF1bY7v4obz5WC
         nkznpCMFbui1tjExxfB9gongjX9qF+ZoOs+hqwiA0wRBOwBeSTzmswcVU+n772rolauY
         Mf6yO+TTHpm6PB1xfitZ4QRj47EeURHkWBYss215LPpdq5HIYKlOvrPjWYIelz4EKVXY
         4oyrSF+xPoRNunG/MrddA7v/TxgoM0m96T1265SV3fEHkLW4qwpaEF8OdQYSaVkxJNW1
         9y11+/q4U28J4YIceASes4hWTbCtHPm9JDTQLna5qHeH4zqyN8CiFAxiqZ0Ytp7TQIZ9
         zspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787106378; x=1787711178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5IxWmYwvN+ZrZRWP0i8YU26WhkfeAXlzQMWL7fTyjI=;
        b=LSv4ElZMCY+upeYQixen8V/Pj4k0dTO9QQtK1hJSmVsFjsnB8TpiUaoNlnVFATd5XG
         A5koGUo2DcK/gcQ+TSF3vSnOWPHbwRn0HUQeU2nEhOTQUhCzxGvhd9zAn+xeWTlcDuAk
         bZIo+BzAkF3oTUaOoYHWTK+fIZ6AHBQ99UqB8ljoe9mo075rVJgcdqViernjPW5fdjNR
         TWGSC1+dF2janhbCabaUXH8t/CZaV9OA2GFcS5FPBI0Xm2JqNccO5LUksVSe+gkXJtLc
         +F1a3hbuP2YUVbH4w13pKUtmHVzf+1Hg4B/gVJnwm9zFj/BWE3p5vVLMVMzmUV288uvg
         hl0Q==
X-Gm-Message-State: AOJu0Yz6Qucih7wjA+y2OCLoSbeW4s5F3sz2xjs5fu3A9YoVF+lhvtSR
	GdNyRRD+bwJxCZ1DyCpV2gjSqEESp60R8gXdY3mdnmOKTwo5ov2nUWxS6NQoWbvW8SpVxA==
X-Gm-Gg: AR+sD135WpTzdFZSNTcb2hee0SKj5VPzsiosS8FVwjDvFrBVM9jxHHkjoKSxWUhkZQG
	62mx5FGQV8Ml308Km5uOSZmD5Hc5tw+2S3DAVNJCl40dK+nXU5TvkkCaG27eUakPqCOSTBCTR75
	QBglmBZamQO+m5JQNztPsAJASEzGS0RmX4tOiWIWkAqdRux94lGgjcqeC6/C9lNRxjjwTovRy6L
	cWf0BaNT4w+pktoN9BgIjQB215nmU4p2R69Wq8csPkP10+eyn5RHaD/QLbthYSy2KjJ5vIp7T+h
	10Jrtn0+BGZ8+3u4Mt1W4UXnE3qbNBq4itJqqvUWzmUxYVt2NyoDi3bCyBxBvHBFipwMpR5lnMs
	LFJLboHFJiNPh3CanSWshiCilHN/yQKzW/qVauoapjr9YttMMlIp//UbrprVwkZQq0b8H8GXz90
	JqWgFtJGrYWlypq/va2+nW28IQuTlv1/8nrqe9yHFT9ycBDzyO0XpmEZDwiyndBHEyCj0=
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr2294894a91.13.1787106377629;
        Tue, 18 Aug 2026 19:26:17 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f84ee0asm328627a91.3.2026.08.18.19.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 19:26:17 -0700 (PDT)
Message-ID: <bcf4d827-fbd5-413c-8db1-c62232ce9641@gmail.com>
Date: Wed, 19 Aug 2026 10:26:12 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] of: reserved_mem: reject static regions
 overlapping no-map memory
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-3-chenwandun1@gmail.com>
 <20260818094051.50CD11F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818094051.50CD11F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The patch provides an incomplete fix for overlapping reservations, allowing a static `map` region to silently overlap an existing `no-map` region.
> - [High] Error handling in `__reserved_mem_alloc_size()` ignores the return code, leading to a Use-After-Free of physical memory if marking a dynamic `no-map` region fails.
> --
> 
> --- Patch [2]: [PATCH v2 2/5] of: reserved_mem: reject static regions overlapping no-map memory ---
> commit 5bad18fc3e691089fa21e129bf6cd3d6145676c4
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: reject static regions overlapping no-map memory
> 
> Static no-map reserved-memory regions are marked in memblock.memory rather
> than memblock.reserved. So the reservation overlap check does not reject
> a static region that overlaps existing no-map memory. Both regions can then
> be initialized and hand the same physical memory to different drivers.
> This commit rejects static regions that overlap existing no-map memory.
> 
> Link: https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 491d64d93d707..f25dc0cca2f06 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -152,7 +152,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>  		 * if the region isn't memory as it won't be mapped.
>>  		 */
>>  		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		    (memblock_is_region_reserved(base, size) ||
>> +		     memblock_overlaps_nomap(base, size)))
>>  			return -EBUSY;
>>  
>>  		return memblock_mark_nomap(base, size);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since this patch is fixing
> overlap checks, does the !nomap path still allow a static map region to
> silently overlap an existing no-map region?

patch 03 of this series fixed this issue.

> 
> If a Device Tree contains a no-map region followed by a regular map region
> pointing to the same physical address, the no-map region is processed first.
> 
> When the map region is processed, nomap is false, so it bypasses the
> overlap check updated here and directly calls memblock_reserve():
> 
>     drivers/of/of_reserved_mem.c:early_init_dt_reserve_memory() {
>         if (nomap) {
>             ...
>             return memblock_mark_nomap(base, size);
>         }
>         return memblock_reserve(base, size);
>     }
> 
> Since memblock_reserve() adds the region to memblock.reserved without
> checking for MEMBLOCK_NOMAP overlaps in memblock.memory, both regions
> can be initialized. This would hand the same physical memory to different
> reserved-memory drivers.
> 
> Should the !nomap path also check for overlaps against existing no-map
> memory?
> 
> 
> While reviewing the memory allocation paths, I also noticed a pre-existing
> issue in __reserved_mem_alloc_size().
> 
> [Severity: High]
> This is a pre-existing issue, but could this error handling cause a
> use-after-free of physical memory if memblock_mark_nomap() fails?
> 
> Looking at early_init_dt_alloc_reserved_memory_arch():
> 
>     drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch() {
>         ...
>         base = memblock_phys_alloc_range(size, align, start, end);
>         if (!base)
>             return -ENOMEM;
> 
>         *res_base = base;
>         if (nomap) {
>             err = memblock_mark_nomap(base, size);
>             if (err)
>                 memblock_phys_free(base, size);
>         }
>         ...
>         return err;
>     }
> 
> If memblock_mark_nomap() fails, it frees the allocated memory and returns
> the error code, but *res_base (the base pointer in the caller) remains
> set to the freed address.

The reason of memblock_mark_nomap fails only can be out of memory, and this would
trigger panic because memblock is not allowd resize before paging_init.

> 
> In __reserved_mem_alloc_size(), the return code is ignored:
> 
>     drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
>         ...
>         ret = early_init_dt_alloc_reserved_memory_arch(size, align,
>                                                        0, 0, nomap, &base);
>         if (ret == 0)
>             pr_debug(...);
> 
>         if (base == 0) {
>             pr_err(...);
>             return -ENOMEM;
>         }
> 
>         fdt_init_reserved_mem_node(node, uname, base, size);
>         ...
>     }
> 
> Because __reserved_mem_alloc_size() ignores ret and only checks
> if (base == 0), it will proceed with the freed memory and register it via
> fdt_init_reserved_mem_node(). The page allocator will hand this memory to
> regular allocations while a reserved-memory driver also uses it.
> 
> Should this check be if (ret != 0) or if (base == 0 || ret != 0) to
> properly catch allocation failures?
> 

