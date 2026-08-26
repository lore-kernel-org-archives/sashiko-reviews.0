Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FB83783B5
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727720; cv=none; b=lpIrQ6Zch1jJtkQkH0+EjMnT1VHExqOvyeD708KQFXYtBMmaHXuazEH0C2X8T2rvSVjCTsgjGjiJutoXyNSRX8lMxjTYD8L3EWBX6MDucaVq/lzb3zocgzlEdcLyHiH7H028P9U05LWXS15lElrNoT2g388jvXVAaJyIiRtcD/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727720; c=relaxed/simple;
	bh=7K0U8HnMoYiMVN64ttF64aBEdTMmZk8ylSIPuBEq5GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T01jRw2BWWPxd5boYNp7iIsMurtdh1WhDVR5SKf4/CDMQk+OyAEuP7OAU0S4xzqGNxrpukHvaHW2RX9KpMFLZ5MLBxDohAW2apNHfuFAGisXbayIZFb8/2ilGLcGAc8XDq8crhHgSpM5j0pIgV2bs7QDVVmjuTYf2rv0+oDiSIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahBv7Y77; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahBv7Y77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787727719; x=1819263719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7K0U8HnMoYiMVN64ttF64aBEdTMmZk8ylSIPuBEq5GA=;
  b=ahBv7Y77eAEuDR5eyekbKXzKfYwEJPI/KHrShmrco6wM40YXxG2Dy+HK
   Yaicjf/RF/5vWVWDQ2C+3153Yz7Qb2C6eVc4evgxCKVOnY1bEiN0wl7XL
   X5PxFkY9zIjD7mhLf7Gt/Yp10QKE3vWNogwf6bsjvIhrBpHGL4wECv6yL
   M4VX2hRV7N+csspqnaVPF2KPj37ciPNrqtM0IC4n3G8bFIXSDNuMeXUfl
   4ly7tDYED/4Zha5YXZ26AiPKyz6nlf5lFj3raxJ6EQ5Jg9kBv95Q/WpP9
   QFWsfXQI2a27EQ7DGXBG6cx2Q4+2muzqDQMEAVB4dM/hqSiyIDT4WL/uN
   Q==;
X-CSE-ConnectionGUID: 5SK4I1YbQQaYFWrrHjID8A==
X-CSE-MsgGUID: dJ9fLDejQNKNMlr+0M2PSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98537649"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98537649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:01:53 -0700
X-CSE-ConnectionGUID: sLAcBDWDRC6ibud2fYIseQ==
X-CSE-MsgGUID: VIrr4AbUQs6W3xjtcQEwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271699757"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:01:52 -0700
Date: Wed, 26 Aug 2026 09:01:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Message-ID: <ao6PXPHitn_vMcUg@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-8-raag.jadav@intel.com>
 <20260821114306.23BEF1F000E9@smtp.kernel.org>
 <aoyLymx1-fZkEh-k@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyLymx1-fZkEh-k@intel.com>

On Mon, Aug 24, 2026 at 02:22:02PM -0400, Rodrigo Vivi wrote:
> On Fri, Aug 21, 2026 at 11:43:05AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Raag, could you please take a look and respond all Sashiko's new findings one by one
> with your analysis?
> 
> > New issues:
> > - [Critical] External pinned BOs lose their DMA mappings during FLR suspend but are not unbound from GPU VMs and not restored on FLR resume, leading to an exploitable DMA UAF.

I doubt if anything in userspace survives FLR, but MM corner cases are
already documented as TODO.

> > - [High] Deadlock in FLR prepare path due to waiting for migration jobs after disabling interrupts and stopping GuC.

We don't deal with migration in this path, also documented.

Raag
