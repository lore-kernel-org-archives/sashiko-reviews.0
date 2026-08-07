Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159A32BE63F
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114421; cv=none; b=RTr+TAeNtFh/hWPb0fhRcwY8PBZPb7x9f0/SZRLCqg0iVduZvCisYV2VbfGH6yIbGq0Dujcbp/bRJaI2ZG3R5Iu7CXJ77PQd5MClZngfI61GrjqwXu7ighKIQY9evqsqnU5WMd3pXZj3om0VyKuVSym25kH6bSOjm+Grx609cPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114421; c=relaxed/simple;
	bh=GefV3NNh0mC4k/+YNxtqLjBzqGJePo4P6USI1SfGzdQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=UXukzedjyb0Q8j7Xy/WsNhMtTixIOQROO0m4GjSoiUBo7FsHL3c0V4oBK9aTCGLaUlzV6jBkp6fd8S4jMZiFI+886K7n4BLNwSHKMgtiP8pNPjGWmZ6BnLMAfKmKdxz9MUC0IsQbf816DOiumh1lLrVUdZybTPPVfkPZZEYcZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAgAoFgw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAgAoFgw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954dff6536so25478475e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786114418; x=1786719218; darn=lists.linux.dev;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1TYQovX813QrlY8K8QJWO05PjbpBhzIRd4Xwek58sc=;
        b=gAgAoFgwz9cUAqXqnVPF/+8+sW1ymnF1yLHEJa7DnwHETaqPx6eWBPw15pZO6zodKl
         Mhnqvo67Gwh+aeZvCp9pJMEZuV4eRKycoogQehvtSiuCdgqgEAHBXftEvDTZo1a/+JFZ
         qks4MvUm9Os3I0pVJifZcrt0FjAJtYIfn6jfUlNLTmE8GRMUph6QbMGXHDNeuIsHwifJ
         gCM+oNcMqx+QLxlTbPO6nr7/vn92zTQZsSIe0jCHEycGeeyszH2mAIT7jOIPkd4gYy/W
         LmkSiGvhaHYa5kiGaIfLvB3PttItGWXaLCExzcEzRJ1pI+5aE4BtouulymbgD+/q09E6
         mbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786114418; x=1786719218;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1TYQovX813QrlY8K8QJWO05PjbpBhzIRd4Xwek58sc=;
        b=P3211QkhW+/j9rJlxSuVmzbitEsA/VWGUYgjsiod66fjW6GHFvUCMTwQ3ClJYbyGR9
         qlC5u29f+zcMHUisnko09O8+cNx3jk4VdUgbW8SDlYHeVdtnNJcR1LSUjs861XHv24BT
         ZENkZwG19Rf5DzbRgPy9Y6Tbs996MfSqgM0/u2vtNu48qHrNm5lcOlQ4SgoQnUBXnLMf
         LYX7LDaeIWwJs8VUsavLoUI3UAFVytNoBQxSplAGSxS51uwXZHZNT0jSNnjRiDBRehE2
         /i0oo13UqOcMyfBObS3jXLmPKpJ8i/lLjq8d1Ww8Nb1ipBqshNRC81jw6AwsnsGEl783
         JjLA==
X-Gm-Message-State: AOJu0YyGzytcSTBpxUO8+5JVjDz0mnoA7udLY0GI3f6U2CHWiIV+lieJ
	T292RYVnrtlKwt6qESn+wj6OjJlkhONCwjBAQZynsG68hY/HrcDA3b3sFSUn5Q==
X-Gm-Gg: AR+sD11rPLjXI9De6RgXppFahMxEvzEJ6gM3y5KlmN+qe0r/rBfTOWkSfWmn83GTnBL
	LddCLohnBuxRB9qOAi8kJFvy1sj8oHM0ZppOof081b01LJ5ZYUFnWXbk8hfdpM5FxMJSbOBob0F
	MWjsTzHBXOzCA/8vTjJ898kpvPKXECDpPfwNDKpl9C6hisG4pv7PnELWTCpLJovzVyt7iaT/1L2
	pxnyxmhD8J9MaBmo+1IZ8RLJFgfD99g0Or5CwWq+1VvvVZ3vbydxWMBb4jYxrjLL7uqVhwDyxHZ
	6AL1niI6gm/DmB5SODNfKKDbh0ByRhWXbi91L3SYs74wOAJq5s9K3B57qiJIKWtyEV4XE2mQeOY
	tEkBVMzfb1KVJYoLFKqRntMpWkSsn022cwR9mohBGw2EpHnrYwF+uOurMS3CjZIRMxewqvmgKru
	gGCUNvU4JTrL9TJ8tfN9sJjf0r5HVmFh0ybHACmcmB2j2vueLum6U7vXDLrzTrFA/kj9CUbmEWs
	rA=
X-Received: by 2002:a7b:c7d3:0:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-49959e2f01bmr121071505e9.12.1786114418064;
        Fri, 07 Aug 2026 07:53:38 -0700 (PDT)
Received: from localhost ([2001:4bb8:13c:7c2e:a29b:6e3a:d099:a4c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm65199965e9.4.2026.08.07.07.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 07:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 16:53:35 +0200
Message-Id: <DKISPV4GH699.G6SFCPJJMS10@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-2-e60876fb3640@gmail.com>
 <20260807141922.EADFE1F000E9@smtp.kernel.org>
In-Reply-To: <20260807141922.EADFE1F000E9@smtp.kernel.org>

On Fri Aug 7, 2026 at 4:19 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Mixing `devm_pm_runtime_get_noresume()` with a manual `pm_runtim=
e_put_autosuspend()` in `probe` causes a PM usage counter underflow on devi=
ce unbind or probe failure.
> - [High] An unprotected read-modify-write in `veml6031x00_set_power_state=
()` races with sysfs configuration changes, causing lost user configuration=
, and a lock inversion prevents a simple fix.
> --
>
> --- Patch [2]: [PATCH v5 2/4] iio: light: add support for veml6031x00 ALS=
 series ---
> commit 2cb7c39d884f4873be61de5deba3865dbd24f394
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: add support for veml6031x00 ALS series
>
> These sensors provide two light channels (ALS and IR), I2C communication
> and a multiplexed interrupt line to signal data ready and configurable
> threshold alarms.
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> new file mode 100644
>> index 0000000000000..30cccda51ca08
>> --- /dev/null
>> +++ b/drivers/iio/light/veml6031x00.c
>
> [ ... ]
>
>> +static int veml6031x00_set_power_state(struct veml6031x00_data *data, b=
ool on)
>> +{
>> +	u8 conf[2];
>> +	int ret;
>> +
>> +	ret =3D regmap_bulk_read(data->regmap, VEML6031X00_REG_CONF0,
>> +			       conf, sizeof(conf));
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (on) {
>> +		conf[0] &=3D ~VEML6031X00_CONF0_SD;
>> +		conf[1] &=3D ~VEML6031X00_CONF1_IR_SD;
>> +	} else {
>> +		conf[0] |=3D VEML6031X00_CONF0_SD;
>> +		conf[1] |=3D VEML6031X00_CONF1_IR_SD;
>> +	}
>> +
>> +	return regmap_bulk_write(data->regmap, VEML6031X00_REG_CONF0,
>> +				 conf, sizeof(conf));
>> +}
>
> [Severity: High]
> Does this unprotected read-modify-write race with concurrent sysfs config=
uration
> updates?
>
> Because CONF0 and CONF1 are in the volatile ranges, regmap does not prote=
ct
> them with its cache lock. Concurrent regmap_field_write() calls triggered=
 by
> veml6031x00_write_raw() could change the gain or integration time between=
 the
> bulk_read and bulk_write here, causing the user configuration to be silen=
tly
> overwritten and lost.
>
> Additionally, could acquiring the scale_lock here to fix the race cause a
> deadlock?
>
> Looking at veml6031x00_single_read(), it holds the scale_lock before acqu=
iring
> the PM runtime reference:
>
> veml6031x00_single_read()
>     guard(mutex)(&data->scale_lock);
>     ...
>     PM_RUNTIME_ACQUIRE_AUTOSUSPEND(...)
>
> If the autosuspend acquisition triggers veml6031x00_runtime_resume() whic=
h
> then calls veml6031x00_set_power_state(), attempting to take scale_lock a=
gain
> would deadlock.
>
> [ ... ]
>

This issue can be avoided by using regmap_update_bits() instead, which
actually was used in previous versions. I modified it to test the
difference after I get confirmation from the manufacturer that the
registers must be updated one after the other, not at the same time.
I will get back to regmap_update_bits().

>> +static int veml6031x00_probe(struct i2c_client *i2c)
>> +{
>
> [ ... ]
>
>> +	ret =3D devm_pm_runtime_set_active_enabled(&i2c->dev);
>> +	if (ret)
>> +		return dev_err_probe(&i2c->dev, ret, "Failed to enable runtime PM\n")=
;
>> +
>> +	ret =3D devm_pm_runtime_get_noresume(&i2c->dev);
>> +	if (ret)
>> +		return dev_err_probe(&i2c->dev, ret, "Failed to get runtime PM\n");
>> +
>> +	ret =3D veml6031x00_validate_part_id(data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D veml6031x00_hw_init(iio);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_put_autosuspend(&i2c->dev);
>
> [Severity: High]
> Will mixing devm_pm_runtime_get_noresume() with a manual
> pm_runtime_put_autosuspend() here cause a PM usage counter underflow?
>
> The devm_pm_runtime_get_noresume() call increments the usage counter and
> registers a devres action to decrement it on unbind or probe failure.
>
> However, the manual pm_runtime_put_autosuspend() here drops the counter b=
ack
> to zero.
>
> When the driver is subsequently unbound, the devres action will execute a=
nd
> decrement the counter again to -1, which could corrupt the runtime PM sta=
te
> machine and prevent the device or its parent from suspending.
>

This was discussed in V4, and it is not a real issue because this
configuration can never reach to decrement the counter to -1 (long story
short: atomic_add_unless(&dev->power.usage_count, -1, 0)). It was also
validated by loading and unloading the driver under different
circumstances.


Best regards,
Javier
