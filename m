Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355774;
	b=uICZTqbl08r5erwSpfGGAU792z4/4udwysdjNC7CxK0rwede3JKFY7XsWGQ9PzCoWgWi
	 4VyaAHdAblA0CzaoWNs5k9cWJUq3dRbDoHPhIMyCT8lgLXqgzPnSp6ixI1oC/RE/Mp/X7
	 HCzM4fbOQCh3BO/S2HJr/9/lreyomSjvzxe5Ff3DqNAodwReRSKJNTB0rNswtTsytcxHx
	 gtghMfIy7f7tEqG5y1MrjcJn3tpmqaeePu7Ob1htVNYz8LWOaSf0yW4VBMreiNtgRjtNv
	 fA1KI3/YAbI9lDdPC6l+382n2UA8Wat4OMK0LE0i6fKCQjXWWJkcajTdPHm4eVIz2SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355774;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=D9RbdabYHrbLRamg3GYETMJN16hdNDL32IGRIbktV74=;
	b=rZeZe8q9ona+SiL6wwWrGDVtSUKzdHAZp9bV8lSIygFlT/6odqXMf+x52jN3xo+YlOC5
	 Ax03egur/pf8PQ8I+aYRQ8SuwD14214RmNSRc4cxF9Tss3GwBCvSElOEem79ZIH/ihjTe
	 2t5qItK8R5L4fwwXW39pEzTfMRobua79AAfFAmPkH21W3bEVR2D1tnH5HZU1kPxd6xjwj
	 fKXoPkwQAIs0+ZbDX4ZcNctQYxJHcFxoYNxpl3YlzeWyygQ7r/2za+Nbf80VGWZTNtJoa
	 ruA2L9Plxrk4ErcokgiJkTzBrBvL9kMxde4pICA+UIOikT8Xb7h/nyQqJ6YNEcrWugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJBOk22H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FD606A330
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJBOk22H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D801F00A14
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355774;
	bh=D9RbdabYHrbLRamg3GYETMJN16hdNDL32IGRIbktV74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KJBOk22HBLkc6tfUu20Eh9xeMYaip5XleiEMISeXaxysRPDLpDmH612ksig07pAgv
	 oGgJBRSewh1EMfh0Bv/WzpbPc9TTs/V55rtx4I8NQ0m50YamECnqyZUWHJypRfOkMD
	 P5Hj0956d8kgNvlUz2NtH18CVGxcQ8/i8yyFt7b0qqh6JG/u4RC8Jhh4zOq/deY0F3
	 5wDcO0WKw19+2wz0E04QwPlazcNA1CYk3hEaqeAjFmvmL2ArEMjiP9EDIU/oVH8i8Q
	 s1FfPw+TcvBntwsSfbCWUUbV3SQL21EmvexAYuuYCPqdWf+Bc+TtTrWw9OGctpuKkF
	 O5PPkfnfxs+aQ==
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ed2f163a2fso816573e0c.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 16:09:34 -0800 (PST)
X-Gm-Message-State: APuU4Z9bTB+QsnxuKgytCneGFEAqBAI/5YoVC6ZpDp2s/9VdR8ezF43e
	J7T6GaREgoeaMdjbBBgnYEK6bQ7Iy9bI9vIRQipS2Teqz3WlYejD7g5OlajnVoXmZkzkob5ojxr
	J90pEgRAnH54xAKj597S00qeXGcbPuLo=
X-Received: by 2002:a05:6122:32d1:b0:5ec:e522:70d9 with SMTP id
 71dfb90a1353d-5ee1c44ac6amr261128e0c.16.1794355773513; Tue, 10 Nov 2026
 16:09:33 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110202025.25736-1-baohua@kernel.org> <20261110202025.25736-10-baohua@kernel.org>
 <sashiko-outbox-207746@kernel.org>
In-Reply-To: <sashiko-outbox-207746@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Wed, 11 Nov 2026 08:09:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zfU11fP=ekrVfFBb+nj=fs3uYAVZD8Fpm9dAS1fjZnpA@mail.gmail.com>
X-Gm-Features: AclHuK-sb02KucytR3FEDb8aRkGKMDn9o1EWXzBQq9iNIOSpuFJuwJQ7A_HDsNA
Message-ID: <CAGsJ_4zfU11fP=ekrVfFBb+nj=fs3uYAVZD8Fpm9dAS1fjZnpA@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] mm/mglru: Avoid placing rejected folios below
 populated gen
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
> - [Medium] mm: uncleared LRU_REFS_FLAGS in lru_gen_add_folio() [1]
> --
>
> commit 8ef17c06cc7c92ed5b07f7cf40e28066a3ac2fb0
> Author: Barry Song (Xiaomi) <baohua@kernel.org>
>
> mm/mglru: Avoid placing rejected folios below populated gen
>
> This commit passes the scanned generation sequence number from
> scan_folios() to move_folios_to_lru() so rejected folios are placed above
> the populated generation or in the youngest generation, and removes the
> previous folio_set_active() call from evict_folios().
>
> > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > index ab69b9930893f..f6f4bc9a704fe 100644
> > --- a/include/linux/mm_inline.h
> > +++ b/include/linux/mm_inline.h
> > @@ -332,7 +332,8 @@ static inline unsigned long lru_gen_folio_seq(const=
 struct lruvec *lruvec,
> >       return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen=
->min_seq[type]));
> >  }
> >
> > -static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct fol=
io *folio, bool reclaiming)
> > +static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct f=
olio *folio,
> > +             unsigned long scanned_seq, bool reclaiming)
> >  {
> >       unsigned long seq;
> >       unsigned long flags;
> > @@ -347,6 +348,8 @@ static inline bool lru_gen_add_folio(struct lruvec =
*lruvec, struct folio *folio,
> >               return false;
> >
> >       seq =3D lru_gen_folio_seq(lruvec, folio, reclaiming);
> > +     if (scanned_seq !=3D -1UL)
> > +             seq =3D max(seq, min(scanned_seq + 1, lrugen->max_seq));
> >       gen =3D lru_gen_from_seq(seq);
> >       flags =3D (gen + 1UL) << LRU_GEN_PGOFF;
> >       /* see the comment on MIN_NR_GENS about PG_active */
>
> [Severity: Medium]
> This problem wasn't introduced by this patch, but should set_mask_bits()
> in __lru_gen_add_folio() also clear LRU_REFS_FLAGS [1]?
>
> include/linux/mm_inline.h:__lru_gen_add_folio() {
>         ...
>         set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active=
), flags);
>         ...
> }
>
> Omitting LRU_REFS_FLAGS from the mask leaves stale PG_referenced and
> LRU_REFS_MASK bits set when a folio is placed into a new generation,
> inflating its tier access count and causing cold folios to be protected
> from reclaim at the expense of hotter ones.

Again, if this is unrelated to the patch, could you please
not report it?

Also, this is a false positive. If we need to clear the
refs, we already do so before calling lru_gen_add_folio().

Also, in mglru-fg, we intentionally keep some values there for
frequency guidance.

>
> [1] https://sashiko.dev/#/bug/linux-d2209941-6149-4b37-a97a-08c70d875d2c
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202025.25=
736-1-baohua@kernel.org?part=3D9

Thanks,
Barry
