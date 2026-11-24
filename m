Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538422;
	b=xjLrOs3DfNpfCLccScrs2DcEcVTZpkM8KIig4EHtqc1oyL5m4HPQR+a4EgyYl+B8x3eU
	 xL+MDSCeSahBDt7gr/JqlLXoTSx2xsW61Em3lLB8I5f3lC81Cgx90baHtEXOPYnZe+vrZ
	 GkVfMj/k6HJ8g72KiQIzw4oe1DNvx5CoV7/PCFSVWeyIUCgdlV3WUoFp2cfxyNdrgdZTU
	 KrUDh8qLIcwHdjvqDCWkI1B2Tc4igY57qtwsso3rVGamo5ODrV/GWL7W6ies/30Ks2ONC
	 UVp1/LXQgQKXbl4WpPgsTcPdaXFDqczpALZVg7MwjND5mlgFjRK2zxDJSVW4vKgSOkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=3wWnkq31yEF0IxUL8QXEbwU3zdf+25LYM4lO1Igg8kk=;
	b=k37glv1GTxDvTbCNjHc6vNVksmEvgTf2601lZigLKzRJ3k7ViExItWKrVc1V7iYyK58o
	 0DcIXqTQopRL5AbrdHILFALmF5j+oXjf6e1Wc3QbL2T1jzkajjFlpI4uiYO7kW2qyM/k0
	 3k6Ts+ChIIRiedRncPKVVOY5cX8aNuLEyhBT9616DIiMAGNXrAYHOHX63ESRjo+04DSmg
	 1zyCuqlNQqSAioYyAMjkT4BcYT0LNrZ7Spo8Bi5rD15h7CCdiQymb94P9GsHKvURggKtu
	 oupt1b5k4h7N6X9aXg+QTQolZAxRVPq2hdROwLr+lMjsjk6F7Qr/tkH47e3xwgbNwSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TREW8CXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B4606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TREW8CXR
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c51a02ad3acso58558666b.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:40:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538420; cv=none;
        d=google.com; s=arc-20260327;
        b=PTJurR9E2T9KDUIeri/M0pTsyv2MmpTnxtUXwGTap2pbr7v6+qPHLUv69caGGsEEeC
         d2Ro37vYnO0nCEPw6+p0gZZzvLk8J8dzWoQG94MpiluheAb6xhGoZO0dVGQTS8vYS7em
         Ac1mAV9dmOqFNzt3rJinRQR8ZJy8a3VDoTp5brf7elxdJx1QU9AIL4+KBG7WmYv2lUgu
         wzCZayJZnRzdt+CgOTbya9VThWU7lq4nKEZvXYQml+SeiBqE/kmGJx7ZTsS1ZfiGN5Uq
         M7Egg7cbo0Z7Q39Cz6RuCfOlri3AyQ81GB4FGIZY+ECoWSPf41L9vGZ4qTsWWBufVYfZ
         UZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wWnkq31yEF0IxUL8QXEbwU3zdf+25LYM4lO1Igg8kk=;
        fh=yG0GPR0QiT6n4FwClexevtHuIFSRQ+sxjflZXF2i7Wc=;
        b=OUi6pJ+rPvBHMO5GNNtDdCMh2iKtzlzC52jyUyDfBkTC8mJUkOR4vutZh2ceC4s6JU
         qYHa5aBJpi7zeGnaIaGWuV9Loy0rcGK0XuT4mJtwRUFVhQcSNfbIlCukfSiX1llcilH5
         /DFUZxE99YWVwcy5j4tGsnG/x+5eOSyhFAdRhU/nKj0p2cu8tXNEe52xIi1TgnUfAwuk
         6pMDrVo+GLkVrtLiIiveHApHmy3Z7tgV5MvQcdqK/Vs1t+7kSAzWlJakzTnC7Qp7C5nq
         2LECW+1UF4Aep3f1mJSbxSzQLzed1nGBBhqGSm25L660aI8xe3FBwAq12Bb6RgJcwnSA
         yxBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538420; x=1796143220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wWnkq31yEF0IxUL8QXEbwU3zdf+25LYM4lO1Igg8kk=;
        b=TREW8CXR0muPij8RgtwJIEVoKZ3/rpGIj1WgekCYk+8SA1nOso+puT35sXfwgrnd+6
         9hmSHW7TKXAzQ88QlcG/+zLWLMKoTTjczPJiVesPxgJlDY0+u11ePQ4AvUbdBiT7nTME
         36gMWCHDiTcHjRznu3F8lBHwCRY6s8M1Mxvr/BQ5IXZM8KX5nVytIXacwXpNX3KuuQBj
         EK7FBZ9f4dQyQhiYzhaTM+JczSW4WpoIzhiAiU/xXBx1q7oqO3zN0IXN1UlPKjGdGxw6
         injpdYgZJpBI5L+vqEmAOBzEPLDRFUI+OfFE5u/oErs1Gp6xe9HH57iYepED33TYEJTD
         Di8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538420; x=1796143220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wWnkq31yEF0IxUL8QXEbwU3zdf+25LYM4lO1Igg8kk=;
        b=NgqoiDUQ249FP4J6IqQ23hdQ9ufiQo7CbPFEMMe0DDmQ+oV+V1lHZaEbV8urVaplpj
         S3OxkRTe3+DMtNe1qnrcI3nsky7gJrJOnIQ8g/L4ytjaDQpshfeqNVaKr65xqLYFEe59
         arA42MdX4cUayB/9YeMaH7WQCwLKy4OhpLmQ2zOlCvdoN9nhLwXW6YTMyr2IQjLpyUze
         5ZCHy7RKwVS9HhubEWRUiraI1uljQuH5fDF6ueb0ZCJ4pIanQdS/PEiKKprGTlICQllv
         ykK+W39uZYb0Qen/y4FacHGO+fhxTAJenulgNbYmtCMgCzseHOdNE1nnqVtvwxNWRw+C
         N9Vw==
X-Gm-Message-State: APuU4Z/KHuMdRMfc67w7lnW7fxufSolhAE5JAUm/x1asHe568DlatRl1
	PAvt9mMP8JQao1xneOXF6vh3cyF5EwpJsoeKz24nN7VF+2LSaPMBT5vsdVJW5fiU2XJSDOg4QJE
	u9pUkgstLcs6heLOf9O1gCr32+V+0HgzfACHYw/Ez09OYg0nqjdpuiVC+2QY=
X-Gm-Gg: AZFdTZftVizHwE3smuhtXNOtsPXJIQ6jFnyUmyppqFhGG78WfJHq2ycNFd2EfeyuIcU
	keTwUteRUWn6l6/WvCho7x/g2yrBDtOdw/kA0XXrokVObCUo5tD6aLkNbb/6nELzjhN4I4QZyEC
	o0RHAO6cTIoVKYRh5ut6c1GCqpgTnZx2kq6HqTjZR3oyjQc6VTjfbWX5hHxpQ7r+WikyPVmdziX
	2lCx4GTUZ4x2iewHNnBCyDkDuyDi42q4V41ACglRhcwqeJISGU57mv6XPzemuvDXtHO1YGyb1Xe
	+DSjUiHPBBEU06RfTKf9mC36D8zQWru2PWdv4FZtQEqBOsiOkyGtI/RtWHjXCtXNQGTsel4rLp9
	zI5p5L1I1sgh+5TY2+wo0+Fng1HL62tYGffwelR1R6GoXziRPsbJ1VatHQzxua5LT3458TvpPv0
	oqTt5RsYUcI8uarLELWxAAIk2HI1JF0JUG/WnAX02snNgo6g+LY6s=
X-Received: by 2002:a17:906:7d91:b0:c49:a539:aa45 with SMTP id
 a640c23a62f3a-c513aad1ab4mr1075079466b.42.1795538420109; Tue, 24 Nov 2026
 08:40:20 -0800 (PST)
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
 <20261122184453.2668189-5-jthoughton@google.com> <sashiko-outbox-228633@kernel.org>
In-Reply-To: <sashiko-outbox-228633@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 11:39:41 -0500
X-Gm-Features: Aa3M54oepgUn4X8OBlBmCHpzq7qyxHfiRu28mAUeA1WpcH_3XcJmtKTuvSjLHXI
Message-ID: <CADrL8HVxnyNniotcEG+CMBAs4EVLihuU4bcqr5rLZWT9dUxNCw@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/hugetlb_vmemmap: missing TLB flush on partial
>   vmemmap_restore_pte() failure
> --
>
> commit 8b77f3aefb06415df030fdd341c5e065dabec71c
> Author: James Houghton <jthoughton@google.com>
>
> hugetlb_vmemmap: Use try_update_vmemmap_pte to update in-use PTEs
>
> This commit introduces try_update_vmemmap_pte() and uses it in place of
> set_pte_at() when remapping in-use vmemmap PTEs during hugetlb vmemmap
> optimization and restoration.
>
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 2e9cf8d39c892..b4d0311bcc4a2 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> [ ... ]
> > @@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, unsigne=
d long addr,
> >               return 0;
> >
> >       dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
> > -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> > +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL=
));
> > +     if (ret)
> > +             return ret;
> > +
> > +     list_del(&dst->lru);
> >
> >       return 0;
> >  }
>
> [Severity: Medium]
> Can a partial failure in vmemmap_restore_pte() skip the TLB flush for
> PTEs that were already remapped?
>
> Previously, __hugetlb_vmemmap_restore_folio() could only fail in
> alloc_vmemmap_page_list() before modifying any PTEs.  Now,
> try_update_vmemmap_pte() can fail after earlier vmemmap PTEs of the same
> folio have been remapped to new writable pages.
>
> When called from hugetlb_vmemmap_restore_folios(), VMEMMAP_DEFER_TLB_FLUS=
H
> causes vmemmap_remap_range() to defer the flush to its caller, which only
> flushes when at least one folio was fully restored:
>
> mm/hugetlb_vmemmap.c:hugetlb_vmemmap_restore_folios() {
>         ...
>                 if (folio_test_hugetlb_vmemmap_optimized(folio)) {
>                         ret =3D __hugetlb_vmemmap_restore_folio(h, folio,=
 flags);
>                         if (ret)
>                                 break;
>                         restored++;
>                 }
>         ...
>         if (restored)
>                 flush_tlb_all();
> }
>
> If the first optimized folio fails midway through vmemmap_restore_pte(),
> the loop breaks with restored =3D=3D 0 and skips flush_tlb_all(), leaving
> stale TLB entries pointing to the old shared tail page for the already
> remapped vmemmap PTEs when the partially restored folio is returned to
> the hugetlb pool.

Yes, this is accurate, thank you! For v4,
hugetlb_vmemmap_restore_folios() will flush when
__hugetlb_vmemmap_restore_folio() fails.
