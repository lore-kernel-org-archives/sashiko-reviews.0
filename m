Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903FD34D4F9
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164695; cv=none; b=gC+l6Rrk5OmhhI2htoFZH8kKsnRvCNVgIa8m57BQC+Kw3CqZWdeRJTa8v4BrrRpXJY0k16Omjzm0/Jc1gEQVAwv86m+ibhGytTfPye+KHyHpLjttsxT+WXL9UJ4yBsmu+TKul4XPCD7yOVQhZaGVr6hFYjNnAJcgpDU1EeJxBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164695; c=relaxed/simple;
	bh=TFvoUxxZrergDNxRSBivXTrpWKdYR7ci7bGVdqx0nKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbZMfq2NRvQ0hadE6aB90sg9Ze1QkTotHpneqIkTf/a50x6gaXcrtq9V8O5KGlz2Jwmn6JuHvHES/VFYf/8Ec2eVpXEc43xFjnauoCflCP3YI/8VhIjg50CvxK110ZkBjvdQHGkZw3wB5H7hPzgefRB/lo93LNN+2vmuqWS0ys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1xwuPh0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1xwuPh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781164694; x=1812700694;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TFvoUxxZrergDNxRSBivXTrpWKdYR7ci7bGVdqx0nKs=;
  b=b1xwuPh0Q95pWMriQO58FxktiG+kk1Ovh65k8xc7Eyz7KHp+9wUAjjIH
   AU99zFNaG/zXtD6vWFRvHCoyiYcXH7SrlZyG5j/ubm0ZEMV656u5Ele64
   M14grCzEzd7KU6WjIoZHFGdPpWzuDfRFAW4uAbPMTYuilamR3WBFnsG/O
   TCJDUoFuJBFI21Rlm4EKSTXogSbS+6QdOwgNxp8J3WZEvW4LOM44hRORr
   wEG0/I9CpUJ1iIR+BtmkvlJj/KbtRZC33WOGiyjWRCWVL8jiRYAdEcxJg
   bUxZ4xIHlhBL4d+XxSgSrTiXnbgZ2yIpuk3fw7UqgRjrzW+BmhD31/hFW
   g==;
X-CSE-ConnectionGUID: uif8wVL1RX29swQQrDQ5rQ==
X-CSE-MsgGUID: 0SLyGvtZQiy9qlPeFjxKJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82016488"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82016488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:58:13 -0700
X-CSE-ConnectionGUID: Q3zC1mlzQeqi5UxJ6S5MCA==
X-CSE-MsgGUID: vPbwuaiNSL2HAIx5/E3enA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="270081244"
Received: from jkollber-mobl1.ger.corp.intel.com (HELO [10.246.16.106]) ([10.246.16.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:58:12 -0700
Message-ID: <7d335fd9-8911-48fb-9765-95aa637b5c67@linux.intel.com>
Date: Thu, 11 Jun 2026 09:58:09 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: use kmem_cache for IPC rx_msg allocations
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260611055214.948748-1-karol.wachowski@linux.intel.com>
 <20260611060448.197F71F00893@smtp.kernel.org>
Content-Language: en-US
From: "Wachowski, Karol" <karol.wachowski@linux.intel.com>
In-Reply-To: <20260611060448.197F71F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-Jun-26 8:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Duplicate kmem_cache name on multi-device systems
> --
> 
> commit 41c16409be6704d2ef5ab21270390fee65dcf7aa
> Author: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> accel/ivpu: use kmem_cache for IPC rx_msg allocations
> 
> This commit introduces a dedicated kmem_cache for allocating IPC rx_msg
> objects to reduce allocator overhead in IRQ handlers.
> 
>> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
>> --- a/drivers/accel/ivpu/ivpu_ipc.c
>> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> 
> [ ... ]
> 
>> @@ -490,10 +490,18 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
>>   	struct ivpu_ipc_info *ipc = vdev->ipc;
>>   	int ret;
>>   
>> +	ipc->rx_msg_cache = kmem_cache_create("ivpu_ipc_rx_msg", sizeof(struct ivpu_ipc_rx_msg), 0,
>> +					      SLAB_HWCACHE_ALIGN, NULL);
> 
> [Severity: Medium]
> Will this cause a name collision if there are multiple ivpu devices in the
> same system?

In practice, no:
    1. There is a single NPU instance per system, so ivpu_ipc_init() 
runs once and the cache is created once

    2. Even with multiple instances it's safe, because the cache is 
mergeable (only SLAB_HWCACHE_ALIGN flag). On the merge path the name is 
registered only as a sysfs alias via sysfs_slab_alias(). So the 
CONFIG_DEBUG_VM duplicate-name check (which scans slab_caches by name) 
shouldn't fire.

   The WARN and sysfs collision require slab_nomerge and more than one 
device which doesn't occur for this driver.

> 
> Since this is initialized per-device in ivpu_ipc_init(), calling
> kmem_cache_create() multiple times with the same hardcoded string
> "ivpu_ipc_rx_msg" can trigger a kernel WARN in kmem_cache_sanity_check()
> when CONFIG_DEBUG_VM is enabled.
> 
> Furthermore, if SLUB merging is disabled via boot parameters or config,
> the duplicate name causes a sysfs kobject collision, leading to a sysfs
> warning and a failure to register the cache in sysfs.
> 
> Should this cache name be made unique per device using dev_name(), or
> should the cache be a global singleton?
> 
>> +	if (!ipc->rx_msg_cache) {
>> +		ivpu_err(vdev, "Failed to create rx_msg_cache\n");
>> +		return -ENOMEM;
>> +	}
>> +
>>   	ipc->mem_tx = ivpu_bo_create_global(vdev, SZ_16K, DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
>>   	if (!ipc->mem_tx) {
>>   		ivpu_err(vdev, "Failed to allocate mem_tx\n");
>> -		return -ENOMEM;
>> +		ret = -ENOMEM;
>> +		goto err_destroy_cache;
>>   	}
> 

