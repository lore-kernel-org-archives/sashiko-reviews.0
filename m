Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983546;
	b=c1ic6a5hC4viCNI7TapqUt7NCIk5WAz//D5ajroj97quxzL9hjpl+mWDj2dVYZlwdaPc
	 bCbow09h2OHsoPKizE3EFK6Db5na9iFETe33oB3J5h6TKDJ+Jl61ogPjpIzvD74TAUo3H
	 DNtGS9C7nK2fsZkwuM3crL758cBmPoWYX+s7tmLytHrmT56elmsUTNadbF6KxqN/MvfY/
	 qQ+7N148KElPMl9MkW+2NB975fCQf0YDL/08CH4vs4MvjD+vxFV7qpY7ge/HANyXosZnM
	 4DDyQ76VsJ9V6+GsWGeyWDO4vpn3GegwVWBA15MUD9sVzTkOzMlwqmcAtGxP5J8uVAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983546;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u0IreiS+YajtenfvnX3jWr9IuLswzaeTxj+RxQ8KZRA=;
	b=hARzWCE2QcOT7lYjAqUdbYDU5Mz9kLI/i6KF8GAlkTSsfCud5QcHSrK8ZPwXhLfqGSxK
	 MjvQTK5FxIlW2ouzUHT/iiQ12dm9CUr8fpw/iKiP4uOedwSk86nwJL4s0hK1GRoLacbDh
	 VuDjhqGfk3pcBWSqGX4BJN/M8D9Jkn3qY8VF5U3crQqZP7nf8Jtnih1MmQ1btOgy6ZtRB
	 awW/zoZyxaKx6iYDcLSMnd5WdEo+tgt5df9BBySWTtBW3wYEuhPap2GF3exfHbBIHxOnE
	 /hDS5qkkFTjhAlmr/JwZWveyffNOBJaC37zvrBCZA7CHy/un27XOZVjh5qfnB25NPYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="K1/4+19/";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073B606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 06:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6073B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K1/4+19/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794983546; x=1826519546;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LbP0tBKFUG3FX5KB5829kcDSLEKKVPeE/YutxeN5JQs=;
  b=K1/4+19/ZCSFL719UaQm0mzCd+iJJkqKWptroJe12Bi7Xymf9vIRgh5J
   r+2jU0AK9MqvvbsypKhYEWKUdPRLAE8CZGsITVtnygGlDRnzXoUNuSEAl
   GZbFc4QFOJwglDouVi27iCbkyTCAW7I/Jo6dLOj91TiBsfWxJiLPo/rHx
   uAfQiNrFAvCgpeo+ZG4QkaUglaViQkNsLh/YFb3Vtq3ev+GUS70v2dIjt
   db3Q9wD2TbsohSEPzmwWXfd+NURP2f/oUuEfrOjCEfdDfxWWbNl1J5Cq6
   ouTnmuXHnR5JCAE3Iv9k/Tl++FFTgoYj3M5mRAbOYTQgTqSrdPzI7gIeV
   Q==;
X-CSE-ConnectionGUID: bS4pZNYfRRC/baxS6MtyFQ==
X-CSE-MsgGUID: 3Q4iouduSNCuY5rdIP4keA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3771573"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3771573"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 22:32:26 -0800
X-CSE-ConnectionGUID: tsLiP/fVTtC69hQYNuN7MQ==
X-CSE-MsgGUID: ljy5Gv+DTpaBxMMCjIv68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11856171"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 22:32:25 -0800
Message-ID: <f51611e9-692a-4a0f-a01e-084237814ece@linux.intel.com>
Date: Wed, 18 Nov 2026 14:32:22 +0800
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
Subject: Re: [Patch v7 15/24] perf/x86/intel: Set PERF_EV_CAP_SIBLING for pure
 branch counter events
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
References: <20261118031453.1353625-1-dapeng1.mi@linux.intel.com>
 <20261118031453.1353625-16-dapeng1.mi@linux.intel.com>
 <sashiko-outbox-220065@kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <sashiko-outbox-220065@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/2026 12:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] perf/x86/intel: incomplete group detach handling in
>   intel_pmu_hw_config()
> --
>
> commit 2f6a2a62d0ff0bf2794f702072c776c06e629ff3
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf/x86/intel: Set PERF_EV_CAP_SIBLING for pure branch counter events
>
> This commit sets PERF_EV_CAP_SIBLING on pure branch counter events in
> intel_pmu_hw_config() so that the perf core schedules them out if the
> group leader is detached.
>
>> diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
>> index 84b134bb91eea..fd4de141ef281 100644
>> --- a/arch/x86/events/intel/core.c
>> +++ b/arch/x86/events/intel/core.c
>> @@ -5130,10 +5130,17 @@ static int intel_pmu_hw_config(struct perf_event *event)
>>  		 * require any branch stack setup.
>>  		 * Clear the bit to avoid unnecessary branch stack setup.
>>  		 */
>> -		if (0 == (event->attr.branch_sample_type &
>> -			  ~(PERF_SAMPLE_BRANCH_PLM_ALL |
>> -			    PERF_SAMPLE_BRANCH_COUNTERS)))
>> -			event->hw.flags  &= ~PERF_X86_EVENT_NEEDS_BRANCH_STACK;
>> +		if (!(event->attr.branch_sample_type &
>> +		      ~(PERF_SAMPLE_BRANCH_PLM_ALL | PERF_SAMPLE_BRANCH_COUNTERS))) {
>> +			event->hw.flags &= ~PERF_X86_EVENT_NEEDS_BRANCH_STACK;
>> +			/*
>> +			 * A pure branch counter event doesn't set up the LBR
>> +			 * itself. It must stay grouped with a normal branch
>> +			 * event which configures the LBR for it. Otherwise,
>> +			 * the LBR cannot be configured correctly.
>> +			 */
>> +			event->event_caps |= PERF_EV_CAP_SIBLING;
>> +		}
>>  
>>  		/*
>>  		 * Force the leader to be a LBR event. So LBRs can be reset
> [Severity: Medium]
> What happens on group detach when a branch counter sibling has other
> branch_sample_type filter bits set alongside PERF_SAMPLE_BRANCH_COUNTERS?
>
> First, a counting sibling in PERF_SAMPLE_READ mode with a branch filter
> (such as PERF_SAMPLE_BRANCH_ANY | PERF_SAMPLE_BRANCH_COUNTERS, which
> "perf record -e '{e1,e2}:S' -j any,counter" configures) skips setting
> PERF_X86_EVENT_NEEDS_BRANCH_STACK earlier in intel_pmu_hw_config():
>
> arch/x86/events/intel/core.c:intel_pmu_hw_config() {
> 	if (needs_branch_stack(event)) {
> 		/* Avoid branch stack setup for counting events in SAMPLE READ */
> 		if (is_sampling_event(event) ||
> 		    !(event->attr.sample_type & PERF_SAMPLE_READ))
> 			event->hw.flags |= PERF_X86_EVENT_NEEDS_BRANCH_STACK;
> 	}
> }
>
> Because branch_sample_type contains PERF_SAMPLE_BRANCH_ANY, the condition
> here is false and PERF_EV_CAP_SIBLING is not set either.  If the group
> leader is closed, perf_group_detach() promotes this sibling to a
> standalone leader that stays scheduled with ARCH_PERFMON_EVENTSEL_BR_CNTR
> enabled in hardware without LBR configured.

Yeah, it's an issue, but not introduced by this patchset. It needs a
separate fix.


>
> Second, for a sampling sibling that retains
> PERF_X86_EVENT_NEEDS_BRANCH_STACK and has PERF_SAMPLE_BRANCH_COUNTERS set,
> intel_pmu_hw_config() only sets PERF_X86_EVENT_BRANCH_COUNTERS on
> leader->hw.flags and not on event->hw.flags.  When the original leader is
> closed and perf_promote_sibling_to_leader() sets sibling->group_leader =
> sibling, is_branch_counters_group(sibling) becomes false, so
> intel_pmu_lbr_save_brstack() skips intel_pmu_lbr_counters_reorder() and
> intel_pmu_lbr_del() skips intel_pmu_lbr_reset().

Ditto. 


>
