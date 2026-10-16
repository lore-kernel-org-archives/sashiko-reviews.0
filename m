Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F3B282F1D
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136472; cv=pass; b=Y41YBg6HURr/+zbxTm08e+9zmsRqIfm34T9Ftg7yutBwrBJQsz9DpipoQbMyDforFp+sp4fPm6HJW6pGnIhldV5IgRD+DrxzWfJi5UBfLQPkt+b4yMcBw3fH5PN8gwHQBBOwVh5sEsXJF0DSX19KrxECL7Nvx9WYanEavPiZobo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136472; c=relaxed/simple;
	bh=uqgJELiFAnz8uhbY1m8z7u7ftcMcaHbRbpjz8Ro0Dlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q41IQ/ZyRldJUvXAlrBMHwrt6Ma2/0Ox35hKrCYoyM+402L1TTHubEapepqakYv6fE0azkbGfgnCnMyFM8+3p2dpGMn+apndDz4sMO9dtUIej5r/deARUoh3mA3b7LOBXCYAq1uW912QkQaPZ1G3FRZWyoQeQzsvWnFuxyMKh+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cr5inZDc; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cr5inZDc"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15756f82e8aso498175c88.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136470; cv=none;
        d=google.com; s=arc-20260327;
        b=qbvzEqyEopkojYsZnJvQKXEqe5+UzlW2vX4v6LTUqC69Q9rQpuRYkw4HkWLZn9PPw4
         Kmp04+oSkel2AcKXhqCTEko4LpWD1TaMW6ZzPdrtJ17XrG7ojAisWZhpWAM+Ly1F7GW4
         EF6UeiUBSZ3E8NqMkF3GNl8uBu+Py0DdpMEiRH3nA5DVU4yoksxzjGfCGUO8JnpMFfcu
         /+HTdsx4AFL6b/6z5ylnG3AldUfRuPWaFErR3nMfSzJ0/2P64i65YGdCDtejLdrskUr6
         uFeSGvsUhEnBLcf0LF3hPuBg9W3GXMszJDPddEJnto+jfoR1rmtgfgJcG6Huomwo8qLw
         Oztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gvin5FVSRfORqAgjOiitNjYtjn2LSimhwreeMhLMTao=;
        fh=E7pV6LqmTvORMIDMVtz2a2PV/Bq0EECv8kpT5WBvl1o=;
        b=FUfQQ/nVHfYDmjG6w6O5G4QFqz+wxGuUUYWRl8w0/0M6tmGVwavcWFVtvmjT+PAaow
         1Se6hQlP9nnU59KVFjaA/OptQlMMcsHsC0/gnfbYRnImjCqhkz87hvGaX4ay3WZckksE
         JdwPuOnFuO2/hoqbRoV7e6CYwWd6yM/6abntLj9ONu4lDPA7H9mwTZjGKxENsxwuVnHX
         vXViLqLVArpwVkLCm5bMzsxYRmmOgiekTF85XS1cINu85Wq0EvVM0Xv89oKRGkmZUka8
         dLeiMO4qj5ky7gU7ZLECYEreCk+8pbzNaINBJxbRT9X/7TqvEYf5gB8yjP3t/FWvxHjh
         3Mlg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792136470; x=1792741270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gvin5FVSRfORqAgjOiitNjYtjn2LSimhwreeMhLMTao=;
        b=cr5inZDcn8oJhr9/+V5pvm4qMgNVvGz76AyzCysBQGkVdX2T7x6P7+NJeo92xFw1OH
         5iNg0BnEu81NsA9+h/aoJBHsI2oCW2ZOi93ZVdzgV9e+12Gi7N3ZD1/UykAvfEm2MaIg
         7ONryDE/SVhUOIJdCcvQHguomCxHLtN+o/eXWIl9qFOyIyJKfyLvDdsMOiyW2qL4nl7W
         6XcCHcy3ly8gpNf1pYr8tFgVlqYXIC4m8VI/5skcRRMP4b+7rzzz3kiuf/vye1NFBOh9
         0UJFUwP5MgkamPZxciYo5rqJvNzGIv/t1+7ZQt5+d2RS6CxIMxuLkNp6muZ60cO/6wWE
         bY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136470; x=1792741270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gvin5FVSRfORqAgjOiitNjYtjn2LSimhwreeMhLMTao=;
        b=aPQy3kx3+fXAfuTHeLZNwMRF6eL0ixzsDJwCmte6lkUzt1uKrF+AzFHidK8id7y4km
         lDada44EZKUc78U9QgLaqCpJmvjVqeyk+vOiJTSXKCz+vKLRUvyyklDaKez4l9mKwyjc
         YwUCD/0eDAUXzH+HnfYl++LwXO610tL+iRph5n7AfpHUUoh/ahBwXqhWSvvCRC2iRtDt
         XGd+SSQopS041zXIIbS+ciWyoOu/g7PIfeIvlU9nQZXnpFBDIDd9G9NrvjIYcFnii2Rr
         4PxjlV6wVOuuSoBtX/87pK8C4RhJvNdzI6RoRPKz2uEMqm4uTJSGKo6hr5DqcfEnHz2o
         fIxw==
X-Gm-Message-State: AFq9FYLOGiAn5d/eO2C0o0F0SZ/RWz77LsW38ZdnjWmg/TeuwFB8nXXr
	Wnw+XBsAWupDhj6ZUsnsX+aoLUHdLR9SRoIlMJEBeBI7ntY+6e9yk5FyriEE1VCLA8IImWid8k/
	zyRRvtGBGZ9XkwlP4DtWtJbzgXaHdrNRcIhMmSGQGD+0Fz4rPFco8FRPnDfvbYw==
X-Gm-Gg: AYBFou1R1nd/toOH/hebpIx/r8s8pm1rjLnNevBuhbkG068P6WLGN88uoMUVLdTxVCD
	VZ8GC4FSlbWLJQuOl7owL3dz/59sAZwT37yqlOWvSG2ZCRH1nU5UtNrMYzPwvuZjZOW/V0SKmmz
	qeLby7RJAIIU88ShulPQ0fQ7ymMN2q5I30pxnstecAdaHMoYb8INN5JpSc1HwYNMVw+lNSLq1e9
	LESQegfMa+B5/emcgzmyUuirtc28cHc1tAOY7JlZ4baLBeEomWj63oHcYrX88jCmRyWDX5dagxg
	fKWAsK3d3MKUo4PEO0b8rnGFUHhzMC2NX7Z2ZbLxyvqU04I0sjpNDABUW8wKkjHk59iqOxx2Xeb
	Mrn7YRUUJ524OCDTpuzWSUkkHK0EukwLwheI8E/UhUNBO7jAVJBzDYUrRrP+1OxCKsY4=
X-Received: by 2002:a05:7022:b909:b0:183:e184:86b with SMTP id
 a92af1059eb24-183e1840930mr671472c88.5.1792136468619; Fri, 16 Oct 2026
 00:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016052811.3085635-1-kuniyu@google.com> <20261016052811.3085635-6-kuniyu@google.com>
 <sashiko-outbox-173832@kernel.org>
In-Reply-To: <sashiko-outbox-173832@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 16 Oct 2026 00:40:55 -0700
X-Gm-Features: AclHuK_-2Q6ZFfmcgBoRpW5wBrPL25ucpbDYEWMEqQg6KTXcdE2QJWDRe84Bruo
Message-ID: <CAAVpQUDnBkB0AUteLOP0f6qFaSJXrWm8CHwGXizvMZ0RsmB4wg@mail.gmail.com>
Subject: Re: [PATCH 5/5] selftests: cgroup: Deflake test_memcg_sock() in test_memcontrol.c.
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 10:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests: test_memcg_sock test flakiness due to memory.high d=
rain abort
> --
>
> commit e2cdb9bf5e0d84cc05db8a040ff4bb2ffe26c7cb
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> selftests: cgroup: Deflake test_memcg_sock() in test_memcontrol.c.
>
> This commit attempts to deflake test_memcg_sock() by increasing the numbe=
r
> of retries in tcp_client() and writing "0" to memory.high to trigger
> drain_all_stock() and flush cached socket memory charges.
>
> > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/t=
esting/selftests/cgroup/test_memcontrol.c
> > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > @@ -1447,6 +1447,13 @@ static int test_memcg_sock(const char *root)
> >       if (cg_read_long(memcg, "memory.current") < 0)
> >               goto cleanup;
> >
> > +     /*
> > +      * Drain per-CPU memcg_stock so cached MEMCG_SOCK deltas in
> > +      * stock->nr_sock[] are flushed to vmstats.
> > +      */
> > +     if (cg_write(memcg, "memory.high", "0"))
>
> [Severity: Medium]
> Will this reliably drain the stock on a busy system?
>
> When writing to memory.high, memory_high_write() calls drain_all_stock()
> exactly once per write:
>
> mm/memcontrol.c:memory_high_write() {
>         ...
>         if (!drained) {
>                 drain_all_stock(memcg);
>                 drained =3D true;
>                 continue;
>         }
>         ...
> }
>
> However, drain_all_stock() uses a trylock and will silently abort if
> another process is concurrently draining:
>
> mm/memcontrol.c:drain_all_stock() {
>         ...
>         /* If someone's already draining, avoid adding running more worke=
rs. */
>         if (!mutex_trylock(&percpu_charge_mutex))
>                 return;
>         ...
> }
>
> Since the thread holding the lock only schedules drain works for its
> specific root_memcg, our memcg's stock might not get queued for draining.
> Because memory_high_write() sets drained =3D true and doesn't retry, the
> subsequent 3-second cg_read_key_long_poll() can time out. Could this
> introduce a new source of test flakiness?

All subtests in test_memcontrol run sequentially, and other tests in
this file (e.g. test_memcg_high() and test_memcg_max()) also rely on
a single write to memory.high/max to trigger drain_all_stock(), so
I think this is fine in practice.
