Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80553101A5
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306484; cv=none; b=MsNX6UtjyVhcXX5Y3sZfdHG6lgfFC5a06eK1XqG3dXzLUkh0b4z0lBlTIxojIQ/6+g7fNRSm/AnrdxnnH+j3RhgftZgbY1vkbUlMTKzPdZB4TWVZgxB12hxt4P0lJWlpqXEg5woUZuK3uuh1g7g5Pj7wOSuNMspo37LdVbUHyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306484; c=relaxed/simple;
	bh=/waf0XQvjk0H10MjZ4QUZRMk5ieelEf0YGayWnrzenI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWxSKXe4aTWnTVsW6F9L7IpUB0fqp38vkCAhrxSpO5kW5mXH1nkQQySG/bBEdL3svai02hSnD/Iay6QBmX/s5QpytmFPRTnQqeeb+EMeOrmQ7M2fIpmeAYgUlTzbH5h1+TuKkGJx6yG8HsmEFT54000KzuPgPGiWCivdMxp+9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lwZWQPhp; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lwZWQPhp"
Message-ID: <c25b272d-5975-4fd1-be3f-6b5a0522cbee@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785306479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTKMOzyJT3XVDunTQT4HsxFCad0Svgvht0V0qG/fe6o=;
	b=lwZWQPhpVCVxyyBLH1gbsTw6+orejMpom+wCp+OYkEg904a1gUajsX5d472e+U0FPGL2Qu
	HnHtWjskt7FcdzfRyMZiSZrvgddCEBc1wd8C5FMIRiTn8CskN92cF7WC41KlbESpN2XrhJ
	cprF/ip5GoY/qZaxdOu3guXg6TNQ/H0=
Date: Wed, 29 Jul 2026 14:27:48 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-reviews@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
 bpf@vger.kernel.org
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev>
 <20260727145217.72B9C1F000E9@smtp.kernel.org>
 <be7399e2-06ac-4e6f-bea7-8c51738a1e4d@linux.dev>
 <20260728114602.62e8852a@gandalf.local.home>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260728114602.62e8852a@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 28/7/26 23:46, Steven Rostedt wrote:
> On Tue, 28 Jul 2026 10:19:22 +0800
> Leon Hwang <leon.hwang@linux.dev> wrote:
> 
>> On 27/7/26 22:52, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>
>>> Pre-existing issues:
>>> - [High] Missing RCU read barrier (`rcu_dereference()`) when accessing `direct_functions`.
>>> --
>>>
>>> --- Patch [1]: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct calls ---
>>> commit 738274783fa707248af104af5e45da296f7e4d84
>>> Author: Leon Hwang <leon.hwang@linux.dev>
>>>
>>> arm64: ftrace: enable single ftrace_ops for direct calls
>>>
>>> The BPF tracing multi link updates several direct-call sites through one
>>> ftrace_ops. This commit selects HAVE_SINGLE_FTRACE_DIRECT_OPS on arm64 when
>>> DYNAMIC_FTRACE_WITH_DIRECT_CALLS is enabled. It also generalizes the
>>> unreachable-trampoline comment.
>>>   
>>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>>> index 39eba438dad43..94fa6e72c2867 100644
>>>> --- a/arch/arm64/Kconfig
>>>> +++ b/arch/arm64/Kconfig
>>>> @@ -188,6 +188,8 @@ config ARM64
>>>>  		    CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS)
>>>>  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
>>>>  		if DYNAMIC_FTRACE_WITH_ARGS
>>>> +	select HAVE_SINGLE_FTRACE_DIRECT_OPS \
>>>> +		if DYNAMIC_FTRACE_WITH_DIRECT_CALLS  
>>>
>>> [Severity: High]
>>> This is a pre-existing issue, but by enabling HAVE_SINGLE_FTRACE_DIRECT_OPS
>>> on arm64, does this expose the architecture to a missing RCU read barrier
>>> in the ftrace code?
>>>
>>> When HAVE_SINGLE_FTRACE_DIRECT_OPS is selected, call_direct_funcs() switches
>>> from using READ_ONCE(ops->direct_call) to using ftrace_find_rec_direct():
>>>
>>> kernel/trace/ftrace.c:call_direct_funcs() {
>>> ...
>>> #ifdef CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS
>>> 	addr = ftrace_find_rec_direct(ip);
>>> #else
>>> ...
>>> }
>>>
>>> Looking at ftrace_find_rec_direct(), it accesses the __rcu pointer
>>> direct_functions directly without an rcu_dereference():
>>>
>>> kernel/trace/ftrace.c:ftrace_find_rec_direct() {
>>> 	struct ftrace_func_entry *entry;
>>>
>>> 	entry = __ftrace_lookup_ip(direct_functions, ip);
>>> ...
>>> }
>>>
>>> Without the READ_ONCE() provided by rcu_dereference(), the compiler might
>>> reload the pointer between computing the hash key and accessing the bucket
>>> array inside __ftrace_lookup_ip().
>>>
>>> If a concurrent writer substitutes a new hash table with a different size
>>> between these reloads, could the computed key exceed the new bucket array
>>> bounds and lead to an out-of-bounds dereference?
>>>   
>>
>>
>> Hi Steve, Masami,
>>
>> Could you take a look at this issue? The issue looks legitimate.
> 
> Yeah, it's possible (but unlikely) for the compiler to do that. But there's
> nothing harming the code to do:


Good to know it's unlikely in practice.

If you don't mind, I'll send a separate patch for the fix based on the
diff below. It compiles and works fine in my testing.

Thanks,
Leon

> 
> ( Untested and not even compiled )
> 
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index f93e34dd2328..5ec494790312 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -2639,7 +2639,8 @@ unsigned long ftrace_find_rec_direct(unsigned long ip)
>  {
>  	struct ftrace_func_entry *entry;
>  
> -	entry = __ftrace_lookup_ip(direct_functions, ip);
> +	guard(preempt_notrace)();
> +	entry = __ftrace_lookup_ip(rcu_dereference_sched(direct_functions), ip);
>  	if (!entry)
>  		return 0;
>  
> 
> -- Steve
> 

