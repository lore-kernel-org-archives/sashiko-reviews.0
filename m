Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813899;
	b=bR1/k7jCoc72KyYbxST5r1PBpwPcVNefwK5P3DgVIRnLWE1emExlfVjFckERKiWRZzJx
	 V8JBhLd4qOKxBeotM5aulfGOgkdRDo9qv3XKpMU7WogEWWO2x7mqGF1G9PMUegAV+s4k4
	 s7gvoLbKNUIQ57OALsc4kuuzcDvbxVLXeyMGk/DRx47PRFCQUInYXVzDxWxZ6sTcCzrUd
	 SmDMI/11IHn639z5E8ZCOZaYD4iy5hLOfjFP29aV+/Yi27Jf4niuaVL1riwVd3uFTbRsx
	 hYLxG5LTFuaGfqfEEp/w1j2FTDYSnDluATJgmBRxNCbaYBOSsRtkFNeFw6f9O4czrKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813899;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=gxWuCpbv03Zc02+oBlxfrkWwPg/mIkyueML8T0AAdnc=;
	b=yBt0Z84MjEC0SBeQd2Im6E53JZR7fojuVX9W+Z70R52gmGpciDVkcbmoicW3aAC3Puhx
	 Fi8KxNWHYw1Wntvwf2EZycCDz94BObAqnmPFSIIQSjElLHlvIGYBi1Ifc9kbueSystYHC
	 pHUUDr8RPJfIMZW2dHKuDICJamYoNUd/8w3tbGN7guI39EFeg+rUnTSl46tAKUlziXttK
	 wufj3pkYiZR6t+2bjySFKBySxcQxQ8gYs62uLI3vPPGUeTz9s6k8h8KCmXFc3azXYpqO5
	 fVJTFfz3xh0LZz3vquoTpMKPfNvWcw3wuTaLtpzFVCxp0J51DcyVHs1HbnOLxJGJPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UanhZ4fi;
	arc=none smtp.remote-ip=91.218.175.146
Received: from mta0.migadu.com (out-146.mta0.migadu.com [91.218.175.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED63606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED63606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UanhZ4fi
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=g8ClyyMtcgLdsQ6JL3yApqtIQt0AnNXmbikE9ZqcOv0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813896; v=1; x=1795418696;
 b=UanhZ4fikeBcpR755ZTsXCKC47TE+RRt60Tw4BHuythe1/9smHKtSHbU9Tk0lUCaaEqx9RC+
 2zLQe+fnGe5QYVi66r3gCDm4Y8svM86ocMa8reNfRbNSHedMdfImX5tC0QwGAkuPfTjO1Yxfv39
 Em3c8X+OX7l9vxmy46dF6BiA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id b52167547f9f5bc8;
	Mon, 16 Nov 2026 07:24:56 +0000
X-Mizu-Trace-ID: b52167547f9f5bc8
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 15:24:51 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org,
	kasong@tencent.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: Re: [PATCH v3 1/4] mm/mglru: add MM_WALK_EMPTY stats and tracepoint
Message-ID: <avqvw25Ftak2Qq7E@fedora>
References: <20261113084953.412919-1-baoquan.he@linux.dev>
 <20261113084953.412919-2-baoquan.he@linux.dev>
 <sashiko-outbox-214123@kernel.org>
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
In-Reply-To: <sashiko-outbox-214123@kernel.org>

On 11/14/26 at 03:42am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] mm/mglru: get_pte_pfn() and get_pmd_pfn() skip non-young
>   entries in walk stats
> - [Medium] mm/mglru: walk_pte_range() undercounts MM_LEAF_ASSOCIATED on
>   large folios
> - [Low] mm/mglru: mm_vmscan_lru_gen_walk tracepoint defined outside
>   CONFIG_LRU_GEN

Thanks for the review. All three points are correct. Please see the
reply in inline paragraphs.

> --
> 
> commit b5309c24549f959bf1eb3e88053e43540b30ee90
> Author: Baoquan He <hebaoquan@kylinos.cn>
> 
> mm/mglru: add MM_WALK_EMPTY stats and tracepoint
> 
> This commit adds per-walk statistics and a tracepoint to track MGLRU aging
> page-table walks that find no folios belonging to the target lruvec.
> 
> > diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
> > index 9dafdb5bd3ce8..2b268fd0f89e8 100644
> > --- a/mm/trace_vmscan.h
> > +++ b/mm/trace_vmscan.h
> > @@ -763,6 +763,34 @@ TRACE_EVENT(mm_vmscan_kswapd_clear_hopeless,
> >  		__entry->nid,
> >  		__print_symbolic(__entry->reason, kswapd_clear_hopeless_reason_ops))
> >  );
> > +TRACE_EVENT(mm_vmscan_lru_gen_walk,
> > +
> > +	TP_PROTO(int nid, unsigned long seq, int leaf_total,
> > +		 int leaf_associated, bool empty),
> 
> [Severity: Low]
> Should mm_vmscan_lru_gen_walk be placed inside the #ifdef CONFIG_LRU_GEN
> block alongside mm_mglru_scan_folios and mm_mglru_aging?  Its only caller in
> try_to_inc_max_seq() is built under CONFIG_LRU_GEN, so defining it here
> generates unused tracepoint code and tracefs entries when CONFIG_LRU_GEN is
> disabled.

Will fix. mm_vmscan_lru_gen_walk will be put inside the same block as
mm_mglru_scan_folios and mm_mglru_aging.

> 
> [ ... ]
> 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 25a224746c36d..6034bae03dc21 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3582,6 +3582,8 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
> >  		if (!folio)
> >  			continue;
> >  
> > +		walk->mm_stats[MM_LEAF_ASSOCIATED]++;
> > +
> >  		if (folio_test_large(folio)) {
> >  			const unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> [Severity: Medium]
> Does walk_pte_range() undercount MM_LEAF_ASSOCIATED when a large folio spans
> a batch of contiguous PTEs?

MM_LEAF_ASSOCIATED is not scaled by the batch size for large folios.

Will fix. For a batched large folio we now add nr - 1 as well, so
MM_LEAF_YOUNG can no longer be larger than MM_LEAF_ASSOCIATED.

> 
> When folio_test_large(folio) is true, folio_pte_batch_flags() sets nr to the
> number of batched PTEs and adds nr - 1 to walk->mm_stats[MM_LEAF_TOTAL] and
> nr to walk->mm_stats[MM_LEAF_YOUNG], before the loop advances by nr entries:
> 
> mm/vmscan.c:walk_pte_range() {
>     ...
> 		if (folio_test_large(folio)) {
> 			const unsigned int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> 			nr = folio_pte_batch_flags(folio, NULL, cur_pte, &ptent,
> 						   max_nr, FPB_MERGE_YOUNG_DIRTY);
> 			total += nr - 1;
> 			walk->mm_stats[MM_LEAF_TOTAL] += nr - 1;
> 		}
>     ...
> 		young += nr;
> 		walk->mm_stats[MM_LEAF_YOUNG] += nr;
> 	}
> 
> Because MM_LEAF_ASSOCIATED is only incremented by 1 before the batch size is
> computed, the remaining nr - 1 PTEs in the batch are not counted, and
> MM_LEAF_YOUNG can end up larger than MM_LEAF_ASSOCIATED.
> 
> [ ... ]
> 
> > @@ -4158,8 +4162,28 @@ static bool try_to_inc_max_seq(struct lruvec *lruvec, unsigned long seq,
> >  
> >  	do {
> >  		success = iterate_mm_list(walk, &mm);
> > -		if (mm)
> > +		if (mm) {
> > +			bool empty = false;
> > +
> >  			walk_mm(mm, walk);
> > +			/*
> > +			 * A walk that traversed page tables but found no folio
> > +			 * belonging to this lruvec (node+memcg) is pure waste.
> > +			 */
> > +			if (walk->mm_stats[MM_LEAF_TOTAL]) {
> > +				walk->mm_stats[MM_WALK_TOTAL]++;
> > +				if (walk->mm_stats[MM_LEAF_ASSOCIATED] == 0) {
> > +					walk->mm_stats[MM_WALK_EMPTY]++;
> > +					walk->mm_stats[MM_LEAF_EMPTY_WALKS] +=
> > +						walk->mm_stats[MM_LEAF_TOTAL];
> > +					empty = true;
> > +				}
> > +			}
> > +			trace_mm_vmscan_lru_gen_walk(
> > +					lruvec_pgdat(lruvec)->node_id, walk->seq,
> > +					walk->mm_stats[MM_LEAF_TOTAL],
> > +					walk->mm_stats[MM_LEAF_ASSOCIATED], empty);
> > +		}
> >  	} while (mm);
> 
> [Severity: Medium]
> Does this count a walk as empty whenever an mm has folios in this lruvec
> whose PTEs and PMDs are all non-young?
> 
> In walk_pte_range() and walk_pmd_range_locked(), MM_LEAF_ASSOCIATED is
> incremented only after get_pte_pfn() or get_pmd_pfn() succeeds, but both
> helpers reject non-young entries up front when the mm has no MMU notifiers:
> 
> mm/vmscan.c:get_pte_pfn() {
>     ...
> 	if (!pte_young(pte) && !mm_has_notifiers(vma->vm_mm))
> 		return -1;
> 
> As a result, non-young leaf entries mapping folios in this lruvec are never
> counted in MM_LEAF_ASSOCIATED, and any walk over an mm whose mapped folios in
> this lruvec are all cold has MM_LEAF_ASSOCIATED == 0 and is recorded in
> MM_WALK_EMPTY, MM_LEAF_EMPTY_WALKS, and trace_mm_vmscan_lru_gen_walk() with
> empty=1.

get_pte_pfn() / get_pmd_pfn() reject non-young entries before
MM_LEAF_ASSOCIATED is counted, so a walk is reported as "empty" when the mm
has folios in this lruvec but all of them are cold.

Yes, that is what the code does, and the name did not say it. The
behaviour is on purpose. The PUD filter in patch 3 carries a subtree only
when it had young entries for this lruvec, so "nothing young" is exactly
what we want to measure. Counting the folios before the young test would
add a folio lookup for every cold leaf, and that is the cost this series
tries to remove.

So v4 will fix the naming and the comments instead: MM_LEAF_ASSOCIATED is
"young leaf entries whose folio is in this lruvec", MM_WALK_EMPTY is
"walks that found nothing young for this lruvec", and the comment in
try_to_inc_max_seq() says the same.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261113084953.412919-1-baoquan.he@linux.dev?part=1
