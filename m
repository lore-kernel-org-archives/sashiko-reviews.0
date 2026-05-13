Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362593ADB99
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709066; cv=none; b=rtcnF+LCDwU0uoLa7fg9hSdGOxK+7CXGdXK5NfBWKseWKvUyDjXYTnoDtewNJCZomm8EfCCjNeoiLZSMwAAgu02VdjMmZydb6L3QLkbE0Q6tmGUU+5A2myxDPoacH2hQZc2/pyqfGf7KrsScYnpdIwIk9+ie4xS6Z5BsQgw/saw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709066; c=relaxed/simple;
	bh=/OnS0BYKZVUpokFQSbMFEdEWxIMl+Wz/Job/AUHBzxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Op8yhRrSauu2f1JmNd8grgYkP4SzBIc+l83DDxAFhV7+jS8WYxUWjhBMfTc9ZmB+xG36D2TNZJLTW+BIJwZH3qcHFXvsUwbZm+9p7V4HKU2fb0yajaSr8wpYYlhKhRYKYRzBTIID0Fo9vmJi47cwFjlHc0J0sdlVJH158PdBwCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTSWkKlb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTSWkKlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778709066; x=1810245066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/OnS0BYKZVUpokFQSbMFEdEWxIMl+Wz/Job/AUHBzxc=;
  b=NTSWkKlb+/NjK8g8O+BWFkqoWVjv8CyEGHToytDCGMPaPRtGZfiSCSjq
   gyGewjTSPz0/x6BHu3YKCmGj2A167j6NwRVfl0cNySGMWU5uqTrUtKcGE
   ObuKKQwXYGf/sZciZHwUvHdFo6pH1kqGX4IfgdpACufjgTP9VIhs6uYQC
   AUU5yYUrNZ8coAdkaEtetN7OFtbPGWjMM0q9U4Pm1hiklW8I70kn5HKPW
   Iox7lShnbghB+4X4Eh9EKT/CCCWgCSas/NBmVYYWwopaI2NklyANygrUe
   HrZ0ZUvWGMCD8u9+CpgvFyrUHtgXEtIRAYecQCatnwA43dM3wQsAgyMqu
   g==;
X-CSE-ConnectionGUID: byNn9CJHQTuliqChYDkHAg==
X-CSE-MsgGUID: F0tofz0HTiqC9s1VKsVB7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79821572"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79821572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:51:05 -0700
X-CSE-ConnectionGUID: 927xWr8iQXOBJbqidU2v2Q==
X-CSE-MsgGUID: UgWung5tQ66ivyAjLqPciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="268562466"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:51:03 -0700
Date: Thu, 14 May 2026 00:51:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
	neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/5] phy: phy-can-transceiver: use
 device_get_match_data()
Message-ID: <agTyRALNTLTagy6y@ashevche-desk.local>
References: <20260512130552.272476-3-andriy.shevchenko@linux.intel.com>
 <20260513212611.EDC78C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513212611.EDC78C19425@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, May 13, 2026 at 09:26:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The error check for `device_get_match_data(dev)` is inverted, causing the driver probe to fail on success and triggering a NULL pointer dereference on failure.

Right, the typo due to rebase. Will fix in v5.

-- 
With Best Regards,
Andy Shevchenko


