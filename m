Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C84E323B
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559461; cv=none; b=IrWGkLkMrg4BCDvVLz7WRdyByYINfEUj4W+T4ZzynKEZaUIk6M+dIdpCEcSrVGEm2ZJHDtDGR302aoDTrcCepQYi64G/8eQ6Ui7jfTdBPSMqcrGIBBz0hDuk4rsIxZV+6vXe9O2xYbO5lSFy5Dzrz08zrzmLUpCr7S/vqukZ5g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559461; c=relaxed/simple;
	bh=K64JNADzp0N1kW7sFwREv2m/+V717OimyCitmYtVhgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b09PaI9XNKgmgLc9A9Jz6QTxgpafh9myEjrH0wsb+siUytg8fIYwg04fBu1f6Un/OuRfQTYR6B4p9kRxs0rRHI9xie3vSSXe9ylB2EuftXIXM7pJCh85hDUhlX3VdVCWqhS0xValJdhjAYj6kSvolaiXwMFXT1KuIjf9lL3EZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qjVQgbjt; arc=none smtp.client-ip=91.218.175.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qjVQgbjt"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=K64JNADzp0N1kW7sFwREv2m/+V717OimyCitmYtVhgM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791559455; v=1; x=1792164255;
 b=qjVQgbjt7KqoX7X/Hi66voHahbEP7BWHsjvbukbHOhSXQM8hpXIbnGwq9aS6WenbimSSU/+q
 jlX5WbDuTxNPSrAdscdDPe1jG1nmanXDbUYTKjLhFVrP0zS+tXsNhrVVWY57KRVYOCOaNEKnLB9
 zpuAD6k+fLcXsFQSsF7Qeg4A=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2a88ffb8c053162c;
	Fri, 09 Oct 2026 15:24:15 +0000
X-Mizu-Trace-ID: 2a88ffb8c053162c
X-Migadu-Flow: FLOW_OUT
Message-ID: <859a751b-2af6-4dd5-be9b-368f697e347b@linux.dev>
Date: Fri, 9 Oct 2026 17:24:15 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v10 07/24] bpf: Verify an unwind through landing
 pads and epilogues
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261009041447.17092-1-yonghong.song@linux.dev>
 <20261009041523.26992-1-yonghong.song@linux.dev>
 <sashiko-outbox-164848@kernel.org>
Content-Language: en-GB
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <sashiko-outbox-164848@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/26 6:40 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] bpf: skipped exception pad verification for global subprogs that throw and unwind
> - [Medium] bpf: Soft lockup in mark_callx_might_unwind() due to O(N^2) instruction traversal
> --
>
> commit 54596ff7029b639349bb84341497b649e38e027e
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Verify an unwind through landing pads and epilogues
>
> This commit adds verifier support for tracking control flow through
> unwind landing pads and epilogues. It calculates whether a subprogram
> might unwind by propagating the might_unwind flag along the CFG,
> and integrates backtracking through these new paths.
>
>> diff --git a/kernel/bpf/cfg.c b/kernel/bpf/cfg.c
>> --- a/kernel/bpf/cfg.c
>> +++ b/kernel/bpf/cfg.c
>> @@ -716,6 +753,82 @@
> [ ... ]
>
>> +static void mark_callx_might_unwind(struct bpf_verifier_env *env)
>> +{
>> +	struct bpf_insn *insns = env->prog->insnsi;
>> +	struct bpf_subprog_info *caller, *callee;
>> +	int i, j, len = env->prog->len;
>> +	struct bpf_func_ptr *ptrs;
>> +	bool changed;
>> +	u32 cnt;
>> +
>> +	if (!addr_taken_subprog_might_unwind(env))
>> +		return;
>> +
>> +	for (i = 0; i < len; i++)
>> +		if (bpf_is_callx(&insns[i]))
>> +			bpf_find_containing_subprog(env, i)->might_unwind = true;
>> +
>> +	do {
>> +		changed = false;
>> +		for (i = 0; i < len; i++) {
>> +			caller = bpf_find_containing_subprog(env, i);
>> +			if (caller->might_unwind)
>> +				continue;
> [Severity: Medium]
> Could this loop cause a CPU soft lockup for very large BPF programs?
>
> The loop iterates up to len times (which can be up to 1 million) and
> repeatedly calls bpf_find_containing_subprog(), which performs a binary
> search. Because this propagates upward through the call graph, the do-while
> loop could execute many times (e.g., up to 256 for the maximum call depth).
>
> Without a cond_resched(), this might stall the CPU in kernel space for an
> extended period.

It is a little bit premature to add cond_resched(). If later on, we have
such a case, we can add then.

>
> [ ... ]
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -19464,8 +19602,14 @@ static int do_check_insn(struct bpf_verifier_env *env, bool *do_print_state)
>>   				cur_func(env)->no_stack_arg_load = true;
>>   			if (bpf_is_callx(insn))
>>   				return check_func_callx(env, insn, &env->insn_idx);
>> -			if (insn->src_reg == BPF_PSEUDO_CALL)
>> -				return check_func_call(env, insn, &env->insn_idx);
>> +			if (insn->src_reg == BPF_PSEUDO_CALL) {
>> +				int call_idx = env->insn_idx;
>> +
>> +				err = check_func_call(env, insn, &env->insn_idx);
>> +				if (err)
>> +					return err;
> [Severity: High]
> If a global subprogram has the might_throw flag set, check_func_call()
> simulates the exception exit and returns PROCESS_BPF_EXIT (which is 1).
>
> Because err is positive, does the check here mistakenly return early,
> bypassing the subsequent call to process_global_call_unwind()?
>
> If the subprogram can both throw and unwind, its landing pad might never be
> visited by the verifier, potentially leading to a dead code sanitization trap
> at runtime.

In bpf_check(), we have
         if (env->cleanup_info_cnt || bpf_prog_may_unwind(env)) {
                 ret = bpf_exc_check_prog(env);
                 if (ret)
                         goto skip_full_check;
         }
where bpf_prog_may_unwind(env) is added in later patch.
With the above 'if' condition, bpf_throw() will be rejected
if (env->cleanup_info_cnt || bpf_prog_may_unwind(env)) is true.

>
>> +				return process_global_call_unwind(env, call_idx, do_print_state);
>> +			}
>>   			if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL)
>>   				return check_kfunc_call(env, insn, &env->insn_idx);
>>   			return check_helper_call(env, insn, &env->insn_idx);

