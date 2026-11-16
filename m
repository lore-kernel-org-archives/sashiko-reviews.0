Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827216;
	b=WJe96tHk1LtBbYm8MG6YzK9/xX/Vc1ZA2E0p4+rGU/kLBFK20/x9mhLUHnBUfnYiloiC
	 347Y2WFdVjWWk//H1q+wV360iwFJBx2ZXluozbAyBYm6qfsWs9kSWidChMGIqH1arD9bh
	 ylNooRE4e458n2yZpRJkyxLZwr7GTfDyRdWLsSca4QnWK+zrakKw/+RGGIwi68flRPAr/
	 aTbRJOAPgaGSWd+Z6h1o2NEhY9/oKexiz4dxVuMFrTFHjAizC3Js8o8fjzwckHChLp7pa
	 GARt18Cr8Z+8e+BDSxdKeAHllhCk481Q6Rx19m7fP3i+ClhH0gLrebxFz1Nz2RKE97A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=Kw51llujKtjtA3SKefaHq9kBmSiGYUrzMtMtwCiFmeM=;
	b=PZFoTZsshUUdx01+59xBw4jzU0GSGTNh2gutmETEjo8C1y2Cs+UO/SxygwGaj+fYY65n
	 ya/bIJ2mglHO255ZAeFwb64gLmwuR4QVu+NLDPh064LLYAblV3oAghOlyh+xNGgA6v2q1
	 fDG/288YCY6VKrzFzbREkJ7RpVg2FBT2vH5slSoFZUaVZL2T52j/krWyUBEc4hMMEaaBP
	 lPBDIhVo6qGxPiWEWYIW4JF9ckieP/KBDtdBWK1Ou5GtNBzks7G4D9hT+oV/N2iq3sjk5
	 hl17Qi06IGbjxKUZP7q4PSkTxP3XLkj56eA28m3rJERVkZpUR4KjxdrWEXlL9IyfLKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TSYn1qSd;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DF606FE99
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 11:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56DF606FE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TSYn1qSd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827215; x=1826363215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qCwso2uQ2/62mGILc8ag51ow5Ts+a29fjoznxART+QM=;
  b=TSYn1qSdU54rL1gT9MnpeCDA++O7KUIiJ8+hWnocDKi3PbkmVRKMTBct
   Cb5kII/GrOFo5H2Zq3O0mrw9/UzaVwSZnw2JQMFB9V2bt4xXBwzUO4osJ
   J9bKfWIZUcRdO9gWO8KTJj0NWWdjpMuMlY92X9RrV0O7kGsOBWH0Pvjdw
   zA2yOryoM4D5e4/mpR++QrOwtOU6GklpM2RmbOfKya4qv8bUhIwKDUaqh
   eKD0SVb2V0PrA4+3COgJRRmHwlC+hzi5TZkhB5mitK5x9t80kAy2CDpnR
   5ougeap/ZHNa3SHV7DBJHZCSavPV8NzW5y/bzvJCelVPWDHu5mRLFa6+0
   Q==;
X-CSE-ConnectionGUID: gAvcyL6gRiuc4SlVWKaYFw==
X-CSE-MsgGUID: XP6/lV8VR2qsbOsOjD3lmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3453441"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3453441"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:06:55 -0800
X-CSE-ConnectionGUID: NMmGwipARqSecEOCB4XmEg==
X-CSE-MsgGUID: vjl5vvydRJK9sRaDY8XKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9592531"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:06:54 -0800
Date: Mon, 16 Nov 2026 13:06:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 11/12] drm/atomic/uapi: Make async flips a bit more
 palatable through atomic
Message-ID: <avrjyUtl78ZnXsAd@intel.com>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
 <20261116091130.13950-12-ville.syrjala@linux.intel.com>
 <sashiko-outbox-216633@kernel.org>
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
In-Reply-To: <sashiko-outbox-216633@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 16, 2026 at 09:44:58AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] drm/atomic: skipping all no-op planes breaks CRTC-only async
>   flips
> - [Medium] drm/atomic: stale FB_DAMAGE_CLIPS read in
>   drm_atomic_set_property()
> --
> 
> commit 64d10f48b65296ed20fc62e81d5d8b357f0e8b51
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/atomic/uapi: Make async flips a bit more palatable through atomic
> 
> This commit filters out no-op property changes during atomic async flips
> in drm_atomic_set_property() before duplicating plane and connector states,
> while still adding the associated CRTCs to the commit.
> 
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 7517950d2e515..87181aba14514 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> 
> [ ... ]
> 
> > @@ -1285,16 +1326,19 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
> >  		struct drm_plane_state *plane_state;
> >  		struct drm_mode_config *config = &plane->dev->mode_config;
> >  		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
> > -
> > -		plane_state = drm_atomic_get_plane_state(state, plane);
> > -		if (IS_ERR(plane_state)) {
> > -			ret = PTR_ERR(plane_state);
> > -			break;
> > -		}
> > +		bool is_noop = false;
> >  
> >  		if (async_flip) {
> > -			/* no-op changes are always allowed */
> > -			ret = drm_atomic_plane_get_property(plane, plane_state,
> > +			const struct drm_plane_state *current_plane_state;
> > +
> > +			current_plane_state =
> > +				__drm_atomic_get_current_plane_state(state, plane);
> > +			if (IS_ERR(current_plane_state)) {
> > +				ret = PTR_ERR(current_plane_state);
> > +				break;
> > +			}
> > +
> > +			ret = drm_atomic_plane_get_property(plane, current_plane_state,
> >  							    prop, &old_val);
> 
> [Severity: Medium]
> Does reading prop_fb_damage_clips from current_plane_state return the
> previous commit's damage blob ID instead of 0?
> 
> Unlike IN_FENCE_FD (which always reports -1), drm_atomic_plane_get_property()
> returns state->fb_damage_clips->base.id, and state->fb_damage_clips is only
> cleared to NULL when __drm_atomic_helper_plane_duplicate_state() duplicates
> the state for a new commit.  Before this change, drm_atomic_get_plane_state()
> ran first, so old_val was always 0 on a fresh plane state.
> 
> When current_plane_state is the un-duplicated plane->state from a previous
> commit that attached damage clips, passing FB_DAMAGE_CLIPS = 0 on a
> non-primary plane (such as a cursor plane) looks like a property change
> (old_val != 0) and fails the async flip with -EINVAL.  Conversely, if
> userspace passes the same blob ID as the previous commit before FB_ID in the
> property list, FB_DAMAGE_CLIPS is skipped as a no-op and then wiped to NULL
> when FB_ID duplicates the plane state.

Good catch. Damage clips should also be an ephemeral property so the old
value should be special.

> 
> >  			if (ret)
> >  				break;
> > @@ -1318,25 +1362,40 @@ int drm_atomic_set_property(struct drm_atomic_commit *state,
> >  				break;
> >  			}
> >  
> > -			/*
> > -			 * FIXME this is in the wrong place. Whether to do a
> > -			 * bypass commit for async flips would is a driver
> > -			 * decision. Drivers that want this need to just do
> > -			 * these checks themselves somewhere.
> > -			 */
> > -			if (old_val != prop_value && plane->type != DRM_PLANE_TYPE_PRIMARY) {
> > -				/* ask the driver if this non-primary plane is supported */
> > -				if (plane_funcs && plane_funcs->atomic_bypass_check)
> > -					ret = plane_funcs->atomic_bypass_check(plane, state, true);
> > -				else
> > -					ret = -EINVAL;
> > -
> > -				if (ret) {
> > -					drm_dbg_atomic(prop->dev,
> > -						       "[PLANE:%d:%s] does not support async flips\n",
> > -						       obj->id, plane->name);
> > -					break;
> > -				}
> > +			if (old_val == prop_value)
> > +				is_noop = true;
> > +		}
> > +
> > +		/* No-op plane property changes can be fully skipped */
> > +		if (is_noop) {
> > +			ret = 0;
> > +			break;
> > +		}
> 
> [Severity: High]
> What happens when all plane property updates in an async flip commit are
> no-ops (for example, primary plane FB_ID set to the current FB_ID)?
> 
> __drm_atomic_get_current_plane_state() adds the CRTC to the commit and
> set_async_flip() sets crtc_state->async_flip = true, but skipping all planes
> leaves the commit with zero planes in state.
> 
> On i915/xe, crtc_state->do_async_flip is only set in
> intel_plane_atomic_calc_changes(), which only runs for planes in state.
> With no planes in state, do_async_flip stays false:
> 
> 1. If the first async flip on a pipe is a no-op, uapi.async_flip becomes
>    true in crtc->state without switching the primary plane to minimal
>    wm0/DDB.  On the next async flip where FB_ID actually changes,
>    intel_plane_do_async_flip() sees old_crtc_state->uapi.async_flip == true
>    and sets do_async_flip = true, while skl_compute_wm() tries to switch to
>    minimal wm0/DDB for the first time; skl_ddb_add_affected_planes() and
>    skl_wm_add_affected_planes() then reject that and all subsequent async
>    flips with -EINVAL because watermarks/DDB cannot change during an async
>    flip.
> 
> 2. intel_crtc_complete_noop_async_flip() from commit "drm/i915: Complete
>    no-op async flips by hand" returns early on !crtc_state->do_async_flip,
>    so a no-op async flip falls through to a vblank-waited sync commit.

Right on both accounts. I'll probably need to make sure we really 
switch into async flip mode even when there are no planes in the
commit.

If/when we add async flip for multiple planes this might become an
even trickier proposition. We'll probably need to force the "first
async flip is actually sync" every time a new plane starts to perform
async flips, even if there are planes already in async flip mode in 
the same commit. I suppose we should be able to keep those planes
in async flip mode though, so as to not involve the "async flip
bit is double buffered on vblank" workaround that would cost
another extra frame to get those planes back out of async mode.

Keeping the previous async flip planes in async flip mode 
through that transition would mean that those planes' DDB
allocations must stay put (can't change those in an async flip)
which means we have to always reserve DDB space based on the
sync flip use case, and only use a subset of the allocated
space for planes doing async flips. Currently I think we let
other planes consume the DDB that the async flip plane won't
actually use, except on new hw with the automagic async flip
WM/DDB feature.

In the meantime I guess I could just add the primary plane into
the commit in the driver every time uapi asks for async flips.
Hmm, but the plane may be completely off, which would need special
consideration for setting do_async_flip. And IIRC the hardware
still won't signal flip done for a disabled->disabled transition
on the plane, so we'll still need the no-op completion path.

> 
> 3. On amdgpu_dm, a commit with no planes skips pageflip event arming in
>    amdgpu_dm_commit_planes() and falls back to drm_send_event_locked() in
>    amdgpu_dm_atomic_commit_tail(), sending DRM_EVENT_FLIP_COMPLETE with a
>    zeroed sequence and timestamp.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116091130.13950-1-ville.syrjala@linux.intel.com?part=11

-- 
Ville Syrjälä
Intel
