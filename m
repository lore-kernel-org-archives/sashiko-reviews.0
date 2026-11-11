Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400773;
	b=fFmhcr5tGICkUrY5Oc1FRUJjUicsXpelT794K1PpPi7w/fXzNCOYFn3ThS3tNpRF0qEm
	 5wonrZBeMYT5QxsAC7pQjA09U/8dQhHjYgIxDv2ZKsvhugEOgrJYHFOgBwKxMcNm9meHs
	 bghxtUlqhpYHuY1cZE1hFvuF7YeEYCPsbU0G02xgXlTx8j29/bDAAdbYknJYAvwgEN08H
	 d/GovFyFgzyoSdbHAX/CLQZD4f24QiX+/Saqc/zIwSGy8c5KAfHiLj0CoAhcCOZf/fJbi
	 jYKml0UKNCqjUpt9fl8kixZuxUE2KCghvR3ogvW6yltKLXbjp6M868z96un8mbxbSXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=Yeu4oWsBk8CIpUgsvkNj9DJV1J5e+VXRMbgANWqffgw=;
	b=DCSo0W/GOBlHBlz4PrAQbQyiie4JdJvZ4kQhP3yGhOI4KVU3mgUKX42P/wqk2KlNgPtO
	 +S6XyfhEePi+XXv1UuhnOn0HL7nCwGekNRR3k1l7PosUV25vvO+VNYVSvZFDikE7oRF30
	 eujhctUEAZV27FzViFAzUM/mO59x4PvrYgoS9l8XvyzKzuF8BL85z5yozWhw6cqnE8EBG
	 rzUED+OoKDPiEjkHGgsjQ564CE0W4RX7ablf0njeZgQADhIC0aK7eeHjLNTOOH8sMbJZ/
	 rnEMSPduvcs3BMMTJwyUDjk96i6X2NfI/rtQY0HULX4azoSNCLiY4L9ukZHFBT7T07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YMMItjn+;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A3606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YMMItjn+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400773; x=1825936773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=grBxa0NUtC5bERIvoQ5jPW8d/jQtYdKDGq7rJ7f68ns=;
  b=YMMItjn+9uj/rdqEQGDzOJAH6xkDLacMwTE737bGL1aLFfODJctVMHvK
   ADxXMbgel3zg2mWTkVueAgIN/bf4TsOG6QlHl7QPi6j7VwrNZphl6Uujv
   g9xJeWwop/asyguLJ3ZsMlKUlXSz2ZIrXhiQBVImrw447k06IRJw8wWN3
   8MPOcH0CkErDOCpd9hzxueGL2zyyS2Z1pIhil44ng4UC9D8ciGY5bawM3
   Q1Jwa6Z3UOV41L+axXpomeqxTLdDrJzTcx0BuzixAAvyZhpBoqZUFX2vE
   3X+N/ljgIFgux7aotNy6FcVjTpS8+jxvBeCXwMzEkFaPQgJylj0+pWt68
   w==;
X-CSE-ConnectionGUID: H/sZCiVTSy2WpxTIoPLcPg==
X-CSE-MsgGUID: PyDxRf5LT1Wb26G2YI1wlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3192117"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3192117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:39:32 -0800
X-CSE-ConnectionGUID: G6ZJNYzOQtucNSojye1SrA==
X-CSE-MsgGUID: fue2UZDwS2+3f4+YW5bvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8585926"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:39:31 -0800
Date: Wed, 11 Nov 2026 14:39:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/13] drm/i915/dpt: Compute DPT size in the DPT code
Message-ID: <avRh_5mkErMktGqN@intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
 <20261111112007.16790-7-ville.syrjala@linux.intel.com>
 <sashiko-outbox-208882@kernel.org>
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
In-Reply-To: <sashiko-outbox-208882@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Nov 11, 2026 at 11:31:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] drm/xe/display: double BO unpin on __intel_fbdev_fb_alloc()
>   error path [1]
> --
> 
> commit ae1435739339ed58396679163558aae13db1d253
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915/dpt: Compute DPT size in the DPT code
> 
> This commit passes the GTT view instead of a precomputed size to
> intel_parent_dpt_create() so that the DPT code computes the DPT size for
> both normal and remapped views.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> > index b3344e3f187fb..35f1d5dd31d7d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > @@ -2275,13 +2275,15 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
> >  
> >  	if (intel_fb_uses_dpt(fb)) {
> >  		struct drm_gem_object *obj = intel_fb_bo(&intel_fb->base);
> > +		const struct intel_gtt_view *view;
> >  		struct intel_dpt *dpt;
> > -		size_t size = 0;
> >  
> >  		if (intel_fb_needs_pot_stride_remap(intel_fb))
> > -			size = intel_remapped_info_size(&intel_fb->remapped_view.gtt.remapped);
> > +			view = &intel_fb->remapped_view.gtt;
> > +		else
> > +			view = &intel_fb->normal_view.gtt;
> >  
> > -		dpt = intel_parent_dpt_create(display, obj, size);
> > +		dpt = intel_parent_dpt_create(display, obj, view);
> >  		if (IS_ERR(dpt)) {
> >  			drm_dbg_kms(display->drm, "failed to create DPT\n");
> >  			ret = PTR_ERR(dpt);
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but can failing in
> intel_framebuffer_init() after intel_bo_framebuffer_init() cause a double
> BO unpin on Xe when called from __intel_fbdev_fb_alloc() [1]?
> 
> In __intel_fbdev_fb_alloc(), intel_bo_fbdev_create() allocates the BO via
> xe_bo_create_pin_map_novm() with XE_BO_FLAG_PINNED set and a pin count of
> 1, and xe_display_bo_framebuffer_init() only takes a reference without
> pinning it again.  If a later step in intel_framebuffer_init() fails and
> jumps to err_bo_framebuffer_fini, xe_display_bo_framebuffer_fini() sees
> XE_BO_FLAG_PINNED and unpins the BO:
> 
> drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_framebuffer_fini() {
> 	struct xe_bo *bo = gem_to_xe_bo(obj);
> 
> 	if (bo->flags & XE_BO_FLAG_PINNED) {
> 		/* Unpin our kernel fb first */
> 		xe_bo_lock(bo, false);
> 		xe_bo_unpin(bo);
> 		xe_bo_unlock(bo);
> 	}
> 	xe_bo_put(bo);
> }
> 
> When control returns to __intel_fbdev_fb_alloc(), error handling calls
> intel_bo_fbdev_destroy() -> xe_display_bo_fbdev_destroy() ->
> xe_bo_unpin_map_no_vm(), which unpins the BO a second time, triggering
> assertions in xe_bo_unpin() and underflowing bo->pin_count in
> ttm_bo_unpin().

Yes, the xe pin_map() stuff is broken by design. I've mentioned it
before, and I think the correct way to fix it is by making it a
custom object type in xe, and have the object destructor itself do
the needed cleanup.

> 
> [1] https://sashiko.dev/#/bug/linux-227b0044-5f2a-4c7c-81e6-93b67cb4f477
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261111112007.16790-1-ville.syrjala@linux.intel.com?part=6

-- 
Ville Syrjälä
Intel
