Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243251;
	b=h8/SCpXlRNK5hRUuDN6tvedx0AR05sJMWXAFP/nDbq5/pV+8AM8AfU1TJ59eAc0ioLe0
	 oKnhieLhCuNq9abd2EdsZuqrvJedmaWRrojfyzuB+11qUa+BvuGJaRJ//YXPxJOun6p7S
	 49+d9tSz13B4TCtEfpuNGQS/nash42s+0aY72tcreFIM3DNLXKW+ObgOAxuW678qpKi3t
	 tbGbMS9eZW/bYAyzXnKuQev5rkzCE6hSouS7uKFSiMPXYvC2fHNevfJyluqFZoSNRczaI
	 YqVYcC7npcR6JzkvXFR/Z+SrNczvK1vvGLaQfojkdqjQoc0zmA2YYc3M4BPVevL/agg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0sf9I/k/98So0/htGcCu4KYBn2oXlMUyb15O6ueVwk4=;
	b=LUgW2zJCH/ozguqZFHvOcDyw+GB4gnNUtNlqltoYl/r8y8tHmOABQWZnvpvET9lgYPj2
	 pIMeKH32sK9i+2x0+NDS6SNKbCFs/11ocSii9QcfjDtcT4E3fgD5Sf+bAcGzgpU867aRP
	 o3doFKzbyycYK7Abq+XwjBc6bzOhUbiLUyqCzGf0VlE4pGKQw0SkvKG3r0kQtOKijgMHJ
	 8miMJlnO3ze6bB/K0rIZB4a13/jVnRV4Fh+YxBIT8Nn8Y8A7O5j6m+dVoiDykT7AtTEiw
	 +uKNxwiRYwayofsI6HcXQ3gxewlKzZZozOu6a3yE1wKazbk5cDDbslK4/ZuF7ttbLag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Faql6zAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E02B606EE89
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 16:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E02B606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Faql6zAJ
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4354db11so9254721fa.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 08:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794243250; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1yaJ43L3b+cP4bTe3kV3dacpx/Uywy6cIgQ1GY/P2yLJ63urjA51O+dsSEpBLMlh3
         WBW0YvUUQ+bjP+gqFaWQ1vXLes4zEhC10RpNh54eYz2DgUPmmAnFlNJWSjSSqsvK5SSM
         VqYUVI8HslV4DWLUrC4H33SOsvyyvhUeUjSXTjyHHe62EEAacFIvAyvlHSxvcis5zgDE
         Zdl8Gut0LLN8SEz/M/n6HxALxoXCG64/q8e+8Q5D1IMBDhaGhqOC9veWMTOROtuXlhjX
         7ckHWZxsTt5XuxWFw079hTRpDUnghMYNw1aKyQiAlNPbHQwKMA+TZ8+Zi6IBD3gjcUko
         QZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0sf9I/k/98So0/htGcCu4KYBn2oXlMUyb15O6ueVwk4=;
        fh=p8K2u/9xvPM8sg/03RQSnPAZL6V71H06s/Q+LEWlk+g=;
        b=afHnB0ueI5d61x4/d7Pv7nBrf3mV0DTIC76/tme4ioYVjcnKd4COcV7Shhi6gUNDsi
         UZTunQTZGOr/Im758ZnGdwuApFdcHe/3M6V4nuiEVMT+JRXDy7vkBu2fIa3S0+DBNxlE
         vbSBKndT3yJPV+wrTOooIE0PCZh3RxdkFbGmWHmy9SP5rpzk3N8g41E0r7Qj5wQvBruz
         CLldS6sCb7qGaZEol0WW0YrEeCraygfOcvNQbPOLzu3JySvXy4HRgRsu1EfkJUPXWvjN
         Z3ArW1WpzyMWAzjRcarPVuv+jvJVBYvCsrJXltyqmgoOIu+JhVQBnkaQ9wsfXEO+x4Xt
         v3aQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243250; x=1794848050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0sf9I/k/98So0/htGcCu4KYBn2oXlMUyb15O6ueVwk4=;
        b=Faql6zAJ5UotSOYJdPPjEs2j0/a7LXwCIrKf4PJAvMArkTTQRidDcNP7aRwnbs0n/N
         OvMDk1GLahUaEZDKRK2Y/Dw+0r4aCvzhd6jINyUDddNWylbmvGFeL5OYis5no3qj0g+I
         JvwlHyCNh2PaescKoq9ttx6vstACC++u5k8DizozyA8wX3FF2JsXUuV8MBj9uXxFiW1t
         C0e3TOA0xBf44QF972gti8EHWNFoYQLjDFfKpG9G6eZ8nz5bQxsebh9saC06wCUhtba/
         e0JpZYuhv3nSrL5hwdN/E1plyvqswDbwkk5QeMistP+orQXa0HpYQU+0r0AeIliG/iwf
         asqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243250; x=1794848050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sf9I/k/98So0/htGcCu4KYBn2oXlMUyb15O6ueVwk4=;
        b=CeSOLFhaDCY3ftSy01u6e6OvRMLe8Nc5gOu+rEgPmKivM8N5BXNx/frEjDJz1n6XPf
         Cq7SU+8QZYeFcoI94KAN1kZZLhEwClrJZfMyUtKCp7Ucu0X8mj4Elep/P3wv8mGOxCj0
         Em0uO7XtC9b4I4gvHU3nJfwYUYomHPjO4S2QFfd2HpnZVMR1mhpi80+Db7a6c3wQyhyS
         RjGQO81zbz8v+H7t6f5D4cKvbXk8NdrOKFTfBxluTAfKGlHfpxpspEF3XYxma87wkVeh
         D7MaoD2Xqbef8o/kXRvAD0TURCCWeIHPq8JpKceITkT9xSE3Nz+nxWPD2pF/Ab8p+aa3
         yT/A==
X-Gm-Message-State: APuU4Z/ttrb/OecFA/xnY49fTqPEHSA0LG6Ca8O1V8w2KiCD0JX0+L14
	zvmQoXpA6HCvHK0SWsSmk+7DxyLvTFOJsskKK92FckZB890+kDyEM9IphTJZCUuqC/PRn9VAeQ9
	qYAgN3Le29JYuenDZmwGVIujDpDqMvAmmdcIXr9I=
X-Gm-Gg: AYBFou0nF9kFMoC59iFK18qQgkEZ197smp9BzOl01fM60JyuuV6WvdEnL4tE3JAUAGJ
	T1KMYwhwxotZjIBxAyg0Z992lafuCFrWNIo7qB2v25KqwA0FrqEp2eRu0DjTrY8Wj0fAT2lsLmh
	7/o3soQ95wLYPnjZfyIr9H8O2SIED7zN3wp+w1ZzpAx7N019ldH1Z5MIrhtB2r+22bKSqO/rOEn
	fBmuNQ6MRAPd0mFZ6CM1Lyup9BTynmyBcae3wNHEmMj759Go/GM0YYjH8/HDvqejNQqCjwxxF2q
	sZzVyEF1WZHIBVlm3iud1A+yzxlNLzRpU3XBfUXeci5UvMoSYeYqec0D4kkHFbaOP8iHjNrmdgw
	2aKdNJkMMwe3TY++hgvChV1XVgt4Bdh1jvJ20YDqxfOEjjEuF56FQpXLugKl9xQqoH52ovGJQIt
	y17bJWGydZKSBqqn9psnanW2Fogt1g+BMzbbq5R4Jcml1F/9Th+ugF
X-Received: by 2002:a05:651c:418c:b0:3ab:2a19:8624 with SMTP id
 38308e7fff4ca-3adfa3f4532mr7810971fa.5.1794243249325; Mon, 09 Nov 2026
 08:54:09 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106160432.2552507-1-nphamcs@gmail.com> <20261106160432.2552507-3-nphamcs@gmail.com>
 <sashiko-outbox-203018@kernel.org>
In-Reply-To: <sashiko-outbox-203018@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 9 Nov 2026 09:53:57 -0700
X-Gm-Features: AclHuK-kEkGJpmX8bEshRAj1QlWY3h-AH6ZOffWLi-cEQ50b9BttRYvWlSNJfDY
Message-ID: <CAKEwX=OaSLfSF=JdS6Z0SEBU-5V2zqjLb6s0sHa0tx_GOuwaLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/swap: publish cluster tables after reacquiring
 allocator locks
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, axelrasmussen@google.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	brauner@kernel.org, chrisl@kernel.org, david@kernel.org, hannes@cmpxchg.org, 
	kasong@tencent.com, ljs@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, weixugc@google.com, 
	willy@infradead.org, youngjun.park@lge.com, yuanchu@google.com, 
	ryncsn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 9:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] mm/swap: NULL deref in swap_cluster_assert_empty() on stale
>   reclaimer race
> - [Medium] mm/swap: ABA race on cluster state check in
>   swap_cluster_alloc_table()
> --
>
> commit 22e220b18bd05df45a828a3170169b92c0c14f76
> Author: Nhat Pham <nphamcs@gmail.com>
>
> mm/swap: publish cluster tables after reacquiring allocator locks
>
> This commit keeps newly allocated swap cluster tables private until
> swap_cluster_alloc_table() reacquires the allocator and cluster locks, an=
d
> abandons installation if a stale reclaimer returned the cluster while the
> locks were dropped.
>
> Link: https://lore.kernel.org/all/sashiko-outbox-181084@kernel.org/
> Link: https://lore.kernel.org/all/sashiko-outbox-181086@kernel.org/
>
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index 189f04d8838f3..162a73a9e6638 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
>
> [ ... ]
>
> > @@ -467,27 +475,49 @@ static int swap_cluster_alloc_table(struct swap_c=
luster_info *ci, gfp_t gfp)
> >               table =3D kmem_cache_zalloc(swap_table_cachep, gfp);
> >       }
> >       if (!table)
> > -             return -ENOMEM;
> > +             goto lock;
> >
> >  #ifdef CONFIG_MEMCG
> >       if (!mem_cgroup_disabled()) {
> > -             VM_WARN_ON_ONCE(ci->memcg_table);
> > -             ci->memcg_table =3D kzalloc_obj(*ci->memcg_table, gfp);
> > -             if (!ci->memcg_table) {
> > -                     swap_cluster_free_count_table(table);
> > -                     return -ENOMEM;
> > -             }
> > +             memcg_table =3D kzalloc_obj(*ci->memcg_table, gfp);
> > +             if (!memcg_table)
> > +                     goto lock;
> >       }
> >  #endif
> >
> >  #if !SWAP_TABLE_HAS_ZEROFLAG
> > -     VM_WARN_ON_ONCE(ci->zero_bitmap);
> > -     ci->zero_bitmap =3D bitmap_zalloc(SWAPFILE_CLUSTER, gfp);
> > -     if (!ci->zero_bitmap) {
> > -             swap_cluster_free_table(ci);
> > -             swap_cluster_free_count_table(table);
> > -             return -ENOMEM;
> > +     zero_bitmap =3D bitmap_zalloc(SWAPFILE_CLUSTER, gfp);
> > +     if (!zero_bitmap)
> > +             goto lock;
> > +#endif
> > +     ret =3D 0;
> > +
> > +lock:
> > +     if (!locked) {
> > +             if (si) {
> > +                     local_lock(&percpu_swap_cluster.lock);
> > +                     if (!(si->flags & SWP_SOLIDSTATE))
> > +                             spin_lock(&si->global_cluster_lock);
> > +             }
> > +             spin_lock(&ci->lock);
> >       }
> > +     lockdep_assert_held(&ci->lock);
> > +
> > +     /* A stale reclaimer may have returned the cluster to allocation.=
 */
> > +     if (ci->flags !=3D CLUSTER_FLAG_NONE || cluster_table_is_alloced(=
ci))
> > +             ret =3D -EAGAIN;
>
> [Severity: Medium]
> Can a stale reclaimer trigger a NULL pointer dereference in
> swap_cluster_assert_empty() while ci->lock is dropped here?
>
> Because ci->table now remains NULL across the sleeping allocation in
> swap_cluster_populate(), a stale reclaimer that dropped ci->lock before t=
he
> cluster was freed and re-isolated can reacquire ci->lock while ci->count =
is 0,
> ci->flags is CLUSTER_FLAG_NONE, and ci->table is NULL:
>
> CPU0                              CPU1
>                                   cluster_reclaim_range()
>                                     spin_unlock(&ci->lock)
>                                     /* ci is freed and table is freed */
> isolate_lock_cluster()
>   ci->flags =3D CLUSTER_FLAG_NONE
> swap_cluster_populate()
>   /* atomic alloc fails */
>   spin_unlock(&ci->lock)
>   swap_cluster_alloc_table()
>                                     spin_lock(&ci->lock)
>                                   ...
>                                   relocate_cluster()
>                                     free_cluster()
>                                       __free_cluster()
>                                         swap_cluster_assert_empty()
>                                           __swap_table_get()
>                                             <-- NULL pointer dereference
>
> In relocate_cluster(), !ci->count and ci->flags !=3D CLUSTER_FLAG_FREE ar=
e both
> true, so it calls free_cluster() -> __free_cluster() without checking
> cluster_table_is_alloced(ci).  With CONFIG_DEBUG_VM enabled,
> swap_cluster_assert_empty() calls __swap_table_get(), which dereferences =
the
> NULL ci->table.  With SWP_PAGE_DISCARD enabled, free_cluster() also sched=
ules
> a redundant discard before swap_do_scheduled_discard() calls __free_clust=
er()
> on the tableless cluster.

Hmm this sounds like another pre-existing issue to me... Right now
stale reclaimer can get into this exact same situation?

The only thing this patch does is extending the table-less window (i.e
push it til after lock acquisition), but the race window exists either
way.

>
> Should relocate_cluster() avoid calling free_cluster() when
> !cluster_table_is_alloced(ci)?


But this proposal sounds good to me. I'll add this fix to v2.

>
> [ ... ]
>
> > @@ -571,13 +612,9 @@ swap_cluster_populate(struct swap_info_struct *si,
> >        * could happen with ignoring the percpu cluster is fragmentation=
,
> >        * which is acceptable since this fallback and race is rare.
> >        */
> > -     local_lock(&percpu_swap_cluster.lock);
> > -     if (!(si->flags & SWP_SOLIDSTATE))
> > -             spin_lock(&si->global_cluster_lock);
> > -     spin_lock(&ci->lock);
> > -
> >       if (ret) {
> > -             move_cluster(si, ci, &si->free_clusters, CLUSTER_FLAG_FRE=
E);
> > +             if (ret !=3D -EAGAIN)
> > +                     move_cluster(si, ci, &si->free_clusters, CLUSTER_=
FLAG_FREE);
> >               spin_unlock(&ci->lock);
> >               return NULL;
> >       }
>
> [Severity: Medium]
> Can an ABA race on ci->flags and ci->table cause a failed allocator to pu=
t a
> cluster back onto si->free_clusters while a second allocator still has it
> isolated?
>
> When CONFIG_DEBUG_VM and SWP_PAGE_DISCARD are disabled, a stale reclaimer
> calling relocate_cluster() -> free_cluster() -> __free_cluster() moves th=
e
> tableless cluster back to si->free_clusters.  A second allocator can then
> re-isolate it and also drop ci->lock for a sleeping table allocation:

I think if we fix the above issue (i.e not letting relocate_cluster()
put the tableless cluster back to free list), we will fix this issue
too.


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106160432.25=
52507-1-nphamcs@gmail.com?part=3D2
