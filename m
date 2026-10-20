Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521082;
	b=RpkLtoN0+uTp09qwhu04/DBA/3+AsT6XvzzG+z27OTxnVlg06WvrNm7D9KBAEjPbi39D
	 5ZChZ3KdsEADJwrwy20aFWgK7rzDKMfQ/J7NRx3q2BSwqOfNBdcROf5aFcnhJdHk/GBzU
	 IO9/3s+TBEuuqHDMsoRta8WnNh+M8/zY6aiynNu67HAMy5z1Ee0Wu2D+19WiFWTxPlgtF
	 eGYrGTW7exkgCJWcjpfU13O7w9MvJaq9jG8lGrjpN4nWE3CQuiIeEUTtjrPSvN2UsQ803
	 tk//uRTyPBRISbaC66wMAjNmE4Y6/el8P54q6K2Eez9Mfh8wvMlsBVr8zrov9Rf4AIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521082;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=rsg0nIVN3/WbpXY88yK+UXs9xD48yZcmA5hhXunhA2U=;
	b=nTFrOk/50sMbTP8etFLNf/gEuVy+6seRzP4I4wJlPY/g0ibnpZVyEPIGENXpIxTZpQW0
	 lvWrx5S3h5t7S0fdiokEcrhSsyMz9sYkVt/ohRqzoQo7sRwF3vrRuhshO+iW8zzV/QL7S
	 23myXiLedy4t7ZMPsinYnygi8Om7Z7f0sAkjK0qJXL+5xFx7ODKAyaHRfxKQrrX8sKezC
	 qWLXB8qLVIx8xzytbCp7Iku0M1tiQjEoHIGN97nX/y86718WMTjQ2UGaXYnLaNwxdl/Kl
	 7eQ9TMN3l3IalPAVfvLaTbCDr6bR5YLdIKMKuIuFuYuX2mmZgyrv3ii1xHXIzik1jpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1uHE5lI;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8FD606A319
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 18:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8FD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1uHE5lI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792521081; x=1824057081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RwKALq7QX9OKo83egn3Wq1A/qkiKaRSFFMEEk09V4so=;
  b=c1uHE5lIWT37/0KqCUAvksDNbJoJbW1GBB9i5Wsj5tw7sL8NFf1H2oO2
   Hdzte97FLEsCPj3eV2TGH+qlHqT0Q4+hriHgYTbJjmjDKr8RbAAPBJHsA
   J6BgkHbTKjQUSlQB9+u6/YWyRYzO/7swoAfLCghRsw2FA7fW64bQbaYss
   JfJ9QoQ5v5uroA9C6v621KgQAIGwg+dcEDmU6P2j46SddxE5t2HU7RSNa
   U6eWlFwd6WLyUYLAJ12qVdp/B7MtVKhCpEYISwVfVqWceY3DLm8bc9N1s
   OPziroxyDPg1cX/0tv3nifgR/+H5jlC+U9EvYf53L/C/shGSCX9vKk1p9
   A==;
X-CSE-ConnectionGUID: Ngmdnm2oQ1KfJgX2a5MTwg==
X-CSE-MsgGUID: jutyeE4iQz2NLrMogFsL2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1249285"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1249285"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 11:31:21 -0700
X-CSE-ConnectionGUID: g+dAZ/deShiRwHKtUxW9+Q==
X-CSE-MsgGUID: 32fYlhqJRsu0ZyY6qL81yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4627866"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.238])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 11:31:19 -0700
Date: Tue, 20 Oct 2026 21:31:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 15/15] drm/i915/pfit: Allow downscaling on i966+
Message-ID: <atezdPm7w8x4KNlT@intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-16-ville.syrjala@linux.intel.com>
 <sashiko-outbox-177503@kernel.org>
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
In-Reply-To: <sashiko-outbox-177503@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Oct 19, 2026 at 02:47:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915/pfit: off-by-one max_scale in i9xx_pfit_check_scaling()
> --
> 
> commit c5496f644982a254aa09057b7c02f1bea3cb5b18
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915/pfit: Allow downscaling on i966+
> 
> This commit updates i9xx_pfit_check_scaling() to raise max_scale to 0x20000 on
> DISPLAY_VER(display) >= 4 platforms to permit panel fitter downscaling.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> > index 6eb457047bf4c..2b6706c7af534 100644
> > --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> > +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> > @@ -563,7 +563,10 @@ static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
> >  	int hscale, vscale, max_scale;
> >  	struct drm_rect src;
> >  
> > -	max_scale = 0x10000;
> > +	if (DISPLAY_VER(display) >= 4)
> > +		max_scale = 0x20000;
> > +	else
> > +		max_scale = 0x10000;
> >  
> >  	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
> >  
> 
> [Severity: Medium]
> Should max_scale be 0x20000 - 1 (or 0x1fff0) rather than 0x20000 here?

I guess I'll just go with 0x20000-1 for now. I suppose that isn't
100% correct because it doesn't match the hardware precision, but
then again neither does the rounding done by drm_rect_{h,v}scale().
The same issue actually exist in the ILK+ pfit and SKL+ scaler
code as well, though in that case the hw precision is .15. I think
what we should do is perform the check using the hardware precision
and rounding, but that check will have to be done after clipping
and all this stuff right now runs before clipping. Currently we
don't have clipping for pfit but I have a branch somewhere that
tries to add that to properly handle the pfit+joiner combo.
For SKL+ plane scaling clipping is already there of course.

> 
> In i9xx_pfit_check_scaling(), max_scale is passed to drm_rect_calc_hscale()
> and drm_rect_calc_vscale(), which treat max_hscale and max_vscale as inclusive
> upper bounds and only reject with -ERANGE when scale > max_scale. Setting
> max_scale = 0x20000 allows an exact 2.0x downscale factor (for example, when
> scaling a 1600x1200 pipe_src to an 800x600 dst).
> 
> However, in drivers/gpu/drm/i915/display/intel_pfit_regs.h, the i965+ scaling
> ratio fields in PFIT_PGM_RATIOS are 13-bit 1.12 fixed-point values:
> 
> #define   PFIT_VERT_SCALE_MASK_965	REG_GENMASK(28, 16) /* 965+ */
> #define   PFIT_VERT_SCALE_965(x)	REG_FIELD_PREP(PFIT_VERT_SCALE_MASK_965, (x))
> #define   PFIT_HORIZ_SCALE_MASK_965	REG_GENMASK(12, 0) /* 965+ */
> #define   PFIT_HORIZ_SCALE_965(x)	REG_FIELD_PREP(PFIT_HORIZ_SCALE_MASK_965, (x))
> 
> These 13-bit fields have a maximum representable value of 0x1fff (< 2.0). For
> an exact 2.0x downscale, panel_fitter_scaling() computes 0x2000 (BIT(13)),
> which overflows the 13-bit register field and causes a hardware state readout
> mismatch in i965_pfit_get_config() -> i9xx_compute_pfit_dst() on
> crtc_state->pfit.dst and pixel_rate:
> 
> drivers/gpu/drm/i915/display/intel_pfit.c:i965_pfit_get_config() {
> 	...
> 	case PFIT_SCALING_AUTO:
> 	case PFIT_SCALING_PROGRAMMED:
> 		hscale = REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
> 		vscale = REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
> 		break;
> 	}
> 
> 	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
> 	...
> }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019135309.23578-1-ville.syrjala@linux.intel.com?part=15

-- 
Ville Syrjälä
Intel
