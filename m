Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198236;
	b=nWaNgTgBDGFE6YnE5VfIr2yvkanl4GgIpq9BpEFm5BVjH6gSx/WGdrbLuINmKvFVJ2jq
	 ziOptYq9EceqDsikkAC6ZoSPeDzETTV++kb+/Ocqaue+BXS8r/9y8JoBVZdUf7q0e2EIM
	 ZVjMLSP4/8uVzK6LnNmJ0IyVd+1JzVMH++2A9+tAezNLh4hXT63bxgRCPZ0dWh9j27moW
	 x4Doc0928TsffjCLWH+eZTZ+xjb3BsSAi3+dqEn4uNb55lgjaSmrk/DPOJtWt2wzAGin/
	 ngxofzMh0Hfb/xExviB39uJ5suQ6NvsmBCwPnvEFN0zVAt0/ld6LSyb+C1XoD033kBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198236;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WGU9Dd8X9NzN2gOkVbewP2kXsl+Worp16R1bZIHkL+4=;
	b=dwJNDsVYEzYczoojOzuofNl6FWJxcyOVoDFJrylj/omQj3MPmZjddmUQcnbTnqf2tkPv
	 DGsE3S8Dgvr2IEUMbcNCAOzhYegt3l+VCfmEDA74UyeuAHups6Z2gl4jsHfj1LR/NfTpK
	 dY0+K5+ryuygzuwnnnXg/mVxLwH3ZTonfvk647U6YE16y7hTtEjpVlgyC7zXii83px4ge
	 WuqZokQRXpU5GSEibeWLx2Xyi6UqX0T9cBy0d5GEO1eE6M4ilYXRkdRkix1sxrioSV/D4
	 ZGj8aU1H9Vdu16nIoQVa5z5trwjOIJ2LjJWigkaWMFnr1RCSzfKA53YtGWA7JgKTviA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTO+k2yk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA8606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTO+k2yk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE111F0089F;
	Mon,  9 Nov 2026 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794198235;
	bh=WGU9Dd8X9NzN2gOkVbewP2kXsl+Worp16R1bZIHkL+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cTO+k2ykCQ7JYXsgkXvMdub0CRpfhpkglaSibhmXltkNUZul5Zj2H8bY16Ck+OQLx
	 7lKarH/apQ71G/a44jkmMm8RLENbUNV9hUvXBENcqqaDaZ0YPS3gOrNRo1qWiV1191
	 ++shIm2/f3arcZgbOgY76LCNhr8UxPTl774dKsxQHUYb9BgOYxh3IDJsgd4vcYDrA/
	 KWndcQ/nFHyvugIVE4mHwwQ0LqDtDNdiHsgSx5LHftwGYX/gs4kxsRwi0ADZTBWzt7
	 MJ3V27KNeNBBabg0F9HetmGx4I8ScrwJBXHkAMgklNuUZYV5MBU2I4lqz7ba8/vEVq
	 Lra90H9WYpANg==
From: Barry Song <baohua@kernel.org>
To: kunwu.chan@gmail.com
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	david@kernel.org,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-mm@kvack.org,
	liuxiang.277@bytedance.com,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	sashiko-reviews@lists.linux.dev,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn
Subject: Re: [RFC PATCH v5 05/14] mm/mglru: skip zones above reclaim_idx instead of rotating them
Date: Mon,  9 Nov 2026 12:23:48 +0800
Message-Id: <20261109042348.51689-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAN_Opa-AScm9=EeXO_Uy8VjbQ=bqY9P++rFP8H1RhUB4dOt6xw@mail.gmail.com>
References: <CAN_Opa-AScm9=EeXO_Uy8VjbQ=bqY9P++rFP8H1RhUB4dOt6xw@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 2, 2026 at 6:00 PM KunWu Chan <kunwu.chan@gmail.com> wrote:
>
> On Sun, Oct 25, 2026 at 12:19 AM Kairui Song <ryncsn@gmail.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 6:03 AM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [High] mm/mglru: pinned min_seq in higher zones stalls aging in scan_folios()
> > > --
> > >
> > > commit 1b2f683d6b8bd1e171eb9677315ba8a3d9431b9b
> > > Author: Kairui Song <kasong@tencent.com>
> > >
> > > mm/mglru: skip zones above reclaim_idx instead of rotating them
> > >
> > > This commit restricts scan_folios() and lruvec_populated_min_seq() during
> > > eviction to zones at or below sc->reclaim_idx, and removes the ineligible-zone
> > > rotation branch from sort_folio(). try_to_inc_min_seq() continues to check all
> > > zones up to MAX_NR_ZONES before advancing min_seq.
> > >
> > > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > > index a365a4bc8c988..09ea72b354a56 100644
> > > > --- a/mm/vmscan.c
> > > > +++ b/mm/vmscan.c
> > > > @@ -4132,7 +4132,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
> > > >
> > > >  /* Similar to lruvec_evictable_size, return the oldest populated seq of the type */
> > > >  static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, int type,
> > > > -                                           unsigned long max_seq)
> > > > +                                           int zone_limit, unsigned long max_seq)
> > > >  {
> > > >       int gen, zone;
> > > >       unsigned long min_seq;
> > > > @@ -4143,7 +4143,7 @@ static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, int type,
> > > >       min_seq = READ_ONCE(lrugen->min_seq[type]);
> > > >       while (min_seq <= max_seq) {
> > > >               gen = lru_gen_from_seq(min_seq);
> > > > -             for (zone = 0; zone < MAX_NR_ZONES; zone++) {
> > > > +             for (zone = 0; zone < zone_limit; zone++) {
> > > >                       if (!list_empty(&lrugen->folios[gen][type][zone]))
> > > >                               return min_seq;
> > > >               }
> > > > @@ -4166,7 +4166,7 @@ static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
> > > >       /* Requires at least MIN_NR_GENS gens for basic functionality */
> > > >       seq = lrugen->max_seq - MIN_NR_GENS;
> > > >       for_each_evictable_type(type, swappiness) {
> > > > -             min_seq[type] = lruvec_populated_min_seq(lruvec, type, seq + 1);
> > > > +             min_seq[type] = lruvec_populated_min_seq(lruvec, type, MAX_NR_ZONES, seq + 1);
> > > >               if (min_seq[type] > lrugen->min_seq[type])
> > > >                       seq_inc_flag = true;
> > > >       }
> > >
> > > [ ... ]
> > >
> > > > @@ -4863,10 +4864,8 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
> > > >        * longer be promoted or protected, so just isolate them. The one
> > > >        * exception is lru_gen_reparent_memcg(), which is handled above.
> > > >        */
> > > > -     if (min_gen == max_gen) {
> > > > -             VM_WARN_ON_ONCE(zone > sc->reclaim_idx);
> > > > +     if (min_gen == max_gen)
> > > >               return false;
> > > > -     }
> > > >
> > > >       /* protected */
> > > >       if (tier > tier_idx || refs + workingset == BIT(LRU_REFS_WIDTH) + 1) {
> > > > @@ -4883,13 +4882,6 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_c
> > > >               return true;
> > > >       }
> > > >
> > > > -     /* ineligible */
> > > > -     if (zone > sc->reclaim_idx) {
> > > > -             gen = folio_inc_gen(lruvec, folio, min_gen);
> > > > -             list_move_tail(&folio->lru, &lrugen->folios[gen][type][zone]);
> > > > -             return true;
> > > > -     }
> > > > -
> > > >       return false;
> > > >  }
> > > >
> > > > @@ -4921,16 +4913,17 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> > > >                      struct scan_control *sc, int type, int tier,
> > > >                      struct list_head *list, int *isolatedp)
> > > >  {
> > > > -     int i;
> > > >       enum node_stat_item item;
> > > > +     int zone_idx;
> > > >       int sorted = 0;
> > > >       int scanned = 0;
> > > >       int isolated = 0;
> > > >       int skipped = 0;
> > > >       int gen, max_gen;
> > > > -     unsigned long min_seq;
> > > > +     unsigned long seq;
> > > >       unsigned long remaining = nr_to_scan;
> > > >       struct lru_gen_folio *lrugen = &lruvec->lrugen;
> > > > +     struct pglist_data *pgdat = lruvec_pgdat(lruvec);
> > > >       DEFINE_MAX_SEQ(lruvec);
> > > >
> > > >       VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
> > > > @@ -4942,24 +4935,22 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> > > >        * when under pressure to respect swappiness more and reduce IO cost.
> > > >        */
> > > >       if (sc->priority == DEF_PRIORITY)
> > > > -             min_seq = lrugen->min_seq[type];
> > > > +             seq = lrugen->min_seq[type];
> > > >       else
> > > > -             min_seq = lruvec_populated_min_seq(lruvec, type, lrugen->max_seq);
> > > > +             seq = lrugen->max_seq;
> > > >
> > > > -     gen = lru_gen_from_seq(min_seq);
> > > > +     seq = lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + 1, seq);
> > > > +     gen = lru_gen_from_seq(seq);
> > > >       max_gen = lru_gen_from_seq(max_seq);
> > > >
> > > > -     for (i = MAX_NR_ZONES; i > 0; i--) {
> > > > +     /* Scan eligible zones in descending order. */
> > > > +     for (zone_idx = sc->reclaim_idx; zone_idx >= 0; zone_idx--) {
> > >
> > > [Severity: High]
> > > During zone-constrained reclaim in mm/vmscan.c (where sc->reclaim_idx is below
> > > MAX_NR_ZONES - 1 and zones above sc->reclaim_idx are populated, such as
> > > GFP_DMA32 reclaim with a populated ZONE_NORMAL or GFP_KERNEL reclaim with a
> > > populated ZONE_MOVABLE), can keeping MAX_NR_ZONES in try_to_inc_min_seq()
> > > while removing the ineligible-zone rotation from sort_folio() stall aging and
> > > memcg rotation?
> >
> > Yeah it can stall aging, but this series lifted the restriction of
> > MIN_NR_GEN on eviction, and eviction will start the the last populated
> > gen of a zone instead of min_seq, and we have more proactive aging
> > when the gens are imbalanced, so this won't be a problem, it won't
> > cause OOM. I'm not sure if it will cause any performance issue though,
> > if this is concerning we can keep the old behavior, or trigger aging
> > when the populated gen that satisfy a reclain is below (MIN_NR_GEN -
> > 1) or imbalanced, this seems a better solution to me, still avoid a
> > lot of redundant work while ensure there is no reclaim effenciency
> > issue. We already have the right helper to do so in this series, so
> > seem not hard or dirty.
>
> Thanks, that makes sense regarding OOM.
> Could lru_gen_imbalanced() trigger aging soon enough when few
> populated generations are eligible for reclaim, or could reclaim
> efficiency suffer while min_seq remains pinned?
>
> Would the additional trigger you suggested for this case be worthwhile?

Hi Kunwu,

Thanks very much for reviewing this series.
I'd really appreciate it if you could keep going :-)

I'm trying an incremental patch like this while rebasing the
series on top of mm-new. It may resolve the problem.

diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
index 565c56428364..9dafdb5bd3ce 100644
--- a/mm/trace_vmscan.h
+++ b/mm/trace_vmscan.h
@@ -488,9 +488,9 @@ TRACE_EVENT(mm_mglru_aging,
 			unsigned long seq = max_seq - MAX_NR_GENS + 1 + i;
 
 			__entry->nr_anon[i] =
-				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq);
+				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq, MAX_NR_ZONES);
 			__entry->nr_file[i] =
-				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq);
+				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq, MAX_NR_ZONES);
 		}
 		__entry->nid = lruvec_pgdat(lruvec)->node_id;
 		__entry->priority = sc->priority;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4ca04812eea3..fa0245a07caa 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4217,7 +4217,7 @@ static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc
 		if (type == LRU_GEN_ANON && !can_reclaim_anon_pages(memcg, nid, sc))
 			continue;
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			nr[type] += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 }
 
@@ -5082,9 +5082,9 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_type(type, swappiness) {
 		unsigned long seq;
 
-		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
 		for (seq = min_seq[type]; seq < max_seq; seq++)
-			old[type] += lruvec_gen_size(lrugen, type, seq);
+			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 
 	/* the vast majority of pages sit in the youngest gen */
@@ -5835,7 +5835,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
 			char mark = full && seq < min_seq[type] ? 'x' : ' ';
 
 			seq_printf(m, " %10lu%c",
-				   lruvec_gen_size(lrugen, type, seq), mark);
+				   lruvec_gen_size(lrugen, type, seq, MAX_NR_ZONES), mark);
 		}
 
 		seq_putc(m, '\n');
diff --git a/mm/vmscan.h b/mm/vmscan.h
index c6b583fc7493..2599d7c614ac 100644
--- a/mm/vmscan.h
+++ b/mm/vmscan.h
@@ -119,12 +119,13 @@ struct scan_control {
 #ifdef CONFIG_LRU_GEN
 /* The number of pages of @type in the generation @seq, summed over all zones */
 static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
-					    int type, unsigned long seq)
+					    int type, unsigned long seq,
+					    int max_zone)
 {
 	int gen = lru_gen_from_seq(seq);
 	unsigned long size = 0;
 
-	for (int zone = 0; zone < MAX_NR_ZONES; zone++)
+	for (int zone = 0; zone < max_zone; zone++)
 		size += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
 
 	return size;

>
> Thanks,
> Kunwu

Thanks,
Barry
