Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572830;
	b=mUWZouuHw6CG+gUnnQG0skkhmg7O1dvW0eBqXOC8ury+8QrPBhWLy0xfUKqrqvwOCmho
	 5TWurJClPmzFj0xkr2jjwICds5Gujc94tbvRsYlLDh+reGq7WramOPJ4/m54vKCAgr3TS
	 c8/tRQ8NCXVUaycia2IcX9Ok80jcbCxPxx4HyHORxs0O2S6suGFjV723jw8UtXfyt9OIu
	 0E1hU8nUTOQJNtaPb+F3Dxq1OX4KRxTCKBlin+wIVMxsS4Ln0f2v9rn0zZ101JqQQ0Yu6
	 dgBt/DNM+o6AsnCUNLmF3YT5uQG1EcVaSe969lqY4/5QI775YmG7BFeMkFvRRLXZipQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572830;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wQS8+G8zUE7eRedh/eNlx+5Ei152G7Qf9Mz0SPz+noE=;
	b=eWN+dcGU6TfdYKfQBJfzuBwrU6E0zkfW3or2/tsysPatlO7fwyJPJ4fABD8UBWZSdjnK
	 H3IzLiBxWTGD/ArlrCRTDsiy1nyLdo7Tr7Lmedy+En5zVqkLXjTfsyHqlG6lKrqc42YCo
	 ZE9rqLiM+ZWQQwcreFSfGTBCTn4g9oUNoe+qx2wZwAbquNPZpoRi1Nsg83LJj1YUkAGoH
	 mKpHn4SiZKyihtzQFkSPI9p5mZhnedh43TBNfO+yLFBX7bRwbFn7guVrSjBZ2M4KnJdyx
	 Ly9+NX9ilhyKjamuKdCshFc95fFGOZ7jlfpw+AvjhezvobuQF6lsojCpmLdZCovdfRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G3ZE0lBf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461BF606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 12:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G3ZE0lBf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7357B1476;
	Fri, 13 Nov 2026 04:27:06 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1F693F673;
	Fri, 13 Nov 2026 04:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794572829; bh=TjVoosr6HqMq8nW/HCbzKJB4G46aGduUougz+nELtKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3ZE0lBf0yvMtKjxWs2lS+kwNScICzsuSt3PN/vaXgGRiWOYWIb6EyG35gA5p99XI
	 lmoFC4/gSOeIy5HY8ViwUoBBUzPDEoS4MnqpoeBv1rskyqgs7Scl+nXtorBAOHztk1
	 blRI1d2Xf1UCXz55EOxU/1juRk2+HZiqQMu38DKA=
Date: Fri, 13 Nov 2026 12:27:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Breno Leitao <leitao@debian.org>, Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH] slab: allow sheaves for SLAB_NOLEAKTRACE caches
Message-ID: <avcCGNUqCrcwbFG6@arm.com>
References: <20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org>
 <sashiko-outbox-212599@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-212599@kernel.org>

On Fri, Nov 13, 2026 at 10:05:08AM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 8369853ddca72..f19e20b6f9a4f 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2850,6 +2850,13 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
> >  	if (s->flags & SLAB_KMALLOC)
> >  		alloc_flags |= SLAB_ALLOC_NO_RECURSE;
> >  
> > +	/*
> > +	 * kmemleak allocates its metadata from SLAB_NOLEAKTRACE caches, so
> > +	 * tracking their sheaves would recurse into kmemleak.
> > +	 */
> > +	if (s->flags & SLAB_NOLEAKTRACE)
> > +		alloc_flags |= SLAB_ALLOC_NO_LEAKTRACE;
> > +
> >  	sheaf_size = struct_size(sheaf, objects, capacity);
> >  	sheaf = kmalloc_flags(sheaf_size, gfp | __GFP_ZERO, alloc_flags, NUMA_NO_NODE);
> 
> [Severity: Medium]
> Does SLAB_ALLOC_NO_LEAKTRACE leak into nested sheaf and slabobj_ext
> allocations for the backing normal kmalloc cache?
> 
> When s is a SLAB_NOLEAKTRACE cache (such as kmemleak's object_cache),
> s->flags & SLAB_KMALLOC is false, so __alloc_empty_sheaf() passes
> SLAB_ALLOC_NO_LEAKTRACE to kmalloc_flags() without SLAB_ALLOC_NO_RECURSE.
> If the backing normal kmalloc bucket needs a new empty sheaf in
> alloc_from_pcs() -> __pcs_replace_empty_main() -> alloc_empty_sheaf(),
> that nested sheaf allocation inherits SLAB_ALLOC_NO_LEAKTRACE and is not
> registered with kmemleak.
> 
> Because kmemleak never scans that untracked normal kmalloc sheaf:
> - If the sheaf is later used as pcs->rcu_free in __kfree_rcu_sheaf(),
>   kvfree_call_rcu() returns before kmemleak_ignore(ptr) while freeing is
>   deferred, so kmemleak_scan() misses pcs->rcu_free->objects[] and reports
>   queued objects as false-positive leaks.
> - Any tracked kmalloc sheaf linked between two untracked sheaves on
>   barn->sheaves_full or barn->sheaves_empty is unreachable during
>   kmemleak_scan() and is also reported as a false-positive leak.
> - In slab_post_alloc_hook() -> alloc_tagging_slab_alloc_hook() ->
>   prepare_slab_obj_exts_hook() -> alloc_slab_obj_exts(), the slabobj_ext
>   vector is likewise allocated with SLAB_ALLOC_NO_LEAKTRACE still set,
>   skipping kmemleak registration before calling kmemleak_not_leak(vec).
> 
> Setting SLAB_ALLOC_NO_RECURSE along with SLAB_ALLOC_NO_LEAKTRACE (or
> clearing SLAB_ALLOC_NO_LEAKTRACE before nested allocations) would prevent
> the flag from propagating into the normal kmalloc cache's own metadata.

Sashiko is right here, this could lead to false positives. I don't think
clearing SLAB_ALLOC_NO_LEAKTRACE before nested allocations is correct
since that could reintroduce the original recursion. Adding
SLAB_ALLOC_NO_RECURSE alongside it should fix this.

IIUC, I think we need to include SLAB_NOLEAKTRACE in the
mark_obj_codetag_empty() condition in __free_empty_sheaf(), alongside
SLAB_KMALLOC, if we go with the NO_RECURSE option.

-- 
Catalin
