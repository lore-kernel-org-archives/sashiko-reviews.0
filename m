Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50D93F9A11
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327413; cv=none; b=n3J7xl3gA9rhn1oesR90CrsO0yQ4vb5HhGLqm0Z58v5errr6HXne0lW8cOPWnxKq2SRpBSF/NgOCCbCoen72HSxHKQsX9dVl2ilet5coDf6QaYAnD6uZFbHUHPHt+lqTA7GFqmJKAomYsLQfj0ztgTDz1q55Sq8nsB7K96lqPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327413; c=relaxed/simple;
	bh=TZlkPJX0n5KVotzkqQhqGMc9PslDrZM+LUo4K9eZYy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTDgS42ftuPj85MRHrIsu/NjxWIeXLNdUMG/Nlp/55zal/O1Hozv4ax5mPymY59KwkLaE240O0BG8E5pVOjikPI1vh7/92ZBO/18avpINHTlsoC8vkzSFfi8n+nxqv/oF85pqEk3AV3Uic4hlNlb5UlzWB/SjuHTieTUhVkTwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+qif4Zs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+qif4Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783327410; x=1814863410;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TZlkPJX0n5KVotzkqQhqGMc9PslDrZM+LUo4K9eZYy0=;
  b=l+qif4ZsqX73BglWlZ2bR3LaRIOjDvlYU891ZRAT0uCGzY5ltLZ7Ikno
   4VXp5sQ8U4krJrMIGkcSKwFALK9JPiyfhNBSlDf3ofYwbMQHDgHdJ3y5s
   /AP7+0+l4LQfKJ/WSHWENKNS3222x2Q4/s+aVnjeXkDLlqyrvBsOuZM5D
   4/uZbWpjiva9+i/KS8u14iqomKFe4OAl3aeQBhvZWMgFwEMvX2qhGMikw
   214e0orPcsgKhvFE6Pvmwx83n14bMuNXPqWkJXhPwvKM4Xa+xzhrkM+5m
   PwQudBg9VnVafi9vUGqYjKXFoRZtwecMNWm3ugMZKnq6mL+RbiWXRYR19
   g==;
X-CSE-ConnectionGUID: JCpUzMF8S9+UDVBg2wg45A==
X-CSE-MsgGUID: 7G+UCwupTwWJYVCWKiP5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83935173"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83935173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:43:25 -0700
X-CSE-ConnectionGUID: NuuEANEGQ/mszdn/RFsBAA==
X-CSE-MsgGUID: O/bl8s+iSICY+zYuHK94zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="255597858"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.232.65]) ([10.124.232.65])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:43:24 -0700
Message-ID: <37a32555-8271-4413-8f94-406e21bbf330@linux.intel.com>
Date: Mon, 6 Jul 2026 16:43:22 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v9 06/24] perf/x86: Use x86_perf_regs in NMI handlers
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260706015439.3040804-1-dapeng1.mi@linux.intel.com>
 <20260706015439.3040804-7-dapeng1.mi@linux.intel.com>
 <20260706023135.63D411F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260706023135.63D411F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/6/2026 10:31 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Concurrent use of `x86_pebs_regs` and `x86_user_regs` per-CPU variables between NMI and IRQ-disabled contexts corrupts PEBS samples.
> --
>
> commit a90fb4d272f2182569ad5a2105f6b3f7c429263d
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf/x86: Use x86_perf_regs in NMI handlers
>
> Support for sampling additional register state in NMI context requires an
> x86-specific register container. This switches x86 NMI handlers to use
> the x86_perf_regs structure.
>
>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index 0888d3b0923e1..d83ea02e24577 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -1788,9 +1788,11 @@ void perf_put_guest_lvtpc(void)
>>  EXPORT_SYMBOL_FOR_KVM(perf_put_guest_lvtpc);
>>  #endif /* CONFIG_PERF_GUEST_MEDIATED_PMU */
>>  
>> +static DEFINE_PER_CPU(struct x86_perf_regs, x86_intr_regs);
>>  static int
>>  perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
>>  {
>> +	struct x86_perf_regs *x86_regs = this_cpu_ptr(&x86_intr_regs);
>>  	u64 start_clock;
>>  	u64 finish_clock;
>>  	int ret;
>> @@ -1814,7 +1816,8 @@ perf_event_nmi_handler(unsigned int cmd, struct pt_regs *regs)
>>  		return NMI_DONE;
>>  
>>  	start_clock = sched_clock();
>> -	ret = static_call(x86_pmu_handle_irq)(regs);
>> +	x86_regs->regs = *regs;
>> +	ret = static_call(x86_pmu_handle_irq)(&x86_regs->regs);
> [Severity: High]
> Is this call path safe from NMI reentrancy when accessing the per-CPU
> variables introduced earlier in this series?
>
> If intel_pmu_drain_pebs_buffer() is called from a non-NMI context (e.g.
> intel_pmu_read_event() via the perf_event_read syscall) with local IRQs
> disabled, NMIs can still fire.
>
> If a hardware PMI fires during the execution of __intel_pmu_pebs_events(),
> the CPU will jump here to perf_event_nmi_handler().
>
> The NMI handler calls x86_pmu_handle_irq() -> handle_pmi_common(), which
> also calls x86_pmu_drain_pebs(). Since the earlier patch in this series
> "perf/x86/intel: Convert x86_perf_regs to per-cpu variables" replaced stack
> allocations with shared per-CPU variables:
>
> arch/x86/events/intel/ds.c:__intel_pmu_pebs_events() {
>     ...
> 	struct x86_perf_regs *perf_regs = this_cpu_ptr(&x86_pebs_regs);
> 	struct pt_regs *regs = &perf_regs->regs;
>     ...
> }
>
> And similarly for user regs:
>
> arch/x86/events/core.c:x86_pmu_get_regs_user() {
>     ...
> 	struct x86_perf_regs *x86_regs_user = this_cpu_ptr(&x86_user_regs);
>     ...
> }
>
> Will the NMI handler overwrite the same per-CPU structures the interrupted
> non-NMI context was actively using, leading to corrupted PEBS samples when
> the original context resumes?

That should never happen. When intel_pmu_drain_pebs_buffer() is called from
non-NMI context, the whole PMU hardware has been disabled, so NMI can't be
triggered and interrupt current running PEBS handler.

Thanks.



>
