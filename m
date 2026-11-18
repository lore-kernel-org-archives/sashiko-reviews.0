Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041018;
	b=tw/8jbUyRvYiwy04cVgq55ug2xz/BNbvIezxwyVpDmsOag+jvzcfUBXQDLa9Q4iEeM8F
	 DLuY5UKchKnS0LsMIX4Z90Ts+OqsAXfKGXo50w/ryQcYhn1OBmnjVtLbQTmz+vZBPetu4
	 Qs7E6iV7XZLbm1HUWg9UHVLsBQ+quRLExiYro5Ys4wj8DuHVEXGUc405XXcPGwykEU4jv
	 Q2yFKVFZOEOHtt2jvLspPkXtyd8lRTq6wGWLp6fTotxU05V6UsNsNT0TgBF343KslA80B
	 6zqSuqCDntyMK+kzPT3hUh4JH3r654m2GHUShqCtDR7k4knKViZjoNtHZk3WEZmbEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041018;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=eu8LgQe+6uxVqeBq/iLOjKSJ8VTmlFlDKtjKOiC0cQI=;
	b=WPhgJBNSKn3lTLkHzTHXKP3stbaV/R4Ggss6rrZf/RdBwSHkSFxwEART17CsNatBdfde
	 lzw2g+ab7fJYoN6oXUJNdJTUO1P8gYQWStVIRAVFCwHINSo7vZZvl3OPqIivddnx/n45a
	 OPytzjibXwoqu6CWxbJx3i9mLIZslNqEmgypQJ7NwW/iSPSg3TwxyNo2/mnYhEIOnIjI8
	 Bhjmuozuf9Cuol6IAt66sKErG4fI/1erZwsYo2hAepKePg0Ud78NYkOOAo+rQfUaUj5Ii
	 WoxYA3KvQMLEg0P0PqDiYt/YMZXxmtrmp3tmfXoLnvS/5g/BHauD3nmUrdJKtaUrKGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vf4k2Iib;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE565606A332
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 22:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE565606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vf4k2Iib
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795041018; x=1826577018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ocEOxHCjUhjEJmQBGAqGWjok2uOvMot+WMkADqoKh4c=;
  b=Vf4k2Iibfm1e451i+/6EkrF1BI4/L9h92tTa+Xl7AXSUwu+e2R038vKW
   H3eM6kMTYfltjBsXE/U8a0NJb03/K9+Vq1io7pIP1m/7shY8vzLWdC7MC
   AGhf9hvYnJCptRLK3/KUaZocNy9pDA6sDuuR0QEXY0rJy9qBT6t8x2Nu1
   bL/wr/K9GivV1eB7D3s8eoQEc7oePj5z9t9DvQ5H8q6QVpGxb/2VL57zl
   g1WchEBd6nqImtl0mekLCDiGgrnD4btk81akloKFbq4XIv3Sy9PVnwPW7
   Oz50Ut+DIkOvREgYO8poW9VAT2erpB5LUL4GMezl364kuBVtA4umKcwnI
   Q==;
X-CSE-ConnectionGUID: SUHkqo0BSM6Zn2PctH8glQ==
X-CSE-MsgGUID: 0mWGRng3SreyGjKOpDBwiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3761562"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3761562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:30:18 -0800
X-CSE-ConnectionGUID: R9wJBnM6QC+cEolqJxOFNw==
X-CSE-MsgGUID: pm4VkU3BQrWx4621eXC6Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10064331"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:30:16 -0800
Date: Thu, 19 Nov 2026 00:30:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 15/20] drm/imagination: Allow build with COMPILE_TEST=y
Message-ID: <av4m9D2pDH9ufbcM@intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
 <20261118214518.29317-16-ville.syrjala@linux.intel.com>
 <sashiko-outbox-222063@kernel.org>
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
In-Reply-To: <sashiko-outbox-222063@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Nov 18, 2026 at 09:58:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/imagination: COMPILE_TEST build failure on 64-bit
>   8KB/32KB page configs
> --
> 
> commit 3a0a5d98906b6758538e2c13acfa780422a1a949
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/imagination: Allow build with COMPILE_TEST=y
> 
> This commit allows DRM_POWERVR to be built on any 64-bit architecture when
> COMPILE_TEST is enabled.
> 
> > diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
> > index 1fd4c635c2c96..a048d3c859385 100644
> > --- a/drivers/gpu/drm/imagination/Kconfig
> > +++ b/drivers/gpu/drm/imagination/Kconfig
> > @@ -3,7 +3,8 @@
> >  
> >  config DRM_POWERVR
> >  	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
> > -	depends on (ARM64 || RISCV && 64BIT)
> > +	depends on ARM64 || RISCV || COMPILE_TEST
> > +	depends on 64BIT
> >  	depends on DRM
> >  	depends on MMU
> >  	depends on PM
> 
> [Severity: Medium]
> Does enabling DRM_POWERVR under COMPILE_TEST && 64BIT break the build on
> 64-bit targets with 8KiB or 32KiB pages (such as sparc64, alpha, or 64-bit
> mips with PAGE_SIZE_8KB/PAGE_SIZE_32KB)?
> 
> drivers/gpu/drm/imagination/pvr_mmu.h defines PVR_DEVICE_PAGE_SIZE as
> PAGE_SIZE, and drivers/gpu/drm/imagination/pvr_mmu.c only supports 4KiB,
> 16KiB, 64KiB, 256KiB, 1MiB, and 2MiB pages, failing with an #error on any
> other host page size.  Should DRM_POWERVR also depend on !PAGE_SIZE_8KB &&
> !PAGE_SIZE_32KB (or restrict to supported page sizes)?

I suppose. I might have to install a few more cross compilers and set
Claude to work with them.

-- 
Ville Syrjälä
Intel
