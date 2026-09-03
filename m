Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56744C510
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470844; cv=none; b=Joh3cNg2i1S96Gi+lChByahulbQ4jVPXdA5uu6NkG0Buj2W3APWIICic9K9HYG90zv8Rxs9vI1JVy0aIuNnx61y3wE1hkI5cLXxDaB0GPUDDXjJ3USD6sim7GvG6qQcHWDeR4Bu3BaNDU+I7gQKgzK/J/IpmxBzqVd7KGZ+d7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470844; c=relaxed/simple;
	bh=kUkSXTZLhLA2QWHEHsiyArlR9F8Ruokyio5y/z/pclc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+fn/0nsd4w6lGTHslCrfiPpQq1koEfhfUumx2JhldtCZAzgSKOR4hCZ0pUfbSR6IGmTYnlF/nx7Lc9NFgfANafL5EI2UgjfBr0RSXnj6vO64T39poQj48YdMSgvHkWFYuBUuwxes3qfG6ytfmBtQYHbRiuXo6unAuAVCkF6jq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzHRmxji; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzHRmxji"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso3651835e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788470841; x=1789075641; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgBBSDAaq2t4nQ7NDocNrv3fCojXwrkA3tUs1O0KWmQ=;
        b=WzHRmxjid0EjrRnv7sUf+AHVqNBDjMGjCZKp/uGwl7xmFacnpl400XK4N3+DtvG4rj
         +ZCagwoBSFnmu4915CnZh/t+rqFl/zIXX4lWq/eQffqFC8LVlIwXzMEeaYKabbrMivWO
         YxDipC/Ab4R3VU70FNTGkiwkvhry6kboRYzxGsfDCu7qAi8gOXd7wI3yBO5fCv62qSLf
         yeQYi98DLCccyOYqSO6HJcaPW7NtGLMnYiRIBnNzl9gWm4Ay7nrtHIOG4jKwrsoWYrHB
         8li9I7F2SdRh3kJyBEbYaPj69wG6JuFbgPA5+mz2uN9CwDIFK/Aig5eR9K9hc6h7c0+P
         Pqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470841; x=1789075641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VgBBSDAaq2t4nQ7NDocNrv3fCojXwrkA3tUs1O0KWmQ=;
        b=IDvx5hCg2Aw1XlFPQJSyNtT7TYb+rIBn+6tsQI47wLCIXH/jzmA756JyPnQ8M6At3o
         DREww4syPuc2VVcWJjAvFj/NwOVxfwOM9N6+04fdM6idZNykv95fZEYIA9fS/7PL/Q7w
         8xbHI1l3Kz8XVH4bnosh6WkdZAmUiikY9sXQFXFfl6KC4Pxoqtxn0tE6uI8jnXLdNbb7
         VpiRFGHzJR9oHhtHYeig7ZdxEdzC7TIM8au0uY5XNHYdKpwgqqWRT2/zYw3LJrZIR1XT
         fVyIuqtheefalkqbsFMCPLGrFBX8G9fTCfC0ZwmlSfduPTUHbUmdGCfqCLWh4uLhvUte
         SILg==
X-Gm-Message-State: AFuF++lzz8Lk8E6Rzv6oNCa9zDoUgOa898iEeQlZ1nerlc7Ho7HTEFlm
	a8kij1WMGul2xa6F3AK5WQrBdWclIRDZMJDpOpp6uRV7whFMUbNwScjJpfTTuXqQ
X-Gm-Gg: AYBFou1be1FpPi9GcKJF15g1eOH3EEWGibLXbCCWbXJ7f5OTvtb+Zb5JXa3hX1D+5jz
	Vz9VZKWMaGhoW7zKsHFYH8LVyTj8dMQ3pa5okcxLZx8Az72BZxiWrNUdBD5RFx61tnBH19qaEFr
	Xt+NZ9oe5FFdFPBHHJmSbgnwA4xmui+nELhEWLJpU8nrR9+uvXr8Pr9yzdhqZarvCgtPYZdtfQ3
	dAXC9TpRyqEzxgLqq7VzEISwVzRdecN33towFfa3odUSJ0rX55bdUnxqyk9eAu5i+NB5fyzNJs5
	VB90iwIMG9USBwMqGERUmHli/ZpXf8/9n1Ik5vFq84DmCqqtJtnF8NXoeCUFAsL9lSPwf6TXEN1
	xrjQNgrqDMRXGdEfKBcs+c1nyM37cNetPsucWWOKLae3EU4xnytya3nQQV5/aKs6e9Dbzwo4/+9
	RIYOWdnAPp7/uFv6DpW7bpy6enK1p3N9luyBGeYkXQWhs0n2aAjbglRmpX2DKW
X-Received: by 2002:a05:600c:4f4b:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-49cf823f53emr13629615e9.9.1788470840333;
        Thu, 03 Sep 2026 14:27:20 -0700 (PDT)
Received: from antoniarch ([78.212.5.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm103139705e9.11.2026.09.03.14.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:27:19 -0700 (PDT)
Date: Thu, 3 Sep 2026 23:25:37 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/9] rtc: abx80x: replace read-modify-write pattern
 with regmap helpers
Message-ID: <apnk5g2XZqVqeLRZ@antoniarch>
References: <20260811194034.28937-1-apokusinski01@gmail.com>
 <20260811194034.28937-8-apokusinski01@gmail.com>
 <20260811195654.8590A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811195654.8590A1F000E9@smtp.kernel.org>

On Tue, Aug 11, 2026 at 07:56:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The patch replaces read-modify-write sequences with `regmap_write_bits()` after writing the hardware configuration key, breaking the write-protection unlock sequence.
> 
> Pre-existing issues:
> - [High] The probe function attempts to clear interrupt enable bits (`ABX8XX_OSC_ACIE` and `ABX8XX_OSC_OFIE`) in the protected Oscillator Control Register (`ABX8XX_REG_OSC`) without first writing the required configuration key (`ABX8XX_CFG_KEY_OSC`).
> --
> 
> --- Patch [7]: [PATCH v5 7/9] rtc: abx80x: replace read-modify-write pattern with regmap helpers ---
> commit 6808e36654fbc0a72e9b540a05e0f2557530aa65
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: replace read-modify-write pattern with regmap helpers
> 
> This commit replaces read-modify-write sequences with regmap_update_bits()
> and regmap_write_bits() to simplify register updates.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 5d41882f3c704..ab88af43b4fa0 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -403,13 +389,15 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
> >  		flags |= (ABX8XX_OSC_ACAL_1024 | ABX8XX_OSC_ACAL_512);
> >  	}
> >  
> > +	guard(mutex)(&priv->lock);
> > +
> >  	/* Unlock write access to Oscillator Control Register */
> >  	if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_OSC) < 0)
> >  		return -EIO;
> >  
> > -	retval = regmap_write(priv->regmap, ABX8XX_REG_OSC, flags);
> > -
> > -	return retval;
> > +	return regmap_write_bits(priv->regmap, ABX8XX_REG_OSC,
> > +				 ABX8XX_OSC_ACAL_1024 | ABX8XX_OSC_ACAL_512,
> > +				 flags);
> >  }
> 
> [Severity: High]
> Does this change break the configuration key unlock sequence?
> 
> The configuration key unlock only allows a single I2C write operation. Because
> regmap_write_bits() internally performs a read-modify-write sequence, it
> initiates an I2C read transaction before the actual write. Will this inserted
> read consume the unlock key and cause the subsequent data write to be silently
> rejected by the hardware?
> 
> The original code explicitly read the register before unlocking it to avoid
> this sequence.
> 
> [ ... ]
> 
No it won't because reads do not cause configuration key reset.
> > @@ -486,24 +473,14 @@ static ssize_t oscillator_store(struct device *dev,
> >  
> >  	guard(mutex)(&priv->lock);
> >  
> > -	retval = regmap_read(priv->regmap, ABX8XX_REG_OSC, &flags);
> > -	if (retval < 0)
> > -		return retval;
> > -
> > -	if (rc_mode == 0)
> > -		flags &= ~(ABX8XX_OSC_OSEL);
> > -	else
> > -		flags |= (ABX8XX_OSC_OSEL);
> > -
> >  	/* Unlock write access on Oscillator Control register */
> >  	if (abx80x_write_config_key(dev->parent, ABX8XX_CFG_KEY_OSC) < 0)
> >  		return -EIO;
> >  
> > -	retval = regmap_write(priv->regmap, ABX8XX_REG_OSC, flags);
> > -	if (retval < 0) {
> > +	retval = regmap_write_bits(priv->regmap, ABX8XX_REG_OSC, ABX8XX_OSC_OSEL,
> > +				   rc_mode == 0 ? 0 : (ABX8XX_OSC_OSEL));
> > +	if (retval < 0)
> >  		dev_err(dev, "Failed to write Oscillator Control register\n");
> > -		return retval;
> > -	}
> >  
> >  	return retval ? retval : count;
> >  }
> 
> [Severity: High]
> Will this regmap_write_bits() call also fail for the same reason? 
> 
> Since it follows abx80x_write_config_key(), the implicit read operation will
> likely consume the unlock key before the write occurs.
> 
> [ ... ]
> 
No, same reason as above
> > @@ -946,8 +890,14 @@ static int abx80x_probe(struct i2c_client *client)
> >  		if (abx80x_write_config_key(&client->dev, ABX8XX_CFG_KEY_MISC) < 0)
> >  			return -EIO;
> >  
> > -		err = regmap_write(regmap, ABX8XX_REG_OUT_CTRL,
> > -				   data | ABX8XX_OUT_CTRL_EXDS);
> > +		/*
> > +		 * Avoid extra power leakage. The RV1805 uses smaller
> > +		 * 10pin package and the EXTI input is not present.
> > +		 * Disable it to avoid leakage.
> > +		 */
> > +		err = regmap_write_bits(regmap, ABX8XX_REG_OUT_CTRL,
> > +					ABX8XX_OUT_CTRL_EXDS,
> > +					ABX8XX_OUT_CTRL_EXDS);
> >  		if (err < 0) {
> >  			dev_err(&client->dev,
> >  				"Unable to write output control register\n");
> 
> [Severity: High]
> Similar to the above, does the implicit read inside regmap_write_bits()
> consume the configuration key unlock for the MISC register before the actual
> write happens?
> 
> [ ... ]
> 
No, same reason as above
> > -	err = regmap_read(regmap, ABX8XX_REG_OSC, &data);
> > +	err = regmap_update_bits(regmap, ABX8XX_REG_IRQ,
> > +				 ABX8XX_IRQ_EX1E | ABX8XX_IRQ_EX2E |
> > +				 ABX8XX_IRQ_TIE | ABX8XX_IRQ_BLIE, 0);
> >  	if (err < 0) {
> > -		dev_err(&client->dev, "Unable to read Oscillator Control register\n");
> > +		dev_err(&client->dev, "Unable to update irq register\n");
> >  		return -EIO;
> >  	}
> >  
> > -	err = regmap_write(regmap, ABX8XX_REG_OSC,
> > -			   data & ~(ABX8XX_OSC_ACIE |
> > -				    ABX8XX_OSC_OFIE));
> > +	err = regmap_update_bits(regmap, ABX8XX_REG_OSC,
> > +				 ABX8XX_OSC_ACIE | ABX8XX_OSC_OFIE, 0);
> >  	if (err < 0) {
> > -		dev_err(&client->dev, "Unable to write Oscillator Control register\n");
> > +		dev_err(&client->dev, "Unable to update Oscillator Control register\n");
> >  		return -EIO;
> >  	}
> 
> [Severity: High]
> This is a pre-existing issue, but does this register update require unlocking
> first?
> 
> It appears the probe function attempts to clear the interrupt enable bits in the
> Oscillator Control Register without first writing the required configuration key
> (ABX8XX_CFG_KEY_OSC).
> 
> If the configuration key is not written first, will the hardware silently ignore
> this write, leaving interrupts enabled if they were previously set by the
> bootloader?
>
Yes, will be fixed in v6
> If an unhandled interrupt (like Autocalibration or Oscillator Failure) fires,
> could it cause an interrupt storm? The IRQ handler abx80x_handle_irq() only
> checks for AF and WDT flags. Since the IRQ is requested with IRQF_SHARED, an
> unhandled interrupt might result in the kernel disabling the shared IRQ line
> and breaking unrelated devices.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260811194034.28937-1-apokusinski01@gmail.com?part=7
