Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792859104;
	b=cAHIyJcTHdMlrTmTPgIk/bXtM5rEwKn6AcSb5zrfkPcnJN7hvz9b4VqLlR7whvJPTj6L
	 +IpILO0dqyrmRZzwbulArKJ4t3j9pMfZD/Zlv6enbR/LAeD/Jee77AMhLrdeDDs/uvuds
	 swj4sNOzMkmXfAaS4tOYLoILa3J/nfrcJMuuyLG43QbGWeE7yqNPvLIRPQAiUBaMaxLhx
	 ZmTtlH8hkfhmhmthdiGSu24Xb3x4W3MVsZeKehG5W8lATfbjTDl3uKt92+mH9xjxj8jaK
	 wBEFJk9zG7tHr4PFYUym/keXDfxVQVyPI7UFXklux1kZLZ2T3qQRLT6YL+xgjPxYDDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792859104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ta6b9kStTlqhcUIrK0rj2jJZhUFfSCgXPRCGwSKRipw=;
	b=Fknqva9rWJTPrmyqofNQMzDpmiRRN0xwAu9nf6i0DBx1MqU/oKRiOjUzgo6B2QIeH/FY
	 EV34nDEaVRfKOR0WyL2YltartQgkz4PTa1ApUNJlEnK9zXSby2pHcT6+PwQVHlcFp10A+
	 baFd+T4kMuhjiYzUCHe2bY+AyVHHHipq7fDSjLkY0bzK0QdcqFwhWFNSnrw8fqnj9X9Wc
	 DaIfzol+xHldEguH9pLOP35E8AYAFN04jqOU32ysb4ZcNCR3Ot1LKaCMmLi+6SlgFIHcK
	 osYO/P9aYDXygkInvhZ8AtyY+XkJWM5Fcj1hTPo/AJ9JaZkL//aJ1M5DfhUf7OZ+rAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TsWZYL1F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3ED606A31A
	for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 16:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TsWZYL1F
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2055573c8cso221761466b.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 24 Oct 2026 09:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792859102; cv=none;
        d=google.com; s=arc-20260327;
        b=U/c4MRxrGEsKBWBshthLss3mmXvtEWL9o5dkd63jAOXSFZh+IEnD8EF+JjMF00Bt2v
         MSfwM1coO6ByCU0vfb9CEw0nOrdnCCOYHD10geUtsgWwHpC/EiLJZAlgo5M9FSDUX7t5
         qRsTkY+6j1KsOwWYq8ix4TtPFZK/M2HlKgGcnDYNvKzuWUxANSf3pc5xHFvlsYxr+2i/
         PjoNGRcRESy/1EhhkalC/j8mP4rBP3XzUPMoLqbVblfvQIBEU+1g2HU8ep+F/yqQo4di
         EHe9jhuGhV/blT1cR3iCPrnw5baDJq5JlmfsnO+W1abkTeGrsCz1/vnOsfYGe0ncOQNm
         QIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ta6b9kStTlqhcUIrK0rj2jJZhUFfSCgXPRCGwSKRipw=;
        fh=luCPnnVstdrQVMGL960i/bkf+vsPiecmH+dKLh4tZ1o=;
        b=kAmAI69PT4o9x+tELIjraLavC/9bpjFq0ICYS2llVOqJuc9H4xCvveym+u5smRJqCP
         Ibl/ZKxkRHRn7fCFHxFbX8ULCZafp8zq0V4kC7Y5k6js2hAyLQJIGo8yu/sfuxwaYGHq
         ja0A42OjIu0ePnT031EZG8RThOIxyrpqh1k88X2GUfrJsBc5R8VHb6XQsUm41S0uofkX
         mJHWuZMl31HEWfsIhpcDdaMuLGsGyETe/fx1BbcF9WvzQ2tdm2gqi2ZCur4SJBOiKCX5
         7hPLlOlz36OqRnX9+Bdh6uFMWTPVMmosJ0zchkzqX1Pn8JjecSHxO8Ic2M7IW4YWyU/7
         PA3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792859102; x=1793463902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ta6b9kStTlqhcUIrK0rj2jJZhUFfSCgXPRCGwSKRipw=;
        b=TsWZYL1FB9N83iL6J+BVTZhtjc3moSAE5eWig2+d8vkE9ACtkDpzOcXait3zDgkyTE
         pgVaG7atcnoEuMHf0SqZupw2w0mjFCunfq7bh2UH5jRvZkJTUi5r5VSjy3032sSGo+Ag
         SUWyqlVRWF6FTlwBC4BT5XC0mTpQwq/Qniq48qu5EkR5lhcCMXsOQLHan7B03U8Nuldh
         yFAp8ynFpUUVM4fVUwvFNYwI7YLOh2YvHqeThXjy38A0NnSLRm4e5/iSsHGh3uR1B+mJ
         J70IpJ8Ek0xuUF7Y/a0r5bECkza1bl65pV+UKqeQU5zmN9wuM/U6+s6XfgG9uYtnpu7v
         uKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792859102; x=1793463902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta6b9kStTlqhcUIrK0rj2jJZhUFfSCgXPRCGwSKRipw=;
        b=X9OP4INGlVOnVY5y8GYQKtYfYaIxmOu43Kxaib2lrg06jmzlvfICm3E7Lc4icIIZFS
         zwyLmcTip+1sP4pvQ3VLBWSyIpU6jFAOe09Aw/OjSM1MF34Ip6Vq6+FZ2yUQUrgK6VLp
         ztEmaVtC2GkUv/ExRQolWh4IzDTn2GFGHgpCrz9PLCV3NRxmeJM3aSaZhXeLmyAFd5lx
         d8POnID6uH76Dh5KAGNw4t2Fn7lF5HRTRaRUQ/Mx/NAr2b4zxFNW05vIwtqV3k5fwKQM
         59mpG1sDn6SDCZcNzbiKmW/5Z5XEAEif4mgZiqM7VKMuYvLh2MH12G4lV3Q7EZuC12Z0
         zCJw==
X-Gm-Message-State: AFq9FYLmR7qR8o9Gr7y7OF1dIWOwlMGf8g7ocShu84KLd/7/1F9Pkxyl
	5DOIsIdvlAFEVEYuTd+DNlSNxAqcyPC4K9uqxmETBYzYDjGMFjIIn729v+Bi3tugm3PH3yrDdIG
	7gc3T336ogbJXgx0QDgs68aKUwAFF19CpyF3FULc=
X-Gm-Gg: AYBFou3WYX4CeVPtoZjRqxincqMPfj0Yaxn7QXDGyZPfrJDVXKOjpIamW4DUZNbyXuS
	2l2RBRI15SHoGdwQy8+qxu9J8qkj1oiLypD+zL/JyxM5/AfM35XL1cXT91+4jURMoUqWsr6m4XN
	ll6RU76cfPLZnd6ucdq+cZu8RNCFiNzQjynOGLQ7SyJCovyh8ujvVcEUEp+u4WTYysNtXl15fgW
	e9/v1ZCKJnltMVb8DyDMTLyjRc7Pj5iwP2YedWPtivBaNVJ05L0T6TqykdPcVYmec2+ZEdR82jg
	dekS+TgX5yJ8xpW1QxZ4fB3UXY1kZ5f+0i4ENwcvUvtawoc9LH7zKaTshH9S6QN5HZi6wvJa+J0
	w0KwwIRLO1iijrA5Eb5iNPtqAHDdW3mWVG8jTFIkK7T01Q+oCVVzuB6h++KlyBQoUMdyQ/w==
X-Received: by 2002:a17:907:930d:b0:c41:8736:8c38 with SMTP id
 a640c23a62f3a-c46bde59590mr245827766b.30.1792859101720; Sat, 24 Oct 2026
 09:25:01 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-8-baohua@kernel.org>
 <sashiko-outbox-183273@kernel.org>
In-Reply-To: <sashiko-outbox-183273@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sun, 25 Oct 2026 00:24:25 +0800
X-Gm-Features: AclHuK8XZLGPPGEKrhXrigZfLOFmwwSSuwTBiqIswh8wTsjxAPb2yu1VJB7vo4k
Message-ID: <CAMgjq7AZF4R8voNhsbj5Ede7NR19k1tkAMGnn7556ydB2ERX5A@mail.gmail.com>
Subject: Re: [RFC PATCH v5 07/14] mm/mglru: balance anon and file scan budget
 by refault rate
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
> - [Medium] mm/mglru: lru_gen_balance_scan() budgets un-scannable gens and=
 zones
> --
>
> commit ce196f9c0d172466d44f73b512ed408a9ecb6e36
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: balance anon and file scan budget by refault rate
>
> This commit replaces get_type_to_scan() and isolate_folios() with
> lru_gen_balance_scan() and evict_folio_lists() to split the scan budget
> proportionally between anon and file LRUs based on per-type refault rates
> and LRU sizes.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index cc20ba8c6cf2c..fed39b0422e01 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -5019,79 +5019,110 @@ static int get_tier_idx(struct lruvec *lruvec,=
 int type)
>
> [ ... ]
>
> > +static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness=
,
> > +             unsigned long total_scan, unsigned long nr[])
> >  {
>
> [ ... ]
>
> > -     /*
> > -      * We are running out of the current reclaim type. Fall back to
> > -      * the other type if allowed.
> > +      * The more extreme the swappiness, the wider the IO cost gap bet=
ween
> > +      * anon and file, so the split should follow the IO cost ratio ra=
ther
> > +      * than the sizes. With a mild swappiness, balance the scan by th=
e
> > +      * actual LRU size more.
> >        */
> > -     if (!scanned && !tried && type_fallback_allowed) {
> > -             type =3D !type;
> > -             tried =3D true;
> > -             type_fallback_allowed =3D false;
> > -             goto retry;
> > -     }
> > +     size_bias =3D max(1, min(swappiness, MAX_SWAPPINESS - swappiness)=
);
> > +     anon_weight =3D nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
> > +     file_weight =3D nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
> > +
> > +     anon_factor =3D (u64)swappiness * refault_rate[LRU_GEN_FILE] * an=
on_weight;
> > +     file_factor =3D (u64)(MAX_SWAPPINESS - swappiness) * refault_rate=
[LRU_GEN_ANON] * file_weight;
> > +
> > +     /* Cross-multiply the ratio above. */
> > +     anon_scan =3D mul_u64_u64_div_u64(total_scan, anon_factor, anon_f=
actor + file_factor);
> > +     file_scan =3D (u64)total_scan - anon_scan;
> > +
> >       /*
> > -      * We scanned some folios but failed to isolate any due to promot=
ions,
> > -      * protections, or races. Retry once to avoid a larger loop.
> > +      * Bound each type by its evictable size. Hand the exceeding part=
 to
> > +      * the other type. Any excess left when total_scan exceeds both s=
izes
> > +      * is dropped, since it only stresses the scanner with no gain.
> >        */
> > -     if (scanned && !tried) {
> > -             tried =3D true;
> > -             goto retry;
> > -     }
> > -
> > -     return total_scanned;
> > +     if (anon_scan > nr[LRU_GEN_ANON])
> > +             file_scan +=3D anon_scan - nr[LRU_GEN_ANON];
> > +     if (file_scan > nr[LRU_GEN_FILE])
> > +             anon_scan +=3D file_scan - nr[LRU_GEN_FILE];
> > +     nr[LRU_GEN_ANON] =3D min_t(u64, anon_scan, nr[LRU_GEN_ANON]);
> > +     nr[LRU_GEN_FILE] =3D min_t(u64, file_scan, nr[LRU_GEN_FILE]);
> >  }
>
> [ ... ]
>
> > @@ -5212,22 +5244,22 @@ static bool should_run_aging(struct lruvec *lru=
vec, unsigned long max_seq,
> >       return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=
=3D max_seq;
> >  }
> >
> > -static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control =
*sc,
> > -                        struct mem_cgroup *memcg, int swappiness)
> > +static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_co=
ntrol *sc,
> > +                              struct mem_cgroup *memcg, int swappiness=
,
> > +                              unsigned long nr_to_scan[])
> >  {
> > -     unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
> > +     unsigned long total;
> >
> > -     lruvec_evictable_size(lruvec, swappiness, sizes);
> > -     evictable =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
> > +     lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> > +     total =3D nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
> >
> > -     /* try to scrape all its memory if this memcg was deleted */
> > +     /* Just scrape all pages calculated above if this memcg was delet=
ed */
> >       if (!mem_cgroup_online(memcg))
> > -             return evictable;
> > -
> > -     nr_to_scan =3D apply_proportional_protection(memcg, sc, evictable=
);
> > -     nr_to_scan >>=3D sc->priority;
> > +             return;
> >
> > -     return nr_to_scan;
> > +     total =3D apply_proportional_protection(memcg, sc, total);
> > +     total >>=3D sc->priority;
> > +     lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
> >  }
> >
> >  static bool should_abort_scan(struct lruvec *lruvec, struct scan_contr=
ol *sc)
> > @@ -5260,6 +5292,30 @@ static bool should_abort_scan(struct lruvec *lru=
vec, struct scan_control *sc)
> >       return true;
> >  }
> >
> > +static long evict_folio_lists(unsigned long nr_to_scan[], struct lruve=
c *lruvec,
> > +                          struct scan_control *sc, int swappiness, uns=
igned long max_batch)
> > +{
> > +     int type;
> > +     unsigned long batch, scanned, total_scanned =3D 0;
> > +
> > +     /*
> > +      * Scan both types with the given budgets; the caller checks if
> > +      * reclaim is satisfied after each pass.
> > +      */
> > +     for (type =3D LRU_GEN_FILE; type >=3D LRU_GEN_ANON; type--) {
> > +             if (!nr_to_scan[type])
> > +                     continue;
> > +
> > +             batch =3D min(nr_to_scan[type], max_batch);
> > +             scanned =3D evict_folios(batch, lruvec, sc, type, swappin=
ess);
> > +
> > +             nr_to_scan[type] -=3D min(nr_to_scan[type], scanned);
> > +             total_scanned +=3D scanned;
> > +     }
> > +
> > +     return total_scanned;
> > +}
>
> [ ... ]
>
> > @@ -5948,8 +6001,11 @@ static int run_eviction(struct lruvec *lruvec, u=
nsigned long seq, struct scan_co
> >               if (sc->nr_reclaimed >=3D nr_to_reclaim)
> >                       return 0;
> >
> > -             nr_batch =3D min(nr_to_reclaim - sc->nr_reclaimed, MAX_LR=
U_BATCH);
> > -             if (!evict_folios(nr_batch, lruvec, sc, swappiness))
> > +             lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> > +             lru_gen_balance_scan(lruvec, swappiness,
> > +                                  nr_to_reclaim - sc->nr_reclaimed, nr=
_to_scan);
> > +
> > +             if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness=
, MAX_LRU_BATCH))
> >                       return 0;
> >
> >               cond_resched();
>
> [Severity: Medium]
> Can budgeting with lruvec_evictable_size() in lru_gen_balance_scan() caus=
e
> lost scan budget and premature reclaim termination in try_to_shrink_lruve=
c()
> and run_eviction() when one type has no folios in scannable generations o=
r
> eligible zones?

At the moment it's like part of the design, prioiry will raise and in
the end we will have no scannable generation limit, zone might worth
be considered when getting the evictable size though?

Also, maybe we can improve the aging on imbalance to trigger when the
scan budget is much larger than the scannable size (and priority is
raised beyound default)?
