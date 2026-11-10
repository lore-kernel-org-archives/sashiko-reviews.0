Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282932;
	b=shP7yCZAXeMj3LVV5FBKnkv06+sAQCi5AB1fTHPq4dHihu2TTdrd7WcSLZmwjFO+OghX
	 feS2nvFIdyW4u7CBh5LosB9ob5kSF7j0kBxp9XZ1DsooMXoyUodvCpaOmT45Stz87QRP3
	 SuFyK2+dO45jpDr44h+3rQddZFNnP87TvSgm7chamjkK9TbmUoJhoubIOPb3cW1h1lhWj
	 /C+g+EI7QFKHGPJIswukqdXbSPLh/Y7hZHOZnu/T6oBwVFbvXjnPh0c681WiEj96Rupzn
	 Y3lq6i0j9tC18R7XdXCT+q+GWNzasXHmf38OTyy1fGzaqAL2EHn46us0aA7Dotziikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282932;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=DzWy6/WNRqeEWa/9epvO5IlQ0oGV8ntkJrwHkR0I+2M=;
	b=pu5OOJVvRz/eCdBMG/I4jwYTLxMQUQkQ18zqCFDQofg6sDSla3w2OimxaW78kgA/tkpQ
	 VhPAF33+Lzuc7Y+umjHCf70nooiiqpR2VxE3iMT0Qh3Eb4m3heIBILj3jAIoNm+P94t+8
	 ui9NezMgdlpvaqlx6sPDxZcvPXmvP/NuThPe2v3hYY8MoP5rEIR05zSXsxiZCMyDMqbC4
	 D62+NRf40MG7EtUYGhCCSsVeoXFzPPSxmfoaTDrkdqKTzeEnRJ8L5R8YBC0cEcIbFvqRq
	 CXuk3aUt+JmwvonYrJrk6WrBtdz39JuSl4BzAqx0WoM63A3wUlbWKPi0KZ8XxzwblHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Un60vQTJ;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274A9606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Un60vQTJ
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=1DHEogHVtoCxTluCnUyg4zaFiqVYIq8x+VghISvowBE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794282929; v=1; x=1794887729;
 b=Un60vQTJ3j78T+OSWYN0nMxxH6nctMKd0PQWffpcjpHsvOp2ZeOuqE0+Kzr6jyfriHMdsSro
 b0WmtWUpl2UBnuo4OlRpgtA+iR1LadHN/Bb89+txD2JFUqRFSfb6rRYCoIVU5xVvAsV7ebdA8iN
 uBsa02r2+oxMtyKiSeNDRWIM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id a0e095d83234cbec;
	Tue, 10 Nov 2026 03:55:28 +0000
X-Mizu-Trace-ID: a0e095d83234cbec
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
Subject: Re: [PATCH 11/11] mm/mm_init: move pageblock migratetype init to
 memmap helpers
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-204845@kernel.org>
Date: Tue, 10 Nov 2026 11:55:13 +0800
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
Message-Id: <B97DC5CB-5A3A-497C-B051-213A1A14411C@linux.dev>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
 <20261109095807.41547-12-songmuchun@bytedance.com>
 <sashiko-outbox-204845@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 9, 2026, at 18:43, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm/mm_init: commit message cites nonexistent
>  memmap_init_page_frozen()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] mm: uninitialized migratetype in
>  pageblock_migratetype_init_range() [1]
> --
>=20
> commit e81bf248ba8e6f6857b5a558e23fdf0fa0e68ad6
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/mm_init: move pageblock migratetype init to memmap helpers
>=20
> This commit moves MIGRATE_MOVABLE pageblock initialization into
> memmap_init_compound_page_frozen() and =
memmap_init_zone_device_basepages(),
> and removes hugetlb_bootmem_init_migratetype().
>=20
>> Move the MIGRATE_MOVABLE pageblock initialization into the frozen =
memmap
>> initialization helpers instead. This makes memmap_init_page_frozen()
>> initialize the pageblock for single pages and
>> memmap_init_compound_page_frozen() initialize the whole range for =
compound
>> pages, so the ZONE_DEVICE and hugetlb bootmem paths can share the =
same
>> initialization.
>=20
> [Severity: Low]
> This isn't a bug, but the commit message mentions a nonexistent
> memmap_init_page_frozen() helper.  The patch updates
> memmap_init_zone_device_basepages() to initialize the pageblock range =
for
> ZONE_DEVICE base pages instead.

My bad. It should be memmap_init_zone_device_basepages().

>=20
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 61a720bb44dce..e05db8abde2fd 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -751,6 +751,9 @@ void __meminit =
memmap_init_compound_page_frozen(struct page *head,
>> 	for (unsigned long i =3D 1; i < nr_pages; i++)
>> 		memmap_init_page_from_template(head + i, pfn + i, zone, =
&template);
>> 	prep_compound_head(head, order);
>> +
>> +	pageblock_migratetype_init_range(pfn, 1UL << order, =
MIGRATE_MOVABLE,
>> +					 /* isolate */ false, /* atomic =
*/ false);
>> }
>>=20
>> struct zone __meminit *pfn_to_zone(unsigned long pfn, int nid)
>> @@ -1110,6 +1113,9 @@ static void =
memmap_init_zone_device_basepages(unsigned long start, unsigned long
>> 		if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
>> 			cond_resched();
>> 	}
>> +
>> +	pageblock_migratetype_init_range(start, end - start, =
MIGRATE_MOVABLE,
>> +					 /* isolate */ false, /* atomic =
*/ false);
>> }
>=20
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can
> pageblock_migratetype_init_range() leave the first partial pageblock's
> migratetype uninitialized [1] when the starting PFN is not aligned to
> a pageblock boundary?

The condition is reachable, but it does not appear to cause a functional
problem. The partial pageblock retains its existing migratetype, or
MIGRATE_UNMOVABLE from the zero-initialized bitmap; it does not contain
uninitialized data. ZONE_DEVICE pages do not enter the buddy allocator =
or normal
isolation path, so this does not affect allocation, migration, or =
removal.

Moreover, the pageblock also covers PFNs outside the pgmap range, so =
overwriting
its migratetype could affect adjacent memory. So I'll not fix it.

Thanks.

>=20
> mm/mm_init.c:pageblock_migratetype_init_range() {
>    ...
> 	for (pfn =3D pageblock_align(pfn); pfn < end; pfn +=3D =
pageblock_nr_pages) {
> 		enum migratetype mt =3D kho_bootmem_migratetype(pfn, =
migratetype);
>=20
> 		init_pageblock_migratetype(pfn_to_page(pfn), mt, =
isolate);
>    ...
> }
>=20
> pageblock_align(pfn) rounds the starting PFN upward to the next =
pageblock
> boundary.  When a caller such as ZONE_DEVICE initialization or memory
> hotplug passes a range starting in the middle of a pageblock, the loop
> skips that initial partial pageblock, leaving its pageblock flags
> uninitialized.
>=20
> [1] =
https://sashiko.dev/#/bug/linux-492df7cc-d097-43e5-9701-9954aee1d064
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261109095807.41547-1-songmuchun@bytedance=
.com?part=3D11

