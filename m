Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803899;
	b=vIzoTrfsGujCxRmQeiRDRB+3evJ+5afb6C5AywVMryOqEIgcX0uIRdHz1T6N3RdYIY4X
	 s82ilOnUCKaXM8Wrq7ofamQXdZvkNdakeMSQNfUlKgh9Hjg0qy9OHtLrbBD7QAmZnUpVC
	 uyE8wLLF36ep9TJkb+T+z4AChNcxneyFTrIeEZshmyfqYlDr3bXybhXyjEG6aWIbQbvWF
	 DAvbmPp7tFwRTvJDqNIQxQFWQ3tp9pOmm3/PfLjGRSesWdmCwsf4NWdrsBnMv16KJ5nBX
	 llLVuT1bbKtsR0RxyNfpy9zPY3thyu7DvY5M9sTpa7GEFKVnlnpE4Ps/FcUxehCNpBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803899;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AuWOtUqZxN8pN8HiZpUMngYS/Q7dWGzMqTLYWjfyVEs=;
	b=aKpMtYWXsau5n/rc4O5GE4ym2mgIpKHDhmZ0B3TvbDalzgEVm/L3gzkPcami09OQlzIr
	 fJsdc4D/xNTgs0btj7seP/EbeSksi9qWaRP1MTDBWDgHvlR8FI02fDkqsmSpgLUVO/Hkx
	 IdzBpQ4hDzEIqTXs1rArREcIX/3wyvp+VNKVgAeuE4GTvI1Osn/n7zUsmp1N+mNdbMOjP
	 OkvHxEXjN6e7vtdWlW+HjDsYeJPN0NtRFUB0DcEjYzecVcQH+N3mIoHGmjGjcqOOeoOZ1
	 s2TchhqZEkiudWleLhSHOqG5vTXUq1YR1J8rmcXSJ9nHBAylopCpM0RuWxKDdUbUkCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cDt0ElDV;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4D606A336
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 14:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F4D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cDt0ElDV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793803899; x=1825339899;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=WoFrz9b6bOm8xYddMlfQ2q/fa6xNBDELnZa2yUJJsAo=;
  b=cDt0ElDVUdG3pdr7nm4huqQv4JxD5RQ1KXhFE8GSDOtpgBR44fcODbaU
   +OTlFYpUY5RXDWheeZfISVSgPCSyFhos+0JWOq1UeFQ4h/MoE5loF6fGG
   rBuslemGkfYzd7m9k1W4eklkH2L6fcNScOYL4BEC1T7MUuBPjFn3coZ8h
   eiLHgoH4fR2G4lg4VdJMbv2H6znhMyw+lUmerKIG8+oi+so4ZP4mHyMEG
   etJEyRbqw0IXl9eKHqJCW5NjkUAeALIIK4rlf15j4nKQjLKJrZrL5SXkG
   Z3epNJ/q3M9Sz5Wgqwl9tsU/m08O4Nna+qyMYI9Uj5RXuQcko2ZbtBXQF
   w==;
X-CSE-ConnectionGUID: 047QVOAyQC6PAFBDVwCnFg==
X-CSE-MsgGUID: YiYpAHJ6TOid+889qWL+hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2596927"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2596927"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 06:51:39 -0800
X-CSE-ConnectionGUID: /NISU2YRTReAL8vRGsPceA==
X-CSE-MsgGUID: kWKWem0xQm6bYeRtmiOOIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7285421"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.20]) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 06:51:37 -0800
Message-ID: <56c5da198a29ba84f71a727c3b2c88b0adccdcdf.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Add a per-client debugfs file reporting bo
 NUMA node distribution
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Date: Wed, 04 Nov 2026 15:51:35 +0100
In-Reply-To: <sashiko-outbox-197338@kernel.org>
References: <20261104130836.134790-1-thomas.hellstrom@linux.intel.com>
	 <sashiko-outbox-197338@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-04 at 13:24 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [Medium] drm/xe: shrinker-purged BOs misreported as swapped in
> xe_bo_print_numa_info()
> - [Medium] drm/xe: DEFER_BACKING VRAM BOs misreported in
> xe_bo_print_numa_info_locked()
> --
>=20
> commit 66cc9eac8b32df8912217731dcdb5be7a56a8d77
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> drm/xe: Add a per-client debugfs file reporting bo NUMA node
> distribution
>=20
> This commit adds a per-client "bo_numa" debugfs file that implements
> a
> write-request / read-response protocol to report the size, placement,
> and
> per-NUMA-node page counts of a GEM buffer object specified by handle.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 42a6aa1a2e4a0..bf3f6d9e4c61c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
>=20
> [ ... ]
>=20
> > @@ -4248,6 +4250,113 @@ void
> > xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
> > =C2=A0	list_del_init(&bo->vram_userfault_link);
> > =C2=A0}
> > =C2=A0
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> > +static void xe_bo_count_numa_pages(struct ttm_tt *tt, unsigned
> > long *nodes)
> > +{
> > +	pgoff_t i;
> > +
> > +	for (i =3D 0; i < tt->num_pages; ++i)
> > +		nodes[page_to_nid(tt->pages[i])]++;
> > +}
> > +
> > +static void xe_bo_print_numa_info_locked(struct xe_bo *bo,
> > unsigned long *nodes,
> > +					 struct drm_printer *p)
> > +{
> > +	struct ttm_resource *res =3D bo->ttm.resource;
> > +	struct ttm_tt *tt =3D bo->ttm.ttm;
> > +	unsigned long total =3D 0;
> > +	const char *name;
> > +	int nid;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	name =3D res ? xe_mem_type_to_name[res->mem_type] : NULL;
> > +	drm_printf(p, "size: %zu\n", xe_bo_size(bo));
> > +	if (name)
> > +		drm_printf(p, "placement: %s\n", name);
> > +	else if (res)
> > +		drm_printf(p, "placement: mem_type %u\n", res-
> > >mem_type);
> > +	else
> > +		drm_puts(p, "placement: none\n");
> > +
> > +	/* The pages of sg bos are owned by the exporter and not
> > visible. */
> > +	if (bo->ttm.type =3D=3D ttm_bo_type_sg) {
> > +		drm_puts(p, "pages: unknown (sg bo)\n");
> > +		return;
> > +	}
> > +
> > +	if (tt && ttm_tt_is_swapped(tt)) {
> > +		drm_puts(p, "pages: swapped\n");
> > +		return;
> > +	}
>=20
> [Severity: Medium]
> In drivers/gpu/drm/xe/xe_bo.c, can xe_bo_print_numa_info_locked()
> misreport
> shrinker-purged buffer objects as swapped?
>=20
> When a buffer object marked DONTNEED is reclaimed by the shrinker via
> xe_bo_shrink() -> xe_bo_shrink_purge(), it invokes ttm_bo_shrink()
> with
> .purge =3D true:
>=20
> drivers/gpu/drm/xe/xe_bo.c:xe_bo_shrink_purge() {
> 	lret =3D ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> 			=C2=A0=C2=A0=C2=A0=C2=A0 {.purge =3D true,
> 			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .writeback =3D false,
> 			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .allow_move =3D false});
> }
>=20
> Inside ttm_bo_shrink() -> ttm_tt_backup(), ttm_pool_backup() frees
> the
> pages and returns the freed page count, causing ttm_tt_backup() to
> set
> TTM_TT_FLAG_BACKED_UP on tt->page_flags even when purging. For
> example,
> xe_ttm_tt_populate() specifically checks !xe_tt->purgeable alongside
> ttm_tt_is_backed_up(tt):
>=20
> drivers/gpu/drm/xe/xe_bo.c:xe_ttm_tt_populate() {
> 	if (ttm_tt_is_backed_up(tt) && !xe_tt->purgeable) {
> 		err =3D ttm_tt_restore(ttm_dev, tt, ctx);
> 	} else {
> 		ttm_tt_clear_backed_up(tt);
> }
>=20
> Because ttm_tt_is_swapped(tt) tests TTM_TT_FLAG_SWAPPED |
> TTM_TT_FLAG_BACKED_UP without checking xe_bo_is_purged(bo) or
> xe_tt->purgeable, a BO purged by the shrinker will be reported as
> "pages: swapped" rather than purged or not populated.

Could rename this as swapped/purged. I'll update a V3.

>=20
> > +
> > +	if (tt && !ttm_tt_is_populated(tt)) {
> > +		drm_puts(p, "pages: not populated\n");
> > +		return;
> > +	}
>=20
> [Severity: Medium]
> What happens in xe_bo_print_numa_info_locked() in
> drivers/gpu/drm/xe/xe_bo.c
> when a VRAM buffer object is created with
> DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
> and then validated into VRAM?
>=20
> In xe_bo_init_locked(), XE_BO_FLAG_DEFER_BACKING initially places the
> BO in
> sys_placement, which causes ttm_bo_validate() to allocate an
> unpopulated
> bo->ttm.ttm:
>=20
> drivers/gpu/drm/xe/xe_bo.c:xe_bo_init_locked() {
> 	/* Defer populating type_sg bos */
> 	placement =3D (type =3D=3D ttm_bo_type_sg ||
> 		=C2=A0=C2=A0=C2=A0=C2=A0 bo->flags & XE_BO_FLAG_DEFER_BACKING) ?
> &sys_placement :
> 		&bo->placement;
> }
>=20
> When the BO is subsequently validated into VRAM via xe_bo_validate()
> ->
> ttm_bo_validate() -> xe_bo_move(), move_lacks_source is true because
> the
> ttm_tt was never populated, so xe_bo_move() takes the
> ttm_bo_move_null()
> path instead of ttm_bo_move_accel_cleanup():
>=20
> drivers/gpu/drm/xe/xe_bo.c:xe_bo_move() {
> 	} else {
> 		/*
> 		 * ttm_bo_move_accel_cleanup() may blow up if
> 		 * bo->resource =3D=3D NULL, so just attach the
> 		 * fence and set the new resource.
> 		 */
> 		dma_resv_add_fence(ttm_bo->base.resv, fence,
> 				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> 		ttm_bo_move_null(ttm_bo, new_mem);
> 	}
> }
>=20
> Because ttm_bo_move_null() does not destroy the unused bo->ttm.ttm,
> tt
> remains non-NULL and unpopulated while the BO is populated in VRAM.
> Wouldn't
> xe_bo_print_numa_info_locked() then report "placement: vram0"
> followed by
> "pages: not populated", unlike normal VRAM BOs where tt is NULL?

This is a separate bug that needs to be fixed. The tt should be
dropped.


