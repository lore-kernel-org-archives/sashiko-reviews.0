Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345933;
	b=s0imQbDSg26iIyI4ix2Dsa0EIglSdawezs5rT2UwkuJhgOVo3u7rQwRTOIwIxPcSg71g
	 /XC8VBiNzblqJzbKksHcfkurLdFUQsttMoAB66LSpFCTe5wUl4zByfeIG1HSlJ/I799Go
	 ayJ3M1MUWzNoLomxVkGZ9nNrmzYB2HDiBdKx/Qt8g8N5QX3GoEwgMRB5rgSyM9hy4hI3S
	 CJFBKs/5TwUavRUOARnh5UUhVa//VAD3Yh+J3VTNkOKGRZQTfGhW5XXk+e1K/MTuHd4Q6
	 sC8feCpyRLsAaGo+TAzFtWUflexw7xweJBRol3bLNO4DycsfmYz1zd1ZwAQ+vIkId6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345933;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=y0gm0TGoxut+75ypiNOEVMsTMwXFowvyRq5zMv35qXg=;
	b=VLJCxUmyS1Mci4okgRSp8wtX6C2SkoS/FG4ttJUMk4vRXNuGxHZ7YK3kZZXOmJV/TQ1b
	 yK8gmVUJZRPb51g7APlS5U7QnX1GCNNJJuCHR2MtP2qhSe5A+NGMKQ6AiLyYrMOPYwH/c
	 53gLZFevsSubKU+BjlPGmO2OvSbOpkoLvwDlRCuXK67rpn2pgT/x2bExkiUdWUba73K4y
	 TPYJBgkyDMReaMPFqxO7ND0/dPN9OPh84o0e/IibhSGHrH3xC+hnc7iCTYcSxqpJ/6bGK
	 0OO3CVqkRNAoGE83voxat0orSztaXIGeLck5O1NYovIy7RWqRfsWeOnElNX0TY/Izjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1CTBC5V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE326606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1CTBC5V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D6A1F0089F
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794345932;
	bh=y0gm0TGoxut+75ypiNOEVMsTMwXFowvyRq5zMv35qXg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=o1CTBC5VQhREW4/n9g1IdTTVaaakAGNQqdYf0hhDAnN04rdPDTtRV8bYQ8UPfo43T
	 5uBuMI3o2+ykYO1/ork2Q4x1AwAB9G8mtxKQ7BRfuG5Xi1HJg/auU9PtK3fHXE4p9a
	 uhQhXLShQ2boZwCPOuYHQ8dJ/tY8XPb+xeYraxeaQtgEqPotudzrSrHPgsb/OQNJUq
	 XqCetp7TDwQqbLoa2EQAwg2SkK/IX8fq5l+IdjmMK4nt0XgSTH5hm/T4Hqsm/qPGev
	 5CfRQ4ficivHYLLF8/Bt+i7LA91fQ+V2D9+D8IyqsTSxqxMNdLT/qOQbUQE7Gy98Ef
	 m05PkPSQ4gUgw==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-943e8d35f74so218144285a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:25:32 -0800 (PST)
X-Gm-Message-State: APuU4Z+i2rXrzSb4yOArOSw1iZCx6Q1buOHZSPXFOrYOQkUEoHsrVMku
	WGVYqChR+onJSAS+DXYzmPAICy4h0mC0YNIDN0YPRptaUsWaFawRqXQeovH0USEGevTIIy5SxvZ
	VGbvOD1vMM53JHgFReeUA2p7DaoIHIHA=
X-Received: by 2002:a05:620a:1d08:b0:93e:e425:22b3 with SMTP id
 af79cd13be357-947b00d6dc9mr39116285a.82.1794345931716; Tue, 10 Nov 2026
 13:25:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110202025.25736-1-baohua@kernel.org> <20261110202025.25736-6-baohua@kernel.org>
 <sashiko-outbox-207742@kernel.org>
In-Reply-To: <sashiko-outbox-207742@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 05:25:20 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xREpXsexDfepfpM0MOX9iepBe7-fr-WuGAV=da0w2eyg@mail.gmail.com>
X-Gm-Features: AclHuK9NqIDdOADDWra6OtrXoYnbTURFVTVsaxnZwIx1C_wxpmnfiMYIQg1pKQw
Message-ID: <CAGsJ_4xREpXsexDfepfpM0MOX9iepBe7-fr-WuGAV=da0w2eyg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] mm/mglru: skip zones above reclaim_idx instead
 of rotating them
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

On Wed, Nov 11, 2026 at 4:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] mm: inconsistent PGSCAN stat accounting in scan_folios() [1]
> --
>
> commit 91b0962145533fb9dabae36c077150538170ace0
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: skip zones above reclaim_idx instead of rotating them
>
> This commit restricts scan_folios() and lruvec_populated_min_seq() to zon=
es
> up to sc->reclaim_idx rather than rotating folios in ineligible zones to =
a
> younger generation.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index db0a8a3e88872..6b16706779744 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
>
> [ ... ]
> >                       list_splice(&moved, head);
> > -                     __count_zid_vm_events(PGSCAN_SKIP, zone, skipped_=
zone);
> > +                     __count_zid_vm_events(PGSCAN_SKIP, zone_idx, skip=
ped_zone);
> >                       skipped +=3D skipped_zone;
> >               }
> >
>
> [Severity: Medium]
> This problem wasn't introduced by this patch, but should scan_folios() pa=
ss
> scanned rather than isolated to mod_lruvec_state() for PGSCAN_KSWAPD and
> PGSCAN_ANON + type [1]?
>
> mm/vmscan.c:scan_folios() {
>         ...
>         item =3D PGSCAN_KSWAPD + reclaimer_offset(sc);
>         mod_lruvec_state(lruvec, item, isolated);
>         mod_lruvec_state(lruvec, PGREFILL, sorted);
>         mod_lruvec_state(lruvec, PGSCAN_ANON + type, isolated);
>         ...
> }
>
> Folios that are promoted via sort_folio() or skipped are counted in
> scanned, but passing isolated here omits them from the PGSCAN vmstat
> counters and underreports the scan rate compared to the classic LRU path.

If this is unrelated to the patch, could you please avoid
reporting it?

I also think this is a false positive. MGLRU uses
sort_folio() to lazily promote or protect folios, avoiding
unnecessary isolation. We don't want to count those
folios as scanned.

CLRU has no such concept, so nr_scanned is roughly equal
to the number of isolated folios, except in some special
cases, such as folio_zonenum(folio) > sc->reclaim_idx or
!sc->may_unmap && folio_mapped(folio).

>
> [1] https://sashiko.dev/#/bug/linux-ebd28175-5aad-4454-b9f3-a9510e3c4655
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202025.25=
736-1-baohua@kernel.org?part=3D5

Thanks,
Barry
