Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED046DFE8
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346627; cv=none; b=tQcq7dGrXQqYT7lS4DPwWfJWZOfVPJiPsob5+wA3p5MPPzQ72Sb3PfzN/PiL5q3e5tC9aVh6gHiLJzUTS2UxNqJ/CI2G+RFPQ/F9eEGI/ljbM1X8BiS4Q56ix0VDvcBEQ1EKjyp+f+TkLqcSWvd0B/vsHJKrr/Y5qUbstxv9QZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346627; c=relaxed/simple;
	bh=yZfhVXO7hoGecA5+JlolbWRIrJDHn8yxChXKAoxhxzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlqSC3N1x/83l09hul8vdq1yaHvPIJFmv4u1I519gekhBflsheHKCzZOnUqHSt469jjPVNmUIsn7qH27xCv7YBgvXbgIhuryTLqvXar0ZHhXRG8DsqaHYWhBNZj8CclBtdxI0xN5n021cEeTcSrOwYD/sIKWpVUe5XyNt68zZ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBVBnRMJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBVBnRMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788346622; x=1819882622;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yZfhVXO7hoGecA5+JlolbWRIrJDHn8yxChXKAoxhxzA=;
  b=WBVBnRMJgkUkddDqpIsaWsuvlzN3Dbr14MJd5oaYgLoo+WztAEHLdd/j
   xozrXW6Y3Z8ZNeDuhtsDRuWhjs51PCpdnLPjqRVXgZ89kV4mOWZBPbNiU
   T+GfS7jS/qttYh6utK7NKNvc9582H0LQ+aJo8ID0Nyn5zTOlCUZfpuAVS
   pm2g2d2TMF6wZ6P7BCcAvp7db9285B3lSvu2GTMf5T0QIPUBh0ctZZ/8J
   MibnopVeXkTU/kQPRQ40LBmZ5+TX49xkYuvSd7t+foA8HqlNaoAFnmdTJ
   C4vLa2zBSxyFPoUkNsyIXTwLX3WvGF5dPK9WIqGrKZ0YqOf6QdnXNo7l2
   w==;
X-CSE-ConnectionGUID: QF3UDt7XReGmYed8nf4e8Q==
X-CSE-MsgGUID: MBKmmr9CQD2JvpRrASI49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="89008139"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="89008139"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 03:56:58 -0700
X-CSE-ConnectionGUID: rlbgJe04Tpinpj2kAyILzg==
X-CSE-MsgGUID: XgWcqXg0Qg+v0p6gSCBY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="271341966"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.174]) ([10.245.245.174])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 03:56:56 -0700
Message-ID: <74a63306-9fda-47fc-b5ea-779d6652fbcd@intel.com>
Date: Wed, 2 Sep 2026 11:56:54 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe/vram: revamp CPU VRAM mapping
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260902103931.826063-7-matthew.auld@intel.com>
 <20260902103931.826063-10-matthew.auld@intel.com>
 <20260902104936.63BA71F000E9@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260902104936.63BA71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 11:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The commit intentionally leaves the global VRAM mapping (`xe->mem.vram->mapping`) uninitialized (NULL), but the display panic handler (`xe_panic_page_set_pixel()`) still attempts to use it. This will cause an invalid memory access during a kernel panic, resulting in a nested fault and preventing the panic screen from being drawn.
> --
> 
> commit c5769f31bf8cec4dae25246aba506ccb4445b29b
> Author: Matthew Auld <matthew.auld@intel.com>
> 
>      drm/xe/vram: revamp CPU VRAM mapping
>      
>      Previously, we called devm_ioremap_wc() for the entire PCI LMEM BAR (which
>      can be significantly larger than usable memory, e.g., mapping 16G for a
>      10G card), and then simply assigned subsets of this global mapping to each
>      tile. By moving the devm_ioremap_wc() call into vram_region_init() and
>      mapping on a per-tile basis, we restrict the virtual address space to exactly
>      the usable_size of each tile. As a consequence the global vram->mapping is
>      now NULL.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 56cff1e44530b..04d831b101bd1 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
> [ ... ]
>> @@ -257,8 +254,15 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>>   		return -ENODEV;
>>   	}
>>   
>> +	if (vram != xe->mem.vram) {
>> +		struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +		vram->mapping = devm_ioremap_wc(&pdev->dev, vram->io_start, vram->io_size);
>> +		if (!vram->mapping)
>> +			return -ENOMEM;
>> +	}
>> +
>>   	vram->dpa_base = lmem_bar->dpa_base + offset;
>> -	vram->mapping = lmem_bar->mapping + offset;
>>   	vram->usable_size = usable_size;
> 
> [Severity: High]
> Does this change break the drm_panic display handler by leaving the global
> xe->mem.vram->mapping as NULL?
> 
> Looking at drivers/gpu/drm/xe/display/xe_panic.c, xe_panic_page_set_pixel()
> appears to explicitly use the global vram->mapping to compute the IOMEM
> address for drawing pixels when the framebuffer is in VRAM:
> 
> 		if (xe_bo_is_vram(bo)) {
> 			/* Display is always mapped on root tile */
> 			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
> 
> 			if (panic->page < 0 || new_page < panic->page) {
> 				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
> 					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
> 			} else {
> 				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
> 			}
> 			iosys_map_set_vaddr_iomem(&panic->vmap,
> 						  vram->mapping + panic->res.start);
> 
> If vram->mapping is NULL, this could cause an invalid memory access when
> dereferenced by iosys_map_wr() during a kernel panic, resulting in a nested
> fault and preventing the panic screen from being displayed.

Indeed. I think we can just go via the root tile instead.

> 

