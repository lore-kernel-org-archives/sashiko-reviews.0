Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27A35C697
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154076; cv=none; b=ftRi1AxiWEGZGj+l7Shss7IJyUuD3FVcdn+9f8ytChbxxnySd3Oi5UKihCBqalJUAXi09KYPjXTQcB5fq8ocU1U6aXiLmaYWX/iLY+XcYz6+nfDM3mS/9V/upSj/LWK8LkEQYhrOX67TX5ThOI3obNF36HYM4PtpnrKmKIunUPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154076; c=relaxed/simple;
	bh=7+XZSFOtMnHYHziupaQkPdMkTzDBh8SwyfZNqXYHgZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7dBh7DfWE65PB+LMWU+FnQ0XxfsgX/g/UajEdzqwjeZ0J+qain9KWZVGIU99ueK5NJ5BhuwF7gCZcANRnrqIu5vFkhh5iIOjcPRjenEsSy7r6WfE8UJfMTDyMvDgAZ5Z7MPyltfXu+TnyHSgFgiGzz3QvUtiSFR4NU6TCxCl4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qDnJlLzv; arc=none smtp.client-ip=95.215.58.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qDnJlLzv"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7+XZSFOtMnHYHziupaQkPdMkTzDBh8SwyfZNqXYHgZk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787154071; v=1; x=1787758871;
 b=qDnJlLzvr98sN8NWS8lhvlkqVBZ9NRKUMJqjhogKWpQ2n5T38XltWsZi3k4xMs6Q0i2EXO3G
 9pRwSaWhT43kDtPBaMbHgeE87A8h/XgTxD+ZJHs0L5k/5tf9SIC6BCmNj0YRflm754BIxuv8bEL
 S/Typ/JSqMid6S7CwX6zilS4=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [IPV6:2a03:83e0:1151:15:1c5e:37e8:36:dd37] (2620:10d:c090:500::7:5d0e)
	by smtp.migadu.com with ESMTPS id e95b706ce7f0e963;
	Wed, 19 Aug 2026 15:41:10 +0000
X-Mizu-Trace-ID: e95b706ce7f0e963
X-Migadu-Flow: FLOW_OUT
Message-ID: <6dc42fbd-f5f8-4880-96b3-6e7fe2db59e8@linux.dev>
Date: Wed, 19 Aug 2026 08:41:03 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v7 02/10] bpf: Add helpers to describe the R0:R2
 return register pair
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260819055239.3293449-1-yonghong.song@linux.dev>
 <20260819055249.3295283-1-yonghong.song@linux.dev>
 <20260819061746.0DFE71F00A3A@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260819061746.0DFE71F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/18/26 11:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Extension programs (BPF_PROG_TYPE_EXT) are mishandled because `bpf_compute_subprog_ret_regs` skips subprog 0, failing to set up `ret_reg_pair`.
> --
>
> --- Patch [2]: [PATCH bpf-next v7 02/10] bpf: Add helpers to describe the R0:R2 return register pair ---
> commit f6c1f4f14c6e8bda9545fe1b82f42648b4f3c475
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Add helpers to describe the R0:R2 return register pair
>
> This commit adds bpf_ret_reg_pair() to determine if a BPF subprogram returns
> a value in the R0:R2 register pair. It implements
> bpf_compute_subprog_ret_regs() to compute this flag based on the BTF
> prototype of each subprogram, intentionally skipping the main program.
>
> Link: https://github.com/llvm/llvm-project/pull/190894
> Link: https://github.com/llvm/llvm-project/pull/206876
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index d8bf897460eae..2b5e88fdda07e 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
> [ ... ]
>
>> +static int bpf_compute_subprog_ret_regs(struct bpf_verifier_env *env)
>> +{
>> +	const struct btf *btf = env->prog->aux->btf;
>> +	const struct btf_type *type;
>> +	int subprog;
>> +	u32 size;
>> +
>> +	if (!env->prog->jit_requested || bpf_prog_is_offloaded(env->prog->aux))
>> +		return 0;
>> +
>> +	/*
>> +	 * Skip the main program: its return value is the program's exit code,
>> +	 * read out of R0, so it never uses the register pair. An extension does
>> +	 * have a real prototype for subprog 0, but bpf_check_attach_target()
>> +	 * refuses to replace a function returning more than 8 bytes.
>> +	 */
>> +	for (subprog = 1; subprog < env->subprog_cnt; subprog++) {
> [Severity: High]
> Does this code mishandle extension programs (BPF_PROG_TYPE_EXT)?
>
> The comment mentions that bpf_check_attach_target() refuses to replace a
> function returning more than 8 bytes. However, for extension programs,
> prog->expected_attach_type is 0, so attach_uses_trampoline_retval(0) evaluates
> to false, bypassing the size check.
>
> If an extension program successfully attaches and replaces a subprogram
> returning an __int128 (16 bytes), skipping subprog 0 here means ret_reg_pair
> won't be set. Could this result in the verifier failing to enforce the
> initialization of R2, potentially leaking uninitialized register contents to
> the caller?

We should be okay. For freplace program, in later commit
   bpf: Add verifier support for 16-byte returns in R0:R2
freplace will get rejected if kernel function returns
R0:R2 values. If the freplace is for original subprog 0,
the R2 (if to-be-returned in freplace) may cause incorrect
result but it is user's problem.

>
>> +		type = subprog_ret_type(env, subprog);
>> +		if (!type || btf_type_is_void(type))
>> +			continue;
>> +		if (verifier_bug_if(IS_ERR(btf_resolve_size(btf, type, &size)), env,
>> +				    "cannot size return type of subprog %d", subprog))
>> +			return -EFAULT;
>> +		if (ret_regs_cnt(size) > 1) {
>> +			subprog_info(env, subprog)->ret_reg_pair = true;
>> +			env->prog->jit_required = 1;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}

