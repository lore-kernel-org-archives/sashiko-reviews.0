Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793695222;
	b=IA/ALt0V/VH4islvDDvJzMhktIjLSzLmjJAVK5E5IL981nvONXK1YBjgFshDKg/Ev1+5
	 fuyafCYoiHc7DUHRCOe5e5+oW2E41xh5LT3gCKGL85scETH4v+9Hd+aONahR+PCE0Mh3W
	 r4CuvDJw0CPgQcwr3Zlhoy7UvvukbVbmpXpb5WXh1LjV/RwyVzgx3G9xArKWR7gHaKbSQ
	 2Mx9vCwTbeSrhtXXqO3IL4gZ9iiLFcLSmPeWZSFz/rZ5GX7SjZvvVa27CzS4/Nbv/cC0r
	 6M0n8Kf7dHiJuQZjWTcu2XKxwp0qS5hivA+ioA2YPagr+DFKuWC8rRH1aAQhiBLw7bQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xyaSToYButot7G2W/IDarlTzf5GO2BwZdE95MRsey0E=;
	b=z7//Q9wxXVoowmBrTYjsQQKv/xkD4ShLRVuwnFLpItwe0sBWpdFHp7M2nqsPV6DQgyRi
	 C4/kEathaiCP/TjHwWL8MavY2sAVciWtxzML7RgzKYLSVfn1s75JzFhrGbko3ZwHKRkU1
	 ccC46agOB0Rcc0+0PIJ5APMMGiXOTfevmRgt5M33kwWrkYs+YYdofMhK42WSAXiRZSoyV
	 opSqGA5ZMze3EpchCSQc7IS2Ui8BA+eoSSNr7Ee0/SRW9ZeFMm1eHxAtnQvHVQ0lFfIYs
	 D+wImXEHd4IDp4ZkHqyWnjN+WM1u52+EhpSl0FK/23XQKZHxG/k5SEiiVZ5Q79FIWuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cd4+9O+X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D99606A945
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D99606A945
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cd4+9O+X
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so34293715e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 00:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793695221; cv=none;
        d=google.com; s=arc-20260327;
        b=oUz2QnCX3Dw0tG6n1WWicZ0wkvFRSFF508tEBy+Nk6g3CaT8RPWptL0BeMrQA4U3e+
         bBSrrA4SYeIGEUUhzEcQXF+0MJEJK+q3YsEtQR5/HSsbBQrH5fo1c6JcrnzqFH06JFn8
         /YIGjDEsrxbZjXNTIW7mD/zJZYTEEAIIJms//mLILfsn9U3Bzl4Ca0aGKignCXmu/5SU
         TkzGQO8R+SXF7g17+LrjCZaguoEbWPEpjuZAaYfkj05+XAss+owOCkGGjAoiCTKmDwXC
         9dhAfhXuikosslqnegzkB5Pu+wUPgbleplO4q8Oh0jxlMjqmr9Itf2wuzxQNkV6Bj0I6
         lbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xyaSToYButot7G2W/IDarlTzf5GO2BwZdE95MRsey0E=;
        fh=kr0pKjlYi/f9G1IidDujwobZcKYg31YtDTi7/Ibdo/Q=;
        b=lvbDDqVt/0CWqERv2dzmd7VvuWs/ac6Z1PHpSZ9PNviUa1NO9inWcmnaRVRFPHgkDt
         MSeJcR0ZHcWPM0ZvZeKucoa/UDTB5xUOfOICajQbAlzR5X4GfTkwmfReCbJy9s7keZ3L
         Vv5D4fO+oasfDk/MUY2TtxODONOV8UxB+rzoItdj6MYz8dQFZ5+QrX/esO4vKjS8Ijbb
         G1pCJp3FTjbzI0g1i9k/gQgyoOy30WOdR4rSih8khURkNKCvq0mzlIaFYvfa/X/zYnBH
         bpji6y/Mox1bFszFctw2sV9dsLgSOFHQd0/8ec4MBslAHX3wBPhOSsSA2pgyK60WkcXS
         +vPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695221; x=1794300021; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyaSToYButot7G2W/IDarlTzf5GO2BwZdE95MRsey0E=;
        b=cd4+9O+Xck0wcQ93VZjB1eoluIVXDXSVa42IJ6sXEcRY2aAOyAkHMD06MQIVuYFu36
         KfcvwULfSxZ3hw1691CrufWx73hbwsFTnvB18EX9n3fDUWHZ9ZgXS9hGhcWNvfhxMgpy
         W5JvunW1ILDpmuEUmLNADfF/QG08vILxSyDNzfeQgA7zCKnb3gT3g0RDYQH3cI+VYJjd
         mwV2LFmy3UeRONwyzDiEmggDIdGpP6sut8LOwQzGxuBP181ql6n+aQ0foZdE6uA2i3cx
         Dt7/wSad4j+rK+pOSWe14BoCgVrqRC26QPBBNg8aDi32yESXHPfb1GpJqeicOsIGi6rm
         sxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695221; x=1794300021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyaSToYButot7G2W/IDarlTzf5GO2BwZdE95MRsey0E=;
        b=eGuFcQLUupqNoczTmH4uPsme+zRx7YQtox3qUxZaQf9EVG3ZecwU2mpuY38MmI2RIV
         MPwgKmiyq0LQDC+zUihVhci7mc8u/dTzFJ1LxgpYQmTHt7MLbCTXCNJZu+cRdPm3ojOm
         u/Q5Fto35LmHfrxAl0SZbNCefTwMpLjagY92EMLgGoMUoy3opNs6y9mdWHAVBtv7rL5w
         7Y65jvHvH17j+Kduxa5wfPvVqcUdemp8NlZpI+pjghjsg+y+whOooJUVOL8OEjpFl3BS
         NKcOJqsINT2SkIo6yHIspfsuqm250ahvokeo+qF+VLx9BKgSnRack9u4qjlxMCJZOCxY
         Ca3A==
X-Gm-Message-State: APuU4Z9NrVSZExqkwRw6Zb+l/JxtKREO4M92ax+QqMG68nGFZN3fnYzz
	OtmhsZrM7ZI/KaDyW2i+R87D/V367F/4gwn+8TF7ZIlSwbL7RuYUjACZC0F15L6cf/8YBghbOBF
	t8ndedHUSkueGhwFQUOl9FqnsDnk+j7w=
X-Gm-Gg: AYBFou0PvPxCrTky1BEOkS07dS6QYilh98gQQOYb6AWaVDBojqFl4sXvFcmUOGdeTv0
	wgzG1wP1G6OK47QzRqlrrTxYSjrAp8Lk83Q0MavXGrucDm6fHe9t5+zgCFjc03FpDkt9T8kGiQZ
	3mIhCUaOisg6PJMXpDYVZcJGm2DbPCm241H4TMdjqOYc8uf57vq5kQIW5aVJID96AY7DETufP3k
	7KMGoKCM5Y9I8JtWgJx8McLsjbiFXQzEiBuMlDlAjx9wEL/ZUEQrtfb80AHa4swp3RIsfZgFb9g
	/xx2f5v+3KLVW+jxcgz6GhT3dolxMpn2prTXZHt3oTy2QQMnMeonIVVcsNJT6THkwqTKjrXeFXL
	d4zZIks/8d4Ce+JcbnTE9WLH82cCg559FQfmtCxXKHFIUCwHJiX6hVDAsbP5rCD1+gD09jc0=
X-Received: by 2002:a05:600c:4f82:b0:4a1:e92b:ae4a with SMTP id
 5b1f17b1804b1-4ac1889d525mr259315445e9.21.1793695220188; Tue, 03 Nov 2026
 00:40:20 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022220203.91911-1-baohua@kernel.org> <20261022220203.91911-9-baohua@kernel.org>
 <sashiko-outbox-183274@kernel.org> <CAMgjq7DjYS01BQAWnr=EdbhM1gbX+K+pXM6z04UEKg_NLU3CNw@mail.gmail.com>
In-Reply-To: <CAMgjq7DjYS01BQAWnr=EdbhM1gbX+K+pXM6z04UEKg_NLU3CNw@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 3 Nov 2026 16:40:08 +0800
X-Gm-Features: AclHuK_DPE7MUhj0Pm7VEX8dloQMmjTTCcJJc1QEhmoeYFhGDxuV_2DIy0Ds_8w
Message-ID: <CAN_Opa-dh59YjHOLNKy2MrXiq2SvdFCsCwz=niF5TyMYvxR5nw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 08/14] mm/mglru: lift youngest gen protection for
 higher priority
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

On Sun, Oct 25, 2026 at 2:09=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Sat, Oct 24, 2026 at 6:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] mm/mglru: scan_folios() scans expired gen < min_seq at DEF_P=
RIORITY
> > --
> >
> > commit 1329290ce5f86b7de9b77d6b22e4b265f16348ae
> > Author: Kairui Song <kasong@tencent.com>
> >
> > mm/mglru: lift youngest gen protection for higher priority
> >
> > This commit adjusts scan_folios() in mm/vmscan.c to choose the target
> > generation sequence number based on reclaim priority rather than using
> > lrugen->min_seq[type] at default priority. It aims to protect younger
> > generations at default priority while allowing higher-priority reclaim =
to
> > scan newer generations step by step.
> >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index fed39b0422e01..d1e14001f9346 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -4930,12 +4930,14 @@ static int scan_folios(unsigned long nr_to_sc=
an, struct lruvec *lruvec,
> > >       VM_WARN_ON_ONCE(!list_empty(list));
> > >
> > >       /*
> > > -      * Respect the gen hotness distribution at low priority to avoi=
d
> > > -      * aging and scan cost, but prefer to satisfy the reclaimers re=
quest
> > > -      * when under pressure to respect swappiness more and reduce IO=
 cost.
> > > +      * Respect hotness at default priority, and only reach into the
> > > +      * newest generation when under severe pressure, so hot folios =
are
> > > +      * not evicted as soon as priority is raised.
> > >        */
> > >       if (sc->priority =3D=3D DEF_PRIORITY)
> > > -             seq =3D lrugen->min_seq[type];
> > > +             seq =3D lrugen->max_seq - MIN_NR_GENS;
> > > +     else if (sc->priority > DEF_PRIORITY / 2)
> > > +             seq =3D lrugen->max_seq - 1;
> > >       else
> > >               seq =3D lrugen->max_seq;
> > >
> >
> > [Severity: Medium]
> > Can this cause scan_folios() in mm/vmscan.c to scan an already-evicted
> > generation when a type only has the minimum number of generations left?
> >
> > In try_to_shrink_lruvec() -> evict_folio_lists() -> evict_folios() ->
> > scan_folios() at default priority, when get_nr_gens(lruvec, type) is at=
 the
> > minimum (2 generations), lrugen->min_seq[type] is lrugen->max_seq - 1, =
while
> > scan_folios() sets seq to lrugen->max_seq - 2 and passes it as max_seq =
to
> > lruvec_populated_min_seq():
> >
> > mm/vmscan.c:scan_folios() {
> >         if (sc->priority =3D=3D DEF_PRIORITY)
> >                 seq =3D lrugen->max_seq - MIN_NR_GENS;
> >         ...
> >         seq =3D lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx =
+ 1, seq);
> >         gen =3D lru_gen_from_seq(seq);
> > }
> >
> > In lruvec_populated_min_seq(), because min_seq (lrugen->max_seq - 1) is
> > greater than max_seq (lrugen->max_seq - 2), the while loop is skipped a=
nd
> > max_seq is returned directly:
> >
> > mm/vmscan.c:lruvec_populated_min_seq() {
> >         min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> >         while (min_seq <=3D max_seq) {
> >                 gen =3D lru_gen_from_seq(min_seq);
> >                 for (zone =3D 0; zone < zone_limit; zone++) {
> >                         if (!list_empty(&lrugen->folios[gen][type][zone=
]))
> >                                 return min_seq;
> >                 }
> >                 min_seq++;
> >         }
> >
> >         return max_seq;
> > }
> >
> > When scan_folios() previously scanned younger generations (lrugen->max_=
seq - 1
> > or lrugen->max_seq) at elevated priority while get_nr_gens(lruvec, type=
) had
> > fewer than the maximum number of generations, sort_folio() can move fol=
ios
> > with a stale folio_lru_gen() value (such as after __lru_gen_reparent_me=
mcg()
> > or when inc_min_seq() skipped draining old_gen) into that expired
> > lrugen->folios[gen][type][zone] list:
> >
> > mm/vmscan.c:sort_folio() {
> >         /* promoted, or moved due to reparenting. */
> >         if (gen !=3D min_gen) {
> >                 list_move(&folio->lru, &lrugen->folios[gen][type][zone]=
);
> >                 return true;
> >         }
> > }
> >
> > A subsequent default-priority call to scan_folios() will then visit tha=
t
> > expired generation (< lrugen->min_seq[type]) and corrupt active/inactiv=
e size
> > accounting.
> >
> > In addition, in lru_gen_seq_write() -> run_cmd() -> run_eviction(), deb=
ugfs
> > eviction runs at default priority. If a user requests evicting up to
> > lrugen->max_seq - 3 when four generations exist and one type has alread=
y
> > emptied lrugen->max_seq - 3 while the other type still has min_seq at
> > lrugen->max_seq - 3, wouldn't setting seq to lrugen->max_seq - 2 in
> > scan_folios() evict folios from generation lrugen->max_seq - 2, exceedi=
ng the
> > requested seq bound?
> >
>
> Looks a false positive, though it is tricky. A folio on a generation
> list is only ever promoted, and min_seq[type] is advanced only after
> the old generation has been drained by inc_min_seq() or verified empty
> by try_to_inc_min_seq(). So when a type is down to MIN_NR_GENS, the
> max_seq - MIN_NR_GENS target is empty, not a populated expired
> generation. Lazy folio flags and the non evictable skip can create
> temporary skew, and reparenting can look odd across generations, but
> that skew is transient and cannot survive until a DEF_PRIORITY scan
> targets that generation. sort_folio() also refuses to promote from the
> last live generation.
>
> For the debugfs case, lruvec_populated_min_seq() starts from
> min_seq[type], so the type with min_seq =3D=3D max_seq - 3 scans max_seq =
-
> 3 while that generation is populated. The type already at max_seq - 2
> was scanned at max_seq - 2 before this patch too. Not enforcing the
> requested seq per type is a separate pre-existing debugfs issue, not
> caused by this change.

I traced this and agree with Kairui:
the gen below min_seq[type] is always empty because inc_min_seq()
drains it entirely before min_seq advances, and try_to_inc_min_seq()
verifies emptiness before advancing past it.

The transient skew from reparenting cannot persist until a DEF_PRIORITY
scan targets that gen. False positive.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
