Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7B45FFA8
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986792; cv=none; b=L+ANsC8kVMkIj64jjHWkgQq6TvjGwUjICioqJqX/8yZzcjvrQlkXA6lmHAH4OgwZxTNavSvBLijzn/C3UqO5TXku8EZaN6TVIn92pWKPWMlzy5DkAXICEvGs0rSo6cSbD/qVVqLEhOkiSAyLluzfakgffuxGp89DtrF0uiJ1b/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986792; c=relaxed/simple;
	bh=Funfs8E/yoZTFxmmlNQQwhqmgzGqK4SfdhjhJozakyQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iVszfUO4eqZrOkLUY7pdC6BHAaryS2qr6cdXhZRbtncFIwnSV84NuW2/O6T+Cs+9zXjcuS0bfdqq9ADs7JrGKjHXRh4SkSmhiFt7RhTiOy9sUTxuYpkgT5UgZElXwe62ZMQX99oefKpYewbeByxl1Ca5rXLU4azsNYT88/+pv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=hmjlyuff; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="hmjlyuff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1786986788; x=1787245988;
	bh=CoOz2+7M7ol56iy8nW7gPP2UQsL/lZIZ3nq8gac0nEY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hmjlyuffZXrHqFAkR2MhEB13MYfv+xnbCAM+CZswjFNHxVtXwmJKVGaagw+jcwe49
	 5czgZ1skBC24zFQ2JhRzq9z3dwHrNx/UDbifA+Noy4Yv+sDeCDSECQrLlvU3D1o1no
	 +kPMyn6ZqW0+TuaxbxB1PiGZoTrpaklNWFZ2wUhbqaJRAmhL+7IFdBaawVoe9DTFpm
	 EXfnkA2tprrkIlknGPJGhWp3MeIHJQptS+YGd0AfQfRYuBKthww+YmZHDIhNfaGeYl
	 N0Pkmyyn+fV7jEtrvtJ7M0FtgINvCAHKs0L+CLM47toLbgMcJGaztZvUJEeHjBlmns
	 9LV4ABTu8Cysg==
X-Pm-Submission-Id: 4hNztW4xxwz2Scd3
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <conor+dt@kernel.org>,
  <devicetree@vger.kernel.org>,  <robh@kernel.org>
Subject: Re: [PATCH v4 4/6] iio: accel: mma8452: Support interrupt sharing
In-Reply-To: <20260812153451.55DC91F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 12 Aug 2026 15:34:50
	+0000")
References: <20260812-mma8452-open-drain-v4-0-bfca15d02b59@geanix.com>
	<20260812-mma8452-open-drain-v4-4-bfca15d02b59@geanix.com>
	<gh3S_nDtj7vykftK5WE3fGr9bcSwlhkftzCYT-00fQBn-9KfXfanQLuXqMBu-v2cS1-3lvGUhx9aGiGlXPHeyw==@protonmail.internalid>
	<20260812153451.55DC91F00A3A@smtp.kernel.org>
Date: Mon, 17 Aug 2026 19:13:06 +0200
Message-ID: <87se4ck6vx.fsf@geanix.com>
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

> --- Patch [4]: [PATCH v4 4/6] iio: accel: mma8452: Support interrupt shar=
ing ---
> commit ae80b7f558736b5e80920be8e31037e5cc8645ba
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Support interrupt sharing
>
> This commit adds handling of runtime PM suspension in the interrupt handl=
er.
> It also adds the IRQF_SHARED flag to the interrupt request to allow shari=
ng
> the interrupt with other devices.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 1fb43c5b0b72f..106cdd904dbfd 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>> @@ -1056,14 +1056,19 @@ static irqreturn_t mma8452_interrupt(int irq, vo=
id *p)
>>  	struct iio_dev *indio_dev =3D p;
>>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>>  	irqreturn_t ret =3D IRQ_NONE;
>> +	int pm_status;
>>  	int src;
>>
>> +	pm_status =3D pm_runtime_get_if_active(&data->client->dev);
>> +	if (pm_status =3D=3D 0)
>> +		return IRQ_NONE; /* device is powered down */
>> +
>
> [Severity: High]
> Does this correctly handle the case where runtime PM is disabled?

If you mean when runtime PM is disabled (CONFIG_PM not set) or disabled
for the specific device, yes, I believe this is handled correctly. We
will correctly assume that the device is not powered down when
pm_runtime_get_if_active() returns an error (-EINVAL).

> When pm_runtime_disable() is called during device removal,
> pm_runtime_get_if_active() can return -EINVAL.
>
> If a shared interrupt fires from another device during this window, the
> handler will see a negative return value. Since the check is explicitly
> for =3D=3D 0, the handler will proceed and attempt to read from the I2C b=
us while
> the device regulators might be disabled.

Ah. That does sound like an issue.

> Should this check be <=3D 0 instead?

No. That would break usage with runtime PM disabled in the normal cases.

We could add a boolean to struct mma8452_data to mark the device as
being removed, and then check on that also.

Or probably better, we could call free_irq() before
pm_runtime_disable(), and cause a spurious irq if/when the race occurs,
but avoid additional code in the irq handler.

>>  	src =3D i2c_smbus_read_byte_data(data->client, MMA8452_INT_SRC);
>>  	if (src < 0)
>> -		return IRQ_NONE;
>> +		goto out;
>
> [ ... ]
>
>> @@ -1690,7 +1699,7 @@ static int mma8452_probe(struct i2c_client *client)
>>  			dev_info(dev, "invalid irq type, setting default active low\n");
>>  			irq_flags =3D IRQF_TRIGGER_LOW;
>>  		}
>> -		irq_flags |=3D IRQF_ONESHOT;
>> +		irq_flags |=3D IRQF_ONESHOT | IRQF_SHARED;
>
> [Severity: Medium]
> With the addition of IRQF_SHARED, is synchronize_irq() needed in the runt=
ime
> suspend path?
>
> The PM subsystem guidelines require that drivers using shared interrupts =
must
> call synchronize_irq() in their runtime suspend callback before powering =
down
> hardware. This guarantees no interrupt handler is executing mid-flight wh=
en
> the regulators are disabled.

I am not aware of this guideline, and haven't been able to locate it.
If someone could share a pointer to where I can read about this I would
be happy to be enlightened.

> Would it be safer to add this to mma8452_runtime_suspend() before the dev=
ice
> is placed in standby?

I am not a runtime PM expert, but that does sounds like a good solution.

I will try to update the patch with fixes for both this and the above
mentioned issue.

>>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
>>  					   irq_flags, client->name, indio_dev);
>>  		if (ret)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-mma8452-=
open-drain-v4-0-bfca15d02b59@geanix.com?part=3D4
