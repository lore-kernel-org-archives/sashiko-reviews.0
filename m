Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384883;
	b=cCl8N7EJZ6g5rspehGdU+9JhGaDEWVEVVTzvvLJg6dlmeYXfYOtuHQoezYcnxwzapVrq
	 YPBMi37F3LhuRE06yv7jegO/vVWIPUS4KYJckvPLr4UQsI1wvHl4ggC/HXQxWtU/C/GaB
	 RG1RJ/kjaN2/d7KK8BtGki4XFGMOVtm0njjnLTp4VyFFzFCJmCI3O8gOLsAbcBisoFBXw
	 9UOS0F440iEdJ46bJoCSr1nGhg+9P3/5tYHvAcPAVhDZ6+fQmp+MA1THYK9OUZUKB6oxU
	 jD4rEIet9bwjsCGgdYQ/4inEYq2y4vUZC7qrmMC9njoTI2MgkTqec2aKq3Js2WVi0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384883;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uY7NltkZRK4c61bzzoP5vXdUizlOC9r8M6o8Y/d5dgc=;
	b=SIN4B6VKMSYfdGMVhjBI+S7zrh8flztwu1ffsPb4Y8WhT4Oq/ct7RoSwKHaLUuocstPF
	 gC8HFVbU4DPechLJ7T3Q6uvnBD6QxhLKsFAgRhJy+ulELQiCBPvZmH/Taeh3YPornF+pc
	 0E74LxVBIVKenrpln2/wh5F9o2dKkFw4A0jAsH2kfpoPTDClaXGczHLKMz3YXoF/ekwKg
	 Csp4eueIDuOazZumaPE8cxVo6lZCwfE7GSDc3nkaJWMHvP98g/4mdwnWYWeoVwfBgtlau
	 9rkhkCLiXKLqYI0mbq+W34CVPsCUidqdj9b6xdAbGrEUfJXmrppD2q9IFlgq6+ShP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWKcGXoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F7606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWKcGXoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4C21F00A0A;
	Wed, 11 Nov 2026 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384883;
	bh=uY7NltkZRK4c61bzzoP5vXdUizlOC9r8M6o8Y/d5dgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AWKcGXoq/6ETAORp2VtMh0VkhKs303MJjyjXA6xxBTHx10MNbZiTaI+w6sHzhYVg+
	 EAbQ7bQo0ttfQk7mxclnl/0MtESsare84d6DvssA1JURCT4y7vmCnFUcGCDlj9a7lr
	 Ar3aN5Q0fvY0uIYXUNXkRCujH/zLmTbPK+wDgmiuoano934Lp14zr3qxmsHsyTExHs
	 +9rWmjXu5gAqZP9ONqsXjspCW9ojQ9e57MnoWV4dWAkLCvey/EVhGWs+NTwzjGex/v
	 A2RxvKL8pEhuCGIBEO8xcx7weTKesAriU0zFWprdZ4NyaVp1R7vtNzgOGR3yWpT4j1
	 shQEUth5IOZBw==
Date: Wed, 11 Nov 2026 10:14:36 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
	apopple@nvidia.com, balbirs@nvidia.com, david@kernel.org,
	muchun.song@linux.dev, osalvador@suse.de, linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] mm/hugetlb: optimize bootmem hugepage tail
 vmemmap init
Message-ID: <avQj7BnvB5K7vZe5@kernel.org>
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
 <20261110114859.76343-3-lizhe.67@bytedance.com>
 <sashiko-outbox-207133@kernel.org>
 <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>
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
In-Reply-To: <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>

On Wed, Nov 11, 2026 at 11:14:46AM +0800, Li Zhe wrote:
> On 11/10/26 9:35 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [High] mm/hugetlb: out-of-bounds write in
> >    hugetlb_folio_init_tail_vmemmap()
> > --
> >
> > commit 5be89b38412d58045fd600596787f54c7559d32c
> > Author: Li Zhe <lizhe.67@bytedance.com>
> >
> > mm/hugetlb: optimize bootmem hugepage tail vmemmap init
> >
> > This commit optimizes bootmem hugepage tail struct page initialization by
> > seeding a template from the first tail page and initializing the remaining
> > tail pages via memmap_init_page_from_template().
> >
> >> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >> index cb2de24affdc4..6ae5d2679e3aa 100644
> >> --- a/mm/hugetlb.c
> >> +++ b/mm/hugetlb.c
> >> @@ -3239,6 +3239,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> >>   	enum zone_type zone = folio_zonenum(folio);
> >>   	int nid = folio_nid(folio);
> >>   	struct page *page = folio_page(folio, start_page_number);
> >> +	struct page template;
> >>   	unsigned long head_pfn = folio_pfn(folio);
> >>   	unsigned long pfn, end_pfn = head_pfn + end_page_number;
> >>   	unsigned int order = huge_page_order(h);
> >> @@ -3247,11 +3248,20 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> >>   	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
> >>   	 * we must initialize them ourselves here.
> >>   	 */
> >> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
> >> -		__init_single_page(page, pfn, zone, nid);
> >> -		prep_compound_tail(page, &folio->page, order);
> >> -		set_page_count(page, 0);
> >> -	}
> >> +	pfn = head_pfn + start_page_number;
> >> +
> >> +	/*
> >> +	 * Seed a template from the first real tail page and refresh only
> >> +	 * PFN-dependent fields before copying it.
> >> +	 */
> >> +	__init_single_page(page, pfn, zone, nid);
> >> +	prep_compound_tail(page, &folio->page, order);
> >> +	set_page_count(page, 0);
> >> +	memcpy(&template, page, sizeof(template));
> >> +
> >> +	for (pfn++; pfn < end_pfn; pfn++)
> >> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
> >> +					       &template);
> > [Severity: High]
> > Can peeling the first iteration out of the loop overwrite the struct page
> > past the end of folio when start_page_number >= end_page_number?
> >
> > Previously, the loop was a no-op when pfn >= end_pfn.  Now, when HVO does
> > not optimize a gigantic folio, prep_and_add_bootmem_folios() calls
> > hugetlb_folio_init_tail_vmemmap(folio, h,
> > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES, pages_per_huge_page(h)) after
> > gather_bootmem_prealloc_node() has already initialized the first
> > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES pages.
> >
> > On configurations where a gigantic page has pages_per_huge_page(h) <=
> > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES (for example, powerpc
> > mpc885_ads_defconfig with 16 KiB pages, MAX_PAGE_ORDER == 8, and 8 MiB
> > gigantic hugepages of order 9, where both values are 512), this
> > unconditionally initializes folio_page(folio, start_page_number) and marks
> > the adjacent physical page's struct page as a compound tail of folio,
> > corrupting mem_map.
> 
> Thanks for the report. This looks valid.

I love how sashiko finds issue on very niche systems.

But yeah, ppc8xx actually uses hugetlb :(

> I will restore the empty-range check before seeding the template in v3.
> 
> Thanks,
> Zhe
> 

-- 
Sincerely yours,
Mike.
