Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581534EF03
	for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 19:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845463; cv=none; b=cMdBZRo/nX4q4kJV5oaP0sLLFSLQUSQ/MGVoWOCa513nWuowPj4ZQShezs0dCUWN/NEyQNy741fXXuqCji5af7owEwyWv0shtOPQOwf2BZ3U8mD3ZFfL1Hk+Bwd4cH866eJc7wLAIhFPGofp4SEQ+2EIMCV6uhE2+ZFzFf1xjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845463; c=relaxed/simple;
	bh=/X6s6olhQTkpfwIR5Cw8H/iBtfo2bH7lEIxn+wnXf7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENfQLJmDFimN3BGiuGjrItFlt2bBAz60Z6nV/lceUwxuVPaunhWDoKypPcI4wB50R5xOhAKHiTcqc1YT3V+zstJX3bPNxvMjc9w56CIiDJflZ7YI7C3SfRst+5OBqT/plYLFNRXrXRNj2QQIGKsfKZ4MgQg9l+rPVFhrodsGofo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dkiii9RB; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dkiii9RB"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/X6s6olhQTkpfwIR5Cw8H/iBtfo2bH7lEIxn+wnXf7Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789845458; v=1; x=1790450258;
 b=Dkiii9RBNR5Rurfc5DaBpiaUvId9Rz7PClzVLALD5AGem9/1S2JZ+BtV+w5XQk8EsUsZKWhr
 SyHJMsUlWmxQCkmS1Ffo11r8xv7mP4yFownC2T/fE9F7UEtAivPfLcTGT5HUVDHtMl6TRXrQgpN
 8CqeEnnHGrkyDARb5Nmo4GdE=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d7c86a2b72343641;
	Sat, 19 Sep 2026 19:17:38 +0000
X-Mizu-Trace-ID: d7c86a2b72343641
X-Migadu-Flow: FLOW_OUT
Message-ID: <e7d9b22c-f407-4e35-bd9a-2d62687cc979@linux.dev>
Date: Sat, 19 Sep 2026 12:17:31 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 05/20] bpf: Make exception landing pads
 reachable in the CFG
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260918044156.3283973-1-yonghong.song@linux.dev>
 <20260918044221.3287431-1-yonghong.song@linux.dev>
 <20260918045938.AD2F31F000FF@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260918045938.AD2F31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/17/26 9:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] bpf: missing prune point at exception landing pad target
> --
>
> commit 4fbd0e36862ba7e3ee8480e535068a6821d5cad0
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Make exception landing pads reachable in the CFG
>
> This commit updates the verifier's control flow graph and liveness analysis
> to properly handle exception landing pads. It ensures that exception throwing
> calls can reach cleanup records, and prevents outer frame stack slots from
> being read incorrectly when control is transferred to landing pads.
>
>> diff --git a/kernel/bpf/cfg.c b/kernel/bpf/cfg.c
>> index 842c7d1eabccc..9f8b8b54d5ea7 100644
>> --- a/kernel/bpf/cfg.c
>> +++ b/kernel/bpf/cfg.c
> [ ... ]
>
>> @@ -158,17 +159,57 @@ static int push_insn(int t, int w, int e, struct bpf_verifier_env *env)
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
>> +	w = bpf_cleanup_pad_of_call(env, t);
>> +	if (w < 0)
>> +		return DONE_EXPLORING;
>> +
>> +	mark_prune_point(env, t);
>> +	mark_jmp_point(env, w);
>> +	mark_jump_target(env, w);
> [Severity: High]
> Should mark_prune_point() be applied to the landing pad target w instead of
> the call site t?
>
> Because w is a branch target where control flow merges, it needs to be marked
> as a prune point so the verifier knows to check for state convergence. By
> marking t instead of w, the verifier will evaluate the landing pad and all
> subsequent cleanup instructions independently for every exception-throwing
> call that branches to w.
>
> Can this lead to combinatorial path explosion and result in the verifier
> rejecting the program with -E2BIG?

We can add mark_prune_point(env, w) as well, esp. there are cases there
are multiple cleanup regions but many (or all) of them may pointing into
the same landing pad.

>
> [ ... ]
>

