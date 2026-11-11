Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385954;
	b=h3ate0XTFHdnBlW34yAUPgt92AaO5kKjG2lWaSY3lUtBfSIFZemGMRMxnI1ugLFepb5Z
	 5JtCXWuoCPIAtynTuIHXb2R5YCPXuHv6yT6/S711CkoXhRUdWNLHkHhFI8VRHrrDPS2ns
	 XeWPB4W4+C+qLmzotmVYf6ATta7cg+E0lpKIFKH6BF/diBIdx7B+l29YqBkwv79e8uupY
	 rJYQfOe0jOuEq7YeOqhCG/1ZhQ2vGzDbDAUHW/ceJjUKQM4c8u2WfdF4igG+aMpZC96VD
	 h2ntTqZI0qkZ7qLJFHmtINGYIjX2sdk0ikHb/+Pv4Z8iLVnpEv+/6D1Ssr8CqWY87HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=/GPPQeHUC5B+kqwljLDfgvXAOpL+49jyNjXeUp6zlqI=;
	b=dCyobA8hdKa/xcggBBnO3sMHn1YiONZHpNiiNOsN1f3Dd612cNhiB4UwVyYSZ6OYt1kb
	 G6yFxqmHZbJ9k+uigDnSYIbNdcOpB6E1o1GZ+y0wNpE/GwI/WqoiL4GBvODS47E+gLgbB
	 oqBCJBqW83g6rOX4ye8Mmva4WtrK0REnNsn1zGeJ32T9DzWk+qOZaW4KKTt0Bjfxy4SP2
	 lYQhE3tcoSYamw2DJ89yi5VbmJxE3ydvvRqjZwbP6qeUAEYEonR8dfPqvHBut9wWAo/I9
	 466LNZChFo86g2Ksfh0+OoYJVcaoVIEte/j1KXqiygKUCS6XZDUbYeK7q0YA31lCyrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Dk66witd;
	arc=none smtp.remote-ip=91.218.175.147
Received: from mta0.migadu.com (out-147.mta0.migadu.com [91.218.175.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24276606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 08:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24276606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Dk66witd
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=dhlpr5+SPOvUdYnN6WpqPYeLnGLPggshdzJrAywxpNA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794385952; v=1; x=1794990752;
 b=Dk66witdAsnLUiWP/E3/l0kL94BsXihMIlqqG2cGjwRIkFWQ8u71KHsxB3/+TAEpm7C2Jfxa
 piot+b6AIc7/7iCr+fpDbaJPprM5smshH5h4yfizXIT4uUdTvEDrlwrBTevXuQb+8sNWBEZOo08
 QCV+eO1DtIfh0J4p0Kulcc6I=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id 91f71c34f96ac602;
	Wed, 11 Nov 2026 08:32:32 +0000
X-Mizu-Trace-ID: 91f71c34f96ac602
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
Subject: Re: [PATCH] mm/hugetlb_vmemmap: fix PMD split TLB flush race
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-206969@kernel.org>
Date: Wed, 11 Nov 2026 16:32:14 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C58DC8B2-F2F6-49F0-A9D4-079FA66B69C9@linux.dev>
References: <20261110112456.62827-1-songmuchun@bytedance.com>
 <sashiko-outbox-206969@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 10, 2026, at 20:01, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/hugetlb_vmemmap: deadlock from GFP_KERNEL alloc under
>  init_mm.mmap_lock
> --
>=20
> commit c4de2ad9c999ebd1524c99a20d1c19a13ab7ec8f
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/hugetlb_vmemmap: fix PMD split TLB flush race
>=20
> This commit serializes batched vmemmap PMD splitting and its final TLB =
flush
> against concurrent PTE remapping using init_mm.mmap_lock.
>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index ba8e11e399b24..ba6559bef742a 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
> [ ... ]
>> @@ -559,6 +565,7 @@ void hugetlb_vmemmap_optimize_folios(struct =
hstate *h, struct list_head *folio_l
>> 	if (list_empty(folio_list))
>> 		return;
>>=20
>> +	mmap_write_lock(&init_mm);
>> 	list_for_each_entry(folio, folio_list, lru) {
>> 		int ret;
>>=20
>=20
> [Severity: High]
> Can holding init_mm.mmap_lock for write across =
hugetlb_vmemmap_pteify_folio()
> deadlock in memory reclaim?

A valid point, I'll fix it ASAP.

THanks.

>=20
> hugetlb_vmemmap_pteify_folio() walks the kernel page tables and calls
> vmemmap_split_pmd() -> pte_alloc_one_kernel(&init_mm), which allocates =
a page
> table with GFP_PGTABLE_KERNEL (GFP_KERNEL).  Reclaim shrinkers such as
> ttm_pool_shrinker_scan() take mmap_read_lock(&init_mm) when restoring =
direct
> map attributes via set_pages_wb() -> change_page_attr_set_clr():
>=20
> hugetlb_vmemmap_optimize_folios()
>  mmap_write_lock(&init_mm)
>  hugetlb_vmemmap_pteify_folio()
>    ...
>      vmemmap_split_pmd()
>        pte_alloc_one_kernel(&init_mm)  /* GFP_KERNEL */
>          <direct reclaim>
>            ttm_pool_shrinker_scan()
>              ...
>                change_page_attr_set_clr()
>                  mmap_read_lock(&init_mm)  <-- self-deadlock
>=20
> Because fs_reclaim nests outside init_mm.mmap_lock, this also triggers =
a
> lockdep splat on the first vmemmap PMD split (including under
> mmap_read_lock(&init_mm) in vmemmap_optimize_folio()) and can ABBA =
deadlock
> against kswapd.
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261110112456.62827-1-songmuchun@bytedance=
.com?part=3D1

