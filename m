Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9530DD2A
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 17:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098844; cv=none; b=u48Q/DyGII5JROrIbLbSA5O8SVGks1lkV3Z3dzw0KUgnnf4v532scBzrHGWS17D5+tObQyAOxzV6dll8pjExaWmiraFUuy/eUItvhfTpi2BT8LC9SX6FgJudHjFpIsE6rsp43PhStUiq/QZPjlMGvU//WH+9MDOMGQOF8KPVUv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098844; c=relaxed/simple;
	bh=OonQPF5I7GcGEGSqLdKb//8FxMTxnN2jMAsNtpQQC0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHk9bIBMGtwoDzDiTK5kb3Wx21foDRmWoKg/Mj3B2n8mk/o6kCqXS9p8FZkW6K47GGyRKn+3INPOg537ixmwe+VsYJVcIuOyuTuAwtKD432o1+WaeqNYth17eFqSwxKgZ1CVkAXeP6AIUViaie03c4PWL5/+5w/NhxmZzBaf7yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF48BDnn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF48BDnn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso500387a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098842; x=1783703642; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwzAPzjMwDw5xOCIkXRylTPhzE1xkwbIJpXU1v7450o=;
        b=cF48BDnn3rR+IIlxnqI02VFCdaBfMJ9l1OXT1mG1TSDHLNcLmO1oECY609V8DkoLrb
         uoBAAUMR4Q/NHGz/bZhtWpYYbPTFisZAYr3LaCbIvnt74lCY9E3TVerujolk0R+Emd1N
         YvCUK0UUCEBr1Fg5MPzD4lyzt4srI1rMDCj6pS6sdoLlMA3GAoICqbpVbyqi+5qponx5
         l1StGpwCEtp2SQiiYrLRlZWYtyGNmYo8WTNhX4qAHXm54xAY7vZKZz92LwcqpHk6vK4e
         DQZzFVp9pOd/WZZDrE3S3cwY6REbF4VT6vYEh9QQ1vslj5MxeGHzXP7ltvHsaFDT52jk
         iSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098842; x=1783703642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwzAPzjMwDw5xOCIkXRylTPhzE1xkwbIJpXU1v7450o=;
        b=DI6p93oDGHQzjD3/JdgrK98l3tmkAOv+oDb1PDaH7B7EjZdhcExHO8nP/2/DThKmHe
         n51/4TYW/Qqv5wg0L26ure1FKdnHooRlaVe7+MCgoXOK5bejE+m25Q1RlUrm2OxShytl
         +IvZ1GUylZ0rZvsFhb8YBTLQIPogGJlgMw40WnwCSUtWoHqZYDKgVLxt4MQkP0+Dfcde
         AMViZEmlFjxyHQjgiHXNIgSq7pLfYiw/oAARkM7cXZUdfkgRoyAuPEL7izPbC1DcdCGy
         pqdZL6Ez7HO5kILhe2UXsvdcDP7cb9cwnnaJtuf/+Uanl8x2pUrOqQM5yNUxmV94fWS/
         oFyw==
X-Gm-Message-State: AOJu0YwQH2gtYZNpC1dzJljjFCOTrWiniUeRWD+Q4Cxks3vanX2NppMv
	zZmlJz+h5Hh6pVWAtkdFxUmqgmg4OD4NvPG8MBhtC2HJEZD4femR4t7J9q2ePw==
X-Gm-Gg: AfdE7cmvmTB+wuMj7rfWRhhdhnJdnhfYKIXFHtb75Fwe3AqpZZiRPLvtlfDEkwPP5tB
	wOoN3YWe0b4E/nTtMuinYD+ZUb01FJNJ9aoO/m2H8p8YC3uGzwLauqebjLz4zWAdNmn+mgEnswP
	/6ZUJCu/0HHeH61O06OsSUxcujGwibbJRAA91all0I2MwnCgWOAXItleAPoBQcs6he11GetxTPp
	zXV6VpmwGFHGnAJMc2gWDWqkJ4hkvRZNxqXv8uRjouuYD6ioacN8ceUcQk/lx/h1IrVKIYYTgkH
	SKfKhzY/YnAlRWMeYke5tTI5WpsAgKBDaP3Bk8CeRDOiKTRx3RhoYdMdNK9zofg20pxtiUtvWnK
	cXL8l6c1CUftHC+oZhmr5E7QKG5eVVe6ICh7J027r3Kr1nC5fvbcr6FxEIZWXiTvJPC2yU9pVvY
	CAokUctsESd1WFZKxiAcnADA==
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr367212a91.4.1783098842338;
        Fri, 03 Jul 2026 10:14:02 -0700 (PDT)
Received: from localhost ([2804:30c:1618:8400:e838:86ad:21d4:de00])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm3780762eec.6.2026.07.03.10.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:14:01 -0700 (PDT)
Date: Fri, 3 Jul 2026 14:14:50 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <akfuCoai4KAlt5QZ@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <724f2408cb84bf4546115408fc9857777e6f2fd7.1783028033.git.marcelo.schmitt@analog.com>
 <20260702220223.C717E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702220223.C717E1F00A3A@smtp.kernel.org>

On 07/02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Hardware protocol violation: CNV is held high during SPI read
> - [High] SPI bus not locked during ADC conversion phase
> - [Medium] Incorrect scale calculation for LTC2338-18 and similar ADCs
> - [Low] Undefined direct mode macros lead to build failure
> --
> 
> commit b74b536d18af0084ea31bd1e1e8cf9454da5e29c
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs
> 
> This commit adds support for the Analog Devices LTC2378-20 and similar
> analog-to-digital converters. It introduces a new IIO driver using the
> SPI subsystem.
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > new file mode 100644
> > index 0000000000000..b5cf2e974daca
> > --- /dev/null
> > +++ b/drivers/iio/adc/ltc2378.c
> > @@ -0,0 +1,404 @@
> 
> [ ... ]
> 
> > +static const struct ltc2378_chip_info ltc2338_18_chip_info = {
> > +	.name = "ltc2338-18",
> > +	.internal_ref_uV = 4096000,
> > +	.chan = LTC2378_BIPOLAR_DIFF_CHANNEL(18),
> > +};
> 
> [ ... ]
> 
> > +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> > +{
> > +	int ret;
> > +
> > +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> > +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> > +	fsleep(4);
> 
> [Severity: High]
> Can this sequence cause data corruption on a shared SPI bus?
> 
> The CNV pin is toggled and an fsleep(4) occurs before spi_sync_transfer()
> locks the bus. If another SPI transaction occurs during this sleep window,
> could it toggle the SCK line and prematurely clock data out of the ADC?
Makes sense. 
> 
> Should the conversion-and-read sequence be wrapped in spi_bus_lock()
> and spi_bus_unlock()?
Because these chips don't have CS line, it seems that locking the bus actually
makes sense.

> 
> > +	ret = spi_sync_transfer(st->spi, &st->xfer, 1);
> 
> [Severity: High]
> Does reading from the SPI bus while CNV is held high violate the hardware
> protocol?
No.
> 
> The ADC requires the CNV pin to be brought low to enable the SDO
> output before clocking out data via SPI, but spi_sync_transfer() happens
> before gpiod_set_value_cansleep(st->cnv_gpio, 0), which might result in
> reading high-impedance garbage data.
See 'Using a Single LTC23... in Normal Mode' diagrams (usually Figure 10, 13, or 15
in datasheets). CNV can be either low or high during data transfers.

> 
> > +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> > +
> > +	return ret;
> > +}
> 
> [ ... ]
> 
> > +static int ltc2378_read_raw(struct iio_dev *indio_dev,
> > +			    const struct iio_chan_spec *chan,
> > +			    int *val, int *val2, long mask)
> > +{
> > +	struct ltc2378_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	switch (mask) {
> > +	case IIO_CHAN_INFO_RAW: {
> > +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +			return -EBUSY;
> 
> [Severity: Low]
> Will this cause a build failure?
> 
> The macros IIO_DEV_ACQUIRE_DIRECT_MODE and IIO_DEV_ACQUIRE_FAILED appear
> to be undeclared in the kernel tree.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/iio/iio.h?h=v7.2-rc1#n785
Outdated LLM?

> 
> > +
> > +		ret = ltc2378_channel_single_read(chan, st, val);
> > +		if (ret)
> > +			return ret;
> > +
> > +		return IIO_VAL_INT;
> > +	}
> > +	case IIO_CHAN_INFO_SCALE:
> > +		*val = st->ref_uV / MILLI;
> 
> [Severity: Medium]
> Does this calculate an incorrect IIO scale for the LTC2338-18?
> 
> Does this miss the 2.5x input span multiplier unique to the LTC2338-18
> when calculating the IIO scale here?
That's taken care of in ltc2378_refin_setup().

> 
> > +		/*
> > +		 * For all LTC2378-like devices, the amount of bits that express
> > +		 * voltage magnitude depend on the polarity / output code format:
> > +		 * - straight binary: All precision/resolution bits are used.
> > +		 * - 2's complement: One of the precision bits is used for sign.
> > +		 */
> > +		if (chan->scan_type.format == IIO_SCAN_FORMAT_SIGNED_INT)
> > +			*val2 = chan->scan_type.realbits - 1;
> > +		else
> > +			*val2 = chan->scan_type.realbits;
> > +
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> 
> [ ... ]
> 
> > +static int ltc2378_refin_setup(struct device *dev, struct ltc2378_state *st)
> > +{
> > +	int ret;
> > +
> > +	/*
> > +	 * The internal reference buffer amplifies both the internal reference
> > +	 * and REFIN by a factor of 2.
> > +	 */
> > +	ret = devm_regulator_get_enable_read_voltage(dev, "refin");
> > +	if (ret == -ENODEV) /* refin is optional */
> > +		st->ref_uV = st->info->internal_ref_uV * 2;
> 
> [Severity: Medium]
> Does this incorrectly double the internal reference voltage?
> 
> The ltc2338_18_chip_info already defines internal_ref_uV as the post-buffer
> value of 4096000 (4.096V). Multiplying it by 2 here would result in an
> incorrect scale value.
Indeed,
-       .internal_ref_uV = 4096000,
+       .internal_ref_uV = 2048000,
will solve the issue.

> 
> > +	else if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> > +	else
> > +		st->ref_uV = ret * 2;
> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1783028033.git.marcelo.schmitt@analog.com?part=2
