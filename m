Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117703E7BCA
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520293; cv=none; b=uJ1/pNS7iBKSPOpdVdgWJC0TrzRbr7AHbhNrTrvq+8UoJzqhWE+aRG/bH4n7UWTMQuIH7/zKtSEP7Z/VM9TJKOdz7cT5cznzxWhjUvGleav8sDkXqQn7OKqMeIi5LtZnMr9vSM/bCbFd0FMyBJfXiHRMROB1lLHSZgt29oardbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520293; c=relaxed/simple;
	bh=svKhn5CbDbl+xeyyPh7Vt6JcBAJh8+SkzRXHaq9q9/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSMbbeak3dEDEjogpFv7xWGjn0e7WdRyfbcQw2U85eZ5rUSBB1AdnFqc0tW114+Rx+FcnOH7mmDG25VZAcshNdGdnCPG+WY8DvnOoAeW191yuoul8RlxZ+OZlr6fRTZeR3vlIaWi1o7KWVD1Jsi9G84wuPEVWOhqSAh44g2bfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=brSxzJD+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+o6eWSCy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="brSxzJD+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+o6eWSCy"
Date: Fri, 4 Sep 2026 13:11:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788520289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KE8lc4weGPgaW5wpJSI/ZtAejDiOSma7d21NI6Y5SY=;
	b=brSxzJD+Oe2H+wgo/G3ujdJ9eJhClP/ihdVZ3GPa8qFuLQzsRN3+Zax3lhb0/zpJ0cBoQc
	9FicsPDAiUWvmt5Ek/I7jXnza3hLxggE78/FVX9zokJgKTzWNel/XrtHFESf4wYdOTtI1n
	owH5OkI7VKchspWbjvBxfNqnjVokOrGjbevzdLV+OQ76NKVdiFKman9sorxxncNgnXwOi/
	GuZNztaUeQYa500wVj7dN4as15P5a/ALqNhtrB+WCBJOsV6RE9BW4JPOLBDGcS1YdmDCO3
	HK9j/QTYFyu0WuUyfyEjVZNYrPUxYtBVg7dTSjQQNzGfZcanutZdg0vljbCkuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788520289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KE8lc4weGPgaW5wpJSI/ZtAejDiOSma7d21NI6Y5SY=;
	b=+o6eWSCyTQa1pD4aw96UOid0v0gYZMNV/zKq27QHT8Gtq2ZeNhguS6VT1FMP+k9CrG2f15
	jeCFZ1cPmio2z5Bg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 1/4] firmware: raspberrypi: reorder
 rpi_firmware_property_tag enum
Message-ID: <i2u472e2k5c3xoldqgtxhc6b2btgr3dkbofkrm23pet3t3ybo3@2mxahxvarebm>
References: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
 <20260904-rpi-tryboot-v4-1-fdee8bc53ff7@linutronix.de>
 <20260904075109.17A191F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904075109.17A191F00A3D@smtp.kernel.org>

On Fri, Sep 04, 2026 at 07:51:08AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch claims to reorder the `rpi_firmware_property_tag` enum by tag values but introduces a new sorting error by moving higher values immediately before lower ones.
> --
> 
> commit 5b5e3e4d76c8fceb817f997acacf1b16bf561c0e
> Author: Gregor Herburger <gregor.herburger@linutronix.de>
> 
> firmware: raspberrypi: reorder rpi_firmware_property_tag enum
> 
> This patch reorders the tags in the rpi_firmware_property_tag enum to
> sort them by their tag values. It claims no functional change is intended.
> 
> > diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> > index 975bef529854a..8ad1cdbf5e9f5 100644
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
> >  
> 
> [Severity: Medium]
> The commit message mentions that the enum is being ordered by tag values,
> but does this actually break the ordering for these values?
> 
> The new placement moves RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF (0x0004801f)
> and RPI_FIRMWARE_FRAMEBUFFER_SET_GPIOVIRTBUF (0x00048020) immediately before
> RPI_FIRMWARE_VCHIQ_INIT (0x00048010) in rpi_firmware_property_tag.

Yes I am aware of this but this RPI_FIRMWARE_VCHIQ_INIT seems not to fit into
the RPI_FIRMWARE_FRAMEBUFFER_* block. So I decided to keep it where it is.

Best regards
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
