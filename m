Received: from mail-ed2-f1.google.com (mail-ed2-f1.google.com [74.125.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1054B27A92D
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 19:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515188; cv=none; b=tM06Fpm21vn92nF7+ZWkVjglArxqFEK2XdslNr69a+ioWZnFBb0oIIyVRkoacjwpYd2na5WbkF3jOMCMVJpURRSk4zsLQpp9EGtiEbdNaeUgQVs1v1zGwZUs6bgf+U7ZHiXwLXAq8OXv6UG1Ec1Ecp2kHwnbMGSPOew8XIvHTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515188; c=relaxed/simple;
	bh=lOmZk64DPfrz+xmxtznT5MjKh1OPLPfXC4UK3NqjbJc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gRYFcL9/ZM/1apAuJc4wAEgR3tj0LzbRBaSppvHujK6EyZBrJbG7MXWa4xl9SoMN9S+Fna1jW3hxDoiu6JKVaU/id5wWCi6GyAHlmlTvEmLqvs+0aHjpabzMKF1ve1tSKLgMoepvzjYf7bz2Lj+Vntm36evdbnlFn2JnQb1J7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klOnZypo; arc=none smtp.client-ip=74.125.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klOnZypo"
Received: by mail-ed2-f1.google.com with SMTP id 4fb4d7f45d1cf-698af52db66so1578386a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787515185; x=1788119985; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0QasYc6RCSMa5sPreNe5srZRIz9d6Ol1y/kYNoBuD2o=;
        b=klOnZypoGHlmuWhF9YQcTgoy4BJ9zyUbIMO+4PoWq5ZRn+Zx6X/bSmogOe7e2Bmv/d
         HeS/wip/rNj5DBbE/a9G7v/TYwJP6OKJdI1O4ppnbeAHsa4OfodxpmRAawaIxGqawVBv
         mooUgsgvN8TxhyrNifc5KrlvHVae9iyX1pr3dgc8FnoUkOOTLmt2R7w4I+mH3auWanIs
         8reu6qzzW8ECDn8+eahqgU42IuV8pzah/d9Mqm+nmROfw6OPIuLzAeZK12Wga+RexYKY
         IJKBA6TOHT0yHhLkSdXpHVe0L7HzQf/G2BhfXwcDOts4isZxJUvm+AZ8MM/TuHvwkOQN
         SFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515185; x=1788119985;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QasYc6RCSMa5sPreNe5srZRIz9d6Ol1y/kYNoBuD2o=;
        b=qeMRa7A9URkhkSRuwrJRUL0C9PBRW7eVXs/JnN56ZiMkiBTcd7RiG35D0elPYXLlAM
         LAW/Rf2lke/jWTGXNVu4DuIHwCNT3u91nV8hwsMiDMGybo20Us3nSIIZjtMe770EOvwo
         eHlpSLoMNI5X+t98I7Mo/rg2Un2ECTz7BQqrohcxaye0W8ExNeXwae8yIj134+fP9bCI
         Cjm/jZTB4c6imBrI3klhd/gD5tpAgYXVsGy9+zZ/8JrN0PfOyULYgYV8H1wHoft/YYSW
         GnqiupiCYXNlLo1EqfZaN7cV4uDH81LlMfTIN6GmcNOt8ARVy5U3e1NIhSxCYApytA1O
         fICg==
X-Gm-Message-State: AFuF++mMZfMPB7/DKFC9N0aCjAI82jk6HxBnvWxcR9hksduGEPjhqdAJ
	Rk4UburOxKwwppnpvBs9B3O9Pwgcrd7tjQF2vLWMmhn+I4Le4twYs53hUibMWxHX
X-Gm-Gg: AR+sD12iy+piuRo5KdWYJdvvfHmgsKoxvaROe7veZoQHmE/Tdd1P07VjlaMeeFAwWSw
	hICGBcJoCQQfQcQxDYNV0Z85gAPn/qhCAfB/174mr1IjWbUV+00s/wC/3hGbhJ/lDgDyaJz3F3p
	A53NdmUqCurlN1Y1oG49OCpuCAjGWcatEHZWto8WAHSch15ZErjFhYz8JZ6bLZzaafCimPfXpHM
	Ll9FAgmQfMZtGIKc/fizcB0II99EaBUhLme0KF7YB+CIkQWg9MoVJu/LEFo4Nv5dlZtI3r9jpdU
	5IojV1Z85HF1hU6h7IGy/kVNahfG+s6VY/Sf3lT9AoubtKRoXGXgggmeLUPphB4pIjLWeOnWbZr
	K8SDqPZ1gzayN0+3qh2doaZW4mdj8WcbzC/FZSHYl3ERxppSAF6xYm8BpgKeXi6AdI8BdVWNH5s
	4ZQfo9qFyeHkPo2rYTwo20aLyTsUhs+6MaFrtXYgiFhj39C2Vp+Ra+XmwqJC0LWhVOn0QoGNUwD
	nswkIC06S9tCbI8fIjKz5p16b3Td/i2y2Kr84ztzxey7XeDnxk8z76txNCFS9rvsJbHFe6XOVE1
	6uKonLrtfmla/qT5vkqcX9rt36KR398SUIPMkQ==
X-Received: by 2002:a17:906:7316:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c2491cbca79mr1481849266b.9.1787515185174;
        Sun, 23 Aug 2026 12:59:45 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm992377566b.46.2026.08.23.12.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 12:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 21:59:44 +0200
Message-Id: <DKWL8ZCP4JFW.1YNYR2ZU4BCQZ@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/2] bpf: Reject oversized stream read
 buffers
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260823193202.2389715-1-memxor@gmail.com>
 <20260823193202.2389715-2-memxor@gmail.com>
 <20260823193918.347B51F000E9@smtp.kernel.org>
In-Reply-To: <20260823193918.347B51F000E9@smtp.kernel.org>

On Sun Aug 23, 2026 at 9:39 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] bpf_stream_read() permanently loses successfully consumed stream=
 data and incorrectly returns -EFAULT instead of a short read length on par=
tial copy_to_user() failures.
> --
>
> --- Patch [1]: [PATCH bpf-next v1 1/2] bpf: Reject oversized stream read =
buffers ---
> commit ec0075a06e269ba85371f18607bd524dfc2cb4f7
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Reject oversized stream read buffers
>
> This patch updates bpf_prog_stream_read() to accept a u32 length and
> explicitly rejects values larger than INT_MAX. This prevents oversized
> lengths from becoming negative when passed to the internal signed stream
> reader.
>
>> diff --git a/kernel/bpf/stream.c b/kernel/bpf/stream.c
>> index be9ce98e94692..c8d1d0b03f180 100644
>> --- a/kernel/bpf/stream.c
>> +++ b/kernel/bpf/stream.c
>> @@ -196,13 +196,15 @@ static int bpf_stream_read(struct bpf_stream *stre=
am, void __user *buf, int len)
>>  	return ret ? ret : len - rem_len;
>
> [Severity: High]
> This is a pre-existing issue, but does this error path permanently lose
> stream data on a partial read failure?
>
> Looking at the while loop in bpf_stream_read(), if a buffer spans multipl=
e
> elements and copy_to_user() succeeds for the first element, that element
> is permanently consumed and bpf_stream_free_elem() is called.
>
> If copy_to_user() then fails on a subsequent element, the loop breaks wit=
h
> ret =3D -EFAULT. Because of the ternary return statement here, the functi=
on
> unconditionally returns -EFAULT instead of the bytes already read.
>
> Could this return a short read (len - rem_len) when some data was already
> successfully copied to user space, so the caller knows those bytes were
> consumed and the stream data is not silently lost?
>

Already fixed.

> [ ... ]

