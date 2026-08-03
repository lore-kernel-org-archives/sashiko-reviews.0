Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1C3AE1AF
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790516; cv=none; b=Y7g3S6w03u0uW38wDz9tzqPXAHG22UtMwMUPuBLAMXZO9gT/S47nIudibMu/U+0Ui951UUKQHzjWkGliOxzmYGAYBAmGNBZ8I8S+2tMsbUTk4NJDr3q758TdkPgUbF1rdiIZZSf/NEmfl2QkFTjGEkFJmhlQbm/+WR4JlBVrL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790516; c=relaxed/simple;
	bh=BgsAwpUzDQBIT+HF1gKLi+DdWbSVovW5ofJCSPcSdjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR5xQx4Y8F6yHVEvylJtX4IKb34KHm1yUKV2W89deMzNcquRfzZC4hWCLthHcGSqT9TsA/9zUETgl/XaJnT6/rCv4x2nG9Z5thV3rs/UkdLpluEWbsDWCKjV1loO4C3GvvAGjVG6PRxp5FY1BkP4mqvjelfE5wMafbUnpbkKN44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMcJmVHw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMcJmVHw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720f3bf164so193769f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785790513; x=1786395313; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHA0Rp1gGRF6nGr+o0rQ0J4609nkyA5NKjL7qIfbGSk=;
        b=oMcJmVHwQZZUEJfiNn7qTudMnOAUiFGo1ztHFc9jMfWtSX025KP93rZ64NUGiRL7yJ
         OF76062zdFqX9X+1hnmOPH99CXNAh+YxdPEWdrmOXVfH8xZzVZDTPHbPVpKZeOc7tMD9
         QipSSYg6sLMzgqDO/RJbEhWHScb9i73ZYf+OclKs8PSuPSiNvYo/9RBynz7k6U1HRY26
         3s0tz3KOpkjafJHrxBKMuTlTC9CDgGRVmJ2WwNd1JjxKpbESotkg4RXn0plIPRE5FDGv
         YXXfJ15ZmSpYDGTFA62LtFA5t8ibG2jTSNj41EmrTVCb4Hly/Qe6Wx4KUfJbuKNFU02/
         Oz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785790513; x=1786395313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHA0Rp1gGRF6nGr+o0rQ0J4609nkyA5NKjL7qIfbGSk=;
        b=ZBdA1OZ2H76PP05QrfvjRWOlg1TZ2PxNBWTSBrSz3Ljo6jHmKL8z7PIFE9JqXJ0yhv
         wOMFXku5t025w+DbKZcabGP3Rf4wFEBYQPKUDB2ZmD0W9k51+brSPaOI3a6ELSVMVm+a
         YU54aISoSzhy6ye0l7jyhFRVLrI4eop4EmkX8JQEoYAF+v8Eiy9UrkNa/tv+tLgHi+Av
         j1wJpzLEat4bH5XikumS+4dnC3NM60JaSe/385xCgxpuwtC575LFsp+pLCOdabtbv0Fg
         sM9Ob362oGLtMLl0K7ossbRoCzB6PoTmtHjK7QcJjQ/clEuPU5PgIDPK8H8En5fuDKqP
         HSmw==
X-Gm-Message-State: AOJu0YxLGwdM4ZWh3c5luElTJ1R50TIj0IgKvmaUj6CQoInf7EScEz5b
	O6MQhCdiInMYUNDjD9oB0m82nPSnM3jMqs4hKNGAW8U+vjNtcVw0KWmm3wV/YA==
X-Gm-Gg: AR+sD12j9y9Q4pJaQ6v02rVG5PZ/IfB3Jamo+dD/BgZ9x++OUHEAjtfQpfHk6ErhYa3
	Dkwa/sT6uPYy/glzLzJDSReiGQ4WIkxxb/jtW6Dfz5g2z38FxcxiXk3Mx/vvKUMS3Y6WwSE3Bbu
	iQlo1wUlQZUlKr/EEjRMyiHTSPorCiz40dY6MpY7MYJ6l5o88BfqqXN+WkGIV1SeMAoOKn/39o+
	TLEu23rPmsfL2Ch5ienRz6Hb/lsfuz813uvovEMGbaJu8ALIjVRw3iWlcNjZuV+OmdtEzTsKbAv
	ixSC/dWFtWbkJbPeKfy8tu5VTtgOKL8kFSe9FheUxX4A7mdGkPT/Cz4pli5qyqemWz+MSJRsKOz
	MzJa97WJw7PAyi0wHZb8VSNZ1lQWXY3M57DH4iMWCO2+0L4zo/pP2bMkx2/cp8zoXZ5QrMDW+UF
	gOucwm6Fv25+qxEJHI7be3RsZWawXII2LJRnRqejEECfaEPv4aUtXxsjhp+gOnKsw4Tg==
X-Received: by 2002:a5d:5412:0:b0:47f:e746:dcab with SMTP id ffacd0b85a97d-47fe81b3b3fmr1985661f8f.10.1785790513110;
        Mon, 03 Aug 2026 13:55:13 -0700 (PDT)
Received: from antoniarch ([78.209.183.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2abbsm36731917f8f.9.2026.08.03.13.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:55:12 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:53:41 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 5/8] rtc: abx80x: use regmap instead of I2C specific
 API
Message-ID: <anD_b4RX2Lz0kHs7@antoniarch>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
 <20260731184831.44037-6-apokusinski01@gmail.com>
 <20260731190559.39CCB1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731190559.39CCB1F00AC4@smtp.kernel.org>

On Fri, Jul 31, 2026 at 07:05:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Variables declared as `int` are passed by reference to `regmap_read`, which expects an `unsigned int *`.
> --
> 
> --- Patch [5]: [PATCH v3 5/8] rtc: abx80x: use regmap instead of I2C specific API ---
> commit 5bae78c37282c7d7693255ad432126ac7e8c51f8
> Author: Antoni Pokusinski <apokusinski01@gmail.com>
> 
> rtc: abx80x: use regmap instead of I2C specific API
> 
> This commit reworks the abx80x RTC driver to use regmap API instead of 
> i2c_smbus functions. This prepares the driver for future ABX81X SPI support.
> 
> > diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> > index 4ac3ace687a1e..23823fc2f5458 100644
> > --- a/drivers/rtc/rtc-abx80x.c
> > +++ b/drivers/rtc/rtc-abx80x.c
> 
> [ ... ]
> 
> > @@ -221,8 +224,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >  
> >  static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
> >  {
> > -	struct i2c_client *client = to_i2c_client(dev);
> > -	struct abx80x_priv *priv = i2c_get_clientdata(client);
> > +	struct abx80x_priv *priv = dev_get_drvdata(dev);
> >  	unsigned char buf[8];
> >  	int err, flags;
> >  
> 
> [ ... ]
> 
> >  	/* Clear the OF bit of Oscillator Status Register */
> > -	flags = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSS);
> > -	if (flags < 0)
> > -		return flags;
> > +	err = regmap_read(priv->regmap, ABX8XX_REG_OSS, &flags);
> 
> [Severity: Low]
> Will this cause a compiler error on GCC 14+ due to incompatible pointer types?
> 
> The regmap_read() function expects an "unsigned int *" for its third argument,
> but "flags" is declared as an "int" here.
> 
> It looks like this same issue with passing an "int *" to regmap_read() also
> happens with the "flags" variable in abx80x_rtc_set_autocalibration() and
> oscillator_store(), as well as with the "data" variable in abx80x_probe().
>
I compiled this with arm-linux-gnueabihf-gcc (GCC) 15.2.1 and did not
experience any issues. But it's no big deal to have make the `flags`
variable an uint, will change that in v4
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731184831.44037-1-apokusinski01@gmail.com?part=5
