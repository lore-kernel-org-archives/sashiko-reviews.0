Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973DC471D0B
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039387; cv=none; b=hIUiNZZAV3jDXdHbQdj0anFsUKvdh1PgkawxKLJQ411L2gZhnV+hRzF/Bi5mGMdv0n4pEdWuWnhUHLNh/hYRJoZzhdy2RAR275B8vb+BKGrKTxSUisML3mO8HdSVdmxBqDgyV7APrgP2lV9yuSmFOLVL/oQYB+gWfNruzgVsyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039387; c=relaxed/simple;
	bh=Z9C/2srLh2sis/MGhlglEihl0ntMVdSE592nlKcBNss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxh2/ge1o00gbJYdnATrkprGoMtz2x6P4I0KvtStCE5Il3K7csN64T6asWx/rKkpg+K4jDgwRzWJAjRBBCtFj3mW/+gptD6ajAYs6nkBwvR0rIi1R8rvwAi4nr57xT4y0xVaEdx7cz0r447VJaFLWP8wvBt8mZk3D7lwSNwrhgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He7cVbDE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He7cVbDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789039385; x=1820575385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z9C/2srLh2sis/MGhlglEihl0ntMVdSE592nlKcBNss=;
  b=He7cVbDEGNafPPmJzD6XGzSpIVx2i7/aPKXBjI8uczW7zMT4Fg0TUsnm
   R/2joo0epWuqrxTaAG2YchrHoj7ypUgg1zjRugrgrzwt2yAi6HtR9OdQZ
   8953Li54FddXY34FDUoTgL7q/Eygmzqy4FUHstKHqqo28bISSa2b7J4DY
   O34FJgrS/bd6FfFboy8UpbDcBklpCa51pTmlKqh7CvDw8olyBiXOFWTD6
   ionQfAEj34P7GtmgHjZMRH7jwtEHiOIBc8nkphSbjUAvy7jEMI5u5Brdr
   WBJZr40dZgItWMfeF9pJpy0ZHszcZrz2mK/Avtnau5CilBoesImdu1zB4
   A==;
X-CSE-ConnectionGUID: CwsuepnsR+GsXIaj41SmSw==
X-CSE-MsgGUID: r6LBL5kgSu+YemgRn9iaig==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89697760"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89697760"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:23:05 -0700
X-CSE-ConnectionGUID: yewCGyUhQKq8/W926Befpg==
X-CSE-MsgGUID: rKewsaTXSvm0HoJXv9MrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="309850667"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.238])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:23:03 -0700
Date: Thu, 10 Sep 2026 14:23:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 12/13] drm/i915/dsb: Add tracepoints for DSB commit
Message-ID: <aqKTFanaLavoU0DN@intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-13-ville.syrjala@linux.intel.com>
 <20260909163450.000EE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909163450.000EE1F00898@smtp.kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Sep 09, 2026 at 04:34:49PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> > index 8e01e1eed291e..299d778520a22 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> [ ... ]
> > @@ -1124,6 +1127,8 @@ void intel_dsb_irq_handler(struct intel_display *display,
> >  		spin_lock(&display->drm->event_lock);
> >  
> >  		if (crtc->dsb_event) {
> > +			trace_intel_dsb_done(crtc, dsb_id);
> > +
> 
> [Severity: Medium]
> Will this lead to unbalanced commit/done trace events for background updates?
> 
> The trace_intel_dsb_done() tracepoint is conditionally called only when a
> userspace vblank event is present. If a commit completes in hardware
> without an associated vblank event, the irq handler will skip emitting the
> completion tracepoint.

There is never a commit without an associated vblank event. See
drm_atomic_helper_setup_commit().

-- 
Ville Syrjälä
Intel
