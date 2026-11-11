Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385279;
	b=kvGaqg7MwF5GpeXEBnf7YhtnFBLP4QYnbWQboHloaZO5CAaGWj5OYU2ZzYThAzSqqTfM
	 GxCIrKQA1VogVxxMTU4n8Z0Bawve1urQhw3nDytV3hw9pyzvfvCbZQYc+rHQZIymKXmsq
	 C1dtQ1slTMz6u8vM53oLFBR9Tmq0lOsVaqz2yNVhsx0T0xTs16Vvook1CA6cjBJlw3cxD
	 aXZX9UnP7u5d0FCGdbcllfaUwQ5TSD2ICKb1WNiLnowwfKWgZnJ5X2dKA6uzFo3b2+kX0
	 kcXXxMk7TivM3qSTp0mjNCIztRGVoux3ofiJXKWeLuGxM1HiexvHeecDmK5butpWV/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385279;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=xrlVr5jqaYxs2RX5lW/+H54QUYUUFOV3KkaDRJj2vZM=;
	b=0qzeY3gZyGa/MovuDkuth513682lnZATGnKNSqYYISceOo9sPd1vT4r4QbjMoiCq4iuf
	 ZKSwlB3l+ucysMDRs/vZxypnEtC5i4bh1OFAAVFOeLswHcaYmy/fk/S4oDwAmRMs29Ntn
	 klHVVnD/dyxvMO4mnrbfyR74y67CsX3z/YUDJnvXhZMzruqvW2ZPzZrCIAop1ehCUYnMs
	 YaBt8ZXQ7XGK9p6AsL5jG+syjURhU1EoGLCsepRYZMooLNhPu/97Ni4LPpOwLPq0tBR0D
	 4gBqgWG61Cn1/kzGMEpK4VS4Ui6XtHsz+Dx38wJdo8HOee4KyIAWxyrKpw5COJEVuwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qqEf33XQ;
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F741606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 08:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F741606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qqEf33XQ
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=cBjbNmnBhAc/1YCUbMzQQQwg2p5v2yxhI3AVX1PNB6Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794385277; v=1; x=1794990077;
 b=qqEf33XQ+mYO2MSog0PvSr9K3GHCJhXZTcwCk6BSIh1PTY5sGB0hmZlsUHqf6I2lbbm1X1hg
 PEUdZ5IpDf0hz+hl4CTaFM3E+ZAoPR2jU4/h9wLF0uBBhAilnosh1UiQK3ggdDT01ISELRl3Qu2
 smt2MnCIq/FIqUWlaBGlLdEE=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7f1be61d3be57328;
	Wed, 11 Nov 2026 08:21:17 +0000
X-Mizu-Trace-ID: 7f1be61d3be57328
X-Migadu-Flow: FLOW_OUT
Message-ID: <493d9088-35fb-480f-a531-75979f4ce485@linux.dev>
Date: Wed, 11 Nov 2026 16:21:04 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap
 init
To: Mike Rapoport <rppt@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>, linux-mm@kvack.org,
 sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
 apopple@nvidia.com, balbirs@nvidia.com, david@kernel.org, osalvador@suse.de
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
 <20261110114859.76343-3-lizhe.67@bytedance.com>
 <sashiko-outbox-207133@kernel.org>
 <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>
 <000a2613-6643-4ac1-8378-a3e7df0b211a@linux.dev>
 <avQkQKRkYV32Qkxp@kernel.org>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <avQkQKRkYV32Qkxp@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/11 16:16, Mike Rapoport wrote:
> Hi,
> On Wed, Nov 11, 2026 at 01:28:50PM +0800, Muchun Song wrote:
>> On 2026/11/11 11:14, Li Zhe wrote:
>>> On 11/10/26 9:35 PM, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential
>>>> issue to consider:
>>>> - [High] mm/hugetlb: out-of-bounds write in
>>>>      hugetlb_folio_init_tail_vmemmap()
>>>> --
>>>>
>>>> commit 5be89b38412d58045fd600596787f54c7559d32c
>>>> Author: Li Zhe <lizhe.67@bytedance.com>
>>>>
>>>> mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>>>
>>>> This commit optimizes bootmem hugepage tail struct page initialization by
>>>> seeding a template from the first tail page and initializing the remaining
>>>> tail pages via memmap_init_page_from_template().
>>>>
>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>> index cb2de24affdc4..6ae5d2679e3aa 100644
>>>>> --- a/mm/hugetlb.c
>>>>> +++ b/mm/hugetlb.c
>>>>> @@ -3239,6 +3239,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>>>     	enum zone_type zone = folio_zonenum(folio);
>>>>>     	int nid = folio_nid(folio);
>>>>>     	struct page *page = folio_page(folio, start_page_number);
>>>>> +	struct page template;
>>>>>     	unsigned long head_pfn = folio_pfn(folio);
>>>>>     	unsigned long pfn, end_pfn = head_pfn + end_page_number;
>>>>>     	unsigned int order = huge_page_order(h);
>>>>> @@ -3247,11 +3248,20 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>>>     	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
>>>>>     	 * we must initialize them ourselves here.
>>>>>     	 */
>>>>> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
>>>>> -		__init_single_page(page, pfn, zone, nid);
>>>>> -		prep_compound_tail(page, &folio->page, order);
>>>>> -		set_page_count(page, 0);
>>>>> -	}
>>>>> +	pfn = head_pfn + start_page_number;
>>>>> +
>>>>> +	/*
>>>>> +	 * Seed a template from the first real tail page and refresh only
>>>>> +	 * PFN-dependent fields before copying it.
>>>>> +	 */
>>>>> +	__init_single_page(page, pfn, zone, nid);
>>>>> +	prep_compound_tail(page, &folio->page, order);
>>>>> +	set_page_count(page, 0);
>>>>> +	memcpy(&template, page, sizeof(template));
>>>>> +
>>>>> +	for (pfn++; pfn < end_pfn; pfn++)
>>>>> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
>>>>> +					       &template);
>>>> [Severity: High]
>>>> Can peeling the first iteration out of the loop overwrite the struct page
>>>> past the end of folio when start_page_number >= end_page_number?
>>>>
>>>> Previously, the loop was a no-op when pfn >= end_pfn.  Now, when HVO does
>>>> not optimize a gigantic folio, prep_and_add_bootmem_folios() calls
>>>> hugetlb_folio_init_tail_vmemmap(folio, h,
>>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES, pages_per_huge_page(h)) after
>>>> gather_bootmem_prealloc_node() has already initialized the first
>>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES pages.
>>>>
>>>> On configurations where a gigantic page has pages_per_huge_page(h) <=
>>>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES (for example, powerpc
>>>> mpc885_ads_defconfig with 16 KiB pages, MAX_PAGE_ORDER == 8, and 8 MiB
>>>> gigantic hugepages of order 9, where both values are 512), this
>>>> unconditionally initializes folio_page(folio, start_page_number) and marks
>>>> the adjacent physical page's struct page as a compound tail of folio,
>>>> corrupting mem_map.
>>> Thanks for the report. This looks valid.
>>>
>>> I will restore the empty-range check before seeding the template in v3.
>> Go ahead. I will end up removing this empty-range check here [1].
>>
>> [1]
>> https://lore.kernel.org/all/20261109095807.41547-8-songmuchun@bytedance.com/
>   
> Maybe you'll pick these two patches into your series since you anyway
> change the same areas?

Good point! I'd like to do this.

Thanks,
Muchun

>>> Thanks,
>>> Zhe

