Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBD2882B7
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774866; cv=none; b=OUtOTdOjpf3STedJu/68nX0bbiP1p+Vkd1AtlppNslLumlOd7ylH9XZ2YbBOX6OEcn417VbIoQTj6QudX7woOJziY0GxAC+InVvDmj21J3h55l6EJZw1bcnLPkKQe3U67DC9hQ9Oi5+pVpLPgHlIRVMsBXf3fuWMoU8PrvMbzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774866; c=relaxed/simple;
	bh=ty58WcXPAydchM571MmZb2AXta8xY/EwAKamRKtB5/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moLm84P7PvRefzHFQsRj7TMGbnN6V/C+CJ9ccQAunwRSQC9T5vFYIg1ksr4GFprqsApwiQaM45GDCW1JTMgwthGchxEmqOgc0uKlbx6ytWzX5NMNTHnNwsRkgQkNvLjeigjilpj7CVH/5Xw0YCRvSfd327qJTkxvjAOxGyl7DeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P5ToL46i; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P5ToL46i"
Message-ID: <9797c09e-432b-4ff6-81a7-9ca44571ff8b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778774862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKstYJLweobTgz553FOl56gOTveSg9NSj5BK0hdL9yU=;
	b=P5ToL46iOltJ+sFfhWAJmSAzX3lRR6gpT2vTVT30y3ZWUmvLoeamu3yIOJQWge0o5Tsn5J
	swDwztduztVgtVLt4c54V8+h1sfmwXjQyNfutomNwQpyswgULGG1tTSYjZvzKFem0mJKHJ
	i9LGADjr2TnYVY0pRk1lDJ4evkEwiHs=
Date: Thu, 14 May 2026 09:07:34 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 05/25] bpf: Support stack arguments for bpf
 functions
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260513045015.2385013-1-yonghong.song@linux.dev>
 <20260514104638.BD792C2BCB3@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260514104638.BD792C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 5/14/26 12:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Bypass of caller stack argument initialization checks allows NULL pointer dereferences and out-of-bounds heap reads, leading to verifier crashes or privilege escalation.
> --
>
> commit 64c850bac22b15ca90af1ba361a4d764104b6ffb
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Support stack arguments for bpf functions
>
> This commit allows the compiler to pass additional arguments via a dedicated
> stack area through the BPF_REG_PARAMS (r11) register. It tracks outgoing stack
> arguments and introduces bounds checks for stack arguments in BPF subprograms.
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 3bafb7ad2ba71..69965d2c5fdd5 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -4050,6 +4080,103 @@ static int check_stack_write(struct bpf_verifier_env *env,
>>   	return err;
>>   }
>>   
>> +/*
>> + * Read a value from the incoming stack arg area.
>> + * off is a positive offset from r11 (e.g. +8 for arg6, +16 for arg7).
>> + */
>> +static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_state *state,
>> +				int off, int dst_regno)
>> +{
>> +	struct bpf_subprog_info *subprog = &env->subprog_info[state->subprogno];
>> +	struct bpf_verifier_state *vstate = env->cur_state;
>> +	int spi = off / BPF_REG_SIZE - 1;
>> +	struct bpf_func_state *caller, *cur;
>> +	struct bpf_reg_state *arg;
>> +
>> +	if (state->no_stack_arg_load) {
>> +		verbose(env, "r11 load must be before any r11 store or call insn\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (spi + 1 > bpf_in_stack_arg_cnt(subprog)) {
>> +		verbose(env, "invalid read from stack arg off %d depth %d\n",
>> +			off, bpf_in_stack_arg_cnt(subprog) * BPF_REG_SIZE);
>> +		return -EACCES;
>> +	}
>> +
>> +	caller = vstate->frame[vstate->curframe - 1];
>> +	arg = &caller->stack_arg_regs[spi];
> Could this lead to an out-of-bounds read or a NULL pointer dereference?
>
> If check_outgoing_stack_args() is skipped (e.g. due to an error in
> btf_prepare_func_args()), caller->stack_arg_regs might be NULL or smaller
> than spi. Since check_func_call() or push_callback_call() can ignore
> btf_check_func_arg_match() failures for static subprograms or callbacks,
> the callee can still execute.
>
> If sub->arg_cnt was updated before the failure, bpf_in_stack_arg_cnt(subprog)
> would be greater than 0, allowing this check to pass and potentially accessing
> unallocated memory.

Yes, it is possible for an out-of-bound read or a NULL pointer dereference.
This can be reproduced with inline asm where the caller does not have
any outgoing stack arguments but callee has incoming stack arguments.

Will fix.

>
> [ ... ]
>
>> @@ -8922,6 +9078,7 @@ static int btf_check_func_arg_match(struct bpf_verifier_env *env, int subprog,
>>   				    struct bpf_reg_state *regs)
>>   {
>>   	struct bpf_subprog_info *sub = subprog_info(env, subprog);
>> +	struct bpf_func_state *caller = cur_func(env);
>>   	struct bpf_verifier_log *log = &env->log;
>>   	u32 i;
>>   	int ret;
>> @@ -8930,13 +9087,16 @@ static int btf_check_func_arg_match(struct bpf_verifier_env *env, int subprog,
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = check_outgoing_stack_args(env, caller, sub->arg_cnt);
>> +	if (ret)
>> +		return ret;
>> +
> Is it possible for btf_prepare_func_args() to return an error after modifying
> sub->arg_cnt?
>
> For instance, if a BTF tag is unsupported in a static subprogram,
> btf_prepare_func_args() will return an error after already assigning
> sub->arg_cnt. This skips check_outgoing_stack_args(), which is responsible
> for verifying that the caller actually allocated and initialized
> caller->stack_arg_regs. This could lead to the unverified memory access
> mentioned above.
>

