Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219040B102
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436782; cv=none; b=PMJnbJqn5tHugKNfVYrFydbPgJTADZGIiPU4ZpuzfKoFSrOp9BSCW0IZ4eymXS+T5O3wQ2qmv1/A1aLaGP4b4by75I93t1pqAqy44DncwGCmDJU2iw8cGP9/Z/sD0aa7jvyt/vVggampZQvyNVmRY15zAurodqmsf/AQxq1tz+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436782; c=relaxed/simple;
	bh=FOu1GlPYYUbar+QR48/GSZ69GJJVfk4+jdpa5mxanok=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r8XKWEfHNi43JDP+LnLrngHNS3UcpMl8XYISkmltgUEsSO8OmIR/M7U7UG+FIzZinasUDU7qilvreh23tHV+fWVb4ts+yzOrjfjwJJU4KGj+PcYwKn/wkeqP/6KKrtz8Sm9Fl5oTPkd0z+eQ5Kw8mFLOpbp/UfDwEFS32ajnqqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URb6A5Qt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URb6A5Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436781; x=1819972781;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=FOu1GlPYYUbar+QR48/GSZ69GJJVfk4+jdpa5mxanok=;
  b=URb6A5QtDQroEsbhR/2utf/44NAfcZx57NTA67AsRVoEWRFmxkYGVCgu
   bUUddFse8diJu4JFm9RDP243LWdeWgbhsgf9E1MRe8GceemGwhXBJCMV0
   Z8qLkdDaFD/7bPcp4YAd5OOl9iPTjbRpb/zY0USSzgTh3Em7RmH6xKoE1
   aMm50jfq1t4YmoW8JmIXBIfEJJAG5aqv7AgoWxNO713XXrWiwvYeedlo4
   N6cE1HyB/wfnuAuqvt2s22yibg7HZ9YwC/qeJF7w/PXrPMe0vdLfxYvwB
   R0w6FO1ndqADQT0ZHKKLxEVBeNfEwLMaEvdL6/FCLt+T75rfEivD11onO
   w==;
X-CSE-ConnectionGUID: idz+b+MnTrSo7AVWrLArzw==
X-CSE-MsgGUID: GDGTG5tGRqOn/r8maldZOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99515727"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99515727"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:59:39 -0700
X-CSE-ConnectionGUID: MpBR0YDTSx6ufc3Aor7mkQ==
X-CSE-MsgGUID: uFwzaEUWR2OAEaakYwSyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267108959"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.87]) ([10.245.244.87])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:59:38 -0700
Message-ID: <1ce02239a8c47c110f3b0990ceddb82499297be0.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Flush LSC untyped L1 dataport cache after
 rcs/ccs batches
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Sep 2026 13:59:30 +0200
In-Reply-To: <20260903115039.0D4331F000E9@smtp.kernel.org>
References: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
	 <20260903115039.0D4331F000E9@smtp.kernel.org>
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

On Thu, 2026-09-03 at 11:50 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Unmitigated cross-process information leak via L1 dataport
> cache on MTL platforms.

MTL is not officially supported by the xe driver, however an additional
fix for MTL is in the pipeline.

/Thomas


> --
>=20
> commit 9a1c38c27d115c29ae7f3e8c47d4fe8e892e8d64
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches
>=20
> This commit introduces an explicit flush of the LSC untyped L1
> dataport cache
> via PIPE_CONTROL in emit_render_cache_flush() for Xe2 and later
> platforms. It
> addresses an issue where the L1 dataport cache was not reliably
> coupled to the
> HDC Pipeline Flush starting from MTL. By explicitly setting this bit
> on
> GRAPHICS_VERx100(xe) >=3D 2000, it aims to prevent stale data leaks
> when memory
> is reclaimed.
>=20
> Link:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/7c2ff46a4fc3e537573ac95=
03057e0cd29b6fff3
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8909
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 39a670e91ba72..08b4a4283e96a 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> [ ... ]
> > @@ -220,6 +221,16 @@ static int emit_render_cache_flush(struct
> > xe_sched_job *job, u32 *dw, int i)
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
> > =C2=A0
> > =C2=A0	flags0 =3D PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> > +	/*
> > +	 * Prior to MTL, HDC Pipeline Flush reliably also flushes
> > the LSC
> > +	 * untyped L1 dataport cache, provided HDC_CHICKEN0 is
> > programmed
> > +	 * correctly. Starting with MTL that coupling no longer
> > holds
> > +	 * regardless of how HDC_CHICKEN0 is programmed, but
> > explicitly
> > +	 * requesting the flush via PIPE_CONTROL is itself only
> > reliable
> > +	 * from Xe2 onward, so only gate it in on Xe2+.
> > +	 */
> > +	if (GRAPHICS_VERx100(xe) >=3D 2000)
> > +		flags0 |=3D
> > PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH;
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but does this condition
> leave
> MTL platforms vulnerable to a cross-process information leak?
>=20
> Since GRAPHICS_VERx100(xe) < 2000 for MTL platforms, they will not
> receive
> the L1 dataport cache flush here. If the command streamer (CS) flush
> is
> unreliable on MTL, does this mean sensitive data can still be read
> from the L1
> cache by another process after memory is reclaimed or evicted?
>=20
> If the PIPE_CONTROL method cannot be relied on for MTL, is an
> alternative
> mitigation strategy, such as dummy shaders or MMIO-based flushes,
> needed to
> fully resolve the vulnerability on those platforms?
