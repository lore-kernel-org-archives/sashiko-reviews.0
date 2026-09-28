Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB1E397945
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624622; cv=none; b=UO7cQNHfL5Yn8ypSd6n6UgqexCs6MT7Ay9IAGMdopW0gLjNEJYl55EN8iZWJJJslsS8VlEynB5zQjOqy5hQ2ve1I/+GNKPnjjkNibi8PI1IbzHwJSFfZAkSU7K3tyvlEhX5O9rr0XR3YC2k9iidi7KttNDwX1f60a9y5spn6Ano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624622; c=relaxed/simple;
	bh=hHbJUj9MjIHZzV/WT6UjK867+TXBSMDLnyF5p+XNjqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahz5cqpP5ulA66UoHXEWlevh3dAODAMOkMTlbF99vM4/hxsPrzTpMeyfu2xt1pKQXPt5+31DWSMPmP57CUJtseBvY2JMYgqm7C1tMCkJgv7wFlPDVEelVVOv19DDWaOEVy8uSsyYodA1+bTrkfim/6pLSxDCp+/2owQVn2GQJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ioSl8FDF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ioSl8FDF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so13959905e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 12:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790624618; x=1791229418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxZSOX2/DMzIaUKEB17ch3Vac56Jr8Y6RNEiYe6dpbE=;
        b=ioSl8FDFHR/ZiE1VKL8vJOXlBx+znYQSZ5/j3I4yKBfoW73P/K75RCBx3Tu+8fJpjL
         X0GIqvTH9Ei13skPfSa3qvkV/swDGcnM0eOxhtuUkdEyobBFAS+ohDbOxtRGlEL5+VmJ
         Yfn+W0I+lsE+uG+XTYKO/68ZaSJxjmc2hwPMjaA8Ub0XJ6NoAx0H7pjGbqvi0NQOwtOp
         rfOch9luvsxxrMGK/jSqeEd5HrriQwJYfHfmvB4FmDAoqL/0Y+WZ18S9XkWFsQniAasj
         irQR9WaFC7A/BIVMB3QG/GGYshM9/tY7cYn4HUdTKAByseAfePh8UXaBhoqwsYTwftBJ
         OchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624618; x=1791229418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxZSOX2/DMzIaUKEB17ch3Vac56Jr8Y6RNEiYe6dpbE=;
        b=cDn/rH+H65eakaq+/klOJK5sg/DsLrmDOAcy3EJAOH3Xk6wz1sZSo/1pnMoX30QvPr
         4KXf26DS1zYD5Y3jH7vyy2JGBX7aNqrNXPJWETU3NgU/v6Xk/c5Aqxy4rh9G1gDJh9P7
         6NfheT+3f01uuJrqz/k/i8FJAfF41j/fs/9aIVLn1BzFMi+smsfiCOeEC7ZUiUdxjaT/
         wM82UzeMeBFCj6mPGUYDGuLlotA8I++pJoQGSpKiIkuF9rQjQYS5aRUvgHSMgjSxkQGj
         QMD1GG5DIuiOZjmG8QtZkNeDeezD1ivid/gwRwt2Tc/YQpsP0OoupXdk8iFDtE+ETdOM
         xI2Q==
X-Gm-Message-State: AFuF++nh5S6+oQrfJ7LBrS9KmF7eFYcVnPYKQkYS8v+WthrXd/fn1c9v
	F+ni55Hn5dik5p4xlLo3B5DGeM7TJPsKM5JurG+SObPoVuFKkB8Dp0LW+Ci8/EzuWu2S8I1dh7Q
	5hvcA
X-Gm-Gg: AYBFou0vimmC08wkvee9q8qqn1ZlBiJEirTdyDphpOjRsWIhzatrXfdGkt87GaIaEUB
	g/mZdp5uj++Gr9vTs5DedIV3aDXF1IWWSn/lcAJuTyIswATtA0rteid3Y7Gdpy3mvKao4gdeh4J
	+N+veUTAI1iU1aCqca4cmOeV+BFU9y3hysLqT+UKN5puu+MLYtSKfq9z9GIPN/0ByRnYu54LQ1b
	wWwNmkVJ1/ItRjIoJrLrDP8WpsYlV862YWqyA2m38LZwt7W5Q9+Z2KVgshcx1emTtVBmjJ1TJ2I
	nM8A2R/osoI9AaKEuYfDDVR8rccPqUq5xJdjiTW11Acnppoe0nthRybb2tL0wOQnLrBx2U08o29
	NfZNcwQyZbNqgKcDDG63YGiWO3u3ZvO35aaud0Z0WSmaZQeva/yxIqrnmWtsH23BjHaSFWfjFXr
	kij1XAdoXy0wIlubCUJcRyBwdLm1ij/TbbhT1ZjOCMa8MmuGGK/UNTVlw+ADR8mGkTFh0CZvsPV
	yTh
X-Received: by 2002:a05:600c:4e49:b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-49ff06ed754mr173176835e9.25.1790624617351;
        Mon, 28 Sep 2026 12:43:37 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00cfecb39sm16755135e9.7.2026.09.28.12.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:43:36 -0700 (PDT)
Date: Mon, 28 Sep 2026 21:43:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
Message-ID: <arrCUYnwhK68Q46T@monoceros>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
 <a92a69151266129e20abc4a8ec543d4f4438324e.1790612298.git.u.kleine-koenig@baylibre.com>
 <20260928165818.69F321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e2btm2zbxiwiyxbf"
Content-Disposition: inline
In-Reply-To: <20260928165818.69F321F000FF@smtp.kernel.org>


--e2btm2zbxiwiyxbf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
MIME-Version: 1.0

On Mon, Sep 28, 2026 at 04:58:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] device: false kernel taint from internal driver_override usage
> --
>=20
> commit 224a6c2cd832599abb4180f63153f96e5c11d2a8
> Author: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> Add TAINT_DRIVER_OVERRIDE for usage of driver_override
>=20
> This commit introduces a new kernel taint, TAINT_DRIVER_OVERRIDE, which is
> applied when a driver is matched to a device via the driver_override
> mechanism. It aims to distinguish overrides from manual sysfs bindings, as
> overrides can lead to driver crashes if the driver expects specific match=
 data.
>=20
> Link: https://lore.kernel.org/driver-core/DLIL9H50MALI.3JROXYEEUM3KU@kern=
el.org/
>=20
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 879eb758b5eec..4dac5e09b74c1 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -905,8 +905,15 @@ static inline int device_match_driver_override(str=
uct device *dev,
> >  					       const struct device_driver *drv)
> >  {
> >  	guard(spinlock)(&dev->driver_override.lock);
> > -	if (dev->driver_override.name)
> > -		return !strcmp(dev->driver_override.name, drv->name);
> > +	if (dev->driver_override.name) {
> > +		int ret =3D !strcmp(dev->driver_override.name, drv->name);
> > +
> > +		if (ret > 0)
> > +			add_taint_module(drv->owner,
> > +					 TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
>=20
> [Severity: Medium]
> Will this unconditionally taint the kernel even for valid internal usages=
 of
> driver_override?

Well, if you assume there are valid internal usages of driver_override,
yes. I think it is possible to not need these all.
=20
> Many kernel subsystems and drivers use device_set_driver_override()
> programmatically to force driver matching for dynamically instantiated de=
vices
> during normal operation or probing.
>=20
> For example, in drivers/clk/imx/clk-scu.c:imx_clk_scu_alloc_dev() sets the
> override internally:
>=20
> 	ret =3D device_set_driver_override(&pdev->dev, "imx-scu-clk");

Here I think you need to change `platform_device_alloc(name,
PLATFORM_DEVID_NONE)` to `platform_device_alloc("imx-scu-clk",
PLATFORM_DEVID_NONE)` plus maybe create uniq device ids (using a static
int that is increased for each call).

> Since device_match_driver_override() cannot distinguish between a userspa=
ce
> sysfs override and a legitimate internal programmatic override, won't this
> cause production systems using these platforms to falsely report as taint=
ed on
> boot?
>=20
> Falsely tainting the kernel breaks the reliability of the taint mechanism=
 and
> could lead to valid bug reports being ignored by maintainers.

Best regards
Uwe

--e2btm2zbxiwiyxbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq6w2QACgkQj4D7WH0S
/k713QgAuYGFOD8zr18eUyBJO0UxhmdDG/wvrKbHotQLYnJ05hM07+9ENNV9iLQw
o8IjBj0j0INhu9NrJsK1YxH8yyIbSt3Gi8eZjJVfO+blKFQKucdwAG3/532WaN2P
4VJuA3GVG6z656qY4omCJgleHpjkOF1xx17TkdzjnXj3p8ne1h4vt6JTyy9xNW24
frVtuk/Llje62jDIq6ZtnEoeyddBiqcx94t5OITmnr+LXXKhmmFKwypHO08sNjck
/y51XSz0Hv5lBE+mgLF8JoMAwB+D1Xg/liZs3XTZ14H6ruLjuNMK7m0LtXgTpOru
42UhIyXsoV3uE4dIkAvsa3WZCf1Y3A==
=rjkE
-----END PGP SIGNATURE-----

--e2btm2zbxiwiyxbf--
