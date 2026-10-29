Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793314827;
	b=U2rFShJM3CKjva3wo1UzoyOPTEFf0QWZCtADbqou5JyVcfgQLHGhEW58tnoGyWg4VIbA
	 IAFePU5tfMQBTM1VkRmekWjgtI37TF8yDwa57uhlaipc/BYP+DHU0ZBcG9Yo3M6zPudsX
	 pxCp6/5ixx1n0ZhbhQ4XVrG1KnTRPig3e22u6ervWbwTNG0KbJt8tJEOLkyQ5HKMBA02s
	 ikuHYGaXnreUrvJ/Ko+tFkWUeTVjAhkNfIG+xHuZASTpYzFjAi5Yle9LYpQ0Afa/VuOfI
	 1qZCFAjD+dBb3OjkKstvwT7ropO8hNTKoqL7uv0SOTHgB3f3Sx5VQXx1+YkFmwSVglg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OjIFR9RHuZyb+FQlUiSJHHP2buOKCHCE0JjDFtdSiWE=;
	b=wiemwJilUaxOTP6zHIWaSyAaoN1Aa3DlGte9HnZxDGpiEJc7pDP6dX7khaanw1uztP2Q
	 RpOEO80lG5HVkOuYW3JObEQM+dFeXeQPAKjAsT79dugAJFjlmjXetiNproWf5mLs9USrD
	 KKUz36yYuU+m8WhPTKWwht1CD1/ex7d/Xw5e0PY9a0E1dC/PmVXEymIaMOzcf16OrCejZ
	 sJNH3p66Ed9GdaU9vhqCH3Nexx12OhpZBT/z+v2Hp49j3GsGiaW4H+XOdVa+qH0R8A4Qf
	 cW3VGAmMnWbdishjpTNDZIbvkDjxuEB28EceeEGImv7NE2nAZO30ChV2cz5S8qPKA0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrGqQXDD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299CC606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 23:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrGqQXDD
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so152009e87.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 16:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793314825; cv=none;
        d=google.com; s=arc-20260327;
        b=hz7VuNV4sNhiKhT1PAGLLyZZGT951PWupCcmQrQ6s96v4Am/jfbRFBdcVlYkpMx6Ml
         204YzlATy/lo8Hkr/dsv4ayKDk3LZxNEvjHjlrW61NbX11okD8SvQ401632GAVnXEWI+
         0e9xSJgnG5DoSSpxTWOmhwDMVBNih9dX0o21X1iTuvCpOdOrCPMXpvTOkgq0RxwhgzCv
         dFHgQrhUb4Dg0fJ5yoosP4Bvr+DMrZHM0FCSLNAxkkmIstz04fh6z6xk8VvH6dWvwl54
         hKIvur2AC9Cm781vMlOy8ncg7EvdNFPE160cbzu1p3fQrXHKFj4LDT4SSI2uA5881IoR
         PH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjIFR9RHuZyb+FQlUiSJHHP2buOKCHCE0JjDFtdSiWE=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=ZtwsGrNg6U4mZv8EA9f6ypwITeZbgiGiifK33RWL7GRJXx39nvnghvNHphfyJ0KgLB
         YcGSVTSsJRsigZxXz5eethA7iPjbBjyQDyl45uM7OOBmY68lQboIZGx9wK+dmKVgMng4
         Z4hyBfclwZNO8QffjfNmun+HsnBFGasc62g6GCn+lkRZJ/YI77I2ih5RG06NI9h+Kmqm
         BhLBkFI9Gka0kWTczHuadTpRhbYiPt0D7RhxRO6ZLLgk+uO2m5xzzgewBSriQ/vppU/q
         2+UM9+M4N7+vrVs+aNnuaBDqflDWR/ajFddrRf7NSpGeouH+s/UpXX0bv3uP7mvotXbY
         qXxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793314825; x=1793919625; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OjIFR9RHuZyb+FQlUiSJHHP2buOKCHCE0JjDFtdSiWE=;
        b=OrGqQXDDmLj7ULrVXIRDyW+oYrhdu5Oa389QnBuZq0EVzB+dPc+XqQKsVrbyGsQC6C
         fvhFWB1QRTHTRwWdgy/9CCzj2VeXq+B9PlzMmH7LEmOrTdfp6hICq/78+n5WeuBdhsYh
         /jyagzSVsW32Gdwn6HEdohwfBeQcuQz9x4jIQPEJceAnEJGU/Dz7I26Tqx8VlEWNBGXr
         GBcKvRtNgAoBhMuXtTl+Vkvx8lcAa5J94D+4WPnRx1SddR5pkGs5Genp1JwuE0iLwaUQ
         HT4zuTVa42agdGI2CvAIzITBGj5CH9lZKGrLXBTWaKqe2TgDCJGohguk61Cwlk9bj0o5
         aq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314825; x=1793919625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjIFR9RHuZyb+FQlUiSJHHP2buOKCHCE0JjDFtdSiWE=;
        b=xoXmkX97tl7i+7ugk4snQov/XuWzT1i4xaKcOzt0u9Vt7/f5jKYoV6EBEf22reWMHH
         xfXYOP1d+P3WDXxjaUq3X4t2In07o2goyL4U92JNA+9VkOJASUQbds7GA658ESpWlRqi
         uhGxcPdcxSUEM8Pir5z5gdkRjL6Pu4Bas83P4s634gMkZdYpIKDofGWH3tYFg5JmZI02
         HwWo4aKRo31/XhGmlt5MJaP+29QOj5ywEQYekBu0LRj+pq/7ozFvO1QfLFC0Nw6Jh8oX
         2toWfodrNz2aUBkqIxwoTFPro2vaFgaFooBGSBYHl4BQZ6OzCdgUOwizm6CL93+519nR
         6oDg==
X-Gm-Message-State: AFq9FYLY93V+klTjkHRyDRRvAYdAblcKJgDlOzZYvOkhLqZDZxXisGzi
	BfQDKLhufirBuoE4TNB3NAf19ReKxMB18IrZC/SWTcCGHVF8G6kte8hxc1JDo1i4d2L9eSvRt6m
	BWQsLVpQD5T7sERpAU1hT9FonW/MnKWksRuFm
X-Gm-Gg: AYBFou22aeprsKUCJF3iqq1wRS7H36Bd8ktrlynRFispefICBgzInFRe9K2pJnKzthn
	YR79LED09iWo7z6ZchNqVShDov06GdwjdtcLr/65Y8/5+UpWaF9dYwRuPDn3LOO2ygWjtU5OAME
	dgKrToAU7hy9iI50YMrlZ2D4ZHm2zIAI0qhOqGbo27IUfT/KFJzB7HqHiGUL5Uj8PCnvZrvshHG
	DmquAJ4i9ky9Y2WSbZRlZWdShymS1YOmyjmWxfM3WymPugENubBGv4UUVKA7VeHwNM0SaSINPFU
	eS7B/L8LAc8fEyJk2jFfsi9SZjnpLn6uHZff4x2P5GEFUQieWs2r02q70eRj2A9cqfsDj3DG614
	3LOuN3jEKUBOnDs02RBuiYg4RJTh0SVYPqQxA
X-Received: by 2002:a05:6512:32c9:b0:5bf:aad9:df71 with SMTP id
 2adb3069b0e04-5bfd95208d7mr108143e87.7.1793314825046; Thu, 29 Oct 2026
 16:00:25 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
 <20261028030503.17923-6-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188657@kernel.org>
In-Reply-To: <sashiko-outbox-188657@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 16:00:11 -0700
X-Gm-Features: AclHuK8vPy78HoUW065_s9Da2om9WIPFjJ9GZXx-qNzNfH1rQXOgW4zxEQfJFis
Message-ID: <CACpmpofjVP17TpyieQ2khsdRL+FMX9oCEcaNE9Hh+vBfGBO2dA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] mm: zswap: off-by-one bitfield width for zswap_entry.length on 2=
56KB pages
> - [Medium] mm: zswap: shrink_memcg() skips non-N_NORMAL_MEMORY nodes in z=
swap_list_lru
> --
>
> commit c4aa889f59a75fcf871276fd68b4a4738afe132b
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Store the folio's node id in the zswap_entry.
>
> This commit stores the folio's NUMA node ID directly in struct zswap_entr=
y
> instead of deriving it from the slab page backing the entry, and converts
> zswap_entry_cache_alloc() to use node-agnostic slab allocation. To keep t=
he
> structure size unchanged, it packs length and referenced into bitfields.
>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index e1d57a7d95950..19b7d60bc7d2a 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -180,6 +180,7 @@ struct zswap_pool {
> >   */
> >  #define ZSWAP_FIRST_POOL_ID 1
> >  #define ZSWAP_MAX_POOL_ID U8_MAX
> > +#define ZSWAP_MAX_COMPR_LENGTH_SHIFT 18U
> >  static DEFINE_XARRAY_FLAGS(zswap_pools, XA_FLAGS_ALLOC1 | XA_FLAGS_LOC=
K_BH);
> >  static struct zswap_pool __rcu *zswap_current_pool;
> >
> > @@ -206,15 +207,19 @@ static struct shrinker *zswap_shrinker;
> >   *              logic if referenced is unset. See comments in the shri=
nker
> >   *              section for context.
> >   * pool_idx - id of the zswap_pool that the entry's data is in.
> > + * nid - NUMA node id of the page for which this is the zswap entry.
> >   * handle - zsmalloc allocation handle that stores the compressed page=
 data
> >   * objcg - the obj_cgroup that the compressed memory is charged to
> >   * lru - handle to the pool's lru used to evict pages.
> >   */
> >  struct zswap_entry {
> >       swp_entry_t swpentry;
> > -     unsigned int length;
> > -     bool referenced;
> > -     u8 pool_idx;
> > +     struct {
> > +             unsigned int length:ZSWAP_MAX_COMPR_LENGTH_SHIFT;
> > +             bool referenced:1U;
> > +             u8 pool_idx;
> > +     };
>
> [Severity: High]
> Can entry->length overflow to 0 when storing an incompressible page on a
> kernel with 256KB pages (PAGE_SHIFT =3D=3D 18)?

Good catch. This has been addressed by setting
ZSWAP_MAX_COMPR_LENGTH_SHIFT to 19U and the build time assertion check
for BUILD_BUG_ON(ZSWAP_MAX_COMPR_LENGTH_SHIFT <=3D PAGE_SHIFT)), as per
Sashiko's suggestion.

[ .. ]

>
> > @@ -1507,9 +1506,10 @@ static bool zswap_store_page(struct folio *folio=
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
> > @@ -1524,6 +1524,7 @@ static bool zswap_store_page(struct folio *folio,=
 long index,
> >        * to an unrelated live pool.
> >        */
> >       entry->pool_idx =3D pool->idx;
> > +     entry->nid =3D nid;
>
> [Severity: Medium]
> What happens during cgroup or pool reclaim in shrink_memcg() if the swapp=
ed
> folio resides on a NUMA node without normal memory (for example, a
> ZONE_MOVABLE-only or ZONE_HIGHMEM-only node)?
>
> Previously, entry_to_nid() derived the node from virt_to_page(entry), whi=
ch
> was allocated from slab with GFP_KERNEL and therefore always resided on a
> node in N_NORMAL_MEMORY.
>
> With entry->nid now set to folio_nid(folio) in zswap_store_page(), anonym=
ous
> and shmem folios allocated with GFP_HIGHUSER_MOVABLE can have an entry->n=
id
> that is in N_MEMORY, but not in N_NORMAL_MEMORY. zswap_lru_add() inserts
> those entries into zswap_list_lru for entry->nid, but shrink_memcg() only
> walks N_NORMAL_MEMORY nodes:
>
> mm/zswap.c:shrink_memcg() {
>     ...
>         for_each_node_state(nid, N_NORMAL_MEMORY) {
>                 unsigned long nr_to_walk =3D SWAP_CLUSTER_MAX;
>
>                 shrunk +=3D list_lru_walk_one(&zswap_list_lru, nid, memcg=
,
>                                             &shrink_memcg_cb, NULL, &nr_t=
o_walk);
>                 scanned +=3D SWAP_CLUSTER_MAX - nr_to_walk;
>         }
> }
>
> Should shrink_memcg() iterate over N_MEMORY instead of N_NORMAL_MEMORY so
> that entries from movable-only or highmem-only nodes can be reclaimed by
> shrink_worker() and mem_cgroup_try_charge_zswap()?

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
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.17=
923-1-kanchanapsridhar2026@gmail.com?part=3D5
