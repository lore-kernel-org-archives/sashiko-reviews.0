Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3442FE56A
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170915; cv=none; b=VREgJS2l6yqvqpx3fV3UJq0xhh31ifir5TnEy/0eoEPjAoReyFKkZ5p0UX48WcowDuHgdACrZsyKwO/gRUwM1uzSC/JTyi727oh+KEcbw5hqt/pvN3GJ8o4UbwVdXJQft8+d/ZblNGV3WPOfhvQTmGL6N1GI9dwJKXlf2pOeezs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170915; c=relaxed/simple;
	bh=DV8Dbtb4xFn7f4HLVSR+qSkgOTWr2bc9j8Wdnp9dzx0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=T7PEi1Lu0Uf3bvRwNP5vDafMZfvvxjRd/6ejAjSu+MWLIc5EpUnAMpLPLqdFfnGmS1mTHeyZu6HMNSg22uziOox6svnxrtax07kKvUA30c+h42iD3f5itjd0lqY3roD13MpILxRGAPTS3TzPwA1G76BHdMpks7vLGxcobV5wsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNhQm+si; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNhQm+si"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47362928f65so165440f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786170911; x=1786775711; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a96h5glZEiPIcu98OsVlZA9XWREaas6FJUvC82d0Plc=;
        b=KNhQm+silXHJsbQ6TjNWVIDlQtIS267VCSC+FW0GlN+jr7Q41iM+lNwPnQX2JcWUHp
         ub91oazMrZQ/zu8/kX0Gx7w27jMy7lF4XrZNHum/omnJB0l7eLlVPL7WYiu75reIkljQ
         LixHYNpqvH7h1lCA2jLYTpYlfu+qVLIp9F/XY/GCfOOQPL4m802mdsu0jiHR7Ft6F7UY
         eCcSI+k49dfHE1W36fZ0LoS3zF91J9+GfCPoAj72SvNAFCwVCQouHm+yXnrYNvz+XB3A
         PWqpcMPSkgNH/jyf2HQ/N3S5EZ28Ddj1u3165b/RXzqDr3nTkIkTJmfQU3GB6w3GGkMk
         UkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786170911; x=1786775711;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a96h5glZEiPIcu98OsVlZA9XWREaas6FJUvC82d0Plc=;
        b=sY0+uyGpCvRejkTpwLdMwqJO8EIno5i06YMEuHLp54LKr/uMeYJBNKFX99CPFXLnQm
         VV6Sh+qH9TGLBEC412nclwlRZgtbIx0ivmqnXBjmsvuaRFZECP7nselC5sEEPeaPOtF+
         Qw7k48N7d08zMAfBQQwnvZEnDanNzEo7kLE7/K1rMJGCvnav7vrxCDr9kbE7/nZ9VNIB
         rbCkDyvM3EqDwLzpCozKc4gCa3fCKLgVSzSjpoxVevYLzy1IPBDkMJNb7Bhjpo0kFAmS
         FhBIKBgGOV4MHHoeb6Wl2v7StHaNB/iyqyMO9lSkXyjpzWzRWAf9QLR86NcHs/Hu7Ycb
         /Qxg==
X-Gm-Message-State: AOJu0Yw18qRuCxvPTZiC8gQp2BHSH87S1H9dcIhMICmlfyEzXrtq5fEz
	uetxh+qCPquzyCiT+FKCAZEmkGKrYYXViqNeREKK9WJHzpr21XSdyCZM/MppWA==
X-Gm-Gg: AR+sD11wZ0v0SekWT6R1Uzj72ZLdHZS4++8dKfSvkfkggoX5M39vY8rRzLD1maf2LYb
	l/TqH7+9ayb8cYECCl5+lQb/RSE7gj7MfyZ8wIyBVochfi/M6EkbP4w/QOqEqTUS7Fo4iBLkkSV
	1XmZ9NTBLtYvNPXCAmKaXEC6yLXg/+jPdQgkE+RNzS94ejzFNDSuAY8uA4XIyAiCqhQobJzmL5r
	B8M45IBdtt/szSlJzqcKw7NsmXyqCEJlgpz3Tq3d63HZDzlPtLQz1Ccer4ijspIKW56ZStFLtio
	X3ihZHI34Qft8yH0x8G/ntP5kCw4c6ZiYEGo0DDsih0jvfCPV/p1hutTxjAEA9ULLX8IE74+JfZ
	qI/76hJZ0jLbddikMF52TgOlLBVeOx0+TIkmALmUNpgoM03VWKVsykeE9Ee+KuLIgyX0/My11uw
	DkHKxOEViKZVRBRQ7ziGTgkW26LSuEMo0NXRWSZ4wOvV/hyzmTy2a+YOHoLzjcU5K2e+32LBQU6
	Q==
X-Received: by 2002:a5d:5f09:0:b0:47f:7aee:ed3c with SMTP id ffacd0b85a97d-47fec4e2a1cmr48820586f8f.5.1786170911031;
        Fri, 07 Aug 2026 23:35:11 -0700 (PDT)
Received: from localhost ([2001:4bb8:13c:7c2e:82fa:2a8:3c65:4096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220727bsm12952785f8f.33.2026.08.07.23.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 23:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Aug 2026 08:35:08 +0200
Message-Id: <DKJCQRNBH477.3C9CC4KCFAMNK@gmail.com>
Subject: Re: [PATCH v5 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-4-e60876fb3640@gmail.com>
 <20260807150823.49A101F000E9@smtp.kernel.org>
In-Reply-To: <20260807150823.49A101F000E9@smtp.kernel.org>

On Fri Aug 7, 2026 at 5:08 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [High] Unbalanced PM runtime usage counter causes an underflow on devic=
e unbind or probe error.
> - [High] Uninitialized padding in the local `scan` buffer leaks kernel st=
ack memory to userspace.
> - [High] Spurious interrupts cause I2C reads while the device is runtime =
suspended.
> - [High] Initialization order and use-after-destroy race due to early IRQ=
/trigger registration.
> - [High] Triggered buffer is unconditionally registered on the no-IRQ pat=
h with a malformed channels array.
> - [Medium] Missing timestamp acquisition for nested trigger handler.
> - [Medium] Trigger disable sequence violates hardware constraints by clea=
ring AF before AF_TRIG.
> --
>
> --- Patch [4]: [PATCH v5 4/4] iio: light: veml6031x00: add support for ev=
ents and trigger ---
> commit aeccd415dcc79cfa9463cf8b5eec2292ee46dfab
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: veml6031x00: add support for events and trigger
>
> The device provides a shared interrupt line for to notify events and
> data ready, which can be used as a trigger. The interrupt line is not a
> requirement for the device to work. Implement variants for the cases
> whether the interrupt line is provided or not.
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> index 0cccd40d729eb..e193f87e6740f 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
> [ ... ]
>> @@ -494,13 +686,205 @@ static int veml6031x00_write_raw_get_fmt(struct i=
io_dev *indio_dev,
> [ ... ]
>> +static irqreturn_t veml6031x00_interrupt(int irq, void *private)
>> +{
>> +	struct iio_dev *iio =3D private;
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	s64 timestamp;
>> +	int regval, ret;
>> +	bool trigger_poll;
>> +
>> +	scoped_guard(mutex, &data->irq_lock) {
>> +		ret =3D regmap_read(data->regmap, VEML6031X00_REG_INT, &regval);
>
> [Severity: High]
> If a spurious interrupt fires while both ev_en and trig_en are false,
> could this unconditionally read from the I2C bus while the device is
> runtime suspended?
>
> It looks like this might hit a powered-off device since it doesn't
> use pm_runtime_get_if_active() or check software state before
> the register read.
>

The I2C interface stays accessible even while the device is powered down,
so this read doesn't fail or have side effects in case of a spurious
interrupt.

>> +		if (ret) {
>> +			dev_dbg(regmap_get_device(data->regmap),
>> +				"Failed to read interrupt register %d\n", ret);
>> +			return IRQ_NONE;
>> +		}
> [ ... ]
>> @@ -535,11 +919,78 @@ static int veml6031x00_buffer_postdisable(struct i=
io_dev *iio)
>>  	return 0;
>>  }
>>
>> +static int veml6031x00_set_trigger_state(struct iio_trigger *trig, bool=
 state)
>> +{
>> +	struct iio_dev *iio =3D iio_trigger_get_drvdata(trig);
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int ret;
>> +
>> +	guard(mutex)(&data->irq_lock);
>> +
>> +	if (state =3D=3D data->trig_en)
>> +		return 0;
>> +
>> +	ret =3D veml6031x00_set_interrupt(data, state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* The AF bit must be set before setting AF_TRIG */
>> +	ret =3D regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF,
>> +				 FIELD_PREP(VEML6031X00_CONF0_AF, state));
>
> [Severity: Medium]
> Since the AF bit must be set before setting AF_TRIG, does the
> disable sequence need to happen in reverse order?
>
> When state is false, this clears the AF bit first, creating a window
> where AF_TRIG is still active but AF is disabled.
>

Disabling AF is what actually turns off auto-force mode, so it should be
done in the current order.

>> +	if (ret) {
>> +		veml6031x00_set_interrupt(data, !state);
>> +
>> +		return ret;
>> +	}
>> +
>> +	ret =3D regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF_TRIG,
>> +				 FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, state));
> [ ... ]
>> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
>> +{
>> +	struct iio_poll_func *pf =3D p;
>> +	struct iio_dev *iio =3D pf->indio_dev;
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2);
>
> [Severity: High]
> Could this leak uninitialized kernel stack memory to userspace?
>
> The IIO_DECLARE_BUFFER_WITH_TS macro allocates the buffer on the stack
> without zeroing the padding bytes between the channel data and the
> timestamp.
>

Already addressed in the reply to Sashiko's feedback about [3/4].

>> +	unsigned int i =3D 0;
>> +	int ch, ret;
>> +
>> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
>> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
>> +		ret =3D regmap_bulk_read(data->regmap,
>> +				       VEML6031X00_REG_ALS_L,
>> +				       scan,
>> +				       2 * sizeof(*scan));
>> +		if (ret)
>> +			goto done;
>> +	} else {
>> +		iio_for_each_active_channel(iio, ch) {
>> +			ret =3D regmap_bulk_read(data->regmap,
>> +					       iio->channels[ch].address,
>> +					       &scan[i++],
>> +					       sizeof(*scan));
>> +			if (ret)
>> +				goto done;
>> +		}
>> +	}
>> +
>> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
>
> [Severity: Medium]
> Since this trigger handler is executed synchronously from the interrupt
> handler via iio_trigger_poll_nested() bypassing the top-half
> iio_pollfunc_store_time(), will pf->timestamp always be zero here?
>

The timestamp is already captured in the interrupt handler. I will assign
it to pollfunc->timestamp before calling iio_trigger_poll_nested().

>> +
>> +done:
>> +	iio_trigger_notify_done(iio->trig);
>> +
>> +	return IRQ_HANDLED;
>> +}
> [ ... ]
>> @@ -636,15 +1142,29 @@ static int veml6031x00_probe(struct i2c_client *i=
2c)
>>  				     "Failed to set regmap\n");
>>
>>  	iio->name =3D data->chip->name;
>> -	iio->channels =3D veml6031x00_channels;
>> -	iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>>  	iio->modes =3D INDIO_DIRECT_MODE;
>> -	iio->info =3D &veml6031x00_info;
>> +	if (i2c->irq) {
>> +		iio->channels =3D veml6031x00_channels_irq;
>> +		iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels_irq);
>> +		ret =3D veml6031x00_setup_irq(i2c, iio);
>
> [Severity: High]
> Does registering the IRQ and trigger here expose a race condition?
>
> veml6031x00_setup_irq() requests the threaded IRQ before devm_mutex_init(=
)
> allocates data->irq_lock and veml6031x00_regfield_init() allocates
> data->rf.int_en. If an interrupt fires immediately, the handler will try
> to lock an uninitialized mutex.
>
> Additionally, since devres cleans up in reverse order, won't the mutex
> be destroyed before the IRQ is unregistered during unbind?
>

For V6: mutex_init and regfield_init moved before setup_irq().

>> +		if (ret)
>> +			return ret;
>> +
>> +		iio->info =3D &veml6031x00_info;
>> +	} else {
>> +		iio->channels =3D veml6031x00_channels;
>
> [Severity: High]
> If the device does not provide an interrupt, it falls back to
> veml6031x00_channels which lacks scan_index and scan_type definitions.
>
> Will setting up a triggered buffer unconditionally at the end of probe
> cause IIO core undefined behavior if a user attaches an external
> sysfs/hrtimer trigger, since both channels would default to a
> scan_index of 0 and 0 storage bits?
>

Already addressed in the reply to Sashiko's feedback about [3/4].

>> +		iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>> +		iio->info =3D &veml6031x00_info_no_irq;
>> +	}
>>
>>  	ret =3D devm_mutex_init(&i2c->dev, &data->scale_lock);
>>  	if (ret)
>>  		return ret;
>>
>> +	ret =3D devm_mutex_init(&i2c->dev, &data->irq_lock);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret =3D veml6031x00_regfield_init(data);
>>  	if (ret)
>>  		return dev_err_probe(&i2c->dev, ret, "Failed to init regfield\n");
>> @@ -672,6 +1192,12 @@ static int veml6031x00_probe(struct i2c_client *i2=
c)
>>  	if (ret)
>>  		return dev_err_probe(&i2c->dev, ret, "Failed to get runtime PM\n");
>>
>
> [Severity: High]
> Could the devm_pm_runtime_get_noresume() call just above this hunk cause
> a usage counter underflow?
>
> The devres action will eventually call pm_runtime_put_noidle() during
> driver unbind. However, the driver also manually calls
> pm_runtime_put_autosuspend() at the end of veml6031x00_probe() to drop
> the initial reference.
>
> This double-put could underflow the usage counter to -1 and corrupt
> device power management. If the driver manually manages the initial
> reference, should it use the non-devm pm_runtime_get_noresume() variant?
>

Already addressed in the reply to Sashiko's feedback about [3/4].


Best regards,
Javier
