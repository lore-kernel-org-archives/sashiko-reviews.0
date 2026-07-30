Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A3340260
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412425; cv=none; b=I0zfswchgn0ALWNrkspsGq++a0ZRp0SMcEKZgeTth2UiYbtgrcvEnfhHKkIXgDYzOqBp6TuSQJ1DPyIJZyUa+wdrzb5mlKwkYKmTS66vN0iQDt3Onik2cruhyvAAODpS1Mdw6z464+fkaRBgJlCsoeIl+vsU/SJdxFc2xEq8WKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412425; c=relaxed/simple;
	bh=wnNYUOb6D9Kvi2/k4nR3mPGzojkoS/sCpjkn75KRP6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0tTVRD/vWKUXZmiCPpF6mrhZh6JqE7GsfUUghl5x66rK9NIlbEWQ1Rms3MQe8z9gfONTSPPEgkdYiiHOgj7t8NUFVy0uI4nTJp6gmNU421tqgRW6iMRswPPmWAYQOFaQhgrT09UvS4Jg9MZvUGgBkLna67pPC8CwQq88S630uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X3Fm9GsY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1hNby+ne; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X3Fm9GsY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1hNby+ne"
Date: Thu, 30 Jul 2026 13:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785412422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmqIybb0v/z4XXSL22w1qb+WUAoG90uw7aAN2YriP94=;
	b=X3Fm9GsY9cGr5rNqY4qClAuaXxK2GCmS4SlJR3dvT/cMrqGidcySEhz7NecrD+LT2JcOLB
	AAbVdN75ku+ZfpchQwXTW1MxE+bIpQoDY8tuKTSa8ZPYVFX5l6FobjNgV6T2B8Oyq7FZ8z
	iJfSo2Vj6D9NPr3OPle48UPUWR3pCUFsuKbhnHj6cDPmB7APhxEd+qj+1sQxqVz9H03wHK
	6xQmiERUAy2ynnQgXDZbic9Pyyyd0Pw9Qhd42BDgIQTHwPeIQ3vMOLYnmqr0QYwY0vyp7/
	HPPcNDPOliQk7pbzalX7oNoksF27jBcnArbQ+C1PpNasgsmQavgxdS1VoV61RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785412422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmqIybb0v/z4XXSL22w1qb+WUAoG90uw7aAN2YriP94=;
	b=1hNby+neXUxXZvwU81UY4ITutAQ6U8ZHgKVJwk3Nz1myNAf+Ng3qYaTwv63bw+vpGrkWl5
	bpnppELxNH3KsICA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RESEND v3 1/4] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Message-ID: <yqxro4e46o7r6ismlikvvdo6lotstjtxjo6qoqmqljvmsok5ub@qurubb4xyetk>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
 <20260730-rpi-tryboot-v3-1-849c001d67f8@linutronix.de>
 <20260730110417.B71041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730110417.B71041F000E9@smtp.kernel.org>

On Thu, Jul 30, 2026 at 11:04:17AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit claims to reorder all enum tags by their integer values, but incorrectly places `RPI_FIRMWARE_VCHIQ_INIT` out of order relative to the newly moved tags.
> --
> 
> --- Patch [1]: [PATCH RESEND v3 1/4] firmware: raspberrypi: reorder rpi_firmware_property_tag enum ---
> commit 6dfb35594a9bcc2cc5fa3006d5257b66c4f03b4a
> Author: Gregor Herburger <gregor.herburger@linutronix.de>
> 
> firmware: raspberrypi: reorder rpi_firmware_property_tag enum
> 
> This commit attempts to reorder the tags in the rpi_firmware_property_tag
> enum by their integer values to correct previously out-of-order additions.
> 
> > diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> > --- a/include/soc/bcm2835/raspberrypi-firmware.h
> > +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> 
> [ ... ]
> 
> > @@ -125,10 +125,10 @@ enum rpi_firmware_property_tag {
> >  	RPI_FIRMWARE_FRAMEBUFFER_SET_VIRTUAL_OFFSET =         0x00048009,
> >  	RPI_FIRMWARE_FRAMEBUFFER_SET_OVERSCAN =               0x0004800a,
> >  	RPI_FIRMWARE_FRAMEBUFFER_SET_PALETTE =                0x0004800b,
> > -	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
> > -	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
> >  	RPI_FIRMWARE_FRAMEBUFFER_SET_VSYNC =                  0x0004800e,
> >  	RPI_FIRMWARE_FRAMEBUFFER_SET_BACKLIGHT =              0x0004800f,
> > +	RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
> > +	RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
> >  
> >  	RPI_FIRMWARE_VCHIQ_INIT =                             0x00048010,
> 
> [Severity: Medium]
> The commit message states the intent is to reorder the tags by their numerical
> values, but does this final arrangement still leave them unsorted? 
> 
> The relocated tags RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF (0x0004801f) and 
> RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF (0x00048020) are now placed right 
> before RPI_FIRMWARE_VCHIQ_INIT (0x00048010).

I saw this but as this is named completly different I decided to keep it out of
the RPI_FIRMWARE_FRAMEBUFFER* block.

Regards
-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer
