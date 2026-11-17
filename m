Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944797;
	b=RFL2ryiU6Cyl1QlWmSJGncfrMMaIQZXfog7z82DaX6a0dFkLzHtzmXBQIzv/EqSPIrc3
	 JJeU+vbT/95REQZRVZ1DCToPBJyTbx5mKv4d50ij1o4T8U47OIpwsql3yALprAdMsmh41
	 EvHxxFOyMN6yQByB5aHoxur3t6MMTKkrdaWg/uj1p/5Mx98DCJ45j0ISblEjUKF+RthFt
	 cX2HTrfMkjfowZaBu9VP7XSA5at2FeikZ7zo1sh+hS4Nw5O69Dz/UuTA/6M4jNxHJPk8O
	 NMfCfDojzdNlhYTovKY+SHTGCLYDW8hYH1X6kQbCdETeEX/jbX5jnwltY0W+Tz7oxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944797;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QzRriqS/gCV9txdZ0C8J+i8ic1h6+szbkNOsGAH6yA0=;
	b=XpGjETEuTuV3AEE469zrPOy/mrDV+b18fPXRwSEQ2aAIyIojaRGtwXpKQoUOAR/R1CIy
	 Jw82VI2ebz6+ew+XTerGcrwQf8nPmMGkXGbAHEjLHuO2dRVtis+tdq8jfXYon+26dQe5a
	 ocjPiST4oGtCa8l3+EMYz+gCvUXD6e2OgrblB0J89XyJSqPIEFnVW9FDrRV1n1ZmU2K+3
	 ndkmxaYmUUL2U1/hJrojNNPLih1eqNEg/FyzpRr/xBHaM8JjtMmsgczibnYb7L2CWI3D3
	 SoVDp3yNKYuNCwwMrjaynzC0wHvm+5PSgjd/2LSIT+SKQGDayBaRqMAD5+G342OcMKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=PMSPOF9E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E47606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=PMSPOF9E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474491F000C4;
	Tue, 17 Nov 2026 19:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794944797;
	bh=QzRriqS/gCV9txdZ0C8J+i8ic1h6+szbkNOsGAH6yA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PMSPOF9E+K0Vd18R5fn1hQrOpW89ujbJ0rpDZ8+drADajQ8NiZ2KyubHfOprFbo9w
	 mBxRSH5mWPFmLqu2iQo0FRjbsKdlgSX+GyzWN6MvhfAROdH4rHa3JZN5/ZhyQTUHsp
	 51NWlVfbgawLl+7HkK+0XmRys1yyKIKeWcYZJCRQ=
Date: Tue, 17 Nov 2026 11:46:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, "Muchun Song" <songmuchun@bytedance.com>,
 "Alexander Potapenko" <glider@google.com>, "Marco Elver"
 <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Chris Down"
 <chris@chrisdown.name>, "David Hildenbrand" <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Zi Yan" <ziy@nvidia.com>, "Muchun Song"
 <muchun.song@linux.dev>, "Joerg Roedel" <joerg.roedel@amd.com>, "Lu Baolu"
 <baolu.lu@linux.intel.com>, "Pranjal Shrivastava" <praan@google.com>, Ketan
 <ketan.kishore@oss.qualcomm.com>, "Mostafa Saleh" <smostafa@google.com>,
 "Sang-Heon Jeon" <ekffu200098@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, kasan-dev@googlegroups.com, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/7] mm/page_ext: fix client data alignment
Message-Id: <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
In-Reply-To: <sashiko-outbox-219498@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-3-songmuchun@bytedance.com>
	<sashiko-outbox-219498@kernel.org>
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

On Tue, 17 Nov 2026 19:36:23 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/page_ext: 4-byte alignment cap in
>   page_ext_data_alignment() on 32-bit
> --
> 
> commit 4ecca9da35d7e4448f4270965043775293174eda
> Author: Muchun Song <muchun.song@linux.dev>
> 
> mm/page_ext: fix client data alignment
> 
> This commit aligns page_ext client offsets and rounds the final entry size to
> the largest active client alignment.
> 
> > diff --git a/mm/page_ext.c b/mm/page_ext.c
> > index b679a8c1f7d7e..dbc1bfa258f15 100644
> > --- a/mm/page_ext.c
> > +++ b/mm/page_ext.c
> > @@ -116,8 +116,22 @@ static int __init setup_early_page_ext(char *str)
> >  }
> >  early_param("early_page_ext", setup_early_page_ext);
> >  
> > +static inline size_t page_ext_data_alignment(size_t size)
> > +{
> > +	if (!size)
> > +		return 1;
> > +
> > +	/*
> > +	 * A type's size is a multiple of its natural alignment. The lowest
> > +	 * set bit of the size is therefore at least that alignment. Cap it
> > +	 * at unsigned long alignment to avoid excessive per-page padding.
> > +	 */
> > +	return min_t(size_t, 1UL << __ffs(size), __alignof__(unsigned long));
> > +}
> 
> [blah blah]
>

Yeah, but the whole expression is quite reader-hostile, as min/max
things often are.

How about doing

	/* comment */
	if (this1)
		return that1;
	/* comment */
	if (this2)
		return that2;
	/* comment */
	if (this3)
		return that3;

?

The code generation will probably be just as good and it's __init-time
stuff anyway.

