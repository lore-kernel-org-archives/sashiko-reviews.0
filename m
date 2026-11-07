Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010416;
	b=rJiQr3TTCZM69tCuFihtOxWKbdHVHXPAaC7Z+CRQeJIbNtLiLI+PuJ87v2tMDHvP6jkD
	 wEbmrFuiY2R+MHQZYAdbmRWqPz3DL2KV09c4aFya7/kiL4cQ57wUq00WMXhB6vXtlCpN3
	 Y9eI7U3oWb7vmOiS/UjduvmydB7lUmI+dgXgQdEyA1s3KmuZ/K6uVStmSeiHjahGGan1S
	 glaimOmMyXtowa2ipDxink8qvRrJ1b+C0hEivpR2tJahf4xOuvPRuh2PaOOWzT/pMgPxg
	 bo7IcSeawEctB7Xox7UXtUUAho5fAUV20DJ1Ipuo4siEY4pR6ItSnSYOskYrueqvAkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010416;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ek2T8JdKX+jRrd0aP0xXycQdDXqKG6PsGzx7JJ3Gg+M=;
	b=qRQGpsktpVo/sh6gnWhdzlCwLFO7N6spW0YKTCSLu+14/ktflkMoFYIC0c8oefjc2J6l
	 m2GKLCKWVmIcZbb63gkJZcoPOseAe1sURajOZKShgg+h3UCBM135HtJBX62rED5oZr/6f
	 6d5sMEvFzvyIAjkryPxZ5ThShix6EWjY0fZqahJn33JSL4pG47+3xpaUZ0P3CQPdYN12P
	 IbeSjN0G8f6SxJDoZmdzjZO9QjZ34JrK5xo/N9//+VXoCqWA+1ud+G9CBFcczeJl0Q0UV
	 y87uFHoev31o8HYJYzIcbgNYzwNTqmr4cbmpJ2166EIKw5zGZcSRKKgcuNeZCmDXOng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qCetRqg3;
	arc=none smtp.remote-ip=91.218.175.116
Received: from mta0.migadu.com (out-116.mta0.migadu.com [91.218.175.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94601606A32F
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 00:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94601606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qCetRqg3
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vvG+Uxy69h5Rlj++fEosfs0cnPRM22JQPxhhzwbZSg8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794010409; v=1; x=1794615209;
 b=qCetRqg3vpS4RaUPqpnea9DdT6MvygoVn2wYsKSgdmgU9pdefPlqcFFAsZ2UbbxET8NG0Ptm
 YlfM95v9zKGQRS5kLkQFJcuieWzrRkL7klFudkpYl7j/T1usX6eNagGfrwyV0/qhECsKGyX55XM
 RXX2ESz3IoO7eDsN4dQgNPXI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ccf32e6e6434499f;
	Sat, 07 Nov 2026 00:13:29 +0000
X-Mizu-Trace-ID: ccf32e6e6434499f
X-Migadu-Flow: FLOW_OUT
Message-ID: <224a0979-779b-4c7a-903b-7c3ac98a3d5a@linux.dev>
Date: Fri, 6 Nov 2026 17:13:23 -0700
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
Subject: Re: [PATCH bpf-next v1 2/2] bpf: Rely on callback frame
 initialization defaults
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261106232110.2867412-1-ihor.solodrai@linux.dev>
 <20261106232110.2867412-2-ihor.solodrai@linux.dev>
 <sashiko-outbox-202390@kernel.org>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <sashiko-outbox-202390@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 4:48 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] bpf: missing callback dynptr invalidation in
>   prepare_func_exit() [1]
> --
> 
> commit 468e6b1f0288b436ee1abb6fdbf7f6a231d967b2
> Author: Ihor Solodrai <ihor.solodrai@linux.dev>
> 
> bpf: Rely on callback frame initialization defaults
> 
> This commit removes redundant NOT_INIT register resets and default return
> range assignments from BPF verifier callback state setters, relying on the
> defaults already set by init_func_state().
> 
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 389488e4e7a74..831a9c0f8c458 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> 
> [ ... ]
> 
>> @@ -12126,15 +12110,9 @@ static int set_user_ringbuf_callback_state(struct bpf_verifier_env *env,
>>  	 *			  callback_ctx, u64 flags);
>>  	 * callback_fn(const struct bpf_dynptr_t* dynptr, void *callback_ctx);
>>  	 */
>> -	bpf_mark_reg_not_init(env, &callee->regs[BPF_REG_0]);
>>  	mark_dynptr_cb_reg(env, &callee->regs[BPF_REG_1], BPF_DYNPTR_TYPE_LOCAL);
>>  	callee->regs[BPF_REG_2] = caller->regs[BPF_REG_3];
>>  
>> -	/* unused */
>> -	bpf_mark_reg_not_init(env, &callee->regs[BPF_REG_3]);
>> -	bpf_mark_reg_not_init(env, &callee->regs[BPF_REG_4]);
>> -	bpf_mark_reg_not_init(env, &callee->regs[BPF_REG_5]);
>> -
>>  	callee->in_callback_fn = true;
>>  	callee->callback_ret_range = retval_range(0, 1);
>>  	return 0;
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch [1], but can the
> callback dynptr in R1 or a slice derived from it escape into a caller's
> stack frame via R2 (callback_ctx)?

Yeah. This is exactly what is addressed by the series
"bpf: Scope callback arguments to their frame":
https://lore.kernel.org/bpf/20261106231157.2840635-1-ihor.solodrai@linux.dev/


> 
> mark_dynptr_cb_reg() initializes R1 as a CONST_PTR_TO_DYNPTR with a fresh
> id and parent_id set to 0.  When callback_ctx points into an outer stack
> frame, check_stack_write_fixed_off() only blocks spilling PTR_TO_STACK
> into a caller's frame, so the callback can spill R1, spill a PTR_TO_MEM
> slice derived from R1, or clone R1 into the caller's stack via
> bpf_dynptr_clone().
> 
> On callback return, prepare_func_exit() calls
> destroy_dynptrs_in_stack_slots() only on the callee's own stack frame and
> never invalidates references tied to R1's id in outer frames.  Because the
> underlying struct bpf_dynptr_kern lives on the kernel C stack of
> bpf_user_ringbuf_drain() and the sample is released after each callback
> invocation, the escaped dynptr or slice remains accessible in the caller
> after bpf_user_ringbuf_drain() returns, leading to kernel stack
> use-after-return and use-after-release of user ring buffer samples.
> 
> [1] https://sashiko.dev/#/bug/linux-05b65197-996a-40dd-bf7b-7710de2720b4
> 

