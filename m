Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032891;
	b=zJBoNJe/U8eDuv1xAwW6hKWfLn7wJlI9E0DS+GTNH/xZ5OkC1px7900onkYbhIq5NGPd
	 CbI0ZnDkHQ7MdNg0m4UCyORSgFye7k80g5dR/GEHj54JfLLRIIHG6DTpqMpRXg11IJXin
	 IDUgI2hn6jxD5btGxsRaKR2UhGuwlPwSixBejiRc4MnxbhBJap/7v75aLpNY8iTJVbqCt
	 EAj9QSFPp00GUvE8QU4fIfNkfAUQCS653BeEH/OpS5w4QtEqnvxIBkQws7GhQU+4lfn3Y
	 HnNded5zfC+f/d2NDw9xjyPm3xTfajBJdyPvlK7vJ8N4LTvOn1jNqVsasIkIumq9bRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032891;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=vfJsDbkDITf6JkaA3B62RxkVzwP30G9ZEb3qTDUX7PU=;
	b=Oryg/YL5ZHRlDW2pAtf7by3RC0meRMQDdxGqtqBOYPOZ509jZH0I32uu7Jl5cNDuGNmY
	 9lAJdaUrPHwSzfw/EF1M2S+zZVxHkTNKDwIi148BqqbhPrTraGCBiD6zAINopbCrk8tB+
	 lzoQNuugErk8ZX1kt9Tkrwc3UTMP6WrAVQ2V1sMuw3QBoUm6VizH2XnbpRvPNLChh8XWa
	 tUrNdVcj2sCIu3gFpfJ8VsLXcxx0yXjnrGAujCpGSUX7Re9gONgAYHYdm6uxLQBgZ/Gz+
	 vrqMFePrOKmiPIALY4byoT8SiIti24hqdcBtrK1NtPbd0nqb5ObWCXRYm9EiZzWg8RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtRsFGJv;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84A60A260B
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 20:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA84A60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtRsFGJv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795032890; x=1826568890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RP/rxU3ZKK4+PWUMexH2Rkf1hN/LVaO2jAvDZBkGsSY=;
  b=JtRsFGJvM7nt1X84Ypb3orfpX2HMz5Kr9jPp5TUQ3zviaySxyRDNXIHN
   hU4jmh1Ig9vHHgPcmTm0Vv7wGJDvMkJfm0AbIGPuLLnlV4NrJou/q2fkq
   qoQEgcEocI2X5lgYeW2SMfusEVUYRrGdcVSk6hNfdLoiynTtRYZlp4z1v
   NcIVyLxw9HzUREpZPV5bAmwTJ/Uz32t9ox9gu3cB+Q99R5AB1XzEAWU0M
   gIJWYrRmETkgZ23SNR4ZOIycz0oW7eMPUfWAPPQj2h1YxLH8v7mrlu1gb
   yt7ik8r6On7ava8cVciCMTd/c9Y5cYkBlMVkJYemiQZI/zyQR8EYbuqGT
   w==;
X-CSE-ConnectionGUID: pKxZEh67Rc69M9R3qNssBA==
X-CSE-MsgGUID: u1muUxK9TqC78lcJXg0jwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3887572"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3887572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:14:49 -0800
X-CSE-ConnectionGUID: vrk2ifOdTFCUBhm7FNdYQw==
X-CSE-MsgGUID: WZOH9ng3RGyX1TawEwOguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10455274"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:14:48 -0800
Date: Wed, 18 Nov 2026 22:14:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 5/6] drm/xe/display: Remove duplicated code
Message-ID: <av4HNDaMwb6UShP2@intel.com>
References: <20261116122828.266113-8-dev@lankhorst.se>
 <20261116122828.266113-13-dev@lankhorst.se>
 <sashiko-outbox-217026@kernel.org>
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
In-Reply-To: <sashiko-outbox-217026@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 16, 2026 at 12:56:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/xe/display: spurious drm_err in initial_plane_bo() without
>   stolen memory
> --
> 
> commit bab2c79797477724bcda99b81e670f98a25a3bee
> Author: Maarten Lankhorst <dev@lankhorst.se>
> 
> drm/xe/display: Remove duplicated code
> 
> This commit moves the GGTT PTE read and local-memory bit check out of the
> discrete and integrated branches in initial_plane_bo().
> 
> > diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > index 451c24a4ed8d5..1366b68f43fc2 100644
> > --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> [ ... ]
> > @@ -58,16 +58,14 @@ initial_plane_bo(struct xe_device *xe,
> >  			page_size);
> >  	size -= base;
> >  
> > -	if (IS_DGFX(xe)) {
> > -		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > -
> > -		if (is_pte_local(pte) != need_pte_local(xe)) {
> > -			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> > -			return NULL;
> > -		}
> > -
> > -		phys_base = pte & ~(page_size - 1);
> > +	pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > +	phys_base = pte & ~(page_size - 1);
> > +	if (is_pte_local(pte) != need_pte_local(xe)) {
> > +		drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> > +		return NULL;
> > +	}
> >  
> > +	if (IS_DGFX(xe)) {
> >  		flags |= XE_BO_FLAG_VRAM0;
> >  
> >  		/*
> > @@ -85,24 +83,13 @@ initial_plane_bo(struct xe_device *xe,
> >  			    "Using phys_base=%pa, based on initial plane programming\n",
> >  			    &phys_base);
> >  	} else {
> > -		struct ttm_resource_manager *stolen;
> > -		u64 pte;
> > -
> > -		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > -		if (!stolen) {
> > +		if (!ttm_manager_type(&xe->ttm, XE_PL_STOLEN)) {
> >  			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
> >  			return NULL;
> >  		}
> >  
> > -		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > -
> > -		if (is_pte_local(pte) != need_pte_local(xe)) {
> > -			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> > -			return NULL;
> > -		}
> > -
> > -		phys_base = (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);
> >  		flags |= XE_BO_FLAG_STOLEN;
> > +		phys_base -= xe_ttm_stolen_gpu_offset(xe);
> 
> [Severity: Low]
> Can moving the PTE local-memory bit check ahead of the stolen memory manager
> check cause a spurious drm_err() on integrated platforms without stolen
> memory?
> 
> On integrated platforms with has_lmembar(xe) where XE_PL_STOLEN is
> unavailable, firmware can place the initial framebuffer in system memory
> without XE_GGTT_PTE_DM set.

Never happens. The firmware framebuffer is either in stolen or local
memory.

> Previously, initial_plane_bo() checked
> ttm_manager_type(&xe->ttm, XE_PL_STOLEN) first and returned NULL with a
> drm_dbg_kms() message, as added in 1d2a6c96f6f7 ("drm/xe: Print a debug
> message if we have no stolen for the initial FB").  With this change, it
> logs "Initial plane PTE has bad local memory bit" via drm_err() before
> reaching the stolen check.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116122828.266113-8-dev@lankhorst.se?part=5

-- 
Ville Syrjälä
Intel
