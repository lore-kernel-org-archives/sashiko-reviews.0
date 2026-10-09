Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9214483BF0
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532846; cv=none; b=W/hyYVmw33OiQvq8AELSGhY8brfgKJh8NC/CYdE1YR7a7cIduTVE5kFB7HV0prh3/nKwAnxrKPvdofKJehxjtW5Ynw6lGM4BIXXO4t/PLZhcgNMqAnae6DfH0EpSgHaQFSt3rQIUsDDe10cFuZfuMd6ej71gT+8ggWEMnWdr65M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532846; c=relaxed/simple;
	bh=ok8uvWN/g76K0l0aSxtuWgu9tIqI/liV8beFeRRiU24=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DKNcJx+7I4egBC6cUqo8wQ2dzLOl2zPJjQX10QNulLm0P/6cC9AXCn4nU3pXnvcPxHzwDZQR43Ilpes3K4m9oQxGk7M1uALSoX74RFCUASg1EEkWMHiPm3qHtEVWMW5oPVSYVQgBiupHwJO1hnFaITouY7n8V8HzJ2EF/t+FMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqZxoZNb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqZxoZNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791532842; x=1823068842;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ok8uvWN/g76K0l0aSxtuWgu9tIqI/liV8beFeRRiU24=;
  b=CqZxoZNbZWM8qdvmySX5FNeb3UYkz0FUwPTJ1oFapg7jDVAvqddYxSbe
   TQCEx7GLS12wh5f/4nk5i+tRmWixT1Ub0uxo0kW6pzIx1MtYYvT8S6iJV
   W3MyORu2G9mGtpUdp9N/iXMP6Gmir73yoAc9B7OqCkUFRYBqEXKwRjAj1
   cjt/CYGLTWKiMYqq/AKR30jM4zusw/XTbSwEO8JiIiPGpJxRJc1DpB2MY
   nAEVNHXFDi7LSA0PzFKrGXF024s49oYkATLn1Rq/iwKC33qjfyAlXTmR7
   ehIaqyJ0Za53XekFnlbKErDX2+RNXEmpfujzOX6fFZ1ESNp9q3hUTqyz2
   Q==;
X-CSE-ConnectionGUID: n5YBxm7vS1uyea9dlEGsCA==
X-CSE-MsgGUID: iXb29QbdS4+lS4L5ZgIZbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="336058"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="336058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:00:41 -0700
X-CSE-ConnectionGUID: skn3/HeGSIqqEwIrVKHmqw==
X-CSE-MsgGUID: y6//OTRFTcuqJAjCrqLzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="243143"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.243]) ([10.245.245.243])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:00:40 -0700
Message-ID: <462e2015a1c00a13c5fe74f215a2af8723d3b55e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't transfer shrinker pages for pinned bos on
 purgeable state change
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 10:00:30 +0200
In-Reply-To: <sashiko-outbox-164983@kernel.org>
References: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
	 <sashiko-outbox-164983@kernel.org>
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

On Fri, 2026-10-09 at 07:13 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] drm/xe: Shrinker accounting underflow for display BOs on
> MADV_DONTNEED
> --
>=20
> commit d5c4a3b2c7860c46686f096832d7c3684f902103
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> =C2=A0=C2=A0=C2=A0 drm/xe: Don't transfer shrinker pages for pinned bos o=
n purgeable
> state change
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Pinned bos have their pages removed from the shrinker'=
s
> shrinkable /
> =C2=A0=C2=A0=C2=A0 purgeable counts on pin, and added back on unpin accor=
ding to the
> =C2=A0=C2=A0=C2=A0 bo's purgeable state at that time.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 6921b6967330d..a752e01efbd75 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> [ ... ]
> > @@ -876,7 +878,8 @@ static void xe_bo_set_purgeable_shrinker(struct
> > xe_bo *bo,
> > =C2=A0		return;
> > =C2=A0
> > =C2=A0	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> > -	tt_pages =3D tt->num_pages;
> > +	/* Pinned bos are not accounted. Only update the purgeable
> > flag. */
> > +	tt_pages =3D xe_bo_is_pinned(bo) ? 0 : tt->num_pages;
>=20
> [Severity: High]
> Could this introduce a regression leading to a shrinker accounting
> underflow
> for native display BOs?
>=20
> Native display framebuffers are pinned for scanout via
> __xe_pin_fb_vma().
> Unlike imported BOs, this function calls ttm_bo_pin() directly
> without calling
> xe_ttm_tt_account_subtract():
>=20
> drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_pin_fb_vma() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_pin(&bo->ttm);
> =C2=A0=C2=A0=C2=A0 ...
> }

This is no longer the case. This issue is fixed in drm-tip.

/Thomas




>=20
> Because of this, their pages appear to remain actively accounted in
> the
> shrinker's shrinkable_pages bucket while pinned.
>=20
> If userspace sets MADV_DONTNEED on a display BO while it is pinned,
> won't this
> new check skip the page transfer from shrinkable_pages to
> purgeable_pages
> since xe_bo_is_pinned(bo) is true?
>=20
> It seems this skips the page transfer but still sets xe_tt->purgeable
> =3D true.
> When the display BO is later unpinned via __xe_unpin_fb_vma(), it
> calls
> ttm_bo_unpin() directly without adding pages back to the shrinker:
>=20
> drivers/gpu/drm/xe/display/xe_fb_pin.c:__xe_unpin_fb_vma() {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 ttm_bo_unpin(&vma->bo->ttm);
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> When the BO is eventually unpopulated or destroyed, wouldn't
> xe_ttm_tt_account_subtract() see xe_tt->purgeable =3D=3D true and
> subtract the
> pages from the purgeable_pages bucket?
>=20
> Since the pages were never transferred, does this cause
> purgeable_pages to
> underflow and shrinkable_pages to remain permanently inflated?
