Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005F37CD2C;
	Thu, 16 Jul 2026 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232970; cv=none; b=uRTSfYDzEoVNm77hZtsm9AtIYvKW9WL3sFV/X+HiSSb6P5bpqBHwpwTkJhFOwFEobup3krAZBKtBQASOmRCW0mqVZu4/9vgv+zQcpocA9LI2RnPt5iIJG4AW21LijctRhq91dv9feC2LPzuzbSvR7DfWm/oK6m9J5eYkzBpTWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232970; c=relaxed/simple;
	bh=+Ts+tIBFsl/8cugabqEFuL0COwmtU/aUkd/b9b/h3YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2UIObRK3qyODKmLic/rD5aIexwX4T0N75JpMTBmxc7uDz5Nb4NQATvnIzr6TdWoA4UV5J6lM0Gh/q2Potp81Yo+1y1BCFZL1/GvVuRjxqBiJmL3cLBV8QTJLV0SiK8q9Gdzo3yorVLBzeI7vtX8w6Roda1OP5cz1a71gFGW1ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vh1VrIf+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vh1VrIf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784232969; x=1815768969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Ts+tIBFsl/8cugabqEFuL0COwmtU/aUkd/b9b/h3YA=;
  b=Vh1VrIf+uiqqPTky+exsq5YYeZQ+0luPkBYVZ51EmAxnarqnV/g868eo
   HnDKVlfsarJigT/8Pw5P8nLZae17nOAsjHVpFo0ZRYwwzt5rfZB5WSsR9
   UmvZWrEr1uuesJ9cPxD79D98xDLz1mG8nPgEqFrNUWzV6+8H+TprN/AYK
   gqKgGxAEEQfYtsSNy38A4r6ERAGhTJ6XYBiQAnFft5gfI+/m8G1GkYyZC
   yHgj9Ocx9iHfiV21HKt0C7F0kT+Azjub2RuiAnOfK4FIbE+GmQ9v8wObV
   9U5A9Lr+60k9NmnKHzOw7z1DQk/Hp6pr5V8VbWksLHyww5K2gjKhkMJ6i
   A==;
X-CSE-ConnectionGUID: hYE8pv+/THyH34c/wNpUfQ==
X-CSE-MsgGUID: ErkK/Z0sRPOdv7Km6eZngw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="110454527"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="110454527"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 13:16:08 -0700
X-CSE-ConnectionGUID: AKLnrD0WTSiy9F1vA/FO1w==
X-CSE-MsgGUID: 4slHw/O7SaeJJaPOW+8QXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="286665363"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 13:16:07 -0700
Date: Thu, 16 Jul 2026 23:16:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Message-ID: <alk8BCcRTAHAPDJe@ashevche-desk.local>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
 <20260715194103.26A301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715194103.26A301F000E9@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 07:41:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Removal of `gpio_set_value_cansleep()` breaks the build for `drivers/mfd/si476x-i2c.c`.

...

> [Severity: Low]
> Does removing this function break the build for drivers/mfd/si476x-i2c.c?

Yes, and there is a comment to apply this via MFD tree. Did you read that?

> There appear to be active callers of gpio_set_value_cansleep() that will
> cause implicit declaration errors when CONFIG_MFD_SI476X_CORE is enabled.

-- 
With Best Regards,
Andy Shevchenko


