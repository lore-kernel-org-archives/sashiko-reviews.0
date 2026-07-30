Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A61A40B360
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412332; cv=none; b=DOV2VT+fXI/e741Pc8BoJDxWN9sDhztg4lz4x1a6H0OJyuFPIKeIwnuDbd2oeeEf6AbqqsNo/Fr4gpvbXC/c5sndgu8oVEh7Jk348B0QOBzHiCm1lZDAn2I3m2+Wjsv37HCkW077Q7DQ+nCzmdAEitKkWfTvWEp+AEn9aDRhge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412332; c=relaxed/simple;
	bh=SkzsL5mRw6RZgHXZbWWXBnr9taTbICoDE5MYJxaX/b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0VUfPjfvC1x5fJE3S02bBGWt+b5la3F5m2DJoEr8Yy6hMX8tj3TALTJ0ByddOCKsFxfXEycwWos6QZE2F0CAhQqdVXYveSPwBsM61C5MVMzjap1pHGA1xpIZt6Sxi9T+oKEHzFMKeb+X+AJ1Qb2JR19Tl4ATwe0n5O0knz1tzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=23gJB//b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s7QK8uHR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="23gJB//b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s7QK8uHR"
Date: Thu, 30 Jul 2026 13:52:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785412329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+lT3r9XsY1cExyrPjSaWHwrxfpVm1heZbwS3MhfIwQ=;
	b=23gJB//bZDqyVvdPiE8MVezVH3vPaQuqFCrm3NoKttdYR+umj9VPgHhyFJVkkRvxSkjkUk
	J+essnQSc7CdetWjMezmwOew0WHKXw7pF75gtUJwYsE9U+VScUyOQE5EqsYjmypkDpcjRQ
	qM5bwj+KRBzLP6jRNuqbloRDRaYAUApkt1dCabigxNaihgGWcVEvkxdjvBZhaR8smv/LJF
	PWWQBJyT8A9kAGVu+R94YtEcUWIn5VNW7gVbtxszknzbcNoPbl+Rff/BYq6LXTl+xBopkE
	cRbm79ufMFcOuXgZNejr6wUZWFPoHxQLiCEfxm60K3bcAZmWIRe/+mYgwYBYEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785412329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+lT3r9XsY1cExyrPjSaWHwrxfpVm1heZbwS3MhfIwQ=;
	b=s7QK8uHRqjsJN2+qYNd3kJ5Vi64e5RJAgVyxsdmueGRpeHZo3fMKUZOKSczhm+RJ+JYEXn
	fyXdiqy91jUr9xBg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 supporty
Message-ID: <6cqlfucbdzd23kn5indpgejxkj5dooiat6bhwdqboilyrlbzsr@ii62uqu677kg>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
 <20260730-rpi-tryboot-v3-3-849c001d67f8@linutronix.de>
 <20260730111144.E3BA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730111144.E3BA11F000E9@smtp.kernel.org>

On Thu, Jul 30, 2026 at 11:11:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] fw->cl.dev becomes a dangling pointer if the firmware device is destroyed while a consumer holds a reference to fw.
> - [High] fw can be accessed after it is freed because drvdata is not cleared before freeing fw during driver unbind or probe failure.
> --
Yes they are real issues, I started to work on a patch for this. But as these
are pre-existing issues i will send a separate patch for this issues.

> 
> --- Patch [3]: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode support ---
> commit 7622e7ef47694e51ed746363fd587b5883406973
> Author: Gregor Herburger <gregor.herburger@linutronix.de>
> 
> firmware: raspberrypi: Add reboot mode support
> 
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This commit enables this by registering a reboot mode
> driver. It also replaces the manual rpi_firmware_put() with a
> devres-managed call to safely register the reboot mode.
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
> This is a pre-existing issue, but can fw be accessed after it is freed
> because drvdata is not explicitly cleared?
> 
> During unbind, devm_rpi_firmware_put is executed by devres, which drops the
> kref and frees fw. However, the driver core does not clear drvdata until
> device_unbind_cleanup completes (which happens after devres actions).
> 
> If rpi_firmware_get() is called concurrently by another thread, would it
> fetch the uncleared but freed fw pointer via platform_get_drvdata(pdev) and
> call kref_get_unless_zero(&fw->consumers), resulting in a use-after-free?
> 
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but wouldn't fw->cl.dev become a
> dangling pointer if the firmware device is destroyed while a consumer holds a
> reference to fw?
> 
> In rpi_firmware_get(), the consumer retrieves the firmware context and
> increments its kref (fw->consumers), but then drops the reference to the
> platform device itself:
> 
> drivers/firmware/raspberrypi.c:rpi_firmware_get() {
>     ...
>     put_device(&pdev->dev);
>     ...
> }
> 
> If the device is subsequently unregistered (e.g., via DT overlay removal), the
> device struct is freed, but the consumer still holds a reference to fw.
> 
> Any subsequent failing mailbox transaction will call dev_err(fw->cl.dev, ...)
> in rpi_firmware_transaction() and dereference the freed device pointer.
> 
> >  	rpi_firmware_print_firmware_revision(fw);
> >  	rpi_register_hwmon_driver(dev, fw);
> >  	rpi_register_clk_driver(dev);
> > +	rpi_register_reboot_mode(dev, fw);
> >  
> >  	return 0;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de?part=3

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
