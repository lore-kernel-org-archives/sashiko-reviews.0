Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624567;
	b=ZTmeBTQ4whVDjBh5mqZz0f3HEJqazLwUo48RUBryTt2Q6c6EDaQNpMdN5GC7LdN89emU
	 giqyUhwUZDJE/qxLmrQZpPdAgVZ3S4PySR8fEknYO38vOjYR9FJqIdrGVBFviYaMMJO4r
	 F8zOKsYT7MCFvN272nTHccA6idUv4AQ055I2l+GpDeMk6EN6oFW9xXvzRndWhIoitmNao
	 eacidCno5JkwFEUqAJ67USm6xvlZ9VyMLTg7nESMTnYi1QEWmWYJzRe58bkwwYeY6WZa6
	 vW0Jz7RMNZhLJSbooER6YvQv/4mrvkRVq7PXJe/2p5NAFxDy73V+BNFA2XaPkq99rtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uhIE02AGyFlDGJY9YH7/2qCR3QQs0Kiq9oYiZ1U/+5o=;
	b=Ocf6sDINR+zybdN8hwC7JWBvD2n3AO/ALgamyGHbT3OHBPxSU7PeKsc3Z3E/NDbrlM0a
	 YXp5hP7tKtNNHi1JPvXy0qVLx4WkAufmw6dRNOQuNeuJPJxmz4pBVgg/HBt1Z6+FDaM53
	 t6rTyYZTMEC5fPfB11+rXYadVgTn3zIwGXCak1SUEzNziRjYG8iStWiiNrERkpmuyP/m4
	 dxEAN1M5fV+KED85klY+BkCJI5kZ55fVc2ispS4CBF+eXCehGRWm1kVjHzQdBTVmOBs0I
	 AICHr6YLXCycRwPwGOYQTNXX8R1G8vMk60RxQDqmbLV/d1b1b3MrHvLFA3tIiADo/Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DbjHeece;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63685606A336
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 16:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63685606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DbjHeece
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1002297366b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 08:36:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624566; cv=none;
        d=google.com; s=arc-20260327;
        b=aarPlRc+2p50qTfvts1yNnuaGjATvSY+nlNz5PU2+ggzWJn6ETC1stlIRQzgEyGudM
         dPAUieCHdNRqUbByhq+k4CSLb45AOpUgzahUfo3e+Vg0FrLf/Hg22PGcbQJnmh6opATz
         w43R/9IsrwZZ1BwO2g9Wv+KbBC/FKLNjVm9hwyPRoZB61aSp/LB9K7JvC+5QwhpRRi9n
         yb7vCleOoJ/TyWYbZayh8DCzbBi6DbUVkTQ1usvA3KrWTG2ia3A3pARJEKBCwaYmWKe+
         ErAiaEu0M99VWYR0FHOZ0YoBlkGHh2GsOseLli2ZhCBTn8w1lzJzGDZ9JIWfXgk55Enf
         133w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhIE02AGyFlDGJY9YH7/2qCR3QQs0Kiq9oYiZ1U/+5o=;
        fh=yyWxi04RUo9+5b08HavMWN4XnnIHFhnk8gDcQpgpkr8=;
        b=jfrzxxhWQSTLlm6kpzzqG0T0xGm98zXjdZ0heACVzzuXlc2fEVMLSk6lIkWPyMWox3
         YW7HJAkRBwoGjfeqU6g3LsZpoajd48P+I1PfjsUnW1QtF/0uFpMMXQRe5KD9B8Yt+plq
         1LIrzbwwdkZbe/Jww5Z735b0udRTx6tTPoG6xMct3Lg7WZyWZd5u05pRBsR45eNmPBYm
         HFM7bnTRTnXSTX4CKmzETCSgI2XSI72wpLV5u0pOjovCfij89dSryyo9c+FppW92bpNk
         M586YNE6eKtkaFcVPbk9kjZiNBlDeaGSwb/eyHMRwxhURp8KRC9LpxeWwCUgApLQeHHL
         Z/+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795624566; x=1796229366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uhIE02AGyFlDGJY9YH7/2qCR3QQs0Kiq9oYiZ1U/+5o=;
        b=DbjHeecex7WM2aYf3CGcuSD/R1A9lKfYH5ELKvag1N9m3Jdw8ZnGnTt41r0DCex+XT
         TMgLWDxH07my6OfkHSgBCmFod5JN4ZpXGixvZSLz2cYM60uchp4JkjpnFNQRgTOVfYHP
         fbCgUSLKbCJNOFr1vKcM7S4YBvt97LNUecWrqy1KBrmY38BnDOdq3eqPYsxcxqq0n2bS
         /OMZe4jMvcJt2BzNg7UZXyALXbm1/fp+JZw4mbsqzRZHE/MgikCs1HWmDAfoiM5FXKIB
         cSR1VMO45pwfbdXzmyu/jaZePwvwZcRjh7WqrSgNmKN5senUWxpfMGPxmjIA5yh+ct4R
         CtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624566; x=1796229366;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhIE02AGyFlDGJY9YH7/2qCR3QQs0Kiq9oYiZ1U/+5o=;
        b=aLVB44nPnTI7b/j8Ss1G4+4vsoEMEFQhHQz+vAcuN3wV0FfvSi7zV5/ImwLrQlZcUE
         q+Stn7ObMx8F9vxMtdYWoN20mV9UsQiRan5lqPBgX5hTe+stdbkmn5e90s3k9gIIQfzO
         9xQEa7mW8UCjejDyYC+E7mqYdOlOFh/ywhEuBvQHIFJ94hF2BO/kojSRTWj+aVPdTbrN
         tTEliRitGWxKhDU+wbJIb8I2rCwvdC4DnDy5OHRavs+VzjowE8on32PRXoCnQ1M6X0Fd
         hiThQWLB9sISmoAA9USjdRDQho5cOPq1FQzPbXpRLzLiMx6QYhCt3Lk7eTD+kjDWsvj6
         u+nw==
X-Gm-Message-State: APuU4Z97AGhaOa9fMYNei8w5rSYVP1tPj2C09tMbFcTMfkjqwnyEHKMk
	808q3sX4Q/rd6D+usbzfMX7ObTCkSQ0eGU6kMQHn+B0zTFlHZ5ecKgiqPA9+eNkthR5PwhzE5mC
	RDcGHUDArj5ZexjthxcvVc+JFGVzdKLpR4HTLLjFWRT+u4vjA9MBLLSV4W/M=
X-Gm-Gg: AZFdTZen4RQ1msnbg1IRO4dQ5CptKlYoU3SF9Kk3kbHKDgWxMkNke8rKCJuBaJPyMnE
	Qv20C1w8oNIzGdnYcu02uvVaIILXILb0ZFYSMEKOe+0BgNZ8DTMezF08GMN7RQlaDjxk6fS6wW+
	/xu9FPU1WQ4G44GE5SBRBahwiECJMvBi+8ahHkxsNAibjUfJY9LBcRjPZbqDKS51PbiD1IVC5uZ
	dYJrIkeo9wfVkmY6Ckpbp8cX49CL1AJkwyjhMjbautZb9+tBj59yU8/CAZ/XXp5oi/ikcX85LI/
	zLr8bMXHdsC4ePvhO3nNlekSv1stOMuasibQwOmx6a854qZAVCgyY22gX6Qfh4tvSo7oI3VxT+Q
	ZRe6gqg+k1BtZKYcLfke+iz9kYEksbr+Pg7mHJOPXa+SR/F+yXft14/cn54edEi9qNDmHKULsaQ
	PNH/P2Wbp2Gzru3PntcRYOO+HmF9aGMyVca7poT15R844G/xMQ+Ks=
X-Received: by 2002:a17:906:a408:b0:c49:901c:d9f with SMTP id
 a640c23a62f3a-c513aaff7dfmr1242424166b.49.1795624565163; Wed, 25 Nov 2026
 08:36:05 -0800 (PST)
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
 <CADrL8HWNAByKifcNgre_YAX3M+bwAW0BgMrfPmWHubOEs+AfDQ@mail.gmail.com> <5028917F-EFF3-488C-903E-9E19E5DDA3D1@linux.dev>
In-Reply-To: <5028917F-EFF3-488C-903E-9E19E5DDA3D1@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Nov 2026 11:35:27 -0500
X-Gm-Features: Aa3M54rufHLyzy98JyZmpwMFKUD2VIgSM3pNxMhAoaY6IhoB1clLOE7jnDE3xSw
Message-ID: <CADrL8HXtwnZ4P7E4OhMKs03b2zgzfxnmAHMw4mknjivAk+FVKQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/19 DO-NOT-MERGE] arm64: Implement
 try_populate_vmemmap_pmd using AF trick
To: Muchun Song <muchun.song@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:32=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 25, 2026, at 01:39, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote=
:
> >>
> >> Thank you for your contribution! Sashiko AI review found 2 potential
> >> issues to consider:
> >> - [Medium] arm64/mm: over-broad TLB flush in try_populate_vmemmap_pmd(=
)
> >> - [Low] arm64: direct AF=3D0 block-to-table transition in
> >>  try_populate_vmemmap_pmd()
> >> --
> >>
> >> commit 1319c4a7862ad5f3b810c4beca866ee98bd48fd7
> >> Author: James Houghton <jthoughton@google.com>
> >>
> >> arm64: Implement try_populate_vmemmap_pmd using AF trick
> >>
> >> This commit implements try_populate_vmemmap_pmd() on arm64 to replace
> >> in-use leaf vmemmap PMD block entries with table entries by clearing t=
he
> >> access flag instead of using a break-before-make sequence when BBML3 i=
s
> >> not supported.
> >>
> >>> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/as=
m/pgalloc.h
> >>> index 0263329fb7b30..7e304f01ce6d5 100644
> >>> --- a/arch/arm64/include/asm/pgalloc.h
> >>> +++ b/arch/arm64/include/asm/pgalloc.h
> >>> @@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, =
pgtable_t ptep)
> >>> static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t =
*pmdp,
> >>>                                         pte_t *pgtable)
> >>> {
> >>> -     /* BBLM3 is required. Its presence has been checked. */
> >>> -     pmd_populate_kernel(&init_mm, pmdp, pgtable);
> >>> -     return 0;
> >>> +     const int max_attempts =3D 16;
> >>> +     int attempts =3D 0;
> >>> +     pmd_t old_pmd, new_pmd;
> >>> +
> >>> +     if (!system_supports_bbm_through_af())
> >>> +             return -EOPNOTSUPP;
> >>> +
> >>> +     if (system_supports_bbml3()) {
> >>> +             /*
> >>> +              * BBML3 allows block->table transitions if the PTEs un=
derneath
> >>> +              * do not conflict with existing, potentially cached
> >>> +              * translations.
> >>> +              */
> >>> +             pmd_populate_kernel(&init_mm, pmdp, pgtable);
> >>> +             return 0;
> >>> +     }
> >>> +
> >>> +     new_pmd =3D __pmd(__phys_to_pmd_val(__pa(pgtable)) |
> >>> +                     PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
> >>> +
> >>> +     old_pmd =3D pmdp_get(pmdp);
> >>> +
> >>> +     do {
> >>> +             if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
> >>> +                     return -EINVAL;
> >>> +
> >>> +             if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
> >>> +                     return -EINVAL;
> >>> +
> >>> +             /* We should never get a contiguous PMD here. */
> >>> +             if (WARN_ON_ONCE(pmd_cont(old_pmd)))
> >>> +                     return -EINVAL;
> >>> +
> >>> +             if (pmd_young(old_pmd)) {
> >>> +                     /* __ptep_clear_young() returns the overwritten=
 PTE */
> >>> +                     old_pmd =3D pte_pmd(pte_mkold(__ptep_clear_youn=
g((pte_t *)pmdp)));
> >>> +
> >>> +                     flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> >>> +             }
> >>
> >> [Severity: Medium]
> >> Should this pass addr + PAGE_SIZE instead of addr + PMD_SIZE to
> >> flush_tlb_kernel_range()?
> >>
> >> Invalidating a single non-contiguous PMD block entry only needs one
> >> overlapping page-granular TLB invalidation, as in
> >> unmap_hotplug_pmd_range().  With a range of PMD_SIZE and stride of
> >> PAGE_SIZE, pages equals PTRS_PER_PTE (MAX_DVM_OPS), so
> >> __flush_tlb_range_limit_excess() returns true on CPUs without
> >> FEAT_TLBIRANGE and escalates the flush to flush_tlb_all().
> >
> > Oh! I didn't know that!
> >
> > I will change it to PAGE_SIZE instead of PMD_SIZE in v4. Neat!
> >
> >>
> >>> +     /*
> >>> +      * Translations without AF cannot be cached, so we can replace
> >>> +      * them without BBM.
> >>> +      */
> >>> +     } while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), &pmd_val(old_pmd=
),
> >>> +                                   pmd_val(new_pmd)) &&
> >>> +              ++attempts < max_attempts);
> >>
> >> [Severity: Low]
> >> As reported by Catalin Marinas on v1 [1], this rests on an architectur=
e
> >> detail the review could not confirm from the kernel source: can a CPU
> >> walk cache or TLB retain information from a valid leaf block PMD
> >> descriptor when AF=3D0, or is a TLB invalidation and break-before-make
> >> sequence still required before converting a valid AF=3D0 block descrip=
tor
> >> into a table descriptor without BBML3?
> >>
> >> If it can, skipping flush_tlb_kernel_range() when pmd_young(old_pmd) i=
s
> >> already false or directly overwriting the valid AF=3D0 block descripto=
r
> >> with new_pmd leaves stale walk-cache or TLB state active while a table
> >> entry is installed.
> >>
> >> [1] https://lore.kernel.org/r/aoSJcAFMNJ1nPl2H@arm.com
> >
> > Yeah, this is why these final 5 patches are marked as DO-NOT-MERGE.
>
> If we aren't sure about the hardware behavior here, why don't we just dro=
p
> these patches? Once the initial support of HVO for arm64 is merged into t=
he
> community, we can bring up this uncertain part for discussion. Wouldn't t=
hat
> be simpler for this series?

I'm including them for three reasons:
1. I want HVO to be supported on as many systems as possible. At
Google, we have systems that we want to enable HVO for that do not
have BBML3.
2. I want to provide the Linux code to potentially facilitate memory
model discussions regarding the AF trick.
3. My interpretation of the Arm ARM is that the AF trick can be used
like this, so that the final 5 patches are in fact correct.

The series can always be partially applied.

I am happy to drop these if they really ought to be sent separately or
if they are genuinely incorrect. I hope some of the arm64 experts can
chime in. :)
