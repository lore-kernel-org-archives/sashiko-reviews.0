Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845E455624
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940561; cv=none; b=E21ewD4M7o75RbUpu8mv2m9oAFY7lNiwGCmnYlMrAYRqQF7lEpZA2JY+hNn430+iOVhR+e7m9S72jDWtZyoPfemYzRRUYk8QAWz8vh7DY31JJ7y/aQ4qKYcimgXEKkYivtt7ZDp35cjeHzCg4MHqvVP85wZmXgy44rYszhLQeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940561; c=relaxed/simple;
	bh=ffv+Nd5MMWmMfOwKMlWYjnmg2Q7ja6HmGcTmgKa+xpY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tkJ3Aq3Xbq50dzOHDX4xyfqxkz7C9RNFk4jeUYkyxy7s1anCOY/hYeu/DYIS8WVCuxclThrDaP96HbSF8YK9RUqFjbTezuK0pxzhrgBGPM5+4znhQvg6FGGqo6yVw/vvgyagQQ0Maz7rSzbNRFThPNJuvYcmBgA0ik79YeQkUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxmzDgge; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxmzDgge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788940558; x=1820476558;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ffv+Nd5MMWmMfOwKMlWYjnmg2Q7ja6HmGcTmgKa+xpY=;
  b=dxmzDggeTZV1ci2fYDvxEuQNId4BwQetgKuPk8iPjklnRnJLQ/GVlT1g
   FdWopReVDOg4uJoZE4gcQnpPNIu0mcIT8t8+8EEtmpbM4CfwAfYtt+7dN
   jVN3flXRb/wGVLwyn4gCSPblACBNeP9fLhq6I3Fi97AJkZ+2jw4CMQhGX
   IFIl0Tc8IoyW0VikcwjjdWNOnvulwLib8TelsOLZMMgUUAnWpvFOAyyZI
   Bn8ZGdQp2oihzEZ4A7xgaPynZQ9GmMcr4GdJd37uIixup1OdeN0IewCy9
   dtaD6xuhlE6Ld7Ckf6rSqKzVpF8YHttp5C7bGCuFEjlZ2Mdpi16yGJLAk
   Q==;
X-CSE-ConnectionGUID: OOFTcpJHStuVvDStOc5EOw==
X-CSE-MsgGUID: 69KDQteVRAaOKoIkL7VELQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76916342"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="76916342"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:55:56 -0700
X-CSE-ConnectionGUID: nVaN9HZtQqycSnUSJ2ObfA==
X-CSE-MsgGUID: 8FoxFFR2TBKV8z0SRL1XLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265037002"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60]) ([10.245.245.60])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 00:55:54 -0700
Message-ID: <a17944e24497617abc5ea17f991347c82de09448.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Keep walking on SVM eviction failure
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 09:55:52 +0200
In-Reply-To: <aqBif1V2aY92MxRG@gsse-cloud1.jf.intel.com>
References: <20260908184346.92332-1-matthew.brost@intel.com>
	 <20260908185523.6EC501F00AC4@smtp.kernel.org>
	 <aqBif1V2aY92MxRG@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-09-08 at 12:31 -0700, Matthew Brost wrote:
> On Tue, Sep 08, 2026 at 06:55:22PM +0000,
> sashiko-bot@kernel.org=C2=A0wrote:
> > Thank you for your contribution! Sashiko AI review found 1
> > potential issue(s) to consider:
> > - [Medium] Unconditionally masking `xe_svm_bo_evict()` errors as `-
> > ENOSPC` hides fatal errors and triggers TTM error log spam.
> > --
> >=20
> > commit 8fcbc00a7aa0e3b2119f7df96129747882247423
> > Author: Matthew Brost <matthew.brost@intel.com>
> >=20
> > drm/xe: Keep walking on SVM eviction failure
> >=20
> > This commit adjusts the error handling in xe_bo_move() for SVM
> > eviction
> > failures. It overwrites the return code from xe_svm_bo_evict() with
> > -ENOSPC
> > to force TTM to continue walking the LRU list for eviction
> > candidates.
> >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1043,6 +1043,11 @@ static int xe_bo_move(struct
> > > ttm_buffer_object *ttm_bo, bool evict,
> > > =C2=A0		} else {
> > > =C2=A0			drm_dbg(&xe->drm, "Evict system
> > > allocator BO failed=3D%pe\n",
> > > =C2=A0				ERR_PTR(ret));
> > > +			/*
> > > +			 * The semantic we want upon SVM
> > > eviction failure is
> > > +			 * keep walking for eviction, which is -
> > > ENOSPC.
> > > +			 */
> > > +			ret =3D -ENOSPC;
> >=20
> > [Severity: Medium]
> > Does unconditionally overwriting the error with -ENOSPC hide fatal
> > errors like
> > -ENOMEM?
> >=20
> > When system memory is exhausted, xe_svm_bo_evict() can return -
> > ENOMEM. By
> > masking this as -ENOSPC, it seems we might break proper error
> > propagation to
> > higher layers, preventing expected OOM handling.
> >=20
>=20
> Yea.. Perhaps -ENOMEM should actually be returned to the upper layers
> as
> this indicates we are out of system memory and attemping more
> evictions
> is unlikely to help.
>=20
> Second opinion from the Xe team on this one?

IMO we should just convert specific errors (or exclude specific errors)
and add a motivation in the commit message for future reference.

Thanks,
Thomas



>=20
> > Furthermore, could this trigger a TTM error log spam loop? When
> > returned to
> > TTM, -ENOSPC causes ttm_bo_evict() to log an unconditional
> > pr_err("Buffer eviction failed\n"). Since -ENOSPC is converted to -
> > EBUSY in
> > ttm_bo_evict_cb(), it signals the LRU walker
> > (ttm_lru_walk_for_evict()) to
> > skip the BO and continue walking.=20
> >=20
> > During genuine resource exhaustion, this might cause a fruitless
> > iteration over
> > the entire LRU list, logging a pr_err() for every single buffer
> > object. Even
> > benign SVM races might spam the kernel log with errors.
> >=20
>=20
> The spam is probably seperate issue in TTM. -ENOSPC likely shouldn't
> emit a pr_err as it continues walking.
>=20
> Matt
>=20
> > > =C2=A0		}
> > > =C2=A0
> > > =C2=A0		goto out;
> >=20
> > --=20
> > Sashiko AI review =C2=B7
> > https://sashiko.dev/#/patchset/20260908184346.92332-1-matthew.brost@int=
el.com?part=3D1
