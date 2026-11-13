Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579941;
	b=Te3mAETDCvKAW4flvo3fpWPXhhL9dVow90EiqgBgZqxqL44ur4iok7iCW0X0gAkwlA1q
	 JUmKHDflSPwSipp43xxeYfeLroDwOQY7QPKNjNqsZWC0nRyujNDRT1ut3rta6ocPSUybc
	 DAEBt8upx4RzByO8Yate+KGWavj+K2OMgitnnPA2dzZC7b6toB0X4AW8OrmKE4QwNzvon
	 C78XFWtMhTJFkNXhaDf8YvH+iMXgJjgL/BGOarxNgpbK3PtNAvs4Vv18X2dKhvLfvdquF
	 SN3KnnY89OC/EYi1d5vPWYAm/EQK0fKq4pt8iCCb7dTmxVYSdmt5J/a5FlPxbuVpF8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579941;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ZIDZwYhSdTCKzuLOGp8WjvoyRZJwvKmi9n5KzdK/mh4=;
	b=3jihEdqDLwtdOJOMSgchpQr5G96P0KBrD6RXmOP37cetr/vIUTECDweClFsdg8m1QJYe
	 3oNShNFRikS8p/rJYl4UR7DT0XphRAKwXODZPoLW+tnlKGoseBDrT2YJrMP3N42INSy3Z
	 QnW3k6ce1BauDh/lDl8WCsOcAeGIWzfPAsdTz/Vzp7K8CGgk7qEzc02AHfhJUcL8h6fED
	 yjIoV0OjnRNYUpCdWaiW6hHJRGyfz3+uFhFcmrDeoksJtLx3lv/C3DZ7ZqONyX713Ub+Q
	 pjsGvL6J4/gFooD7TMbuDj61nfVEVEDEggiG3F+7XLK5AWpuHaP5NhXW4JNjQTjTyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1QrGPlE;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0171F606A32E
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 14:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0171F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1QrGPlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794579941; x=1826115941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9runC+surjKSCTcqGfyMchV+XqX/vQpKF6i2133R9Uo=;
  b=O1QrGPlEIIlSZIo9UnGH2wWKvuTMkIpTiB7usB4fnLmY974p77NrYy0w
   mHIYwMuqHm5T1O6duO7vK3siEq2dYBVJDyAk/UahVXkM74u2oknVYgyVr
   0Q2ls5Ms/+N358IiW8UMGPWPfXPkyHVcz99BpkUa2ADgrnzEc6grI0QxB
   2cvH8g3cEnueEw+Q67TJHs0T4BimCUwNDP7mFOljRrWIUHAJiVdzquC2W
   s74XKNqUPl9oQpaz07Q66xu1Dq3WJa9yf5yWIqofkL7crBYg6SaY70D4F
   1eOFgx5BBz/Nd/NZiyGBOpVk3sZY4NKTfgf8tqDIyRtOh6ZSL1F9T9qAt
   A==;
X-CSE-ConnectionGUID: mapvzzpORm+iHavXHn9yKg==
X-CSE-MsgGUID: q2DIMrXJRDy4eD7VTvcmvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3416632"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3416632"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 06:25:40 -0800
X-CSE-ConnectionGUID: 6OrwJ5h2RraKNMDhOyqSow==
X-CSE-MsgGUID: IGJnJ9PPTCylYPpwDPiaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10830523"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 06:25:37 -0800
Date: Fri, 13 Nov 2026 16:25:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-hardening@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v5 2/7] string: Warn if the prefix is the empty string
Message-ID: <avcd38TtBtRtWSMe@ashevche-desk.local>
References: <cover.1794574496.git.alx@kernel.org>
 <df3a35c469c60c2c9658d66b30e67468ba053863.1794574496.git.alx@kernel.org>
 <sashiko-outbox-212859@kernel.org>
 <avcUA0z7CuQqs6Bz@devuan>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avcUA0z7CuQqs6Bz@devuan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 02:48:01PM +0100, Alejandro Colomar wrote:

...

> > [Severity: Low]
> > Does moving str_has_prefix() out-of-line into lib/string.c bypass
> > CONFIG_FORTIFY_SOURCE and prevent compile-time constant folding of
> > strlen(prefix)?
> 
> Preventing the compile-time constant folding of strlen(3) is indeed
> a performance degradation, but that's necessary to be able to
> WARN_ON_ONCE(), so there isn't anything we can do.
> 
> > lib/string.c is built with __NO_FORTIFY and its top-of-file comment notes
> > that it is reserved for routines that have architecture-specific
> > alternatives in <asm/string.h> or get overloaded by FORTIFY_SOURCE, while
> > other helpers belong in lib/string_helpers.c.
> 
> Do we want to move it to "lib/string_helpers.c"?  I don't know enough
> about the organization in these files, so just let me know what I should
> do.

string library (generic) is for broad use, so it should really be clean from
kernel things. string_helpers is exactly for some custom abstractions we use
in kernel. Now you should answer these questions (or more than that):
- Are there or potentially be users that needs this API earlier at the boot?
- Is this API is detached from the rest of string library semantically?
  I.o.w. can we group semantically coupled APIs and consider them as a bundle?
- Due to the above, ask the first Q against semantically grouped APIs.

My personal feeling that what you are trying to do is no go for generic string
as is. If you confirm that these APIs are not used / needed at early stages at
boot, they can be moved completely to string_helpers.

-- 
With Best Regards,
Andy Shevchenko


