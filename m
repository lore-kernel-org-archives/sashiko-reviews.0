Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383667;
	b=ZxdIqDElRhAGPuuL6W4rLSdvfb6oSWSkM2MWYjLUjZQf9Sac13GII7+Lt40a7QccR+aE
	 UvS5ME8wM78QXkswcF4VgqfKTxsVl8P+gPOGFwW7JFVh8z/QNNsowHxm51eX6eE2aPpza
	 ViSlqgb880zK82pZXSsY4k0n6QDh9iDeEgmgCNCARsxc77DVD8+kzXNOnG7jBcKJBdqkN
	 BJFMjALugHN3POsyaa27xiBQlIkVO9nxqP5A8gk7hFLxhyyFvxxD3rHb1McSBz9vs3dQd
	 ko6GkfKQKUUTB4xJfuoCRt7tyKlRy0r3bWRYiQ70i1HjbrUd09btfBClSVJj41uCB7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383667;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=z7dc5L0AnjQeW/N3Rr8CTypoSl2oW1j2b6q9ApThnFc=;
	b=DCIvHOAcPAdLIETtAt6Oork2ufgD7kKnIDFaj4cclO7b6pcr+JaWC35JFJfPFcCVGmPP
	 rVRUUVjoTZXzlYkJxpOqKZH6vOgXhn47iYLW82tcDXTgB1/usqxB73mYbBpusWyzrUZEq
	 WDegVFdV76K1v3HnPO1HWprqRdNRNmyUaQremRAWTNF1KZ4YqogXHtei6nMCcByEMNR+0
	 Wd7MfOA+P3r/bC0GjeesalZbrk2I7KUk3xXGUEE4XRsd0c959ulso66ZLkEes5ozVfdzC
	 +ZL0Xz1tsuvbfGROL5j04XbrXflsMnHrJcB1qgcwsjveExOMXar5UhWOq5gtOLxtpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IEvS5MoP;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0A1606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 18:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IEvS5MoP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793383667; x=1824919667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iMCu81S75zLO2i9FQ6pTzBDIIuWC6KjPwVwRGycoMs0=;
  b=IEvS5MoPFr6rRrw2ZmuiYWPhVYx2DPExUiGrBcqXJySMccUeDMYz8tkH
   f0S4KITyZSbelHe3WZLVPpISaJF1uANP3sPilFtE7RhZhyLhnjWYyFenT
   ZLnJO+0yOVc02uKcWrHq+P+TOczLzm1PYf7BZMuxN3uUKgn5qREafH9dE
   umnM2l6wEe5bo3pAZSt46XSG5L01AIim2TVbGwOTh4x+EFCguHCDcoddS
   y/5JgKAcur3oQrnG999smJ3Ndu7/cDdtIPXsy4aFKdqGEWVjtwGLQpmEl
   3HhrPBxNn2kojfDoobyMmu3W9zJ1DFeJy2/x++X3U95YMCsAonYZEigF5
   g==;
X-CSE-ConnectionGUID: UbgKHSSfTjS+n9u84eAw5Q==
X-CSE-MsgGUID: UQdjxqA2TYihuNL5dGEAHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2054542"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2054542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:07:46 -0700
X-CSE-ConnectionGUID: r6JRaza9S06mZ+OCu9l0Kw==
X-CSE-MsgGUID: p5a+eOGXS5yqtCXJ5cD5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="6041310"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:07:45 -0700
Date: Fri, 30 Oct 2026 20:07:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/10] drm/i915: Wait for timing generator to start in
 intel_crtc_vblank_on() on HSW+
Message-ID: <auTc7YkuwukKcLWX@intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-7-ville.syrjala@linux.intel.com>
 <sashiko-outbox-191348@kernel.org>
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
In-Reply-To: <sashiko-outbox-191348@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, Oct 30, 2026 at 05:32:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915: intel_pipe_vblank_on() scanline wait times out on DSI
> --
> 
> commit a024447aed84d4ab8f0e7bb2ee11d21475e5b408
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915: Wait for timing generator to start in intel_crtc_vblank_on() on HSW+
> 
> This commit waits for the pipe scanline counter to start moving inside
> intel_pipe_vblank_on() on Haswell and newer platforms before enabling
> vblank interrupts.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> > index a28f4a088e587..209d5a18ee8d9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -128,8 +128,21 @@ u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
> >  
> >  void intel_pipe_vblank_on(const struct intel_crtc_state *crtc_state)
> >  {
> > +	struct intel_display *display = to_intel_display(crtc_state);
> >  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> >  
> > +	/*
> > +	 * Make sure the timing generator has really started so
> > +	 * the sampled frame/scanline counter values don't jump
> > +	 * erratically.
> > +	 *
> > +	 * TODO do this for older platforms as well after
> > +	 * rearranging the modeset sequence a bit.
> > +	 */
> > +	if (DISPLAY_VER(display) >= 9 ||
> > +	    display->platform.broadwell || display->platform.haswell)
> > +		intel_wait_for_pipe_scanline_moving(crtc);
> 
> [Severity: Medium]
> Will calling intel_wait_for_pipe_scanline_moving() unconditionally on
> DISPLAY_VER(display) >= 9 time out for 100 ms and log a false error on
> Broxton/Geminilake DSI and Gen11+ DSI command mode?
> 
> intel_wait_for_pipe_scanline_moving() calls wait_for_pipe_scanline_moving() ->
> pipe_scanline_is_moving(), which directly polls PIPEDSL:
> 
> drivers/gpu/drm/i915/display/intel_vblank.c:pipe_scanline_is_moving() {
> 	intel_reg_t reg = PIPEDSL(display, pipe);
> 	u32 line1, line2;
> 
> 	line1 = intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
> 	msleep(5);
> 	line2 = intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
> 
> 	return line1 != line2;
> }
> 
> On Broxton (DISPLAY_VER 9) and Geminilake (DISPLAY_VER 10) MIPI DSI, timings
> are driven from the port rather than the CPU transcoder, and PIPEDSL does not
> increment. Because of this, intel_dsi_compute_config() and
> bxt_dsi_get_pipe_config() set I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP, and
> __intel_get_crtc_scanline() skips reading PIPEDSL:
> 
> drivers/gpu/drm/i915/display/intel_vblank.c:__intel_get_crtc_scanline() {
> 	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
> 		return __intel_get_crtc_scanline_from_timestamp(crtc);
> 
> 	vtotal = intel_mode_vtotal(mode);
> 
> 	position = intel_de_read_fw(display, PIPEDSL(display, pipe)) & PIPEDSL_LINE_MASK;
> 	...
> }
> 
> When bxt_dsi_enable() -> intel_crtc_vblank_on() -> intel_pipe_vblank_on() runs
> (or during intel_modeset_setup_hw_state()), polling PIPEDSL will see a static
> value and time out.
> 
> Similarly, on Gen11+ DSI command mode (where I915_MODE_FLAG_DSI_USE_TE0 or
> I915_MODE_FLAG_DSI_USE_TE1 is set in crtc_state->mode_flags),
> gen11_dsi_configure_transcoder() configures the transcoder in CMD_MODE_TE_GATE
> without periodic updates. When gen11_dsi_enable() calls intel_crtc_vblank_on()
> during intel_enable_crtc(), no frame update has been requested yet because
> icl_dsi_frame_update() is only called later in intel_update_crtc() ->
> intel_pipe_update_end():
> 
> drivers/gpu/drm/i915/display/intel_crtc.c:intel_pipe_update_end() {
> 	...
> 	if (DISPLAY_VER(display) >= 11 &&
> 	    intel_crtc_has_type(new_crtc_state, INTEL_OUTPUT_DSI))
> 		icl_dsi_frame_update(new_crtc_state);
> 	...
> }
> 
> Should intel_pipe_vblank_on() skip intel_wait_for_pipe_scanline_moving() when
> crtc_state->mode_flags has I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP or
> I915_MODE_FLAG_DSI_USE_TE0 / I915_MODE_FLAG_DSI_USE_TE1 set?

DSI, sigh. 

I suppose for I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP we could
just wait for the frame timestamp to change. Or perhaps even use
that approach unconditionally for all platforms that have frame
timestamps. But I'll probably need to reverse engineer the actual
behavior of the frame timestamp during timing generator startup...

For now I guess I could just skip this for anything where
the scanline counter supposedly doesn't work.

-- 
Ville Syrjälä
Intel
