Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475505;
	b=wqV8mew/HWBpXCO8mSOm3ly4fmDaAfEuXkDnZXu6PXLQV72e4Yh02YGbNpty9G1Vy9If
	 Y2l8hBuwO6uIOMD6XB4gnI8LS5RJ7Ghj+fuFqewZisxEhPPWiv6YlljqP1OZFJJlySowM
	 aaCa1bl8bAR7fp0bukD0RnUBy4s/JCq8t3niT9ifYsdGCBXEr50vladmLYJd7gGynMxCD
	 +qy3atiQtxGRHKWibYYTGeYPAN85tJUhLuriHdy61U5efioLangp1ayXFPtQ8PVBpB1Rc
	 KOskJ+wt52U01T59xANdBbpXNu9fw9IYxhr/PREX6D3Ee1suuMAhY0wx3M0bl+C7DSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475505;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=J5B0RJoEw22n7pSmPjGxvDx2wDYJxUF2iT6J4nNYETk=;
	b=RacrRWIVUv6gdMxiRJ9doHAX03gpQpIpK/ImZFt+eIPoH3tlKwsbaILq0bKkll96nT4Q
	 6WeLIDaM0MVAQ8zUo+Hy5Fj7xJSS/AMpbwqAQ/UfBm6GBeJMAKMnVivtr9Wlh5J6VzB/Y
	 RoJw2BoxFgPBxkNgZG1jEEjSW14Hn8oJ//deLxXamFAptBZeVYQVIGmLAYDeNfXVTyu0h
	 yBS3cXlMxRgYXlFie5dBFhMigLrcV/HWvvXrLZEhkuAkUtFzdJRp8DOohCUmM68OR4AyA
	 fE6uv3tQRNN+7z+A3bzAm6Fw30QVWpdi/qS59g/Q9B4PTf/ccSHvpJ+509tWyHUVwEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BOH/xn2C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E88606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOH/xn2C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646841F00AD4
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475505;
	bh=J5B0RJoEw22n7pSmPjGxvDx2wDYJxUF2iT6J4nNYETk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BOH/xn2CfkD+tbh//3qR/k0EO+9aEdGd0l1mPWeaJO0YcZU3n5MhNT2Op3oWmZjro
	 gMbNYQo4skRL6IntK6dEyDGPjBzM+PnA6XyMNaq5wmF9i4QOJuSEcl6I6uiG9xSR6T
	 /dQoQaCTGufnE+at8PMX5bHWWcArrVilcR5+ETYzZ2+6L80jImEAm8IeUjLSC5LzXr
	 6N7sDjdRbqvQh3CO7pj/Cwvz6RJ6fey4l/uijA3SIcZemcpckZXAvgM8fZjeB10XMt
	 nxJgVvbI8yqgxJW0IiCdKhSe8VFaPCphfs3JUBtVvAx3sr3MFHq2xEKEovmhGuTIWu
	 dL5VkJugUbbmw==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f1e5d7450so404259985a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 01:25:05 -0800 (PST)
X-Gm-Message-State: APuU4Z8xq7ZhtSD9NU8T1EPtDx4MEMhCEEs25EE7OySxigjmGhRYZYbA
	0XLFOxIYs+MnLWpHp6E7jRF3ao19WkuLSI1zkkGqVy3Kj+aNXSvmrp/jUaYjxPwExAbtAoFArvK
	X8bQue4MNybH376y5pkmKgmBIk3KgLLA=
X-Received: by 2002:a05:620a:8391:b0:947:7f9b:f839 with SMTP id
 af79cd13be357-947affa76b4mr781387585a.47.1794475504604; Thu, 12 Nov 2026
 01:25:04 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-13-baohua@kernel.org>
 <sashiko-outbox-210420@kernel.org>
In-Reply-To: <sashiko-outbox-210420@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 17:24:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zFbVuFimS7GHR0djiic71kAHVFPUmwfin97-xMhDB0iw@mail.gmail.com>
X-Gm-Features: AclHuK-hi8tCS7ALgGsjBn_gjNAMG15-FIUkG2aQlj-4JRAEd1r4uCcUq5mKHbQ
Message-ID: <CAGsJ_4zFbVuFimS7GHR0djiic71kAHVFPUmwfin97-xMhDB0iw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] mm/mglru: Restrict eviction accounting to
 eligible zones
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	ryncsn@gmail.com, shakeel.butt@linux.dev, surenb@google.com, 
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com, 
	zhangbo56@xiaomi.com, zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/mglru: premature OOM kill in lru_gen_age_node() on
>   zone-constrained reclaim
> --
>
> commit 169c51ce627ac19052dda882e181615f7e7c984d
> Author: Barry Song (Xiaomi) <baohua@kernel.org>
>
> mm/mglru: Restrict eviction accounting to eligible zones
>
> This commit restricts lruvec_evictable_size() and lru_gen_imbalanced() to
> count only zones at or below sc->reclaim_idx by adding a max_zone
> parameter to lruvec_gen_size().
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 41dd77652c82f..8b77e6bc1d519 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4207,8 +4207,8 @@ static void set_initial_priority(struct pglist_da=
ta *pgdat, struct scan_control
> >       sc->priority =3D clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
> >  }
> >
> > -static void lruvec_evictable_size(struct lruvec *lruvec, int swappines=
s,
> > -                               unsigned long nr[])
> > +static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_c=
ontrol *sc,
> > +                               int swappiness, unsigned long nr[])
> >  {
> >       int type;
> >       unsigned long seq;
> > @@ -4221,7 +4221,7 @@ static void lruvec_evictable_size(struct lruvec *=
lruvec, int swappiness,
> >
> >       for_each_evictable_type(type, swappiness) {
> >               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++)
> > -                     nr[type] +=3D lruvec_gen_size(lrugen, type, seq);
> > +                     nr[type] +=3D lruvec_gen_size(lrugen, type, seq, =
sc->reclaim_idx + 1);
> >       }
> >  }
> >
> > @@ -4230,7 +4230,7 @@ static bool lruvec_is_sizable(struct lruvec *lruv=
ec, struct scan_control *sc)
> >       unsigned long total, sizes[ANON_AND_FILE];
> >       int swappiness =3D get_swappiness(lruvec, sc);
> >
> > -     lruvec_evictable_size(lruvec, swappiness, sizes);
> > +     lruvec_evictable_size(lruvec, sc, swappiness, sizes);
> >       total =3D sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
> >
> >       /* whether the size is big enough to be helpful */
>
> [Severity: High]
> Can restricting lruvec_is_sizable() to sc->reclaim_idx trigger a prematur=
e
> global OOM kill in lru_gen_age_node() during zone-constrained reclaim whe=
n
> lru_gen_min_ttl is enabled?
>
> In balance_pgdat(), kswapd sets sc.reclaim_idx =3D highest_zoneidx and ru=
ns
> kswapd_age_node() -> lru_gen_age_node() before kswapd_shrink_node():
>
> mm/vmscan.c:lru_gen_age_node() {
>         ...
>         do {
>                 struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat)=
;
>
>                 mem_cgroup_calculate_protection(NULL, memcg);
>
>                 if (!reclaimable)
>                         reclaimable =3D lruvec_is_reclaimable(lruvec, sc,=
 min_ttl);
>         } while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
>         ...
>         if (!reclaimable && mutex_trylock(&oom_lock)) {
>                 struct oom_control oc =3D {
>                         .gfp_mask =3D sc->gfp_mask,
>                 };
>
>                 out_of_memory(&oc);
>
>                 mutex_unlock(&oom_lock);
>         }
> }
>
> Because user LRU pages are allocated from the highest zones and kept out =
of
> lower zones by lowmem_reserve, a wakeup with a constrained highest_zoneid=
x
> (such as ZONE_DMA or ZONE_DMA32) can find fewer than 1UL << sc->priority
> evictable pages in zones 0..sc->reclaim_idx in every memcg.
> lruvec_is_sizable() and lruvec_is_reclaimable() then return false for all
> memcgs, causing lru_gen_age_node() to invoke out_of_memory() with
> GFP_KERNEL even when higher zones have plenty of reclaimable memory older
> than min_ttl.

I think this is a pre-existing issue. lruvec_is_reclaimable()
uses the current sc->priority to estimate the reclaimable
size, which can significantly underestimate it in min_ttl
cases. Our patch somehow amplifies the problem because it
uses the correct reclaim_idx to calculate the reclaimable
size.

static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct
scan_control *sc,
                                  unsigned long min_ttl)
{
        int gen;
        unsigned long birth;
        int swappiness =3D get_swappiness(lruvec, sc);
        struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
        DEFINE_MIN_SEQ(lruvec);

        if (mem_cgroup_below_min(NULL, memcg))
                return false;

        if (!lruvec_is_sizable(lruvec, sc))
                return false;

        gen =3D lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));
        birth =3D READ_ONCE(lruvec->lrugen.timestamps[gen]);

        return time_is_before_jiffies(birth + min_ttl);
}

I think we have two options: either drop this check and
make sure lruvec_is_reclaimable() focuses solely on
min_ttl:

if (!lruvec_is_sizable(lruvec, sc))
        return false;

Or we can do the following, using the lowest possible
kswapd sc->priority to estimate the reclaimable size:

@@ -4245,7 +4243,7 @@ static bool lruvec_is_reclaimable(struct lruvec
*lruvec, struct scan_control *sc
        if (mem_cgroup_below_min(NULL, memcg))
                return false;

-       if (!lruvec_is_sizable(lruvec, sc))
+       if (sc->priority <=3D 1 && !lruvec_is_sizable(lruvec, sc))
                return false;

        gen =3D lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D12
