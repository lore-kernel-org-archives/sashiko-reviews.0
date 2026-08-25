Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24B280329
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 01:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787621341; cv=none; b=C2x2AweQsoHdJDu6IceRtPEbl/nVYINiVrbGu8l0oO77DcyfRIJ7IF+kqB8rky9rpn4XrMR/WuvieQUL1dbunNZZTlYEtO2swwviLX4jAoVgw1/cbYTD/wM4RSzpxwrTNJnwgytfAe5pw6BH5YJ0AklerZjaLCCN5Sfyhnd+GS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787621341; c=relaxed/simple;
	bh=+SMmQop9CxUtOYwxrAy2cE+aq/w8qHq1Te6XX3LmqSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T940xLz1jMyV2Yu7TaNOgd90/9fVXE4DU8F/iua6T3ueBts5n8sM3+GoESXbSMm1aWLbBw/QpR+8hi3h2I/0QWCKftsw0pPlidyCVMA5lYFf9TH2KtX0Lcz5/gRTgHrRPTn/pTOjo6cF9+RGoJZujnpBPv4WhAbG07NDn2RwdQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIMp8iH+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIMp8iH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787621338; x=1819157338;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+SMmQop9CxUtOYwxrAy2cE+aq/w8qHq1Te6XX3LmqSo=;
  b=lIMp8iH+zp93S2r2Y1dej0Ki1aNzE+QrY+VQ0FEcpNe+pDn13PDrpS2D
   BA4utJyaLT8ar6dm69svM5nOkEymWi70QqJLDz/l+RkgmjEFxeH8ZSWn4
   Y2cqpuxXSy9fTM95O3s5QDGJnDp+oo2qOwHALvXZxegZnQoM+oQAm04wN
   D5AgfeexTPwYeqjQdogPmOL6k4qDDu0LT8H11PyjAP5BJmYyUaoSbq4xz
   PZqFz13E52ioOvMVDFEb83MWmRLouakMvAgMljsyvi4w4LwCrPrfJBr98
   AluIawVuZ0SpcFf5tLSdpNeszT+RrdCvhE4E/dvyWL+oDsIMuqZyDwZEX
   A==;
X-CSE-ConnectionGUID: Powh1rfvSE2HIqgSemYKQA==
X-CSE-MsgGUID: BxgSyPZATRq5bm3evTxfnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88208960"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88208960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 18:28:57 -0700
X-CSE-ConnectionGUID: 3cdbZiQkQd+FDjSSryON/g==
X-CSE-MsgGUID: uUOK7XBuRc6n4XWoW6Jf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265374969"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 18:28:57 -0700
Message-ID: <1162586e-6a38-472c-be84-335200419837@linux.intel.com>
Date: Tue, 25 Aug 2026 09:28:55 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND Patch v10 13/23] perf/x86: Support XMM sampling using
 sample_simd_vec_reg_* fields
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260824082731.1013973-1-dapeng1.mi@linux.intel.com>
 <20260824082731.1013973-14-dapeng1.mi@linux.intel.com>
 <20260824091225.514D71F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260824091225.514D71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 8/24/2026 5:12 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Downcast of `struct pt_regs` to `struct x86_perf_regs` for software events leads to an out-of-bounds read and potential arbitrary memory read or local DoS.
> --
>
> --- Patch [13]: [RESEND Patch v10 13/23] perf/x86: Support XMM sampling using sample_simd_vec_reg_* fields ---
> commit 19bc56fc15fa41117febd46977ed2032c46e92f4
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Subject: perf/x86: Support XMM sampling using sample_simd_vec_reg_* fields
>
> This commit supports sampling of XMM registers using the newly introduced
> sample_simd_vec_reg_* fields. A new abi field is introduced in struct
> x86_perf_regs to accommodate layout information for perf_reg_value.
>
>> diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
>> index 81204cb7f7239..bccf0fc275116 100644
>> --- a/arch/x86/kernel/perf_regs.c
>> +++ b/arch/x86/kernel/perf_regs.c
>> @@ -63,6 +63,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>>  
>>  	if (idx >= PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
>>  		perf_regs = container_of(regs, struct x86_perf_regs, regs);
>> +		/* SIMD registers are moved to dedicated sample_simd_vec_reg */
>> +		if (perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD)
>> +			return 0;
>>  		if (!perf_regs->xmm_regs)
>>  			return 0;
> [Severity: High]
> This is a pre-existing issue, but does using container_of() here lead to an
> out-of-bounds read for software events?
>
> If a user creates a software event (e.g., PERF_TYPE_SOFTWARE) with
> PERF_SAMPLE_REGS_USER and sets an XMM register bit in sample_regs_user,
> perf_reg_validate() fails to reject bits >= 32. When the event triggers,
> perf_output_sample_regs() calls perf_reg_value() with a raw pt_regs
> pointer from task_pt_regs(current).
>
> Because task_pt_regs is typically located at the very top of the kernel
> stack page, downcasting it to struct x86_perf_regs and reading
> perf_regs->abi or perf_regs->xmm_regs accesses memory past the end of
> the pt_regs structure.
>
> Can this cross into the adjacent vmap guard page and cause a kernel panic,
> or leak adjacent memory if triggered via nested interrupts or kprobes
> where the pt_regs is in the middle of the stack?

This concern would never happen. Currently any event trying to sample SIMD
and other extended registers would check if its PMU supports the
PERF_PMU_CAP_SIMD_REGS or PERF_PMU_CAP_EXTENDED_REGS (XMM) capability. If
not, the event creation would fail at the beginning. Thanks.

    if (!(pmu->capabilities & PERF_PMU_CAP_SIMD_REGS) &&
        event_has_simd_regs(event)) {
        ret = -EOPNOTSUPP;
        goto err_destroy;
    }

    if (!(pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS) &&
        event_has_extended_regs(event)) {
        ret = -EOPNOTSUPP;
        goto err_destroy;
    }


>
