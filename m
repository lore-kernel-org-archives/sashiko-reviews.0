Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820987;
	b=uvv6t5O6roYvAC6ozLwtGKLZbvoWU9pGBIYPiwix4sB0mKFOdUzqsz3vf33GeZbvtEWu
	 I5wI2ZpmVwPRXL6U8/e5o9CCBGo7I6j7kQEiROqu42ApEnkwgxyou6BS7rv0x85UDk4Ri
	 A73lDQ98jLpqK805MPiAX4BRmhK55Dm07AWgIMyZE3FsD30kzUF9rxOluFWfQt0i1j3Sp
	 g2br8qVQFYOyI0xU16NJPv+p/Hka1NhwytRHs8vkkULi7m5f8P3qLnrhvSC/i9APlM8B8
	 L7Q6j0rR3uzPZFL5GtIeJSnglA3YJJGMcrr5l7m4pk+Nfb+ZZEz3Xvz27dz8oUONllw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YWhHL4Z55ZERzg9tKG/xVm8foTsP3l20UZqMYcMw7LI=;
	b=BsTdWjnpP/3eB9vcYZ1M3pzE+YSjwTpnnGh+X955Q/OdukVZLpAelYnhVRsbtDRRY/aX
	 YYvfI4D93vYnLtv65QZ+ArA5N6/SMv4xqrdktPNheb6zRGgICW20u1Qwxp9Gw+K4tZA/v
	 bW7C1eOrCPMflWcShI9YaAkFiIceC9X78QkQA2TkHFYa5uYhCJVp4A1T2wpf31yDet0kX
	 DnyGw2VloUc8qOQHukrzYFr4X9aYvhcWVYxc8oG+sK55KGwsNWvMPmMPDHU6kOwO1gS4G
	 KM11fUxUk8HmEi/IfmGmutNy0mtz+uOr3/yZAzlkbt8JrDKniFueyCGIXf1Qa4uOfmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ebsREhQV;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F60606A885
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 09:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F60606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ebsREhQV
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so18369675e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 01:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794820985; x=1795425785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWhHL4Z55ZERzg9tKG/xVm8foTsP3l20UZqMYcMw7LI=;
        b=ebsREhQVnCnp/ZqMXH/mucnonS+P9GiSHP2cfaaB242QNTa3U67u19iALc9i6vVMsE
         XvO9n4VU7P7Eovr6yrsu+hmz7tfFolFTo4R5o+EvwP5z989UbWf3z6FvY+wpVimey/E1
         rN7PCKoQbsndchi6QT22NWwWMykUFhlBQPimxxd3qiR7oYoGCmlvitouoOIyTTHwzWBy
         mQcsWkziqEZp3KGszP4TvpEY6Yd+bucJwGQYIQcFetuClGKvviGjeSqBH2kH7IfJZ4uc
         1je8SlGT8KpLrPWE8eugwI3QXYviyo0ULylcoFyb6VApParAs0IkZdjJ+dLXub+CCbAp
         IpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820985; x=1795425785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWhHL4Z55ZERzg9tKG/xVm8foTsP3l20UZqMYcMw7LI=;
        b=L1lWaLbAji1yA4DavE/XyNKliS2+Zjc3pI5itdZqTjBMrpebBaIEYm8SPvU9sBpPes
         JLM4Waoq4SrVN/jVfaUvZIovZkMY+T28ssulHqNSqVPRV/fdTIZ6/Bs4PjwISyOLADG9
         mafXOeoPNVWJJjlWzn7WnqYVxIEtZyjrrND6ZxotcgE4u6PWD7c39yPiYXXogxCLP5KW
         oAbgfZF1R/m5bom9KdoZ7XGXik6oVn406xsNS0yeaFGe2S5m7oey+41BlCVXnYIPzqE7
         OfnclGhKfYRtWnA4AyOtj7ftTdK+RD5BPv1UOLyfgBHqTw6WV9J7UouhYXbWZj2TzIs9
         WpoQ==
X-Gm-Message-State: APuU4Z8tbjtzn9VOwM2sZ71+L/++CWusK6ePX5bdxhgpe1AlCYDrEuix
	P8NnIxXwt6mGu63LrcrtCeFBnxpoEz2EsS7WQFuObBI2wKcs8PapBi0NmHPvtddIHJhUsluNkoK
	nILNB
X-Gm-Gg: AYBFou0/GYnYvnmoxWYE1kph5o/L2mUp6bYb7gx3QymTXMpmJnAKvInSaCSnl5+27J0
	8ecmrahbHDhIqZUMaz9plWJ4oJxWeJ9VSQEUmEZnDAENxM+BQ6OUn7fnQjSMpf/KvG6YWVewZ4l
	sqcpOVzPJ82U4QLgt8A3/BEqwykmUBOuqnMb1vqJWMzx3TRgebrFS9Zm8eRcclbKukEMiCmDD3e
	s99TZ3NCjJbwQMALrjdNHSjlakW72ZsHjGgGW0EN3IOi+t47AU0rjW1CBf7G4H8xOG7vymDqpnp
	5FBAIPqjhWeZtE04le/dM1Yk/KydmWlFqK1EL5ATm1/koUXGRu41Qx+Yo5n3nSTm+kyw8m5R6tC
	lRzFri7ZDgmFhyoznHaH0xpY5+zHHVzg7AalwXsrW6cY9g6HQC5Dp0MvKnTK2KNT0FStUbz7Ef8
	Fg9/Lel3exqXbN8VHx75dc/06AkP80T7NuMowK7dADYfB9kpeJo0nH4TVcSQUpmbd5OhLfvyVXk
	kcs2DQ6ptitQpzt9gw2BrJQ7cNYfnRxtBA5IDu7uRQ2MnApKx+jOONXgPK7GVTY+S96DwEm2zsv
	8CdPu+52ajWERgIrUhTdtEwPgTmkBXRdSXCZYG4OsBoD7ZsNOJ55sgGoG8Lcxg2Mp+pElqod/Cp
	uf0mua+QZPBpO0BXv
X-Received: by 2002:a05:600c:8b82:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb681476a8mr117276055e9.25.1794820984666;
        Mon, 16 Nov 2026 01:23:04 -0800 (PST)
Received: from localhost (p200300f65f19a9042c263c0c153a4e28.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2c26:3c0c:153a:4e28])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb69ac4e16sm101563665e9.0.2026.11.16.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:23:03 -0800 (PST)
Date: Mon, 16 Nov 2026 10:23:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Vincent Mailhol <mailhol@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH can 1/4] can: c_can: c_can_plat_probe(): reject devices
 without match data
Message-ID: <avrJ54bCPy5K1QcJ@monoceros>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-1-2d82025e9646@pengutronix.de>
 <sashiko-outbox-214574@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3pek2dbhbnp6trdu"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-214574@kernel.org>


--3pek2dbhbnp6trdu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can 1/4] can: c_can: c_can_plat_probe(): reject devices
 without match data
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 01:33:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] can: c_can: c_can_plat_probe() rejects c_can_id_table matches
>   with -ENODEV
> --
>=20
> commit e910ae3e03adb41c30f60d29d9b4c11824109fe5
> Author: Marc Kleine-Budde <mkl@pengutronix.de>
>=20
> can: c_can: c_can_plat_probe(): reject devices without match data
>=20
> This commit rejects devices in c_can_plat_probe() when
> device_get_match_data() returns NULL.
>=20
> > diff --git a/drivers/net/can/c_can/c_can_platform.c b/drivers/net/can/c=
_can/c_can_platform.c
> > index 75607b1afd2e9..b6012cd713cee 100644
> > --- a/drivers/net/can/c_can/c_can_platform.c
> > +++ b/drivers/net/can/c_can/c_can_platform.c
> > @@ -266,6 +266,8 @@ static int c_can_plat_probe(struct platform_device =
*pdev)
> >  	struct device_node *np =3D pdev->dev.of_node;
> > =20
> >  	drvdata =3D device_get_match_data(&pdev->dev);
> > +	if (!drvdata)
> > +		return -ENODEV;
>=20
> [Severity: Medium]
> Does this reject non-fwnode platform devices matched via c_can_id_table?

It does, however there are none of these since commit 17b6e0280f31
("ARM: OMAP2+: Drop legacy platform data for am3 and am4 dcan") from
2019. So a useful followup cleanup is to drop c_can_id_table[].

For now I suggest to mention that in the commit log. (Though if there
was such a device, the patch would make the probe function return
-ENODEV instead of dying with a null-pointer exception, so it doesn't
break anything that worked before.)

Best regards
Uwe

--3pek2dbhbnp6trdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr6y3QACgkQj4D7WH0S
/k5RWwf9Gv31XqqZPH4JwPX0KHpiAWhemgaE+bJBp8OfyB7SHjLqs+vVF4f0k9xR
tB6TOxR2DgleZZtVTyGND0yJZBnAPUZ3dEdtpO/iPvw5cQuDpvXa6WrfPxfWXwdj
sorQpgF3MTv+tQZPqnSgDPeiFe51IYOlBffvNgc8dt8Gz/S4r56KuU/QvgDRPITL
137TDJ1YIEvnBZLUTSHdiuqP9P71IxU/JOqrfXjPHaxv/T4GfnzE8d+KJJ4QufF1
zNkvP0MYgOTGc+m2sM7RtAfjmNwH1KI3twQ85DLU/eRYk16XdCAyHd5NuBKY1+tg
AYWr48nYYZ4s9jRhPmcwSFNkjHQbrA==
=wbMo
-----END PGP SIGNATURE-----

--3pek2dbhbnp6trdu--
