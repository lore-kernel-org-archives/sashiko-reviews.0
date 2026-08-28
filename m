Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93437E5F5
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940039; cv=none; b=jdU8gjK+I/5ejBk4fq85M91pLCoR1q79CPBqU/eae4M8pln4A5ig38AhElSfTPTewEN+22GnVMfFT8FNkgTQYII2/OHsZh0vWGZ7eY121zzBY+g25ibJc9UU3uHuZRKg6MbLigfPLR26+jHPymOv5haivMRgBJyhsHDzfTniVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940039; c=relaxed/simple;
	bh=XV5jyF0YswXdvbpIwXuIro3FyxofTqggIKyReerexr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZ18usSiuwm+6HFdyH91+eErsUt+W+UhL40LsDenGtYU1znuspVXH4l4z0Ii7Yjdn9cI1rMvhK6MdfQWjko983Nv2qg6U1RwIBUVo5UJqSVSNwz/FdA1C+aflnx0ll+boia9QR91VRpHxGplU5BRCcMoTKckEv/y77wb+H+6Ry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qR7bcSM8; arc=none smtp.client-ip=95.215.58.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qR7bcSM8"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XV5jyF0YswXdvbpIwXuIro3FyxofTqggIKyReerexr4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787940035; v=1; x=1788544835;
 b=qR7bcSM8+QiCq6bO4qZ14nOFriz9lklttWtRHeZPPK5kN9ANULQiLg8tGOOupG26n5vucB6v
 S4FPReSzI5tOA3vzn9QanzyYI9xkqAD3DjH6z/YdDzqgT14wQWxddy1zBLxn7zwxy6Nv7HtC9MY
 5+25VISyPk+tOZ+jDNxbVT8I=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4864d6e85bb679a6;
	Fri, 28 Aug 2026 18:00:35 +0000
X-Mizu-Trace-ID: 4864d6e85bb679a6
X-Migadu-Flow: FLOW_OUT
Message-ID: <c31f8570-36b8-4416-91bc-0677fb8333aa@linux.dev>
Date: Fri, 28 Aug 2026 11:00:32 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 06/11] bpf: Allow a global function to return
 arena pointers by value
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260827061114.2514603-1-yonghong.song@linux.dev>
 <20260827061145.2517714-1-yonghong.song@linux.dev>
 <20260827063354.D50501F000E9@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260827063354.D50501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/26/26 11:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The verifier error message for unsupported return types incorrectly claims that arena pointers are supported for the main BPF program, when they are actually rejected.
> --
>
> commit 518fd93d71684c317540966a4f0aa467d524c25b
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> bpf: Allow a global function to return arena pointers by value
>
> This patch allows global functions to return a struct by value that contains
> arena pointers. It updates btf_validate_return_type() to allow arena pointers
> and adjusts the corresponding error message in btf_prepare_func_args().
>
>> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
>> index b1f4ef614d4c4..f6d82a8fd617b 100644
>> --- a/kernel/bpf/btf.c
>> +++ b/kernel/bpf/btf.c
>> @@ -7973,13 +7973,22 @@ static int btf_validate_return_type(struct bpf_verifier_env *env, struct btf *bt
>>   	if (btf_type_is_struct(t) && t->size <= 16) {
>>   		/*
>>   		 * A global function's caller models the return as an opaque
> [ ... ]
>> +		u32 member_kinds = BTF_MEMBER_SCALAR;
>>   
>> -		if (local_func || btf_struct_is_composed_of(env, btf, t, BTF_MEMBER_SCALAR))
>> +		if (subprog)
>> +			member_kinds |= BTF_MEMBER_ARENA_PTR;
>> +
>> +		if (local_func || btf_struct_is_composed_of(env, btf, t, member_kinds))
>>   			return 0;
>>   	}
>>   
>> @@ -8075,7 +8084,8 @@ int btf_prepare_func_args(struct bpf_verifier_env *env, int subprog)
>>   		if (is_global) {
>>   			bpf_log(log,
>>   				"Global function %s() has unsupported return type. "
>> -				"Only void, scalar, or a scalar-only struct/union up to 16 bytes is supported.\n",
>> +				"Only void, a scalar, an arena pointer, or a struct/union of "
>> +				"scalars and arena pointers up to 16 bytes is supported.\n",
>>   				tname);
>>   		}
>>   		return err;
> [Severity: Low]
> Does this new error message in btf_prepare_func_args() incorrectly claim that
> arena pointers are supported for the main BPF program?
>
> In btf_validate_return_type(), arena pointers are only added to member_kinds
> if subprog is non-zero:
>
>      if (subprog)
>          member_kinds |= BTF_MEMBER_ARENA_PTR;
>
> However, if a user attempts to load a main BPF program (subprog == 0) with a
> global linkage (like BPF_PROG_TYPE_EXT) that returns a struct containing an
> arena pointer, it will be rejected by btf_validate_return_type() but then print
> this error message incorrectly implying that arena pointers are supported.
>
> Should the error message be adjusted, or should the subprog check be changed so
> they match?

Okay, I will have a separate message for main prog (subprog == 0) vs. none main prog.


