Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B4B4349B6
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627214; cv=none; b=pxVr7IIQLiPNRHWdrfqKCHemMq3bk3iQ7hZnVP46sJxIeO1dJjUDukKgV/kzw/+OXUqNORKPySHS6XdH+/N6bjCbzTqBA7GjY1aQE5HZjO9u/sOPKFIU4K0YaOomKDTKjqiW7MXh/NOnipsJaMX42vhWjvdiRYVTUF6Dvs2h+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627214; c=relaxed/simple;
	bh=f1QRepBbWZ/l8660Nq06d26o8HeFv0/fKHJXcSIt6GI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hMhTSNcFgLs2zOgsuGKsGHmcwCH3qQaYRcgOui7MEZoSwvwM7gHJq6bPErugKeTWKqksp7yd6FaEGWUcf74PZ9ZpBv+Q23sCKeDnEkBI8LS6BxsBOkHCYe0P9PA7yhNXiBGLUwjiNb3Ps77VKDmiLg54BMfLE9OTQrdvp4D7Yuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=u7btnMhk; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="u7btnMhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1789627208; x=1789886408;
	bh=7IMNOjt0Ppv/0nXgXbNNXUVyv/GVippRssUgg0KAhJg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=u7btnMhk20zG/gaqDh4pRNnp/JvZ1PV3OekOxwfvgyBQFEPeYYvRw6t/WPOLpK381
	 ze8i/TViXAV4VqpPGpS4Fkg7ufdN0T7vEbW/XtNH5CuhAPiv+7UlRfnS4su/PGhNeo
	 Aw+OWm4zV4UJP+S/K2D35OjRXWr+vj7SygvPbN9To1UkHVR3RxdAuhEPwq/sjjs1ug
	 qzscl9oZPOA61XWBJ9yVW3o//HxMuzNfIP1/Fu6tNPBkMEG4zBcrhi4xGtF27MsW2O
	 dFn+FW6Ovr/1kRit8n2Hld7bjq1haCib3cFBHRurCaQdeNHTywSvH+dPEi+VB7llp3
	 iO0lbGqsAbvUg==
X-Pm-Submission-Id: 4hlmMp5NLYz1DDrw
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <robh@kernel.org>,  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 10/10] iio: accel: mma8452: Support interrupt sharing
In-Reply-To: <20260916083119.03A8F1F000FF@smtp.kernel.org>
References: <20260916-mma8452-open-drain-v9-0-0dd24fa2f3d7@geanix.com>
	<20260916-mma8452-open-drain-v9-10-0dd24fa2f3d7@geanix.com>
	<l9LG3al0xmawstyXcDwD8OhOBMwn13q6oz0NvCPy4kL0lA4DX5biMlUWcvt9Wwu1AiyugOvUZgQfnFJ4dvuvbA==@protonmail.internalid>
	<20260916083119.03A8F1F000FF@smtp.kernel.org>
Date: Thu, 17 Sep 2026 08:40:06 +0200
Message-ID: <87se38754p.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] iio: accel: mma8452: Interrupt storm livelock when IRQ fires during RPM_SUSPENDING
> - [High] iio: accel: mma8452: Invalid I2C access during system suspend due to mishandled -EINVAL
> - [Medium] iio: accel: mma8452: Race condition in probe error path due to pm_runtime_disable() before free_irq()
> --
>
> commit bf19c63685f6fff116a3a5358196fd66dff6090a
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Support interrupt sharing
>
> This commit adds support for shared interrupts to the mma8452 driver. It
> modifies the interrupt handler to check the runtime PM status and ignores
> the interrupt if the device is suspended. It also updates the runtime
> suspend and resume paths to properly disable and restore interrupt sources.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 5aea6bf3312af..2a980c0c2e03a 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>
> [ ... ]
>
>> @@ -1086,15 +1088,28 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
>>  {
>>  	struct iio_dev *indio_dev = p;
>>  	struct mma8452_data *data = iio_priv(indio_dev);
>> +	struct device *dev = &data->client->dev;
>>  	irqreturn_t ret = IRQ_NONE;
>> +	int pm_status;
>>  	int src;
>>
>> +	pm_status = pm_runtime_get_if_active(dev);
>> +	if (pm_status == 0)
>> +		return IRQ_NONE; /* device is powered down */
>
> [Severity: Critical]
> If the device asserts its level-triggered interrupt when the PM core is
> transitioning the device to RPM_SUSPENDING (e.g., when the autosuspend
> timer expires), pm_runtime_get_if_active() will return 0.
>
> Does returning IRQ_NONE without clearing the hardware interrupt here cause
> a permanent interrupt storm? Since the IRQ line is shared and unmasked upon
> return, the still-asserted hardware interrupt might immediately re-trigger
> the handler, potentially starving the worker thread that executes
> mma8452_runtime_suspend() and hard-locking the system.

This should be handled by the disable of all interrupt sources (clearing
CTRL_REG4) in mma8452_runtime_suspend().

> [Severity: High]
> During system suspend, pm_runtime_force_suspend() disables runtime PM,
> which increments the disable depth. If a shared interrupt fires during this
> window, pm_runtime_get_if_active() returns -EINVAL.
>
> Since this check only catches pm_status == 0, does this allow the handler
> to proceed and perform I2C reads on unpowered hardware? Per subsystem
> guidelines, should this check for pm_status <= 0 instead?

If we bail out on pm_status <= 0, the driver would not work on systems
with CONFIG_PM not enabled.

In order to handle the difference betwen the different reasons for
-EINVAL, it would seem like we would need some #ifdef CONFIG_PM in here.
Do we really want to do that?

>> +
>> +	/*
>> +	 * pm_status is now 1 or -EINVAL. If pm_status==1, runtime PM is enabled
>> +	 * and device is RPM_ACTIVE. If pm_status==-EINVAL, runtime PM is
>> +	 * disabled (e.g. CONFIG_PM not enabled), and we can/must assume device
>> +	 * is active.
>> +	 */
>> +
>>  	src = i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
>
> [ ... ]
>
>> @@ -1771,11 +1790,12 @@ static void mma8452_remove(struct i2c_client *client)
>>
>>  	iio_device_unregister(indio_dev);
>>
>> -	pm_runtime_disable(dev);
>> -	pm_runtime_set_suspended(dev);
>> -
>>  	if (client->irq)
>>  		free_irq(client->irq, indio_dev);
>> +	/* No irq will fire beyond this point */
>> +
>> +	pm_runtime_disable(dev);
>> +	pm_runtime_set_suspended(dev);
>
> [Severity: Medium]
> This correctly fixes the race in mma8452_remove() by moving free_irq()
> before pm_runtime_disable(), but does the same race still exist in the
> mma8452_probe() error path?
>
> If mma8452_probe() fails after pm_runtime_enable(), it jumps to the
> runtime_suspend label:
>
>   mma8452_probe() {
>       /* ... */
>   runtime_suspend:
>       pm_runtime_disable(dev);
>       pm_runtime_set_suspended(dev);
>
>   free_irq:
>       if (client->irq)
>           free_irq(client->irq, indio_dev);
>       /* ... */
>   }
>
> If a shared interrupt fires between pm_runtime_disable() and free_irq(),
> could the handler attempt to access unpowered hardware?

I will apply the same reordering in mma8452_probe().

/Esben
