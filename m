Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434506;
	b=GsUhaWvk3QXWDlwLf/xOUESBxf2SX2iGUADpLdTzPzX0tnpXv1qnmNSp60RgF1vP4eR5
	 k3gf86tBawBXMUUYRlPDAD5QykO4LeaIDIWK7UpICwTDpSzVK5zoyRm5CLHbqJ23FN+/9
	 /6CeQtKMQ5CQL/dqIzH77tFYeZG2qDLhMNHbPVlP0FSI27qXL5zTa6ipHxjy16s05O3R4
	 SXFvdn83K2UKJ6Rwh143/TkKTxBVnIyRkx0mGg1DhphDQmyslBJwxQV7+VxWWjETNTtsB
	 x98mQ/9mANCtmAp2AvbCtsOAV+TTOuG9iphAXNgmrYoBl86feJ49IVSS4uh+vJVnF8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434506;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=XW+W+IvRYtlcrp5klt8UaDvpzVbHTAiI7YDJRBlK4lQ=;
	b=CCoSFj57aVOA4mu3vkGmyrME47FFLQav1f/KEjABN6pluKFv9YTFcs4s7qSmxdLDZi5X
	 coESvKAYDp7sMh3t/wuoA22WEE9qX6WoAhNaLQfQplDqBdzURwJib3x0LGM7MVmpvU5PH
	 ZYmCt5DujF2ambbe/g4LvGFwILsMOkzvp9GoZr4cbvbIu9KSZzZQlUXhJ2/5rJBAh+tk3
	 7HQuzbquEN2du2f5640mmE54R8ECWcGCCyheOr1bHrGufyzFVR9ShQDzotuzvCpgyOIG5
	 zbv7c9+dE9+DbQUg3eSxu73uijfw7EfIParaPYpM3nkiuiYjaC3PHTS4Ia1Z9wgEjZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YF3EXwH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64895606C2E3
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YF3EXwH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E611F00A0C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434506;
	bh=XW+W+IvRYtlcrp5klt8UaDvpzVbHTAiI7YDJRBlK4lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YF3EXwH+ua/1/5jd4ldBXvrOqGSZbGBPvVownMlXdP8v5aClB3aSYZBAweqZR0vPt
	 fALT2kbP0N+JKld2X0qqj/MewTeGCWOeT00YwXg6/1+rLKOdP2sP9fsU7JTAsDokoh
	 U1+xbcMqzpbAWTUspCHMf9D+Lt690xKXYgyGJQBpleSaGZ7Bby/z05mQzjWesmFcgg
	 XhWfXNnoBWiMqZR/WtAGASri1p/ZsTZwk2RO3YWhF2eMr0cxNz+RPLOJV6jsmLPT8k
	 fiCoXwHaJmHEtrcC+XmTfLqydf6LqpZJEnnrCRROO1fhP8YRk6FpG1Yl/aohjiyYKo
	 FoWVgKdlDmwpw==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e6eb77f0bso325888785a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 14:01:45 -0800 (PST)
X-Gm-Message-State: APuU4Z95JOFZYCtpljbYkAUF4n6s4dmWC6fBHazn+bVBAjton6C5e3m5
	tia3eXj79t+yZBFkdmrHLWsskGVV+8XwmC13eLkOJscTiP+H7NHK55TmOpYE/p+FmQ7uNykWWAW
	x7IuYBwhsO5rNgz1w0rp2eVfZQ0k/+wo=
X-Received: by 2002:a05:620a:a195:20b0:947:b201:fad6 with SMTP id
 af79cd13be357-947b2022f47mr420628885a.68.1794434504674; Wed, 11 Nov 2026
 14:01:44 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110202025.25736-1-baohua@kernel.org> <20261110202025.25736-8-baohua@kernel.org>
 <sashiko-outbox-207744@kernel.org>
In-Reply-To: <sashiko-outbox-207744@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 06:01:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y4PBNutH3antEorzOw75GzAj50Y4-zXa3AW6wZ1PQP0w@mail.gmail.com>
X-Gm-Features: AclHuK-znX198smVgGAytsDbBJGgYonffly9uT4RSqSFEL392RS9laz-yJy7pwE
Message-ID: <CAGsJ_4y4PBNutH3antEorzOw75GzAj50Y4-zXa3AW6wZ1PQP0w@mail.gmail.com>
Subject: Re: [PATCH v6 07/15] mm/mglru: balance anon and file scan budget by
 refault rate
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] mm/mglru: lru_gen_balance_scan() budgets un-scannable
>   generations
> - [Low] mm/mglru: lru_gen_prepare_scan() re-adds obsolete offline memcg
>   check
> - [Low] mm/mglru: u64 overflow in lru_gen_balance_scan() excess budget
>   handoff
> - [Low] mm/mglru: unzeroed budget on empty scan in evict_folio_lists()
> --
>
> commit 20aa81528d31d5bc56afcb10aeda259624bda6c8
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: balance anon and file scan budget by refault rate
>
> This commit replaces MGLRU's single-type-per-batch selection with
> lru_gen_balance_scan() and evict_folio_lists() to split the scan budget
> between anon and file LRUs based on per-type refault rates and LRU sizes.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index e2807faf26deb..6b325fe73436a 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4858,79 +4858,110 @@ static int get_tier_idx(struct lruvec *lruvec,=
 int type)
>
> [ ... ]
>
> > +     /* Cross-multiply the ratio above. */
> > +     anon_scan =3D mul_u64_u64_div_u64(total_scan, anon_factor, anon_f=
actor + file_factor);
> > +     file_scan =3D (u64)total_scan - anon_scan;
> > +
> >       /*
> > -      * We scanned some folios but failed to isolate any due to promot=
ions,
> > -      * protections, or races. Retry once to avoid a larger loop.
> > +      * Bound each type by its evictable size. Hand the exceeding part=
 to
> > +      * the other type. Any excess left when total_scan exceeds both s=
izes
> > +      * is dropped, since it only stresses the scanner with no gain.
> >        */
> > -     if (scanned && !tried) {
> > -             tried =3D true;
> > -             goto retry;
> > -     }
> > -
> > -     return total_scanned;
> > +     if (anon_scan > nr[LRU_GEN_ANON])
> > +             file_scan +=3D anon_scan - nr[LRU_GEN_ANON];
> > +     if (file_scan > nr[LRU_GEN_FILE])
> > +             anon_scan +=3D file_scan - nr[LRU_GEN_FILE];
> > +     nr[LRU_GEN_ANON] =3D min_t(u64, anon_scan, nr[LRU_GEN_ANON]);
> > +     nr[LRU_GEN_FILE] =3D min_t(u64, file_scan, nr[LRU_GEN_FILE]);
> >  }
>
> [Severity: Low]
> Can anon_scan overflow u64 when total_scan exceeds total and both if
> branches run?
>
> In lru_gen_seq_write() -> run_cmd() -> run_eviction(), the optional
> nr_to_reclaim argument defaults to ULONG_MAX, so total_scan passed to
> lru_gen_balance_scan() can be near U64_MAX.  When anon_scan exceeds
> nr[LRU_GEN_ANON], the first branch sets file_scan to
> total_scan - nr[LRU_GEN_ANON] without clamping anon_scan, and the second
> branch then adds total_scan - total to the unclamped anon_scan.  If
> anon_scan + total_scan - total wraps modulo 2^64 to a value smaller than
> nr[LRU_GEN_ANON], nr[LRU_GEN_ANON] is truncated below the available
> anonymous size.  Using else if (or clamping total_scan to total upfront)
> avoids the overflow.

yes. else if:

        if (anon_scan > nr[LRU_GEN_ANON])
                file_scan +=3D anon_scan - nr[LRU_GEN_ANON];
        else if (file_scan > nr[LRU_GEN_FILE])
                anon_scan +=3D file_scan - nr[LRU_GEN_FILE];

>
> [ ... ]
>
> > @@ -5051,18 +5083,22 @@ static bool should_run_aging(struct lruvec *lru=
vec, unsigned long max_seq,
> >       return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=
=3D max_seq;
> >  }
> >
> > -static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control =
*sc,
> > -                        struct mem_cgroup *memcg, int swappiness)
> > +static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_co=
ntrol *sc,
> > +             struct mem_cgroup *memcg, int swappiness,
> > +             unsigned long nr_to_scan[])
> >  {
> > -     unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
> > +     unsigned long total;
> >
> > -     lruvec_evictable_size(lruvec, swappiness, sizes);
> > -     evictable =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
> > +     lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> > +     total =3D nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
> >
> > -     nr_to_scan =3D apply_proportional_protection(memcg, sc, evictable=
);
> > -     nr_to_scan >>=3D sc->priority;
> > +     /* Just scrape all pages calculated above if this memcg was delet=
ed */
> > +     if (!mem_cgroup_online(memcg))
> > +             return;
> >
> > -     return nr_to_scan;
> > +     total =3D apply_proportional_protection(memcg, sc, total);
> > +     total >>=3D sc->priority;
> > +     lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
> >  }
>
> [Severity: Low]
> Does this re-introduce the !mem_cgroup_online(memcg) early return that
> 2e203d692b0cb ("mm/vmscan: remove redundant !mem_cgroup_online() checks")
> removed from get_nr_to_scan()?
>
> Offlined memcgs already have all LRU folios reparented and
> lruvec_evictable_size() equal to 0, so returning early here only skips
> apply_proportional_protection() and misses setting sc->memcg_low_skipped
> when an offlined memcg still has stale effective memory.low protection.

Oops, my fault. As mentioned in the cover letter, I ran into
quite a few conflicts while rebasing, and handled this one
incorrectly. I'll drop the following in v7:

/* Reclaim all pages calculated above if this memcg was deleted */
if (!mem_cgroup_online(memcg))
       return;

>
> [ ... ]
>
> > @@ -5095,6 +5131,30 @@ static bool should_abort_scan(struct lruvec *lru=
vec, struct scan_control *sc)
> >       return true;
> >  }
> >
> > +static long evict_folio_lists(unsigned long nr_to_scan[], struct lruve=
c *lruvec,
> > +                          struct scan_control *sc, int swappiness, uns=
igned long max_batch)
> > +{
> > +     int type;
> > +     unsigned long batch, scanned, total_scanned =3D 0;
> > +
> > +     /*
> > +      * Scan both types with the given budgets; the caller checks if
> > +      * reclaim is satisfied after each pass.
> > +      */
> > +     for (type =3D LRU_GEN_FILE; type >=3D LRU_GEN_ANON; type--) {
> > +             if (!nr_to_scan[type])
> > +                     continue;
> > +
> > +             batch =3D min(nr_to_scan[type], max_batch);
> > +             scanned =3D evict_folios(batch, lruvec, sc, type, swappin=
ess);
> > +
> > +             nr_to_scan[type] -=3D min(nr_to_scan[type], scanned);
> > +             total_scanned +=3D scanned;
> > +     }
> > +
> > +     return total_scanned;
> > +}
>
> [Severity: Low]
> When evict_folios() returns 0 for one type because that type has no folio=
s
> in scannable generations, shouldn't nr_to_scan[type] be cleared to 0?
>
> Leaving nr_to_scan[type] unchanged causes try_to_shrink_lruvec() to call
> evict_folios() on the empty type on every subsequent MIN_LRU_BATCH pass
> while the other type still has budget, and then run one extra iteration
> (including should_run_aging() and try_to_inc_max_seq()) after the
> scannable type's budget reaches 0.

I guess we can do an aging when one type has no populatable folios:

@@ -5116,6 +5117,13 @@ static bool should_run_aging(struct lruvec
*lruvec, unsigned long max_seq,
        if (sc->priority =3D=3D DEF_PRIORITY)
                return false;

+       /*
+        * Run aging if scan budget remains but no folios
+        * in populatable generations are available to scan.
+        */
+       if (no_populatable)
+               return true;
+
        /* better to run aging even though eviction is still possible */
        if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=3D max=
_seq)
                return true;
@@ -5220,20 +5228,17 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)
        lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);

        while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
+               unsigned long orig_file, orig_anon;
                DEFINE_MAX_SEQ(lruvec);
+               bool no_populatable;

                if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
                        need_rotate =3D true;
                        break;
                }

-               if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
-                       trace_mm_mglru_aging(lruvec, sc, swappiness);
-                       if (try_to_inc_max_seq(lruvec, max_seq,
swappiness, false))
-                               need_rotate =3D true;
-                       should_age =3D true;
-               }
-
+               orig_anon =3D nr[LRU_GEN_ANON];

>
> [ ... ]
>
> > @@ -5781,8 +5838,11 @@ static int run_eviction(struct lruvec *lruvec, u=
nsigned long seq, struct scan_co
> >               if (sc->nr_reclaimed >=3D nr_to_reclaim)
> >                       return 0;
> >
> > -             nr_batch =3D min(nr_to_reclaim - sc->nr_reclaimed, MAX_LR=
U_BATCH);
> > -             if (!evict_folios(nr_batch, lruvec, sc, swappiness))
> > +             lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> > +             lru_gen_balance_scan(lruvec, swappiness,
> > +                                  nr_to_reclaim - sc->nr_reclaimed, nr=
_to_scan);
> > +
> > +             if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness=
, MAX_LRU_BATCH))
> >                       return 0;
> >
> >               cond_resched();
>
> [Severity: Medium]
> Can lru_gen_balance_scan() assign scan budget to a type that has no folio=
s
> in scannable generations instead of handing that budget to the other type=
?
>
> Previously, isolate_folios() fell back to !type whenever scan_folios()
> returned 0.  Now, lru_gen_balance_scan() only transfers excess budget whe=
n
> a type's share exceeds nr[type] from lruvec_evictable_size(), which sums
> folios across all generations min_seq[type]..max_seq including protected
> younger generations (such as max_seq - 1 and max_seq at DEF_PRIORITY).
>
> When one type has drained all folios in its scannable cold generations
> while still holding folios in younger generations, lruvec_evictable_size(=
)
> remains non-zero and lru_gen_balance_scan() keeps assigning budget to tha=
t
> type.  In try_to_shrink_lruvec(), that share of the scan budget is lost;

Should be handled by the no-populatable aging logic above.

> in run_eviction() (where priority is fixed at DEF_PRIORITY), if the
> remaining scannable type's share rounds down to 0 (for example when
> nr_to_reclaim - sc->nr_reclaimed is small or at swappiness =3D=3D
> MAX_SWAPPINESS), evict_folio_lists() scans nothing and aborts proactive
> reclaim early while the other type still has cold folios.

For run_eviction(), I think we can remove the newly added
code, since sc->priority used to be always 0:

@@ -5845,6 +5905,7 @@ static ssize_t lru_gen_seq_write(struct file
*file, const char __user *src,
  .may_writepage =3D true,
  .may_unmap =3D true,
  .may_swap =3D true,
+ .priority =3D DEF_PRIORITY,
  .reclaim_idx =3D MAX_NR_ZONES - 1,
  .gfp_mask =3D GFP_KERNEL,
  .proactive =3D true,

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202025.25=
736-1-baohua@kernel.org?part=3D7

Thanks,
Barry
