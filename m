Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E035DA40
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 05:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054821; cv=none; b=YM0SFbWSrlUbcLRdQPyRqfGfE8eM8Re++KNsL7mCnpGgHA+MKgbVBCY40rDrP3oTNcagQIv4Jv4vEkNSTl4nTbqmajdEACs537NV9wvDpvA48GM5tgj/K7MsAX2QNeOGggVl1kfU9r0JWvf7NEGIBYaCb7NX1Av5gqwkKeYGkWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054821; c=relaxed/simple;
	bh=AF+4jjDuyy45ZsThyFftPwEVH8rvViuRR54c1NpXdQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJI/xzceA3oI/QTGJ0iWA22fJ5DZl5L4VegcBUmiJb8tx4iDh4wezuDT105l/DsrYLsvmNLr25Y7LjX9NJcq/jjNnPbU9smPjLDikhHhLgA8IZcE/NvSBWuZIV77jBO3pdBBbaHLKkGQ9RBv2zSuQUnlzumlS6cN4ZiTAVf6cCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ffygSiBW; arc=none smtp.client-ip=91.218.175.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ffygSiBW"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=AF+4jjDuyy45ZsThyFftPwEVH8rvViuRR54c1NpXdQc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790054817; v=1; x=1790659617;
 b=ffygSiBWMghBMbvQkFCHVeM1X6ztpdvG6L4qvctSZqsdKCVWEHxOYcdxAcMh/r3vk7x7xh38
 krsKUuW/ZJSFb1hlx72SfpxLOezExllRSjVcBeWd8s7PukOp3gg4RjwlWim2vhCIV5loAZzhRcO
 +D6zbHW5xK3l+hwCBZF9u90E=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id cf9b6a6d4daad586;
	Tue, 22 Sep 2026 05:26:56 +0000
X-Mizu-Trace-ID: cf9b6a6d4daad586
X-Migadu-Flow: FLOW_OUT
Message-ID: <40afc268-940d-4ab3-9996-6e39602b560b@linux.dev>
Date: Mon, 21 Sep 2026 22:26:54 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 18/20] selftests/bpf: Add an end-to-end
 .bpf_cleanup exception test
Content-Language: en-GB
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260921210033.1715000-1-yonghong.song@linux.dev>
 <20260921210205.1724656-1-yonghong.song@linux.dev>
 <20260921212213.B2D8F1F000FF@smtp.kernel.org>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260921212213.B2D8F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 2:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] bpf: endianness bug in raw BPF instruction emission
> - [Low] bpf: BPF Comment Style Violation
> --
>
> commit 322ad0f798ee8015c8f51c953009198fc70b2b9b
> Author: Yonghong Song <yonghong.song@linux.dev>
>
> selftests/bpf: Add an end-to-end .bpf_cleanup exception test
>
> This commit adds an end-to-end test for exception cleanup using .bpf_cleanup
> records. It defines inline assembly constructs mimicking compiler output to
> evaluate how the kernel handles and optionally rejects various landing pad
> combinations and malformed paths.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions_cleanup.c b/tools/testing/selftests/bpf/prog_tests/exceptions_cleanup.c
>> new file mode 100644
>> index 0000000000000..c932da7cbec16
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/exceptions_cleanup.c
>> @@ -0,0 +1,121 @@
> [ ... ]
>> +/* A table with more records than the program has instructions: no valid one
>> + * can look like that, and it is refused before the kernel allocates for it.
>> + */
> [Severity: Low]
> Does this code adhere to the BPF comment style guidelines?
>
> The BPF subsystem requires multi-line comments to have the opening '/*'
> on its own line, with the comment text starting on the next line. In
> test_cleanup_info_cnt(), the text starts on the same line as the opening.
>
>
[...]

> [ ... ]
>> +	/* gotox r2, as a raw insn: the mnemonic only reached the LLVM
>> +	 * assembler in llvm 22, and BPF_RAW_INSN() needs <linux/bpf.h>, which
>> +	 * vmlinux.h rules out.
>> +	 */
>> +	".8byte 0x20d;"
> [Severity: Medium]
> Will this raw instruction emission work correctly on big-endian architectures?
>
> The inline assembly in gotox_in_pad() emits a 64-bit integer literal. On a
> little-endian target, 0x20d places the correct opcode bytes at the start
> (offset 0). However, on a big-endian target, the 64-bit value is emitted with
> leading zeros, placing 0x00 in the code byte. This corrupts the instruction
> stream and will cause the BPF verifier to reject it.
>
>> +"l0_%=:"
>> +	"call bpf_unwind_resume;"
>> +	"exit;"
> [ ... ]
>> +	/* r0 = *(u32 *)skb[0]. Spelled as a raw insn because BPF_LD_ABS()
>> +	 * needs <linux/filter.h>, which this file cannot have -- vmlinux.h
>> +	 * already defines the uapi enums.
>> +	 */
>> +	".8byte 0x20;"
> [Severity: Medium]
> Similarly here in ld_abs_in_pad(), does emitting 0x20 as an 8-byte literal
> corrupt the instruction stream on big-endian architectures?
>
> On big-endian targets, this will evaluate with 0x00 at the code byte instead
> of BPF_LD_ABS (0x20), causing malformed instructions to be passed to the
> verifier.

Will fix endian issue.

>
>> +	"call bpf_unwind_resume;"
>> +	"exit;"
>> +	CLEANUP_REC("1b", "2b", "3b")

