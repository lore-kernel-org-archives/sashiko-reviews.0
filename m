Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B53B42FB
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893491; cv=none; b=VcAkYXlGmLraLy/D9y4bJfMcaOR1K8+FQCDjA5Dgj1KaSyCPnl2fnERU405gWglaNB9iIRToqs+BeRHQFW+hevGj3BRCHXisVf+njJLlZrGt8R+Oj0Id5Qc3RwnhlorL934kvbzNUJodJ6qlykwdTBm3hWjZsop6etzzZw3sYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893491; c=relaxed/simple;
	bh=ZVV2hjY9ay7iumIfLUlyzYe4GywTvBJ7/pC6zjq9+8s=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FIFQ+OalfGPb5Aovi+EZvRmBdhmz6QzKxBajZvItxXoz0P8VD039xy0GNpX53j5SgxsmdQYFzh4Ygu0mSOVVbvyUO4/eJ8p3no8U4cbJicGXTPWkN4BcqBU4VWg+M9H6NjLNkz44jbMknSaiOk0KAeO1O+OahCW6S+3iH0O/86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrLeo6B1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrLeo6B1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782893485; x=1814429485;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=ZVV2hjY9ay7iumIfLUlyzYe4GywTvBJ7/pC6zjq9+8s=;
  b=KrLeo6B1loFX/Fu64/I8nhQ8NwIJP0vCHwbapdE0gRwKXJbvdSuAtsU/
   jqVgPUeJ+QwnnQBXBJDO93yFhGdSG2e7WxzX7vy/5ga4JecD05QT00R2I
   cZ/wGUwha56SI9IUx5wf+SJFMpoWrGZ8GHlfNfNFcRl/eoLQ2RNnbNaKI
   deT0XLw9CYpr3wN0GbuBGrzh8ogWjK9SB0YizeDT7b5eRrM1rKDWUPl4s
   ckJSy9pWbjQdD2HND0aPlF0lJLX5wZcbSFuL0lCqHFdJf0Kge+hk+aYN8
   b1ik21TPfTscJbhjWgrd3LzYS0nbs8Mr1qHwpaNWm35qyPdeyjNSxg0US
   A==;
X-CSE-ConnectionGUID: lnFaU0yjQfuDH7J+g/PGQw==
X-CSE-MsgGUID: LbKITqqvQVWGG68mQpDVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94772613"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="94772613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 01:08:53 -0700
X-CSE-ConnectionGUID: 8UFmS5fRQiuB5i3UYg20qw==
X-CSE-MsgGUID: Eo5z0S5iRCWWQbbtLv9j+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="252078510"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 01:08:50 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260701074137.84A9B1F000E9@smtp.kernel.org>
References: <20260701073030.44850-1-joonas.lahtinen@linux.intel.com> <20260701074137.84A9B1F000E9@smtp.kernel.org>
Subject: Re: [PATCH] drm/i915/gem: Do not leak siblings[] on proto context error
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
To: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev
Date: Wed, 01 Jul 2026 11:08:47 +0300
Message-ID: <178289332700.56387.13946790938701225803@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting sashiko-bot@kernel.org (2026-07-01 10:41:36)
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [Critical] Unchecked NULL pointer dereference of `pe->engine` in `set_p=
roto_ctx_sseu()`.
> --
>=20
> commit 65a99ba2c873d452c04e00448f3e025e69552b68
> Author: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>=20
> drm/i915/gem: Do not leak siblings[] on proto context error
>=20
> This commit fixes a memory leak in the context creation error path.
> It ensures the siblings[] array is properly freed if an error happens
> while processing user extensions.
>=20
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/=
drm/i915/gem/i915_gem_context.c
> > index aeafe1742d308..87fce2adfeefb 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> [ ... ]
> > @@ -800,15 +800,21 @@ static int set_proto_ctx_engines(struct drm_i915_=
file_private *fpriv,
> >                                          set_proto_ctx_engines_extensio=
ns,
> >                                          ARRAY_SIZE(set_proto_ctx_engin=
es_extensions),
> >                                          &set);
> [ ... ]
> > +err_extensions:
> > +     for (n =3D 0; n < set.num_engines; n++)
> > +             kfree(set.engines[n].siblings);
> > +err:
> > +     kfree(set.engines);
> > +
> > +     return err;
> >  }
> > =20
> >  static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
>=20
> [Severity: Critical]
> This is a pre-existing issue, but could this cause a NULL pointer
> dereference later in set_proto_ctx_sseu()?
>=20
> If a user creates a proto-context and uses I915_CONTEXT_PARAM_ENGINES to
> set an engine array with an I915_ENGINE_CLASS_INVALID entry,
> set_proto_ctx_engines() initializes the slot to 0 and skips setting
> pe->engine.
>=20
> If the user then calls I915_CONTEXT_PARAM_SSEU and specifies the index of
> that invalid engine, set_proto_ctx_sseu() executes this:
>=20
>     idx =3D array_index_nospec(idx, pc->num_user_engines);
>     pe =3D &pc->user_engines[idx];
>=20
>     /* Only render engine supports RPCS configuration. */
>     if (pe->engine->class !=3D RENDER_CLASS)
>         return -EINVAL;
>=20
> Does pe->engine need to be checked for NULL before dereferencing it here,=
 to
> prevent a panic?

There is a fix submitted for this already at [1] given the issue was
already taken note of.

Regards, Joonas

[1] https://lore.kernel.org/intel-gfx/20260701075555.52142-1-joonas.lahtine=
n@linux.intel.com/

> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701073030.44=
850-1-joonas.lahtinen@linux.intel.com?part=3D1
