Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542025;
	b=Ok1EI4U7Q/9fkFlhmBtv4+i364yWXUbuzOAWxzK3ZM6chtcdfHS/R46jl1MI3h4bRPJF
	 5MF2iBCzLBvbiRvXIOvYtMFKDV8MID8Bj2HfPLJfOTwl9zL8CPUr0Dx+o0zQ/a3fxwCvI
	 F8m35f2t2Ib0Y9kQKj4o+TtHwzcfTDg6bfq3IT0X69rRCvNHkp0ae3t0zw9SLtWoZhCJI
	 vt6XpKZSh2CtVbqZzZ8O+C6tlJ4copPmQa87bq0FvJQZxix1gq5ezLpwIIIFuxJ7gUM9a
	 KNPys5I+GvMlOOyVLLcSSxT3ev1glIxIXUsNI5WtiQRq80+CE/g58i916LesNK0Fm4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZyMW0Suh0lL3Bzt0NE42D1NOyP8/ltJQBT/Rp/e1E1o=;
	b=CHh/+Ffgm6w70oGfqprwm3G8oEiTqryRiyj2uMlBAeotQW9LJWYLQSW43Mw/hdkFkm0U
	 Bbj78oc2GOGWbruhVGy2rg/V0ga+4pMRrRKKFK5eq9gC+Uc99C8BJIcnTh/y1i3mZmrud
	 rJujc5W8EGPEvuWEcx4EIPq8MLUcSR4RgpvnX0bW9lp683kPZ2wMX0LF0J+XdLkjfiNrm
	 irZ1p2E7yLle+tcxGh+wZDgaSqLVcmXlIaeGcd4/ZsMevnWm8HN9VmP11/69fEgQ5Hwmz
	 vJngg23w8VDaX4bp0aw7gjR+Fe7M5uDrOuxvlGGoa5d8zkQE5VKGVI2Ptg8bKl9g6SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WivcCEih;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D46606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 17:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WivcCEih
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5188e17487so299830766b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:40:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795542023; cv=none;
        d=google.com; s=arc-20260327;
        b=qTuNa8i4LBqTMJ6uYqZtsQGPLRPCbkVFhxfySdgxQoTzvqWTNZCWikkaeukppqUcbT
         56wZpHT6n2ZeYQFb2kDKoi0vxZPdVkbRbTnjuB5VTzuDQwkQmPLtsP9fKsd+yAH4zR+H
         YbonlRH25Hu0Ta0LqgflmEW9QRvfbtqCueJzGshkfiKmMWsHrYuS5RlVgrVM+h7MHe4o
         foJ/avwnvfH3yACoSNQm0x4mBaixvm0wRINhe5Z9meQRkIH8e/3k+IIUaHTo33eTgNFy
         2Fi3ajCaZro2esLDX9yssSc8Sj65fIrmdJiCWlqkmjUJsNxxsA8WLrShRnYB+qiL7i2B
         rFyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyMW0Suh0lL3Bzt0NE42D1NOyP8/ltJQBT/Rp/e1E1o=;
        fh=yG0GPR0QiT6n4FwClexevtHuIFSRQ+sxjflZXF2i7Wc=;
        b=dl9seFiQI6QNvPhdMZvbUrU5BVnV3WG9zwgstMt5tC94sUwL8zdlbiH0qCSe96C3sI
         VhlBkXanNoh2Zi8LGLC2/ung2W7bzNkGvCjhiz5m3UVUXY/TQB05xn2/hE4VKsEB/rJ6
         wMhloVegomGq/hO2WPeiigTkgbmm1BxXHsD4z3o9p2COShtzOhH4+VICKxLMILUpe30t
         KTPqB+2Bm0J+3UrWeohkj6OgoptCFH52FH7uvNOoT1cc7m04FMDh61beffxqwFgRAY3l
         XbjJw9ZZtxDi1w3qwKVxGDOg+7fHL55oB6H/Kmcoj6POnp3coCeWkCkYoK5hYmUd9NbR
         sx0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542023; x=1796146823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZyMW0Suh0lL3Bzt0NE42D1NOyP8/ltJQBT/Rp/e1E1o=;
        b=WivcCEihv8RN5amGF1/oNgJ+WUEZrx1vLvt/Ny0wJ3zBfxbSYXCG/4jSswQrUxTh35
         PR9um4Jp8st+2aveqjkBy6d4ywxW82ZTpg0fvS5Znnso6/rE7I43bWiJ8J3ZXzlmXJOp
         LVHoVwK6WJpunFaxrLNB/9ivWvVXSBXUx84XkDzHTl6yT0xqQj6MsgADP6m7aHGlc4s1
         qwr4GVwM+O/6ceplXLUzdvBXcIDATTkfnhp8n5Y3J+COSYnuQ0CRNEWNM2hkuHNFGBbB
         fdw2MySHHqXUkUtv9iHhYUSNCB8Z4Db7H9Hq3pgTgXKVIN/I1WDMFCLV+hwkVZjrGFUw
         hpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542023; x=1796146823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyMW0Suh0lL3Bzt0NE42D1NOyP8/ltJQBT/Rp/e1E1o=;
        b=Rv/s/mUlJ8QzJ9YmhEJ/QW2JcAnYzhlRJJKoR0d8f157qP8J8TDS5vxVKaEiMlkAKP
         1IbasgdTUdKfBT/4mpXdXV2LPsCES21w4XNubSrOh/vg1K61owozhHfjLXPhW8QWpV1T
         jIeBbUxcWoe7uFGcC/Ue71Q4jVbcbWE0CX4+WmE5pPizrg7VH1aQ8b0KM24ZiY2HWKIS
         e2jFS+vXTBAYd0B9VlEq2W/7NIvTR54qHa039T+8OarnE7Y1YUndl5mtFCA3tHe5r1lD
         5geE8rBCL/7zMhP1hzmO193E8Q9VGeepruej9kF7bOsrIGcbHGGtJ5xQG3V2e3J4Dc3K
         Uq5A==
X-Gm-Message-State: APuU4Z+rqSqFj+WWuslg13P4YlE6DwltmgOMcgfqp4F0tx8cyhE+gf+o
	kBCjPXNJ7WKxMSHbxjjbqMkAXxptx6hL4u+/LlMiD0H1AnA2tInl7tmOcllGNP1EJhAxt49MmE0
	QAbzWwozKxDGDrXfzXtLStkTUbo3sdsGAJlFFu9+FroOTqKbl/D1+bZzR
X-Gm-Gg: AZFdTZeQc7FegPbGzyYmgM+JlyCep/t0V779ilhhYJ+rgBhkg7sb/7pFLRc/0ZWA+tL
	fs8rJgsJA5JNwuLaqUfiwsUHKx7hMeBMDGx19+xbu2PzZttH3RbqislcDmHdrbYfyek/yzR+qRc
	y+vkgNK6yReU0CjH0KHD5zl/fU1j8+tBqGx+JetvvSm22yGlXN+NQBEICDRo9aAPqdtUiHjX3df
	ipCSvTcORLLKwcxtQPpZxg+V7v5MyabZDJcwuHAtjhe9W9xMIuaF8Q2nubq0ZeqkzMJJbM75kIx
	nzz+u6+xy1LDumxXK3IEyaROC40ds4dQFDwiIPPsQDRxk7qJ3o501ORMRyLKnXiUuheiLwSmLoo
	TK29C0TFXYPmc7f9YUaNH3fOZaGHswMDbQ+n4nmfwhgSAscVjAleVg3jSZaQrinqKx+tmXw5s6/
	PjbDjeoE2lZUO5MP0v97vYjU8bkbzfVOT4vBxIT6BM6YC3gmSFq18=
X-Received: by 2002:a17:906:7f01:b0:c4d:2867:281c with SMTP id
 a640c23a62f3a-c513a89466dmr986155466b.1.1795542022434; Tue, 24 Nov 2026
 09:40:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-17-jthoughton@google.com> <sashiko-outbox-228645@kernel.org>
In-Reply-To: <sashiko-outbox-228645@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:39:45 -0500
X-Gm-Features: Aa3M54raiLEh1ZPrKo5WkzdnZfyJOdcj_tuB0KWZ_ie6g2cLD_DMBgOrKleBNf4
Message-ID: <CADrL8HWNAByKifcNgre_YAX3M+bwAW0BgMrfPmWHubOEs+AfDQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/19 DO-NOT-MERGE] arm64: Implement
 try_populate_vmemmap_pmd using AF trick
To: sashiko-reviews@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64/mm: over-broad TLB flush in try_populate_vmemmap_pmd()
> - [Low] arm64: direct AF=3D0 block-to-table transition in
>   try_populate_vmemmap_pmd()
> --
>
> commit 1319c4a7862ad5f3b810c4beca866ee98bd48fd7
> Author: James Houghton <jthoughton@google.com>
>
> arm64: Implement try_populate_vmemmap_pmd using AF trick
>
> This commit implements try_populate_vmemmap_pmd() on arm64 to replace
> in-use leaf vmemmap PMD block entries with table entries by clearing the
> access flag instead of using a break-before-make sequence when BBML3 is
> not supported.
>
> > diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/=
pgalloc.h
> > index 0263329fb7b30..7e304f01ce6d5 100644
> > --- a/arch/arm64/include/asm/pgalloc.h
> > +++ b/arch/arm64/include/asm/pgalloc.h
> > @@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pg=
table_t ptep)
> >  static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *=
pmdp,
> >                                          pte_t *pgtable)
> >  {
> > -     /* BBLM3 is required. Its presence has been checked. */
> > -     pmd_populate_kernel(&init_mm, pmdp, pgtable);
> > -     return 0;
> > +     const int max_attempts =3D 16;
> > +     int attempts =3D 0;
> > +     pmd_t old_pmd, new_pmd;
> > +
> > +     if (!system_supports_bbm_through_af())
> > +             return -EOPNOTSUPP;
> > +
> > +     if (system_supports_bbml3()) {
> > +             /*
> > +              * BBML3 allows block->table transitions if the PTEs unde=
rneath
> > +              * do not conflict with existing, potentially cached
> > +              * translations.
> > +              */
> > +             pmd_populate_kernel(&init_mm, pmdp, pgtable);
> > +             return 0;
> > +     }
> > +
> > +     new_pmd =3D __pmd(__phys_to_pmd_val(__pa(pgtable)) |
> > +                     PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
> > +
> > +     old_pmd =3D pmdp_get(pmdp);
> > +
> > +     do {
> > +             if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
> > +                     return -EINVAL;
> > +
> > +             if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
> > +                     return -EINVAL;
> > +
> > +             /* We should never get a contiguous PMD here. */
> > +             if (WARN_ON_ONCE(pmd_cont(old_pmd)))
> > +                     return -EINVAL;
> > +
> > +             if (pmd_young(old_pmd)) {
> > +                     /* __ptep_clear_young() returns the overwritten P=
TE */
> > +                     old_pmd =3D pte_pmd(pte_mkold(__ptep_clear_young(=
(pte_t *)pmdp)));
> > +
> > +                     flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> > +             }
>
> [Severity: Medium]
> Should this pass addr + PAGE_SIZE instead of addr + PMD_SIZE to
> flush_tlb_kernel_range()?
>
> Invalidating a single non-contiguous PMD block entry only needs one
> overlapping page-granular TLB invalidation, as in
> unmap_hotplug_pmd_range().  With a range of PMD_SIZE and stride of
> PAGE_SIZE, pages equals PTRS_PER_PTE (MAX_DVM_OPS), so
> __flush_tlb_range_limit_excess() returns true on CPUs without
> FEAT_TLBIRANGE and escalates the flush to flush_tlb_all().

Oh! I didn't know that!

I will change it to PAGE_SIZE instead of PMD_SIZE in v4. Neat!

>
> > +     /*
> > +      * Translations without AF cannot be cached, so we can replace
> > +      * them without BBM.
> > +      */
> > +     } while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), &pmd_val(old_pmd),
> > +                                   pmd_val(new_pmd)) &&
> > +              ++attempts < max_attempts);
>
> [Severity: Low]
> As reported by Catalin Marinas on v1 [1], this rests on an architecture
> detail the review could not confirm from the kernel source: can a CPU
> walk cache or TLB retain information from a valid leaf block PMD
> descriptor when AF=3D0, or is a TLB invalidation and break-before-make
> sequence still required before converting a valid AF=3D0 block descriptor
> into a table descriptor without BBML3?
>
> If it can, skipping flush_tlb_kernel_range() when pmd_young(old_pmd) is
> already false or directly overwriting the valid AF=3D0 block descriptor
> with new_pmd leaves stale walk-cache or TLB state active while a table
> entry is installed.
>
> [1] https://lore.kernel.org/r/aoSJcAFMNJ1nPl2H@arm.com

Yeah, this is why these final 5 patches are marked as DO-NOT-MERGE.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122184453.26=
68189-1-jthoughton@google.com?part=3D16
