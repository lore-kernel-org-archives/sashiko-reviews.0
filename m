Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105FA36F91F
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041796; cv=none; b=tqdbDdNb8exnLQaEew91L6Vn6hGruM/wt+nInxchIT5L4gaMTt+y1kiudGvzgTWN1QGi2XMwtQX5jxk9lNX5Pb46KEZE+5tnAHdb2oLRF8c4oyP1fPqw1QmIdAsZwB5S9HjSPFb9ay0lrECh0mTgs/ExzroQqsOOyfhTZo4PGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041796; c=relaxed/simple;
	bh=rjQq9J4Z9IRuW6j1KbXmx1VYe6G0FqjI1V/g5qaCbdk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z0wu8esj21AQrM+0ggxXiGtiatp85i6yPqAZ5FeWMXMB048TV9xwCMFpOvAGBZkOA1NDpF1D2ziffy0CdctvULNoZE9ouUc7m+tB03voiVz6l2MGpwesYzg2ZVj3wFKxFjbuRph0Lc77LYbvgCGGcjWFNC2a2zH8vJ/ns9y03ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=fi4IE1rm; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="fi4IE1rm"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13827115452so345372c88.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 14:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781041792; x=1781646592; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ykgrngf0RMYTi2ZIUhUxKrQbnkWLDpe8Dsbbr92vEWs=;
        b=fi4IE1rmabm5pg7fdNUt1gAWrB7ykiLjtAsBnoAjb5bKiyZRE0H7FT9ad2JbVUfbns
         rvM2LHyVBKBx0a2A4VsTwTuvUK0jCkKce5bmnvFKAo3QDAxvnQb9En1FOBOZKU4lmw4T
         L8NHrNDO3IPIauAGys9TuRqFzctNOzuwSGq6TJl3XEJ5Fuw1zrvpahnb3tWChlHrK7lo
         CjQee7WJ/vyIeAN5vZjTrN9TxLxD4iiI+6tGiY1aVSR87YldcHfBG024FSEFEdOVHMsx
         G5Gufe7dc7jM7NbBE+pxYVynFiMxrn7PEjvdHBsuqFiwXw+/5fQOosvn/jV1yiiYGORZ
         F8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041792; x=1781646592;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ykgrngf0RMYTi2ZIUhUxKrQbnkWLDpe8Dsbbr92vEWs=;
        b=J5CKEHzooazjZphp8pD42DfHdV3G8wGRdAFX7pvqmqtX3M6d+uovN5DbOuF5rnYY/A
         bXpeA6bd8ZiDBbyoGYRReJ4Qo4q7CMoIAQq1tyAR5Faofwl7caNW+GPSuVaX6rmXkfC4
         IhAmVKb30rNqaPswMCcUApOKAghoFXzXjXtQHGe4GEldGoRsU90C4rVVMzYGzKPvnO9/
         nq6TFkF9Wum7UFaeAxwxa7s7WMsjiUnA7Zdd0jwkqpnVpiO/wOWajtec6cqEZHG6L0Wr
         ua4tVL5z/BO0y/8c3P3CtNQM4Hjn+5ICQpFnO6Lh5cy6WDgv4LAOnLUalH1qcoQqLkDB
         CHbA==
X-Gm-Message-State: AOJu0YzPTyuiw4M+/VKQxbrVbZyiFRneZ6IaaV090Qiwj1VjMzBSg3Mj
	6TEQtCXF31V0e3bLaBXZXw3Xr7wV83t8DyNWYjtILk9oQArq3OordGkIkyJkY7sbX6N66GCBpiy
	6gqmh+JQGNg==
X-Gm-Gg: Acq92OEn5bNQ3uYrQICBdMFpr+azCyN4sEkHhgx5dLA60JiO8hS2mA5hhxrJHIGS2V5
	iCZu/I//EXNgrYDu8W4z2kGL3fQ5/jXRWYxqYigf2g8yYv2gIY6EKx40VpIHINNxGXYeYFM4C+2
	NNHkjA0rbv+HDKDUDck/EVBhm6JIXHk6dbqmLAr0bLsD887B1RaYT16IKyCol/xbWVlcpuzA00g
	X8EVDCQMJOEseFHoLaQV58qOd+KuJr0M1p9YhTVDeHjVuRiD6F/TIMOByVMGF8ayFUD97qxPqf/
	CnzBIHMhnk9p8D9+ZuDGDXQ0oIs4/mkCEyHVoSS0CJvNP7oxHiO4ZyxgpKtcNHH5R9CJz77DVzx
	K5pTjRO+9a9AqeDVixuc6j5gGHE2AHQNBJj+GYox9bYyhKabFTxSIIYY9fUYlGHL09oAnHkxxZe
	9cywShHaL9lJmxcFk=
X-Received: by 2002:a05:7301:2923:b0:2ed:e12:3773 with SMTP id 5a478bee46e88-3077b38a42fmr14652456eec.35.1781041791712;
        Tue, 09 Jun 2026 14:49:51 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::3297])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm20804510eec.30.2026.06.09.14.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 14:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 17:49:49 -0400
Message-Id: <DJ4UMEV0NQE2.14XTJKL239Z4Y@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf, sockmap: fix integer overflow in
 bpf_msg_pop_data() bounds check
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Sechang Lim" <rhkrqnwk98@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609183927.4021802-1-rhkrqnwk98@gmail.com>
 <20260609185257.A09111F00893@smtp.kernel.org>
In-Reply-To: <20260609185257.A09111F00893@smtp.kernel.org>

On Tue Jun 9, 2026 at 2:52 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unbounded `len` parameter in `bpf_msg_push_data` causes a 32-bit=
 integer overflow when calculating the page allocation size (`copy + len`),=
 resulting in an out-of-bounds heap write.
> - [High] Incorrect scatterlist element offset calculation when splitting =
an element in `bpf_msg_push_data` inflates the page offset, leading to out-=
of-bounds memory accesses.
> --
>
> commit 619f5b1d1aebdbd6457c3ac6e3a92bc45be7278c
> Author: Sechang Lim <rhkrqnwk98@gmail.com>

The change seems solid, the error is apparent from code inspection
alone (though a repro wouldn't hurt). Can you also turn pop from an int
to a u32? It should never be negative AFAICT, and we assign to it from
a u32 so since we're fixing int types...

>
> bpf, sockmap: fix integer overflow in bpf_msg_pop_data() bounds check
>
> start and len are u32, so start + len evaluates in 32-bit and wraps befor=
e
> storing it in last. The bounds check can then be passed with an out-of-ra=
nge
> start/len.
>
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 9590877b0714f..31467c0b4279e 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -2974,7 +2974,7 @@ BPF_CALL_4(bpf_msg_pop_data, struct sk_msg *, msg,=
 u32, start,
>>  	   u32, len, u64, flags)
>>  {
>>  	u32 i =3D 0, l =3D 0, space, offset =3D 0;
>> -	u64 last =3D start + len;
>> +	u64 last =3D (u64)start + len;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but while fixing the integer
> overflow in bpf_msg_pop_data(), could a similar overflow occur in
> bpf_msg_push_data()?
>
> Looking at net/core/filter.c:bpf_msg_push_data(), both copy and len are u=
32:
>
> 	page =3D alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
> 			   get_order(copy + len));
>

This seems like a valid concern. Can you add it to the patch? Making
copy a u64 should do it.

> If a large len is provided, copy + len could wrap around to a small value=
,
> resulting in a much smaller allocation than required.
>
> Later in the same function:
>
> 			to =3D raw + front + len;
>
> 			memcpy(to, from, back);
>
> Since len is zero-extended to a 64-bit pointer offset, to evaluates to an
> address far outside the allocated page. Could this result in an out-of-bo=
unds
> write if a BPF program provides a maliciously large len?
>

As for hte other:

> [Severity: High]
> This is another pre-existing issue in bpf_msg_push_data(), but does the
> scatterlist element split calculate the offset correctly?
>
> When splitting an element into psge and rsge:
>
> 		psge->length =3D start - offset;
> 		rsge.length -=3D psge->length;
> 		rsge.offset +=3D start;
>
> Is start the absolute byte offset from the beginning of the entire messag=
e?

It is.

> If the split element is not the first one in the message, wouldn't rsge.o=
ffset
> be inflated by the cumulative length of all previous elements instead of =
the
> relative offset (start - offset)?

It does, this seems like a real bug. AFAICT the offset of rsge should be=20

rsge.offset =3D start + len.

Can you confirm and add to the next version?

>
> When the network stack eventually reads or writes to this element via sg_=
virt(),
> could this cause an out-of-bounds access past the end of the physical pag=
e?


>
>>  	int pop;
>> =20
>>  	if (unlikely(flags))

