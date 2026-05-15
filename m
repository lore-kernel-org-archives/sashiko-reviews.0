Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDFE495502
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858971; cv=none; b=goVtU8HtxTDYqT1ufxVXYgDV3crEygpYjQfCniYC8L2cE8GxOmEbl9E200S3FTiXKUOpU/iyrYaWBPcl0HpBqwcUyvO4Kbq3E98DCU3b0b/AcnC8U2rfyONYnSF+k1FYu+kxjHywIrzMOqTtiamSihGgMtWvmoOxFTG9igbP4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858971; c=relaxed/simple;
	bh=/En1jPQvG7Wj5oL2pt2CU2M6/zSyclY9AkAqPILgluY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwxhKZiQjamTgB12ZcL6N+dCvWE1/g3haSsFe4uBDpTM+HXqO7m4pa6pAfzJUL08ytvoOEgQFOthcM0DXRxAycVG8aW38wc47+Z6UvnqOAcWMMsI4ZICIVeFQIkglHw0lGcIOvVHXQyNDI9ZlzKPYBCelLYNTZR/J7Mk5rpkkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l0j1ACKJ; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l0j1ACKJ"
Message-ID: <4369aaa6-424f-42f3-9390-dd223e76ae1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778858967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+v9iT+Xk09ahOyLgi4H8bvTOszQ6m/GwEDih89VOQQg=;
	b=l0j1ACKJKWWnzuhYKcCtKsH52zzxe6KiBN/pJTkNWx614IiL7wjRnFMwpEFnLdNxPXBrul
	P0zz1aQiSIXnHMEGLVoGlG9kxXW5hLu7OxTpDnitcEBG5L0jAAF8+AEDwGJ/kuS8R0IBbz
	h5Z4FLUvk6DVhqV16OjavMO3X884Xwc=
Date: Fri, 15 May 2026 08:29:11 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 10/25] bpf: Extend liveness analysis to track
 stack argument slots
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260513045043.2389049-1-yonghong.song@linux.dev>
 <20260514225322.D0118C2BCB3@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260514225322.D0118C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 5/14/26 12:53 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incorrect logging of stack argument slots in `arg_track_join`.
> --
>
> commit 5139934569dff44b05e1ee083e4eb084fdca15e3
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Extend liveness analysis to track stack argument slots
>
> This commit extends the BPF verifier's liveness analysis to correctly track
> stack argument slots. It expands tracking arrays to cover MAX_AT_TRACK_REGS
> and propagates the tracked state through function calls to prevent incorrectly
> poisoning stack slots derived from frame pointers passed through stack
> arguments. It also updates logging functions to expose these new stack
> argument states.
>
>> diff --git a/kernel/bpf/liveness.c b/kernel/bpf/liveness.c
>> index 13dc5ae44d2b5..7f4a0e4c2c49d 100644
>> --- a/kernel/bpf/liveness.c
>> +++ b/kernel/bpf/liveness.c
> [ ... ]
>
>> @@ -1630,7 +1705,7 @@ static int compute_subprog_args(struct bpf_verifier_env *env,
>>   				continue;
>>   			ti = target - start;
>>   
>> -			for (r = 0; r < MAX_BPF_REG; r++)
>> +			for (r = 0; r < MAX_AT_TRACK_REGS; r++)
>>   				changed |= arg_track_join(env, idx, target, r,
>>   							  &at_in[ti][r], at_out[r]);
> Is it possible this will misleadingly print stack argument slots as
> non-existent registers?
>
> Since compute_subprog_args() now iterates r up to MAX_AT_TRACK_REGS,
> arg_track_join() will receive r >= MAX_BPF_REG.
>
> Looking at arg_track_join():
>
> kernel/bpf/liveness.c:arg_track_join() {
>      ...
> 	if (r >= 0)
> 		verbose(env, "r%d: ", r);
> 	else
> 		verbose(env, "fp%+d: ", r * 8);
>      ...
> }
>
> It seems this will log stack argument slots as r11, r12, etc., in the
> BPF_LOG_LEVEL2 verifier log, rather than their proper designations (sa0 to
> sa5) like arg_track_log() and print_subprog_arg_access() do.
>
> Should arg_track_join() be updated to handle r >= MAX_BPF_REG to maintain
> consistent formatting?

Yes, you are right, for 'r >= 0' case, we should have r[0-10] and for r >= 11
we should use 'sa*' to indicate it is for stack arguments.
Will fix.

