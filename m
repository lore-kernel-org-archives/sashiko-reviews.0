Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827449;
	b=fJqFPFKA3p3LW2Jn95hdFQnQumqb6spSqDpSyNB/iUkOEsrhPsD0bcZZWx8iCoVWZpqi
	 Ov7JoGZnQDrFfcbc95KZWfC/H01PMWaTXoKlHF1J/2xUcCwsSPkhw3+6YGTuDj1JTR5Bo
	 pOT4OrdwPm+WsA5oTm2nx/+1OEm05iqMeDxjhserpa8G3GOqPH9qeNZT4XxOAeXphexJq
	 7fW9u2cHlFlAzMPjVHT7LkhwE6X1DoK4g6XTYaFu1UYdx+/qY2WIU5dWEfYt8a5Pc8PnT
	 FPheXwaSZCkMK7aZpli9ciMxccXRRKR34X84WbiklgvQ/8Nt3EiOCl/EZDwXlmayu7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827449;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=XBZfpFOBzTN/OnczrE6SLXH24P3y5j2I/8/G6P8knkQ=;
	b=Y3tcxa/xVWSRXiA4Co2ZuE+rf16rNtmP27uBxurUgZc1eHs/rlDalxqBf/Q4YWhQiSvs
	 axlnNR42iYRz28+vnKeSkKzLi3e9racNL9zVWjVkBG8sXkj5d96XGMrnvPhq/0iu58xPu
	 BMJGNIbKvSmzdc4Jr6h4lOMymEDuJxcLCTHwIX7SvrfrEvHQY2+0eKphtjnqTzwVfmFa8
	 XsFexyD2A6//y94DaBjjmgzPzHNj2r7nHUvVLyYPBrMktU4wxVJ8G/9r6GA+inX13ClnO
	 rl1ny8WCGV3ZzMa6rgidKjxONVNiWpZMR6vnwRRdNHLS1InZOQmhGAjhjCSemO3N1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mz1ZJhV9;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6851A60A2629
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 11:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6851A60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mz1ZJhV9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827450; x=1826363450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oetKBKq3OHnLCF9dOGr4kSyIr2/4Zp2CMeqquq113yk=;
  b=mz1ZJhV9srFaGwgKXU4tTCR+/90gM4QrgSjY/lIwRhYYZp5WMIaJwryg
   JHP0xk2FUxKbbtTIisErDE+fA26L+CDIIcYh5JovapX3wh6HsA+JpZZjM
   INCzdSJY7wCCYUMw0MPXkoFLPc/bAeI+L/5Riq1YLyMW97TXSFiaYUUlF
   OSKbvrqGldGeNR2JLYEl0fWdgkfDRReLQtch9mXc9TOK70PCQPkVUtZnI
   Lgi+dMPEcv985p6oh620201Nd3pK4skMVnZCLbvgTmRGMqEf0OOLnpn/h
   Ap/GlVj4ZqgkakbGgXhNj455IlXgTPF7gtOfaY+Y+k3qz2AHL/lG68voe
   Q==;
X-CSE-ConnectionGUID: VH5/mnc3RuS4urTOdPOMXA==
X-CSE-MsgGUID: KAyVfRVDRb6BxRdT2q9ZMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3413207"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3413207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:10:49 -0800
X-CSE-ConnectionGUID: 7N4I0Ue5QxyRTe3+T7uCYQ==
X-CSE-MsgGUID: 9ZAM7YV5TBivpWwcKlrOmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9710302"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:10:46 -0800
Date: Mon, 16 Nov 2026 13:10:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 10/12] drm/i915: Complete no-op "async flips" by hand
Message-ID: <avrksFHUYSQTfE95@intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
 <20261116091130.13950-11-ville.syrjala@linux.intel.com>
 <sashiko-outbox-216616@kernel.org>
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
In-Reply-To: <sashiko-outbox-216616@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 16, 2026 at 09:28:56AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] drm/i915: unreachable noop check in
>   intel_crtc_complete_noop_async_flip()
> - [Medium] drm/i915: intel_crtc_complete_noop_async_flip() checks
>   cleared uapi.event
> --
> 
> commit 828bac38a449130d5473b2a45f7f646152241cec
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915: Complete no-op "async flips" by hand
> 
> This commit adds helpers to manually send the vblank event for atomic
> async flip commits when no planes are updated.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index f79caeb5a82ec..dd12929284bb8 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -1190,6 +1190,42 @@ static void intel_crtc_disable_flip_done(struct intel_atomic_state *state,
> >  	}
> >  }
> >  
> > +static void intel_crtc_complete_noop_async_flip(struct intel_crtc_state *crtc_state)
> > +{
> > +	struct intel_display *display = to_intel_display(crtc_state);
> > +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> > +
> > +	if (!crtc_state->do_async_flip)
> > +		return;
> > +
> > +	/*
> > +	 * If there are planes actually performing the async flip then
> > +	 * the commit will be completed via the flip done interrupt
> > +	 * handler. For a fully no-op "async flip" the commit must
> > +	 * be completed by hand as no interrupt will be raised.
> > +	 */
> > +	if (crtc_state->update_planes)
> > +		return;
> 
> [Severity: Medium]
> Can crtc_state->do_async_flip ever be true when crtc_state->update_planes
> is zero?
> 
> intel_crtc_duplicate_state() initializes both fields to zero/false, and the
> only place that sets new_crtc_state->do_async_flip = true is
> intel_plane_atomic_check_with_state() -> intel_plane_atomic_calc_changes()
> for a visible plane, after intel_plane_atomic_check_with_state() has
> already set BIT(plane->id) in new_crtc_state->update_planes:
> 
> drivers/gpu/drm/i915/display/intel_plane.c:intel_plane_atomic_check_with_state() {
> 	...
> 	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
> 		new_crtc_state->update_planes |= BIT(plane->id);
> 	...
> 	return intel_plane_atomic_calc_changes(old_crtc_state, new_crtc_state,
> 					       old_plane_state, new_plane_state);
> }
> 
> When no visible planes are in the atomic state, crtc_state->do_async_flip
> remains false (unlike crtc_state->uapi.async_flip), so this function always
> returns early on the first check and never completes a no-op async flip.
> 
> > +
> > +	if (crtc_state->uapi.event) {
> > +		spin_lock_irq(&display->drm->event_lock);
> > +		drm_crtc_send_vblank_event(&crtc->base,
> > +					   crtc_state->uapi.event);
> > +		spin_unlock_irq(&display->drm->event_lock);
> > +
> > +		crtc_state->uapi.event = NULL;
> > +	}
> > +}
> 
> [Severity: Medium]
> Will crtc_state->uapi.event always be NULL by the time
> intel_crtc_complete_noop_async_flip() runs?
> 
> In intel_atomic_commit_tail(), commit_modeset_enables() runs before
> intel_atomic_complete_noop_async_flips().  When new_crtc_state->do_async_flip
> is true, intel_update_crtc() -> intel_pipe_update_start() calls
> intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flip_done_event),
> which moves new_crtc_state->uapi.event into crtc->flip_done_event and sets
> new_crtc_state->uapi.event = NULL.  With update_planes == 0, no flip-done
> interrupt will fire to consume crtc->flip_done_event, leaving the event
> unsent and causing drm_atomic_helper_wait_for_flip_done() to time out.

Ack. Need to deal with that and not prepare the flip done
event without a plane to send it.

-- 
Ville Syrjälä
Intel
