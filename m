Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E537B3FD
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108415; cv=none; b=ksiFV0+ZZ/6MTw0dZq60xMhZ/eS3WQ7OageRUTq6LmlPtnwMy2ZGKD8mKVYylbbv+WtH8Wbu1FkcWvyZ+9O7RBuZs+Ir8G0BkcoWou+FCdJcLWPU5eFOoaqoiRs4bIsepMT3tAvvE6ntt0ZobPakr786gY1JoUz62rcDK6yAX6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108415; c=relaxed/simple;
	bh=uoUk/aB5fKHLhryejIsePpRpP1N7d/vNO1dojbDyZ0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+Ku5e18yWcjVQSapUIIS5LPIFEYFOs2tbVmw/rddVJobH8qvac1Ui0jFnD7gitAXwwIPiRaIu7WVYnj8EWwAJjMvDfXIYAaxnsTDnqh/7NOY+YbjuPpXOsPAl0DxsAPHhim208PFUCayq9LHpYITZZ0+tYaGcIG1z4qO6nbdFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lh5uKoA0; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh5uKoA0"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3931e624fd8so334514a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 20:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787108414; x=1787713214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/s+WgwMhL7g0fvO+KmgpqMPlBiPlJyg+BspueFKHDcE=;
        b=lh5uKoA0hhXkARA0f9msD8wsJ/gMz2XrsuuvESt1U8Ldf8X8HB9AYmO/o8NVExl33Y
         k5aiZUOkuxjjHaiOgAANtQgpIGNiUKp4sD8p0ydN4g5FhK7zlPICqW+A1aKx7zl62dtI
         ZKAoGSEQ6gpLcRMGw+1L7p9fddyhlZkPxR+RZKqC3wPCulG2x4w8dzpcet6eg4RcPfN+
         n+SVlsACcdLPx2j3lsWKkljf3fbyowNRV1FQgPzsA+MDQ4KsQL6hBH8xrY9mAEf+HIP7
         jfVy+UtczR5+D3PwWEdO5QD4GIy1KB1Aqolh9OSRVJ9EGmJbJ4OP7CI3Wx+FHG+cYD4y
         duCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787108414; x=1787713214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/s+WgwMhL7g0fvO+KmgpqMPlBiPlJyg+BspueFKHDcE=;
        b=W11nDoAUrVLb4mBvSpiLS9NRC4iThEWVRb5q6Hk4wT4SgEiv2bzEt1zpjhI5QcaNkZ
         WzOBzHhSsvU+dfI/N6tvAIlKCoHmoVzjISl9cnMpUEStdvO+rQz4Z39Sjt4oHB/6csdm
         gUfoZlF60Bcy0DcEsNR8eOEN1ndgwLzvO3Or3NvAoYUGZGW8cOe43htw8JXvCmSI8F1j
         JHadj42trsje8IHWFw3vYzq84VFSpfC+wXXESPHTGMSxRoQfj4k57NpLBXJUSgc5lSwA
         oFbgN27mRWgsHdr8HMPYz9XWla8/ESDBst4NrSEi3RBCPSPfIXOQkmOecIjY3uvESd9X
         sXiw==
X-Gm-Message-State: AOJu0YySCR3p3uv5/cmBtwdY+AfFu8KzxNzDSJDeIphfAaYBNZzkGe7v
	S0NNKLSyRESa8XxkkoIr0ZemrlN1MsGUCXW9hw13ROO1DASK5VivjjStzrvL3RvKFowhFQ==
X-Gm-Gg: AR+sD103uIjfxO8RWLD2HqeKPQ/skWB5rAjCqkiI/uzobSGylBlgkrC2Hkhp8qV64zy
	ynultWDeTabHhuGaxxk+VTZBw+urYIwptRk6bk+P0gmPew/BrMLvBEGJQ7V/kQw6uENN6Imqqut
	ewpbY7sjdKk4K9yYZ6UTHgIR8dLbdDF7gr0tIC3atoz8rANuAArJHzufvtnzYBPUjngcm8uq44Y
	iLPNYhj8nA38DrxRW+Dhx2St2BUTc59vO6HaMYEMmfgknHoPXVeL9MBy72xn23wlkwHlSK0sASM
	aimQr6NoPobUVs5R7LP5EJRtbQOlT2JQif2gPwzDRRlVakbJmgwYfOgaZVU1mFpFTH4TtGsIa2b
	rcSc3bCe/cDisZzA5z2EqQPDO0ZTONWRT5HsvktE3x5B5+lgVKwN3mokvbdwPnr5lfN8X6XkdI8
	9uCzDngUkqivtF+EomTUZTptnnPEvEigvXCsmQHxDdZ2bpqBKYuQHWkTtxw5F57V3VSgU=
X-Received: by 2002:a17:90b:1cc3:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39580ace560mr2873329a91.6.1787108413350;
        Tue, 18 Aug 2026 20:00:13 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb17f48sm941929a91.2.2026.08.18.20.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 20:00:12 -0700 (PDT)
Message-ID: <a27cdb1d-6b79-4a04-b9d1-af7d5477ad51@gmail.com>
Date: Wed, 19 Aug 2026 11:00:08 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] of: reserved_mem: reject statically placed regions
 overlapping existing reservations
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-4-chenwandun1@gmail.com>
 <20260818094117.8D2471F000E9@smtp.kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260818094117.8D2471F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/26 17:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Rejecting overlapping memblock reservations up-front breaks platforms where memory is legitimately reserved early (e.g., by EFI or architecture code) and then described by a DT reserved-memory node.
> - [High] An array overflow in `reserve_failed_nodes` bypasses the failed-node skip logic, leading to memory corruption.
> 
> Pre-existing issues:
> - [Critical] Dynamic allocation of reserved memory regions ignores internal failures, leading to initialization of freed memory.
> - [High] The patch fails to prevent overlaps with `/memreserve/` entries, leaving the memory corruption bug unfixed for those regions due to execution ordering.
> - [High] Dynamically allocated `nomap` reserved memory regions are permanently leaked if their initialization fails.
> --
> 
> --- Patch [3]: [PATCH v2 3/5] of: reserved_mem: reject statically placed regions overlapping existing reservations ---
> commit 1c8f1d8c03461ed83a10e5698047d85d76387f8b
> Author: Wandun Chen <chenwandun@lixiang.com>
> 
> of: reserved_mem: reject statically placed regions overlapping existing reservations
> 
> This patch rejects overlapping memblock reservations up front for
> statically placed regions, preventing them from corrupting memory if
> initialization fails. Dynamically allocated regions are unaffected.
> 
> Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
> 
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index f25dc0cca2f06..71a879628c4aa 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -158,6 +158,11 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>  
>>  		return memblock_mark_nomap(base, size);
>>  	}
>> +
>> +	if (memblock_is_region_reserved(base, size) ||
>> +	    memblock_overlaps_nomap(base, size))
>> +		return -EBUSY;
> 
> [Severity: High]
> Will this upfront overlap rejection break platforms where memory is
> legitimately reserved early by EFI or architecture code, and then described
> by a device tree reserved-memory node?
> 
> If architecture code like efi_init() on ARM64 cleanly reserves memory using
> memblock_reserve() before fdt_scan_reserved_mem() executes, the new
> memblock_is_region_reserved() check will evaluate to true and reject the
> node unconditionally with -EBUSY.

An EFI memory-map entry and a DT reserved-memory node may describe the
same physical range, but they serve different purposes and do not provide
an ownership relationship to the kernel. So the kernel cannot safely
treat an existing memblock reservation belonging to the DT node,
especially when the node fail to init and release that reservation.

> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this overlap check miss
> /memreserve/ entries entirely due to execution ordering?
> 
> In early_init_fdt_scan_reserved_mem(), fdt_scan_reserved_mem() executes
> before the /memreserve/ blocks are iterated and reserved. Because of this,
> when memblock_is_region_reserved() runs here, the /memreserve/ regions are
> not yet known.
> 
> If a reserved-memory node overlaps a /memreserve/, it bypasses the check.
> If the node's driver later fails initialization, its error path executes
> memblock_phys_free(), which will still wrongly free the /memreserve/ memory.
> 
>> +
>>  	return memblock_reserve(base, size);
>>  }
> 
> [Severity: High]
> Can an array overflow in reserve_failed_nodes bypass the failed-node skip
> logic?
> 
> If the MAX_RESERVED_REGIONS limit is exceeded, record_reserve_failed_node()
> returns false. The fallback logic in fdt_scan_reserved_mem() then
> increments count instead of skipping the node:
> 
> drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem() {
>     ...
>     else if (should_record_failed_node &&
>              !record_reserve_failed_node(child, uname))
>         count++;
>     ...
> }
> 
> Later, in fdt_scan_reserved_mem_late(), reserved_mem_node_reserve_failed()
> returns false for this untracked node, passing it to
> fdt_init_reserved_mem_node().
> 
> If initialization fails, the error path frees the memory, potentially
> corrupting an existing overlapping reservation.

If too many nodes init fail, it will fallback to the current behavior.

> 
> [Severity: High]
> This is a pre-existing issue, but do dynamically allocated nomap reserved
> memory regions permanently leak if their initialization fails?
> 
> In early_init_dt_alloc_reserved_memory_arch(), dynamic regions are added to
> memblock.reserved. If driver initialization fails in
> fdt_init_reserved_mem_node(), the error path only clears the nomap flag:
> 
> drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
>     ...
>     if (nomap)
>         memblock_clear_nomap(rmem->base, rmem->size);
>     else
>         memblock_phys_free(rmem->base, rmem->size);
>     ...
> }
> 
> This completely omits the memblock_phys_free() call for nomap regions,
> creating a physical memory leak.
> 
patch 04 of this series fixed this issue.

> [Severity: Critical]
> This isn't a bug introduced by this patch, but does the error handling in
> __reserved_mem_alloc_size() ignore internal failures and lead to early boot
> use-after-free issues?
> 
> In early_init_dt_alloc_reserved_memory_arch(), the output parameter
> *res_base is populated before calling memblock_mark_nomap():
> 
> drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch() {
>     *res_base = base;
>     if (nomap) {
>         err = memblock_mark_nomap(base, size);
>         if (err)
>             memblock_phys_free(base, size);
>     }
>     ...
>     return err;
> }

The reason of memblock_mark_nomap fails only can be out of memory, and this would
trigger panic because memblock is not allowd resize before paging_init.
> 
> If memblock_mark_nomap() fails, it frees the memory but leaves the freed
> physical address in *res_base.
> 
> The caller, __reserved_mem_alloc_size(), ignores the return code and
> checks the base address instead:
> 
> drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
>     ...
>     ret = early_init_dt_alloc_reserved_memory_arch(size, align, 0, 0,
>                                                    nomap, &base);
>     ...
>     if (base == 0) {
>         pr_err("failed to allocate memory...");
>         return -ENOMEM;
>     }
>     ...
> }
> 
> Because base contains the freed address rather than 0, the check passes and
> the freed memory block is incorrectly passed to fdt_init_reserved_mem_node().
> 

