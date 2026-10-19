Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448A404BDD
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396802; cv=none; b=c4yVghj82VzTma339ue/N4aF79tC7+8nDSouaP0jvb57z43fu/Gdnlsqre4H8n2kxtoaeV89f4qNmZmjgrZ0DZEFJ1B26IGrb52xsg+DlYgUqt81WHo41DW14KV1I8/nmxK2/NJj9/qqXzmmlNRwd4GWtD5NlND4qPXWadg2I4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396802; c=relaxed/simple;
	bh=Rc824/XiH1K0fuI51TaTljkwtCzwTmuXLT67JRhcKk8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L6GrPcd8stiF0mx9/hruMQdplQlYm/L4QcpCXCoO2Y6/+QavRxfytf7o2vi2hUnQUkKYK0Om415VbycTe2NmNlTCefhjzlCzE740M5FU1WdRXAzPS52F2WIMz3si3wpMP9OHPvvDcNrAE5rZB4QEzbA/rf9g9JvfZWhoK+LRnok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3UTis0J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3UTis0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792396800; x=1823932800;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Rc824/XiH1K0fuI51TaTljkwtCzwTmuXLT67JRhcKk8=;
  b=j3UTis0JJBQT01Rt9sl2omE9IxPa7QLF/hWsgtMtlLhSUNhbUkFM8+SR
   esSBsWrloITcgF4865AF9K1gFdOFxonnR4mMiR6t3wPAJMXEc/FQX0Rwm
   2s6BirKJLKcdQXZK83QZALKTPDeGHBsg0ouV1/1i8mPYRVkM9gL4Xui1O
   Xiihc5lPd62eM52FP1f8B7aaiDDUsB3TUVc5X9bdi4SOZ+fPkwZRQK7XA
   GLU9tn0Hb87VGl6TMWl7UA6rM78dXzFIFhuIYy/2dnDUla7tefvNYGN1I
   vyRXFMHu2E4lvqeE2C7UuHHl7xb8Tx2khJ9j7yvWeaH6yfTp7FguAWcb9
   w==;
X-CSE-ConnectionGUID: DDcN7GEGS1i5QwCnpV3r1A==
X-CSE-MsgGUID: ZJfx9XAoTZq2eEhMBTzYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1096593"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1096593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:00:00 -0700
X-CSE-ConnectionGUID: b8qJ+y/MTP2XaP2kGcL4Yg==
X-CSE-MsgGUID: ZS1gBXhbThyK7fU99zxS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2419571"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.222]) ([10.245.245.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:59:58 -0700
Message-ID: <6cbfc2349f0a8d14b7a170ff791d18dfcb44d158.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Date: Mon, 19 Oct 2026 09:59:55 +0200
In-Reply-To: <atJvxCnNISBr2VLK@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
	 <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
	 <sashiko-outbox-174414@kernel.org>
	 <4d1338d127bb9b77c8bc9a114c7c8740d2ec2780.camel@linux.intel.com>
	 <atJvxCnNISBr2VLK@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-10-16 at 11:41 -0700, Matthew Brost wrote:
> On Fri, Oct 16, 2026 at 04:09:44PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2026-10-16 at 13:53 +0000, sashiko-bot@kernel.org=C2=A0wrote:
> > > Thank you for your contribution! Sashiko AI review found 2
> > > potential
> > > issue(s) to consider:
> > > - [High] drm/xe: Use-After-Free of shrinker during DRM device
> > > teardown
> > > - [High] drm/xe: O(N^2) CPU lockup in purgeable shrinker due to
> > > uncounted LRU skips
> > > --
> > >=20
> > > commit 1e9348c2fe4768de2cf24e4dd9b6188400c84043
> > > Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > >=20
> > > drm/xe: Split the bo shrinker into purgeable and non-purgeable
> > > shrinkers
> > >=20
> > > This commit splits the single xe_shrinker into two independent
> > > shrinker
> > > instances: one for purgeable objects and another for non-
> > > purgeable
> > > (shrinkable) objects. This allows the shrinker core to apply
> > > different
> > > reclaim pressures based on the varying costs of reclaiming these
> > > object
> > > types.
> > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > > index 378022c37a57c..8e3fe675e0f34 100644
> > > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > >=20
> > > [ ... ]
> > >=20
> > > > @@ -216,63 +238,52 @@ static bool
> > > > xe_shrinker_runtime_pm_get(struct
> > > > xe_shrinker *shrinker, bool force,
> > >=20
> > > [ ... ]
> > >=20
> > > > -static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > > > struct shrink_control *sc)
> > > > +static unsigned long xe_shrinker_scan_purgeable(struct
> > > > shrinker
> > > > *shrink,
> > > > +						struct
> > > > shrink_control *sc)
> > > > =C2=A0{
> > > > =C2=A0	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > > > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > > > =C2=A0		.interruptible =3D false,
> > > > =C2=A0		.no_wait_gpu =3D ttm_bo_shrink_avoid_wait(),
> > > > =C2=A0	};
> > > > -	unsigned long nr_to_scan, nr_scanned =3D 0, freed =3D 0;
> > > > +	unsigned long nr_to_scan =3D sc->nr_to_scan, nr_scanned
> > > > =3D 0,
> > > > freed =3D 0;
> > > > =C2=A0	struct xe_bo_shrink_flags shrink_flags =3D {
> > > > =C2=A0		.purge =3D true,
> > > > -		/* Don't request writeback without __GFP_IO.
> > > > */
> > > > -		.writeback =3D !ctx.no_wait_gpu && (sc->gfp_mask
> > > > &
> > > > __GFP_IO),
> > > > =C2=A0	};
> > > > -	bool runtime_pm;
> > > > -	bool purgeable;
> > > > -	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> > > > -
> > > > -	nr_to_scan =3D sc->nr_to_scan;
> > > > -
> > > > -	read_lock(&shrinker->lock);
> > > > -	purgeable =3D !!shrinker->purgeable_pages;
> > > > -	read_unlock(&shrinker->lock);
> > > > =C2=A0
> > > > -	/* Might need runtime PM. Try to wake early if it
> > > > looks
> > > > like it. */
> > > > -	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker,
> > > > false,
> > > > nr_to_scan, can_backup);
> > > > -
> > > > -	if (purgeable && nr_scanned < nr_to_scan)
> > > > -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > > > -				 nr_to_scan, &nr_scanned,
> > > > &freed);
> > > > +	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > > > nr_to_scan,
> > > > &nr_scanned, &freed);
> > > > =C2=A0
> > > > =C2=A0	sc->nr_scanned =3D nr_scanned;
> > >=20
> > > [Severity: High]
> > > Can this cause an O(N^2) CPU lockup in the purgeable shrinker?
> > >=20
> > > When the memory reclaim core (do_shrink_slab) calls this
> > > purgeable
> > > scan
> > > routine under memory pressure, xe_shrinker_walk() iterates the
> > > LRU
> > > list.
> > >=20
> > > However, non-purgeable BOs return -EBUSY and are skipped without
> > > advancing
> > > the scanned counter:
> > >=20
> > > drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
> > > =C2=A0=C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0 if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPAB=
LE) ||
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (flags.purge && !xe_tt->pu=
rgeable))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBUSY;
> > > =C2=A0=C2=A0=C2=A0 ...
> > > }
> > >=20
> > > drivers/gpu/drm/xe/xe_shrinker.c:__xe_shrinker_walk() {
> > > =C2=A0=C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lr=
et =3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Like the TTM LRU walk, skip bos we can't shrink
> > > now.
> > > */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (lret =3D=3D -EBUSY)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue;
> > > =C2=A0=C2=A0=C2=A0 ...
> > > }
> > >=20
> > > Since the LRU cursor is initialized locally on each call and non-
> > > purgeable
> > > BOs do not increment nr_scanned, every batch rescans all leading
> > > non-purgeable BOs without significantly advancing sc->nr_scanned.
> > >=20
> > > Will this force the shrinker core to repeatedly call this
> > > function,
> > > processing the same leading non-purgeable BOs over and over
> > > again?
> >=20
> > This can't happen in practice since purgeable bos are always
> > ordered
> > before non-purgeable bos on the list.
> >=20
>=20
> Is this true, though? If a BO is marked as purged on a hot VM and
> shares
> the VM's bulk-move structure, it would remain hot in the list. Also,
> within an individual bulk-move list, I don't think a purgable object
> is
> guaranteed to be at the front of the LRU.
>=20
> So, at a minimum, BOs marked as purged should be moved to a lower
> priority band, as this patch does [1], and reclaim should only walk
> the
> purged-priority band [2].

TBH, I thought we already had [1]. But even [2] sounds like a good
optimization, although the link seems incorrect.

>=20
> We can do this in an immediate follow-up after this series merges.

OK let's do that.
Thanks,

Thomas


>=20
> Matt
>=20
> [1]
> https://patchwork.freedesktop.org/patch/743454/?series=3D170454&rev=3D5
> [2]
> https://patchwork.freedesktop.org/patch/743454/?series=3D170454&rev=3D5
>=20
> > /Thomas
> >=20
> >=20
> >=20
> > >=20
> > > > -	if (nr_scanned >=3D nr_to_scan || !can_backup)
> > > > -		goto out;
> > > > =C2=A0
> > > > -	/* If we didn't wake before, try to do it now if
> > > > needed.
> > > > */
> > > > -	if (!runtime_pm)
> > > > -		runtime_pm =3D
> > > > xe_shrinker_runtime_pm_get(shrinker,
> > > > true, 0, can_backup);
> > > > +	return nr_scanned ? freed : SHRINK_STOP;
> > > > +}
> > >=20
> > > [ ... ]
> > >=20
> > > > @@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct
> > > > drm_device
> > > > *drm, void *arg)
> > > > =C2=A0	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > > > =C2=A0	xe_assert(shrinker->xe, !shrinker->populated_tts);
> > > > =C2=A0	shrinker_free(shrinker->shrink);
> > > > +	shrinker_free(shrinker->purge_shrink);
> > > > =C2=A0	flush_work(&shrinker->pm_worker);
> > > > =C2=A0	kfree(shrinker);
> > > > =C2=A0}
> > >=20
> > > [Severity: High]
> > > Does this kfree(shrinker) leave xe->mem.shrinker as a dangling
> > > pointer?
> > >=20
> > > Because drmm actions execute in LIFO order upon device release,
> > > xe_shrinker_fini() is called before xe_device_destroy().=20
> > >=20
> > > Later, xe_device_destroy() runs and calls xe_bo_dev_fini() which
> > > flushes
> > > the async_free workqueue. Pending BOs in the workqueue will have
> > > their
> > > final references dropped, leading to
> > > xe_ttm_tt_account_subtract():
> > >=20
> > > drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_account_subtract() {
> > > =C2=A0=C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=C2=A0 if (xe_tt->purgeable)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe->=
mem.shrinker, 0, -(long)tt-
> > > > num_pages, -1);
> > > =C2=A0=C2=A0=C2=A0 else
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe->=
mem.shrinker, -(long)tt-
> > > >num_pages,
> > > 0, -1);
> > > =C2=A0=C2=A0=C2=A0 ...
> > > }
> > >=20
> > > Can this lead to a use-after-free and memory corruption when
> > > driver
> > > unloads?
