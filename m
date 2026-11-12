Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460329;
	b=tSgYx/NEkWO1tblGG4Wkq3r+CJ9P5zV73XG+isUmmBhmjuh4TqJNC9Uop0O/1FA0XHdG
	 Ifj0+FOV1CrtpRX7JVWajHuImnEh06VlXODhaAXwEz3cPM6ywrRiPWXmUfvX/fvaohApp
	 5ZAlrMDWWnCOPY+rrbjKxwlRpkQa7gs6wEvWI6fwdk5AFbciBpsk3ImieKuSvvvuSrDKw
	 8wbQwHK/22rLFoDonN4SpprVDdoMebip5+D/61DPgsdvZFhn12gSFepsdPyZofSjprXNT
	 ZjsU9nggCsmg9y7wey4rh2v8B5HUutQfexTdCaXOrDaS6IhX5yzUPmn+LCFBxiBTmNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460329;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=udLw4xWZiN/RL0nJMpzRBuktpxg/7u9GaKiX9eOBGPg=;
	b=wh2vpSlRiUXRe0DMUmAHH6G+YHbOdNxNQn2b6wyktxeJhCEE7+pSeC3rTSGZmkov7tot
	 RZm663ecMwztCG7vfEG6LXiwwKjfhC1McVEBPQ+AteqB/HoqPz2EwhaZ5oDVZDFB19cRy
	 Tz940yqXn3xJQfcz3rmHVU4TrjliBXm25mGHu9J3YLcxUZg2U0CN5633kaUJrwnkQ9mmV
	 Q6iA7vJzmsOMi5taUNlaUOilOYk/pgzSekUiLix7T5PLv6bU3gw4znHow/qmi90hwQHf+
	 oKurYu9o+gxxQQKDzFAY6Bi8Ly+j0phGOZzbdgc4M9meEK36cnOU6yXtmUbFV97r0HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOIUurRY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C6606A899
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DOIUurRY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BFE1F00A0A
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794460328;
	bh=udLw4xWZiN/RL0nJMpzRBuktpxg/7u9GaKiX9eOBGPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DOIUurRYrYdoGHsUDKaM8EY4mr+oKpr9uiPgYohVoHZI6VeHzgRc9pyeG/xuAzbRF
	 2960g0JJaAWCSxahGkOlTs48VKfnXKUe2qkzGQZed/Fr7uvH8LRlzarpIJgBVSeujV
	 Rk4755u4D6hl1FXY8gde8HVmSFIzasjoSH1eGmfcVb0NbsAJ/R8ZNF0nkAJLOqZt/K
	 LYNbAkD2R75smDDkAu+4VKUBgADS0tDWEmFZCa9uE8ptuxTo6UtSC7kdYJMW/XRYUm
	 Osqrpvrmb9bcmXCex4F/D/O7AqZxVul9E2bQkv8YlEYi4yN7/jlVXt5CWsarOK2Q5J
	 arGqK1S++Tp3A==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f259cdc86so344497385a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 21:12:08 -0800 (PST)
X-Gm-Message-State: APuU4Z9g3wX++Iy4o3dBf8bPzY0sRFU9yTH4FDpTQHbj8kocu4y+FX4u
	QKttgnOTBvT25N8uqW73zZBXqUKLcZV4U3cuQVj8wNblSvJLjNm636iTdGKkdRRfJPRGGwe/lVM
	5yCz71/AVSuNlqiEr6e65IQG3O0rnLOE=
X-Received: by 2002:a05:620a:6ccd:b0:93f:6e05:22eb with SMTP id
 af79cd13be357-947b004790fmr805777285a.48.1794460327831; Wed, 11 Nov 2026
 21:12:07 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-3-baohua@kernel.org>
 <sashiko-outbox-210410@kernel.org>
In-Reply-To: <sashiko-outbox-210410@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 13:11:56 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z8Xh-AeJScRY35yxu4Q2VA9RWc65hLOcR=qPf0Kg5T5w@mail.gmail.com>
X-Gm-Features: AclHuK-adsV3p3T53pKhzF58lye_dnBVy2PQxeZn1uz83gTILSeoRI6H6dSrch4
Message-ID: <CAGsJ_4z8Xh-AeJScRY35yxu4Q2VA9RWc65hLOcR=qPf0Kg5T5w@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] mm/mglru: extract lruvec_populated_min_seq() helper
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

On Thu, Nov 12, 2026 at 1:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm/mglru: shadowed local variable seq in try_to_inc_min_seq()
> --
>
> commit 7a4927e9f0aa8623b1c83f69afd1fb935c342dd5
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: extract lruvec_populated_min_seq() helper
>
> This commit extracts the search for the oldest populated generation of a
> type from try_to_inc_min_seq() into a new lruvec_populated_min_seq()
> helper.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index ed224cb80a75a..f98cd483f014a 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
>
> [ ... ]
>
> >  static void try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
> >  {
> > -     int gen, type, zone;
> > +     int type;
> >       bool seq_inc_flag =3D false;
> >       struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> >       DEFINE_MIN_SEQ(lruvec);
> > +     unsigned long seq;
> >
> >       VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
> >
> > -     /* find the oldest populated generation */
> > +     /* Requires at least MIN_NR_GENS gens for basic functionality */
> > +     seq =3D lrugen->max_seq - MIN_NR_GENS;
> >       for_each_evictable_type(type, swappiness) {
> > -             while (min_seq[type] + MIN_NR_GENS <=3D lrugen->max_seq) =
{
> > -                     gen =3D lru_gen_from_seq(min_seq[type]);
> > -
> > -                     for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> > -                             if (!list_empty(&lrugen->folios[gen][type=
][zone]))
> > -                                     goto next;
> > -                     }
> > -
> > -                     min_seq[type]++;
> > +             min_seq[type] =3D lruvec_populated_min_seq(lruvec, type, =
seq + 1);
> > +             if (min_seq[type] > lrugen->min_seq[type])
> >                       seq_inc_flag =3D true;
> > -             }
> > -next:
> > -             ;
> >       }
>
> [Severity: Low]
> This isn't a bug, but adding seq at function scope causes the existing
> inner declaration in try_to_inc_min_seq() to shadow it and recompute the
> same value:
>
> mm/vmscan.c:try_to_inc_min_seq() {
>         ...
>         if (swappiness && swappiness <=3D MAX_SWAPPINESS) {
>                 unsigned long seq =3D lrugen->max_seq - MIN_NR_GENS;
>         ...
> }
>
> Dropping the inner declaration would avoid the -Wshadow warning under W=
=3D2
> and reuse the value already computed.

This makes sense to me, we can do:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9f759d213614..a640590f6be3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4033,8 +4033,6 @@ static void try_to_inc_min_seq(struct lruvec
*lruvec, int swappiness)

        /* see the comment on lru_gen_folio */
        if (swappiness && swappiness <=3D MAX_SWAPPINESS) {
-               unsigned long seq =3D lrugen->max_seq - MIN_NR_GENS;
-
                if (min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] < =
seq)
                        min_seq[LRU_GEN_ANON] =3D seq;
                else if (min_seq[LRU_GEN_FILE] > seq &&
min_seq[LRU_GEN_ANON] < seq)


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D2
