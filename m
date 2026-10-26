Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004218;
	b=pHedVn/gWGbaW1RPUH44ZePzr63dnUBKec+kAdjxEdRuLblldOzlNjcdbjh1P20pOLos
	 YLAkt8Fg4mdyvbeTI47DhbLSEwW1aYc5bIAlamxTW+8JKgduUMDTK+Jqj/8acir21kaI6
	 m9XAI683UCkoS3xYrJB5FtK8vMxU3Z/vJVe5fCjBVgxXE8G+KRir1euFAJ/ZYuglcIuyT
	 hI4/+oHsy9BY0Lo4GVMccxSfFExpDbCTO77xShBqll5AGKXJ4LTVoFk4t5Sp0a6R2h5KT
	 OXRfX/QY1Ie3wnfvdPwi1UyiCzbnCH9Pjtv78JCx3TBDm63gQqtlVQDSNUqEuJQuTLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qXUSIPBtEKaTw8mbFmiXTMRpa+wNMP9kWdJH0q2bZ7Q=;
	b=XLRdJLQqTEsi1zqFbZ+ogDl1ivln+2yztYSsHP+M89CY3OJ7Q4dzSNJLGVgDOeuGGG97
	 R5/Um1DAYBb0i3ADuqpmC1U6qBffCXgrKEeAudMVeWOQh2g8tPu79slgK/LaOmFFDP134
	 JdxMs7uwVbam20oNIiFD4yLSArOHQjq7LoHt00AiqpmnVZDbHHWE8ksGz1OCXrNJZstAS
	 DEAa5sxrBux3jWJuwZ6eKiKH5eFWcpbosKvwjvB00vyPd+xmf66MKYYBTsznxIJwapkQ9
	 Pa136GuadkmhktWoojKUTIHlcASHfBebDchIhRj/9lAdIla3WMAVmxLFXbFVBy14m4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZaP4D8LQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BC9606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 08:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZaP4D8LQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14548825e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 01:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004216; cv=none;
        d=google.com; s=arc-20260327;
        b=TVOMBudVtwhagxP3ztk0zkci81pxTqHUCm/Hu8BLyFSGNpaBNvtoM9kSJP5QH7Dtty
         tfiPlNyM+JxoeYoFxfWuX10/+2NTfHo175DuGaKM5pLqNRZwZya4ucOSn8CAHwKwwDoU
         QywNGZR1X/3ldSFmbklKkd7Io+4224ppaEudmiTC+oMIotiGKlRZAcQrBR06gm7GjG4E
         cntnTJuAyr8VJwVm7xJqVXvRpIWEib3GnhgMmU1TbH9YUXNgzuNgLXnL1NHHKu/nG1Zv
         k+X76/HiN1nlnxJ/qu9QnbLS0/jpG6W4OgB9xRsw0L+9aTOx9ZyHK0AqfLCYOtOjukT7
         NzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXUSIPBtEKaTw8mbFmiXTMRpa+wNMP9kWdJH0q2bZ7Q=;
        fh=6Rep8Xja3H5k8tGJiyrwkPbmXEWWhFgGILqZfy8Cy5E=;
        b=rmF/PGUo05vU4U4npnkOlVTUDkdMj+bXYqO1kgz+3eSZJNGQCddb7N+a0/YVk84TwG
         dtGaBnA3UJLrxkwdegG91bWNplohxaZamvriu+7+58N0cCo4Ty57RCGByqTBPK6yvXn2
         g7fDxSizTVkdLm+Cfl1U97HQkUDO6FhBQiUprgQODppmCMXsioZdPerCe+2mL3OFXuAz
         WA7L+bsYpw4r8lzps6NVubzkA3jfStjX03Mz7ZBJzgYEjdbN0dTQPHL7Z9YI6hkiuCQj
         +3weF2IGbQQShGOGcjwtU/MUwjcJAHwqg4DUkgfhPE4tiVC3rvS40mgfBitc+x7htyc/
         MSMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004216; x=1793609016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qXUSIPBtEKaTw8mbFmiXTMRpa+wNMP9kWdJH0q2bZ7Q=;
        b=ZaP4D8LQuE3Ph4U216k/4iIjvYmNoBq1U4EielXAcRodnITfPQ3eBzDvP2BOQTT25q
         4hafoT1UiHT3e2CbKErJ8Ic9a+MqiC8HIS3scOrML0Jf5/H+tGjNTfj0A2GzRh4N6FFF
         b23kPZs79O9XI3ecTyRaR3hOIR3loq4fcBWjnrDdPcqrNJIZ+eeMHxh7iHi0WJoI9tvZ
         DkLq96Eygrp9SSfNgZMcDDwB6VrGbQ2gIA+424G2/zhY9tN+OV7Oj6eHLK4MEvlWJFxH
         l6T6q52R45B3QIAZ2j+0vbHUfKzVKNFBI/FvG4+ABvdkYSCGeNk8YKGuSGQajQIZ1Prq
         nuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004216; x=1793609016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qXUSIPBtEKaTw8mbFmiXTMRpa+wNMP9kWdJH0q2bZ7Q=;
        b=I7UF3sTLaNDnSyxPaLdXYfb+vuvZE0b6Ioj8p4vy5vmmLXHWxyeDhtkxUcOsJQ8TYl
         /t6neWuM+7Zad5d9Dvr8Mjz58PUdNtU6nvo0UFgp3RPyMOk/j+aYudxlAfj6PhYsTTX+
         gfjESecUygAoKBLN1wJpbdPQdjEqlEypzEWI4c/vsSMsc+TMV+HgFMDLrRF16Ooig8t4
         KWhY4uqc6fRRd4LkQTDUbrz/PX7s+v97GKZ+ueqbsX0s/nvJBSOZGeQoQGtQjZMWe34k
         +tI3ac1YeYRvR1SOOmLEJr9hKrY+zwkZ2BKCe/opKjNlzrD8C72xrGKzGMgb6o93TCYW
         2GGg==
X-Forwarded-Encrypted: i=1; AKwUvBzCJkPwsHHWVwZaqA8ly2G0XeA8FWHFw6lrjgDpFbhlSNihyWlx/3Qyss6oZbAVuoHco2J9tID16SQzkG69F+c=@lists.linux.dev
X-Gm-Message-State: AFq9FYLvT86/w8YLUPPnrUBuLKrSyYaPXYZi9EI9pnT924KgtRj2G516
	z7qR/sbI+O0psQEq7tCeGL3pen30Oc0oJmWtNFOMjoG0kgU1exnE+e+w9rH3O/n0IcMSvR8ZLle
	PgQ6c9FphQsJpovIWSrP4rmMsa3sTqnM=
X-Gm-Gg: AYBFou35K6FoMxlCFDdvC9ewkS2GZjR19Y3Ej1HeV/cPrMlXa9k5Iz19oN99C5lF0xL
	MLlXefGsw3u7omTaLl94yDDwS5xGsNtvvt9+TI4/gzqfaj7IKf4NLhVlfAlwobVf3YXj7Tgl62N
	LRsmi7In9yXh668NL6bF0UG6pKDkZWnZJKy6mrbtkQj1+ZWv7oBOXPH6U1u6rxhv9fhTVEWEAhg
	jjZ5OMO/pCDIBNsGufEoAVHimOOtXxUzO80jjsOgVCFgixKXHa97uaRF3HAgerh1YNLB/4UtjJz
	YpeVzrWhOf+AE6woJJXWbRAig+QkpY9B0qOFaRGTdTZLDZOOnd2Cgq0M+xEbd8lMlr9na6IIdxI
	R/bb7Ab8YssrgRkai7bpBAmeA6n5HE0WLJt48I36GmecXCHndxGLv0f3Pnyjg8HZqZeemdyg=
X-Received: by 2002:a05:600c:4e8b:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a35ac3cb16mr107359785e9.2.1793004215869; Mon, 26 Oct 2026
 01:43:35 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <sashiko-outbox-183280@kernel.org> <20261025013103.2742885-1-zhangbo56@xiaomi.com>
In-Reply-To: <20261025013103.2742885-1-zhangbo56@xiaomi.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 26 Oct 2026 16:43:24 +0800
X-Gm-Features: AclHuK85hHHI8ryjyClmJcvYOoB9y_HFNGCdF73aeEN5DkUrJfFAex87fGU_0_A
Message-ID: <CAN_Opa_6MeupdhxBrAFo2qNsDPMK72v7qMzK_6yGM3OGuuBkog@mail.gmail.com>
Subject: Re: [RFC PATCH v5 14/14] mm/mglru: Avoid scan anon while swapcache is
 low for GFP_NOIO allocation
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: sashiko-bot@kernel.org, akpm@linux-foundation.org, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	baoquan.he@linux.dev, david@kernel.org, hannes@cmpxchg.org, hui.zhu@linux.dev, 
	kasong@tencent.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-mm@kvack.org, liuxiang.277@bytedance.com, ljs@kernel.org, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, ryncsn@gmail.com, 
	sashiko-reviews@lists.linux.dev, shakeel.butt@linux.dev, surenb@google.com, 
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com, 
	zhangbo56@xiaomi.com, zhuhui@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 9:31=E2=80=AFAM Bo Zhang <zhangbo0325@gmail.com> wr=
ote:
>
> I have checked the two sub-issues separately. Both issues are valid and
> the root cause is the same: patch 14 skips anon scanning but leaves
> swappiness non-zero, so every path that still treats anon as evictable
> (scan budget, aging, lruvec_is_sizable()) misbehaves.
>
> > [High] unclamped scan budget on early return in lru_gen_balance_scan()
>
> Confirmed. With 1 <=3D swappiness <=3D MAX_SWAPPINESS and if one of the t=
ype's
> nr is 0, the early return left the other type at its full unscaled evicta=
ble
> size, bypassing priority scaling, memory.low protection and nr_to_reclaim=
.
> Note this is not specific for GFP_NOIO, an lruvec that naturally has only
> one type has the same problem.
>
> > [Medium] inconsistent swappiness state when anon reclaim is skipped
> > Would checking can_reclaim_anon_pages() in get_swappiness() ... avoid b=
oth?
>
> Confirmed for both sub-issues, stalled aging via evictable_min_seq(), and
> lruvec_is_sizable() counting unreclaimable anon.
>
> Rather than forcing swappiness to 0 in get_swappiness() (which, as Barry
> noted in [1], wrongly allows anon cold/hot inversion for the temporary
> GFP_NOIO case), I keep swappiness not changed and fix the evictable view =
at
> its source, lruvec_evictable_size():
>
> 1. It now filters out anon here when it cannot be reclaimed (e.g. GFP_NOI=
O
>    with low swapcache), so nr[LRU_GEN_ANON] is 0 for all consumers. This
>    drops the per-caller zeroing and lets lruvec_is_sizable() ignore
>    unreclaimable anon.
>
> 2. lru_gen_balance_scan() clamps the remaining type to total_scan before
>    the single-type early return.
>
> 3. should_run_aging() forces aging when file gens run low and anon is
>    unreclaimable, so a stalled min_seq[LRU_GEN_ANON] no longer blocks agi=
ng.
>
> Proposed fix on top of patch 14:
>
> [1] https://lore.kernel.org/lkml/20261022102726.56682-1-baohua@kernel.org=
/
>
> ---
>  mm/vmscan.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index d72a5aef3a0f..32bd9c0fef5d 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4350,12 +4350,14 @@ static inline unsigned long lruvec_gen_size(struc=
t lru_gen_folio *lrugen,
>         return size;
>  }
>
> -static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
> -                                 unsigned long nr[])
> +static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_con=
trol *sc,
> +                                 int swappiness, unsigned long nr[])
>  {
>         int type;
>         unsigned long seq;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +       struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> +       int nid =3D lruvec_pgdat(lruvec)->node_id;
>         DEFINE_MAX_SEQ(lruvec);
>         DEFINE_MIN_SEQ(lruvec);
>
> @@ -4363,6 +4365,8 @@ static void lruvec_evictable_size(struct lruvec *lr=
uvec, int swappiness,
>         nr[LRU_GEN_FILE] =3D 0;
>
>         for_each_evictable_type(type, swappiness) {
> +               if (type =3D=3D LRU_GEN_ANON && !can_reclaim_anon_pages(m=
emcg, nid, sc))
> +                       continue;
>                 for (seq =3D min_seq[type]; seq <=3D max_seq; seq++)
>                         nr[type] +=3D lruvec_gen_size(lrugen, type, seq);
>         }
> @@ -4374,7 +4378,7 @@ static bool lruvec_is_sizable(struct lruvec *lruvec=
, struct scan_control *sc)
>         int swappiness =3D get_swappiness(lruvec, sc);
>         struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>
> -       lruvec_evictable_size(lruvec, swappiness, sizes);
> +       lruvec_evictable_size(lruvec, sc, swappiness, sizes);
>         total =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
>
>         /* whether the size is big enough to be helpful */
> @@ -5058,18 +5062,17 @@ static void lru_gen_balance_scan(struct lruvec *l=
ruvec, struct scan_control *sc,
>         u64 anon_weight, file_weight;
>         int size_bias;
>
> -       if (swappiness <=3D MIN_SWAPPINESS) {
> +       if (swappiness <=3D MIN_SWAPPINESS)
>                 nr[LRU_GEN_ANON] =3D 0;
> -               nr[LRU_GEN_FILE] =3D min_t(u64, total_scan, nr[LRU_GEN_FI=
LE]);
> -       }
>
> -       if (swappiness =3D=3D SWAPPINESS_ANON_ONLY) {
> +       if (swappiness =3D=3D SWAPPINESS_ANON_ONLY)
>                 nr[LRU_GEN_FILE] =3D 0;
> -               nr[LRU_GEN_ANON] =3D min_t(u64, total_scan, nr[LRU_GEN_AN=
ON]);
> -       }
>
> -       if (!nr[LRU_GEN_ANON] || !nr[LRU_GEN_FILE])
> +       if (!nr[LRU_GEN_ANON] || !nr[LRU_GEN_FILE]) {
> +               nr[LRU_GEN_ANON] =3D min_t(u64, total_scan, nr[LRU_GEN_AN=
ON]);
> +               nr[LRU_GEN_FILE] =3D min_t(u64, total_scan, nr[LRU_GEN_FI=
LE]);
>                 return;
> +       }
>
>         for (int type =3D LRU_GEN_ANON; type <=3D LRU_GEN_FILE; type++) {
>                 int hist =3D lru_hist_from_seq(READ_ONCE(lrugen->min_seq[=
type]));
> @@ -5271,12 +5274,19 @@ static bool should_run_aging(struct lruvec *lruve=
c, unsigned long max_seq,
>                              struct scan_control *sc, int swappiness,
>                              bool do_balance)
>  {
> +       struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
> +       struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
>         DEFINE_MIN_SEQ(lruvec);
>
>         /* have to run aging, since eviction is not possible anymore */
>         if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS > max_se=
q)
>                 return true;
>
> +       /* run aging when GFP_NOIO limits anon reclaim with few swapcache=
 folios */
> +       if (swappiness && min_seq[LRU_GEN_FILE] + MIN_NR_GENS > max_seq &=
&
> +           reclaimable_anon_is_low(memcg, pgdat->node_id, sc))
> +               return true;
> +
>         /* try to avoid aging, do gentle reclaim at the default priority =
*/
>         if (sc->priority =3D=3D DEF_PRIORITY)
>                 return false;
> @@ -5295,9 +5305,7 @@ static void lru_gen_prepare_scan(struct lruvec *lru=
vec, struct scan_control *sc,
>  {
>         unsigned long total;
>
> -       lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> -       if (!can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->node_id,=
 sc))
> -               nr_to_scan[LRU_GEN_ANON] =3D 0;
> +       lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
>         total =3D nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
>
>         /* Just scrape all pages calculated above if this memcg was delet=
ed */
> @@ -6050,7 +6058,7 @@ static int run_eviction(struct lruvec *lruvec, unsi=
gned long seq, struct scan_co
>                 if (sc->nr_reclaimed >=3D nr_to_reclaim)
>                         return 0;
>
> -               lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> +               lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan)=
;
>                 lru_gen_balance_scan(lruvec, sc, swappiness,
>                                      nr_to_reclaim - sc->nr_reclaimed, nr=
_to_scan);
>
> --
> 2.34.1

Thanks. I checked the fix against the v5 Patch 14 base.

Moving the anon evictability check into lruvec_evictable_size() makes the
size consistent across lruvec_is_sizable(), lru_gen_prepare_scan(), and
run_eviction(), removing the need for the ad-hoc zeroing in
lru_gen_prepare_scan(). The clamp in lru_gen_balance_scan() on the
early-return path prevents an uncapped nr[] from reaching eviction.

The should_run_aging() trigger correctly bypasses evictable_min_seq
when anon is unreclaimable under GFP_NOIO =E2=80=94 without it, a lagging
min_seq[LRU_GEN_ANON] can dominate evictable_min_seq and block
aging even after file generations are exhausted.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu
