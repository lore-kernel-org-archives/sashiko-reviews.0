Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FF18BC3D
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779668965; cv=none; b=VZh1Yhibj4MCq66z6n9iWx80Q1CwBH6DFNcMEFdnmKADaiiR2vXrNN6oxtVUq6YeVna9O7Eh4NxXWpD/yUJaoyOPTWgnPxWfD9dbl+hletx05dX54RUKwQFj+95W9SEb9BA+hAOk9+2kDwxvIZDAmjqf3Zk3DqE5q2Gd6DYiLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779668965; c=relaxed/simple;
	bh=F/KWhKY9me5A2Sa/I7jFBd9C4AXQZ5ECUYFiuLrbMMQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pcBJ0rBa7+AYRJLsxlX+BbMY9LPtVymP/sDv7OxhiuVNsK7GnfkQcQ7+Kq5Nm5zc+27YvuVL10azlc0gazpGSX5tG5l1yyyQhvb0VmDuQDmoU3lwmKNeaS2HloBh8FucVXJxWR5OatWdoyYxcCGt680yzZlRlmbIQF4ctMDcxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwYKUlTI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwYKUlTI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so33542565e9.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 17:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779668962; x=1780273762; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZPN3CbJBUZQrnFfjLJre9HEteqTWcy5zl2bMbcjDkg=;
        b=GwYKUlTIhDCUIyCbHlDMFRLFMV25phskOJhPT4M4eJy3BGdPjl96xnmMueDNdsJRmO
         7F1dkO+LhwKuDz7sUZCmB01LQvXFa6rJ/xizBiEh1XvwTekGHugtl4+lDiyDRKjmB2vM
         R4DIaA7Ihml5csvmhCjQQP/WdC7k3y1jxTvCe4j//m2rRda+fI5Jo0ZIQmr+ainjEzgA
         5WbzUew2+yDiIpomCQtgBLij0m6kg6EYPJ/IwvR648PCRGcXxTEu2BjofFdillvWzZLC
         xj0O1Zvd/2det1JCYY4NDf5qdGbqTZ18P/640drwUFCKnTtoVhJclXVvjGaV1e99M9yS
         8k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779668962; x=1780273762;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZPN3CbJBUZQrnFfjLJre9HEteqTWcy5zl2bMbcjDkg=;
        b=Q2ypnBUW1kB6XipP1x+iQYePduJV/Z9zpuuh3LrKtjhSVxylF8qDWK52Rs4vfXACh1
         e8X75hPIagk7tXMExFPsSlNDX8sc4wgD/1M6JLhXcRUX1LaVK3DS2j4kp6viqg+AV2T3
         g6rvIaCbm+QzoWBvfokT2x8rTjM4WCSJnBXU5GiCeWMFovqA1d00y6jeAsjZgtYYxgAq
         5nrzdJOOJ1+J6SohAqwOvxDbF4ogLrEqNlkJ4Xz1pz7gbcqUxjQj7cTRP5+nRr+Ps+RC
         8Eh2D41CpeVTIWZkMmj8ORxIeNorcVzragICg+666EBsFGCtNb25rdZLxXdhl0R65n1A
         VUHw==
X-Gm-Message-State: AOJu0Yy23RBzXqKcIpXflnwKOsoMQWBDsiAo4MVoKrHHVzH57lpgo0ff
	H3FnFulBpI+yEQPajK0K7DTG8RuhKG/pNT3UAj7dnEcI8+A9Bdi6Eu4JuQneiw==
X-Gm-Gg: Acq92OEVmeR35B76OD2suTzGx1rKWcpCssa6zDarVs7TUmxsIndOP8Zt56108M86Uwy
	P5C8xWqJomVlisQ1LuHMNcyfWj6iDgMv8seysRgAj6XavZtpA1nVDujCdiweSqBsCeADJf1IfMe
	kjqWhAT3916dXIReZWiLNa5523QmZwGju2ZJtFG7RXlZTW40p0lM0l7yOuVbhm+C1eWdEApWvzY
	iUv9KMu8gk97xpVTkx038XY9mUEDRWAckSvV7RlzKdyGLGX5jWhfC30KCu+xA07Dfm9VjBe3oTG
	tRhygj/h4l+XKs8s8/ARrylLvLXpmmv4vL1337FO5g+NpW00R5bMy+XR0rNb5IB4NudePRCvoRc
	dmbpkR75QbmShNG7D7H1l85frJKbF3zyRyl0GO8k4wnXJ7ocVqgPlOI20ScBLApt7svLYkJUK7U
	xiYhKefmmz6BL5F4C3uMfThygA/tVXnZf9NjQZiZRIPha94WLKRyJlizYnidWw8arfXwkAPgkFI
	+MEmg==
X-Received: by 2002:a05:600c:4ecc:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-490426cbba2mr204504635e9.22.1779668962188;
        Sun, 24 May 2026 17:29:22 -0700 (PDT)
Received: from localhost (213-225-2-150.nat.highway.a1.net. [213.225.2.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d44f6sm98033265e9.8.2026.05.24.17.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 17:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 02:29:18 +0200
Message-Id: <DIRBZSWW96SV.3CWW1CXJWD1S6@gmail.com>
Subject: Re: [PATCH v3 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260524-veml6031x00-v3-2-29165609b2b5@gmail.com>
 <20260524225336.450AF1F000E9@smtp.kernel.org>
In-Reply-To: <20260524225336.450AF1F000E9@smtp.kernel.org>

On Mon May 25, 2026 at 12:53 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [High] Mixing `devm_pm_runtime_get_noresume()` with manual `pm_runtime_=
put_autosuspend()` causes a PM usage counter underflow.
> - [High] `veml6031x00_write_raw()` modifies hardware registers over I2C w=
ithout acquiring a runtime PM reference.
> - [High] The shutdown devres action performs I2C writes without ensuring =
the device and its parent are resumed.
> - [Medium] Missing locks in `veml6031x00_read_raw()` for `IIO_CHAN_INFO_S=
CALE` and `IIO_CHAN_INFO_INT_TIME` allow torn reads of configuration fields=
.
> - [Medium] Incorrect scale attribute exposure for the IR channel and fail=
ure to mark shared hardware attributes.
> - [Medium] The driver unconditionally sleeps for the integration time on =
every raw read, introducing unnecessary latency.
> --

...

>> +static int veml6031x00_write_raw(struct iio_dev *iio,
>> +				 struct iio_chan_spec const *chan,
>> +				 int val, int val2, long mask)
>> +{
>> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
>> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> +		return -EBUSY;
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_INT_TIME:
>> +		return veml6031x00_set_it(iio, val, val2);
>> +	case IIO_CHAN_INFO_SCALE:
>> +		return veml6031x00_set_scale(iio, val, val2);
>
> [Severity: High]
> Does this code modify hardware registers over I2C without acquiring a run=
time
> PM reference?
>
> Unlike veml6031x00_single_read(), this function directly writes to the
> sensor's configuration registers without a PM reference. Because the regm=
ap is
> not configured with .pm_runtime =3D true, I2C transactions may be attempt=
ed
> while the client device (or its parent controller) is runtime suspended, =
which
> can trigger bus transfer errors.
>

The registers are always accessible as long as the device is powered,
both in normal operation and power down. Therefore, this function cannot
be compared to veml6031x00_single_read() that acquires a PM reference to
carry out a measurement, and the write operations work fine.

>> +static int veml6031x00_probe(struct i2c_client *i2c)
>> +{
>
> [ ... ]
>
>> +	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action,=
 data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to add shutdown action\n");
>
> [Severity: High]
> Can this shutdown devres action perform I2C writes while the device is
> suspended?
>
> Because this devres action is registered before
> devm_pm_runtime_set_active_enabled(), on driver unbind, PM is disabled an=
d the
> device state is forced to suspended before the shutdown action executes d=
ue to
> devres LIFO execution order.
>
> The shutdown action then attempts to perform I2C writes to the shutdown
> register. Accessing the I2C bus while the device state is suspended can c=
ause
> bus errors or hangs.
>
> [ ... ]
>
>> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>> +
>> +	ret =3D devm_pm_runtime_get_noresume(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get runtime PM\n");
>
> [ ... ]
>
>> +	ret =3D veml6031x00_hw_init(iio);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_put_autosuspend(dev);
>
> [Severity: High]
> Does mixing devm_pm_runtime_get_noresume() with manual
> pm_runtime_put_autosuspend() cause a PM usage counter underflow?
>
> The devm_pm_runtime_get_noresume(dev) call increments the PM usage counte=
r
> and registers a devres action to decrement it on driver unbind.
>
> However, the explicit pm_runtime_put_autosuspend(dev) decrements the usag=
e
> counter to its pre-get state. When the driver is subsequently removed (or=
 if
> probe fails after the put), the devres action will blindly decrement the
> counter a second time, resulting in an underflow.

I believe Sashiko is misinterpreting how this pattern works (not
introduced by me, it is already available upstream in
drivers/spi/atmel-quadspi.c). Decrementing the usage counter is fine
because the devres action uses pm_runtime_put_noidle(), which in turns
uses atomic_add_unless(usage_count, -1, 0) to avoid decrementing the
usage_count if it is already 0. Sashiko has reported the same issue in
other patches of this series.

Best,
Javier
