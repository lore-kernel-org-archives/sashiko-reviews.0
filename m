Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584542;
	b=kg8Ga+b01V5Pbp4ZdBLXdbg90tQCa1jek41meM2QwOMMpUuNWfEBcJNX66gwhmPYkUsL
	 0Kt+AtSUXAsP/PAogFVnwX1uwe5GfV7wOwq+J6AlKKLesIWWTOcJ9+I7opEB1b8/uhUwC
	 mTkNQrwZeUcingl+RI1rSRNr4//8blfL/roee5yJbyWjyqsj2YrmoCAbi9J+IyxYrAU+G
	 MUZqHSXdxtHD5uuoFHN0DLnLrXJYlThWOYLo0EeBlCWlLqC6rRZA25Lpcw5Sfo/BmITUs
	 nUi4nfm2UHiCJfACjhRCsoYEgCaJaj+ftoSNoIBgwv0DkTtYCiJC18x6W3CGr03OuzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Yutdol4YhU9457+FPHA+tBgjGyrbMKfxjhIyA/c2xjc=;
	b=ljfVGf+kFGqSBQ4oGkKLWHyxc9lXtMV+K2y2fti998fj6RZ3Sr0rbFajHBv9LOv2Xwzy
	 rofYO4h1Lqp5IHDCpNQY6hsGzqlthyrnPEKAAEIriIgeMjue2VqVbNBqNCxZ41NSo3kh2
	 ADckJAbUR93LQL1Gj1lTkczgNHcdlC8uDBIYLsxsL5ieGTFaMINemqSSboals3H8nwpuB
	 f/q73hVGkKB5JeNieI7pM7WT7OpriWXpeUslRXtk3if32QCCcbXkmk83qypJNruUn1jEz
	 4nXDHNiutRcQsWnyqmBpZd1CbBqeBPBpe1Fo5H4TvbPfBYFF9zuacNWaiDySc69M1Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D256DYfY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F344606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 15:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F344606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D256DYfY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so12352935e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794584540; x=1795189340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yutdol4YhU9457+FPHA+tBgjGyrbMKfxjhIyA/c2xjc=;
        b=D256DYfYe4wjABQb02yvqO6nj0B0Ch5mPcPjMEU+giAGYyLvFHVD1XRgLuX+1T27Ga
         uuWCBsugKi7WQTgRZfk86rCATA6A0Thn569nj1csZXpuNlPsPoUYtvTpq18boG8veqTl
         c9ZdeQ5CvNsAc7+cTs9JZLHUDFdvOGTc/2Wy72elPcT2mat/1XQkwk+IaKqtUPjdw1Zb
         7odCgATfp1OnO6Ly07Y4tZnPpzNwgnj+zSFGcHYcReZmTBVwFgGaKMY2vdnE2Z+RfbZt
         npZi8a2CASdDnwyMwHPcRfJxdjMa39OSY8CwcXv2y8LlrM4xSUV2Oxc4Qbqla4Qsb2w2
         t0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584540; x=1795189340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yutdol4YhU9457+FPHA+tBgjGyrbMKfxjhIyA/c2xjc=;
        b=QDUaUpsMKlYHP7scIzcNzAIsqzFBr9+ecRcSpquIvP/eBHleeihIfrZ8/KFN/6y+gz
         rpzfgK8Qc48BNBa0V5/ighKXlcbP6FPOnPzY404TEMIJY6fv84+UbtoVRhAExopTLF4D
         3MEWtbBwMVMkvYnPBaU7sVkT2ZZJ60umL7A2gzkoB7EJLoIuZZPvuvV+FxPP7dAdEf+1
         3QGYAFufrD8Jh/PL1YCi1jejE2NHsZEPph7FS7sDqVnjdR3Wp9VatvHAdR9yGhzXsUb2
         BrjMIXScWrfzIVFL7yCuldSjUui3kWpBYNHPqexqG1FId4yTmrggN4brkxw23hv8LIIO
         IGBw==
X-Gm-Message-State: APuU4Z83JMNEh1z9Q6UlwHHBcIx094T1c0bHK7aR11L2tid6rlT3go98
	OTI8A31BBjVjAJq4c16S+Uw1vSOHe9KVQJ/0zBj4pPrdBHOM2DOP2yAiy1t0agdAT3oYveuIfa+
	L1xB5Fkk=
X-Gm-Gg: AYBFou3jRrOcDiagFmQo5q5h5smZoIaGSisY0b397Z9hnhahi1QDCF5/7qrC2U1yEAn
	h4XaIB56ewAYz2X+c+qvrQfJZ5WWTz9gf8mQ6Lym7z+lZPtL6/jL3OiLulUKJ6JTCiZCMTZmPlS
	d5brGNarz1W8JkGuswWm64H4JlPByZyE++ht57qCJ5zsmKjUM2Nch3qZQ+BchTsrMCc5lger+Jg
	9xi716gLmhRycefuWeYhHC5SW+uXP0OPDsN7Pz3yEg4WkBOI2EFhX8vfXjaFKyokvRJaBxaLfOC
	+9aB6GQdAhEfkGvI/CittXR3imnsAJLiNBU4Z2EdQUaWqGgjaBrqfsGgfGfLFD6+X65C2LcBQma
	UZgs0slJ3/gj128QjImxMWMFtATlrZ1mabGgIV4qX1QGuED4xVZ/WLtNP1VRG6/8AAQ0shoCF32
	VGKjo5SQ+4HsrXugmb92snSK0Sxr9RfgyDukC6WjQ8pxs4/BFTAjD9KNBpjvCkQZG435ZaCNOkM
	twOv8G6KNePfbgrHyntucAbsfuNzTZDaWhXR/+YeT6lSV/JmR5+/m2EkZrHtliFJbTpIEf8Kogn
	XEjBXy1rly1S75m1PWG3TsuLFxzIM71b
X-Received: by 2002:a05:600c:4504:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb559f044amr58323825e9.2.1794584540422;
        Fri, 13 Nov 2026 07:42:20 -0800 (PST)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571df488sm33388225e9.4.2026.11.13.07.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:42:19 -0800 (PST)
Date: Fri, 13 Nov 2026 16:42:18 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: sashiko-reviews@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH 5/5] selftests: cgroup: Deflake test_memcg_sock() in
 test_memcontrol.c.
Message-ID: <20261113-upside-perfectly-f4b59d80837a@there>
References: <20261016052811.3085635-1-kuniyu@google.com>
 <20261016052811.3085635-6-kuniyu@google.com>
 <sashiko-outbox-173832@kernel.org>
 <CAAVpQUDnBkB0AUteLOP0f6qFaSJXrWm8CHwGXizvMZ0RsmB4wg@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3bxibgpfagwsnha"
Content-Disposition: inline
In-Reply-To: <CAAVpQUDnBkB0AUteLOP0f6qFaSJXrWm8CHwGXizvMZ0RsmB4wg@mail.gmail.com>


--z3bxibgpfagwsnha
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] selftests: cgroup: Deflake test_memcg_sock() in
 test_memcontrol.c.
MIME-Version: 1.0

Hi Kuniyuki.

On Fri, Oct 16, 2026 at 05:27:49AM +0000, Kuniyuki Iwashima <kuniyu@google.=
com> wrote:
> With MEMCG_SOCK batched in per-CPU memcg_stock, test_memcg_sock()
> can fail in two places:
>
> 1. In tcp_client(), reading memory.stat only flushes rstat
>    synchronously when vmstats->stats_updates exceeds
>    MEMCG_CHARGE_BATCH * num_online_cpus().  Because mod_memcg_state()
>    is now called less frequently, 16 read() iterations (0x10) on a
>    64-CPU system can finish in a few milliseconds before
>    stats_updates reaches the 4096-page threshold or the 2-second
>    periodic flusher (FLUSH_TIME) runs, leaving "sock " at 0.

This should be solved by 6360d444ae328 ("selftests: cgroup: make
test_memcg_sock robust against delayed sock stats") v7.0-rc1~145^2~19

On Fri, Oct 16, 2026 at 12:40:55AM -0700, Kuniyuki Iwashima <kuniyu@google.=
com> wrote:
> On Thu, Oct 15, 2026 at 10:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] selftests: test_memcg_sock test flakiness due to memory.high=
 drain abort
> > --
> >
> > commit e2cdb9bf5e0d84cc05db8a040ff4bb2ffe26c7cb
> > Author: Kuniyuki Iwashima <kuniyu@google.com>
> >
> > selftests: cgroup: Deflake test_memcg_sock() in test_memcontrol.c.
> >
> > This commit attempts to deflake test_memcg_sock() by increasing the num=
ber
> > of retries in tcp_client() and writing "0" to memory.high to trigger
> > drain_all_stock() and flush cached socket memory charges.
> >
> > > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools=
/testing/selftests/cgroup/test_memcontrol.c
> > > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > > @@ -1447,6 +1447,13 @@ static int test_memcg_sock(const char *root)
> > >       if (cg_read_long(memcg, "memory.current") < 0)
> > >               goto cleanup;
> > >
> > > +     /*
> > > +      * Drain per-CPU memcg_stock so cached MEMCG_SOCK deltas in
> > > +      * stock->nr_sock[] are flushed to vmstats.
> > > +      */
> > > +     if (cg_write(memcg, "memory.high", "0"))
> >
> > [Severity: Medium]
> > Will this reliably drain the stock on a busy system?
> >
> > When writing to memory.high, memory_high_write() calls drain_all_stock()
> > exactly once per write:
> >
> > mm/memcontrol.c:memory_high_write() {
> >         ...
> >         if (!drained) {
> >                 drain_all_stock(memcg);
> >                 drained =3D true;
> >                 continue;
> >         }
> >         ...
> > }
> >
> > However, drain_all_stock() uses a trylock and will silently abort if
> > another process is concurrently draining:
> >
> > mm/memcontrol.c:drain_all_stock() {
> >         ...
> >         /* If someone's already draining, avoid adding running more wor=
kers. */
> >         if (!mutex_trylock(&percpu_charge_mutex))
> >                 return;
> >         ...
> > }
> >
> > Since the thread holding the lock only schedules drain works for its
> > specific root_memcg, our memcg's stock might not get queued for drainin=
g.
> > Because memory_high_write() sets drained =3D true and doesn't retry, the
> > subsequent 3-second cg_read_key_long_poll() can time out. Could this
> > introduce a new source of test flakiness?
>=20
> All subtests in test_memcontrol run sequentially,=20

Alas, people sometimes execute more of these in parallel (or there's
other stuff running) :-/

> and other tests in
> this file (e.g. test_memcg_high() and test_memcg_max()) also rely on
> a single write to memory.high/max to trigger drain_all_stock(),=20

Are you sure (I'm checking v7.3-rc5)? I think the draining is a running
issue and your idiom is new.
What I saw (in LTP), is to pin the test to the current CPU, so that test
data stick only to there. WDYT?

Michal

--z3bxibgpfagwsnha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCavcv1hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjDnAEAjvQSMXMtW1iAsJNyAoBX
wC7eWqQ2YjA3i1vN+7falyYBALcPZ5HDHHzqKIQWyIUF5MGVdvcD4kU0FiQzwMOt
As8O
=uMZm
-----END PGP SIGNATURE-----

--z3bxibgpfagwsnha--
