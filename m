Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793836273;
	b=n4o9O6XhBxQ8GgzssomkiBVstCuXjs/3tMoI2ocxhJGapc3UIzT5ufaycy3xpcGseV5e
	 pU5s4D+RL4MsCKCuVeditvx1onM4cVHxm4K5ytQgu952QH+Ck3FvnFIb0ZLK7CwASy96W
	 BRaFcpgQOcYYJQZSTeKe0g4Tvp1AnYmEnzAWajqCZemzm3LN/7vsdvJubI650IynfDwSl
	 dbr6ntua4Xx78G8jpAPDwCHANakFe+eS3mGsHgGOusBD4XE/LZxrl6HdAYi1F9o0B0seR
	 nmLqfARQCoLTLR1BsIJ1q3/TEzGruWkhm41xVv3RqWS1gKrSEisUzqTI4nGf6ja5DRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9JGZJc9KgnmzNd8yTchlJnUVRh0mKv/gnJvICDhA10c=;
	b=bxphZ3JJLsEXZc3sLItjCLOufG/Jn+hW+TvmEfH58ua5fgZY1l9bYt/xrnLN5l8VmFii
	 N2G2Lg/dQsJi51IlzZNvpyNeClLrUW0oTibkKSawMITnJk+M2Jwjuf4AHd4F6opyhjmmQ
	 gfhGIfKmD8SCRd4/SlwiNbqtjcQc3Et8q6vi6h/bR+l4QIwTeWo336MrRr8py8YJxzCgc
	 UMTvBejO/+tntbgxglvk1lnsam3mxl6bGKKvqtem7EFZy6cvpVZSzX0iWldWZsqelBCio
	 AFGr1M+P+yPkm9LmXu+7+URsJIPAgVjaGucW3xt7KauZhNBnk7Ia4Xr9SqJGvpGyuug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEVwTEv2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF25606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 23:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gEVwTEv2
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c45111bebso622529f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 15:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793836271; cv=none;
        d=google.com; s=arc-20260327;
        b=Lrr2noU/EoyQckbyDW9fCOS/wUveDqD3Si2qJzCowq2KN8Fw+4Nh7UqUr+ZASx1RaD
         D7DIdg2o6vchq6VUA3LXSOSwOYczfiqhgf5KbgK8T2veKohRGEth7NvIxj80DmNiRtUJ
         O4oo5xNW27V5IfwnADwZxJbkfZLAInP+rvVYibJtioF6Hux1qdDak+Fm7lLzKsEkK4Kb
         h0fW+yjHJK0Q7Ha+BD47PfzOZLqKTkGkxJYk0eI2algtTy8m5Zkn7c0yPF6mA9RI54C6
         FzKUpclJxe5Fr+SeQqlLUHeULufzpuZgs+djv+h2cCrtZ78609dxBylqGIWnktIsvyNf
         YHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9JGZJc9KgnmzNd8yTchlJnUVRh0mKv/gnJvICDhA10c=;
        fh=zdyfqKOd+Gop70ZacMESWkESFKQXYlmjxLwcp4GjDhs=;
        b=Y4getzkYcsROC6CsIuEyxflziojikIDzEa9QSQmGX9ivOsnEIvrZR7QwIminUX7ePq
         D9A536XfVNbeK9EfIbN7kL8L37iPUh8kYs+q0sYJp9qZ/gU3QVdH0M7o5v1wFYCEJv/q
         rGAn4mxE4DrUhUrWBGZ4zR09/uU3E5erIjxW82jsUteQWN4joy4j8Az8q8NhMRXbYBOL
         HBIOJwg5K/54+Sst8e+YyVlagvSOBMfOA99qZq0eGG368zkj255v4iE1S0/ZrJdgCzvC
         Je8H78RZbFvSecEwh7tE+TzyFxkEeEACnKElUGqIr8LMlIf/gfere/8Y5LXnmByRF9Fl
         J1qQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836271; x=1794441071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JGZJc9KgnmzNd8yTchlJnUVRh0mKv/gnJvICDhA10c=;
        b=gEVwTEv2l72bl7hdEghvynw/g2hMglRalJHH4tuKhpYPABnsbjpXCISFaa+pcehO0j
         aPvVoGUG9FKo45plgFCl9csP59vFdZ3+A3R14Naul2Es4w313CqyqnkM7e6ArGtdes7I
         Q638j2VCmNw0I9PXYnBGGZja72h2trbaqaLH5Al/svsBWxC9zBZKGzDvNMu5JKGr+c68
         z4PIoH/0EJoME3ZtKMcm70KgB1nQyhHwTesFw62EFh3terDK781psDHCtJq7LeNLcy65
         Memq+fiM2xmknMv7cdM3I30Nm2oLIhTP4PKHnHd3uWC7lCmHXe2aRleL8TE5PB3aJQ61
         t++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836271; x=1794441071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JGZJc9KgnmzNd8yTchlJnUVRh0mKv/gnJvICDhA10c=;
        b=qpChM1XmhJ8bpw82aA5uGDZ7JTn8YLWdQz5HO22bVtP7qaUM9znayn6F6atHZYo+Ca
         4ZISGUsVDMI7+JJqwLQ3KWFcK7e7upbDHq20ryhahLWFu5WLJVz/NHbPPiqzLy52+spS
         BGlH3ONnBC2grueIcpl9fAHHMRzXuYA9VsaYQRfKfTuzuv4EMHwpgx7tcNO6xAodKZPE
         aWU66T9YA7bxTCMHHDf4LH4YshjPsPebUaYnlMM16RhhrGEoN7bTvcLluGWSqdfrYjRU
         oRb/IxtiIrlQaiPrUcPGTI5qdR1zq0aKDkwY460MJEh8V3Uu4d4fFTZraAYh+c00rOT7
         pKHQ==
X-Gm-Message-State: APuU4Z86AoYwI/YtRazmOPd7hUcsEJ0/mfjIT4EjtITDG6ag8q4iuVeX
	Lyiu+FUn5TDB/UpkSp0QMuVHaowGsLVxu2YwEOLuoiHrSRqVCPGTFNNyZLUwV5pJwlFKtsb6raz
	GoY3BUSOlmh5NIvaZGza9tbJJT6w7/DtqaQo8mXA=
X-Gm-Gg: AYBFou0H73Dqj1YKlczYsaFjinyvTYWsGHqglqZJXkjN4VJyU1LuBMC4W2T0GbUNpB7
	p6JaRJchRZXkuennT90KVQlhhCxpXsCt8s8q8cBP+2UjdIe1FknEiH2/8pmIwFKIkKIvUubBKJe
	zooPwJBkU0VAsdgC7VuOiC2l+j5OfXShyRosWW5qJ7Fp/f+POmYLrn4yTmU8ORYtr2UqibqWVfc
	mhInMtokHhtfVvHDJrgXheae3nVJJx6JfTqwPtP1kGmvYL4jgWZSKAq11ZIh8qj0STT1dJm0NY/
	3SxvJQZq2UGVfkTiXRaYh7sPpqfY48B9wLOgYUrXyfCA+gJ4/x59AgpJMuO5NwNhGqRhrSypPaB
	zRbg2hMx/ADsGH23phQAmDGQknY0L0Pv1yP0KusBlyJIuYs3PuvmorpwziVujpPGWjansSTj2MJ
	BG3ykp4ivbEZZ32JhJnw==
X-Received: by 2002:a05:6000:24c4:b0:48d:f9dd:e3de with SMTP id
 ffacd0b85a97d-48e6e511219mr38694271f8f.45.1793836270653; Wed, 04 Nov 2026
 15:51:10 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103212004.1356327-1-joannelkoong@gmail.com>
 <20261103212004.1356327-5-joannelkoong@gmail.com> <sashiko-outbox-198104@kernel.org>
In-Reply-To: <sashiko-outbox-198104@kernel.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 4 Nov 2026 15:50:58 -0800
X-Gm-Features: AclHuK8LMj1EsjYTkvxo267ROt1tEN-rvdCDmErGRhbfwk9mjVdCNsfb7CKSm3o
Message-ID: <CAJnrk1auD1u1J0yQrXOeJrxvVsQfbxYf+nsMS-9qFQ0hfchG-w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mm: add anonymous mTHP folios to the deferred
 split list
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	baohua@kernel.org, usama.arif@linux.dev, hannes@cmpxchg.org, kas@kernel.org, 
	alex@ghiti.fr, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mm: try_to_migrate_one() triggers deferred_split_folio() on unde=
rused mTHP
> --

Hi Sashiko,

I'll try to address these points below.

>
> commit 82b7b7063b986d802fe52e75e17211e58f3f420c
> Author: Joanne Koong <joannelkoong@gmail.com>
>
> mm: add anonymous mTHP folios to the deferred split list
>
> This commit queues newly mapped anonymous mTHP folios of at least 2M onto=
 the
> deferred split list in map_anon_folio_pte_nopf() so that underused mTHP f=
olios
> can be split by the deferred split shrinker under memory pressure.
>
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 0c9ed04528d88..44376321180b5 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5477,6 +5477,8 @@ void map_anon_folio_pte_nopf(struct folio *folio,=
 pte_t *pte,
> >       folio_add_lru_vma(folio, vma);
> >       set_ptes(vma->vm_mm, addr, pte, entry, nr_pages);
> >       update_mmu_cache_range(NULL, vma, addr, pte, nr_pages);
> > +     if (folio_test_large(folio))
> > +             deferred_split_folio(folio, false);
> >  }
>
> [Severity: High]
> When deferred_split_scan() splits an underused PTE-mapped mTHP folio queu=
ed
> here with PG_partially_mapped left clear, doesn't unmap_folio() trigger a
> false-positive deferred_split_folio(folio, true) transition during the sp=
lit?

Yes, but I don't think this is specific to this series. Splitting any
PTE-mapped anon large folio that isn't already marked partially mapped
goes through the try_to_migrate_one() -> folio_remove_rmap_pte() path
you describe below, where __folio_remove_rmap() requeues it as
partially mapped mid-split. That already happens today (eg underused
splits of PMD THPs whose PMD has been split). This series makes it
more frequent since underused mTHP splits now take that path too, but
this issue is pre-existing.

>
> In deferred_split_scan(), the folio is first removed from the local dispo=
se
> list while PG_partially_mapped is still false:
>
> mm/huge_memory.c:deferred_split_scan()
>         list_del_init(&folio->_deferred_list);
>
>         if (!folio_test_partially_mapped(folio)) {
>                 if (folio_test_mlocked(folio))
>                         goto next;
>                 underused =3D thp_underused(folio);
>                 if (!underused)
>                         goto next;
>         }
>         if (!folio_trylock(folio))
>                 goto requeue;
>         if (!split_folio(folio)) {
>
> split_folio() then calls __folio_split() -> __folio_freeze_split_anon(), =
which
> unmaps the folio before freezing its refcount:
>
> mm/huge_memory.c:__folio_freeze_split_anon()
>         if (folio_mapped(folio)) {
>                 anon_vma =3D folio_get_anon_vma(folio);
>                 if (!anon_vma)
>                         return -EBUSY;
>                 anon_vma_lock_write(anon_vma);
>                 ret =3D unmap_folio(folio);
>                 if (ret)
>                         goto out_unlock;
>         }
>
>         local_irq_disable();
>
>         if (!folio_ref_freeze(folio, folio_swapcache_ref_count(folio) + 1=
)) {
>                 ret =3D -EAGAIN;
>                 goto out_no_split;
>         }
>
> Unlike a PMD-mapped THP (where split_huge_pmd_locked() with freeze=3Dtrue
> removes the entire PMD rmap in one folio_remove_rmap_pmd() call), an mTHP
> folio is PTE-mapped, so unmap_folio() -> try_to_migrate() ->
> try_to_migrate_one() removes its PTEs one subpage at a time via
> folio_remove_rmap_pte().
>
> On the first subpage unmapped while the remaining subpages are still mapp=
ed,
> __folio_remove_rmap() sees partially_mapped =3D=3D true and
> !folio_test_partially_mapped(folio) =3D=3D true:
>
> mm/rmap.c:__folio_remove_rmap()
>         if (partially_mapped && folio_test_anon(folio) &&
>             !folio_test_partially_mapped(folio) &&
>             !folio_is_device_private(folio))
>                 deferred_split_folio(folio, true);
>
> Because folio->_deferred_list was emptied by list_del_init() in
> deferred_split_scan() and the folio refcount is not frozen yet,
> deferred_split_folio(folio, true) sets PG_partially_mapped, increments
> MTHP_STAT_SPLIT_DEFERRED and MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, and re-a=
dds
> folio->_deferred_list onto deferred_split_lru.
>
> Could this cause three problems?
>
> 1. Even when folio_ref_freeze() succeeds and __folio_freeze_split_anon()
>    subsequently unqueues the folio and resets PG_partially_mapped, every
>    underused mTHP split will also increment MTHP_STAT_SPLIT_DEFERRED in
>    addition to MTHP_STAT_SPLIT_UNDERUSED.
>
> 2. If folio_ref_freeze() fails (for example due to a concurrent GUP pin, =
or
>    because a second CPU running deferred_split_scan() isolated the re-que=
ued
>    folio via folio_try_get() while the remaining PTEs were still being
>    unmapped), __folio_freeze_split_anon() jumps to out_no_split and remap=
s all
>    PTEs via remap_anon_folio() without unqueueing the folio or clearing
>    PG_partially_mapped. That leaves a fully mapped folio permanently mark=
ed
>    PG_partially_mapped with MTHP_STAT_NR_ANON_PARTIALLY_MAPPED leaked.

This (and #1 above) are pre-existing issues that are already possible
for underused splits of PTE-mapped PMD THPs.
I'll look into this and submit a fix for this separately.

>
> 3. If a second CPU running deferred_split_scan() isolates the re-queued f=
olio
>    onto its local dispose list while unmap_folio() is still in progress, =
that
>    extra refcount causes folio_ref_freeze() on the first CPU to fail. Whe=
n the
>    first CPU returns to deferred_split_scan(), it sees !did_split &&
>    folio_test_partially_mapped(folio) =3D=3D true and calls list_lru_add_=
irq() on
>    folio->_deferred_list while the folio is on the second CPU's unlocked
>    dispose list, corrupting the list.

I don't think this can corrupt the list. __list_lru_add() only adds
the entry if the "if list_empty(item)" check passes, so while the
folio is on the other CPU's dispose list, list_lru_add_irq() returns
false and leaves it alone.

Thanks,
Joanne

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103212004.13=
56327-1-joannelkoong@gmail.com?part=3D4
