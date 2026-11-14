Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794623244;
	b=G0Wrl5Vk3zEfypZnzzDi2dAtz8HZ0Ohw/v6mKlAj4CWG9qr4XeQNiV+lG/o0Du4RTOpD
	 rK+LOFFeYj9/FkiHkdvX4Pi2iDnfu2TPkjc8rmJXq4ub4wZPHOdAgSwl4ez1I6Tpy/uE6
	 lF2+sKtgUl9teqaxmKR6V82qF2XrvcHEXsWai5bMOJYcni4AOIwD1GYpbwmSrIM6NPPCa
	 RQH7WQ7TV9NSTe9p5utO46g9Gbzhy8F1Rkaq/N9xVAkKOx8eQ8Pd36s9tmEMQ1IgMOxpP
	 J4rccio/N0iww0wwX07HgtOxYtYvTLkQp3Cc0FeCgluJlTmDyQS5a9yTkbSCYE8LXuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794623244;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=i+Dnnd/gI7iMHU71/x9uL0ktAaO1UMoD8OaDQ/QTl0k=;
	b=obtTx4tdfO2eredOTbIlPszoYmK42PgpXWQUmFvafPCp+EvjOSM53i6M6fs8GsgLo3LF
	 cP3chJwtel3lcD+zCRp3viqtIoGAbc5tChXPUyNXgn4xpM3aCSAOrdy9WNn341hcvhUk2
	 RA1KkOpi1kQCyzMawR3hrVgJwU3aidWI78oSmrlVKfrEL7wnqodCNre2M6oF2VaSIaGfL
	 FqwHa9VYvQmNKRfE8U4/4oySUGAfyJtb7rOXLU0O4ZuuYyvKCKfaLq1gzS3QCe/iwwSn7
	 Jil/f7L8ZNi2WWhgrLeWVXyIMpVR9+avFTC+DI/m+7PAuQ56IqPu8Clmd48248uRBUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cd357yU2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C310606A329
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 02:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cd357yU2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7711F000CD
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 02:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794623243;
	bh=i+Dnnd/gI7iMHU71/x9uL0ktAaO1UMoD8OaDQ/QTl0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cd357yU2vwvBmMA5egy+ScUSy42kd2gJ0WqJD+8nojYCnhMkpwnZfVrjWtaLRMpSe
	 4rp7Rc/PmY5zivdAtlEc6O5+a4R/rp7ALeBS2Mackb/nwVmrIfrBNoG/xKj3XtWiHF
	 NoFPeo81VdKqlhhIkL4LDyb1ADq7SFcZw1GqEq4LwvMx+FaYV1j7mCyI5oEAkeeXCi
	 vMUiRH/zpMsR/kgszKp3LPMpNpuxP1wt4gHxP3VO2i7dWOGtDgz8xjhQufc1kBrJQL
	 hGsZV9KShKlGFsIoL/ZrUgRCdbi3eAgnDhDL+980VjO5aKZMrm2WOhrXKitJwL89J7
	 SGe2ZVEAvkcEw==
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91f0274f88cso33787616d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 18:27:23 -0800 (PST)
X-Gm-Message-State: APuU4Z9e2yAvMI/1l0KutA0Eq4zmMX/LJNMaLc2p4oMuU7kN1Vx+DS1A
	la9ke7YMQTEwGR+M6dLBkjMXQbS48+u0y5JUZVKkj/D3w3FifC2N5vkZNoZQCWVw1WvuRHK2nki
	rHTMhzbNFBZ4VbKnn+yTt/ZhPtrHQTdo=
X-Received: by 2002:a05:620a:4686:b0:93c:5bfb:9a80 with SMTP id
 af79cd13be357-9494b9c66c8mr756327785a.3.1794623242680; Fri, 13 Nov 2026
 18:27:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113185541.70203-1-baohua@kernel.org> <20261113185541.70203-3-baohua@kernel.org>
 <sashiko-outbox-214021@kernel.org>
In-Reply-To: <sashiko-outbox-214021@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Sat, 14 Nov 2026 10:27:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y0KR86ABy5-Qpmk0ws0LMXB3nZTOcnhPL_Orr1_f26-w@mail.gmail.com>
X-Gm-Features: AclHuK_VcdHScuYuDyl1DzSIbcyPv1Xg9OwGFirFhFZx4rwZiHRRoplKBudRa38
Message-ID: <CAGsJ_4y0KR86ABy5-Qpmk0ws0LMXB3nZTOcnhPL_Orr1_f26-w@mail.gmail.com>
Subject: Re: [PATCH v8 02/16] mm/mglru: extract lruvec_populated_min_seq() helper
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:02=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm/mglru: off-by-one loop bound in lruvec_populated_min_seq()
> --
>
> commit 9751ca1c29ca665233058e3a3c3cfa85cc385872
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: extract lruvec_populated_min_seq() helper
>
> This commit extracts the search for the oldest populated generation of a
> given type from try_to_inc_min_seq() into a new lruvec_populated_min_seq(=
)
> helper bounded by max_seq.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 400f87fc51e12..27dfbd3ff02b3 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -3992,30 +3992,45 @@ static bool inc_min_seq(struct lruvec *lruvec, =
int type, int swappiness)
> >       return true;
> >  }
> >
> > +/* Similar to lruvec_evictable_size, return the oldest populated seq o=
f the type */
> > +static unsigned long lruvec_populated_min_seq(struct lruvec *lruvec, i=
nt type,
> > +                                           unsigned long max_seq)
> > +{
> > +     int gen, zone;
> > +     unsigned long min_seq;
> > +     struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> > +
> > +     lockdep_assert_held(&lruvec->lru_lock);
> > +
> > +     min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> > +     while (min_seq <=3D max_seq) {
> > +             gen =3D lru_gen_from_seq(min_seq);
> > +             for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
> > +                     if (!list_empty(&lrugen->folios[gen][type][zone])=
)
> > +                             return min_seq;
> > +             }
> > +             min_seq++;
> > +     }
> > +
> > +     return max_seq;
> > +}
> > +
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
> Should lruvec_populated_min_seq() loop while (min_seq < max_seq) and
> return min_seq at the end?
>
> When min_seq =3D=3D max_seq, both the early return inside the loop and th=
e
> final return evaluate to max_seq, so scanning all zones of generation
> seq + 1 under lruvec->lru_lock is redundant work that the original loop
> skipped.  In addition, if lrugen->min_seq[type] > max_seq on entry (which
> happens in commit "mm/mglru: lift youngest gen protection for higher
> priority" when scan_folios() runs at DEF_PRIORITY while get_nr_gens() is
> MIN_NR_GENS), returning max_seq yields a sequence number below
> lrugen->min_seq[type].

it seems you are suggesting the below:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 18a3332c71e9..307a7cbf5bc2 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3995,7 +3995,7 @@ static unsigned long
lruvec_populated_min_seq(struct lruvec *lruvec, int type,
        lockdep_assert_held(&lruvec->lru_lock);

        min_seq =3D READ_ONCE(lrugen->min_seq[type]);
-       while (min_seq <=3D max_seq) {
+       while (min_seq < max_seq) {
                gen =3D lru_gen_from_seq(min_seq);
                for (zone =3D 0; zone < zone_limit; zone++) {
                        if (!list_empty(&lrugen->folios[gen][type][zone]))
@@ -4004,7 +4004,7 @@ static unsigned long
lruvec_populated_min_seq(struct lruvec *lruvec, int type,
                min_seq++;
        }

-       return max_seq;
+       return min_seq;
 }


it seems to be simpler than the current code. let me give it a try.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113185541.70=
203-1-baohua@kernel.org?part=3D2
