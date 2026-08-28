Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A6369219
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910544; cv=none; b=QKX+sepUiQT7sS7aBTeAarkC//Kmmx18dsdaBlXlFBw49W/GzgGHUxSCiICEurakUEiA7BxAeabp6zvyR0zFiPsCeaNeaIZjj4JDBynBiOkKVRSwZdDcZWkneF62ZeodUJaXaIcusOR+WOqOZHcMGWAunI4a2CUkhMIC5NJzyrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910544; c=relaxed/simple;
	bh=gyEwjDQX5VV+UdPvflvnW1P3eKMDH9aIV3pqtqu1sVY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BxAj35OHKsT5sIHfo86XAlJM1fdhCM+HU5F9E/V2Y7ZkWJgNsFQJOljBB9QXOhJso3R6i+JVYy9RNRoErxuoZstUd15RH1U1kbdHKorGyX9MzT1YTzqMPbFH4GsNf3j+vX/u7czg28knNtzOxhrEs8+XPn4SRrNdM/URPrhJPHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=jczetslD; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="jczetslD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787910537; x=1788169737;
	bh=rW15CYA/EMGbIe1SxeRDk5T+UlCxQGsFm4K0icrLJ/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jczetslDpvlOuEpk/QfP01aNtZlK0/gy/WLVRlPmOX9m5LAFRHitay/tMoxobS0Sx
	 Dv06C7SrBPGrNJrvfpBy7yNKcqmaayWl1bOV75JoBtBh9Xq0J6cghN1559EdlJQglX
	 2C1X/R8+tzX6WAOInPVIyLqEnpSqFrq2cF0AhbEiKZnAednWXq8ABoBCmKkeZqojun
	 8hKnArddRuGcVNKTtJP55Qyd3XwPCY7PoFwczBnr3q6eaGKCYTJd0kwECNmHEVEy87
	 i1DgV7+LwE4st8ilB+l0b3Hu4vvUsJyP2DBsTJNS/C9nZE2BNXdn1myTNWgLboCj5y
	 cDohV2PC1BdUA==
X-Pm-Submission-Id: 4hWYVv6J6hz2ScqT
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <devicetree@vger.kernel.org>,
  <conor+dt@kernel.org>,  <robh@kernel.org>
Subject: Re: [PATCH v6 3/9] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
In-Reply-To: <20260825084323.958231F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:43:23
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-3-9b252804ee80@geanix.com>
	<BaLTqEBVCiV-7hbOg20nTT4QDrR0LaQRblwUv33XNEQoyujWN2CUBawLF2kbNChLMGNZ5rJ1Jnx5GfUvBJNSOA==@protonmail.internalid>
	<20260825084323.958231F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 11:48:55 +0200
Message-ID: <87ld9qy3qw.fsf@geanix.com>
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
> - [Medium] Hardware-Software Polarity Mismatch
>
> Pre-existing issues:
> - [High] PM runtime usage counter leaks permanently on I2C read/write err=
ors.
> - [High] Hardware state is accessed over I2C before acquiring runtime PM =
references, failing if the device is suspended.
> --
>
> --- Patch [3]: [PATCH v6 3/9] iio: accel: mma8452: Only apply trigger typ=
e when not set by firmware ---
> commit b862ff26c69f226387993dc22a2537b8dc72d9fd
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Only apply trigger type when not set by firmware
>
> This patch modifies the mma8452 driver to only apply a default active-low
> trigger type if the firmware does not specify one. This aims to improve
> backward compatibility while respecting firmware configuration.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index f645a5c6fd1c2..1fb43c5b0b72f 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>
> [ ... ]
>
>> @@ -1683,9 +1683,16 @@ static int mma8452_probe(struct i2c_client *clien=
t)
>>  		goto trigger_cleanup;
>>
>>  	if (client->irq) {
>> +		unsigned long irq_flags;
>> +
>> +		irq_flags =3D irq_get_trigger_type(client->irq);
>> +		if (irq_flags =3D=3D IRQ_TYPE_NONE) {
>> +			dev_info(dev, "invalid irq type, setting default active low\n");
>> +			irq_flags =3D IRQF_TRIGGER_LOW;
>> +		}
>> +		irq_flags |=3D IRQF_ONESHOT;
>>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
>> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
>> -					   client->name, indio_dev);
>> +					   irq_flags, client->name, indio_dev);
>
> [Severity: Medium]
> Does this configuration leave the hardware and software out of sync?
>
> The code reads the firmware's IRQ trigger type and requests the IRQ with
> it, but the actual MMA8452 sensor hardware polarity doesn't appear to be
> updated. If the firmware requests an active-high or rising-edge trigger,
> the host interrupt controller is configured for active-high, but the sens=
or
> would continue to drive its default active-low signal.
>
> Unless there is an external hardware inverter on the board, could this
> mismatch break interrupts? Should the driver read the requested trigger t=
ype
> and configure the IPOL bit in CTRL_REG3 to match?

This has been discussed during this series.

We don't want to modify MMA8452 irq polarity based on firmware IRQ
trigger type. If IRQ polarity should be modified, we should add a
separate device-tree property for that.

This way we can support designs that inverts polarity in hardware.

>
>>  		if (ret)
>>  			goto buffer_cleanup;
>>  	}
>
>
> While reviewing the I2C handling in this driver, I also noticed a couple =
of
> other issues.
>
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential leak of the runti=
me
> PM usage counter when handling I2C errors.
>
> In mma8452_read(), the device is woken up, incrementing the PM counter:
>
> mma8452_read() {
>     ...
>     ret =3D mma8452_set_runtime_pm_state(data->client, true);
>     ...
>     ret =3D i2c_smbus_read_i2c_block_data(data->client, ...);
>     if (ret < 0)
>         return ret;
> }
>
> If the I2C read fails, the function returns immediately and bypasses the
> matching mma8452_set_runtime_pm_state() false call. Could this permanently
> prevent the device from re-entering autosuspend?
>
> A similar pattern appears to exist in mma8452_write_event_config() where
> an early return on a failed I2C read skips restoring the PM state.

I will address this in a follow-up patch series.

> [Severity: High]
> This is a pre-existing issue, but could some I2C accesses fail if the
> device is currently suspended?
>
> In mma8452_read(), the code checks for data readiness before waking up the
> device:
>
> mma8452_read() {
>     ...
>     ret =3D mma8452_drdy(data);
>     if (ret < 0)
>         return ret;
>
>     ret =3D mma8452_set_runtime_pm_state(data->client, true);
> }
>
> Because mma8452_drdy() executes an I2C read against the MMA8452_STATUS
> register, it happens before the power regulators are enabled. If the devi=
ce
> has already autosuspended (after 2 seconds of inactivity), will this I2C
> read hit powered-off silicon and fail?
>
> A similar direct I2C read without a runtime PM reference seems to happen
> in mma8452_read_raw() for IIO_CHAN_INFO_CALIBBIAS.

I will address this in a follow-up patch series.

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-=
open-drain-v6-0-9b252804ee80@geanix.com?part=3D3

/Esben
