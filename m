Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC474DA9A0
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668327; cv=none; b=dOKgzpPQEc44aj1Q6O1TgjgcDsOv41DLPmZp97ffdckD8O0ZQk42C4rP3dmusduzblSSdzaSd8OYHNMAmkoPxg4AzBTwK0ZcWXzY0DfnFrQs4DdJH85MfN7zF4u4+vIxsQIfx/qtgPgOnjV788mwnXhxKp0zNDoh3cCcUvQzNMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668327; c=relaxed/simple;
	bh=MbLE0/tphrYEhfD98JIFLgdMtoiQslM//snl30eHR2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOOePk/OwGQkwI/wVPjF3frbDOqwDJsudbyFZcrPWFvdx15hnl+QTu4BR4MgjXGCpy4wkv/gpxyPzqmHqVIwDZD1A+81iaShMlgR6a3BLUMoWYro1MQbjxKz3cZ3UQn1Qee+QvOeFEns/vwh6Ahs4Bi5qemDyAWL/QNg9cbqhr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL/+onTv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL/+onTv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso8570455e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668322; x=1790273122; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3zIgykrgkmh6eNKEplSOXvIBXzQuOLD+0yjUNIOrOE=;
        b=NL/+onTvYYf4Lk359E9djLN49TN6bln7jTyE81TjEHgBEC8iDkidPY7DH0nJCFqLLZ
         HzF4P7QLmpKjYnUyz5sDTGNTSSVU8iJb5Bw+/q32r705Br08de1AGWFO5W6BAfqFacoE
         nO6gvWHRDkfGJRxgZY69NTqEAVXXzNE5W8bSpl7bItwDO/vIeK8N8St5HTQ73QuGB1if
         kFRQ2XvpvBnhSsF9aIrH7HrExSp7zNWl1dW8RxQt1SKj0eFfxC+z66YBhvHSWWmfoaCP
         5gtZaqlIyc7JF59N/CYiOA9uw11JP6Ubiw+DrLFfggKS/Hr+TzT69eeEkSHTmI2aB5WX
         UGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668322; x=1790273122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B3zIgykrgkmh6eNKEplSOXvIBXzQuOLD+0yjUNIOrOE=;
        b=PGsJWHTh5a4QkbCV2Jgd2gxiW8ucaM+6OYVM08G8oV9kYcvDslUn476PrGU39fFeLs
         oZ31GkwGJzKrQ2EwrbaQM1fu8VWDbJLOt9opfIV+mXnVhIKe3ZBrCB03Sj0m9c/hx/hj
         7jkT3yDR/GqHjUjzjjTpqWq9sWEYQVP+btsnJ7RXjnwyTRobj9se+VHoko5g3MTdyY8/
         cwUoC0NCSnCcNzEkw5eidBi6FXJxxEs/5I3sSnOHAJuofuihZ/kRIfl3yj0Xkjur/hSl
         yfIFA6LAC/nHBmXpzbwgxGakG4vhIf21Rviba9fLGaIg4TYXOsqgpFIC5ElYsuje/1xa
         lHhw==
X-Gm-Message-State: AFuF++kKyBM8Kwecvhc9NhHqI7XoKwP813x9YdXpY4FR6a3uSDqoEO7y
	EUOVCdEIDhhsQ3lv/poGa5NpzJE6OvJ7oeSrb2OnH64l5N7LGbhuImy2bkNCxQ==
X-Gm-Gg: AYBFou0LpGzC3lqW5/RdHC+xPK04A+8rOJD/xUJmWrC2izB3azGYOZr0Xc/83XtWmTn
	ouF7LLok4ryGADvFIJri1Yw5nC0njFa7OPoyO1bJMZfxqTYLOHaXP1PW/Mf7+BSOBJvRB0i8eym
	nz5LFyO68cnfJfn6sPXZbhHS2kFeifhHk8u55BM9B4n6WUqIoIAQ3H5kH0eF2vl4wq5m8XRGVFn
	5H3hb+nDlAnLtWPVUH+WolxELjOU0rOPJbIyugrkbWz2ooto8sRqr7YC7BR29yiLQFYt1pA5Eua
	Hmg60xSviL89yNl1SAZlMxEGkTy7RYmkPa0toNVjJP5ccaTXTg3aqQ5VS2fWDWjIclhsSGmke4c
	FTJ0J4GH7mrFzUibLxNhTGqx+Q7u2vqqfZF+Ogy4jXi3ZzgYIs8xizxRHMz9S6lX/SL6BKvJKph
	vuf76LC1b/baJ0taPVWYF4v9+0AA5pZ0tDf+eiMujio4NXA6u4lDOn1pXVTN96qpXIkg==
X-Received: by 2002:a05:600c:46cd:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49eb7329ee2mr98391675e9.25.1789668322211;
        Thu, 17 Sep 2026 11:05:22 -0700 (PDT)
Received: from antoniarch ([78.211.139.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm112207695e9.15.2026.09.17.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:05:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 20:03:34 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 7/9] rtc: abx80x: replace read-modify-write pattern
 with regmap helpers
Message-ID: <aqwq25uszbldkd2E@antoniarch>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
 <20260916205138.16771-8-apokusinski01@gmail.com>
 <20260916210520.96B6A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916210520.96B6A1F000FF@smtp.kernel.org>

On Wed, Sep 16, 2026 at 09:05:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] rtc: abx80x: hardware unlock broken by regmap RMW helpers
> --
> 
> commit aad0cc39d854acf9e4ccd3b1fa7b17484a428c9a
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: replace read-modify-write pattern with regmap helpers
> 
> This commit refactors the driver to replace open-coded read-modify-write
> sequences with the regmap_update_bits() and regmap_write_bits() helpers to
> simplify the code.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> [ ... ]
> > @@ -403,13 +388,15 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
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
> Since regmap_write_bits() performs an internal read-modify-write cycle, will
> the initial read operation consume the configuration key unlock? 
>
Everything alright here, read operations do not cause the configuration
key unlock.
Same thing applies to all the comments below.
> It looks like writing the configuration key only unlocks the very next 
> transaction. If the regmap helper reads first, the actual write might fail 
> silently and the hardware would reject the autocalibration settings.
> 
> [ ... ]
> > @@ -486,24 +472,14 @@ static ssize_t oscillator_store(struct device *dev,
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
> 
> [Severity: High]
> Does the same issue apply here in oscillator_store()? The internal read 
> within regmap_write_bits() may consume the unlock key, preventing the 
> oscillator selection from being properly updated.
> 
> [ ... ]
> > @@ -946,8 +889,14 @@ static int abx80x_probe(struct i2c_client *client)
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
> 
> [Severity: High]
> Could this cause the power leakage mitigation write in abx80x_probe() to be 
> rejected by the hardware because the unlock transaction was already consumed 
> by the regmap_write_bits() read phase?
> 
> [ ... ]
> > @@ -1014,11 +949,10 @@ static int abx80x_probe(struct i2c_client *client)
> >  	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
> >  		return -EIO;
> >  
> > -	err = regmap_write(regmap, ABX8XX_REG_OSC,
> > -			   data & ~(ABX8XX_OSC_ACIE |
> > -				    ABX8XX_OSC_OFIE));
> > +	err = regmap_write_bits(regmap, ABX8XX_REG_OSC,
> > +				ABX8XX_OSC_ACIE | ABX8XX_OSC_OFIE, 0);
> >  	if (err < 0) {
> 
> [Severity: High]
> Will the interrupt disable write also fail silently here due to the unlock 
> being consumed by the regmap read?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916205138.16771-1-apokusinski01@gmail.com?part=7
