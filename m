Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC63D3480;
	Wed, 20 May 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284672; cv=none; b=SwtRLcRkOfTYlzAqM0r+nRP4VGhpFeqRjiVERoWB2zAZ5GaK/LoDxfnAE5zu5RcVDZePOPbt31ftQPZfWd0JIYTadNmFN+OQBqsllKdUtxwYwXfjopPgmTt/u0e0QI9fc7Mt1o2dNfiq5hjXtWDURGkAMZlpyBUcv7tcPzitGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284672; c=relaxed/simple;
	bh=WhVLiyFbSisphM4PD/VGde9vUBA4+k2rbmvQtguhV74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crIZ2+yslSrnCgoXg5YI8WKA7qU0ZYVMUqELdaGn5VXlQBpAtmFgILIBWmmwEScBO45UFN6R1VFgsCZFZ10Lc8xzL6NyGqgcb/zy9NDaBl43zRD0yl4Jqi5nbpRXREjlDhMWsNL1eBPmxsDFB+Mb8wuSkyc9B8ITh15qB5GvxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChJCnh43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChJCnh43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4861F000E9;
	Wed, 20 May 2026 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284670;
	bh=PXnQVnAPUdSBXCTo335Tp8Fkg90EJxjD3I5y+H4hvLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ChJCnh432P9qK792VV0RtF9NEZWFvYG0Doqw+9YwI6rLPgxXWJAE0I2h9LX1YJTm6
	 OprxP3U5jdFgXopQSQysw/x/clzbMYj2/u9Z3Je3lBtF/YSVkO2REj5UKLLohNDXXy
	 J+sCZZ97c3CBL6KLD9XylQu7yo/yBDMB1H+dJDK9HsduV3QltqfE0b1YauI2ta2RVu
	 ZaGnBrlww6lApQfRotldZDDHCosN8T4A0/q1Royz2brb1ByQEUnnjulEpiaCv/cBZm
	 weZ0rpWr4WxJHadMUsO0ylxDdqyEOl8TDPddBpy4txP6zr388agb7ZK+oEXM3Mke5q
	 nUr7zDcKdb35Q==
Date: Wed, 20 May 2026 14:44:26 +0100
From: Lee Jones <lee@kernel.org>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v8 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Message-ID: <20260520134426.GB2767592@google.com>
References: <20260519-ltc3220-driver-v8-2-e1771c1733f7@analog.com>
 <20260519015003.866FDC2BCB7@smtp.kernel.org>
 <DS0PR03MB722893FF4942A436AAF69175ED012@DS0PR03MB7228.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR03MB722893FF4942A436AAF69175ED012@DS0PR03MB7228.namprd03.prod.outlook.com>

On Wed, 20 May 2026, Escala, Edelweise wrote:

> 
> > -----Original Message-----
> > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>

Do I need to sign-up to receive these?

> > Sent: Tuesday, May 19, 2026 9:50 AM
> > To: Escala, Edelweise <Edelweise.Escala@analog.com>
> > Cc: robh@kernel.org; devicetree@vger.kernel.org; conor+dt@kernel.org

Working why only these email addresses were Cc:ed.

> > Subject: Re: [PATCH v8 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
> > LED Driver
> > 
> > [External]
> > 
> > Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to
> > consider:
> > - [High] The driver abuses the `brightness` attribute to multiplex hardware modes,
> > violating standard LED UAPI.
> > - [High] The `blink_mode` value is not shifted before being written via
> > `regmap_update_bits()`, causing blink timing to fail.
> > - [High] `ltc3220_blink_set()` fails to enable blink mode on the target LED's
> > control register.
> > - [High] `ltc3220_pattern_clear()` incorrectly halts the global gradation timer and
> > fails to reset the individual LED mode.
> > - [High] Duplicate `reg` values in the device tree cause double-registration and list
> > corruption.
> > - [High] Missing `select REGMAP_I2C` in Kconfig leads to silent build failures.
> > - [Medium] Missing `led_classdev_suspend()` and `led_classdev_resume()` calls
> > during power management.
> > --
> > 
> > commit 0ef3ccbe351040b28172d9e382676a039d0118d4
> > Author: Edelweise Escala <edelweise.escala@analog.com>



-- 
Lee Jones
