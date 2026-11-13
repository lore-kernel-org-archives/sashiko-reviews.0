Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549489;
	b=iP0dTEqg8PfKOHkDzj71/gOUEgXV+fYbFMl5krEZSaqCDLvUYscoqEN4WcNl2YpLOfTR
	 PuTlIqvM3rmmKbbfm0C6D0OofRti8AZYwhcuAeYvMrQxkDM1gwkgQEqRuzqf5VbLkMyyo
	 fliKmycacqy0E72o+f+LrK3/3rCGtK8hBjoJDaTjkMkCB7WGIFemsgZgNrZI9apFbMO4n
	 AIXIxYiTvMEQBoee+1SF+ZZJs67IRGk4zZXCcxxHQl766cxVyQwqZq4Vkw6DhhnAXX96B
	 iqRUGeYbkUVnmqF5fvQf8zRUk/FskOg2ULAHNun/8yB2jR46GXOoIbL59+Fj5PF974w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549489;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=smxez4a4cpwU5haMt1Qy+s3oYad8QJKBdb5k+aJyAn0=;
	b=3XZlrd9mGvm0+YSlmEP2x9mS5dqnnXPziqvzEhgZijSJMUFnuLuvaW91ivOcBaDtLEOM
	 UwY/CXTBrlw4JZtyren38pntoioi5zhSMtZ8gKoO9fGBnNVHqKb89LCsTlxmpoz0de5/T
	 HCLgaL6OS5i2hmvDvG5tg4WksyR1ITp4ZCwMWVWC+Bf5Nn2cNUYVsILuEj/knE+wGOPrV
	 9pHia2Btnb+bSm/aM6y4sL/fvsXlWqYRZmti8mW0PXcTBLLz2fK3w3rL+e1FNoIAz8Arb
	 EZxpX2SPtZ+XysVD4n0jGe/dr5lSjtSxbteTTvRIM/cl/zm0CvHPmhZVKSMPWxJ+Xfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbpxuY6s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526EC606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbpxuY6s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6B01F000CB
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549489;
	bh=smxez4a4cpwU5haMt1Qy+s3oYad8QJKBdb5k+aJyAn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JbpxuY6s8p/uMo5IM8wIor2lYcD1IhFC8wD2mFAM4Zfsw6h8gRQPA8kPsQCUF3ZTr
	 1vkENvuP2tMlypzdhzU7G7EXQehtMOktzPLKlgt6yMOq19C0tablpRUCBeBfFtZ3/b
	 cwzeAYXN7sFS7qayPqOmPo/L8+amxLuwVAhRfsju7JD06uGf0evjFQ+R81UFZEaPkX
	 4V55+TxlCxRfTh7J7GmQaBxIu7qrvk0JExGmu157n1TaRc7gUbrwzolsklKDTCyJra
	 F8uuPYrCW5cQp+atzPhogKSmyqyolA9ELw8bdKbb35P5ssEIzHI/vX73O8qSGxGlT1
	 K16NpBU/kqJTg==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e63ee7b4cso98283785a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 21:58:09 -0800 (PST)
X-Gm-Message-State: APuU4Z9R3cffDlh41I+0D5GB7IJgx8Oz8oxBtA6GFXFR71511nTzZdE0
	lup561cE+muS71luYZ1GkYZiESa5HhAysOokUpTgQBlMerIosXed/JEe6Igdc4/HQLRWtXlq1j5
	wm5/AkoWXjcfaQqJjCopOrAUmTqIKyHM=
X-Received: by 2002:a05:620a:6f01:b0:93b:d7a0:d9e6 with SMTP id
 af79cd13be357-9494bb6f8bfmr264863585a.64.1794549488490; Thu, 12 Nov 2026
 21:58:08 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-15-baohua@kernel.org>
 <sashiko-outbox-210422@kernel.org> <CAGsJ_4ykeDu9XyyiNs9HBp2w--Pm7=oqs0=M5cPiypQ1qq9yTg@mail.gmail.com>
 <CAMgjq7Cx0Z6mxQXKJN5KfRYbMNMD1qOy4Yrt51prbGz+=2F+2w@mail.gmail.com>
In-Reply-To: <CAMgjq7Cx0Z6mxQXKJN5KfRYbMNMD1qOy4Yrt51prbGz+=2F+2w@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 13 Nov 2026 13:57:57 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4x_F=m2irpO96PrxEkDpe5FLETuHG9rT1-uGy0-QL0W5A@mail.gmail.com>
X-Gm-Features: AclHuK-BtN6duN0Nw2xNYdnH-GL2E8mcqjETysKEfCxuyiMN4yvJ_ve-YYDyzsU
Message-ID: <CAGsJ_4x_F=m2irpO96PrxEkDpe5FLETuHG9rT1-uGy0-QL0W5A@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
To: Kairui Song <ryncsn@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	hannes@cmpxchg.org, hui.zhu@linux.dev, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:46=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
[...]
> > > > @@ -5891,7 +5896,7 @@ static int run_eviction(struct lruvec *lruvec=
, unsigned long seq, struct scan_co
> > > >                       return 0;
> > > >
> > > >               lruvec_evictable_size(lruvec, sc, swappiness, nr_to_s=
can);
> > > > -             lru_gen_balance_scan(lruvec, swappiness,
> > > > +             lru_gen_balance_scan(lruvec, sc, swappiness,
> > > >                                    nr_to_reclaim - sc->nr_reclaimed=
, nr_to_scan);
> > > >
> > > >               if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappi=
ness, MAX_LRU_BATCH))
> > >
> > > [Severity: Medium]
> > > Does passing sc from run_eviction() into lru_gen_balance_scan() cause
> > > swappiness=3D200 via debugfs proactive reclaim to always calculate a =
non-zero
> > > file_factor?
> > >
> > > lru_gen_seq_write() initializes sc on the stack without setting .prio=
rity
> > > to DEF_PRIORITY, leaving sc.priority zero-initialized when passed to
> > > run_cmd() -> run_eviction().  In lru_gen_balance_scan(), sc->priority=
 <
> > > DEF_PRIORITY / 2 (0 < 6) is then unconditionally true, so proactive
> > > eviction with swappiness=3D200 always reclaims file pages instead of
> > > preferring anonymous memory.
> >
> > Well, I'm getting tons of complaints about
> > lru_gen_seq_write(), even though it's just a debug
> > interface that probably very few people actually use.
> >
> > If anyone is actually using it, please let me know.
> > Otherwise, I think we should consider removing it in the
> > long term. Both memcg and node already have proactive
> > reclaim interfaces, so this one seems redundant and
> > difficult to maintain.
>
> For now I think we just be really lenient about that interface, e.g.g
> keep it at DEF_PRIORITY like in previous version
>
> > All Sashiko comments seem to suggest:
> >
> > @@ -5955,6 +5956,7 @@ static ssize_t lru_gen_seq_write(struct file
> > *file, const char __user *src,
> >         struct blk_plug plug;
> >         int err =3D -EINVAL;
> >         struct scan_control sc =3D {
> > +               .priority =3D DEF_PRIORITY,
> >                 .may_writepage =3D true,
> >                 .may_unmap =3D true,
> >                 .may_swap =3D true,
> >
> > But I think this approach could introduce its own problems.
> > Suppose we have four generations for both file and anon,
> > and users use the debugfs interface to reclaim the oldest
> > generation.
> >
> > 1. Even at DEF_PRIORITY, we can currently scan up to
> > lrugen->max_seq - MIN_NR_GENS, which means the
> > second-oldest generation can also be reclaimed. This
> > somehow violates the user's request to reclaim only the
> > oldest generation.
> >
> > 2. With swappiness=3D1 or 200, if we run out of the
> > preferred file or anon type in the oldest generation,
> > we can fall back to the other type and reclaim all of
> > its oldest generation, as we did before scan-budget mode
> > was introduced. With the new approach, however, we stick
> > to the preferred type at DEF_PRIORITY and don't fall
> > back to the other type. As a result, evict_folio_lists()
> > can return 0 earlier than it would with the fallback
> > approach.
> >
> > I guess the only way to address all these issues is to add
> > a separate reclaim path for requests from
> > lru_gen_seq_write(), with evict_folio_lists() handling
> > these requests differently from regular reclaim to preserve
> > the old behavior before this patchset introduced the
> > budget-based model.
> >
> > Something like the following, though it would be very ugly:
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 4fe516d33703..24c6abe37189 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4745,7 +4745,8 @@ static bool isolate_folio(struct lruvec *lruvec,
> > struct folio *folio, struct sca
> >  static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec=
,
> >                        struct scan_control *sc, int type, int tier,
> >                        struct list_head *list, int *isolatedp,
> > -                      unsigned long *scanned_seq)
> > +                      unsigned long *scanned_seq,
> > +                      bool cmd_proactive)
> >  {
> >         enum node_stat_item item;
> >         int zone_idx;
> > @@ -4768,7 +4769,9 @@ static int scan_folios(unsigned long nr_to_scan,
> > struct lruvec *lruvec,
> >          * newest generation when under severe pressure, so hot folios =
are
> >          * not evicted as soon as priority is raised.
> >          */
> > -       if (sc->priority =3D=3D DEF_PRIORITY)
> > +       if (unlikely(cmd_proactive))
> > +               seq =3D lrugen->min_seq[type];
> > +       else if (sc->priority =3D=3D DEF_PRIORITY)
> >                 seq =3D lrugen->max_seq - MIN_NR_GENS;
> >         else if (sc->priority > DEF_PRIORITY / 2)
> >                 seq =3D lrugen->max_seq - 1;
> > @@ -4966,7 +4969,8 @@ static void lru_gen_balance_scan(struct lruvec
> > *lruvec, struct scan_control *sc,
> >  }
> >
> >  static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruve=
c,
> > -                       struct scan_control *sc, int type, int swappine=
ss)
> > +                       struct scan_control *sc, int type, int swappine=
ss,
> > +                       bool cmd_proactive)
> >  {
> >         LIST_HEAD(list);
> >         LIST_HEAD(clean);
> > @@ -4990,7 +4994,7 @@ static int evict_folios(unsigned long
> > nr_to_scan, struct lruvec *lruvec,
> >
> >         tier =3D get_tier_idx(lruvec, type);
> >         scanned =3D scan_folios(nr_to_scan, lruvec, sc,
> > -                             type, tier, &list, &isolated, &scanned_se=
q);
> > +                             type, tier, &list, &isolated,
> > &scanned_seq, cmd_proactive);
> >         nr_isolated =3D isolated;
> >         if (nr_isolated)
> >                 __mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
> > @@ -5177,11 +5181,13 @@ static bool should_abort_scan(struct lruvec
> > *lruvec, struct scan_control *sc)
> >  }
> >
> >  static long evict_folio_lists(unsigned long nr_to_scan[], struct
> > lruvec *lruvec,
> > -                            struct scan_control *sc, int swappiness,
> > unsigned long max_batch)
> > +                            struct scan_control *sc, int swappiness,
> > unsigned long max_batch,
> > +                            bool cmd_proactive)
> >  {
> >         int type;
> >         unsigned long batch, scanned, total_scanned =3D 0;
> >
> > +retry:
> >         /*
> >          * Scan both types with the given budgets; the caller checks if
> >          * reclaim is satisfied after each pass.
> > @@ -5191,8 +5197,13 @@ static long evict_folio_lists(unsigned long
> > nr_to_scan[], struct lruvec *lruvec,
> >                         continue;
> >
> >                 batch =3D min(nr_to_scan[type], max_batch);
> > -               scanned =3D evict_folios(batch, lruvec, sc, type, swapp=
iness);
> > +               scanned =3D evict_folios(batch, lruvec, sc, type,
> > swappiness, cmd_proactive);
> >
> > +               /* if it is a debugfs proactive reclaim, lend budget
> > to the other type */
> > +               if (!scanned && cmd_proactive && swappiness &&
> > swappiness <=3D MAX_SWAPPINESS) {
> > +               if (!scanned && cmd_proactive && swappiness &&
> > swappiness <=3D MAX_SWAPPINESS) {
> > +                       nr_to_scan[!type] +=3D nr_to_scan[type];
> > +                       goto retry;
> > +               }
> >                 nr_to_scan[type] -=3D min(nr_to_scan[type], scanned);
> >                 total_scanned +=3D scanned;
> >         }
> > @@ -5240,7 +5251,7 @@ static bool try_to_shrink_lruvec(struct lruvec
> > *lruvec, struct scan_control *sc)
> >
> >                 orig_anon =3D nr[LRU_GEN_ANON];
> >                 orig_file =3D nr[LRU_GEN_FILE];
> > -               scanned =3D evict_folio_lists(nr, lruvec, sc,
> > swappiness, MIN_LRU_BATCH);
> > +               scanned =3D evict_folio_lists(nr, lruvec, sc,
> > swappiness, MIN_LRU_BATCH, false);
> >
> >                 if (should_abort_scan(lruvec, sc))
> >                         break;
> > @@ -5896,7 +5907,7 @@ static int run_eviction(struct lruvec *lruvec,
> > unsigned long seq, struct scan_co
> >                 lru_gen_balance_scan(lruvec, sc, swappiness,
> >                                      nr_to_reclaim - sc->nr_reclaimed,
> > nr_to_scan);
> >
> > -               if (!evict_folio_lists(nr_to_scan, lruvec, sc,
> > swappiness, MAX_LRU_BATCH))
> > +               if (!evict_folio_lists(nr_to_scan, lruvec, sc,
> > swappiness, MAX_LRU_BATCH, true))
> >                         return 0;
> >
> >                 cond_resched();
> >
> > However, this would make the code much more complex and
> > probably isn't worth the effort for a rarely used debugfs
> > interface, especially given that we already have proactive
> > reclaim interfaces for both memcg and nodes.
> >
> > So perhaps we should simply set .priority =3D DEF_PRIORITY
> > and live with the two less significant issues described
> > above.
>
> I agree with this, actually maybe later we can use something in
> scan_control like an extra field, CLRU has a lot of special tweaks in
> that, which also needs to be sorted.

Agreed. I'll add a few words to the changelog.

"Note that we are already lenient with the debugfs proactive
reclaim interface. We may reclaim one generation ahead even
at DEF_PRIORITY, and with extreme swappiness values such
as 1 and 200, we may not fall back to the other type.

To address these cases and preserve the behavior of the
previous model before scan-budget-based reclaim, we would
need to add another flag to scan_control. However, this
may not be worthwhile for a debugfs interface that is likely
to be rarely used, especially given that we already have
memory-level and node-level proactive reclaim interfaces."

Thanks,
Barry
