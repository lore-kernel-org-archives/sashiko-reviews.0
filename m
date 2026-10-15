Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C653A895
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077356; cv=none; b=upcc8ZcGH/Ieq/ExFOSHpWE1hcBu8xUumadj8r/sAFJ+jjPHbjq0JQ+ByQBTxgA9rwfBEVVuz4Me8HLeDG/Njg0YN+6tv94FkkRg8l9kvlNT3DbKaBGB4+rKNsv80VnLTFIOjr9/nSW5JupxlRDl94IiRf6wGLIN5cuaCUDinJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077356; c=relaxed/simple;
	bh=8ObtmiXxUW0QYBKwMksxElhRQHOEDgL0OR2XCBFcIxg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=T9EXPE9oxXl+rPnA3eyp1AACM/t5yZ9WzzcMw4QDjJwdazsgiFy7nxO7mxIwsbaMa6Ts2P0ODNfrsJK8FOilx1Aptl3euWl0xV8gHiXr4uj0537E4fk98++Gkg+4xwWdRXdsbhS1vOW/I+vStw3YkfbemfV2T0ExfkbK0asvNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=NdAWTRjm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="NdAWTRjm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so7338962a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1792077353; x=1792682153; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1fIDtIhk7OY8zkMZnxFxkhA3Vz85iLRRDcbIuJn6NY=;
        b=NdAWTRjmETs1Qz7+/y72ClqCxBTRG48MVq0p2sbIYl7qvZFvNcaEaTg2RaO40NKRnd
         Oykitb91rXmA5Fh5Yxe/4TBJzpKtp3pFKQD7PErB851TWQRoeYvMQz7GIyF3FHMVM20q
         OeLtg2wjHk7wCUU6pGIumcBxae2fLo/bDJHwOxW0zgEa9XFD38FekszXIPv0pzPXCm8X
         cAz1VmORx+Jwzk3EhutFx+76fwRnFNb75ect2qd9JqwmI1yASw/ykaq+zLsi+5B85EA5
         Wbc/0Te6+1BYz3jckY+FWan8aLKrJGqnOPYp2JIfz9QALpULy/ln+370Tx+355mHCmiA
         uqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077353; x=1792682153;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1fIDtIhk7OY8zkMZnxFxkhA3Vz85iLRRDcbIuJn6NY=;
        b=QpNKAEnIP9JgMlqUIlI5n1h8+xkeh+/1XsSSXz3M9nxDNxv5BXXI6OcnikIxXTT5rh
         Dg3Avdk7iRrr6vjWOFIOjAu4Ej2usnZ1TmkoQRbBT0F2j6CrBUG0N/uCagIgiL6m/zUL
         uMXeNRpddMbywU5+Ao1CXw7RLbGRIoU5i20ADLsO+cQkgXPz6MmKCxQNgHkpsd11ZM/d
         H6k3UsGuNgFYzUMXtq8f3S5X/Y+oLbXqqdjNADiJAhv+pnpKP7/ku9PjBV+iYtxLD/+0
         99fB8zPeOeRZjz9mjcI3FNsUErseCKCQ589dVmuQv3gQVMHN2TJFJiJPq4HuB2oAL6E3
         rS8Q==
X-Gm-Message-State: AFq9FYKvrN1Okix6FkCBh7x2hWBZtG2kOMllNg1g1zPGOgM0kb9eoa5g
	y2ma8e/o8umLuYrVsje6hfbIulirwxZ/7/jDO0MnNvQkpf4gV7s5Mtn7W2Dt3c5ZU7YsvlYK0+i
	URGp3V1ld/A==
X-Gm-Gg: AYBFou0mUFikKenmIQH5riBOQGWKQ4g99xOY2vm2u7Af/h3NXewS3Yq0xiyrK7Gx72h
	WrR9O0ybr8cIXxec8U97MG6qXYoXqN/hMAA+sMuvu9jC+x88b+F/PSrc/GUkOzQpb+U4Y6pMm87
	zjAWWLn8N+F2SB0hfouSmls6n4TJaBBJHPljKuzc8fKfUN5PAgddolMA6QMWB6yIf4UCJLY+reX
	RtQG/4flZz9Yusu1JAHz3LPcy5octAYjfOK0BlFliYA7wewBNOFNIliwTBqgoVBiCrMlLLz93av
	8rGrsKY3mRj0eemHf7NuuQ+FMjJHrz/sFhmn8jkjBFl+6GrRyre+HEPfQCpqsS2esHheIEwk6/b
	J4c1+Ms93JcAJJghLkLg2DxrDWWh3+GG02Gwg7yIECvXK8OgfeHL8ZDLS3tSc5H3edmTZLhCtXu
	vs8wYwE4FN9YVLW4nwoEiq0HFzm2mv1t3HGV3EBm12+JLfRu/WbMQ=
X-Received: by 2002:a17:906:7948:b0:c2e:7fe7:288e with SMTP id a640c23a62f3a-c31aa082a00mr1715848566b.32.1792077352413;
        Thu, 15 Oct 2026 08:15:52 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1:2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed2e822f6sm144542566b.0.2026.10.15.08.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:15:40 +0000
Message-Id: <DM5IECVK7EOP.2BSY4WBREGEA8@etsalapatis.com>
Subject: Re: [PATCH bpf-next v4 2/8] bpf: Associate arena pages with their
 mapping
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261014233442.8392-1-emil@etsalapatis.com>
 <20261014233442.8392-3-emil@etsalapatis.com>
 <sashiko-outbox-172042@kernel.org>
In-Reply-To: <sashiko-outbox-172042@kernel.org>

qn Thu Oct 15, 2026 at 12:01 AM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: sleeping lock_page() called under PTL spinlock in existing_=
page_cb()
> --
>
> commit 06bc77555d3cf904ccf154edab307819785c3c2b
> Author: Emil Tsalapatis <emil@etsalapatis.com>
> Subject: bpf: Associate arena pages with their mapping
>
> This commit associates arena backing pages with the arena's private mappi=
ng
> and sets their page offsets. This allows the fault handler to delegate us=
er
> PTE installation to generic MM code, helping avoid races with kfunc-relat=
ed
> arena operations.
>
>> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
>> index b95ffdb14417a..650baa09fcb5a 100644
>> --- a/kernel/bpf/arena.c
>> +++ b/kernel/bpf/arena.c
> [ ... ]
>> @@ -355,6 +371,14 @@ static struct bpf_map *arena_map_alloc(union bpf_at=
tr *attr)
>>  	return ERR_PTR(err);
>>  }
>> =20
>> +static void arena_put_page(struct page *page)
>> +{
>> +	lock_page(page);
>> +	page->mapping =3D NULL;
>> +	unlock_page(page);
>> +	__free_page(page);
>> +}
>> +
>>  static int existing_page_cb(pte_t *ptep, unsigned long addr, void *data=
)
>>  {
>>  	struct bpf_arena *arena =3D data;
>> @@ -378,7 +402,7 @@ static int existing_page_cb(pte_t *ptep, unsigned lo=
ng addr, void *data)
>>  	 * the TLB entries can stick around and continue to permit access to
>>  	 * the freed page. So it all relies on 1.
>>  	 */
>> -	__free_page(page);
>> +	arena_put_page(page);
>
> [Severity: High]
> Does this code call a sleepable function under a spinlock?
>
> existing_page_cb() is passed as a callback to apply_to_existing_page_rang=
e()
> during map destruction. The MM core function apply_to_pte_range() acquire=
s
> the Page Table Lock (PTL) spinlock via pte_offset_map_lock() before
> iterating over PTEs and invoking the callback.
>
> The new arena_put_page() function calls lock_page(), which contains a
> might_sleep() check and waits on a bitlock that can sleep.
>
> Sleeping while holding the PTL spinlock will lead to a 'scheduling while
> atomic' panic or deadlock.
>

We always call apply_to_existing_page_range() with init_mm, so there's no P=
TL
taken. That being said, the call is made with lazy MMU mode enabled that re=
quires
us not to sleep. We can collect the pages during the page table walk, remov=
e the
kernel mapping, and then free the pages outside of the callback where we ca=
n take
the lock. We pretty much already do that everywhere else apart from arena_m=
ap_free
anyway.

>>  	return 0;
>>  }

