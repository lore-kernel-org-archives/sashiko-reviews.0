Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B91C84BC
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171444; cv=none; b=XjI8WMLPZQW5v+VaPLDCB5a7HIJzKh3iu6Ls7cSbjXlYEY1FWrSWw5J1gCIWtGOGDVa+I3X/ac3gP9FgMxEtgqxUVt9jPqRZ852br9E2NL2Ore9WBcabXXti4RWNG5VcmlFvYBVpGhQSadE51F7nbyixGyckCd9Me19nQMVBXT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171444; c=relaxed/simple;
	bh=YF4gb38Dpca3unqSChLLRMnajwC7DJW0LkjmlrmhosE=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=TLfvu1tt55v4se6MF8YptXRYY4WIgxsxJu0bbiouJzL978QeFp2GfQo5ttMwKzdGJaHawaDBI0+p/Lu7kEEzB1cRdMgn//CdkwFobiZ+QirAK9HsQP+Rwz9k9unQpmSEcxjYZ/qD1JIspJhN8+5E2dvP64OWaoASK/32imp/ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCAnpW8O; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCAnpW8O"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso3221103f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780171441; x=1780776241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kBiHxU9gh+fvJMTgPijZ7UiLdV3wcHSKEREG23Pz27U=;
        b=RCAnpW8OrQDCcoYqBHzDnX2UJEFzxgtMbj77/vKUY2mBz+uVwz23XOWMWG0K5clQhp
         Z3ikGYDjfNgrJ57KI+oXdFv8P0QnQss2M/NJkhibr+ACaw6MPYTX64oBL5kWC+Z2bOyy
         aQzGXdJKfYL0rYt+X9d4N/Zmbw99B8hbKItZGQDAgOXzloFII8m+PcSL+6QbDKEnOQrC
         lUEIJ70ZFQQWmASrCMVLkRkCGRLsnVUQFTjJq1skvrIZ+RuvH/J+9Eu4cBEDvYwNfjn7
         y5LnbiRD5XsQMzg4XXpYUmoDV1YsShcPZeVmYHTh5OWX1pdvw+DmQRbFPQzTxLbO+dQF
         04Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780171441; x=1780776241;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBiHxU9gh+fvJMTgPijZ7UiLdV3wcHSKEREG23Pz27U=;
        b=b5BjYUJiK7fpGM2IWjcs4bUGvseycX3beofb/sg9Q6/IHjLIv3azxoV1Lw7LEbtIe3
         QuoTenkHATVPtw2mowQxy40TYhBqK1x41pbC8WcrF8Q4nWmY6NtcJ/lYxC1/cLxrTgp9
         L2TVThgcVDgptY8LB+uDuxlvz5whRgJg8RQYMGvYqdoMQAkuhojBUO1RoDkmKMrksPJo
         uaYNaPzPEn2cbhqVU7l5cdgl0HMpeFSWm5pybL+/xxn4PjQ9cL3LoL8KUUuiVi5m8usw
         autkLayAN3s1p4N9vUOYMRyNjQ3OHy9RuQP+TfZUhFWF4NyXqaEQ60zslwL8KsX+Tnct
         raPA==
X-Gm-Message-State: AOJu0YyV9dT3Mjuo78/V6t/MDFHVL/JNyv81wwkUMVNK+jYYclYgQTZw
	eIQXDd7O+eBVV6nHCx4qjbSKMmQ8hCyJ4zHITOgXAazk0clkxglquMOCcjXzrQ==
X-Gm-Gg: Acq92OE4uTwR8vjx6BZQQo5T3VyjjtEdXqMp153Z1m9npyaJJ+TScqt51sgtzl60gJs
	IylFj6Y+cVX4DVWzCNK+sUunPQ0TjOj2m2CpnxBl+58mSSW1GxOimOegkCm+dtH8vCY43ozM9AX
	Ap859uWTsNNePzNDKeyAXANQ9NO+2oQw3ln8wMo0nEv59yq+KFsIA9aGjEHnyDbHqctxE9gAAoo
	lHbz1E/egakQseSrWDcsraJlr5D+5dh9zLePhdeGLtnXihuO7oohz50bDwSylyq7CJfdtMmXm6A
	ID/fsSsYGyQ7N2iAfT3zK+QzBAsibafGIOhOQ/66PzyOWFRkNBF+BqiUWBy4Ql0Bh2k6qNuL6nq
	e0iNP0FjNGxjcV6sD+MddQAh+S+rtg5E8tZCVD0xo3QsX3V/OHBTYRDw57xYhDOletN6gvjVNhS
	XHOGWBS6dwD6hQKopju0bCBQXrQw==
X-Received: by 2002:a05:600c:8582:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490a2933360mr61104025e9.22.1780171440510;
        Sat, 30 May 2026 13:04:00 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0a89sm146671035e9.7.2026.05.30.13.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:04:00 -0700 (PDT)
Date: Sat, 30 May 2026 22:03:59 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Vicki Pfau <vi@endrift.com>, dmitry.torokhov@gmail.com,
 linux-input@vger.kernel.org
Subject: Re: [PATCH v5 2/3] HID: nintendo: Add rumble support for Switch 2
 controllers
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <20260512200051.2534081-3-vi@endrift.com>
 <20260514005353.EF8D8C19425@smtp.kernel.org>
In-Reply-To: <20260514005353.EF8D8C19425@smtp.kernel.org>
Message-Id: <331Z58LB0M1BZ.1YEPN0R8KDBQI@homearch.localdomain>
User-Agent: mblaze/1.4-1-g5a69507 (2026-01-24)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Mixing jiffies and milliseconds in delayed work scheduling logic=
 causes an integer underflow, permanently stalling the haptic rumble.
> - [High] A guaranteed NULL pointer dereference occurs in the error loggin=
g path of switch2_rumble_work, as well as a TOCTOU race condition.
> - [Medium] `ns2->ctlr_type` is checked before it is dynamically initializ=
ed, causing union corruption for GameCube controllers.
> - [Low] Implicit type promotion in the max() macro causes a compiler warn=
ing.
> - [Low] Kconfig documentation claims individual motor control for the Pro=
 Controller, but the implementation identicalizes the rumble data for both =
motors.
> --
>=20
> commit d72f0f8e0dadde2cacc27050b92088c2e5cbea0e
> Author: Vicki Pfau <vi@endrift.com>
> Subject: HID: nintendo: Add rumble support for Switch 2 controllers
>=20
> This commit introduces rumble support for Switch 2 controllers, handling =
both HD
> Rumble linear resonant actuators and eccentric rotating mass haptics. It =
adds
> state machines for rumble scheduling and output reporting via hdev.
>=20
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 26ef589f652c6..a7fe74d982475 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -850,10 +850,10 @@ config NINTENDO_FF
> >  	depends on HID_NINTENDO
> >  	select INPUT_FF_MEMLESS
> >  	help
> > -	Say Y here if you have a Nintendo Switch controller and want to enabl=
e
> > -	force feedback support for it. This works for both joy-cons, the pro
> > -	controller, and the NSO N64 controller. For the pro controller, both
> > -	rumble motors can be controlled individually.
> > +	Say Y here if you have a Nintendo Switch or Switch 2 controller and w=
ant
> > +	to enable force feedback support for it. This works for Joy-Cons, the=
 Pro
> > +	Controllers, and the NSO N64 and GameCube controller. For the Pro
> > +	Controller, both rumble motors can be controlled individually.
>=20
> This isn't a bug, but is the help text accurate regarding individual moto=
r
> control? The implementation in switch2_rumble_work() appears to encode th=
e
> exact same rumble configuration to both the left and right motor offsets,=

> which would make both motors vibrate identically.

As pointers to different offsets into the rumble_buffer are passed,
I assume that the vibrations will actually not be identical.

>=20
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index 2193afcdefabc..9801799a90758 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
>=20
> [ ... ]
>=20
> > @@ -3103,6 +3155,107 @@ static inline bool switch2_ctlr_is_joycon(enum =
switch2_ctlr_type type)
> >  	return type =3D=3D NS2_CTLR_TYPE_JCL || type =3D=3D NS2_CTLR_TYPE_JCR=
;
> >  }
> > =20
> > +#if IS_ENABLED(CONFIG_NINTENDO_FF)
> > +static void switch2_encode_rumble(struct switch2_hd_rumble *rumble, ui=
nt8_t buffer[5])
> > +{
> > +	buffer[0] =3D rumble->hi_freq;
> > +	buffer[1] =3D (rumble->hi_freq >> 8) | (rumble->hi_amp << 2);
> > +	buffer[2] =3D (rumble->hi_amp >> 6) | (rumble->lo_freq << 4);
> > +	buffer[3] =3D (rumble->lo_freq >> 4) | (rumble->lo_amp << 6);
> > +	buffer[4] =3D rumble->lo_amp >> 2;
> > +}
> > +
> > +static int switch2_play_effect(struct input_dev *dev, void *data, stru=
ct ff_effect *effect)
> > +{
> > +	struct switch2_controller *ns2 =3D input_get_drvdata(dev);
> > +
> > +	if (effect->type !=3D FF_RUMBLE)
> > +		return 0;
> > +
> > +	guard(spinlock_irqsave)(&ns2->rumble_lock);
> > +	if (ns2->ctlr_type =3D=3D NS2_CTLR_TYPE_GC) {
> > +		ns2->rumble.sd.amplitude =3D max(effect->u.rumble.strong_magnitude,
> > +			effect->u.rumble.weak_magnitude >> 1);
>=20
> Will this max calculation trigger a compiler warning? The strict type che=
cking
> in the max macro might fail because effect->u.rumble.weak_magnitude >> 1
> promotes to an int, while strong_magnitude is a u16.

Apparently it is not strict enough to emit a warning on my machine at
least ...

>=20
> > +	} else {
> > +		ns2->rumble.hd.hi_amp =3D effect->u.rumble.weak_magnitude * RUMBLE_M=
AX >> 16;
> > +		ns2->rumble.hd.lo_amp =3D effect->u.rumble.strong_magnitude * RUMBLE=
_MAX >> 16;
> > +	}
> > +
> > +	if (ns2->hdev)
> > +		schedule_delayed_work(&ns2->rumble_work, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static void switch2_rumble_work(struct work_struct *work)
> > +{
> > +	struct switch2_controller *ns2 =3D container_of(to_delayed_work(work)=
,
> > +						      struct switch2_controller, rumble_work);
> > +	unsigned long current_ms =3D jiffies_to_msecs(get_jiffies_64());
> > +	unsigned long flags;
> > +	bool active;
> > +	int ret;
>=20
> [ ... ]
>=20
> > +	if (active) {
> > +		unsigned long interval =3D msecs_to_jiffies(4);
> > +
> > +		if (!ns2->last_rumble_work)
> > +			ns2->last_rumble_work =3D current_ms;
> > +		else
> > +			ns2->last_rumble_work +=3D interval;
> > +		schedule_delayed_work(&ns2->rumble_work,
> > +			ns2->last_rumble_work + interval - current_ms);
>=20
> Does this code underflow the scheduled delay?
>=20
> The current_ms variable is retrieved in milliseconds using jiffies_to_mse=
cs(),
> but interval is calculated in jiffies using msecs_to_jiffies(). Since
> ns2->last_rumble_work is initialized to milliseconds but incremented by
> jiffies, subtracting current_ms could yield a negative value.
>=20
> On systems where HZ is not 1000, could this underflow the delay parameter=
 and
> schedule the next work millions of jiffies in the future?

It's definitely suspicious that we are adding jiffies to milliseconds. We
should probably fix that.

>=20
> > +	} else {
> > +		ns2->last_rumble_work =3D 0;
> > +	}
> > +	spin_unlock_irqrestore(&ns2->rumble_lock, flags);
> > +
> > +	if (!ns2->hdev) {
> > +		cancel_delayed_work(&ns2->rumble_work);
> > +		ret =3D -ENODEV;
> > +	} else {
> > +		ret =3D hid_hw_output_report(ns2->hdev, ns2->rumble_buffer, 64);
> > +	}
> > +
> > +	if (ret < 0)
> > +		hid_dbg(ns2->hdev, "Failed to send output report ret=3D%d\n", ret);
>=20
> If ns2->hdev is NULL, we set ret =3D -ENODEV and then reach this hid_dbg =
call.
> Could this result in a NULL pointer dereference, as the hid_dbg macro pas=
ses
> ns2->hdev to dev_dbg()?

Since we set `ret =3D -ENODEV` when ns2->hdev is NULL we would indeed end
up calling hid_dbg() with a NULL argument.


>=20
> Also, since ns2->hdev is accessed locklessly and without READ_ONCE(), is =
there
> a time-of-check to time-of-use race where the compiler might reload the p=
ointer
> between the check and hid_hw_output_report()?
>=20
> [ ... ]
>=20
> > @@ -3881,6 +4048,14 @@ static int switch2_probe(struct hid_device *hdev=
, const struct hid_device_id *id
> > =20
> >  	switch2_leds_create(ns2);
> > =20
> > +#if IS_ENABLED(CONFIG_NINTENDO_FF)
> > +	if (ns2->ctlr_type !=3D NS2_CTLR_TYPE_GC) {
> > +		ns2->rumble.hd.hi_freq =3D RUMBLE_HI_FREQ;
> > +		ns2->rumble.hd.lo_freq =3D RUMBLE_LO_FREQ;
> > +	}
>=20
> Are we checking ns2->ctlr_type before it is dynamically initialized?
>=20
> During probe, ns2->ctlr_type appears to be 0 since the struct is freshly
> allocated and the type is discovered later during the init state machine.=

> This would cause the high and low frequencies to always be written.

As switch2_init_controller is called from the other driver's probe
function, this might be fine. To avoid writing these values if the
initialisation has not happened yet, we should probably guard against
a 0 value.

Cheers,
Silvan

>=20
> Since hd and sd share a union, could this corrupt the sd.error and
> sd.amplitude fields for actual GameCube controllers?
>=20
> > +	spin_lock_init(&ns2->rumble_lock);
> > +	INIT_DELAYED_WORK(&ns2->rumble_work, switch2_rumble_work);
> > +#endif
> >  	hid_set_drvdata(hdev, ns2);
