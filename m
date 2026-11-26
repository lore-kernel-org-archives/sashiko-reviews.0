Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718385;
	b=dG1xb32EIKPjkj2SS+OAxFooUQys+3qy6v6EPkQi0vEU1Jf1b3TKi7XLCycbnd1qN6ag
	 mPOJHUIH/HpAPfznCJ11BgX+XYC91mjLg5N4qGx+H4sVkd3vUvZdGJLa7o7owBczjmTRX
	 nZfS/OnqFjxmSQYNj1VxtOiEehisib1vbsTqa+oVqM+ktG0KH3onXEmnCQ+WuC3g3k+ep
	 lV8nU2Jz00B9yTgCUyS4jK7SVsoDcrVnOER9o0/5tq5nqudnYF27pWTv2X+bp0uelt2M3
	 p5mMcrGFMdvLwtJmUnnjfCHvgVXhmeJf4BTNe8HplRr8XDN6r/oVqpNAe/ccXOsXCOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YgMZT03ulx9J7qgm1aKTPY1r170eQ2QP/y8ph676aGQ=;
	b=vpNRmJ61YWnw0yjgTliJ4ZXV9AWjA7z7e7ZPaN1vIBSuOQJ8g4rsQIukCyQ2UG+LqP2t
	 uQBXePLmzOSr0hgbaNzNBCd7r70WdjPzf9Pr+jZGO+FiDhcNCA3zkesyfeHTUtfBPyIsH
	 WUTzCKwQ8n5d0h8jVx0Z0YwrlSm0YJaOXQea+BWRtOoSGz/tHyiwSep77L5K22mAmnEww
	 bMfMoCE45zzYD4EjHDgA0/TkXrooVsM5ofep1UlLK8cRS0O9Zd8X4s4rWeYx0L0CCuF4/
	 x/jSAWXcXndvZJ+lWdMmyeS+C1etx6NkhJlJ1oh07xm4yc11d5HK4frYKLRhM4GBTHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SV/PwDdZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29137606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SV/PwDdZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA4F1F000C0;
	Thu, 26 Nov 2026 18:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718384;
	bh=YgMZT03ulx9J7qgm1aKTPY1r170eQ2QP/y8ph676aGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SV/PwDdZMCyCbSnnpfv4+q+fWEiA000+uskuE2j/Z4CGc/sEcC0uvgaE82ZoipvpL
	 dkavz6xXJhHxSzL9JepfDh9TEGdP4w5dEt8h0g0pWqtsIMrVtrdorvSmXORC3duaCg
	 7YeWLUraREwwZudFMJkAXJiH7c2FN5ld69EHEk9s5i+pvuLiyvuiGXJtB6VAbFiRIk
	 YHbl0itOekE/q4S0+vPRKvzx1ZzHpMcrr8i7hQHXMcVnokMKUuwP7T0xSQadqU5+CU
	 ucUCSblS63VS5I9kzoAM+bJ5bsB9dwZBJA3/5Yml7PAxDxE4Lvgp5+TEV6ndVRmUH3
	 FU7zS3gz+csYw==
Date: Thu, 26 Nov 2026 18:39:42 +0000
From: Harry Yoo <harry@kernel.org>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Dev Jain <dev.jain@arm.com>, Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 2/3] mm: page_alloc: make the high-order watermark
 check honour ALLOC_NOFRAGMENT
Message-ID: <awh3A3CIwxL5v-1K@thinkstation>
References: <20261116125103.2894162-1-kas@kernel.org>
 <20261116125103.2894162-3-kas@kernel.org>
 <sashiko-outbox-218808@kernel.org>
 <av8GvDahjRIKXUIa@shutemov.name>
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
In-Reply-To: <av8GvDahjRIKXUIa@shutemov.name>

On Thu, Nov 19, 2026 at 02:25:10PM +0000, Kiryl Shutsemau (Meta) wrote:
> On Tue, Nov 17, 2026 at 12:51:34PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Medium] mm: page_alloc: should_reclaim_retry() counts unusable
> >   migratetype pages
> 
> Not a regression. should_reclaim_retry() never filtered by migratetype.

... actually I had the same question as Sashiko. It's not a regression
introduced by this patch, but we might still need to fix it?

Looking at the hunk I was going to ask "what guarantees that
should_reclaim_retry() doesn't keep returning true when it should not",
otherwise seems like a similiar issue fixed by commit 4cd78a2dcfb ("mm:
page_alloc: make defrag_mode retries follow the promoted order")?

I mean it's not as bad as 4cd78a2dcfb because it would make _some_
progress, but still :-)

-- 
Cheers,
Harry / Hyeonggon
