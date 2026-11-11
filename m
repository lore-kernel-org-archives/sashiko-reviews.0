Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384967;
	b=a4NSTxHlfmmyBkD+g6B88SRmzZ9ttvOw7dIYHG6uqHrVF1TIspQGsQNIYcrf61kEYG3b
	 CXGgaSCJr+9Q9k5IrVvGXEvHAGtl7LkMEAWYq2PKPt9IxsqthshvyGTJF0on8Wjy9BhK9
	 ppkSNPHHzgiRsstx7Ja6zbZooUPz86wTTnnhoo2J6ygTWzB6rO8MqDpHl5zXizgkaRT/5
	 4hsi73H6oEtoqSTx2Skl6+OV9mhkft3KzZVtd4x3Q/NtJy9L63q5/yxkS7LhB4IJ/nOCf
	 da7zYMTGN6AaQqSgnCIPmXXeVCKRNI91T3T7toU6EtUESQP7oHIBC5T10OYu4WsQO4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384967;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7Vig0zooMPJUlYt2Ok7NwulSRX4Gi1J5EAQpfybMME0=;
	b=08Eye93xntNqGy9/+KAuWI/7wNOqLynBtCTTYfCGLJAmlR+wsxWIJaBBGpwPGg9r74Fa
	 8ELtzQFPJDdw1IpWYTPIBoZ6wvQ0/DobEzJL/zj4WQXevJmkytnW7EvUnKr9qECJG3VAv
	 5XRfydskP83JlVwNUbbiOoQvFPEY8nJ/RkQBwaq5yv8+dtQ9fWnBG7q6qIjaSh2ekOeEZ
	 Yf9/gVD0hW2CDPh6Lk3pIIT+GYbnj35aXbkTes3ie9UKk+gokcPG1Wggp+3kx5zwy/kXo
	 7T2OZsmtj/r/IHRIsJ0a/2RGYnG+P4I9bdBt2CzurJvqSyTR62YJN9vDxcR8cggRq4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/SpYXbE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E7B606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/SpYXbE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1C81F00A05;
	Wed, 11 Nov 2026 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384966;
	bh=7Vig0zooMPJUlYt2Ok7NwulSRX4Gi1J5EAQpfybMME0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W/SpYXbEL2cpxSVTse+uNK7NSNDO9im2+XzlZC183XpcRSN2XowUT8ze3QqtIi0gb
	 09KjPcZ1cpFSUKZqeL2DXSLudv/zkcGvhuwVwNFcWdpJqFWlZShgSWNENIxXUjMWZq
	 G9CtwRqQuh3DAymkOGDr2YgML8x4jpA694ZAphT0WaPCHbLeIGIN7RFaXXehAE9xyv
	 l1ySeLi13pZj5Iw5g+tXVqq63XcdGkAD63uotxoJqgL52CXfouUFI2j1Li3aPQvz9n
	 k3+kLFgLgGCvNEC5Xg+Gan0XhHWn7BL2bvqpF/NTeYPO/02UzlbdBO7pfglFiIALOP
	 IOxaWVTz200eA==
Date: Wed, 11 Nov 2026 10:16:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Li Zhe <lizhe.67@bytedance.com>, linux-mm@kvack.org,
	sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
	apopple@nvidia.com, balbirs@nvidia.com, david@kernel.org,
	osalvador@suse.de
Subject: Re: [PATCH v2 2/2] mm/hugetlb: optimize bootmem hugepage tail
 vmemmap init
Message-ID: <avQkQKRkYV32Qkxp@kernel.org>
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
 <20261110114859.76343-3-lizhe.67@bytedance.com>
 <sashiko-outbox-207133@kernel.org>
 <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>
 <000a2613-6643-4ac1-8378-a3e7df0b211a@linux.dev>
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
In-Reply-To: <000a2613-6643-4ac1-8378-a3e7df0b211a@linux.dev>

Hi,
On Wed, Nov 11, 2026 at 01:28:50PM +0800, Muchun Song wrote:
> 
> On 2026/11/11 11:14, Li Zhe wrote:
> > On 11/10/26 9:35 PM, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential
> > > issue to consider:
> > > - [High] mm/hugetlb: out-of-bounds write in
> > >     hugetlb_folio_init_tail_vmemmap()
> > > --
> > > 
> > > commit 5be89b38412d58045fd600596787f54c7559d32c
> > > Author: Li Zhe <lizhe.67@bytedance.com>
> > > 
> > > mm/hugetlb: optimize bootmem hugepage tail vmemmap init
> > > 
> > > This commit optimizes bootmem hugepage tail struct page initialization by
> > > seeding a template from the first tail page and initializing the remaining
> > > tail pages via memmap_init_page_from_template().
> > > 
> > > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > > index cb2de24affdc4..6ae5d2679e3aa 100644
> > > > --- a/mm/hugetlb.c
> > > > +++ b/mm/hugetlb.c
> > > > @@ -3239,6 +3239,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> > > >    	enum zone_type zone = folio_zonenum(folio);
> > > >    	int nid = folio_nid(folio);
> > > >    	struct page *page = folio_page(folio, start_page_number);
> > > > +	struct page template;
> > > >    	unsigned long head_pfn = folio_pfn(folio);
> > > >    	unsigned long pfn, end_pfn = head_pfn + end_page_number;
> > > >    	unsigned int order = huge_page_order(h);
> > > > @@ -3247,11 +3248,20 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> > > >    	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
> > > >    	 * we must initialize them ourselves here.
> > > >    	 */
> > > > -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
> > > > -		__init_single_page(page, pfn, zone, nid);
> > > > -		prep_compound_tail(page, &folio->page, order);
> > > > -		set_page_count(page, 0);
> > > > -	}
> > > > +	pfn = head_pfn + start_page_number;
> > > > +
> > > > +	/*
> > > > +	 * Seed a template from the first real tail page and refresh only
> > > > +	 * PFN-dependent fields before copying it.
> > > > +	 */
> > > > +	__init_single_page(page, pfn, zone, nid);
> > > > +	prep_compound_tail(page, &folio->page, order);
> > > > +	set_page_count(page, 0);
> > > > +	memcpy(&template, page, sizeof(template));
> > > > +
> > > > +	for (pfn++; pfn < end_pfn; pfn++)
> > > > +		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
> > > > +					       &template);
> > > [Severity: High]
> > > Can peeling the first iteration out of the loop overwrite the struct page
> > > past the end of folio when start_page_number >= end_page_number?
> > > 
> > > Previously, the loop was a no-op when pfn >= end_pfn.  Now, when HVO does
> > > not optimize a gigantic folio, prep_and_add_bootmem_folios() calls
> > > hugetlb_folio_init_tail_vmemmap(folio, h,
> > > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES, pages_per_huge_page(h)) after
> > > gather_bootmem_prealloc_node() has already initialized the first
> > > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES pages.
> > > 
> > > On configurations where a gigantic page has pages_per_huge_page(h) <=
> > > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES (for example, powerpc
> > > mpc885_ads_defconfig with 16 KiB pages, MAX_PAGE_ORDER == 8, and 8 MiB
> > > gigantic hugepages of order 9, where both values are 512), this
> > > unconditionally initializes folio_page(folio, start_page_number) and marks
> > > the adjacent physical page's struct page as a compound tail of folio,
> > > corrupting mem_map.
> > 
> > Thanks for the report. This looks valid.
> > 
> > I will restore the empty-range check before seeding the template in v3.
> 
> Go ahead. I will end up removing this empty-range check here [1].
> 
> [1]
> https://lore.kernel.org/all/20261109095807.41547-8-songmuchun@bytedance.com/
 
Maybe you'll pick these two patches into your series since you anyway
change the same areas?

> > Thanks,
> > Zhe
> 

-- 
Sincerely yours,
Mike.
