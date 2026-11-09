Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187976;
	b=A0zgNdSpoOs8SwDcD7fQeF0JjqA27rqmWQYXQJHk8TnYdBwyyQtzETYR0yeWe3NLSfkw
	 LleWe7/ZC46oYn97iW+bdSt0rBWefynX9bMbrKtINpUaa3c7yZmiOQqI1enM0hlBmI8Dl
	 etiCsO42C8hrq62Me3fEJIENj1u2CVkBIPj9n2EWV9SPd03FDe35FSBA+3AuzOvwkAd5l
	 jd270+vd+ssF/675OA10zrHT0UHonB5oOmJ21jN1/S1hdRVHkFwSam6644O7OulMyFjJv
	 /Yndm58HfdpqCTOCVmJjloB+mijIroEPIq3QvapYDw4sXk6LO2VD9JJ4I3UkQdcC+Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187976;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mBnkcZs4tLVxoULaN/SwuRLr+36884UNRNF1EkS3W3U=;
	b=MnHfqWf/5RsG0rH5pwOyBauRuYoYsqwomFHIftS4ed+4sUIY8A/N1UmrEbJKtSKbJG4j
	 Ahsswn58ZR082xHkCjxMiIqGdvYf59jPRF75lvoyvzsusqHrjSGKL/EL1laXEDq91jBPg
	 pU4FyiNvVhwinqroqUwyRGG1mRFBj4l6zSKCQz3G5ulYOzR5Y6IsfbDq8zginb6lbD9Ox
	 Mz0Ihdss4eAhluTUY2Ksv5fG4nv/cBjNOIRI8J/Nlu6rx/6zx9OXFJn7CcoQbu+HaQxhg
	 j/sHWMOVp39mi/bRZ6UStItO7BRfHhJko66ZxGm66d8Rok5ib3JOtIzMOu+2mAHRr6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HR7Kp4dU;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0927606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 01:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0927606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HR7Kp4dU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794187976; x=1825723976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7FwXIx2pvA4pgfgvHo4oMaz01MRe4uckBIJr/nZ9jLY=;
  b=HR7Kp4dUJzvPurXoY6mmu6SeQ5JgGYGVc1JDd5beBpwEgDclBxu50U6V
   6D5mld87WD631vQAMljrGyHrGqgdbyC/6t5/ulO1+YjcZ7lHJxSCPgKaH
   2VmAsIcLFXrclbJfZITrwCSd41xZIORfz0gOeD2lYnBcXOYOznjEwEPzP
   qWK2aA2/XIKM6a2+KtPbdE8IyXUjmo7QfMkSDs9zzje12oY5SlAyvT7xW
   rStR3EZDcIKhQc6TrYUD4KMt6wDCWzlA01FMGss3kRYntrn6Uk/DBwMgR
   Pd3YCyYmdHu9jNo3pmR1VoT8LEBWwYWoOI/H/ECEV8s5ccQCCXvrSgx70
   w==;
X-CSE-ConnectionGUID: Ym8YpTvfTG6rJ4efhbwo+g==
X-CSE-MsgGUID: 0iOtpaD0Tqq/wlMLuOR/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2779111"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2779111"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 17:32:55 -0800
X-CSE-ConnectionGUID: CnB0b3V6R1y7IZSRLfSdGw==
X-CSE-MsgGUID: HIFrhc7tRmGagQuq3ubmAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7637612"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 17:32:54 -0800
Message-ID: <0ccf9382-0178-450c-9163-f9a7a10f794a@linux.intel.com>
Date: Mon, 9 Nov 2026 09:32:50 +0800
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
Subject: Re: [Patch v2 5/5] perf c2c: Rename "Region" column to "Range" for
 consistency
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20261109004402.1403713-1-dapeng1.mi@linux.intel.com>
 <20261109004402.1403713-6-dapeng1.mi@linux.intel.com>
 <sashiko-outbox-204282@kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <sashiko-outbox-204282@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/9/2026 9:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] perf c2c: Range column header conflates region IDs with MRRM
>   range indices
> --
>
> commit 359275a3e2aec93ecd4fbf0366bae0325d3a6862
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf c2c: Rename "Region" column to "Range" for consistency
>
> This commit renames the header of dim_dcacheline_mem_region and
> dim_offset_mem_region from "Region" to "Range" and reduces their column
> width from 6 to 5.
>
>> diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
>> index a2dcc65d6b3ce..94fca3e4fc0a0 100644
>> --- a/tools/perf/builtin-c2c.c
>> +++ b/tools/perf/builtin-c2c.c
>> @@ -1395,11 +1395,11 @@ static struct c2c_dimension dim_dcacheline_node = {
>>  };
>>  
>>  static struct c2c_dimension dim_dcacheline_mem_region = {
>> -	.header		= HEADER_LOW("Region"),
>> +	.header		= HEADER_LOW("Range"),
>>  	.name		= "dcacheline_mem_region",
>>  	.cmp		= empty_cmp,
>>  	.entry		= dcacheline_node_mem_region,
>> -	.width		= 6,
>> +	.width		= 5,
>>  };
>>  
>>  static struct c2c_dimension dim_dcacheline_count = {
>> @@ -1429,11 +1429,11 @@ static struct c2c_dimension dim_offset_node = {
>>  };
>>  
>>  static struct c2c_dimension dim_offset_mem_region = {
>> -	.header		= HEADER_LOW("Region"),
>> +	.header		= HEADER_LOW("Range"),
>>  	.name		= "offset_mem_region",
>>  	.cmp		= empty_cmp,
>>  	.entry		= dcacheline_node_mem_region,
>> -	.width		= 6,
>> +	.width		= 5,
>>  };
> [Severity: Low]
> Does renaming this column to "Range" conflate hardware memory region IDs
> with the range indices printed in the Memory Ranges table?
>
> set_mem_region_str() formats the sampled PERF_MEM_REGION_MEM0..MEM7 bits as
> numeric region IDs (0..7), whereas print_memory_ranges_info() prints each
> ACPI MRRM entry with both a Range index and region IDs:
>
> tools/perf/builtin-c2c.c:print_memory_ranges_info() {
>     ...
> 		fprintf(out, "Range %d: [0x%016" PRIx64 "-0x%016" PRIx64 "] Node %d, local region id %u, remote region id %u\n",
> 			i, r->base, r->base + r->length - 1, r->node,
> 			r->local_region_id, r->remote_region_id);
>     ...
> }
>
> When multiple physical address ranges map to the same region ID (for
> example, Range 0 and Range 1 on local region id 0, and Range 2 on local
> region id 1), labeling the region ID column "Range" causes a reported value
> of 1 to look like Range 1 rather than region id 1.

The region ID here actually indicates the range ID instead of the
local/remote region ID in the range details. Here is more information. 

https://lore.kernel.org/all/20250505173819.419271-1-tony.luck@intel.com/


>
