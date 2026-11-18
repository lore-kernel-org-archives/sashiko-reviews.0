Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036334;
	b=NvSmw+7qfZiggVjQO2Hc3TbnfFMdgDkhy/xxm/vLYPlfuRQxFYPAr7YwR7POB8Q7bfv7
	 aR3i0uIl6Q1hq+UIyyNik5Nz+2G21rh+d/PaQ/gHHEJFahsZ2oX4oy4uReyTCxoEsvg4V
	 u29qvWv0XJIckS6K0tGUzB1tvPKaaBkhVpqzZjtrUMJfg4nacYQGhi0si0543Vpvw7LPf
	 1km2GgIlOmAmD93Tv5AdfShjK+/mJ1TE0dOFBnCT3oq/t6CsXI0/0M4y9b0WcsVL6MdXm
	 Wo2sGdTtFvhxkHVAqTmZt/tuUoe6JmQshKTyip4pw+BLtrO7H3APz3HZqcG0e3ZTcZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036334;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=e3wovxtp256iT9j8R80M+U7B6lq8njwUVIMdQxcI20s=;
	b=Ppj9ga8+RTG5feprZvrRdgP/b5waAIR5f8bCqoYQSCycSPf0t5bjySrHIjuzjP49cZKj
	 jnzIbb0/SUFE20kDvUFXQ8sijfyCrktdrif0FiNkfgF1BPvVnwRmcvB02QpgGnr0FCBvd
	 E7lGwLodZivIU6cagFH34r7ly8JYjy/ELJcvQkYh78hKrWJSNFY9akuTeVpy5qrhBgR5q
	 oHh4Tq6a99h2vrxwIv756tcyo29ju2LN70gWyaxT4Hzk/Ha00NwSa1OY5w1Y6gtBEJ634
	 9QrQDMrwHPX7LJ++95CDdUlMEAEsu1jJtMGCBN5pIkEPL11XLSnlD6yDF335Zce6xEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DTXYN49B;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B05606A32A
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 21:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B05606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DTXYN49B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795036333; x=1826572333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wth4zz1xROv/Fl0zF6nwGKAs4YQsEkSPYWH6B5/fvHw=;
  b=DTXYN49B4dpYaIo6ellaYx6O5eogacu7djJOGrzPw+XPtN5KPiPrrmvM
   qWtjcuAlcQF5l0Xe+6PAUCfOYrLUR88nKrsrlx2yN2UQDRapsCZ5pHR4N
   /KE43aq2ijgqJmnHyjPjhYe1PLbEDhVR5B/xZiZPiNPRw/5aqlFZ8cDlr
   GcjaAJMSrDo5XkuKKjTEH4ByTtDZSVQ2UtlDjdxNI32bt32mqLUYZ16Um
   5/1xdPHgXhsIAzrdGhIXInrNzt9uthf5BOJFxAHt+nOJgz1NGaeSV9GCw
   9IVlv3SaAsouhypdrEq4t/o2Fn+0ZBHlVauT3ll+D8SrPmoDBUndw1xFn
   A==;
X-CSE-ConnectionGUID: rY9T1wV9R6u3ueqkWY7wOQ==
X-CSE-MsgGUID: t1vsWyY4Qcy3FSufwPWDeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3893282"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3893282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:12:12 -0800
X-CSE-ConnectionGUID: NMBwDZ7eR1WcRsmtrb88kw==
X-CSE-MsgGUID: A2Nhz6RJQpud1p7/R6REJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10517678"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:12:09 -0800
Date: Wed, 18 Nov 2026 23:12:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Julius Werner <jwerner@chromium.org>,
	Sean Rhodes <sean@starlabs.systems>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH] drm/sysfb: corebootdrm: Fix Kconfig dependency
Message-ID: <av4UphaS8l0I5GCY@intel.com>
References: <20261118205503.18924-1-ville.syrjala@linux.intel.com>
 <sashiko-outbox-221965@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-221965@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Nov 18, 2026 at 09:02:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/sysfb: corebootdrm: Fixes trailer cites wrong introducing
>   commit
> --
> 
> commit bff902d09954dd5579fb286ff3723415928aa52a
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> > drm/sysfb: corebootdrm: Fix Kconfig dependency
> >
> > DRM_COREBOOTDRM depends on GOOGLE_FRAMEBUFFER_COREBOOT, which is a
> > transitional stub symbol that can never be enabled. This makes the
> > driver impossible to select. Depend on the real symbol,
> > COREBOOT_FRAMEBUFFER, instead.
> >
> > Fixes: a29a1f0ec8d6 ("drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers")
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> [Severity: Low]
> Should the Fixes: tag point to 44e33a5aaa2d ("firmware: Rename google
> firmware directory to coreboot") instead?
> 
> When a29a1f0ec8d6 ("drm/sysfb: corebootdrm: Add DRM driver for coreboot
> framebuffers") was added, GOOGLE_FRAMEBUFFER_COREBOOT was the active
> symbol and COREBOOT_FRAMEBUFFER did not exist yet.  44e33a5aaa2d
> ("firmware: Rename google firmware directory to coreboot") renamed it to
> COREBOOT_FRAMEBUFFER and turned GOOGLE_FRAMEBUFFER_COREBOOT into a
> promptless transitional stub without updating DRM_COREBOOTDRM, so citing
> a29a1f0ec8d6 ("drm/sysfb: corebootdrm: Add DRM driver for coreboot
> framebuffers") could cause stable backports onto kernels that do not yet
> have COREBOOT_FRAMEBUFFER.

Mea culpa. Didn't trawl the history hard enough.

Cc: Julius Werner <jwerner@chromium.org>
Cc: Sean Rhodes <sean@starlabs.systems>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>

-- 
Ville Syrjälä
Intel
