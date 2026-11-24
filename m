Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509266;
	b=Y7F8ZDZsjaePObc6XBJT9Gej8UGnr289r8OIlWf76lse+k1NUO4vHee/4YQRqetRxao5
	 FYkJZbPSj5yReZRHIg72fONo+3iS6mx6e0V7e5jJ1M6S6pGWjnZLTm9tB83q6hrW1Rayi
	 g5zR56hlDZS/VPvjbNUvYQ+aQ6x1XzXPiIfwDgiNJUomKDvSQb9ENe7+gfgk5anWyzdi9
	 NmVyiIakX3qQKTgHR4tCb7tiGFnpiIE5d7UPe1m3weMvj8IU+rUj6EuG9E+kw5pcLBVZt
	 wA1DKrpCfc91eWdPWDWIGxo8uzQ6A/wsat/SGB8D14Z66UNvhxhaGswfI8v/79mmgVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509266;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KiVmxcFE4X1AS/dj3Y+jSeRqEGkTDYD4KqKrXIC4USs=;
	b=EwfkWisqnPYJMXzQmd3f9g4bmGa943Plruxo0EvFdW6X4fYNFac3mHEsqhXCCtgrT0t8
	 zOzkeu6IuIIWOve/1294VNb663ogGLKlkS7zT+Jn6X1e0onmz5WXtKf5GAkENptVThZrB
	 ktzKLVdGCXpSok5SmzVjJFkAfnDQ2e3Ezqg3mJ+LXJTnqTkJDvOBLPoClZbQiJV5zyHWD
	 x2Xr5jJwhu3Y+2FuexTd0q00I29jjdRqLEMjgOQEmQ0OjGBPvVccqN+kUpSUvXD7EC7Rd
	 DEhidquj8viJ+omSmEnoykRSJiw3VAm1f2FUi/nRIsYUQPKfiXF60PQVMgxZaGznf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pLjM4hBp;
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84704606A33F
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84704606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pLjM4hBp
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=5JJmSg68DrRJ70easqv1Ad4WfbubqNBenKyplETxRFc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795509263; v=1; x=1796114063;
 b=pLjM4hBpAwJL6xEzflMFy9VQHWAJEMEgDKCr0yoCRmdJ/6Ns/daVkfsiY27OU+QvITqhbrYx
 zbH1y/eD/pgkp24dDFcTkZnjkqNYPVVNiMLYdSII5s9HdJTGpMmuq4xZ3L6DSsU090A3e2Pz8gB
 /7q/C0KSSbwuOo8aI7wCQrPI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id e39605e69979267c;
	Tue, 24 Nov 2026 08:34:23 +0000
X-Mizu-Trace-ID: e39605e69979267c
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 16:34:07 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org,
	kasong@tencent.com, baohua@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	baolin.wang@linux.alibaba.com, Baoquan He <hebaoquan@kylinos.cn>,
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH 3/4] mm/mglru: skip cold PUD subtrees during aging
Message-ID: <awVL_81P_oujI3Ct@bogon>
References: <20261120085806.781225-1-baoquan.he@linux.dev>
 <20261120085806.781225-4-baoquan.he@linux.dev>
 <sashiko-outbox-226850@kernel.org>
 <awVGycKHzXzW5OF1@bogon>
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
In-Reply-To: <awVGycKHzXzW5OF1@bogon>

On 11/24/26 at 04:12pm, Baoquan He wrote:
> On 11/21/26 at 08:59am, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Medium] mm/mglru: walk_pmd_range() drops young status of THPs flushed
> >   at non-leaf PMD
> > --
> > 
> > commit 807f1bc14298f872f3bf880156eb7f9c34a7f570
> > Author: Baoquan He <hebaoquan@kylinos.cn>
> > 
> > mm/mglru: skip cold PUD subtrees during aging
> > 
> > This commit introduces a PUD-level Bloom filter to MGLRU page table aging
> > to skip 1 GiB PUD subtrees that had no young pages in the previous
> > generation, while updating the filter from the page table walk and rmap
> > feedback paths.
> > 
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index a4c64a1903912..2cd3f28f74288 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > [ ... ]
> > > @@ -3626,11 +3637,12 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
> > >  	return suitable_to_scan(total, young);
> > >  }
> > >  
> > > -static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
> > > +static bool walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
> > >  				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
> > >  {
> > >  	int i;
> > >  	bool dirty;
> > > +	bool young = false;
> > >  	pmd_t *pmd;
> > >  	spinlock_t *ptl;
> > >  	struct folio *last = NULL;
> > > @@ -3644,13 +3656,13 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
> > >  	if (*first == -1) {
> > >  		*first = addr;
> > >  		bitmap_zero(bitmap, MIN_LRU_BATCH);
> > > -		return;
> > > +		return false;
> > >  	}
> > >  
> > >  	i = addr == -1 ? 0 : pmd_index(addr) - pmd_index(*first);
> > >  	if (i && i <= MIN_LRU_BATCH) {
> > >  		__set_bit(i - 1, bitmap);
> > > -		return;
> > > +		return false;
> > >  	}
> > [ ... ]
> > > @@ -3755,7 +3771,8 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> > >  			walk->mm_stats[MM_LEAF_TOTAL]++;
> > >  
> > >  			if (pfn != -1)
> > > -				walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> > > +				young |= walk_pmd_range_locked(pud, addr, vma, args,
> > > +							       bitmap, &first);
> > >  			continue;
> > >  		}
> > >  
> > > @@ -3777,15 +3794,18 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> > >  			continue;
> > >  
> > >  		walk->mm_stats[MM_NONLEAF_ADDED]++;
> > > +		young = true;
> > >  
> > >  		/* carry over to the next generation */
> > >  		update_bloom_filter(mm_state, BLOOM_FILTER_PMD, walk->seq + 1, pmd + i);
> > >  	}
> > >  
> > > -	walk_pmd_range_locked(pud, -1, vma, args, bitmap, &first);
> > > +	young |= walk_pmd_range_locked(pud, -1, vma, args, bitmap, &first);
> > 
> > [Severity: Medium]
> > Can walk_pmd_range() drop the young return value when batched transparent
> > huge pages are flushed at a non-leaf PMD?
> 
> This is a real issue even though very corner case. I thought it won't
> happen when making v5, but I was wrong. It happens when all below three
> conditions are met:
> 
> 1. at least one huge page whose folio is in this lruvec is queued in the
>    batch, and it is young;
> 2. the call that crosses the MIN_LRU_BATCH boundary comes from the
>    non-leaf branch, i.e. the PMD 64+ entries after *first is a page table
>    with its accessed bit set;
> 3. no other PMD of this PUD sets young on its own, neither before nor
>    after that PMD.
> 
> Fix is quite simple, take the returned value to assign to you too for
                                                            ~~^
                                                           typo s/you/young/
> non-leaf PMD. This will be done in the coming v6.
> 
> > 
> > mm/vmscan.c:walk_pmd_range() {
> >     ...
> > 		if (!walk->force_scan && should_clear_pmd_young() &&
> > 		    !mm_has_notifiers(args->mm)) {
> > 			if (!pmd_young(val))
> > 				continue;
> > 
> > 			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> > 		}
> >     ...
> > }
> > 
> > walk_pmd_range_locked() buffers up to 1 + MIN_LRU_BATCH entries in first
> > and bitmap across loop iterations, returning false while buffering.  If
> > earlier iterations queued PMD-mapped THPs and this non-leaf PMD call lies
> > more than MIN_LRU_BATCH entries past first, it flushes those THPs and
> > resets first to -1, but its return value is ignored.  If no later PMD in
> > the PUD sets young, walk_pmd_range() returns false and walk_pud_range()
> > leaves the PUD out of BLOOM_FILTER_PUD, skipping the 1 GiB subtree on the
> > next aging pass.
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20261120085806.781225-1-baoquan.he@linux.dev?part=3
