Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202669;
	b=FGQsovnImJeMRTMI1dkQby4jVIOR6K+71N7jYx3GAeZ7Rly800AzkXA6UPMvkVtLPQNY
	 K6U5OpNok9ltIE1YIBuRS+ZHs02N4+8mJNQic61zE6wefs9501LTEaNn7KRR4WfaHzR+t
	 mU0k6ZPUH6JDIeE6TZUocYIBTAvCopZYP2jjzrHboBLQlnk5BXms4koEXyr0ZtJwojbw5
	 2i/GnIT58a+ALTiRkkfv/iSCdxq6qzUFqzn1yKAXBI+AcXxJXCiAHkMnodKHEV7beuQsq
	 TuYY1bjgNx4ov5dRgX1t+DyvbYDpnCJsuhiarpV+2hi+zFlNYQ1FNUwVSYZR9KFI/Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hR7xJF+eh3lU/QGj+8ASNxswZFRyXVh6Oom4tDMt+sM=;
	b=ewW3G4yvrn9XK/seFsz2sJMi2S5c6fAbddQjhUfc1Qg6lFKY8DUVRawkWQHziJ9KB+KZ
	 UrvkD+riQkvKxjwBanwmF/msDKlttdDbFw8hn0Dg1rIUz71UuuwoPUn9D6KWKfj7icqo4
	 eBiojgju6SJP1pbWPNtNOy2YyeIPVHYmLQAvZel79Z3vJ630/jTzujrLp8WubSLlCjR+i
	 S0jnUmayXisANsW4rScC7shnJxOaxwiMmCoN+4HdnJnz+C+9pZd7DB7GZDn4kvgvN9lTK
	 zQUUAuGD3kIADUvJeyQvDu226BtFbgr80vMPVKzoGXQ3gCKSembLtU8Wwti8l0T6oDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXujzAsQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344C606A6D8
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A344C606A6D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXujzAsQ
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adff684a52so10661281fa.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:24:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202667; cv=none;
        d=google.com; s=arc-20260327;
        b=b+0gpu2Rn+tX8QzcC0AmELaffPgi5BbvaMR316Z2XezPBMAVuZJjoq23FseZXY1AL5
         5f1WKIOn69tVM9KcWJz0yvzneM6RlZ5btA+m8CqoNUmlHHiMK+0KIaWcd86gB5IPQeUs
         jrAf08z2v9IJYCLMYhWSjgDs1yXdFaBU9jMypCilggAS9ajLwtI3DZIdqMmxGKLA1H/y
         ieEshsDevF1wiPJ/JYhTZctCFC4T3xJl4ztMToIL1v/Y4IWldgyvWTGBj2xBYtrN99b4
         uEcbnZV1iXIc+mYMGekygP1ae0bcTlv2iA3Gs7ZnXNQLIEOgTvSu793IMYuVGt3EauiG
         mIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hR7xJF+eh3lU/QGj+8ASNxswZFRyXVh6Oom4tDMt+sM=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=XUJgtsTOOD9Deg83WHrMkUd1GH+g8OaQMLhtpFqHXPPQp/aA2l9ua5Jw5ZyUg13V1f
         CgwHxTLbBqy0ZcxfixcApXcN9O15bacIrgQM954ulZHWN+OLNAlfJL9sJKW8vh+Fnaao
         zLRtOIbildwPRsDJ689C8nyjxJ++uoA+9sXuK1EA5VAfeb7f9aFfAT+TwpYRsJ5HjTo4
         zI4NpCtMuPjLwlKK1CJbJLpF48frvar1t0VCYNxwaO3uqRRAvdyuZJpy9Zwf65qiL2+o
         BXmM2dQrto2KxNw7k37D0wYqfcAfHLVaX5uE9Lsdv73v2PhkylSFhGtBzB132EGL0nbd
         Oz0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202667; x=1795807467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hR7xJF+eh3lU/QGj+8ASNxswZFRyXVh6Oom4tDMt+sM=;
        b=uXujzAsQBd+QIJwoJZVJh83d6dNU4/fUPBA5S1I7f+vync8yDMbhIHCD2jWVhLhli0
         rTYGZgWJvHPlMPVIZCtlMlGS53XZlsrpMWlRJfuTZon9llOmd1QoU2OhwOLXXAM5hbec
         lqvpuXGgsRqihRpVABgLoSeHqoB9lO+Nmkqo7BdTdx1qflzwas9ndsGTtadKojT8sUBw
         98uiFurBFmPuY5rWGjKRZwOfLd5T+GQ1tgNA5jLp2ldNFAnhFdboG75csG6ZH68J1r5x
         oX937j0FXy++ktYnnkokSV58yT6kRjRIdnsUbe5bW3scb1HfgkBBZ8fkrdpI2tyca9/M
         zrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202667; x=1795807467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hR7xJF+eh3lU/QGj+8ASNxswZFRyXVh6Oom4tDMt+sM=;
        b=SwrU/CWE6pavlGZP9jYoohZPl+fHa9x6CAiqpJjIG50jC/gUf67djQxVRMKRaFcSk4
         qmC+peYP5d3oXY9z1IgggyYKx3pztDJPAXJEx760sth9FnAquNBC+2CbjZdfYrHHgNwR
         KGt38HkH8qzkLz7lJU2TTJ/J77SgG3/4Oa/x3T+lk++bmdWyRwoI0Ymce/Gz2jBhwsnO
         POKU0crAVvkqDmwGH9FGPB1HwFbkh3cBI971/v0+VMDQglU3CyAIYkaTDPlNqpxcP5CC
         uuMWijHrJAV48Ch90HiOgRQFriRH0u6ws+UsTuEHuH7M9/kvpgZonD/Hxm+BZgsJnpyE
         9d5g==
X-Gm-Message-State: APuU4Z8C0Pwxf521kq+QM2Nt+v67nuOgBvYBPPIip11kiupkxGDB2h0u
	zaZYPIimYHtcDWOpIPnfpH2ET9RDGGW7giarcRDNt2dZUrQgzArodS1BetZLPIBH6c6UyYGZjH6
	T/cujzG2rgQJ7KvXj2E5ahJTwcK7metdebKFG
X-Gm-Gg: AZFdTZdWc7zAu9wSV+ch+wvHVmR7Q6nRKobUzHp1MHgzdEhcwAzMFwthpWlYNDCLnSY
	bHJMaXIcLppxszIytokez+cw96CBN2vJ3GvnRjR/qfyIlQ4IrlabxaLAHS3Ocok1mxxJwC1tgQr
	7LCJXaniaIjZXVuAEcfVK5IvPLLR3MLuReih78iUiuZn2mk/Z98ig79WDPfwt79lhfQCjlYLQyU
	6LMD9i/HUhDIVudm5LUMAnYWfkroDc7fiI/l3fG1zXPwooBiuVFWpi8UVWjQUZleKUCF1CDthtK
	tMUISgd/NMZ2zwvAzl3MMv3u+WJWEzThWVFvbLcj1TMumbtP0VrBSpx7VqH6BQlHxnWMzoYO461
	Zto6ZnCwtVFV5W2fVoPnKmpNhQRQ3VEzweSTT6wiliEKm7poMK4kOLME1J6Y=
X-Received: by 2002:a05:651c:991:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3ae7fb0b5efmr9311671fa.12.1795202666436; Fri, 20 Nov 2026
 11:24:26 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106072412.7909-1-kanchanapsridhar2026@gmail.com>
 <20261106072412.7909-8-kanchanapsridhar2026@gmail.com> <sashiko-outbox-202713@kernel.org>
In-Reply-To: <sashiko-outbox-202713@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 11:24:12 -0800
X-Gm-Features: Aa3M54oUl6qJ5hZlCYYhmiDiQH5xqNAdQbMYZMdPI76DbB-hbPU55wGtY4uRrEQ
Message-ID: <CACpmpoe44wzBDMdLX=Ryau8uuDYrfNRbGmAvuWF6p6rPc6_zbw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] mm: zswap: Refactor and optimize
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

On Fri, Nov 6, 2026 at 11:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] mm: zswap: missing !CONFIG_MEMCG stub for obj_cgroup_get_many()
> - [Low] mm: zswap: unconditional incompressible page stat updates on
>   zero delta
> - [Low] mm: memcontrol: unused and duplicated obj_cgroup_charge_zswap()
> --
>
> commit 55351c710f10c5fbb79d9201d80496dc658bbc19
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Refactor and optimize zswap_store_pages() batch operations.
>
> This commit factors zswap_store_pages() into batch helpers
> zswap_init_entries() and zswap_tree_stores(), and introduces
> obj_cgroup_charge_zswap_many() to charge and account zswap batches at
> once.
>
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index ac6c43ea8c5a6..ab280a448e8c4 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -6368,6 +6368,42 @@ void obj_cgroup_charge_zswap(struct obj_cgroup *=
objcg, size_t size)
> >       rcu_read_unlock();
> >  }
> >
> > +/**
> > + * obj_cgroup_charge_zswap_many - bulk charge compression backend memo=
ry
> > + *                                from compressing a batch of pages.
> > + * @objcg: the object cgroup
> > + * @size: total compressed length of a batch of compressed objects
> > + * @nr_pages: # of pages that were compressed to store in zswap
> > + * @nr_incomp_pages: # of incompressible pages to store in zswap
> > + *
> > + * This forces the charge after obj_cgroup_may_zswap() allowed
> > + * compression and storage in zswap for this cgroup to go ahead.
> > + */
> > +void obj_cgroup_charge_zswap_many(struct obj_cgroup *objcg, size_t siz=
e,
> > +                               u8 nr_pages, u8 nr_incomp_pages)
> > +{
> > +     struct mem_cgroup *memcg;
> > +
> > +     if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
> > +             return;
> > +
> > +     if (obj_cgroup_is_root(objcg))
> > +             return;
> > +
> > +     VM_WARN_ON_ONCE(!(current->flags & PF_MEMALLOC));
> > +
> > +     /* PF_MEMALLOC context, charging must succeed */
> > +     if (obj_cgroup_charge(objcg, GFP_KERNEL, size))
> > +             VM_WARN_ON_ONCE(1);
> > +
> > +     rcu_read_lock();
> > +     memcg =3D obj_cgroup_memcg(objcg);
> > +     mod_memcg_state(memcg, MEMCG_ZSWAP_B, size);
> > +     mod_memcg_state(memcg, MEMCG_ZSWAPPED, nr_pages);
> > +     mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, nr_incomp_pages);
> > +     rcu_read_unlock();
> > +}
>
> [Severity: Low]
> Could obj_cgroup_charge_zswap() be removed now that its only caller in
> mm/zswap.c has switched to obj_cgroup_charge_zswap_many(), just as
> zswap_pool_get() was replaced by zswap_pool_get_many()?  Leaving
> obj_cgroup_charge_zswap() in mm/memcontrol.c and include/linux/memcontrol=
.h
> duplicates the charging logic with no remaining callers.

Thanks Sashiko for the code review. I have modified
obj_cgroup_charge_zswap() to call obj_cgroup_charge_zswap_many() to
avoid the charging code duplication.

>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 8c36344000f51..5ef1ae67e67a9 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
>
> [ ... ]
>
> > @@ -1711,17 +1702,86 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
> >                       zswap_lru_add(entry);
> >       }
> >
> > +     /*
> > +      * Each batch entry is successfully compressed and stored in the =
tree,
> > +      * and further failures will be cleaned up in zswap_store().
> > +      * Next, we do bulk accounting for the batch: grab refs to the po=
ol and
> > +      * objcg, charge zswap memory, increment zswap_stored_pages and
> > +      * zswap_stored_incompressible_pages. The opposite actions will b=
e
> > +      * performed by zswap_entry_free() when the entry is removed from=
 the
> > +      * tree.
> > +      */
> > +     zswap_pool_get_many(pool, zc->nr_pages);
> > +     if (objcg) {
> > +             obj_cgroup_get_many(objcg, zc->nr_pages);
>
> [Severity: High]
> Does calling obj_cgroup_get_many() here break the build when CONFIG_ZSWAP=
=3Dy
> and CONFIG_MEMCG=3Dn?
>
> include/linux/memcontrol.h only defines obj_cgroup_get_many() inside the
> #ifdef CONFIG_MEMCG block, while the #else section only provides stubs fo=
r
> obj_cgroup_get() and obj_cgroup_put().

Added a stub for obj_cgroup_get_many() in the #else section.

>
> > +             obj_cgroup_charge_zswap_many(objcg, total_batch_comp_leng=
th,
> > +                                          zc->nr_pages, nr_incomp);
> > +     }
> > +     atomic_long_add(zc->nr_pages, &zswap_stored_pages);
> > +     atomic_long_add(nr_incomp, &zswap_stored_incompressible_pages);
>
> [Severity: Low]
> Should the incompressible page updates here and in
> obj_cgroup_charge_zswap_many() be skipped when nr_incomp is 0?
>
> In the common case where all pages in the batch are compressible,
> atomic_long_add(0, &zswap_stored_incompressible_pages) still performs an
> atomic read-modify-write on the shared global counter, and
> mod_memcg_state(memcg, MEMCG_ZSWAP_INCOMP, 0) still runs get_cpu(), updat=
es
> per-CPU stats by 0, and fires trace_mod_memcg_state() with val =3D=3D 0.
>

Good point. I have modified this such that if nr_incomp is 0, we skip
the incompressible page updates.


> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106072412.79=
09-1-kanchanapsridhar2026@gmail.com?part=3D7
