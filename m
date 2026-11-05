Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849256;
	b=1uwXmAwyVXB0OnfAN10nsrl1uScCYs6Sd3u6lSsf+evDNuSQMW3Qms+3kaufyVQxsph9
	 um//hCQFnreKgx4jey2Bi1tHs2dUZS2la8t5iMDlbnQSojjKI1H+BQ4JGZgKzx5g9vW4z
	 nUXg0gElmblpp8vMzC4EvtnNQoqKzi4oZGfyz10YQIi1ZA7nt7u48FqlZ17EFsWYOgPVv
	 r/KC5E9AlfnBDbuyGmPveiICzIXVYWR1E0Hd8AjJu0atQx9K2Gp31MzfTfawZOW3PPnOc
	 EHF8lcUdwg73BJBBIGQGd6Fb5QMqdUWP7xvez7BVI2ewhlMWoZyE5MGfOBfZmMbNSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849256;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sQ6/Ur2Ztz2O4rfLqNBWUInfKhM6NZjd2sT9yss+u2o=;
	b=hy5mSQJwUaeHnMtQmNH14Yt8j0hXCULAy0qCrW+vNrepT86j4if/wNbtMYCW11A8D+Dh
	 Z2Bn/+g3uRqysuVBRrx09u4dXAK5cxqWuMyueom9GZb1LWkzD0ZQXR0iPYMEndfeSJRYI
	 lL4ts14iy/IyD8B7mR3XVcSm3D6+HAGynM+SkZ9F5Mb+7Hflc47tKcP6kJ7Xmo2TvCcy+
	 fQgxvQZMsxX1A77s6A0MTIz1cS9Udm3QThd95Yr0J6mSPF9YP1azgiFWsT6vBxSlZRNsm
	 sC59srDXnBiYwstfC12xC36QKpWp4W1F+eW3hXM1WkglGnTStmeZDINwRtY4S896kJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS2Acadh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE08606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 03:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LS2Acadh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1D51F00A17
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 03:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793849255;
	bh=sQ6/Ur2Ztz2O4rfLqNBWUInfKhM6NZjd2sT9yss+u2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LS2Acadhfn6hILfUYvGpBCTyIieYrD3AfljjQxecq9MGEO/g9587tREmY610EqRZh
	 f3MjYArLqMObvwkjPrffT4bvGlCb4+d6m80VoFa+swj7iSL4kBMMFtBL3qgNvR8UTr
	 WzqZBRa+4ALDRt8OH8NmVg1tpMJrw/BtqX7n7zaGGfdbND7LFGW8r78ydUeUPl1Wlp
	 2aLn8l1vTTToKo25H+ahV2wZsCNl96bpfOA0ctDJKBLIJhZtahH60IP/Xa+Y0HjuFR
	 RK+18CUJnyeCqJmToce59XfPJ7bCg03Oe1oXcUXEbe65hPEyMfroE/yhhrDbWT8M7y
	 St7cXpw+ak1OQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-945ae2daa66so142873385a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 19:27:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzNSIdPNG47KsN+vCp/Q6NN0YlouYQ3EA6jqxnn+F43hrrkil8i/QC+95UYU2qx/FCttQFQSHgHW6d1VTJawMw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+k5wYO3PUrXvTYFpFXPqwGFMOm79HLYED8yL4nyMNNeTBi0C9T
	3T5fahloPQ9ogFB5GubUOLfLvgIEwO1JXr6KW9Z9mrT2+rRXCx63awYcLEEf1p+V+06a98G1Naw
	pLHX9r/cRboUiO1k+6pExDVvc2OlTnc0=
X-Received: by 2002:a05:620a:29c1:b0:93c:6028:6d2b with SMTP id
 af79cd13be357-9442175b5b4mr3214199585a.43.1793849254703; Wed, 04 Nov 2026
 19:27:34 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <sashiko-outbox-175822@kernel.org> <20261018064458.86435-1-baohua@kernel.org>
 <CAGsJ_4zY5PrYgbFvY96R+52Tftp_eVrMkSbf_-2b3Tw0r6FgBw@mail.gmail.com> <auviWipVDTh_yk_T@KASONG-MC4>
In-Reply-To: <auviWipVDTh_yk_T@KASONG-MC4>
From: Barry Song <baohua@kernel.org>
Date: Thu, 5 Nov 2026 11:27:23 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yb2r2qjYjBLtYpVbQ99Nypp4rg0EuKmdkyFc8C9Tx-Nw@mail.gmail.com>
X-Gm-Features: AclHuK_LbbaHd7aSE3_-R1r36AiQG3L9nbe4GRiAsaOyf-W8t89lVdgv6ScOCG8
Message-ID: <CAGsJ_4yb2r2qjYjBLtYpVbQ99Nypp4rg0EuKmdkyFc8C9Tx-Nw@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: fix using folio_mark_accessed to replace folio_set_active
To: Kairui Song <ryncsn@gmail.com>
Cc: ehab.ababneh@intel.com, sashiko-bot@kernel.org, akpm@linux-foundation.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	kasong@tencent.com, lance.yang@linux.dev, linux-mm@kvack.org, 
	qi.zheng@linux.dev, sashiko-reviews@lists.linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:00=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
[...]
> > 2. changing to > 1 for folio_lru_refs() to reduce the syscall
> > ra/non-ra interference:
> >
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index ab69b9930893..a3a894aae10b 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -327,7 +327,7 @@ static inline unsigned long
> > lru_gen_folio_seq(const struct lruvec *lruvec,
> >                   (folio_test_dirty(folio) || folio_test_writeback(foli=
o))))
> >                 gen =3D MIN_NR_GENS;
> >         else
> > -               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) ||
> > folio_test_referenced(folio));
> > +               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) ||
> > folio_lru_refs(folio) > 1);
> >
> >         return max(READ_ONCE(lrugen->max_seq) - gen + 1,
> > READ_ONCE(lrugen->min_seq[type]));
> >  }
> >
> > In both cases, kernel build performance holds up. Reverting the
> > patch would regress system time from 3m40s to 4m4s.
> >
> > I believe either option would eliminate or reduce interference
> > with syscalls that use PG_referenced.
> >
> > All we need is to give in-fault folios slightly higher
> > priority through folio_mark_accessed(folio). I now realize
> > the original patch might have gone a bit too far with
> > || folio_test_referenced(folio).
> >
> > I will wait for Ehab's and Kairui's testing results on these options.
>
> Hello, Enab and Barry,
>
> I can confirm folio_lru_refs(folio) > 1 works for me, the LevelDB test
> basically aligned with pre 6cbdd9726fb5, the same for some other DB
> that had regressions.
>
> And any update from Enab?  Given the fact that Enab's regression is
> also caused by that incidental bias, perhaps we can go forward with
> this path? I'm looking forward to rebase MGLRU-FG on top of this.

Hi Kairui,

Thanks for your confirmation.

Unfortunately, things might be different for Ehab. He told
me that this might not help with his Cassandra read
workload, so I still don't quite understand what's going on
there.

I'm waiting for Ehab's scripts to reproduce the
workload. He emailed me today saying that he would
prepare them. I really appreciate Ehab's efforts.

Best,
Barry
