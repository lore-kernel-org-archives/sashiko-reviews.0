Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605369;
	b=xOt8q20hG1xaEgJdIK38V9djO6dvI/ur/0UajnsRCc7sKWQevdii3Iv8wjTYXe4ohgnt
	 UP7ais19AIhKSN4UFKhkmA4EKC7eu6yVt6fKn0myobZiBydg3WVZdHtCT1Qefz1uZJsAk
	 orFMGX/Z4RljL4G7g4lKXFe4Vpqa+shyUB2yVNiGbidXGHLoiMQLHeaCg1axOcPGB8Vb/
	 cZFS7cZDaUxMunCb2eLne+SRhck1C3S2exwtcM/WDyLG4K+L9CtXmOkgKAEoVTDvyzeFU
	 i3Zw0ouIHs++xdIPCxHExQwpCRZ3c3lSb6DhNOZlCbdTq7Wi8uz9lZPbnIkJRP7pDgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605369;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TqhmT3zzwgjEqD3sonXGsJG7hfDHBxIZreM+m1+TOGg=;
	b=1Xk0uobyOzoeIqk27xdESny24PDuHOqMe8gF3YmxcZpr8PDKOAZ5ZCwku+rhVrrA+KSq
	 LFp9WjS71JlUmWEZM/HKiJyLYFSJny6Ue4R6FMCnW76bjf9eDgFVlPqUMmF2O1/jkRB52
	 bYD5Izxm/zjJcu7rnegWEoQ4H7+YoKZO/5cAY6lSYAyqTy9SX8B3A/EungVI5TmdJKt9h
	 i4/s+uZwcJZ1+z5Q6ecRmmJ21Z1fG0PYJoHjMuz5dAzApWHUB1EXmxIscitB+ZGVdy9ht
	 e4iNmhpCXuZujvhyUFHi6+xA5WqzXX8rnyPi0esxT69R60uORjTIJFuiW7eDOCFp1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p2iKCLQx;
	arc=none smtp.remote-ip=91.218.175.119
Received: from mta0.migadu.com (out-119.mta0.migadu.com [91.218.175.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B44606A31D
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 17:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B44606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p2iKCLQx
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uJr1MDyW1DaFhj9hIHiQ+HWYF6EIfeHGqPHiC+1ZAzk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792605365; v=1; x=1793210165;
 b=p2iKCLQx+RXrIxj6DpCXojAT80roQ262u8/Yp/doEo8dlXU83BTOIdzZUPtMPOdykhNhcVjF
 yW9WB9/Vz8oMcxHoH0Rm7thh7TxtkDXZ6Fs6gzab285KpzhRfzLQulAAYbY7TPufUZ7GD39M6zy
 29QIG76t9+YshQOJP+Nuy9fQ=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0f8ee1d09eff9576;
	Wed, 21 Oct 2026 17:56:05 +0000
X-Mizu-Trace-ID: 0f8ee1d09eff9576
X-Migadu-Flow: FLOW_OUT
Message-ID: <131319e8-7f92-4297-a07e-fc97a094e3a6@linux.dev>
Date: Wed, 21 Oct 2026 10:56:02 -0700
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
Subject: Re: [PATCH v4 2/2] tracing: fgraph: use scoped_guard() for the task
 list walk
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20261021174406.2891598-1-vineet.gupta@linux.dev>
 <20261021174406.2891598-3-vineet.gupta@linux.dev>
 <sashiko-outbox-180533@kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-180533@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 10:53 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] tracing: fgraph: mix of scoped_guard() and goto in alloc_retstack_tasklist()
> --
>
> commit 7d59298fba17927bc12b63b0da1c66b0d138332a
> Author: Vineet Gupta <vineet.gupta@linux.dev>
>
> tracing: fgraph: use scoped_guard() for the task list walk
>
> This commit replaces the explicit rcu_read_lock() and rcu_read_unlock() pair
> in alloc_retstack_tasklist() with scoped_guard(rcu) and removes the unlock
> label by jumping to the free label on the -EAGAIN path.
>
>> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
>> index 4c74f1a15ad48..bbf6e4e2da2d4 100644
>> --- a/kernel/trace/fgraph.c
>> +++ b/kernel/trace/fgraph.c
>> @@ -1057,32 +1057,31 @@ static int alloc_retstack_tasklist(unsigned long **ret_stack_list)
>>   		}
>>   	}
>>   
>> -	rcu_read_lock();
>> -	for_each_process_thread(g, t) {
>> -		unsigned long *rs;
>> +	scoped_guard (rcu) {
>> +		for_each_process_thread(g, t) {
>> +			unsigned long *rs;
>>   
>> -		if (t->ret_stack)
>> -			continue;
>> +			if (t->ret_stack)
>> +				continue;
>>   
>> -		rs = kmem_cache_alloc(fgraph_stack_cachep, GFP_NOWAIT);
>> -		if (!rs) {
>> -			if (start == end) {
>> -				ret = -EAGAIN;
>> -				goto unlock;
>> +			rs = kmem_cache_alloc(fgraph_stack_cachep, GFP_NOWAIT);
>> +			if (!rs) {
>> +				if (start == end) {
>> +					ret = -EAGAIN;
>> +					goto free;
>> +				}
>> +				rs = ret_stack_list[start++];
>>   			}
>> -			rs = ret_stack_list[start++];
>> -		}
>>   
>> -		atomic_set(&t->trace_overrun, 0);
>> -		ret_stack_init_task_vars(rs);
>> -		t->curr_ret_stack = 0;
>> -		t->curr_ret_depth = -1;
>> -		/* Make sure the tasks see the 0 first: */
>> -		smp_store_release(&t->ret_stack, rs);
>> +			atomic_set(&t->trace_overrun, 0);
>> +			ret_stack_init_task_vars(rs);
>> +			t->curr_ret_stack = 0;
>> +			t->curr_ret_depth = -1;
>> +			/* Make sure the tasks see the 0 first: */
>> +			smp_store_release(&t->ret_stack, rs);
>> +		}
>>   	}
>>   
>> -unlock:
>> -	rcu_read_unlock();
>>   free:
>>   	for (i = start; i < end; i++)
>>   		kmem_cache_free(fgraph_stack_cachep, ret_stack_list[i]);
> [Severity: Low]
> In kernel/trace/fgraph.c, alloc_retstack_tasklist() now uses
> scoped_guard(rcu) while still jumping out of the guarded scope via goto free
> when kmem_cache_alloc(fgraph_stack_cachep, GFP_NOWAIT) fails and start == end,
> as well as jumping to free from the earlier pre-allocation loop:
>
> kernel/trace/fgraph.c:alloc_retstack_tasklist() {
> 	for (i = 0; i < FTRACE_RETSTACK_ALLOC_SIZE; i++) {
> 		ret_stack_list[i] = kmem_cache_alloc(fgraph_stack_cachep, GFP_KERNEL);
> 		if (!ret_stack_list[i]) {
> 			start = 0;
> 			end = i;
> 			ret = -ENOMEM;
> 			goto free;
> 		}
> 	}
> }
>
> The documentation in include/linux/cleanup.h notes that goto-based cleanup
> and scope-based cleanup helpers should not be mixed within the same function:
>
>   * Lastly, given that the benefit of cleanup helpers is removal of
>   * "goto", and that the "goto" statement can jump between scopes, the
>   * expectation is that usage of "goto" and cleanup helpers is never
>   * mixed in the same function. I.e. for a given routine, convert all
>   * resources that need a "goto" cleanup to scope-based cleanup, or
>   * convert none of them.
>
> Also, on the -EAGAIN path inside scoped_guard(rcu), start == end is already
> true because all pre-allocated entries in ret_stack_list[] have been consumed,
> so the cleanup loop at the free label runs zero iterations on that path.
>
> Should alloc_retstack_tasklist() avoid mixing scoped_guard(rcu) with goto
> free?

This has been discussed before and it was agreed this is fine.

Thx,
-Vineet
