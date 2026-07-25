Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3946427732
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985007; cv=none; b=XqbdjE36j9Mr3IEaIUVJudh+u8AkWf4b0RXxV9iwjATQ45DLWnVIzMW1QrruPZZSyERgxYHRw0PCfBIdsd8TDuv3NMxu3MhnuE+Sq8YDHCgsTc4qpYz22d5Ek2EaflWGyxRthjF0TT1/YFMiR44qA6BSMqIAT8oHtzhwRTEKWMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985007; c=relaxed/simple;
	bh=fn38n7OwobX0A3IvnGh6+SUuhT+vVsD5viO1WGB3/cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1RIkUfWK7tmvfKPW7yan+aKUB40cS6jZ5zqpPHl+vD71AaEzJo29VIIl2ZxlSQFuxIS8ikuaxZv24FyJ+bC4AZctWG55Tjsu/+7PCTNlo2PJOyqdKhh1+v+qfMdv5ZZ9B9+pXCUsapyR93116HvWEnH12aF31fNApcJWkjoeOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GURuKYJZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GURuKYJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784985006; x=1816521006;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fn38n7OwobX0A3IvnGh6+SUuhT+vVsD5viO1WGB3/cI=;
  b=GURuKYJZcQQdxPYOVB8tQB1+YbKyrpFt5DnmnmTR6VD0RTbgNCPU67+I
   nMabae2h1FpvOG0sVnqEha43DS9qyGicxbT4WzSdcqbr5YEVgF4z81bNc
   4exj2TbX4b0D0dhmxaQMRmGZUnNLModVtGsDg1M0TzNo85bxk6MJ9R8ex
   QGw18/6sCkSgstgB3Qk09nqinL35uroCed01AnXnOWJMvqrw0e3gD9jal
   CIxYtgCOiyybks4KwmNAtF2lXcOFEC+fXzZZhYCiJ5S6SYoK2AJfgKWrC
   up6VT21N0Sb+T3D6VCpVxVtPbYSmfcSc0sIKyR4gbdml+wa3rZ4ThrhtU
   Q==;
X-CSE-ConnectionGUID: vIYRoVmpTaCkqZJBROvWhg==
X-CSE-MsgGUID: kxALnzwxTzK+QYr6hpo5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="89299466"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="89299466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 06:10:05 -0700
X-CSE-ConnectionGUID: sUWbfQZzToWgu++PSZ9bcA==
X-CSE-MsgGUID: GmESJZ1NQeaX2SZcjOrW/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="252630541"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.111]) ([10.245.245.111])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 06:10:02 -0700
Message-ID: <c0963a0d-b523-4206-9d25-83606a081a54@linux.intel.com>
Date: Sat, 25 Jul 2026 15:09:42 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] drm/ttm: Hook up a cgroup-aware reclaim callback
 for the dmem controller
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, dri-devel@lists.freedesktop.org,
 mkoutny@suse.com
References: <20260725100036.2372-1-thomas.hellstrom@linux.intel.com>
 <20260725100036.2372-5-thomas.hellstrom@linux.intel.com>
 <20260725102218.7CDCC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260725102218.7CDCC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/25/26 12:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The patch introduces a cgroup eviction path that passes `place = NULL` to drivers' `eviction_valuable` callbacks, but fails to update AMDGPU's implementation, leading to a NULL pointer dereference.
> - [Medium] The patch falsely claims to prevent a use-after-free by clearing the reclaim callback, but it only nullifies a local pointer (`man->cg`), leaving the callback registered.
> --
>
> --- Patch [4]: [PATCH v9 4/6] drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller ---
> commit 239e3794b12b4c52556c630073a7d4ef2e00e721
> Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller
>
> This commit adds functions to evict buffer objects charged to a specific
> dmem cgroup pool until a target size is met. It also introduces a new mode
> for the buffer object LRU walker to support sleeping locks.
>
>>      v5:
>>      - Rebased on the introduction of struct dmem_cgroup_init.
>>      - Handle NULL region in ttm_resource_manager_set_dmem_region() to clear
>>        the reclaim callback, preventing use-after-free when the manager is
>>        torn down while the dmem region outlives it. (Sashiko-bot)
> [Severity: Medium]
> The commit message states that a NULL region clears the reclaim callback to
> prevent a use-after-free. Is this description accurate?
>
> Looking at ttm_resource_manager_set_dmem_region(), it only sets man->cg to
> the new region (or NULL). It does not appear to unregister the callback from
> the dmem_cgroup subsystem.
>
> If the callback remains registered, could the subsystem still invoke
> ttm_resource_manager_dmem_reclaim() with a freed manager pointer, causing a
> use-after-free when man->bdev is accessed?

The dmem region needs to be unregistered before the manager is taken 
down, So while the v5 changelog is not up-to-date, this is a false positive.

>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 3980f376e3ba4..8d7403c714cf0 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> [ ... ]
>> @@ -515,12 +515,19 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>>   {
>>   	struct ttm_bo_evict_walk *evict_walk =
>>   		container_of(walk, typeof(*evict_walk), walk);
>> +	s64 bo_size = bo->base.size;
>>   	s64 lret;
>>   
>>   	if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resource->css,
>>   					      evict_walk->try_low, &evict_walk->hit_low))
>>   		return 0;
>>   
>> +	/*
>> +	 * evict_walk->place is NULL in cgroup drain mode.  Drivers'
>> +	 * eviction_valuable() callbacks must handle a NULL place, treating it
>> +	 * as "any placement": the TTM base implementation already does so via
>> +	 * ttm_resource_intersects().
>> +	 */
>>   	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
>>   		return 0;
> [Severity: Medium]
> Will passing a NULL place here cause a crash in the AMDGPU driver?
>
> Looking at amdgpu_ttm_bo_eviction_valuable(), it appears to unconditionally
> dereference the place pointer:
>
> amdgpu_ttm_bo_eviction_valuable() {
>      ...
>      if (amdkfd_fence_check_mm(f, current->mm) &&
>          !(place->flags & TTM_PL_FLAG_CONTIGUOUS))
>          return false;
>      ...
> }
>
> Does the AMDGPU implementation need to be updated to handle a NULL place
> before this cgroup eviction path can be safely used?

This is done in patch 6, where the place=NULL is introudced for amdgpu. 
False positive.

>
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 154d6739256f8..1417a09b767c4 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> [ ... ]
>> +void ttm_resource_manager_set_dmem_region(struct ttm_resource_manager *man,
>> +					  struct dmem_cgroup_region *region)
>> +{
>> +	if (!IS_ERR(region))
>> +		man->cg = region;
>> +}
>> +EXPORT_SYMBOL(ttm_resource_manager_set_dmem_region);
> [Severity: Medium]
> As mentioned regarding the commit message, does this function fully detach
> the region?
>
> Since this only nullifies the local man->cg pointer, the dmem_cgroup
> subsystem might still hold the ttm_resource_manager_dmem_reclaim callback.
> Would an explicit unregistration step be required here to safely tear down
> the manager?
>
