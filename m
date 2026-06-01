Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AD39934A
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308085; cv=none; b=BKd6wPbXk2xirhiza6UvRXU0i6Hy1/NwdFeIDnS52sjlgqODbMzsaeMtQxq9aVi9TP1lYxzf0MKpr746zpg9xWRE8ohbM9/FngRf3oQzY29s72rtGjEGBaLVQsr0avvfs3oiUnNri5I9NVZoGpC6fX5brVIXVtTbSbpVvPWGCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308085; c=relaxed/simple;
	bh=sLxliPp5zhohhmGKsS/9Xw/bEz9HCOcd/Tqlp27CPmI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YU24eHnauhW+hv5ij+NRPfs9uWB81YeYaaKMuxXvhWEW5rxUtmwc6ez9AThtmgbcVPDPRNGGMmVh5bOLtumw+ZAD+NL3L0NJoEPCBDMPVsZZSGMVP00+ueYs30YPb9Qu00WdPjjvoTxzC9WyIX7wzqsOxuKYsuu9p7ZzQTBK79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGt8bff+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGt8bff+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso210070866b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780308074; x=1780912874; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6FJGnhtFwE5Wu7/ZVGGWeKvZozD1/mJDapo39GYeEk=;
        b=VGt8bff+lRsdXLZzFSAbKf1KhFbxeoDkdN99RwI/3ilL0qO6y1vUmzd7shDATdgmBX
         OPjOaz8LqLHhivI02H/zxZsqJgOprvH37ZAAtZsPMkdfAuM14bc5YeILhytaGwBHbboJ
         O5atDwG1ZxY5gGY6kPhFOwAlZocWIskY0tRZ2q6VN+WEK1+YIy1rWM3ABbsvPt86N9oU
         OfyoEV7OBDG4ep+e4DlCCJk2pDtSGlmV9GN5MfnHktC/e0TvimuynyNzsuSQWkN7alOb
         uu3CgWMPeYblgH8yTkUDrHPyTOkAnMQH5TsMIFOb/yIjJzGjwiy+rrm0J9fOHridiL31
         LWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780308074; x=1780912874;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6FJGnhtFwE5Wu7/ZVGGWeKvZozD1/mJDapo39GYeEk=;
        b=hb6byAV+vXzOjMaE1jy9R+FQq3KCqVBEBNDT1JVe2O3B/nI8rSSteYZ6cM/n9wqTFs
         pqPWKJb2iNwoqIU2QF/V2VfA/QCaVhqlLmsz9JLpPPWG5J7kFxsgewlHyqinBXrjSCCK
         Vgx7WgP/ObJplIpZrDtC8578pigjX4DZ884agd8/pIJak+LRL/+eRHp9Dfv57kZeiruN
         APdp3HfxtsMBCjb51O9A2PCW+nvOSQiNwST5x0Bd/YmADJJPoXOHT4E5hqEvvnrx68N7
         jXR2mG2NxfkaW3+3L1f75kikyNHHDCa4+ZdnbhojUGG4+mt49uXFwiTvBMvm6GSOWK4O
         nUmQ==
X-Gm-Message-State: AOJu0YxDw9QuB02iFJX2IUW/Ax6pWvNDrvpCdAWISJ8NcM2ss9Fzzx+Q
	Lweoz2xxHl9iJ3XXpmECLwJRBjMW6KvUP8nij7UWeMm8qAgHPR/XeDVX6LH6Jw==
X-Gm-Gg: Acq92OG4MabSpngC2W9fiEMVGk9Yi0vjq9ksB46jNu5KCuO/n61p8KY9yH9Q+wHBdGb
	u00PS6UuWl9+R/1Njr5mU8u6K7ckI0J3dwEICzZfpRzqLL9N4Zys48YTcP6SxRzcVT9EM4s2MG0
	xcAK3w7WEvsgJOnStW57yyfyd5iz7eNKuz7Kt6aXBGXWRXuByRAIBMhUPb0hmRFq02GO4vTBz9L
	JJHA4KEvvIZ7telKQ24KjX07NsVimBD1tQAbAYYTZ4z3KJGCsF5WnuKn3hPde6Qafl9I/ylTILA
	S4GP6X0BmY/r4TOMiormsGEuEM/qxUL7ErXEOP8MRxXWPQ1hdmqQCJJiQJp8BSdoE6/C+FRMs9q
	Ew0mwwRPpn26FzG4MN/tjZGoALJEpbkNerTgfy1EeWiwNn/DM5JpQG78sfP3WLgoOuuNq0gDcXC
	aSsteEzvQX7S187EhA2MAWheIYlTT/LhcpdHLwVyO8IwBg1xEx/m73wO2HFw==
X-Received: by 2002:a17:907:2dac:b0:beb:e20b:3f86 with SMTP id a640c23a62f3a-bebe20b50bfmr376862066b.47.1780308072804;
        Mon, 01 Jun 2026 03:01:12 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:a520:3907:8d91:26f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm25295649f8f.29.2026.06.01.03.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 12:01:10 +0200
Message-Id: <DIXMJH3581S0.5DHXMLATTOV1@gmail.com>
Subject: Re: [PATCH v4 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <linux-kernel@vger.kernel.org>, <linux-iio@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-4-e64f7fdce38d@gmail.com>
 <20260531204345.1C2A41F00893@smtp.kernel.org>
In-Reply-To: <20260531204345.1C2A41F00893@smtp.kernel.org>

My view about the issues Sashiko reported.

On Sun May 31, 2026 at 10:43 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Missing `.validate_device` in trigger operations allows other de=
vices to attach to a sensor-specific trigger.

Tested with no real issues, but the trigger is mean for this device
only.

> - [High] The trigger handler performs an unintended I2C read from address=
 0 for the software timestamp channel.

Not a real issue.

> - [High] PM runtime usage count is leaked if the device is unbound while =
events are enabled.

The usage count is set to 0 by the devres action.

> - [High] Stale values in the regmap cache for the hardware-cleared `AF_TR=
IG` bit cause unintended triggers.

Real issue, I forgot to set CONF0 as a volatile register.

> - [Medium] Mixing `goto` error handling with `guard()` scope-based cleanu=
p in the same function.

Not a real issue because the goto's happen after the guard, but it's easy t=
o
get rid of them.

> - [Medium] Non-functional event sysfs attributes are exposed to userspace=
 when the device lacks an IRQ.

Missing fix to be added to V5.

>
> Pre-existing issues:
> - [High] Unbalanced PM runtime usage counter due to mixing devm action wi=
th manual put.

Not a real issue because an underflow is not possible.

> --
>
> commit c0654b1fbfc516c85d27a7c169844b649c2a1077
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
>> index facb1b8e42418..5e79eb942f09c 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
>
> [ ... ]
>
>> @@ -144,6 +197,8 @@ static const struct iio_chan_spec veml6031x00_channe=
ls[] =3D {
>>  		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
>>  		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
>>  		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
>> +		.event_spec =3D veml6031x00_event_spec,
>> +		.num_event_specs =3D ARRAY_SIZE(veml6031x00_event_spec),
>
> [Severity: Medium]
> Will this unconditionally expose event sysfs attributes even when the dev=
ice
> lacks an IRQ?
>
> If i2c->irq is 0, the driver uses veml6031x00_info_no_irq to omit event
> callbacks. However, the IIO core checks num_event_specs during
> iio_check_for_dynamic_events() and creates sysfs attributes anyway. If th=
ese
> attributes are accessed from userspace without the callbacks, will they
> return -EINVAL?
>

This fix is also missing. I will add it to V5.

> [ ... ]
>
>> +static int veml6031x00_set_af_trig(struct veml6031x00_data *data, bool =
state)
>> +{
>> +	regcache_drop_region(data->regmap, VEML6031X00_REG_CONF0,
>> +			     VEML6031X00_REG_CONF0);
>> +
>> +	return regmap_update_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				  VEML6031X00_CONF0_AF_TRIG,
>> +				  FIELD_PREP(VEML6031X00_CONF0_AF_TRIG, state));
>> +}
>
> [Severity: High]
> Does this leave a stale AF_TRIG value in the non-volatile regmap cache?
>
> The AF_TRIG bit is cleared automatically by hardware. While this function
> drops the cache region before setting the bit, VEML6031X00_REG_CONF0 is n=
ot
> marked as volatile in veml6031x00_volatile_ranges. Because of this,
> regmap_update_bits() writes the new value to hardware and also caches it.
>
> Would any subsequent updates to CONF0 (such as changing AF or SD bits) re=
ad
> the cached AF_TRIG=3D1 and write it back, causing an unintended measureme=
nt
> trigger?
>

Absolutely right, I forgot to update this although I said I would do it.

> [ ... ]
>
>> +static int veml6031x00_write_event_config(struct iio_dev *iio,
>> +					  const struct iio_chan_spec *chan,
>> +					  enum iio_event_type type,
>> +					  enum iio_event_direction dir,
>> +					  bool state)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int ret;
>> +
>> +	guard(mutex)(&data->irq_lock);
>> +
>> +	/* avoid multiple increments/decrements from one source */
>> +	if (state =3D=3D data->ev_en)
>> +		return 0;
>> +
>> +	if (state) {
>> +		ret =3D pm_runtime_resume_and_get(data->dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>
> [Severity: High]
> Is the PM runtime usage count leaked if the device is unbound while event=
s
> are enabled?
>
> The pm_runtime_resume_and_get() call keeps the device powered on, but the=
re
> does not appear to be a custom devres action or remove callback to disabl=
e
> the event and drop this reference if the driver is unbound. Could this
> prevent the parent I2C controller from ever entering runtime suspend?
>

The devres action that was registered in the probe function will
decrement the counter if the driver is unbound. I explained the
mechanism at the end of the mail.

> [ ... ]
>
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
>> +	if (ret)
>> +		goto err_disable_interrupt;
>> +
>> +	ret =3D veml6031x00_set_af_trig(data, state);
>> +	if (ret)
>> +		goto err_clear_af;
>
> [Severity: Medium]
> Is it safe to mix goto-based error handling with guard() scope-based clea=
nup
> in this function?
>
> According to the cleanup subsystem guidelines, mixing goto with guard() o=
r
> __free() in the same function can create confusing ownership semantics.
> Should this function either use goto entirely or be fully converted to
> scoped cleanups?
>

The real issue arises when there are goto calls before the cleanup, but
I think it is cleaner to get rid of all goto calls where cleanup magic
is used. I will remove them and add function calls and error return
in the error paths.

> [ ... ]
>
>> +static const struct iio_trigger_ops veml6031x00_trigger_ops =3D {
>> +	.set_trigger_state =3D veml6031x00_set_trigger_state,
>> +};
>
> [Severity: High]
> Is a .validate_device callback needed here to prevent other devices from
> attaching to this sensor-specific trigger?
>
> Without setting .validate_device to iio_trigger_validate_own_device, anot=
her
> IIO device could attach to it. If that happens, veml6031x00_set_trigger_s=
tate()
> would enable the DRDY interrupt while the sensor is PM runtime suspended
> (since its own buffer_preenable isn't called). Would this cause the depen=
dent
> device's buffer captures to hang?
>

This trigger is intented to be used by its own device. I will add
iio_trigger_validate_own_device to iio_trigger_ops.

> [ ... ]
>
>> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
>> +{
>> +	struct iio_poll_func *pf =3D p;
>> +	struct iio_dev *iio =3D pf->indio_dev;
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int ch, ret, i =3D 0;
>> +	struct {
>> +		__le16 chans[2];
>> +		aligned_s64 timestamp;
>> +	} scan =3D { };
>> +
>> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
>> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
>> +		ret =3D regmap_bulk_read(data->regmap,
>> +				       VEML6031X00_REG_ALS_L,
>> +				       &scan.chans, sizeof(scan.chans));
>> +		if (ret)
>> +			goto done;
>> +	} else {
>> +		iio_for_each_active_channel(iio, ch) {
>> +			ret =3D regmap_bulk_read(data->regmap,
>> +					       iio->channels[ch].address,
>> +					       &scan.chans[i++],
>> +					       sizeof(*scan.chans));
>
> [Severity: High]
> Does this loop inadvertently perform an I2C read from address 0 for the
> software timestamp channel?
>
> When IIO_CHAN_SOFT_TIMESTAMP is active and the fast-path isn't taken, it
> iterates over all active channels. Since the timestamp channel does not d=
efine
> a hardware address, its .address is 0.
>
> Would regmap_bulk_read() read VEML6031X00_REG_CONF0 instead of data,
> wasting I2C bandwidth and writing the configuration register's value into
> the scan buffer just before the timestamp?
>

We have mentioned before that Sashiko is wrong about this. Is there any
way to tell Sashiko why this is ok?

> [ ... ]
>
>> @@ -677,12 +1102,21 @@ static int veml6031x00_probe(struct i2c_client *i=
2c)
>>  	iio->channels =3D veml6031x00_channels;
>>  	iio->num_channels =3D ARRAY_SIZE(veml6031x00_channels);
>>  	iio->modes =3D INDIO_DIRECT_MODE;
>>
>>  	ret =3D veml6031x00_hw_init(iio);
>>  	if (ret)
>>  		return ret;
>>
>> +	if (i2c->irq) {
>> +		ret =3D veml6031x00_setup_irq(i2c, iio);
>> +		if (ret)
>> +			return ret;
>> +
>> +		iio->info =3D &veml6031x00_info;
>> +	} else {
>> +		iio->info =3D &veml6031x00_info_no_irq;
>> +	}
>> +
>>  	ret =3D devm_iio_triggered_buffer_setup(dev, iio, NULL,
>>  					      veml6031x00_trig_handler,
>>  					      &veml6031x00_buffer_setup_ops);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is the PM runtime usage
> counter unbalanced at the end of veml6031x00_probe()?
>
> The driver acquires a reference using devm_pm_runtime_get_noresume() whic=
h
> associates a devres cleanup action. If pm_runtime_put_autosuspend() is
> called manually at the end of probe (immediately after this buffer setup)=
,
> the devres cleanup will still fire when the device is unbound, performing=
 a
> second put. Could this cause the PM runtime usage counter to underflow
> to -1?

This cannot happen because the devres action uses pm_runtime_put_noidle(),
which in turns uses atomic_add_unless(usage_count, -1, 0) to avoid
decrementing the usage_count if it is already 0.

Best regards,
Javier
