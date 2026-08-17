Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6A442365
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984354; cv=none; b=lSUVj3FQzOSMqIdfXiOHUhPG1Qz8TrLHy+Xbuugm+BayYZgpjLzk/7VFBHdRCRjjTuFjhhBltwZT/oYclI3+K+dsWsoSo7B7SanrklAzLshMGw+hjGMB/zW1xm98x1bb71TF/iKoT/6H3bMfLiZ0dMRZB5QDv5gJOrbXILHHe0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984354; c=relaxed/simple;
	bh=Cs+QNTdWADsJDYvKeMGHyXNV4NPPTnouD3zzWhBh3kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FO8Ef/vym4QiKDOCETC9ktCyOWMOXl/bcOxkFBrdvUzrtpDC/77rkJWDCt4NMCNGGwNrZbzaoROdEptMyueDcSpRRNu7IgmEj4aZGCyKWhx+YzdY0h3ut0Z+eOQ6aymMcgC0fn3XOb0XersLsdef4q0lP+OQWdeVNzAF0JNkxxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=coS/s235; arc=none smtp.client-ip=95.215.58.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="coS/s235"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Cs+QNTdWADsJDYvKeMGHyXNV4NPPTnouD3zzWhBh3kM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786984349; v=1; x=1787589149;
 b=coS/s235gxleB2pXG3GbuIz6cE/veqVsI/0w6e9I/Oy0b4qL89g4Ucry4bi3ujlhDPERB1aB
 4+WGNWeLHp3RutJf9kYs+jZZ4E6UHxhFDc98NgLEkHMMI1pW6peRiaTDqUVsYm12VXv5nC6+mqP
 LtisK4Jw2kHq7b4j+Osm3LIE=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [IPV6:2a03:83e0:1151:15:1c5e:37e8:36:dd37] (2620:10d:c090:500::7:5604)
	by smtp.migadu.com with ESMTPS id b907ada71fe247b9;
	Mon, 17 Aug 2026 16:32:29 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <44b41c35-00d9-4954-abfc-13d3d21cf66d@linux.dev>
Date: Mon, 17 Aug 2026 09:32:27 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 08/10] selftests/bpf: Add C tests for 16-byte
 returns in R0:R2
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260817042141.2286086-1-yonghong.song@linux.dev>
 <20260817042222.2295525-1-yonghong.song@linux.dev>
 <20260817044543.255FA1F000E9@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260817044543.255FA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/16/26 9:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The kfuncs `bpf_kfunc_call_test_i128` and `bpf_kfunc_call_test_ret_pair` are conditionally compiled out of `bpf_testmod.ko` on architectures other than x86_64 and arm64, but are unconditionally compiled and declared as strong `__ksym` externs in the selftest object `verifier_aggregate_ret.c`. This will cause libbpf to fail loading the entire object on unsupported architectures (when compiled with LLVM 23+), failing the entire test suite even for programs that don't use the kfuncs.
> --
>
> --- Patch [8]: [PATCH bpf-next v6 08/10] selftests/bpf: Add C tests for 16-byte returns in R0:R2 ---
> commit 00f68ada7c423dbadb8514b3c5f6c309f446bc99
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> selftests/bpf: Add C tests for 16-byte returns in R0:R2
>
> Add selftests that exercise a 16-byte return value passed in the R0:R2
> register pair, written in C so that they depend on the compiler lowering
> the register-pair return.
>
> The R0:R2 convention is only emitted by LLVM 23 and newer, and a by-value
> aggregate return does not compile at all before that, so the programs sit
> behind a __clang_major__ guard. An older compiler builds the dummy test in
> the #else branch instead, which keeps the object non-empty and says in its
> description why nothing was exercised.
>
> The kfunc tests are tagged __arch_x86_64/__arch_arm64 and skip elsewhere.
> Those are the architectures whose JIT advertises
> bpf_jit_supports_kfunc_ret_reg_pair(), which bpf_add_kfunc_call() requires
> before it accepts a kfunc returning more than 8 bytes, and they are also
> the only ones building the kfuncs.
>
> Acked-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
>
>> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h b/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
>> index 7d81070eefe7f..426000f9a14fa 100644
>> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
>> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
> [ ... ]
>> @@ -131,6 +136,10 @@ int bpf_kfunc_call_test2(struct sock *sk, __u32 a, __u32 b) __ksym;
>>   struct sock *bpf_kfunc_call_test3(struct sock *sk) __ksym;
>>   long bpf_kfunc_call_test4(signed char a, short b, int c, long d) __ksym;
>>   int bpf_kfunc_call_test5(__u8 a, __u16 b, __u32 c) __ksym;
>> +#ifdef __SIZEOF_INT128__
>> +__int128 bpf_kfunc_call_test_i128(__u64 a, __u64 b) __ksym;
>> +#endif
>> +struct prog_test_ret_pair bpf_kfunc_call_test_ret_pair(__u64 a, __u64 b) __ksym;
> [Severity: Medium]
> Should these kfuncs be declared with the __weak attribute?
>
> While the test programs in verifier_aggregate_ret.c use the __arch_x86_64 and
> __arch_arm64 tags, they still unconditionally reference these kfuncs in the
> C code. Without the __weak attribute, Clang emits them as strong externs in
> the BPF object file.
>
> When libbpf attempts to load the verifier_aggregate_ret object on unsupported
> architectures (when compiled with LLVM 23+), won't it fail to resolve these
> strong externs because they are conditionally compiled out of bpf_testmod.ko?
> This could cause the entire object load to fail, preventing even the
> non-kfunc tests in the same object from running.

I think we are fine here. We can revisit this if newer architecture (e.g., riscv, s390x)
needs __weak attribute in the future.

