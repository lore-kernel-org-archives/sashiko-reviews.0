Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBB63BE162
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174766; cv=none; b=UOqw+DejQPgiJ9zNCHcRl0aBJQYKtpruYdYe8txi/fqmkrLlOva6xr2U0qluKYkTbY7uJAY6PwC/4lw+s17Av89GMESyJ0g3OWqzgfT85Vkl63qgUuDk/LoVxhXxe9M67k1yCTVIFR0Vo/77EQMlhk+8xGCZ2l5faa3DxTKw+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174766; c=relaxed/simple;
	bh=1FeW4a+8D9Kc2XsFV8gBklecfS/7LpBKzlKCng0c6fI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTE9jyVzZcsR1iyp4c5awfxzo1+VCofJW5q3DkBoovQdHjv1+SwAAYa5lb4MkByxdCw/y0Pp4UtQiClUE2pLZuZhW+y9RATF1gizIX+NWaqZFZKKqXKm/EnB2+d+RR9F+0qd2YFHvnYuqdV9+f5d4HiZicFs5YD9p4LYdUz4Ihk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9xkoPn0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9xkoPn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779174764; x=1810710764;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1FeW4a+8D9Kc2XsFV8gBklecfS/7LpBKzlKCng0c6fI=;
  b=f9xkoPn0ecrFL+a+Ie7FT3WUYfmrcTbxso88yLtatPq4AreSymITqZXw
   Uk0/4RsIf3+818o7b5vpEu4Es5k1RMTf6841ZXljBiHq8V7cUIXxzeNu+
   YZq7Vfq5Pq7cVwyO8EASWycXnVRDLXWeMQZ8o+eo57q+LejeM5JEnEM2g
   1p40+y/jqm1686HpsjHS7h2SU5UvMU82R8Y4mXX8WWOUX/VAnKJuIWmtW
   r/b3y30c6eSrSl7oUNuY8uKVLGP3UHYLT/XfD5+OApFU4TloeCs2vQ125
   3aQZGVzte9SoaZN1BXrl2Vo9IPRwu3LEFtA6tWWKOkeKScyc3YzW6JF3C
   A==;
X-CSE-ConnectionGUID: uLyA/TjgQwWh5BQ55/U5hA==
X-CSE-MsgGUID: B7IQsdMRQ/6pYvN40OMGdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79186213"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79186213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:12:42 -0700
X-CSE-ConnectionGUID: WWihl1kZRqCHuHlfbIe82A==
X-CSE-MsgGUID: Zprfa1EqQHKFfdO2fPASig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244679585"
Received: from unknown (HELO [10.238.3.164]) ([10.238.3.164])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:12:41 -0700
Message-ID: <a7e5d7c9-d34c-4a69-85f4-f4decb550f5c@linux.intel.com>
Date: Tue, 19 May 2026 15:12:39 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] perf/x86/intel: Update event constraints and
 cache_extra_regs[] for ARL
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260515061143.338553-8-dapeng1.mi@linux.intel.com>
 <20260515064020.AF597C2BCC7@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260515064020.AF597C2BCC7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 5/15/2026 2:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unhandled memory allocation failure in intel_pmu_init_hybrid() leads to a NULL pointer dereference.
> --
>
> commit e86d9a7a48c7a21c02757243f3a40ac6b6e47297
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf/x86/intel: Update event constraints and cache_extra_regs[] for ARL
>
> Updates perf hard-coded event constraints and cache_extra_regs[] for
> Arrowlake. Introduces ARL-specific arl_lnc_hw_cache_extra_regs and adds
> crestmont specific constraints for LPE cores.
>
>> diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
>> --- a/arch/x86/events/intel/core.c
>> +++ b/arch/x86/events/intel/core.c
> [ ... ]
>
>> @@ -8529,16 +8547,41 @@ __init int intel_pmu_init(void)
>>  	case INTEL_WILDCATLAKE_L:
>>  		pr_cont("Pantherlake Hybrid events, ");
>>  		name = "pantherlake_hybrid";
>> +
>> +		intel_pmu_init_hybrid(hybrid_big_small);
>> +
>> +		/* Initialize big core specific PerfMon capabilities.*/
>> +		pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];
>> +		intel_pmu_init_lnc(&pmu->pmu);
>> +
>>  		goto lnl_common;
>>  
>> -	case INTEL_LUNARLAKE_M:
>>  	case INTEL_ARROWLAKE:
>> +		pr_cont("Arrowlake Hybrid events, ");
>> +		name = "arrowlake_hybrid";
>> +
>> +		intel_pmu_init_hybrid(hybrid_big_small);
>> +
>> +		/* Initialize big core specific PerfMon capabilities.*/
>> +		pmu = &x86_pmu.hybrid_pmu[X86_HYBRID_PMU_CORE_IDX];
>> +		intel_pmu_init_lnc(&pmu->pmu);
> Does this code risk a NULL pointer dereference if the memory allocation in
> intel_pmu_init_hybrid() fails?
>
> Looking at intel_pmu_init_hybrid(), it allocates x86_pmu.hybrid_pmu and
> returns -ENOMEM if kzalloc_objs() fails.
>
> If that allocation fails here, the return value is ignored. The code
> immediately proceeds to calculate the pmu pointer using x86_pmu.hybrid_pmu
> and passes it to intel_pmu_init_lnc(), which would dereference it.
>
> While this pattern existed before this patch, it is being propagated into
> the new Pantherlake and Arrowlake initialization blocks. Could we add error
> handling here to catch the allocation failure before accessing the array?

Yes, it's a known issue and it would be fixed in separate patch later. Thanks.



>
