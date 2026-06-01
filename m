Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF3389110
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304087; cv=none; b=tcX8dvUgHzd71ZzFY2fnWZ9mLs7nYB0lOWnkhOeFS374N9kuqemdnTztKcx3uCEOZ42dVJcd+ayb7OyzS3tsRDj8xddoV5GE6OFERCjKDRirZ+3mICDtly7p55UX8YOcAlxwZz7/ZmPqY2SHUB0i2DmNMUalAoSzHwwg6zWbfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304087; c=relaxed/simple;
	bh=7lnsp/NZyjnAjYITSlr3Q/RUfenxNeMkRnQQwfUCCIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezpvILnfsjxaV45FHhiWYK7t2X6vCT1gdn42BbQ1UJBllGRQ2XLH4NA31OweP9ozZReJryqIijSKgCBsqcAvY0ugTTbP6YAdMfhcp7PulPBeEIrNNOWxQl7/lFeRfJmtrzXRydkiDmMFnR1/c18HOQKQFRBA4fFePxXG1b9CgzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H558aI9g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H558aI9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780304085; x=1811840085;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7lnsp/NZyjnAjYITSlr3Q/RUfenxNeMkRnQQwfUCCIM=;
  b=H558aI9gwhpzS5Sch7c4qoT/JEohaWxadD6Ci/gzF3SgvLcQXGG9uFYf
   YV8kUP+xoFqY5RT8C+tMcxuBQGmba1xPCMm+O95sEKUX9NvtvGegKq6gZ
   AnFAhDiB0/JXvIeDrneM1M20UMWbljgRokGcD9XD3jv7ZUH0snxeMVP9o
   ZhW1BVFdpXY/4+XOBiRXH9wOF0a+/64vOdmID5ByrXVPN1AdMrnQRXbr5
   VlcKnhderUquLd5czOhUqup15QHEBL99AwSXH8Ejz8/0v+hdDqHdMa/cz
   0pYng9ly5Qh3ooN8idAcE3+E2pPkl0zhc+8UMV4wkNIQPwKQz8lI4s/BG
   A==;
X-CSE-ConnectionGUID: LwNREutTTiiaZUbeN0nPrQ==
X-CSE-MsgGUID: 9IEd/7I7Try2KNIK6yO0OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="84685093"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="84685093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:54:45 -0700
X-CSE-ConnectionGUID: C+5ROiGtQKysZf3bFN8LbQ==
X-CSE-MsgGUID: gZJdOeQ/TOKg1jbG//7iDQ==
X-ExtLoop1: 1
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.147]) ([10.124.241.147])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:54:43 -0700
Message-ID: <e1edc2a6-c6ac-44ce-8eeb-fee275c19d19@linux.intel.com>
Date: Mon, 1 Jun 2026 16:54:40 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v8 19/23] perf/x86: Support SSP sampling using
 sample_regs_* fields
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260529075645.580362-20-dapeng1.mi@linux.intel.com>
 <20260529100314.8AB601F00893@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260529100314.8AB601F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 5/29/2026 6:03 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The uAPI header addition for PERF_REG_X86_SSP is not synchronized with the perf tool's copy, and the perf tool lacks support for formatting or synthesizing the new register.
> --
>
> commit b3c69baea8c8d8c919d96ea56a7caf694d17f469
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf/x86: Support SSP sampling using sample_regs_* fields
>
> This patch supports sampling of the CET SSP register via the sample_regs_*
> fields by using spare space reclaimed from the XMM space. It updates the
> register extraction logic and enables arch-PEBS-based SSP sampling on
> x86_64.
>
>> diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/asm/perf_regs.h
>> index 8774a1290fbef..31a025cb9dbaf 100644
>> --- a/arch/x86/include/uapi/asm/perf_regs.h
>> +++ b/arch/x86/include/uapi/asm/perf_regs.h
> [ ... ]
>
>> @@ -51,10 +51,11 @@ enum perf_event_x86_regs {
>>  	PERF_REG_X86_R29,
>>  	PERF_REG_X86_R30,
>>  	PERF_REG_X86_R31,
>> +	PERF_REG_X86_SSP,
> [Severity: Medium]
> Should the corresponding UAPI header for the perf tool in
> tools/arch/x86/include/uapi/asm/perf_regs.h be updated in sync with this
> change?
>
> Also, does the perf tool require additional updates to support this new
> register? Without adding a string representation mapping for SSP, the
> tool might not be able to parse '--user-regs=ssp' or print the register
> name.

The corresponding tools support is introduced in later commit '1c10c9dfab27
("perf headers: Sync perf_event.h/perf_regs.h with the kernel headers"'.


>
> Furthermore, tools/perf/util/intel-pt.c relies on PERF_REG_X86_64_MAX
> and a hardcoded pebs_gp_regs array that does not currently include SSP.
> Will this cause the SSP register to be silently dropped from synthesized
> PT PEBS samples?

Yeah, PT support would be added independently.

Thanks.


>
>>  	/* These are the limits for the GPRs. */
>>  	PERF_REG_X86_32_MAX = PERF_REG_X86_GS + 1,
>>  	PERF_REG_X86_64_MAX = PERF_REG_X86_R15 + 1,
>> -	PERF_REG_MISC_MAX = PERF_REG_X86_R31 + 1,
>> +	PERF_REG_MISC_MAX = PERF_REG_X86_SSP + 1,
>>  
>>  	/* These all need two bits set because they are 128bit */
>>  	PERF_REG_X86_XMM0  = 32,
