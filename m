Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF6652BE34
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765720; cv=none; b=sHdRpHtnF/STpFgMkn+SdWpNuMMGdD7ZWGUatlplcFsUbONj8utgLx9iw2mL0uJRn9ix2q2kGHRdaVvc5QvdTzQc3jLfLcnAE2SP/VPL42ZpOhTAtAwC7EI4QPhAOwQrXG3v4Yxl4u2REyR/tK/NOLaWX5xw4NzkuuYvdDHQx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765720; c=relaxed/simple;
	bh=2XmqvDlKDrTPpvAygrE0H6eHzIhPYSA/CuOIr3eYjxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgRrWWZL3xywQlLiZZBIC4UCEPBQAlOcbQ/PR2mY/Y1F6w1MUPmdXISidBzAtgNBgz0Fd6wGnBOvB7jic+dByokonttLz2WQglkXVZn2KDwZhC7qXVGhOqjvBo2rvIjzyCuCAogwVk6eU0M8Jro5Bd4+iKmNSmgjm4euJhlUmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKX/4TbN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKX/4TbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789765711; x=1821301711;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2XmqvDlKDrTPpvAygrE0H6eHzIhPYSA/CuOIr3eYjxY=;
  b=aKX/4TbNyri2iO0SPuK5X4jXA11ijNHkkTIY9ZeCS9kXhXmD+TYQjWTs
   JWchvPaINxyJOXQYR2g3kkQ+f32F3OSwxXG3fspG1WCAKhgA137WOP4N9
   cTFxhFlIxIBl5Hfu8MEBT3pJCpKX1V8Q5R/aKquJx8qNtFvfzfEYwRxdL
   bePXkJ+iZzK7poTAMcydPY+dN3aE1hYNJPYrDQIyZcCFngWPNxhWARLpr
   3BZNhUnCwWaTszn6t2FjxKzXdo+x4J8NsU/PbnU/lVp/f0y7gUKHoLC1B
   M2it/ORqJ+lnD84NeKS58qT5WGRJROvmB+gMwi/CGl7VCRAUI1AvbuTTg
   g==;
X-CSE-ConnectionGUID: EJleoqlNQduBq6MAT6cfyA==
X-CSE-MsgGUID: 4owQfLR2SQig/yQXkzA0bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="77865332"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="77865332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:08:28 -0700
X-CSE-ConnectionGUID: P03tvDUuQTism9O10yxkWQ==
X-CSE-MsgGUID: 7450EUE1SEimioFCLn7oFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270292930"
Received: from calunden-mobl.amr.corp.intel.com (HELO [10.246.168.184]) ([10.246.168.184])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:08:28 -0700
Message-ID: <175d36fb-0990-4744-a8cb-c484d84fa6aa@intel.com>
Date: Fri, 18 Sep 2026 16:08:27 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] KVM: x86/pmu: Support RDPMC Metrics Clear Mode
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260918193937.569414-1-zide.chen@intel.com>
 <20260918193937.569414-13-zide.chen@intel.com>
 <20260918202200.F39971F000FF@smtp.kernel.org>
Content-Language: en-US
From: "Chen, Zide" <zide.chen@intel.com>
In-Reply-To: <20260918202200.F39971F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/2026 3:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] pmu: event filter mistakenly strips METRICS_CLEAR_EN from fixed_ctr_ctrl_hw
> - [Medium] pmu: METRICS_CLEAR_EN unmasked without validating fixed counter bounds
> - [Low] pmu: emulation incorrectly ties PERF_METRICS clearing to SLOTS PMC existence
> --
> 
> commit 8ba3725c32dbde4a1c3935cb433e898e06425b83
> Author: Zide Chen <zide.chen@intel.com>
> 
> KVM: x86/pmu: Support RDPMC Metrics Clear Mode
> 
> This commit adds support for PERF_CAP_RDPMC_METRICS_CLEAR (bit 19 of
> IA32_PERF_CAPABILITIES). It advertises this capability to guests when the
> mediated PMU is enabled and the host reports it, unmasking the relevant
> control bit. It also updates intel_emulate_rdpmc() to replicate the
> clear-on-read behavior for consistency.
> 
>> diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
>> index 98e2fb80347a1..3e5e8bae67ab0 100644
>> --- a/arch/x86/kvm/vmx/pmu_intel.c
>> +++ b/arch/x86/kvm/vmx/pmu_intel.c
> [ ... ]
>> @@ -138,6 +149,18 @@ static int intel_emulate_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx,
>>  			return 1;
>>  
>>  		*data = pmu->perf_metrics;
>> +
>> +		/*
>> +		 * Per the SDM, RDPMC of PERF_METRICS clears both PERF_METRICS
>> +		 * and the SLOTS fixed counter when Metrics Clear Mode is
>> +		 * enabled via INTEL_FIXED_3_METRICS_CLEAR in FIXED_CTR_CTRL.
>> +		 */
>> +		pmc = kvm_pmc_idx_to_pmc(pmu, INTEL_PMC_IDX_FIXED_SLOTS);
>> +		if (pmc && intel_pmu_metrics_clear_enabled(pmu)) {
>> +			pmu->perf_metrics = 0;
>> +			pmc_write_counter(pmc, 0);
>> +		}
>> +
> 
> [Severity: Low]
> Does tying the clearing of PERF_METRICS to the existence of the SLOTS PMC in
> intel_emulate_rdpmc() violate the hardware specification?
> 
> If the guest executes RDPMC natively and triggers an interception, and the
> SLOTS counter is not exposed to the guest (making kvm_pmc_idx_to_pmc return
> NULL), but METRICS_CLEAR_EN is enabled, this code silently skips clearing
> PERF_METRICS.
> 
> Should the clearing of pmu->perf_metrics be performed independently of whether
> the software PMC object for the SLOTS counter exists?

This is a defensive check against invalid guest CPUID configuration. If
the SLOTS counter is not available, clearing PERF_METRICS is meaningless
and messy.

>>  		return 0;
>>  	default:
>>  		return 1;
> [ ... ]
>> @@ -601,6 +624,11 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
>>  						 INTEL_FIXED_0_USER |
>>  						 INTEL_FIXED_0_ENABLE_PMI);
>>  
>> +	if (perf_capabilities & PERF_CAP_RDPMC_METRICS_CLEAR)
>> +		pmu->fixed_ctr_ctrl_rsvd &=
>> +			~intel_fixed_bits_by_idx(INTEL_FIXED_SLOTS_IDX,
>> +						 INTEL_FIXED_3_METRICS_CLEAR);
>> +
> 
> [Severity: Medium]
> Does intel_pmu_refresh() unconditionally unmask the METRICS_CLEAR_EN bit
> without verifying if the guest topology actually exposes the SLOTS counter?
> 
> If a VM is configured with 3 or fewer fixed counters, this unmasking would
> allow the unprivileged guest OS to write to bit 14 in
> MSR_CORE_PERF_FIXED_CTR_CTRL without triggering the expected #GP.
> 
> Should this be gated by checking if pmu->nr_arch_fixed_counters >
> INTEL_FIXED_SLOTS_IDX?

KVM is not intended to check against all possible invalid
configurations, as long as it protects host integrity, I think this is fine.

> [Severity: High]
> Does this patch inadvertently cause event filters to strip the METRICS_CLEAR_EN
> bit in kvm_mediated_pmu_refresh_event_filter()?
> 
> When a host-level event filter denies the SLOTS counter (counter 3) from
> counting, KVM applies a 0xf hardware mask that zeroes all 4 configuration bits
> for the counter:
> 
> arch/x86/kvm/pmu.c:kvm_mediated_pmu_refresh_event_filter() {
> ...
> 	} else {
> 		u64 mask = intel_fixed_bits_by_idx(pmc->idx - KVM_FIXED_PMC_BASE_IDX, 0xf);
> 
> 		pmu->fixed_ctr_ctrl_hw &= ~mask;
> 		if (allowed)
> 			pmu->fixed_ctr_ctrl_hw |= pmu->fixed_ctr_ctrl & mask;
> 	}
> }
> 
> Since this mask covers the entire 4-bit configuration block, it will also clear
> bit 14 (METRICS_CLEAR_EN) from hardware. If the guest sets METRICS_CLEAR_EN and
> then executes RDPMC natively, it will lead to un-cleared stale metrics.
> 
> Should the mask be updated to avoid interfering with this newly introduced
> feature bit?

I don't think this needs a change.

The clear/re-apply here happen while the vCPU isn't running, so there's
no window for a native RDPMC to see it cleared: if allowed, the guest's
METRICS_CLEAR_EN bit is copied through; if not allowed, counter 3 isn't
counting anyway.

> 
>>  	counter_rsvd = ~((BIT_ULL(pmu->nr_arch_gp_counters) - 1) |
>>  			 ((BIT_ULL(pmu->nr_arch_fixed_counters) - 1) << KVM_FIXED_PMC_BASE_IDX));
>>  	pmu->global_ctrl_rsvd = counter_rsvd;
> 

