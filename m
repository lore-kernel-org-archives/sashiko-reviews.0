Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25038270EC1
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854486; cv=none; b=gqN2U/smlyYfgbEhgKUY0ZEQIliDKL6FCbYjNWttSRIdqVf9VB1y0W6I715PZXmzw4kld7ljaa5FTzj9XIourBwC88YqyErjQ2+AbeabJpRfDMYDWXJP/a+hP9E2BoiHO/o4lvlnKG4YCcLZ9BxRj6R7MTCFn+AitkmOLUwT8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854486; c=relaxed/simple;
	bh=FRMd5OI4LJv2i3m9weFAH1wMNxpiw/W4YgAGijey6+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQqwDSnLnjY58sKBebdzc9/KyQKEjjF/tZAw+hAnyHxGL8Rcpzj4qT38GP6vB7cToSQfLwpmnmAlpws/IuHdMFHWR0JJl+iAcwq7PpIFYh59fGEFTCcJTKvKg/hJ5E73f88UH7E+lgNzLUCD5STFFOBLbRMNvhwffFSdLQtWrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FcMWE7Jm; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FcMWE7Jm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1782854483;
	bh=FRMd5OI4LJv2i3m9weFAH1wMNxpiw/W4YgAGijey6+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcMWE7Jmm/ju3EsDCHhj9O7xY3HSukMgCMpOdBp5csGrzlxlHVnBPznF+hXo5MAiP
	 VIQ164efTHu5O6Dp53FTQ2eGLiX/InwNNh57j/facgUSLTt+5Tmzr79KzzdWeO92NS
	 51qtZ22ckzk3pw/+akolOR25G+m1phQIyNtkm68E=
Date: Tue, 30 Jun 2026 23:21:23 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: linux-hwmon@vger.kernel.org
Cc: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Message-ID: <5e04ce9b-61b9-4ea8-bb2e-1563c88a1dde@t-8ch.de>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
 <20260630211028.69BA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630211028.69BA21F000E9@smtp.kernel.org>

On 2026-06-30 21:10:27+0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Using `BUILD_BUG()` with runtime variables introduces build fragility because it relies on compiler Value Range Propagation (VRP) to eliminate the branch.
> --
> 
> commit a22cd7f1036247302ddc232e1cbd36ceb641e202
> Author: Thomas Weißschuh <linux@weissschuh.net>
> 
> hwmon: (cros_ec) Handle temperature conversion overflows
> 
> The calculations converting between the different temperature units can
> overflow, resulting in incorrect data. Detect these overflows and report them.
> 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 44291799dd8e4..4b402142b46f3 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> 
> [ ... ]
> 
> > @@ -150,14 +152,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
> >  /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
> >  #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
> 
> [ ... ]
> 
> > -static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> > +static long __flatten cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> >  {
> > -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
> > +	long ret;
> > +
> > +	if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
> > +		BUILD_BUG();
> 
> [Severity: Low]
> Does the use of BUILD_BUG() with the runtime variable temp risk spurious build
> failures?
> Relying on the compiler's Value Range Propagation (VRP) to eliminate the
> check_add_overflow() branch can lead to broken builds when compiling with
> CONFIG_CC_OPTIMIZE_FOR_DEBUGGING (which uses -Og) or on older toolchains where
> VRP fails to eliminate the branch.

CC_OPTIMIZE_FOR_DEBUGGING is not a thing (anymore?).

This patch passed the 0day build farm, so all relevant compilers should
be handling this correctly.

> > +
> > +	if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
> > +		BUILD_BUG();
> > +
> > +	return ret;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net?part=2
