Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D73FDBEA
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656515; cv=none; b=TXMREqAFishrG+Xu45nIXfqR/tJ7IuvURPpEeZtVD7ECLAPApFqYbMsT4AdwBkYPY9MRCig0/JTutQJFxDg6bSGDxQ4OJ791MQNeAhOi/aUDKOHwUXBOHNXfPph45UlVAOcScDEOnN8lzrFLCVMo+cKJc6Mr/+SnWvO+vlXujIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656515; c=relaxed/simple;
	bh=rgO8WxAzGYA1IAaWkCLnezd4kffh98VeD+zgztdDmBc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I28uum/ejYJpHXZdCKPxKkiICycqePX84ThKF1saHjaLeL7XlKytRCIKHPFRVU5yw16N7cCOnrBkoUyN4qNIxme80THowGiwppSPfjgBqCorCBNYrAyhqI3F3Vee6M8ArWCflsxiBvynTvPvzHspFJNzcijTWFvHlpcEwyXINj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=bVEHik/M; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="bVEHik/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787656508; x=1787915708;
	bh=jt6JmGogQkBpzPG4dOzOQgmcS6RIhCTyLzPIOBRmgfY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bVEHik/McdKFjKE88dEnE3GiZM2xhUIxaO+ql4DhYrEPsjNOlpxmjJa20kdxn4jzh
	 Mwo5hLubgmTgXOIApkiGA39Tdzjn+AuFHwT/j9d2mSl1L97+Lkuk/GmfVC2fAnMy7/
	 fDS0sAPzV5FpqRTE3VlaLf3E1JXInLGNMt14BYkzqTfTrZbacZl3VtlWKQw1iza/uj
	 VBz2vq0YWhMUQrRtQDTw/0SeVnJaA+RNQkHPqDzAw1F/W2AmoZ0GhnlioMKd9vBNGF
	 VWJ3Ak1W29HNrayXDvslaTOJlIj27XBR/o57wVsGUSTQiGJbUxLX50kvfA04h+pWM8
	 kwEJA6I/M5blg==
X-Pm-Submission-Id: 4hTlYl0b0Dz1DF7G
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <devicetree@vger.kernel.org>,
  <robh@kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH v6 6/9] iio: accel: mma8452: Reuse existing dev pointer
 in mma8452_probe()
In-Reply-To: <20260825083802.C3D821F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:38:02
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-6-9b252804ee80@geanix.com>
	<L6z2_8mrgRvVwG5aZBq5LTTYkeXmAEBX8ycp5-n_HC7aAydrlcmzV-c9zRFNEULDUJ9zsbkbReCbJJdj4F1eFw==@protonmail.internalid>
	<20260825083802.C3D821F000E9@smtp.kernel.org>
Date: Tue, 25 Aug 2026 13:15:06 +0200
Message-ID: <87bjaqo3id.fsf@geanix.com>
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
> - [Low] Undocumented scope modification and suboptimal pointer dereferenc=
ing.
>
> Pre-existing issues:
> - [High] Device teardown accesses powered-off hardware and causes unbalan=
ced regulator disables.
> - [Low] Unconditional assignment of PM callbacks causes dead code when PM=
 is disabled.
> --
>
> --- Patch [6]: [PATCH v6 6/9] iio: accel: mma8452: Reuse existing dev poi=
nter in mma8452_probe() ---
> commit 04da87f5e80c506bb658d3dd5161087ce55fa6b0
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Reuse existing dev pointer in mma8452_probe()
>
> This commit refactors mma8452_probe() to use a local 'dev' variable inste=
ad
> of repeatedly referencing &client->dev. It aims to improve code readabili=
ty.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index d1e8eb2a4ad3a..7ef1a9a91c31f 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>
> [ ... ]
>
>> @@ -1801,7 +1799,8 @@ static void mma8452_remove(struct i2c_client *clie=
nt)
>>  #ifdef CONFIG_PM
>>  static int mma8452_runtime_suspend(struct device *dev)
>>  {
>> -	struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(dev));
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>>  	struct mma8452_data *data =3D iio_priv(indio_dev);
>>  	int ret;
>>
>> @@ -1809,7 +1808,7 @@ static int mma8452_runtime_suspend(struct device *=
dev)
>>  	ret =3D mma8452_standby(data);
>>  	mutex_unlock(&data->lock);
>>  	if (ret < 0) {
>> -		dev_err(&data->client->dev, "powering off device failed\n");
>> +		dev_err(&client->dev, "powering off device failed\n");
>
> [Severity: Low]
> The commit message states the changes are restricted to reusing the dev
> pointer in mma8452_probe(), but this modifies mma8452_runtime_suspend().
> Should the commit message be updated to reflect this scope change?
>
> Also, since the function already receives a struct device *dev parameter,
> and &client->dev evaluates to that exact same pointer, wouldn't it be
> simpler to use dev directly here rather than dereferencing client?

Yes. Using the dev pointer directly is the right thing to do.  Added for
next version.

And also, the change that adds the client pointer will be rebased into
patch 4, where the client pointer is used. Sorry about that.

>>  		return -EAGAIN;
>>  	}
>
>
> As a related note, looking at the device teardown path in mma8452_remove(=
):
>
> static void mma8452_remove(struct i2c_client *client)
> {
> [ ... ]
> 	pm_runtime_disable(&client->dev);
> 	pm_runtime_set_suspended(&client->dev);
> [ ... ]
> 	mma8452_standby(iio_priv(indio_dev));
>
> 	regulator_disable(data->vddio_reg);
> 	regulator_disable(data->vdd_reg);
> }
>
> [Severity: High]
> This is a pre-existing issue, but does this teardown sequence access
> potentially powered-off hardware?
>
> If the device is in the RPM_SUSPENDED state when remove() is called, its
> regulators have already been disabled by mma8452_runtime_suspend(). The
> call to mma8452_standby() attempts an I2C write to the powered-off device,
> which might hang the I2C bus or cause transaction timeouts.
>
> Furthermore, unconditionally calling regulator_disable() drops the usage
> counts below zero, triggering a kernel warning for unbalanced disables.
>
> Should pm_runtime_get_sync(&client->dev) be called at the beginning of
> mma8452_remove() to ensure the hardware is active before teardown?
>
>
> Finally, regarding the PM ops assignment in the driver struct:
>
> [Severity: Low]
> This isn't a bug introduced by this patch, but does the unconditional
> assignment of &mma8452_pm_ops to the .pm field in mma8452_driver produce
> dead code when CONFIG_PM is disabled?
>
> According to the power management subsystem guidelines, this pointer shou=
ld
> be wrapped in pm_ptr(&mma8452_pm_ops) to allow the compiler to eliminate
> the dead code.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-=
open-drain-v6-0-9b252804ee80@geanix.com?part=3D6
