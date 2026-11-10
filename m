Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281052;
	b=oi6LlJ4XgD56FIoEmGR0ghfTshWY4bYUEHyNQZ5UcmJolCdef7qMyi6BsftNGMzCxaBb
	 0GafI1ZpUwMol5HZd7LlluNK58xZHZtmQrvOoQVysvkPxQJOp33PjdinmGAjTuW2Xy5Hg
	 nrGbtY0tuI6MOUs/pgvvX2OdISCXERVEN7IMpa0AH7urPJC81rTGbf2OpXoFIZnQWcUdC
	 0/79Q+NQVe2B/NsTh95vYqWqndY2nxADv3Mk6jVjQ1l8tl0eBslmfA/FzNLwIfM2tD/fe
	 G5vc64ot1jd0xRV+fmcl9fLfShww5nIdeE3nQg1PBOdsL7Wk7xIhK1U8ngKdRZqsoSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281052;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=0zxg/oHV6c7bTdjTEStCmT/9znR1pi4716FSd95ju8o=;
	b=hD9XlIyalxfy3qgYzHKeJ1jYYv+7O+sdQAMe8beohm4TXJxJ2QwinwfHK+h7CqXK3zxc
	 D49WmttYJgKR/iQ1CgPx53Hx0sdHFpOT9IL6llNB3Pv9wrq1+B+ftyFEvCYaRCQ5yUF2+
	 i57os9lZXZsbPEfBlL4NFxM9UGP8bUfTAPLO8DZXah18Z4os2tVvhO1M9lgeYLnQH+2Lx
	 Kx8vKw0Kk4LXF6YkmyqODgcg2VCQRgJPSPvHkDCQX8MI9JPuA2TjQOccsiD+dQVliUiRE
	 ATPCamTQHwxmi3xbIoU3wyNkghowHV9QO+w6YRMYZwMfW5u335BsnC1zoZpbM4fsLyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UDtQZH6p;
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AD3606A331
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25AD3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UDtQZH6p
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=AOwIJhgzOk7txoq52yOkZ0HGi+vTCQjqFm7cTO02lc0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794281049; v=1; x=1794885849;
 b=UDtQZH6poI6uKc9PBSA7zBkug/rsyHxmlpAm1bxuO52q3FmBOJtGqyL0N6xYSmd/1nbqi82u
 Ed75jq8nw2GHFHymGG/axmW8r5qEnU02KMymEOqm1aXNuN/91qlV9LaovMO1a9QF5F6Qyx84jnU
 n4Ip9kwIiNXN4i5hnEgCpfa4=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id ca01e065db3b1e04;
	Tue, 10 Nov 2026 03:24:08 +0000
X-Mizu-Trace-ID: ca01e065db3b1e04
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 06/11] mm/hugetlb: initialize all struct pages for bootmem
 hugepages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-204840@kernel.org>
Date: Tue, 10 Nov 2026 11:23:51 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 James Houghton <jthoughton@google.com>,
 Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C89ED4A-9709-42AC-8DF2-3D7691475239@linux.dev>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
 <20261109095807.41547-7-songmuchun@bytedance.com>
 <sashiko-outbox-204840@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 9, 2026, at 18:43, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm/hugetlb: hugetlb_folio_init_vmemmap() wipes KMSAN metadata =
on
>  head page
> --
>=20
> commit e4e80712cfb9bd9a2f1df0a9b2aae1625edb6829
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/hugetlb: initialize all struct pages for bootmem hugepages
>=20
> This commit marks the entire boot-time gigantic hugepage as noinit in
> memblock and initializes the head struct page alongside the tail =
struct
> pages in hugetlb_folio_init_vmemmap().
>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index ff6f837b6df01..d2aaad235458e 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3216,15 +3216,7 @@ static bool __init =
alloc_bootmem_huge_page(struct hstate *h, int nid)
>> 		list_add_tail(&m->list, &huge_boot_pages[nid]);
>> 		m->flags |=3D HUGE_BOOTMEM_ZONES_VALID;
>> 		hugetlb_vmemmap_optimize_bootmem_page(pfn, =
huge_page_order(h));
>> -		/*
>> -		 * Only initialize the head struct page in =
memmap_init_reserved_pages,
>> -		 * rest of the struct pages will be initialized by the =
HugeTLB
>> -		 * subsystem itself.
>> -		 * The head struct page is used to get folio information =
by the HugeTLB
>> -		 * subsystem like zone id and node id.
>> -		 */
>> -		memblock_reserved_mark_noinit(__pa((void *)m + =
PAGE_SIZE),
>> -				huge_page_size(h) - PAGE_SIZE);
>> +		memblock_reserved_mark_noinit(__pa(m), =
huge_page_size(h));
>> 	}
>>=20
>> 	return true;
>> @@ -3255,22 +3247,23 @@ static void __init =
hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>> }
>>=20
>> static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
>> +					      unsigned long pfn,
>> 					      struct hstate *h,
>> +					      enum zone_type zone, int =
nid,
>> 					      unsigned long nr_pages)
>> {
>> -	int ret;
>> +	struct page *head =3D &folio->page;
>>=20
>> 	/*
>> 	 * This is an open-coded prep_compound_page() whereby we avoid
>> 	 * walking pages twice by initializing/preparing+freezing them =
in the
>> 	 * same go.
>> 	 */
>> -	__folio_clear_reserved(folio);
>> +	__init_single_page(head, pfn, zone, nid);
>=20
> [Severity: Low]
> Under CONFIG_KMSAN=3Dy, does calling __init_single_page() on head here =
wipe
> head->kmsan_shadow and head->kmsan_origin after kmsan_init_shadow() =
has
> already populated them?

This is a pre-existing KMSAN issue introduced by commit fde1c4ecf916 =
("mm:
hugetlb: skip initialization of gigantic tail struct pages if freed by =
HVO").

That commit already reinitialized the tail struct pages after
kmsan_init_shadow(), potentially clearing their KMSAN metadata pointers. =
This
series extends the same behavior to the head page. I think the complete =
KMSAN
fix should be handled separately for both head and tail pages.

So, I will not fix it in this series.

Thanks.

>=20
> During mm_core_init(), kmsan_init_shadow() allocates and installs =
KMSAN
> metadata for all memblock.reserved ranges, including =
MEMBLOCK_RSRV_NOINIT
> regions:
>=20
> mm/kmsan/init.c:kmsan_init_shadow() {
> 	...
> 	for_each_reserved_mem_range(loop, &p_start, &p_end)
> 		kmsan_record_future_shadow_range(phys_to_virt(p_start),
> 						 phys_to_virt(p_end));
> 	...
> }
>=20
> When page_alloc_init_late() later runs gather_bootmem_prealloc_node() =
->
> hugetlb_folio_init_vmemmap() -> __init_single_page() ->
> memmap_init_page_common() -> mm_zero_struct_page(head) (and similarly =
via
> memmap_init_compound_page_frozen() in commit "mm/hugetlb: use common
> compound page initialization helper"), the entire struct page is =
zeroed,
> leaking those shadow and origin pages and leaving head->kmsan_shadow =
and
> head->kmsan_origin as NULL (extending the existing tail-page behavior =
in
> hugetlb_folio_init_tail_vmemmap() to the head page).
>=20
> If the bootmem gigantic folio is later freed to the buddy allocator at
> runtime, kmsan_free_page() hits KMSAN_WARN_ON(true) and subsequent
> allocations from the first pageblock cause a NULL pointer dereference =
in
> kmsan_alloc_page().
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261109095807.41547-1-songmuchun@bytedance=
.com?part=3D6

