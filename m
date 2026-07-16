Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FA34F24C;
	Thu, 16 Jul 2026 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232875; cv=none; b=PlPaQ1DbtagXfe9LhopUPXui0oQD6gA+KuMf3ghgSfAq1mJ3Cciwa92Z1tF2GSnjkr1lUWOVncuXi3NgUbEFGGHQPx72o2PU3v4yrqdl6hWMBpYUd0PQHYk+50TS/tbx755pbGPni64brwVxcmr7glMefPuC2c26J8awr+UHky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232875; c=relaxed/simple;
	bh=AzaJOsbApjMqY51GCaU+AWwSaaCzuK6vqjtGyu/tCgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3X9dVRNThgtqrTZK35fNnMcz5DBsyJn1zdJ2B2e4BTauNAvod5CzfrDUzyOG/Cn+5w/YKQRoD/Av1A68UfY6NzyG8r7tBSQe7x4ONLGU5ulkQ3KxMCWN4vx66vaeQpqsMMkLeoyfDFeSBx5kWNxtYiZWk4XcxWEV55SPiMv220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4kdjJ7T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4kdjJ7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784232873; x=1815768873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AzaJOsbApjMqY51GCaU+AWwSaaCzuK6vqjtGyu/tCgU=;
  b=j4kdjJ7TyZyAkiOvZUsGShWa59Lom21kEkuajPZZHpv6DnHXVg6nW8VE
   mZbtLKk3THyYTu0JRAHFirGTV5eeOHjVnxhNhji799S/RCG/0gcuxhhzU
   OKiHuztGVTxTVr7kyucXJZOCKOwMmAN+XV5cTPyMfIvOhfNqf8yhBHarG
   AD9UyDrtKo8uspO7XPLFo3PtI3MltYpJgMJFmnJ0q8TeRCSWRt1XtgARP
   ne1ZugVLDGsYvWFju2FA+UzCNWr+DXfTfJHlAZG0+VY9deNnC0FgTzuk3
   Zpwk+24v8kYyu1DgHw0pq/FZ2AZ8n6X8JFJuCIjf5Ywy+zsBX4YDeFxln
   Q==;
X-CSE-ConnectionGUID: l1riG0ziTjKCx6HMlTjYqw==
X-CSE-MsgGUID: vYHgNV4xTSG4bh4HdyYz4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="110454346"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="110454346"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 13:14:32 -0700
X-CSE-ConnectionGUID: 17ruU2CWSKqAWBZx+D+ZIg==
X-CSE-MsgGUID: iX1bZC75RYK9NgtYDkWyXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="256651600"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 13:14:31 -0700
Date: Thu, 16 Jul 2026 23:14:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] mfd: si476x-i2c: Get rid of duplicate NULL checks
Message-ID: <alk7pPYmtO-e0RNW@ashevche-desk.local>
References: <20260715191603.1325479-1-andriy.shevchenko@linux.intel.com>
 <20260715193100.D6D4E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715193100.D6D4E1F00A3E@smtp.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 07:31:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> 
> Pre-existing issues:

Yep, thanks. Unfortunately I have no time nor desire to address all this.
My contribution is pure cleanup WRT GPIO APIs usage.

-- 
With Best Regards,
Andy Shevchenko


