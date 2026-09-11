Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607D40B38D
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121058; cv=none; b=IUCOvj7g1ShXwsv58wgICPlQc5sbpI2ON1X0PhDHqT7k2T4T65JugscgvOm9B+guzuuWGAZOMlx2h/oxI5afC63WzkS2v1eLyHaU03VQYa5g9O5ad6PiTNaFGa3rCtrP5+nZ/AOKHsuDT0uW3cqcQJtHj0cUsRbX/31YLQzRB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121058; c=relaxed/simple;
	bh=+W15SB3Tv4vc5frlSBx4ny2SusYP5WVGVaAt97Qhd94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhOJUKI57bd/9V9M2S2SDL2ftAucpCDGZgAexLBadDY9rk3i+cAqUcGJ3pTWsMHzmhUtBEHYDWN1lqWLZHnn0mU5KfYs4NsxPaIcXkqhWcSR8qWa1yIkP9vbbY+XjyR9cPVMRDB+w3lttJpJl6RlyLjSPD6MvPUu0fwUPh433oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PNazR5Qo; arc=none smtp.client-ip=91.218.175.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PNazR5Qo"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=+W15SB3Tv4vc5frlSBx4ny2SusYP5WVGVaAt97Qhd94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789121054; v=1; x=1789725854;
 b=PNazR5QoOSKdwvpn0OS2ikwypHTCb0DFFf7pHcIkA/BX7x7imc1MHsq8+Rm3cFg0S0oTGNjB
 M9rscaWx51hyf/91p1wtH6IdxDUdpPXt5ta40X4kxEy3RZOVA2vpH4P62H6UTysC65CH4ut5Phu
 YVqR4+mrHP2+hCyLiJ61yCfg=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d4790ab53fe27c53;
	Fri, 11 Sep 2026 10:04:14 +0000
X-Mizu-Trace-ID: d4790ab53fe27c53
X-Migadu-Flow: FLOW_OUT
Message-ID: <4b665836-496d-4987-84b6-055c0efd4f78@linux.dev>
Date: Fri, 11 Sep 2026 18:04:11 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/mglru: add tracepoint for scan_folios()
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
References: <20260911072848.2346073-1-ridong.chen@linux.dev>
 <20260911072848.2346073-3-ridong.chen@linux.dev>
 <20260911074246.03CA11F000FF@smtp.kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260911074246.03CA11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/2026 3:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Evaluating pointer dereferences at the tracepoint call site adds unnecessary overhead when tracing is disabled.
> --
> 
> commit 3d7b5caa2f51b1f8f623f8379f3a020ee141f537
> Author: Ridong Chen <chenridong@xiaomi.com>
> 
> mm/mglru: add tracepoint for scan_folios()
> 
> This commit introduces a new MGLRU-specific tracepoint,
> mm_mglru_scan_folios, to report scan and isolate counts along with
> MGLRU-specific context like memcg ID, generation, and tier. The tracepoint
> is placed alongside the classic-LRU tracepoint in scan_folios().
> 
>> diff --git a/include/trace/events/vmscan.h b/include/trace/events/vmscan.h
>> --- a/include/trace/events/vmscan.h
>> +++ b/include/trace/events/vmscan.h
> [ ... ]
>> +TRACE_EVENT(mm_mglru_scan_folios,
>> +
>> +	TP_PROTO(u64 memcg_id,
>> +		int highest_zoneidx,
> 
> [Severity: Medium]
> Does this prototype incorrectly accept an evaluated u64 instead of a pointer?
> 
> Accepting the evaluated value here forces evaluation at the call site.
> Could we pass the struct lruvec pointer in the prototype instead, so the
> expensive pointer dereferences can happen safely inside TP_fast_assign
> where they only execute when tracing is enabled?
> 
>> +		int order,
> [ ... ]
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
> [ ... ]
>> @@ -4927,6 +4927,12 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>>   	trace_mm_vmscan_lru_isolate(sc->reclaim_idx, sc->order, nr_to_scan,
>>   				scanned, skipped, isolated,
>>   				type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON);
>> +	trace_mm_mglru_scan_folios(mem_cgroup_id(lruvec_memcg(lruvec)),
>> +				   sc->reclaim_idx, sc->order, nr_to_scan,
> 
> [Severity: Medium]
> Can this introduce unnecessary overhead on the memory reclaim hot path?
> 
> Because trace_mm_mglru_scan_folios evaluates its arguments before checking
> the tracepoint's static key, calling mem_cgroup_id(lruvec_memcg(lruvec))
> here forces multiple pointer dereferences to happen unconditionally.
> 
> The compiler cannot optimize them into the inactive branch because it cannot
> prove the arbitrary pointer accesses won't trap. Placing the dereferences
> inside TP_fast_assign avoids this execution when tracing is disabled.
> 

Thanks, will pass lruvec instead in v2.

>> +				   scanned, sorted, skipped, isolated,
>> +				   type ? LRU_INACTIVE_FILE : LRU_INACTIVE_ANON,
>> +				   lrugen->max_seq, tier,
>> +				   lrugen->min_seq[type]);
>>   
>>   	*isolatedp = isolated;
>>   	return scanned;
> 

-- 
Best regards
Ridong

