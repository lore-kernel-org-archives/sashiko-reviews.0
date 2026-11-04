Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817698;
	b=UuvYmrPL+9gNmpQZuJYq0IHQXKS/bSeZW0L307JPtj1NAUtqUpxAyW/3SNwFLADs3Kke
	 T1FKwsRty9l2Y0G+aDLH429xt8V5KoIFAmXhgWCO/jLurXZkDvjes5xFS7sXKIsGotHt0
	 eiEHh4jDQj6bZbP7/qBQE5Obv3Cj4Qos9p8GnWJeAX6E/zHn3hXJmX3+OV63jtqaeJLS8
	 BM78Fr6DRt3pqb/IsfJGKORcpSr2dgiE+sU+gapwrFzkQlpGv0g85BaRzyb+u0SeC32n0
	 IbU2GGKSJr4lZX1up6tlIg8rUU0eHyiRZYhFozcCRIqYjQwtgnEXTdWRfjoykzN6nAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817698;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ofzQXuXOTQViNJOurFeSCLUNFQXJgGfKrYOJL/pV8Us=;
	b=i1FQgpmdDcUVhlYFBq48jVMIMEPQq8m3TpEpkhXTtr0tpfXK2ankk+eF/7kAseyRrnJJ
	 KYkwEFfPyDa70tE18JcsuszSSecqCdWlA1vPSlc5GxoQZl1HXAMGpHgdmoQFHwBoicjXI
	 PFigWVwlPjJWc4h+KjEWez1z6+s9EATD0+0YbwJepEst9Q+f5BzkW0BwwYjyO0MZ7a2ta
	 THAzok2F6+D8yt2R9TJlsFLyX6WkTWTRRJiaiPQ+r7OBxndCgIAbrZosWiOf+cn7khtrU
	 L3rrh/pMGfT/MF6OuHSKm/538V7RH/tXFNK7OLUaUKT2j86lkEbfEWPD3oVLeE/MwCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nbQjELS8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EED606A32E
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nbQjELS8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35931F000C1;
	Wed,  4 Nov 2026 18:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793817698;
	bh=ofzQXuXOTQViNJOurFeSCLUNFQXJgGfKrYOJL/pV8Us=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nbQjELS83W3qKX43J5wf4hpDwuuzTliSbkKHJoQ+eN6FRXXH36pnKjl+1wP16Z1hy
	 8foClGHpX8xG7k2xr3M4MJyZNkdn/s8EcM7J+ga/NymFpaON/J4cb2dcdJs6UrND9i
	 oORabaNb9ZlID6t7WDzhI4XnHBizI3x5OzMsRFDM=
Date: Wed, 4 Nov 2026 10:41:37 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, Liam R. Howlett (Google) <liam@infradead.org>,
 linux-mm@kvack.org, "Lorenzo Stoakes" <ljs@kernel.org>, "Chris Mason"
 <mason@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Andrew Ballance"
 <andrewjballance@gmail.com>
Subject: Re: [PATCH v2 1/3] maple_tree: Fix rcu reader NULL dereference
 after the tree is emptied
Message-Id: <20261104104137.2058705ac29734a7ab5666c1@linux-foundation.org>
In-Reply-To: <sashiko-outbox-194509@kernel.org>
References: <20261103020724.2614498-1-liam@infradead.org>
	<20261103020724.2614498-2-liam@infradead.org>
	<sashiko-outbox-194509@kernel.org>
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

On Tue, 03 Nov 2026 03:24:58 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] maple_tree: race in mas_prev_slot() when root is emptied after mas_rewalk()
> --
> 
> [Severity: Medium]
> Can this leave mas in an inconsistent state if the root is concurrently
> emptied between mas_rewalk() and the mas_root() read in mas_prev_no_node()?
> 
> When an RCU reader in mas_prev_slot() hits a dead node with save_point > 0
> and min == 0, it jumps to dead: and runs:
> 
>     mas_rewalk(mas, save_point)
>       -> mas_state_walk(mas)
>         -> mas_start(mas)
> 
> If the tree holds a single pointer at index 0 at that moment, mas_start()
> sets mas->status = ma_root and returns NULL because mas->index > 0.
> 
> Back in mas_prev_slot(), mas_prev_no_node() sees mas->status == ma_root,
> sets mas->index = 0 and mas->last = 0, and performs a second RCU read via
> mas_root(mas).
> 
> If a concurrent writer finishes emptying the tree (setting ma_root to NULL)
> before that second mas_root(mas) read, mas_prev_no_node() returns NULL.
> Because mas_prev_slot() only checks xa_is_node(entry) to detect a concurrent
> root change, it returns NULL with mas->status == ma_root, mas->index == 0,
> and mas->last == 0 instead of mas->status == ma_none and
> mas->last == ULONG_MAX.
> 
> Could this leave callers like mas_prev_range() or mas_find_range_rev() with
> a bogus [0, 0] range, or cause a subsequent forward walk on the same state
> to skip index 0?

I plan to squash this fix into the base patch ("maple_tree: Fix rcu
reader NULL dereference after the tree is emptied"):


From: Andrew Morton <akpm@linux-foundation.org>
Subject: maple_tree: fix reverse iterator state when the root disappears
Date: Tue, 03 Nov 2026 04:28:56 +0000

A reverse walk restarting from a dead node can observe a direct root entry
in mas_rewalk() and then an empty root in mas_prev_no_node().  The second
root read returns NULL, but leaves the iterator in ma_root with index and
last both zero.

Consequently, mas_prev_range() and mas_find_range_rev() can report an
empty range of [0, 0] instead of [0, ULONG_MAX].  A subsequent forward
range walk starts at index 1, omitting index 0 from the empty range.

Set ma_none and extend last to ULONG_MAX when the second root read returns
NULL.  Keep the existing encoded-node retry in mas_prev_slot() for a root
that has grown into a node again.

A deterministic userspace Maple test reproduces the stale state through
both reverse range APIs before this change and checks the full empty range
afterwards, including a subsequent forward walk.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/sashiko-outbox-194509@kernel.org
Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>
---

 lib/maple_tree.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--- a/lib/maple_tree.c~maple_tree-fix-reverse-iterator-state-when-the-root-disappears
+++ a/lib/maple_tree.c
@@ -3930,6 +3930,8 @@ static inline void *mas_next_no_node(str
 static inline void *mas_prev_no_node(struct ma_state *mas, unsigned long index,
 		unsigned long min)
 {
+	void *entry;
+
 	mas->index = 0;
 	if (mas_is_none(mas)) {
 		mas->last = ULONG_MAX;
@@ -3940,7 +3942,13 @@ static inline void *mas_prev_no_node(str
 	if (!index || min)
 		return NULL;
 
-	return mas_root(mas);
+	entry = mas_root(mas);
+	if (!entry) {
+		mas->status = ma_none;
+		mas->last = ULONG_MAX;
+	}
+
+	return entry;
 }
 
 /*
_

