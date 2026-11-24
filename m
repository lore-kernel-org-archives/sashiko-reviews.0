Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538280;
	b=aFxpCJC1kOr6BI4Xk9Gz9LzLjLYGVmynqLRbTr/qB91bK3P04XNGWjeYf4tNcT1Cd+RU
	 NcTHYABvLztdafxGfdtBIEtle1bvaDjLX8Zj+cXSVtbiY/HG7K4By2Rx8lIj08SxRcsDm
	 wDgDy976VHd7jCSzlTn9J5vHivjS293y4TP2v0p7HmglAj0CHkI3sd6cL+Pf2CA1o6h1C
	 JZ+C3msSZM4p/c8nPAeNK6uSbaHem42I+wexXwtHp0ctCz4uJXJIPGKTP4ioLXM1lnf+j
	 ogdHVjscGeu+cZLtSKRnspoU9tiDOZ+aKfWnJOCD5DUEDqa2Pku4BHsTUaZy1mwjhxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3lrjCyd3ylni+VlZA6CzA7gna3TSOAbXroD0aGLUJ3s=;
	b=g8LV5T5ejkzHoQMqAj0bmQG9Ordrnf60F3OfeWe0vH4ElHOVU/xKZT3LYLY5w+sIzN4V
	 3l0ucD3gaDUYPOCG3XSp3O+NmqMRqwu25uIj8ohNNCLcospj8by/0nfQCX6N8/RyNbhWc
	 gKzpoL+IQJ7BZIR3+x95yVi8LjZUKP9NIYPHzcUsxp7opcsU9tNtBx2vAsD6hQFVDXmKo
	 sWs3hb46ykW5LBlxhLD1IcHdps+YQepP00SGOWmwrY6V2HnhTDbxCdcFiu4A06KPmGzK2
	 SuSp/vOwbFAHtTvOI0vZib+Xqp8qk3iRh+NWL1CB0b+Nf4g8u0bxZ/mkUriYFGcLehA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="P0Lc/2Ae";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B02606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0Lc/2Ae
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d21051042so767737266b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538278; cv=none;
        d=google.com; s=arc-20260327;
        b=sJf6vWSuLy6gM/wp8rFugoQvuVQQWceIp6wxRWDYrZgtFOGaMuMRYD+tpvM14u7DWI
         WrvhU/LtK9WqQqPheYjURPPS1u+rswbGjIaoWpSTCXNcF8gC/FlWHU9zBaeoQL8buPFp
         /t96Ms5aMXcU50izPGICRDHn8TeJ4+PwE61A7gRuTInahgHxI1NT5COyWHBmAQwfQ1oN
         tOAgiP1Xpk6PrE+rzvxnU1nQlMzdWn1I/gMwtBXLvRGkoVb59PQjZiU1q0+QEqO6S0cy
         2SIlH5Ha74IwfKExNghbhYeq/myEA3s959vKWEB4n6zmcxFnyt72GROkBzLOZwARXZoE
         WpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lrjCyd3ylni+VlZA6CzA7gna3TSOAbXroD0aGLUJ3s=;
        fh=yG0GPR0QiT6n4FwClexevtHuIFSRQ+sxjflZXF2i7Wc=;
        b=Mb+HlGhmJXcGfnx4yk6jz8Lkm1bIIQoaJ0PP3V5f/WAYe7nxrTx/JWJhV79eZbXjxW
         X1NFiaEitPtmW+GPsTF1nqYbI3iRhl1ihEr+gbmq3IHJVIsn12LzVw8jUMUBJITbP4J4
         Zn3lg6T53By+6EUoMRapncIcADcIDSJbW7iUKtJMKRnIZZgzDPIyO9bYdIBgORFjY5of
         Q7MDgUjbdWo0p0I+820qWkTi7WLpj83DYRJ+uJIjEG9IaI/jRZYgJG+23PymCXQ8pUTz
         S/JVHRSbO8m+wZP8nRB/YGNrFDvA0sYZ+6KSKS7yZTJLAjJpKnCK7O6ccRgO+PFLQocZ
         C4Iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538278; x=1796143078; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lrjCyd3ylni+VlZA6CzA7gna3TSOAbXroD0aGLUJ3s=;
        b=P0Lc/2AeybOEkDCG1nXoLwiknY4hnRHHMN4Jfo3PGs5AfKeVAD2sl0NQ7UofQKZL3f
         izMDg0GJBnqEOwxEBGGBjPHI3PROQYKMn+22mOnqr5d2ZwcXOkvebhj2cNj7uIxZUZyk
         lfOpYqHJpjZ6VK06kIoseRr2CMGfRYzyfXzw1hvNYdw4HF7nJFsLQJ0ubcHhYFC7zJqz
         12lMrx3OPJO2PgpI4P6T0DuyegA1ZcMFvIuqwoms7wIdZHFKBSMeMDkGYjxZiXU7vbbF
         j4SFDgNvXF2MaG5iWpcxOGJSFDyG36IcOtJ8rc391uPssHglCT6OgAYEvZGE++Y80IB1
         qbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538278; x=1796143078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lrjCyd3ylni+VlZA6CzA7gna3TSOAbXroD0aGLUJ3s=;
        b=SBrQknE3i4yfQkWFcA2Jjww1YAfCHY19eVM2N0aERhTCtOiM+kA0WwtuCqgxwgzNpo
         UBNCSvx3Sk2uFYQlfP1KcsIgKBnBCfKi//fqi7FDAsn1iMjWfSzx8GNGEHUG8uoATS0L
         CZq3+poWhGeOsaDxuwmcCuHAqSi7lcZj7A3Q8R8c6LMPckTcMvMkayL/Z4o31xOLo/DB
         k07fOrVbrjaG4GBDveknjWFvU0S3dILWCxGL2elWj/4YbSvSt9aBUAqygKbsiz8pOw9x
         mLbGJFA9/qxoHKXcv0Wn4IEw82f1dQ50vy99NVwEvokI8CSSse5YwIrTTxYYbhVM29Yv
         6Veg==
X-Gm-Message-State: APuU4Z+VJUhTEp2+Ir9BfJ5RFqfj8dccJDm0on4nTzrKlt3mTnApKyDh
	TYwRzoPQX5JzBv9LB1fv64tkfSxzcxXIR+VOafRSYOhj/jIoU+Zh9hDKCzaczQAihmz0KpwsDYr
	HKcQEuz3JGzl54Esjg4PY2euREZycjxBBvbCk7PjnN0RYVKZne4uIsQ3l
X-Gm-Gg: AZFdTZeAiEHuNCrbGLzZQ6r+4NetImou06lIGHri60MQ/LljqvogELUSJarHH60ZumC
	UEwKnts24Ma0+I6EnKwXzhyoPSFgj4nS+KuRhdfbPGqWGj02AdTuW5Qfszi6gEdgqdeWKaF8G73
	6SI1dFdY/S52GNBEDzhhbx29WuToarTxo8L5WgyYG6iKel5XcUgCxgkrj8+xOq89cPqGZ7zqSXA
	HnxB/vJeaAL1dPoSTKQMmIl9cCP2bqjSNP5TiU4SWcqPeIxuxWOR8gjKbf1Wc65jnwvJSa0Jpn/
	OwonFIoSKvknTJR+sFA5qfaKTEJjrqhnK3ImTIaZyUpmM674URdBaG17Lf4F7LKTbxTiD3gBmW8
	E6KTO6qqMvOv8lmnL5luRRK41DxV2vp/j6NHh5cjelGvodE7MsAePq8uaOBA8GPT4rdLVpD6tjG
	Hy7iosDumZBIGPtUzIFRJ8a7MagWifuiU27saD/Sv9an07cQRbFX0=
X-Received: by 2002:a17:906:da0e:b0:c50:5186:6dc2 with SMTP id
 a640c23a62f3a-c513a84a4b7mr889148966b.24.1795538277335; Tue, 24 Nov 2026
 08:37:57 -0800 (PST)
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
 <20261122184453.2668189-3-jthoughton@google.com> <sashiko-outbox-228631@kernel.org>
In-Reply-To: <sashiko-outbox-228631@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 11:37:20 -0500
X-Gm-Features: Aa3M54perRENbQqBcvqMB0T0l__zpVfhY9WhyMOK84YMmPr-DpW-cRt3dY1naHw
Message-ID: <CADrL8HV0artLopXqsRyEfxRd5FrAKKXnSotwrTYV+7Wcd=D9mg@mail.gmail.com>
Subject: Re: [PATCH v3 02/19] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
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
> - [Medium] mm/hugetlb_vmemmap: unnecessary TLB flush in
>   vmemmap_remap_range() on error
> - [Medium] mm/hugetlb_vmemmap: partial HVO state retained in
>   vmemmap_remap_range()
> --
>
> commit ec5d75eb023f87eb7c8518a7fd62d721c52bb9db
> Author: James Houghton <jthoughton@google.com>
>
> hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
>
> This commit removes the early return on error in vmemmap_remap_range() so
> that flush_tlb_kernel_range() still runs when walk_kernel_page_table_rang=
e_lockless()
> returns a non-zero error code.
>
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 09b9fd83c1985..7be08c68c2f18 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long star=
t, unsigned long end,
> >
> >       ret =3D walk_kernel_page_table_range_lockless(start, end, &vmemma=
p_remap_ops,
> >                                                   NULL, walk);
> > -     if (ret)
> > -             return ret;
> >
> >       if (walk->remap_pte && !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
> >               flush_tlb_kernel_range(start, end);
> >
> > -     return 0;
> > +     return ret;
> >  }
>
> [Severity: Medium]
> Does this issue an unnecessary broadcast TLB flush across [start, end)
> when walk_kernel_page_table_range_lockless() fails with walk->nr_walked =
=3D=3D 0?
>
> With memory_hotplug.memmap_on_memory enabled, every runtime single-folio
> allocation via alloc_fresh_hugetlb_folio() -> hugetlb_vmemmap_optimize_fo=
lio()
> hits PageVmemmapSelfHosted() in vmemmap_pmd_entry() and returns -ENOTSUPP
> on the first PMD with walk.nr_walked =3D=3D 0, triggering a full
> flush_tlb_kernel_range(start, end) despite modifying no PTEs.  When a wal=
k
> fails partway through with walk->nr_walked > 0, this also flushes the ful=
l
> [start, end) range rather than [start, start + walk->nr_walked * PAGE_SIZ=
E),
> and vmemmap_optimize_folio() immediately flushes that prefix a second tim=
e
> via vmemmap_restore_range().
>
> Should the flush be gated on walk->nr_walked > 0 and bounded to
> start + walk->nr_walked * PAGE_SIZE?

Yes, I will do this in v4. Thanks!

>
> [Severity: Medium]
> As reported by Muchun Song on v2 [1], does this change and the follow-up
> patches in the series still retain partially optimized vmemmap states
> instead of preserving all-or-nothing HVO semantics?

Yes, this is intended.
