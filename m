Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D976C417BE1
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828533; cv=none; b=ka9xQHDJwA6HbroojjKa601H9y0aifNXZvQQ382Ltgxy6EWR8mUqu7QiMhJF3UhZRNJVBjOITAANYiM9JJ7dnRQcxWTCIPYB9Hij5Sdzwcf8kTvsFiWlgaJrAlq/dCGM7VZXTM3ONoHxZLCq39IPX+zvQG2f7k9crCHx60y0Hz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828533; c=relaxed/simple;
	bh=B/zNBgXVZyKUjBeBKaBVWmqIpKEITY2JufcS0MhbhV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il1iVaSoZdr1E0xSSbwxoTrfpuL2RqCOlZ58UiSlEUt1V3L4T0AGoLP89jJ0721mK1s/J1v9O9T9PUYAyHEHsz4jKhWgmy0nnWN/FEUJE/beOc9YEUO8SbhuinUrpERf+N6hXkeW+b9euXJD8b8kACrGXpuWMxuRkMSLzpMUsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z61FpSLS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z61FpSLS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954d383e64so6310855e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828521; x=1785433321; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvvOjkSIIOXtcwPEkIypGzvmNd95Ui/vslKtK/NZXXc=;
        b=Z61FpSLSU8gShSaJhoUrxAfOtKoaDeayxQHYK+UnCiNiJQmnxcdhytsYdJ2URvcK9I
         LxpoIbAtWsytaRr72ayWN5SjDx3ATemhoMnAEU5XWYQ/EBVCZCiPcRCnOt/nz5ntWzGj
         Fotd0GPO5J2SRKa4px6uB0ddRW9S9HAbahWx073XUO21FPImQ42wSDZrUc3NICvqlSbk
         1gay+1mYz6pEqad1/81WE86UB8EB9U+pS9LWH5hlIXfgbQdxZC/rpi9bS0twwGcnyZ1Y
         ksJ8nsn8aBT8KXbyqsIGtZpf0Xr9I8oB3doCSf2N1mPn+1frbN+jbf6fcunxL4B9jx1G
         /eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828521; x=1785433321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CvvOjkSIIOXtcwPEkIypGzvmNd95Ui/vslKtK/NZXXc=;
        b=DIamSMiXem20JI4VAyqHEt7eobZLMu0A4sNO9wH4I4VJgxnYAdcOYlgg7yrhONCUOy
         Mvqi/nU1Gs/flUmNan83UnXChrlgLEwMVVwLgR2nK89Qed7SrVm9yviZMBxXPTSFYA3Q
         X6tNfZL4oSihAdIpVuHteRA9VnxwD6qip0/t3WCJnkEb9GuadR95rGynzyaBFYpPIkUj
         ypYDx3IwpJpySBtKHrMlwuENPOPiKD2UgtIuHJMRJ7JfRMigZ1IPF6TGAYEO//uDqikO
         FfemEpB4polOkqT4U4D00D3sYOiQIu47IqSRxjzA0n5K+eyz02gGeWBcwi5stGh7Oz0R
         oz9g==
X-Gm-Message-State: AOJu0YyIg1ocEmF3h8q4rbMt9OOhqZHLwaGYYpQX9+9kHw4CdNFWXtXj
	OdR0EkXVwQscEV/tVeKnWiQX41J8H3YF3a7hE7EQSnZdeELhrY3q/6DSItos0g==
X-Gm-Gg: AR+sD12Gai7yGO09/UV71LMvUvk9z45MXv6Tc98BxYr/y0Xuz+GooZBTOWs4ub4bj8z
	i3SMapzcOMLFGXku4c08f/bLPRymhvjTXZnfrptOosk60L7zD+P3hKTtHRyOWmJFk/OyWFOHTTq
	e1PDoOpxO3jFmtP+GgaL33+2As63EXpMGlBVtHhHm/Sebt8rl3VM0zQNe3hAgal5Z/SpJOHxoiU
	O8mNIZaHaisWjPPSvDWY+7pZTM5iCyV/5PEjj4znC+SKdp8wV9k9Ov1vRecPkuTgSoMwRAUBjhZ
	ryQGp2xy9Lnl8ijOnK52EQu2tGseGjZJx4o8I6oReO+bhE0F4Wpfs40ugLhh9W529PzPd0DZfEE
	90mhx96Fl6ayVGdxkQEcJduXsZ1IDOhd6i9hec7TGVRyRJcuJqC1afsYXl6pwG/+G6tyLIrJUeo
	rqNGI0
X-Received: by 2002:a05:600c:4689:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-49573d37f29mr49484495e9.37.1784828520954;
        Thu, 23 Jul 2026 10:42:00 -0700 (PDT)
Received: from antoniarch ([78.212.250.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm16520989f8f.10.2026.07.23.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:42:00 -0700 (PDT)
Date: Thu, 23 Jul 2026 19:40:36 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/6] rtc: abx80x: add irq to struct abx80x_priv
Message-ID: <amJPSCvn_ufaDxvL@antoniarch>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
 <20260722195814.298552-3-apokusinski01@gmail.com>
 <20260722201354.3BDA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722201354.3BDA11F000E9@smtp.kernel.org>

On Wed, Jul 22, 2026 at 08:13:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The shared IRQ handler unconditionally returns IRQ_HANDLED and inadvertently clears all status bits.
> - [High] The `abx80x_read_alarm` function fails unconditionally on success due to incorrect error checking.
> --
> 
> --- Patch [2]: [PATCH 2/6] rtc: abx80x: add irq to struct abx80x_priv ---
> commit ccef71986338cc749e8440b88d073968d465ea5c
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: add irq to struct abx80x_priv
>     
> This patch moves the irq number into struct abx80x_priv so that it
> is no longer tied to the i2c_client. This allows the irq number to
> be accessed in the case of ABX81X SPI clocks.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 5486d9d0b1e5d..9b0e1d48d9ba3 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -285,11 +286,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> >  static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> > +	struct abx80x_priv *priv = i2c_get_clientdata(client);
> >  	unsigned char buf[7];
> >  
> >  	int irq_mask, err;
> >  
> > -	if (client->irq <= 0)
> > +	if (priv->irq <= 0)
> >  		return -EINVAL;
> >  
> >  	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
> 
> [Severity: High]
> This is a pre-existing issue, but doesn't i2c_smbus_read_i2c_block_data() 
> return the number of bytes read on success?
> 
> Looking at drivers/rtc/rtc-abx80x.c:abx80x_read_alarm():
> 
> 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
> 					    sizeof(buf), buf);
> 	if (err)
> 		return err;
> 
> Since it returns 7 on success, will this unconditionally fail and return
> early with an error code, leaving the alarm structure uninitialized?
> 
> [ ... ]
True but this is fixed in one of the subsequent patches where the
regmap usage is introduced.

> > @@ -921,19 +925,19 @@ static int abx80x_probe(struct i2c_client *client)
> >  	if (err)
> >  		return err;
> >  
> > -	if (client->irq > 0) {
> > -		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
> > -		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> > +	if (priv->irq > 0) {
> > +		dev_info(&client->dev, "IRQ %d supplied\n", priv->irq);
> > +		err = devm_request_threaded_irq(&client->dev, priv->irq, NULL,
> >  						abx80x_handle_irq,
> >  						IRQF_SHARED | IRQF_ONESHOT,
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since the IRQ is registered
> here with IRQF_SHARED, does abx80x_handle_irq() correctly handle shared
> interrupts?
> 
> Looking at drivers/rtc/rtc-abx80x.c:abx80x_handle_irq():
> 
> static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
> {
> 	[ ... ]
> 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
> 	if (status < 0)
> 		return IRQ_NONE;
> 	[ ... ]
> 	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
> 
> 	return IRQ_HANDLED;
> }
> 
> If no relevant interrupt flags are set for this device, it still returns
> IRQ_HANDLED and writes 0 to ABX8XX_REG_STATUS, clearing all status bits
> including non-IRQ bits like BLF. Can this break other devices sharing the
> interrupt line and silently drop hardware status flags?
> 
Yeah so this looks like a genuine bug and should be fixed in a separate
patch I guess. In REG_STATUS we should only clear the bits AF or WDT if
they were set.

> >  						"abx8xx",
> >  						client);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722195814.298552-1-apokusinski01@gmail.com?part=2
