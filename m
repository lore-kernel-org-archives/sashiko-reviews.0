Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D5449B2C
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 18:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769684; cv=none; b=ZobaiEJqWx6nGR6d0yorFLc7YVZTF2/vb0EmjM3ANS6uaqBjMI1+pYUaDfr4xjP/cuWiaLZvX5O+JXOPcym5h1DNH80sAFOf+Rr9+r0hg6pwN5aQT8wOt33IQLF5f7tmnAP9ZaR3Z36rUh5daXOadVaUSLugVU0u1mLLTg9e2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769684; c=relaxed/simple;
	bh=fR+qmeFuYVojzmd9KL3a9Aq7SkbtCSm984LXr3KYgUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NG5UyrNRnHSen/rNZgbPYXWLp7ZDTbx4hwtBEBUWDITkG28ulU5/mk7KG4FihehC4uXo7nJA/ptZsDOQGCvCUU78gnuJVuj8u/Ov3sVAM0MYnnJklcY9lMC8nRMYdzMEmbuyt+hQMc4+UToawHXNSPLpMK76+ZARsvKFhcGkCK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UIgxWBJw; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UIgxWBJw"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=fR+qmeFuYVojzmd9KL3a9Aq7SkbtCSm984LXr3KYgUs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787769661; v=1; x=1788374461;
 b=UIgxWBJwwHNuG48qJbgIHB2xLJOHxOnd2IyVRpZZNXScTtZLC0RXdFC4as/OmHGFsFXU+9pT
 nZ8FEwr3jbHK5FYhdyGLsnpze9WYrpVzGcfJFTtRcmVMVLAB8sCg0II1aLcEKKR99+gq1PxQG2R
 htEBG2cuLg0DCoAPqxFRVG9Q=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [IPV6:2a03:83e0:1151:15:1c5e:37e8:36:dd37] (2620:10d:c090:500::7:2cdc)
	by smtp.migadu.com with ESMTPS id 3f27429ce5984fda;
	Wed, 26 Aug 2026 18:41:01 +0000
X-Mizu-Trace-ID: 3f27429ce5984fda
X-Migadu-Flow: FLOW_OUT
Message-ID: <2074813a-269b-4ddb-82c7-e9b99eaa7f69@linux.dev>
Date: Wed, 26 Aug 2026 11:40:59 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 06/10] bpf: Allow a global function to return
 arena pointers by value
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260825205412.1320099-1-yonghong.song@linux.dev>
 <20260825205443.1323867-1-yonghong.song@linux.dev>
 <20260825211254.88DBA1F000E9@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260825211254.88DBA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/25/26 2:12 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] BPF_PROG_TYPE_EXT (freplace) programs are erroneously rejected when replacing a global function that returns an arena pointer or a struct containing an arena pointer.
> - [High] Callers of global functions returning arena pointers receive a `SCALAR_VALUE` instead of `PTR_TO_ARENA`, causing valid dereferences to be rejected.
> --
>
> commit 9797a7277b67bb03067fdf11db423996a277abbd
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Allow a global function to return arena pointers by value
>
> This commit relaxes BTF verification to allow global functions to return
> arena pointers or structures containing arena pointers. It updates the
> verifier's return type validation to recognize these types when processing
> subprograms.
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index b1f4ef614d4c4..70481fadacc0f 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>> @@ -7972,14 +7972,18 @@ static int btf_validate_return_type(struct bpf_verifier_env *env, struct btf *bt
>>   
>>   	if (btf_type_is_struct(t) && t->size <= 16) {
>>   		/*
>> -		 * A global function's caller models the return as an opaque
>> -		 * scalar pair, so it may only return scalars by value. A local
>> -		 * function is verified inline, so a pointer field stays tracked
>> -		 * and needs no such restriction.
>> +		 * A global function may return a struct with scalar(s) or arena
>> +		 * pointer(s) as its members. A local function is verified inline,
>> +		 * so its caller receives the real register state and any member
>> +		 * is fine.
>>   		 */
>>   		bool local_func = subprog && !is_global;
>> +		u32 member_kinds = BTF_MEMBER_SCALAR;
>>   
>> -		if (local_func || btf_struct_is_composed_of(env, btf, t, BTF_MEMBER_SCALAR))
>> +		if (subprog)
>> +			member_kinds |= BTF_MEMBER_ARENA_PTR;
> [Severity: High]
> Does this subprog condition inadvertently reject valid BPF_PROG_TYPE_EXT
> (freplace) programs?
>
> When replacing a global function that returns an arena pointer, the
> extension's main program must have an identical BTF signature to the target.
> During verification of the extension's main program (where subprog is 0),
> btf_prepare_func_args() is called. Since subprog evaluates to false,
> BTF_MEMBER_ARENA_PTR isn't added to member_kinds, causing the verifier to
> fall back and return -EOPNOTSUPP.

This analysis is correct. The above 'subprog' is not 0 (not for main prog),
so if it wants to return an arena point, the verifier will reject.

>
> [Severity: High]
> Even though this patch allows global functions to return arena pointers,
> won't callers still be unable to dereference them?
>
> In check_func_call() inside kernel/bpf/verifier.c, the return registers of
> global functions are unconditionally marked as unknown scalars:
>
> 	if (!returns_void) {
> 		nregs = bpf_ret_reg_pair(env, subprog) ? 2 : 1;
> 		for (i = 0; i < nregs; i++)
> 			mark_reg_unknown(env, caller->regs, ret_regs[i]);
> 		bpf_diag_mod_end(env);
> 	}
>
> Since the C type returned by the function (void __arena *) matches the type
> in the caller, the compiler doesn't emit an addr_space_cast instruction.
> Without this cast, the scalar is never promoted back to a PTR_TO_ARENA,
> causing check_mem_access() to reject subsequent dereferences with an "invalid
> mem access 'scalar'" error.

We should be okay here. For example, for returning type is a struct and
one of its member is an arena pointer (tagged with __arena). The compiler
will generate proper address_space conversion code due to __arena.

In kernel side, we will have something like below:

                         if (BPF_CLASS(insn->code) == BPF_ALU64) {
                                 if (insn->imm) {
                                         /* off == BPF_ADDR_SPACE_CAST */
                                         mark_reg_unknown(env, regs, insn->dst_reg);
                                         if (insn->imm == 1) /* cast from as(1) to as(0) */
                                                 dst_reg->type = PTR_TO_ARENA;
   	

>
>> +
>> +		if (local_func || btf_struct_is_composed_of(env, btf, t, member_kinds))
>>   			return 0;
>>   	}
>>

