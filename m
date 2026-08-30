Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA8233920;
	Sun, 30 Aug 2026 02:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788055392; cv=none; b=HrAxua4dxOFLWRohWbFMD0y2nZs16MWPk7Va7qeki9uXvvna/4ewzsXoLoL/2kSDUpP7Jp7IegD03uOhEciKgWSrQ0k19prsUNPPW2bAOcEOmxtEp/7zfBgDORzOyxz57uAkfPCOiN2UeHtY1w6dIzY95qKMP2kRWvFbnMEpgsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788055392; c=relaxed/simple;
	bh=VoNfsu5VvErQPBCPoMqHdcWjY9UjqGyv1ZsdN5gf7KI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=dPcWEtT1NXh6+NrKhtMslJKvzeEJiWDq++szOSLkMKeAOAeKDHh27pp5kBb1mWOx/ydpuwoC5sLT2e7SyxsAD5+D/ihU6eiZGGXzgc76mMYuj7sh4DPMulgJSCgOWdKNGGdI4jN+ShC9EjOLyCjyYo0e5z4KBKzz1cTHwW1AN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxyoR8bw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxyoR8bw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CAA1F000E9;
	Sun, 30 Aug 2026 02:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788055390;
	bh=AGPn+JSeEy6Wu4RHz3HXB53TjkIxBZthZYcPrGoyEhY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fxyoR8bwzhcVClCyk67AWxp4xmDByrCifujOAFkczYby/MeGg8gQ/jTYeLWyrwVB0
	 5t4hPovU+ohloucCDDiiJCytKJv065+EtxPhqudckfej1c53lEsWzz/SVbfoSz6Hbm
	 EY2MdTQP5d6FVCcIWE2zshgP/vpTKaUdtiWfu9bEfhwo9sH+qmbFAgG8/jaO8Kfzpo
	 Vea4HzZLTHs+GgPvd2kx7D28JsNjo4CiEger1tQmEsondEOqIjsUgpCXXi5aqnh8sB
	 t0KafscUon70meUNvxSx4pPELty/lUbH4ywuEv8Uu8ugWVX4cW09SJ82Bh6N5PnDQQ
	 j4fTLGHJpA4jg==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
From: Jonathan Cameron <jic23@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Kurt Borja <kuurtb@gmail.com>, conor+dt@kernel.org, robh@kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260828065211.C05B11F00A3F@smtp.kernel.org>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
 <20260828065211.C05B11F00A3F@smtp.kernel.org>
Date: Sun, 30 Aug 2026 03:02:55 +0100
Message-Id: <178805537532.2788519.12150005140246669583.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4199;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=VoNfsu5VvErQPBCPoMqHdcWjY9UjqGyv1ZsdN5gf7KI=;
 b=owEBfwKA/ZANAwAKAVSFNJnE9BaIAcsmYgBqk49QQj/K4mdBdLg+PAk09Fa2JBiYkSGXPZxcI
 a/Q9Pq8aUqJAkUEAAEKAC8WIQRuKWazh4QGUpEmgbFUhTSZxPQWiAUCapOPUBEcamljMjNAa2Vy
 bmVsLm9yZwAKCRBUhTSZxPQWiAIKD/9M8vNXYNfs5hiLNQv0iI0OQaUm0wazfwqRBslScbEjCTt
 V4TXo/5qqj0ayKAZddeSO34+s3k6GIQ0RDSAvUYOctCdnxEsIqXPntHlYtTMWja39A/Mgji7g+W
 RR9oE//2vuYAMbasIyVfZYJJbuv416rfhsC75QYuhVKHoXjgpoczEIQhIg5Ceh+cJr+ZCnvuPwq
 h4CN9uwZ4CZSnjgQMJdWV+v17ZCeIilur+KCgtDsHxsWCSEh3b7hFbBcpuIpzoybamIEatpMeYi
 /op++FbUq9TIbpnD5ukT5ytkRBhn4tvRwSSJXq9g4CBqNfF6vshwjKcEwVak/8WpVclWaoV11P5
 Tf6f02hb33m3i4UwP78e+rUwMRR6D5lVGekBz0vL45w5x+/DArIpoWBu/6sEZ1A2NbW5yKPv8wh
 GHa0pLHK1EueUadFz3F++/29RFjsqpEf4z3t5ZEzpEkK7QspPHSb8m78u9hdHEufFjt1EhZrWgi
 G7aTWYK69yWbq3i8mOeXBIXGtBtR4gUlXpnHeM5Dmc9+ZwecQuub6ovbEOogRnD/WAaQxObs5j8
 dit6duNacYzhJqFJyXJRr5MY3dUez0fdRK7SrGOlUNEJuuRiafrHnYm3TlSkvYdf3bC5mPR8gLo
 DBkHfDEcYaRlvjeMiQlDhlmU1nz3sZ7Xk/Ie+3w==
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688

> commit 6093db1ff45e9e897720bc6b278550ffbef67e85
> Author: Kurt Borja <kuurtb@gmail.com>
> 
> iio: adc: add the ti-ads1262 driver
> 
> Add the ti-ads1262 driver with initial support for the primary ADC (ADC1).
> Various features such as accurate timeout delays, per-channel reference
> sources, scale, offset, and diagnostics are intentionally left out for
> future support.

One particularly interesting point from sashiko about regmap debugfs.

> 
> > diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/iio/adc/ti-ads1262.c
> 

> > +static int ads1262_channel_read(struct iio_dev *indio_dev,
> > +				const struct iio_chan_spec *spec, __be32 *val)
> > +{
> > +	struct ads1262 *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +		return -EBUSY;
> > +
> > +	ret = ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ads1262_channel_enable(st, spec);
> > +	if (ret)
> > +		return ret;
> > +
> > +	reinit_completion(&st->drdy);
> > +
> > +	ret = ads1262_dev_start_one(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ads1262_wait_for_conversion(st);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: Medium]
> Does this error path leave the hardware running if the wait is interrupted?
> 
> If ads1262_wait_for_conversion() returns an error (like -ERESTARTSYS from
> a signal), the driver exits immediately without stopping the hardware. If a
> subsequent read calls reinit_completion(&st->drdy), but the abandoned
> hardware conversion finishes and asserts the DRDY interrupt right after,
> could the new read prematurely fetch stale data from the old conversion?
> 
> Should this path ensure the hardware is stopped and synchronized with the
> interrupt handler on timeout or interrupt?

For me this is obscure enough I'm not sure we care about stale data.

> 
> [ ... ]
> 
> > +static int ads1262_dev_configure(struct ads1262 *st)
> > +{
> > +	struct device *dev = &st->spi->dev;
> > +	int id, ret;
> > +
> > +	ret = ads1262_dev_reset(st);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to reset device\n");
> > +
> > +	guard(mutex)(&st->xfer_lock);
> > +
> > +	ret = regmap_read(st->regmap, ADS1262_ID_REG, &id);
> 
> [Severity: Low]
> Is the type of id correct here?
> 
> The regmap_read() API expects an unsigned int * for its third argument, but
> id is declared as an int. Could this trigger a -Wpointer-sign compiler
> warning?

This one is minor but good to tidy up.

> 
> [ ... ]
> 
> > +static const struct regmap_config ads1262_regmap_config = {
> > +	.reg_bits = 8,
> > +	.val_bits = 8,
> > +	.writeable_reg = ads1262_writeable_reg,
> > +	.readable_reg = ads1262_readable_reg,
> > +	.volatile_reg = ads1262_volatile_reg,
> > +	.reg_defaults = ads1262_reg_defaults,
> > +	.num_reg_defaults = ARRAY_SIZE(ads1262_reg_defaults),
> > +	.max_register = ADS1262_ADC2FSC1_REG,
> > +	.can_sleep = true,
> > +	.cache_type = REGCACHE_MAPLE,
> > +};
> 
> [ ... ]
> 
> > +static int ads1262_regmap_read(void *context, const void *reg_buf,
> > +			       size_t reg_size, void *val_buf, size_t val_size)
> > +{
> > +	struct ads1262 *st = context;
> > +	u8 tx[2];
> > +
> > +	lockdep_assert_held(&st->xfer_lock);
> 
> [Severity: Medium]
> Will this lockdep assertion fail if the register is read via debugfs?
> 
> Because ads1262_regmap_config does not set disable_locking = true and does
> not provide custom lock/unlock callbacks, regmap uses its own internal
> mutex. When regmap's debugfs interface is read, the regmap core acquires
> its internal mutex and calls the driver's ads1262_regmap_read() callback
> without holding st->xfer_lock.
> 
> Could this bypass the xfer_lock, triggering the lockdep splat and allowing
> debugfs SPI operations to interleave with driver-initiated SPI transactions?

This is a corner I'd not thought about in adding lockdep markings to these
functions.  Up to you how you want to fix it.


