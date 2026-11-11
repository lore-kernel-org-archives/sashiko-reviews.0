Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794374944;
	b=0l0XlWeULaSv6rVRZF/PoPARTL1N0C55TiQmmtcQfGDJxEjKfCf3lCD4i4AKUoYN5tGi
	 3aSG9Q3mta18u4C3NQz9OWN+TbBypCQeJnqe+khhMfSLPv/K0QvnRbfkRTQnGsr5IUqlf
	 ZNlgd/kH+Bu4eZOOTnUXW1sdLYHV2RFMcL6/jIqFcySBw2HCQPTBa+aQgtY937lfUWcaX
	 Wf+hEBforCY1JrOssOjIZvxqCSW+Xvg40/oFGyZDjHqAI5QpZ1cqe6oIZb+zWp37zCVu0
	 ePXVBW860+qfqq7dwobSBAt5LIs/DeVUK7P/Qcdk+IWZoMk+9v/bgqoy86euXGTJ2vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374944;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bwksgTw9I8PjraaWt8ZlC3K1PQ8zcFO2I1Y4bvOFsQo=;
	b=H24rpxBWG1wb46wCLm9iKlVcm0FaVEKvPNgMfFFgtWVWA4RU+0+VNZkfbuKowTyTg94/
	 saglm1D0dQ4Yw5IxAzEBLTtoyklJNJOa59sG/WmM/YGAsz7zXt/p0USwwE+jRSOWOdD9G
	 W6fQPeOm3e8L/+FAFyRGFETrfIQDMwxRPX56yP8p0jmt9BglDS3/hw1jerg4qjmCwI9en
	 DH9abnsZ3Uvm8LNn+c13xDxIN55w28aUSvi6c5bX6chF3/8dqCQhebrCKkUwNiFWctEHl
	 Z4RuEl1vGUiC+iKybg9roZB9PmezJkOmhUmRlnKs0ad992zZj1KyR456+DQKvyvBqAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SK4bRdud;
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71322606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 05:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71322606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SK4bRdud
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=H/pkuNYA9Q/UTwaD/maO8VJWbP/0UM/v9RxeBIjqa8U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794374941; v=1; x=1794979741;
 b=SK4bRdudskRS14K6AyaMFjXPpr7wn+Q4DqtjLpoRXUIj319yhLPOTE8DQ3LpRogflQ4FXyH0
 ABD6l0W42a7CvlXzkWl0XfPOXEDaLG0CsxWsHIZuiu16j2wBudf3DuOp8xPrSOrQRknb27dJg30
 H7g7l9hVD+i6pZcKHgiJRt7A=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id f7fb7a3319c0cf62;
	Wed, 11 Nov 2026 05:29:01 +0000
X-Mizu-Trace-ID: f7fb7a3319c0cf62
X-Migadu-Flow: FLOW_OUT
Message-ID: <000a2613-6643-4ac1-8378-a3e7df0b211a@linux.dev>
Date: Wed, 11 Nov 2026 13:28:50 +0800
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
To: Li Zhe <lizhe.67@bytedance.com>
Cc: linux-mm@kvack.org, sashiko-reviews@lists.linux.dev,
 akpm@linux-foundation.org, apopple@nvidia.com, balbirs@nvidia.com,
 david@kernel.org, osalvador@suse.de, rppt@kernel.org
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
 <20261110114859.76343-3-lizhe.67@bytedance.com>
 <sashiko-outbox-207133@kernel.org>
 <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <0bb7599b-b20f-4bba-a7b8-fca2a093fcf9@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/11 11:14, Li Zhe wrote:
> On 11/10/26 9:35 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [High] mm/hugetlb: out-of-bounds write in
>>     hugetlb_folio_init_tail_vmemmap()
>> --
>>
>> commit 5be89b38412d58045fd600596787f54c7559d32c
>> Author: Li Zhe <lizhe.67@bytedance.com>
>>
>> mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>
>> This commit optimizes bootmem hugepage tail struct page initialization by
>> seeding a template from the first tail page and initializing the remaining
>> tail pages via memmap_init_page_from_template().
>>
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index cb2de24affdc4..6ae5d2679e3aa 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -3239,6 +3239,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>    	enum zone_type zone = folio_zonenum(folio);
>>>    	int nid = folio_nid(folio);
>>>    	struct page *page = folio_page(folio, start_page_number);
>>> +	struct page template;
>>>    	unsigned long head_pfn = folio_pfn(folio);
>>>    	unsigned long pfn, end_pfn = head_pfn + end_page_number;
>>>    	unsigned int order = huge_page_order(h);
>>> @@ -3247,11 +3248,20 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>    	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
>>>    	 * we must initialize them ourselves here.
>>>    	 */
>>> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
>>> -		__init_single_page(page, pfn, zone, nid);
>>> -		prep_compound_tail(page, &folio->page, order);
>>> -		set_page_count(page, 0);
>>> -	}
>>> +	pfn = head_pfn + start_page_number;
>>> +
>>> +	/*
>>> +	 * Seed a template from the first real tail page and refresh only
>>> +	 * PFN-dependent fields before copying it.
>>> +	 */
>>> +	__init_single_page(page, pfn, zone, nid);
>>> +	prep_compound_tail(page, &folio->page, order);
>>> +	set_page_count(page, 0);
>>> +	memcpy(&template, page, sizeof(template));
>>> +
>>> +	for (pfn++; pfn < end_pfn; pfn++)
>>> +		memmap_init_page_from_template(pfn_to_page(pfn), pfn, zone,
>>> +					       &template);
>> [Severity: High]
>> Can peeling the first iteration out of the loop overwrite the struct page
>> past the end of folio when start_page_number >= end_page_number?
>>
>> Previously, the loop was a no-op when pfn >= end_pfn.  Now, when HVO does
>> not optimize a gigantic folio, prep_and_add_bootmem_folios() calls
>> hugetlb_folio_init_tail_vmemmap(folio, h,
>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES, pages_per_huge_page(h)) after
>> gather_bootmem_prealloc_node() has already initialized the first
>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES pages.
>>
>> On configurations where a gigantic page has pages_per_huge_page(h) <=
>> VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES (for example, powerpc
>> mpc885_ads_defconfig with 16 KiB pages, MAX_PAGE_ORDER == 8, and 8 MiB
>> gigantic hugepages of order 9, where both values are 512), this
>> unconditionally initializes folio_page(folio, start_page_number) and marks
>> the adjacent physical page's struct page as a compound tail of folio,
>> corrupting mem_map.
>
> Thanks for the report. This looks valid.
>
> I will restore the empty-range check before seeding the template in v3.

Go ahead. I will end up removing this empty-range check here [1].

[1] 
https://lore.kernel.org/all/20261109095807.41547-8-songmuchun@bytedance.com/

>
> Thanks,
> Zhe

