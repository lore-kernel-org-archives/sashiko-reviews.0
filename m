Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E73624CC
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461784; cv=none; b=q2MnCoQGRr6vHOgds2PNpCdSWfuF2q+ocZWVNVt8dcwIpqS0A5oSsYTief7xhrUISdzJ3w8XxTWCREhczn7Rjokolw6NmEZCQc1Y0lx5aPej+MFR5hEfJyQy+Tl9P0FCjou/4wEjZgZpDrfYpNCM41NyZzSMpX+6eznicj0cDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461784; c=relaxed/simple;
	bh=RjjyukIZMmOnjDwapm6OGfDxKHHzl++raccQCKbpkYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxZs7DsmpjJGx9Y9qtYJzhtJONrqoCFz5k0ePb5v/iHpzpo7hhMQfycIPhLa4xkdKTRJFFcxnOi8tv3PgtPQ9KbTvtB3hJIqJ6bGC4PXY/FBbQEfsZQGnDvJwn4kI72HEUcNE3l/D0OIKaYtZsn6SjDR6iUz3+LYkj3CY9cXCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4exj1H1F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ge7o6t/X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4exj1H1F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ge7o6t/X"
Date: Fri, 26 Jun 2026 10:16:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782461774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77C0PIPkULCawspeoWKKGGZpSr9VYMCEg9bVPkUJvKI=;
	b=4exj1H1FGsbItgE2+P+dxaCGBmAHpVH8AYiCNG86+ljGeN5UXANG5/OuEMTydr+CMqNfT4
	qM0qmepTQeRy8cSPv6jogC6qKPqyRFPn2+Yj1i+e0LkS5iPMiWawRQwqsNI/8/VVz6DMt7
	h8SuotguzVAUhiDyA/uxEn0dUM14URaar6R5PF2lo7xrBrnWNsYChqq8INKnb+ctKXMmYM
	9tetVENG902o6A/uXIIPboSvlkvcyGCMa2DxHkasaRSFPLUbTPKtN0Kbafvl04qRVf5LCu
	eDsl5JzedpRU/iLj9kZT0kXLq8wY9HCyzDA7n4GESCam+pKxI82sZdpJI3KG4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782461774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77C0PIPkULCawspeoWKKGGZpSr9VYMCEg9bVPkUJvKI=;
	b=Ge7o6t/XBifeIRVO5XxBXlOr5nivRHc+bH9JJFCw3uKgqZpY9zZweo8A+0dIOrsnyhBm7y
	1Ej32Gw2hQTekXCg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: raspberrypi: Add reboot mode support
Message-ID: <skyj4e4opab6toljwr2mc4prybrzxhsptdemy5ynrytu6u5ibi@2qsfb6m2r4dl>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-3-490b1c4c4970@linutronix.de>
 <20260626074334.8E6201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626074334.8E6201F000E9@smtp.kernel.org>

Hi,
On Fri, Jun 26, 2026 at 07:43:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Mixing managed (devm) and manual API calls for reboot mode registration causes a double-free and a use-after-free on device removal.
> - [High] Ignoring the return value of `devm_reboot_mode_register` leads to a NULL pointer dereference or double free if registration fails.
> --

yes I will address this points  in a v2. But first I want to wait if I get more
feedback on this series. In particular, whether this is the right approach from
a conceptual standpoint.

> 
> commit c4eb702fd9dc0d615bc8a99fbb83befc50f8971f
> Author: Gregor Herburger <gregor.herburger@linutronix.de>
> 
> firmware: raspberrypi: Add reboot mode support
> 
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This patch adds support for this by registering a reboot
> mode driver.
> 
> > diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> > --- a/drivers/firmware/raspberrypi.c
> > +++ b/drivers/firmware/raspberrypi.c
> > @@ -306,6 +323,12 @@ static int rpi_firmware_probe(struct platform_device *pdev)
> >  	rpi_register_hwmon_driver(dev, fw);
> >  	rpi_register_clk_driver(dev);
> >  
> > +	fw->reboot_mode.dev = dev;
> > +	fw->reboot_mode.write = rpi_firmware_reboot_mode_write;
> > +	ret = devm_reboot_mode_register(dev, &fw->reboot_mode);
> > +	if (ret)
> > +		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
> > +
> >  	return 0;
> >  }
> 
> [Severity: High]
> Should we return the error code here instead of returning 0?
> 
> If devm_reboot_mode_register() fails, the probe succeeds but the internal
> list head for the reboot mode might remain uninitialized. 
> 
> Later during device removal, rpi_firmware_remove() calls
> reboot_mode_unregister() unconditionally. This could lead to a null pointer
> dereference when iterating the uninitialized list, or a double free if the
> failure occurred inside the register function and it already freed the
> resources.
> 
> [ ... ]
> 
> > @@ -323,6 +346,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
> >  {
> >  	struct rpi_firmware *fw = platform_get_drvdata(pdev);
> >  
> > +	reboot_mode_unregister(&fw->reboot_mode);
> > +
> 
> [Severity: High]
> Could this manual unregister cause a double-free and use-after-free?
> 
> Since devm_reboot_mode_register() is used in probe, the devres cleanup will
> automatically unregister the reboot mode when the device is removed.
> 
> By manually calling reboot_mode_unregister() here:
> 1. It frees the strings in the list.
> 2. rpi_firmware_put(fw) drops the reference, potentially freeing the fw
>    structure.
> 3. The devres cleanup runs devm_reboot_mode_release() upon returning,
>    accessing the freed fw structure and attempting to unregister and free
>    the strings a second time.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de?part=3

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
