Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573265;
	b=vudoxAzQ8mwuZ0uc3D4nVtbkw/IMH8lNdLJV/IFqwtYQH9jEQ7bjN6yrIwzu0RrjGafH
	 kBr3cGhB642Z90bLKO59LgXHWvIUVJaJyGPEvO0KFIvrytrsuO4Jyni09yseU4nCUL64o
	 oxaU/lG7RDtcGpb5bJqjQ0UtoWgnww64JmqI6vGEX61TSI9goYAX2kTgQwW2LA/YeAP+F
	 IOrcaW+1nmLTc3rO7Z4sQcU+Gv5g2ZcNDpHlShdr+aJofLvrJWfnMzkbQdrR6g6wlPG8t
	 DCJ7oDDVq28kO+E7jkGzBy0ZMGfJu0S9EvIAAIcoguKVAc1wIAyqtcGWx/aXOMm+H7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573265;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=QF5/RGbnB3uL9g0t8XxmYvir5OZryV7dSCn4MoFaEOI=;
	b=UjBUwzOxz8WmZWcYzJ/Jaddf5U/8huObi6nOvUmYqT0Zi0zB+nJrvKjJssE+M74IvHAO
	 ecSvadCpL3KP48c4uj8xThjMYj1C7nykHXYjxPfX1+z2ZOUuAbekQsx53OXfSqiUsich+
	 dju2RtevyVAHEc0ITQtiGwI5hkgs64Jlsa4IydFszcgNQgJ0RMlQWyAIkHZ38kh2lVV35
	 g1q69LPSrqwovxO9pfbi7NP4e2M+Cua00FN9ZydV0Gt9IC6rQvwc6z4ugTaCGikf7dvos
	 etbbcPwCUwu65D66N3VUYyYOoBUo4gEAfLcu2CojfD6wuj5nAd3UCrDnd/F8GVg5Z3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="DJIvbgF/";
	arc=none smtp.remote-ip=91.218.175.179
Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1CB606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 02:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DJIvbgF/
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/sb51Ln2/DAI8sXzQH621GIGu1e1U5fVvk32++uJAWs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795573261; v=1; x=1796178061;
 b=DJIvbgF/lkI1c0D9mGRcGoR4nDYwZYyFt7Ye+ecDYC6JI7mORUgKkFVbI33ibpa19z9NJDnu
 rqAqTYmY5PFJMzheBtcubGqzq0POAYBivK0hL0VOVBu7+sWqkPJb10s9e1PMtlfTnrY9g5xoVgG
 BXBiBXJ3fwPgQGnCTIJPgbmY=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 51e415cf3d358a92;
	Wed, 25 Nov 2026 02:21:01 +0000
X-Mizu-Trace-ID: 51e415cf3d358a92
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 10:20:57 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, david@kernel.org, akpm@linux-foundation.org,
	kasong@tencent.com, baohua@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com,
	baolin.wang@linux.alibaba.com, Baoquan He <hebaoquan@kylinos.cn>,
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v5 3/4] mm/mglru: skip cold PUD subtrees during aging
Message-ID: <awZGCeFosH5myoXM@bogon>
References: <20261123085800.981256-1-baoquan.he@linux.dev>
 <20261123085800.981256-4-baoquan.he@linux.dev>
 <sashiko-outbox-230766@kernel.org>
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
In-Reply-To: <sashiko-outbox-230766@kernel.org>

On 11/24/26 at 08:59am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/mglru: lost young status in walk_pmd_range() when flushing
>   THP batch
> --
> 
> commit a67d5ce39733f49dd06a525e19b6621ddfe22558
> Author: Baoquan He <hebaoquan@kylinos.cn>
> 
> mm/mglru: skip cold PUD subtrees during aging
> 
> This commit introduces a PUD-level Bloom filter keyed by (mm, PUD-aligned
> address) to skip PUD subtrees that held no young entries during the previous
> MGLRU aging generation, and updates it from both the page table aging walk and
> the rmap feedback path.
> 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 7d20ee1b6c10a..517f5fbecdbf7 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> [ ... ]
> > @@ -3750,7 +3766,8 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
> >  			walk->mm_stats[MM_LEAF_TOTAL]++;
> >  
> >  			if (pfn != -1)
> > -				walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);
> > +				young |= walk_pmd_range_locked(pud, addr, vma, args,
> > +							       bitmap, &first);
> >  			continue;
> >  		}
> 
> [Severity: Medium]
> Does walk_pmd_range() lose the young return value when a queued THP batch
> is flushed by the second walk_pmd_range_locked() call on a non-leaf PMD?
> 
> mm/vmscan.c:walk_pmd_range() {
>     ...
> 		if (!walk->force_scan && should_clear_pmd_young() &&
> 		    !mm_has_notifiers(args->mm)) {
> 			if (!pmd_young(val))
> 				continue;
> 
> 			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &first);

Yes, this is a corner case and could happen to lose the PMD-mapped young
leaf count. The detailed analysis has been replied to v4 patch 3:

https://lore.kernel.org/all/awVGycKHzXzW5OF1@bogon/T/#u

This will be fixed in v6.


> 		}
>     ...
> }
> 
> Both PMD-mapped THPs and young non-leaf PMDs share the same (first, bitmap)
> batch.  walk_pmd_range_locked() queues entries within MIN_LRU_BATCH of
> *first and returns false, only scanning the queued entries and returning
> whether any THP was young when a later call exceeds MIN_LRU_BATCH (or passes
> addr == -1).  If a young THP is queued first and a young non-leaf PMD more
> than MIN_LRU_BATCH entries later flushes that batch, the non-leaf call
> discards the return value; if no later PMD in the PUD sets young,
> walk_pmd_range() returns false and walk_pud_range() leaves the PUD out of
> BLOOM_FILTER_PUD for the next generation.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261123085800.981256-1-baoquan.he@linux.dev?part=3
