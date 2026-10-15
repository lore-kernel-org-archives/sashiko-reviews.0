Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B362857EA
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070326; cv=none; b=KsPlu1vzz5SpEenvbgByrf45wVY1F6jhG9/zNq+KUozBe1AWrWW+tmtUbBwEySI1l96r6JgJN/amapRSDGX7wapvauDMWDKCkAVpDpeUq/9Nhg5cV9t99qiNr4aCgJILKtpwoUC6x7o+b5G4vTi61Ud/gANMChY4QaF1ZlXTI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070326; c=relaxed/simple;
	bh=trohsEvv7hNyn5Jb7hqgMeSqVcwIoxbAV2jFC8m/brM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chWfVbmTwgKSkUK+6NG7meM/+nH0bjj11fy/o2cCAQBy8U79V58QZCbpn1NQtGKeYcs3IERaS7YqGDBL+23k1gXLic1cpSCf7XoJ2o7D5Qkn5LdBLCJel/VBqmwRT/0cujTR75MvQlHe9jL9VE+qpGnvLmg3KF5+c5fXYieXLyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vfKdtCr8; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vfKdtCr8"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=trohsEvv7hNyn5Jb7hqgMeSqVcwIoxbAV2jFC8m/brM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792070322; v=1; x=1792675122;
 b=vfKdtCr8eQZY8ONHG4o/kKGDanOvO+Fjmyq4Jq28rK8vIKPJg03wiTyQ6HKgPHGbv55x01mP
 /sAuPED7zT1vYwbVfogS8TvBg3labsThuV3xpHTQPRseDElBcSkhQY4sejwwMes3iPqPNHhVDuc
 1IuJYFISKMDh03BqQNyP14ZM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id bbd6ad823cf6e48c;
	Thu, 15 Oct 2026 13:18:42 +0000
X-Mizu-Trace-ID: bbd6ad823cf6e48c
X-Migadu-Flow: FLOW_OUT
Message-ID: <491ef605-d921-4bad-b9fd-5927782c2b14@linux.dev>
Date: Thu, 15 Oct 2026 21:19:48 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Fix crash in print_graph_function_event()
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
References: <20261015080351.121316-1-hao.ge@linux.dev>
 <sashiko-outbox-172455@kernel.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <sashiko-outbox-172455@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/10/15 16:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] trace: Transient NULL pointer deref in tracing_set_tracer() due to non-atomic update
> --
> 
> commit 8e34d0e2d1517b818cf24f9067ddfaa0e4b47cd2
> Author: Hao Ge <hao.ge@linux.dev>
> 
> tracing: Fix crash in print_graph_function_event()
> 
> This commit attempts to fix a NULL pointer dereference in
> print_graph_function_event() by ensuring tr->current_trace_flags is never
> NULL. It provides a fallback to a static empty no_tracer_flags when a
> selected tracer has no flags defined.
> 
> v1 Link: https://lore.kernel.org/all/20260920042139.70736-1-hao.ge@linux.dev/
> 
>> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
>> index e4a490d3d08c8..fba9521d25115 100644
>> --- a/kernel/trace/trace.c
>> +++ b/kernel/trace/trace.c
> [ ... ]
>> @@ -1319,6 +1325,8 @@ static int run_tracer_selftest(struct tracer *type)
>>  
>>  	tr->current_trace = type;
>>  	tr->current_trace_flags = type->flags ? : type->default_flags;
>> +	if (!tr->current_trace_flags)
>> +		tr->current_trace_flags = &no_tracer_flags;
> 
> [Severity: High]
> Does this non-atomic double assignment expose a transient NULL pointer to
> concurrent lockless readers?
> 
> A concurrent reader might fetch tr->current_trace_flags during the brief
> window between the first store (which writes NULL if the tracer lacks flags)
> and the second store.
> 
> Could we compute the new flags pointer into a local variable first, and then
> assign it to tr->current_trace_flags in a single store, perhaps using
> WRITE_ONCE()?
> 
> [ ... ]
>> @@ -5090,6 +5098,8 @@ int tracing_set_tracer(struct trace_array *tr, const char *buf)
>>  	}
>>  
>>  	tr->current_trace_flags = t->flags ? : t->tracer->flags;
>> +	if (!tr->current_trace_flags)
>> +		tr->current_trace_flags = &no_tracer_flags;
> 
> [Severity: High]
> Can this similarly result in a regression with a transient NULL pointer
> dereference?
> 
> While tracing_set_tracer() holds trace_types_lock, readers accessing the
> trace file (via seq_read() -> s_show() -> print_trace_line() ->
> print_graph_function_event()) iterate locklessly.
> 
> If a concurrent reader observes the intermediate NULL value, it will
> dereference it (e.g., tr->current_trace_flags->val), leading to the exact
> kernel panic this patch is meant to fix.
> 

Thanks, V3 will fix this.
https://lore.kernel.org/all/20261015130658.221198-1-hao.ge@linux.dev/

Best Regards
Hao
