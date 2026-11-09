Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263387;
	b=jaLkDiUbaykTumRQ5++HPsCiuOuBWONByN5pczuZkBVx0Dur3iOHtjim0IizBZITX37y
	 YRg/o3t23Icgy0KOTKiOTV7YHBe0bz6OSa5ovuC387FYk0R3tSy30ceLDwFqacLgliemh
	 H9fr5V9oSAKR4cyCZ2+2O5mYtyLiWvKNLclXkD3ZYkwwevQPz66EtTo0chxj00xSXKzDB
	 5M6fkh0rPB2RdMajf2NkUO9Ps3lYEt+P7HonSpsnl+Wk85I0ONv6cp0hzwkncbQ0NjGlq
	 W/8DI7Z5Y48kbFfQz2QiaqNv8mv9R1Xvipv3PRsUsh4aJuYWglsf4qwz8PoNL+8dtvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pNrIji48bDKvQSl+1sJXmSNeKsNXMjpGnN8Czk6A87k=;
	b=NZMi5OA94xJ/TIk/UduovK2USPioJadaqM7wJ4qH+m5sbzLO9JeUOjvWECf/qqmxRmGn
	 FXELGOcVVy7+Zed+YdDJP9q6n/z7Vddrkhsh4e4D69pCfdRj3iw80PmjakyydFDLJJUXg
	 6JWf/7pN1BU9bgrDJLT23SHDINUQJpqr+3ZPeD7B/rwzudSh3aPcCnZB3UzRt+3Ah7HRy
	 LHMxkn7X0lMLZzYRZUv0GYZY8cAd83QukF7WhT4nRmwWjX3wigDjSskMYsexcM4TGFgGw
	 8rend40dExb/qmnW0AIi6M3QDY2NFkVaFcDxADQIR41OaVezxL9cV4Gr6gG6HYltfOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMlNZCpU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D1606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 22:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMlNZCpU
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4910b863b84so892055f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 14:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263385; cv=none;
        d=google.com; s=arc-20260327;
        b=CzT9gvcWaEon9mgN3tprlfjEF5Rx1/QfOkiR+fG3UP7feyQ7jwrzCP7g6ggSmD7d3z
         P88Nl7Wi5sXtCbhEER/oGIq0jaI0/Rfbx9CqKgdAz+3xwVSXMIucyt6uYmmaHXPsKKJQ
         l/N8eIWnTlFotBNmWlMTUgPriQHpcxReeKX9WBDHhCGqGUL3Dea92qnfechcglnSjWdt
         c7/17RbAYPPOkCbuaejt2aftAu/uqnJ8v+0a27MUEDQGZga0jzmfSzAtW6xRpJfguzFx
         r99h3gzLZSLEjk9lgf2mAn3ifW4SRYz50PWVCauetRiQU1XPsh+xhJLH6ytQJTLRviT4
         orjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pNrIji48bDKvQSl+1sJXmSNeKsNXMjpGnN8Czk6A87k=;
        fh=57ntETqkzVNGTYOofHBcbIIolOLV28T5rW6LiQPOum8=;
        b=V1AJ+MHrk4BrU3lQS5Hisur5nFZAVAuTovK+yEVt0PEr+iT3TP7bWGDdgAHykHrSwE
         x4kxAk8jl/PysFOihm4iVh0pErkWspe1dreAQTulheVgCnDS3yFMb71rRkFx4cz0CAQQ
         t6d0Yn8l4cfnuvZlkReodDBHdrwU5P3vUTOVDfLM3Ej8nXO7E7NuHDUAMcuUxgw104H9
         ZfLmlrXV94+U6+n2WrzZaedF1pKLMS9k16npqH8NrsJn1hMXfoE6JlL+Ot1GsfB71VSK
         iNQVbIhoIFlIPTepCQxhMifb4BOA6dPxaT1Pwk08InskTyzEwHV0BnBPiPJra3Thw21/
         /yGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794263385; x=1794868185; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNrIji48bDKvQSl+1sJXmSNeKsNXMjpGnN8Czk6A87k=;
        b=LMlNZCpUGzUHogI+qplG4ferP584e+QMvV1jKyuPueL+4D9acrKJLhcrViHPRnmpz1
         ePFKi2FH5KwxLFfyj3OeYsl1qUSlzQcSfmrmzT3K+0E/UG6FGBfgpcTVzGxGmOYF10aL
         A9bTVIc9qqEUis8CwdZZPJvqbS485PAk4R6OGCUmiH68zjZ3t+q1Ghc58uWQP0drGQ0L
         2kYRozscONBMyHOhTfTElRsmkbunX0ZkiZd0vpLjJ9GxUOzVanayaNpVy3EI8eIvxBp0
         KkezhgqWaAVyto7PnHpeNHjn1c2Juhyj3a1OmynCLpt30Pqr6mG0Nikk1OGbdEKeq7/9
         e06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263385; x=1794868185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNrIji48bDKvQSl+1sJXmSNeKsNXMjpGnN8Czk6A87k=;
        b=lER2eEOtpeUtMhbjiQYLCq6D/YWeyYJgYBvaO6fE9CZMNjCglXcr22o609dLGLeLfx
         7xdziJTSohrDW5/BttiP93ZP/gZtswRUiqslDaEVvY2Jlqu6uoKfhhjNnEQr9eAXi9Zg
         9CLvgxwKtiRUK2CkQTS6KKt7fNeqnBnDDmssdGCM+YNZpohfEpqNi5z0iIjFtNPS8yQs
         0+Dru1b5o+iXDwPrkXKT3unQoJMAtPdeK5C8FihpKwV0SnzxlGCrNYuuvvCBCcTvjtCa
         aCL4zlyFBmwURXKO2a+fw5G15V2yYS0TGrf5leh9VJ7oA9V298z8I68YGQ8zRVMnm2/B
         7KWw==
X-Gm-Message-State: APuU4Z+6FzHDX90OC+uLo/PSVB0oTC+zeiQQLHekLkUzskWP0gEJBL1Y
	KbjuJJk0VY5cUo3j2FFva4eQH3iBYUl+3wl4BAtmsVSSNDAfM2BjMk7T4ilZbHwQBxIf13weUXJ
	iHam25BGriiqmLq5azZiCgW1dwQ8upLs=
X-Gm-Gg: AYBFou3HjRmxy27EBKxyFkoKJr1VvgDKgbiVRSPLeUUxOFDzmKHNxjigLFgQ1RbUPDy
	oghbfiJaq0sv45B9Fk7qYk9pDtK8mR3qIK5Oxrv9ofkyTOaobSg0G6k0LoKYQ2BR+UJyJyTFRzQ
	/7plOg2akFsvsrZ+DBFQmzEMf3boh0ke5+ufSyVVugvkuGqJz9cJc1l49KiXc1XbRZc3EoIuuo1
	NS73ITiqeHx4MrIse/Jv1f7p92Q+EyYRQhE55b3AnSDqWTbeMgWZ1y8Ec0vsDd7OVwXofgY661r
	19Eo3aGlK/Udv+wt83FRK6Vv8knPYvNZRjMA9rDInQEHqYlrww2UTGi+hA4Qx41nOKqRRLvP0z+
	ywQkyTUJ2zRFsE7N9MS8OhCioPE5Ct5rXRKdfCQvzzDwQ78dWZPng9PH3WGFzqNB8OJYTBwYrvb
	JFD/Vps8nUM0UJFFyE/D0=
X-Received: by 2002:a05:6000:2209:b0:491:c844:f265 with SMTP id
 ffacd0b85a97d-49837ae2cf4mr1357615f8f.16.1794263385034; Mon, 09 Nov 2026
 14:29:45 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103212004.1356327-1-joannelkoong@gmail.com>
 <20261103212004.1356327-5-joannelkoong@gmail.com> <sashiko-outbox-198104@kernel.org>
 <CAJnrk1auD1u1J0yQrXOeJrxvVsQfbxYf+nsMS-9qFQ0hfchG-w@mail.gmail.com>
 <aux4FcaEdTrJ60NR@thinkstation> <CAJnrk1Za6=B=Y3HOaJjhU7orq_P27QFe92_n9F2y2+108xDSOA@mail.gmail.com>
In-Reply-To: <CAJnrk1Za6=B=Y3HOaJjhU7orq_P27QFe92_n9F2y2+108xDSOA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 9 Nov 2026 14:29:33 -0800
X-Gm-Features: AclHuK_RpE8DNp1HR1kdZtoTcCFOd1Bzv7uaSu11gSX2PJIKNAZGbFUvO2KeEEg
Message-ID: <CAJnrk1YTX=kmDY1zwLncOpzTYsJ9UEa1h1PW9egV59hpnpO=WQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mm: add anonymous mTHP folios to the deferred
 split list
To: Kiryl Shutsemau <kas@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, baohua@kernel.org, usama.arif@linux.dev, 
	hannes@cmpxchg.org, alex@ghiti.fr, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	willy@infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Thu, Nov 5, 2026 at 4:37=E2=80=AFAM Kiryl Shutsemau <kas@kernel.org> w=
rote:
> >
> > On Wed, Nov 04, 2026 at 03:50:58PM -0800, Joanne Koong wrote:
> > > On Wed, Nov 4, 2026 at 1:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote=
:
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
> > > > - [High] mm: try_to_migrate_one() triggers deferred_split_folio() o=
n underused mTHP
> > > > --
> > >
> > > Hi Sashiko,
> > >
> > > I'll try to address these points below.
> > >
> > > >
> > > > commit 82b7b7063b986d802fe52e75e17211e58f3f420c
> > > > Author: Joanne Koong <joannelkoong@gmail.com>
> > > >
> > > > mm: add anonymous mTHP folios to the deferred split list
> > > >
> > > > This commit queues newly mapped anonymous mTHP folios of at least 2=
M onto the
> > > > deferred split list in map_anon_folio_pte_nopf() so that underused =
mTHP folios
> > > > can be split by the deferred split shrinker under memory pressure.
> > > >
> > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > index 0c9ed04528d88..44376321180b5 100644
> > > > > --- a/mm/memory.c
> > > > > +++ b/mm/memory.c
> > > > > @@ -5477,6 +5477,8 @@ void map_anon_folio_pte_nopf(struct folio *=
folio, pte_t *pte,
> > > > >       folio_add_lru_vma(folio, vma);
> > > > >       set_ptes(vma->vm_mm, addr, pte, entry, nr_pages);
> > > > >       update_mmu_cache_range(NULL, vma, addr, pte, nr_pages);
> > > > > +     if (folio_test_large(folio))
> > > > > +             deferred_split_folio(folio, false);
> > > > >  }
> > > >
> > > > [Severity: High]
> > > > When deferred_split_scan() splits an underused PTE-mapped mTHP foli=
o queued
> > > > here with PG_partially_mapped left clear, doesn't unmap_folio() tri=
gger a
> > > > false-positive deferred_split_folio(folio, true) transition during =
the split?
> > >
> > > Yes, but I don't think this is specific to this series. Splitting any
> > > PTE-mapped anon large folio that isn't already marked partially mappe=
d
> > > goes through the try_to_migrate_one() -> folio_remove_rmap_pte() path
> > > you describe below, where __folio_remove_rmap() requeues it as
> > > partially mapped mid-split. That already happens today (eg underused
> > > splits of PMD THPs whose PMD has been split). This series makes it
> > > more frequent since underused mTHP splits now take that path too, but
> > > this issue is pre-existing.
> >
> > I think it is a bit of understatement.
> >
> > For mTHP it is every underused split: the folio is always PTE-mapped an=
d
> > try_to_migrate_one() drops one PTE at a time. Each underused split bump=
s
> > split_deferred for that size next to the new split_underused, and a spl=
it
> > that fails at folio_ref_freeze() leaves a fully mapped folio flagged
> > partially mapped on the queue, which the next scan splits without
> > calling thp_underused().
> >
> > Can the fix go in before this series? I think it is hard requirement.
> > Let's not brush if off as pre-existing.
> >
>
> Sounds good, I am looking into this and will submit a fix separately.

This is the link to the submitted fix:
https://lore.kernel.org/linux-mm/20261109220958.2071687-1-joannelkoong@gmai=
l.com/

I'll wait to submit v5 of this series until I've received feedback on that =
fix.

Thanks,
Joanne
