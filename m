Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EB1471CFA
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254086; cv=none; b=p3DHpqAwfrP2Q+ZWNy0dU0yHpX4IxFzLo5oolZvos7LEapd/Te/4ss3rqqqe5Ggo98zFKyuWlr6/54uPJCZLpBicuNwy92+j/w/6Ky5ypJHnNM5KkGUhDJt2W24dAHaLb1rBJIATcPNXkxy8ILKzjK9YUcCeaO1jn3y/tjhWOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254086; c=relaxed/simple;
	bh=/2golh+DZj7e+88AlqhMTcnLZK5ZchvAMK71sJ38rAU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h6D2cVSwCSpr/funaGy6nyrPwePp+wx8gs5b+01bwvtmxtzBI2Q0ZX4VXTx2aIEyxCkRnWKIr2A7hyWjL88NwXmtlahDIF/nJvv8AyBGVGG2AZE9SW/L9RVnOjahZ3BLc3gN6lnSerEdP2ScyeDV2h4FGqk8ywZgq1QnU6o5+Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC1is/nt; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC1is/nt"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-498079e98beso489125e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 12:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787254082; x=1787858882; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uemxqtGhV2C7D/1S+JK/ZhHv3WUnvR7x5H3CzBPQF2w=;
        b=AC1is/nt8pelXYTiiVVNrmmhZfMLxgn6JKEr8APJ44YByRXb24i1IJxZ+Ts1Q9Y1Gy
         P5f75PUV9T0WH+wqOSnkxUMKtGaDgG7nkmAFvYUTXfUZ40//6rAOu5X5fwIn1o2vaFLF
         P4pasZA7iQ9l7umjrrRLijqTtLGqfTMh8uRYa/66JygdqA3ZZ/Im7ueNPWxDLvVhNdJ/
         VfLWnYGK1QEoQ1L9ahy0l/jq7ONdDow8walod8OFRG+dcV/uYs1zz04y7Eb+Zh3bDi83
         fu8c8nc+w3xqKKfEBwwGWcHqT6WxdrxSwA1sAStvofMIELPCQUWc+Pm7a48+2skThL/s
         qBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787254082; x=1787858882;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uemxqtGhV2C7D/1S+JK/ZhHv3WUnvR7x5H3CzBPQF2w=;
        b=KMSXwXIKxkkAR8cSwBF+65sV77wis61yqeDwOzsL4W0UR76oTqvJHxr4j9iKXfnOY4
         HTDSvJlbYP7tVGm6I2uSpQc+zcBvv8WkObHhNma0YcIfYx/TMItAvkU4Ko1CAM9cZRew
         b21ETEtvQIdjY6fXXewZCeBBSrhyAS63KsjeP73UDdI0pXUFG4HwPb92BH/9NHaNbiQH
         xyHervxQxIpFsa1myKe4CwfcnQz2PARO5+weirTJJmboXtt7Xwqt4L9GjHCe+0ASrkqz
         +f558onxTcRzeMp2QB9HpoHOYKmV+lVO4glEGfcWqqdBfO832LrSIp7QghMm5bOnOEDZ
         zesA==
X-Gm-Message-State: AOJu0Yx8YtqzZAY7F/0q0mRbzC4IzCVGdGxR68Y8W3Z9OhtFm/igEbLw
	l25cF9W7of2r3Ow0hPvnxkoJNuHM7ITS/EDFxvEpBXu5DFi/YHfOBrvh6flO1S+2
X-Gm-Gg: AR+sD13A1gf1FjCEAahLWzGJu3NCr0IPbKlAIf6iStAynAaY6laMzqde/K/fuC4Vh05
	JdxrcBkEquEwCO0icVIpnGlh/3tj/C8OPUm+zfVNtgdMFqn+tF9+38q76ZXAiriEjCxpZp8CRDJ
	WqDkc1wUlv2Ehp/sdSaSOyP7//H/TQ2teWLDElGBaY49ZulLW/Uh17IVmvo0MT3TVn7M2Y4fxPs
	Y7kqXIcFcp80cOg+pKEX6BOvWPhhgqQ6bY4lW203s1H+94HXrsn/yXImbYUasuf5NqOknHvp2vP
	nIx6trfdLqKumy8bup6+n6Q/Yjrukw/luxl+XO4Bfogg3W7kkkZynzkFKvpJc3GBLpOXnFTe1g9
	lUEdWvDAcLQOgk3A50ps0B2lMGO8Zfm5NcDDuCj2Q1VYxKNA0Vp0veq15DWW20L5NqSoHiVurn9
	kyAxbter4bGKsMMvfNESyf4hslVjjIshsL4T9QRxIBXASqzxqMIKDU/0Z4ZiUmX4hNcpypomMJN
	Nz+jD49qoLj96y6Oyv4aPkD8Qh3u151WihC7sVObBAeCx5UFILpPw7iLnsHnABq6N67da+c0D1c
	LV+TXFcvH0P62O/OBHMSnUrPn3c=
X-Received: by 2002:a05:600c:474a:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-499b845709amr19655495e9.11.1787254081474;
        Thu, 20 Aug 2026 12:28:01 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm16104141f8f.35.2026.08.20.12.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 12:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 21:28:00 +0200
Message-Id: <DKU0P1YGJWHF.3PPZPRDGZX4I3@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH 3/6] selftests/bpf: libarena: Disable IRQs during
 allocation
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20260817191616.11071-1-emil@etsalapatis.com>
 <20260817191616.11071-4-emil@etsalapatis.com>
 <20260817192833.63B111F000E9@smtp.kernel.org>
In-Reply-To: <20260817192833.63B111F000E9@smtp.kernel.org>

On Mon Aug 17, 2026 at 9:28 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unhandled lock failure path in `buddy_alloc` and `buddy_alloc_fr=
om_new_chunk` leaks newly allocated memory chunks.
> --
>
> --- Patch [3]: [PATCH 3/6] selftests/bpf: libarena: Disable IRQs during a=
llocation ---
> commit 33cf3ed979bbaa281367dbd5d393dc12a91a1af9
> Author: Emil Tsalapatis <emil@etsalapatis.com>
>
> selftests/bpf: libarena: Disable IRQs during allocation
>
> This commit updates the buddy allocator in libarena to use IRQ-saving
> spinlocks to prevent ABBA deadlocks. These deadlocks were observed with
> sched_ext schedulers when an IRQ interrupts an allocation and subsequentl=
y
> attempts to take runqueue locks.
>
>> diff --git a/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c b/tool=
s/testing/selftests/bpf/libarena/src/buddy.bpf.c
>> index c674ee5cfcc1d..2490ab1396de0 100644
>> --- a/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c
>> +++ b/tools/testing/selftests/bpf/libarena/src/buddy.bpf.c
>
> [ ... ]
>
>> @@ -730,9 +727,10 @@ static u64 buddy_alloc_from_existing_chunks(struct =
buddy __arena *buddy, int ord
>>   */
>>  static u64 buddy_alloc_from_new_chunk(struct buddy __arena *buddy, stru=
ct buddy_chunk __arena *chunk, int order)
>>  {
>> +	unsigned long flags;
>>  	u64 address;
>>
>> -	if (buddy_lock(buddy))
>> +	if (buddy_lock(buddy, flags))
>>  		return (u64)NULL;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this leak the newly
> allocated arena chunk if the lock acquisition fails?
>
> When buddy_alloc() needs more memory, it allocates a chunk and passes it
> here:
>
> buddy_alloc()
>   chunk =3D buddy_chunk_get(buddy);
>   if (chunk)
>     address =3D buddy_alloc_from_new_chunk(buddy, chunk, order);
>
> If buddy_lock() fails in buddy_alloc_from_new_chunk() (for example, retur=
ning
> an error like -ETIMEDOUT under heavy contention), it returns NULL without
> linking the new chunk to buddy->first_chunk.
>
> The NULL return then propagates up to buddy_alloc(), which discards the c=
hunk
> pointer completely without freeing it. Since BPF MCS spinlocks can fail u=
nder
> heavy task load, could this predictably exhaust arena memory?
>
> Should this error path call bpf_arena_free_pages() on the orphaned chunk
> before returning?
>

The rest are meh, but this one seems plausible. Please check and follow up.

>>
>>
>> @@ -745,7 +743,7 @@ static u64 buddy_alloc_from_new_chunk(struct buddy _=
_arena *buddy, struct buddy_
>>
>>  	address =3D buddy_chunk_alloc(buddy->first_chunk, order);
>>
>> -	buddy_unlock(buddy);
>> +	buddy_unlock(buddy, flags);
>>
>>  	return (u64)address;
>>  }
>
> [ ... ]

