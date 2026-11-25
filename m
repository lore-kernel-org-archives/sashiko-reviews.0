Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606379;
	b=acwLrCoN/FfYBxTZj7JhQLaCsAIQWuEFzQrvsabuIxSSyHOycMEFba4vXkEY5slkr6lT
	 EPO+0iq5xeICTFkzN6+yeI739l5lkUoNsXafEef7Af1IxWwb7OiPMEJEUX2CdjX5CBEtL
	 VVA7uMoKShv8bnqLO3/6fVAY/DFwJ0FQh98e0rGl/y7FI0wbp+5pxH6BFbOibR6mCNMhb
	 rnBb30DOc3zdKmEmXENbcOVUlVAyEkCr+hPdtuwUkyhOHVcAsn37KcLmjGbp5aODKgckU
	 oBc7Y6nduFuHyhmMrmB1csFYW4NTZNj9fNS8NoDFvGXPyLssaHj6tpyx1YdQ+7eIHWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606379;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=0V6f85LpMW4xwrS3x6+t74PKgkFqxH39qfpnircqYfU=;
	b=Lt/JBd6cOgQJDBWZnOOZVssHbZBQm6TE5Nl9X9FRTi+zBHbLlWCTArIyAso9DuFb8rhk
	 zrc/4thja9uGPytovB02GWFuUnFQNtv4Y7FBGCGl24gqrPXaXSID6H/d424f6l07yvoLw
	 FqX1zCz0QG6VTB1UoeasGr3nibW0YfkgAOxbyJrUN2CErZSOsbsKSjwxAC9pCNYk5Mctp
	 1oBoL61cKCS2Nsl2VMbfKpcxSwX/kjV1PfQC5Dy64xKNTPgHuVZ4lto/YpAepiHwZC2f/
	 9rXyydc4NBLAG9Y4ZzZJW92ekzRScbqiFYadAa/KQ2ThkLBNRUTr1dwveA+MFMhZVqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Dwjp75Wa;
	arc=none smtp.remote-ip=95.215.58.215
Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E9606A33D
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350E9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Dwjp75Wa
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=DeSjNojkk4MD/tKsHkRDT7b8MjIXbSU/jX7LSyciBWI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795606376; v=1; x=1796211176;
 b=Dwjp75WaPQLe2GefeA80kr6niIOaCdkb8YzS1evkZiW/zoA/ncTRFFzSlMJtn+YbTNEPRe6j
 SpeTFw+wyiOQxcTg0NyAOu3DzKLpbREWLtDtZRsubcVBMVg2KI6SGKjWHy/04avRnknTZpqQ2n+
 orEqGU+oOWBeu8RPeqWpSxP8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 92cb8adb5f7c7ac6;
	Wed, 25 Nov 2026 11:32:55 +0000
X-Mizu-Trace-ID: 92cb8adb5f7c7ac6
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
Subject: Re: [PATCH v3 16/19 DO-NOT-MERGE] arm64: Implement
 try_populate_vmemmap_pmd using AF trick
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HWNAByKifcNgre_YAX3M+bwAW0BgMrfPmWHubOEs+AfDQ@mail.gmail.com>
Date: Wed, 25 Nov 2026 19:32:37 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 sashiko-reviews@lists.linux.dev,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5028917F-EFF3-488C-903E-9E19E5DDA3D1@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-17-jthoughton@google.com>
 <sashiko-outbox-228645@kernel.org>
 <CADrL8HWNAByKifcNgre_YAX3M+bwAW0BgMrfPmWHubOEs+AfDQ@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 25, 2026, at 01:39, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> =
wrote:
>>=20
>> Thank you for your contribution! Sashiko AI review found 2 potential
>> issues to consider:
>> - [Medium] arm64/mm: over-broad TLB flush in =
try_populate_vmemmap_pmd()
>> - [Low] arm64: direct AF=3D0 block-to-table transition in
>>  try_populate_vmemmap_pmd()
>> --
>>=20
>> commit 1319c4a7862ad5f3b810c4beca866ee98bd48fd7
>> Author: James Houghton <jthoughton@google.com>
>>=20
>> arm64: Implement try_populate_vmemmap_pmd using AF trick
>>=20
>> This commit implements try_populate_vmemmap_pmd() on arm64 to replace
>> in-use leaf vmemmap PMD block entries with table entries by clearing =
the
>> access flag instead of using a break-before-make sequence when BBML3 =
is
>> not supported.
>>=20
>>> diff --git a/arch/arm64/include/asm/pgalloc.h =
b/arch/arm64/include/asm/pgalloc.h
>>> index 0263329fb7b30..7e304f01ce6d5 100644
>>> --- a/arch/arm64/include/asm/pgalloc.h
>>> +++ b/arch/arm64/include/asm/pgalloc.h
>>> @@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, =
pgtable_t ptep)
>>> static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t =
*pmdp,
>>>                                         pte_t *pgtable)
>>> {
>>> -     /* BBLM3 is required. Its presence has been checked. */
>>> -     pmd_populate_kernel(&init_mm, pmdp, pgtable);
>>> -     return 0;
>>> +     const int max_attempts =3D 16;
>>> +     int attempts =3D 0;
>>> +     pmd_t old_pmd, new_pmd;
>>> +
>>> +     if (!system_supports_bbm_through_af())
>>> +             return -EOPNOTSUPP;
>>> +
>>> +     if (system_supports_bbml3()) {
>>> +             /*
>>> +              * BBML3 allows block->table transitions if the PTEs =
underneath
>>> +              * do not conflict with existing, potentially cached
>>> +              * translations.
>>> +              */
>>> +             pmd_populate_kernel(&init_mm, pmdp, pgtable);
>>> +             return 0;
>>> +     }
>>> +
>>> +     new_pmd =3D __pmd(__phys_to_pmd_val(__pa(pgtable)) |
>>> +                     PMD_TYPE_TABLE | PMD_TABLE_AF | =
PMD_TABLE_UXN);
>>> +
>>> +     old_pmd =3D pmdp_get(pmdp);
>>> +
>>> +     do {
>>> +             if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
>>> +                     return -EINVAL;
>>> +
>>> +             if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
>>> +                     return -EINVAL;
>>> +
>>> +             /* We should never get a contiguous PMD here. */
>>> +             if (WARN_ON_ONCE(pmd_cont(old_pmd)))
>>> +                     return -EINVAL;
>>> +
>>> +             if (pmd_young(old_pmd)) {
>>> +                     /* __ptep_clear_young() returns the =
overwritten PTE */
>>> +                     old_pmd =3D =
pte_pmd(pte_mkold(__ptep_clear_young((pte_t *)pmdp)));
>>> +
>>> +                     flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>>> +             }
>>=20
>> [Severity: Medium]
>> Should this pass addr + PAGE_SIZE instead of addr + PMD_SIZE to
>> flush_tlb_kernel_range()?
>>=20
>> Invalidating a single non-contiguous PMD block entry only needs one
>> overlapping page-granular TLB invalidation, as in
>> unmap_hotplug_pmd_range().  With a range of PMD_SIZE and stride of
>> PAGE_SIZE, pages equals PTRS_PER_PTE (MAX_DVM_OPS), so
>> __flush_tlb_range_limit_excess() returns true on CPUs without
>> FEAT_TLBIRANGE and escalates the flush to flush_tlb_all().
>=20
> Oh! I didn't know that!
>=20
> I will change it to PAGE_SIZE instead of PMD_SIZE in v4. Neat!
>=20
>>=20
>>> +     /*
>>> +      * Translations without AF cannot be cached, so we can replace
>>> +      * them without BBM.
>>> +      */
>>> +     } while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), =
&pmd_val(old_pmd),
>>> +                                   pmd_val(new_pmd)) &&
>>> +              ++attempts < max_attempts);
>>=20
>> [Severity: Low]
>> As reported by Catalin Marinas on v1 [1], this rests on an =
architecture
>> detail the review could not confirm from the kernel source: can a CPU
>> walk cache or TLB retain information from a valid leaf block PMD
>> descriptor when AF=3D0, or is a TLB invalidation and =
break-before-make
>> sequence still required before converting a valid AF=3D0 block =
descriptor
>> into a table descriptor without BBML3?
>>=20
>> If it can, skipping flush_tlb_kernel_range() when pmd_young(old_pmd) =
is
>> already false or directly overwriting the valid AF=3D0 block =
descriptor
>> with new_pmd leaves stale walk-cache or TLB state active while a =
table
>> entry is installed.
>>=20
>> [1] https://lore.kernel.org/r/aoSJcAFMNJ1nPl2H@arm.com
>=20
> Yeah, this is why these final 5 patches are marked as DO-NOT-MERGE.

If we aren't sure about the hardware behavior here, why don't we just =
drop
these patches? Once the initial support of HVO for arm64 is merged into =
the
community, we can bring up this uncertain part for discussion. Wouldn't =
that
be simpler for this series?

Thanks,
Muchun

>=20
>>=20
>> --
>> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261122184453.2668189-1-jthoughton@google.=
com?part=3D16


