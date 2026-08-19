Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C1A3F8234
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787142255; cv=none; b=CmbooZYebhSavoQCqo9a0xOMiSRwdkXXaajwI58Nkal0RwYU4tkjgr/a5/678/W9ptXmPpa7qQ06OGOgB2b+1zsgLgaVgD/hlrKwYEyPsDiJfJINzpX5OljtXv2SdeV5P5FuZHUYn22qtM8XTWH6NLY36F+YzJfdGCN5n8eSx3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787142255; c=relaxed/simple;
	bh=TevgCJ0+q9/u48ARUsVECW/raE3K3oKcHCh7V++/eto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kJjPH78gixAmLy8Q2wi8jMRcXqQrezb1CTEgCT/GZ6Bq2pEp9hDObjViX8jmobelUeoAhbp/txDGWKKyurE/ZOproquO1HPx3dbt3EBLlbbqMgisMcXpjL9CDtcWMZTfwd9S76zcXLkBsCRGq2a4BFuPcsvvNtevVNBn+5Twqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=BDapDoD7; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="BDapDoD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787142248; x=1787401448;
	bh=oh7xmzGHCT9pD4fjI7sBkg3zSKm/Z5RduN9uygJjkEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BDapDoD7ELsbjkTRJnUR/jus1vB9k32Z9q0uJxHJPlafvDiWJq2DXhQGCRzx/RT9r
	 PblolhgtkQrj3skvBg2ym84sR29NJWSpaxRbW5tA19GhRJP57zzPQblrHM3h+ur+J5
	 tkBm0re3ai6EKceJig+Yc5JLwxvUvMBvbMVnu8ZWvSdMuJtpFcOeoiVWiz9IWcA3IY
	 9BDh54tnmPOL2I0xNtb9NqyDSQ2aXi6toLjQyw7SXvw/PdWqhx8es1R32Pq/oYzmUA
	 IjZbHWntlHW6rn2Yb7OdeEZsiZBWwDHFdtV2wrcc71GF8pPav8ByjRssWDKKt6bQ1J
	 r1utdtcqm63/A==
X-Pm-Submission-Id: 4hQ5N75vRWz2ScXR
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <conor+dt@kernel.org>,
  <devicetree@vger.kernel.org>,  <robh@kernel.org>
Subject: Re: [PATCH RESEND v5 6/6] iio: accel: mma8452: Reuse existing dev
 pointer in mma8452_probe()
In-Reply-To: <20260819082804.22A971F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 19 Aug 2026 08:28:03
	+0000")
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
	<20260819-mma8452-open-drain-v5-6-d8aa590d7c36@geanix.com>
	<5YnzZ2F7liEAUdz6RwOdpi-jhfHAJCZJoDrWJwwkukPUOqv3tNeUsmPiSJLj8s_5i-zHYUNI_Jnao6rwONB4cg==@protonmail.internalid>
	<20260819082804.22A971F000E9@smtp.kernel.org>
Date: Wed, 19 Aug 2026 14:24:05 +0200
Message-ID: <87zeyiz4be.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [Low] Compilation Error in mma8452_runtime_suspend() due to undeclared identifier 'client'.
>
> Pre-existing issues:
> - [High] Missing pm_runtime_disable() in mma8452_probe() error paths leads to a guaranteed NULL pointer dereference in the autosuspend callback.
> --
>
> --- Patch [6]: [PATCH RESEND v5 6/6] iio: accel: mma8452: Reuse existing dev pointer in mma8452_probe() ---
> commit 004c22b83c7e1b63662958bd7b1a838d3015cf83
> Author: Esben Haabendal <esben@geanix.com>
>
> iio: accel: mma8452: Reuse existing dev pointer in mma8452_probe()
>
> In commit 32a5c04d4575 ("iio: accel: mma8452: Use dev_err_probe()") the
> struct device * pointer was assigned to local variable dev, so we can just
> as well reuse that throughout the function for sligthly more readable code.
>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 060a6207e52d0..bf5cb1c4425a3 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>
> [ ... ]
>
>> @@ -1731,14 +1730,13 @@ static int mma8452_probe(struct i2c_client *client)
>>  			goto buffer_cleanup;
>>  	}
>>
>> -	ret = pm_runtime_set_active(&client->dev);
>> +	ret = pm_runtime_set_active(dev);
>>  	if (ret < 0)
>>  		goto free_irq;
>>
>> -	pm_runtime_enable(&client->dev);
>> -	pm_runtime_set_autosuspend_delay(&client->dev,
>> -					 MMA8452_AUTO_SUSPEND_DELAY_MS);
>> -	pm_runtime_use_autosuspend(&client->dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_set_autosuspend_delay(dev, MMA8452_AUTO_SUSPEND_DELAY_MS);
>> +	pm_runtime_use_autosuspend(dev);
>>
>>  	ret = iio_device_register(indio_dev);
>>  	if (ret < 0)
>
> [Severity: High]
> This is a pre-existing issue, but if mma8452_probe() fails here, is there a
> missing pm_runtime_disable() in the error paths?
>
> If mma8452_probe() fails after enabling PM runtime (for example, during
> iio_device_register()), it returns an error without disabling PM runtime or
> autosuspend. The driver core cleans up the device and clears its driver data
> via dev_set_drvdata(dev, NULL), and queues an idle notification.
>
> Because PM runtime is still active, this triggers the autosuspend timer.
> When the timer expires, the autosuspend callback executes:
>
> drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
>     struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
>     struct mma8452_data *data = iio_priv(indio_dev);
>     ...
> }
>
> Does this lead to a reliable NULL pointer dereference when iio_priv()
> dereferences the cleared driver data?

I would think so. I will add a fix to the series, calling both
pm_runtime_disable() and pm_runtime_set_suspended().

> [Severity: Low]
> Also, looking at mma8452_runtime_suspend(), does the module fail to compile
> when CONFIG_PM is enabled due to an undeclared identifier?
>
> The code attempts to call synchronize_irq():
>
> drivers/iio/accel/mma8452.c:mma8452_runtime_suspend() {
>     ...
>     synchronize_irq(client->irq);
>     ...
> }
>
> Since client is not declared in the scope of mma8452_runtime_suspend(),
> should this access data->client->irq instead?

Ok. That is strange. I was very sure I tested this exact patch version,
but I must have made a mistake. I will fix, and make sure I test it
properly (obviously with CONFIG_PM enabled to actually test it).

/Esben
