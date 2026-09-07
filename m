Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C63EAC80
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796703; cv=none; b=pGdSLx0ltedr1XiWIiQ3YMGwkfLKao4x3Cp5bSg33GshdmKgTG5cCOggrKgY/hBnWoUFODcyuI0WnPojW8wHRJ3QDLd/NIR7SIDYb6VmOKsgJJGJw6bMXGK/zM4Bqo+94YtBJ4WhiQ8FQoxiF0zSvbPYEKty2tSxbboi5oOA14I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796703; c=relaxed/simple;
	bh=Fce+3jUwgsWvi5koq8PRKbZIYAtq/+j6ybY0Te+yHWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a2kgbFK7a9Q2O2uhdWo0ykfdtXxJ78aStmz1bLkKaw3X5QR+wAC1Piq9DKy87DpiHOJdFzE32LECI6rjnk1/JMlhsLI5+O5ORVJV9M8cKT2kTLB989h42LLbPydzCLOXnZxsYXh8GbUciR6Bend4aBWYDOjIr5cLCrgHzm6Zg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=BL51uCcI; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="BL51uCcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788796695; x=1789055895;
	bh=D2+5AFS3jqYsqprxeNeNiyO+DoPvgRblbpH4ixduHyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BL51uCcIjLA3DidCZ4iDlUUHjAz2JEMRmpVnRA8Ay+dlfXLnSKkxTTUcQdSirwL4l
	 DRtwTfiSkymcTJBLUsMYXa2BPESjN6VybQdJwt0qXzStj4q7rqKL+P0VgCaG6cXFXh
	 n1urOk/iEObHVUYHBaN6O4QVv+FuP5863XDey2ElSSSDTXETnSrtmNMC+HMKEvboGt
	 yxQfci9Tw8UL16evHB7k8lgn4nEJ8nXfxVwq/X8ndxmsJwuoepgYz3RGPZLsFhTITI
	 nwRxch7Rpbtnl03ZJ9ETXuol5naAhdC7dYexrI4XoFqCFRI6uosP4a7BYtBlJ5qdWM
	 eoFhNc8e0oaqw==
X-Pm-Submission-Id: 4hdsDP4C0gz2Scsk
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <devicetree@vger.kernel.org>,  <robh@kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH v8 9/9] iio: accel: mma8452: Support interrupt sharing
In-Reply-To: <20260907150846.8BC741F00A3A@smtp.kernel.org>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-9-c17407e22118@geanix.com>
	<lgSgGIif93eJ1usOlpNZhgkh3YsQ-210nNAm7LCuSB_7RdMgA45onz0txTfZJrprGgkQjQDLLq8kAlNsIPMv6A==@protonmail.internalid>
	<20260907150846.8BC741F00A3A@smtp.kernel.org>
Date: Mon, 07 Sep 2026 17:58:12 +0200
Message-ID: <87mrtt8357.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [Critical] Writing to MMA8452_CTRL_REG4 to disable interrupt sources fails because the device is still in ACTIVE mode.
> - [High] The IRQ handler incorrectly checks `pm_status == 0` instead of `pm_status <= 0`, allowing invalid hardware access when PM is disabled.
> - [Low] Mixing goto-based error handling with guard() cleanup in the same function.
>
> Pre-existing issues:
> - [High] Hardware access occurs after dropping the runtime PM reference in mma8452_write_event_config.
> - [High] AB-BA deadlock between the driver's data->lock and the PM core's runtime suspend wait.
> --
>
> commit 3d8bf763b3ae36284346684babbd11058f68e68a
> Author: Esben Haabendal <esben@geanix.com>
> Date:   Mon Sep 7 14:51:04 2026 +0000
>
>     iio: accel: mma8452: Support interrupt sharing
>
>     Adding support for sharing interrupt line with other device requires the
>     interrupt handler to handle runtime PM suspension properly, ignoring the
>     irq if the device is suspended (maybe even off). And while at it, we use
>     the PM reference to ensure we do not get suspended while processing an irq.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index fda29df5d1097..e521dca37f768 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
> [ ... ]
>> @@ -1083,15 +1085,21 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
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
>> +
>
> [Severity: High]
> Does this check fail to catch negative error codes, allowing the handler to
> proceed and access unpowered hardware?
>
> When runtime PM is disabled, pm_runtime_get_if_active() returns -EINVAL. This
> can happen during driver unbind or removal, as pm_runtime_disable() is called
> before free_irq():
>
> drivers/iio/accel/mma8452.c:mma8452_remove() {
> 	...
> 	pm_runtime_disable(dev);
> 	pm_runtime_set_suspended(dev);
>
> free_irq:
> 	if (client->irq)
> 		free_irq(client->irq, indio_dev);
> 	...
> }
>
> If a shared IRQ fires concurrently after PM is disabled, this check allows
> the handler to proceed, leading to I2C bus timeouts or system hangs.

This is on purpose. If runtime PM is disabled, the assumption is that
the device is active. Otherwise, the driver would be useless when
CONFIG_PM was not enabled.

>>  	src = i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
> [ ... ]
>> @@ -1784,29 +1796,62 @@ static void mma8452_remove(struct i2c_client *client)
>>  #ifdef CONFIG_PM
>>  static int mma8452_runtime_suspend(struct device *dev)
>>  {
>> -	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct iio_dev *indio_dev = i2c_get_clientdata(client);
>>  	struct mma8452_data *data = iio_priv(indio_dev);
>>  	int ret;
>>
>> -	scoped_guard(mutex, &data->lock)
>> -		ret = mma8452_standby(data);
>> +	guard(mutex)(&data->lock);
>> +
>> +	ret = i2c_smbus_read_byte_data(client, MMA8452_CTRL_REG4);
>>  	if (ret < 0) {
>> -		dev_err(dev, "powering off device failed\n");
>> +		dev_warn(dev, "backing up CTRL_REG4 failed\n");
>>  		return -EAGAIN;
>> +	} else
>> +		data->ctrl_reg4 = ret;
>> +
>> +	ret = i2c_smbus_write_byte_data(client, MMA8452_CTRL_REG4, 0);
>> +	if (ret) {
>> +		dev_warn(dev, "disabling interrupt sources (CTRL_REG4) failed\n");
>> +		return -EAGAIN;
>> +	}
>
> [Severity: Critical]
> Does writing to MMA8452_CTRL_REG4 fail here because the device is still in
> ACTIVE mode?

Ouch, Yes. That is actually true according to the datasheet.

I will swap the order so that we switch to standby before modifying CTR_REG4.

> Since the write happens before mma8452_standby(), the hardware ignores it
> (as modifying configs requires STANDBY mode). This leaves interrupt sources
> enabled. If a shared IRQ fires, the handler will return IRQ_NONE due to the
> pm_status check, leaving the interrupt asserted and causing a level-triggered
> interrupt storm.
>
>> +
>> +	ret = mma8452_standby(data);
>> +	if (ret < 0) {
>> +		dev_err(dev, "transition to STANDBY mode failed\n");
>> +		ret = -EAGAIN;
>> +		goto out_restore_ctrl_reg4;
>>  	}
>
> [Severity: Low]
> Does this mix goto-based error handling with guard() cleanup in the same
> function?
>
> The cleanup subsystem guidelines state that mixing goto and scope-based cleanup
> creates confusing ownership semantics.
>
> [ ... ]

I will try to convert to scope-based cleanup to avoid this, and see if I
can create something nice with that approach.

> As a side note, there are a couple of pre-existing issues in this file that
> are not introduced by this patch, but are worth mentioning:
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a use-after-put in
> mma8452_write_event_config() when disabling an event?
>
> drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
> 	...
> 	ret = mma8452_set_runtime_pm_state(data->client, state);
> 	if (ret)
> 		return ret;
>
> 	switch (dir) {
> 	case IIO_EV_DIR_FALLING:
> 		return mma8452_set_freefall_mode(data, state);
> 	case IIO_EV_DIR_RISING:
> 		val = i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
> 	...
> }
>
> When state is false, mma8452_set_runtime_pm_state() calls
> pm_runtime_put_autosuspend(), dropping the PM reference early. The subsequent
> i2c_smbus_read_byte_data() accesses hardware while the device could be
> concurrently suspended, potentially causing I2C transaction failures.

I will address this in another series.

> [Severity: High]
> This is a pre-existing issue, but does mma8452_read_raw() create an AB-BA
> deadlock with PM suspend?
>
> drivers/iio/accel/mma8452.c:mma8452_read_raw() {
> 	...
> 		guard(mutex)(&data->lock);
>
> 		ret = mma8452_read(data, buffer);
> 	...
> }
>
> mma8452_read() calls mma8452_set_runtime_pm_state(..., true), triggering a
> synchronous PM resume. If a concurrent PM suspend is initiated by the PM
> core, it sets the status to RPM_SUSPENDING and calls
> mma8452_runtime_suspend():
>
> drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
> 	...
> 	guard(mutex)(&data->lock);
> 	...
> }
>
> The suspend callback will block waiting for data->lock, while
> mma8452_read_raw() blocks waiting for the RPM_SUSPENDING state to clear,
> resulting in a deadlock.

I will try to look out for this in the next series, where I am trying to
improve all the runtime PM handling in this driver.

/Esben
