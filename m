Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313383E1CF5
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699588; cv=none; b=koVPY9NHkwDk6Uoi1VLEoe4TqjK7fcctuTCPiS71/+QIEanjig8Nm9iPzAILW+e6OOCB1VkmJ8MeSBOSfAZeI5UoF7Qh9veoPkHmYV57TgrTgSeUJa4fHvV2HfFp44nTVUBUrv0iAgLLOTuDPqfWm2U+kWTKClbIatN1u1NNovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699588; c=relaxed/simple;
	bh=P0iPoUrCX0i2z81+BjaUOb6jBhK7FXHYkARN9CouXzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=KKmtLv4UOsC9+DOi8FXTJXuQsjDvdRLKR+SnPP+AX0wuy36/ZvkbnO7Sp+tfwqgz/WwweUWnHGYAwFiqt30naNoICxsIo6ckcxSgLdmoBSAMphDB3OkAE9xWyYuKWaSaTW9TE+fBNliVVtKfsMLpuOoha/gxfnIMOrniaeZaA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch71tKFK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch71tKFK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso16961555e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779699584; x=1780304384; darn=lists.linux.dev;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvvat9B5X9G8HfxiqwKVComVcnJ0sI0Jsr4rM8U1Hx4=;
        b=Ch71tKFKKixaT0VcckCo8XCzFjBktpBHirezo6RqF/PbCII/R4b/MCoEz1kUlYrMh7
         2nxTTb9QJMT7jf38lUm4Bc80E71A6eRaIeIJUkKUi9oqAPOiltSiu/+rZlH2H/9S6hm5
         HI6N6Ns356v0aWqE6vN+N4sg6hoEx2LN48ZoX/TL6sGMQQHrrLCwX/dE9ZIwZl4nTTMQ
         Dzq3JeNuN7MZXi4VbebXjFwT93jK6qv5HulbP/L7BYt6nzAGXqLplfbNpPE5eUQjPRdm
         j1g09amAMNMj9uBHIihRvTsl9zPYNgi5ORdrpv+S9k9pDlD0ZKrFT8EBVNrhWTnkucfn
         tNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779699584; x=1780304384;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvvat9B5X9G8HfxiqwKVComVcnJ0sI0Jsr4rM8U1Hx4=;
        b=gBC+qieXHcRxPgo3s0hKIarU+ABqdR8XsKSzNRGIoKzr6TDiMaLhhicIEIEVxAG6pt
         Abj0hDtVLVBD12jaqB8lTvt7wC2T+FNPROyuK80B4MjLehxA7790rtnAgYQjWs2ZL/Zn
         gG2kq6AE9zVaSix1yCpRFXr7F55TiYfznpdkKUrhlSKCRMzFNdOOI3o0qYgJfa1yxkQ3
         E8vI90bvh988tSNK89vc2YeDEFWrO5Edl4D2G4S8DZcd3CP4V48Y4wH+Zn15myZCS8YE
         s5JhqMlTXWPznsOOXXSThD/ZUm9bPRbrTy4YXFpFnNiwUa3JG76rcjnSexwu8kJVgNcU
         VoUw==
X-Gm-Message-State: AOJu0YwB39NbJBL0jy/Zc3p5yxbc+N1BOk63ilrDxWt8yTwezESW7UJU
	5qtct6E6Kh1Lp4TPR+gcCk5WOjTfkYfXvQijXt0p+EshbsXpke6lnBn1ts8Pig==
X-Gm-Gg: Acq92OFQ7WNVesbzLkfQL20mWNokwqgmcet+nI8mBoofELjUnaLyJQQskD03PJI2xgQ
	ep0C0XnsQj9Y8xP8xNjXVn6g3YZ3ZO0eC58s9URBgAV4QlOPcyxWZb3em9az9n2/iqopbxyGfzs
	4N5Bhf7ip0CNGW3i56ecQXU0V3b1ZitMfBYJhJNgupBJV9LuBI6rcqguM8QQtCePK4jdTsAkP4O
	70/EA1x7RQc5L52KD6974xx2n+wNEaDBsEKkEALapbDo+vGKgeOn5hWTGJjUQ4jqEnTROUygaHq
	d7LMndxNwlDAbNLzBXfnDvpTxOJMUYu4y1/fhWdfof589FC+qKmSKy//pIi8IEY1H1EqLGCbVqf
	3W3ovo3KUIPj4oByna7gBLUm9PNUlAXO84bPex7ufp2asrkarABRzRWIiobzoWl9cqTT56EvVqS
	YXiUjsj1kw/kCfITLoXxhl00I3l8H5CRVT6Um+
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id 5b1f17b1804b1-490482c4586mr226623815e9.23.1779699584332;
        Mon, 25 May 2026 01:59:44 -0700 (PDT)
Received: from localhost ([2001:4bb8:19a:6947:df80:1d3b:cdac:de73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm24145680f8f.17.2026.05.25.01.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 01:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 10:59:42 +0200
Message-Id: <DIRMUL7WL5RF.SP42SSV27C8K@gmail.com>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: veml6031x00: add support for events
 and trigger
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260524-veml6031x00-v3-4-29165609b2b5@gmail.com>
 <20260525001350.987641F000E9@smtp.kernel.org>
In-Reply-To: <20260525001350.987641F000E9@smtp.kernel.org>

On Mon May 25, 2026 at 2:13 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Cache pollution of AF_TRIG causes unintended conversions and unn=
ecessary I2C reads.
> - [High] The trigger reference acquired via iio_trigger_get() is leaked o=
n probe error paths and driver unbind.
> - [High] PM runtime usage counter leaks if the driver unbinds while an ev=
ent is enabled.
> - [High] Sysfs read/write functions and trigger operations access hardwar=
e without acquiring a PM runtime reference.
> - [High] Out-of-bounds array write in veml6031x00_trig_handler when the t=
imestamp channel is enabled.
> - [Medium] Dead event sysfs attributes are exposed when no IRQ is present=
.
>
> Pre-existing issues:
> - [High] Unbalanced double-put of the runtime PM usage counter on driver =
unbind.
> - [High] The shutdown action accesses I2C registers after PM runtime has =
been disabled.
> --
>
> commit cbdd69d1454af4788d5d18a23d3fb6854c9981e9
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
>> index 9968d4414dc96..c57aaa29abf30 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
>
> [ ... ]
>
>> @@ -136,6 +189,8 @@ static const struct iio_chan_spec veml6031x00_channe=
ls[] =3D {
>>  		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
>>  		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
>>  		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
>> +		.event_spec =3D veml6031x00_event_spec,
>> +		.num_event_specs =3D ARRAY_SIZE(veml6031x00_event_spec),
>
> [Severity: Medium]
> Will this expose dead event sysfs attributes when no IRQ is present?
>
> When i2c->irq is 0, the driver registers veml6031x00_info_no_irq which la=
cks
> event callbacks. However, this channel array unconditionally defines
> event_spec and num_event_specs. The IIO core will parse these and expose
> event sysfs files. Reading or writing these files will fail with -EINVAL
> because the callbacks are NULL, which violates the sysfs API contract.
>
> [ ... ]
>

@Jonathan: is this how it really works? How can I then dynamically
define even_spec to account for it?

>> +static int veml6031x00_read_event_val(struct iio_dev *iio,
>> +				      const struct iio_chan_spec *chan,
>> +				      enum iio_event_type type,
>> +				      enum iio_event_direction dir,
>> +				      enum iio_event_info info,
>> +				      int *val, int *val2)
>> +{
>
> [Severity: High]
> Are PM runtime references needed here before accessing hardware?
>
> This function, as well as veml6031x00_write_event_val() and
> veml6031x00_set_trigger_state(), performs I2C accesses via regmap without
> first calling pm_runtime_resume_and_get(). If the device is
> runtime-suspended and its PM domain has powered it off, will these I2C
> accesses fail or time out?
>
> [ ... ]
>

As I said for [2/4], reading registers in shutdown mode is absolutely
fine.

>> +static int veml6031x00_write_event_config(struct iio_dev *iio,
>> +					  const struct iio_chan_spec *chan,
>> +					  enum iio_event_type type,
>> +					  enum iio_event_direction dir,
>> +					  bool state)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	int ret;
>> +
>> +	guard(mutex)(&data->lock);
>> +
>> +	/* avoid multiple increments/decrements from one source */
>> +	if (state =3D=3D data->ev_en)
>> +		return 0;
>> +
>> +	if (state) {
>> +		ret =3D pm_runtime_resume_and_get(data->dev);
>
> [Severity: High]
> Could this leak the PM runtime usage counter if the driver unbinds?
>
> Enabling an event increments the PM runtime usage counter here. If the
> driver is unbound via sysfs while an event is enabled, the IIO core does
> not automatically disable the event. Since there is no unbind cleanup
> mechanism to release the pending PM reference when data->ev_en is true,
> does this keep the device powered on indefinitely?
>
> [ ... ]
>

@Jonathan: Does the IIO core let the event enabled? What is the
approach to clear it then?

>> +/* AF_TRIG is reset by hardware, but the rest of the fields are persist=
ent */
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
> Can this cause unintentional active force conversions due to cache pollut=
ion?
>
> This sets the self-clearing AF_TRIG bit using regmap_update_bits().
> Because CONF0 is not marked as a volatile register, regmap_update_bits()
> writes AF_TRIG=3D1 and caches it. Any subsequent read-modify-write on CON=
F0
> (e.g., toggling the interrupt or changing integration time) will read the
> cached AF_TRIG=3D1 and write it back to hardware, unintentionally trigger=
ing
> an active force conversion and causing hardware state corruption.
>
> [ ... ]
>

I will define the CONF0 register as volatile to account for this.

>>  static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
>>  {
>>  	struct iio_poll_func *pf =3D p;
>>  	struct iio_dev *iio =3D pf->indio_dev;
>>  	struct veml6031x00_data *data =3D iio_priv(iio);
>>  	int ch, ret, i =3D 0;
>>  	struct {
>>  		__le16 chans[2];
>>  		aligned_s64 timestamp;
>>  	} scan =3D { };
>>
>>  	if (*iio->active_scan_mask =3D=3D (BIT(VEML6031X00_SCAN_ALS) |
>>  				       BIT(VEML6031X00_SCAN_IR))) {
>>  		ret =3D regmap_bulk_read(data->regmap,
>>  				       VEML6031X00_REG_ALS_L,
>>  				       &scan.chans, sizeof(scan.chans));
>>  		if (ret)
>>  			goto done;
>>  	} else {
>>  		iio_for_each_active_channel(iio, ch) {
>>  			ret =3D regmap_bulk_read(data->regmap,
>>  					       iio->channels[ch].address,
>>  					       &scan.chans[i++],
>
> [Severity: High]
> Does this loop cause an out-of-bounds array write if the timestamp
> channel is enabled?
>
> The iio_for_each_active_channel() loop does not exclude the soft timestam=
p
> channel. If the user enables ALS, IR, and TIMESTAMP channels, the loop
> iterates 3 times. However, the scan.chans array is declared as
> __le16 chans[2]. Processing the timestamp channel increments the index i
> to 2 and writes to scan.chans[2], causing an out-of-bounds memory write.
>
> Furthermore, because the timestamp channel's address is 0, this incorrect=
ly
> attempts a bogus I2C read from VEML6031X00_REG_CONF0.
>
> [ ... ]
>

Not sure if this is a real issue, and the address for channel 0 is not
CONF0 because it is defined in iio_chan_spec
veml6031x00_channels.address.

>> +static int veml6031x00_setup_irq(struct i2c_client *i2c, struct iio_dev=
 *iio)
>> +{
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	struct device *dev =3D data->dev;
>> +	int ret;
>> +
>> +	data->trig =3D devm_iio_trigger_alloc(dev, "%s-drdy%d", iio->name,
>> +					    iio_device_id(iio));
>> +	if (!data->trig)
>> +		return -ENOMEM;
>> +
>> +	data->trig->ops =3D &veml6031x00_trigger_ops;
>> +	iio_trigger_set_drvdata(data->trig, iio);
>> +
>> +	ret =3D devm_iio_trigger_register(dev, data->trig);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iio->trig =3D iio_trigger_get(data->trig);
>
> [Severity: High]
> Is the trigger reference acquired here leaked on driver unbind?
>
> Calling iio_trigger_get() increments the trigger device's refcount and th=
e
> driver module's refcount. If the driver fails probe afterwards or is unbo=
und
> later, iio_trigger_put() is never called because there is no devres actio=
n
> registered for it and no custom remove callback. Does this permanently le=
ak
> the trigger device reference and prevent the module from being unloaded?
>
> [ ... ]
>

Same here. I believe that only industrialio-trigger.c makes use of
iio_trigger_put().

>> @@ -618,6 +1039,10 @@ static int veml6031x00_probe(struct i2c_client *i2=
c)
>
> [ ... ]
>
>>  	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action,=
 data);
>
> [Severity: High]
> This is a pre-existing issue, but does this shutdown action access I2C
> registers after PM runtime has been disabled?
>
> This action is registered via devm_add_action_or_reset() before PM runtim=
e
> is enabled. On teardown, devm actions run in reverse, meaning PM runtime =
is
> disabled before the shutdown action runs. The shutdown action then attemp=
ts
> I2C writes while PM runtime is disabled. If the device was suspended, it
> cannot be resumed, potentially causing I2C transfer failures.
>
> [ ... ]
>
>>  	pm_runtime_put_autosuspend(dev);
>
> [Severity: High]
> This is a pre-existing issue, but is there an unbalanced double-put of th=
e
> runtime PM usage counter on driver unbind?
>
> The probe function registers a cleanup action to drop the PM reference vi=
a
> devm_pm_runtime_get_noresume(dev). However, this explicit put at the end
> of probe means the devm action will drop the reference a second time on
> unbind, causing a PM usage counter underflow that breaks the PM runtime
> state machine.

As I said for [2/4], there won't be any counter underflow that way.

Best,
Javier
