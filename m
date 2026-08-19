Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9223AAF4B
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 03:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109383; cv=none; b=qnNnK83NANC95e8YX8wVuR6nAafYbiqmN7hR3RWEum+TpxUiaKVNk+UEDuAf5MQc91HcHQdKHwNSNL1hpJWks8oiV4Y1i+BnUY+rWcgvozzfjrmSbldyoakXNt2YFwPhWj7R/kQMcfA/Ohxzo7fwfwHBouPLT28xGCepB6tn3dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109383; c=relaxed/simple;
	bh=Og/uutWqSXDMpsCRwyQ5y4UVlDXT8nuIVOfBTHEmw6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCMMlSGEc/1bQARHCA624yqRwpUa65KllFJIw1XGp4nqHZ08zlUiaNgUeErzPGJJ8aSXAv4mcFb4YziqAGhMA+jlxGiZQypoNveYcxlNxdDQgXRmR6YX+MNdjw/xgcUyFGZr6DMsaC8E3DVDNWHcrdlQXDU+is/G6cjBG1IxewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XE6et2sX; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE6et2sX"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so181613a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 20:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787109381; x=1787714181; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7sdpc4i3FhZtnK/5yqCR/sO4q2wvmyIj6tyoETyR9k=;
        b=XE6et2sXCmwHdXjH5ZI1Rey+RQaG7cS12w5o9czTfsQhMGBswuvUyFNH79X6Ze/8ML
         iN6W7pOwh+i69WHSDMTB5l65li3h/yAcZI93ZiHugD+JpEBm/epVf7XUOn9gXFovMkFt
         Bm3DZEqexJxKyfwk0hUoAbO81KgKTqfeiy0nkVb6fKIcMJ4U80WzVMNel1LawF8oWDtp
         PYq01pioy9ANFL/th3SD+AXOTt9Qg0URTPYozHk24vFKRiRz8Ihe1StRvDwO9dy7SYAy
         vR56SXO59g1MvBS+scQ7M+YQYVrYdKzEEpq5fugu12hGHqsGpD/h3CA1NRIkrcA6HUev
         BvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109381; x=1787714181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7sdpc4i3FhZtnK/5yqCR/sO4q2wvmyIj6tyoETyR9k=;
        b=QTfHJVLNPIG1dlkEvlsvC7fkcosBd35fnJfpaFB4frytqWgTcLRqebJgN2OjrE8VYo
         ZNJIwzX/g3j7SpYt18h9lmhqdlwn+mDYUlde4QYCER4XEHcq3XMzxrUWJuDCnDPb1bvM
         2/u9WHyfprh8UiQk/1JZM8V42Vr8YRlm+L+jrODsPI1fTKPlmYn6W5CzUNqcuRKqoQTN
         3GMbnOuDWpcfXhl4Q7hsSbphMjaBSJ/H909/LkhPSoGF4BYggR96Z0IzeKAxhWUNTD9J
         nR01v8cNPKQQF4Z//2MiHVuguPj6+1bPDlC/OvbVzODUhSLobvv7sR+iFnny16nfOAtr
         a0Kg==
X-Gm-Message-State: AOJu0YwC4FtlC5cZ+uqNp6x2QLgqjpUK/hsjJ7v1l7toMb7coOx2nna2
	VcyVj0yy0dguQTgakMtG8SPAQ2U4FyxwAA3mSKN33gnI4xpqRcrmkrcygUEDB13q7qChYA==
X-Gm-Gg: AR+sD13lEpfSPaMcDH14/p5Ji9ctX8eL9Z7gJrWUa9ZmLFZQJtMqzxMRGhbzap5PoAi
	6otHpANh7Tsni3OL+U2uQCp6RYx+FVADgiYDTQnZqd/RvZkQy2+erWhzjY206k/Rls7dqWkVwXr
	p3295iRCVV5bycl2UiEx9riUIAznBlp0GVIWougmSZcpXgKr4YF15vvSO1FGkegbcN3TBUMnhTs
	91+EgTlWtdkApBqp6umFzX9HfzpgK6+uYSgzynpROrF+61ocqJzI5FYWVq3KG/9ziFaUmJgzc/t
	KXOfP7lbtsIsVugRQWZN8y4pgsXPS8z4bhQKiHz10uR26BSmiPzQMn3LOWYr4UYNKHhMT1BYesz
	39ZgnkUFP8Wa9xcBDZVvmj+81UNNOo5K8P+CsBPANpygmVMgIc7vhmDB1oG4VyzWotUtWZ1zoTR
	AeZ2DWWFjeVAG70Ob4/u037jK7RarAKiMmxqPgJhbusMmF+8ovGuO2GC8WXJNByTFngOg=
X-Received: by 2002:a17:90b:1e53:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-39580ecefbemr2777693a91.1.1787109381266;
        Tue, 18 Aug 2026 20:16:21 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ad013sm846585a91.7.2026.08.18.20.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:16:20 -0700 (PDT)
Message-ID: <71b25c0f-9efd-4d8f-9bca-6d2d267d5ed7@gmail.com>
Date: Wed, 19 Aug 2026 11:16:16 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on
 init failure
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-6-chenwandun1@gmail.com>
 <20260818093450.AE0AB1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818093450.AE0AB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] In `__reserved_mem_alloc_size`, an allocation error when marking a region as `NOMAP` is ignored, leading to a use-after-free of memblock memory.
> --
> 
> --- Patch [5]: [PATCH v2 5/5] of: reserved_mem: retain static no-map memory on init failure ---
> commit 35ad8d6e4b86dc63d754a8415950fc7ab54dfce4
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: retain static no-map memory on init failure
> 
> Clear MEMBLOCK_NOMAP only for dynamically allocated regions on init failure.
> Static regions are initialized after paging_init() and should retain their
> memory states.
> 
> Link: https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index a0df075a9902e..0c5163ce601ea 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -708,7 +708,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
>>  		pr_info("node %s compatible matching fail\n", rmem->name);
>>  		rmem->name = NULL;
>>  
>> -		if (nomap)
>> +		if (dynamic && nomap)
>>  			memblock_clear_nomap(rmem->base, rmem->size);
>>  
>>  		if (dynamic || !nomap)
> 
> [Severity: High]
> This is a pre-existing issue, but while looking at reserved memory error
> handling in this file, I noticed a potential memory corruption when dynamic
> allocation fails.
> 
> In early_init_dt_alloc_reserved_memory_arch(), the base address is assigned
> before the nomap check:
> 
> base = memblock_phys_alloc_range(size, align, start, end);
> ...
> *res_base = base;
> if (nomap) {
>         err = memblock_mark_nomap(base, size);
>         if (err)
>                 memblock_phys_free(base, size);
> }
> 
> If memblock_mark_nomap() fails, the memory is freed, but *res_base still
> holds the freed address instead of being cleared.
> 
> Then in __reserved_mem_alloc_size(), the code checks the base address instead
> of the return value ret:
> 
> ret = early_init_dt_alloc_reserved_memory_arch(size, align,
>                                                0, 0, nomap, &base);
> if (ret == 0)
>         pr_debug("...");
> 
> if (base == 0) {
>         pr_err("failed to allocate memory...");
>         return -ENOMEM;
> }

Repeated questions;

The reason of memblock_mark_nomap fails only can be out of memory, and this would
trigger panic because memblock is not allowd resize before paging_init.

> 
> Since base contains the freed address instead of 0, does this allow the
> freed memory to be registered and later handed out by the buddy allocator
> while still being incorrectly used as reserved memory?
> 

