Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106890;
	b=2W5CnS1g0bzRijy0KUYYRR9Lkv7vpo268m9lGnlqhweEjpj/rAMBqZkkjuAUPxvjYYB0
	 J52ujM2kS37a0oJOzLOnTw4im6I6EOQq0eZry03F5Fwp5CS5gyIXA0LPQeTF0wMRBfy1s
	 r85z6/EWO8flpNP3AklihClHOJPVYsPjvjQRt3byYIzpSwm2BFxQzqmBDtstRTNaz1lMF
	 p+OpbrcFX/H886ccobMrQiE8qy1tS6SB5evE3tFKjZgfgBz7zpsKN8Yi8ZAcEULXcWXre
	 xwZBu8VM4nhrS6GhZ3v6Ivk5KvVzbZsa64alKpOpb6yM1kW9XsGzr8fkcwvFZOzplng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p2uWa8OCp+JmIWz9LyNPjeXGN6Nre3MtmULmcDT63fA=;
	b=xN0Vqy2H/Ob6DUO4MlGdN+6wexpX+5rYkk96injTs7Cwa38zu6AzHE7XaPtLW4UBz9OB
	 nuP1VH8YH2vk/WYdEuPY+H8NA9YNfefk2k67qa/tOuam3e/9ggBjUarmSFpUyiqDxlQMq
	 g5+nM3yxDObmtUS4e3clIrIXOR3R2vBHVhPOPRaSrtGk85peVHKs39g7OGnW1CQg3QyLq
	 ZDEZoPVyZDXQGHVRN4JIUCyMW/2NFlc4F5uM4k5DakAkPZRJrMJIhmBeLYg9fvYeyalRO
	 iEmQIrxqjW33K1mLGLrqj0Wboz9PkjjRNALWGV31J+imjxKNdpQbCBMAiHesdKqLf7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FAuwyG1+;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29728606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 13:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29728606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FAuwyG1+
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c43373ae89aso627713666b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793106888; x=1793711688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2uWa8OCp+JmIWz9LyNPjeXGN6Nre3MtmULmcDT63fA=;
        b=FAuwyG1+qVpl9TdXYrjPTHmAAiAdxw3OgxU1IXeBPiMcN1HnxlM8fSbSliFmrB1LpH
         QcQdJDtA9O2ety+xQB67A7UqGNY4ptsZ/NBwHEUpeVgKCTFA1RIQQC15WUxMh6XYHpWU
         0ibUMCU6q7Wuga7zIwWm6Bb0edEMjYFy0R097oy3ymOKF8WjlIppIPQk6VW2hlK9I4CH
         B+o612wLyzGdq+lYwSDkNhDc9JFXAK+tH72U21IZqrvFET8Q87Ypaj10AmY/D4I1a6aq
         e8Ydj5HKT08uHbeUcwa/kikWrLWudIbY0WMUi+uLt5YQWQNWT8LFEwyJEgID5X9rtJOw
         xKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106888; x=1793711688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2uWa8OCp+JmIWz9LyNPjeXGN6Nre3MtmULmcDT63fA=;
        b=f9c0QbTj+OoqZhwiWiv+zibckN6GJH2yYPJ+U2DjXoPZnLQivwtngfSI9tdxhwjL6C
         8OG9EBvCnPH4ut3gTI9W8MYeFdimWXiYHGwxaok7E7oMtp08LKMg9LkcWhv4yJoLh5Lc
         6/1b++TFMxAMl70WmXuma0n8q8TKHFZ8ZSSr+y/2hSrdw5vwLC35l+oWkDK+q3A9ZxYA
         zJL3Ge445IWLrKocmnhFdFlv+0319IcBr912hUlCkQYLAEstf1AjX6B9283sUCLeoq1h
         FV5vB9tOrOqcL9pVFtw8jT5OELEzbtTd6U/Bzv+0BKOxsOibOnEdpRoi3rGRjfVrBcxs
         kyMQ==
X-Gm-Message-State: AFq9FYLmFMb/oUWtCCgOzf4XQW47imJKShz9Lr0Nrz/sxMH1u8WqQt08
	85gjmmQdSiR8k87VCeU6aTgT0hPdASYB4ZtnXeI5i0/NjhNMLKNi5mCLOn7eFtu73Gg=
X-Gm-Gg: AYBFou0+/3KD4dwHjQz72DUYljlJfJ7LlAPr37bA9LR8xXMDn7bmNLfiaXn83a/SQ+m
	cc1LiczS802309tPfTO5LBReQ9woZ9mJ0aTIrW/Oj7sYJbdFCSmQn4UrxoVZRVze4osHVLqFCov
	jx1cLZmIkI0ksRrSg2UVBICBKuiiGfXMM0uBn+C3USqarxgl2ChCoDV9iou7J0HnYYDniLNtwoN
	QXVsJtPgZaL5YTv0MkPcDGC3892CAOdaNn5zlq7egvHUu9iD6hoBeVbSbBjUGrBeNA9d06EsPZO
	YlmvmDotgx4uPq+tMiGIl/Ls/5euzgekjMksGByUsldBkXU7+C1UHkrBC20r2K8G1YB1AtB/d77
	kbO68+T88SN742HvIJxjAaK24dJTeiD7iZPSLb485PMg/+n8vmb65PiiiQ7g4ojsi5aAXVYDLkX
	Xix2Rz7kB4+M/ZYu7oFEUVq0a8E3fPQD/05zQPrKp/Ehg3fuDValOunTDIKp2oPPfX7Rjytq5rQ
	PGWfp9uiGnR0RKknpsY
X-Received: by 2002:a17:907:6012:b0:c49:b85d:f035 with SMTP id a640c23a62f3a-c49b85df51emr22738966b.32.1793106888182;
        Tue, 27 Oct 2026 06:14:48 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd795bf8sm450327566b.70.2026.10.27.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:14:47 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 27 Oct 2026 14:14:45 +0100
To: sashiko-reviews@lists.linux.dev
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] mm/vmalloc: Bail out if in softirq context
Message-ID: <auCjxUJEOMzmcoga@milan>
References: <20261026102503.30860-1-urezki@gmail.com>
 <sashiko-outbox-186354@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-186354@kernel.org>

On Tue, Oct 27, 2026 at 10:25:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] mm/vmalloc: ABBA deadlock when calling vmalloc() with BH or IRQs disabled
> - [Medium] mm/vmalloc: __get_vm_area_node() irq bailout triggers warnings and retry
> --
> 
> commit 9fea18279139941aa247a1a577dd5e101116871a
> Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> mm/vmalloc: Bail out if in softirq context
> 
> This commit restores a softirq check in __get_vm_area_node() using
> in_serving_softirq() so that vmalloc() bails out when invoked from softirq
> context while still permitting callers with disabled bottom halves. It also
> replaces BUG_ON(in_nmi() || in_hardirq()) with a WARN_ON_ONCE() check that
> returns NULL.
> 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 44e0eb32708f1..5a949525b9db8 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3271,7 +3271,13 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
> >  	struct vm_struct *area;
> >  	unsigned long requested_size = size;
> >  
> > -	BUG_ON(in_nmi() || in_hardirq());
> > +	/* IRQ re-entrancy -> irq_exit() -> process softirq. */
> > +	if (in_serving_softirq())
> > +		return NULL;
> > +
> > +	if (WARN_ON_ONCE(in_nmi() || in_hardirq()))
> > +		return NULL;
> 
> [Severity: High]
> Can allowing vmalloc() in task context with bottom halves or interrupts
> disabled still cause a multi-CPU ABBA deadlock on vmalloc's internal locks?
> 
> In mm/vmalloc.c, alloc_vmap_area() acquires vn->pool_lock,
> free_vmap_area_lock, and vn->busy.lock (and __pte_alloc_kernel() in
> mm/memory.c acquires init_mm.page_table_lock) with plain spin_lock(), leaving
> bottom halves and hardware interrupts enabled:
> 
> mm/vmalloc.c:alloc_vmap_area() {
>     ...
> 	spin_lock(&vn->busy.lock);
> 	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
> 	spin_unlock(&vn->busy.lock);
>     ...
> }
> 
> Because __get_vm_area_node() only checks in_serving_softirq(), in_nmi(), and
> in_hardirq(), a task-context caller holding a lock via spin_lock_bh() (which
> sets SOFTIRQ_DISABLE_OFFSET rather than SOFTIRQ_OFFSET) or
> spin_lock_irqsave() (where irqs_disabled() is true while in_hardirq() is
> false) will proceed into alloc_vmap_area().
> 
> Using the bridge FDB path referenced by commit 04aa71da5f35 ("mm/vmalloc: do
> not trigger BUG() on BH disabled context"):
> 
> net/bridge/br_fdb.c:br_fdb_add_local() {
>     ...
> 	spin_lock_bh(&br->hash_lock);
> 	ret = fdb_add_local(br, source, addr, vid);
> 	spin_unlock_bh(&br->hash_lock);
>     ...
> }
> 
> net/bridge/br_fdb.c:br_fdb_update() {
>     ...
> 	} else {
> 		spin_lock(&br->hash_lock);
> 		fdb = fdb_create(br, source, addr, vid, flags);
>     ...
> }
> 
> If CPU 0 is in task context inside alloc_vmap_area() holding
> spin_lock(&vn->busy.lock) or spin_lock(&free_vmap_area_lock), and CPU 1 is in
> task context inside br_fdb_add_local() holding spin_lock_bh(&br->hash_lock):
> 
> 1. A hardware interrupt arrives on CPU 0, and on irq_exit() NET_RX_SOFTIRQ
>    runs br_fdb_update(), which spins on spin_lock(&br->hash_lock) before ever
>    reaching fdb_create() or __get_vm_area_node().
>
> 2. CPU 1 proceeds through
>    fdb_add_local() -> fdb_create() -> rhashtable_lookup_insert_fast() ->
>    rhashtable_insert_rehash() -> bucket_table_alloc(GFP_ATOMIC | __GFP_NOWARN)
>    -> kvmalloc() -> vmalloc() -> __get_vm_area_node().
> 3. Because in_serving_softirq() is false on CPU 1, it enters
>    alloc_vmap_area() and spins on free_vmap_area_lock or vn->busy.lock held
>    by CPU 0.
> 
My patch fixes self-deadlock on re-entry. 

<snip>
CPU 0:
 task
  vmalloc()
   lock(X)
     IRQ
      irq_exit()
       softirq
        vmalloc()
         lock(X) -> self-deadlock
<snip>

and we used to bail out in this case. So it just restores previous
behaviour which forbids re-entry.

> Similarly, a task-context caller holding a lock with spin_lock_irqsave() can
> enter alloc_vmap_area() with irqs_disabled() and invert lock ordering against
> any hardirq handler acquiring that same lock (and sleep with interrupts
> disabled on CONFIG_PREEMPT_RT).
> 
> Should __get_vm_area_node() also bail out when in_softirq() or
> irqs_disabled() is true?
> 
I think it is another patch:

    if (irqs_disabled() && !early_boot_irqs_disabled)
        return NULL;

> [Severity: Medium]
> When __get_vm_area_node() returns NULL due to in_serving_softirq(), in_nmi(),
> or in_hardirq(), how does __vmalloc_node_range_noprof() handle the NULL
> return?
> 
> Looking at __vmalloc_node_range_noprof() in mm/vmalloc.c:
> 
> mm/vmalloc.c:__vmalloc_node_range_noprof() {
>     ...
> 	area = __get_vm_area_node(real_size, align, shift, VM_ALLOC |
> 				  VM_UNINITIALIZED | vm_flags, start, end, node,
> 				  gfp_mask, caller);
> 	if (!area) {
> 		bool nofail = gfp_mask & __GFP_NOFAIL;
> 		warn_alloc(gfp_mask, NULL,
> 			"vmalloc error: size %lu, align 0x%lx, vm_struct allocation failed%s",
> 			size, align, (nofail) ? ". Retrying." : "");
> 		if (nofail) {
> 			schedule_timeout_uninterruptible(1);
> 			goto again;
> 		}
> 		goto fail;
> 	}
>     ...
> }
> 
> Since commit c6307674ed82 ("mm: kvmalloc: add non-blocking support for
> vmalloc"), __kvmalloc_node_noprof() in mm/slub.c falls back to
> __vmalloc_node_range_noprof() for non-blocking allocations (such as
> GFP_ATOMIC or GFP_NOWAIT) when size > PAGE_SIZE and __do_kmalloc_node()
> fails, while kmalloc_gfp_adjust() only adds __GFP_NOWARN to the kmalloc
> attempt:
> 
> mm/slub.c:__kvmalloc_node_noprof() {
>     ...
> 	return __vmalloc_node_range_noprof(size, align, VMALLOC_START, VMALLOC_END,
> 			flags, PAGE_KERNEL, allow_block ? VM_ALLOW_HUGE_VMAP:0,
> 			node, __builtin_return_address(0));
> }
> 
> Doesn't bailing out in __get_vm_area_node() lead to a few issues in callers:
> 
> 1. In softirq, hardirq, or NMI context, when !area is reached in
>    __vmalloc_node_range_noprof(), it unconditionally calls warn_alloc()
>    whenever __GFP_NOWARN was not passed by the caller (and if shift >
>    PAGE_SHIFT, goto fail resets shift = PAGE_SHIFT and jumps to goto again,
>    repeating the call and warning a second time).
>
Calling vmalloc() from nmi, irq-context or on re-entry is a wrong behaviour.

> 2. If a caller in hardirq or NMI context invokes
>    kvmalloc(size, GFP_ATOMIC | __GFP_NOWARN) (for example,
>    rhashtable_insert_rehash() -> bucket_table_alloc() in lib/rhashtable.c,
>    reachable from irq-safe rhashtable users and BPF_MAP_TYPE_RHASHTABLE
>    updates in rhtab_map_update_elem() in kernel/bpf/hashtab.c) and the
>    kmalloc attempt fails for size > PAGE_SIZE, __kvmalloc_node_noprof() falls
>    back to __vmalloc_node_range_noprof() -> __get_vm_area_node() and triggers
>    WARN_ON_ONCE(in_nmi() || in_hardirq()) even though the caller passed
>    GFP_ATOMIC | __GFP_NOWARN and handles NULL.
>
Caller is not allowed to invoke vmalloc() from NMI or hard-irq context.

> 3. In __vmalloc_node_range_noprof(), nofail is not cleared when
>    !gfpflags_allow_blocking(gfp_mask) (unlike in __vmalloc_area_node()), so
>    if __GFP_NOFAIL is set when __get_vm_area_node() returns NULL in
>    interrupt context, it will call schedule_timeout_uninterruptible(1) in
>    atomic context and loop indefinitely at goto again.
> 
__GFP_NOFAIL and NOWAIT or ATOMIC can not coexist together:

 * %__GFP_NOFAIL: The VM implementation _must_ retry infinitely: the caller
 * cannot handle allocation failures. The allocation could block
 * indefinitely but will never return with failure. Testing for
 * failure is pointless.
 * It _must_ be blockable and used together with __GFP_DIRECT_RECLAIM.

--
Uladzislau Rezki
