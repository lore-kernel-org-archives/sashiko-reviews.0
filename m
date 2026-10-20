Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516546;
	b=LRf+Ie67MJnOwVHdDKdClaEruLGMQDJIQDc8I+SPcBn317B1+RUzPWSoTj1ioKnsFvXt
	 8mSl4ux40kobceFmw5iJF1mYnBTPi8NwKEy/z8Vyv2O9ekqTyfgh50pqG1Sx9qbHaD+xh
	 0ULalN01I5s68AKlUYI+MnhqH6ZzRvhMXMCjdPRkqdpTzhWGKFM0jfV47HQCbrMNwg5ba
	 YzagktswuJ0XcVY5qI67MFkB3kQL/VLQqsB6qRZKcXbAXUtsAfXqBUlqGpyFxlJwY6soP
	 +8e1NLfhcLj8ZKh6jvGVErJ1tZeUP1toUSs3HTaulBrtMoMWX6Im2O/vYbtjcgzLtng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516546;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yoZ0s+1JjaWMxbOAdwnEZHjXlxQoadj0CaIfiBABUd0=;
	b=PkgSzY2Es5SbKJe151MRyoTSUr34S72YDE0iqolLEOl4xg8R3CEdvN3KA0i3pmqwJeps
	 Fs+YFojN6uDmif5ZMyuskTEAhMBKCgenLnQ3fwtc6njyT3HQiXf1aZ65P9JeNb22xWwF3
	 ojl0q64I0Ss0E64w+lw8OplJR5FeeUZbQcNyP0kX0YmPuDuExVIAZs93SqPjriw6ULKot
	 XExE7+9AElbJdLyZGcFbnnXJlqEO9P7A31HViWgreaoogMaap1dnuqwPl8CaexteM0/bJ
	 vBt3JOc9EOIMyEakK2COSKhEEPcMTKW+4E1SfxhJ0xdsT+dY5+P5GooqS7/zvT1ImNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="GbjCIC/d";
	arc=none smtp.remote-ip=95.215.58.24
Received: from mta1.migadu.com (out-24.mta1.migadu.com [95.215.58.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D100606B533
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 17:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D100606B533
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GbjCIC/d
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=+MYMcLaKmflZhPpa6ORxIVfcC9BERtwH9CFho9USxWA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792516543; v=1; x=1793121343;
 b=GbjCIC/d8loIPSoDHfOexvnlL8QBLPP1IKfsilURfcM5bnYnH4fwCM7t7LNVUoVlcJ4p8Rrt
 wSJf3ieipMIHwtOsj/ZUKxXm9u94vE5xA99RHYpogVFnEcr/OUaSWXur0+8MdOnAqvuVK5xrszl
 TFVBpT0fhP9ZPNSTwBoFHzL8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a6299d0d0a6e04fa;
	Tue, 20 Oct 2026 17:15:42 +0000
X-Mizu-Trace-ID: a6299d0d0a6e04fa
X-Migadu-Flow: FLOW_OUT
Message-ID: <9f4fb200-9ec6-42de-8f9f-5eac10f258d7@linux.dev>
Date: Tue, 20 Oct 2026 10:15:37 -0700
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 10/12] selftests/bpf: Cover the low-32 link
 for narrowing stack fills
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
 <20261020161907.2115379-11-vineet.gupta@linux.dev>
 <sashiko-outbox-179351@kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-179351@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 9:29 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] selftests/bpf: misplaced ifdef in sext_byte_fill_drops_sext_link()
> --
>
> commit 0f3b5c981ef84ecf43731c167adb9d7addf744eb
> Author: Vineet Gupta <vineet.gupta@linux.dev>
>
> selftests/bpf: Cover the low-32 link for narrowing stack fills
>
> This commit adds eight BPF verifier selftests covering low-32 scalar link
> tracking across narrowing and sign-extending stack fills, and introduces a
> CAN_USE_LDSX macro in bpf_misc.h to guard tests that use sign-extending
> loads.
>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
[snip...]

>> +SEC("socket")
>> +__success __log_level(2)
>> +#ifdef CAN_USE_MOVSX
>> +/*
>> + * Needs MOVSX as well as LDSX: the BPF_REG_LINK_SEXT under test is built with
>> + * r7 = (s32)r6, and only the byte fill below is an ldsx.
>> + */
>> +/* a surviving link would print as R2=scalar(id=N+0.sx,smin=... */
>> +__msg("(91) r2 = *(s8 *)(r10 {{.*}} R2=scalar(smin=")
>> +__naked void sext_byte_fill_drops_sext_link(void)
>> +{
> [ ... ]
>> +}
>> +#endif /* CAN_USE_MOVSX */
>> +
>> +#endif /* CAN_USE_LDSX */
>> +
>>   char _license[] SEC("license") = "GPL";
> [Severity: Low]
> Should SEC("socket") and __success __log_level(2) on
> sext_byte_fill_drops_sext_link() be placed inside the #ifdef CAN_USE_MOVSX
> block?

Indeed that bracketing came out weird.


> In tools/testing/selftests/bpf/progs/bpf_misc.h, CAN_USE_LDSX and
> CAN_USE_MOVSX can be enabled independently via __BPF_FEATURE_LDSX and
> __BPF_FEATURE_MOVSX

Independently meaning ? __BPF_FEATURE* are indeed compiler toggle 
derived but the CAN_USE* additionally reflect whether arch JITs support 
them so they are a combination of __BPF_FEATURE* and arch JIT support.


> (for example, with bpf-gcc -mldsx/-msmov flags).

Just for correctness, -mldsx doesn't exist for gcc, -msmov covers both.

> If CAN_USE_LDSX is defined while CAN_USE_MOVSX is not defined, the body of
> the #ifdef CAN_USE_MOVSX block is preprocessed out, leaving those attributes
> dangling so they attach to the following _license declaration (or to any test
> function added after this block).

Indeed the attribute placement needs fixing.

Thx,
-Vineet
