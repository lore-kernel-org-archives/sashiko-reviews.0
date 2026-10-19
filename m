Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCA37E30C
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 07:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395671; cv=pass; b=AM6FB1gI1cOqQL1XV5F6bs2dz6PUpRmbClHoY8olodP6pcm0ffj8ouNsonIupZreW8vX7VYh1ByLJh8d7zwXBWCMPXBvpRUwbQUxhKq2Z8VV74ujrP+bU+hnNoAZtPKJg6EqueTS5ueg0XVWLknXqnpCQGS/RVCJap/tdoUjBe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395671; c=relaxed/simple;
	bh=jPqPx4WIvZCwXAxSt7/GckqZUZbeRwYWXgGLl4PYDUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YyGs+LZCEoLbhJ6MaZ7x/i73+SPT7JkDgUIsZXPPt+LprgTW9Y2HyIC3u9t0FlOPXnsFFtaBW8LESMyPgng0XGYdRKJh/0n8w9UhhUPkLwd1MkbKYdWDACnkNXtaAy75l862w14m749ybqQTORpKeUxnUj7kaORkoW+X8GIcP9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWeMt3Hq; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWeMt3Hq"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67921b515a7so1874779d50.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 00:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792395669; cv=none;
        d=google.com; s=arc-20260327;
        b=R0wm/3USJB8Y/1GPFJrPh5NeFjP8C8k8nFDZYiaf9Lic4frPQmj35ymdKZ0U11weON
         5lk0s5EWRo3Iik8gJov8Z1D4ZLhaSk0k7WtA4+xbEBdyubmAvjh6kSRzE2bhnLMKBM+B
         DRjJrNeZXGc1R1nt/+9/V9Yb+UBCYA0a6VD9zTSSr01FPSPbh3pDwD6Ig4iKmchs7lpF
         LaM1vkQhLXM2sKwkxyifW1bbqibty4tELswCYqTwNsxM00q203iv3ussgqViPExaqU8r
         K59mBRGJ6Pf1D8cvD5hgZgCrg/t64NPAifDIPmJ0RmoHGyboNnwLBUc5BPimFenGf/un
         Eh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KpPZjaMDJls8EZkE/6oJfht+hbPc5JiwcvTAxpT7o3k=;
        fh=risCXqddoJ4OMyEDiuoDYKl7eVWeTYRF0lZTs6+72Q8=;
        b=dgpmFVQNq/VpoXb0+cveqTWkiAcjq4DhBRhcWt7r7gL+G+RjzukS0jPWgyCT885nVy
         RAKCml61eBkLgwkDEs7qbGUQfKu0Z3f1B3iuerd5Qn096MSSbGXAOuj8kn7/SmRliYbH
         L2UaY4Iz3sOlbHfEe9x248L+9ZTOksD5UoBON1LqISxBSpDdQP0O+DFPCLLLsAFME+j5
         5lDybrLlf7mOif3e3mjjAkhAb5WSSWsBuDSyb1/LMW9eOQrF8OeetvsbR/1JqHzLM451
         nR8deJxBVB6lNSN4hK25Q/fAetfMhMOf2Fh8dvqSF/fjouhm7WqeuBQ7P4F/+SYlh2ys
         GuOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792395669; x=1793000469; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KpPZjaMDJls8EZkE/6oJfht+hbPc5JiwcvTAxpT7o3k=;
        b=nWeMt3HqKWZywVt1lq23Zg+jWLvSjeRKLSxobUkAtQhvxvikjWIAMosN+14IoAESH0
         zLnnaKvEb4ppI1ILuJbUDqLiYMIrFPr6j03WhBMGCEpQ07meYMxnsh5cW5iRxwIZl1fb
         BR5+UuCARJLQan2CGoK8r6bR9/Bdf21cVhlR3ZwAp3FD0v/+lo6nM6QsY6sCA++G2RCt
         WS9J7HM8Ver5Z/0p1SxjJxaVPWuLqzMP2CaYoD8V4o4WTdksCgPjmnY97gc8HU2i8JI1
         m8xHTRfm4wEGXW1X48r30J96AW+i45tb7keRfk5XbqTc/e1pSy0KturG2C2Br5NZKX71
         flQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395669; x=1793000469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpPZjaMDJls8EZkE/6oJfht+hbPc5JiwcvTAxpT7o3k=;
        b=DKwEY/PCTyQByChWOMmQnIntDQEuxWN3ChZMcXerJdJD5XpSvMzlMBFlCkpI9Ofge4
         52bSws2Ud3ATn/VtJT5TIUCW9PFpbudvA++MGqn7nKUzcqQ9Ts1q70s1bC+Lu33tmD1H
         Fkh8HegtYoIxEkVibBiq/ZPub7b9euufrItXVjcXOOmRd9xl8ixeyTvt3nKhfqFDq49L
         bTZIGIFEgBULsTzKALPAbyU09jcnK3Ij7AhqzFilZpi7o68NYALcc7jm3Sum9WubfKCP
         K2jOGHdwAnuYQ3F99JvyjAYeFGnlHqnB2rlwMp2IHiAVbWsJiZQRz5z2Z1JtnKNo1HkF
         U1/A==
X-Gm-Message-State: AFq9FYJqsgWdNxpkQgY4KDuEQsV2JhFGQazR9WOkDcr/8KJhdKuUtMKL
	Z87UxBWITutQpprKE+p9kOVkiASCL4g3SOEDl2f0gRAcjvUFmpV+o951pK0CF2rNl4z9cPYDfeD
	W8Xvkf5y3qWg+E+Ltp6BLiRxFiDduVOTaf24zx/4=
X-Gm-Gg: AYBFou35VmGq2F+GtUXBzNcVqq29OSWF+tHnM6gcOboWhkUviieBIdXplAsiQAHsmTb
	1rJR4ffByf/6EX+g+banoK8BE4FS03Cw6+KuwOCH2j5EOO4Hb3bi0mnxA4vZibClBlsy/EpJtvx
	1dY7JF1NbaJIwO/+qoNLTO/wYWzg2xOBlmUA5f5FI/uawBNjgJ3/dHuXBE737BU4hp3p1Dd90+D
	+h8xZW3NdJshc+Srd9D1zPtuJvHFyYuhhEv1KnfBthgkZPJrVEOAelSZaF2CaEeYVIgIxCfGuAn
	Q3yWTBesbQwkHJrs1bnqDaKt6pLINDmO2R48BpfJQPvVaqYv1OYrCAZXVVIqZyERw4Ax3YTykIM
	QNUaXHY6QTA==
X-Received: by 2002:a05:690e:4181:b0:679:938d:a5e1 with SMTP id
 956f58d0204a3-679ca9152camr1672832d50.106.1792395668941; Mon, 19 Oct 2026
 00:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261019064157.29885-1-laoar.shao@gmail.com> <20261019064157.29885-5-laoar.shao@gmail.com>
 <sashiko-outbox-176727@kernel.org>
In-Reply-To: <sashiko-outbox-176727@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 19 Oct 2026 15:40:28 +0800
X-Gm-Features: AclHuK87RnG2er9Q0sMuCWVVDHgxTVssGIXLDngoxhqch9KZMv8DKOFsSe8QrYs
Message-ID: <CALOAHbA9XCM=5AKz=MMCRcx79_E44rBNUZQi_c68tZQ1iYoxhA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 bpf-next 4/5] sched: add BPF-based per-cgroup NUMA
 balancing mode selection
To: sashiko-reviews@lists.linux.dev
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, gourry@gourry.net, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev, 
	yu.c.chen@intel.com, zhao1.liu@intel.com, tim.c.chen@linux.intel.com, 
	lizhe.67@bytedance.com, bpf@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] mm: use-after-free on source folio in migrate_misplaced_foli=
o()
> --
>
> commit 5de3ed8c82d3030544f5f025b8ae47dd8339bfeb
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> sched: add BPF-based per-cgroup NUMA balancing mode selection
>
> This commit introduces per-cgroup NUMA balancing mode selection managed v=
ia
> the bpf_numab_set_mode() and bpf_numab_get_mode() kfuncs. Hot paths combi=
ne
> requests along the task or folio's memcg cgroup hierarchy behind the
> numab_cgroup_mode_set static key to override the global sysctl setting.
>
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 211c29bd2a283..c0692c7b27467 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
>
> [ ... ]
>
> > @@ -2770,7 +2770,7 @@ int migrate_misplaced_folio(struct folio *folio, =
int node)
> >       if (nr_succeeded) {
> >               count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
> >               count_memcg_events(memcg, NUMA_PAGE_MIGRATE, nr_succeeded=
);
> > -             if ((numab_in_tiering_mode())
> > +             if (folio_numab_in_tiering_mode(folio)
> >                   && !node_is_toptier(folio_nid(folio))
> >                   && node_is_toptier(node))
> >                       mod_lruvec_state(lruvec, PGPROMOTE_SUCCESS, nr_su=
cceeded);
>
> [Severity: Critical]
> Has the source folio already been uncharged and freed by the time
> migrate_misplaced_folio() calls folio_numab_in_tiering_mode(folio) here?
>
> Before calling migrate_pages(), migrate_misplaced_folio() snapshots the
> folio's memcg because migration transfers the charge and releases the
> isolation reference on the source folio:
>
> migrate_misplaced_folio()
>   memcg =3D get_mem_cgroup_from_folio(folio);
>   migrate_pages()
>     migrate_pages_batch()
>       migrate_folios_move()
>         migrate_folio_move()
>           move_to_new_folio()
>             folio_migrate_flags()
>               mem_cgroup_migrate()
>                 old->memcg_data =3D 0;
>           migrate_folio_done()
>             folio_put(src);
>
> When nr_succeeded is non-zero, calling folio_numab_in_tiering_mode(folio)=
 ->
> folio_numab_mode(folio) -> folio_memcg(folio) -> folio_objcg(folio) reads
> folio->memcg_data on the freed source folio:
>
> static inline struct obj_cgroup *folio_objcg(const struct folio *folio)
> {
>         unsigned long memcg_data =3D folio->memcg_data;
>
>         VM_BUG_ON_FOLIO(folio_test_slab(folio), folio);
>         VM_BUG_ON_FOLIO(memcg_data & MEMCG_DATA_OBJEXTS, folio);
>
>         return (struct obj_cgroup *)(memcg_data & ~OBJEXTS_FLAGS_MASK);
> }
>
> If the freed page has not been reallocated yet, folio->memcg_data is 0, s=
o
> folio_memcg(folio) returns NULL and folio_numab_mode(folio) falls back to
> NUMAB_FOLLOW_SYSTEM rather than using the owner cgroup's tiering mode for
> PGPROMOTE_SUCCESS accounting.
>
> If another CPU reallocates the freed page before this check runs (for exa=
mple
> as a slab page setting PG_slab and MEMCG_DATA_OBJEXTS, or as a compound t=
ail
> page), can folio_objcg(folio) trigger VM_BUG_ON_FOLIO() or dereference a
> slabobj_ext pointer as a struct obj_cgroup *?
>
> Would it make sense to evaluate folio_numab_in_tiering_mode(folio) before
> migrate_pages(), or derive the mode from the already-pinned memcg pointer=
?

Nice catch. The check has to run before migrate_pages().

diff --git a/mm/migrate.c b/mm/migrate.c
index 4b87d465c5fd..84f224c42ab2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2761,6 +2761,7 @@ int migrate_misplaced_folio(struct folio *folio, int =
node)
        LIST_HEAD(migratepages);
        struct mem_cgroup *memcg =3D get_mem_cgroup_from_folio(folio);
        struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+       bool folio_tiering =3D folio_numab_in_tiering_mode(folio);

        list_add(&folio->lru, &migratepages);
        nr_remaining =3D migrate_pages(&migratepages, alloc_misplaced_dst_f=
olio,
@@ -2771,7 +2772,7 @@ int migrate_misplaced_folio(struct folio *folio, int =
node)
        if (nr_succeeded) {
                count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
                count_memcg_events(memcg, NUMA_PAGE_MIGRATE, nr_succeeded);
-               if (folio_numab_in_tiering_mode(folio)
+               if (folio_tiering
                    && !node_is_toptier(folio_nid(folio))
                    && node_is_toptier(node))
                        mod_lruvec_state(lruvec, PGPROMOTE_SUCCESS,
nr_succeeded);


BTW, the folio_nid(folio) next to it has the same problem: after a
successful migration the source folio is uncharged and its isolation
reference dropped, so it may already be back in the allocator, and
a reallocated page's flags give a wrong nid. That one predates this
series (it goes back to e39bb6be9f2b), so I will fix it separately:

diff --git a/mm/migrate.c b/mm/migrate.c
index 15b45832bcfa..685c06a472ea 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2760,6 +2760,7 @@ int migrate_misplaced_folio(struct folio *folio, int =
node)
        LIST_HEAD(migratepages);
        struct mem_cgroup *memcg =3D get_mem_cgroup_from_folio(folio);
        struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+       int src_nid =3D folio_nid(folio);

        list_add(&folio->lru, &migratepages);
        nr_remaining =3D migrate_pages(&migratepages, alloc_misplaced_dst_f=
olio,
@@ -2771,7 +2772,7 @@ int migrate_misplaced_folio(struct folio *folio, int =
node)
                count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
                count_memcg_events(memcg, NUMA_PAGE_MIGRATE, nr_succeeded);
                if ((sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIE=
RING)
-                   && !node_is_toptier(folio_nid(folio))
+                   && !node_is_toptier(src_node))
                    && node_is_toptier(node))
                        mod_lruvec_state(lruvec, PGPROMOTE_SUCCESS,
nr_succeeded);
        }

Pls correct me if I'm wrong.

--=20
Regards
Yafang
