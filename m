Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725901;
	b=cPHOt3kVZkJ8smlJjeQ26ytFa52edvth5eWdDmUIZ3/LIm3asSYvdFsYQBceAlBFDwjc
	 GZrTjPJ1gITLSFjNqfSkdisuCdrTOU9sByE4aYwRjkKJlHDRv8vmM3OdikebhdhnzMl/1
	 TNn6bv9Y8mTzxjHvgEJ76jR1GzvahSQ3gfaQdEobX9sMCqQAOHyQpiGB7CHD8cNcxBCap
	 0BW7FoB+KUjH1Cr5JI86uQK5QCNAfgL2v71uYfPuG5hMIhZnREDuAte9CIcmz8ZK8dRot
	 YaCciL5XIypk02gGFzJsyQuVLew5A2jAotSS2YbFq+LAkDzu6pxvBw2Elz7qPGE5vxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725901;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=ZtcdwHMpDGMWv0H3NwsrmbaIS/nGthqYoowZYVaPd7s=;
	b=xiNA56M7uq+ZTk+yxvd931vktv1naeC1wo7Rg+sDEttbP6vfngUWrKhdkolUSdtvSixR
	 OjG8j3HmOipRNZbQQPSEv2KyQeDVMFqeoNSgxV25Kspd5tJXqVGvM9RwDhpvzSeqggmHM
	 p90qarxKPIelAtiZJ/JOUvOoWcpi2EWrdK34TnfJA4y3CsHMNG4OXW3VCs1U3DFQW+Fgo
	 0y1ogD6ZPfBAeLHqssV33ssxpxJAPSwyVIU2fl+CJNdImxqGXZkWd0x3IMZrFCCnhxS1w
	 pBwS7Ql0mSB6IcgKhKytRvWw0gflYpZNFy1D5p93iyhHJ0Bt1BNDcDQaaTLuHNZ6V2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="dGQSL/xr";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F9606A329
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 17:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7F9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dGQSL/xr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793725901; x=1825261901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CjpixaBix/pua7fjqohEmpq86pzXz468uk/AW/PT3JI=;
  b=dGQSL/xryTvcivp5gtAuJRYLcS+uUWlw+mneowMvhhuvbtmbSXUtX7Bm
   ud6y+DZ/mquBqOjSzCU96FU7BA4I5xCFmDyyerD/2CSsM3fB8LhFJML+H
   Acuw8c77qUAG2QTb1VfpGsoPjzxBGFubXHp6uMO+qQtCTzpWxSX6qf5b+
   6m87y8yiwacae3YBng1noleTnKtL7Rh/CRLClNCDn3mbYd2UvNqmxSnYP
   3aY8HKWRQdlhTY7h07uKL9Hg61+BWrpkhnGgpNMHqV6fwQaNKZlnD2+l0
   NML7hkDzwg+qABh35W5Lz88ch+FegZKP2LH5qCFneSHI13BMzJ+aoMUro
   Q==;
X-CSE-ConnectionGUID: 8pqQ6GWvRFKi8tYF+Oi4AQ==
X-CSE-MsgGUID: 0htMzkrXRRy0kGI09MueOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2456404"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2456404"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:11:40 -0800
X-CSE-ConnectionGUID: 0CWh79sxQQm1faR4JnCN0Q==
X-CSE-MsgGUID: tj4reW5GTxyz4lbAe+r+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8256618"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:11:36 -0800
Date: Tue, 3 Nov 2026 19:11:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com,
	louis.chauvet@bootlin.com, dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] drm/vblank: Restart enabling vblank timer on possible
 deadlock
Message-ID: <auoVxgQ0D1-6QEDD@intel.com>
References: <20261102143919.1672293-1-tzimmermann@suse.de>
 <auioL8zR9O5u4TCF@intel.com>
 <4212140f-fa07-4f0c-bd3a-0ae3d88b250c@suse.de>
 <aujFSzHEv5pAfHPf@intel.com>
 <ec9020b5-28bb-45a5-89d7-e64e804769de@suse.de>
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
In-Reply-To: <ec9020b5-28bb-45a5-89d7-e64e804769de@suse.de>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Tue, Nov 03, 2026 at 04:55:34PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.11.26 um 18:15 schrieb Ville Syrjälä:
> [...]
> > But what I'm thinking is:
> 
> I've ran a lengthy session to explore various solutions.
> 
> > - stop with the explicit cancel entirely and just rely on the
> >    timer cancelling itself
> > - try to start the timer in vblank_enable(), and if that can somehow
> >    fail because the timer is still running it should be fine because
> >    the self cancellation should anyway have been aborted
> 
> Having an old vblank timer still running while enable_vblank sets up a 
> new one can mess up the hrtimer's internal ordering. It's full of subtle 
> bugs, according to my LLM.

The hrtimer code looks like it's designed to handle this. It
first removes the old queued timer and then inserts it back
with the new expire time. And there's also locks in there.

> 
> 
> > - explicitly wait for the timer to have stoppped in drm_vblank_off()
> >    to make sure the wrong interval can't leak from one mode to
> >    another
> 
> I'll soon send out a series implementing this idea.
> 
> Best regards
> Thomas
> 
> >
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)
> 

-- 
Ville Syrjälä
Intel
