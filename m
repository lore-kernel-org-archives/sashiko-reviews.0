Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792891876;
	b=ZRjds7CAznkdIaqqVeRg/M1OuriC6cSP/ZSYkouB+tmaCRpCyaQ268TW7tXAcWgHBV9h
	 6tOdGid0d4SJoJ+k20xvz7ESd4z3SDT1QuJ8SUCZqJuhQVTXLXAWjH3RTCaWdkZ8yxRmI
	 JWyrMCfs5FOsPLJ1vd3Q3eu5vaOLLt7RoNykib3ZNlkOehQzInWtGUQeG/FqsNWiW9NMc
	 nr0ext8AJmgm4kO3M8pegAtsruW8djhHFNb0j4ZI2pV0Pg91MdC3ILMPYmwHZ0c9OQA2i
	 3BFq/pc1WrKkv+VTwnKRMiiFZ5lky9BuNOrMmUv2iMMm/tjQ7im1RG5R0xco7HrnuFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792891876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NjK0kx7CGIZMdCtURm6ydpz5eb+27HR4F80VrSkDz3k=;
	b=Uu4c8d6HIXPQ9Z/4dB+UDFyZJMCj7UpilBDRFhSnla4OrP7bWLpADYko4XzsNPNaMRZ5
	 Ua5lBAvhdGkfRyMjRMdqKR54jLPOAuukAOSDD08uaQiWo4QmVPstWWrCF3IyXPkldZ4C7
	 CF9r4twe4PfNV+Xnn+kJ1tiwyFP1RlOCRrWXfCQb/0WU7M0lBjaO7r+ziCn3We7gmOwhC
	 LBmjy7UhTmqEYt0FUA8KuiAHB7ffc8T1lGLLULPlBF8MmpN8Ra6IuaLgeijmwueiRdlV8
	 whr6u9GndwvzqeBrbKDO9p1jvyNnwtxl+LeDstdojxN2CHclbMVIIj0PGAaGtkBg0fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PAq8YN3V;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778A606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 01:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9778A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PAq8YN3V
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea138a3497so12229315ad.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 18:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792891875; x=1793496675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjK0kx7CGIZMdCtURm6ydpz5eb+27HR4F80VrSkDz3k=;
        b=PAq8YN3VHf2OfXjnS2ULwsZpGHNugJ6D9YRKJxOI7Fp4RedufVi9cA+0Tf+W4pTpU0
         +TBdDJL0ETRqwgUWi4DgtqTHytvOd8ycf8/6XZ2juldJHMqdv9kOsKDgWQbDGLwz5Upl
         so3h0a34e0iKCTMA1mXeppfw7DtBbDCJeKs8aONb9t2pdGTQSZi7Jok7O/FCX4hy8z4J
         ceXXgfpCqBUIZGhrzU35XAwPM3B7IbVxvjrwNsReANr3df20o/1iAS8VANTZlF4i1SRZ
         pY9+nei2qCNB+RZ7o2IP9NKjqeIfFHJFqTZUjZeqJfmtVlXOr9pERsUqnTHP3UX09lM+
         BrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792891875; x=1793496675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjK0kx7CGIZMdCtURm6ydpz5eb+27HR4F80VrSkDz3k=;
        b=NnzyjerwD3+KNce0t3OkUZNiSiJgc//sNKlNoY+/omTCMWPYuWl7EN63UFQBEPPSMh
         K3eKX3+QC772/yhiffOU++mqDSWdJc4BPCTHScOqbHhll8CaOLm8ZKwbvKJUd1KDeNva
         JoHlJkqoDw+SsOjJSzficdLkGrm5bn16+mQCAD9fVmVZ9SjGQOTFnQacJGcGkISwP7KV
         JHlIACCmLgCy3UTX7W4UUtkmr4N6lSXSWEUnZBe4wAMK/EUYfcn5iumZJYyU0Co22LzG
         xuy5PytIE1oAS75Ypg/HOI7OMjB7RBGEBi8B4OH6jauuSSGjspuZ9pCVR+C1cRrVUf2e
         15Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzBwB0+5cllbJquYEy3j3GRO31fCVuRxh18qNRE/Nzeq7krDR0llyexoifFmyVwAGOskbEzPGgQKxtsGF44fNU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAFBAkmAjNYwX8bxwEPvs6AZFxrDNL5ITs0iFqqqceLywBJft2
	ABO3NmhcIbDQK4d60P9NQFJi4LUedaUGxlEqCCEQTY7tCT4KgpgmjfE8
X-Gm-Gg: AYBFou2z5VhL0s3v1HH8UlkQwGxpnCgyTjRclb+uZ0k2VPzzxrLyA26qfdhZtg0zDpP
	UdydaGA5Hhr3x1zrH6BtjhwbUzguAyt4ROaJw1Bc+A4xUWoNYpk88UzAvkhQyjkd+W5EitNzjr6
	XmvGiL+cz58m8ZmJ6VYZicpbDmVaZJCbGPiQ6ASE46sOlqlu9CRoDghu24E8aNZXr58h2jBvTqk
	I+3CfrJiGy0dh3qW2ZhEwWmAa9YaCB5KhdAzW5mXWilzQmlTxzWD3+FLRmZuT90xuuVj0ZHCbaj
	Tih3+2HC3mOdLIJNHfz7y2VeX176QW1B5ZErS2BcRWiBe9jDfPdPG938I6IbbvinZgDpjdpDQOT
	X9CvAfgstRXkHTBWuQ33DFNkMqCukYDE14ROezlH4uAQaWl1tIWdjKlxWPa3NxXzTxLNFtNBT6I
	a3teLCJnm1r1uUBV0BrbZJd3ueK+QUnJpt1JVcm6mQS94QwtqEvIRe/xFfjsZOu/xbcqiaNshBS
	OaGrslbM9V1g6+pMRpGW8i2lFBRoXNhO7w+IKhqAXcXZfbNPcA3o08jstDCZ2/x3JR3FZ3clpo=
X-Received: by 2002:a17:903:15c7:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2ea9c87defamr24585005ad.31.1792891874848;
        Sat, 24 Oct 2026 18:31:14 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c00sm7197805ad.45.2026.10.24.18.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 18:31:14 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	david@kernel.org,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
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
Subject: Re: [RFC PATCH v5 14/14] mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation
Date: Sun, 25 Oct 2026 09:31:03 +0800
Message-Id: <20261025013103.2742885-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-183280@kernel.org>
References: <sashiko-outbox-183280@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have checked the two sub-issues separately. Both issues are valid and
the root cause is the same: patch 14 skips anon scanning but leaves
swappiness non-zero, so every path that still treats anon as evictable
(scan budget, aging, lruvec_is_sizable()) misbehaves.

> [High] unclamped scan budget on early return in lru_gen_balance_scan()

Confirmed. With 1 <= swappiness <= MAX_SWAPPINESS and if one of the type's 
nr is 0, the early return left the other type at its full unscaled evictable
size, bypassing priority scaling, memory.low protection and nr_to_reclaim.
Note this is not specific for GFP_NOIO, an lruvec that naturally has only
one type has the same problem.

> [Medium] inconsistent swappiness state when anon reclaim is skipped
> Would checking can_reclaim_anon_pages() in get_swappiness() ... avoid both?

Confirmed for both sub-issues, stalled aging via evictable_min_seq(), and
lruvec_is_sizable() counting unreclaimable anon.

Rather than forcing swappiness to 0 in get_swappiness() (which, as Barry
noted in [1], wrongly allows anon cold/hot inversion for the temporary
GFP_NOIO case), I keep swappiness not changed and fix the evictable view at
its source, lruvec_evictable_size():

1. It now filters out anon here when it cannot be reclaimed (e.g. GFP_NOIO
   with low swapcache), so nr[LRU_GEN_ANON] is 0 for all consumers. This
   drops the per-caller zeroing and lets lruvec_is_sizable() ignore
   unreclaimable anon.

2. lru_gen_balance_scan() clamps the remaining type to total_scan before
   the single-type early return.

3. should_run_aging() forces aging when file gens run low and anon is
   unreclaimable, so a stalled min_seq[LRU_GEN_ANON] no longer blocks aging.

Proposed fix on top of patch 14:

[1] https://lore.kernel.org/lkml/20261022102726.56682-1-baohua@kernel.org/

---
 mm/vmscan.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index d72a5aef3a0f..32bd9c0fef5d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4350,12 +4350,14 @@ static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
 	return size;
 }

-static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
-				  unsigned long nr[])
+static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc,
+				  int swappiness, unsigned long nr[])
 {
 	int type;
 	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	int nid = lruvec_pgdat(lruvec)->node_id;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);

@@ -4363,6 +4365,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 	nr[LRU_GEN_FILE] = 0;

 	for_each_evictable_type(type, swappiness) {
+		if (type == LRU_GEN_ANON && !can_reclaim_anon_pages(memcg, nid, sc))
+			continue;
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
 			nr[type] += lruvec_gen_size(lrugen, type, seq);
 	}
@@ -4374,7 +4378,7 @@ static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);

-	lruvec_evictable_size(lruvec, swappiness, sizes);
+	lruvec_evictable_size(lruvec, sc, swappiness, sizes);
 	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];

 	/* whether the size is big enough to be helpful */
@@ -5058,18 +5062,17 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
 	u64 anon_weight, file_weight;
 	int size_bias;

-	if (swappiness <= MIN_SWAPPINESS) {
+	if (swappiness <= MIN_SWAPPINESS)
 		nr[LRU_GEN_ANON] = 0;
-		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
-	}

-	if (swappiness == SWAPPINESS_ANON_ONLY) {
+	if (swappiness == SWAPPINESS_ANON_ONLY)
 		nr[LRU_GEN_FILE] = 0;
-		nr[LRU_GEN_ANON] = min_t(u64, total_scan, nr[LRU_GEN_ANON]);
-	}

-	if (!nr[LRU_GEN_ANON] || !nr[LRU_GEN_FILE])
+	if (!nr[LRU_GEN_ANON] || !nr[LRU_GEN_FILE]) {
+		nr[LRU_GEN_ANON] = min_t(u64, total_scan, nr[LRU_GEN_ANON]);
+		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
 		return;
+	}

 	for (int type = LRU_GEN_ANON; type <= LRU_GEN_FILE; type++) {
 		int hist = lru_hist_from_seq(READ_ONCE(lrugen->min_seq[type]));
@@ -5271,12 +5274,19 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 			     struct scan_control *sc, int swappiness,
 			     bool do_balance)
 {
+	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
+	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 	DEFINE_MIN_SEQ(lruvec);

 	/* have to run aging, since eviction is not possible anymore */
 	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_seq)
 		return true;

+	/* run aging when GFP_NOIO limits anon reclaim with few swapcache folios */
+	if (swappiness && min_seq[LRU_GEN_FILE] + MIN_NR_GENS > max_seq &&
+	    reclaimable_anon_is_low(memcg, pgdat->node_id, sc))
+		return true;
+
 	/* try to avoid aging, do gentle reclaim at the default priority */
 	if (sc->priority == DEF_PRIORITY)
 		return false;
@@ -5295,9 +5305,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 {
 	unsigned long total;

-	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
-	if (!can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->node_id, sc))
-		nr_to_scan[LRU_GEN_ANON] = 0;
+	lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
 	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];

 	/* Just scrape all pages calculated above if this memcg was deleted */
@@ -6050,7 +6058,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 		if (sc->nr_reclaimed >= nr_to_reclaim)
 			return 0;

-		lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
 		lru_gen_balance_scan(lruvec, sc, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);

--
2.34.1
