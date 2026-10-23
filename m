Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792794622;
	b=bc+cKDWzOizU+2rvxkL570aLnGB1ELZA90ayFfTybYl70cmRiBeIgBjlBqbXPNtTVtMD
	 Lmn7hSkYLswe4KVcJTNtWOjwzeAQYRFXhCpqyTdMLpU5pU6C0EftagGEXJ4WZaaDWPRtR
	 eA7uuB6EbE5niSngjYgMmYKv/TjzC4pnzdHjYUtXPzdG0be0+Oi5Z5zX2x4/YomLdx8sV
	 El5lt6REhVrxKhfYUlrmfRPZxc138ffLocNpiZUZZuvznJtz6un69T6Dk9EyaoHL0kzgA
	 8Y5xdbTdE6tjYq1Q9euCH1+eKUfyUz0U1rqZ8TIFkZxFVhEZbJDczF9vW/j0Ov47HuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=b1vVmrd2o2bhAY35x1Wt33iUoT/bMDNuOnBZV1/6OMk=;
	b=3MTeMPkVRjrCU2JzYvmCLxZ8i/6Lp5xFkihqQp+neoFQQLDW0lu3FMnQGi+TZ8cc2qAI
	 b/UfRKAGH5l1qNy1rWApqeetT9GPcQFwvhT62aUvWSh6/xKhfEDeoWO6aOhmSy8VgLU/s
	 O7hLeSeXL/d6cjmxsI8ZvkoULFun5ELHGUPuWy331jDhNSfSivnIh0aXUPOpyzVQx2PLB
	 h/Zg3EzSw44RU7mZ9XBODr7MpHX0wsOENpNsAfUSedqnWnC1WcGdGANC8jBWFV26N9oMT
	 9tbsCsQeSkx8djxDcgXFmdPtquy/szvqO00jVzyKdccBS/JFzs2VJ3o4r6g9pSfXUsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BW63KCzC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA2606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 22:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BW63KCzC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso1092695e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 15:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792794620; cv=none;
        d=google.com; s=arc-20260327;
        b=k5yZHJHAKbj4ujjV8yrM4TkwwbDQ5N3ujt5YPHjLwgSSO7lQ2CSrwh89xsRG+fHuTy
         6owJqDTiuRhPdJdRY6m9/N8Syr7W+V/vGnR1c2CzDABtLAb1kDrd2gd6KqpCHQUHQwiP
         wugwEdDdw/7S6iw5RqSE9VpiiPmrt3wiczgLDa6TDkLynPHTDsnLXG7oEOyixCW0QHP1
         oxfrL8LVDCH5zrAt0nZY6/5USpbryqF557qPJwKIYcPN0GsLP0V4hxCXhHyimGTzhMYu
         L4b9AvoJhDW9GXL7gUUzwLHF/kd2EZVNm0n4HxFniywbUNCrX08TmNiejI9KTmg/tUIP
         ldCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1vVmrd2o2bhAY35x1Wt33iUoT/bMDNuOnBZV1/6OMk=;
        fh=Hze5d3d0Z382PtgOb2+CzJ4z7uaRv7y1hGw2r7dwflQ=;
        b=n47t5Zfvr3E+k8vzIaP5yC4pBio89JvHlD3Ny7wYZRoOT4JgvJ+2wRuerkCPtUj5Ie
         pn9hTTn6n1sVgoU+XUj1xCW1cTOwPKDbzIGr9zGhiPw5Wbxq/P6N1x91Kxd1QVWkcbKp
         aTyeHhmcV3udxDabqx9U5LO7GThde9Ie2XVqBuC5GzMDXzdVWrifO4BNfO3lC4uXYgvq
         BtidgkCr4jNwFmnHg9G35czMb9/cBauy3UnSCf27uUrkAmB6KTZiXr5gbg+2+POBlrk2
         mb6y8opNQG6Lpu8fJ+575MAngnDDimXFCXuwEt+Ebsxz73cXMlxODSXhqc7UnM+zbJbq
         QRaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792794620; x=1793399420; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1vVmrd2o2bhAY35x1Wt33iUoT/bMDNuOnBZV1/6OMk=;
        b=BW63KCzCxIyselY4GulAjFTdKd1atojEfwDjbxTmcP3C0tFm6acKYx/gSqutNY10i7
         W97QEYHBqjw06PuK+q31BynHumattf3xwvt5WPqbHwgzPNTsMJIPsuxRX2xJByTtdJh9
         iQ6/wp+NlGruKrCiTu82CCLMS6hUGlgewpCOBiQc4b7Oxez2ytMvQP53nr2Tyf4myH0c
         TUZngh16/+FZAK1qXxIaRVEqyo8RY/8wy0f2+upeNehBYt27U4N5pYdiGmQTo5VGYgYB
         dLVrxhoLyfNUqVzPPEoqwvnag/z/xLM4HhDAnVKT2lxEGYlOl6VT9GApx8wB+zfyUp1a
         cHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792794620; x=1793399420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1vVmrd2o2bhAY35x1Wt33iUoT/bMDNuOnBZV1/6OMk=;
        b=pyKn6dINmsUEr/B4Djer5eQIBlsLyWlgRC7bWGER/Txz+qEq8El6n5ODoh5TKSJA2o
         5H9wXrZ/7TVg5+R1uMK50CldAOtxJWnNjqyf/s+vbixrcTJrgeacymIy440TiOB5xEqJ
         N2oREYqhzeviNf0a2OVXzVGATAEojkErR15i/2STuI0q2V7m7m3yUC4gOvWI2c6W/uVu
         h/GkrGyaZTrL05OrEBXi7IzO2vl+Yi8HCdBqro05Lt1YURshotU8TDWaZJ0wv83IWwUf
         PQ6edbUCyca1oUe1vJ96Xktfs6zHenfzh7SVEkTiT4jgUw5pwddZx/PY3716A4/lgr3E
         LUrQ==
X-Gm-Message-State: AFq9FYKBzyf4TQh0AeIwxRd3bNRyXC+z9rIvSLUd7295X6fxXsyJ7+7f
	i/RSGC77xJor6vq3C+Uu2E0oGbbgvO4q5SgN7w7GP81VaYenxNif+AQum/1wG8Icz25myWF6vZt
	FGqGKvze0Y4YuefX8nZYRxgdhR15gkHCJaa0QrIn4NA==
X-Gm-Gg: AYBFou3bmjGNKJPSJmIjop9U7+QfA6BZNDa5U1fCzyDcHuNUg6umGfIT0vd3tj0l6T6
	XpG4Y2+GfYWg5fD9rvdeC47oE87cO91ioC1rdcIudS4Z/Rcswbz00U/V/4/7FdWACbDHMF5AvFE
	quxbmu05Iw75Aduull1+Zyj1/a61Vo5WBcDrlYzV2W2EQY3UGTxpKqD3jV9xgrw6OplL4n4G6Ad
	ws/wfDQjkaIFtnXhuf/pRSdSSA1+JI2IB4aJjKphxpGDvmEtZMMMvL8QAOIiVs3k4VzVANZIszw
	4agaOHFnsk4ZvPw1SwrsJ/O4BGPBZ2rINQ1q3OU0czO9HLdpLGsxbufxTlbqTkakvNip5BV6YtL
	lQnWI8nbyV+agTn1ER1JNHPWRGXTGuinlbxw1Z8fyeZeBNRe7fXu0FFjay1cH8Em35G7uDevwpc
	XJJBHqdOWno5F33/dQzvtFI0Er9cfHSRFIzaHimKm/XPD9NFeOj7Ex
X-Received: by 2002:a05:600c:4f41:b0:4a2:150f:1603 with SMTP id
 5b1f17b1804b1-4a35acb3e14mr4128865e9.25.1792794619650; Fri, 23 Oct 2026
 15:30:19 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021060323.553433-1-nphamcs@gmail.com> <20261021060323.553433-5-nphamcs@gmail.com>
 <sashiko-outbox-181078@kernel.org>
In-Reply-To: <sashiko-outbox-181078@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Oct 2026 15:30:07 -0700
X-Gm-Features: AclHuK9f3EoMXWJVPyND1AFMLPSEq7pySnN5Iv4BK8FN6E0iGCBP-yL0F6SS_5w
Message-ID: <CAKEwX=OBBfF5U+JHDfnugk5KGFEnOPQkkwZRfeii1iEQUNVG4Q@mail.gmail.com>
Subject: Re: [PATCH v6 04/12] mm, swap: support physical swap as a vswap backend
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, kunwu.chan@linux.dev, 
	kernel-team@meta.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

Working through Sashikos list now!

>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] mm: try_to_unuse() dirties unmapped vswap folios rejected by pag=
eout()
> - [High] mm: try_to_unuse() leaks vswap folios and slots when swap count =
is zero
> - [High] mm: large vswap folios declined by zswap fail swapout without sp=
litting

IMHO:

* First issue is a real scenario, but it's rare and the trade-off of
fixing it is nuanced.

* Second issue is real, but we're just adding (a rare) triggers to an
existing problem.

* Third issue is a problem because of the second issue. The fix is a
one-liner though, and is a smart thing to do either way, so I'll just
follow sashiko's recommendations here!

More details below:

> --
>
> commit f1735375be4432e3cb8facdcc6b588e080aeb34c
> Author: Nhat Pham <nphamcs@gmail.com>
>
> mm, swap: support physical swap as a vswap backend
>
> This commit adds physical swapfile support as a backend for virtual swap
> entries when zswap declines a folio during swap_writeout(), tracking the
> reverse mapping via vswap-tagged swap_table entries on the physical clust=
er.
> During swapoff, try_to_unuse() reads vswap-backed physical slots into the
> swap cache and releases their physical backing slots before walking proce=
ss
> and shmem mappings.
>
> > diff --git a/mm/page_io.c b/mm/page_io.c
> > index 61bb5c6e97595..ed8c037e4aa08 100644
> > --- a/mm/page_io.c
> > +++ b/mm/page_io.c
> > @@ -209,6 +209,7 @@ static void swap_zeromap_folio_clear(struct folio *=
folio)
> >   */
> >  int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
> >  {
> > +     swp_entry_t phys =3D folio->swap;
> >       int ret =3D 0;
> >
> >       if (folio_free_swap(folio))
>
> [ ... ]
>
> > @@ -257,13 +264,21 @@ int swap_writeout(struct swap_io_ctx *ctx, struct=
 folio *folio)
> >       }
> >       rcu_read_unlock();
> >
> > -     /* A vswap folio has no physical slot to write to. */
> >       if (is_vswap_entry(folio->swap)) {
> > +             phys =3D folio_realloc_swap(folio);
> > +             if (!phys.val) {
> > +                     folio_mark_dirty(folio);
> > +                     return AOP_WRITEPAGE_ACTIVATE;
> > +             }
> > +     }
>
> [Severity: High]
> What happens here when a large folio (order > 0) with a virtual swap entr=
y
> is declined by zswap_store() and the underlying physical swap cannot sati=
sfy
> a high-order allocation?
>
> During reclaim in shrink_folio_list() or shmem_writeout(), folio_alloc_sw=
ap()
> allocates from vswap_si via vswap_alloc() -> cluster_alloc_swap_entry():
>
> mm/swapfile.c:cluster_alloc_swap_entry() {
>         if (order && !(si->flags & SWP_BLKDEV) && !swap_is_vswap(si))
>                 return 0;
> }
>
> Because swap_is_vswap(vswap_si) is true, vswap_alloc() succeeds for order=
 > 0
> folios even when the physical swap devices are regular swapfiles without
> SWP_BLKDEV or have fragmented high-order clusters. As a result,
> folio_alloc_swap() returns 0 instead of -E2BIG, bypassing the
> split_folio_to_list() fallback in both shrink_folio_list() and
> shmem_writeout().
>
> Later in swap_writeout(), if zswap_store() declines the large folio,
> folio_realloc_swap() -> folio_alloc_phys_swap() attempts to allocate a
> contiguous physical swap range of folio_order(folio), which always fails =
on
> non-SWP_BLKDEV swapfiles and fails when high-order physical clusters are
> unavailable. swap_writeout() then marks the folio dirty and returns
> AOP_WRITEPAGE_ACTIVATE without splitting it.
>
> On subsequent reclaim passes, an anonymous large folio is already in the =
swap
> cache with PTEs referencing its vswap slots, so shrink_folio_list() skips=
 the
> !folio_test_swapcache(folio) block where split_folio_to_list() is called:
>
> mm/vmscan.c:shrink_folio_list() {
>         if (folio_test_anon(folio) && folio_test_swapbacked(folio) &&
>                         !folio_test_swapcache(folio)) {
>                 ...
>                 ret =3D folio_alloc_swap(folio);
>                 if (ret) {
>                         ...
>                         if (split_folio_to_list(folio, folio_list))
>                                 goto activate_locked;
> }
>
> For a large shmem folio, shmem_writeout() removes the unsplit folio from =
the
> swap cache on AOP_WRITEPAGE_ACTIVATE without reaching its -E2BIG split pa=
th,
> repeating the same vswap_alloc() success and folio_realloc_swap() failure=
 on
> every pass.
>
> Can this cause large vswap folios declined by zswap to never split or swa=
p
> out?

This is quite nuanced. I spent way too much time trying to reason
about this, but seems like my documentation is lacking, so sashiko
can't reason about it. I'll put down my reasoning here first, then
update the documentation later.

Zswap store can "fail" for a couple of reasons:

1. Incompressibility: we'd actually still try to store the folio's
subpages as-is in the zswap pool if zswap writeback is enabled. If
zswap writeback is disabled, then we cycle the page through the LRU.
But note that there is no difference, with or without zswap in the
picture here. We'd just be splitting prematurely, but the
incompressible pages would still remain in memory regardless.

2. Zswap rejects the page due to limits being hit - this one is
trickier. For the cgroup case, I already checked at vswap_alloc()
time. If the cgroup disables zswap, then we go for physical swap
allocation, where we avoid the physical swap backends that do not
support high-order allocation, or split if no such backends are
around.

For the global zswap limit, I thought about also checking it and
bypass vswap based on that limt at vswap_alloc() time, but decided
against it, because I wanted to trigger the global zswap shrinker in
zswap_store() path, and giving zswap opportunity to try again.

(I'm also against capping zswap size as well, but that's another story).


>
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index 69fac2d905a4f..be66ac79313ce 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
>
> [ ... ]
>
> > @@ -3087,19 +3287,95 @@ static unsigned int find_next_to_unuse(struct s=
wap_info_struct *si,
> >
> >  static int try_to_unuse(unsigned int type)
> >  {
> > +     struct mempolicy *mpol =3D get_task_policy(current);
> >       struct mm_struct *prev_mm;
> >       struct mm_struct *mm;
> >       struct list_head *p;
> >       int retval =3D 0;
> >       struct swap_info_struct *si =3D swap_info[type];
> >       struct folio *folio;
> > -     swp_entry_t entry;
> > -     unsigned int i;
> > +     struct swap_io_ctx ctx;
> > +     swp_entry_t entry, vswap_entry, phys;
> > +     unsigned long swp_tb;
> > +     unsigned int i, j;
> >
> >       if (!swap_usage_in_pages(si))
> >               goto success;
> >
> >  retry:
> > +     /*
> > +      * Free vswap-backing slots (Vswap-tagged) first. Walk physical
> > +      * clusters, read the vswap entry from the rmap, ensure the data
> > +      * is in the swap cache, and transition PHYS to FOLIO. Freeing th=
e
> > +      * physical backing is enough, so no page table walk is needed.
> > +      */
> > +     i =3D 0;
> > +     while (vswap_is_enabled() &&
> > +            swap_usage_in_pages(si) &&
> > +            !signal_pending(current) &&
> > +            (i =3D find_next_to_unuse(si, i)) !=3D 0) {
> > +             swp_tb =3D swap_table_lookup(swp_entry(si->type, i));
> > +             if (!swp_tb_is_vswap(swp_tb))
> > +                     continue;
> > +
> > +             vswap_entry =3D swp_tb_vswap_to_swp_entry(swp_tb);
> > +
> > +             folio =3D swap_cache_get_folio(vswap_entry);
> > +             if (!folio) {
> > +                     folio =3D __swap_cache_alloc_folio(vswap_entry,
> > +                                                      GFP_HIGHUSER_MOV=
ABLE,
> > +                                                      BIT(0), NULL, mp=
ol,
> > +                                                      NO_INTERLEAVE_IN=
DEX);
> > +                     if (IS_ERR(folio)) {
> > +                             if (PTR_ERR(folio) =3D=3D -ENOMEM)
> > +                                     return -ENOMEM;
> > +                             continue;
> > +                     }
> > +                     folio_add_lru(folio);
> > +                     ctx =3D (struct swap_io_ctx){};
> > +                     swap_read_folio(&ctx, folio);
> > +                     swap_read_submit(&ctx);
> > +             }
> > +             folio_lock(folio);
> > +
> > +             if (!folio_matches_swap_entry(folio, vswap_entry)) {
> > +                     folio_unlock(folio);
> > +                     folio_put(folio);
> > +                     continue;
> > +             }
> > +
> > +             /*
> > +              * Re-validate under folio lock: rmap holds folio->swap +=
 j
> > +              * for some j in [0, nr_pages). Check folio->swap still m=
aps
> > +              * to the contiguous physical run that includes our slot =
i.
> > +              */
> > +             j =3D vswap_entry.val - folio->swap.val;
> > +             phys =3D vswap_to_phys(folio->swap);
> > +             if (!phys.val || swp_type(phys) !=3D type ||
> > +                 swp_offset(phys) + j !=3D i) {
> > +                     folio_unlock(folio);
> > +                     folio_put(folio);
> > +                     continue;
> > +             }
> > +
> > +             folio_wait_writeback(folio);
> > +             folio_release_vswap_backing(folio);
> > +             /*
> > +              * Drop a folio whose read failed rather than dirtying
> > +              * uninitialised memory; the next fault finds no backing =
and
> > +              * gets SIGBUS.
> > +              */
> > +             if (unlikely(!folio_test_uptodate(folio)))
> > +                     swap_cache_del_folio(folio);
> > +             else
> > +                     folio_mark_dirty(folio);
>
> [Severity: High]
> Can pageout() ever write out the unmapped swap-cache folios allocated and
> dirtied by this pre-pass?
>
> When __swap_cache_alloc_folio() -> __swap_cache_alloc() allocates a fresh
> swap-cache folio here, it sets PG_swapbacked and PG_swapcache, but leaves
> folio->mapping as NULL because try_to_unuse() does not map the folio into=
 a
> VMA via folio_add_new_anon_rmap(). Shmem folios in the swap cache also ha=
ve
> folio->mapping set to NULL. As a result, folio_test_anon(folio) is false.
>
> When shrink_folio_list() later scans one of these dirty swap-cache folios=
 on
>  the LRU, folio_mapping(folio) returns &swap_space and shrink_folio_list(=
)
> calls pageout():
>
> mm/vmscan.c:pageout() {
>         if (folio_ref_count(folio) !=3D 1 + folio_nr_pages(folio) || !map=
ping)
>                 return PAGE_KEEP;
>         if (!shmem_mapping(mapping) && !folio_test_anon(folio))
>                 return PAGE_ACTIVATE;
>         if (!folio_clear_dirty_for_io(folio))
>                 return PAGE_CLEAN;
> }
>
> Because mapping is &swap_space (!shmem_mapping(mapping)) and
> folio_test_anon(folio) is false, pageout() unconditionally returns
> PAGE_ACTIVATE before reaching swap_writeout(). Wouldn't this prevent recl=
aim
> from ever writing these dirtied vswap folios out to zswap or another swap
> device until they are faulted in?

I think this a pre-existing issue (which vswap adds a new, rarer
trigger). Readahead of zswap entries gets us into this exact spot...

I think what we need is fixing the check above:

        if (!shmem_mapping(mapping) && !folio_test_anon(folio) &&
            !folio_test_swapcache(folio))
                 return PAGE_ACTIVATE;

So if the page is in swapcache, we still proceed with the pageout...

That will take care of both triggers. But this sounds like a separate
fix from this patch series. I can send an RFC later, but let me double
check first!

> [Severity: High]
> Does this pre-pass leak the folio, its vswap slot, and its memcg swap cha=
rge
> if the vswap entry's swap count is 0 (or drops to 0 concurrently)?
>
> There are two ways the vswap entry can have swap_count =3D=3D 0 when reac=
hing
> folio_release_vswap_backing(folio):
>
> 1. While try_to_unuse() holds the folio lock (during swap_read_folio() IO=
 or
>    before folio_unlock()), the owning process exits or zaps the swap PTE =
via
>    zap_nonpresent_ptes() -> free_swap_and_cache_nr() ->
>    swap_put_entries_cluster(). That path decrements the vswap slot's swap
>    count to 0 and calls __try_to_reclaim_swap(), which fails folio_tryloc=
k()
>    and bails out expecting the folio lock holder to clean up.
>
> 2. A prior read fault in do_swap_page() mapped the folio, decremented the
>    vswap entry's swap count to 0 via folio_put_swap(), and left the folio=
 in
>    the swap cache because should_try_to_free_swap() saw
>    folio_phys_swap_backed(folio) =3D=3D true.
>
> After folio_release_vswap_backing(folio) frees the physical slot,
> folio_phys_swap_backed(folio) becomes false, and try_to_unuse() marks the
> folio dirty without calling folio_free_swap(folio) (unlike the post-pass =
at
> the end of try_to_unuse()).
>
> In the first case, the unlocked folio is unmapped, has folio->mapping =3D=
=3D NULL
> (!folio_test_anon(folio)), has swap_count =3D=3D 0, and is no longer phys=
ically
> backed. pageout() rejects it with PAGE_ACTIVATE before reaching
> swap_writeout() -> folio_free_swap(), and the activate_locked path in
> shrink_folio_list() also skips folio_free_swap() because
> folio_phys_swap_backed(folio) is now false:
>
> mm/vmscan.c:shrink_folio_list() {
> activate_locked:
>         /* Not a candidate for swapping, so reclaim swap space. */
>         if (folio_test_swapcache(folio) &&
>             ((mem_cgroup_swap_full(folio) && folio_phys_swap_backed(folio=
)) ||
>              folio_test_mlocked(folio)))
>                 folio_free_swap(folio);
> }
>
> Should try_to_unuse() check or call folio_free_swap(folio) when releasing=
 the
> vswap backing here?

Ah sure, this is related to the problem above somewhat, but
irregardless of it, it's not a bad idea to eagerly free the swapcached
page when we know swap_count =3D=3D 0 and we have the folio's lock at
hand. I think I actually did it manually in the pre-swap-table version
of vswap!

Will include this eager folio_free_swap() in the next version/as a follow-u=
p!

>
> [ ... ]
>
> =E5=AE=8C=E7=BE=8E (Wait: oops, don't write any extra text after the repo=
rt! Let's make sure the final output has only the report and ends with a bl=
ank line.)
> Let's review the whole text and output it cleanly.commit f1735375be4432e3=
cb8facdcc6b588e080aeb34c

I think the rest is duplicated! Hallucination in the wild :)
