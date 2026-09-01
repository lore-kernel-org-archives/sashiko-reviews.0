Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D44A2A44
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293997; cv=none; b=N9AqT6T+1ZKQFC8AxE3Lqm+4PSKzbC3cf822r1QlD+jnRHBzTD9zlPlgSp1gCYLtTpdyGdk5QBZu08Tl3cQG9Wf94x52Ctf8uO+ypsoADTCCojMkCtmIhKZEV+DLbyYdABmWCYBibSninoc9rmRKCuPQ63803N+MDeI5eL95p5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293997; c=relaxed/simple;
	bh=2vrFX13Q2xq55tR6vY0ajYJCi8sf6gwHFJWZQ6UfzJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ac7c+j8+RUbqhJT5QApdLto9JRaA6CbQ3oFtqK8p8xMJxH8hRCXQityyTdlfa0CN38oeM7OnOaDc15FMOqyKMmg/SYovLHUhvCIvxH4UWo8gNy9hFihkVbn46YPhphPIrJ2McgR/eZ1IlsegtyglRb/5Be824vdIAvsRqUBW0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9oX77Oz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9oX77Oz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba14so295396f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 13:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788293994; x=1788898794; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8CVgkVR/XaIisVA7GQ1DF+bXEJ2xiWA/zkss4Eq01g=;
        b=r9oX77OzQYGAZxMYwbQlFd22JNIdtHpzE0vqz3LZVeJhT1y6yGFFu7LsgA7RQIL//i
         lHDmCKU31aBHTTvPOdv3gDtch1wJbBJuk3W6sPL2GMUHYHtgUC4QlXSewxGvAp9T1iES
         CU38Io26th9foOg+xI+pdEwu2wEmdoLNNQB31jdOkISQ9V0Z9J7KHcxmawIXRKyd+eIa
         4az4dECSxx+9yD3Nkg2oNjlE7whp/dN4rBX1NfmnlKOUJ543pcIkyGX0z//3F3s9LNF8
         2S3tRrIYPQVAPl5C8UnAKSxEVrwzjtfLMRyZxyurMcAlJB5cpgZvTeo6zKkMsbLPYEWf
         zOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788293994; x=1788898794;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8CVgkVR/XaIisVA7GQ1DF+bXEJ2xiWA/zkss4Eq01g=;
        b=oj5RZZZU+fHiAIED2vyJFFhRIys+gdB9aiFvIZbZWnDW3sxEtu7RZTMnIOO7aCa5/T
         VGe48OJFY4HavYZVyWzgTiNR/B4MOPhNU80tm8NcPWQSR71I983CHRlX0g0O5lP9RC5K
         /EefSfTpWdimX5NQvYFIZz4FMxKdsdu8Ihibb85V+VZwyfM2P0PTY999w/XPqkGdcL3p
         qlPfrhiIprCCa9JUJ/wdsAMHyP53gRviRDOcL3dPAS0GsorEI7TEi8xQWAtwxH05iQRT
         u/uTK2GQ0eht8bC/ccwwNqV+1kSMu+0Qncan00GDxsaL1k/G7fDJU8spwjNdn447dOgO
         Zejg==
X-Gm-Message-State: AFuF++m4gZaT1RL1nKRrDN3Ubu6sWDKK9unH1JOS8YihyR+hhRHe9qoB
	6GB9VcnIjqDIlkvJlXZ5RviCLB/+GFRpip2PZKmeuODZKBWywk8O3PYVKokOtQ==
X-Gm-Gg: AR+sD12Ehj91e8jxcQDKWyW5LAwexf38bnG2lHm2HDY+hQOtuxqeJ4b0fzREBrlJFjs
	SxLmnYXzqZKvyb/6zyDe2iBMrQn/HF3PXVk5JTVhhR2UHf9yvbmr5B6uew3MMAqxTBlLm8UFTxh
	BfuLd2PbP5Q7LE2ieYUDlPBD41qMe+1ZKajJIn63ndaJy3VXh8gE++rqNOuufEXy1+LBMOVx9N6
	yXWFwtWTVcrMCzDpyk0OuB+3Pm34WIHB4320LqicMjRKK4ftDqVkHuPXO9xWaNf3Fc8odoHhYLM
	6D/WGnJaMMvYnOUn0hyVjMVpZkD35KNdzJwDEZJKr5OfaCvbYqpRjPA2DgdSKwPY+pKOrISjFTE
	jXTU/XDXzd9RJxwSs53sl4y+GFOuG9M+edfp5I3y9waQcMezG0ACY6agz3wdwgCUAaIhGasHI95
	webQG3GmpeJeyH8lw76bQNkqqKjbIUFLieLVipnth9vQYzlDGg3EYOePVGyAeF+wWGSqKX38hf
X-Received: by 2002:a05:600c:3113:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49ce58163aemr2032655e9.1.1788293993799;
        Tue, 01 Sep 2026 13:19:53 -0700 (PDT)
Received: from localhost ([2001:4bb8:16d:f647:967c:bbf0:49e2:fbf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm89545935e9.5.2026.09.01.13.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 13:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 22:19:51 +0200
Message-Id: <DL49BADYC1U8.2N2F6YW5ZR5S2@gmail.com>
Subject: Re: [PATCH v8 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <linux-iio@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260901-veml6031x00-v8-0-532cb4f2168a@gmail.com>
 <20260901-veml6031x00-v8-4-532cb4f2168a@gmail.com>
 <20260901132208.EE64C1F000E9@smtp.kernel.org>
In-Reply-To: <20260901132208.EE64C1F000E9@smtp.kernel.org>

On Tue Sep 1, 2026 at 3:22 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Use-After-Free of iio->pollfunc in IRQ handler during device unb=
ind or probe failure.
> - [Medium] Unintended I2C read of configuration register when pushing tim=
estamp to buffer
> - [Medium] The interrupt_users counter can permanently underflow during e=
rror recovery, breaking hardware interrupt control.
> --
>
> commit c87f3d48e1ee614fc184995b816c8f8679a6b774
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: veml6031x00: add support for events and trigger
>
> The device provides a shared interrupt line to notify events and data rea=
dy.
> Add support for configurations with and without an interrupt line, provid=
ing
> events and trigger support when an interrupt line is available.
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> index 3d5a27a0baaed..7bd7975eb1a76 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
> [ ... ]
>> +static irqreturn_t veml6031x00_irq(int irq, void *private)
>> +{
> [ ... ]
>> +	if (trigger_poll) {
>> +		iio->pollfunc->timestamp =3D timestamp;
>> +		iio_trigger_poll_nested(data->trig);
>> +	}
>> +
>> +	pm_runtime_put(dev);
>> +
>> +	return IRQ_HANDLED;
>> +}
>
> [Severity: High]
> Could this lead to a use-after-free of the pollfunc during device unbind =
or
> if probe fails?
>
> Because the IRQ is requested via devres inside veml6031x00_init_iiodev()
> before the triggered buffer is set up in veml6031x00_probe(), devres will
> tear down the buffer (and free iio->pollfunc) before freeing the IRQ. If =
an
> interrupt fires during this teardown window, the IRQ thread could be
> preempted and then dereference the freed iio->pollfunc here.
>
> Would it be safer to ensure devm_iio_triggered_buffer_setup() is called
> before the IRQ is requested?
>

I will register the IRQ right after calling
devm_iio_triggered_buffer_setup(), removing it from
veml6031x00_init_iiodev(). It was there not to check i2c->irq twice,
because that is also necessary to properly initialize the IIO device
with the right data, but it is true that the tear down is not clean at
the moment.

> [ ... ]
>> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data *dat=
a, bool state)
>> +	__must_hold(&data->irq_lock)
>> +{
> [ ... ]
>> +	data->trig_en =3D state;
>> +
>> +	return 0;
>> +
>> +clear_interrupt:
>> +	veml6031x00_set_interrupt(data, !state);
>> +
>> +	return ret;
>> +}
>
> [Severity: Medium]
> Can data->interrupt_users permanently underflow here during error recover=
y?
>
> If an I2C error occurs in __veml6031x00_set_trigger_state() while disabli=
ng
> the trigger, this error recovery path calls veml6031x00_set_interrupt() t=
o
> revert the counter, but fails to update the software state (data->trig_en=
).
>
> If a subsequent successful disable happens later, the counter will be
> decremented again, potentially underflowing to UINT_MAX and silently skip=
ping
> all future hardware writes.
>
> [ ... ]

That is not true because the error path will *increment* the counter to
re-enable the IRQ and keept it consistent with data->trig_en. If an I2C
operation fails, the trigger will stay enabled in the device registers,
and therefore data-trig_en should stay enabled.

I tested it by adding some hacks to force that situation, and what may
actually happen is that if *on top* of that failure, the I2C operation
in veml6031x00_set_interrupt() also fails, interrupt_users will be
decremented (as it should, because the interrupt could not be
re-enabled), and *then* a second call to disable the trigger will set
interrupt_users to UINT_MAX.

Although this is very unlikely, the fix seems to be trivial:

 if (state) {
 	data->interrupt_users++;
 	if (data->interrupt_users > 1)
 		return 0;
 } else {
 	+	if (!data->interrupt_users)
 	+		return 0;

 	data->interrupt_users--;
 	if (data->interrupt_users > 0)
 		return 0;
 }

Note that this fix is not a hack to just get rid of reaching UINT_MAX, it
reflects the fact that the previous failed operations lead to a disabled
interrupt and an enabled trigger in the hardware, and there is no need
to act on the interrupt again when trying to disable the trigger a
second time.

I will add it for V9 after testing it with some hacks to force that
scenario.

Best regards,
Javier
