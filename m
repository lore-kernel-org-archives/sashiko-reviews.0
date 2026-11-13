Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546441;
	b=1jY5lMBxJ0UsBiAqqDrBR1eZtX8yXhjL2rJs/HWzQCidIBkes4J4LnNEmzjBN6KN+ovX
	 R6CNnzZMxS9zMOGYrTtnOQ8WFEfgYCMUgUj7pN/deD8HLjb1Qm+sDXENaPmbubE6YRYzi
	 vBRq+jPyn1CgB4nxNJfXebDsWZaFL4NYdbiq6EZSXVlhJuNZp6t5A9Ke9JKIN++Fi90hR
	 H0XZddJlReUVut37C9ywSk6SxttfpdZFwi1jjSuX6hLg9UTQcK2haPUPmuDN+rI0MPdYq
	 iG8+Ybg6KNZ6ycx9ajiExvsbvVJU74FA9dUeIEaZnUHh1JJ2ESgN/CGT9zXurxVTTlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pUQ12nlyx4HX6d0KqIKX5qaNGaPIm7bVzP7lJ+Kotz8=;
	b=kHfD3nWfwo2xaXfj6raNe7hVLSawQxQMStlQcWsnGoEMaxRqBW9pWw2bhmaFs5vebmwm
	 YuUZdM7WklNOWijO6HjLS0CFaJq/MMnnS8TJnoUqA5YzY+Y+3hBjqfYzsa7X5z9KEBsuS
	 kV5vDnll1XMNkIXJjxl9+Lm+hUAkCZm1H7ymAYox/MxxS+L3eqZ7TUPlN2DX37GVckbQo
	 U8pRMNlGJ1wjQ0Yj6c3X58RCmn1iz6t5uA0ndYXU6D0+nAKGLu2gbtQTsvNQdTuJEAqo7
	 uB1k073VC2HdekpTJczsDYcOdSELJ8d3OmKO2kNgajN4FChYYpC42vmCuXXmJVLNaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=e2k6z9Lg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F27606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 05:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=e2k6z9Lg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433531F000C4;
	Fri, 13 Nov 2026 05:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794546440;
	bh=pUQ12nlyx4HX6d0KqIKX5qaNGaPIm7bVzP7lJ+Kotz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=e2k6z9LgR9oEPd4b4CAv1/nPxjCbaaPq6uHd+OHl+JDwjVJ6KMeCVAgM2iMKW8Gf0
	 diIEpMxXxG5yBsJKLLQGiCf43wbn6qtsjyaeoUV1SshKo0jw0k5+2nx3LBBYxehU7z
	 +GBsnFx9muK6B7dQq8TSCnN3GYZaxEftInJ4vjQQ=
Date: Thu, 12 Nov 2026 21:07:19 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Dave Chinner <david@fromorbit.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, Qi Zheng
 <qi.zheng@linux.dev>, Meta kernel team <kernel-team@meta.com>,
 linux-mm@kvack.org, Chris Mason <mason@kernel.org>
Subject: Re: [PATCH] mm: list_lru: don't use a new memcg's lists for an
 offline memcg
Message-Id: <20261112210719.e843ee35b7fa69cf7710cfdf@linux-foundation.org>
In-Reply-To: <avZ3rcGiLnWS4qUq@linux.dev>
References: <20261112221248.3512447-1-shakeel.butt@linux.dev>
	<sashiko-outbox-211977@kernel.org>
	<avZ3rcGiLnWS4qUq@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 18:37:10 -0800 Shakeel Butt <shakeel.butt@linux.dev> wrote:

> > [Severity: High]
> > Does memcg_list_lru_allocated() also need to check mlru->memcg == memcg?
> 
> Yes this is correct and Andrew already have a fix for this.
> 

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm/list_lru: verify memcg owner before skipping allocation
Date: Thu, 12 Nov 2026 16:08:59 -0800

list_lru_from_memcg() rejects an entry at a reused kmemcg_id when it
belongs to another memcg.  memcg_list_lru_allocated() still treats any
entry at that index as a list for the requested memcg.  Its callers can
therefore skip the allocation of that memcg's ancestor lists.

With child C and parent P's lists both unallocated, a reader can retain C
while it is offlined.  If an unrelated new memcg reuses C's ID and
allocates its own list, the reader mistakes that entry for C's and skips
allocation of P's list.  Once the folio's objcg points to P,
deferred_split_folio() can add it to the root list.  If P later gets a
list, unqueue locks P's list while unlinking the folio from root's list,
which can corrupt that list under concurrent operations.

Require the entry to belong to the requested memcg before returning true. 
Hold RCU over the XArray load and owner comparison because this helper is
also called outside the folio fast path's RCU section.

Link: https://lore.kernel.org/20261112161502.18d9d72c0139b8f69bb88ff4@linux-foundation.org
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
Reported-by: <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-211977@kernel.org
Cc: Chris Mason <mason@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Qi Zheng <qi.zheng@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
---

 mm/list_lru.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--- a/mm/list_lru.c~mm-list_lru-dont-use-a-new-memcgs-lists-for-an-offline-memcg-fix
+++ a/mm/list_lru.c
@@ -568,9 +568,19 @@ void memcg_reparent_list_lrus(struct mem
 static inline bool memcg_list_lru_allocated(struct mem_cgroup *memcg,
 					    struct list_lru *lru)
 {
+	struct list_lru_memcg *mlru;
+	bool allocated;
 	int idx = memcg->kmemcg_id;
 
-	return idx < 0 || xa_load(&lru->xa, idx);
+	if (idx < 0)
+		return true;
+
+	rcu_read_lock();
+	mlru = xa_load(&lru->xa, idx);
+	allocated = mlru && mlru->memcg == memcg;
+	rcu_read_unlock();
+
+	return allocated;
 }
 
 static int __memcg_list_lru_alloc(struct mem_cgroup *memcg,
_

