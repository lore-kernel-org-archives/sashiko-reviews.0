Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975697;
	b=OOEph8yLHdUzLMSyQttQmLeOw+HO5KNz+hnz3ze6qJkDk8LvhY9qtwtBwFxitTBtLboA
	 kmypA/RNUlfciUT5BJufUR9SWz1vAQH42CSjKUZ61Wk6XNBimt2gAkmcfEBerI0Oyd+p/
	 V9OHmCm7fcufFV+MfvcpiB7SQlGMaBbAmQoSzb/6NWAeHnPLw08QSrURZNE2pLUg+wGtB
	 9/cueDFUaMf8jFsEZQwPTvpJ6jkwTB07FYtIC6P4c+DpuLM7C8LmHTLEkd+A/IgDJXEpn
	 gX8gHaIYcr/gLXdkAV2cNtlCwJdQRwgQ7cenuYbjM5xiL4+PAfTGN6NulatsCySZgcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975697;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mDxOq3MFeqPRgslRS9KcBTPZ5rg8SlBfNM7oWoWdBfI=;
	b=VWdcJZKis9hn3WRiqMhjEu4HPQbj5ByPXuiykjful+zwvtK+V5hNJRCysGmOlpB/P8gR
	 BO0nnu3TK3lON9lQ2eS5ltX/mmeh+F4Kfa8xBe1Tx0mQT/nB45yW0d5NM80qoiBwJPtdZ
	 v7goQMjBsTL5rTzxHa59KIY+6TYndK9XcoYeyCiDus87b6aFBjqMJIkvwnT+sFP9Y57hq
	 c7ALC1UrA6VlAjNvYlUcFjSOgdy9xPVVX5QBPhoHpPIUgoGcNuDmIIKEenpskH5su7FQ0
	 zolwRWTsYOqfJXWctHx+GNhg0+N4S5vn/g3903qqAOoG/CRnB9IJV4q2U6WdPhCJqlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="Z6IJn/EZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0B606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 04:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Z6IJn/EZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F501F000C4;
	Wed, 18 Nov 2026 04:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794975697;
	bh=mDxOq3MFeqPRgslRS9KcBTPZ5rg8SlBfNM7oWoWdBfI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Z6IJn/EZLhpVf7Bpg4j6edLYiqsuySU/IeCVjnL+K+BMCndtR8dEQl5AFmlurEHkG
	 Vsi40neJA1iNlrVgmZUO8K2zEcC+8AZAi+a0hQwtt0Qs7/k8nS98+PK3aIHGTC6IDP
	 8HsdqFV95BrDVTK6YzVrb7+e4c0YXGd2qlRDzGM8=
Date: Tue, 17 Nov 2026 20:21:36 -0800
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
Message-Id: <20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
In-Reply-To: <F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-3-songmuchun@bytedance.com>
	<sashiko-outbox-219498@kernel.org>
	<20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
	<F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
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

On Wed, 18 Nov 2026 11:49:58 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> 
> 
> >>> +}
> >> 
> >> [blah blah]
> >> 
> > 
> > Yeah, but the whole expression is quite reader-hostile, as min/max
> > things often are.
> > 
> > How about doing
> > 
> > 	/* comment */
> > 	if (this1)
> > 		return that1;
> > 	/* comment */
> > 	if (this2)
> > 		return that2;
> > 	/* comment */
> > 	if (this3)
> > 		return that3;
> > 
> > ?
> > 
> > The code generation will probably be just as good and it's __init-time
> > stuff anyway.
> 
> Something like?
> 
> static inline size_t page_ext_data_alignment(size_t size)
> {
>         /* No client data means no alignment requirement. */
>         if (!size)
>                 return 1;
> 
>         /* u64 has the strictest alignment required by page_ext clients. */
>         if (IS_ALIGNED(size, __alignof__(u64)))
>                 return __alignof__(u64);
> 
>         /*
>          * A type's size is a multiple of its natural alignment, so its
>          * lowest set bit is at least that alignment.
>          */
>         return 1UL << __ffs(size);
> }

Well I prefer it!

The final bit-twiddle could be (size & ~size) but I'm not sure that's
any clearer.

We should have a handy helper for this operation but I can't find one. 
max_pow_of_two_factor() is close, but only works on uint.
