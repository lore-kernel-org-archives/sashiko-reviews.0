Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E316DC28
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985683; cv=none; b=DdIpP6+zCmYFUqdzxJEW7wf741N+1xxK5F2k9HzsZz06LyUaq50No+y+vHA1V6Shn0AHH8auH0wBxhWx7cG74YKHucVi06rn9oHcniBHyalJae3uu3r98g8PGmabZS/UkBwP/oX42eNwr4j3ZKHv33QqXY0Ws8P2rE/lAHiuMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985683; c=relaxed/simple;
	bh=4f0G/LpdIymeRv+4KnFZjoZ2UDm3P6xwFgqdhihEbVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsi/i3sBYkkKGHGxSH3zhVrQwKmM8AP4jlteKRT4wQHzGtWMLs+chqHFalBT+JJ3nZwGy3zDwkJwdOo9PqSmAfK4kLMdbWhfr2TvDWfh/SuW0qLaUFb7VueBuvLOyqeBA2PYpM1eYy494MLSKMsUr1J7T2h7abIwht9ozzMyZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F15t7xuc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F15t7xuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784985681; x=1816521681;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4f0G/LpdIymeRv+4KnFZjoZ2UDm3P6xwFgqdhihEbVw=;
  b=F15t7xuctHJv8+qo7Uj9Uv8rzz8MATy2GhkdSnO+zyACnqO3jr68156e
   V25VCMbTW7dU2G+Sbke/Vp+vTGhehX7htboCYG3fotbBu+OrWoorZTqDI
   YAdB/bUFVMzI2ie9MsZwyv05dg0IsDT1o5fFyYddkfo+tNFt2iwLVg7Yx
   3rDg/IKW2OAN9R+BbjZoPTwvmoAFr9jChyPLiIq8oA7dRcYplF9ipp2pY
   cZvC02BO26/QkSVWKPj9ERqoxc1MFMZtJn9yWG1Mz1/wNwAHGZ02xMNT3
   t31M/DwTimeR8g2CZVQEpmE5JynW2uHiZ1tUdF2B/+es/DmkeR+UM12D3
   A==;
X-CSE-ConnectionGUID: bA3Y5T1NSwG5JbLMhG9/3Q==
X-CSE-MsgGUID: T7UuD+jdQKCHu4kIGPw3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85715541"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="85715541"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 06:21:20 -0700
X-CSE-ConnectionGUID: 808UOQ5bRBGzm2G0R8pbtw==
X-CSE-MsgGUID: jbJShIFkTn2igmF+PCG2DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="259025992"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.111]) ([10.245.245.111])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 06:21:20 -0700
Message-ID: <90e4074c-4b50-4783-9aa2-c7ad01bee089@linux.intel.com>
Date: Sat, 25 Jul 2026 15:21:16 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Wire up dmem cgroup reclaim for VRAM
 manager
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, dri-devel@lists.freedesktop.org, hannes@cmpxchg.org,
 tj@kernel.org
References: <20260725100036.2372-1-thomas.hellstrom@linux.intel.com>
 <20260725100036.2372-7-thomas.hellstrom@linux.intel.com>
 <20260725103439.28A6F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260725103439.28A6F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/25/26 12:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The explicit unregistration of the dmem cgroup region in `amdgpu_vram_mgr_fini()` misses the probe-error teardown path, leading to a memory leak and a critical use-after-free.
> --
>
> --- Patch [6]: [PATCH v9 6/6] drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager ---
> commit 5968e79644a4b5720ca50af075e6cce858a1f21a
> Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
>
> Register the VRAM manager with the dmem cgroup reclaim infrastructure
> so that lowering dmem.max below current VRAM usage triggers TTM
> eviction rather than failing with -EBUSY.
>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 08f05c3aed1d5..249f07f309515 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> [ ... ]
>
>> @@ -963,6 +1004,19 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>>   	ttm_resource_manager_set_used(man, false);
>>   
>>   	ret = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>> +
>> +	/*
>> +	 * Unregister the dmem cgroup region regardless of the evict_all()
>> +	 * result and before any further teardown.  This drains in-flight
>> +	 * reclaim callbacks and blocks new ones, so no reclaim can reference
>> +	 * the manager once we start freeing it.  It must run after evict_all()
>> +	 * so that ttm_resource_free() can still uncharge via man->cg during
>> +	 * eviction.  Clear man->cg afterwards.
>> +	 */
>> +	dmem_cgroup_unregister_region(mgr->cg_region);
>> +	mgr->cg_region = NULL;
>> +	ttm_resource_manager_set_dmem_region(man, NULL);
>> +
>>   	if (ret)
>>   		return;
> [Severity: High]
> Does explicit unregistration in amdgpu_vram_mgr_fini() miss the probe error
> teardown path?
>
> If an initialization step fails after amdgpu_vram_mgr_init() succeeds, such
> as amdgpu_gtt_mgr_init() failing inside amdgpu_ttm_init():
>
> amdgpu_ttm.c:amdgpu_ttm_init() {
>      ...
>      r = amdgpu_vram_mgr_init(adev);
>      if (r)
>          return r;
>
>      r = amdgpu_gtt_mgr_init(adev, gtt_size);
>      if (r) {
>          dev_err(adev->dev, "Failed initializing GTT heap.\n");
>          return r;
>      }
>      ...
> }
>
> The function returns an error without cleaning up the VRAM manager.

This is a pre-existing error. While this patch introduces yet another 
vulnerability related to this,
its fix is not in the scope of this series, and if this is considered a 
no-go, better hold off
this patch until the underlying issue is fixed.

/Thomas




>
> Because the AMDGPU IP block init sequence sees the sw_init failure, it
> leaves status.sw = false for the GMC block.
>
> During the subsequent teardown in amdgpu_device_fini_sw(), the sw_fini
> callback for the GMC block is skipped because status.sw is false.
> Consequently, amdgpu_bo_fini() and amdgpu_vram_mgr_fini() are never
> executed.
>
> Since amdgpu_vram_mgr_fini() is bypassed, the dmem cgroup region is
> never unregistered. When the driver probe fails, the adev structure is
> freed by devm_drm_dev_alloc teardown.
>
> The global dmem_cgroup_regions list then retains the region with a
> reclaim_priv pointer pointing to the freed ttm_resource_manager. If
> memory pressure later triggers cgroup reclaim, it would call
> amdgpu_vram_mgr_dmem_reclaim() with the freed pointer, potentially leading
> to a use-after-free regression.
>
> Is there a way to ensure the region is unregistered during probe failures?
>
