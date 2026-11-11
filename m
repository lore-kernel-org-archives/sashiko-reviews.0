Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383855;
	b=MC2dO7JhbQ78mMmAQqZ8mvn9oD5dpqyH1jzz7uJ3FQbAreJQrWNY7sxqNm3OzDZnSyg1
	 0w7WyfdqwxkUIxo5RMVNlRlw5OCS3R/2NtQcRlq2CLwjDk43erWxHD67Uo1Xdn46hFegY
	 DMSnMB+spTDK1CsZR5lJosD44ZbjzTiQRKrUzFhSwouNTFDGHBeR0RB6/fh0Mv7+sOXUO
	 YfOlyKxvA7QYe/RRk7gHrqE6O2RgZuAykDduxCt3W/Oku4JPfRAD66AU7RO3m2ZqkH60g
	 CqIFkNgRkSq7yaQiqI5z+yy9fR2HHFPtFBArMZU+7I0EQ1EjGQ3LrOqObfN0MxMzQ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383855;
	h=DMARC-Filter:DKIM-Signature:To:References:User-Agent:
	 X-Lms-Return-Path:From:Message-Id:Mime-Version:
	 Content-Transfer-Encoding:Cc:Subject:Content-Type:Date:
	 X-Original-From:In-Reply-To;
	bh=+DF6qqz40dY4g5mMl/PNQxSuH0QCVVV01BSTCTsMLkA=;
	b=1yw7i8HW8BTrYRNWP7ZlvC+LxN8gTbz2feANs4rM1JDmJx7n6AkWZ63rCREnl6rsQVt2
	 wvuN4vfq/oMm6pCLMErTjWSEskJfpJylozpbOaCRblh5bK0hUKEcUkj7L1+fDmpBILkCk
	 QD6JnRnfEzSUASdLwFUlnY0puE77Rbh+A0CP1acbO9o6eAUCBZSCSK15QmTiiJ0vVtGE9
	 AtQDr/LFEC0o7C1PV3MU9u1NeJ/o0E7Acw0HQcXldGJsgNWqI1CTyHEsH88C8lf+ggxFJ
	 7r16TaF+siu3oKYiH618E/OTE/DEvESdFl+6vnbMHc7vV64nj4SDWLovZghDvM5Zmzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="ODz/vS4N";
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBF606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 07:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DBF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ODz/vS4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794383849; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+DF6qqz40dY4g5mMl/PNQxSuH0QCVVV01BSTCTsMLkA=;
 b=ODz/vS4NeCoyHegC3BbwNywwWr/7af9IzpXvyTH7cNrhS11z+SRMKra76TbLilg+xbKw7q
 CAvGYfWnILx8GX3e6O7kTDdH/WvBeOMyY1U4PnPJcDRtRN4/1ME88qYQE5SOUcDN04MkJk
 UOOh3rhzA2aP+wXIa/beo9WP/QgQk98xYTDzUUrDBhbENBM5vaTbXlO0VCngiAG+Tau0fn
 egkdfGTJFDfJ1/nZESHkWPPGD34wdMmuEUBmnTz7H/VLqoRnkfiK5R1MILZeNEqikA64OL
 9Xp+g4oAQdfGwjD3VSoW14Mce0FU60SecdBvB/8P/veIuTWYo8V4KNd7xJZdvQ==
To: "Muchun Song" <muchun.song@linux.dev>
References: <20261110114859.76343-1-lizhe.67@bytedance.com> <20261110114859.76343-3-lizhe.67@bytedance.com> <sashiko-outbox-207133@kernel.org> <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com> <000a2613-6643-4ac1-8378-a3e7df0b211a@linux.dev>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26af41fe7+3ee559+lists.linux.dev+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <7f39bb9b-3e1a-4560-94e3-69ee624b7973@bytedance.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: <linux-mm@kvack.org>, <sashiko-reviews@lists.linux.dev>, 
	<akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <osalvador@suse.de>, <rppt@kernel.org>
Subject: Re: [PATCH v2 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 15:57:11 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <000a2613-6643-4ac1-8378-a3e7df0b211a@linux.dev>

On 11/11/26 1:28 PM, Muchun Song wrote:
>
>
> On 2026/11/11 11:14, Li Zhe wrote:
>> On 11/10/26 9:35 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential
>>> issue to consider:
>>> - [High] mm/hugetlb: out-of-bounds write in
>>> =C2=A0=C2=A0=C2=A0 hugetlb_folio_init_tail_vmemmap()
>>> --=20
>>>
>>> commit 5be89b38412d58045fd600596787f54c7559d32c
>>> Author: Li Zhe <lizhe.67@bytedance.com>
>>>
>>> mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>>
>>> This commit optimizes bootmem hugepage tail struct page=20
>>> initialization by
>>> seeding a template from the first tail page and initializing the=20
>>> remaining
>>> tail pages via memmap_init_page_from_template().
>>>
>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>> index cb2de24affdc4..6ae5d2679e3aa 100644
>>>> --- a/mm/hugetlb.c
>>>> +++ b/mm/hugetlb.c
>>>> @@ -3239,6 +3239,7 @@ static void __init=20
>>>> hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum zone_type zone =3D folio_zon=
enum(folio);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nid =3D folio_nid(folio);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page =3D folio_page(=
folio, start_page_number);
>>>> +=C2=A0=C2=A0=C2=A0 struct page template;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long head_pfn =3D folio_=
pfn(folio);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, end_pfn =3D he=
ad_pfn + end_page_number;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order =3D huge_page_=
order(h);
>>>> @@ -3247,11 +3248,20 @@ static void __init=20
>>>> hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * As we marked all tail pag=
es with=20
>>>> memblock_reserved_mark_noinit(),
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we must initialize them o=
urselves here.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0 for (pfn =3D head_pfn + start_page_number; pfn < e=
nd_pfn;=20
>>>> page++, pfn++) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __init_single_page(page, p=
fn, zone, nid);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prep_compound_tail(page, &=
folio->page, order);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_count(page, 0);
>>>> -=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 pfn =3D head_pfn + start_page_number;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Seed a template from the first real tail p=
age and refresh only
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PFN-dependent fields before copying it.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 __init_single_page(page, pfn, zone, nid);
>>>> +=C2=A0=C2=A0=C2=A0 prep_compound_tail(page, &folio->page, order);
>>>> +=C2=A0=C2=A0=C2=A0 set_page_count(page, 0);
>>>> +=C2=A0=C2=A0=C2=A0 memcpy(&template, page, sizeof(template));
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (pfn++; pfn < end_pfn; pfn++)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memmap_init_page_from_temp=
late(pfn_to_page(pfn), pfn, zone,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &template);
>>> [Severity: High]
>>> Can peeling the first iteration out of the loop overwrite the struct=20
>>> page
>>> past the end of folio when start_page_number >=3D end_page_number?
>>>
>>> Previously, the loop was a no-op when pfn >=3D end_pfn.=C2=A0 Now, when=
 HVO=20
>>> does
>>> not optimize a gigantic folio, prep_and_add_bootmem_folios() calls
>>> hugetlb_folio_init_tail_vmemmap(folio, h,
>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES, pages_per_huge_page(h)) after
>>> gather_bootmem_prealloc_node() has already initialized the first
>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES pages.
>>>
>>> On configurations where a gigantic page has pages_per_huge_page(h) <=3D
>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES (for example, powerpc
>>> mpc885_ads_defconfig with 16 KiB pages, MAX_PAGE_ORDER =3D=3D 8, and 8 =
MiB
>>> gigantic hugepages of order 9, where both values are 512), this
>>> unconditionally initializes folio_page(folio, start_page_number) and=20
>>> marks
>>> the adjacent physical page's struct page as a compound tail of folio,
>>> corrupting mem_map.
>>
>> Thanks for the report. This looks valid.
>>
>> I will restore the empty-range check before seeding the template in v3.
>
> Go ahead. I will end up removing this empty-range check here [1].
>
> [1]=20
> https://lore.kernel.org/all/20261109095807.41547-8-songmuchun@bytedance.c=
om/


Thanks. I will keep the check in v3 for this series.

Thanks,
Zhe

>
>>
>> Thanks,
>> Zhe
>
