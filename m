Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981091;
	b=VPliDMJJ6tkLC9hlJkXfaqQw8k02VmWeV8VaXCmFiZE44Pooq+OrBhlUn0tjNPH/l1gq
	 MlKezGQyqQXceZRMmt+9oFcDRfLd7J+flizO04g4AUoebmEBEF8klUYgsd/fuP132/ePy
	 yob9D2iJfgxPKk37cHaSRKJvrdjyv+/GlZjg6vioAhFY3wiUndbsSpWJyn/x8eUtFWi9d
	 Gm2m/ZB2m2jZAWyxrTV3nNxT38S1xCIvUX0o8fCxfenV18C9uXoWWSI99TsFfIgpBOWkL
	 oRq73Ck40n4l9nJQOwWH3gH6lRVMSF/T7l/HZUo5HnkeiCBD3z0yiqEbcK3+KTjQIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981091;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PSw6ZugS96kEz4/rIAoJ19YrrOB0SWDDu8VwO1dP5m8=;
	b=rn8V2lyniSbJcBZkCwvy0VTzZnb/3rmD//fw5MV19WLb5OheMHGR1wORxm/dvPBLRTml
	 FD0ZuwGu3B64j3MmFgDUAoUjff3yEVtKGHHkVQF80wC7/q8vjJsA4+jSkkqbDNyIUYhzG
	 sE0U3V33L7PttU8YcFSFLAhM54uvcnPAzGqtE8qLLdJA83wVkjA8q6qF4o2R+OnpnW4kb
	 sLJF0jzWleXjWg7vyEzAAfynDl+jjW01VTfyrLYSBKuBFD8QCGvj2Kaq5nfSyfWBuRi8+
	 FAHP+B6TT+u8xOXmutcR92YZK+a/SkB9sRWZW1aOhpHRBj9u1cnMN6v5KJrxHnUuZGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=lwHpMddg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DACD606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=lwHpMddg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7B51F000C4;
	Wed, 18 Nov 2026 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794981090;
	bh=PSw6ZugS96kEz4/rIAoJ19YrrOB0SWDDu8VwO1dP5m8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lwHpMddgeDHi6TjIDH+6VVQjeNyiAfOC814NA6PtmuFFkHkSlZfdhHAkOobfcDcPz
	 CoNNJexbEbPdybV/yoAqdH6vgwZLBU6OWK/guFYoqQkkJKOLQNhcBtqaIPDSMGm/7Y
	 VRPZbN0YTlrodK8wlLLu+pb7MZFXkxdLG+v26qP4=
Date: Tue, 17 Nov 2026 21:51:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>,
 Muchun Song <songmuchun@bytedance.com>, Alexander Potapenko
 <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Chris Down <chris@chrisdown.name>, David Hildenbrand
 <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Johannes
 Weiner <hannes@cmpxchg.org>, Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>, Ketan
 <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, kasan-dev@googlegroups.com, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/7] mm/page_ext: fix client data alignment
Message-Id: <20261117215129.d7bcc7bfa060daf99828f0c0@linux-foundation.org>
In-Reply-To: <11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-3-songmuchun@bytedance.com>
	<sashiko-outbox-219498@kernel.org>
	<20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
	<F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
	<20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
	<11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 13:39:04 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> 
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

err, (size & -size).

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

Switching max_pow_of_two_factor() to take a ulong should be OK - the
thing only has two callers.  But oh, that name!

But do we really want to go there?  The drama with min/max/min_t/max_t
and especially clamp has been endless.

Your open-coded bit-twiddle looks great ;)
