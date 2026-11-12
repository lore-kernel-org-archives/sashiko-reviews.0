Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482997;
	b=lFSUnJB+IpSfrtLo80RGLIy/DgYREYcqBar8KVojDrlK41JtyzknMCF1f3ssiO3NUdwN
	 sYszb4rkpV/mhsua6dCLi1FZB1bTDoHIbgjjVQk/l3MBvadxLdKWoRl89TmISbiBJ85Fy
	 ZHaJu231AC7kXaAbQ8ujACbp8PiCMG3hC/OLthgEYPdwvnvVX6vWygbrRriNpzbwdkL/6
	 YP56ZSY0Z3zWmF0oOPewjvxaOjYvWooSwcgjWKX0pQ2k4TxN+Mm8NGjs1AI9D3BZrEXYV
	 ARwajPraSxQc5dQxlXr5Yxf4X23XB/9hqJE+Z0GCet5bh8la659oPf7TGayab5Rr1rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482997;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=aQt3sQWn6kEinu0EVH9z6KwTT7qLSz6YeVkphNhq1Qw=;
	b=U7sPuUEu4uY46/QXqbGd+f5eHGMOpe26Pi79g2/fn92KSabo5tzXW7H58I/ETih9JEBB
	 uQfArEy91hVYF7bphqOf5GEycSx04n2a0Hlq/kWCbnhPbT5kFZ4M5KrIHFi4nvD1ZiYBm
	 YSKl0me5iuTZxKgBZA0WEyD/tiZ8Y6pHRISP8XyHDmtrC3RGj6QipJ+E7AX7SM4qMxRmE
	 WVOPHuUDMiTSWxDc0juPjJMz6xo0jbLqyFJ87OOsHOeaoJikGzq8zyTU30VkZvj7Q5U71
	 CgM7FOB7gf2B8E3TvwNnsYZJn+IThf3qpI1D7arCIyC/yKF0nOSMo86lY4uodX9Y3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEaim28R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DF606A8A3
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZEaim28R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7571F00AD1
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482997;
	bh=aQt3sQWn6kEinu0EVH9z6KwTT7qLSz6YeVkphNhq1Qw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZEaim28RYqaq+C//lihfDLxN33NDmUDam854qSUMg0aAHhVkGLpgFM2u63JB8AYdY
	 ir9MI2zrr9gueQROVu1MKKM8n3lbgCgGT4A7GSjZP2SlBOT0HClFj+KJhbyAqTm9Vc
	 P0YJsneYKXHMp8QuZmwP5aZvvswjNcGAhy+LihDvCvj5+X0OaLE/wzWG55tyBo/cFx
	 fDxz6CGZGLqxi96k5IxU0BNepbndnSEvW+Udt9wRloHmIGnbNS3BSoPxgwSzkuMM8Q
	 4VJeoaMo6zYsAnKilR0DSG6JIh7nsOkYnnasightx5sS8c2uq1AmQhfJ8cEl+0FfAN
	 HXt8WAZnAkv8w==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e63ee7b4cso378066585a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:29:57 -0800 (PST)
X-Gm-Message-State: APuU4Z/dZia2dp6bOoDy4hoUbucFnupnScovnELFNAoE+8qb20vcfIei
	r8vmDoRN05lENfO6C7uKYNIdKZvhm/fzrXHn+um3kgM51XdpmQ+VypPcrX4SKMcFP5ok2drhM0f
	IQT/YwiWdTZwcS4XBwBtGz2XzYxFMGmY=
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id
 af79cd13be357-947b00b3c2amr775889085a.61.1794482996962; Thu, 12 Nov 2026
 03:29:56 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-17-baohua@kernel.org>
 <sashiko-outbox-210424@kernel.org>
In-Reply-To: <sashiko-outbox-210424@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 19:29:46 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y5G3U+grKw5pRJoQvtdd7LnEJDPPs+xOTN5JzUawhOJQ@mail.gmail.com>
X-Gm-Features: AclHuK8TWfaCB6dw4xbPzg8qNYoschgIoS8z5RybB7ZZ36slXR8J7WXQfbKrMOQ
Message-ID: <CAGsJ_4y5G3U+grKw5pRJoQvtdd7LnEJDPPs+xOTN5JzUawhOJQ@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] mm/mglru: Avoid scan anon while swapcache is low
 for GFP_NOIO allocation
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	ryncsn@gmail.com, shakeel.butt@linux.dev, surenb@google.com, 
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com, 
	zhangbo56@xiaomi.com, zhuhui@kylinos.cn, sidchintamaneni@gmail.com, 
	Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/mglru: stalled aging in try_to_shrink_lruvec() under
>   GFP_NOIO
> --
>
> commit c2e07c75b5549aa295c630747e1cecd7625269f0
> Author: Bo Zhang <zhangbo56@xiaomi.com>
>
> mm/mglru: Avoid scan anon while swapcache is low for GFP_NOIO allocation
>
> This commit skips anonymous folio scanning in MGLRU when GFP_NOIO is set
> and swapcache is low by checking can_reclaim_anon_pages() in
> lruvec_evictable_size().
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index f36e9a379b62a..4fdbf0c2dcde0 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> [ ... ]
> > @@ -4213,6 +4206,8 @@ static void lruvec_evictable_size(struct lruvec *=
lruvec, struct scan_control *sc
> >       int type;
> >       unsigned long seq;
> >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > +     struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
> > +     int nid =3D lruvec_pgdat(lruvec)->node_id;
> >       DEFINE_MAX_SEQ(lruvec);
> >       DEFINE_MIN_SEQ(lruvec);
> >
> > @@ -4220,6 +4215,8 @@ static void lruvec_evictable_size(struct lruvec *=
lruvec, struct scan_control *sc
> >       nr[LRU_GEN_FILE] =3D 0;
> >
> >       for_each_evictable_type(type, swappiness) {
> > +             if (type =3D=3D LRU_GEN_ANON && !can_reclaim_anon_pages(m=
emcg, nid, sc))
> > +                     continue;
> >               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++)
> >                       nr[type] +=3D lruvec_gen_size(lrugen, type, seq, =
sc->reclaim_idx + 1);
> >       }
>
> [Severity: Medium]
> Can zeroing nr[LRU_GEN_ANON] here while swappiness remains non-zero stall
> MGLRU aging during GFP_NOIO reclaim?
>
> When swap space is available and NUMA demotion is not, get_swappiness()
> stays in 1..MAX_SWAPPINESS even when can_reclaim_anon_pages() returns
> false. Because nr[LRU_GEN_ANON] is 0, evict_folio_lists() only scans file
> generations, so min_seq[LRU_GEN_ANON] stays at max_seq - 3 and
> try_to_inc_min_seq() clamps min_seq[LRU_GEN_FILE] to max_seq - MIN_NR_GEN=
S:
>
> mm/vmscan.c:try_to_inc_min_seq() {
>         ...
>         if (swappiness && swappiness <=3D MAX_SWAPPINESS) {
>                 unsigned long seq =3D lrugen->max_seq - MIN_NR_GENS;
>
>                 if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] =
< seq)
>                         min_seq[LRU_GEN_ANON] =3D seq;
>                 else if (min_seq[LRU_GEN_FILE] > seq && min_seq[LRU_GEN_A=
NON] < seq)
>                         min_seq[LRU_GEN_FILE] =3D seq;
>         }
> }
>
> Once populatable file generations are drained, evict_folio_lists() return=
s
> 0 and try_to_shrink_lruvec() breaks out of the loop before setting
> no_populatable, while should_run_aging() sees evictable_min_seq() at
> min_seq[LRU_GEN_ANON] (max_seq - 3) and lru_gen_imbalanced() still counts
> unreclaimable anon pages in old[LRU_GEN_ANON]. As a result, reclaim fails
> to age from DEF_PRIORITY down to DEF_PRIORITY / 2 + 1 and then directly
> evicts the youngest file generation (max_seq) without page-table aging or
> tier protection.

This is a similar performance concern to the ones raised
earlier [1][2]. As mentioned in my earlier reply, it could
be addressed by the approach Bo Zhang suggested to me
off-list:
@@ -5233,6 +5231,7 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)
                unsigned long orig_file, orig_anon;
                DEFINE_MAX_SEQ(lruvec);
                bool no_populatable;
+               long scanned;

                if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
                        need_rotate =3D true;
@@ -5241,8 +5240,7 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)

                orig_anon =3D nr[LRU_GEN_ANON];
                orig_file =3D nr[LRU_GEN_FILE];
-               if (!evict_folio_lists(nr, lruvec, sc, swappiness,
MIN_LRU_BATCH))
-                       break;
+               scanned =3D evict_folio_lists(nr, lruvec, sc,
swappiness, MIN_LRU_BATCH);

                if (should_abort_scan(lruvec, sc))
                        break;
@@ -5263,6 +5261,9 @@ static bool try_to_shrink_lruvec(struct lruvec
*lruvec, struct scan_control *sc)
                        should_age =3D true;
                }

+               if (!scanned)
+                       break;
+
                cond_resched();
        }


[1] https://lore.kernel.org/linux-mm/CAGsJ_4xMUoTsPU-=3D_QVDqZ-p4Dt+vGJC5G8=
hed3PWNAk3iv8Bw@mail.gmail.com/
[2] https://lore.kernel.org/linux-mm/CAGsJ_4wFye_co4bnJwuaoyshZOE+gcWFthmWD=
3r94dQgVHp8GQ@mail.gmail.com/

>
> Should get_swappiness() return 0 when !can_reclaim_anon_pages() instead, =
so
> swappiness is 0 consistently across try_to_shrink_lruvec(),
> try_to_inc_min_seq(), should_run_aging(), and lru_gen_imbalanced()?

No. Please don't suggest hacking get_swappiness() again.
It would cause a cold/hot inversion in inc_min_seq().

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D16
