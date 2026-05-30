Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB003D76
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780099472; cv=none; b=sINyqFvMBMcMx9yi9tyiOybe0zdrnrw8Uw3HH2DqpOPykZZXCVEqjVC/68TtueT7Rwu8CBw6ZYMEdv9sUYCle409eR4NYWP+p/M9CoNJrSdMSp9KWURRernpMOMKpSXbyqc0tirINKHAnXNXMqVWvWFC81T4ApAyqvL7QborxOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780099472; c=relaxed/simple;
	bh=jrBXHHePQXRE7WQAuiSRTp7kkyTiSwt/dr4x/I7yKJs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dlQm+3cYtRw6MJoNLmETd5tb1pkjD2TeKM8hDqXJWepfSyWABhOiuC6EwvYTQkAbGqb0Lhrn/cccqRP4UQr95Uuvs3ZhNLqbw+lZ0uoOWJacmJoUAPInsj3kUFzBkDfMJNeIWliQYruoeSURjfeFG2ppAm1bqKEcqM8fqaF/IqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq31a2n+; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq31a2n+"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479d593a0c3so11685813b6e.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780099470; x=1780704270; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ7zTAxT4HnS9jyRttceVZQM0e2y7/ezpGfYwYrt4Xg=;
        b=Bq31a2n+H12EWiRw8ZX2QCAZ1iOU3rN6nBTH0lll3tH25HwXrrwlQudAiI5JYsjSN3
         BwyhkMtcYW+UScKDA61bhsZfrqY0V4ZY0p9ED4kfe+eIGZIFgzhRp6nicw+jjfksFjlm
         Xe4drAjrnBWSIKq+OxsuBImtW6RPq7VWdsgzVgQ85MgCCt9cvbIc/yBm2PiIowAeyJ//
         JKPvA9r8Ubwk2ZokG6dLR7Wb24Pyy+od7tV3PNzk7ZZkYQ5gMa3aOqE1zJ3ZQTPnNXWP
         pmsjtdGz48iP5yjrwYDWjJdF5V+hmqTjHUTTd467eZP1bivUKi9rJn0CJCnbEiDwjRST
         DQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099470; x=1780704270;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQ7zTAxT4HnS9jyRttceVZQM0e2y7/ezpGfYwYrt4Xg=;
        b=olvqbS1BvO5DdPZ3N+NKBjwNnR0MnG8HqgglKoQipBLLZRDCEx1UutuQ38oDXXte/R
         t2wXbrJ67LX3ocFMqPHZ9X13tfxaCH9/2jTKl/bTi7pcZzGzOG7lb+/IKo1i9R7+0efJ
         uGsdmIki2LikPH+/lP1eUiwrJAt8QFvJR6kVZ41ExDQV/gnCClKl3HFzBfkjCjLoGsy7
         GqxCVOXOUCui9W3mxDmMsn5OfrxKch6gUOhJndToRrKDpYqTGTeusxefd4AM1fUrX4ZG
         ioaF/4sQ8hfbNCSWhi7oiGqFhZQg5oDIqqjFKw1wyHHy9m0824g9pfh2LH73qIO20NQj
         DpeQ==
X-Gm-Message-State: AOJu0Yw7alUKdS5/XMEK0onCw1gC1ZobBgmZsmkB9jFDd7Y5L2lcsnrV
	1AVVYE45jhNh118+eev0HFGO/rU/SdJqzuwTbKzoKgBK+w8nBQXuADAzlD5Oew==
X-Gm-Gg: Acq92OH4GrgST/asZBJ39aN/u7NjOLQUFm0rUhAnIy1DjJGFz+LAkla94ujezDVgIK4
	yCuEEqqMQvXD4FXpjVhPIi/Ccdjmkm+lgBwfxBaFEXChGIilDawOzI2tSXUi3B18RqA4doFgVqO
	cad4ADpgyHjgaejRydD/8zkOA/OD74YlCQHDhclnpMDATS7h1jG6djgYMXqOiCtFmGMXARsbFuo
	S/z39DBSd8gPSxnQAQo6AgRF8pQbSvwuAu5pfCQdSqMxJUL2uEN/sJCx6+7e/fMkLLob8yTak1j
	0Hwa9122pcyaix+K8Iq5Ghjx9ebIV/saBYTMZqFrWd8XU5pzsBBpnOHWT7oiapIlR9UCklvfzSV
	tRMa0zu8tFesbdGpesghKZo/DIjmGd9gaZvZShOcikTQ5Mq6mD5fgIALMSI0cIGMex+YRghzlO3
	9pSM/NbwFLtsivd075nsfzMtPz8ZjRHWsRZ0HE3WvPE2eiFLkzYh7NMPP3TEuM/0u2zsKR/NkYj
	Xf3aW9A1GLojFETGdYxHCDTgijMS/v0/jN9GTg=
X-Received: by 2002:a05:6808:6611:b0:485:4c40:419d with SMTP id 5614622812f47-485fb2d2ce2mr843566b6e.18.1780099469920;
        Fri, 29 May 2026 17:04:29 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485ee13b24asm1590258b6e.9.2026.05.29.17.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 17:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 17:04:26 -0700
Message-Id: <DIVKLHOSYUP3.MMDGEURVFLHD@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 3/4] bpf,slab: Add slub-backed allocator for
 bpf_arena
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc
References: <20260529202438.16408-4-alexei.starovoitov@gmail.com>
 <20260529220410.1251F1F00893@smtp.kernel.org>
In-Reply-To: <20260529220410.1251F1F00893@smtp.kernel.org>

On Fri May 29, 2026 at 3:04 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [Critical] BPF-induced freelist double-frees artificially drive SLUB's =
inuse counter to zero, prematurely freeing active slabs and causing Use-Aft=
er-Free.
> - [Critical] Skipping alloc_slab_obj_exts_early() for arena caches leaves=
 slab->obj_exts uninitialized, causing a kernel panic when SLUB attempts to=
 kfree() the leftover mem_cgroup pointer.
> - [Critical] An out-of-bounds array access in arena_free_pages allows a m=
alicious BPF program to read and overwrite arbitrary kernel memory by bypas=
sing the bounds check.
> - [Critical] A TOCTOU race condition in bpf_arena_free for multi-page fal=
lback allocations allows concurrent frees to corrupt kernel page allocator =
metadata.
> - [High] BPF program can permanently brick the arena allocator by calling=
 bpf_arena_free_pages() on an active slab page.
> - [High] Invalid wait context: calling apply_to_page_range() under a raw =
spinlock causes scheduling while atomic on PREEMPT_RT.
> - [Medium] Trylock failures in __slab_free permanently leak orphaned empt=
y slabs.

that's a lot of slop to unpack :)
I wish sashiko learned from these explanations, but here they are.. at leas=
t for humans.

>>  static int apply_range_clear_cb(pte_t *pte, unsigned long addr, void *d=
ata)
>>  {
>>  	struct clear_range_data *d =3D data;
>> -	pte_t old_pte;
>> +	pte_t old_pte, cur;
>>  	struct page *page;
>> =20
>> +	/*
>> +	 * Skip slub-owned pages: BPF must use bpf_arena_free() for per-object
>> +	 * slab frees. The PTE stays; slub releases it via arena_free_slab_pag=
e()
>> +	 * after __ClearPageSlab(). Non-atomic ptep_get() is safe -- ptep_try_=
set()
>> +	 * only fires on pte_none, and arena_free_slab_page() can't race on th=
is
>> +	 * offset (range stays allocated in range_tree for our walk).
>> +	 */
>> +	cur =3D ptep_get(pte);
>> +	if (pte_none(cur) || !pte_present(cur))
>> +		return 0;
>> +	if (PageSlab(pte_page(cur)))
>> +		return 0;
>
> [Severity: High]
> If this skips clearing the kernel PTEs for PageSlab pages, could it perma=
nently
> brick the arena allocator?

brick arena allocator? no.

> If a BPF program calls bpf_arena_free_pages() on an active slab page,
> arena_free_pages() adds the page offset back to the arena's free range tr=
ee
> unconditionally.

which is a bug in bpf prog.

> Since the physical page remains mapped, won't subsequent allocations via
> arena_alloc_pages() repeatedly pick this slot from the interval tree, hit
> -EBUSY in apply_to_page_range() because the PTE is not empty, and abort?

they won't "abort". subsequent arena_alloc_pages() will return NULL.
Works as designed.

>
> [ ... ]
>
>> @@ -625,7 +686,8 @@ static u64 clear_lo32(u64 val)
>>   * Later the pages will be mmaped into user space vma.
>>   */
>>  static long arena_alloc_pages(struct bpf_arena *arena, long uaddr, long=
 page_cnt, int node_id,
>> -			      bool sleepable)
>> +			      bool sleepable, bool set_page_slab,
>> +			      struct page **out_page)
>
> [Severity: High]
> Does this code acquire a sleeping lock inside a raw spinlock?
>
> Both arena_alloc_pages() and arena_free_pages() acquire arena->spinlock u=
sing
> raw_res_spin_lock_irqsave(), which is a raw spinlock. While holding this,=
 they
> call apply_to_page_range() or apply_to_existing_page_range().
>
> These functions walk the page tables and acquire the init_mm page table l=
ock
> (ptl), which is a standard spinlock_t. On PREEMPT_RT kernels, standard
> spinlocks are sleepable rt_mutexes. Could this trigger a BUG/panic on
> PREEMPT_RT due to an invalid wait context?

Nope. There won't be any attempts to take locks.
sashiko is missing that populate_pgtable_except_pte() was called at arena c=
reation time.

> [ ... ]
>
>> @@ -778,6 +854,21 @@ static void arena_free_pages(struct bpf_arena *aren=
a, long uaddr, long page_cnt,
>> =20
>>  	page_cnt =3D (uaddr_end - full_uaddr) >> PAGE_SHIFT;
>>  	pgoff =3D compute_pgoff(arena, uaddr);
>> +
>> +	/*
>> +	 * Drop bookkeeping for any bpf_arena_alloc() fallback pages within th=
e
>> +	 * freed range. PageSlab entries are owned by slub and must not be
>> +	 * cleared here; slub clears them via bpf_arena_free_slab_page() when
>> +	 * the slab page is released.
>> +	 */
>> +	for (i =3D 0; i < page_cnt; i++) {
>> +		fb_page =3D READ_ONCE(arena->slab_pages[pgoff + i]);
>
> [Severity: Critical]
> Is there a risk of an out-of-bounds array access here that could bypass t=
he
> bounds check and corrupt memory?
>
> If a BPF program passes ptr__ign =3D 0, and arena->user_vm_start has non-=
zero
> lower 32 bits, clear_lo32() rounds it down to a 4GB boundary, making
> full_uaddr this rounded-down value.

sashiko is missing that bpf_arena_free() has if (!ptr__ign) return;
but lack of page alignment check is indeed missing bpf_arena_free().
It shouldn't be possible to pass ptr__ign =3D=3D 1 and go down
arena_free_pages() path.
Will fix like:
      if (!IS_ALIGNED(arena_off, PAGE_SIZE))
              goto violation;

>> +__bpf_kfunc void bpf_arena_free(void *p__map, void *ptr__ign)
>> +{
> [ ... ]
>> +	if (!PageSlab(page)) {
>> +		/*
>> +		 * Multi-page allocation from the bpf_arena_alloc() fallback.
>> +		 * page->private holds page_cnt stashed at allocation time.
>> +		 */
>> +		u32 page_cnt =3D page_private(page);
>> +
>> +		WRITE_ONCE(arena->slab_pages[pgoff], NULL);
>> +		set_page_private(page, 0);
>> +		arena_free_pages(arena, arena_off, page_cnt, false);
>> +		return;
>> +	}
>
> [Severity: Critical]
> Is there a TOCTOU race condition here when freeing multi-page fallback
> allocations?
>
> If a BPF program executes bpf_arena_free() concurrently from multiple thr=
eads
> on the same valid pointer, they might both read the page pointer lockless=
ly and
> pass the !PageSlab(page) check.
>
> If the first thread calls arena_free_pages(), unmapping the page and free=
ing it
> back to the kernel buddy allocator, the second thread will then execute
> set_page_private(page, 0).=20
>
> Since the page is already in the buddy allocator at that point, could wri=
ting 0
> to its private field corrupt the buddy allocator's internal order-trackin=
g
> metadata?

that's a good one. it's a race indeed.
Fixing like this:
      if (cmpxchg(&arena->slab_pages[pgoff], page, NULL) !=3D page)
              goto violation;

>> diff --git a/mm/slub.c b/mm/slub.c
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>
> [ ... ]
>
>> @@ -543,7 +558,12 @@ static inline void set_freepointer(struct kmem_cach=
e *s, void *object, void *fp)
>>  	unsigned long freeptr_addr =3D (unsigned long)object + s->offset;
>> =20
>>  #ifdef CONFIG_SLAB_FREELIST_HARDENED
>> -	BUG_ON(object =3D=3D fp); /* naive detection of double free or corrupt=
ion */
>> +	if (unlikely(object =3D=3D fp)) {
>> +		/* BPF double-free of arena objects must not panic the kernel. */
>> +		if (s->bpf_arena)
>> +			return;
>> +		BUG_ON(object =3D=3D fp); /* naive detection of double free or corrup=
tion */
>> +	}
>>  #endif
>
> [Severity: Critical]
> Does returning early here to suppress the double-free warning lead to a
> corrupted inuse counter?
>
> If a BPF program calls bpf_arena_free() multiple times on the same object=
,
> this early return bypasses the double-free detection for arena caches. Ho=
wever,
> __slab_free() still unconditionally executes new.inuse -=3D cnt.
>
> Repeated double-frees will drive the inuse counter to 0. When inuse hits =
0,
> SLUB assumes the slab is empty and frees the page back to the buddy alloc=
ator,
> even though other objects in the slab may still be in use by the BPF prog=
ram
> or cached in SLUB's per-CPU sheaves. Could this lead to arbitrary memory
> corruption if the page is reused for kernel data structures?

Not an issue. sashiko missed the key safety concept of the algorithm
that is described in the commit log.
__slab_free() calls bpf_arena_free_slab_page() which frees PTE for that pag=
e
in arena, but bpf progs never see kernel direct-map virtual addresses.
bpf progs operate on kern_vm_start + uaddr32.
So once arena page is freed, bpf has no way to access it.
new.inuse for this arena based kmem_cache can be garbage.
It doesn't affect kernel at all. Only bpf prog that caused corruption
will get garbage back.

>
> [ ... ]
>
>> @@ -3493,9 +3516,11 @@ static struct slab *allocate_slab(struct kmem_cac=
he *s, gfp_t flags, int node)
>>  	init_slab_obj_exts(slab);
>>  	/*
>>  	 * Poison the slab before initializing the slabobj_ext array
>> -	 * to prevent the array from being overwritten.
>> +	 * to prevent the array from being overwritten. Arena caches
>> +	 * stash uaddr32 in slab->stride; let them keep it.
>>  	 */
>> -	alloc_slab_obj_exts_early(s, slab);
>> +	if (!(s->flags & SLAB_BPF_ARENA))
>> +		alloc_slab_obj_exts_early(s, slab);
>
> [Severity: Critical]
> Does skipping alloc_slab_obj_exts_early() for arena caches leave
> slab->obj_exts uninitialized?
>
> Pages allocated for the BPF arena via bpf_map_alloc_pages() use __GFP_ACC=
OUNT,
> which sets folio->memcg_data to point to the memcg. In SLUB, slab->obj_ex=
ts
> shares the same memory location as folio->memcg_data.
>
> If alloc_slab_obj_exts_early() is skipped, slab->obj_exts is never zeroed=
 and
> retains the memcg pointer. When the slab is freed, won't unaccount_slab()=
 call
> free_slab_obj_exts(), which reads the non-null slab->obj_exts and passes =
it to
> kfree(), causing a kernel panic?

sashiko is clearly confused in the last paragraph.
The code it quoted does init_slab_obj_exts() that zeros it.
But the point about sharing the same memory location as folio->memcg_data
is valid. As implemented it skips memcg uncharging when page is freed.
Fixing it with extra arena specific wrapper that does:
    if (!page->memcg_data && objcg && !obj_cgroup_is_root(objcg))
            page->memcg_data =3D (unsigned long)objcg | MEMCG_DATA_KMEM;
    __free_page(page);

>
> [ ... ]
>
>> @@ -5589,14 +5644,19 @@ static void __slab_free(struct kmem_cache *s, st=
ruct slab *slab,
>> =20
>>  			n =3D get_node(s, slab_nid(slab));
>>  			/*
>> -			 * Speculatively acquire the list_lock.
>> -			 * If the cmpxchg does not succeed then we may
>> -			 * drop the list_lock without any processing.
>> -			 *
>> -			 * Otherwise the list_lock will synchronize with
>> -			 * other processors updating the list of slabs.
>> +			 * Speculatively acquire the list_lock. If the cmpxchg
>> +			 * does not succeed we drop the lock without processing.
>>  			 *
>> +			 * Arena caches may reach here from kfree_nolock() in
>> +			 * NMI/irq-off context; trylock and orphan the slab on
>> +			 * failure. A later allow_spin caller adopts it.
>>  			 */
>> -			spin_lock_irqsave(&n->list_lock, flags);
>> +			if (unlikely(s->bpf_arena)) {
>> +				if (!spin_trylock_irqsave(&n->list_lock, flags))
>> +					n =3D NULL;
>> +			} else {
>> +				spin_lock_irqsave(&n->list_lock, flags);
>> +			}
>
> [Severity: Medium]
> Can this trylock failure result in permanently leaking orphaned empty sla=
bs?
>
> If spin_trylock_irqsave() fails for an arena cache, n is set to NULL, and=
 the
> function returns early without adding the slab to the partial list, orpha=
ning
> the slab.
>
> Later, when the slab becomes completely empty (new.inuse =3D=3D 0), __sla=
b_free()
> acquires the list lock but evaluates:
>
> if (!was_full && !on_node_partial)
>
> Since the slab was orphaned, on_node_partial is false, causing the functi=
on
> to unlock and return early. The slab_empty discard logic is bypassed. Doe=
s
> this permanently leak the empty slab until the entire arena map is destro=
yed?

No, it doesn't leak. That was also explained in the comment quoted above
and elsewhere throught arena.c. The whole arena_destroy_slab_caches() is ab=
out that.=20
