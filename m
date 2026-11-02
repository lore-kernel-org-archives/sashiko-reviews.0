Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793613642;
	b=AJksX7pspJ+Xzf9fDokiaASvy9LmPyZJ7Tj7iWEkcGqiNt70LraIOhTYShMkdWtwvs8Y
	 YNwdjyaFnzEKme3V81/JXf+2Rg4okpL+G/xFCodILJSHZFCycD/NVwkbpgze8dMxGiE7g
	 xL3ZdEZN0cOm/WVeyoBQqefkZXqVAJm2Svxg3iTmuZ4HcVoil346ZkZSWoQ/y4VaBONXv
	 fR9VxozPnkK+oyUWh1XKEmi5avxB34bI/fxCJznEV7sdNvkGf034EiX++T8jLZ+/K/R0m
	 B/K7QgWdg4sKkbv+GmXo5woOZs2HJX2Gb0TtUqLhV2w9SZ2CqnC5HrohWYVA5gojqIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=amSkxba5qfGyP7Qk9zi7pRhILciZaFXKsvrCsRUizH0=;
	b=Gpoy/Rt+tyLYO8N0tkmLLzgEZiOssTOoR7yej/umc4ubmQ4ibkLdAOXOJ5yX6XbrwPkE
	 2+82BqBB36FAtr+zcOym3xyX2QfaVUg0clJeZhk42JDIU6dbyF66kehek01Aw6OTzg1Rt
	 1fjZyKpWM7DZkBDWu5tj/8SJNuVmxYAxQiT6rWmzNzeMp7ricsxMeOnzT5yAIbyLl7Yj0
	 6nv155tDM6zgqva06C5ZgzDuhgpKsyTdoXewG4h/e1+ebhAFUuftWHRuqlW85pl6EMlLq
	 heK5h/KaHgdOncBMj6myVZYKXrUCc8rU19SzPXVoGrDGa4YTIPol/tCf7c3RbOOTxTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYOGpgsd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F65606A331
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 10:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F65606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYOGpgsd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so23999855e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 02:00:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793613639; cv=none;
        d=google.com; s=arc-20260327;
        b=AQ38p5DQcTpdzAeQwKUx5McDia7JXtOgA13mwF3WrHn0/Kt7+g1sTUq5zkCcD9Ly+T
         hNBF0Tme3hIl97RhJMQKBag+Fy0/4X3OMd3WX3RzcuXIH7FM2XS8tmeIH/9yOY3RSaud
         KWNIEXROyKKeBa7TUU9WU8g0rKRP+QMFPkDBjmUl6918fSerQAc72nC+lIkyH4wOWLP6
         QjRKpsPgQo/9mMdF2ria+SIpQ/2I/t+lgBCxLUiGCYozpnaEXdZLzhymhY2ZAoj9yOvi
         vv7DSlskY+2M5ceAtfEHUy/rnCk+AlZaY1wjfSV20AAOHe4iNuUZvXq5+TBPOwbw5LHe
         V1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=amSkxba5qfGyP7Qk9zi7pRhILciZaFXKsvrCsRUizH0=;
        fh=kr0pKjlYi/f9G1IidDujwobZcKYg31YtDTi7/Ibdo/Q=;
        b=rp5ajcnIARBuj5ssZ2Gl6YlgduHjhDrKVywMWWAxMn1ZjFjskUapedThu/TNvjiVCw
         Un8ZHsX6z0u7AObd4zQCPZiCdrD+1zrCd+TVnTiBqZkDqYMvWP5yb0BfMlDUemAPgKOw
         zlMBjR8AQk1LVuNZa3+jYImIKLZ9HP6ORvPAT82E/sn+r3FA2glfr3bExl1jhHcwpHmY
         ZI133XdFTCWzH0VgQXmx823ly2W9exRsDft143LHDZTFCR2d9McnrRSZNphsABhbA86S
         xA840wJbAO+6cZFySnUmvXKaZgkziB2N+Oc7BtOOPLGGc1mcwyHmixqP0h6R6p4IAzFD
         Q56Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793613639; x=1794218439; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=amSkxba5qfGyP7Qk9zi7pRhILciZaFXKsvrCsRUizH0=;
        b=xYOGpgsdg98pcU1yJAq86LH+Kc8RBmk1NPKKMPPw3JO1JSDohMR5EgCYOQTa1uRFeR
         gGVHCPqY15rqbu5tb7NH0hB733QT7upHnNyIaTg8HIGBTQJmD2BGPMG+q+4+UVYGvNo+
         D4HLMzjJYNaipRlSD2mbikJW0cPospjQykiCH4TVaWPj9z4ICtIu7Uooy6CyAM//FgAR
         RJMnI/GuhTeKgTlsQfnFtzEfdTu97dyfSRC91RRoAgEZ7n9TbgBPDeVwdbByFHUj8mZ6
         Zmj7vbLs3IyB3g+gCUnekBXrsY2+DIyAzIqJkg3VIYaQzd0xlj4FuN4DVX7GqePkMYFD
         AWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613639; x=1794218439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amSkxba5qfGyP7Qk9zi7pRhILciZaFXKsvrCsRUizH0=;
        b=yiA6v3lt1DFLww0RvlJgE3sZ0LwzBkDE9qKdsRy4kvYNyLvaWwd76BHYF7rK9BYVMX
         4cu8XWFrqgNW2RXrbFoUAKiLqiM13YbaSgsap9YPKArVU3bCabIpF2On+lPZ0AHUwlBq
         ZZ1Pwu7o0fX8/tOkchLzxgfEqW1sZ+Wjk1FQ2dl9fIEeKDzpcb3wVpAYF6nNcxl55LaJ
         PuazKvIxH7e9Ai5ghf+4vcRc7jei1VlwJ7aWtV1f4d3trWbU8M5l8wu0Irp0huShIBPy
         bZYdXl0K9q8bU58oesggrwls3BDHQzERQXeJSRd4cVi3YWl12KJXNOI4JYwe6Mab25fo
         tfgw==
X-Gm-Message-State: AFq9FYJ0Ed/hQaSRj0/wuMS/S/hjJv2x1JOfiUgunqietUmdorS0+5Sv
	Ltku+QGF0pvpWlIaqp6tgMPmTkAnbeIUWqnNJYbrxdYiCXkFq5ctR6lZz0fl1ZWRv2JeAYf7cxw
	n3PNcRaWM2n7J2CLYT+rCuJ2uFDn40YU=
X-Gm-Gg: AYBFou1dA8HROdz9gC7DnHXBuRrNjKMlpge3nszqXhEZtdyfOW4Xww5yYdQ0aWYsrmp
	wD+3WkT2PjeYtCPwkzjVdl+z+drSf4kqVd3Ue9dQUpKiBDyBK22F+1uzwl6TzrzLUFBoIVATB18
	2oRhK+kOUjM8DcplJyktJFMGFB0nrbfeHmR2m6MvFeR2135UJ7a1hXolhq6rEZu3ySJ+18rZAbE
	aj/qJOuc9ou4rgRALtWjkn20xRJTFmY+Sr1I2Iin5BMFG4IXKmUozwXvZtXp+99+PE0LkVBQz3i
	2YeQ2+ZDdtpFjFGxFLPw4wFraUsNy8PrG6YnekXDcDbJgs0/6QxyAHITjNTde5zW7ZemWV+eNII
	x8sOwoPkp1+iL9HDYe1qv6V3CKPpI0bH4OScBu/UpOjBIV8/54K4AZZ/dzpPRq55sdSIQ
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id
 5b1f17b1804b1-4ac1709a200mr224792265e9.16.1793613638622; Mon, 02 Nov 2026
 02:00:38 -0800 (PST)
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
 <sashiko-outbox-183271@kernel.org> <CAMgjq7C4Tu1zVCpyv82aXrGh_rmkQLngGCkoKvQrRgEYf7sC=Q@mail.gmail.com>
In-Reply-To: <CAMgjq7C4Tu1zVCpyv82aXrGh_rmkQLngGCkoKvQrRgEYf7sC=Q@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 2 Nov 2026 18:00:26 +0800
X-Gm-Features: AclHuK98JNvzxZC08YSH0QO_4Na3EWlc07Kgyk4sBPqBWgkibwQxiMB2ukaoSnM
Message-ID: <CAN_Opa-AScm9=EeXO_Uy8VjbQ=bqY9P++rFP8H1RhUB4dOt6xw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 05/14] mm/mglru: skip zones above reclaim_idx
 instead of rotating them
To: Kairui Song <ryncsn@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, "Barry Song (Xiaomi)" <baohua@kernel.org>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, hui.zhu@linux.dev, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, david@kernel.org, 
	hannes@cmpxchg.org, ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, weixugc@google.com, yuanchu@google.com, 
	zhuhui@kylinos.cn, baoquan.he@linux.dev, liuxiang.277@bytedance.com, 
	wangzicheng@honor.com, lianux.mm@gmail.com, liam@infradead.org, 
	surenb@google.com, mhocko@suse.com, rppt@kernel.org, zhangbo56@xiaomi.com, 
	lyugaofei@xiaomi.com, ridong.chen@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:19=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Sat, Oct 24, 2026 at 6:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] mm/mglru: pinned min_seq in higher zones stalls aging in scan_=
folios()
> > --
> >
> > commit 1b2f683d6b8bd1e171eb9677315ba8a3d9431b9b
> > Author: Kairui Song <kasong@tencent.com>
> >
> > mm/mglru: skip zones above reclaim_idx instead of rotating them
> >
> > This commit restricts scan_folios() and lruvec_populated_min_seq() duri=
ng
> > eviction to zones at or below sc->reclaim_idx, and removes the ineligib=
le-zone
> > rotation branch from sort_folio(). try_to_inc_min_seq() continues to ch=
eck all
> > zones up to MAX_NR_ZONES before advancing min_seq.
> >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index a365a4bc8c988..09ea72b354a56 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -4132,7 +4132,7 @@ static bool inc_min_seq(struct lruvec *lruvec, =
int type, int swappiness)
> > >
> > >  /* Similar to lruvec_evictable_size, return the oldest populated seq=
 of the type */
> > >  static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec,=
 int type,
> > > -                                           unsigned long max_seq)
> > > +                                           int zone_limit, unsigned =
long max_seq)
> > >  {
> > >       int gen, zone;
> > >       unsigned long min_seq;
> > > @@ -4143,7 +4143,7 @@ static unsigned long lruvec_populated_min_seq(s=
truct lruvec *lruvec, int type,
> > >       min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> > >       while (min_seq <=3D max_seq) {
> > >               gen =3D lru_gen_from_seq(min_seq);
> > > -             for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> > > +             for (zone =3D 0; zone < zone_limit; zone++) {
> > >                       if (!list_empty(&lrugen->folios[gen][type][zone=
]))
> > >                               return min_seq;
> > >               }
> > > @@ -4166,7 +4166,7 @@ static void try_to_inc_min_seq(struct lruvec *l=
ruvec, int swappiness)
> > >       /* Requires at least MIN_NR_GENS gens for basic functionality *=
/
> > >       seq =3D lrugen->max_seq - MIN_NR_GENS;
> > >       for_each_evictable_type(type, swappiness) {
> > > -             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type=
, seq + 1);
> > > +             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type=
, MAX_NR_ZONES, seq + 1);
> > >               if (min_seq[type] > lrugen->min_seq[type])
> > >                       seq_inc_flag =3D true;
> > >       }
> >
> > [ ... ]
> >
> > > @@ -4863,10 +4864,8 @@ static bool sort_folio(struct lruvec *lruvec, =
struct folio *folio, struct scan_c
> > >        * longer be promoted or protected, so just isolate them. The o=
ne
> > >        * exception is lru_gen_reparent_memcg(), which is handled abov=
e.
> > >        */
> > > -     if (min_gen =3D=3D max_gen) {
> > > -             VM_WARN_ON_ONCE(zone > sc->reclaim_idx);
> > > +     if (min_gen =3D=3D max_gen)
> > >               return false;
> > > -     }
> > >
> > >       /* protected */
> > >       if (tier > tier_idx || refs + workingset =3D=3D BIT(LRU_REFS_WI=
DTH) + 1) {
> > > @@ -4883,13 +4882,6 @@ static bool sort_folio(struct lruvec *lruvec, =
struct folio *folio, struct scan_c
> > >               return true;
> > >       }
> > >
> > > -     /* ineligible */
> > > -     if (zone > sc->reclaim_idx) {
> > > -             gen =3D folio_inc_gen(lruvec, folio, min_gen);
> > > -             list_move_tail(&folio->lru, &lrugen->folios[gen][type][=
zone]);
> > > -             return true;
> > > -     }
> > > -
> > >       return false;
> > >  }
> > >
> > > @@ -4921,16 +4913,17 @@ static int scan_folios(unsigned long nr_to_sc=
an, struct lruvec *lruvec,
> > >                      struct scan_control *sc, int type, int tier,
> > >                      struct list_head *list, int *isolatedp)
> > >  {
> > > -     int i;
> > >       enum node_stat_item item;
> > > +     int zone_idx;
> > >       int sorted =3D 0;
> > >       int scanned =3D 0;
> > >       int isolated =3D 0;
> > >       int skipped =3D 0;
> > >       int gen, max_gen;
> > > -     unsigned long min_seq;
> > > +     unsigned long seq;
> > >       unsigned long remaining =3D nr_to_scan;
> > >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > > +     struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> > >       DEFINE_MAX_SEQ(lruvec);
> > >
> > >       VM_WARN_ON_ONCE(nr_to_scan > MAX_LRU_BATCH);
> > > @@ -4942,24 +4935,22 @@ static int scan_folios(unsigned long nr_to_sc=
an, struct lruvec *lruvec,
> > >        * when under pressure to respect swappiness more and reduce IO=
 cost.
> > >        */
> > >       if (sc->priority =3D=3D DEF_PRIORITY)
> > > -             min_seq =3D lrugen->min_seq[type];
> > > +             seq =3D lrugen->min_seq[type];
> > >       else
> > > -             min_seq =3D lruvec_populated_min_seq(lruvec, type, lrug=
en->max_seq);
> > > +             seq =3D lrugen->max_seq;
> > >
> > > -     gen =3D lru_gen_from_seq(min_seq);
> > > +     seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx =
+ 1, seq);
> > > +     gen =3D lru_gen_from_seq(seq);
> > >       max_gen =3D lru_gen_from_seq(max_seq);
> > >
> > > -     for (i =3D MAX_NR_ZONES; i > 0; i--) {
> > > +     /* Scan eligible zones in descending order. */
> > > +     for (zone_idx =3D sc->reclaim_idx; zone_idx >=3D 0; zone_idx--)=
 {
> >
> > [Severity: High]
> > During zone-constrained reclaim in mm/vmscan.c (where sc->reclaim_idx i=
s below
> > MAX_NR_ZONES - 1 and zones above sc->reclaim_idx are populated, such as
> > GFP_DMA32 reclaim with a populated ZONE_NORMAL or GFP_KERNEL reclaim wi=
th a
> > populated ZONE_MOVABLE), can keeping MAX_NR_ZONES in try_to_inc_min_seq=
()
> > while removing the ineligible-zone rotation from sort_folio() stall agi=
ng and
> > memcg rotation?
>
> Yeah it can stall aging, but this series lifted the restriction of
> MIN_NR_GEN on eviction, and eviction will start the the last populated
> gen of a zone instead of min_seq, and we have more proactive aging
> when the gens are imbalanced, so this won't be a problem, it won't
> cause OOM. I'm not sure if it will cause any performance issue though,
> if this is concerning we can keep the old behavior, or trigger aging
> when the populated gen that satisfy a reclain is below (MIN_NR_GEN -
> 1) or imbalanced, this seems a better solution to me, still avoid a
> lot of redundant work while ensure there is no reclaim effenciency
> issue. We already have the right helper to do so in this series, so
> seem not hard or dirty.

Thanks, that makes sense regarding OOM.
Could lru_gen_imbalanced() trigger aging soon enough when few
populated generations are eligible for reclaim, or could reclaim
efficiency suffer while min_seq remains pinned?

Would the additional trigger you suggested for this case be worthwhile?

Thanks,
Kunwu
