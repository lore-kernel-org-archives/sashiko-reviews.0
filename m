Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699D4A2071
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359810; cv=none; b=bWgD1ufxcTRymGW74yfYhvyn2luaUTS/bwvsNSRvJRy4bFWfl2YsAyKYGCEXsN8H7XJDZ6CJqUBps535YxdnTIk8praLPhCNS+4xbhBF70hd4YgPktWiHo7VN8S0YedM2ltohdgw/JenVfUq/7VejZeYdBJyLPk5zyLnaalybUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359810; c=relaxed/simple;
	bh=tzSkLlseCDwogDPQUmH8XLhXlBQfkVYvp/zSZw1UfD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/rBHpas7jfsSaKT2OBHsXvDm2OJexhh+pGsObOKzVmbxBmVydODA9hUwNO+E0XvVHgbcxzSa8om/ej5m2c+DZa0KdvjrvbM+YhRFew+F9K1rAb+6loWZhIDYapfxEpf7aiJKmF2Vev5FdiYpiFVFwBShZK+cylVwdED8bQ6kAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLqhhffi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLqhhffi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788359809; x=1819895809;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tzSkLlseCDwogDPQUmH8XLhXlBQfkVYvp/zSZw1UfD4=;
  b=gLqhhffiIHMCVe9esJqMTW79JJ7ytGhH/L1ru7dk/2Pi1X0355XUTjNC
   z+eKka6XWo8OYeJcExiiwLteYk7dRPXGG+Uh+daJ/uddwTV/5S4bQH9nw
   2grwUbRAUmgUTLhdozu5j+y419zLi/QvjdVSitD2fqijWfqYB/64tkjTL
   gcaK7wvRSWqKwIHA0F+AdUA7hZN8/9sakx/A0fpZdyY63NC6SGFCXVYDh
   69S/voLTIQUfpyVAR6bpH1wMMBOdTvvBr2HjJyeLMRO7aZGNid/9kjdYx
   TVz83bh8z9hW7qLHnlh8Ymk/Ya3AI3Y5zPGU+fdaTqMDl6cScHTBUbk8e
   Q==;
X-CSE-ConnectionGUID: WWBVzCu3ST67jIVMT70bDw==
X-CSE-MsgGUID: 3Z1XZre1SDCYCdPYuwrVJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88945067"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88945067"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 07:36:48 -0700
X-CSE-ConnectionGUID: rs35QUJlQd6KbgL2iaoLmw==
X-CSE-MsgGUID: gs0hHtCKReqFEKgFbkMLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274699551"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.174]) ([10.245.245.174])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 07:36:47 -0700
Message-ID: <ec26b63e-9201-42dd-a5b1-129664e4cb0e@intel.com>
Date: Wed, 2 Sep 2026 15:36:45 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/vram: revamp CPU VRAM mapping
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260902124117.918018-7-matthew.auld@intel.com>
 <20260902124117.918018-10-matthew.auld@intel.com>
 <20260902131208.497C81F000E9@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260902131208.497C81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 14:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The panic handler incorrectly computes the virtual address for stolen memory framebuffers, silently corrupting normal VRAM instead of drawing the panic screen.
> --
> 
> commit 122b98d2306bc2a11fb8cd83e0ebcab780bfb24e
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe/vram: revamp CPU VRAM mapping
> 
> This commit moves the devm_ioremap_wc() call to vram_region_init(), mapping
> VRAM on a per-tile basis restricted to usable_size. It helps catch
> out-of-bounds CPU writes by placing a guard page at the end of each per-tile
> mapping.
> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
>> index 12c6fb99015dd..1a6cee25e9d76 100644
>> --- a/drivers/gpu/drm/xe/display/xe_panic.c
>> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
>> @@ -52,7 +52,8 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>>   	if (new_page != panic->page) {
>>   		if (xe_bo_is_vram(bo)) {
>>   			/* Display is always mapped on root tile */
>> -			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
>> +			struct xe_vram_region *vram =
>> +				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
>>   
>>   			if (panic->page < 0 || new_page < panic->page) {
>>   				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the panic handler
> incorrectly compute the virtual address for stolen memory framebuffers?
> 
> When a kernel panic occurs while the active framebuffer is in stolen memory
> (XE_PL_STOLEN), xe_bo_is_vram() returns true. The code in
> xe_panic_page_set_pixel() then adds panic->res.start (which is an offset
> starting at 0 within the stolen region) to vram->mapping (which maps normal
> VRAM) slightly below this hunk:
> 
>      iosys_map_set_vaddr_iomem(&panic->vmap,
>                                vram->mapping + panic->res.start);
> 
> This could silently corrupt normal VRAM instead of drawing the panic screen.
> 
> While this is a pre-existing issue, restricting vram->mapping to
> usable_size in this patch makes it structurally impossible to fix by merely
> correcting the offset, as the stolen memory region is explicitly excluded
> from the mapping.
> 
> Should the panic handler be updated to use xe->mem.stolen_mgr->mapping for
> XE_PL_STOLEN buffers?

xe_bo_is_vram() will only return true for dgfx + stolen or normal VRAM, 
but we would never want to put frame buffers in the stolen part of VRAM, 
and there is no path that would lead to such a thing. The stolen part of 
VRAM is quite small and is a precious resource for stuff like FBC.

It might be worth checking for this in xe_panic_setup() to make it 
bulletproof though.

> 
> [ ... ]
> 

