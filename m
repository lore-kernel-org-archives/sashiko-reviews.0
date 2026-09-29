Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5152E046
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699835; cv=pass; b=KtcyOgQnfd8qNzdGWZXJCIOhNCxDHE4VNuzJ4zKvd7sothnhcdpqgti1kVv6p4jPalAtm5i4hzCC6R1ln/1lckEoOzimL+kvghoqEYR8WlSjSpxPnuHfAYf3DEzadTHhj0nEy6HjuSxqFIEkgVwhlNToFxFNhQARShc37WDBKDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699835; c=relaxed/simple;
	bh=gpWvrYH4Wp1rA5cCsHTR8gtqaJv0xEqoXZZCd8jv1EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhBPYZ/MMvl0N40vIWO0rjNu5cQaiMGIxg1dBcJVGXgiDvRQPMM74E6ZsMPJL4jNXhahHVizQd00ZB1kKAhttyCfUUGCZm52VpUTcx+nOiJxaAA5+yKwajYHlX/LVp3k6kqfH1w2W6kauPSnNmQsdFxX0k0QYSJLOzbPaQ25ECU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U82KqrDR; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U82KqrDR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a00ef417bcso52255e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 09:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790699832; cv=none;
        d=google.com; s=arc-20260327;
        b=gAnfxqRZ+bRr9iO+VqjajIJvoyOYg7otG7gjyacfCKJR4wxbZitQarPWubQo/rEV5l
         8XSRwT3Txtv9jdguLsrkNgsMGFrXpppIXhpb6SOm9583wGBxXEOBaeXj6rBd4wmlsxwJ
         FsUKp1ER490IUBAY4lOoXZNAMT9m+6BYhjM4jkRY1wukwbFURBfYAVSVj6zQ+M8z/H6t
         zbnjYgxd1Hr8ID2bBKBSZU1SbQp+E8ExBh0+A7C6cp1x/mtPSPJc+AGLmutWwvifcW0B
         vUrXWBWCg0YJfGbQNIBHMmtQKJQpAnKEowxXrLagTaHEJv7pk/+rRJ3Lqm1TcKD/0ICj
         MJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=le2DxLCPEDrr2PRm44y3xvUUCI3+IOhlaSJ1r852sqE=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=mzA1DNn4Oyex0GuwDa8N0twfHrEtLylPnNXip70K2fjDW5yfqKxjAiAQ94ad5p3Uky
         u7qNkn8J0/ka4nUx9b52QEwgRPZ4ZJv6zzGr2osYbyb9HpZn5YT9VVLB7yej4gekys1S
         6zTETHw8HYeblYKussJDOPpApXxyPHpqzkq2W7n1gdYIgoehJJNqdrXM1dREIERmmh3c
         o1E7hSnr/W7cjvJNzhUOlLr+2UssuqPVzgEECsJ4EO4VtiL562jd6zM+RJA4hCqdyBDQ
         gw+53MiDblIdgpU4Ml3N03ADiedqqOnQZkT94NL4odEbSogw/nz8JrK5hmh0kKp3btvt
         FMRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790699832; x=1791304632; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=le2DxLCPEDrr2PRm44y3xvUUCI3+IOhlaSJ1r852sqE=;
        b=U82KqrDRiT4lQv/40eEXkPPnRmhpQCRcmZ7xD6Lsy4v1lIKvIMeUMkXen7HgTh5+Rx
         HMUDTDort7KaRfTdfcJeumevmRvfxHiVlo/EMfJa0QkHzJV/ivTO0sXMC/gEoXYdl92q
         02U/IWBm13VHuSnkJ8foYd5exC5tGtNAh+ooo+gUap0PEgnBfoCoXXG9gfHOoSK39vZD
         8Kkqex84OAL6wQNsP/g66tOgipBAXcqwG+2QwDfaXjY4qqpZF6s1OPCzEXqGblWRPl8U
         CKcr1dNJbM+NQjEA54dm8fqQxOaqStFW0JCDsYPkgvQIwxWx/ua+NUFZWlXmi+TRX01J
         IUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699832; x=1791304632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=le2DxLCPEDrr2PRm44y3xvUUCI3+IOhlaSJ1r852sqE=;
        b=quyMwiHm07lo0BwkY9jRyF69xoqJISb+f/PUgFbOd+94VRHWaQseRWnbWNKe9MeKzZ
         KK7FuwGP2fXbvMuFjdi7KWKF36KLzwuUOWvfy51y4mIlvLnOKepC5rulzSApUv5xsY4B
         Jod1SXb0iUf0Lv6lDP8GyOUIiwynqlGEQ1vwHAdzL2QAPzVq++e0z6iuLre2pvQX3WGl
         Yil+ThrOxbhoaKx0hQURm8sHcbmXFzeavw5DhB/8JvwfsjuCOJBVwlhAT4UXIxTf3xQ9
         kKFcouGV+82zeb+CqFyR1DxAoXSwbTIcagZhsCwROV1X813a4iFG/9lInMgZYVEh+5fw
         eLNQ==
X-Gm-Message-State: AFuF++mX3Q8JgxeJLH5Hw4VuoQbE84tFltUhPjUW329ZCqys5lbpuJCP
	9DOpxyGtrHs10FEtJUge6gyytPPbkhD+EoMIuKdoC9qGd5S2u0qXzk3KP9IwDfE1jLePT8W0gqx
	V1myry+2DUEvX32mpsyIa3eBlrf7wVwYQ4TwVReDGw+H4xKqxxusXxgkSkAg=
X-Gm-Gg: AYBFou3OwOTKShUdjQiX+tjjAWZOweEziX92L7FpPf0+t40FMGtLLNfHuK8Lj+c7SHo
	W+1Z9qCU075N3gB42Bx0ThkLoQocNQLdYy3xu9qgyt6OJo07Fqb/4qker7YIGwgmgTprn9E2bSi
	x/sYu/WLgiUFXCUxYFydY/tMbrWVnvfH/3Qhl/W6u60f8+sO8712/G+h3u2CM9LIVgrCPocWO+G
	yU/QJLZqZ+pA+KAa/eIxDpEPoI2dAF3RBzREAhLnfu7pSJfvRujN4swOd06Je0K6kiZ2P1G8NZq
	LOjfJRalJrJBkeh8w019c0J0dQvd0Q2iur1qe+yTc9PNdgq7IiRf02/NMySDAJpspLpnk6wQWzp
	OHKqN04qxVrr9/kfJrNU+ojbj5BwXTd2ppowheQYyHdIHWA==
X-Received: by 2002:a05:600c:a117:b0:4a0:1034:7fe5 with SMTP id
 5b1f17b1804b1-4a01034809dmr833175e9.14.1790699831262; Tue, 29 Sep 2026
 09:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928150121.1712559-1-tjmercier@google.com>
 <20260928150121.1712559-3-tjmercier@google.com> <20260928151833.31C8F1F000FF@smtp.kernel.org>
In-Reply-To: <20260928151833.31C8F1F000FF@smtp.kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 29 Sep 2026 18:36:58 +0200
X-Gm-Features: AclHuK9PvrsgxSgm9vpblUUY7Rb3eicL2q1Rd7eVI6sOT19pqPxF17s79AFhmlM
Message-ID: <CABdmKX2ZonMzkiXKQNvNSNo8bNrWjb_JwR9YsDpwF_bs_C1Njg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 2/2] bpf: htab: Reduce elem_size by 8 bytes
 for small key sizes
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: RCU readers can match recycled elements causing UAF/corrupt=
ion
> --
>
> commit 1b9a82a1c5a80781d8a76b226efc1db28e064ff2
> Author: T.J. Mercier <tjmercier@google.com>
>
> bpf: htab: Reduce elem_size by 8 bytes for small key sizes
>
> This commit reduces element size for standard and non-LRU per-CPU hash
> maps with small keys by omitting the 32-bit hash value. For these small
> keys, it relies on a single atomic instruction for key comparison and mov=
es
> the new key assignment to the end of element allocation to avoid exposing
> uninitialized values.
>
> > diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> > index 5db11a21ce980..7a8049cc99828 100644
> > --- a/kernel/bpf/hashtab.c
> > +++ b/kernel/bpf/hashtab.c
>
> [ ... ]
>
> > @@ -734,35 +784,60 @@ static inline struct hlist_nulls_head *select_buc=
ket(struct bpf_htab *htab, u32
> >       return &__select_bucket(htab, hash)->head;
> >  }
> >
> > -/* this lookup function can only be called with bucket lock taken */
> > -static struct htab_elem *lookup_elem_raw(struct hlist_nulls_head *head=
, u32 hash,
> > -                                      void *key, u32 key_size)
> > +static __always_inline struct htab_elem *
> > +__lookup_elem_raw(struct bpf_htab *htab, struct hlist_nulls_head *head=
,
> > +               u32 hash, void *key, u32 key_size,
> > +               struct hlist_nulls_node **out_n)
> >  {
> >       struct hlist_nulls_node *n;
> >       struct htab_elem *l;
> >
> > -     hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
> > -             if (l->hash =3D=3D hash && !memcmp(&l->key, key, key_size=
))
> > -                     return l;
> > +     if (htab_has_hash(htab)) {
> > +             hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
> > +                     if (htab_elem_hash(l) =3D=3D hash &&
> > +                         !memcmp(&l->key, key, key_size))
> > +                             return l;
> > +     } else {
> > +             /*
> > +              * When hash is omitted, key comparisons must be atomic. =
Zero extend
> > +              * the caller's key to the word size to support an atomic=
 compare.
> > +              */
> > +             unsigned long k =3D 0;
> > +
> > +             memcpy(&k, key, key_size);
> > +             hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
> > +                     if (READ_ONCE(*(unsigned long *)l->key) =3D=3D k)
> > +                             return l;
> > +     }
>
> [Severity: High]
> Can an RCU reader searching for a deleted key incorrectly match a recycle=
d
> element here?
>
> Without a hash field to act as an epoch check, it seems a lockless reader
> might accept an element that is currently being reallocated if the stale
> key hasn't been overwritten yet.
>
> [ ... ]
>
> > @@ -1225,7 +1302,18 @@ static struct htab_elem *alloc_htab_elem(struct =
bpf_htab *htab, void *key,
> >               copy_map_value(&htab->map, htab_elem_value(l_new, key_siz=
e), value);
> >       }
>
> [Severity: High]
> If a lockless reader successfully matched the old key in __lookup_elem_ra=
w(),
> could it observe the element in an inconsistent state here?
>
> While the value is being copied (or a new per-CPU pointer is being initia=
lized
> earlier in this function), the reader might read corrupted data. In the c=
ase
> of a non-preallocated per-CPU map, could it dereference the old, freed pp=
tr
> leading to a use-after-free?
>
> > -     l_new->hash =3D hash;
> > +     if (htab_has_hash(htab)) {
> > +             htab_elem_set_hash(l_new, hash);
> > +     } else {
> > +             /*
> > +              * Zero-extend key into k for an atomic write to support
> > +              * lockless RCU readers.
> > +              */
> > +             unsigned long k =3D 0;
> > +
> > +             memcpy(&k, key, key_size);
> > +             WRITE_ONCE(*(unsigned long *)l_new->key, k);
> > +     }
> >       return l_new;
>
> [Severity: High]
> Does delaying the key update to the end of alloc_htab_elem() inadvertentl=
y
> leave the old key intact while the new value is initialized?
>
> While this prevents premature matches on the new key, it seems to expose
> the element to readers searching for the old key, breaking the RCU safety
> of recycled elements.

Discussed this topic here where we decided not to increase costs for
all callers for this case:
https://lore.kernel.org/all/CABdmKX1vF-FD4mFmmobNJeKjQLdZ9wztqGTcR4P9tSv_nE=
FsYw@mail.gmail.com/


> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928150121.17=
12559-1-tjmercier@google.com?part=3D2
