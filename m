Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D779646C820
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925069; cv=none; b=hsP0X3xdMyfPfUid3ig97QbmtvCX7CJEhoqEZJRE0yfI/iIS6vaCNM8gnBjZyb8C7zGK27t9Qoge7gTjCor/2kyzU7YmP6+QJwsNeMGnB04c8dMatbhrG2djAJguGkG8TztV7PHzRlR+F7bjzYqugppe1c5p55NrThctuK6zYZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925069; c=relaxed/simple;
	bh=1IdA8gIzSuSY0PRSgNmnRqPY8MxJlfcwBmDERkxvHAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6+/g5ylzTJDG35DNoQvK33WAnKRaMIzDQLgsXWJvvMHmfpJ17fpp2ne0dmbO6swDeXBmkNcZVNphK/QNlk/kHAoxC0KwSg/ZsqTfQMtLQwV0t90BjHQQYRrIQVy6N9tNGs9fgzV9JA3EGlu48pxslY+WOBrcZH8CoRO1IJlAHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsMkvxzS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsMkvxzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787925067; x=1819461067;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1IdA8gIzSuSY0PRSgNmnRqPY8MxJlfcwBmDERkxvHAI=;
  b=LsMkvxzSHtg4BrKI3aTe+SakWw+lnHm2XdxtO8DrRXcTKwLYcvxSYFL9
   eRVmKaV7J19SucmGdLN07InxL05Ih4wt9Lpv7VmvskZhPFcaJJsSkFbd2
   +2cUBE1IryPypQsL5h8uZBJW+hpAFsLQ1Xy2w6+RfS0F0q6u9f3eewBtX
   jHQUg1bqJo8gRDCNbPT58LVEyZoK/pi90a8gVOCJdTAQicmDOP0yxBQne
   HZIwJRRvwZkPnA+o0eKrjHHoMv2rxDhMGGyGQhkGxVuGUKtYR2mXw0WgW
   FBrT3fGBYOBqX1vE80ej8/f6hVCeGrzAzCPShMgowZGCKyp800yxPQf0S
   w==;
X-CSE-ConnectionGUID: I7S167bPTzuqqNqBOeChjQ==
X-CSE-MsgGUID: mbk1e1FlSFaeX2CeLcYr5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92299464"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="92299464"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:51:06 -0700
X-CSE-ConnectionGUID: x74YzpFUREedtbZ9J4BtWg==
X-CSE-MsgGUID: HkwIF8W7SnOH2ic1+4OF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="264911882"
Received: from jtroiano-mobl1.amr.corp.intel.com (HELO [10.246.160.217]) ([10.246.160.217])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:51:06 -0700
Message-ID: <27d5d423-3e61-4b7b-a232-562f1bb35823@intel.com>
Date: Fri, 28 Aug 2026 08:51:04 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] KVM: x86/pmu: Remove redundant Perf Global
 Status MSR bit definitions
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260827223755.143247-1-zide.chen@intel.com>
 <20260827223755.143247-2-zide.chen@intel.com>
 <20260827225757.5A1341F00A3A@smtp.kernel.org>
Content-Language: en-US
From: "Chen, Zide" <zide.chen@intel.com>
In-Reply-To: <20260827225757.5A1341F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/27/2026 5:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing tools header synchronization for msr-index.h
> --
> 
> commit e6cc32e583cfbb8bac5003f58672184385cc895a
> Author: Zide Chen <zide.chen@intel.com>
> 
> KVM: x86/pmu: Remove redundant Perf Global Status MSR bit definitions
> 
> This commit removes duplicate Perf Global Status MSR bit definitions from
> arch/x86/include/asm/msr-index.h, utilizing the canonical macros from
> perf_event.h instead. It also updates the KVM PMU code to match.
> 
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index 18c4be75e9271..11b99d237e05b 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1243,14 +1243,6 @@
>>  
>>  #define MSR_PERF_METRICS		0x00000329
>>  
>> -/* PERF_GLOBAL_OVF_CTL bits */
>> -#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT	55
> 
> [Severity: Low]
> Does this removal also need to be synchronized with the tools copy of this
> header? 
> 
> Since the definitions are being removed from the kernel's
> arch/x86/include/asm/msr-index.h, leaving
> tools/arch/x86/include/asm/msr-index.h out of sync might cause the build
> system's check-headers.sh script to emit a warning when building tools like
> perf.


The removed definitions are not used by tools/perf.

More generally, the usual practice is to update the kernel header only
and let the tools-side copies be synchronized separately by the perf
maintainers when needed. The check-headers.sh warning is typically
addressed later by a dedicated header synchronization patch.

> 
>> -#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI		(1ULL << MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT)
>> -#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_OVF_BUF_BIT		62
>> -#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_OVF_BUF			(1ULL <<  MSR_CORE_PERF_GLOBAL_OVF_CTRL_OVF_BUF_BIT)
>> -#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_COND_CHGD_BIT		63
>> -#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_COND_CHGD			(1ULL << MSR_CORE_PERF_GLOBAL_OVF_CTRL_COND_CHGD_BIT)
>> -
>>  /* Geode defined MSRs */
> 

