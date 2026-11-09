Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227313;
	b=LaED0rL8t5/6+UW3Aqs/Th3rZfmQSbUIx9MJ0C9V5Tre/F6ARK9Igpm0OIzBaHS2fGxP
	 FN/oNR7C+nv4Dn2zD1voqdZ6uUsOH4oet+ufatBOdBNHb1s4WmnkliREVGFkhI7xoBxWB
	 xRFMt6SvodvQq3/NSdew1/hig6Fz235mDLpd7d0GOwh9/MMjHpo0bp1LU6TL7yS+XYorn
	 MeqrBQjprymBBWMsxQbC86uQZSMr6B1roQss/tp1dOLcVvpEEe3ZgGWnb8j0cwOHGY8Gf
	 xS8FJcrVON3gb7tPHBg0GjI9jgQ5jzZ9iqw6aPSKj6zdpurD/rPizPGpA4/Fs3NBgDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227313;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=xoF1P9G5WXT87H0pZV4NIMLWo/wgprLcTPKBhi/rVeY=;
	b=Hf5ZoQrrRIcsbx+XYxuwOHhjILXpjVNdTApDEM2VIxtz6/qk2pRBQm/BTRwygv8sd3MB
	 PuOCsVTeUqYa7VfCchckJI4/7PpBHTrxcfu/wSzA8sb7yVSXhhfQ5krv6MbU61pM7AuBR
	 FulOAyEEwp18DM/z8dGtWZBD+ArLNWVOhyW/6ceplOYSarfjriBdGZsXqklJH9UFAD6Yo
	 zEnt2uacPQ9pALe8Vvod5UvwJGc9E20WYIgcAWZGx75x0+qriqTSm2m9Xs86unv3DLRrG
	 fTBSKuabWG+zib1Ih2ErWN3O2oZEDD75m/hFRu08f+Qlq3UnvvSJW1wN3Nc3eSrnaLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YyeifZVe;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7F0606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 12:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YyeifZVe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794227312; x=1825763312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LmETJpGMgjLjr8Im26YCx3N//D7EYImpYh6xeVHum14=;
  b=YyeifZVebAMUMHU/wVl5tolLjO3uGHF+wvioPf3J6NzK5wdDndsWCCzy
   JvyQsoWGILIJCjO3wDdwe7tVFDGHgdggGDsfy0hjv2dLx6IaKiVjBxof9
   1otXXZSy7t3gds9hYSzbJa61yFiv0mA26Bz4o+NJ89wgFNAGiYWzet5ws
   guSrjbxGVhpLCO9IC7maoUVdCF7wPB7KhY8BFb+xR5kwLdjSdajRTPbnL
   38exdY9zJMv4YVxqEApu9ol3Xc/RNFfTIP1hxvnh4wZ5XtYOE23eNWvcN
   YAt2ehXvAdSLuLU+8lQaH7yHGCgqzPfzMxo1WK5Nk1S3RKAXXIrRJ0Qxe
   A==;
X-CSE-ConnectionGUID: grPvPEZ+QbarUDFXfrCfbA==
X-CSE-MsgGUID: UKSU3O2fT42AAwmjZuFzdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2824468"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2824468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:28:31 -0800
X-CSE-ConnectionGUID: 4s5bagvTQa6BAYW/kfDA1Q==
X-CSE-MsgGUID: Q7yj2/jkSrmsNHjTxqZhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8178997"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.135])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:28:30 -0800
Date: Mon, 9 Nov 2026 14:28:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/xe: Use intel_display_gse_irq_handler()
Message-ID: <avG8a-CkptBuzQir@intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
 <20261109114554.19597-5-ville.syrjala@linux.intel.com>
 <sashiko-outbox-204904@kernel.org>
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
In-Reply-To: <sashiko-outbox-204904@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 09, 2026 at 11:51:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/xe: call to undeclared and undefined
>   intel_display_gse_irq_handler()
> --
> 
> commit da9b4f3b875bfbf33a72170de1fb2c018547566b
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/xe: Use intel_display_gse_irq_handler()
> 
> This commit replaces the direct call to intel_opregion_asle_intr() in
> xe_display_gse_irq_handler() with intel_display_gse_irq_handler().
> 
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> > index 21692408f9be0..0236f69a0f883 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -220,7 +220,7 @@ void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
> >  		return;
> >  
> >  	if (gu_misc_iir & GU_MISC_GSE)
> > -		intel_opregion_asle_intr(display);
> > +		intel_display_gse_irq_handler(display);
> >  }
> 
> [Severity: High]
> Does this break the build when CONFIG_DRM_XE_DISPLAY is enabled?
> intel_display_gse_irq_handler() is neither declared nor defined anywhere
> in the tree, causing an implicit function declaration error during
> compilation and an undefined symbol at link time.

Your baseline is too old.

-- 
Ville Syrjälä
Intel
