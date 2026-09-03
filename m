Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987C9399892
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467416; cv=none; b=nUPuY+fMRNrGKISZ8MZrgNk9+23ooq+BcpX15GJSk2AQNSjt9Ta4f04So8krr1OSlBH1t05uWxgckvXZmvr9MQEd/xgEL+bc3RrpIQ7DAm5GoZQfrHZJO2N0wMqXBLtkvqes9FCgyUmHCzVe1CyzjFEkDMaF/RKtgHyadYQVphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467416; c=relaxed/simple;
	bh=8knFdtNYPrqyhv30e4GquzB1rvqJ80a6xXPU9bwRCeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKAj8voHtFfFxfYc0y25kLAdODCFhPneGqAz3v7u//Cvt6HD0GT6t9jWb+Cem8TXW6Dr0lMDOlvQdC2eNYi0Cy817Eou0bZ/e/vTEGbUxwMpDKc0hihVqUtXMEBi0POkDx1IOahWP2rd1BJTZqipUWbB3KqHXZkfUN8JayUK/To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ntws8OO8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MHcqIcLN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ntws8OO8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MHcqIcLN"
Date: Thu, 3 Sep 2026 22:30:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788467409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NmYCb82BhC5oZ8INwSoxooMXZ6lo4NUT91Drz5rG7o=;
	b=ntws8OO8pVjbNrcf0nitLlFro22wRgRx61blPVvnAS68Ct2HNVXeoVj1yxDwAxhTrew2Y1
	DpZDqehwsnqZ29xGA9EF/vIKYYiq5Faw1+jCA7sIRM/fFOaLjkHR6WLN/2Axn6wwSzYYQA
	7ljO3RKs1hZI7Ej+L67fNtWLHt5qjoWUkiV4NSEbKaWhMKq6evQNsCgHKSgg3apNUZ0oDE
	NTsbBvsCj3+NiWnFpnvogkAKmIs8vlhlMco2Z9NtVNuKTJ7+S1MOUdCNf1OMR29Izt0fpo
	cQD3n9BH3v3vHmy24TNrFGLd2SX/9dwZRwlUHc1+21nF1Oo5CF45qYdX0xQDQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788467409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NmYCb82BhC5oZ8INwSoxooMXZ6lo4NUT91Drz5rG7o=;
	b=MHcqIcLN9ixDGYfxILaQlIus80JGVl8z+yBGlybx90msKGAsL5yoMQ8NwWWn/gXzkkUW2h
	X3vOfJ1a4hdK+1Aw==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Message-ID: <3gesa7qgoko2m4a7icuakiys4tvvpyrwh63dducdxjkdsedjos@7rotn2q4mkfv>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
 <20260903150844.82B981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903150844.82B981F000E9@smtp.kernel.org>

On Thu, Sep 03, 2026 at 03:08:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Use-after-free race condition if devm_add_action_or_reset() fails after drvdata is set.
> --
> 
> commit ea24b0bc9b26402781f7da38607787a0f6b47e39
> Author: Gregor Herburger <gregor.herburger@linutronix.de>
> 
> firmware: raspberrypi: Add reboot mode support
>     
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This can be used to create a A/B update scheme.
> 
> To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> message must be sent to the firmware. Add support for this by
> registering a reboot mode driver.
> 
> > diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> > index 0aa322e9a2e73..2a0c40b8052e5 100644
> > --- a/drivers/firmware/raspberrypi.c
> > +++ b/drivers/firmware/raspberrypi.c
> [ ... ]
> > @@ -302,9 +331,14 @@ static int rpi_firmware_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, fw);
> >  
> > +	ret = devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: High]
> If devm_add_action_or_reset() fails here, could this create a use-after-free 
> race condition?
> 
> When the failure occurs, devm_add_action_or_reset() immediately executes
> devm_rpi_firmware_put(), which drops the refcount and frees the fw context. 
> Because platform_set_drvdata() was already called, the driver data 
> will point to this freed memory until the core probe cleanup mechanism 
> eventually clears it.

Yes, this could happen. It should be sufficient to put the
devm_add_action_or_reset call before the platform_set_drvdata call. I will send
a new version with this change.
> 
> During this window, a consumer driver could call rpi_firmware_get(), which
> performs a lockless lookup of drvdata and attempts to dereference the freed
> pointer:
> 
> drivers/firmware/raspberrypi.c:rpi_firmware_get() {
>     ...
> 	fw = platform_get_drvdata(pdev);
> 	if (!fw)
> 		goto err_put_device;
> 
> 	if (!kref_get_unless_zero(&fw->consumers))
> 		goto err_put_device;
>     ...
> }
> 
> > +
> >  	rpi_firmware_print_firmware_revision(fw);
> >  	rpi_register_hwmon_driver(dev, fw);
> >  	rpi_register_clk_driver(dev);
> > +	rpi_register_reboot_mode(dev, fw);
> >  
> >  	return 0;
> >  }
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de?part=3

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
