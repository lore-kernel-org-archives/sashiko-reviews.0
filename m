Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548856;
	b=K49Ph9+c+LXQB3u7MGiCZOnNV19kJ7uDnGUs/kR7m4WBvUpmnXiKUkTg9U6qfXu3dXrt
	 2njLWP6xxWugbowg54ctoEfhwzo1kqCF9YUvUfDaICiPd2w/MiU+/lIWIu1EutZPcbIS9
	 advNRKO2BHPixtHGmJ5vc4tMz0cXJILxdmq+RXS6RmGmwvwEGdAn65ZbG51gBKo4PaoUs
	 wjseXIjiFV6vzf8wbKTz0AJJs/dhp1wcVq6FBy3E7B2wpKWUvLlXwErdWzc4a7anSg+jp
	 ImwudPzMBTpJrTGt+IGFVgih4F2h/0EBYq+r/o9FmsBzRkZ4mzFya/AiqLoq9zITBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548856;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=tH9MRkHQTZbs1LzKP4zwJuzcXsw9kcfIaj2yccY1Tzc=;
	b=O8+PcO7PN03CA05FuL0EtmWArIwa0GjDmb5xWrVnJck3v9ZLRQxLSmdgwMmQEmgZmuYk
	 5Cu0EjKZBsmHcstv8Eu6roaBqiZRYzghakhXBVfbS4cnBrOXqTUkg/yRD5EA8cedXxIAv
	 mg3ICKFbVgpvL2eiHN2IZwKsE0GWyLAK6lTvMc2knP+dCdQeUvQONwQ0NO5A7+wbdDp1U
	 D/zum4+VfTTjK/BcaqmkE3sUQh14ns5qetLdcZm3N77IVGYmJN1O9ScXk5r2hFBMaYc3j
	 C8hWqe6vLX4VPipJT3jTLtsl3imLuSsFa7qZmxnyYMtwDEu/HJdCDnpur53acZnlXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vah1V1BJ;
	arc=none smtp.remote-ip=95.215.58.101
Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E19606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 05:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08E19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vah1V1BJ
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=k23lgE2Jzwowgo6m52d31kwDYMIKzjyRuwBX8TKnliw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794548852; v=1; x=1795153652;
 b=vah1V1BJzyDQPBXiFoiTCNiHazPgAheKdRO33bHipe52/y+yAl43SB0Ku0GgJ1V00l0jR64R
 gNZEwA/rC3wGHfKH5EC1jOD3dd6dcxe+kruvkxcP9wAPduHUaHJzKIMkrOL062xAgoCL2lhYlpj
 r8OK8eWv7WROLSvGnQ/SL8H8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 6a17f1505f6787fd;
	Fri, 13 Nov 2026 05:47:32 +0000
X-Mizu-Trace-ID: 6a17f1505f6787fd
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
Subject: Re: [PATCH v2 12/14] mm/cma: centralize CMA pageblock initialization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-212157@kernel.org>
Date: Fri, 13 Nov 2026 13:47:13 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Li Zhe <lizhe.67@bytedance.com>,
 Andrew Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>,
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
Message-Id: <EDBD7566-17EA-4B8D-8510-E670614DDA01@linux.dev>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-13-songmuchun@bytedance.com>
 <sashiko-outbox-212157@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 13, 2026, at 12:07, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/cma: skipped and per-PFN managed page accounting in
>  cma_activate_area()
> --
>=20
> commit cd588f911bb59c4583e63d2e776ba252d0663161
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/cma: centralize CMA pageblock initialization
>=20
> This commit moves the initialization of early-reserved CMA pageblocks =
from
> hugetlb into cma_activate_area() and restores managed-page accounting =
for
> those pages if CMA activation fails.
>=20
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 9ec1d1fd5dff5..46e72734ba729 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>=20
> [ ... ]
>=20
>> @@ -191,12 +195,13 @@ static void __init cma_activate_area(struct cma =
*cma)
>> 	/* Expose all pages to the buddy, they are useless for CMA. */
>> 	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
>> 		for (r =3D 0; r < cma->nranges; r++) {
>> -			unsigned long start_pfn;
>> -
>> 			cmr =3D &cma->ranges[r];
>> -			start_pfn =3D r <=3D allocrange ? early_pfn[r] : =
cmr->early_pfn;
>> +			end_pfn =3D r <=3D allocrange ? early_pfn[r] : =
cmr->early_pfn;
>> +			for (pfn =3D cmr->base_pfn; pfn < end_pfn; =
pfn++)
>> +				=
adjust_managed_page_count(pfn_to_page(pfn), 1);
>> +
>> 			end_pfn =3D cmr->base_pfn + cmr->count;
>> -			for (pfn =3D start_pfn; pfn < end_pfn; pfn++)
>> +			for (; pfn < end_pfn; pfn++)
>> 				free_reserved_page(pfn_to_page(pfn));
>> 		}
>> 	}
>=20
> [Severity: Medium]
> Does gating the adjust_managed_page_count() loop on
> !CMA_RESERVE_PAGES_ON_ERROR leave early-reserved gigantic hugetlb =
pages
> unaccounted in zone->managed_pages and totalram_pages if CMA =
activation
> fails?

Right. I think the following diff will fix it.

diff --git a/mm/cma.c b/mm/cma.c
index 7ca0e100504d..e8845747f7cf 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -200,18 +200,23 @@ static void __init cma_activate_area(struct cma =
*cma)
        for (r =3D 0; r < allocrange; r++)
                bitmap_free(cma->ranges[r].bitmap);

-       /* Expose all pages to the buddy, they are useless for CMA. */
-       if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
-               for (r =3D 0; r < cma->nranges; r++) {
-                       cmr =3D &cma->ranges[r];
-                       end_pfn =3D r <=3D allocrange ? early_pfn[r] : =
cmr->early_pfn;
-                       for (pfn =3D cmr->base_pfn; pfn < end_pfn; =
pfn++)
-                               =
adjust_managed_page_count(pfn_to_page(pfn), 1);
-
-                       end_pfn =3D cmr->base_pfn + cmr->count;
-                       for (; pfn < end_pfn; pfn++)
-                               free_reserved_page(pfn_to_page(pfn));
-               }
+       for (r =3D 0; r < cma->nranges; r++) {
+               cmr =3D &cma->ranges[r];
+               end_pfn =3D r <=3D allocrange ? early_pfn[r] : =
cmr->early_pfn;
+               /* Restore managed page accounting for early-reserved =
pages. */
+               for (pfn =3D cmr->base_pfn; pfn < end_pfn; pfn++)
+                       adjust_managed_page_count(pfn_to_page(pfn), 1);
+
+               if (test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags))
+                       continue;
+
+               /* Expose the remaining pages to the buddy. */
+               end_pfn =3D cmr->base_pfn + cmr->count;
+               for (; pfn < end_pfn; pfn++)
+                       free_reserved_page(pfn_to_page(pfn));
        }
        totalcma_pages -=3D cma->count;
        cma->available_count =3D cma->count =3D 0;

>=20
> When crashkernel=3D...,cma is used alongside hugetlb_cma,
> hugetlb_cma_add_crashkernel_ranges() sets CMA_RESERVE_PAGES_ON_ERROR =
on
> the hugetlb_cma area before hugetlb_bootmem_alloc() reserves gigantic
> pages from it via cma_reserve_early().  gather_bootmem_prealloc_node()
> always skips adjust_managed_page_count() for hugetlb_early_cma(h) =
folios,
> and those folios remain active in the hugetlb pool even if
> cma_activate_area() fails, so their managed page count needs to be
> restored regardless of CMA_RESERVE_PAGES_ON_ERROR.
>=20
> Also, calling adjust_managed_page_count(pfn_to_page(pfn), 1) once per =
base
> PFN invokes setup_per_zone_lowmem_reserve() for every 4 KiB page =
(262,144
> times per 1 GiB page) instead of stepping by pageblock_nr_pages or
> adjusting by end_pfn - cmr->base_pfn.

Batching is not generally safe here. Activation can fail before zone =
validation,
or because the CMA range crosses zones, while =
adjust_managed_page_count(page, count)
charges the full count to page_zone(page). Since this is an exceptional =
early-boot
failure path, I prefer to retain the per-PFN accounting.

Thanks.

>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261113033442.62970-1-songmuchun@bytedance=
.com?part=3D12

