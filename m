Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479575;
	b=Ru2Li4AjLc+ESxPe/JdKCFtgz6V001n9OCVTfWgbDLmQwFG5lnv0V3O3P/9HTO+axXlj
	 UWhuU8TVCaFMKsp4MZAwIT1kt/slnDWVd3f02HyYVyIKbP42xdfoSiX/SR5hT/eqoenpy
	 mVb7Lxv8YIegJ3IjUeJjs5SQbDPlZLpvLq3yyxmTOmz/WjWX2ddX5ArnI5rcLeMByYZBK
	 M1BzPT5/Q/jmM6Nxun6MugU6krICypVLcwQ8i1ZMmZ78NdTvM88szi926/RGb8cVdYQo/
	 3xQcGFNuVgJglMsilOXmOBeLKXvkFIbNHdxfcpGis88Wr2rFTtpwA4QkEy6F4Fmxt4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479575;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=usXX4h4ptjAbPKcbGL6f5kGI4AA8Y8wNoq1oFaSrO3g=;
	b=EUO6XCBrRH99nQUQQErAiR97Xx3dYcBLgaohscETcp8+ZSnzMs8GXmW3U/nBpVP8ttXs
	 lnqEPccYb+AjjAWWDsPyHH1/1PXp8He/22KAkwa7+vXq2zrI2L4WUBKuGWwIR1SwUuC9E
	 RDsNVMRWOgq6mw920tGRNHLnY5S9tPSi9y4o0l4HUmxoogEvG2iSsytNoyeTzsrM0z0ko
	 UeRl9LIRefLeq9Wa6JT/b0DkCn5e2Ekzdk0MPFJky9FXHi/oBIEdKICWcjRlEDkAxW34p
	 1qcfIG6XOrf4fUBg6afoeikbysYXvSJ06HUjaT5mdIADr1skiLsx32zj6r2v8Aa20og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QI/UmdT3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC68606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QI/UmdT3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E909B1F00A0F
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479574;
	bh=usXX4h4ptjAbPKcbGL6f5kGI4AA8Y8wNoq1oFaSrO3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QI/UmdT3UdaYYFJwKq9PLDYmqIy+Dm51YxBLLHk8FgH8VqGoU5xPuprSEJbwTy+hc
	 HmYblaUZaCbtx/lDEMrzkZ+If5xdzKyXqzKQQlMqGwLplz85hdRDhzJDCVTQWR4ec+
	 1/KzDwpv+nbG87IqSs8dsqeJAOjL68BoniPbmENuhPEQdpyIOkxwSzbqmJD3le1pnW
	 TJ5f2aZKgFJ6I9wFrpPp+mvZxuukv+t7XgTUbQiHmHCTsVD+KbP6PMfyA/7ozVHAgy
	 2Kcv6vsxRR57T5RQ4nacAj3xMVryfcWtEJM5QVQokbzJ7+sOMCvvYMBKgaUkBkqyNL
	 ldzBJKFM4eA9g==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9440304604aso79208485a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 02:32:54 -0800 (PST)
X-Gm-Message-State: APuU4Z9vzs32JGbN7/kfdFkGsQvRvWcM4yk2x1xcnM0WSLd5EZ0Ete52
	Vq5j0Ap1EI3xCdev83Y9F7bMJEHNAXn8fHbhxiIUedkae/vXTBuMDf2gdR87fH/DfptZ2c40AlT
	4+6VGLkLytZfTeRV1jnKnU5msVWQECTo=
X-Received: by 2002:a05:620a:1722:b0:93e:5534:e63 with SMTP id
 af79cd13be357-94932d2b22fmr381798785a.13.1794479573803; Thu, 12 Nov 2026
 02:32:53 -0800 (PST)
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
 <sashiko-outbox-210422@kernel.org>
In-Reply-To: <sashiko-outbox-210422@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 18:32:41 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ykeDu9XyyiNs9HBp2w--Pm7=oqs0=M5cPiypQ1qq9yTg@mail.gmail.com>
X-Gm-Features: AclHuK9aqAZITWRqHh9yevkLq-9AApROjxfcJNRcSWL23zK1HDs8oSwCzxS8sEA
Message-ID: <CAGsJ_4ykeDu9XyyiNs9HBp2w--Pm7=oqs0=M5cPiypQ1qq9yTg@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
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
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] mm/mglru: commit Author and Signed-off-by use handle instead of
>   real name
> - [Medium] mm/mglru: zero sc.priority in run_eviction() skews
>   lru_gen_balance_scan()
> --
>
> commit 8a29a76d461ffd04769caa1f7ed98ca18efe1fb3
> Author: lyugaofei <lyugaofei@xiaomi.com>
>
> > mm/mglru: Avoid prolonged anon reclaim with swappiness=3D200
> >
> > It has been observed that swappiness=3D200 can significantly slow down
> > reclaim on some machines, with some workloads running 3x slower
> > under MGLRU than under CLRU.
> >
> > This is because swappiness=3D200 currently results in file_factor=3D0.
> > Give file reclaim a small factor at lower priorities, for example,
> > when sc->priority < DEF_PRIORITY / 2.
> >
> > Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
> > Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>
> [Severity: High]
> Per Documentation/process/submitting-patches.rst, both the commit Author
> and the Signed-off-by trailer must use a known real full human name rathe=
r
> than an account handle ("lyugaofei").

Let me change it to:
Gaofei Lyu <lyugaofei@xiaomi.com>

>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 2030c15c06674..a92b14190d733 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4889,8 +4889,8 @@ static int get_tier_idx(struct lruvec *lruvec, in=
t type)
> >   * We don't calculate the scan cost, MGLRU uses lazy promotion, which =
will
> >   * cancel the scan budget natually.
> >   */
> > -static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness=
,
> > -             unsigned long total_scan, unsigned long nr[])
> > +static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_co=
ntrol *sc,
> > +             int swappiness, unsigned long total_scan, unsigned long n=
r[])
> >  {
> >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> >       u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
> > @@ -4947,7 +4947,12 @@ static void lru_gen_balance_scan(struct lruvec *=
lruvec, int swappiness,
> >       file_weight =3D nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
> >
> >       anon_factor =3D (u64)swappiness * refault_rate[LRU_GEN_FILE] * an=
on_weight;
> > -     file_factor =3D (u64)(MAX_SWAPPINESS - swappiness) * refault_rate=
[LRU_GEN_ANON] * file_weight;
> > +     if (swappiness =3D=3D MAX_SWAPPINESS)
> > +             file_factor =3D sc->priority < DEF_PRIORITY / 2 ?
> > +                           refault_rate[LRU_GEN_ANON] * file_weight : =
0;
> > +     else
> > +             file_factor =3D (u64)(MAX_SWAPPINESS - swappiness) *
> > +                           refault_rate[LRU_GEN_ANON] * file_weight;
>
> [ ... ]
>
> > @@ -5891,7 +5896,7 @@ static int run_eviction(struct lruvec *lruvec, un=
signed long seq, struct scan_co
> >                       return 0;
> >
> >               lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan)=
;
> > -             lru_gen_balance_scan(lruvec, swappiness,
> > +             lru_gen_balance_scan(lruvec, sc, swappiness,
> >                                    nr_to_reclaim - sc->nr_reclaimed, nr=
_to_scan);
> >
> >               if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness=
, MAX_LRU_BATCH))
>
> [Severity: Medium]
> Does passing sc from run_eviction() into lru_gen_balance_scan() cause
> swappiness=3D200 via debugfs proactive reclaim to always calculate a non-=
zero
> file_factor?
>
> lru_gen_seq_write() initializes sc on the stack without setting .priority
> to DEF_PRIORITY, leaving sc.priority zero-initialized when passed to
> run_cmd() -> run_eviction().  In lru_gen_balance_scan(), sc->priority <
> DEF_PRIORITY / 2 (0 < 6) is then unconditionally true, so proactive
> eviction with swappiness=3D200 always reclaims file pages instead of
> preferring anonymous memory.

Well, I'm getting tons of complaints about
lru_gen_seq_write(), even though it's just a debug
interface that probably very few people actually use.

If anyone is actually using it, please let me know.
Otherwise, I think we should consider removing it in the
long term. Both memcg and node already have proactive
reclaim interfaces, so this one seems redundant and
difficult to maintain.

All Sashiko comments seem to suggest:

@@ -5955,6 +5956,7 @@ static ssize_t lru_gen_seq_write(struct file
*file, const char __user *src,
        struct blk_plug plug;
        int err =3D -EINVAL;
        struct scan_control sc =3D {
+               .priority =3D DEF_PRIORITY,
                .may_writepage =3D true,
                .may_unmap =3D true,
                .may_swap =3D true,

But I think this approach could introduce its own problems.
Suppose we have four generations for both file and anon,
and users use the debugfs interface to reclaim the oldest
generation.

1. Even at DEF_PRIORITY, we can currently scan up to
lrugen->max_seq - MIN_NR_GENS, which means the
second-oldest generation can also be reclaimed. This
somehow violates the user's request to reclaim only the
oldest generation.

2. With swappiness=3D1 or 200, if we run out of the
preferred file or anon type in the oldest generation,
we can fall back to the other type and reclaim all of
its oldest generation, as we did before scan-budget mode
was introduced. With the new approach, however, we stick
to the preferred type at DEF_PRIORITY and don't fall
back to the other type. As a result, evict_folio_lists()
can return 0 earlier than it would with the fallback
approach.

I guess the only way to address all these issues is to add
a separate reclaim path for requests from
lru_gen_seq_write(), with evict_folio_lists() handling
these requests differently from regular reclaim to preserve
the old behavior before this patchset introduced the
budget-based model.

Something like the following, though it would be very ugly:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4fe516d33703..24c6abe37189 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4745,7 +4745,8 @@ static bool isolate_folio(struct lruvec *lruvec,
struct folio *folio, struct sca
 static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
                       struct scan_control *sc, int type, int tier,
                       struct list_head *list, int *isolatedp,
-                      unsigned long *scanned_seq)
+                      unsigned long *scanned_seq,
+                      bool cmd_proactive)
 {
        enum node_stat_item item;
        int zone_idx;
@@ -4768,7 +4769,9 @@ static int scan_folios(unsigned long nr_to_scan,
struct lruvec *lruvec,
         * newest generation when under severe pressure, so hot folios are
         * not evicted as soon as priority is raised.
         */
-       if (sc->priority =3D=3D DEF_PRIORITY)
+       if (unlikely(cmd_proactive))
+               seq =3D lrugen->min_seq[type];
+       else if (sc->priority =3D=3D DEF_PRIORITY)
                seq =3D lrugen->max_seq - MIN_NR_GENS;
        else if (sc->priority > DEF_PRIORITY / 2)
                seq =3D lrugen->max_seq - 1;
@@ -4966,7 +4969,8 @@ static void lru_gen_balance_scan(struct lruvec
*lruvec, struct scan_control *sc,
 }

 static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
-                       struct scan_control *sc, int type, int swappiness)
+                       struct scan_control *sc, int type, int swappiness,
+                       bool cmd_proactive)
 {
        LIST_HEAD(list);
        LIST_HEAD(clean);
@@ -4990,7 +4994,7 @@ static int evict_folios(unsigned long
nr_to_scan, struct lruvec *lruvec,

        tier =3D get_tier_idx(lruvec, type);
        scanned =3D scan_folios(nr_to_scan, lruvec, sc,
-                             type, tier, &list, &isolated, &scanned_seq);
+                             type, tier, &list, &isolated,
&scanned_seq, cmd_proactive);
        nr_isolated =3D isolated;
        if (nr_isolated)
                __mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
@@ -5177,11 +5181,13 @@ static bool should_abort_scan(struct lruvec
*lruvec, struct scan_control *sc)
 }

 static long evict_folio_lists(unsigned long nr_to_scan[], struct
lruvec *lruvec,
-                            struct scan_control *sc, int swappiness,
unsigned long max_batch)
+                            struct scan_control *sc, int swappiness,
unsigned long max_batch,
+                            bool cmd_proactive)
 {
        int type;
        unsigned long batch, scanned, total_scanned =3D 0;

+retry:
        /*
         * Scan both types with the given budgets; the caller checks if
         * reclaim is satisfied after each pass.
@@ -5191,8 +5197,13 @@ static long evict_folio_lists(unsigned long
nr_to_scan[], struct lruvec *lruvec,
                        continue;

                batch =3D min(nr_to_scan[type], max_batch);
-               scanned =3D evict_folios(batch, lruvec, sc, type, swappines=
s);
+               scanned =3D evict_folios(batch, lruvec, sc, type,
swappiness, cmd_proactive);

+               /* if it is a debugfs proactive reclaim, lend budget
to the other type */
+               if (!scanned && cmd_proactive && swappiness &&
swappiness <=3D MAX_SWAPPINESS) {
+               if (!scanned && cmd_proactive && swappiness &&
swappiness <=3D MAX_SWAPPINESS) {
+                       nr_to_scan[!type] +=3D nr_to_scan[type];
+                       goto retry;
+               }
                nr_to_scan[type] -=3D min(nr_to_scan[type], scanned);
                total_scanned +=3D scanned;
        }
@@ -5240,7 +5251,7 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)

                orig_anon =3D nr[LRU_GEN_ANON];
                orig_file =3D nr[LRU_GEN_FILE];
-               scanned =3D evict_folio_lists(nr, lruvec, sc,
swappiness, MIN_LRU_BATCH);
+               scanned =3D evict_folio_lists(nr, lruvec, sc,
swappiness, MIN_LRU_BATCH, false);

                if (should_abort_scan(lruvec, sc))
                        break;
@@ -5896,7 +5907,7 @@ static int run_eviction(struct lruvec *lruvec,
unsigned long seq, struct scan_co
                lru_gen_balance_scan(lruvec, sc, swappiness,
                                     nr_to_reclaim - sc->nr_reclaimed,
nr_to_scan);

-               if (!evict_folio_lists(nr_to_scan, lruvec, sc,
swappiness, MAX_LRU_BATCH))
+               if (!evict_folio_lists(nr_to_scan, lruvec, sc,
swappiness, MAX_LRU_BATCH, true))
                        return 0;

                cond_resched();

However, this would make the code much more complex and
probably isn't worth the effort for a rarely used debugfs
interface, especially given that we already have proactive
reclaim interfaces for both memcg and nodes.

So perhaps we should simply set .priority =3D DEF_PRIORITY
and live with the two less significant issues described
above.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D14
