Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909029;
	b=libvFiD+2OAs2S7bXyO6v1ORj39qx7skIp3voDV+dcXv5lWfcug5WEeygx+qc3bRmVxJ
	 tgh+YK2BaEGew5tlbyTj7OmjbRRZljxKTEC3kcvNpVY2Y8tDKMnmBmtC9Tm/8isBnpm+O
	 Wg6tPEO2faRgXqTkRZ3huD12QeApi6yDx4UWQczVTip+ye/3FBUxg9pq2MMbv3osMFsWW
	 n9+Jw5xyn4C2LeGLaKtkv8AQOImJQgaOxyXCb3NaWhLiU86XgvpvdVJ+3u8Ahavm9UaJh
	 J2SHwYAdkDIyeyyg1auAyHy4CiSoFucuHCzDHlhZTglfJEmDn69QKb8NsVZUs5BRdeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909029;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=2tgQXv11n9NlTN7zs0J0+LDgE0ByTAXmTbj8VE4zSKg=;
	b=pITRSUTWaa8lJEdaW9Tm8teMqCdqxgntRztLDhqfzCiJShv47utJ+z8R6Q8gzMbPJX/x
	 7GRQCHRdeJpWbR0vIqDQ8TDwrhyTyE3N5rJxd4mk0REMqqg/tGsP8rlkzx5blaVVUTo4v
	 2n4InIa+1Jd2LLpK3QyEP2jSdc2SJ8G8MuH2c4AqOiPxS/QbRcjung0ik8KERHbnfd4WG
	 0Kug/nn+DXd4daK/bYWRvUcYSf1DP7yILRyIzVtGIBCnuIiazRnvaytjIhL7GBhS9K6zc
	 Rz/fnE4TqfYi6VE5SGoHFP2G9TiI2/qrh8oSTPxLmKgz3TfHc0XeCs3N778B5X+yOGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+ArmPie;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C99606A331
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 20:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C99606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+ArmPie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793909027; x=1825445027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IkT3wG0ljsHh6GDzk1gcu6H0ddP0MdUwL3TTSMJ8k7A=;
  b=f+ArmPieeqSYBtlluH42pYsvgP8poV81uuZPuStDKZsmksTBrxxV5186
   0Smhoe1sUhv9A8vGv4cFyo4GMqJTRFX2JEyPQQe8Gw+u/BqBv0wkuD/ft
   5GijeHdvTnPCe77jQ3gGKjdvD2Fh5N6SZ8LhvatBnOyuvGLNYZNdtzRX+
   +Vd9Eee5763Lbkg8Ykd0eGEniH+ULcvFk5XzsuZyGBm94n0bS9/ZMvjEv
   DyAnAGUTWaEF3Fo23hN2uzTS0hg/zGcpxsAETad9xTzUEvjx8FNmWyixU
   XkEWTQONcbdkQA0Pqq3BR9Ve1thShYH97c1A3QOfUA+JNdzd72YR5MBZO
   w==;
X-CSE-ConnectionGUID: iWT5ansrToWVq0SguNqMUA==
X-CSE-MsgGUID: FUR5AMCNTe6R7WVuq+vU5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2748881"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2748881"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 12:03:47 -0800
X-CSE-ConnectionGUID: rTkA6/19T/G9DkFQ0ViKmw==
X-CSE-MsgGUID: UCzAoFkvR6SjwcpnTi4AHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7665006"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.198])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 12:03:46 -0800
Date: Thu, 5 Nov 2026 22:03:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/i915/de: Introduce dislay->mmio and
 intel_de_init()
Message-ID: <auzhHpgXyxfGWGA3@intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-2-ville.syrjala@linux.intel.com>
 <sashiko-outbox-198229@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-198229@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Nov 04, 2026 at 10:31:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/i915/de: NULL display->mmio.uncore when intel_de_init() is skipped
> --
> 
> commit 0c47f694d22974ac99844e39b462f72389dd014b
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915/de: Introduce dislay->mmio and intel_de_init()
> 
> This commit adds a display->mmio struct and intel_de_init() to initialize
> display->mmio.uncore, and updates __to_uncore() to return display->mmio.uncore
> instead of calling to_intel_uncore(display->drm).
> 
> [ ... ]
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
> > index d0a239a369807..f1135ee5071b4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > @@ -14,9 +14,11 @@
> >  
> >  static inline struct intel_uncore *__to_uncore(struct intel_display *display)
> >  {
> > -	return to_intel_uncore(display->drm);
> > +	return display->mmio.uncore;
> >  }
> 
> [ ... ]
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> > index c74256359c253..f1bd1252a9602 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> > @@ -1798,6 +1798,13 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
> >  	struct intel_display_runtime_info *display_runtime = DISPLAY_RUNTIME_INFO(display);
> >  	enum pipe pipe;
> >  
> > +	/*
> > +	 * TODO end of intel_display_device_probe() would be a more
> > +	 * logical place, but at the moment i915 calls that super
> > +	 * early when things aren't fully set up yet.
> > +	 */
> > +	intel_de_init(display);
> 
> [Severity: High]
> Can this leave display->mmio.uncore NULL and cause a NULL pointer dereference
> when HAS_DISPLAY(display) is already false before runtime init?
> 
> In drivers/gpu/drm/i915/display/intel_display_device.c,
> intel_display_device_info_runtime_init() only calls
> __intel_display_device_info_runtime_init() when HAS_DISPLAY(display) is true:
> 
> void intel_display_device_info_runtime_init(struct intel_display *display)
> {
> 	if (HAS_DISPLAY(display))
> 		__intel_display_device_info_runtime_init(display);
> 
> On devices where intel_display_device_probe() sets DISPLAY_INFO() to
> no_display—such as Ivybridge Quanta server SKUs (INTEL_IVB_Q_IDS via
> has_no_display()), PCI IDs without an entry in intel_display_ids like Arctic
> Sound-M (INTEL_ATS_M_IDS where find_platform_desc() returns NULL), or GMD_ID
> platforms (INTEL_MTL_IDS / INTEL_ARL_IDS) where probe_gmdid_display() reads 0
> from GMD_ID_DISPLAY—HAS_DISPLAY(display) is false and
> __intel_display_device_info_runtime_init() is skipped.
> 
> Because __to_uncore(display) in drivers/gpu/drm/i915/display/intel_de.h now
> returns display->mmio.uncore instead of computing
> to_intel_uncore(display->drm), any subsequent unconditional intel_de_*() call
> will pass a NULL struct intel_uncore pointer to intel_uncore_read*() or
> intel_uncore_write*():
> 
> 1. On INTEL_IVB_Q_IDS, ilk_irq_handler() in drivers/gpu/drm/i915/i915_irq.c
>    unconditionally calls ilk_display_irq_master_disable() and
>    ilk_display_irq_master_enable() in
>    drivers/gpu/drm/i915/display/intel_display_irq.c on every interrupt, which
>    call intel_de_read_fw(display, DEIER) and intel_de_write_fw(display, DEIER,
>    ...).

This one's a bit funny because it uses the 'no_display' device
info, and that one doesn't even populate ip.ver. So once all
the mmio stuff is fully implemented inside the display code
this will fall through the platform if-ladder all the way to
the i9xx mmio funcs. But that should be fine since it only uses
the _fw() stuff anyway and there won't be any difference for
those. Only LNL will need special _fw() stuff due to the
nasty read vs. write ordering workaround.

> 
> 2. On INTEL_ATS_M_IDS and headless GMD_ID platforms, gen11_irq_handler() and
>    dg1_irq_handler() unconditionally call gen11_gu_misc_irq_ack() in
>    drivers/gpu/drm/i915/display/intel_display_irq.c when GEN11_GU_MISC_IRQ is
>    set, which calls intel_de_read_fw(display, GEN11_GU_MISC_IIR) and
>    intel_de_write_fw(display, GEN11_GU_MISC_IIR, iir).

I think I'll just move the irq_ack() part to i915_irq.c where it belongs,
and leave the handler part in the display. The handler should be fine
to call without display since it just calls some opregion thing that
does nothing if opregion wasn't initialized.

Although I suppose we shouldn't even unmask the GSE interrupt 
if the display isn't there. Shouldn't be hard.

> 
> 3. During system resume, i915_drm_resume() in
>    drivers/gpu/drm/i915/i915_driver.c unconditionally calls
>    intel_gmbus_reset(display) in drivers/gpu/drm/i915/display/intel_gmbus.c,
>    which calls intel_de_write_fw(display, GMBUS0(display), 0) and
>    intel_de_write_fw(display, GMBUS4(display), 0).

Yeah, I remember seeing that before and thinking that it's very
much misplaced. I'll look into moving that into the display code.

> 
> Should intel_de_init(display) be called unconditionally at the start of
> intel_display_device_info_runtime_init() before the HAS_DISPLAY(display)
> check?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261104221842.18799-1-ville.syrjala@linux.intel.com?part=1

-- 
Ville Syrjälä
Intel
