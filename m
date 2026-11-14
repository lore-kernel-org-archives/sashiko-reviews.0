Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794646152;
	b=BNKoqRrHXYV0Xrp2yhWLtMlQhCKSAMvChfaEjdVZhBONhFXk6eTkdnZblKtsMxfptlmO
	 fxItY4iIXJwRx9u3yrKbJ6FzoinDT+70sLC1Y21Kj0KKll01kxqRmUg0yYAq3e8F9+3zL
	 rh4anji5XJz3hCSjVLc+tsCbnBCvEx3whrUEpQT/SZlQ5ERxI6DSqEt1eKMoXvbIXgkX3
	 W+XEvPLhd0EfsB0xznFW95hhjj4YcBa6CvhSNTeAdT4U2A0+K6NxnIxaPDLqiTz+oJNWq
	 5XWePH1lHkE4ZIJDp3DrvJIhgzwcTba+NJCoa2H/CZDmgorHQR7SbU8aTdqGKoewjRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794646152;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xnvuXYTCU2NSamuN8vfT1YpmTCCtvj2XwFt5sGDZPi4=;
	b=5AhUcbkgMfE/GsqG7iK+ZS82ZvWURNoooWUOiRisvaBoambS22clxJtxRZw3G7LWTOpe
	 oI2pAfeiOejMm6V0iSp73F7h70hsJDBKE0lzVFC8+U/acjycIdzS7XpDkUJsl7yoz9Psc
	 B8yfXAnOq2xKHtedq3leMsloOQ/J12RIqTqxNj0jG7Mwi1QhwQnZty2uJWBY8lhFxzR5m
	 J6sID1mQnIHbcdAsYQNGaMfNWvvoquqmyW+7NSGUlkwsPvMyb8Qrvs2ll3YZ5jnkBArI4
	 +DuveJHL6uNGJfQyesBI/ZjwPpr2R8I3pcdAzQL4f0caeKR3rKg/dBMsTsKgzOIZU4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0VZj5yY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46850606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0VZj5yY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32A41F000C4;
	Sat, 14 Nov 2026 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794646151;
	bh=xnvuXYTCU2NSamuN8vfT1YpmTCCtvj2XwFt5sGDZPi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A0VZj5yYxTFWw+Q7Wmda6GrvPfZukqolGsmpDAwOQO1cq9wTU1d1BFAW34QFrlui9
	 A4znHw6mVAJskszTCfosSZDoUKuWEcLfXLhU2QT9G3fHZ0M95EEegh+jKqnAttna0Y
	 K76qdHnbfCqdiMYacbNZk32aaDpzqideXIOxsqcQtztPrP3k4pvyXhsqzs9dJDzJWb
	 XzgvigWhl+e+t2/xkeB5EG0jR4a6wptj4j27lkOQslmWUYynVDRBwnUqWngc5tou4e
	 rB5gC3JpJifxRXn5/Svi6Kxi3jfWhU9LagMCJsxZd1pZVv4BjceYBjQnt/AwIUB2zu
	 kuSpN0luH7nxQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: sashiko-bot@kernel.org
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-mm@kvack.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	sashiko-reviews@lists.linux.dev,
	shakeel.butt@linux.dev,
	sidchintamaneni@gmail.com,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn
Subject: Re: [PATCH v8 11/16] mm/mglru: Run aging when one type has no populatable folios
Date: Sat, 14 Nov 2026 16:49:03 +0800
Message-Id: <20261114084904.91735-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <sashiko-outbox-214030@kernel.org>
References: <sashiko-outbox-214030@kernel.org>
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

On Sat, Nov 14, 2026 at 10:02 AM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] mm/mglru: premature loop exit after aging in
>   try_to_shrink_lruvec()
> - [Medium] mm/mglru: late max_seq read in try_to_shrink_lruvec() causes
>   redundant aging
> --

We can add a bounded retry for this case, along with a concurrency
check to avoid concurrent aging mentioned above. Then I made the
patch as below:


Subject: [PATCH 11/16] mm/mglru: Run aging when one type has no populatable
 folios

We may have scan budget remaining for anon or file but no
folios in populatable generations to scan. In this case,
`scan_folios()` may waste time scanning that type while
the other type still has populatable folios.

Run aging in this case to make more folios populatable.
This also helps respect the scan budget distribution
determined by swappiness.

Move aging after eviction to detect a lack of scan progress
and avoid unnecessary aging when reclaim can already make progress.

To avoid excessive aging, allow no-populatable aging only once per
`try_to_shrink_lruvec()` invocation.

With extreme swappiness values such as 1 and 200, reclaim initially
focuses exclusively on the preferred type. Defer aging the lagging
type until sc->priority reaches DEF_PRIORITY / 2, where imbalanced
aging is allowed. This avoids unnecessary aging at extreme
swappiness values and has shown better performance in testing.

If evict_folio_lists() returns 0, retry once if aging has
successfully advanced the generation.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index cb806ce0a8e6..d68fc456ca7b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5198,9 +5198,15 @@ static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
 static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 {
 	unsigned long nr[ANON_AND_FILE];
-	bool need_rotate = false, should_age = false;
+	bool need_rotate = false, should_age = false, retried = false;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	/*
+	 * Avoid aging the lagging, unpreferred type at extreme swappiness;
+	 * rely on imbalanced aging once priority reaches DEF_PRIORITY / 2
+	 */
+	bool allow_no_populatable_age = (sc->priority < DEF_PRIORITY) &&
+		(swappiness > MIN_SWAPPINESS + 1 && swappiness < MAX_SWAPPINESS);
 
 	/*
 	 * Proactive reclaim initiated by userspace for anonymous memory only.
@@ -5218,22 +5224,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
 
 	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
+		unsigned long orig_file, orig_anon, new_seq;
 		DEFINE_MAX_SEQ(lruvec);
+		bool no_populatable;
+		long scanned;
 
 		if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
 			need_rotate = true;
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
-			trace_mm_mglru_aging(lruvec, sc, swappiness);
-			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
-				need_rotate = true;
-			should_age = true;
-		}
-
-		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
-			break;
+		orig_anon = nr[LRU_GEN_ANON];
+		orig_file = nr[LRU_GEN_FILE];
+		scanned = evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH);
 
 		if (should_abort_scan(lruvec, sc))
 			break;
@@ -5245,6 +5248,26 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		if (root_reclaim(sc) && should_age)
 			break;
 
+		/* Limit no_populatable aging to once per try_to_shrink_lruvec() */
+		new_seq = READ_ONCE(lruvec->lrugen.max_seq);
+		no_populatable = allow_no_populatable_age && max_seq == new_seq &&
+			((nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] == orig_anon) ||
+			(nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] == orig_file));
+		allow_no_populatable_age &= !no_populatable;
+		if (no_populatable || should_run_aging(lruvec, new_seq, sc, swappiness)) {
+			trace_mm_mglru_aging(lruvec, sc, swappiness);
+			if (try_to_inc_max_seq(lruvec, new_seq, swappiness, false))
+				need_rotate = true;
+			should_age = true;
+		}
+
+		if (!scanned) {
+			/* Retry once if aging advanced max_seq */
+			if (retried || new_seq == READ_ONCE(lruvec->lrugen.max_seq))
+				break;
+			retried = true;
+		}
+
 		cond_resched();
 	}
 
-- 
2.34.1


> In addition, calling evict_folio_lists() and should_abort_scan() before
> should_run_aging() causes scan_folios() at sc->priority <=
> DEF_PRIORITY / 2 to evict directly from max_seq before
> lru_gen_imbalanced() can age page tables to separate hot folios from cold
> ones, and skips aging altogether when the first batch satisfies
> should_abort_scan().

I think this is fine. We only reclaim a small batch of folios
(MIN_LRU_BATCH) before checking should_run_aging(). If reclaim
satisfies the request, we can avoid an unnecessary aging pass.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113185541.70203-1-baohua@kernel.org?part=11

