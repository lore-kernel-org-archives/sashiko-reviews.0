Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793330356;
	b=2+DomnTZveVmApBTZTB5Nl6NMLn2LE9LlVJhgXVuQRbtAf1OfJO5/fF9Hr6CgYugwH3s
	 fgkV0V17lXhZ5fQIkWk3UsKwCTLAVnwDD/I6M4dltAPOtzlZhQnhWdQgEoEvmivzebpLU
	 P+F6naOrOp3LMbRlJvmkGjAV8Ou8EnCcACwG9ADYKOE9MKExSvRDaw3czB0f2NKwCvbuE
	 2mWEpgn3OkwYjEzasxlAyEDYX5G9dbjv3mqVCaI4vqJFHeQEC9RpdfyljRANaqomHeVaP
	 mEn+0e26UnnXV5YIB3S7JTS5WOlnOHiK43AEyM8Ze8KqvnGiTu6XlaxkvIMBE4ExXAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TvFyOlYWWcM4bfjI5ZFYq0uA7WbLDYElCyWjZqS03Gw=;
	b=BxKsvoaHpLsmn0xjTPoNj0Ar1clbopra0TmT4dcX8MEhIzNS8/jphdoJAZYn81c0lbTg
	 zu1H2iueIwjbQqf9IUMIBrHkdhd//HcY19cAOay/Gsurx29eBjVE443juVBqYxcbMx7EQ
	 bRIJNNk0Rzg4OpTRjP0zYqwnv4RBFuyMD/w3waxjSn4Fzn3AHAJmOEgNkWwCE3gCXDC/e
	 +aXAjaXlI2n5nPxGNI6kys/IYsqcXlx1n3fjpIUfEmt45carQ0R6ov2scLrw2NzECa2sr
	 K/pd713fZLRKaQHXiUufYvrT+eG1Me62Q16JzHAGfLdHJeWF6dZbqiYgEsV+ru9XpAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwJ5WCW+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DF9606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 03:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08DF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwJ5WCW+
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso3672731fa.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 20:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793330354; cv=none;
        d=google.com; s=arc-20260327;
        b=BaMDOwXauAPm1Jou4DJuAn2v6IE5pQ82l658ohv3h3jkWXN3cEXKekI4970n246ofM
         Yep9oAahs7AS/xhhaNRRnNTy2Krcdjn7wiC54BHlRO/MghZrSQzWv0HokAnzi7f1ndun
         zGhVl2ABaqxalmrhOIaFb+66je3vpFTpwZeLC3EgbIhv87emwWw3rX3Z4hBjxIritQit
         7Lt19uN1zP1cvGELkoPZ0Zcvt4unVLGsfXSWSAS6Y0eY6+bs1fGvyTrDSnxYvr890lZ8
         Zm5cdVPJQ+bkJpRu34GWcz+hxfOlG9E9bsAXQ0FyBegbnFoHiLPQLZl64i05ACtnNmMy
         gNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TvFyOlYWWcM4bfjI5ZFYq0uA7WbLDYElCyWjZqS03Gw=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=cFE2uGuINPnGf1BCQFOXeWA8+bOGrSZ0FG/lChVgLJ/TpRovgv/uNVRRNkYyWiInDF
         z/DbpBbsl81yAolp2in+EsW2Tg5uvhj9Ks/1Mfnr69cj2rNpNuPK9TNyKqfCS+nZ272o
         zg6RT7PwpFpnpU5Iee3D7AQtU3jUN7xLnKfkPRJvhAiLlQa3IbEJhB4XOdjxiJMj6YZq
         4h3luS6UK0t6mNPHbKFyDM2nsMpmF/v8wiApOQMOd9hEZQwSrbYJM7+LlnoSi9IUT7EU
         sa4PmgfKkKxHQnEgDUXzAaqGAe+KW7/UbptyidddfNhegHFQJxayr4ZxVG+Jbkpz82Ld
         KQ3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330354; x=1793935154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TvFyOlYWWcM4bfjI5ZFYq0uA7WbLDYElCyWjZqS03Gw=;
        b=IwJ5WCW+MZWaJgdqjaMt99zEAX+bXeQxJigI+OcH7JTdw27rYFq3velgFlrVVdQyAr
         naSNmh0t3xBJPe4k2y9jQG2on/eXsdh0hP9NQLkq3dghktYGBhem1Hgt+RkSPX0BCAsG
         MqE1lFlNKS77LKhe6IsXWBaAurq3f5qK9ASN3GGuT2I45EY9A2nwLM2KlWWfMEaIGqXA
         G4Cq3OVWrqfsc2vZ8189ucFi5VPAfAdDXWZvRUHSSiFzFCe9Xp9thEmEyXvYthioviHJ
         LxavXYNDfGZMfYbjxkt1l8E8SW/mwSYxOC/33TlrPvH6oXHN7Vv/Xih82mqkmqaKQR3O
         VrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330354; x=1793935154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvFyOlYWWcM4bfjI5ZFYq0uA7WbLDYElCyWjZqS03Gw=;
        b=eRNNmAFLuhNyXt4I899o58mLXEHsSWVztEwQIXrQcy+T4HlPF+o70yJenk3DyFKdi0
         lb2GhLPsbkEa7NAXg8e1ok5ZZ/EvBGuHTbllAO7W5/yVLd+UL6ebGLxw8EPBzHvI1wCA
         zsQVdnWm03vo8TgjjmYR3umEvw8bhuWoPPDYqdwjoWDqo2SYf0TmQyszEQGMkarWomF7
         Bnx3JTf0VXrF1Ht/YHZQ0XYD6mmI2ubLVAnfgnqpHRe+gYgPEA5fwbfMUE1pS8f2xVs5
         +BcuXbIgbiSzlL6SlvIiE6FEQyCKEILIX2pdeIWef+29YAlb8uf4wM9TjUoF2fs+cfUo
         CCyg==
X-Gm-Message-State: AFq9FYJ6ADUL3AVsk4a6ybCk26li+Ns/sRpVqrEoxg+7GYU3p+4B53LE
	p70pP2i8P9/JARu511AQutxfr5d57fZsHF423rt7ignQNlm1K2Q0l+/CISSflhz0qxEjUPze0gt
	LuzJ4dovHHdYsBXUeMBa7yKLT21nwkI3C+g==
X-Gm-Gg: AYBFou0RRj95rNu1qVDVNPTZ6w+SQd7oEERbJweKJp36Istq9ov7d5zY9JDOuLJhWq0
	Iw0k5XNF1qNraN2ILoqbBsAM2ytOHa36zRNwyYgzJzOOXv6N/ryxVGMKYk5D/SkujqO3sm1S5IF
	DARrYo0sEs7Sk2Ql3yzyMmu7A6zGTvjiaWdC5G1yJtjsouhusJ1VIE+rT/kB4q+44n3s46Id9QC
	5Pb70mdBrzwdysAhBFN68qVxuEzQwFoJdu1EDr/pO4p6AB90YrpeI4BcWx4/P4RpJNnZmMtlBTx
	AN0XmyZxvOb2cxqUNzHkrkPeJ83g/J2xhfGEfogGH+6V6WYQhG7dHbpmq6ZfLIdriwxiEEuLEbm
	tuAa4uP/NhEZ6ZzXP5TKVnrzr1i/3jIGJzqSv
X-Received: by 2002:ac2:4f14:0:b0:5bf:ce1f:672c with SMTP id
 2adb3069b0e04-5bfd9564e0fmr238085e87.22.1793330353814; Thu, 29 Oct 2026
 20:19:13 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
 <20261028030503.17923-9-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188660@kernel.org>
In-Reply-To: <sashiko-outbox-188660@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 20:19:00 -0700
X-Gm-Features: AclHuK84KRmP1xwOhmrGiQO4Cat7L-CCE95Y-VrA1yHRRiXcHtlToSwVQTzv2M8
Message-ID: <CACpmpoeHQ8QjFB_2UtGhib9EYToLcXx_e59t+hot+sorUvnMyQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] mm: zswap: Refactor and optimize
 zswap_store_pages() batch operations.
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] mm: zswap: memcg counter corruption in zswap_account_stores()
> - [High] mm: zswap: missing zs_free() of prior sub-batches when zswap_com=
press() fails
> - [Low] mm: zswap: unused zswap_pool_get() retained with __maybe_unused
> --
>
> commit 5a1c181c752a45f404bc7cfeb7961fd6accb0903
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Refactor and optimize zswap_store_pages() batch operations.
>
> This commit refactors zswap_store_pages() into smaller helper functions
> (zswap_init_entries(), zswap_tree_stores(), and zswap_account_stores()) t=
o
> process batches of pages when storing a large folio. It also batches pool=
 and
> obj_cgroup reference counting, memcg charging, and zswap_stored_pages upd=
ates
> across the batch.
>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 4476fb4aeb5fd..2831284cfc903 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -504,12 +504,18 @@ static int __must_check zswap_pool_tryget(struct =
zswap_pool *pool)
> >  }
> >
> >  /* The caller must already have a reference. */
> > -static void zswap_pool_get(struct zswap_pool *pool)
> > +static void __maybe_unused zswap_pool_get(struct zswap_pool *pool)
> >  {
> >       percpu_ref_get(&pool->ref);
> >  }
>
> [Severity: Low]
> Since the only call site in zswap_store_pages() is replaced by
> zswap_pool_get_many(), zswap_pool_get() no longer has any callers in the
> file. Could zswap_pool_get() be removed outright instead of marking it
> __maybe_unused?

Sure, this makes sense.

>
> >
> > -static void zswap_pool_put(struct zswap_pool *pool)
> > +/* The caller must already have a reference. */
> > +static inline void zswap_pool_get_many(struct zswap_pool *pool, u8 nr)
> > +{
> > +     percpu_ref_get_many(&pool->ref, nr);
> > +}
>
> [ ... ]
>
> > @@ -1750,24 +1732,30 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
>
> [ ... ]
>
> > +static inline void zswap_account_stores(struct zswap_store_context *zc=
,
> > +                                     struct zswap_pool *pool,
> > +                                     struct obj_cgroup *objcg)
> > +{
> > +     size_t total_batch_comp_length =3D 0;
> > +     u8 i;
> > +
> > +     for (i =3D 0; i < zc->nr_pages; ++i) {
> > +             if (unlikely(zc->entries[i]->length =3D=3D PAGE_SIZE))
> >                       atomic_long_inc(&zswap_stored_incompressible_page=
s);
> >
> > +             total_batch_comp_length +=3D zc->entries[i]->length;
> > +
> >               /*
> >                * We finish by adding the entry to the LRU while it's al=
ready
> >                * in xarray. This is safe because:
> > @@ -1778,20 +1766,78 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
> >                *    The publishing order matters to prevent writeback f=
rom seeing
> >                *    an incoherent entry.
> >                */
> > -             if (likely(entry->length))
> > -                     zswap_lru_add(entry);
> > +             if (likely(zc->entries[i]->length))
> > +                     zswap_lru_add(zc->entries[i]);
> >       }
> >
> > +     /*
> > +      * The entry is successfully compressed and stored in the tree,
> > +      * and further failures will be cleaned up in zswap_store().
> > +      * For the batch, grab refs to the pool and objcg, charge zswap m=
emory,
> > +      * and increment zswap_stored_pages by @zc->nr_pages. The opposit=
e
> > +      * actions will be performed by zswap_entry_free() when the entry=
 is
> > +      * removed from the tree.
> > +      */
> > +     zswap_pool_get_many(pool, zc->nr_pages);
> > +     if (objcg) {
> > +             obj_cgroup_get_many(objcg, zc->nr_pages);
> > +             obj_cgroup_charge_zswap(objcg, total_batch_comp_length);
> > +     }
> > +     atomic_long_add(zc->nr_pages, &zswap_stored_pages);
> > +}
>
> [Severity: High]
> Does calling obj_cgroup_charge_zswap(objcg, total_batch_comp_length) once=
 per
> batch corrupt the MEMCG_ZSWAPPED and MEMCG_ZSWAP_INCOMP counters when
> zc->nr_pages > 1?
>
> Looking at obj_cgroup_charge_zswap() in mm/memcontrol.c, it assumes @size
> represents a single page:
>
> mm/memcontrol.c:obj_cgroup_charge_zswap() {
>     ...
>         rcu_read_lock();
>         memcg =3D obj_cgroup_memcg(objcg);
>         mod_memcg_state(memcg, MEMCG_ZSWAP_B, size);
>         mod_memcg_state(memcg, MEMCG_ZSWAPPED, 1);
>         if (size =3D=3D PAGE_SIZE)
>                 mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, 1);
>         rcu_read_unlock();
> }
>
> When a batch of zc->nr_pages > 1 pages from a large folio is stored via
> zswap_store() -> zswap_store_pages() -> zswap_account_stores(),
> MEMCG_ZSWAPPED is only incremented by 1 instead of zc->nr_pages, and
> MEMCG_ZSWAP_INCOMP compares the summed total_batch_comp_length against
> PAGE_SIZE rather than counting individual incompressible pages.
>
> Later, when each entry in the batch is freed via zswap_entry_free():
>
> mm/zswap.c:zswap_entry_free() {
>     ...
>         if (entry->objcg) {
>                 obj_cgroup_uncharge_zswap(entry->objcg, entry->length);
>                 obj_cgroup_put(entry->objcg);
>         }
>     ...
> }
>
> obj_cgroup_uncharge_zswap() is called once per entry, decrementing
> MEMCG_ZSWAPPED by zc->nr_pages total and decrementing MEMCG_ZSWAP_INCOMP =
for
> each entry whose length =3D=3D PAGE_SIZE.
>
> This causes both MEMCG_ZSWAPPED and MEMCG_ZSWAP_INCOMP to be miscounted a=
nd
> underflow, which also breaks zswap_shrinker_count() where MEMCG_ZSWAPPED =
is
> used as nr_stored to scale reclaim targets.

Yes, I see this, thanks. I have added a new
obj_cgroup_charge_zswap_many() that should address this issue.

>
> > +
> > +/*
> > + * Store multiple pages in @folio, starting from the page at index @st=
art up to
> > + * the page at index @end-1.
> > + */
> > +static bool zswap_store_pages(struct zswap_store_context *zc,
> > +                           long start,
> > +                           long end,
> > +                           struct zswap_pool *pool,
> > +                           struct obj_cgroup *objcg)
> > +{
> > +     bool ret;
> > +     u8 i;
> > +
> > +     zc->nr_pages =3D end - start;
> > +     zc->folio_start =3D start;
> > +
> > +     VM_WARN_ON_ONCE(zc->nr_pages <=3D 0 || zc->nr_pages > ZSWAP_MAX_B=
ATCH_SIZE);
> > +
> > +     if (unlikely(!zswap_entries_cache_alloc_batch(zc, GFP_KERNEL)))
> > +             return false;
> > +
> > +     zswap_init_entries(zc, pool, objcg);
> > +
> > +     /*
> > +      * Locking the comp_ctx mutex once per store batch results in bet=
ter
> > +      * performance as compared to locking per compress batch.
> > +      */
> > +     zc->comp_ctx =3D &raw_cpu_ptr(pool->acomp_ctx)->comp;
> > +     mutex_lock(&zc->comp_ctx->areq.mutex);
> > +
> > +     ret =3D zswap_compress(zc);
> > +
> > +     mutex_unlock(&zc->comp_ctx->areq.mutex);
> > +
> > +     if (unlikely(!ret))
> > +             goto compress_failed;
> > +
> > +     ret =3D zswap_tree_stores(zc);
> > +
> > +     if (unlikely(!ret))
> > +             goto store_pages_failed;
> > +
> > +     zswap_account_stores(zc, pool, objcg);
> > +
> >       return true;
> >
> >  store_pages_failed:
> > -     for (i =3D store_fail_idx; i < zc->nr_pages; ++i)
> > +     for (i =3D 0; i < zc->nr_pages; ++i)
> >               zs_free(pool->zs_pool, zc->entries[i]->handle);
> >
> >  compress_failed:
> > -     zswap_entries_cache_free_batch(&zc->entries[store_fail_idx],
> > -                                    zc->nr_pages - store_fail_idx);
> > -
> > +     zswap_entries_cache_free_batch(zc->entries, zc->nr_pages);
> >       return false;
> >  }
>
> [Severity: High]
> Can jumping to compress_failed when zswap_compress() returns false leak t=
he
> zsmalloc handles allocated in earlier compression sub-batches?
>
> In zswap_compress(), pages in [0, zc->nr_pages) are compressed in sub-bat=
ches
> of zc->nr_batch_pages (which is 1 for software compressors such as ZSTD o=
r
> LZ4 when zc->nr_pages is up to ZSWAP_MAX_BATCH_SIZE):
>
> mm/zswap.c:zswap_compress() {
>         for (batch_start =3D 0; batch_start < zc->nr_pages;
>              batch_start +=3D zc->nr_batch_pages) {
>                 ...
>                 err =3D crypto_wait_req(crypto_acomp_compress(zc->comp_ct=
x->areq.req),
>                                       &zc->comp_ctx->areq.wait);
>                 if (unlikely(err && !zc->wb_enabled))
>                         goto compress_error;
>                 ...
>                 ret =3D zswap_update_entries(zc, batch_start);
>                 if (unlikely(!ret))
>                         return false;
>         }
> }
>
> Each successful call to zswap_update_entries(zc, batch_start) allocates
> zs_malloc() handles for zc->entries[batch_start .. batch_start +
> zc->nr_batch_pages - 1]. If a subsequent iteration with batch_start > 0 f=
ails
> at goto compress_error (when !zc->wb_enabled and a page is incompressible=
) or
> fails in zswap_update_entries() (which only frees handles in the current
> sub-batch starting at batch_start):
>
> mm/zswap.c:zswap_update_entries() {
>     ...
>                 if (unlikely(IS_ERR_VALUE(handle))) {
>                         ...
>                         for (i =3D 0; i < comp_batch_iter; ++i)
>                                 zs_free(zc->zs_pool, zc->entries[batch_st=
art + i]->handle);
>
>                         return false;
>                 }
>     ...
> }
>
> zswap_compress() returns false while zc->entries[0 .. batch_start - 1]->h=
andle
> still hold allocated zsmalloc objects. In zswap_store_pages(), jumping to
> compress_failed then frees zc->entries back to the slab cache without cal=
ling
> zs_free() on those handles.

Also resolved, thanks!

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.17=
923-1-kanchanapsridhar2026@gmail.com?part=3D8
