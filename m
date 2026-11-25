Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573385;
	b=F1TqPso3OcuEr0bYn5QvH40NsZVrT9KJfSKfqcXuh7N1Wkj63n0j20hx/U/y5PnSADrD
	 geeQixZgujAiDHHSy/pBEjQpkGbWeWCT2mpSzlBhWOmicqZmGHAtOTVb//B7UH8kW/m9a
	 y9VYwpp40TCXZUL0v2xd/3hil6hEdOQBlBgi8yJOIHRNjWgLCHhFVOfdUZGVcnaJ9IEzm
	 Jge0DJ+zMhEDEPPHJWPK1e0zwJPsp34rzHbH4M4YKQfbja1DD/dZ/3vTW9lr06/+eq4J/
	 K5n1Z491uuvB1ISsyQ3/BSqPJMxjZF0JFhSOQxT45PP7TOGFwpKejY8hV1qrcYLb5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573385;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=90g/AHhcoAXcPpVja+XtP1PT+bZ1pIcNF3fvL+LDX2Y=;
	b=x3Gwy0XzboDG9vw7p/TYnxtHRXeJwCMkTYtrRJYuPkceQYf8t9Z0HJ41fB9pK3p3BLff
	 ewAKav2FWUshM7V7W6lwNC7k0XoCYUlxYBMKINr6drsQQCiTtBOrNvxF0ngjtBcbma5k8
	 ExJBY/l364XPe9V6kXukzTNPkvAiDlhgtN+Bjdbns2uYXFAlvQqn6+CH1K200UDy91EMB
	 0LRjZR901vt8fTMReTVPxQcN8i0DaTIy8Jnq5xeDQrU3pBALs2Uvcc/EUyq/o02hgUfof
	 x8LB2xzfb4K5/zhXBlmUpQ4BGAmsnHWiHLh+ReqwrjvlPZGKj2mRkLoGJhWd7zga7jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fT73FuJi;
	arc=none smtp.remote-ip=95.215.58.141
Received: from mta1.migadu.com (out-141.mta1.migadu.com [95.215.58.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9C7606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 02:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B9C7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fT73FuJi
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rNC5GBZWdM52z/SE5ZYTzHP/7b3f7ExkhRG/8ASKIis=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795573382; v=1; x=1796178182;
 b=fT73FuJitHNJRTiPCzAnIh8SPcz6/XInG5niiHBuHYE0elXZQ62OfkWJmlkd3JnAuWYUjP1h
 XNS5GnkI74m9E9WS2QkIvZBHSTbQu2l5Fsny9H3yC0Z28+cmmrqazXFfGfVAvU+w68MMOt2geTm
 sH1tqnN6pXfjA+XvpfBkr+pI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 97de5dc6311956eb;
	Wed, 25 Nov 2026 02:23:01 +0000
X-Mizu-Trace-ID: 97de5dc6311956eb
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 10:22:57 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, david@kernel.org, akpm@linux-foundation.org,
	kasong@tencent.com, baohua@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	baolin.wang@linux.alibaba.com, Baoquan He <hebaoquan@kylinos.cn>
Subject: Re: [PATCH v5 4/4] mm/mglru: count PUD subtrees skipped by the
 PUD-level filter
Message-ID: <awZGgSrYIuOFoLwZ@bogon>
References: <20261123085800.981256-1-baoquan.he@linux.dev>
 <20261123085800.981256-5-baoquan.he@linux.dev>
 <sashiko-outbox-230767@kernel.org>
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
In-Reply-To: <sashiko-outbox-230767@kernel.org>

On 11/24/26 at 08:59am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/mglru: lost young return from walk_pmd_range_locked() in
>   walk_pmd_range()
> --
> 
> commit 3dc8080e8c434c4239bc40252f11504dbbdb29f3
> Author: Baoquan He <hebaoquan@kylinos.cn>
> 
> mm/mglru: count PUD subtrees skipped by the PUD-level filter
> 
> This commit adds MM_PUD_EMPTY_SKIPPED to count PUD subtrees skipped by the
> PUD-level Bloom filter and exposes it in debugfs and the
> mm_vmscan_lru_gen_walk tracepoint.
> 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 517f5fbecdbf7..56e18ffd3383e 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3836,8 +3836,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
> >  
> >  		/* Skip a subtree that had nothing young for this lruvec last gen */
> >  		if (!walk->force_scan &&
> > -		    !test_bloom_filter(mm_state, BLOOM_FILTER_PUD, walk->seq, pud_key))
> > +		    !test_bloom_filter(mm_state, BLOOM_FILTER_PUD, walk->seq, pud_key)) {
> > +			walk->mm_stats[MM_PUD_EMPTY_SKIPPED]++;
> >  			continue;
> > +		}
> >  
> >  		if (walk_pmd_range(pud + i, addr, next, args))
> >  			update_bloom_filter(mm_state, BLOOM_FILTER_PUD, walk->seq + 1,
> 
> [Severity: Medium]
> Can walk_pmd_range() drop the true return value from a flushed THP batch
> and leave BLOOM_FILTER_PUD unset for a PUD containing young THP entries?
> 
> When walk_pmd_range() encounters a PMD-mapped THP, walk_pmd_range_locked()
> batches it into first/bitmap and initially returns false.  If a young
> non-leaf PMD appears more than MIN_LRU_BATCH entries past first, the second
> walk_pmd_range_locked() call flushes that queued batch and discards its
> return value:
> 
> mm/vmscan.c:walk_pmd_range() {
> 	...
> 		if (!walk->force_scan && should_clear_pmd_young() &&
> 		    !mm_has_notifiers(args->mm)) {
> 			if (!pmd_young(val))
> 				continue;
> 
> 			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);

This has been reported at patch 3 sashiko report, a repeatedly reported
issue. Will fix in v6 soon. Thanks.

> 		}
> 	...
> }
> 
> Because that flush resets first to -1, the final walk_pmd_range_locked()
> call at the end of walk_pmd_range() returns false.  If no subsequent PMD in
> the PUD sets young, walk_pmd_range() returns false to walk_pud_range(),
> which skips update_bloom_filter() for BLOOM_FILTER_PUD and causes the next
> generation's walk to skip the PUD subtree and increment
> MM_PUD_EMPTY_SKIPPED even though it contained young THP entries.  OR-ing
> that return value into young avoids losing the result of the flushed batch.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261123085800.981256-1-baoquan.he@linux.dev?part=4
