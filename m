Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296152;
	b=irz4SAcHvwZxI3ayi8iJj9OcktKHoCeyoz1vhvaNNTCjUjMrTGn7q7TA10IbwspGF/Kz
	 p6rtEXqSO9lIc3ETewNIM2OPv1DNVIZLE/FpqUO8XjM48SrP4DLbVk6+jspuYBqt3k337
	 KDg4upVjSvVFXyYDhi+k17QIJKc+70gd7+o2V95P4pc2LPkZN/XFQpopsoYKBgwwbuFzt
	 KEtLOeShRRPacTg9xyZEFA7W55jxUj3fmU/aMaOZ8rhT7/oL7QxByUF28sk3bGUQde2SB
	 8lIfkT3cUu1PGLW7YQcCp96+NNtgtg4l5wsh9g1jpp07aBnwKBuQtCKi5LyXaW+GB2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rGcrw4mT7NdiqFu7SkETRkItggb0uYK1nbamCet3nRg=;
	b=3MlAUidrsQSWEIopuiuQGskgQyaqT7fLSIRjCEg4NOhA6NP4TA3PElApKt+//PMYmnvR
	 1ubTERiTD0vVD6du4KoPzb5y4vDlVibLl3rVRqDUcK+jiJrLzkv8HiLEiB0EUDLYP64mx
	 f+Eo6KV8SjN4/qEZIkRp9gZXZR+tDn5zB7BxYKE5d6dT0iU7E/n4by9Jmoh7IFWpkmsvR
	 nrrAdmYLdt6uR+zPkI52llkFcv6KPq18uS8X+DYRh4MnQXUU7/cTEjxKI2rRCvxNYsp4F
	 M57k9D3/o+icdOZ4fK+d9DaTrIb0NKF3stQiM1NKcluP93uLz3CbIfU6mnBdOFjW/6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+zpZlQg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE2606A32A
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 21:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+zpZlQg
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so16310611fa.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 13:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795296150; cv=none;
        d=google.com; s=arc-20260327;
        b=gUG/taWLX0wxQec3wFXfl2vkXpFaUDcFKnXWtIi9dycy+fZDm2wegS3DyXREQEMgPN
         sb6DwkPbS3FestylRJ7xwXtp4kbbEsRlrRCFJOlrhnqaUb0cB5UgYAJZC5NwyzmzaWAD
         vzQGlm528pHPb46CWbM0xUvC84H3suYlXUjl+sWuzCgNTpgFhqTM9XuYKNkePL0iXfgd
         hXqAsczVsP0HpQ8taSMIFHf7aNzKvmMHaZyE4af+9zmwlntoBPtTDyJTl50MEY1UCbj9
         YcnTekB0HQfO0H96jch/AZmgIDHSN1WsoP3gmsrtCwC6tG8aXLx9gkTb88B8yPWtw9az
         oTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGcrw4mT7NdiqFu7SkETRkItggb0uYK1nbamCet3nRg=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=UjOxntIDk4zEPHwS4qSsPhbJ78HhPs8vV9OdaPQIMcFTNTnteV4qK2BVsC8oOTgVmV
         C68ltg9HvCgpPKEJPGRelD1c2pHHPRkzMl3gk0s6DuFr/bS7yYwzEUeaM+OffVW24ATL
         /tht5o/MXa5Klh8nQkIZvRbECAk1Vhy18U1/ylpRdY2jzjnEneYb8IuEyorI9JoPMPRo
         XlhVWXV9P3LoHaRB3PDSpBiMFo2inS509d41siTQNyVmEdmxReIOg6/vm5lMBN8ZMCoX
         amd2L/dStkUdVb3JxiCibeXLhcRt4omTVCjlvRWkzhzHpSJ66MPreNdUqZMeeRnvw8nD
         Xa8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296150; x=1795900950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGcrw4mT7NdiqFu7SkETRkItggb0uYK1nbamCet3nRg=;
        b=A+zpZlQgk8P0Z1OmcfSkUhGwJ0MyuXCHbHz9vGwgPzk1Zzc8P++cXZYFvb2MK5JQFI
         1DqtwLt01tTNGJEkSgOqGavzgkGbFOPkGcfnYO8knMesg4m1rgJyTaVtllJvgDQjNlwg
         ue/iHA9qpc5IZxHOKAqkblFyMm2ItbQh3+BzuLtDJhrCdUiZoaUu/zvFEe4gpQh6KRpL
         +cA15K56Ww0mOnszAAY0snvaAILvaTxEcDr01nzLFIVuvG2hp4+9jwgn17HtQ0VxpwmB
         QR2QpG61J11698wknZglDHtwYvEeDpUMm7cEBsO/yuIQ/mEYAcbl7cAE4c+Nplk1bbMP
         V1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296150; x=1795900950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGcrw4mT7NdiqFu7SkETRkItggb0uYK1nbamCet3nRg=;
        b=Y3YfBkrVCfs/9SVJXCtGku/3y1fc8PViVwoFRF1PSVvDwgNnvv/llxSbp81ZMRccGE
         0mr+Jc5tkvoUk4vNBqDHJ7D6BnoiJ48bTV7zHkYB1ojEce0Q4THFJoVeWMfZL1pQXYxe
         pyMadlsEZr2btcXjL9oGvXufezDcBdWmBmYPwQDKiHTLjM4PZ7aHCg/3uY0cmqDJ1zRT
         U3US5M5P2+VO3JN93sVHcIcxlgf1ExTLnFCBbPEQtf2KKx6tNagoaIbhCqYGiNG2A2xF
         grn9k/AxwESeJVmZOmbJztLWDVceZiFW5JynrDkzZIPOLlPQRb9Oo4TzxL7B/QRYS91B
         Zb9Q==
X-Gm-Message-State: APuU4Z/yWUr3Ki/rbimjLvEArUcun8iJ60e4mLtXi25brKI86CThTyWa
	aD5flwwkjYOXbRp6ehOXN8I3KB5znyI4Mm+5U4cyLb/WgH9kEUo4v3DoYa08FPVjPOr/vOUQlGn
	hBKDqLe0k7kzGdQrijb5FejIbzbZ1513V7efE
X-Gm-Gg: AZFdTZf/xCId4jDCmPTxJEMbrZRppGDKfxFPXeFDVjH65Duk/OH9l8XZ6trTFBaO51s
	DWoxmb3LN5lvaJQbMFCq4bKbP8tkgWKlN3tYE0p/dcMJipYi+QKsKywhcQ9qTd78us89DyzJWpk
	pajKszJEe5LkRX03g12iCJ2ym7ORdaMD1vN/PddI3hzfNWWv2zGiaZJLxzZzO/2V8mTVX9ZdSO1
	o/FlLWvUv7DDHF7FaTcUWiwMydFsu7pyYHZlhvPZKK21rkE5xn29LCbQdmXrxQItvrUdZ8txRCO
	fIz8ATiFU4IMSreYHyv8sFYm0p/+t+RH+9p1AAh3QVahfirAprycbYacSF2YY+yBaqKn84JAzeT
	nnZuaRawPhDboIZJs1IpHAfxFdkUpapjZ73WE
X-Received: by 2002:a2e:b8c9:0:b0:3ab:344e:373c with SMTP id
 38308e7fff4ca-3ae7f9d5f36mr20017261fa.5.1795296150106; Sat, 21 Nov 2026
 13:22:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
 <20261120041906.5785-6-kanchanapsridhar2026@gmail.com> <sashiko-outbox-226635@kernel.org>
In-Reply-To: <sashiko-outbox-226635@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Sat, 21 Nov 2026 13:22:17 -0800
X-Gm-Features: Aa3M54osTYEDX87du_Iyy9mI8Cvq-0UULn2mX3Kv6V_zPCZindyaWLd_Ecpy6sI
Message-ID: <CACpmpodVacE6-7=sOh7-odaDytspcH=+9u-B0-zkO6c8W0JiwQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm: zswap: shrink_memcg() skips non-N_NORMAL_MEMORY nodes in
>   zswap_list_lru
> --
>
> commit e4e47a21782dc39867fe81289fb7e9ed7f2692b4
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Store the folio's node id in the zswap_entry.
>
> This commit stores the folio's NUMA node ID in struct zswap_entry and use=
s
> it when adding and removing entries on zswap_list_lru, instead of derivin=
g
> the node ID from the slab page backing the zswap_entry.
>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 9a323862bd59d..78d9694f75b5e 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> [ ... ]
> > @@ -680,14 +685,8 @@ static int zswap_enabled_param_set(const char *val=
,
> >  * lru functions
> >  **********************************/
> >
> > -static inline int entry_to_nid(struct zswap_entry *entry)
> > -{
> > -     return page_to_nid(virt_to_page(entry));
> > -}
> > -
> >  static void zswap_lru_add(struct zswap_entry *entry)
> >  {
> > -     int nid =3D entry_to_nid(entry);
> >       struct mem_cgroup *memcg;
> >
> >       /*
> > @@ -704,19 +703,18 @@ static void zswap_lru_add(struct zswap_entry *ent=
ry)
> >       rcu_read_lock();
> >       memcg =3D obj_cgroup_memcg(entry->objcg);
> >       /* will always succeed */
> > -     list_lru_add(&zswap_list_lru, &entry->lru, nid, memcg);
> > +     list_lru_add(&zswap_list_lru, &entry->lru, entry->nid, memcg);
> >       rcu_read_unlock();
> >  }
> [ ... ]
> > @@ -1537,9 +1536,10 @@ static bool zswap_store_page(struct folio *folio=
, long index,
> >  {
> >       swp_entry_t page_swpentry =3D folio_swap_entry(folio, index);
> >       struct zswap_entry *entry, *old;
> > +     int nid =3D folio_nid(folio);
> >
> >       /* allocate entry */
> > -     entry =3D zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio));
> > +     entry =3D zswap_entry_cache_alloc(GFP_KERNEL);
> >       if (!entry) {
> >               zswap_reject_kmemcache_fail++;
> >               return false;
> > @@ -1554,6 +1554,7 @@ static bool zswap_store_page(struct folio *folio,=
 long index,
> >        * to an unrelated live pool.
> >        */
> >       entry->pool_idx =3D pool->idx;
> > +     entry->nid =3D nid;
>
> [Severity: Medium]
> Can shrink_memcg() miss zswap_list_lru entries when a folio resides on a
> node outside N_NORMAL_MEMORY, such as a ZONE_MOVABLE-only CXL or
> hotplugged memory node?
>
> Previously, entry_to_nid() took the node ID from the GFP_KERNEL slab page
> backing struct zswap_entry, which was always in N_NORMAL_MEMORY.  Now
> entry->nid is folio_nid(folio), which for GFP_HIGHUSER_MOVABLE folios can
> be any node in N_MEMORY, while shrink_memcg() only walks
> N_NORMAL_MEMORY:
>
> mm/zswap.c:shrink_memcg() {
>         ...
>         for_each_node_state(nid, N_NORMAL_MEMORY) {
>                 unsigned long nr_to_walk =3D SWAP_CLUSTER_MAX;
>
>                 shrunk +=3D list_lru_walk_one(&zswap_list_lru, nid, memcg=
,
>                                             &shrink_memcg_cb, &ctl, &nr_t=
o_walk);
>                 scanned +=3D SWAP_CLUSTER_MAX - nr_to_walk;
>         }
>         ...
> }
>
> Entries stored from non-N_NORMAL_MEMORY nodes will never be scanned or
> written back by synchronous cgroup limit reclaim or shrink_worker().
> Should shrink_memcg() iterate over N_MEMORY instead?

v2 5/8 response to Sashiko's comment:

Conversely, is the previous behavior correct? The entry is created on
a node in N_NORMAL_MEMORY, and when that node is under memory pressure
the folio (allocated on ZONE_MOVABLE-only or ZONE_HIGHMEM-only node)
could get written back. This doesn't resolve the memory pressure for
the node on which the entry is allocated.

Nhat/Yosry/Johannes: Does Sashiko's suggestion for the shrink_memcg()
modification look Ok to you?

Thanks,
Kanchana


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120041906.57=
85-1-kanchanapsridhar2026@gmail.com?part=3D5
