Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD461B4F1F
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106099; cv=none; b=fN9UCAgFlK2fLyxBDBGzExZu3lrn0xyR7nGSGDfFfhXOCUtQOyDrEoRmYlazWgQ/ZPrN6NEtSP4bitobo6Uuj+BomroVeunHB5LxX5jk7vRFSdhJMR+e7Rlxho7bh3wqzYNNuJoMl+Ei8IcQexvxwBLCR9tZLbTXtCHol78GziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106099; c=relaxed/simple;
	bh=xpZpRo9kAst4G2VSdSXHeQZv738WgcyhwaTTFUvOW/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGUI/dcJUuuxrRVA6lPdqhdMzpVvHiY4Af9l6cGmX9V+9eOGDzV2Sr/BNbMnU+r+UMjZ9131GSICSFWbsPkzene2VSlDRKUq0bpDeEnrZMa3LgLhFhn0uSuX2lmrykGqcyk4/1NFTcamhjXml9+h+XkEkON9499c/0jWZNcyYZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMFPlCh1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMFPlCh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277121F00893;
	Sat, 30 May 2026 01:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780106097;
	bh=Y7ozkZex+bV50kUNRMkm7+2KH20CKgbCsnGEOaAlWOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GMFPlCh10A0JGMVZGJw0xuqy6JOH52SutTzvx9GyhUBZhPT7xVboYfEuwKKvc3xgd
	 4QLqO+/p6tK00JETOPmdNzzgn9z139pqdoUInYHo0CxserQVltqyoDsDkQ1lr2wXla
	 Ook6qw45hkF3GotdW4i+dcQVMCCzUoP8hlV0XxFbkYepaDThahB3azmq6hxSXcNDo6
	 dvawg+pY5JdLY2sddrcmrRbeh8OZbdYO5YUF79yoECpYLE4dcA87wF5YQPQ5Ub2/hX
	 TKDAbHzxSxAdR1RoMsxFlISnkmSKFv/f58/BRzGw0aOyR9A+azxyRhkzbSqPEZBe0K
	 9Z7WyLY2KU6tg==
Date: Sat, 30 May 2026 01:54:55 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	Hao Jia <jiahao.kernel@gmail.com>, hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
Subject: Re: [PATCH v2 2/4] mm/zswap: Implement proactive writeback
Message-ID: <ahpDDwtBE-MG_lmO@google.com>
References: <20260525122242.36127-3-jiahao.kernel@gmail.com>
 <20260525135046.413871F000E9@smtp.kernel.org>
 <b1ca372d-530a-228f-c888-d6d04a5c133c@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1ca372d-530a-228f-c888-d6d04a5c133c@gmail.com>

On Tue, May 26, 2026 at 07:47:48PM +0800, Hao Jia wrote:
> 
> 
> On 2026/5/25 21:50, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > 
> > New issues:
> > - [High] Premature abort of proactive writeback due to flawed failure tracking across the memcg hierarchy.
> > - [Medium] zswap_proactive_writeback incorrectly returns 0 (success) on partial writebacks, breaking memory.reclaim semantics.
> > 
> > Pre-existing issues:
> > - [High] Double decrement of `nlru->nr_items` in `list_lru` when `shrink_memcg_cb` successfully writes back a page.
> > --
> > 
> > commit df0f700584d1310ed3a326adfe34b6963c7222ce
> > Author: Hao Jia <jiahao1@lixiang.com>
> > 
> > mm/zswap: Implement proactive writeback
> > 
> > This commit introduces a "zswap_writeback_only" key to the memory.reclaim
> > cgroup interface. It allows users to proactively write back zswap pages
> > to the backing swap up to a specified budget without invoking standard
> > memory reclaim.
> > 
> > > diff --git a/mm/zswap.c b/mm/zswap.c
> > > index 6519f646b496b..947507b9a1852 100644
> > > --- a/mm/zswap.c
> > > +++ b/mm/zswap.c
> > 
> > [ ... ]
> > 
> > > @@ -1684,6 +1684,144 @@ int zswap_load(struct folio *folio)
> > >   	return 0;
> > >   }
> > > +/*
> > 
> > [ ... ]
> > 
> > > +static long zswap_proactive_shrink_memcg(struct mem_cgroup *memcg,
> > > +					 unsigned long nr_to_write)
> > > +{
> > 
> > [ ... ]
> > 
> > > +		while (nr_scanned < nr_to_scan) {
> > > +			unsigned long nr_to_walk = min(ZSWAP_PROACTIVE_WB_BATCH,
> > > +						       nr_to_scan - nr_scanned);
> > > +
> > > +			if (signal_pending(current))
> > > +				return nr_written;
> > > +
> > > +			/*
> > > +			 * Account for the committed budget rather than the walker's
> > > +			 * actual delta. If the list is emptied concurrently, the
> > > +			 * walker visits nothing and nr_scanned would never advance.
> > > +			 */
> > > +			nr_scanned += nr_to_walk;
> > > +
> > > +			nr_written += list_lru_walk_one(&zswap_list_lru, nid, memcg,
> > > +							&shrink_memcg_cb,
> > > +							&encountered_page_in_swapcache,
> > > +							&nr_to_walk);
> > 
> > [Severity: High]
> > This is a pre-existing issue, but proactive writeback heavily triggers it on
> > demand. When shrink_memcg_cb() initiates a successful writeback, it calls
> > zswap_writeback_entry() which frees the entry. This removes the entry from
> > the list and decrements the LRU item count. Then shrink_memcg_cb() returns
> > LRU_REMOVED_RETRY.
> > 
> > Does __list_lru_walk_one() fall through to the LRU_REMOVED case and perform a
> > second decrement of nlru->nr_items? If so, will this double decrement corrupt
> > the global node LRU count and cause underflows?
> > 
> 
> As for this pre-existing issue, nlru->nr_items could indeed be
> double-decremented. IIRC, we don't have any code reading nlru->nr_items for
> the zswap LRU; zswap only uses list_lru_count_one() (l->nr_items), so things
> are working fine for now.


Yes, but it seems like we're misusing the list_lru infra here. I think
we shouldn't end up calling list_lru_del() from the list_lru_walk
callback?

Nhat, WDYT?

> 
> This issue wasn't introduced by this patchset, but it will cause problems if
> nlru->nr_items is ever used in the future. Therefore, I will try to address
> it in a separate patch later, or ask for help if needed.
 
