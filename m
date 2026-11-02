Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627346;
	b=L3ivzoDBBngG8HP4WJi6VgU0Bt8vFvcDi8gATcO/HeJukU+Tt3g1+yInLFnNb+zUUEhw
	 +8COoK/LUQdfVDTQHFEvadp7fi1+PTxRUtuplIhw/bksZnVgvXBnfn/qZGoQV+eC7PjNy
	 qsFjWUmiWyu+FQ4YGlnl5HFGu7wsBjuCTkSaCG54QUo2vBTcAZ6JSWqhOWn0HGPqGAXx6
	 HTQ5FXFyTfXrvI5KLKK0oHU9kaGU86YRde0e8lwqoq7n+b2P/FrvUuo0ouy/CFkwcD9/O
	 gzaICbrIgIKUIyZ/lwqTy1CV7m+fF/A5NLnjcz3muT/7Z7lbLnYQd3MV8MiLxUEEA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627346;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t19/VpHeuZfEnwqIz1VMgr6RSjKRD0I7ktZ5p1JSZr4=;
	b=hF+kzJApmlBfVvxrAdsGxhjvR2YUAkrvcuiUxYpO9jKqYiOodugwvZqB5mvarMTXZSn2
	 bGwCJTUx7abc4bnMOvMnJWlPl1QWU5ldj191T2CS4TGCwZa84lEkhmE+MD84L4NqJ+i3O
	 JI1XqHhuhUtbIJmP/mzZx84SX4RXm//o4gYdayAi9XY3AfBXrMfEDUp941x3uj3VIIYz+
	 p4Xe0O+JCiyMsqfrOtlohj7hNixiCprf62J6n/SpH3dN5rF6GTDOgoC2EO53ZuIYyvCBz
	 dYLx5tXHCVFWmptXiWJXqtEKg0Uuwa3sl+JjprB9gs8/bOt7oVteF9fPVaTe13HPzAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAowWd3B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2EC606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAowWd3B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8BC1F00A17
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627345;
	bh=t19/VpHeuZfEnwqIz1VMgr6RSjKRD0I7ktZ5p1JSZr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DAowWd3BMUfOYCsfzNlODEe95CKBes8NC8j1cPffVVZVFZQDgdjT3WLYp2VnOJKLt
	 IcB5y6w4kUbZv1cPdCLmYUMPvVqna4N8ai3wCyeqKoNhUv6hPHZbuo2QK42VD4MfyX
	 cZ3anIB5v1r1ErFiJja5fVMTccdAfNPZov4fMU0jCf3MTvzuVElfzRLIYoICiQhYvv
	 4QXnxTUll0IjMX98rYsajwypqPrJbDI9NAqt3fjuZ2b7ZpdxK7BDLcSmsgYV0E91dN
	 UGrsiqKH7M3QRPihurxs3rvC8y32qzJF1yUiasKVU7E0oj8Z6GPxntDn3NiKSXU8UD
	 UcfkHjax1xpmg==
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-745497ac8fcso1247749137.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 05:49:05 -0800 (PST)
X-Gm-Message-State: APuU4Z9PwcYHJwQ5e29FNtyOsbJo53XD9OzMpNlqCVNugtHGcnLYprW0
	yARbAv2CU+P5I7XVo6kU+PpCEwElh4uioOm8tTNfyL1W8R+2ffncq2OvGWTRRKcTkMsetF6notg
	AluYcqX9hEV3Fagm1W7UdR7AZ2i2lz6A=
X-Received: by 2002:a05:6102:6047:b0:7c3:ac59:158b with SMTP id
 ada2fe7eead31-7d072c91ddemr2933364137.23.1793627344929; Mon, 02 Nov 2026
 05:49:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-8-songmuchun@bytedance.com> <sashiko-outbox-192874@kernel.org>
 <2D6DE4F4-8DB1-45D4-B076-36FE6714C575@linux.dev>
In-Reply-To: <2D6DE4F4-8DB1-45D4-B076-36FE6714C575@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 2 Nov 2026 21:48:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4BPOJJy367p0MZcEWk3WziV3rPiCtoKPSGOqrQt5W1Pw@mail.gmail.com>
X-Gm-Features: AclHuK8vnwbfTipAOd6WMVXtrU5YJ6-7EJCkQE6p8MgAvtOeminm8SJMrGrSJ0M
Message-ID: <CAAhV-H4BPOJJy367p0MZcEWk3WziV3rPiCtoKPSGOqrQt5W1Pw@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] mm: hugetlb_vmemmap: simplify shared tail page handling
To: Muchun Song <muchun.song@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Muchun Song <songmuchun@bytedance.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	James Houghton <jthoughton@google.com>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:12=E2=80=AFPM Muchun Song <muchun.song@linux.dev> =
wrote:
>
>
>
> > On Nov 2, 2026, at 11:52, sashiko-bot@kernel.org wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] mm: hugetlb_vmemmap: uninitialized tail page read in vmemmap_o=
ptimize_pte()
> > --
> >
> > commit 32511c4a4d8ec3d45e0f629f89666a78dc9372ee
> > Author: Muchun Song <muchun.song@linux.dev>
> >
> > mm: hugetlb_vmemmap: simplify shared tail page handling
> >
> > This commit removes the vmemmap_tail field from struct vmemmap_remap_wa=
lk and
> > updates vmemmap_optimize_pte() and vmemmap_restore_pte() to derive the =
shared
> > tail page directly from the folio being processed.
> >
> >> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> >> index 5e84004db4b87..d0af251aa533c 100644
> >> --- a/mm/hugetlb_vmemmap.c
> >> +++ b/mm/hugetlb_vmemmap.c
> >
> > [ ... ]
> >
> >> @@ -213,53 +211,53 @@ static struct page *vmemmap_dup_page_from_list(c=
onst struct page *src,
> >>      return dst;
> >> }
> >>
> >> -static void vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
> >> -                             struct vmemmap_remap_walk *walk)
> >> +static inline struct page *folio_vmemmap_shared_tail_page(const struc=
t folio *folio)
> >> {
> >> -    struct page *page =3D pte_page(ptep_get(pte));
> >> -    pte_t entry;
> >> -
> >> -    /* Remapping the head page requires r/w */
> >> -    if (unlikely(walk->nr_walked =3D=3D 0)) {
> >> -            struct page *head;
> >> +    return vmemmap_shared_tail_page(folio_order(folio), folio_zone(fo=
lio));
> >> +}
> >>
> >> -            VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
> >> +static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
> >> +                            struct vmemmap_remap_walk *walk)
> >> +{
> >> +    const struct page *page =3D (const struct page *)addr;
> >> +    const struct folio *folio =3D page_folio(page);
> >> +    struct page *src =3D pte_page(ptep_get(pte)), *dst;
> >>
> >> -            head =3D vmemmap_dup_page_from_list(page, walk->vmemmap_p=
ages);
> >> -            entry =3D mk_pte(head, PAGE_KERNEL);
> >> +    if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order=
(folio)))) {
> >> +            dst =3D folio_vmemmap_shared_tail_page(folio);
> >> +            if (!dst)
> >> +                    return -ENOMEM;
> >>      } else {
> >> -            VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
> >> -
> >> -            /*
> >> -             * Map the shared tail page writable. A lockless get that=
 read
> >> -             * a non-zero refcount before the remap can still do its
> >> -             * cmpxchg after it. The refcount is zero, so the cmpxchg
> >> -             * fails and leaves the page unchanged.
> >> -             */
> >> -            entry =3D mk_pte(walk->vmemmap_tail, PAGE_KERNEL);
> >> +            dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pag=
es);
> >>      }
> >
> > [Severity: High]
> > Can calling page_folio(page), folio_order(folio), and
> > folio_vmemmap_shared_tail_page(folio) on every PTE in vmemmap_optimize_=
pte()
> > read uninitialized tail struct pages for bootmem gigantic hugepages?
> >
> > During early boot in alloc_bootmem_huge_page(), gigantic hugepages mark=
 all
> > tail pages [pfn + 1, pfn + nr_pages) with memblock_reserved_mark_noinit=
(), so
> > memmap_init_reserved_pages() skips initializing their struct pages:
> >
> > mm/hugetlb.c:alloc_bootmem_huge_page() {
> >    ...
> >       if (hugetlb_vmemmap_optimizable(h))
> >               hugetlb_vmemmap_optimize_bootmem_page(pfn, huge_page_orde=
r(h));
> >    ...
> >       memblock_reserved_mark_noinit(PFN_PHYS(pfn + 1),
> >                                     (nr_pages - 1) * PAGE_SIZE);
> > }
> >
> > When a bootmem gigantic hugepage is not aligned to PAGES_PER_SECTION (f=
or
> > example, when nr_pages < PAGES_PER_SECTION, such as on 64-bit LoongArch=
 with
> > 16KB base pages where SECTION_SIZE_BITS is 29 and PMD_SHIFT is 25 with
> > CONFIG_ARCH_FORCE_MAX_ORDER=3D10), section_set_compound_order_range() r=
eturns
>
> This issue does not occur with the default LoongArch configuration. For
> 16KB base pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11, which
> matches HUGETLB_PAGE_ORDER.
>
> The reported case requires manually overriding CONFIG_ARCH_FORCE_MAX_ORDE=
R
> to 10 while keeping HugeTLB enabled. This creates an **invalid configurat=
ion**
> that Kconfig currently permits:
>
> HUGETLB_PAGE_ORDER      =3D 11
> MAX_FOLIO_ORDER         =3D 10
>
> LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so the generic MM code
> assumes that folios cannot exceed MAX_PAGE_ORDER. The forced configuratio=
n
> violates that assumption and is already diagnosed by:
>
>         WARN_ON(order > MAX_FOLIO_ORDER);
>
> in hugetlb_add_hstate().
>
> Therefore, this is not a regression in a supported LoongArch configuratio=
n,
> and I don't think this series needs to handle it. The proper fix is a sep=
arate
> LoongArch Kconfig change preventing ARCH_FORCE_MAX_ORDER from being set b=
elow
> the HugeTLB order when HugeTLB is enabled.
Yes, this isn't a regression, the problem existed before this series.

I suggest change BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER >
MAX_FOLIO_ORDER) to MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER >
MAX_FOLIO_ORDER) in mm/hugetlb.c, which cause a build error
immediately for invalid ARCH_FORCE_MAX_ORDER configurations.

Huacai

>
> Cc LoongArch maintainers.
>
> Thanks,
> Muchun
>
> > early without setting section->compound_page_order:
> >
> > include/linux/vmemmap-optimization.h:section_set_compound_order_range()=
 {
> >       unsigned long section_nr =3D pfn_to_section_nr(pfn);
> >
> >       if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION))
> >               return;
> >    ...
> > }
> >
> > In that case, sparse_init() allocates regular vmemmap pages via
> > memmap_alloc(), leaving them uninitialized (or filled with 0xff under
> > CONFIG_DEBUG_VM).
> >
> > Later, gather_bootmem_prealloc_node() initializes only the first
> > VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES struct pages (covering only the fi=
rst
> > vmemmap PTE), and prep_and_add_bootmem_folios() defers initializing the
> > remaining tail struct pages until after hugetlb_vmemmap_optimize_folios=
()
> > runs and fails:
> >
> > mm/hugetlb.c:gather_bootmem_prealloc_node() {
> >    ...
> >               hugetlb_folio_init_vmemmap(folio, h,
> >                                          VMEMMAP_OPTIMIZATION_NR_STRUCT=
_PAGES);
> >               init_new_hugetlb_folio(folio);
> >
> >               if (vmemmap_optimizable_order(pfn_to_section_compound_ord=
er(pfn)))
> >                       folio_set_hugetlb_vmemmap_optimized(folio);
> >    ...
> > }
> >
> > mm/hugetlb.c:prep_and_add_bootmem_folios() {
> >       /* Send list for bulk vmemmap optimization processing */
> >       hugetlb_vmemmap_optimize_folios(h, folio_list);
> >
> >       list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> >               if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
> >                       hugetlb_folio_init_tail_vmemmap(folio, h,
> >                                       VMEMMAP_OPTIMIZATION_NR_STRUCT_PA=
GES,
> >                                       pages_per_huge_page(h));
> >               }
> >    ...
> > }
> >
> > Previously, __hugetlb_vmemmap_optimize_folio() derived vmemmap_tail upf=
ront
> > from the initialized head folio, and vmemmap_optimize_pte() checked
> > walk->nr_walked =3D=3D 0 without inspecting tail struct pages.
> >
> > With this change, on the second and subsequent PTEs (where addr >=3D
> > vmemmap_start + VMEMMAP_OPTIMIZATION_SIZE), page->compound_info in the =
tail
> > struct page at addr has not been initialized by prep_compound_tail() ye=
t:
> >
> > 1. If the raw vmemmap backing pages are zeroed, page_folio(page) return=
s page
> > itself rather than the head folio, folio_order(folio) returns 0, and
> > vmemmap_optimizable_pfn() returns false. vmemmap_optimize_pte() then fa=
lls
> > back to vmemmap_dup_page_from_list(src, walk->vmemmap_pages) for every =
tail
> > PTE, rotating the displaced vmemmap pages across the tail PTEs instead =
of
> > mapping the shared tail page, while leaving HPG_vmemmap_optimized set s=
o
> > prep_and_add_bootmem_folios() skips hugetlb_folio_init_tail_vmemmap().
> >
> > 2. If CONFIG_DEBUG_VM is enabled, page_init_poison() fills the uninitia=
lized
> > tail struct pages with 0xff. _compound_head(page) then evaluates to the
> > poisoned tail page itself, and folio_order(folio) reads 0xff, leading t=
o an
> > out-of-bounds shift in vmemmap_optimizable_pfn() and an out-of-bounds
> > node_zones access in folio_zone(folio).
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102032525.=
3597743-1-songmuchun@bytedance.com?part=3D7
>
