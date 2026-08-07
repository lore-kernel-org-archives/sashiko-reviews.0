Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7532E286417
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134825; cv=none; b=CUW/L3A/fBZBR1gtWBelTVoDgAW5ajDQRDuK7GytFlIDjcyBRaLObnyaePGDnARZPXfAE1uRZSrK6Z1vBj47m2CzN3IuZs6udq4/BHyeKQzN3xVKzkICoJcVE/+SQVmfiAlLYgfbEfcjYwWQR+HOmZOJHktKdTO8KY5UbgND0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134825; c=relaxed/simple;
	bh=N54qbveZaZaWvgeVPjQfBKOXXxxCrWiwcT07N4okEVA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ro+nN8yyzUeCc9JUukEzpNSkA7PmLVjYcudylwmASbNUR2zlY72pI/2lxclNz5JegrQIBI6amsX9yK33fAtGYhsYudcCSIIW3tkCZbo0a1ha3op3xkDQlnP6wHcwnafzwxhnKgPWipbHiDpb5glfrGmUxiUVS1g19R5sOYl0emI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekM2idDE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekM2idDE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso34710195e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786134822; x=1786739622; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=De06VEaOuiWd1BlZEWn4N+f8YiSt9PtjH7YLJZB3hj4=;
        b=ekM2idDEXDIeqez5DtThHTbdtzHk6nr/MdrK9KiW3Jrzb/B/mCOIIFOiXvgl+QzcQj
         +iw9HuSHCQjwAJdviDRVfBjGSLGsPrnbyMMsSyVmH77SB5oMGWh+CKCXDBDX3ZqBlKZG
         7dJJalmqp2bdDLpR+PUBYROnMdld3hiuO4D9aIoMBgbF8vEYTerafr0hvI/Q4qVxQLf0
         u6F2Y68I/UpOzsjRG7zIppt50L3ESlsyIxpJEaXbs6vdgKlUZL4RZuPUAXLYgYTCJHg7
         NisvowTUDCqsRT+l+nZTybiZeY9WX3U8k++UDIHp86+pu4hAXdBWoxahVtKHQIphoXe/
         Fl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786134822; x=1786739622;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De06VEaOuiWd1BlZEWn4N+f8YiSt9PtjH7YLJZB3hj4=;
        b=soyVRcCiT3XC64O7z1bpvXya84wC4fPigJX+81Pn1VzohpSI/6VbwDSWRKM5f5Rs2X
         88kThlAs/KOjv+WNO5Vs3CZa/T5KPfwrAj9Hke1hOq7T0lwdXa59XNGEuUGBUZiJmIzT
         Cbsgp/0mF2s3+XPjIXDQglCaChFIeJH584rtplWs2hAudVq+qeYbLsuTT4nIKKcX2fh5
         n5kNdlDdWlOohrpGSAajiogZDJ8fupzdepAqSBSLewIY7rGX859tOtJMRS4VZlzsfXMK
         y0MCqMBzaEmz5UEYFCm1hYfes52L4V/pub9PJcJBJmB6EDfzcRCh+EDADnHtNATLdn7C
         Pgsg==
X-Gm-Message-State: AOJu0Yz5F9qMuVLnxLNgMV+VZ4LOHAYVjTEzpBibbxnelKWpfBr+IkYZ
	aa1qGPhcGfxcIijbfj2UCQmRnkEnZHsyUF8fUxHL1HKaxEI5uQTG6pei+I5MZg==
X-Gm-Gg: AR+sD11A5r2qlQ1NRq91izATAkQVWFAYdQGsZa5iWELorXUhSX6EUahH7ZaP3qQOPhJ
	IcF7ZaFnn96dobLLL6CzjNBGL1xmgEMefSLG3u9F3JwWqFPs7LHir/QmeuGKmdhg08rGLDUQHi3
	/qHRozUpPGrG0NUjFE41S+FEkdyQlSff6ErlLL911XBUQQpSOhI9rIdxaA0RlL8Dh9pUfZYDfcP
	ond+W/phqq1e1yXJf2hIrGAUtPYQ9SWnGscrQzJj9+BbVQZnZ8ywBIqMN6YyQBSOi8ZhRGMgkZa
	P1B4F4zYUENfwR//sjLdPPagBTLHa+bsl+l0xcObM3Vwq2DJarpkUFAVWGbsaJJVKj2tfM/qEE2
	dyf8iSdnEUBHU77nLsO3r7qn0shCdUzRYohnJ7VpVe8rPCEEtzj4cTRTd9fS+kEai30T97v8ba2
	UCihAzjJE667sBJdoFAwHdRupe8ANqy7ADsY9V0jQholWWd+3lSOmSnQpCa8j2LymY8CA28+0HH
	mr5rqrZrSmbB88=
X-Received: by 2002:a05:600c:3b88:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-4996194e24bmr35256175e9.1.1786134821476;
        Fri, 07 Aug 2026 13:33:41 -0700 (PDT)
Received: from localhost ([2001:4bb8:13c:7c2e:e257:63be:6e31:db7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b4499sm65549785e9.3.2026.08.07.13.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 22:33:39 +0200
Message-Id: <DKIZY8CMDB8D.2OSTM5ASBS0FG@gmail.com>
Subject: Re: [PATCH v5 3/4] iio: light: veml6031x00: add support for
 triggered buffers
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260807-veml6031x00-v5-0-e60876fb3640@gmail.com>
 <20260807-veml6031x00-v5-3-e60876fb3640@gmail.com>
 <20260807144922.D11A81F00A3A@smtp.kernel.org>
In-Reply-To: <20260807144922.D11A81F00A3A@smtp.kernel.org>

On Fri Aug 7, 2026 at 4:49 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] AB-BA deadlock between scale_lock and IIO direct mode lock
> - [High] Missing IIO buffer channel configuration causes probe failure
> - [High] Uninitialized kernel stack data leaked to userspace in IIO trigg=
ered buffer
> - [High] Unbalanced pm_runtime put leads to negative usage count
> --
>
> --- Patch [3]: [PATCH v5 3/4] iio: light: veml6031x00: add support for tr=
iggered buffers ---
> commit a5266734ac0d8d96ec4ee20e5c8d6088863dee05
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: veml6031x00: add support for triggered buffers
>
> Add triggered buffer functionality for the two channels the device
> provides (ambient light sensor and IR).
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> index 30cccda51ca08..0cccd40d729eb 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
> [ ... ]
>> @@ -392,6 +401,10 @@ static int veml6031x00_single_read(struct iio_dev *=
iio, enum iio_chan_type type,
>>
>>  	guard(mutex)(&data->scale_lock);
>>
>> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
>> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> +		return -EBUSY;
>> +
>
> [Severity: High]
> Does this establish a lock order of scale_lock followed by the IIO direct
> mode lock?
>
> [ ... ]
>> @@ -453,6 +466,10 @@ static int veml6031x00_write_raw(struct iio_dev *ii=
o,
>>  				 struct iio_chan_spec const *chan,
>>  				 int val, int val2, long mask)
>>  {
>> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
>> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> +		return -EBUSY;
>> +
>
> [Severity: High]
> Can this cause a deadlock?
>
> In veml6031x00_single_read(), data->scale_lock is acquired before the IIO
> direct mode lock.
>
> However, here the IIO direct mode lock is acquired first. If this then ca=
lls
> veml6031x00_set_it(), which acquires data->scale_lock:
>
> veml6031x00_write_raw()
>     IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim)
>     veml6031x00_set_it()
>         guard(mutex)(&data->scale_lock)
>
> Could concurrent sysfs access to raw data read and integration time write
> lead to a deadlock?
>

I will reorder the lock acquisition order, always acquiring direct mode
first and then scale_lock.

>>  	switch (mask) {
>>  	case IIO_CHAN_INFO_INT_TIME:
>>  		return veml6031x00_set_it(iio, val, val2);
> [ ... ]
>> @@ -484,6 +501,81 @@ static const struct iio_info veml6031x00_info =3D {
> [ ... ]
>> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
>> +{
>> +	struct iio_poll_func *pf =3D p;
>> +	struct iio_dev *iio =3D pf->indio_dev;
>> +	struct veml6031x00_data *data =3D iio_priv(iio);
>> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2);
>
> [Severity: High]
> Does this leak uninitialized stack memory to userspace?
>
> The scan buffer is declared without zero-initialization.
>
> When reading only a single active channel (e.g., just the ambient light
> sensor), the driver only writes 2 bytes into the array, leaving the
> unpopulated channel slots and structure padding uninitialized.
>
> Will iio_push_to_buffers_with_ts() push this uninitialized kernel stack
> memory to the ring buffer? Should the scan structure be zero-initialized?
>

I will fix it in V6 with =3D { } on the declaration.

>> +	unsigned int i =3D 0;
>> +	int ch, ret;
> [ ... ]
>> @@ -588,6 +680,14 @@ static int veml6031x00_probe(struct i2c_client *i2c=
)
> [ ... ]
>> +	ret =3D devm_iio_triggered_buffer_setup(regmap_get_device(data->regmap=
), iio,
>> +					      iio_pollfunc_store_time,
>> +					      veml6031x00_trig_handler,
>> +					      &veml6031x00_buffer_setup_ops);
>> +	if (ret)
>> +		return dev_err_probe(&i2c->dev, ret,
>> +				     "Failed to register triggered buffer\n");
>> +
>
> [Severity: High]
> Will this probe fail with -EINVAL?
>
> The triggered buffer is registered here, but it appears the driver's
> channels array (veml6031x00_channels) was not updated with .scan_index,
> .scan_type, or a timestamp channel.
>
> Without .scan_index, the IIO core defaults both channels to index 0.
>
> Does iio_device_register() abort with -EINVAL during probe when
> iio_check_unique_scan_index() detects the duplicate scan index 0?
>

The problem is that the no_irq channel definition is missing the scan
attributes. I will add them for V6.

>>  	pm_runtime_put_autosuspend(&i2c->dev);
>
> [Severity: High]
> Is this pm_runtime_put_autosuspend() call unbalanced?
>
> The probe function appears to use devm_pm_runtime_get_noresume() which
> automatically queues a put on unbind.
>
> If we explicitly decrement the usage counter here, will the devres action
> firing on unbind drop the counter below zero and trigger a warning?
>
> Should this use the non-devm pm_runtime_get_noresume() instead if the
> driver intends to manually drop the reference later?
>
>>
>>  	ret =3D devm_iio_device_register(&i2c->dev, iio);

I yield. This warning is going to show up a million times during the
review, and probably every time a change is applied to this driver. I
will use the simple pm_runtime_get_noresume() and add the
pm_runtime_put_noidle() in the error paths after it in the probe.

Best regards,
Javier
