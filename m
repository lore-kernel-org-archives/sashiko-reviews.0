Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465405;
	b=gtppNaN0bY+ymQUK6VLfYxrd6xiT7cFqPHIGA/u3jiTEGAOdSDWCYJ/w2OKXgy5SNeMk
	 +pLgtHv6XLclYHo4cO2EQ0HC4g1fg1CTmoeOzLg2mcf6KyjsZuKZa8GrtSEhSL9YL+1qh
	 vnCR+NuZXxL7k1y1irmSHlf4rL6PLKqpzqVzA9mrKhxMJWRkX7K2/7giUEg3w/yJlsgiP
	 S5wbHb9uI3m1AcTklKkbWH7jEDZ9098p0arQxr8k8Vv9nTanaOpkOuJzjuWuKybKgw5WO
	 Ay9cPY4/QYtYELAjt8+0ZO6YbYba0LmDM8wUALuW9LBnEMMTF0Yh4FQnW0KVjfjBrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465405;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+RtrIdqsqTNoB8Tp2YQ6uO0c75jIeI1mGbAx+/hHzPc=;
	b=sz7J5dfak2TM+XDVfthwa+QgW7qLVpxEXmI3Y31gxQ4djP08VebQTnrIXiKtzZDh9b0Z
	 Uyy9WgHwPZivSXp5cklHnkL2n5R9nIcUax28FOAvSssyD4VthfW+NUL2FTgN8U81VkQbm
	 UU4BmZN61hohM+PWV7P1OO6XNu5NavK6HX699GHO6xHSW+mfCJ9zLV++IGIQQwAliplMP
	 jJSwFk0XBHJzCt94v5P9IkA0u8Gx5rqdj/Oh9EamB0mvzOY6NxS0Ep2NUl8WyTn0whnqG
	 RrCbOQlWTNKjg6/W78u0OR/iYIM+KyT1qYZpQyC3uAGAoiUBy+0t4PkV2d3DMXU76lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HHJx6bCv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED4606A327
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HHJx6bCv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47C11F00A0B
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 06:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794465404;
	bh=+RtrIdqsqTNoB8Tp2YQ6uO0c75jIeI1mGbAx+/hHzPc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HHJx6bCvvrYAcj4XzMKhYe5PCtP7UJmHVk5/AxixS1L/qgS7HPfBJAKbUwjLjYe4j
	 KECeDwuK9/sViJWgtXu7yQzNnBp+OwFyS3uJwaPVTECSUivfkevd5dXpkeSaTZ8VYV
	 1IAjWsqmVgo/2cjdfb7fSRDYlxoe9HmRJNE+9K3qN12KyaJNRzfeo1ld2XwGPlv8nu
	 rFeDc3h6IULVgvdQbpcJ34+cTVkooBxQH9SB+/g9/U8dbu5upZp4rgw4DoZkajKrZL
	 4SYXR+eMiP8S25df2dJxTNm3keBbwzfLQZbi3pa8yCYzo+qbuwqk4UFZTdZIWNnq4O
	 TEiXO9hKy5ZnQ==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e64d52949so333057185a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 22:36:44 -0800 (PST)
X-Gm-Message-State: APuU4Z8c51DnUgqgwzjzF19X8FTvy/3aXWDwuowFGVLXQU5F9L0Crx34
	9IxKazc4kfPE12x2cqZQXKPVz00+MU17HB8sBJ3xkVJHlLIW9wShTrHMXMTr3O+Ek01UtWUBmzZ
	zRgjQSvDM31ND2meGyWxEYJ/uKvv6r+0=
X-Received: by 2002:a05:620a:4691:b0:93e:f0b9:505a with SMTP id
 af79cd13be357-947b007767dmr785468385a.58.1794465403716; Wed, 11 Nov 2026
 22:36:43 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-6-baohua@kernel.org>
 <sashiko-outbox-210413@kernel.org>
In-Reply-To: <sashiko-outbox-210413@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 14:36:31 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xMUoTsPU-=_QVDqZ-p4Dt+vGJC5G8hed3PWNAk3iv8Bw@mail.gmail.com>
X-Gm-Features: AclHuK9M4cCTbrxDsGbrpPPHixNCymAyYzZTrljomY5vQZE61WTqm7Y65AMrlfk
Message-ID: <CAGsJ_4xMUoTsPU-=_QVDqZ-p4Dt+vGJC5G8hed3PWNAk3iv8Bw@mail.gmail.com>
Subject: Re: [PATCH v7 05/16] mm/mglru: skip zones above reclaim_idx instead
 of rotating them
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/mglru: pinned min_seq in try_to_inc_min_seq() stalls aging
> --
>
> commit a9558af5b6eefdf9bb9a64058218b290ef8ecc66
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: skip zones above reclaim_idx instead of rotating them
>
> This commit restricts scan_folios() and lruvec_populated_min_seq() to zon=
es up
> to sc->reclaim_idx instead of scanning and rotating folios in higher zone=
s.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 51c2ee66b3ee8..273aa8c56bec8 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3992,7 +3992,7 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
> >
> >  /* Similar to lruvec_evictable_size, return the oldest populated seq o=
f the type */
> >  static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, i=
nt type,
> > -                                           unsigned long max_seq)
> > +                                           int zone_limit, unsigned lo=
ng max_seq)
> >  {
> >       int gen, zone;
> >       unsigned long min_seq;
> > @@ -4003,7 +4003,7 @@ static unsigned long lruvec_populated_min_seq(str=
uct lruvec *lruvec, int type,
> >       min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> >       while (min_seq <=3D max_seq) {
> >               gen =3D lru_gen_from_seq(min_seq);
> > -             for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> > +             for (zone =3D 0; zone < zone_limit; zone++) {
> >                       if (!list_empty(&lrugen->folios[gen][type][zone])=
)
> >                               return min_seq;
> >               }
> > @@ -4026,7 +4026,7 @@ static void try_to_inc_min_seq(struct lruvec *lru=
vec, int swappiness)
> >       /* Requires at least MIN_NR_GENS gens for basic functionality */
> >       seq =3D lrugen->max_seq - MIN_NR_GENS;
> >       for_each_evictable_type(type, swappiness) {
> > -             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type, =
seq + 1);
> > +             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type, =
MAX_NR_ZONES, seq + 1);
> >               if (min_seq[type] > lrugen->min_seq[type])
> >                       seq_inc_flag =3D true;
> >       }
>
> [ ... ]
>
> > @@ -4780,24 +4773,22 @@ static int scan_folios(unsigned long nr_to_scan=
, struct lruvec *lruvec,
> >        * when under pressure to respect swappiness more and reduce IO c=
ost.
> >        */
> >       if (sc->priority =3D=3D DEF_PRIORITY)
> > -             min_seq =3D lrugen->min_seq[type];
> > +             seq =3D lrugen->min_seq[type];
> >       else
> > -             min_seq =3D lruvec_populated_min_seq(lruvec, type, lrugen=
->max_seq);
> > +             seq =3D lrugen->max_seq;
> >
> > -     gen =3D lru_gen_from_seq(min_seq);
> > +     seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + =
1, seq);
> > +     gen =3D lru_gen_from_seq(seq);
> >       max_gen =3D lru_gen_from_seq(max_seq);
> >
> > -     for (i =3D MAX_NR_ZONES; i > 0; i--) {
> > +     /* Scan eligible zones in descending order. */
> > +     for (zone_idx =3D sc->reclaim_idx; zone_idx >=3D 0; zone_idx--) {
>
> [Severity: High]
> As reported by KunWu Chan on RFC v5 [1], does skipping zones above
> sc->reclaim_idx in scan_folios() while try_to_inc_min_seq() still checks =
all
> MAX_NR_ZONES stall aging during zone-constrained reclaim (for example,
> GFP_DMA32 reclaim when ZONE_NORMAL is populated)?
>
> When an lruvec has MAX_NR_GENS (4) generations, lrugen->min_seq[type] sta=
rts
> at max_seq - 3.  Because scan_folios() no longer rotates folios in zones =
above
> sc->reclaim_idx, any folios in those zones keep try_to_inc_min_seq() from
> advancing lrugen->min_seq[type] once eligible zones are drained.
>
> In should_run_aging():
>
> mm/vmscan.c:should_run_aging() {
>         ...
>         if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_se=
q)
>                 return true;
>
>         /* try to avoid aging, do gentle reclaim at the default priority =
*/
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 return false;
>
>         /* better to run aging even though eviction is still possible */
>         return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=
=3D max_seq;
> }
>
> With min_seq pinned at max_seq - 3, evictable_min_seq() + MIN_NR_GENS nev=
er
> reaches max_seq, so should_run_aging() returns false and scan_folios() dr=
ains
> eligible zones down to the youngest generation max_seq where sort_folio()
> disables tier protection and workingset promotion (min_gen =3D=3D max_gen=
).
>
> Even with the follow-up commits in this series (commit "mm/mglru: Run agi=
ng
> when pages are rare outside the youngest gen", commit "mm/mglru: Run agin=
g
> when one type has no populatable folios", and commit "mm/mglru: Restrict
> eviction accounting to eligible zones"), at priorities above DEF_PRIORITY=
 / 2
> scan_folios() caps seq at max_seq - 1 and evict_folio_lists() returns 0 o=
nce
> older generations are empty in eligible zones, causing try_to_shrink_lruv=
ec()
> to break out before calling should_run_aging() until priority drops to

I'm not sure why this is marked as high severity, as it
seems more like a performance concern. Also, when we
scan the youngest generation, tier protection and
workingset promotion are no longer needed, as the
folios are already in the youngest generation.

Actually, I created a silly test case that forces
GFP_DMA32 for anon folios:

diff --git a/mm/memory.c b/mm/memory.c
index fe72e66c9c2e..350ac4a834e6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1251,7 +1251,7 @@ static inline struct folio
*folio_prealloc(struct mm_struct *src_mm,
        if (need_zero)
                new_folio =3D vma_alloc_zeroed_movable_folio(vma, addr);
        else
-               new_folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma,=
 addr);
+               new_folio =3D vma_alloc_folio(GFP_USER | __GFP_DMA32, 0,
vma, addr);

        if (!new_folio)
                return NULL;
@@ -5053,7 +5053,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
        if (!folio) {
                /* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO
devices and zswap */
                if (swap_entry_synchronous(si, entry))
-                       folio =3D swapin_sync(entry, GFP_HIGHUSER_MOVABLE,
+                       folio =3D swapin_sync(entry,
GFP_HIGHUSER_MOVABLE | __GFP_DMA32,

thp_swapin_suitable_orders(si, vmf) | BIT(0),
                                            vmf, NULL, 0);
                else


In this case, the current patchset still performs much
better on MGLRU than using CLRU.

MGLRU
*** Executing round 0 ***
set swappiness to 60

real 1m57.803s
user 25m34.833s
sys 6m8.024s


CLRU:
*** Executing round 0 ***
set swappiness to 60

Endless....(CLRU can't finish the kernel build at all)

If we do want to trigger aging earlier when evict_folio_lists()
returns 0, rather than waiting until the priority drops to
DEF_PRIORITY / 2, Bo Zhang shared an idea with me off-list
that might address this issue.

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9f759d213614..3721725852b3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4033,8 +4033,6 @@ static void try_to_inc_min_seq(struct lruvec
*lruvec, int swappiness)

        /* see the comment on lru_gen_folio */
        if (swappiness && swappiness <=3D MAX_SWAPPINESS) {
-               unsigned long seq =3D lrugen->max_seq - MIN_NR_GENS;
-
                if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] < =
seq)
                        min_seq[LRU_GEN_ANON] =3D seq;
                else if (min_seq[LRU_GEN_FILE] > seq &&
min_seq[LRU_GEN_ANON] < seq)
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

> DEF_PRIORITY / 2 and scans max_seq without tier protection.
>
> [1] https://lore.kernel.org/r/CAN_Opa-AScm9=3DEeXO_Uy8VjbQ=3DbqY9P++rFP8H=
1RhUB4dOt6xw@mail.gmail.com
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D5
