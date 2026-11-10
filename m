Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280620;
	b=aSMVF/1/ecbJeBnEd/BvRYX8Iq5XXDKwenhbz2x+nCFStTqIf9Ci9ycZMWsVUuWvgSCZ
	 abWC8dDzOqqYxdtxDCOxmbYITXkFNXVEqXTftQER3TB+jz0vZtXaqjOV8wTuQsRw75tEq
	 RBMes91U9gPk6ZAf3wzxQCzGYRDHblpU94cByTf3FUI6Sp2wBTY5fTcI4gNiiw9+c0x6h
	 ODTeTrAEvqmmVmxAuB28QD/QoFhisNoyyA5scTqQWguqNLE1QHh8mi4nI9/4uCq8/bnxB
	 xOnxplyEFwWybVCwM8ly4+yR5TcZQ7sLc9gEpMho759fjGGEeih54/xnMPSmrWkhkUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280620;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=q9M+59aJycwvDGVPdRUa9bBhiCb7/lm1Bh0m6F9EGyg=;
	b=QxLYv7159K0jWxMTqbqJjgzXFy/rmPJY29L1Yfq/4rz0fbZK7wmr6xlx3y8cMacRkTLf
	 7c5xVF0cVEOCxs37BkTBa5WPCgd49twYbVANBkHsDINQteZS6DuVoUh+N3hp11Rp34xMP
	 BhiyiOdjyDDiZEnTeyGu247QXyuCSv7CWKvoNYmCwB6Ej0YinMkMNfsOJu5XTolStkTMY
	 eoXYHNIW3CksEEvBqEQuYbUVMXxggFkaeVxrU/G6TqIYAl3bECfLYmIlZkO063XH/rVXW
	 QIjC6iufurypz2pKnYTzPkUVZpiU6K1SupLNgy4fAfXbMaE6EkHlvChVRGcw0vPFMUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U1AQqdle;
	arc=none smtp.remote-ip=91.218.175.134
Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C721606A32E
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C721606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U1AQqdle
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=kgr+9iyrM1cxLzfU7kLaTKxlcTZDi3ushAYcoMpeJik=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794280617; v=1; x=1794885417;
 b=U1AQqdleFer8Cpa+HpBvRL752oKSv9M+OpFO33gHWt+5EdZx9DCqHHUHqmjeQqsBQR6Ph0HN
 lc+umU3Ly7W5ZYGwBe6iR3SFrpfrtiFhUEyoA/ZuAUvs+PfXuFwQ4n8Bx4gAh5psHXzi6KKxv5I
 sDv7QOOWxygLwY7lAJ3NVRdw=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 9c1d7389bb465916;
	Tue, 10 Nov 2026 03:16:57 +0000
X-Mizu-Trace-ID: 9c1d7389bb465916
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
Subject: Re: [PATCH 05/11] mm/hugetlb: drop boot-time HVO handling for
 gigantic folios
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-204839@kernel.org>
Date: Tue, 10 Nov 2026 11:16:43 +0800
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
Message-Id: <7EBF14BA-50E3-456C-A005-CE96CE148B5A@linux.dev>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
 <20261109095807.41547-6-songmuchun@bytedance.com>
 <sashiko-outbox-204839@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 9, 2026, at 18:43, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 2 related pre-existing issues it does not
> introduce:
> - [High] mm/memory-failure: race between hugetlb_update_hwpoison() and
>  HVO head remap [1]
> - [Critical] mm/hugetlb_vmemmap: race between deferred PMD split flush
>  and PTE remap in vmemmap_split_pmd() [2]
> --

I will not fix both pre-existing problems in this series.

>=20
> commit da0d2d6e0b849f9a259d74fcb047aaceb9617411
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/hugetlb: drop boot-time HVO handling for gigantic folios
>=20
> This commit removes the boot-time bulk vmemmap optimization call and =
tail
> page initialization fallback for gigantic folios, relying instead on =
the
> section-based vmemmap optimization infrastructure during bootmem =
gathering.
>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index ba8e11e399b24..d73ceeef392eb 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -552,7 +552,6 @@ static int hugetlb_vmemmap_pteify_folio(const =
struct hstate *h, struct folio *fo
>> void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct =
list_head *folio_list)
>> {
>> 	struct folio *folio;
>> -	unsigned long nr_to_optimize =3D 0;
>> 	LIST_HEAD(vmemmap_pages);
>> 	unsigned long flags =3D VMEMMAP_DEFER_TLB_FLUSH;
>=20
> [Severity: High]
> This problem wasn't introduced by this patch, but can a concurrent =
memory
> failure race with vmemmap optimization [1] and lose hardware poison
> state on a newly allocated hugetlb folio?
>=20
> After init_new_hugetlb_folio() sets the hugetlb flag on a fresh folio
> (for example in prep_and_add_allocated_folios()), both
> folio_test_hugetlb_freed() and folio_test_hugetlb_migratable() remain
> false while hugetlb_vmemmap_optimize_folios() remaps its vmemmap =
pages:
>=20
> CPU0                                  CPU1
> hugetlb_vmemmap_optimize_folios()
>  __hugetlb_vmemmap_optimize_folio()
>    vmemmap_optimize_folio()
>      vmemmap_optimize_pte()
>        vmemmap_dup_page_from_list()
>          copy_page(dst, src)
>                                      try_memory_failure_hugetlb()
>                                        get_huge_page_for_hwpoison()
>                                          // returns MF_HUGETLB_RETRY
>                                        // retries with MF_NO_RETRY:
>                                        get_huge_page_for_hwpoison()
>                                          spin_lock_irq(&hugetlb_lock)
>                                          hugetlb_update_hwpoison()
>                                            =
folio_test_set_hwpoison(folio)
>                                            llist_add(&raw_hwp->node, =
head)
>                                          =
spin_unlock_irq(&hugetlb_lock)
>        set_pte_at(..., dst, ...)
>  flush_tlb_all()
>  free_vmemmap_page_list()  <-- old head page freed, hwpoison lost
>=20
> Because vmemmap_optimize_pte() copies and remaps the head struct page
> without synchronizing with hugetlb_lock (and defers the TLB flush =
across
> the batch), hugetlb_update_hwpoison() can write PG_hwpoison and the
> raw_hwp_page list entry to the old head struct page after copy_page() =
has
> already finished.  Once the remap and TLB flush complete, the =
raw_hwp_page
> allocation is leaked and the poisoned hugepage is added to the pool
> unmarked.
>=20
>> @@ -560,18 +559,7 @@ void hugetlb_vmemmap_optimize_folios(struct =
hstate *h, struct list_head *folio_l
>> 		return;
>>=20
>> 	list_for_each_entry(folio, folio_list, lru) {
>> -		int ret;
>> -
>> -		/*
>> -		 * Bootmem gigantic folios may already be marked =
optimized when
>> -		 * their vmemmap layout was prepared earlier, so skip =
them here.
>> -		 */
>> -		if (folio_test_hugetlb_vmemmap_optimized(folio))
>> -			continue;
>> -
>> -		nr_to_optimize++;
>> -
>> -		ret =3D hugetlb_vmemmap_pteify_folio(h, folio, flags);
>> +		int ret =3D hugetlb_vmemmap_pteify_folio(h, folio, =
flags);
>>=20
>> 		/*
>> 		 * Splitting the PMD requires allocating a page, thus =
let's fail
>> @@ -583,9 +571,6 @@ void hugetlb_vmemmap_optimize_folios(struct =
hstate *h, struct list_head *folio_l
>> 			break;
>> 	}
>>=20
>> -	if (!nr_to_optimize)
>> -		return;
>> -
>> 	flush_tlb_all();
>=20
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can deferring the =
TLB
> flush across PMD splits here race with a concurrent single-folio =
vmemmap
> optimization [2] and remap PTEs before the 2MB PMD split is
> flushed from the TLB?

Right. I'll fix it later in a separate patch.

>=20
> A single 2MB vmemmap PMD covers 64 2MB folios.  While
> hugetlb_vmemmap_optimize_folios() splits PMDs with =
VMEMMAP_DEFER_TLB_FLUSH
> during bulk pool resize or demotion, a concurrent
> hugetlb_vmemmap_optimize_folio() (such as from
> alloc_surplus_hugetlb_folio()) can optimize another folio covered by =
the
> same vmemmap PMD:
>=20
> CPU0                                  CPU1
> hugetlb_vmemmap_optimize_folios()
>  hugetlb_vmemmap_pteify_folio()
>    ...
>      vmemmap_split_pmd()
>        pmd_populate_kernel()
>        // skips TLB flush
>                                      hugetlb_vmemmap_optimize_folio()
>                                        ...
>                                          vmemmap_pmd_entry()
>                                            // !pmd_leaf(*pmd), returns =
0
>                                          vmemmap_optimize_pte()
>                                            set_pte_at()
>                                        free_vmemmap_page_list()
>                                          <-- old vmemmap pages freed =
with
>                                              stale 2MB PMD TLB entry =
live
>  flush_tlb_all()
>=20
> Because CPU0 has already replaced the leaf PMD under
> init_mm.page_table_lock, CPU1 sees !pmd_leaf(*pmd) in =
vmemmap_pmd_entry()
> and proceeds directly to vmemmap_optimize_pte() without a PMD-range =
TLB
> flush.  CPU1 then installs 4KB PTEs pointing to different physical =
pages,
> flushes only its own folio's vmemmap range, and frees the displaced
> vmemmap pages while stale 2MB PMD TLB entries remain active, which can
> cause overlapping-TLB machine checks or use-after-free writes to the =
freed
> vmemmap pages.
>=20
> [1] =
https://sashiko.dev/#/bug/linux-18e93f17-529b-4d84-ba44-a41829f4be64
> [2] =
https://sashiko.dev/#/bug/linux-fbdc3410-a4cf-457e-88e6-684380fbadfe
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261109095807.41547-1-songmuchun@bytedance=
.com?part=3D5

