Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040913;
	b=hwLC1FzgmRXJy2oBT0ba7Nwa2jcVqtWOnqSDUM0yLcTEZYxcKO/rCZoJ3HPPCO6FOrOC
	 rwz4mFQ3qQPPbf1y/gz5VidexiG+/E4ZRNg286TqOF6TwsOj4s1ZQVkLL5grKQE7jAcOm
	 mZfPiFJngUdBc9rge4gCSQjdcgJULu+SSw2SLmQH7NrGl1QRGg/iDh75Syp2sVMLUBEcL
	 rMSpRcrV/lPa6+7Cde56QNH9Ovl7M7Yef5/1wUhXw5GZsCw/6y0dg2be4Ux6KXOdE0vwO
	 4zwLZ00GPHAVZdqFBfGUx2whjeZ2gcCCkztKWF6lkItLn+Ie0595Voz6wdVSx9ID6aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040913;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=H0yR4I69VzzIDJ2jkXRS+q1Dautmc4997YunyklyeTw=;
	b=jT+luz+GgP/wIl99DZvv/SAB1WKgZnTjPpO2yjgi1dN6rfxfT04cfcdzVIInltO/pD4D
	 PYl/fPRWvUpqdsBTTllZOJT6C26JEUWZewLL4vhHVchj3z9rNzOcKegVso/jDXZvU3qMN
	 dflAizcgRpJoUDe7jw7UJTUfpyCL40qCg2jr3ayhFjPijA6zLIRBwn4SFmT223ro0Yt/p
	 GBQQJ8PPHEgdC0M9Tj6TR1I/QYS7RodStaiNZRmT+NFzbFSq3MkvkvxmMq24bJ25bjnSs
	 lPZyHtII1xnUGzODyDzD1nWufsgyAGP/EOQ2mLODwmolDhEFItvATEzxmCW3frb+0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="badxh/+D";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28306606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 22:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28306606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=badxh/+D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795040912; x=1826576912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZtRJ9VUBqowhR7H8EyZuNy6+UQZ80k9gz9GHbW1SFUo=;
  b=badxh/+DXR2Y0/RViXnMfB++QiCUjf9xIslnDXr53dxO7SkQL95uEbdB
   Brj4vDR5hDKfAuSoCtb6PjDVgfLUswbCtQL0tKaBfj4fdxDUewsqIfiT6
   AK9nvDMRmgEbaMN0s3x7nsc4/mQtZHOFxa82IVzP4+XJNi0coucmvUA/E
   7Mb1F/09XvrtU3+BD+6aYOnbfHh2YlYMAsg6t3xYDCLjmPWWTBQ28XLLw
   L1c4taL4SrLLxnItzuLuW1Wb5jriF8K9nbjwlLs0hcmiS2ASbd986UtoG
   uBiuZvKX7outH/2y3762rD65v/DitYUvUiDquZEjj7I3uYyP8tVrI0QH7
   w==;
X-CSE-ConnectionGUID: dk5c6RwwRuCfJBn9yDYUVQ==
X-CSE-MsgGUID: OH9NHVyrTDGjmAlt8z9JEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3767632"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3767632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:28:32 -0800
X-CSE-ConnectionGUID: wZUMpexdTWmXChSZPIe9VA==
X-CSE-MsgGUID: RnSFZeoPRxGY5TBS8DOBBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10134787"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:28:31 -0800
Date: Thu, 19 Nov 2026 00:28:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 19/20] drm/nouveau: Allow platform driver build with
 COMPILE_TEST=y
Message-ID: <av4miu_2zQEDnBJx@intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
 <20261118214518.29317-20-ville.syrjala@linux.intel.com>
 <sashiko-outbox-222062@kernel.org>
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
In-Reply-To: <sashiko-outbox-222062@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Nov 18, 2026 at 09:57:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/nouveau: build failure in nouveau_platform_resume() when
>   PM_DEVFREQ=n
> --
> 
> commit 7f3a768f8ef913fb90efb9c01241f3d8714fc297
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/nouveau: Allow platform driver build with COMPILE_TEST=y
> 
> This commit allows NOUVEAU_PLATFORM_DRIVER to be enabled when COMPILE_TEST=y
> even on non-Tegra architectures.
> 
> > diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> > index 3b5757aed9c84..d7b432c839e5f 100644
> > --- a/drivers/gpu/drm/nouveau/Kconfig
> > +++ b/drivers/gpu/drm/nouveau/Kconfig
> > @@ -34,7 +34,7 @@ config DRM_NOUVEAU
> >  
> >  config NOUVEAU_PLATFORM_DRIVER
> >  	bool "Nouveau (NVIDIA) SoC GPUs"
> > -	depends on DRM_NOUVEAU && ARCH_TEGRA
> > +	depends on DRM_NOUVEAU && (ARCH_TEGRA || COMPILE_TEST)
> >  	default y
> >  	help
> >  	  Support for Nouveau platform driver, used for SoC GPUs as found
> 
> [Severity: Medium]
> Does this break the build in nouveau_platform_resume() when
> CONFIG_PM_SLEEP=y and CONFIG_PM_DEVFREQ=n?
> 
> DRM_NOUVEAU only has "select PM_DEVFREQ if ARCH_TEGRA", so when
> ARCH_TEGRA=n and COMPILE_TEST=y, CONFIG_PM_DEVFREQ can remain disabled.
> The fallback stub for gk20a_devfreq_resume() in
> drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h is missing the
> pointer asterisk on its parameter:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h:
>     #if defined(CONFIG_PM_DEVFREQ)
>     int gk20a_devfreq_init(struct nvkm_clk *base, struct gk20a_devfreq **devfreq);
>     int gk20a_devfreq_resume(struct device *dev);
>     int gk20a_devfreq_suspend(struct device *dev);
>     #else
>     static inline int gk20a_devfreq_init(struct nvkm_clk *base, struct gk20a_devfreq **devfreq)
>     {
>     	return 0;
>     }
> 
>     static inline int gk20a_devfreq_resume(struct device dev) { return 0; }
>     static inline int gk20a_devfreq_suspend(struct device *dev) { return 0; }
>     #endif
> 
> Passing struct device *dev from nouveau_platform_resume() to
> gk20a_devfreq_resume() then fails to compile with an incompatible type
> error.

Ack. Fix is now on my local branch. I'll include it if/when I resend.

-- 
Ville Syrjälä
Intel
