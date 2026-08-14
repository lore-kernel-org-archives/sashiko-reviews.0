Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814B26ED59
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786747205; cv=none; b=VIloaPD99Nn4u1AA1DfET6IPs0KZI4bFUv04f8udJVGgYpaLaui47R8Em0jTpDze01YZB3YAUPJzd8yDndbXT1TGtiuSYK2fp3KM3HtSnI/MJlKfhbfNOjsIRG/ZxN9Q5jz1vdbB/tygp9MVBaWSGnmJCk0XzP9aSQLODJ9mQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786747205; c=relaxed/simple;
	bh=IV2UV3chZCnHrDt7xljiy/hS29K/5lVpa/jkOtIILzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qar4QO2oQeGkVQaGxEbcfaSpu3m1nrF3n6GzxJ3NoNrBQciAdzV4rbfNU36eUHDR+lqGu2rSQhRDIXxegfJCjq2ZB0Cj3xY4zpT4cIq0ODesT8TqYFYGhcR3cwrgBvRo4vTLMG5N+MytKiggeEQ4OcYUE83/OHlyUE+nhjy81XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gDO5u4/i; arc=none smtp.client-ip=91.218.175.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gDO5u4/i"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IV2UV3chZCnHrDt7xljiy/hS29K/5lVpa/jkOtIILzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786747201; v=1; x=1787352001;
 b=gDO5u4/ijsNQvRZDLWgD7wrvzaQILgLLYT9tKF9zSdxFwWjNdragyNgD2l3GKxvRGPneDaut
 Z2yoDIuOMl8sIxJ748FNRDMHx1TNS4af9ls3HGzaHit0pxUiSMxNId4XL92Rg7w0qwWnJRzmmhR
 TFyHIYG+KEqcexuYg8VvOVLo=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [IPV6:2a03:83e0:1251:27:9295:e585:8bf6:fa24] (2620:10d:c090:500::6:7be4)
	by smtp.migadu.com with ESMTPS id f4b8fbe0aa8df799;
	Fri, 14 Aug 2026 22:40:00 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <f651b905-eef2-41a3-ad55-ce2adede5d9c@linux.dev>
Date: Fri, 14 Aug 2026 15:39:54 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Check per-CPU address
 resolution per register
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260814220254.3797467-1-vineet.gupta@linux.dev>
 <20260814220254.3797467-3-vineet.gupta@linux.dev>
 <20260814222652.7600C1F000E9@smtp.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20260814222652.7600C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/14/26 3:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The test uses an unrecognized section name `SEC(".percpu")` for its global variable, preventing libbpf from loading the test.
> - [High] The test's inline assembly is missing the `mov_percpu_addr` instruction, causing the `__jited` assertions to always fail.
> --
>
> --- Patch [2]: [PATCH bpf v3 2/2] selftests/bpf: Check per-CPU address resolution per register ---
> commit 94ba39b00c54962b463da6e18c62f89978f29a3f
> Author: Vineet Gupta <vineet.gupta@linux.dev>
>
> selftests/bpf: Check per-CPU address resolution per register
>
> This commit adds a BPF selftest to verify that the x86 JIT correctly encodes
> the per-CPU address resolution. It loads a .percpu variable into all registers
> and matches the JITed add instruction against the expected register.
>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_percpu_addr.c b/tools/testing/selftests/bpf/progs/verifier_percpu_addr.c
>> new file mode 100644
>> index 0000000000000..967f4e6e3a490
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/verifier_percpu_addr.c
>> @@ -0,0 +1,72 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <vmlinux.h>
>> +#include <bpf/bpf_helpers.h>
>> +#include "bpf_misc.h"
>> +
>> +#if defined(__TARGET_ARCH_x86)
>> +
>> +int percpu_data SEC(".percpu");
> [Severity: High]
> Does libbpf support the SEC(".percpu") section name?

Yes it does:

   - tools/lib/bpf/libbpf.c:544 — #define PERCPU_SEC ".percpu"

>
> When bpf_object__elf_collect runs, it skips the .percpu section as it doesn't
> match known data section prefixes like .data. Later, when
> bpf_object__relocate_data processes the R_BPF_64_64 relocation for the
> percpu_data load, bpf_object__section_to_libbpf_map_type returns
> LIBBPF_MAP_UNSPEC.
>
> Since the section is not the BTF maps section, this results in a bad map relo
> warning and returns -LIBBPF_ERRNO__RELOC, causing the test to fail to load.
>
> [ ... ]
>
>> +__naked void percpu_addr(void)
>> +{
>> +	asm volatile ("					\
>> +	r0 = %[percpu_data] ll;				\
>> +	r1 = %[percpu_data] ll;				\
> [Severity: High]
> Are the mov_percpu_addr instructions missing from this inline assembly?

They are inserted by the verifier.

Thx,
-Vineet

> The commit message notes that an ld_imm64 of a per-CPU map value is followed
> by a mov_percpu_addr, but the assembly here only emits a BPF_LD_IMM64
> instruction.
>
> The verifier processes this as BPF_PSEUDO_MAP_VALUE and converts it to a
> standard 64-bit immediate load. Without the BPF_MOV64_PERCPU_REG
> (mov_percpu_addr) instruction, the x86 JIT emits movabsq but never emits the
> addq %gs:..., %reg instruction. This causes the __jited assertions to fail.
>
>> +	r2 = %[percpu_data] ll;				\
>> +	r3 = %[percpu_data] ll;				\
>> +	r4 = %[percpu_data] ll;				\
> [ ... ]
>

