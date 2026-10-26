Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000090;
	b=i2CxQ5icTsAG4Hm3IfUSmKUj1N4wIGGGEsMGYHNmPRFGCBEwvcGImrBwpD4zVmwaV4eG
	 FYNGkkDu+Z/f3J96jHo5rENtSivCGhkTSZXOrQ4N80mDIo8sc6X3d23z3nnytt19p3oBo
	 DnGRB6o7cfnc/b5ccGGxKO1yf499F2DMC/R119UGl2lt1pCrF9MOkwY4rxDepx6x0w7yZ
	 MFWGhy0NQ12QbX20dIJaq7p0AlMP8PqRae98gPJEGltZ8AB+Us3iXA2id5wXFp5R9qIQK
	 3xGtvL3+w/QdOjIijHJ5ejN/toNjD8CWjrcnXvR0wRcOWGVw0gq1AZYw1vnzx/S2Igw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000090;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=eCp7793YU+XpI2dR52kKJJUrJruoufr3s1+FAGOxksY=;
	b=dinHYgSou+RHb3p6sSSMKMRe008cYeo+jYeWBRFRqr5HU/FZeil7iLshC8LrK4xWWNlJ
	 AK2l2tgrDvIOqGwSj/ecpA/nXMxu3QMJNRIAbQx90HJqg7WXiy/IoaW90PEbO9F4rWMrl
	 bKBeHHZprXNqIllvc0Mivbc7SwstxVzNmRnZiF+bJS/01fA1Ki+SkL6KG83ph+T4N4+KM
	 hSFXjiTnNmXRPzFfhpnqUMcxldjOYp605VDMOsBINXGii4cSc5xo3vk0/kcEA23p0MGlp
	 VobbH+ez/ktOs5M8DWBEYZg0gWXN7UPg5wxx9M3Gzd9e5D5E8gWFEKuh0GH78ZZBRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsTSCXzR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C1606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 07:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsTSCXzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42E91F031E9
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793000089;
	bh=eCp7793YU+XpI2dR52kKJJUrJruoufr3s1+FAGOxksY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UsTSCXzR+/RjF9VnjyyhN4i1jTHMUDayGFUMfG8dnQNxw09izDNW4bne3+DM3nr9c
	 WMdFJuuokskdhoWpwWdUD66xtgYNT3ilRBItkcgwr6m6AxyajJp5N8EWgmZgUpjzz1
	 mNgKinnthCD6R2XbLcRJPInGLiuMhMDyO5z0Dl+CfeWlluxg2yqLGv/OzsmxYuq0/8
	 PECJpBocY4XFWFeFQuH5Ci29f1+UDyvpcck0kGjhTkVBzZU+0oAnH24bqslIlq8TNM
	 G8va/Znm4XrSCLC6OzMNFGj4KkC58shzmD2A/FieYhVzRSsyYRL+2zkWeS9yoEAtxB
	 BKUQ14ERwuGug==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93efc0452b5so174454385a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 00:34:49 -0700 (PDT)
X-Gm-Message-State: AFq9FYJCO+MrGHC86UbbNAZ3YJ5lYnTas+++VGdIqVkKkrtRCSTouHcp
	/Aouokm4d6QhlxW58JlWUB3FNs89iLaXBn5l9bDzn18sM/EHfaMrgw1cX6lHeZFlMpuoiOyrwWc
	eKRJyyEMyrv2JIvI0zr0xBMayuL8U7Ow=
X-Received: by 2002:a05:620a:458e:b0:93c:b7f3:9f5b with SMTP id
 af79cd13be357-940ef95515fmr961429385a.45.1793000089011; Mon, 26 Oct 2026
 00:34:49 -0700 (PDT)
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
 <sashiko-outbox-183273@kernel.org> <CAMgjq7AZF4R8voNhsbj5Ede7NR19k1tkAMGnn7556ydB2ERX5A@mail.gmail.com>
In-Reply-To: <CAMgjq7AZF4R8voNhsbj5Ede7NR19k1tkAMGnn7556ydB2ERX5A@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 26 Oct 2026 15:34:38 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zObH8KOzRL77+oPgp5Scu9fJuV7Q5_8=qDVMERA_t+1w@mail.gmail.com>
X-Gm-Features: AclHuK8HIHYePZwSi4ORH8Tu8XMTrLkYqZE4DswlO9WKZxuNsXLsRQwzbO4Fx3c
Message-ID: <CAGsJ_4zObH8KOzRL77+oPgp5Scu9fJuV7Q5_8=qDVMERA_t+1w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 07/14] mm/mglru: balance anon and file scan budget
 by refault rate
To: Kairui Song <ryncsn@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, hui.zhu@linux.dev, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, david@kernel.org, hannes@cmpxchg.org, 
	ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	weixugc@google.com, yuanchu@google.com, zhuhui@kylinos.cn, 
	baoquan.he@linux.dev, liuxiang.277@bytedance.com, wangzicheng@honor.com, 
	lianux.mm@gmail.com, liam@infradead.org, surenb@google.com, mhocko@suse.com, 
	rppt@kernel.org, zhangbo56@xiaomi.com, lyugaofei@xiaomi.com, 
	ridong.chen@linux.dev, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:25=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
[...]
> > > @@ -5948,8 +6001,11 @@ static int run_eviction(struct lruvec *lruvec,=
 unsigned long seq, struct scan_co
> > >               if (sc->nr_reclaimed >=3D nr_to_reclaim)
> > >                       return 0;
> > >
> > > -             nr_batch =3D min(nr_to_reclaim - sc->nr_reclaimed, MAX_=
LRU_BATCH);
> > > -             if (!evict_folios(nr_batch, lruvec, sc, swappiness))
> > > +             lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
> > > +             lru_gen_balance_scan(lruvec, swappiness,
> > > +                                  nr_to_reclaim - sc->nr_reclaimed, =
nr_to_scan);
> > > +
> > > +             if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappine=
ss, MAX_LRU_BATCH))
> > >                       return 0;
> > >
> > >               cond_resched();
> >
> > [Severity: Medium]
> > Can budgeting with lruvec_evictable_size() in lru_gen_balance_scan() ca=
use
> > lost scan budget and premature reclaim termination in try_to_shrink_lru=
vec()
> > and run_eviction() when one type has no folios in scannable generations=
 or
> > eligible zones?
>
> At the moment it's like part of the design, prioiry will raise and in
> the end we will have no scannable generation limit, zone might worth
> be considered when getting the evictable size though?

It should be straightforward to exclude non-reclaimable zones based on
Bo's fix to 14/14 which addresses the GFP_NOIO issue[1].
Since sc is already passed to lruvec_evictable_size(),
this should be fairly simple.

If you want to give it a try, I've pushed the code to:

https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/log/?h=3Ds=
wappiness-rfc-v5-with-kairui-and-fixes

[1] https://lore.kernel.org/linux-mm/20261025013103.2742885-1-zhangbo56@xia=
omi.com/

>
> Also, maybe we can improve the aging on imbalance to trigger when the
> scan budget is much larger than the scannable size (and priority is
> raised beyound default)?
