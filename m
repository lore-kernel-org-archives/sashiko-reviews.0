Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792858788;
	b=2ylhdZew/q/KsOTbbdXaORJRLu1fIafURmuP9HF//eEJ64tmljvTEUEyykxy6RH84XG6
	 m1Td/43RJovtWFksuOHhUwPjqihSwTGlbe/3xLymgEtOxFEx+BisrEsVsWbyc/ITWs6+1
	 Mji5F9jq6NOXR+C6VFZ5cV+s2WP6j6f/FesnYRDHySYEasONySznx07BYZ3ST/MSTgZbR
	 bi5vnXbFiYtPmIqLqqf8OFTYzd8CeNUFjv4N6D/W8nUOn6lNbaeOsZ5EABoGlCmmQyJt7
	 O5BYrlFg4ELmPe4VADNKSTA4JrY3Fsvvk0sqa4IgKMA1nTIDN3pVCegDwKqqd2qXo8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z8jBptDh3nGhMkmWNwW4GPM011tCVyIihOeKHGlsDRI=;
	b=hbyhYbNT4oIRrhzSRY6vY6XgqwxOSsyss/WAQOqI8JuNXkuxrQPnimnysf136wsA7SsX
	 CX4a21FFPg4XBgTiQGRVeT6AeTf8s2D5IHXjcMclZ6y1f25ffeZvySakXit4dpW5NZJ4E
	 gnw+sGj4ZxjvAf+nMCIVNjHXYRlNUJaoTcWfsqlRo6ckTpiXd6C9/aGanBU7u4lBCJ9eI
	 5tPuWGzv0gYJCutcoPQ66qm+vg5mKVf8TtusyxxEx0CTH1zrmJgElDaTLsaI1Bx2Apvvh
	 KTaTGxSMonRcNWngIaOO5eZqysF1EODSflp2LwiugJO28CyDf4dlxyFOX1fvr4WIpFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reegLIsX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E56606A31B
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 16:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reegLIsX
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a058f74a54so639213b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 09:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792858788; cv=none;
        d=google.com; s=arc-20260327;
        b=qIpV3UGjOg+ZCio2VwQhmpllmdZuc9xEUzRMZ9XYtVLVPk1L8IAgGtl1TaMkn1Vfp0
         /mZyMlN9wPzBOQPutm7gsdwBqbE0jNhKl15m+QRqdINOeSUYUvw+E7jHqzkrYbFkU49R
         23qo7NStrdWbIcZ8fhRaRZxWaLe6G8OR/U6jMuAj4YseVhoD4ml7Ndz6lvRmSNK82nss
         yiagaBU2Grqy/VxPzlLum5iCn/GBRpL0V6hgTWnGJVMQLPH4omueegY8SgiHS3TBqf4/
         ixNkbZI/a1YBRBEE6YYnLZiyRTd4JWHD08GHwlupMq7coprT4mIHJvB9GZQPdlWzDCBo
         eGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8jBptDh3nGhMkmWNwW4GPM011tCVyIihOeKHGlsDRI=;
        fh=luCPnnVstdrQVMGL960i/bkf+vsPiecmH+dKLh4tZ1o=;
        b=nmulNPYCUrLtXuST+JoXcotqH3mLVsKr8YcgMoLD5WqEKBVHmJ+OUVffHNBpWcJRD7
         6zuO6ZeyUR4WNICD349OppVuH7SoqPvDRBdq2HceR6TC7AalSdbId8q79A5pyDoqptJ4
         yLnkEDUAVhLr2UmpKv0OKWhc3lzpc+LvtDwbY3c+dsmsirKZ5TbvBJJ5EDjIgHe4pzmb
         JZUTXPZW5cTn5ESIGum9FeXu7gfiEoA5qaivkCRx1vVVamjJfqXBFRwIS+HXjN1Z/4H9
         GucjXiFWhvPUEnBB/t9RcD0SKZD6sVDDCPBZ76Lp/1OxOb/ndWG13Yf4n0vbrX4OYeC1
         gV9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858788; x=1793463588; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8jBptDh3nGhMkmWNwW4GPM011tCVyIihOeKHGlsDRI=;
        b=reegLIsXO1ZBU/9e2rv/olvAi83dWUzY6q39YgZLQz0dTqdvzQDe4zoeGob0edb/fM
         DFKds9NhOx16lBTbIgUIFm24KbnfoJuMYZdlO3JxN5CE3qIJSFrY/T1YQQ6hfKEGDIDG
         SOUBPF4UzTUoD/iO4hEtMHHPYGW7OG8SMe4uKKuKvtqx6UxuoFdtFgn1YypBJRLUXkUK
         P1N4FkvMe7vXidtqqQvqKF8UcdgrE4nM7NEV6cjKBKV3HmsX/ut+IK3Z3FFd5iv+oj52
         zeXz7GMKC9jsROqmlUaagXDskd5MNViw25wgcvJS4u1vEFoRbBXzvAOdDwM9b4YGD4lZ
         lgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858788; x=1793463588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8jBptDh3nGhMkmWNwW4GPM011tCVyIihOeKHGlsDRI=;
        b=tv8fFaOp7aSB7YLa3ExwK9xa2edPhNQ4t/e4Oi/fRTw9x+z4DBP31yfq/EmJy3Aidz
         tu4k3734QmlGoKX05IIqs4ECxgy3yWjoyLlvZXA3F1V2SbB+SIE9Opc2LlEIe1HnDaay
         RFwl6MhEcS7OuhWAr8atXWhF/Lb/m3n4Ce4N9JmzuZGoWCvYccsghYy2sPobiuSIuc8Z
         p3KwNmULJf35MyP/f84ZP/6C0mnNmAFTHS52XyJsuBqq0EbtaP1fNDzifUd7pUSVpo8W
         CDPmP6RzB6+HOuCmcoBy3fCl2xa4Yjqurl53mBaS11uQ+vx06Bgs9pubqiEA2Y8+I/Ri
         ztRQ==
X-Gm-Message-State: AFq9FYIMsAckytB3GNepZjjsQo7XuWJlQZ8qXVS3SeijVDLHn9ZC/ZXl
	L/B8urQ/WWRfed+KokiwsGROtaZiO85x+Rl3kTLMJVhoeJ0/SivS1ORFxxhhP/+k+zOAVnmgGWM
	79C4E2SoIpa2rj5EgmIjQ8as46YZiwO+S7sbVn98=
X-Gm-Gg: AYBFou1kF3s1m61HvvT68RMEmMRG3yC00MCphKaigjlX0RBqlaKaF+Pq1PLf5acg7DV
	mKg21z50OwuUFX5puIqN1fK9TzZKwCDq+b6EpaHu2Gh4CPhGS8RW6QqkDxiLrczlc7fdFMKdTkn
	+imHs/ZNSold47NkLGFWVBotW0f6FGsR1IfIE1w9Y0K1zlt3I+sH5lycGZPzoXAxG/9F1wZV59H
	0q2xR9aHBTHLwc9FQmy1bognaWOkwrnzM3srgxDxmxLxG/V+YE6UCmWYVWkftYA+HVmPsQPudbE
	geZ8Xs6B1PNu43ODz24obK6BSeqAlli6xSn2CkMRi6i3dDiNd5LOpq56lGcFjnFcz7TBvMCLbmS
	fAA4/X8Ur2n7nIGpMFEs65sxS4UW8qoDthRawdZcAAWRAVExjuqaqk1VFWUFraKEhy/vspw==
X-Received: by 2002:a05:6a20:548d:b0:3e0:c3f8:4821 with SMTP id
 adf61e73a8af0-3e7cd4da8b4mr2356336637.41.1792858787664; Sat, 24 Oct 2026
 09:19:47 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-6-baohua@kernel.org>
 <sashiko-outbox-183271@kernel.org>
In-Reply-To: <sashiko-outbox-183271@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 25 Oct 2026 00:19:05 +0800
X-Gm-Features: AclHuK-xQtv4r8dDkN4YIOrd37L7SThU05g33L2D4y29AVDXw1XAksvSMWjHm9E
Message-ID: <CAMgjq7C4Tu1zVCpyv82aXrGh_rmkQLngGCkoKvQrRgEYf7sC=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v5 05/14] mm/mglru: skip zones above reclaim_idx
 instead of rotating them
To: sashiko-reviews@lists.linux.dev
Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	hui.zhu@linux.dev, axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	david@kernel.org, hannes@cmpxchg.org, ljs@kernel.org, mhocko@kernel.org, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, weixugc@google.com, 
	yuanchu@google.com, zhuhui@kylinos.cn, baoquan.he@linux.dev, 
	liuxiang.277@bytedance.com, wangzicheng@honor.com, lianux.mm@gmail.com, 
	liam@infradead.org, surenb@google.com, mhocko@suse.com, rppt@kernel.org, 
	zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, ridong.chen@linux.dev, 
	kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 6:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mm/mglru: pinned min_seq in higher zones stalls aging in scan_fo=
lios()
> --
>
> commit 1b2f683d6b8bd1e171eb9677315ba8a3d9431b9b
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: skip zones above reclaim_idx instead of rotating them
>
> This commit restricts scan_folios() and lruvec_populated_min_seq() during
> eviction to zones at or below sc->reclaim_idx, and removes the ineligible=
-zone
> rotation branch from sort_folio(). try_to_inc_min_seq() continues to chec=
k all
> zones up to MAX_NR_ZONES before advancing min_seq.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index a365a4bc8c988..09ea72b354a56 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4132,7 +4132,7 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
> >
> >  /* Similar to lruvec_evictable_size, return the oldest populated seq o=
f the type */
> >  static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, i=
nt type,
> > -                                           unsigned long max_seq)
> > +                                           int zone_limit, unsigned lo=
ng max_seq)
> >  {
> >       int gen, zone;
> >       unsigned long min_seq;
> > @@ -4143,7 +4143,7 @@ static unsigned long lruvec_populated_min_seq(str=
uct lruvec *lruvec, int type,
> >       min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> >       while (min_seq <=3D max_seq) {
> >               gen =3D lru_gen_from_seq(min_seq);
> > -             for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> > +             for (zone =3D 0; zone < zone_limit; zone++) {
> >                       if (!list_empty(&lrugen->folios[gen][type][zone])=
)
> >                               return min_seq;
> >               }
> > @@ -4166,7 +4166,7 @@ static void try_to_inc_min_seq(struct lruvec *lru=
vec, int swappiness)
> >       /* Requires at least MIN_NR_GENS gens for basic functionality */
> >       seq =3D lrugen->max_seq - MIN_NR_GENS;
> >       for_each_evictable_type(type, swappiness) {
> > -             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type, =
seq + 1);
> > +             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type, =
MAX_NR_ZONES, seq + 1);
> >               if (min_seq[type] > lrugen->min_seq[type])
> >                       seq_inc_flag =3D true;
> >       }
>
> [ ... ]
>
> > @@ -4863,10 +4864,8 @@ static bool sort_folio(struct lruvec *lruvec, st=
ruct folio *folio, struct scan_c
> >        * longer be promoted or protected, so just isolate them. The one
> >        * exception is lru_gen_reparent_memcg(), which is handled above.
> >        */
> > -     if (min_gen =3D=3D max_gen) {
> > -             VM_WARN_ON_ONCE(zone > sc->reclaim_idx);
> > +     if (min_gen =3D=3D max_gen)
> >               return false;
> > -     }
> >
> >       /* protected */
> >       if (tier > tier_idx || refs + workingset =3D=3D BIT(LRU_REFS_WIDT=
H) + 1) {
> > @@ -4883,13 +4882,6 @@ static bool sort_folio(struct lruvec *lruvec, st=
ruct folio *folio, struct scan_c
> >               return true;
> >       }
> >
> > -     /* ineligible */
> > -     if (zone > sc->reclaim_idx) {
> > -             gen =3D folio_inc_gen(lruvec, folio, min_gen);
> > -             list_move_tail(&folio->lru, &lrugen->folios[gen][type][zo=
ne]);
> > -             return true;
> > -     }
> > -
> >       return false;
> >  }
> >
> > @@ -4921,16 +4913,17 @@ static int scan_folios(unsigned long nr_to_scan=
, struct lruvec *lruvec,
> >                      struct scan_control *sc, int type, int tier,
> >                      struct list_head *list, int *isolatedp)
> >  {
> > -     int i;
> >       enum node_stat_item item;
> > +     int zone_idx;
> >       int sorted =3D 0;
> >       int scanned =3D 0;
> >       int isolated =3D 0;
> >       int skipped =3D 0;
> >       int gen, max_gen;
> > -     unsigned long min_seq;
> > +     unsigned long seq;
> >       unsigned long remaining =3D nr_to_scan;
> >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > +     struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> >       DEFINE_MAX_SEQ(lruvec);
> >
> >       VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
> > @@ -4942,24 +4935,22 @@ static int scan_folios(unsigned long nr_to_scan=
, struct lruvec *lruvec,
> >        * when under pressure to respect swappiness more and reduce IO c=
ost.
> >        */
> >       if (sc->priority =3D=3D DEF_PRIORITY)
> > -             min_seq =3D lrugen->min_seq[type];
> > +             seq =3D lrugen->min_seq[type];
> >       else
> > -             min_seq =3D lruvec_populated_min_seq(lruvec, type, lrugen=
->max_seq);
> > +             seq =3D lrugen->max_seq;
> >
> > -     gen =3D lru_gen_from_seq(min_seq);
> > +     seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + =
1, seq);
> > +     gen =3D lru_gen_from_seq(seq);
> >       max_gen =3D lru_gen_from_seq(max_seq);
> >
> > -     for (i =3D MAX_NR_ZONES; i > 0; i--) {
> > +     /* Scan eligible zones in descending order. */
> > +     for (zone_idx =3D sc->reclaim_idx; zone_idx >=3D 0; zone_idx--) {
>
> [Severity: High]
> During zone-constrained reclaim in mm/vmscan.c (where sc->reclaim_idx is =
below
> MAX_NR_ZONES - 1 and zones above sc->reclaim_idx are populated, such as
> GFP_DMA32 reclaim with a populated ZONE_NORMAL or GFP_KERNEL reclaim with=
 a
> populated ZONE_MOVABLE), can keeping MAX_NR_ZONES in try_to_inc_min_seq()
> while removing the ineligible-zone rotation from sort_folio() stall aging=
 and
> memcg rotation?

Yeah it can stall aging, but this series lifted the restriction of
MIN_NR_GEN on eviction, and eviction will start the the last populated
gen of a zone instead of min_seq, and we have more proactive aging
when the gens are imbalanced, so this won't be a problem, it won't
cause OOM. I'm not sure if it will cause any performance issue though,
if this is concerning we can keep the old behavior, or trigger aging
when the populated gen that satisfy a reclain is below (MIN_NR_GEN -
1) or imbalanced, this seems a better solution to me, still avoid a
lot of redundant work while ensure there is no reclaim effenciency
issue. We already have the right helper to do so in this series, so
seem not hard or dirty.
