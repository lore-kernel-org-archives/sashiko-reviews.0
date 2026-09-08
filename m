Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DDD5921E4
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888218; cv=none; b=nldh4xrPFZy0PJqtEqdURlZS3jLmf780ErBRv7iD45TmOdE3l/HPkaqy5F2D0Ka3+s7Z7eP0Pb6RD4cEYiQdbfb/gbG6lpg4UwQ8C7c0zzmoE83Ipw3lqgzgYxK+VuVDgZVgCIwtATgF/Q0hkW67796vG5zl4rBQEKAMjiqk34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888218; c=relaxed/simple;
	bh=50LqJ4sLn1G9RiMSyszMEM8JnlsfHvY4mihN8QV/IrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWN1DD+hCUNisE6yxSbUPN+uGLMg24NVq7ZAh2xBgu64Ncq77BXGWWAy8ZKClyyLbM+68rEs/2h052YbLaZfeBFlszbvyM3autZTSiktHON5pDQYGlK/bBliqvDBB5P7m+Z/P++vxxQj5mPuCX+ALlQhLYvaOXHA0+tizC948wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaRSDZ06; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaRSDZ06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788888215; x=1820424215;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=50LqJ4sLn1G9RiMSyszMEM8JnlsfHvY4mihN8QV/IrQ=;
  b=kaRSDZ06mP2+2EdXQB1nYifVfyoojUsmvlqGZVeSNLZrhd+hJtb9yekc
   uPx+HiyzWbEZU7HX3Fxky2lqAMwqx57Cy0KH8NJjBugdLn3QTqdpU4SXv
   oIj5zfXpNF9bPZSqoZJmz5+fIdtqO0oEzfuxecH48pmhnKR1nVZo4YtVv
   zJ0AQ0sFEBsTibOZmrKE5u7/l9bpPKgmw0f4emSH3kLPWHrrqc1GMtKLN
   lW88wrl0MyZuOwDaUpQVVKYkWOedjzCTqBTrnY/esmCnmZjoVBFNUK0zs
   k0Zx2VRRCOPfLbjdX0ZZGpsCiGNkR+a+WU9cpiO32307Bdh+/Cuhj3hEM
   Q==;
X-CSE-ConnectionGUID: AhdgnkMOSOSkKFmBjiRYjA==
X-CSE-MsgGUID: /EvnW/zGTvSCPRpavfNiYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114838528"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="114838528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:23:35 -0700
X-CSE-ConnectionGUID: DRBdbyydTsSqTubUpaUXNA==
X-CSE-MsgGUID: B43g+XUtQ7GtI9gSpU/aig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="276304649"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.158]) ([10.245.244.158])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:23:34 -0700
Message-ID: <183c1f62-0193-41c5-b67f-a6e143ed933a@intel.com>
Date: Tue, 8 Sep 2026 18:23:32 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] drm/xe/mmio_gem: fix destroy flow
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260908165046.1393557-10-matthew.auld@intel.com>
 <20260908165046.1393557-16-matthew.auld@intel.com>
 <20260908171241.EE84B1F00A3F@smtp.kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260908171241.EE84B1F00A3F@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2026 18:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] GFP_KERNEL allocation under dma_resv lock triggers lockdep splat and potential deadlock
> --
> 
> commit 6f195ca9ff5839faa94b4a50effe5cb10176e87b
> Author: Ilia Levi <ilia.levi@intel.com>
> Subject: drm/xe/mmio_gem: fix destroy flow
> 
> This commit fixes a use-after-free in the gem object destroy flow by
> introducing proper synchronization and refcounting. It uses the dma_resv lock
> to serialize the fault handler with the destroy operation and unmaps existing
> pages to cut off access to the real mmio after destruction.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>> index 970b1e2f49815..5ffe03d361902 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> [ ... ]
>> @@ -176,10 +189,9 @@ static int alloc_dummy_page_if_needed(struct drm_gem_object *base)
>>   {
>>   	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>   
>> -	dma_resv_lock(base->resv, NULL);
>> +	dma_resv_assert_held(base->resv);
>>   	if (!obj->dummy_page)
>>   		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this allocation context
> create a lockdep violation or potential deadlock?
> 
> The vma fault handler calls xe_mmio_gem_vm_fault, which takes the
> dma_resv_lock. If the device is unplugged, it eventually calls
> alloc_dummy_page_if_needed, executing alloc_page(GFP_KERNEL | __GFP_ZERO)
> while holding base->resv. Since dma_resv locks are taken by shrinkers during
> memory reclaim, holding it while doing a GFP_KERNEL allocation creates a
> circular dependency.

We are allowed to allocate under dma-resv. Loads of places do it. From 
shrinker side, it is trylock all the way down for dma-resv, at least for 
direct-reclaim.

> 
> This can be reached by any unprivileged userspace process that mmaps the mmio
> gem object and triggers a page fault while the device is in an unplugged
> state.
> 
>> -	dma_resv_unlock(base->resv);
>>   
>>   	return obj->dummy_page ? 0 : -ENOMEM;
>>   }
> 

