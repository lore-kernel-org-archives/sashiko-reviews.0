Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280149;
	b=0Yk0GQgS+YO28Cj/CconY5z8b2G3oD6CXqltH9sf0iyxuJIMko0VB4WgyqZtWeW6Zigj
	 wXFNp8P4swghY19GBB7/jisoi4npvvooJlGpKfTcbhBzYqJ3ZwJCWEAC0IkkV0wDqsxVI
	 otHrtV3fUah0Y0+zr4sxm2y9xgxSJ+VRsUJXjDDA2As7tUzJr9rJOiEUeNGDj3xKNwh0h
	 DvMcl7/JDZ7Bw0QR40IqlWz+pojlVaOmTXUj/cnURJP6TxpdAH+zbTLmfnyVxE6sTKtM9
	 IYRixLOp6gSGjNJhI6OobSDGenxJsk4wSFiwBA1OvlCRAWVXEfvsgEaSGTsBFrtJAmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280149;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=/VXI1onF5SeS09KK9lzcvTcmpzrz6Lunid7ms1UK5Nw=;
	b=TMrILL6IjSMXPyTYaxh4uyQVKbOKQbmNvQ8AMbf3C5ouu1GH6l73ai05n6izwjATlN5i
	 7KtrZWzaVErvSId97U3biTyCIMMNZzkrk1Aezdm5HqReo9Ucizzl/z6xTYkFr1GNwT4oi
	 Ntw7t9SDvTOIuQN+EYWSFGvGU6GfQeFgwATORgExW+rG5l73vUr607KnkY3MgRCcJEdjT
	 BwKrxJ4MbKzfwF8GYsaSLEd5yqx81G3yZ/5f9WmaHnnVu9MgyhLRCEvrmCIE1PouSW0wE
	 7EHVGWBoYBrL2VhBUae/g1l5T+gQqCEjiWbB+bxPn5wTSLs4+riQlD5CFyqsuj8H8UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="bhiX/sg9";
	arc=none smtp.remote-ip=91.218.175.89
Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5AA606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bhiX/sg9
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4vNRBThxCRg1/lwUML9Zpz0Ty+nyn6/jDAJxsej0PWU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794280145; v=1; x=1794884945;
 b=bhiX/sg9FPtDK3iMLNvJz7zXB6dMMvEYHUUslfV4P4zbO3qth0HImCn+hr2JXeA1kktzmScU
 c6Mt17R+gbskOLXahCJnU8H3k1TAuJBBIFTO6wQ179GEaJX+ClrTcJbtAubAANM4sL/JvVAaKUy
 +EqsJeUV15NXEEi+Dhp5UpUU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id dd3535646e2a8843;
	Tue, 10 Nov 2026 03:09:05 +0000
X-Mizu-Trace-ID: dd3535646e2a8843
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
Subject: Re: [PATCH 02/11] mm/mm_init: factor out common struct page
 initialization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-204836@kernel.org>
Date: Tue, 10 Nov 2026 11:08:43 +0800
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
Message-Id: <01DEE4E5-49E9-4C33-BBC4-EB04611803B3@linux.dev>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
 <20261109095807.41547-3-songmuchun@bytedance.com>
 <sashiko-outbox-204836@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 9, 2026, at 18:43, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/mm_init: __meminit on memmap_init_page_common() crashes at
>  runtime
> --
>=20
> commit bb3e83c26b241fd60613632a0fd50cc529ce8be7
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/mm_init: factor out common struct page initialization
>=20
> This commit factors out PFN-independent struct page initialization =
into
> memmap_init_page_common() and uses it in both __init_single_page() and
> vmemmap_shared_tail_page().
>=20
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 0129152b74d87..9677698f30d3a 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -602,15 +602,28 @@ static inline void =
vmemmap_optimization_verify_zone(struct page *page)
>> 			page_zone_id(page));
>> }
>>=20
>> -void __meminit __init_single_page(struct page *page, unsigned long =
pfn,
>> -				unsigned long zone, int nid)
>> +/* Initialize PFN-independent fields common to pages in the same =
zone. */
>> +void __meminit memmap_init_page_common(struct page *page,
>> +		enum zone_type zone, int nid)
>> {
>> 	mm_zero_struct_page(page);
>> -	set_page_links(page, zone, nid, pfn);
>> -	init_page_count(page);
>> -	atomic_set(&page->_mapcount, -1);
>> +	set_page_zone(page, zone);
>> +	set_page_node(page, nid);
>> 	page_cpupid_reset_last(page);
>> 	page_kasan_tag_reset(page);
>> +	atomic_set(&page->_mapcount, -1);
>> +#ifdef CONFIG_ZONE_DEVICE
>> +	if (zone =3D=3D ZONE_DEVICE)
>> +		__SetPageReserved(page);
>> +#endif
>> +}
>=20
> [ ... ]
>=20
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index 9b80dd7326f7e..fd869617423a3 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -212,12 +212,7 @@ struct page __ref =
*vmemmap_shared_tail_page(unsigned int order, struct zone *zon
>>=20
>> 	for (int i =3D 0; i < PAGE_SIZE / sizeof(struct page); i++) {
>> 		page =3D (struct page *)addr + i;
>> -		mm_zero_struct_page(page);
>> -		atomic_set(&page->_mapcount, -1);
>> -		set_page_node(page, zone_to_nid(zone));
>> -		set_page_zone(page, zone_idx(zone));
>> -		if (zone_is_zone_device(zone))
>> -			__SetPageReserved(page);
>> +		memmap_init_page_common(page, zone_idx(zone), =
zone_to_nid(zone));
>> 		prep_compound_tail(page, NULL, order);
>> 	}
>=20
> [Severity: High]
> Can vmemmap_shared_tail_page() call memmap_init_page_common() after
> .init.text has been freed when CONFIG_MEMORY_HOTPLUG is disabled?

Right. I'll remove __meminit from memmap_init_page_common to fix this.

Thanks.

>=20
> When !CONFIG_MEMORY_HOTPLUG, __meminit expands to __init, placing
> memmap_init_page_common() in .init.text, while __ref on
> vmemmap_shared_tail_page() suppresses the modpost section mismatch =
warning.
> With CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=3Dy (which does not depend =
on
> CONFIG_MEMORY_HOTPLUG), allocating HugeTLB pages at runtime reaches
> vmemmap_optimize_pte() -> folio_vmemmap_shared_tail_page() ->
> vmemmap_shared_tail_page() and executes freed .init.text the first =
time a
> zone's shared tail page for that order is allocated after boot.
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261109095807.41547-1-songmuchun@bytedance=
.com?part=3D2

