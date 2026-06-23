Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA4625B0BD
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 23:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782257457; cv=none; b=RbzedjQVQHS65nOdz29l1HyRS3Pkzs8VtXxPxDjQXwNNzp/qOEy011rZlBYclSg076pj8BfkwLWCB7GyIkYsdJNSTXytasG6fKT1RkoH4JpYMlV1P88sv9CcoXOYBSNkFNAXhp3z/MA+W4JNSd9FFc3LWfUWvqqpVelO4EA91OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782257457; c=relaxed/simple;
	bh=MuoTGTyBvl7N37oZril/y5lELoVRXxF0v05PzdfesTs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DrLpmqWIhYz2KVqp4urs+K1eY1NYhOuucgl0S9jEPUKf2J43wZJQGqtO2rYdcMTKOKSU+2nuXmNMwOAgU+s5CfyW6/cH7jaKmBzRH64AYUq04tgk+EaLCLZoHyIRf2s6gpFohzoiqBm7/kPF1YkSfXLmWAH5Kwdx6I9NQJGsKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=rpzuN/21; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="rpzuN/21"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c52f96f60so755978eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 16:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782257455; x=1782862255; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHHcOKPTPmjQ53dCLW+k/ZKx8znLPlDdweDSxdM511E=;
        b=rpzuN/21HXngDH9kO6sUaqd5seahPIEPPetnE2QtBwLVtgSzsnonwbm5G1E1ipKCVd
         4ruzh6QHyFJO+7M/jIdGHCwiTVcQ/edBHbR4+phPRnux4Y3Q71d10L1skX3N6mWWqyvA
         F00VbwgtwwXvv3uojXOLlI2/wKfmNXAE1uRnV8rPAIpOcLOJjiZnb/1rGq2YUOAN4XBf
         ZNRmTpf8yWr2c7Rf0XZLYbcnIW3xgfpYlFqBdnO2njB8YTL7RqESl8dZWwDBOPldCXFQ
         8IxhMQKrjXlu8OMlNKfnMKZe6vkGXaZGoCkL7wW6JPBRI/t/aBc1DQdNThjIqqp5ma5G
         23Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782257455; x=1782862255;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pHHcOKPTPmjQ53dCLW+k/ZKx8znLPlDdweDSxdM511E=;
        b=UWVIEMZzZngHsxthB8mzmB/cv9w5Yog/0ZXrhC9duBxkcAIqkQIJ7ex5U2OPbQGBPV
         dXeoTBc8dgdA5c3m2NPX5R6QPYeT38hltujiEpYlMEo2wp9YDNKWkOuuLiGT7xZerBXO
         7iy2cfMgAlFvvhh2lDuze2wVG2F2cvVNS4Lk3HHJ7tA3D9UQBp45GRv6z0nn3kowkEcA
         rTRQcdc8pr0icLi/lHaCLFKP59urQcUnMfCK7LpGrpjSxqMhfpgL34wx05A5q4W1Vctc
         xqbCtzdJbDxQvNoPNZ8lp8RZtXwx1mDm+tCZwxQ5h6w5oNDaAQijlXMHviw1DuvQKtGM
         DXgQ==
X-Gm-Message-State: AOJu0YxzHZwH6bpO8Jh/jwTSgwLttHzWYJibWCXPR1lgP59hLUnP9yNE
	kyVDo6oHw/AK22ZxAZeOlZeX0Ml75xtu9mOrY/b36fkxw6Y+zbokV0peqqyGorwzdkvH0aZsOcl
	1a8CWeBqfGQ==
X-Gm-Gg: AfdE7clU9fAljDSA6CFH0NZKKuDAC7VxSkLlDXu9Dtebu7VEErEGhm42IXjhX3M3d5z
	7iaiq2htgF564lG2vG2jbhJHG99OG+qW1VEjuZXpcJ0FsPPsOYyRvGgxsxeM2EVJfCND9OUAbZd
	5Fz/PfQfVTapfQ7c/si9M9OP+0woh7eSYmZfCXpVzHvDmjh4Vma++OQk0D9Nq6TF41cwBn+g5gq
	O5N7BUcVwt90SRoxu5GpUbC1IZpIIY/FPyVpGNuJcOxNZ85z1WjXOOclxhe3U0B6rIwg3KQCr6t
	ZWymbhusLU7aEdFN10ur6fkFBKTP5mIc233tKd6IUf51+AJ7wwS6cX4PwTTaKqScMjQWWaLLC8c
	wE7c8SIeraF7S9BH7K6Wk3sQQMUAg4rytRP9KXkQjsLqmQ3oCmewaYeKaKQTysDc25ChBZw==
X-Received: by 2002:a05:693c:37c3:b0:30c:689b:c59d with SMTP id 5a478bee46e88-30c689bce4amr1362727eec.5.1782257455025;
        Tue, 23 Jun 2026 16:30:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::2526])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5c1056f8sm7379882eec.15.2026.06.23.16.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 16:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 19:30:53 -0400
Message-Id: <DJGTJF17UY7P.VAHCYNC312A7@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 4/5] selftests/bpf: Add arena-based bitmap data
 structure
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260618085626.19633-1-emil@etsalapatis.com>
 <20260618085626.19633-5-emil@etsalapatis.com>
 <20260618090824.02DB01F000E9@smtp.kernel.org>
In-Reply-To: <20260618090824.02DB01F000E9@smtp.kernel.org>

On Thu Jun 18, 2026 at 5:08 AM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] The `struct bitmap` uses a `u64` array, but bitwise helper macro=
s rely on `sizeof(long)`, causing a severe memory layout and indexing misma=
tch between 64-bit BPF and 32-bit user-space.
> - [High] `bmp_set_bit` and `bmp_clear_bit` perform non-atomic read-modify=
-write operations, leading to lost updates under concurrent access.
> - [High] `bmp_alloc` incorrectly rejects bitmap sizes that are not exact =
multiples of `BITS_PER_LONG`, completely breaking allocations for standard =
cpumask sizes.
> --
>
> commit e05abd6424c958e46d415ca79df966bf83a06a24
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> selftests/bpf: Add arena-based bitmap data structure
>
> This commit adds an arena-based word-aligned bitmap data structure.
> The structure is intended to be used as a building block for features
> like sched-ext to represent cpumask structures.
>
>> diff --git a/tools/testing/selftests/bpf/libarena/include/libarena/bitma=
p.h b/tools/testing/selftests/bpf/libarena/include/libarena/bitmap.h
>> new file mode 100644
>> index 0000000000000..11623a82e66a5
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/libarena/include/libarena/bitmap.h
>> @@ -0,0 +1,31 @@
>> +#pragma once
>> +
>> +#define BITS_PER_BYTE		8
>> +#define BYTES_TO_BITS(nb)	((nb) * BITS_PER_BYTE)
>> +
>> +#define BITS_PER_LONG		(sizeof(long) * BITS_PER_BYTE)
>> +#define BITS_TO_LONGS(nr)	(((nr) + BITS_PER_LONG - 1) / BITS_PER_LONG)
>> +#define BIT_MASK(nr)		(1UL << ((nr) % BITS_PER_LONG))
>> +#define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
>> +
>> +struct bitmap {
>> +	u64 bits[0];
>> +};
>
> [Severity: High]
> Since struct bitmap defines its storage as a fixed-width u64 array, will
> using sizeof(long) and 1UL in BIT_WORD and BIT_MASK cause a mismatch betw=
een
> 32-bit user-space and 64-bit BPF?
>
> On a 32-bit user-space process, BITS_PER_LONG is 32. Accessing bit 32 wou=
ld
> compute BIT_WORD(32) =3D 1, pointing to bits 64-127 of the u64 array, whi=
le
> the 64-bit BPF program would correctly calculate BIT_WORD(32) =3D 0.
>
> Should these macros use fixed-width indexing constants like sizeof(u64) *=
 8
> and 1ULL instead to maintain the shared memory contract?
>

Ack, should be BITS_PER_LONG_LONG. We are not prioritizing 32-bit here.

> [ ... ]
>
>> diff --git a/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c b/too=
ls/testing/selftests/bpf/libarena/src/bitmap.bpf.c
>> new file mode 100644
>> index 0000000000000..a8ca814aa0c85
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/libarena/src/bitmap.bpf.c
> [ ... ]
>> +__weak
>> +struct bitmap __arena *bmp_alloc(size_t bits)
>> +{
>> +	struct bitmap __arena *bmp;
>> +	size_t size =3D BITS_TO_LONGS(bits) * sizeof(bmp->bits[0]);
>> +
>> +	/* Assume long-aligned masks. */
>> +	if (bits % BITS_PER_LONG)
>> +		return NULL;
>
> [Severity: High]
> Does this logic artificially reject valid unaligned bit counts, preventin=
g
> its use for standard cpumask sizes where nr_cpu_ids is not a multiple of =
64?
>
> The allocation size is already safely rounded up to the nearest word
> boundary via BITS_TO_LONGS(bits), and trailing bits seem to be handled cl=
eanly
> by operations like bmp_last_word_mask.
>
> Could this check be removed so callers aren't forced to artificially roun=
d up
> requested bits?
>

This is a deliberate design choice. The space savings we'd get by
handling unaligned cpumasks are relatively small so we don't worry
about it unless it proves to be a real issue.

> [ ... ]
>
>> +__weak
>> +void bmp_set_bit(u32 bit, struct bitmap __arena *bmp)
>> +{
>> +	bmp->bits[BIT_WORD(bit)] |=3D BIT_MASK(bit);
>> +}
>> +
>> +__weak
>> +void bmp_clear_bit(u32 bit, struct bitmap __arena *bmp)
>> +{
>> +	bmp->bits[BIT_WORD(bit)] &=3D ~BIT_MASK(bit);
>> +}
>
> [Severity: High]
> Will these non-atomic read-modify-write operations race if multiple CPUs
> concurrently set or clear different bits within the same 64-bit word?
>
> Since the bitmap is intended for concurrent structures like sched-ext
> cpumasks, updates could be silently clobbered.
>
> Should these functions use atomic built-ins such as __sync_fetch_and_or
> and __sync_fetch_and_and?

Ack.
