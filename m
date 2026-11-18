Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009259;
	b=VmR3dgesXc9AKx0SExACFg45uWlBfXdwJ6NDRB4dSaH1MMHUi7r17kuq+F3QJ+m7VJcT
	 +zimieKajqZJzymRpu8p86j+mIo6fk+gKhIzPuVSdc5rgV/IhgOh18DJVZ9nC7OkGWM2i
	 /5tpaocDZggnN4LG40Skwe9b5qieTTIkIspX+PaZ/9bEVL++SOOlBMpEZuYRr05hxhaDf
	 xDAc3nUrOMXt4egR2dpZpGyaZNFG/VaVTgcxXKxaO6ugFTy7SsRUY/zi5EMdaPBNKtgWn
	 P+dJ2NM8fJ+xdefKsHn0Bstio/GuXQ5o7hCLCJda8H28BICNLGy1sTNA/YujuWED1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009259;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BALo+4Kg6TAxK4vlJgbnPV/8t94beUsE1Sdo+uMvRH8=;
	b=f8ZuNwaB1vmatwNBAnBmGdIUgBVcMQnEAqVOmep+f7nTY4xoduUh95gYF6WggoII+3lY
	 spaJT68ZauyjPg9gINlb4b0aCKELA98az7Q9VKcPs8F6RFrXcQ2CtVTf6TA9JQptQUvd7
	 hbUdV33VGGbFvgxRbWT2coqQxzvOzjTIWMGSSk/sD+fjgfFwJJU7noW31mjLKBZvM2Vdp
	 pvKk3t5XmoFyk7JeTFQuKgVU4x4LqdAD0gtMcBwawNWcNKYkSNTGNglMaT5qPi0ws3myi
	 2tIqw65giaz9d2pJZExhjBg/e0smvr5awEKJzKbv/vHOg1rKIicQhGJ/rYVQBGuhNXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFIGUSfI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE760A2607
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFIGUSfI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6239F1F000C9;
	Wed, 18 Nov 2026 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009258;
	bh=BALo+4Kg6TAxK4vlJgbnPV/8t94beUsE1Sdo+uMvRH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PFIGUSfI/35m8Ua7f4BVsaqrMghKl4zuRtAbIzKtXIute+iKRBxAzlJUFmC/G7N7S
	 HXewHpvz5HY1unvNcp0UxbMVFK9FfX68Oro4z2qqTOhfVvBQ1F95QfYvQpNaJVAzjm
	 E8QFjkFRhjb+9YIfhSWS6AqlonxffQsQKR9UR7Lca5cLRnXNc+dyr4/b1ceURtj+al
	 yjfU9VA3Ahcopav2U26moJ7zMnEEGvhZe3vUK6jPB49L9gX0QcH6YVgpDHQIjraEls
	 /kX/y4yYnIijIFV8UDhdB9aMcgl3xtem8Q3YV7JuRN4ecYWlbUDFFILz/GiwRTTagC
	 rcxis6dahl09w==
Date: Wed, 18 Nov 2026 15:40:49 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	sashiko-reviews@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/7] mm/page_ext: fix client data alignment
Message-ID: <av2q4RAESvKh0chV@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-3-songmuchun@bytedance.com>
 <sashiko-outbox-219498@kernel.org>
 <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
 <F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
 <20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
 <11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>
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
In-Reply-To: <11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>

On Wed, Nov 18, 2026 at 01:39:04PM +0800, Muchun Song wrote:
> 
> 
> > On Nov 18, 2026, at 12:21, Andrew Morton <akpm@linux-foundation.org> wrote:
> > 
> > On Wed, 18 Nov 2026 11:49:58 +0800 Muchun Song <muchun.song@linux.dev> wrote:
> > 
> >> 
> >> 
> >>>>> +}
> >>>> 
> >>>> [blah blah]
> >>>> 
> >>> 
> >>> Yeah, but the whole expression is quite reader-hostile, as min/max
> >>> things often are.
> >>> 
> >>> How about doing
> >>> 
> >>> /* comment */
> >>> if (this1)
> >>> return that1;
> >>> /* comment */
> >>> if (this2)
> >>> return that2;
> >>> /* comment */
> >>> if (this3)
> >>> return that3;
> >>> 
> >>> ?
> >>> 
> >>> The code generation will probably be just as good and it's __init-time
> >>> stuff anyway.
> >> 
> >> Something like?
> >> 
> >> static inline size_t page_ext_data_alignment(size_t size)
> >> {
> >>        /* No client data means no alignment requirement. */
> >>        if (!size)
> >>                return 1;
> >> 
> >>        /* u64 has the strictest alignment required by page_ext clients. */
> >>        if (IS_ALIGNED(size, __alignof__(u64)))
> >>                return __alignof__(u64);

Maybe add a const local for __alignof__(u64)? 
No strong feelings about it.

> >> 
> >>        /*
> >>         * A type's size is a multiple of its natural alignment, so its
> >>         * lowest set bit is at least that alignment.
> >>         */
> >>        return 1UL << __ffs(size);
> >> }
> > 
> > Well I prefer it!
> > 
> > The final bit-twiddle could be (size & ~size) but I'm not sure that's
> > any clearer.
> > 
> > We should have a handy helper for this operation but I can't find one. 
> > max_pow_of_two_factor() is close, but only works on uint.
> 
> How about changing the helper to
> 
> #define max_pow_of_two_factor(n) ({					\
> 	typeof(n) __n = (n);						\
> 	static_assert(__same_type(__n, 0U) || __same_type(__n, 0UL));	\
> 	__n & -__n;							\
> })
> 
> ?
> 

-- 
Sincerely yours,
Mike.
