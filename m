Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0493E559A
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482306; cv=none; b=MBElm9/snZ7fB3iBa1WQGANw2gBVuuu3J0Y8lM+BMLabgMrW4h9C5NSzXkF8uXpyLUmG3AaViAtxfDKwyA7gPi+ExXlCHjWY8nlYVj1C+lt0aoW4NnGQkQMbDZdCHp6C6b9f4fA5+TW/l5UqcZWgbsOsXcl+nE436eWB+s+t1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482306; c=relaxed/simple;
	bh=/WCcy2mMxh3czGC0dprku4jfYTdMIC0iKhzoyaVwlFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5GaKD/vp31G9P9/irnwmLz5K6Ut1mPQh9dDhlnxueohUAqpa7M97Xl1aoxpOtNb96d8dtPZHGbtPzLoKw0aHm9lP6qZePMN9LjvetkQi+jFm5cdOnA0eaVTtS0SWx7QTMTaEf5+ofyug/ePAfNCkJA68hJsj7V1x2IkKeYk1yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ouNDgKLp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ouNDgKLp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so9906525e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782482301; x=1783087101; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYBimURlHUn+mpSz1R9LJBKjen+CWJXOrvIJURfJyEU=;
        b=ouNDgKLpy7UHi97aRjBZZOlneh+n9yhfSjgthcYCcxXyXbYcbWFPPuO8noUmZJiIEj
         T6j2Omju97l5BHFxxQQldiQ9f8W97N8aiIAr2c2FIXuVAIQAv0fUBeyZsp+slmtkdLXj
         a7KXMbSC+2TIGG3LiajN39N3ipA3tzgrVuRQiCY+A+WniPRFySvawDaoVVTmJ2kQhraq
         VnqKCm/fOomd8KYRaKcIYvVQ2u6pp2Zh0V+qJNcJ8ZAn++J8SRpjl7velmc74hg7gRBe
         89hNjDxRxDcYinAx830TTkge8SSmCNm7q7EYoj623M/f1WA3Ok/EugDq2qqj73K+wHBk
         74kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782482301; x=1783087101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYBimURlHUn+mpSz1R9LJBKjen+CWJXOrvIJURfJyEU=;
        b=LAFRQbWVgVpAffsWAQ4PWmW7l1P8kVPt/d8/x/tFSDOwXTA+uib86qF/B5HjhPol1y
         EuyTbk/Mv6Pju4whYBHzK8EIuhg4HSJBrevZalYfbyiLVdh3aPDdvGMTvBz5/VDANVYM
         psX57yRvf6S3SXOxGLlsmcYmYpPmS4wbgLTWEp8dIYPC5LpPYZV/vZijk3JOoTXiYWPj
         sV9ogwgcNcZ0InGBh3lKpZ5yM/whk/eHdYvmsxsZu2hUMJi3oE8riQpUSR0ml+vSyZoB
         XNjDK09baDLfuvQTTmfk5+kf5SXYVMnUa/3nR7XvTl5JNqJhkZWFrYqONMm1orwoZTlr
         ZIcQ==
X-Gm-Message-State: AOJu0YxaIXrOhtbaRyd/TOL5b11ZE4cFN48x0jY80gcXtYr2l8OZuBn0
	LhS4pWm4UPnnOcoecmeJ39lzwqEyng1JoTjdH0DY7hZKUP44uMdmxADtjJC0QPYBeksLG5/XD55
	Wugyc
X-Gm-Gg: AfdE7cmgEShiC3timcORtuVmzcmXa0tC7v7eeDhd1S7nZzFsbXmYTejXEu5QVQqW8xd
	6yjq7Ine/xx4dIb4eLxBxA3HflWId2hdvyqBFi6ftgH52OAV6l9z1XWyE0SLsmJt9S5b/DTrqdA
	+kdSBI1V3vnFriu0bb7Q4b2TbewL81hgJmBUUmTLz0mJYi7FcYm3SP0/TJngXO4EL+uGmP8J762
	QqakgQPVnaQz7MvhCeL44Stnxy3K0wCUAeKFXamqG/X6MR4HP9R1+939M/sbKa4tExIIFhPJo4p
	+zChvjHOGE6JbO615VkiJvad+NMNKJV8E6+J4QCP0o7qRl1jZ+CZyL8eiNjwrd+cwdvLR82eb1n
	YOz8YN5R/UQjw/yeL1ruLdkQGXhi4xq/HpFoo6XaFmABy0oe0Ma08IKF8Re09MRDhAWWUBX508b
	VUKoTuhZKBplR/vteH1GXZXITYrLPYndrDzZQEupGznNEoHrMBZbsQUepTDGlLAN0Ay7tuOnD0B
	DZi
X-Received: by 2002:a05:600c:a403:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-4926689207cmr87782145e9.18.1782482301348;
        Fri, 26 Jun 2026 06:58:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c27fcdfsm53888345e9.1.2026.06.26.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:58:20 -0700 (PDT)
Date: Fri, 26 Jun 2026 15:58:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Message-ID: <aj6EzGn2Ds2offEc@monoceros>
References: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
 <20260529110229.9474D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xs4ntcqafh3l4ivh"
Content-Disposition: inline
In-Reply-To: <20260529110229.9474D1F00893@smtp.kernel.org>


--xs4ntcqafh3l4ivh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

On Fri, May 29, 2026 at 11:02:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The explicit `.driver_data` initialization `TYPE_MAX8998` for `ma=
x8998-battery` was silently dropped without mention in the commit message.
> --
>=20
> commit 02f2c38ebeef8dff34934050c70916818fb36a18
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> power: Use named initializers for platform_device_id arrays
>=20
> This commit updates various power supply and reset drivers to use named
> initializers for platform_device_id arrays. It also unifies spacing and
> comma usage across these array definitions.
>=20
> > diff --git a/drivers/power/supply/max8998_charger.c b/drivers/power/sup=
ply/max8998_charger.c
> > index 418b882b163d1..b0eda2b51e7f0 100644
> > --- a/drivers/power/supply/max8998_charger.c
> > +++ b/drivers/power/supply/max8998_charger.c
> > @@ -188,7 +188,7 @@ static int max8998_battery_probe(struct platform_de=
vice *pdev)
> >  }
> > =20
> >  static const struct platform_device_id max8998_battery_id[] =3D {
> > -	{ "max8998-battery", TYPE_MAX8998 },
> > +	{ .name =3D "max8998-battery" },
>=20
> [Severity: Low]
> Is it intentional that the TYPE_MAX8998 driver data assignment was dropped
> here?

Yes, it was intentional, but that change doesn't fit to the commit log.

The driver doesn't use the value in .driver_data, so the change is fine
in principle. Given that the patch was already applied, I think it's
fine to keep it as is, but of course I'm open to respin with that detail
fixed.

Best regards
Uwe

--xs4ntcqafh3l4ivh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo+hXgACgkQj4D7WH0S
/k6jhgf/Q3MgW/5Ove9zmOEESBkVHo1SCbxx6nWy8QX8dmvjpdl+RdVZU5xFML+1
Brut08xdhimi9SlqRNUJgr/fx8JPw6xoioNua4dp4WMHUq5gSF01/q9hcb9E9DT2
6Et1r2jIIBmiP1n8xUBMzNZBPJo6xxLCrrNazcv0k/SikarAYN13Q5qzy7Ne1hs/
k3YDPctRG3L0b3EsKT6EBjEIYRb8k/6VZ7DXkHwDNr8Esd3a7RaJtA9Q2asuul9n
Nb82sJaM+4En2s7JaYc1rFIKuMOcXGg+EEY3PDbj+pPjDAcsKP/TCxaEMgZqNUg6
eRpQR74nP96QqaCP/pQln5tD+KKgZA==
=OSso
-----END PGP SIGNATURE-----

--xs4ntcqafh3l4ivh--
