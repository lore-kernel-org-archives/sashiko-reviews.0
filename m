Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964850;
	b=PQb0XODExEPPnZjQ5sZuMsSqvMmSD9yVjrFX9baVUjUtMKkI+uFa3tdpf6wOAQ5Qvw0J
	 m5y4WGjzuTV7/EY60XU5QQMYU+EuAuTAv7jSLFGGHMC0SnGF9SxSNAINWUN8DsRvOiNST
	 naGWmiDgELQ67KTgcbH/oWv7xSxU2gW4BQrU9FBbW5S4K6+AwxxAgvaeE+22KFyafVS47
	 5HwLJw/o4fEzxSnN9smF9/Jrh4bmCUSwq2oXZhSjOvaFmJUZR2bke2JQnrMAwJO76sKgX
	 kic+vdU3wv6oC/CS9I7s2s4f8nP8KqwRWWA814WF7iA0c58VfkTqj5XgU2lWnNFykfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=FhaKFHNEYiSspsEoid5yH3BuazmIpz85kwG+y9S6ndo=;
	b=QEGO9W2/Xat1tapA7GzBq0kky4UcUZjmggR7Jhz7IErjGNUPNJJcRvaWHd0XN+mfmdWU
	 TglpH2cWdqLzNpdsy5FtaZpiyz32eHOO/Wk6nl3hMljx8WJ7q0VlHpmeyl8o4T3LejeSp
	 uJh65n4hhYuOJDMsKmpoDDUhebtUJkchrey8f3VaODNHJcGqdSzmRFoseOj1wwwO7dda1
	 Ovto3+O5r5Xem90bQNyf3DVyZVyssneLV0K8OTIT81cjI4crs4JJtgbaCE8yY+FAPi8qo
	 /007lKBZS3Z9UJR3Ohr27ZvMDZXwfupP3rwuPlNEdi2XMZK6UhhWCcaVRqwNH8uIWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YSN8FVOZ;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A24606DA63
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 11:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A24606DA63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YSN8FVOZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793964850; x=1825500850;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=OU8LORpv/JPtKiGpjOZWOek9BLcyYj9TMYov7UNirQQ=;
  b=YSN8FVOZAnzqbAM7EFW9ye5Eu17z+qk2+aXuW0/157t7o+RAu3FfF4gf
   gB5WUF6EvmcvRjbBy40vUxLfV3LN0FDYHpEOpqmxlSO4CYocROqkDyM4U
   2k7vQEpiv88ir3cNDHR61jHQ6BkTbeTcMRxa3PVmAstgkAS17BnRy1gBP
   /5GBtFmTGTRDacrqinz3ICCz9z6K+8YTa7N5LMNVseIF1JHSVuBHu/ed4
   HhMxDWXjkWL16CsbMeXiEgRIv1R0qU2YdFgfIPJPHsrwOUTw5/es8QO6f
   0e75PQEbM42wCNfFLKJz+/PdoVR9l3QUJTY6phUXjWP+QduMDnXj8wtoT
   w==;
X-CSE-ConnectionGUID: +yMvaIXlThKZPAuE6LGV4g==
X-CSE-MsgGUID: 49SmgYscTceQoxoFteP5ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2654234"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2654234"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:34:10 -0800
X-CSE-ConnectionGUID: /N76a2OQR6y8f78gAK5weg==
X-CSE-MsgGUID: s3HYOVCtRhGW6LXitsqiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7307084"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.124]) ([10.245.245.124])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:34:08 -0800
Message-ID: <66546b6a-a4a7-4333-b289-ae2c4f429d86@intel.com>
Date: Fri, 6 Nov 2026 11:34:06 +0000
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
Subject: Re: [PATCH 1/2] drm/xe: only evict CCS buffers from TT on iGPU
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261106-s4-opti-v1-0-5edaea2c6d31@intel.com>
 <20261106-s4-opti-v1-1-5edaea2c6d31@intel.com>
 <sashiko-outbox-201230@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-201230@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 10:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/xe: missing ttm_bo_unmap_virtual() before xe_ttm_bo_purge()
>    in eviction
> --
> 
> commit 0a382553920cfe97389f0ff2b7a78f7419640c3e
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe: only evict CCS buffers from TT on iGPU
> 
> This commit changes xe_bo_evict_all_user() on iGPU platforms with Flat CCS
> to walk the XE_PL_TT LRU and only evict or purge buffers with initialized
> CCS state rather than evicting all buffers in TT.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
>> index 7661fca7f278f..1f95769c4a562 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> [ ... ]
>> @@ -104,8 +106,46 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
>>   				    xe_bo_notifier_unprepare_pinned);
>>   }
>>   
>> +static int xe_bo_evict_all_ccs(struct ttm_resource_manager *man)
>> +{
>> +	struct ttm_operation_ctx ctx = {
>> +		.interruptible = false,
>> +		.no_wait_gpu = false,
>> +	};
>> +	struct ttm_lru_walk_arg arg = {
>> +		.ctx = &ctx,
>> +		.sleeping_lock = true,
>> +	};
>> +	struct ttm_bo_lru_cursor cursor;
>> +	struct ttm_buffer_object *ttm_bo;
>> +	int ret = 0;
>> +
>> +	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &arg, ttm_bo) {
>> +		struct xe_bo *bo;
>> +
>> +		if (!xe_bo_is_xe_bo(ttm_bo) || ttm_bo->deleted)
>> +			continue;
>> +
>> +		bo = ttm_to_xe_bo(ttm_bo);
>> +		if (xe_bo_is_pinned(bo) || !xe_bo_needs_ccs_pages(bo) ||
>> +		    !bo->ccs_cleared)
>> +			continue;
>> +
>> +		if (xe_bo_madv_is_dontneed(bo))
>> +			ret = xe_ttm_bo_purge(ttm_bo, &ctx);
> 
> [Severity: High]
> Does calling xe_ttm_bo_purge() directly without ttm_bo_unmap_virtual()
> leave userspace CPU mmap PTEs pointing to freed backing pages?
> 
> When a CPU-faulted BO is marked DONTNEED via xe_vm_madvise_ioctl(),
> PTE invalidation is deferred until the BO is moved or purged.  Previously,
> ttm_resource_manager_evict_all() went through ttm_bo_handle_move_mem(),
> which calls ttm_bo_unmap_virtual() before invoking xe_bo_move() ->
> xe_ttm_bo_purge().
> 
> Calling xe_ttm_bo_purge() directly here runs xe_bo_move_notify() (which
> only unmaps kernel vmaps) and then calls ttm_bo_validate() with an empty
> placement, which goes straight to ttm_bo_pipeline_gutting() and frees the
> pages back to the TTM page pool without unmapping userspace CPU PTEs.
> 

Indeed, missed this. Will fix.

