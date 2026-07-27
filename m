Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762042D747
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 21:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785188516; cv=none; b=gVqu7ACvtSG5oNzdhg94DVpCpbGH0H6x7fJ+U3N8913Ez+EQgLIxQzfMxwEPjGDvOa7LoUJYQs6rvSg/utfhVUH1omrkG1GiqrRPj6vcHy9dLekmX4YqphKNauOQj6b2s4NRnmr8o2qY/am/wawQRZeYUirZgDLZh/7oPYQiPeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785188516; c=relaxed/simple;
	bh=XKmK9/p35tHUTZToQ8HCs8ywYWngxbztdmnF0M51okM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uniwk6/U5c2R1+8Dsg0wXkvemfA7/GE8NE1ONnjtIXibD7ukJQ96JxbPoOCcbZkPx4CIwUjSH0gL4PiujW49rpKfu830hrCkk5UJMC3zFHqknM66HCCcVsCjg7Vps+f3Ayy9Nvby53uejOH1JCl0JV0A4Xq8PZJqQt7vhS1oR6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZobinLBn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZobinLBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785188514; x=1816724514;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XKmK9/p35tHUTZToQ8HCs8ywYWngxbztdmnF0M51okM=;
  b=ZobinLBnubTc+ECzgwuHvHjOSKTVoZQ0rOHbKTey2lAutNcDsrKefGpS
   bwGOYWqg53CEVP+8ZbH9rw+6V856UGXjdl/XormKyEXvcDKU9gbncQsvc
   JdVeTHXwo0eIuEVXbpuHHjMJ1gOvjp7c6+A/jqiuMUMjanHykTTpGjjpv
   +I9jZio9ClSLiNnXF3pyd7w+JbLwllV/l0mhxKEMCGL/A2Mxc8G5QkgvW
   aOag8Ka04j5+mBDGOYrSWJsdEUZSN0wSVE85bBldO4D/JJYairZZfwIyb
   T1l2aseQjqJOVYDX1VVWPsz2M/m6bCqQmVJeaeWdcOV5y4b3jM4VPUcVV
   A==;
X-CSE-ConnectionGUID: fRECQ/5wQQije8BPDoRunQ==
X-CSE-MsgGUID: WvuX+3RiQm6/LdMD1OJDAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89435757"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="89435757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:41:54 -0700
X-CSE-ConnectionGUID: ZnThHMWOQe2BrPBwitKM5w==
X-CSE-MsgGUID: ZQggLLmMQYSbewtlW9/M6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263304612"
Received: from soc-cp83kr3.clients.intel.com (HELO [10.122.185.5]) ([10.122.185.5])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:41:54 -0700
Message-ID: <b6da139a-55de-4e18-8688-9ee1cb2ec508@intel.com>
Date: Mon, 27 Jul 2026 16:41:52 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/9] KVM: x86/pmu: Restrict RDPMC passthrough to known
 CPUs
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260727192131.582105-1-zide.chen@intel.com>
 <20260727192131.582105-8-zide.chen@intel.com>
 <20260727194104.16BB81F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Chen, Zide" <zide.chen@intel.com>
In-Reply-To: <20260727194104.16BB81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/27/2026 2:41 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Compilation failure due to undeclared identifier `INTEL_PANTHERLAKE_R`.
> --
> 
> --- Patch [7]: [PATCH v7 7/9] KVM: x86/pmu: Restrict RDPMC passthrough to known CPUs ---
> commit 4eba5efe34005f159dabad1f08138db5ccbe910e
> Author: Zide Chen <zide.chen@intel.com>
> 
> KVM: x86/pmu: Restrict RDPMC passthrough to known CPUs
> 
> This commit restricts KVM RDPMC passthrough to a known list of CPUs with
> audited RDPMC encodings to prevent host PMU information leaks to the guest.
> It explicitly requires RDPMC interception for unknown CPUs.
> 
>> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
>> index b983030fb910e..444a66ca33240 100644
>> --- a/arch/x86/kvm/pmu.c
>> +++ b/arch/x86/kvm/pmu.c
>> @@ -77,6 +77,21 @@ static const struct x86_cpu_id vmx_pebs_pdist_cpu[] = {
>>  	{}
>>  };
>>  
>> +/*
>> + * CPUs whose RDPMC encodings have been audited for KVM RDPMC
>> + * passthrough support.
>> + */
>> +static const struct x86_cpu_id kvm_rdpmc_known_cpus[] = {
>> +	X86_MATCH_VFM(INTEL_ATOM_DARKMONT_X, NULL),
>> +	X86_MATCH_VFM(INTEL_LUNARLAKE_M, NULL),
>> +	X86_MATCH_VFM(INTEL_NOVALAKE, NULL),
>> +	X86_MATCH_VFM(INTEL_NOVALAKE_L, NULL),
>> +	X86_MATCH_VFM(INTEL_PANTHERLAKE_L, NULL),
>> +	X86_MATCH_VFM(INTEL_PANTHERLAKE_R, NULL),
> 
> [Severity: Low]
> Does this code build correctly on x86? It appears that INTEL_PANTHERLAKE_R
> is an undeclared macro, which could cause a compilation failure when building
> arch/x86/kvm/pmu.c.

Yes, it builds, INTEL_PANTHERLAKE_R is already in the master branch.

> 
>> +	X86_MATCH_VFM(INTEL_WILDCATLAKE_L, NULL),
>> +	{}
>> +};
>> +
> 

