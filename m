Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694030;
	b=rszplHe1KJjk9bKeCCzW5AYlB28anJBhBxJj7SU5tLHt1WNjQ3cEuhUIf4UNR30gSkKH
	 a83inrgaO12QiupdRRZ/jOynS8EjKRkzr+XRj0DBTf2fVr5uDTpC0z1XLIq6+yVsE5pxw
	 JTrZJMQ0Ejj96nR7FVXKKruCBxUrxgVmED1ws7jSkKXK/B6NsajCNvnlu2tmesB7RwKcN
	 RubKKMPfEXzjaYpRADX/Vaw++aqcPPxacbfbqlpWYyLi+W4m5bYQxoRtfJyqUHgXsUZdx
	 /35Wahak1aX5YP/KZz6XbWn09Q39yKD52+GdeHYU5AbjEkohX8+OnLjScbIpjgcQ9Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694030;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=zCkHC4ldGehHgXmc8PYBcbJF+ptQMne1mLzrRO9u6FE=;
	b=IM6jx2wXRU2h3xBMoEWC0MPA/wOIyQmrJPVadwcHctaJ7JzAfacHeGbOpQ21oghA9Lgd
	 LQTxlcpAlydC/GItTXoz6QFICHl+Gybp3CUJSO1MYYR2qJaxnxST+04qPQqi19xSsN3jg
	 kk2nxvdfLaoY8H+nmQgPDZG9yfG7kL3kxw69gGEQabp6sKNmIByTQbFfwAi3GHnv2priZ
	 YQtksJwKzmlwOc2aYMOop4ms7aLJZExsGPn1dGG3KChX+X/huFduLWv51ZfwPL6x83Yrx
	 D2GAvUKCJ+/SdyOX7pKWj1HFY+6n9arf69eN0KU6eVQiRm9SVRtG+32GjxqfiEe8uqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ORijIlKC;
	arc=none smtp.remote-ip=91.218.175.19
Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12E606A324
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 08:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD12E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ORijIlKC
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7sNvMkbEx+a1OkL8MgmFgxz6woP3TroOTg1/h23FhUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793694027; v=1; x=1794298827;
 b=ORijIlKC9WKQi0rVET7PRzYa0bjYpf8dOLAC8wkXh6feTHSEz6wsIiI+WD9PdFaA0Qvs++Bm
 UcgLJ5ywQWCAK4AOFk2GlB8ettHUKK4SAqyDIc6kyQu1nXmVf2Y+KpTDIACFpqcLkkmR2fkszXD
 iS2xYxvmK/95R5UigHp+0eI4=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id d5aaef5f702bfade;
	Tue, 03 Nov 2026 08:20:26 +0000
X-Mizu-Trace-ID: d5aaef5f702bfade
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
Subject: Re: [PATCH] mm/hugetlb: fix validation of unsupported HugeTLB orders
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-194806@kernel.org>
Date: Tue, 3 Nov 2026 16:20:08 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDC3B454-CBB4-428D-A97F-B3B8414BBC07@linux.dev>
References: <20261103023831.1805473-1-songmuchun@bytedance.com>
 <sashiko-outbox-194806@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 3, 2026, at 16:13, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> - [High] mm/hugetlb: boot BUG_ON() in hugetlb_init() when HPAGE_SHIFT =
is 0 on powerpc
> --
>=20
> commit 83959b12982c256d20ca0de51021b3beae201569
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/hugetlb: fix validation of unsupported HugeTLB orders
>=20
> This commit replaces BUILD_BUG_ON_INVALID() with MAYBE_BUILD_BUG_ON() =
in
> hugetlb_init() so that configurations where HUGETLB_PAGE_ORDER exceeds
> MAX_FOLIO_ORDER are rejected at build time when constant or via =
BUG_ON() at
> runtime otherwise.
>=20
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index ff9dbfbc7a961..e21ac667694bd 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -4181,7 +4181,7 @@ static int __init hugetlb_init(void)
>>=20
>> 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE =
<
>> 			__NR_HPAGEFLAGS);
>> -	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>> +	MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>=20
> [Severity: High]
> Will placing MAYBE_BUILD_BUG_ON() before the hugepages_supported() =
check in
> hugetlb_init() trigger a boot BUG_ON() on architectures like PowerPC
> Book3S-64 when huge pages are unsupported at runtime?

Yeah, it's easy to fix, but I'll wait another day before updating =
it=E2=80=94just
in case others have feedback.

Thanks,
Muchun

>=20
> On CONFIG_PPC_BOOK3S_64, arch/powerpc/include/asm/page.h defines =
HPAGE_SHIFT
> as a runtime unsigned int variable:
>=20
>    extern unsigned int hpage_shift;
>    #define HPAGE_SHIFT hpage_shift
>    ...
>    #define HUGETLB_PAGE_ORDER (HPAGE_SHIFT - PAGE_SHIFT)
>=20
> Because hpage_shift is not a compile-time constant, =
MAYBE_BUILD_BUG_ON()
> expands to a runtime BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER).
>=20
> When huge pages are not supported by the platform or are disabled at =
boot
> (for example, when hugetlbpage_init_defaultsize() in
> arch/powerpc/mm/book3s64/hugetlbpage.c finds no supported huge page =
sizes),
> hpage_shift remains 0, which hugepages_supported() checks:
>=20
>    static inline bool hugepages_supported(void)
>    {
>            if (hugetlb_disabled)
>                    return false;
>=20
>            return HPAGE_SHIFT !=3D 0;
>    }
>=20
> Evaluating HUGETLB_PAGE_ORDER before checking hugepages_supported() =
computes
> (0U - PAGE_SHIFT) in unsigned int arithmetic, wrapping around to a =
large
> unsigned value that exceeds MAX_FOLIO_ORDER and hits BUG_ON().
>=20
> Should MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER) be =
moved
> after the if (!hugepages_supported()) block in hugetlb_init(), similar =
to how
> hugepage_init() in mm/huge_memory.c checks has_transparent_hugepage() =
before
> evaluating MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_PAGE_ORDER)?
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261103023831.1805473-1-songmuchun@bytedan=
ce.com?part=3D1

