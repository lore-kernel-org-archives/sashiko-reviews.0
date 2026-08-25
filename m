Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2EA3FFAD7
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787658003; cv=none; b=QIa6bW4PKE7Xod7LBrrn4mJHq1PLpbbIT4691LcVlBsyBiIsDy1BaYyzSH92vh+xYd7Gu6uJql2ReyvXqwRnB8kQItV3/CQdKh/M+B+DFtkMg+itRxuxHxtdgloDtIwSu/2cG1o4CRdCWHaibt+yG0JxA7saDafxU03iUgmG4lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787658003; c=relaxed/simple;
	bh=L/6/DNj0Yio1x00kZr2rxT+p/qQuZdl/Cm127py1fro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OWBHppDPehPh9jP4g/02qUV4nOY6hcT8QK6+Rz4/zuVPxRFzaHt/qrLgGVVFs+psZL/vfJZk+tOpp1abB+ncth+UKc1zX5pbW6SBy3k4hyDZnJhbCK/TTG/3DuAzi2xt3wZYgGXP0X9dq5yve36hzsRh1wINfAMlv74Wq276CXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=IRBKF1Ch; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="IRBKF1Ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787657996; x=1787917196;
	bh=asyZ9V5PRGB1ApJnRmBxuu35L5F7opXjmpLJsMizme8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IRBKF1ChGTNQNemHhc+CKy/oAFMDFBPMvV2CXaB9Uy3WfF+QRoxt5hvoihKtQGi31
	 qq3/7yehXrziM65pOJbX8ekkN+TPE8bb6DGh1mXiLqHMZJgkj6ZP4v4Re3a1NDqS/H
	 gr7FyI5raMEyL/vUP6fKOo95hef0xPPYMK8oIGkNSvfTcEaQy2lGcOhGxS+DgPeJlA
	 cYuWeqZGbNtuyN9cS5CWncIu1A2K3Fm0bfjKBGPJa8xNXeER5943Dg8EvTx1nzq9wT
	 o7TVcqIBMfIjNYV5eiHib3EjEnXBp64AsCuwb5FsSRDhl7ccMG+EgVLpCrRcjuQTxI
	 IxG4XyTzkKu3A==
X-Pm-Submission-Id: 4hTm6K1xj7z1DFFC
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <robh@kernel.org>,
  <devicetree@vger.kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH v6 4/9] iio: accel: mma8452: Support interrupt sharing
In-Reply-To: <20260825084221.582281F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:42:20
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-4-9b252804ee80@geanix.com>
	<YAaf9j1P6vPR2vJqoPFnYqJcHanWcLOeDXn0md6ZcwU_laH0F2kqktrI6TXLQQLQQZjN7_8Bqav7gL8TA5JxFA==@protonmail.internalid>
	<20260825084221.582281F000E9@smtp.kernel.org>
Date: Tue, 25 Aug 2026 13:39:52 +0200
Message-ID: <877bleo2d3.fsf@geanix.com>
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
>
> New issues:
> - [High] If regulator_disable() fails in mma8452_runtime_suspend(), the data->suspended flag is not rolled back, leading to a permanent IRQ storm on subsequent interrupts.
>
> Pre-existing issues:
> - [High] mma8452_remove() does not wake up the device before disabling runtime PM, leading to unbalanced regulator disables (underflow) and illegal I2C access while powered off.
> - [High] Registers are not restored after runtime resume, causing the device to lose critical configuration.
> --
>
> --- Patch [4]: [PATCH v6 4/9] iio: accel: mma8452: Support interrupt sharing ---
> commit 5bc641da9d60875f38db9937a3a1dae1afd9a94e
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Support interrupt sharing
>
> This commit adds handling of runtime PM suspension in the interrupt handler
> to allow sharing the interrupt with other devices. It introduces a suspended
> flag and uses synchronize_irq() to protect against race conditions during
> runtime suspend and device removal.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 1fb43c5b0b72f..8eb97e6793d6f 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
> [ ... ]
>> @@ -1056,14 +1057,24 @@ static irqreturn_t mma8452_interrupt(int irq, void *p)
>>  	struct iio_dev *indio_dev = p;
>>  	struct mma8452_data *data = iio_priv(indio_dev);
>>  	irqreturn_t ret = IRQ_NONE;
>> +	int pm_status;
>>  	int src;
>>
>> +	pm_status = pm_runtime_get_if_active(&data->client->dev);
>> +	if (pm_status == 0)
>> +		return IRQ_NONE; /* device is powered down */
>> +	if (READ_ONCE(data->suspended)) {
>> +		/* device is being removed */
>> +		ret = IRQ_NONE;
>> +		goto out_runtime_put;
>> +	}
>
> [Severity: High]
> Is the READ_ONCE(data->suspended) check reachable during normal suspend?
>
> Since pm_runtime_get_if_active() returns 0 when the device state is
> RPM_SUSPENDING, it seems the handler will return early before reaching
> the data->suspended check.

Yes. That is on purpose. If pm_runtime_get_if_active() returns 0,
runtime PM is enabled and the device is not RPM_ACTIVE. We don't want to
process irq for the device, and we must not call pm_runtime_put() as
that would cause counter underflow.

> [ ... ]
>> @@ -1774,6 +1789,10 @@ static int mma8452_runtime_suspend(struct device *dev)
>>  		return -EAGAIN;
>>  	}
>>
>> +	WRITE_ONCE(data->suspended, true);
>> +
>> +	synchronize_irq(client->irq);
>> +
>>  	ret = regulator_disable(data->vddio_reg);
>>  	if (ret) {
>>  		dev_err(dev, "failed to disable VDDIO regulator\n");
>>  		return ret;
>>  	}
>
> [Severity: High]
> If regulator_disable() fails here, the function returns without resetting
> data->suspended to false.
>
> If this happens, the PM core leaves the device in RPM_ACTIVE. Would this
> cause a permanent IRQ storm since the next interrupt will see pm_status > 0,
> but data->suspended is true, causing it to continually return IRQ_NONE
> without clearing the level-triggered interrupt?

If regulator_disable() fails here, the device will be in STANDBY mode,
and interrupts should not happen. The INT_SOURCE (MMA8452_INT_SRC)
register is reset when switching from ACTIVE to STANDBY mode, and the
analog subsystem is disabled, so no irq should be asserted by the chip.

> [ ... ]
>> @@ -1808,6 +1827,8 @@ static int mma8452_runtime_resume(struct device *dev)
>>  		return ret;
>>  	}
>>
>> +	WRITE_ONCE(data->suspended, false);
>> +
>>  	ret = mma8452_active(data);
>>  	if (ret < 0)
>>  		goto runtime_resume_failed;
>
> [Severity: High]
> This is a pre-existing issue, but does mma8452_runtime_resume() need to
> restore other device registers like MMA8452_CTRL_REG4 and
> MMA8452_DATA_CFG?
>
> When the regulators are disabled during suspend, the device loses power and
> these registers are reset. If they aren't restored here, will the device
> lose its configuration and permanently disable hardware interrupts since
> CTRL_REG4 defaults to 0?

According to data sheet, both CTRL_REG4 (0x2d) and XYZ_DATA_CFG (0x0e)
is preserved on transition from ACTIVE to STANDBY. But yes, we probably
need to restore these when regulator have been disabled.

Is it okay if I address this in a follow-up patch?

> [ ... ]
>> @@ -1822,6 +1843,7 @@ static int mma8452_runtime_resume(struct device *dev)
>>  	return 0;
>>
>>  runtime_resume_failed:
>> +	WRITE_ONCE(data->suspended, true);
>>  	regulator_disable(data->vddio_reg);
>>  	regulator_disable(data->vdd_reg);
>>
>
> [Severity: High]
> This is a pre-existing issue, but if the device is unbound via sysfs while
> runtime-suspended, will mma8452_remove() run into issues?
>
> drivers/iio/accel/mma8452.c:mma8452_remove() {
>     ...
> 	pm_runtime_disable(&client->dev);
> 	pm_runtime_set_suspended(&client->dev);
>     ...
> 	mma8452_standby(iio_priv(indio_dev));
>
> 	regulator_disable(data->vddio_reg);
> 	regulator_disable(data->vdd_reg);
> }
>
> Since pm_runtime_disable() leaves the device suspended, won't
> mma8452_standby() attempt an I2C write on an unpowered chip? Also, won't
> calling regulator_disable() here cause an underflow since the regulators
> were already disabled during runtime suspend? Does this need a
> pm_runtime_get_sync() before teardown?

I don't know if that is the correct approach. But it does look like an
easy fix.

/Esben
