Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344925;
	b=vkHFmmpxT3S5XZNPvOFwl1/OzZAkMuFZPPXGQ38XioBgJW/GaWrpLJg45Wjyjj4oKua9
	 epbc+2k7bQvgN3Gus6+hX9gnjTJsNcdh55jX8/8BIiN1zAcpkJ4azER2deOgPB3ipR8G+
	 LJzHFnWpvGf3XqNPhRHZtmtGJpE/uDa6J0GtHfrWcVuylnQbhJGlwxvYGP7V6b7oSjGsk
	 PxWjsrn5Gj2+cpdp9wBoTnI4vG6MVCjr+B1zG09eqozJ5JltgXWJeQHZcyALo6SfXj6nZ
	 ciuNwzP20usat7J2yLtZgX21EDyh4XVFvTrY+krhhWzABIlI/dJCQ4YREHypIcoGeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344925;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=avSfIEBCYCAjqR9F/laL5XImOVS++483HV3bkyt3Yrk=;
	b=5MrxLPwKepE+HzfHSmYRhDGDPvHyHDkC/7Ao4jRIt15lDEGwL+UF5ixM5PAnyR5IK4lW
	 If2BsiyX6GA+Im0Qy9/yan2hIXX5ep4AqBHv58KtFeaLOAYqHUErwAt4xmol3Yi7VPOVS
	 uLuy3pK6ufQCvCZ6l1ipUqsQbd+54achBjGOX3phKbkerzqzoeRGJBJyWyNzhcEwe+RBy
	 nFZJurHF5tCwXwcqOkcdobyk389PSd0SqM+KV1QAocVXTHvlsx+jS6vB6wbBWRGY5ZOLA
	 rzafQYDKytxvVmVvUZirWH/SmWag7yXqSDiCJr7vQb0Gner/h/5V5Tg9oMbB4p598Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O7Lw/W9K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7C4606A32E
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 21:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7Lw/W9K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9719F1F00900
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794344924;
	bh=avSfIEBCYCAjqR9F/laL5XImOVS++483HV3bkyt3Yrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O7Lw/W9K1gEOTKogDePOMboKBEIgw44+GtVNN2K6IGGpoKZ2WGoxecsLAOX/o8GAN
	 nbDHTmheAURkpRElPva2il21piDVtf4piQPgQbM+GfttKB6OtUQ2z9IgMom7SKYEMZ
	 MKYIM/CWQhoSP9BujolQxOMdfpc7PjZZO2u40JIg6oIKxaV6tjPkW4uSfmPKY2aOsd
	 cTGJ3h9bGnhcEnmRcLrzmaYNmfcRQdF7tWHwJWeu2ciXDbN8jQQP0ueozB+8HusUo+
	 Oc1FD6eJfPknjkOePKC3ADTtxPHl2xGjYt146D4dFHYVqgGA+JZhbzz+sqzAsPV/Rr
	 pXaZxABz+VfZg==
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93cb9e9405fso135755085a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:08:44 -0800 (PST)
X-Gm-Message-State: APuU4Z8ah2qqID0E9+xdyn8Qeed7fUAc7ZMBEA+1EwCba3qT3fiup02j
	y4FYVVmqi3g0ThtghVnIQzW8Q9w6DVz+d2KK9w5bVH2NWXieoeJsLiWnzTQnpC3t9OgrGxLG7tQ
	toRsdh2T81btk30ckKCVZAknNhKgAhp4=
X-Received: by 2002:a05:620a:2628:b0:93f:565f:e46 with SMTP id
 af79cd13be357-947afff4ee6mr33367385a.52.1794344923786; Tue, 10 Nov 2026
 13:08:43 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110202025.25736-1-baohua@kernel.org> <20261110202025.25736-12-baohua@kernel.org>
 <sashiko-outbox-207748@kernel.org>
In-Reply-To: <sashiko-outbox-207748@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 05:08:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zEsCkb9JuRTC-k5-xvQ5kQddHF7Puj8uvUwB1GYsvkbw@mail.gmail.com>
X-Gm-Features: AclHuK_FV7UORW-D6TUozHp0AeI3TaZRQ8Kdbk21PFOTfmD3L-0EsvrYHcJnIFw
Message-ID: <CAGsJ_4zEsCkb9JuRTC-k5-xvQ5kQddHF7Puj8uvUwB1GYsvkbw@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] mm/mglru: Restrict eviction accounting to
 eligible zones
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/mglru: undeclared identifier sc in lruvec_evictable_size()
>   breaks build
> --
>
> commit bd1d7f7120c80acf045074ac097e502f51cacdb1
> Author: Barry Song (Xiaomi) <baohua@kernel.org>
>
> mm/mglru: Restrict eviction accounting to eligible zones
>
> This commit adds a max_zone parameter to lruvec_gen_size() so that
> lruvec_evictable_size() and lru_gen_imbalanced() only sum pages from
> zones up to sc->reclaim_idx.
>
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 8014a90e4bc29..bfc9789a999ac 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4220,7 +4220,7 @@ static void lruvec_evictable_size(struct lruvec *=
lruvec, int swappiness,
> >
> >       for_each_evictable_type(type, swappiness) {
> >               for (seq =3D min_seq[type]; seq <=3D max_seq; seq++)
> > -                     nr[type] +=3D lruvec_gen_size(lrugen, type, seq);
> > +                     nr[type] +=3D lruvec_gen_size(lrugen, type, seq, =
sc->reclaim_idx + 1);
> >       }
> >  }
>
> [Severity: High]
> Does this break the build when CONFIG_LRU_GEN is enabled because sc is no=
t
> a parameter or local variable of lruvec_evictable_size()?
>
> A later patch in the series, commit "mm/mglru: Avoid scan anon while
> swapcache is low for GFP_NOIO allocation", adds struct scan_control *sc t=
o
> lruvec_evictable_size() and updates its callers (lruvec_is_sizable(),
> lru_gen_prepare_scan() and run_eviction()), leaving this commit and the
> intermediate commits unbuildable during bisection.

Oops, my bad. I initially placed this patch at the end of
the series, but later decided it would be better to move
it earlier. That caused unbuildable during bisection.

The entire series is still buildable, though. I'll fix it in v7.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202025.25=
736-1-baohua@kernel.org?part=3D11

Thanks,
Barry
