Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50D246BCD
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 02:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205182; cv=none; b=oXvjqh8CKqRGMfJvh0JAtAx1FQT63Y/rWO8gc581v9E0ywFT//jg4odKxQJlsdAoMxBSZ5jtuXbCop+vDb8YeUWhne21zfJE47VULPZaHiB09Ihc8DfMIdjLFj13ymzZ85/A3GG2kKYcg3w7x42fVbxEmDsMMwHCe8BVVvVlz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205182; c=relaxed/simple;
	bh=SqPMjaZjQxPhXKxMaC/bSfCPOqdvBNF/nkhnYbm/wbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZasiLpc/KtgAjzjWcjqH3gzAbQ9p7NpOjx99FoyVABqeddtjVwIt5r47IClM7Xcrvp8oYTkCcJ9gld3XHHjzfkZxwW18dbKIG72ddtSrps52kH4ldStUY0XLFcYRHJGDJtt3Tp9Z9sjgTlOjpjp8TVFG4lymy5IiIie2ylh8Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lb23ISHv; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lb23ISHv"
Message-ID: <be7399e2-06ac-4e6f-bea7-8c51738a1e4d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785205177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/fwzA7fSyb/Nifu3Y4hk0eZnK5LbJCKzCKIOs7RjH0=;
	b=Lb23ISHvLFfeiRdQzbf/ICoG1IaeV6TTnu90XAuLS7Kpv73wJgwS/mpdP3tLSYL86sEZaR
	kS5Myh3fpnHCV2kgmaoBYOv8zEgc/VHRhr7AReBZtFklFukPqnL8aUQGKTWxzBh8v4TwKp
	Bt3om28rsnxTLYO2M1yQa1RIZfVTZPM=
Date: Tue, 28 Jul 2026 10:19:22 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
To: sashiko-reviews@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: bpf@vger.kernel.org
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <20260727145217.72B9C1F000E9@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260727145217.72B9C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 27/7/26 22:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing RCU read barrier (`rcu_dereference()`) when accessing `direct_functions`.
> --
> 
> --- Patch [1]: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct calls ---
> commit 738274783fa707248af104af5e45da296f7e4d84
> Author: Leon Hwang <leon.hwang@linux.dev>
> 
> arm64: ftrace: enable single ftrace_ops for direct calls
> 
> The BPF tracing multi link updates several direct-call sites through one
> ftrace_ops. This commit selects HAVE_SINGLE_FTRACE_DIRECT_OPS on arm64 when
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS is enabled. It also generalizes the
> unreachable-trampoline comment.
> 
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 39eba438dad43..94fa6e72c2867 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -188,6 +188,8 @@ config ARM64
>>  		    CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS)
>>  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
>>  		if DYNAMIC_FTRACE_WITH_ARGS
>> +	select HAVE_SINGLE_FTRACE_DIRECT_OPS \
>> +		if DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> 
> [Severity: High]
> This is a pre-existing issue, but by enabling HAVE_SINGLE_FTRACE_DIRECT_OPS
> on arm64, does this expose the architecture to a missing RCU read barrier
> in the ftrace code?
> 
> When HAVE_SINGLE_FTRACE_DIRECT_OPS is selected, call_direct_funcs() switches
> from using READ_ONCE(ops->direct_call) to using ftrace_find_rec_direct():
> 
> kernel/trace/ftrace.c:call_direct_funcs() {
> ...
> #ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
> 	addr = ftrace_find_rec_direct(ip);
> #else
> ...
> }
> 
> Looking at ftrace_find_rec_direct(), it accesses the __rcu pointer
> direct_functions directly without an rcu_dereference():
> 
> kernel/trace/ftrace.c:ftrace_find_rec_direct() {
> 	struct ftrace_func_entry *entry;
> 
> 	entry = __ftrace_lookup_ip(direct_functions, ip);
> ...
> }
> 
> Without the READ_ONCE() provided by rcu_dereference(), the compiler might
> reload the pointer between computing the hash key and accessing the bucket
> array inside __ftrace_lookup_ip().
> 
> If a concurrent writer substitutes a new hash table with a different size
> between these reloads, could the computed key exceed the new bucket array
> bounds and lead to an out-of-bounds dereference?
> 


Hi Steve, Masami,

Could you take a look at this issue? The issue looks legitimate.

Thanks,
Leon

