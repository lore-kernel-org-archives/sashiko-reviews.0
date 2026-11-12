Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481906;
	b=mVaaadOc60Y+at5rXRV62+6h3QrYZAxXaW9zx3twFAcPLM+hchxXZ5jo6k/ZKpLfm2oX
	 5A6a0yGYgEENc0pMwAv+JvA8OHHpXB4uw9p66bdk+um06wuqyIbnpLmIR4hP6AMu6i/YA
	 b7MCUpD8rIIMMfpFiIxE4USWw8YflhcdPadI6MA9yQFNKioGvukuhV9b9ytrf/CkzRCIK
	 jAC4+AmMohCNhaIb7lJDKBGjFf3FWw6WTL696r9J9TZQOhaT7kEtkX33Ujy5cFyprF3p3
	 c7hF8GcChrx8eukP5IKM4Nnea6hadtJUh68WofUOZ8GJy0BgQPj38sDT0DrWjS338rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481906;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=NnGEZvnnpMRgr4BGvsUdhBhUeS7aU015fsB7ODIPjaA=;
	b=UtWhwaHDICIhoH7a8ZJ8kUb/VbCgiQvulM9wsliqrKpmhUPa/DoZKAFz7BI6NxoVZM1/
	 kl8q0ff7+Ho0bUBDNnK0HJwXXdAoh5/vQW+HRUtBCjYXqptz4l+YfRcmSms0UWobgMVzu
	 3giteQrnb1EhrKTXdmabJwdjzL49HFZ99EsmfqzDbq8Fmbkka8bXMNzDK6AwkI4XN4Hao
	 MY8vWYEyuxjIACIljgXObHwE/S/kjJTXvW7iqqZTI47QgOwENwOnv+64EwPButyO1NjKS
	 py4roV5rco8BXosCchD6QVn6Oybt8/ZLFcl4uz6IlHOWl2YIg9yxyNVuKl/wL4yeYKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gF5tFVOm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5441606A321
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gF5tFVOm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9FA1F00A09
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481906;
	bh=NnGEZvnnpMRgr4BGvsUdhBhUeS7aU015fsB7ODIPjaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gF5tFVOmj+hKuv/u9tJMEmOyOCPsaE0qV+Un4d9UHLL7OfMzB09iBVQJD2QiO226E
	 qlEeB42uSzqlHfNlZDR9eInWm8lnG7Bp1CKxtZMLrxITcjrwSivLBy5pMuGc4LAi7B
	 EOxD6kTOsmKcRZC0UZtERibG+9dDQgCyr6pBWG4ZtxyCAblZMmkSceXcPC3cRNTi5N
	 iwInF/U11HR1EUftYsUl2DrndX/cO6MSdfxmOUowRALlwu91BNxOUUvonjAHgU2R5I
	 xotvpvrHRledIPnK3Br7jkpmxW2YUkBx6YzQVNhmhd24HoDpS9gP2lSw6zCus0MA2l
	 a8mRDcjiZEd0A==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91f0272ce61so18802946d6.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:11:46 -0800 (PST)
X-Gm-Message-State: APuU4Z+xpJozfN2y5w0n0VIlUwmK4OI/2NQMyzKOlhR4RH5voeii4rBC
	7J7U5nb4VeVgECNscaOuv3y4wxe+/ufEhNSfKI8Vk+o3L7unxMTwvCD3bOID2HRwHsTKj7s91AI
	ZzxkSOBuDz//NPyQNe9hcDjDxsTdJfx8=
X-Received: by 2002:a05:620a:472b:b0:944:16e7:15c1 with SMTP id
 af79cd13be357-947afd68775mr958246785a.19.1794481905538; Thu, 12 Nov 2026
 03:11:45 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-12-baohua@kernel.org>
 <sashiko-outbox-210419@kernel.org>
In-Reply-To: <sashiko-outbox-210419@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 19:11:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wFye_co4bnJwuaoyshZOE+gcWFthmWD3r94dQgVHp8GQ@mail.gmail.com>
X-Gm-Features: AclHuK9A1r3vfYFu07CpdiG2lvAl7dAtD7d-JH_1uYu-MWR7CtRFEOHr2tv8OVU
Message-ID: <CAGsJ_4wFye_co4bnJwuaoyshZOE+gcWFthmWD3r94dQgVHp8GQ@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] mm/mglru: Run aging when one type has no
 populatable folios
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	ryncsn@gmail.com, shakeel.butt@linux.dev, surenb@google.com, 
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com, 
	zhangbo56@xiaomi.com, zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] mm/mglru: skipped aging in try_to_shrink_lruvec() when zero
>   folios are scanned
> - [Medium] mm/mglru: repeated aging in try_to_shrink_lruvec() when
>   no_populatable persists
> - [Low] mm/mglru: stale max_seq passed to should_run_aging() in
>   try_to_shrink_lruvec()
> --
>
> commit b68a220713e0f1b121c4874a48ac05f55108264a
> Author: Barry Song (Xiaomi) <baohua@kernel.org>
>
> mm/mglru: Run aging when one type has no populatable folios
>
> This commit moves the aging check in try_to_shrink_lruvec() after
> evict_folio_lists() and passes a no_populatable flag to should_run_aging(=
)
> so aging runs when one LRU type makes no scan progress despite remaining
> scan budget.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 085450819ee8e..41dd77652c82f 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -5105,7 +5105,8 @@ static bool lru_gen_imbalanced(struct lruvec *lru=
vec, struct scan_control *sc,
> >  }
> >
> >  static bool should_run_aging(struct lruvec *lruvec, unsigned long max_=
seq,
> > -                          struct scan_control *sc, int swappiness)
> > +                          struct scan_control *sc, int swappiness,
> > +                          bool no_populatable)
> >  {
> >       DEFINE_MIN_SEQ(lruvec);
> >
> > @@ -5117,6 +5118,13 @@ static bool should_run_aging(struct lruvec *lruv=
ec, unsigned long max_seq,
> >       if (sc->priority =3D=3D DEF_PRIORITY)
> >               return false;
> >
> > +     /*
> > +      * Run aging if scan budget remains but no folios
> > +      * in populatable generations are available to scan.
> > +      */
> > +     if (no_populatable)
> > +             return true;
> > +
> >       /* better to run aging even though eviction is still possible */
> >       if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=3D m=
ax_seq)
> >               return true;
> > @@ -5221,20 +5229,17 @@ static bool try_to_shrink_lruvec(struct lruvec =
*lruvec, struct scan_control *sc)
> >       lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
> >
> >       while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
> > +             unsigned long orig_file, orig_anon;
> >               DEFINE_MAX_SEQ(lruvec);
> > +             bool no_populatable;
> >
> >               if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
> >                       need_rotate =3D true;
> >                       break;
> >               }
> >
> > -             if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
> > -                     trace_mm_mglru_aging(lruvec, sc, swappiness);
> > -                     if (try_to_inc_max_seq(lruvec, max_seq, swappines=
s, false))
> > -                             need_rotate =3D true;
> > -                     should_age =3D true;
> > -             }
> > -
> > +             orig_anon =3D nr[LRU_GEN_ANON];
> > +             orig_file =3D nr[LRU_GEN_FILE];
> >               if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LR=
U_BATCH))
> >                       break;
> >
>
> [Severity: High]
> Does moving should_run_aging() and try_to_inc_max_seq() after
> evict_folio_lists() skip aging whenever evict_folio_lists() scans zero
> folios?
>
> mm/vmscan.c:scan_folios() {
>         ...
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 seq =3D lrugen->max_seq - MIN_NR_GENS;
>         else if (sc->priority > DEF_PRIORITY / 2)
>                 seq =3D lrugen->max_seq - 1;
>         else
>                 seq =3D lrugen->max_seq;
>
>         seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + =
1, seq);
>         ...
> }
>
> At DEF_PRIORITY, when only MIN_NR_GENS generations remain
> (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_seq),
> scan_folios() caps seq to max_seq - MIN_NR_GENS, which is below min_seq
> and already empty.  evict_folio_lists() then returns 0 and breaks out of
> the loop before reaching should_run_aging(), making the mandatory
> evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_seq aging
> check unreachable at DEF_PRIORITY.
>
> Similarly, at DEF_PRIORITY / 2 < sc->priority < DEF_PRIORITY,
> scan_folios() caps seq to max_seq - 1.  Whenever all evictable folios for
> the budgeted type(s) are in max_seq (for example when both types only hav=
e
> folios in max_seq, or when only one type has budget left),
> evict_folio_lists() returns 0 and breaks before aging can run, leaving
> need_rotate false as well so shrink_one() fails to rotate a sizable memcg=
.
>
> Finally, when sc->priority <=3D DEF_PRIORITY / 2, running
> evict_folio_lists() before should_run_aging() scans directly from max_seq
> (where min_gen =3D=3D max_gen in sort_folio() disables tier protection) b=
efore
> aging can split the youngest generation, and breaks without aging if the
> first batch satisfies should_abort_scan().

As I mentioned in my earlier reply [1], Bo Zhang suggested
the following change to me off-list:

@@ -5233,6 +5231,7 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)
                unsigned long orig_file, orig_anon;
                DEFINE_MAX_SEQ(lruvec);
                bool no_populatable;
+               long scanned;

                if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
                        need_rotate =3D true;
@@ -5241,8 +5240,7 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)

                orig_anon =3D nr[LRU_GEN_ANON];
                orig_file =3D nr[LRU_GEN_FILE];
-               if (!evict_folio_lists(nr, lruvec, sc, swappiness,
MIN_LRU_BATCH))
-                       break;
+               scanned =3D evict_folio_lists(nr, lruvec, sc,
swappiness, MIN_LRU_BATCH);

                if (should_abort_scan(lruvec, sc))
                        break;
@@ -5263,6 +5261,9 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)
                        should_age =3D true;
                }

+               if (!scanned)
+                       break;
+
                cond_resched();
        }


This gives aging a chance to run even when
evict_folio_lists() returns 0.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4xMUoTsPU-=3D_QVDqZ-p4Dt+vGJC5G8=
hed3PWNAk3iv8Bw@mail.gmail.com/

>
> > @@ -5248,6 +5253,15 @@ static bool try_to_shrink_lruvec(struct lruvec *=
lruvec, struct scan_control *sc)
> >               if (root_reclaim(sc) && should_age)
> >                       break;
> >
> > +             no_populatable =3D (nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] =
=3D=3D orig_anon) ||
> > +                              (nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] =
=3D=3D orig_file);
>
> [Severity: Medium]
> Can no_populatable stay true across every MIN_LRU_BATCH iteration and
> trigger repeated aging when one type still scans 0 folios after aging?
>

This is very unlikely. As long as while (!list_empty(head))
holds, we will have a non-zero scanned count:

while (!list_empty(head)) {
        struct folio *folio =3D lru_to_folio(head);
        int delta =3D folio_nr_pages(folio);

        scanned +=3D delta;

Aging should also help move some folios into
populatable generations.

> nr[] is computed once in lru_gen_prepare_scan() and is only decremented b=
y
> scanned folios.  If scan_folios() continues to return 0 for one type whil=
e
> the other type makes progress (for instance when sc->priority <=3D
> DEF_PRIORITY / 2 already scans up to max_seq, when max_seq has no eligibl=
e
> folios of that type, or when walk_mm() promotes all referenced folios int=
o
> the new youngest generation), nr[type] remains equal to orig_anon or
> orig_file.  In cgroup reclaim (!root_reclaim(sc)), the loop does not brea=
k

Folios shouldn't be promoted repeatedly, as earlier aging
should have already cleared their PTE young bits.

> on should_age, so should_run_aging() returns true and calls
> try_to_inc_max_seq() on every 64-page batch of the other type; in
> root_reclaim(sc), it runs unnecessary aging and aborts scanning the
> populated type after one extra batch.

>
> > +             if (should_run_aging(lruvec, max_seq, sc, swappiness, no_=
populatable)) {
> > +                     trace_mm_mglru_aging(lruvec, sc, swappiness);
> > +                     if (try_to_inc_max_seq(lruvec, max_seq, swappines=
s, false))
> > +                             need_rotate =3D true;
> > +                     should_age =3D true;
> > +             }
>
> [Severity: Low]
> Can should_run_aging() see a stale max_seq alongside a fresh min_seq here=
?
>
> DEFINE_MAX_SEQ(lruvec) snapshots max_seq at the start of the loop before
> evict_folio_lists(), whereas should_run_aging() reads min_seq after
> evict_folio_lists() finishes.  If a concurrent reclaimer advances max_seq
> and min_seq during eviction, should_run_aging() compares the new min_seq
> against the old max_seq, which can falsely trigger the aging branch, fail
> try_to_inc_max_seq() on the stale max_seq, and set should_age =3D true so
> root_reclaim(sc) aborts on the next pass.

I guess this is a pre-existing race that could also occur
before this patchset, but the patch somehow widens the race
window. One possible approach is to read max_seq later,
just before calling should_run_aging().

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D11
