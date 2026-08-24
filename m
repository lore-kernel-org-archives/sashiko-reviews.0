Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB842125A
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587728; cv=none; b=WG9fxIgQhdgWmrOReUFuW98Xtf12OPyCs3KnbcMH9nj4b2IFjmjPoBkQw8ncHDNZJprT4n337694qmj710ipvHcTVxmmQmT2z5WSXaaqb/1U/pTVpiLfxoD3zCXBENQxlq1cG2KsdV5cNnR6QZleFrX5W6SZQ5PHcBgmXLxeBuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587728; c=relaxed/simple;
	bh=Wuj3p3MT8J4IciJ3DEAn7NumzaK3EjJYqrOdQxYpsFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6L++JfLgg2LIRIPOis1SK9zvC8y2UYRXnzymiZbD19W3h+tbX9iWyApc8eHNo1Kcl8XcNMMw1fDTw92J63ocviQpJd0LP53Hx17jZ+kXVUZXI0omnz2TBMA6saKuOny2EKKzQPtMHW5o2qa+CMa6Ls8PBEiSvBCdTLygr38SW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BD3kxUtH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BD3kxUtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787587728; x=1819123728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wuj3p3MT8J4IciJ3DEAn7NumzaK3EjJYqrOdQxYpsFQ=;
  b=BD3kxUtHY63zUbBb1tDJ97AKMnc7mW1efTVIE6ki7LhH0If440BX8DjG
   FgTkqqgg+LfU8xtbN8d992opdgOhkmfnEeYEauKz8u9SMJeoNB9vvO0qa
   gvUtDW26yrhfBKwf8QaZEP12xbw6D8GULI7v7QQ3HKM/DnjMWkRakgLlP
   rIxAB0UrlgDHdimdS7JV+ICRcp1ze9gTVWeuVZ5ffgZhxyfzfa0iBNqkz
   UigPtze42bvmUj3ui9HXZFMFT+9w2IFtpSRhGUjLyHyJ3YpqghYuvcTgq
   +PqMlVS4jWvB4fFYbNcyyb5qf9jj6S5HrUf3Y+2b1OuAgnkskc3kFeXBr
   Q==;
X-CSE-ConnectionGUID: tmLbto4BT/ywNP7xJ1kYHQ==
X-CSE-MsgGUID: CiZXA+UNQ1aO5/wrSBvJew==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105421132"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="105421132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:08:37 -0700
X-CSE-ConnectionGUID: ENRoVwL1TMC38GiF2/hjxA==
X-CSE-MsgGUID: UWP15+/qTyq2l6PUTOJz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="264425244"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:08:36 -0700
Date: Mon, 24 Aug 2026 18:08:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
Message-ID: <aoxsgT0tRuJecTbp@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
 <20260821113758.006681F000E9@smtp.kernel.org>
 <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>

On Mon, Aug 24, 2026 at 04:30:25PM +0200, Laguna, Lukasz wrote:
> On 8/21/2026 13:37, sashiko-bot@kernel.org wrote:

...

> > - [High] Unprotected state modification and double-increment of `wedged.ref` in `prepare_device_for_reset()`.
> 
> Valid. It should be enough to just take the lock and check xe->wedged.perm
> before taking the reference.

We have a xe_device_wedged() sanity check before landing here, so ideally
we shouldn't be at this point with an active ref. But as mentioned in the
comment, the plan is to drop the whole prepare_device_for_reset() once we
land this series.

Raag

> > > +	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and drop this. */
> > > +	xe->wedged.perm = true;
