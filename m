Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5A35B632
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280263; cv=none; b=fxL+YiN7sqyNnWvj5k5yZxC0C2bI3jVhWm4PBWAE8fynA4mE66iLgo1+I6FUZxzVcEu2CpSulH/xurzrqJO1GH4ybaTSgQ99nkBR6zlGMd7yL8w9SB6pg4qO4f17Lh67pho7X/2BeJVXO/ZWdDMg6SA5vGAcATUM8v/m7eryZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280263; c=relaxed/simple;
	bh=WBICROsVJjdfEYN+o8+n4hxG77bO3Y1xRI4/Xzv216I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=uAPAeU1hRmoM7/NMIdhm4MHlQtevycl2Ofu7lqr7PnJucvHcIV8s8E+YlL+chhWP2gs1umeH/Vy9MpLA2ZKvU7MkuMeY3nFSsl2Ng4JtRqVvAZPRaNEvqKDGQcqycRYlTco57lWgd5K37kmXEN4j9TsJJEMQpr3nMoJovGnUfis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGV5P7q9; arc=none smtp.client-ip=74.125.225.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGV5P7q9"
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-493b4af7976so42095815e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784280260; x=1784885060; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOnetI83VqKtCeBIPBoMPtcrX0EGAdXcepViLnk5ugQ=;
        b=BGV5P7q9/qI2pEUad85oSXznyZv+tY7lpShUoeWCPCMPm328Mq2p46Kde09Q3kvrVv
         f+gxNxGL0jzpCEALEqjfIFTX35Ieh4TzSVUWV92VL9eVNslJC8WEUp2x0XgZwg9PqSxe
         3zuCUXBcyORzCx4z6YbAXm3U8tUA70wcXmq3rQtO8dn8ZWxS3Aq9XrUjdc33iGfGHxlx
         A9p7XwGPY8fu0kHKFLOyf1e+gtPbKxlZRzJLI1YHHnA94lJ9M6iKzxh0ovBPn23+h5R9
         FsANS2G2sdgATw7v84dkjwdZbULMwq9A5UQj45v7gUhMj1kKS6JDuuFfBn8Qg69b94jV
         6tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280260; x=1784885060;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOnetI83VqKtCeBIPBoMPtcrX0EGAdXcepViLnk5ugQ=;
        b=iZuU3zN64pXDSZ/dDOm5JZr6S0xZlja1IZxDYl9SswySLkoKyFLJ6t/lCcYZ6s/vzl
         vb7IAQjoMPRracAAVT43IOomE/bwgRvn4HycZFr2wwDY1x+/4TLAtxlk8u4x0veoea8c
         uKE7ku3kmQ6bZe6E+r2HJbQaDxjwmTSOP+NKJGmlLUWoo9TsG7s5bfEng7AaVBFgfRSw
         Z20slqOktmNf1HYul6LWxYRNPWNpczg8dc9Xa2V1oy0A72i6rm+nTCF8M1GJVGdf5fZH
         c8VqsbiDonEEW0r5TvmYDyIvnEb4EsQqD4YMH3bdRUkBvcj3oarhDPN+CpDEP9HqjzH+
         yoqg==
X-Forwarded-Encrypted: i=1; AHgh+RoOE6qqAvuyg1rMF1jXZz+sCwadO9lEWUzPW7vvzJmHIXBa1GvB8/7kj/pFEPK1T/QWYHuWuUK0n7FG5WKICn4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpxuJ65w2gO+qoneaoAGwNemNPNBF5WA+g52DoWg+C6UYHN7VJ
	7mkDBOKqDJ6Ob9Bk+8TzcPn5PwRwwOwXHUe5L/SB3um2qZ+f91wtVojI
X-Gm-Gg: AfdE7ckEaCpzWx0Y85Y1lgzgaoOZAaCPR3uXX2+Cx8PcCP80LrinmxalZQt/tzkJGez
	f1pF1JDU5+XmhP11WB3mlsOzqa1wwe7X9Z/C9Xn24e5nSM5SIZY8oetgWajFHvbo79s2d7aBx5u
	7MET4/y0PWXi7wUZdxRqR+MjOreVXY9IGFtAqL5YhvassxDDJqsPZBMU7iPfv149jjn3o/J9O/z
	tYvXwQCtORIb27eGyiJIpZvPP1QO45lAxNh5lYF1bVdZ59sfYq8OlQ2AG8RMIBBBU/akJKYXoFO
	A1HlVCEl1gnJVvgkfldJzr8tYrU3Ic5+PoispAC0CWwU3ahc1if3axT33XP/akHn2jPO79nC5nv
	cZC3AnL3rvTE81nTDMsPtGtYtBAj8PpOC+MpzJXI+XsTfrvHtnf0jQdUh5iiWl3iY8aYX3rcmu9
	T0oSsXj3QYyekzMw5j4iJd8Jr6gAhKKDS0QahgRCoJdqC42nBoWXvaUc8DrpKyNbIKZV/s2ND+y
	Z1BrzYt/Ti3OJIArlPJUELHZe7CK9c928WlO5YZCRDX
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr17575285e9.28.1784280259238;
        Fri, 17 Jul 2026 02:24:19 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm40676555e9.11.2026.07.17.02.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 11:24:17 +0200
Message-Id: <DK0QKAJXN3KI.2KJ3LLPYKTXGE@gmail.com>
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/3] bpf: Add memory usage for arena
X-Mailer: aerc 0.21.0
References: <20260716142746.8794-1-jiayuan.chen@linux.dev>
 <20260716144840.3DE1F1F00A3A@smtp.kernel.org>
 <50c2d308-cfed-41bb-9084-54e380463ad2@linux.dev>
In-Reply-To: <50c2d308-cfed-41bb-9084-54e380463ad2@linux.dev>

On Fri Jul 17, 2026 at 4:08 AM CEST, Jiayuan Chen wrote:
>
> On 7/16/26 10:48 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>>
>> New issues:
>> - [Medium] The `nr_pages` counter is modified using plain writes while b=
eing read concurrently locklessly, constituting a data race.
>>
>> Pre-existing issues:
>> - [High] Functions that can sleep and acquire sleepable locks are called=
 while holding a raw spinlock with interrupts disabled.
>> --
>>
>> --- Patch [1]: [PATCH bpf-next 1/3] bpf: Add memory usage for arena ---
>> commit 68cbc4739a7a9be56d49db779d319ec002523097
>> Author: Jiayuan Chen <jiayuan.chen@linux.dev>
>> Subject: bpf: Add memory usage for arena
>>
>> This patch adds memory usage tracking for the arena map type by counting
>> the pages mapped into the arena. It bumps a counter in apply_range_set_c=
b()
>> when a page is added, drops it in apply_range_clear_cb() when removed, a=
nd
>> returns the calculated usage in map_mem_usage().
>>
>>> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
>>> index 80b7b8a694464..bc34602116040 100644
>>> --- a/kernel/bpf/arena.c
>>> +++ b/kernel/bpf/arena.c
>> [ ... ]
>>
>>> @@ -196,6 +198,7 @@ static int apply_range_set_cb(pte_t *pte, unsigned =
long addr, void *data)
>>>   	set_pte_at(&init_mm, addr, pte, pteval);
>>>   #endif
>>>   	d->i++;
>>> +	d->arena->nr_pages++;
>>>   	return 0;
>>>   }
>> [Severity: Medium]
>> Is it safe to use a plain increment here since nr_pages is read concurre=
ntly?
>>
>> In arena_map_mem_usage(), arena->nr_pages is read locklessly via
>> READ_ONCE(arena->nr_pages). The Linux Kernel Memory Model requires that =
writes
>> pairing with a lockless READ_ONCE must be marked with WRITE_ONCE to prev=
ent
>> the compiler from splitting the writes or assuming no concurrent access.
>>
>> Could this lead to incorrect statistics or torn writes?
>>
>> [ ... ]
>>
>>> @@ -227,10 +230,11 @@ static int apply_range_clear_cb(pte_t *pte, unsig=
ned long addr, void *data)
>>>   	 * scratches its PTE. A later bpf_arena_free_pages() over that range=
 walks
>>>   	 * here. Without the skip, scratch_page would be freed.
>>>   	 */
>>> -	if (page =3D=3D d->scratch_page)
>>> +	if (page =3D=3D d->arena->scratch_page)
>>>   		return 0;
>>>
>>>   	__llist_add(&page->pcp_llist, d->free_pages);
>>> +	d->arena->nr_pages--;
>> [Severity: Medium]
>> Similar to the increment above, does this plain decrement need WRITE_ONC=
E() to
>> safely pair with the READ_ONCE() in arena_map_mem_usage()?
>
> It's true.
>
>

Overall seems ok to me, since you are going to resend, could you also split=
 the
changes to move remove scratch page field into a prep patch before adding
nr_pages?

Thanks!
