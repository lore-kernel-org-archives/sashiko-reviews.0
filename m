Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814D36D9EC
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736964; cv=pass; b=MG6wSekX1JsYA1af6XBP/zUSYBxz0Zl3GvomIPe83OmUUjqQ141NkSOTuTaudCuG11JptsXML9mUpWhqyStTXIHUq1smIUHeuprFHyOKltpLt4iDQBdHiemvaDBRDPAwiNabg1KzXy8CtpkojZa8HoCouWSavUCrhw5R2JvPkeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736964; c=relaxed/simple;
	bh=qGOVOiwHRNQNT68Orvjie8HDe6oW1vyTxCt5iXKLSew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsz1psHQ8gUInAOch41Qt1VqEpkPTHk0znNClqor7p0bbfj6aOFQgxhWiys9sOB0mKfCfAUpD41GUUz8BIorDiRoXD/DzLKCvJxBKB22XQaLF12XNFugFavjA0tV/ljRqNgwnFvZ8AyVrsvUkukEeau5BD28qup90CVN8Hsr/PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPZAu62q; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPZAu62q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so20634855ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 12:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786736962; cv=none;
        d=google.com; s=arc-20260327;
        b=sphR92TUyHVWCviQfe7M6M0wwwa29VaExZq0pQVCAzLDuMrVtQ7VrLGq91d1DCqLhi
         C3xMdm6cM2P63o4JNTPG4v+Jrenm91j8T6VvzZhoiD7qj3tvNXkJD9r4oxK6ljpSudb/
         FL1+ZB845KWrqwHM7ZyOff4I6KRvK2eIcB6ioR/oRnyCb12w8bQG/uGBvLOrMjyu5OF1
         RB1MUM87r8wpv+BLvdBSFuECBOXc31BGh6JBYaDQoZAEABaQGbtdk5qu4mYvc5prM7dR
         Gu0Lmb/dlOjBHchZsINB1FEybp6FE7tqV0krlHwQ5NF5aqZl22VhtQcfHXa2GNRzoRe9
         LspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5kP1ALyjd1085hsxnV4piVOMuLWzW9JRl/gUNLpSDo=;
        fh=O5owK11TerTtccFK7JD0x6Tbb7Z1jlhTe5Pxy677W3Q=;
        b=fMUsKkarob337VPMO5e0QlxwZjV6Q4l5rpZ7fvYg0IVvIqkKX8hwQJLYzqLxoA/ESV
         NF8KYnjk4YnoRgOHWlqKZMnZ0+RGoHu8D3qznHaOl7vEdN4RTeABFWnCvdspBuMSahUe
         VhCkl03h0pO0LVgexfN2wvX6VM08T7M9WB7VKkitUlvpMS23N1aoSVtG1A9e2c3+HXhI
         hDuXcTgLmGNx7jh7LYewzJenu6LFZnyvIzSLKr7JriSYgUUeML/i2PI0CxmwrI8jfiNX
         lJ8vuuuDQ8EN9/0DB36/YgAla4376vQgiu5NW0tGaV7OMA5pCyOOWc+cT1ab3YMWpYfa
         8Teg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786736962; x=1787341762; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J5kP1ALyjd1085hsxnV4piVOMuLWzW9JRl/gUNLpSDo=;
        b=sPZAu62qHbb4XN6jJYE5l+9yBdRpAeeY20qHi+SD+3UZMP4DO1/4ctDydj9fen7N4k
         WYmu6gCVXix/ElpT8YkJYLNIIKhWYIqLSEXmCciuNMeB8Hce60EQgYRzxhHK7LcNSSUg
         3jaqAh4kPo1KFu/Ty5Dys4nGWw9Y3ADxZAZMxsYykiMzmkVST46RVTEB673hICv0vVf8
         +1uuRcS+8/zY1pdW/PZfNQXSmOJ2cZP6k/l7P+gtjX0kE7XYcvbE8dXswhZuapX9taF/
         51q9oKEYgF5IppxfOwU0Zjut1eAQvzRr0zda8VBh+OfodQNoncX+EAMhumgw4qP2QaXL
         0SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786736962; x=1787341762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5kP1ALyjd1085hsxnV4piVOMuLWzW9JRl/gUNLpSDo=;
        b=WnUzzq9ReNDkr2aT5sSrXVO55NhRfYYOgStsW1X6aRjD9LgD7IGR5Jb1kzBMncvDgJ
         LumL5JHkUzBLbll2T2toEKIoFiyr/BEf9ilsW5xBFCax2fkukbI/mNjLDP634LedaabV
         gRcK7E4KtEf2eLqL7JrHxWTHuD+THUyL8HBKG5k1UzeNQ2rD05DHuXrzBpqelh9jhkE4
         T2e/JlOGZQl0tkJ88ZIt9FQpG/QW3WChlZ68z0zlhmpYvx9ZT6LCtYLJTaAISEup0jZD
         DtbEjurvhFmzKrCm2cf5nfZJP69ptpanzhlNReW4OcZ18UEEkxldD925cqxoZP3HqJaw
         dWhA==
X-Gm-Message-State: AOJu0YzfKCUxOOO87i/+Fec6APfKaQad4hrZTcSl8HAfeeBhW5pUc91g
	7U1CYUmKo9Ct99+SvSQ4c0xTW4BAsIq7O0IPTszqq7cWvlIkqCP6V+DVtcX4s4xnx15EL3NwZEv
	jIZ3XpxIqx6391seQiVdLy8u0oB9CN8OW2A==
X-Gm-Gg: AR+sD13DI+1ADy7Q7yaNAKlzUtcjYEikXpaMCi0aMvVLPOpx8mykKCOGXs0jgfEO5HP
	b0sFABBzCHM4/c/eimjKuVx+74jeZn5t+Dsq10Ps9fBEcBi3/O9bfezqjRgZy5+Iha5kfs2j26a
	tyHNDmySc4LtXpKpEF+CqyN7xRSaD6fpdskqmZZNRDmiIqoUIxLSLX8p3848l0Gsh7WxtFes7dW
	1XlO6GoLJBEB2sRFrdh5KEZV0lO9Jj85YzKRw2+o9T7SbUAggaJBXpPRmF6tCzHLaW11OoojRFl
	//4Ilre9Tov4LcVtxT56AxegBgHdzyJD9sZbB/ynHlAXuU1cMbWBRtESMMQ7KC2QVUWMWCUcK7i
	QAIa1W+CZVk+KjxpWfXcMI76qrg==
X-Received: by 2002:a05:6a20:3d1c:b0:3c6:3c5b:f2e3 with SMTP id
 adf61e73a8af0-3cc72086fafmr9453450637.33.1786736962191; Fri, 14 Aug 2026
 12:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408-rhash-v2-8-3b3675da1f6e@meta.com> <20260813235957.0AC751F000E9@smtp.kernel.org>
In-Reply-To: <20260813235957.0AC751F000E9@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 12:49:09 -0700
X-Gm-Features: AUfX_mzlCnOebkHVgsGP6fMU7MY72U9zRRTzcb8FrV8GCPduodG9VRaLQShauOw
Message-ID: <CAEf4BzYLLOoiujaFO5GSra37i-DR-T4CGgU_zL-HGp2HEK2N2g@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next v2 08/18] bpf: Implement iterator APIs for
 resizable hashtab
To: sashiko-reviews@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is it really a good use of tokens for sashiko to review old patches
that have either landed or were significantly changed since (and
probably got a bunch of new revisions sent), or just plain forgotten
by now?

Did something regress recently? I'm not sure this has happened before
until recently...

-- Andrii

On Thu, Aug 13, 2026 at 4:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Uninitialized memory read in `last_key` when `seq_show` overflow=
s.
> - [High] `rhashtable_walk_enter_from` resets iterator on deleted cursor k=
ey, causing O(N^2) complexity and infinite loops.
> - [Medium] Missing __GFP_NOWARN flag in user-controlled kmalloc for map->=
key_size can lead to OOM splats.
> --
>
> --- Patch [8]: [PATCH RFC bpf-next v2 08/18] bpf: Implement iterator APIs=
 for resizable hashtab ---
> commit 226ce1988038cf4876ff0a72b5ae8e5ebc263151
> Author: Mykyta Yatsenko <yatsenko@meta.com>
>
> bpf: Implement iterator APIs for resizable hashtab
>
> Wire up seq_file BPF iterator for BPF_MAP_TYPE_RHASH so that
> bpf_iter and bpftool map dump work with resizable hash maps.
>
> > diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> > index 4611671bf8e74..5ca4d26e70178 100644
> > --- a/kernel/bpf/hashtab.c
> > +++ b/kernel/bpf/hashtab.c
>
> [ ... ]
>
> > @@ -3205,36 +3218,113 @@ struct bpf_iter_seq_rhash_map_info {
> >       struct bpf_map *map;
> >       struct bpf_rhtab *rhtab;
> >       struct rhashtable_iter iter;
> > -     u32 skip_elems;
> > +     void *last_key;
> >       bool iter_active;
> >  };
> >
> >  static void *bpf_rhash_map_seq_start(struct seq_file *seq, loff_t *pos=
)
> >  {
> > -     return NULL;
> > +     struct bpf_iter_seq_rhash_map_info *info =3D seq->private;
> > +     struct rhtab_elem *elem;
> > +     void *key =3D *pos > 0 ? info->last_key : NULL;
> > +
> > +     scoped_guard(rcu) {
> > +             rhashtable_walk_enter_from(&info->rhtab->ht, &info->iter,
> > +                                        key, info->rhtab->params);
>
> [Severity: High]
> Will this silently restart iteration from bucket 0 if the cursor key is d=
eleted?
>
> rhashtable_walk_enter_from() looks up the provided cursor key to resume
> iteration. If the key is missing, it returns early and leaves the iterato=
r at
> bucket 0 (iter->slot =3D 0).
>
> In __rhtab_map_lookup_and_delete_batch(), the batch operation deletes ele=
ments
> and returns the last deleted key to userspace. On the next batch syscall,=
 the
> user passes this deleted key back as the cursor. Since the key no longer
> exists, rhashtable_walk_enter_from() resets the iterator to 0.
>
> The inner loop then executes while (total < max_count) holding rcu_read_l=
ock(),
> rescanning all previously emptied buckets from the beginning of the table=
.
>
> For lookup_batch and seq_file iterators, does this yield massive duplicat=
e
> outputs to userspace and enormous RCU stall times?
>
> > +             rhashtable_walk_start(&info->iter);
> > +     }
> > +     info->iter_active =3D true;
> > +
> > +     elem =3D rhtab_iter_next(&info->iter);
> > +     if (!elem)
> > +             return NULL;
> > +     /*
> > +      * if *pos is not 0, previously iteration failed on this elem,
> > +      * so we are restarting it. That's why no need to increment *pos.
> > +      */
> > +     if (*pos =3D=3D 0)
> > +             ++*pos;
>
> [Severity: High]
> Does this pass uninitialized memory as a hash key if seq_show() output
> overflows?
>
> When reading a BPF iterator, seq_read_iter() calls bpf_rhash_map_seq_star=
t(),
> which increments *pos from 0 to 1 and returns the first element.
>
> If the output of seq_show() for this element exceeds the initial seq_file
> buffer, the buffer overflows. The sequence machinery reallocates a larger
> buffer and calls seq_start() again.
>
> Since *pos is now 1, the code executes key =3D info->last_key. However, l=
ast_key
> is only populated in seq_next(), which hasn't been called yet. Thus, last=
_key
> remains uninitialized from its kmalloc(..., GFP_USER) allocation.
>
> > +     return elem;
> >  }
>
> [ ... ]
>
> >  static int bpf_iter_init_rhash_map(void *priv_data, struct bpf_iter_au=
x_info *aux)
> >  {
> > +     struct bpf_iter_seq_rhash_map_info *info =3D priv_data;
> > +     struct bpf_map *map =3D aux->map;
> > +
> > +     info->last_key =3D kmalloc(map->key_size, GFP_USER);
>
> [Severity: Medium]
> Does this need __GFP_NOWARN?
>
> Since BPF hash map key sizes can be extremely large, requesting large
> contiguous memory blocks without __GFP_NOWARN can fail loudly under memor=
y
> fragmentation and trigger high-order page allocation warnings.
>
> > +     if (!info->last_key)
> > +             return -ENOMEM;
> > +
> > +     bpf_map_inc_with_uref(map);
> > +     info->map =3D map;
> > +     info->rhtab =3D container_of(map, struct bpf_rhtab, map);
> > +     info->iter_active =3D false;
> >       return 0;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408-rhash-v2=
-0-3b3675da1f6e@meta.com?part=3D8
>
