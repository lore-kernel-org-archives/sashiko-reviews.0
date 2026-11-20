Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191425;
	b=ez/7o0JLh7Z5bcZe79L/3zj+SqSgdtumNN31oDxXe/RVucRgW1hgW/X2iy27GylDwvsi
	 vzX8Nz/qnzRF/mxr47OodPmXeRXm4Xj5NcT8GM+dpQG18Q7Iy5wzBvmCHE9Ybwh4gSgJR
	 Lmijjm13zbI2xwdQ6Lfl4uOAXQP8lQc4g82hgBIuadhMFbiB26FaCj4C0PQlelv+UuhIt
	 EKLJexhrY2gPuwOTU/rS56d7iAa46eaqiQFuwe9Ywa5TIkm6qf+qwLdAsijq5DaOMb0qt
	 6ku/HLAKodb5sVYmV+TDMSDHSUl9ceO6zWyIFjJKCVGCXe90w6FBTgBPMqd433+ew2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191425;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=bLc2513g3SIaCrKt5HhKDMvQKHA697Ieb1XyQKkG8Tk=;
	b=g8thughZGNEcmFse66fyM82azmlYIuqY/35Fxgb0XZXMPJvqx3FcA8s5P5iH3SzcO01E
	 LJJZiw/tSIslgszickE9i1dWP4BSwRrZ7buMaktpKSJInwPO9a8WuT4o5ZMDlF6+Pqk59
	 epWn9S5kiiiLJ+Qe6BatFboNQqmhVVeTU5ZwjcI/agl24alV/Ep5Awg6ibQ/2nx+rQtqn
	 remedMJQS6UuG4CDOVMaF1Zz/Co+wgPt189aMuHyU/PUi/9f9B1sgu6glvPsNR+EY5Phz
	 HvagU6nMgxlvHDPyPPRBOjtk85Wbs+Q3aVSMZgAFJG1NDiCKd8Beid83FyP0alIjSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="A02w0/yV";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C083606A32A
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C083606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A02w0/yV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795191425; x=1826727425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rsJkdZh9qMrhyoYDJubmBzmgkJTyz5MGrGp1lbNyCTo=;
  b=A02w0/yVGyNIfpmnZNibTNZQOnqnrYPc9BoOFmg9evnKVyOAdvBXe1fb
   LB6jIEvC9rxotUqdy7fvHcQo/Ftk+Ti3lGjxtork5Kb3sZwlBGo7jX7lq
   sDeJ4U5GcjKUZpeZwSnipFSXPNqHAtTdIGnmuUFCNgnbPJ8cOdEFSSj97
   tdDdRIADWUH10J5xsYTriU5YSDYfTmSTm3eqQ+X5Ojs0rVIt+iQysZU5M
   iQruMx/XN4w5yS6WiGlVVky5H08jB+fXLphK9cBLEVhrLLRbREGDwjteO
   60hllxkgvMj7eJOgIX0+B1tC8CQiH6YRsjilYEbNdVzIWNlEgeViNVP6a
   A==;
X-CSE-ConnectionGUID: DWhNXKILRGaIEHIr4BwZmA==
X-CSE-MsgGUID: hZsO6AwcQqqKrdNtbkStJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4065308"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4065308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:17:05 -0800
X-CSE-ConnectionGUID: QRQGQN7sSASUmPaw0llw3g==
X-CSE-MsgGUID: V2hdNP5qTUCJJydkPDRPSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10677360"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:17:02 -0800
Date: Fri, 20 Nov 2026 18:16:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/i915/de: Make mmio_debug lockless
Message-ID: <awBye5pEqpnsrpzl@intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
 <20261119205040.31935-5-ville.syrjala@linux.intel.com>
 <sashiko-outbox-224079@kernel.org>
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
In-Reply-To: <sashiko-outbox-224079@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Nov 19, 2026 at 08:57:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/i915/de: intel_de_arm_unclaimed_mmio_detection() logs
>   invalid mmio_debug=Y
> --
> 
> commit 61affa910ea8da633b71cb74783032c77e14188a
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915/de: Make mmio_debug lockless
> 
> This commit converts the unclaimed MMIO debug tracking from lock-protected
> read-modify-write counters to lockless booleans, while keeping the
> mmio_debug module parameter as an int for compatibility.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> > index 17954963ddf98..82ed1c6a55c96 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.c
> > +++ b/drivers/gpu/drm/i915/display/intel_de.c
> 
> [ ... ]
> 
> > @@ -286,43 +287,36 @@ bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
> >  	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> >  		return false;
> >  
> > -	spin_lock_irq(&display->mmio.lock);
> > -	ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
> > -	spin_unlock_irq(&display->mmio.lock);
> > +	if (display->mmio.funcs->check_for_unclaimed_mmio_needs_lock) {
> > +		spin_lock_irq(&display->mmio.lock);
> > +		ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
> > +		spin_unlock_irq(&display->mmio.lock);
> > +	} else {
> > +		ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
> > +	}
> >  
> >  	return ret;
> >  }
> >  
> >  bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
> >  {
> > -	bool ret = false;
> > -
> > -	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> > +	if (!READ_ONCE(display->mmio.unclaimed_mmio_check))
> >  		return false;
> >  
> > -	spin_lock_irq(&display->mmio.lock);
> > -
> > -	if (display->mmio.unclaimed_mmio_check <= 0)
> > -		goto out;
> > -
> > -	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
> > -		goto out;
> > +	if (!intel_de_unclaimed_mmio_detected(display))
> > +		return false;
> >  
> > -	if (!display->params.mmio_debug) {
> > +	if (!READ_ONCE(display->params.mmio_debug)) {
> >  		drm_dbg_kms(display->drm,
> >  			    "Unclaimed register detected, "
> >  			    "enabling oneshot unclaimed register reporting. "
> > -			    "Please use i915.mmio_debug=N for more information.\n");
> > -		display->params.mmio_debug++;
> > +			    "Please use i915.mmio_debug=Y for more information.\n");
> > +		WRITE_ONCE(display->mmio.mmio_debug_oneshot, true);
> >  	}
> 
> [Severity: Low]
> Should this message suggest i915.mmio_debug=1 instead of i915.mmio_debug=Y?

Ack. I forgot to undo that change when going back to the int.

> 
> Because mmio_debug remains an int module parameter, param_set_int() rejects
> "Y" with -EINVAL and prevents the i915 module from loading when a user
> passes i915.mmio_debug=Y on the command line.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261119205040.31935-1-ville.syrjala@linux.intel.com?part=4

-- 
Ville Syrjälä
Intel
