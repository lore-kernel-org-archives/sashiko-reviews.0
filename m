Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537434;
	b=3f2LQhq7+tPDdOEqHXecNRMUOB2rUOfX159cAysv1nxV9BMMF7rGUM8DoyhORKy0cOtc
	 5oBcnyFlNA8X7TmM09hldnH4UQLBFon9564ZFGsD6Bm1mI7vpb70R0C6ndd9Y4Ev/omEo
	 8pigPP4yvM3JYaHn3yd1RXzDCWUTtqSApR6urCEOpmbs0Np5XSwfo8qdSx+TxWzhJ0JwH
	 1YqNbwxR34KrYehr2AvrYi1/9GTsOyd4PelHhvDSblk1jByuN+ego1BuRyF3sppoTKCfm
	 uAqS3CjZVxlnYKrbOxfYl+ZIk3iqKUn26RiRVKI+ZaDhl8HtYYngVqNn7pccZksiSBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537434;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K1FZSZTtwlQFE90cbI0Nr3F5RUyKerMzzNbSuIEFiEg=;
	b=5LgVoGT/0QRhW3oiunh4Bon8k67/IqZfhgy+MkbDzM19AvRaNaTTgLZuig2lclB3KWt9
	 3QPjgg7StqR4cdfFH2Z5hODnvGfbCLO+3WRJRSoG9WgHpSqoFqKdQEykmSqQlaJlmCPd0
	 MFWYg0pCI7/lCc3gbXij4m+orTr7Yre/LiR+c+AOKFC0li0NvuVLBsEPQirp7D8SXkCeX
	 1faD7WZPbBZPEQv+sok7wJXIS595qyKH/Wsu7OgBz2TXQrgFvRWJiZXULXn6dAh1Pvmrf
	 xaOxAQU+bFtd0lC9Gc/6D5YsffJj/cxFOgYMbd4OaBqQ9eJPWu1miqr6R8HOLSpjwgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kmi42mXl;
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F61606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 02:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kmi42mXl
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=MFXk5wTZQlNYOhRGLZAR7H0oTSAkWycqp+1VJkXLZqo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794537431; v=1; x=1795142231;
 b=Kmi42mXlThlbRJtif9w0jI/C3akIzoRzs+jo9m20zM/DvMgcGRPO8XeGs0yhyiOO8CDfTl8W
 VuZLmw8sC/4EbVCE87fDYr4Wsh8UlxQkxi0KnQ5rw7fx8+cBCCSEET8OfOgenNnX1cREAfhlg6p
 2XRWMiXpgmH3dhF+SBEK91SU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5429636b6996bd30;
	Fri, 13 Nov 2026 02:37:11 +0000
X-Mizu-Trace-ID: 5429636b6996bd30
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 18:37:10 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, 
	Chris Mason <mason@kernel.org>
Subject: Re: [PATCH] mm: list_lru: don't use a new memcg's lists for an
 offline memcg
Message-ID: <avZ3rcGiLnWS4qUq@linux.dev>
References: <20261112221248.3512447-1-shakeel.butt@linux.dev>
 <sashiko-outbox-211977@kernel.org>
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
In-Reply-To: <sashiko-outbox-211977@kernel.org>

On Fri, Nov 13, 2026 at 12:15:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm: list_lru: missing mlru->memcg check in
>   memcg_list_lru_allocated()
> --
> 
> commit d213b82b7b4ca4978c858df10a2a8cdea14626e4
> Author: Shakeel Butt <shakeel.butt@linux.dev>
> 
> mm: list_lru: don't use a new memcg's lists for an offline memcg
> 
> This commit records the owning memcg in struct list_lru_memcg and checks it
> in list_lru_from_memcg() so that an offline memcg whose kmemcg_id was reused
> does not use the new memcg's lists.
> 
> > diff --git a/mm/list_lru.c b/mm/list_lru.c
> > index d1d256822ccc7..937dbf239c9d4 100644
> > --- a/mm/list_lru.c
> > +++ b/mm/list_lru.c
> > @@ -72,12 +72,15 @@ static int lru_shrinker_id(struct list_lru *lru)
> >  }
> >  
> >  static inline struct list_lru_one *
> > -list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
> > +list_lru_from_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg)
> >  {
> > +	int idx = memcg_kmem_id(memcg);
> > +
> >  	if (list_lru_memcg_aware(lru) && idx >= 0) {
> >  		struct list_lru_memcg *mlru = xa_load(&lru->xa, idx);
> >  
> > -		return mlru ? &mlru->node[nid] : NULL;
> > +		/* Lists at a reused index belong to another memcg. */
> > +		return mlru && mlru->memcg == memcg ? &mlru->node[nid] : NULL;
> >  	}
> >  	return &lru->node[nid].lru;
> >  }
> 
> [ ... ]
> 
> > @@ -602,6 +604,8 @@ static int __memcg_list_lru_alloc(struct mem_cgroup *memcg,
> >  			if (!mlru)
> >  				return -ENOMEM;
> >  		}
> > +		/* Set before the lists are published, and never changed after. */
> > +		mlru->memcg = pos;
> >  		xas_set(&xas, pos->kmemcg_id);
> >  		do {
> >  			xas_lock_irqsave(&xas, flags);
> 
> [Severity: High]
> Does memcg_list_lru_allocated() also need to check mlru->memcg == memcg?

Yes this is correct and Andrew already have a fix for this.

