Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F2936655C
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035215; cv=none; b=am+go7F+WSASk+mZTYeBPf/kZOGnHz4HK87aojl9WN//nrh5XSvt+ic38rT+fLCKuxDOs8ti025bcfDrszu6fyU3fTeHN3cauMd9NS6RMFnValdW7B/XSJ6YIHTDTV3ZdrJOR34cTHFGotsM3a4Wd1bcKzLB+66Cx6GB649rDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035215; c=relaxed/simple;
	bh=7J2JsxjW3dp9a48G8H+JN+j3liveOw2OiiHmm6UsEbM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s7TzEOi+xmLhQzJT3LQsJuhJCbnn1UvmcKtaht1LbM2uQuufzz3ECoaC0dga2FlKqDeYBWm79vxT0wWHrttMwuCswG94CmivIB3oZ8e78VSFSZQR7mMMRC88yby3ZDGZ+PCRuBPHbMZQSuh4H/3kI2Ye3J31gczPDcp4LzLLyWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GrsvC6qa; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GrsvC6qa"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e375d9736so3060945b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786035213; x=1786640013; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQkaR5T3XMxTkMklMFbBXjfjIN88G0mM7jceHfW4dtI=;
        b=GrsvC6qaUP2xPbYFpANRIReP54ibWEafvqM5z9ran1nrto2ptcm19wPDal2s9zGl/X
         +PNgI0MiSzDhLDR1yyBI9f85WG5Ew+8n1XjGhInQFUVYszIBf4qh8QrZBcmbSrHqS/i1
         Ilp4OYq9rvdDPviSHo3XtCpxsppDqLQVTVR6Gz+0SZf12QzWos9Gec/jlZiAJfGUVO5T
         O9sMI6rSWNaFhtSd/T+bSU8Tlkqt0qbiQ5BczuDlkGv7oxNzo1IQ6/XIl1BEkJDHSOqz
         yr3Bqkq1ewcEooP1nqPh3NcCWmPsB0lijGbUDXMeheEWJ3lYVQKfXQ4ZN6PiVObxzPIU
         +5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035213; x=1786640013;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQkaR5T3XMxTkMklMFbBXjfjIN88G0mM7jceHfW4dtI=;
        b=jLVfbOPmQb0+p5lGOoWppdJHafJTmtAdU0GMU7vqsX9f8VGF+w3C/qgcL1ha9UFLli
         nBdthTqzohQ83jwsRff37akIMb7OGbgt7FyND7b6qh3o9x8Pddb0U//UJwWd6CV6gzhX
         bWBJh1Yn70NQOnE282qusG2lDd2cZ2Gz7I3Hw5Xuzl8PcUlG//kLH5CY55EObSzeZLwe
         LalCiFkn2iSsEAaTxiZ9Xlrd4bDIdqAjAsp6aTyKLgj8ab4xeiMsWh0C+9+nWFPaqETM
         FwUyL0xr523VPsnLS+J+ey7d4NyVg+kenMJ2PKm0uuzRh3DjIGuBsJQlGwiLmsMoyxTu
         M3aA==
X-Gm-Message-State: AOJu0Yw+0fE/VPUkiEjIG5nAEIkN0SHdAqLea9QeSkum0pTFKlwuO0Hm
	Awv/RSGb/F3a2b8eS3D6oR3/XnDg7gAJHtqOfMMMnAJIyKjufCsjx3yts6q13ylF799RaYyLczR
	8LYNvzJ07SRZ0xbTjo+ETlIglTfsnUj/vwA6W/8JbXA4OqdbzIViVkBapxk+s8vaLiFEn50x+gw
	MvkfZv/Qe4mZs4jUbF08gCKgbNDp3W40FxNLmc8bLbtIm2SsKt
X-Received: from pfbkq9.prod.google.com ([2002:a05:6a00:4b09:b0:848:3e69:4b98])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1388:b0:847:82dc:452d
 with SMTP id d2e1a72fcca58-84f2e017ab9mr16430654b3a.29.1786035212564; Thu, 06
 Aug 2026 09:53:32 -0700 (PDT)
Date: Thu, 6 Aug 2026 09:53:31 -0700
In-Reply-To: <20260805203608.D3CA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260805195528.3853473-1-dwmw@amazon.co.uk> <20260805195528.3853473-4-dwmw@amazon.co.uk>
 <20260805203608.D3CA61F000E9@smtp.kernel.org>
Message-ID: <anS8C4Cxqy6ehCo3@google.com>
Subject: Re: [PATCH v3 3/7] KVM: pfncache: Use RCU for readers instead of a rwlock
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Woodhouse, David" <dwmw@amazon.co.uk>, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026, sashiko-bot@kernel.org wrote:
> Replace the per-cache rwlock with RCU for the read side.

I don't hate the idea, but I am very against using RCU.  Unless it's "impos=
sible",
e.g. because synchronize_srcu() allocates memory and breaks OOM kill, I wou=
ld
strongly prefer to use SRCU, probably with a dedicated kvm->gpc_srcu, so th=
at
synchronization doesn't need to wait on all CPUs in the system.  The tail l=
atencies
for synchronize_rcu() are horrendous, especially for many-CPU systems.  If =
it
were only mmu_notifiers that got hit, it miiiight be acceptable, but since =
this
will affect vCPU tasks in the refresh() path as well, normal RCU is pretty =
much
a non-starter.

Even SRCU could be problematic: if synchronize_srcu_expedited() is forced t=
o wait,
the wait time can easily get to 20+ milliseconds, which again is a non-star=
ter for
things like steal-time updates and nVMX pages.  Simply using a per-GPC SRCU=
 would
be gross, as gfn_to_pfn_cache_invalidate_start() would become absurdly comp=
lex in
order to juggle gpc_lock with synchronize_srcu_expedited().

A somewhat crazy idea would be to have a per-VM gpc_srcu, *and* a per-GPC s=
rcu.
Readers would take both, refresh() would sync gpc->srcu, and invalidation w=
ould
sync kvm->gpc_srcu.  That way, refresh() wouldn't need to wait on concurren=
t
readers of *other* GPCs.

Actually, a better idea: use kvm->gpc_srcu to synchronize invalidations and
refresh() for GPCs that aren't tightly coupled to a vCPU, but for GPCs that=
 are
*only* accessed by a single loaded vCPU, protect readers and refresh() with
vcpu->mutex.  That way, single-vCPU GPCs wouldn't need to synchronize() on =
refresh(),
because by definition there can't be concurrent readers with refresh().

That would basically punt on optimizing most of the Xen GPCs, but that's pr=
obably
ok?  Because the hot path GPCs, e.g. runstate_cache{,2}, are generally asso=
ciated
1:1 with a vCPU, i.e. can avoid synchronizing on SRCU.  The one GPC that I =
see
as being problematic is vcpu_info_cache, because it's accesses cross-vCPU a=
nd so
the owning vCPU would need to synchronize() on refresh().  But if you're ok=
 with
potentially high tail latencies if the vcpu_info_cache page is migrated or
reclaimed, then I doubt anyone else will complain.

> > --- a/virt/kvm/pfncache.c
> > +++ b/virt/kvm/pfncache.c
> > @@ -26,35 +26,49 @@ void gfn_to_pfn_cache_invalidate_start(struct kvm *=
kvm, unsigned long start,
> >  				       unsigned long end)
> >  {
> >  	struct gfn_to_pfn_cache *gpc;
> > +	bool cleared =3D false;
> > =20
> >  	spin_lock(&kvm->gpc_lock);
> >  	list_for_each_entry(gpc, &kvm->gpc_list, list) {
> > -		read_lock_irq(&gpc->lock);
> > -
> > -		/* Only a single page so no need to care about length */
> > -		if (gpc->valid && !is_error_noslot_pfn(gpc->pfn) &&
> > +		if (smp_load_acquire(&gpc->valid) &&
> >  		    gpc->uhva >=3D start && gpc->uhva < end) {
> > -			read_unlock_irq(&gpc->lock);
> > -
> > -			/*
> > -			 * There is a small window here where the cache could
> > -			 * be modified, and invalidation would no longer be
> > -			 * necessary. Hence check again whether invalidation
> > -			 * is still necessary once the write lock has been
> > -			 * acquired.
> > -			 */
> > -
> > -			write_lock_irq(&gpc->lock);
> > -			if (gpc->valid && !is_error_noslot_pfn(gpc->pfn) &&
> > -			    gpc->uhva >=3D start && gpc->uhva < end)
> > -				gpc->valid =3D false;
> > -			write_unlock_irq(&gpc->lock);
> > -			continue;
> > +			WRITE_ONCE(gpc->valid, false);
> > +			cleared =3D true;
> >  		}
> > -
> > -		read_unlock_irq(&gpc->lock);
> >  	}
> >  	spin_unlock(&kvm->gpc_lock);
> > +
> > +	/*
> > +	 * Readers may still be using the old mapping, having sampled
> > +	 * gpc->valid before it was cleared. Wait for them all to drain
> > +	 * before the caller proceeds to zap the page tables; like a TLB
> > +	 * shootdown, this guarantees no access via the stale mapping
> > +	 * once the invalidation completes.
> > +	 *
> > +	 * This wait is safe even on unblockable ranges (the OOM reaper):
> > +	 * the constraint there is not "no sleeping" but "no blocking on
> > +	 * anything which may itself depend on memory allocation to make
> > +	 * progress" (see the reasoning in commit 312364f3534c and its
> > +	 * discussion). An RCU grace period has no such dependency: GPC
> > +	 * readers never allocate, never take mmap_lock, and never sleep.
> > +	 */
> > +	if (cleared)
> > +		synchronize_rcu();
> >  }
>=20
> [Severity: Critical]
> Could this conditional wait bypass the grace period and lead to a regress=
ion
> with physical pages being freed too early?
>=20
> If a concurrent mutator like __kvm_gpc_refresh transitions gpc->valid to
> false and is currently blocking on its own synchronize_rcu wait, the MMU
> notifier will see valid as false, skip the wait since cleared is false, a=
nd
> return immediately.
>=20
> This would allow the host memory subsystem to free the page while the
> original mutator is still waiting for active RCU readers to finish.

Ya, pretty sure, Sashiko is correct.  The mmu_notifier rules require that a=
ll
mappings are removed before .invalidate_range_start() completes.  Seems lik=
e the
easiest solution is to key off of gpc->active, not gpc->valid.

> [ ... ]
> > @@ -74,6 +88,22 @@ bool kvm_gpc_check(struct gfn_to_pfn_cache *gpc, uns=
igned long len)
> >  {
> >  	struct kvm_memslots *slots =3D kvm_memslots(gpc->kvm);
> > =20
> > +	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> > +			 "kvm_gpc_check() without RCU read lock");
> > +
> > +	/*
> > +	 * Check valid *first*. The acquire pairs with the release-publish
> > +	 * in hva_to_pfn_retry(), so every field read below =E2=80=94 and any=
 use
> > +	 * of gpc->khva by the caller =E2=80=94 is guaranteed to be from the
> > +	 * published generation, not a stale value reordered from before
> > +	 * the publish. The fields are then stable for the remainder of
> > +	 * the RCU read-side critical section, because every mutator
> > +	 * clears valid and waits a full grace period before changing
> > +	 * anything.
> > +	 */
> > +	if (!smp_load_acquire(&gpc->valid))
> > +		return false;
> > +
> >  	if (!gpc->active)
> >  		return false;
>=20
> [Severity: Medium]
> Should the read of gpc->generation use READ_ONCE?

+1, the {WRITE,READ}_ONCE() usage looks to be very inconsistent.
