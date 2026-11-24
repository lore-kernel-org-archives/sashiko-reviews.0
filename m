Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507965;
	b=jhqbNoAEuEuWoNlFY9UNDBRFZJwOz2VCCT99OX3r+LEcp//MvfOhueq9TVAcsEbYGrA6
	 KwSRRj7SCq+KHvajLolzib1wPtniFfWGcdt7KyaNtvILDInqRRabTM2PZ+3qKhfBlZqgK
	 BQKxeYU5bPugKvishOTgZBB4u85B45YQuQCE6od1Mmc/GFFcIOwrn1QmUZ/fSP2EVlxtt
	 zlIIj6D5YEmX6bp/XUY2JvFUk3rJLq0pIrkht6hGhacx4XVHC1VtDRxFqklFle29snpcJ
	 A+MaTuMUbbjB7KZx9kwTMBdez7JBjW8Xkymigz8Cy4w1/NDuAJdjS4/3i8ICE4c6ziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507965;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9v/aquPA29KXdA96PEW/4XyKP1194pH+JbPW+CE9BhA=;
	b=O9TDbrJohykH5HeVDDQ391NMOOaRHVOwG10A3kyMfezCX26HJ/y4H1K5FrKWyndf5qug
	 eW5VNZPFWTv03GB3309jCsTNK+jmicsTEDN+k16wcdfNE2ANwqHWXfVzXoVVNbUpPLdj0
	 Hukceufr2Tei6BXs7/7DghejAUKy9S7F8gaLOUHBK51P/Gyf5s/Iz97K6iyISB0XSitYi
	 gzrMVWRngz2LuG3b/Am0OpK4oNcTXK4NlfHHj9MkV/kdBjnLi+s0W7paM0ez9cTR+qfZh
	 b3ySobSN4As8QJTNjOdOqHO37KcyaHdpPqhHKiRlrH45iQINpEfmzbkndHdcLNif0zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LBnu8YYw;
	arc=none smtp.remote-ip=95.215.58.15
Received: from mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916F606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7916F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LBnu8YYw
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=kfJ4WtKy7pZ4fGs2zEWka3cP1XCH3IaMwALqV+AeTpM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795507962; v=1; x=1796112762;
 b=LBnu8YYweN6gPg5w0MqZtOQi34gJYQE1f/pekFwWo68fLWZOAM9TeO4o6kJlgpjazZqEi+NZ
 5UTJxwZ0uav+MeXz6HYDTqVyguceNx6jEBp1SWik+MtBtOIZ7CO7CCkcH34i/ca3lZ0syAQFyoL
 xYrLTEq+pOjpNKZ5HWfPBR+s=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 6c42f0ddf956d8ce;
	Tue, 24 Nov 2026 08:12:42 +0000
X-Mizu-Trace-ID: 6c42f0ddf956d8ce
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 16:12:30 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org,
	kasong@tencent.com, baohua@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	baolin.wang@linux.alibaba.com, Baoquan He <hebaoquan@kylinos.cn>,
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH 3/4] mm/mglru: skip cold PUD subtrees during aging
Message-ID: <awVGycKHzXzW5OF1@bogon>
References: <20261120085806.781225-1-baoquan.he@linux.dev>
 <20261120085806.781225-4-baoquan.he@linux.dev>
 <sashiko-outbox-226850@kernel.org>
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
In-Reply-To: <sashiko-outbox-226850@kernel.org>

On 11/21/26 at 08:59am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/mglru: walk_pmd_range() drops young status of THPs flushed
>   at non-leaf PMD
> --
> 
> commit 807f1bc14298f872f3bf880156eb7f9c34a7f570
> Author: Baoquan He <hebaoquan@kylinos.cn>
> 
> mm/mglru: skip cold PUD subtrees during aging
> 
> This commit introduces a PUD-level Bloom filter to MGLRU page table aging
> to skip 1 GiB PUD subtrees that had no young pages in the previous
> generation, while updating the filter from the page table walk and rmap
> feedback paths.
> 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index a4c64a1903912..2cd3f28f74288 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> [ ... ]
> > @@ -3626,11 +3637,12 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
> >  	return suitable_to_scan(total, young);
> >  }
> >  
> > -static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
> > +static bool walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
> >  				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
> >  {
> >  	int i;
> >  	bool dirty;
> > +	bool young = false;
> >  	pmd_t *pmd;
> >  	spinlock_t *ptl;
> >  	struct folio *last = NULL;
> > @@ -3644,13 +3656,13 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
> >  	if (*first == -1) {
> >  		*first = addr;
> >  		bitmap_zero(bitmap, MIN_LRU_BATCH);
> > -		return;
> > +		return false;
> >  	}
> >  
> >  	i = addr == -1 ? 0 : pmd_index(addr) - pmd_index(*first);
> >  	if (i && i <= MIN_LRU_BATCH) {
> >  		__set_bit(i - 1, bitmap);
> > -		return;
> > +		return false;
> >  	}
> [ ... ]
> > @@ -3755,7 +3771,8 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  			walk->mm_stats[MM_LEAF_TOTAL]++;
> >  
> >  			if (pfn != -1)
> > -				walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> > +				young |= walk_pmd_range_locked(pud, addr, vma, args,
> > +							       bitmap, &first);
> >  			continue;
> >  		}
> >  
> > @@ -3777,15 +3794,18 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  			continue;
> >  
> >  		walk->mm_stats[MM_NONLEAF_ADDED]++;
> > +		young = true;
> >  
> >  		/* carry over to the next generation */
> >  		update_bloom_filter(mm_state, BLOOM_FILTER_PMD, walk->seq + 1, pmd + i);
> >  	}
> >  
> > -	walk_pmd_range_locked(pud, -1, vma, args, bitmap, &first);
> > +	young |= walk_pmd_range_locked(pud, -1, vma, args, bitmap, &first);
> 
> [Severity: Medium]
> Can walk_pmd_range() drop the young return value when batched transparent
> huge pages are flushed at a non-leaf PMD?

This is a real issue even though very corner case. I thought it won't
happen when making v5, but I was wrong. It happens when all below three
conditions are met:

1. at least one huge page whose folio is in this lruvec is queued in the
   batch, and it is young;
2. the call that crosses the MIN_LRU_BATCH boundary comes from the
   non-leaf branch, i.e. the PMD 64+ entries after *first is a page table
   with its accessed bit set;
3. no other PMD of this PUD sets young on its own, neither before nor
   after that PMD.

Fix is quite simple, take the returned value to assign to you too for
non-leaf PMD. This will be done in the coming v6.

> 
> mm/vmscan.c:walk_pmd_range() {
>     ...
> 		if (!walk->force_scan && should_clear_pmd_young() &&
> 		    !mm_has_notifiers(args->mm)) {
> 			if (!pmd_young(val))
> 				continue;
> 
> 			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> 		}
>     ...
> }
> 
> walk_pmd_range_locked() buffers up to 1 + MIN_LRU_BATCH entries in first
> and bitmap across loop iterations, returning false while buffering.  If
> earlier iterations queued PMD-mapped THPs and this non-leaf PMD call lies
> more than MIN_LRU_BATCH entries past first, it flushes those THPs and
> resets first to -1, but its return value is ignored.  If no later PMD in
> the PUD sets young, walk_pmd_range() returns false and walk_pud_range()
> leaves the PUD out of BLOOM_FILTER_PUD, skipping the 1 GiB subtree on the
> next aging pass.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261120085806.781225-1-baoquan.he@linux.dev?part=3
