Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16E401A00
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911222; cv=none; b=oAMT1e2MxCgRUcgxhaw4q9bGbluGZGsANn6MnQ9lILGlv5oIEzUvn5ga26Ay8MylOPMPZQS5Lsb0ZVbj49Nttvdl+7m59UBU17Lx88d6SJ8wMZIGtRfAqbmYz9Y09FIKRSOixfGmyihQEuebGec2ZrWtc2/yzTQHpXL5wHghknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911222; c=relaxed/simple;
	bh=iBOyV8R0sA6BILHO3RmTUOYCnic4haZ9Opz5CAaQiaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bq/mBmDF81vFuKZCfhroJEQqCck30iQ6AGqNLY72kqWnsZCHE3HBc/phxjIwkg5rEp+hvGMWH6tf70iS90tmFrI4J8DhfPpZFhx/izLlO/evU21NXcFP5RUeWQ9J4tOLiGq7g0pDSqxnxXUhSHu+pSt7WUgE5l8p9m8YDKs/GIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=TpGeLH8r; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="TpGeLH8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787911215; x=1788170415;
	bh=aL8dOK0Z12/AeZreZ5ToySnMoJipK21wXJHe9zbA5LY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TpGeLH8r4im+hfNOVZVFoidShe/vutPhm8zzwZnlp2xIKy7TefvY602tO1dix+X5+
	 qLXRhqLQJApFX/36WtNoCtPOI0Z8Tfh+jC0mMdjy16DG8EYT2nXIir4/T9iVurlZ/P
	 NDJfZMtogZWmpeHLzKVhEPt/8IX9QVjYOqygktzZwBUzMSa6HBuCVce/y0PD/PujW/
	 ZlS8AFgSjnxKqZ939O5oA4CKSi3Bj/okyNNThcsKGnr8qxBo8mt3tmBwsSFBiqb+c7
	 gVQTxqi+httzAmMTFcBJ6qY6LqUitcLgFBJMbmgKsjdE2bQiFj9wAKGeVzfK9IveZi
	 GntvPWlRfdt+w==
X-Pm-Submission-Id: 4hWYlx61YGz1DDXH
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <conor+dt@kernel.org>,
  <devicetree@vger.kernel.org>,  <robh@kernel.org>
Subject: Re: [PATCH v6 2/9] iio: accel: mma8452: Optimize struct
 mma8452_data member orders
In-Reply-To: <20260825083858.A5F391F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:38:58
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-2-9b252804ee80@geanix.com>
	<52mazOc3yYsstoPliCVc4oyvGKzUi8nU5NIjPfVBcXZ7qAvSjQtfOaXWc0_nQJgs0iCKMoowMZjilbzv5JbIVw==@protonmail.internalid>
	<20260825083858.A5F391F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 12:00:12 +0200
Message-ID: <87h5key383.fsf@geanix.com>
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

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Short I2C reads lead to an uninitialized kernel stack memory lea=
k to userspace.
> - [Medium] Runtime PM reference leak on I2C communication failure.
> - [Medium] Unbalanced regulator disable and unpowered I2C access during m=
odule removal.
> - [Medium] Data race during read-modify-write of event configuration regi=
sters.
> --
>
> --- Patch [2]: [PATCH v6 2/9] iio: accel: mma8452: Optimize struct mma845=
2_data member orders ---
> commit 26f60bee6a5ce9626d25a99fe80c0216eb010682
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Optimize struct mma8452_data member orders
>
> Reorder struct mma8452_data members to avoid holes.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 7d683686dd9d6..f645a5c6fd1c2 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>> @@ -106,10 +106,7 @@ struct mma8452_data {
>>  	struct i2c_client *client;
>>  	struct mutex lock;
>>  	struct iio_mount_matrix orientation;
>> -	u8 ctrl_reg1;
>> -	u8 data_cfg;
>>  	const struct mma_chip_info *chip_info;
>> -	int sleep_val;
>>  	struct regulator *vdd_reg;
>>  	struct regulator *vddio_reg;
>>
>> @@ -118,6 +115,10 @@ struct mma8452_data {
>>  		__be16 channels[3];
>>  		aligned_s64 ts;
>>  	} buffer;
>> +
>> +	int sleep_val;
>> +	u8 ctrl_reg1;
>> +	u8 data_cfg;
>>  };
>
> [Severity: Medium]
> This is a pre-existing issue, but does this early return leak the runtime=
 PM
> reference count?
>
> drivers/iio/accel/mma8452.c:mma8452_read() {
> ...
> 	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
> 					    3 * sizeof(__be16), (u8 *)buf);
> 	if (ret < 0)
> 		return ret;
> ...
> }
>
> If i2c_smbus_read_i2c_block_data() fails, the function returns directly,
> skipping the mma8452_set_runtime_pm_state() call.
>
> A similar issue appears in mma8452_data_rdy_trigger_set_state() where a
> failure during i2c_smbus_read_byte_data() skips dropping the autosuspend
> reference if state was true.

Adressed in follow-up patch series.

> [Severity: Medium]
> This isn't a bug introduced by this patch, but during module removal, does
> mma8452_remove() execute operations on an already suspended device?
>
> drivers/iio/accel/mma8452.c:mma8452_remove() {
> ...
> 	pm_runtime_disable(&client->dev);
> 	pm_runtime_set_suspended(&client->dev);
>
> 	if (client->irq)
> 		free_irq(client->irq, indio_dev);
>
> 	iio_triggered_buffer_cleanup(indio_dev);
> 	mma8452_trigger_cleanup(indio_dev);
> 	mma8452_standby(iio_priv(indio_dev));
>
> 	regulator_disable(data->vddio_reg);
> 	regulator_disable(data->vdd_reg);
> ...
> }
>
> If the module is removed while the device is in a runtime-suspended state,
> pm_runtime_disable() does not wake up the device. Subsequent calls to
> mma8452_standby() and regulator_disable() are then executed on an unpower=
ed
> device.

> [Severity: Medium]
> This is a pre-existing issue, but can concurrent sysfs writes cause a data
> race when updating event configuration registers?
>
> drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
> ...
> 	case IIO_EV_DIR_RISING:
> 		val =3D i2c_smbus_read_byte_data(data->client, ev_regs->ev_cfg);
> 		if (val < 0)
> 			return val;
> ...
> 		return mma8452_change_config(data, ev_regs->ev_cfg, val);
> ...
> }
>
> The read-modify-write sequence is performed without acquiring the internal
> driver lock.
>
> If two threads concurrently write to different event attributes in sysfs,
> could the initial read and bitwise modifications race, overwriting each
> other's configuration bits?

Adressed in follow-up patch series.

> [Severity: High]
> This isn't a bug introduced by this patch, but can a short I2C read result
> in uninitialized stack memory being leaked to userspace?
>
> drivers/iio/accel/mma8452.c:mma8452_read() {
> ...
> 	ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_X,
> 					    3 * sizeof(__be16), (u8 *)buf);
> 	if (ret < 0)
> 		return ret;
>
> 	ret =3D mma8452_set_runtime_pm_state(data->client, false);
>
> 	return ret;
> }
>
> If i2c_smbus_read_i2c_block_data() encounters a short read, it returns a
> positive number less than the requested size. The condition ret < 0 is fa=
lse,
> so the code proceeds and overwrites ret with the return value of
> mma8452_set_runtime_pm_state(), which is 0.
>
> When mma8452_read() returns 0 instead of propagating the short read:
>
> drivers/iio/accel/mma8452.c:mma8452_read_raw() {
> ...
> 		ret =3D mma8452_read(data, buffer);
> ...
> 		*val =3D sign_extend32(be16_to_cpu(
> 			buffer[chan->scan_index]) >> chan->scan_type.shift,
> 			chan->scan_type.realbits - 1);
> ...
> }
>
> Does the caller process and return the uninitialized stack memory from bu=
ffer
> via *val?

I will be converting the i2c register access to regmap in the follow-up
patch series I am working on, and the regmap API does not have this
issue, so should resolve this issue also.

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-=
open-drain-v6-0-9b252804ee80@geanix.com?part=3D2

/Esben
