Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952977;
	b=2G+1FboI5PSBpb/2JZZmy7ri8ABuUu/7h4Yq/zGX6kgKaQLqlUEzzWDPrWhdWbO7o5Nw
	 2Vm/zFflNpO1cs0kvUvMhdKx2JaDvI1CKSKco4Sf0YXUIIgC+xseBBefScikoc5I5Evsx
	 HzU7PRlqShEAezO/hB4DuII/6cKKxDPMoxYvwVZs3YWGx4Al6cAIx6fh0aHTd1pCA/vg+
	 WuSMJJZ+Q0wCji93n1C30HGDXJu2XNvUaMogKZj07SodEMXRT0745MBvgPBKWxTUrMFqT
	 +Rubt1uy2UEitCJxGFmniYeWVDbPOSXbIPJcqHRvkr8thhO9wK4SlWa2n09NvJuLDWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952977;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Fife5h1fL6oUkQGRJW2++sJsqU7kv0D5bhmz15iXvoM=;
	b=wX+ldoe2ymAgnUH/ZtelTTpqX2JqvvibjKjDpgXrkqrBptLBeoONiE4PtewxKJwOfgTv
	 VxbAHkpaB3vGg23sGZgwLpqJ4+9sWHbB4pQalFbKn99OHFsdnXl9RRumgYN45YCJmsDSd
	 APTYUNh816Gqgr8mmPRPXhAUPaE83RukYak8XojyL/FBJsaRgfyQKsPXG+ZHMVmFn3E7N
	 8oTsPE3n8qC9Gv1bzb+uSmLGoMuNi5mICuVGT935uZdChufG2RFnbO503hSkJc0qY8aez
	 dqX2Hd/J2v4i52BNV6i8WemAPhqEe5EHoBM0Rvx+nDQ9XpAh0t9awo72hBKDi5nZFpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxPcElVL;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327D606A32D
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 08:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0327D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bxPcElVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793952976; x=1825488976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J1ErWWiEd3msnk+uf+s2rNHmWwC06tEP64lSbWahi4M=;
  b=bxPcElVLjkNIaTp4ZO74/4t0XoR+5N/j8oXdUmAsZb68aWxVXKm1b5U4
   SqLKaZHm5Gidcl8TbukZrRtcqwJ0mZlAdH8jm9S+7iPKefFQDapnIcja6
   Gt/So7LFhigGUjqO5fMePzzGZ+P1k6CTepEoi40NWFuavo5lNjwyROdgp
   Oy3OiWqdLKotOMNGO86jLC8TuVTEB/f/ejWDHkOERpm5REnWblYI8jz3W
   7o4Il7f+WHpQCEhOEHWXy/YhwAwvZGKYfdwD//T7RsmH3Y6u4bEOvvT37
   GrFDLCHKq3As6Wyj+1rr6MpbZI5eFRTnD/CESxPvhpKpGbMsaN8kGz6bS
   w==;
X-CSE-ConnectionGUID: V87ak8bbQ0uQkvjh1aZvnA==
X-CSE-MsgGUID: QyadEZEyS92L8vQCIY+FqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2800964"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2800964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:16:15 -0800
X-CSE-ConnectionGUID: ekFrYTR9T9ejUcrEU3dzKA==
X-CSE-MsgGUID: eBE5q/kJQs6p0IGwbzDWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7648587"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.239]) ([10.124.241.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:16:14 -0800
Message-ID: <4272dd3f-fe79-48db-bac3-f22a6b352e41@linux.intel.com>
Date: Fri, 6 Nov 2026 16:16:12 +0800
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
Subject: Re: [PATCH 2/2] perf c2c: Show all memory regions in the region
 column
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20261106073018.903126-1-dapeng1.mi@linux.intel.com>
 <20261106073018.903126-2-dapeng1.mi@linux.intel.com>
 <sashiko-outbox-201007@kernel.org>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <sashiko-outbox-201007@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/6/2026 3:51 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] perf c2c: memory leak of c2c_he->regionstr in c2c_he_free()
> - [Low] perf c2c: calc_width() populates regionstr and width on child
>   entries
> --
>
> commit bee454704ac015d02d879348350c49da07d10fb5
> Author: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> perf c2c: Show all memory regions in the region column
>
> This commit updates perf c2c to record a bitmap of all sampled memory
> regions per histogram entry and format them into a heap-allocated string
> displayed in the memory region column.
>
>> diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
>> index f51fa23f3bf18..9c638fbfc2eaa 100644
>> --- a/tools/perf/builtin-c2c.c
>> +++ b/tools/perf/builtin-c2c.c
> [ ... ]
>
>> @@ -2264,6 +2239,52 @@ static int set_nodestr(struct c2c_hist_entry *c2c_he)
>>  	return c2c_he->nodestr ? 0 : -ENOMEM;
>>  }
>>  
>> +#define PERF_MEM_REGION_MASK	\
>> +	GENMASK(PERF_MEM_REGION_MEM7, PERF_MEM_REGION_MEM0)
>> +#define PERF_MEM_REGION_NUM	\
>> +	(PERF_MEM_REGION_MEM7 - PERF_MEM_REGION_MEM0 + 1)
>> +
>> +static int set_mem_region_str(struct c2c_hist_entry *c2c_he)
>> +{
>> +	char buf[32];
>> +	int len = 0;
>> +
>> +	if (c2c_he->regionstr)
>> +		return 0;
>> +
>> +	if (!c2c_he->regionset) {
>> +		len = scnprintf(buf, sizeof(buf), "N/A");
>> +		goto out;
>> +	}
>> +
>> +	if (c2c_he->regionset & BIT(PERF_MEM_REGION_MMIO)) {
>> +		len = scnprintf(buf, sizeof(buf), "MMIO");
>> +		if (c2c_he->regionset & PERF_MEM_REGION_MASK)
>> +			len += scnprintf(buf + len, sizeof(buf) - len, ",");
>> +	}
>> +
>> +	if (c2c_he->regionset & PERF_MEM_REGION_MASK) {
>> +		unsigned long regionset =
>> +			c2c_he->regionset >> PERF_MEM_REGION_MEM0;
>> +		int num = hweight_long(regionset);
>> +
>> +		len += scnprintf(buf + len, sizeof(buf) - len, "Mem-");
>> +		if (num > 1)
>> +			len += scnprintf(buf + len, sizeof(buf) - len, "{");
>> +		len += bitmap_scnprintf(&regionset, PERF_MEM_REGION_NUM,
>> +					buf + len, sizeof(buf) - len);
>> +		if (num > 1)
>> +			len += scnprintf(buf + len, sizeof(buf) - len, "}");
>> +	}
>> +
>> +out:
>> +	if (len > dim_dcacheline_mem_region.width)
>> +		dim_dcacheline_mem_region.width = len;\
>> +	c2c_he->regionstr = strdup(buf);
> [Severity: Low]
> Does c2c_he_free() leak c2c_he->regionstr?  c2c_he_free() frees
> c2c_he->nodestr and the other heap fields with zfree(), but does not free
> c2c_he->regionstr.

Yes, it's missed, would be added in the next version.


>
>> +
>> +	return c2c_he->regionstr ? 0 : -ENOMEM;
>> +}
>> +
>>  static void calc_width(struct c2c_hist_entry *c2c_he)
>>  {
>>  	struct c2c_hists *c2c_hists;
>> @@ -2271,6 +2292,7 @@ static void calc_width(struct c2c_hist_entry *c2c_he)
>>  	c2c_hists = container_of(c2c_he->he.hists, struct c2c_hists, hists);
>>  	hists__calc_col_len(&c2c_hists->hists, &c2c_he->he);
>>  	set_nodestr(c2c_he);
>> +	set_mem_region_str(c2c_he);
>>  }
> [Severity: Low]
> Should set_mem_region_str() only run for top-level cacheline entries (or
> when c2c_he->hists is non-NULL)?
>
> calc_width() is also called from filter_cb() for per-cacheline child
> entries, which do not display the dcacheline_mem_region column.  Running
> set_mem_region_str() on child entries allocates an unused regionstr for
> every child entry (including filtered ones) and can inflate
> dim_dcacheline_mem_region.width when a child's non-contiguous subset of
> regions (such as "Mem-{0,2,4}") formats wider than the parent cacheline's
> contiguous range (such as "Mem-{0-4}").

although currently the region column is only supported on the top-level
cacheline entries, but it would be extended the per-cacheline child view.
So let's keep what it is now.


>
