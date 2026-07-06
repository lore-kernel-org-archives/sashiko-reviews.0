Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C91395D8C
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329006; cv=none; b=qBm3GCXgqcnHSutlrLSf8hqoqPa+I7JZZlrQO8dCLuBabl4FwrMZCfX4wDmISUTP8yMObp5gTxcbs2jBiB9vjivxoZtaqIn0YTv0Ahr1aOmackt7UNGFf2xfjdzBSC7eddAxVsb7V5aBrwB2ZmkjeAf4ZDVGZOAAwZih/7/NuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329006; c=relaxed/simple;
	bh=LACsIA95rSlNKd1FfVfjivSxeutfUCwgCYU+klgkwa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayaZsu63bVMN+C40MEbFwFj3Iyg5y7NBg/F4PKEKXGBxKU8uOK+vXGUPAqKV3okMVzMi1MbxzUIi/B8aI7/mpYtCNPbNzASm7s9+mp/Q0285dOo91DdfKC7HJaFMq6TjZTiZZsfd3FwOaU5gbPc36Mlh80XC5zSruKvsMvBL0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNms/nPA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNms/nPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783328999; x=1814864999;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LACsIA95rSlNKd1FfVfjivSxeutfUCwgCYU+klgkwa0=;
  b=nNms/nPAfj1YfsT3aeO2ZfzS3JklA/RaSWCN8bBR09q7WYRQq6KZRGdN
   vL+J82sS9yr+BtKtSjVjlYANGbBILM02dRD4W60kfxS57hKMA++cypsXp
   EWGS3SzHo73QgZogOYzOMX8TWaGQd/CA6/Ti8iftX3aZuyEGL2rLNADp1
   UwQU7CFCjmfJaV1A8Ay6fbU3F/8w/FvSiIwHfJRP5MV/hmtsbWKLZYfcG
   hU8Bd32k2JqBelQQLNOa6r8xjN/cqpVK9qu/qSXHN+xX/9tJQJznj769i
   JY38rHkB5exzs22x7AKc4haq0/BPAPD+Xau+X4vheXfxAwz2sIVzV1f8r
   Q==;
X-CSE-ConnectionGUID: Q3NR6J3VSFWBrysVxUPsAA==
X-CSE-MsgGUID: 4gaXYYq6T76s5wmLiz9DBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94604282"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94604282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:09:53 -0700
X-CSE-ConnectionGUID: zekXHhQwRG+9N+R9ljDYgg==
X-CSE-MsgGUID: R4iJn+zQQCO7q3lVUx1XRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253775505"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.232.65]) ([10.124.232.65])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:09:52 -0700
Message-ID: <f0413b94-34cf-44fb-b1fa-400e39a62b0c@linux.intel.com>
Date: Mon, 6 Jul 2026 17:09:44 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v9 07/24] x86/fpu/xstate: Add xsaves_nmi() helper
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260706015439.3040804-1-dapeng1.mi@linux.intel.com>
 <20260706015439.3040804-8-dapeng1.mi@linux.intel.com>
 <20260706021841.9F1AC1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260706021841.9F1AC1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/6/2026 10:18 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The use of the XSAVES instruction in xsaves_nmi() breaks FPU snapshotting to independent buffers due to the hardware's 'modified optimization', leading to a cross-process information leak.
> --
>
> commit e8d6f39a5d4512be90e9976febc30b8f46c0ea64
> Author: Kan Liang <kan.liang@linux.intel.com>
>
> x86/fpu/xstate: Add xsaves_nmi() helper
>
> This commit adds a new xsaves_nmi() helper to safely save supported xsave
> states from within an NMI handler. The helper is intended for the perf
> subsystem to snapshot SIMD and APX eGPRs registers.
>
>> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
>> index a7b6524a9dea2..d39c01546dee7 100644
>> --- a/arch/x86/kernel/fpu/xstate.c
>> +++ b/arch/x86/kernel/fpu/xstate.c
> [ ... ]
>
>> +void xsaves_nmi(struct xregs_state *xstate, u64 mask)
>> +{
>> +	int err;
>> +
>> +	if (!in_nmi())
>> +		return;
>> +
>> +	XSTATE_OP(XSAVES, xstate, (u32)mask, (u32)(mask >> 32), err);
> [Severity: High]
> Does this code leak stale data into the perf samples? 
>
> The XSAVES instruction uses a hardware modified optimization that tracks
> whether a state component was modified since the last XRSTORS. If a
> component is unmodified, XSAVES skips writing it to memory while still
> setting its presence bit in the XSTATE_BV header.
>
> When the perf subsystem calls xsaves_nmi() in x86_pmu_sample_xregs()
> with an independent per-CPU buffer like ext_regs_buf, skipping the memory
> write leaves whatever stale data was previously in that buffer.
>
> Because the bit in XSTATE_BV is still set, won't the perf subsystem
> read this stale data (potentially from other tasks) and leak it to
> user-space?

No, not exactly. The modified optimization only works when xrstors is
called for the same xstate area.

Copy the description about modified optimization from section 13.6 in SDM
vol. 1.

"

A processor that implements the modified optimization saves information
about the most recent execution of
XRSTOR or XRSTORS in a quantity called XRSTOR_INFO, a 4-tuple containing
the following: (1) the CPL;
(2) whether the logical processor was in VMX non-root operation; (3) *the
linear address of the XSAVE area; *and
(4) the XCOMP_BV field in the XSAVE area. An execution of XSAVEOPT or
XSAVES uses the modified optimization
only if that execution corresponds to XRSTOR_INFO on these four parameters.

"

Since xsaves_nmi() uses a dedicated xstate area and never call xrstors
instruction for this dedicated xstate area, the modified optimization won't
really happen.

Thanks.


>
>> +	WARN_ON_ONCE(err);
>> +}
