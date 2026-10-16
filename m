Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F84833A9F8
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159792; cv=none; b=TSvx+rk+NNqqThJBdDuhc9FOR2tP15x1gFnttOdP6Chq/SlhyzcdvXVrcAdEVF4BlIrlBkytVO6YvZPgipEURhwEWQNxbYs2tq+E2oLaeuQm1j2g+mp0fC061jibHDCNUtIc9OEkACnoSCX4ievq3oxDpsiKNLcGevSunM3ceKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159792; c=relaxed/simple;
	bh=kP4nEbDknMU+UqBAZRRpIVKCv0DcNf8eTDxCGkwDKfc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUlfRme081GYSIWvWOc2G3KCCTk9OrgzHm0JOkqRbUkxbRpi4Zg3XR2Y0gvOXJAU553hsiV3Bh9b4Rc6d6h1TnScca8uptgwySFi57MtUdYzngjzW9RSVw9aXbPxYVDWwrO8+abMVI5GVD9ETmfysFLzw/H8WJ/E4SsATDoy5UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcE/XEBF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcE/XEBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792159788; x=1823695788;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=kP4nEbDknMU+UqBAZRRpIVKCv0DcNf8eTDxCGkwDKfc=;
  b=fcE/XEBFEuxNM0qmmkBJc/b8n0y+VTNtE/ZmSSehn2ckjL0j/6K6PKBh
   Swr0DsPyA0134opj1sKp/YxIhwbi/R8G1LnVwuetB1Pp9V2DgxngDYWbY
   1Uw+RNLYhYPRjMdC9hY1WY5Q/CMAjzY4mjOuVS2kKdA5/6SYb4XxGwk+S
   LGq9vmDQ4Tm/bDYzBaEok8qf5JeHzSPbQc+WC+ztPxVHz5gbIqrVnlPGB
   LfvxDBpFjq90vhK4iMFMdFVmLzEdEQ2NleSp1oSxIULr5hnCDNzW9XPb/
   ziuEYZ771vnK4XEbBdH+c9zTBeax5mQ8S5QtPPXE6UHTkrt0gBVCFzhgs
   Q==;
X-CSE-ConnectionGUID: x5B9HxOERdeuNcaAOPalkw==
X-CSE-MsgGUID: X4MfyLXvTCaeEWYvVvBh9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="829289"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="829289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:09:47 -0700
X-CSE-ConnectionGUID: W0aH3Z2dTiuYftWGSxAfBw==
X-CSE-MsgGUID: Z5GGI263S2C1k6hjq9a/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1951875"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.54]) ([10.245.245.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:09:46 -0700
Message-ID: <4d1338d127bb9b77c8bc9a114c7c8740d2ec2780.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 16:09:44 +0200
In-Reply-To: <sashiko-outbox-174414@kernel.org>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
	 <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
	 <sashiko-outbox-174414@kernel.org>
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

On Fri, 2026-10-16 at 13:53 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [High] drm/xe: Use-After-Free of shrinker during DRM device
> teardown
> - [High] drm/xe: O(N^2) CPU lockup in purgeable shrinker due to
> uncounted LRU skips
> --
>=20
> commit 1e9348c2fe4768de2cf24e4dd9b6188400c84043
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> drm/xe: Split the bo shrinker into purgeable and non-purgeable
> shrinkers
>=20
> This commit splits the single xe_shrinker into two independent
> shrinker
> instances: one for purgeable objects and another for non-purgeable
> (shrinkable) objects. This allows the shrinker core to apply
> different
> reclaim pressures based on the varying costs of reclaiming these
> object
> types.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 378022c37a57c..8e3fe675e0f34 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
>=20
> [ ... ]
>=20
> > @@ -216,63 +238,52 @@ static bool xe_shrinker_runtime_pm_get(struct
> > xe_shrinker *shrinker, bool force,
>=20
> [ ... ]
>=20
> > -static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > struct shrink_control *sc)
> > +static unsigned long xe_shrinker_scan_purgeable(struct shrinker
> > *shrink,
> > +						struct
> > shrink_control *sc)
> > =C2=A0{
> > =C2=A0	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > =C2=A0		.interruptible =3D false,
> > =C2=A0		.no_wait_gpu =3D ttm_bo_shrink_avoid_wait(),
> > =C2=A0	};
> > -	unsigned long nr_to_scan, nr_scanned =3D 0, freed =3D 0;
> > +	unsigned long nr_to_scan =3D sc->nr_to_scan, nr_scanned =3D 0,
> > freed =3D 0;
> > =C2=A0	struct xe_bo_shrink_flags shrink_flags =3D {
> > =C2=A0		.purge =3D true,
> > -		/* Don't request writeback without __GFP_IO. */
> > -		.writeback =3D !ctx.no_wait_gpu && (sc->gfp_mask &
> > __GFP_IO),
> > =C2=A0	};
> > -	bool runtime_pm;
> > -	bool purgeable;
> > -	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> > -
> > -	nr_to_scan =3D sc->nr_to_scan;
> > -
> > -	read_lock(&shrinker->lock);
> > -	purgeable =3D !!shrinker->purgeable_pages;
> > -	read_unlock(&shrinker->lock);
> > =C2=A0
> > -	/* Might need runtime PM. Try to wake early if it looks
> > like it. */
> > -	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> > nr_to_scan, can_backup);
> > -
> > -	if (purgeable && nr_scanned < nr_to_scan)
> > -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > -				 nr_to_scan, &nr_scanned, &freed);
> > +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan,
> > &nr_scanned, &freed);
> > =C2=A0
> > =C2=A0	sc->nr_scanned =3D nr_scanned;
>=20
> [Severity: High]
> Can this cause an O(N^2) CPU lockup in the purgeable shrinker?
>=20
> When the memory reclaim core (do_shrink_slab) calls this purgeable
> scan
> routine under memory pressure, xe_shrinker_walk() iterates the LRU
> list.
>=20
> However, non-purgeable BOs return -EBUSY and are skipped without
> advancing
> the scanned counter:
>=20
> drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) =
||
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (flags.purge && !xe_tt->purgea=
ble))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBUSY;
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> drivers/gpu/drm/xe/xe_shrinker.c:__xe_shrinker_walk() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lret =
=3D xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Lik=
e the TTM LRU walk, skip bos we can't shrink now.
> */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lr=
et =3D=3D -EBUSY)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 continue;
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Since the LRU cursor is initialized locally on each call and non-
> purgeable
> BOs do not increment nr_scanned, every batch rescans all leading
> non-purgeable BOs without significantly advancing sc->nr_scanned.
>=20
> Will this force the shrinker core to repeatedly call this function,
> processing the same leading non-purgeable BOs over and over again?

This can't happen in practice since purgeable bos are always ordered
before non-purgeable bos on the list.

/Thomas



>=20
> > -	if (nr_scanned >=3D nr_to_scan || !can_backup)
> > -		goto out;
> > =C2=A0
> > -	/* If we didn't wake before, try to do it now if needed.
> > */
> > -	if (!runtime_pm)
> > -		runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker,
> > true, 0, can_backup);
> > +	return nr_scanned ? freed : SHRINK_STOP;
> > +}
>=20
> [ ... ]
>=20
> > @@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct drm_device
> > *drm, void *arg)
> > =C2=A0	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > =C2=A0	xe_assert(shrinker->xe, !shrinker->populated_tts);
> > =C2=A0	shrinker_free(shrinker->shrink);
> > +	shrinker_free(shrinker->purge_shrink);
> > =C2=A0	flush_work(&shrinker->pm_worker);
> > =C2=A0	kfree(shrinker);
> > =C2=A0}
>=20
> [Severity: High]
> Does this kfree(shrinker) leave xe->mem.shrinker as a dangling
> pointer?
>=20
> Because drmm actions execute in LIFO order upon device release,
> xe_shrinker_fini() is called before xe_device_destroy().=20
>=20
> Later, xe_device_destroy() runs and calls xe_bo_dev_fini() which
> flushes
> the async_free workqueue. Pending BOs in the workqueue will have
> their
> final references dropped, leading to xe_ttm_tt_account_subtract():
>=20
> drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_account_subtract() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 if (xe_tt->purgeable)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe->mem.=
shrinker, 0, -(long)tt-
> >num_pages, -1);
> =C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe->mem.=
shrinker, -(long)tt->num_pages,
> 0, -1);
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Can this lead to a use-after-free and memory corruption when driver
> unloads?
