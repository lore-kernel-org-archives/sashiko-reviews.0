Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95314477ED
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785930972; cv=none; b=qdSRnmqhr06GH5UA5nBo5oiylp7jOvWLnFt2gEnof1KW1Tmo4zCiFLkZ17wGRLbDIHmmJ1FmF1qy6I6IwvU7q6HWGqi/JTZ+EHMYSkQ4UN3MXFGfyWAVWpSABrfrXiJL591TQfqRm6bdXSVQs5lfM6Cb7fkt1d4T/Ghmfa3nWx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785930972; c=relaxed/simple;
	bh=3X/1lVqY+9zNgEXc/kg6B+XvFs/cq8FSVO+5z7oIFDU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t0R2cIxVNdT1lnUBj6t7yAv2lHWAEqgtSCy2p940ZV7iObg5f7bnBb0qaTz9c/imRNrKpRmU4ApVa0ec6KjoBILJotd8h+6CqCT87dFACqs08ZzFVv2hvtYe3AK2bh5g2dyxwnvJWOZynmbrdQfdKhiwngUTw6CqOX498SL3ojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=NAtATt9S; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="NAtATt9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1785930958; x=1786190158;
	bh=ef4IKq/Nf56uy8mZ1Q1ksYePcXwrZuQmrMmAHhPUl5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NAtATt9SiNAs6AgK/19tSy+T0jW/i/kWDCexImHfrcmbEKsJeRR3USgd0bH0Wl+2G
	 TDR6LGfVCfZYq46JSCyTZro1FLHmy/IvCALBE28zj/cD3oGdMHMrNvLQeSVu3SY1bl
	 rwgNGRY5XyPUMh60TxHcHFwsCESrG1RYUtvKymIYsMscJOPPYLhFhedwTBswfCzQa2
	 oSZmJe5uiPNVMeXFIkyGQkZBFZqi9kGyVccNX545l6GHJXVb5ziNfJDOanepiivMHm
	 n97BKNBoZ/8NwsrwGsAvqSD1sDeyODfICKuANtscrOirFBV+NE2IrgDZZFedl0RPUV
	 PrxN53+UpcefA==
X-Pm-Submission-Id: 4hFTQ50KnXz2Sd3K
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <robh@kernel.org>,
  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
In-Reply-To: <20260805074101.BB8AC1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 05 Aug 2026 07:41:01
	+0000")
References: <20260805-mma8452-open-drain-v3-0-6149f406a409@geanix.com>
	<20260805-mma8452-open-drain-v3-4-6149f406a409@geanix.com>
	<3CCt4oSYfAV5imS4quqVYLl2kEKTbJA-ytiLMNS_HYVb0p9cXIa87Rmig08wlrwL6qkBEetTqYddmtMWCs5Ijw==@protonmail.internalid>
	<20260805074101.BB8AC1F000E9@smtp.kernel.org>
Date: Wed, 05 Aug 2026 13:55:55 +0200
Message-ID: <875x1obx2s.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
>
> New issues:
> - [High] Shared IRQ handler unconditionally accesses I2C bus while the device may be runtime-suspended.
> - [Medium] Incorrect shared interrupt handling falsely claims unrouted interrupts, masking spurious IRQs.
>
> Pre-existing issues:
> - [High] Volatile register context is not fully restored after PM runtime resume.
> - [High] Unbalanced regulator disable and unpowered I2C access during device removal.
> - [High] Sysfs callbacks modify cached state and access I2C without a PM runtime reference.
> - [High] Reference count leak of the IIO trigger device due to unbalanced iio_trigger_get().
> - [High] The driver ignores the requested IRQ polarity, leading to a hardware/software mismatch.
> --
>
> --- Patch [4]: [PATCH v3 4/4] iio: accel: mma8452: Allow open drain interrupt pin configuration ---
> commit 6358f754e42af1003c7e9459771157fe3985f6bb
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Allow open drain interrupt pin configuration
>
> This patch allows configuring the MMA8452 interrupt pin in open-drain
> mode. It reads the "drive-open-drain" device property and sets the PP_OD
> bit in CTRL_REG3. It also adds the IRQF_SHARED flag to allow sharing the
> interrupt line with other devices.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 723ca3d9cb96b..fa0915530f953 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>
> [ ... ]
>
>> @@ -1688,7 +1712,7 @@ static int mma8452_probe(struct i2c_client *client)
>>  		irq_flags = irq_get_trigger_type(client->irq);
>>  		if (irq_flags == IRQ_TYPE_NONE)
>>  			irq_flags = IRQF_TRIGGER_LOW;
>
> [Severity: High]
> This is a pre-existing issue, but the driver appears to ignore the requested
> IRQ polarity.
>
> While mma8452_probe() retrieves the requested IRQ trigger type to configure
> the OS handler, does the driver ever set the hardware IPOL bit (bit 1) in
> CTRL_REG3 to match it?
>
> The chip defaults to active-low, which might prevent interrupts from being
> delivered if the platform specifies an active-high interrupt.

This is per design. If IPOL bit is set based on the requested IRQ
polarity, support for system designs with additional hardware changing
the irq polarity (like a NOT gate) would not be possible.

If IPOL bit should be configurable, we probably need to add a dedicate
device-tree binding for it.

>> -		irq_flags |= IRQF_ONESHOT;
>> +		irq_flags |= IRQF_ONESHOT | IRQF_SHARED;
>
> [Severity: High]
> Does adding IRQF_SHARED here make it possible for the interrupt handler to
> run while the MMA8452 device is runtime-suspended?
>
> When another device on the shared line triggers an interrupt,
> mma8452_interrupt() is invoked and unconditionally reads MMA8452_INT_SRC
> over I2C:
>
> mma8452_interrupt()
>     src = i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
>
> If the device utilizes runtime PM and powers off its regulators when
> suspended, would this unpowered I2C access cause transfer failures or lock
> up the bus?

Oh. That does look like a problem.

I will add a fix for this for v4 of this series. And I will split the
shared interrupt support into a separate patch, as it is now supposed to
be usable without open-drain mode also.

> [Severity: Medium]
> Additionally, is the interrupt handler equipped to properly reject spurious
> interrupts on a shared line?
>
> With IRQF_SHARED, mma8452_interrupt() will run for other devices'
> interrupts. It unconditionally checks the DRDY bit:
>
> mma8452_interrupt()
>     if (src & MMA8452_INT_DRDY) {
>         iio_trigger_poll_nested(indio_dev->trig);
>         ret = IRQ_HANDLED;
>     }
>
> Since DRDY indicates data is ready even if the DRDY interrupt is not routed
> to the pin in CTRL_REG4, could this falsely claim unrouted interrupts and
> mask IRQ storms from a faulty shared line?

Maybe. I will send a patch with a fix for this when this series is merged.

>>  		ret = request_threaded_irq(client->irq, NULL, mma8452_interrupt,
>>  					   irq_flags, client->name, indio_dev);
>>  		if (ret)
>
> [ ... ]
>
>> @@ -1806,6 +1830,10 @@ static int mma8452_runtime_resume(struct device *dev)
>>  		return ret;
>>  	}
>>
>> +	ret = mma8452_set_interrupt_pin_mode(data);
>> +	if (ret)
>> +		goto runtime_resume_failed;
>> +
>>  	ret = mma8452_active(data);
>
> [Severity: High]
> This is a pre-existing issue, but does mma8452_runtime_resume() fully restore
> the volatile register context after a PM runtime suspend cycle?
>
> mma8452_runtime_suspend() disables regulators, cutting power to the chip.
> When resuming, CTRL_REG3 and CTRL_REG1 are restored, but are other volatile
> registers like DATA_CFG, TRANSIENT_THS, CTRL_REG4/5, and FF_MT_CFG left
> unconfigured?
>
> Could this cause the device to lose its sample rate, thresholds, and
> interrupt routing after the first auto-suspend cycle?
>
> While reviewing the PM runtime and cleanup paths, a few other pre-existing
> issues were noticed:
>
> [Severity: High]
> This is a pre-existing issue, but does mma8452_remove() safely handle
> removing a runtime-suspended device?
>
> mma8452_remove()
>     mma8452_standby(iio_priv(indio_dev));
>     regulator_disable(data->vddio_reg);
>     regulator_disable(data->vdd_reg);
>
> This unconditionally writes to I2C and disables regulators without
> guaranteeing the device is in an active PM state via pm_runtime_get_sync().
> If the device is already runtime-suspended, the regulators were already
> disabled. Could this double-disable regulators and cause unpowered I2C
> access?
>
> [Severity: High]
> This is a pre-existing issue, but do sysfs callbacks like
> __mma8452_write_raw() modify cached state and access I2C without a PM
> runtime reference?
>
> __mma8452_write_raw()
>     data->ctrl_reg1 &= ~MMA8452_CTRL_DR_MASK;
>     data->ctrl_reg1 |= i << MMA8452_CTRL_DR_SHIFT;
>     ...
>     return mma8452_change_config(data, MMA8452_CTRL_REG1, data->ctrl_reg1);
>
> If the device is in auto-suspend (regulators off) when user-space writes to
> sysfs attributes, would the I2C writes fail and corrupt the cached driver
> state?


As I am actually not using runtime PM with this device, I prefer to not
investigate these 3 issues further for now.

> [Severity: High]
> This is a pre-existing issue, but is there a reference count leak of the IIO
> trigger device?
>
> In mma8452_trigger_setup(), an extra reference is acquired:
>
>     indio_dev->trig = iio_trigger_get(trig);
>
> However, mma8452_trigger_cleanup() unregisters the trigger but does not
> appear to drop the reference with iio_trigger_put(). Could this permanently
> elevate the reference count and prevent the module from being unloaded?

Maybe. But in that case, this is a problem for basically all iio
drivers, as there are no explicit calls to iio_trigger_put() in any iio
drivers as of now.

/Esben
