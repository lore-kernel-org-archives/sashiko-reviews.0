Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480408;
	b=jbLJavmWyiLD4iPv22ZH+m6T6OIqCArVNyIAvcc6kw7x6XfgalBLMhcdrsWKUidSNava
	 En7rLzysSbtFVcOJz5eHUexe4ltFqohzbqxO57vbDmrjyNivNKnj+Tav/m8eqa0hXW+BJ
	 63G6ezDwP83OVQv9hESu0uySEwQV5jYSqc0761Z7OOLYDKYfjLYx7vNBBwTtqPdDmPhY8
	 S592SS1WD8aYtNZBQJIuMz9pCo3a5RO5yBPyqGGMdZQHc7x0KqPZfsFOXW4fESYmUrVop
	 iCEa8JjB9SyN36pSdBzYIKtYQVTRdXd0ttNLUakvBJpefuTHKXoFT/LoO1zKnsheI3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8QBtBT+o3rO37DxnYZQOL08ixkrSHvdpIDT59FAHrq8=;
	b=VYg3w+7i0uFSJD802Xo1ZPZBdoIrkfROewvA8TibCAw4TJ1pHGYjndGjnI50tpnLsTi2
	 LrSsS5KBHKw3YFcPXLVa+aRo/v+AkrwpsG5/uzM0lA5KZVRvIl6qBRL5BB8AmNn2V081h
	 6PXOA9dzeOSZSEiidx3RmmzJL6c3u6P0GJJViowgZJoseM6CyX1rFi4d9neScsWPtJEg7
	 1lUw2LH1tWbRJ4+FdEJqmfWarks+iE/3ugkfImOFrGbZybNcn6aTmvapASVNGLtn/C3aA
	 RojUx5HGqyoid/DZtWwUBQyjPnhZC/zAoZEPDjLXjxN72NzuSHhK6CjyQxPQVwFr+rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5+Jl30R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229B606A327
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D229B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5+Jl30R
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4910969a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 02:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794480406; cv=none;
        d=google.com; s=arc-20260327;
        b=Pn94SXgw6ncHUVirTmbL8oIrk3ueN2bbQwgnx4r5ZtpnEnEa2oI9SOYKFL9SkMLa7N
         4MLcnU40W7bG3qVlexEpJjqwuUqFY5aIr62tVVb/u3yXA9DN3nd/R97GQN07N0+H0ecv
         Y0Ty+5IOw9iv0A5EDbOEcjAK9nDK3pKPbwwjMKfjDawT0VD+ozYgWRIWXBNEKCrYlqXL
         T92zAmnaRNQNyk2bWLSYjNFPJ47rrzGwcDTiGSbYbFtKj84duACItTQZ0d34p37CBVK0
         OutbVInP1HB3SAJtI/yOY1/L3I3JMPOOeoZztoHHVH9iA9/O5dnu7O6PUzkzovuR7S4S
         GQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8QBtBT+o3rO37DxnYZQOL08ixkrSHvdpIDT59FAHrq8=;
        fh=bh+gmG2XZVpK1uS2JOADFj+pFZc+GUfh4IMBtFqTcIo=;
        b=Pa0KVZZmHvw/aiEKjPMOcJEAaa3dgzuisxb/FIy3dguBGtxY9uiXGWrOVzkzqt4RF3
         Y4DqlysHMEkC2SQvN70gIjeyzJTEgJPkfZa504Gj7zDyaah/7R3uMQog4FjYD6suOUJw
         3xX0pr6HstfTyaEKW01yhkkfA8Dwa+tepwv/VCA3ttKBY26665oJa1p8I7hc4Fa6XWZE
         HqBkFR5IZoL2nTzVb7lTuqt+b9bbsN1C4DGBUQpL0Upbd4ccZO7ZD9GfUlZAIeSFLE2h
         bFXbmMeCZupAaSFXc0Yk4+cD/r4WkTusvxCkfiXu7LDsU7QviQc9GC17P1uLRinEspGx
         N+pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480406; x=1795085206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8QBtBT+o3rO37DxnYZQOL08ixkrSHvdpIDT59FAHrq8=;
        b=g5+Jl30RqRdlDSBR0+6F8SaDIzX4zVikScnY6qBKwRLSLeMQLDcifsQ3lF4k+thOza
         PtM39jddPUUzoeXZVH3vIU+qXQuyz/otoIw5srYauh1C+d0zkRUn6gCPw0vel4h1bE9c
         NZs2NeTrH/iaEIplLxWa1+7iFOmZUiqv2Zan4iVFV6UZQmdWW1Fx5Fei/EDom96j4bgk
         HO+8DbbI2eGfVfz7Doc7OMQohlriAEH0vhF0xclZM2dcs/96Invp+LfGvriu7maxlWua
         YQF0BVvUlVK2Ecz8QoVycCSilNEQR7vCigRgvGiUuoWy4kPrQ/bygQi0647C+TNrdN3h
         mRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480406; x=1795085206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QBtBT+o3rO37DxnYZQOL08ixkrSHvdpIDT59FAHrq8=;
        b=hCXMRZlB4DDPgEG1U4H0+wbUHfIQ0OmCmj37LHXFD8z1NpQcF2802iVUBEkPSykZXy
         z3wCQBt2sM8YFPobaakjwmz4QuTfCbxBOOOl6YN+IoQodhDSVGi+68Wy4A2nPlikP2aq
         pfHji2pqCl9OtJvV1hVVskqsjl1AiBzFWxugH2GcasQJSIoCXXrNgD1nX/bOheygJMOg
         Wj2KUQe4ZHcWwWmpVgNRQcW/mX139bMr3nU2q++NFmlGOC4uMnlD/6mkjYOwFiLZ8Oqt
         smyRkpxaq+lLDuNMz8rORhErIHpLP0DNGFE/ARYxy0fNYZVT5+s9SxlLYEDSzmEOKf9B
         CKoQ==
X-Gm-Message-State: APuU4Z9sC2cAj8imzlnbNMizmO+Y/NLii+200tI2UbyD7gwgCsNWPrKi
	aS9ZkvW12K9l6mDUjpPMcZFTcdWxWFOQnnR9sbZ11pkB74nHvpLEml0GJWIgF3jsaq4f/37YFXT
	IEMHaCBn0oZftXTZ/WJN3xYgVoThuf4M=
X-Gm-Gg: AYBFou1uBM3rQkw83thGdxOjGMJH5DqwE2bCZBDMf28X97Cte4exfPPa5hRCBw3toam
	BaLOqNGYlaRi3vKDlkt+ThkYVuR4Hg4tLY4yjV0mym/itJmMBZFgg7mr+ELRz5v4gVtBF0iBLbQ
	tcCBFdh851ODETT3sTdvu0FstyoiR1BFyw6OKkFHSpMEMAE4N9y3n0ziegHPus/gsBAeYKvWUwq
	6C17Oy7dqVOQ0lKqioGTPmgiIkqTOpgfDx9lZx0V4DdlmKQ8y8pclnZwEFaQ9ICBaT3sC+h3OUG
	h33ghqpgSJ2xKhLJK5FzuOvFAXFHaL6rI+6NtvfrzElaaYFNQw1g1T+FcwGiXjjUZnSioNGzlMh
	8AMKRB7bZqYeEHRIcujezLRFYcUZ1Vmh5Nc+KD87W/oDLqHQjtLxZhFVW80eVk2ekX2+Mtw==
X-Received: by 2002:a17:907:7b8d:b0:c4d:f63:642 with SMTP id
 a640c23a62f3a-c5066d17394mr478995166b.33.1794480406021; Thu, 12 Nov 2026
 02:46:46 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-15-baohua@kernel.org>
 <sashiko-outbox-210422@kernel.org> <CAGsJ_4ykeDu9XyyiNs9HBp2w--Pm7=oqs0=M5cPiypQ1qq9yTg@mail.gmail.com>
In-Reply-To: <CAGsJ_4ykeDu9XyyiNs9HBp2w--Pm7=oqs0=M5cPiypQ1qq9yTg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Nov 2026 18:46:09 +0800
X-Gm-Features: AclHuK-JjTgqqSOMfmvA3EUP83OxBZ_PwNcD_srQodizlEEwitzYsKZH5muhsqo
Message-ID: <CAMgjq7Cx0Z6mxQXKJN5KfRYbMNMD1qOy4Yrt51prbGz+=2F+2w@mail.gmail.com>
Subject: Re: [PATCH v7 14/16] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
To: Barry Song <baohua@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	hannes@cmpxchg.org, hui.zhu@linux.dev, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:32=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Thu, Nov 12, 2026 at 1:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [High] mm/mglru: commit Author and Signed-off-by use handle instead o=
f
> >   real name
> > - [Medium] mm/mglru: zero sc.priority in run_eviction() skews
> >   lru_gen_balance_scan()
> > --
> >
> > commit 8a29a76d461ffd04769caa1f7ed98ca18efe1fb3
> > Author: lyugaofei <lyugaofei@xiaomi.com>
> >
> > > mm/mglru: Avoid prolonged anon reclaim with swappiness=3D200
> > >
> > > It has been observed that swappiness=3D200 can significantly slow dow=
n
> > > reclaim on some machines, with some workloads running 3x slower
> > > under MGLRU than under CLRU.
> > >
> > > This is because swappiness=3D200 currently results in file_factor=3D0=
.
> > > Give file reclaim a small factor at lower priorities, for example,
> > > when sc->priority < DEF_PRIORITY / 2.
> > >
> > > Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
> > > Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> >
> > [Severity: High]
> > Per Documentation/process/submitting-patches.rst, both the commit Autho=
r
> > and the Signed-off-by trailer must use a known real full human name rat=
her
> > than an account handle ("lyugaofei").
>
> Let me change it to:
> Gaofei Lyu <lyugaofei@xiaomi.com>
>
> >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 2030c15c06674..a92b14190d733 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -4889,8 +4889,8 @@ static int get_tier_idx(struct lruvec *lruvec, =
int type)
> > >   * We don't calculate the scan cost, MGLRU uses lazy promotion, whic=
h will
> > >   * cancel the scan budget natually.
> > >   */
> > > -static void lru_gen_balance_scan(struct lruvec *lruvec, int swappine=
ss,
> > > -             unsigned long total_scan, unsigned long nr[])
> > > +static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_=
control *sc,
> > > +             int swappiness, unsigned long total_scan, unsigned long=
 nr[])
> > >  {
> > >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > >       u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
> > > @@ -4947,7 +4947,12 @@ static void lru_gen_balance_scan(struct lruvec=
 *lruvec, int swappiness,
> > >       file_weight =3D nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias=
;
> > >
> > >       anon_factor =3D (u64)swappiness * refault_rate[LRU_GEN_FILE] * =
anon_weight;
> > > -     file_factor =3D (u64)(MAX_SWAPPINESS - swappiness) * refault_ra=
te[LRU_GEN_ANON] * file_weight;
> > > +     if (swappiness =3D=3D MAX_SWAPPINESS)
> > > +             file_factor =3D sc->priority < DEF_PRIORITY / 2 ?
> > > +                           refault_rate[LRU_GEN_ANON] * file_weight =
: 0;
> > > +     else
> > > +             file_factor =3D (u64)(MAX_SWAPPINESS - swappiness) *
> > > +                           refault_rate[LRU_GEN_ANON] * file_weight;
> >
> > [ ... ]
> >
> > > @@ -5891,7 +5896,7 @@ static int run_eviction(struct lruvec *lruvec, =
unsigned long seq, struct scan_co
> > >                       return 0;
> > >
> > >               lruvec_evictable_size(lruvec, sc, swappiness, nr_to_sca=
n);
> > > -             lru_gen_balance_scan(lruvec, swappiness,
> > > +             lru_gen_balance_scan(lruvec, sc, swappiness,
> > >                                    nr_to_reclaim - sc->nr_reclaimed, =
nr_to_scan);
> > >
> > >               if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappine=
ss, MAX_LRU_BATCH))
> >
> > [Severity: Medium]
> > Does passing sc from run_eviction() into lru_gen_balance_scan() cause
> > swappiness=3D200 via debugfs proactive reclaim to always calculate a no=
n-zero
> > file_factor?
> >
> > lru_gen_seq_write() initializes sc on the stack without setting .priori=
ty
> > to DEF_PRIORITY, leaving sc.priority zero-initialized when passed to
> > run_cmd() -> run_eviction().  In lru_gen_balance_scan(), sc->priority <
> > DEF_PRIORITY / 2 (0 < 6) is then unconditionally true, so proactive
> > eviction with swappiness=3D200 always reclaims file pages instead of
> > preferring anonymous memory.
>
> Well, I'm getting tons of complaints about
> lru_gen_seq_write(), even though it's just a debug
> interface that probably very few people actually use.
>
> If anyone is actually using it, please let me know.
> Otherwise, I think we should consider removing it in the
> long term. Both memcg and node already have proactive
> reclaim interfaces, so this one seems redundant and
> difficult to maintain.

For now I think we just be really lenient about that interface, e.g.g
keep it at DEF_PRIORITY like in previous version

> All Sashiko comments seem to suggest:
>
> @@ -5955,6 +5956,7 @@ static ssize_t lru_gen_seq_write(struct file
> *file, const char __user *src,
>         struct blk_plug plug;
>         int err =3D -EINVAL;
>         struct scan_control sc =3D {
> +               .priority =3D DEF_PRIORITY,
>                 .may_writepage =3D true,
>                 .may_unmap =3D true,
>                 .may_swap =3D true,
>
> But I think this approach could introduce its own problems.
> Suppose we have four generations for both file and anon,
> and users use the debugfs interface to reclaim the oldest
> generation.
>
> 1. Even at DEF_PRIORITY, we can currently scan up to
> lrugen->max_seq - MIN_NR_GENS, which means the
> second-oldest generation can also be reclaimed. This
> somehow violates the user's request to reclaim only the
> oldest generation.
>
> 2. With swappiness=3D1 or 200, if we run out of the
> preferred file or anon type in the oldest generation,
> we can fall back to the other type and reclaim all of
> its oldest generation, as we did before scan-budget mode
> was introduced. With the new approach, however, we stick
> to the preferred type at DEF_PRIORITY and don't fall
> back to the other type. As a result, evict_folio_lists()
> can return 0 earlier than it would with the fallback
> approach.
>
> I guess the only way to address all these issues is to add
> a separate reclaim path for requests from
> lru_gen_seq_write(), with evict_folio_lists() handling
> these requests differently from regular reclaim to preserve
> the old behavior before this patchset introduced the
> budget-based model.
>
> Something like the following, though it would be very ugly:
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 4fe516d33703..24c6abe37189 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4745,7 +4745,8 @@ static bool isolate_folio(struct lruvec *lruvec,
> struct folio *folio, struct sca
>  static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>                        struct scan_control *sc, int type, int tier,
>                        struct list_head *list, int *isolatedp,
> -                      unsigned long *scanned_seq)
> +                      unsigned long *scanned_seq,
> +                      bool cmd_proactive)
>  {
>         enum node_stat_item item;
>         int zone_idx;
> @@ -4768,7 +4769,9 @@ static int scan_folios(unsigned long nr_to_scan,
> struct lruvec *lruvec,
>          * newest generation when under severe pressure, so hot folios ar=
e
>          * not evicted as soon as priority is raised.
>          */
> -       if (sc->priority =3D=3D DEF_PRIORITY)
> +       if (unlikely(cmd_proactive))
> +               seq =3D lrugen->min_seq[type];
> +       else if (sc->priority =3D=3D DEF_PRIORITY)
>                 seq =3D lrugen->max_seq - MIN_NR_GENS;
>         else if (sc->priority > DEF_PRIORITY / 2)
>                 seq =3D lrugen->max_seq - 1;
> @@ -4966,7 +4969,8 @@ static void lru_gen_balance_scan(struct lruvec
> *lruvec, struct scan_control *sc,
>  }
>
>  static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> -                       struct scan_control *sc, int type, int swappiness=
)
> +                       struct scan_control *sc, int type, int swappiness=
,
> +                       bool cmd_proactive)
>  {
>         LIST_HEAD(list);
>         LIST_HEAD(clean);
> @@ -4990,7 +4994,7 @@ static int evict_folios(unsigned long
> nr_to_scan, struct lruvec *lruvec,
>
>         tier =3D get_tier_idx(lruvec, type);
>         scanned =3D scan_folios(nr_to_scan, lruvec, sc,
> -                             type, tier, &list, &isolated, &scanned_seq)=
;
> +                             type, tier, &list, &isolated,
> &scanned_seq, cmd_proactive);
>         nr_isolated =3D isolated;
>         if (nr_isolated)
>                 __mod_node_page_state(pgdat, NR_ISOLATED_ANON + type,
> @@ -5177,11 +5181,13 @@ static bool should_abort_scan(struct lruvec
> *lruvec, struct scan_control *sc)
>  }
>
>  static long evict_folio_lists(unsigned long nr_to_scan[], struct
> lruvec *lruvec,
> -                            struct scan_control *sc, int swappiness,
> unsigned long max_batch)
> +                            struct scan_control *sc, int swappiness,
> unsigned long max_batch,
> +                            bool cmd_proactive)
>  {
>         int type;
>         unsigned long batch, scanned, total_scanned =3D 0;
>
> +retry:
>         /*
>          * Scan both types with the given budgets; the caller checks if
>          * reclaim is satisfied after each pass.
> @@ -5191,8 +5197,13 @@ static long evict_folio_lists(unsigned long
> nr_to_scan[], struct lruvec *lruvec,
>                         continue;
>
>                 batch =3D min(nr_to_scan[type], max_batch);
> -               scanned =3D evict_folios(batch, lruvec, sc, type, swappin=
ess);
> +               scanned =3D evict_folios(batch, lruvec, sc, type,
> swappiness, cmd_proactive);
>
> +               /* if it is a debugfs proactive reclaim, lend budget
> to the other type */
> +               if (!scanned && cmd_proactive && swappiness &&
> swappiness <=3D MAX_SWAPPINESS) {
> +               if (!scanned && cmd_proactive && swappiness &&
> swappiness <=3D MAX_SWAPPINESS) {
> +                       nr_to_scan[!type] +=3D nr_to_scan[type];
> +                       goto retry;
> +               }
>                 nr_to_scan[type] -=3D min(nr_to_scan[type], scanned);
>                 total_scanned +=3D scanned;
>         }
> @@ -5240,7 +5251,7 @@ static bool try_to_shrink_lruvec(struct lruvec
> *lruvec, struct scan_control *sc)
>
>                 orig_anon =3D nr[LRU_GEN_ANON];
>                 orig_file =3D nr[LRU_GEN_FILE];
> -               scanned =3D evict_folio_lists(nr, lruvec, sc,
> swappiness, MIN_LRU_BATCH);
> +               scanned =3D evict_folio_lists(nr, lruvec, sc,
> swappiness, MIN_LRU_BATCH, false);
>
>                 if (should_abort_scan(lruvec, sc))
>                         break;
> @@ -5896,7 +5907,7 @@ static int run_eviction(struct lruvec *lruvec,
> unsigned long seq, struct scan_co
>                 lru_gen_balance_scan(lruvec, sc, swappiness,
>                                      nr_to_reclaim - sc->nr_reclaimed,
> nr_to_scan);
>
> -               if (!evict_folio_lists(nr_to_scan, lruvec, sc,
> swappiness, MAX_LRU_BATCH))
> +               if (!evict_folio_lists(nr_to_scan, lruvec, sc,
> swappiness, MAX_LRU_BATCH, true))
>                         return 0;
>
>                 cond_resched();
>
> However, this would make the code much more complex and
> probably isn't worth the effort for a rarely used debugfs
> interface, especially given that we already have proactive
> reclaim interfaces for both memcg and nodes.
>
> So perhaps we should simply set .priority =3D DEF_PRIORITY
> and live with the two less significant issues described
> above.

I agree with this, actually maybe later we can use something in
scan_control like an extra field, CLRU has a lot of special tweaks in
that, which also needs to be sorted.
