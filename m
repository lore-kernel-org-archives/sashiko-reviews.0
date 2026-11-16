Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820427;
	b=BkMjEB3ECTZta6AuQkt9UiMgbaO/d6IySpySbIZiIlYzuaUURdx8tCCxowOg3LBnTGoZ
	 3v9fjEnBazXuS9GONy5cqXMwSz/2SX2FwJ5JPzsjneK9TfNM81BSFz/le3H3cBmbEUlf/
	 roYpPpwnz2MJXlgxrxNDpOo8jsUJBEyn5lZ5YUddIweN7sE3VvF/2q0GKWQOaSM6ea+u/
	 wNLeaWBzMVbMecmnR/KB2u7QW3QnkarfAZq2Trh+uNduDfZI7d5M0F7M5R93e/5sDRP/b
	 52FmRZPkDD2iJxziPRwqx6kMY2CV7E42d/EublLk+X3ycvama9E9f0PYyPt7kxGYLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820427;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uBI20GIoHIeO9nJKpZQ+Icy1CTlU696c8C2pcMHc3vs=;
	b=QUYqLxdrBvtgJTN1AAqkPVEwlTL/Y7IvQsaqYvRZiRoxn1go+tLv/nj7ZDZe61VdAscL
	 eY/pxadGjkbqplX5kC9Avn5UpCUHCaX5JsPRjwSp/5c8hzsBB6VDiKFbQeemiObC5S49o
	 KdREV7FLyM5Buh93jgnoD3EbNY6yJacxSI97A+a8VyMcVfmA3VXdYz/6Cou0GtYk0URBO
	 +AmTpCVQWHV4/7lYWPXC0B/4IsmN2+uVIjNfkBRzL8+WDj4i/yv2WrYrMdp9tZD6x0eur
	 R5zIq5SHN0Cc60WONyY5VuLiOANE4MoJ9yZAn2J0XEBCuggpz4gBVUngElvWioS2h7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ry7BddNF;
	arc=none smtp.remote-ip=95.215.58.108
Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A3606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 09:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2A3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ry7BddNF
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vkoE6KORQMAFzwcm5haqOvH3H10zW833YOviF5z+zOY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794820424; v=1; x=1795425224;
 b=Ry7BddNFgm8Y2QWK1Gj/bejhBQT1hhYfcDVVFQBZygeYcWMGqLTFBGQYxdLJJu/vXqd+pl/n
 VgdKTw2X6CyMIck031myc1U6Czl7aI4nakTa9AI2uTmVGgk0niBVJpEl78lcKtBFQAyC8qWZ1Mx
 gduMQpQ4FlDWLBFGVTWBcIA0=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 79afc9c9dc722c5a;
	Mon, 16 Nov 2026 09:13:44 +0000
X-Mizu-Trace-ID: 79afc9c9dc722c5a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 17:13:36 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org,
	kasong@tencent.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	Baoquan He <hebaoquan@kylinos.cn>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 3/4] mm/mglru: skip cold PUD subtrees during aging
Message-ID: <avrJQIyQXf9zmeo3@fedora>
References: <20261113084953.412919-1-baoquan.he@linux.dev>
 <20261113084953.412919-4-baoquan.he@linux.dev>
 <sashiko-outbox-214125@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-214125@kernel.org>

On 11/14/26 at 03:42am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] mm/mglru: walk_pmd_range() marks PUD young on non-leaf PMD
>   accessed bit
> - [Medium] mm/mglru: walk_pmd_range() marks PUD young for THP before
>   memcg and notifier checks
> - [Medium] mm/mglru: PUDs with PMD-mapped THPs are suppressed
>   indefinitely once skipped

Thanks for the review. All three points are real. The third one is the most
important. Will Changes in v4. Please see the inline reply for each item.

> --
> 
> commit 31572808d36982038b4b945e98794001c99a5d21
> Author: Baoquan He <hebaoquan@kylinos.cn>
> 
> mm/mglru: skip cold PUD subtrees during aging
> 
> This commit introduces a PUD-level Bloom filter keyed by (mm, PUD-aligned
> address) to skip PUD subtrees that had no young pages in the previous
> generation during MGLRU aging walks, and updates it from the rmap feedback
> path in lru_gen_look_around().
> 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index a0332586b3d83..79d533ebfd108 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> 
> [ ... ]
> 
> > @@ -3730,10 +3732,11 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
> >  	*first = -1;
> >  }
> >  
> > -static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> > +static bool walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  			   struct mm_walk *args)
> >  {
> >  	int i;
> > +	bool young = false;
> >  	pmd_t *pmd;
> >  	unsigned long next;
> >  	unsigned long addr;
> > @@ -3770,8 +3773,10 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  
> >  			walk->mm_stats[MM_LEAF_TOTAL]++;
> >  
> > -			if (pfn != -1)
> > +			if (pfn != -1) {
> >  				walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> > +				young = true;
> > +			}
> >  			continue;
> >  		}
> 
> [Severity: Medium]
> Does setting young = true as soon as get_pmd_pfn() != -1 mark the PUD young
> before checking memcg ownership or MMU notifiers?
> 
> get_pmd_pfn() only checks that the PFN is on pgdat and that pmd_young() or
> mm_has_notifiers() is true, while the memcg check in get_pfn_folio() and
> the notifier young check in pmdp_test_and_clear_young_notify() are deferred
> to walk_pmd_range_locked().  A PUD with PMD-mapped THPs belonging to
> another memcg on the same node, or cold THPs in an mm with MMU notifiers,
> will therefore be recorded in BLOOM_FILTER_PUD on every generation and
> never skipped.

Yes, that is too early. get_pmd_pfn() only checks that the PFN is on this
node and that the accessed bit is set. The memcg check and the notifier
young check happen later, inside walk_pmd_range_locked().
  
Will fix in v4 by making walk_pmd_range_locked() return true only when it
found a young entry for this lruvec, and using that value here:

> 
> > @@ -3781,6 +3786,7 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  				continue;
> >  
> >  			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> > +			young = true;
> >  		}
> >  
> >  		if (!walk->force_scan &&
> > @@ -3793,6 +3799,7 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  			continue;
> >  
> >  		walk->mm_stats[MM_NONLEAF_ADDED]++;
> > +		young = true;
> >  
> >  		/* carry over to the next generation */
> >  		update_bloom_filter(mm_state, BLOOM_FILTER_PMD, walk->seq + 1, pmd + i);
> 
> [Severity: Medium]
> Should young = true be omitted from the non-leaf pmd_young(val) block?
> 
> When should_clear_pmd_young() is true, setting young = true there happens
> before checking BLOOM_FILTER_PMD or calling walk_pte_range().  Because CPU
> page table walks set the accessed bit on non-leaf PMDs regardless of which
> node or memcg owns the underlying PTEs, any accessed non-leaf PMD will
> cause walk_pmd_range() to return true and carry the PUD into
> BLOOM_FILTER_PUD even when every PMD in the subtree fails the PMD Bloom
> filter or has no folios in walk->lruvec.  The young = true after
> walk_pte_range() already handles non-leaf PMDs that pass suitable_to_scan().

Agreed, will remove. The accessed bit of a non-leaf PMD says nothing about which
lruvec owns the pages, and the first walker of a generation clears it. A
second walker (another node, or kswapd) then sees it cleared and skips the
whole PUD, so the skip depends on walk order instead of on the lruvec.
 
In v4 a PUD is marked young only when walk_pte_range() reports young leaves for
this lruvec, or when a young huge page of this lruvec is found. The batched
flush below contributes too, because batched huge pages are processed there:
 
   young |= walk_pmd_range_locked(pud, -1, vma, args, bitmap, &first);

> 
> > @@ -3802,6 +3809,8 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  
> >  	if (i < PTRS_PER_PMD && get_next_vma(PUD_MASK, PMD_SIZE, args, &start, &end))
> >  		goto restart;
> > +
> > +	return young;
> >  }
> >  
> >  static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
> > @@ -3812,6 +3821,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
> >  	unsigned long addr;
> >  	unsigned long next;
> >  	struct lru_gen_mm_walk *walk = args->private;
> > +	struct lru_gen_mm_state *mm_state = get_mm_state(walk->lruvec);
> >  
> >  	VM_WARN_ON_ONCE(p4d_leaf(*p4d));
> >  
> > @@ -3819,13 +3829,29 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
> >  restart:
> >  	for (i = pud_index(start), addr = start; addr != end; i++, addr = next) {
> >  		pud_t val = pudp_get(pud + i);
> > +		void *pud_key;
> >  
> >  		next = pud_addr_end(addr, end);
> >  
> >  		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
> >  			continue;
> >  
> > -		walk_pmd_range(pud + i, addr, next, args);
> > +		/*
> > +		 * Use (mm, PUD-aligned address) as the filter key instead of
> > +		 * the page table pointer. It is stable across the aging walk
> > +		 * and the rmap feedback path, and avoids walking the page
> > +		 * tables in lru_gen_look_around().
> > +		 */
> > +		pud_key = (void *)((unsigned long)args->mm ^ (addr & PUD_MASK));
> > +
> > +		/* Skip a subtree that had nothing young for this lruvec last gen */
> > +		if (!walk->force_scan &&
> > +		    !test_bloom_filter(mm_state, BLOOM_FILTER_PUD, walk->seq, pud_key))
> > +			continue;
> > +
> > +		if (walk_pmd_range(pud + i, addr, next, args))
> > +			update_bloom_filter(mm_state, BLOOM_FILTER_PUD, walk->seq + 1,
> > +					    pud_key);
> 
> [Severity: Medium]
> Once a PUD is absent from BLOOM_FILTER_PUD, can PMD-mapped THPs inside it
> ever be scanned by page-table aging again without force_scan?

Agreed, and this is the important one. For a PMD-mapped folio
folio_referenced_one() takes the pmdp_clear_flush_young_notify() branch and
never calls lru_gen_look_around(), so once a PUD is skipped nothing puts its
key back, until a forced scan or a new mm.
 
v4 will add the missing feedback. 

> 
> Previously, BLOOM_FILTER_PMD was checked after pmd_trans_huge() in
> walk_pmd_range(), so PMD-mapped THPs were never gated by a Bloom filter.
> Gating walk_pmd_range() on BLOOM_FILTER_PUD skips the entire PUD when
> pud_key is not present, and iterate_mm_list() clears the next generation's
> filter via reset_bloom_filter(mm_state, BLOOM_FILTER_PUD, walk->seq + 1).
> The only rmap feedback that populates BLOOM_FILTER_PUD is
> lru_gen_look_around(), which folio_referenced_one() only calls when
> pvmw.pte is non-NULL:
> 
> mm/rmap.c:folio_referenced_one() {
>     ...
> 		if (lru_gen_enabled() && !lru_gen_switching() && pvmw.pte &&
> 		    pte_present(pteval)) {
> 			if (lru_gen_look_around(&pvmw, nr))
> 				referenced++;
> 		} else if (pvmw.pte) {
>     ...
> 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> 			if (pmdp_clear_flush_young_notify(vma, address,
> 						pvmw.pmd))
> 				referenced++;
>     ...
> }
> 
> For PMD-mapped THPs (pvmw.pte == NULL), rmap eviction checks never update
> BLOOM_FILTER_PUD, so any PUD that goes cold for one generation or receives
> newly faulted or collapsed THPs after the initial force_scan will be
> skipped by aging indefinitely.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113084953.412919-1-baoquan.he@linux.dev?part=3
