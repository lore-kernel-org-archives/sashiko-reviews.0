Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAFB400DF0
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159585; cv=none; b=ajjOjtojDeArltDjKe6NzeV5DaLAbUA0mRYO6Cwt7C+r+r8cDr5vlrSuMm1sfag/ApnryxmrCkTHi3IFJLK3ra/lWmFElga9GhNeaxx7x5RoYsN/YwimaByiO+ukbrjs8Hf7z+ZT8SttcOSz9gKj9sSDsGq6LKLo8Oej1fKhiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159585; c=relaxed/simple;
	bh=3ihSU1bRa6ZTNgtCnnbwtISqWamEcfvYXxnrAGIzOa8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOQsHuSB3J/fLNK7Xf3FmwhNg9L3ucELjSRkmGdQ+RROzal8ZpzGRMS/wCjSHpZimBzSffSindcM2OWKwFsH6cyiL8NAXs0vPiTZoW56//lbfXLQLPxrSyJhIA3H1piudXfEO9MjnGQqraM5kQKncnHe7QV2wSyfAlWz8e4l3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CM99+8TH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CM99+8TH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792159583; x=1823695583;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=3ihSU1bRa6ZTNgtCnnbwtISqWamEcfvYXxnrAGIzOa8=;
  b=CM99+8THZbEPhaWgijrODDI3j/TUZmb8f3+SiVgvWuDJtEDQRzox3TEm
   7OYepruRpF0s+V+tqy+w1WYVDK94asMvPdrxPGBWcwvlWWIrYeEBqx1Z8
   TATfq/RmjnBoFGSMOPG0mhkbxdrz+h4I2iiDHCOe+5sYVHdYG13wHMb2a
   GGi/8lHz2Tlqui2a76NNiZBb77eSDmblDg2ubjhGdFlCwrNtVpILpjn9A
   4MJcKX/r4EkVySd1nQXoYatra2la59wzYf5DtLzgdFzWR0ads3cQ9qzrI
   ES2twOgfDhXcrQbFCYJcoSOKxJ+N3nxeECcy8eOV8m2m2QIQpOwHRpW/I
   w==;
X-CSE-ConnectionGUID: EAmG75E3S3eBy3rsVrPPFA==
X-CSE-MsgGUID: hlsljGQcSe2DlVmv6hFibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="823620"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="823620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:06:22 -0700
X-CSE-ConnectionGUID: mNsJTkXPSqWVhvaVhOqGXw==
X-CSE-MsgGUID: B/Kzryf+Qte/k3ah8VccvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1964467"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.54]) ([10.245.245.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:06:21 -0700
Message-ID: <1ae33b56ae85d938aab41458e289d5124468cf5f.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/4] drm/xe: Update non-purgeable shrinker batch size
 based on average BO size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 16:06:18 +0200
In-Reply-To: <sashiko-outbox-174403@kernel.org>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
	 <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
	 <sashiko-outbox-174403@kernel.org>
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

On Fri, 2026-10-16 at 13:45 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] drm/xe: shrinker count callback serializes direct reclaim
> via write_lock
> --
>=20
> commit a78bd8842e67f957a2ced6d827e1c4a6430ff29b
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> drm/xe: Update non-purgeable shrinker batch size based on average BO
> size
>=20
> This commit updates the preferred vmscan batch size for the non-
> purgeable=20
> shrinker based on the average buffer object size. It introduces an=20
> exponential moving average that is updated during the shrinker count
> phase.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 8e3fe675e0f34..955908b3bdf3e 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> [ ... ]
> > @@ -210,15 +235,26 @@ xe_shrinker_count(struct shrinker *shrink,
> > struct shrink_control *sc)
> > =C2=A0	unsigned long num_pages;
> > =C2=A0	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> > =C2=A0
> > +	if (!can_backup)
> > +		return SHRINK_EMPTY;
> > +
> > =C2=A0	num_pages =3D ttm_backup_bytes_avail() >> PAGE_SHIFT;
> > -	read_lock(&shrinker->lock);
> > +	/* Consistently use write_lock() for simplicity. */
> > +	write_lock(&shrinker->lock);
>=20
> [Severity: Medium]
> Will this exclusive write lock create a system-wide performance
> bottleneck
> during memory reclaim?
>=20
> The core mm subsystem frequently calls the shrinker's count_objects
> callback
> (xe_shrinker_count) from do_shrink_slab() during direct reclaim. This
> occurs
> concurrently across multiple allocating tasks and CPUs when under
> memory
> pressure.
>=20
> By changing read_lock() to write_lock() to update the batch_avg
> heuristic,
> this forces all concurrent direct reclaimers system-wide to serialize
> on this
> single lock, which could lead to severe lock contention and
> performance
> degradation.

This is grossly overstated. False positive.

/Thomas



>=20
> > =C2=A0
> > -	if (can_backup)
> > -		num_pages =3D min_t(unsigned long, num_pages,
> > shrinker->shrinkable_pages);
> > -	else
> > -		num_pages =3D 0;
> > +	num_pages =3D min_t(unsigned long, num_pages, shrinker-
> > >shrinkable_pages);
> > =C2=A0
> > -	read_unlock(&shrinker->lock);
> > +	if (shrinker->populated_tts) {
> > +		unsigned long avg =3D 2 * (shrinker-
> > >shrinkable_pages +
> > +					 shrinker-
> > >purgeable_pages) /
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 shrinker->populated_tts;
> > +
> > +		shrinker->batch_avg =3D max((shrinker->batch_avg +
> > (long)avg) >> 1,
> > +					=C2=A0 128L /* default
> > SHRINK_BATCH */);
> > +		WRITE_ONCE(shrink->batch, shrinker->batch_avg);
> > +	}
> > +
> > +	write_unlock(&shrinker->lock);
> > =C2=A0
> > =C2=A0	return num_pages ? num_pages : SHRINK_EMPTY;
> > =C2=A0}
