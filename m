Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762743D8121
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857747; cv=none; b=BIdDD8RJcYw5xTqNtIdc1zkUP62bdZhMz99DTI254uA2JSVs4IyHkd0ScEXDbC85R/p+527tDbPYQqTq5FB+jEOvHwvvkphq1Z0mT8CnhqjcQ1TBXQEjCpNHy/s4drdZMJ6B2OluEq0CngrgZe5Bgr84S8GdwhWdyz4KMAC/9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857747; c=relaxed/simple;
	bh=JE5IEeiVgkZaqutUWQ+pCCknavzg8Me6Fir4t8mJMJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewvVxWvqtuzqcMb6e5w/0pcGYwRw+UJyr0PkFYzyvL591JkP6gyVqvI37xOUzC3iGpDne1eospQwrpgRNzziD/RbOUwkCE9ct8K62/s4yAWdhz5VJxLY/JK/0u+3p0TWHWCcflqXL3B2fkDhi1Gg3ntEwAlGwu7UWM3cJmz3wpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE+q74UZ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE+q74UZ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1967585a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857745; x=1791462545; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OawrqHgaVkSeMDOujTYqzq1MZTZEufov/VzumsaTU7s=;
        b=EE+q74UZfwY+w4mH/CU5fmfXEh59jkfq68t4dxDal7BkqAjRw8YG1WZkSap2YY9U2h
         rwuO0nFJlW6R+vL6/hJnXIeJ5FBO/krZyygoCHpdKsxD0HYzV2ZQOg8kX8ofgVUAKVmT
         1MzSkUBngdVKa0VSbui3ehTk2t2BFJJiXZnYU0M1a/WrT1sUpvUqVTldmmCvFMRDUM9Z
         v2CdoPmfdU1mqFN4x1+/D9UiaDcILTmN11y7RpEcMg+xUAAxh/9OuCpz5eMMErqxm6r6
         QLJtkU+vr/hlXdoLn1eKXRHIP8vHtm7KMeR4vl9JvJ3vdM4QdntfDEnLa1miklcs0hlA
         Eu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857745; x=1791462545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OawrqHgaVkSeMDOujTYqzq1MZTZEufov/VzumsaTU7s=;
        b=n2GnkZzpT+0sC0C3l8kk9DmEtuvh8D5bkjamFXC0QY/IwLop+vdWKanRDCHUm4bJYG
         N+xJjqeuGUiJMSTzPyvOyBL3MKjseJPPlbosJNKZTFTzsqShS6KgEtyvAGExQsUA/q2m
         cMW5CXS3R4e3jMwqjtHBYjS7/2FfXTlPnwX+zCJ3npkYT1oy0tpqRKm3BHMxhiKcSyH1
         GQGlDSFRU+TB1+gZy6oPmBm4rnvlO7e87Sq90JevbJm5qfCWnT4EXiQCCZx0zPuqnoZJ
         mF1TykZlsrYPAGyKnq9BBQzUspRsTObek8fo5PBVEmj9n8Mb4HfRndzv/kTO/kQQl4hB
         3RKg==
X-Gm-Message-State: AFq9FYIZIsz16qpMKW7gg41jQHx9rJexYNamw6O3W4JsoDePAc7IvZkr
	0Ri/a1h/Nj3lFAyQCl3DKTPeKYm8FR5v7dDkmnqqxCB5SHAwFYdsbxY6
X-Gm-Gg: AYBFou1qbb1PFjwOWl6E4OhL2B4muhDXZCpnJBHen/tjYKDym4wS3jC6Hd0B4AP6BLp
	0PuAPTR3/W0sdO1QLkBfWPvIUM8l7UWRsrea0kCzMd9/zCauLEQy+6tX+eiMwhEo7tAoPMmkyiU
	BbgvdUTKc+vL818xyMccczeDgOuO5Qvqz2vAeqA1N3oZwtleaY5erw5BRK/FJspRV54RmBHMjy3
	vWis8A1iEPGdoPxHkCPikbfO9oRpjAO6+2bW9DGeA5kP41KelpZS2XpWsuwwUOnkTdOHu+P6lU7
	4IcqEGCrkl9VZsLPchNNMQAxqIshhPD33SBzB9a7Oy/qf8LNzl5XJXc5rFBTLi0UMUZO1FZhvtq
	WUXirx+WMigdpJEJ99SxVRBcpAYcp27+tJbtWnx0pvZ/LJINODgn0HaNHtOMuAtHkBXwM8Tozp/
	0a8HamZbnBPLbdJ11uprTeUtWWQTRpwyxDUMsUjQvgl7By8gXRJHSvzYanL/WKy/HptFvC6bfIn
	02jEuQGkNMOEQ==
X-Received: by 2002:a17:90b:268a:b0:3a4:93c3:9365 with SMTP id 98e67ed59e1d1-3a4f317895fmr1712145a91.34.1790857744659;
        Thu, 01 Oct 2026 05:29:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f774beedsm1599162a91.3.2026.10.01.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:29:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 1 Oct 2026 05:29:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev, Eric Liu <liuer@nvidia.com>,
	linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] rtc: nct3018y: report chassis intrusion through hwmon
Message-ID: <45520c29-aadd-48ab-a67c-a3b9ee4f3277@roeck-us.net>
References: <20261001054108.3346426-1-liuer@nvidia.com>
 <20261001054821.AEF6E1F000FF@smtp.kernel.org>
 <20261001072948351dc257@mail.local>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001072948351dc257@mail.local>

On Thu, Oct 01, 2026 at 09:29:48AM +0200, Alexandre Belloni wrote:
> On 01/10/2026 05:48:21+0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] rtc: nct3018y: hwmon device registration violates layering guidelines
> > --
> > 
> > commit 12bf4b0b27866f7565ebcc7b10db8faf4943fb10
> > Author: Eric Liu <liuer@nvidia.com>
> > 
> > rtc: nct3018y: report chassis intrusion through hwmon
> > 
> > This patch adds an hwmon intrusion alarm for the chip's chassis intrusion
> > latch. Reading it says whether the chassis has been opened since the latch was
> > last cleared; writing 0 clears it and re-arms.
> > 
> > > diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> > > index 2f7ad57057a4b..194ba077363aa 100644
> > > --- a/drivers/rtc/rtc-nct3018y.c
> > > +++ b/drivers/rtc/rtc-nct3018y.c
> > 
> > [ ... ]
> > 
> > > @@ -491,6 +494,95 @@ static const struct rtc_class_ops nct3018y_rtc_ops = {
> > >  	.ioctl		= nct3018y_ioctl,
> > >  };
> > >  
> > > +#if IS_REACHABLE(CONFIG_HWMON)
> > 
> > [ ... ]
> > 
> > > +static void nct3018y_hwmon_register(struct nct3018y *nct3018y)
> > > +{
> > > +	struct device *dev;
> > > +
> > > +	dev = devm_hwmon_device_register_with_info(&nct3018y->client->dev,
> > > +						   "nct3018y", nct3018y,
> > > +						   &nct3018y_hwmon_chip_info,
> > > +						   NULL);
> > [Severity: Medium]
> > Does this violate the hardware monitoring subsystem architecture rules?
> > 
> > Registering a hardware monitoring device directly from within
> > nct3018y_hwmon_register() in drivers/rtc/rtc-nct3018y.c bypasses hwmon
> > maintainer review and pollutes the RTC driver with secondary hardware
> > monitoring code.
> > 
> > Could this hwmon functionality be decoupled via an auxiliary device driver
> > located in the hwmon subsystem directory instead?
> 
> While this is not an issue to register the hwmon driver from rtc, this
> still needs a review from the hwmon maintainers.

I don't usually do that, because I have been told several times from people
submitting hwmon drivers outside drivers/hwmon that I am clueless about
hardware monitoring. From my perspective, every hwmon driver outside
drivers/hwmon gets a free ride and is the responsibility of the subsystem
maintainer.

Guenter
