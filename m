Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E119481FBF
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198907; cv=none; b=PHI1Ahxl36OjmYTjdSuglky6lammwydpaYEOgv6HWc4AscCp5EOOrOyXH9C6O+BsVlUyn0o2tsB+sJ4klp9XlC76WcGkyLErrD2oOlADySP3s/x4mA0spujyvuK/7xoerZ09KUl2YXGrX4jVBxnVBC+8h1wQKUh5X6KWwmbbjmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198907; c=relaxed/simple;
	bh=OSyOTvYZVIsRSlVImx5LXmF0iwx9aNop6VsItRtuHkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IImkg2axwuxHQO+o308RlAjNEkb9vSZXJZa3bR+MaaJ01IcZ/hZdVQhBJrU/oBEFZE3Az9niqhBuMHldwnp5SCOMJxw4M3+U1HN1UbzgQBNb8XkZHk+0JlwI/T1j2sUr5Nja+KUMLLNsLxL0ukhn0Q6l6O+SvE8t31MaPrIp9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ntjl7xp9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ntjl7xp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781198905; x=1812734905;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OSyOTvYZVIsRSlVImx5LXmF0iwx9aNop6VsItRtuHkk=;
  b=Ntjl7xp9BZha5zI6k/gA6k8U/Nx6F6HDxZP0C/CMc5geAQqR+Ssea+YI
   TwFp/Amf/8QLC9LAl4RbZ8V0wt2zETTkIdnn6dnJ6/GJ3P4ATRO7dVVJo
   S+Gj15RQ4iNBQx9l8eUZXb2rFTT4LCroTY6nLG0jdodNnUPuMiR5fz+H9
   5kW1RftO+KZ6/mqTz9cfCorFUHQggfggv2/pp5U1nuJAX4uwnczY39f6/
   alhjAlH68E1mgT2iI9jctRGudCz7n40Mz75xeyc2P11FtrB6l99qEUSwR
   1Tg3laAYRysPq5rBp8R2AtT7cOrrvBTIWD3Q5ZIWqYH1sLrhG878uOk8/
   w==;
X-CSE-ConnectionGUID: iVAEtp9cRvaLrqXB0dnmyA==
X-CSE-MsgGUID: eL9xQJxvQDy0+y4DERakBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82212920"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82212920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:28:24 -0700
X-CSE-ConnectionGUID: tjOzBj1ATxa7Us8+Mf8n1A==
X-CSE-MsgGUID: CzHy/GBCR6WQdUNrcMqlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270576977"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.169]) ([10.245.244.169])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:28:22 -0700
Message-ID: <e123dfee-632c-430b-8673-4a135cad5046@linux.intel.com>
Date: Thu, 11 Jun 2026 19:28:20 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] cgroup/dmem: Add reclaim callback for lowering max
 below current usage
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, dri-devel@lists.freedesktop.org,
 hannes@cmpxchg.org
References: <20260611142242.2529-4-thomas.hellstrom@linux.intel.com>
 <20260611144046.E1EF91F00893@smtp.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260611144046.E1EF91F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/11/26 16:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [Medium] The docstring for `struct dmem_cgroup_ops->reclaim` explicitly contradicts the implementation for `-ENOSPC` return values.

Fixed in v6.


>
> Pre-existing issues:
> - [High] On 32-bit systems, `dmemcg` limits tracked in bytes are truncated to 32-bit `unsigned long`, leading to overflows and artificially severe constraints.

Pre-existing issues are out of scope.

/Thomas


> --
>
> commit ccfc580d266b8b80afec154f819853307351d98a
> Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> cgroup/dmem: Add reclaim callback for lowering max below current usage
>
> Add an optional reclaim callback to struct dmem_cgroup_region. When
> dmem.max is set below the current usage of a cgroup pool, the new limit
> is applied immediately and then the driver is asked to evict memory.
>
>> diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
>> index d9eab8a2c1ee6..d705e94d8784d 100644
>> --- a/include/linux/cgroup_dmem.h
>> +++ b/include/linux/cgroup_dmem.h
>> @@ -14,12 +14,33 @@ struct dmem_cgroup_pool_state;
>>   /* Opaque definition of a cgroup region, used internally */
>>   struct dmem_cgroup_region;
>>   
>> +/**
>> + * struct dmem_cgroup_ops - Operations for a dmem cgroup region.
>> + * @reclaim: Optional callback invoked when dmem.max is set below the current
>> + *           usage of a pool. The driver should attempt to free at least
>> + *           @target_bytes from @pool. May be called multiple times if usage
>> + *           remains above the limit after returning.
>> + *
>> + *           Return: 0 if some progress was made (even if less than
>> + *           @target_bytes was freed), -ENOSPC if no progress could be made,
>> + *           or another negative error code if a fatal error occurred.
>> + *           Any non-zero return stops further reclaim attempts.
> [Severity: Medium]
> Is the documentation accurate regarding the -ENOSPC return code?
>
> The docstring here explicitly states that any non-zero return stops further
> reclaim attempts. However, the implementation in set_resource_max() appears
> to intercept -ENOSPC and will retry up to 16 times:
>
>      if (ret && (ret != -ENOSPC || !retries--))
>          break;
>
> Could this mislead driver authors into assuming -ENOSPC is a terminal
> return code that aborts the loop immediately, when it actually subjects
> the driver to continuous retries?
>
>> + */
>> +struct dmem_cgroup_ops {
>> +	int (*reclaim)(struct dmem_cgroup_pool_state *pool,
>> +		       u64 target_bytes, void *priv);
>> +};
> [ ... ]
>
>> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
>> index 373ad04d289d5..f7166b8255c7b 100644
>> --- a/kernel/cgroup/dmem.c
>> +++ b/kernel/cgroup/dmem.c
> [ ... ]
>
>>   static void
>> -set_resource_max(struct dmem_cgroup_pool_state *pool, u64 val)
>> +set_resource_max(struct dmem_cgroup_pool_state *pool, u64 val, bool nonblock)
>>   {
>> -	page_counter_set_max(&pool->cnt, val);
>> +	struct dmem_cgroup_region *region = pool->region;
>> +	unsigned long limit = (unsigned long)val;
> [Severity: High]
> This is a pre-existing issue, but does this truncation to unsigned long cause
> severe limitations on 32-bit systems?
>
> The dmemcg subsystem accounts for memory limits in bytes, but integrates with
> the page_counter infrastructure which tracks limits using unsigned long. The
> 64-bit byte limit is truncated here, wrapping values larger than 4GB on 32-bit
> architectures.
>
> Additionally, when setting the limit to 'max' via dmemcg_parse_limit() or
> reset_all_resource_limits(), it translates to PAGE_COUNTER_MAX (which is
> ~524,287 on 32-bit). Because dmem_cgroup_try_charge() passes the allocation
> size in bytes to page_counter_try_charge(), a limit of 'max' restricts usage
> to ~512KB instead of being unlimited. Will this cause 32-bit workloads to OOM
> on allocations larger than ~512KB?
>
>> +
>> +	/*
>> +	 * Always update the limit, even if usage currently exceeds it.
>> +	 * Concurrent allocations will be throttled against the new limit
>> +	 * while reclaim is in progress.
>> +	 */
>> +	xchg(&pool->cnt.max, limit);
