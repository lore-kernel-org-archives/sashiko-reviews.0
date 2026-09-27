Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD06632
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467341; cv=none; b=nC+BcyUcXwNKSe1aL/LNX7UD2DjH3BG5W4JEF4fcMsWH0GdacrXTZ1+Lpcv5pkB4BRvYgtEfCI1HXHxRFRZ8KRfaD7IPlrBjWTK9evOKdg51uhf0FGw9SgIszEufwFfyvRoHyti6os+ZHdvwv5jXg4WOrYD31tQTxAzwIT4HYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467341; c=relaxed/simple;
	bh=+618+mufiBuzAWWHOtxBAv76pP8RS0vaeumb9smfaBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j32akwXVTPm2AJrf7rCYab9sjPwheE1eGAz7yqKO+9s/cQBUtSZDWVj4sJnqFOt4cRn8rl71AVMN/o0J6Ep9fjauwjku4nFC/KGVeGGchmVLNJwWYd9b8SYSUrOCPHbyM2Ru2X9MNrTsD64Z3KIR7RSRt/gTlqdIXPJ8XHAolkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OKkhQNS3; arc=none smtp.client-ip=91.218.175.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OKkhQNS3"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=+618+mufiBuzAWWHOtxBAv76pP8RS0vaeumb9smfaBw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790467337; v=1; x=1791072137;
 b=OKkhQNS3soN/pOkl/d80kaN2vCgKEDKQZK00ykAqSRHygKaPfRAcIumAE9cdQppZOnWsD22u
 SM/nyUqeFtdysLbuIy6CdRgUfpx6JVcU6K8Vmw8uqV8i/5j8rb0ePRvRfqEb4+IG3yPF9etACPB
 OVzDmZ1SfT6pZYRix4Kr9caw=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4509d27e0a3bd69b;
	Sun, 27 Sep 2026 00:02:16 +0000
X-Mizu-Trace-ID: 4509d27e0a3bd69b
X-Migadu-Flow: FLOW_OUT
Message-ID: <16ff7e99-973b-44f0-b139-ff5dca529ac6@linux.dev>
Date: Sat, 26 Sep 2026 17:02:11 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 06/21] bpf: Make exception landing pads
 reachable in the CFG
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260926050006.2213110-1-yonghong.song@linux.dev>
 <20260926050037.2216265-1-yonghong.song@linux.dev>
 <20260926052120.AEFD41F000FF@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260926052120.AEFD41F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/25/26 10:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] bpf: DFS traversal invariant violation in visit_func_call_insn
> --
>
> commit 9f815c7b6f7049f1604884b98686a7516748e963
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Make exception landing pads reachable in the CFG
>
> A bpf_unwind() or a bpf2bpf call inside the [begin_off, end_off) range of a
> cleanup record can reach that record's landing pad. Add that edge to the
> CFG walk, which explores the pad and makes both ends prune points, and to
> bpf_insn_successors(), which liveness and the SCC passes walk.
>
>> diff --git a/kernel/bpf/cfg.c b/kernel/bpf/cfg.c
>> index b0bd9ba951dfb..4e2b6985bc964 100644
>> --- a/kernel/bpf/cfg.c
>> +++ b/kernel/bpf/cfg.c
> [ ... ]
>
>> @@ -160,17 +161,64 @@ static int push_insn(int t, int w, int e, struct bpf_verifier_env *env)
>>   	return DONE_EXPLORING;
>>   }
>>   
>> +static int visit_cleanup_pad_edge(int t, struct bpf_verifier_env *env)
>> +{
>> +	int *insn_stack = env->cfg.insn_stack;
>> +	int *insn_state = env->cfg.insn_state;
>> +	int w;
>> +
>> +	if (!env->cleanup_info_cnt)
>> +		return DONE_EXPLORING;
>> +	w = bpf_exc_pad_of_call(env, t);
>> +	if (w < 0)
>> +		return DONE_EXPLORING;
>> +
>> +	/*
>> +	 * @t is a call that may branch here, and @w is the target of that
>> +	 * branch, so both are prune points. @w especially: every covered call
>> +	 * site in a region unwinds to the same pad, and without a prune point
>> +	 * at its head the verifier walks the pad again for each of them.
>> +	 */
>> +	mark_prune_point(env, t);
>> +	mark_prune_point(env, w);
>> +	mark_jmp_point(env, w);
>> +	mark_jump_target(env, w);
>> +
>> +	if (insn_state[w])
>> +		return DONE_EXPLORING;
>> +	if (env->cfg.cur_stack >= env->prog->len)
>> +		return -E2BIG;
>> +	insn_stack[env->cfg.cur_stack++] = w;
>> +	insn_state[w] |= DISCOVERED;
> [Severity: Medium]
> Does setting the DISCOVERED flag here in visit_cleanup_pad_edge() mark the
> pad prematurely?
>
> By marking it DISCOVERED before fully exploring its path, any valid
> cross-edges to the cleanup pad (e.g., from shared cleanup code) might be
> incorrectly classified as back-edges and rejected by the verifier.

The actual problem is below due to premature dfs stop's. See below.

>
>> +	return KEEP_EXPLORING;
>> +}
>> +
> [ ... ]
>
>>   static int visit_func_call_insn(int t, struct bpf_insn *insns,
>>   				struct bpf_verifier_env *env,
>>   				bool visit_callee)
>>   {
>> -	int ret, insn_sz;
>> +	int ret, insn_sz, pad_ret;
>>   	int w;
>>   
>> +	pad_ret = visit_cleanup_pad_edge(t, env);
>> +	if (pad_ret < 0)
>> +		return pad_ret;
>> +
>>   	insn_sz = bpf_is_ldimm64(&insns[t]) ? 2 : 1;
>>   	ret = push_insn(t, t + insn_sz, FALLTHROUGH, env);
> [Severity: Medium]
> Is it safe to push the fallthrough edge even if visit_cleanup_pad_edge()
> has just returned KEEP_EXPLORING?
>
> The CFG checker typically relies on returning KEEP_EXPLORING immediately
> after pushing a new node to maintain the invariant that DISCOVERED nodes are
> strictly ancestors. By ignoring whether pad_ret is KEEP_EXPLORING and
> eagerly pushing the fallthrough edge, this leaves the cleanup pad marked
> DISCOVERED while the fallthrough path is being explored.
>
> Could this lead to loop-free programs being incorrectly rejected if a
> cross-edge on the fallthrough path is misidentified as a back-edge?

The above
	if (pad_ret < 0)
		return pad_ret;
is not correct and it may cause premature dfs stop (ignoring KEEP_EXPLORING).
The correct one is
	if (pad_ret != DONE_EXPLORING)
		return pad_ret;
This way, pad_ret can be either KEEP_EXPLORING or err.
If KEEP_EXPLORING, dfs can continue with landing pad.

>
>>   	if (ret)
>> -		return ret;
>> +		return merge_visit_ret(pad_ret, ret);

