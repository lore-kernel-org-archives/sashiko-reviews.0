Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452369;
	b=s8X4xGQshk0qe9fablTvRhlegFpluDGBaCwF8RNJehLuziudCt41oZZjAzvTbVdp1eR9
	 kzvWhnKyxrRTXQ9T30qO7CUEsWYpPJ4zGWI4d75S1Pkcey6p/OOgAbfs3nLt5h2fyE8Ql
	 qXWYsvgtfatQ+UrMUd4KNmwpO+ZT/ZzN3y6rn9VkUHG0VSj4aqu5kWQ1KZ3y+3UZ3IJOX
	 /vMHCeXT+PypPq0Ctjdtk2tq45m8mIk7PCNZMyhMkdUC6OsXg5NqOLke51MlUP9U/MCKZ
	 HSmVStLDgImLvmGoIaaSDDu+EW/e8Mr73nXPAoW7x4yUnTChcvB5E1G1QCnFXLzyq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452369;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=0J11tLi8SfFmSWAqFUDP4HJVX5c9ZbamsLUfA0GsiEY=;
	b=Yj+VU3NVnKUYqPU1Qy/dgzdi21Yw5MHPd8myM2bcInH3/ceW8qNg0gTU+Rloy0143qlA
	 YZSHjnyJkZiBMP166mLchgnPapbAAk9pc/rNfvEWD8u8w48C96kMoTC+Walixj1jeAcZy
	 2Y+Eul2jQefjBBQm1E8T9g0uLdk+us4dhhoq1QioGnGAN48dtevwbF7SG4gYuINJgqIq/
	 1LV7KoZycu7NhuGLBIw5IgVTFQqpAh6LMgbmUpVhBghwKB6Qj7zKm58MuyvkEUBX64lDo
	 KTVkg+zlbvevxwHeUrYg1YdbyWkQVLlqHUC7gOKddPJPipgFzF+4/CoEsT3iArVqxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qsZFiTQz;
	arc=none smtp.remote-ip=95.215.58.219
Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD61606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 02:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qsZFiTQz
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=WMBj19dOUDYdPyz+QJ76elqBaDh3uyu1qhcDOGOiJYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794452366; v=1; x=1795057166;
 b=qsZFiTQzAvIE5Syb/Uv58dNdA2ZLlSwSeK6iY6+DhavGovhmFqnemAAiK8laTM/rygbVGn4U
 o6pN+ZGqoNylSGBmdLpqTvKUk6faDpcYlztbOBMFWSy1B/OdS7/STUtGdVr4uHC5ECWasVo/NVP
 zudpxAhHYjH2ejh9Zp6zsk98=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 50165d57d30e2034;
	Thu, 12 Nov 2026 02:59:26 +0000
X-Mizu-Trace-ID: 50165d57d30e2034
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
Subject: Re: [PATCH v2 1/3] mm/hugetlb_vmemmap: fix lost HWPoison state during
 optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-209812@kernel.org>
Date: Thu, 12 Nov 2026 10:59:08 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Miaohe Lin <linmiaohe@huawei.com>,
 David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E848BF4-4AB4-4656-8523-FAC6DD8FDAEA@linux.dev>
References: <20261111093747.50048-1-songmuchun@bytedance.com>
 <20261111093747.50048-2-songmuchun@bytedance.com>
 <sashiko-outbox-209812@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 12, 2026, at 06:38, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/memory-failure: unserialized unpoison_memory() races =
with
>  HVO head remap
> --
>=20
> commit c0c1b7e9976626bf636152889fd9f5d88944d78b
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/hugetlb_vmemmap: fix lost HWPoison state during optimization
>=20
> This commit introduces vmemmap_remap_rwsem to serialize HVO head page
> remapping against HWPoison state updates in =
get_huge_page_for_hwpoison().
>=20
>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>> index 78f0a13349cb3..164a02866fd59 100644
>> --- a/mm/memory-failure.c
>> +++ b/mm/memory-failure.c
>=20
> [ ... ]
>=20
>> @@ -2038,6 +2039,7 @@ static int get_huge_page_for_hwpoison(unsigned =
long pfn, int flags,
>> 	bool count_increased =3D false;
>> 	int ret, rc;
>>=20
>> +	guard(vmemmap_remap)();
>> 	spin_lock_irq(&hugetlb_lock);
>> 	folio =3D page_folio(page);
>> 	if (!folio_test_hugetlb(folio)) {
>=20
> [Severity: Medium]
> Does unpoison_memory() also need vmemmap_remap_rwsem when clearing
> PG_hwpoison and freeing folio->_hugetlb_hwpoison?

I think the following diff will fix this.

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 164a02866fd5..abe92db14fbc 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2814,6 +2814,7 @@ int unpoison_memory(unsigned long pfn)

        ghp =3D get_hwpoison_page(p, MF_UNPOISON);
        if (!ghp) {
+               guard(vmemmap_remap)();
                if (folio_test_hugetlb(folio)) {
                        huge =3D true;
                        count =3D folio_free_raw_hwp(folio, false);
@@ -2830,6 +2831,7 @@ int unpoison_memory(unsigned long pfn)
                                         pfn, &unpoison_rs);
                }
        } else {
+               guard(vmemmap_remap)();
                if (folio_test_hugetlb(folio)) {
                        huge =3D true;
                        count =3D folio_free_raw_hwp(folio, false);

>=20
> If a newly initialized hugetlb folio is poisoned by a =
software-simulated
> memory failure before HVO acquires vmemmap_remap_rwsem, =
unpoison_memory()
> can race with the head page remap:
>=20
> CPU0                                CPU1
> hugetlb_vmemmap_optimize_folio()
>  down_read(&vmemmap_remap_rwsem)
>  ...
>    vmemmap_optimize_pte()
>      vmemmap_dup_page_from_list(old_head, ...)
>                                    unpoison_memory()
>                                      get_hwpoison_page(..., =
MF_UNPOISON)
>                                      folio_free_raw_hwp(old_head, =
false)
>                                      =
folio_test_clear_hwpoison(old_head)
>      set_pte_at(..., new_head)
>      flush_tlb_all()
>                                    /* new_head retains PG_hwpoison and
>                                     * freed _hugetlb_hwpoison pointer =
*/
>=20
> In get_hwpoison_hugetlb_folio(), passing unpoison =3D=3D true takes =
the
> folio_try_get(folio) branch even when =
!folio_test_hugetlb_migratable(folio),
> returning 0 on the frozen folio instead of -EBUSY:
>=20
> mm/hugetlb.c:get_hwpoison_hugetlb_folio() {
>    ...
> 		if (folio_test_hugetlb_freed(folio))
> 			ret =3D 0;
> 		else if (folio_test_hugetlb_migratable(folio) || =
unpoison)
> 			ret =3D folio_try_get(folio);
> 		else
> 			ret =3D -EBUSY;
>    ...
> }
>=20
> unpoison_memory() then sees ghp =3D=3D 0 and calls =
folio_free_raw_hwp(folio,
> false), which skips the folio_test_hugetlb_vmemmap_optimized(folio) =
check
> used when move_flag is true and frees the struct raw_hwp_page entries =
from
> old_head.  Once CPU0 installs new_head and flushes the TLB, the folio =
still
> has PG_hwpoison set and folio->_hugetlb_hwpoison pointing to freed =
memory,
> leading to a use-after-free or double free when the list is later =
walked or
> freed.
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261111093747.50048-1-songmuchun@bytedance=
.com?part=3D1

