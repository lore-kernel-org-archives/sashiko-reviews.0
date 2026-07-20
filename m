Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4819B5B1
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 01:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511397; cv=none; b=oG/dOHDqVV6gIdi9I7UhGHeDmDLZ/nusjuChGYyCDgXNyawyBd1KJU2q+2FYSUFOLDt5tVY9uYm/r/FMdfHOulY6Qk5RAxqRmGSxzqTjijoRYjzp7TjlHSrA3I/NEyCBHdbzhAIKfzn41MYsq8ljP7ur2jPevxHjTw6W/72Bt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511397; c=relaxed/simple;
	bh=z2oZ9MBhZw+M5y+N0Re1eHPzatrSpoZ2zE/wulXzMyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRU8wSSaVGBXOFL32fsy0mik30QQUijyfFqA7BC9FMjacWGh+VIqxrietG8ZZHPbuAzXY+uycbhhy+ZG27ptLieCzf3CjxO8OnbXfTpT+zIOQLTJfixzI7wxU9bKuvra5/Fe8MN+X5A+QxkoBEar2iwaUCuHgZzo+S5q/raW1YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eijb0LP7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eijb0LP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784511396; x=1816047396;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=z2oZ9MBhZw+M5y+N0Re1eHPzatrSpoZ2zE/wulXzMyE=;
  b=Eijb0LP7m7HWXry4Ku+QbE9ciBma+R+8DxVu6lPTTwlWS4g/E+xikF1f
   0QRSDTgdhMRPEsGfCMuBr9lsHcXnRcW7hWRX/FhfzGARfUBSqykwYg9qv
   Kncu41KDgkclmxRTZAG3lk9rpGBtxKSFripZZhzSO7/7q3kxqzbVoyrJ8
   2SUbt3mE+ceqFyxACCZj2YTP6MQ+h1X+SXWLoy3Qcn/0cscRb5b+fSO8o
   76M+Ya37tOAAqHWw7e+3sExm4A1alxv3U8dX0SE+xcAlt/sZ74VK/hI8v
   F2sMfR7G4sswmBIA/apjHXoyD1soOm0OucmZBVog4OXvX1KUqANwVlyzS
   w==;
X-CSE-ConnectionGUID: RttiR7fzRUy5+i71Cxy5fw==
X-CSE-MsgGUID: PRprOjIWTgOVRh/iPtKjEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87625386"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="87625386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 18:36:35 -0700
X-CSE-ConnectionGUID: eKrt+uqrQl2uxouDJhrsKg==
X-CSE-MsgGUID: I4FwPkhtTbKpxPULBzkZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="281785579"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.147]) ([10.124.241.147])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 18:36:34 -0700
Message-ID: <8df3766e-ae09-4cd2-b3c5-9c7c58b02df1@linux.intel.com>
Date: Mon, 20 Jul 2026 09:36:32 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 8/8] perf/x86/intel: Prevent drain_pebs() reentry
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260717080342.1879573-1-dapeng1.mi@linux.intel.com>
 <20260717080342.1879573-9-dapeng1.mi@linux.intel.com>
 <20260717103813.075C11F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260717103813.075C11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/17/2026 6:38 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] TOCTOU race in intel_pmu_drain_bts_buffer leading to duplicate BTS records.
> --
>
> --- Patch [8]: [Patch v3 8/8] perf/x86/intel: Prevent drain_pebs() reentry ---
> commit 77ebceadaa828dfb1bed75e560551cf29b1ae9f5
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf/x86/intel: Prevent drain_pebs() reentry
>
> The PEBS buffer is shared by all events on a CPU, so drain_pebs() must
> not run concurrently. This commit introduces __intel_pmu_quiesce() and
> __intel_pmu_resume() helpers to disable the full PMU around the
> drain_pebs() call, preventing reentry.
>
>> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
>> index e86e4ba91e1b3..7f8b98d1837dc 100644
>> --- a/arch/x86/events/intel/ds.c
>> +++ b/arch/x86/events/intel/ds.c
>> @@ -1240,13 +1240,6 @@ int intel_pmu_drain_bts_buffer(void)
>>  	return 1;
>>  }
> [Severity: High]
> This is a pre-existing issue, but since you are fixing the drain reentry 
> race for PEBS, does intel_pmu_drain_bts_buffer() need similar protection?
>
> If a user configures a BTS event alongside another active counter and 
> disables the BTS event, the stop IPI can call this sequence without 
> globally disabling the PMU:
>
> __perf_event_stop()
>   x86_pmu_stop()
>     intel_pmu_disable_event()
>       intel_pmu_drain_bts_buffer()
>
> If a PMI interrupts execution precisely between reading the top pointer and 
> resetting the index:
>
> arch/x86/events/intel/ds.c:intel_pmu_drain_bts_buffer() {
>     ...
>     base = (struct bts_record *)(unsigned long)ds->bts_buffer_base;
>     top  = (struct bts_record *)(unsigned long)ds->bts_index;
>
>     if (top <= base)
>         return 0;
>
>     memset(&regs, 0, sizeof(regs));
>
>     <-- PMI FIRES HERE -->
>
>     ds->bts_index = ds->bts_buffer_base;
>     ...
> }
>
> Could the NMI handler unconditionally call intel_pmu_drain_bts_buffer(), 
> draining the records and resetting the index, only for the interrupted 
> context to resume and push the exact same records again using its stale 
> top pointer?
>
> Would it make sense to wrap the BTS draining logic with the newly 
> introduced __intel_pmu_quiesce() and __intel_pmu_resume() helpers as well?

Yeah, that looks a similar race. Considering BTS would not be used broadly,
would fix it later in an independent patch.

Thanks.


>
