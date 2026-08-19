Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7634416D1A
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129084; cv=none; b=WTaUAs5fmu0ruxb0Dg56qKNjnnwb00jscd6aPF1A9gbrjm6qnpa53841I4Ga8GjMDcR1oOKLVVsWhtW/uRjxOU/1kUgjeRG46LE3b6USGE748sSIu2Q/9n/YgTt4mSaFi7Kewd8VL/TLqQn7VzZxy4qH/LXwIE9yqIbjG842QjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129084; c=relaxed/simple;
	bh=sd97K6LQlzbVQuCV/CnpqmaoI+hfKWUPMLSOGZkWrNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D4Rm1UfkV5YVqMOtGNdpLMt++STQ2s3CtEcMIio9y1uBE5RWXVLRdhxQy9s+YF15yOtiVWviDN2SvbzJe4hZ/ElQ93iE9HhAfFJPi9Olg+6hyyRxZZyMK6EwOUuOvkvOAPFT8cVHpP6zaAQ+PHYqq6Zc1cDo871pvkz3GOTIgjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=pfn5J4H8; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="pfn5J4H8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787129073; x=1787388273;
	bh=Yhs/KUzvuwpk/qtsf9pNgHwEgS1uh0dEXULoHEIlBM4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pfn5J4H8yQ8ZmqsBfsO6M4Xt/4tJfjLHcQs58OiPmhqRTSZkB2nkGfNPWFFLkfypS
	 6y2A+XRFxNPG3d2wVl9cPT7euwnVq9s9ogbG1Q0do57UffwhX3UX4LugEEDgD23eAO
	 51zIoPpMjeLr2TWw4ZP7ilLuQuSm+htLFbQRpFrp50cHLOkgug8M/XmHN9cqF2gHUs
	 czwNrxomPwX58AiefaMgOLVvVdJklXtrANSqKgRhiRN2LyxXB7q3+WG1z3VkXYD4Tv
	 RAmaGFuxeaGMrC8RmImOd+NrShEI7dXGHlkew/tAoQw6BdHxRtbnpIFNCqhhjLhGvC
	 vNEhfFwxUxd0w==
X-Pm-Submission-Id: 4hQ0Vl5p6bz2ScX8
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <devicetree@vger.kernel.org>,
  <robh@kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND v5 4/6] iio: accel: mma8452: Support interrupt
 sharing
In-Reply-To: <20260819082547.783CD1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 19 Aug 2026 08:25:47
	+0000")
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
	<20260819-mma8452-open-drain-v5-4-d8aa590d7c36@geanix.com>
	<ZLyemjqlxP-U6rRBNInlQp7sJfLwB7tJI9VWCglK8nFiCOY4u4NidOdROFOLcLNAR4zA0F31qVjeiKNA0XIfBw==@protonmail.internalid>
	<20260819082547.783CD1F000E9@smtp.kernel.org>
Date: Wed, 19 Aug 2026 10:44:30 +0200
Message-ID: <874igq1oup.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Failed runtime suspend leaves the `suspended` flag set to `true`,
> causing an unrecoverable PM usage counter leak and a potential interrupt =
storm.
> - [Low] Compilation Error: undeclared variable `client` used in `mma8452_=
runtime_suspend`.
>
> Pre-existing issues:
> - [High] Unbalanced `regulator_disable()` calls and I2C writes to a power=
ed-off device in `mma8452_remove()`.
> --
>
> --- Patch [4]: [PATCH RESEND v5 4/6] iio: accel: mma8452: Support interru=
pt sharing ---
> commit 79ad9089167d804daaa97086d058cd3a0e2f4199
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Support interrupt sharing
>
> This commit adds handling of runtime PM suspension in the interrupt handl=
er
> to allow sharing interrupts with other devices. It introduces a suspended=
 flag
> and uses synchronize_irq() to protect against race conditions during runt=
ime
> suspend and device removal.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 1fb43c5b0b72f..25bb2dd69381e 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
> [ ... ]
>> @@ -1056,14 +1057,19 @@ static irqreturn_t mma8452_interrupt(int irq, vo=
id *p)
>>  	struct iio_dev *indio_dev =3D p;
>>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>>  	irqreturn_t ret =3D IRQ_NONE;
>> +	int pm_status;
>>  	int src;
>>
>> +	pm_status =3D pm_runtime_get_if_active(&data->client->dev);
>> +	if (pm_status =3D=3D 0 || READ_ONCE(data->suspended))
>> +		return IRQ_NONE; /* device is powered down or being removed */
>> +
>
> [Severity: High]
> If mma8452_runtime_suspend() in drivers/iio/accel/mma8452.c fails and
> leaves data->suspended set to true, can this early return cause a PM
> usage counter leak and an interrupt storm?
>
> If the device is kept in the RPM_ACTIVE state after a suspend failure,
> pm_runtime_get_if_active() will return 1. Because data->suspended is true,
> the handler will return IRQ_NONE immediately.
>
> This skips pm_runtime_put_autosuspend(), leaking the usage counter. Also,
> by returning IRQ_NONE on a shared level-triggered IRQ without clearing the
> hardware interrupt, wouldn't this trigger an interrupt storm?

Yes, I make sure to call pm_runtime_put_autosuspend() when
pm_runtime_get_active() returns 0 and suspended flag is set.

Also, I guess we should not set the suspended flag until after checking
the return value from mma8452_standby() in mma8452_runtime_suspend().

In case one of the regulator_disable() calls fails, the suspended flag
will be left set to true. But as the device is in standby, no interrupt
storm should happen.

> [ ... ]
>> @@ -1768,12 +1778,15 @@ static int mma8452_runtime_suspend(struct device=
 *dev)
>>
>>  	mutex_lock(&data->lock);
>>  	ret =3D mma8452_standby(data);
>> +	WRITE_ONCE(data->suspended, true);
>>  	mutex_unlock(&data->lock);
>>  	if (ret < 0) {
>>  		dev_err(&data->client->dev, "powering off device failed\n");
>>  		return -EAGAIN;
>>  	}
>
> [Severity: High]
> If mma8452_standby() fails, should data->suspended be reverted to false?
>
> When returning -EAGAIN on failure in drivers/iio/accel/mma8452.c,
> leaving data->suspended set to true creates the inconsistent state that
> breaks mma8452_interrupt() as noted above.

I will move the WRITE_ONCE() to after checking the ret value, so we
don't leave suspended set to true in this case.

>> +	synchronize_irq(client->irq);
>> +
>
> [Severity: Low]
> Does this code compile?
>
> There is no local variable named client in mma8452_runtime_suspend() in
> drivers/iio/accel/mma8452.c. The I2C client is available via
> data->client or to_i2c_client(dev), so using client->irq directly
> appears to cause a compilation failure.
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential problem during
> device removal in mma8452_remove() in drivers/iio/accel/mma8452.c:
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
> If the device is already in the RPM_SUSPENDED state when mma8452_remove()=
 is
> called, its regulators have already been disabled by
> mma8452_runtime_suspend().
>
> Because pm_runtime_disable() does not resume the device, calling
> regulator_disable() again will underflow the regulator enable count. Could
> this forcefully disable shared regulators and cause system instability?
>
> Additionally, mma8452_standby() performs an I2C write. Is it safe to
> unconditionally access the hardware when it might be powered off?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mma8452-=
open-drain-v5-0-d8aa590d7c36@geanix.com?part=3D4
