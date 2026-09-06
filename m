Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F2355819
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725820; cv=none; b=Rm430MyK7yzDgf3xkO5QSNWwhrf6bLh/S4Sd6wWMtMBL86baSVX4g7URD9+tlXOyecZYdIMPgukjxNqV/8j4wMCGk+8p3qCc5jd825H6U6tvq9f+rCJOs2H9eJ+Hya/CVsoCGytAXBWte5xvmkpdUhKPHE0Z5EU3ZM6VcWR+slc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725820; c=relaxed/simple;
	bh=EgiEc88wDMuwQI8RaErS8IZLrV1n34S1ystE/a9qaK0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=Rz+U7ZcRY23GcM4gJMRki066i1wxucVute3bXVyZ+bUIbbYoQzpnoFqCS35QwAJFWnX2LMxbyuNgzmyFxTTJ4ySxHpxw9zjn+hZcLSZ6Gk1b2s1QqeosJCUWXLTKnZTIzueq+M6K9QnFtLQFYhpcOm8E1AY7r8bOGGfs7JRJREo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDIC3icv; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDIC3icv"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1104043e0c.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725817; x=1789330617; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=peVlo5midIsHLppkaegcNy/jZCMNrNbiCq0SLwEov68=;
        b=JDIC3icvckMCiFi425n/UZvzzl0YQd1a0E40MCg/lJVUkW0DcLNwgwNpYwZDUeFiXV
         VDtv54JbfsBjolnpNFo4OjSF7XTrypffXoTfqeOxM3F8l6M3VndkEKRWh3IMrGyO2DTF
         TSQhASY4DUtV3klq6Kv2u8jDg5LMUn3yiJT72jLTKCUdAThiQs1yQAkFv18OBwUYBYxw
         2yROkAR1UK5EHIUbutg5VfxuCQxlX1u+sBy5+LoWIimizHvQ2eFntdHeB9smO74SSea+
         HOVDmH6kv7Lo4vw2TbW2aexlWPOFqO+UBkjdSrndhbiJj6O+ge0YuI1uWX6JiKu0Cedj
         CYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725817; x=1789330617;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peVlo5midIsHLppkaegcNy/jZCMNrNbiCq0SLwEov68=;
        b=ElTevpoj5LC2fwO2+6gbUxvRwFTGoXYbu/nsAQN7us7qEBSlng0WIxMK1rmBgof6Wm
         6fMCYk3UMNjLVlDbQXmS4MjS28pY4UEvuzjEiOt/hsIA515Qs2ONdBQO66GkIc5rQShN
         bdls3dX5KCXvTBm01frlhRI1TkluWIqEJJBN/L2e46+aBoxJQ4/aeXkIuNHicwrGJhno
         kipl+Xz6jqKKRhvjy2WrCZd5hMFyo0ORimKo+Eda/w7yb73+6Bw3g7FLnUdwhRyYnHlW
         IbUb+ZLmpTkRpZyDPG4KWdhMo668uM/gUTLT7+0pKCxyC9VxThAOgdHuja33Mi4gKqZK
         A+TA==
X-Forwarded-Encrypted: i=1; AKwUvBxGvCLtRCKf6Ltiu1x2yAezmhaDbQhKUtCPysViwKlYC0BJkJLk5Mhtxatw9v9mC2TUFrxl0oRmzmC4Wha1BjI=@lists.linux.dev
X-Gm-Message-State: AFuF++l+SZ1jhXrcO0FKC0SuDTo+S0sVt3NjL9B+RQp6xEbGB9oVAyCT
	2bhBpX0uYQtpeh7g4XGBzFImd26xUOuuwo7U9hJSBfb/fzt5GXkFt/lN
X-Gm-Gg: AYBFou21kG4JA+m3er4I1cdjocvce9GJWxHJaa6JiNJUtqJ0IvauGtRvwNOrJ0VQ+3w
	kaXdjDzkgzbwvga2uILCepaWBTRE8VfBMCYgNFyF7cMW1zClyVqIWemvDDkWsqcIuoBiZm51TcU
	HRXrZKEIumkV/eolONoyEK7s62ifcvimRC9UqGrL++OqUDOdfiATl0Kd2z4tVq7lcYGHuO52pH0
	X0vfEIT0ANo3dfBrr8QTkYaDN9OwWq/5HPnkdZZgViuxNFbYhIw4ITg9M40+O/yBNZuaKzyQwEI
	BI2abrSOLeqjvad3b1PFBUpd6Jf920uxjSxozUXFPT8Io0SZkliu3zjeyqHEeaWLDQcO60Nqf1o
	UVwnAhZPyiHBS/Aa0j9EJ6IDkkF/iQLZ1PZkB9mOtLbUkIdCgmxnANZ/wu6UyqfgHjJ1BQucgTG
	yGcD9P0pkGk9ugJ1Du2u0kHFq+GsR8qgx+RxFL3AmGkahqSguRcw==
X-Received: by 2002:a05:6122:1785:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c7ed3b1b2cmr7897263e0c.3.1788725817587;
        Sun, 06 Sep 2026 13:16:57 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097f4sm6699138e0c.1.2026.09.06.13.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:16:57 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:16:54 -0300
Message-Id: <DL8IDQUWAFJL.5RNMP0YKWW9@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, <conor+dt@kernel.org>,
 <robh@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, <sashiko-reviews@lists.linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-3-1dc27e9c0260@gmail.com>
 <20260828065211.C05B11F00A3F@smtp.kernel.org>
 <178805537532.2788519.12150005140246669583.b4-reply@b4>
In-Reply-To: <178805537532.2788519.12150005140246669583.b4-reply@b4>

On Sat Aug 29, 2026 at 11:02 PM -03, Jonathan Cameron wrote:
>> commit 6093db1ff45e9e897720bc6b278550ffbef67e85
>> Author: Kurt Borja <kuurtb@gmail.com>
>>=20
>> iio: adc: add the ti-ads1262 driver
>>=20
>> Add the ti-ads1262 driver with initial support for the primary ADC (ADC1=
).
>> Various features such as accurate timeout delays, per-channel reference
>> sources, scale, offset, and diagnostics are intentionally left out for
>> future support.
>
> One particularly interesting point from sashiko about regmap debugfs.
>
>>=20
>> > diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262=
.c
>> > new file mode 100644
>> > --- /dev/null
>> > +++ b/drivers/iio/adc/ti-ads1262.c
>>=20
>
>> > +static int ads1262_channel_read(struct iio_dev *indio_dev,
>> > +				const struct iio_chan_spec *spec, __be32 *val)
>> > +{
>> > +	struct ads1262 *st =3D iio_priv(indio_dev);
>> > +	int ret;
>> > +
>> > +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>> > +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> > +		return -EBUSY;
>> > +
>> > +	ret =3D ads1262_set_runmode(st, ADS1262_RUNMODE_PULSE);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret =3D ads1262_channel_enable(st, spec);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	reinit_completion(&st->drdy);
>> > +
>> > +	ret =3D ads1262_dev_start_one(st);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	ret =3D ads1262_wait_for_conversion(st);
>> > +	if (ret)
>> > +		return ret;
>>=20
>> [Severity: Medium]
>> Does this error path leave the hardware running if the wait is interrupt=
ed?
>>=20
>> If ads1262_wait_for_conversion() returns an error (like -ERESTARTSYS fro=
m
>> a signal), the driver exits immediately without stopping the hardware. I=
f a
>> subsequent read calls reinit_completion(&st->drdy), but the abandoned
>> hardware conversion finishes and asserts the DRDY interrupt right after,
>> could the new read prematurely fetch stale data from the old conversion?
>>=20
>> Should this path ensure the hardware is stopped and synchronized with th=
e
>> interrupt handler on timeout or interrupt?
>
> For me this is obscure enough I'm not sure we care about stale data.

Interesting issue... Hmmm, yeah I say we leave it like that too. Stale
data would not be the end of the world here.

>> > +static int ads1262_regmap_read(void *context, const void *reg_buf,
>> > +			       size_t reg_size, void *val_buf, size_t val_size)
>> > +{
>> > +	struct ads1262 *st =3D context;
>> > +	u8 tx[2];
>> > +
>> > +	lockdep_assert_held(&st->xfer_lock);
>>=20
>> [Severity: Medium]
>> Will this lockdep assertion fail if the register is read via debugfs?
>>=20
>> Because ads1262_regmap_config does not set disable_locking =3D true and =
does
>> not provide custom lock/unlock callbacks, regmap uses its own internal
>> mutex. When regmap's debugfs interface is read, the regmap core acquires
>> its internal mutex and calls the driver's ads1262_regmap_read() callback
>> without holding st->xfer_lock.
>>=20
>> Could this bypass the xfer_lock, triggering the lockdep splat and allowi=
ng
>> debugfs SPI operations to interleave with driver-initiated SPI transacti=
ons?
>
> This is a corner I'd not thought about in adding lockdep markings to thes=
e
> functions.  Up to you how you want to fix it.

The way to fix this would be to either bring the xfer_lock back into the
regmap callbacks or allocate the regmap_config dynamically and give it
the xfer_lock so the core can deal with it.

For me I'd prefer to do the first but David raised a concern about the
xfer_lock being in the callback. Maybe David can give us his opinion
here?

--=20
Thanks,
 ~ Kurt
