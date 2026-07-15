Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8A844C65F
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116398; cv=none; b=qA+UsAvl9xJ5jckO0Esj19oxLKV/INezsMpXBYw2a/82yqtW9XZqYMXbACg+Ny1Dflqstlj4P/5Fjqp8e30ICQF9pSsYXwhtwA5eh0EU8K0wjHIcZJQB/DiffhShS5qQZWN/YJvB9BQPP2pgtm0IpWVCKWEPygSSy/KfttUyYac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116398; c=relaxed/simple;
	bh=yD9P3Kwmn70r8BWUec1eKMUuFutUvxRbSCKthV2WBWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p1r54wI5AtY/yUfroIb9oNvk0Pd1o/vakdHCfEdOj7mf5/gCSzI3dfkp9M6wYgLY7UkFWG6cnPpK/j9cXPb+bOWUNPDYAYkpFTN/TSC3TyOx2U6g67NepVw2l1Lz7waNWGgf4NGRUhnkU20tq3g4ew192Tf+8lp07yiW9VoPjzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=EE0gs6DZ; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="EE0gs6DZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1784116387; x=1784375587;
	bh=bgZaypZ7nYl/aFWuSHD0NZkdmRefMsYIAWDGgIuflOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EE0gs6DZEkQfforFZ84PzAt/MRK/zRMtB01g8JglasGg4m1PZwfzyQ/HaDYw35qoS
	 /onqibG5DSgQqPwoHIGGpe7M6j5FbaAqtEZfTyTZqdsOm0IK+FzJwV3CcJ9gZ2wsc5
	 9WFS+nirIu75uNUDaQLMqORyJhJjOyCfrYSuFeGHhaQ+N/zh/junS4dyvWhn0tGeOx
	 onLAb5Y4Ie1S3ldXIAgi9dMo0AAoJudfpFRc3qZxqH5AYoqytWdq568JtAiJsFPueu
	 sXNKvKQ6Xjt6HU9q9mIjAjfM2XM/jn0OTo8KxI1O165kLUSg1ASLMlgaSdjH2Rmjz5
	 yeUmtX8a0qBpw==
X-Pm-Submission-Id: 4h0ZLT6Pysz2ScPw
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <robh@kernel.org>,
  <devicetree@vger.kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH 3/3] iio: light: ltr501: Add ltr329 driver support
In-Reply-To: <20260715083837.9F7F91F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 15 Jul 2026 08:38:37
	+0000")
References: <20260715-liteon-ltr329-v1-0-31f027051594@geanix.com>
	<20260715-liteon-ltr329-v1-3-31f027051594@geanix.com>
	<oeNhZJuStBFVqtDDgXFydTr01V2RtgHLgAov5Z5ASVZXg1DJ941mRCvvh5flaxGqIvJp5p50ZbApPh_Kj1Le6g==@protonmail.internalid>
	<20260715083837.9F7F91F000E9@smtp.kernel.org>
Date: Wed, 15 Jul 2026 13:53:05 +0200
Message-ID: <87fr1ko4f2.fsf@geanix.com>
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
> - [Medium] Probe error paths skip device power-down, leaving the sensor a=
ctive and leaking power.
>
> Pre-existing issues:
> - [High] Asymmetric teardown of the devm-managed IRQ and manual IIO devic=
e unregistration leads to a Use-After-Free on the IIO event interface.
> - [High] Enabling the software timestamp channel on sensors without proxi=
mity support causes the trigger handler to hang and drop all captured data.
> --
>
> --- Patch [3]: [PATCH 3/3] iio: light: ltr501: Add ltr329 driver support =
---
> commit 6c505591ba68d4c8fcdd0eb98eb4532e6610696f
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: light: ltr501: Add ltr329 driver support
>
> This adds support for the LTR-329ALS-01 chip, which is similar to
> LTR-303ALS-01, except for interrupt, which LTR-329ALS-01 chip does not
> have.
>
>> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
>> index 7d045be78c6df..815b67a10837d 100644
>> --- a/drivers/iio/light/ltr501.c
>> +++ b/drivers/iio/light/ltr501.c
>
> [ ... ]
>
>> @@ -1257,6 +1269,18 @@ static const struct ltr501_chip_info ltr501_chip_=
info_tbl[] =3D {
>>  		.channels =3D ltr301_channels,
>>  		.no_channels =3D ARRAY_SIZE(ltr301_channels),
>>  	},
>> +	[ltr329] =3D {
>> +		.partid =3D 0x0A,
>> +		.als_gain =3D ltr559_als_gain_tbl,
>> +		.als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
>> +		.als_mode_active =3D BIT(0),
>> +		.als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
>> +		.als_gain_shift =3D 2,
>> +		.info =3D &ltr301_info_no_irq,
>> +		.info_no_irq =3D &ltr301_info_no_irq,
>> +		.channels =3D ltr301_channels,
>
> [Severity: High]
> This is a pre-existing issue, but does using ltr301_channels cause the
> trigger handler to hang if the timestamp channel is enabled?
>
> Looking at ltr301_channels, the timestamp channel occupies scan_index 2. =
If a
> user enables the timestamp channel, bit 2 is set in active_scan_mask.
>
> However, ltr501_trigger_handler() assumes bit 2 is always the proximity
> sensor:
>
> ltr501_trigger_handler() {
>         ...
>         if (test_bit(2, indio_dev->active_scan_mask))
>                 mask |=3D LTR501_STATUS_PS_RDY;
>
>         ret =3D ltr501_drdy(data, mask);
>         ...
> }
>
> Since sensors using ltr301_channels lack a proximity sensor, the hardware
> ready bit is never set. Could this cause ltr501_drdy() to loop and drop
> data?
>
>> +		.no_channels =3D ARRAY_SIZE(ltr301_channels),
>> +	},
>>  };
>
> [ ... ]
>
>> @@ -1531,6 +1555,11 @@ static int ltr501_probe(struct i2c_client *client)
>>  		return ret;
>>
>>  	if (client->irq > 0) {
>> +		if (!ltr501_has_irq_support(data->chip_info)) {
>> +			dev_err(&client->dev, "chip does not support irq\n");
>> +			return -EINVAL;
>> +		}
>
> [Severity: Medium]
> Does this early return bypass device power-down on probe failure?
>
> If the device tree specifies an IRQ for a chip that does not support it,
> this will return -EINVAL directly instead of jumping to the
> powerdown_on_error label, which could leave the device powered on.

Ok. I guess I should fix the same issue for error handling of the
devm_request_threaded_irq() call.

> [Severity: High]
> This isn't a bug introduced by this patch, but is there a use-after-free
> risk when the threaded IRQ is requested here?
>
> The driver uses devm_request_threaded_irq() during probe but manually cal=
ls
> iio_device_unregister() in ltr501_remove().
>
> Because devm-managed resources are freed after ltr501_remove() completes,
> the interrupt remains active while iio_device_unregister() destroys the
> event interface.
>
> If an interrupt fires during this window, ltr501_interrupt_handler() calls
> iio_push_event(), which accesses the freed event interface structure.
>
>> +
>>  		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
>>  						NULL, ltr501_interrupt_handler,
>>  						IRQF_TRIGGER_FALLING |
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-liteon-l=
tr329-v1-0-31f027051594@geanix.com?part=3D3
