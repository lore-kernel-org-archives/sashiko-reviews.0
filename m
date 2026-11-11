Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366921;
	b=wXK/2G5NfK6y+BidNFSvFTgQ4qHAs05G80tBsnRy77h7dykPwLd7Jzr/ZwCgyRLoZSwM
	 +FMQwXvNa15jlkuBLZVxsweOYOGfkc5U/R6Mj9+b5gavl43cCndYZZZ9cTWxIrZUJ2Zz+
	 YF0s0vxv/DyJrFWlo1t8mclZ1SGJsGjL41iUevr8PST7F0j6UZqppZkhioW2lA2HV4hsY
	 tp7nmbeOg1d5UE9pkNMOr7EfYBTOw2t5x3TedeuJI7cZmtwzFxrJaZHG/3UBMAT8Q1hr4
	 4EHjOkBHHu/O5HHbo8Dh5oX4QM0e8gvnZvR/yJLrmjjz+arl4MiyIXnYiX0eklwLA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366921;
	h=DMARC-Filter:DKIM-Signature:Subject:In-Reply-To:User-Agent:To:
	 X-Original-From:X-Lms-Return-Path:Content-Type:Mime-Version:From:Date:
	 Message-Id:References:Content-Transfer-Encoding:Cc;
	bh=15rFtJmRbMHnBEJouMfOvitJtkWvgnl2tL0+uVof8uI=;
	b=mzME27Q/EnwbePdcY/8ijV7dQTmagnEX34qtCQ5xlWgzoovvd2jAq3U07RLpPP5ImYnp
	 7S/Pa0089sfsoARZW1BQXC30DvUDDHSmcn8MC7A/oGo6xP1XWGz1J0PNL5ayOROqSlkTV
	 V+564G+xMfNR7TVrVUx4EakV1rtqKuHIF3ZWMuKrtvdJ8CU9tQsC6/1LOH9Z8H9mL5h4q
	 s/kBin0Y1/XHIZo6ZWIu5ZlKIg4q12hyCl/2Ys9+pN0oenh8TOCQCM0p7/9z7pQEOUTaq
	 3bUhK3JbzsGM/museTBM1RHfWIY3xCqvbRezROAVo7st2VlxXq2E8iBb6jTDDmBSLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Lb4DwdF8;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75986606A33F
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 03:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75986606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Lb4DwdF8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794366914; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=15rFtJmRbMHnBEJouMfOvitJtkWvgnl2tL0+uVof8uI=;
 b=Lb4DwdF8QQKgIped/h+QE4Ar81wdi63JIQFPnnVPXD3k1TZMHBKNFri0XePS3dyUzzPi1G
 ZyCSml0waJIbKI1an7oMDhhaEc+UxRm34RLgbgu9J9dj6kCQpwynxKilA3Ua52LTRZVf2r
 9eneIbeYTEflGeLvQEw6RtQ2rQS95snf20UiZNp0hPI8mcxMlBdMLQ/qKbIrLJ61OL0T7a
 WhmQ6fmnq8ZLYwNLmFaGBQ6wvv95gvhW/LJz06w6pNEyy47OKauV3jF7HWclhlz0jS52IB
 zXINOnqqq26QSVN1K6WFqRHrCg5EF/gWMQWCWu660NZtq1ka33rFRDBR9LODPQ==
Subject: Re: [PATCH v2 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
In-Reply-To: <sashiko-outbox-207133@kernel.org>
User-Agent: Mozilla Thunderbird
To: <sashiko-reviews@lists.linux.dev>, <akpm@linux-foundation.org>, 
	<apopple@nvidia.com>, <balbirs@nvidia.com>, <david@kernel.org>, 
	<muchun.song@linux.dev>, <osalvador@suse.de>, <rppt@kernel.org>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26af3ddb6+f7214b+lists.linux.dev+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 11 Nov 2026 11:14:46 +0800
Message-Id: <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>
References: <20261110114859.76343-1-lizhe.67@bytedance.com> <20261110114859.76343-3-lizhe.67@bytedance.com> <sashiko-outbox-207133@kernel.org>
Content-Transfer-Encoding: 7bit
Cc: <linux-mm@kvack.org>

On 11/10/26 9:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/hugetlb: out-of-bounds write in
>    hugetlb_folio_init_tail_vmemmap()
> --
>
> commit 5be89b38412d58045fd600596787f54c7559d32c
> Author: Li Zhe <lizhe.67@bytedance.com>
>
> mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>
> This commit optimizes bootmem hugepage tail struct page initialization by
> seeding a template from the first tail page and initializing the remaining
> tail pages via memmap_init_page_from_template().
>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index cb2de24affdc4..6ae5d2679e3aa 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3239,6 +3239,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>   	enum zone_type zone = folio_zonenum(folio);
>>   	int nid = folio_nid(folio);
>>   	struct page *page = folio_page(folio, start_page_number);
>> +	struct page template;
>>   	unsigned long head_pfn = folio_pfn(folio);
>>   	unsigned long pfn, end_pfn = head_pfn + end_page_number;
>>   	unsigned int order = huge_page_order(h);
>> @@ -3247,11 +3248,20 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>   	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
>>   	 * we must initialize them ourselves here.
>>   	 */
>> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
>> -		__init_single_page(page, pfn, zone, nid);
>> -		prep_compound_tail(page, &folio->page, order);
>> -		set_page_count(page, 0);
>> -	}
>> +	pfn = head_pfn + start_page_number;
>> +
>> +	/*
>> +	 * Seed a template from the first real tail page and refresh only
>> +	 * PFN-dependent fields before copying it.
>> +	 */
>> +	__init_single_page(page, pfn, zone, nid);
>> +	prep_compound_tail(page, &folio->page, order);
>> +	set_page_count(page, 0);
>> +	memcpy(&template, page, sizeof(template));
>> +
>> +	for (pfn++; pfn < end_pfn; pfn++)
>> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
>> +					       &template);
> [Severity: High]
> Can peeling the first iteration out of the loop overwrite the struct page
> past the end of folio when start_page_number >= end_page_number?
>
> Previously, the loop was a no-op when pfn >= end_pfn.  Now, when HVO does
> not optimize a gigantic folio, prep_and_add_bootmem_folios() calls
> hugetlb_folio_init_tail_vmemmap(folio, h,
> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES, pages_per_huge_page(h)) after
> gather_bootmem_prealloc_node() has already initialized the first
> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES pages.
>
> On configurations where a gigantic page has pages_per_huge_page(h) <=
> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES (for example, powerpc
> mpc885_ads_defconfig with 16 KiB pages, MAX_PAGE_ORDER == 8, and 8 MiB
> gigantic hugepages of order 9, where both values are 512), this
> unconditionally initializes folio_page(folio, start_page_number) and marks
> the adjacent physical page's struct page as a compound tail of folio,
> corrupting mem_map.


Thanks for the report. This looks valid.

I will restore the empty-range check before seeding the template in v3.

Thanks,
Zhe

