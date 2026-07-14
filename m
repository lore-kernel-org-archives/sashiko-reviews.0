Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5503F926B
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016583; cv=none; b=Bwbw6NNhtXeEcezeJP9qzIJ36DUqQkEflhk27jHti47AAmodb9hD6KEJLX/zxwptXkQRuAWY+YHilMfBaYyvt+qRuOUAHP3hSL0ZvdYCBz030MRZ+jMX+ESotOcTDvzUdDw2jeWzKiy/VugBKg2Bao5x9TtFT//AD4QYVNuzdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016583; c=relaxed/simple;
	bh=CSopGfg/2uqJ9qyI6V5MUClcNoSB2YHdurPLNoXQC8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/Uwb2b1qAJ6PADLRIqShJG/80XlstAmRMpOWXGY4feJ4vHiT89J4//VoYSx9mvAQKVAnXodg95S2pDJb2ByYjWbsZCYCi6Q50lgiC4DBG+seW5EYc8YgwpR5Y8KVyXWcKZ8fhRIt7zFO/HNaSUq8APO3kFmMay6IEP2GJ/qciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=abdjSF3t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="abdjSF3t"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so15937625e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784016577; x=1784621377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aM36wlhWe5Za+7EYg7RTzmmHOw7LMbYpoEaZIu5nkYI=;
        b=abdjSF3tTGi4TsIzv9XmbMp0DFlCUg0Q2zOZXtyCvwQW4utCvP8gqbomHCkDm2EWWT
         JzMCYwbnJvZSRyJPogD9yP7wjvXmJz4lTUBxl02kBorUdbNC5DlhpVlZQzoQKhS2dxcI
         JsLJtVMHyr4Tl3z3daXJVfz0GRqw8H1gm6NZAzul+FiAnszQtjQ06BbZWFKeLxkxxD4u
         +FF4BBaYb5uCiJLtYHR4H9eozebz/faTjB/nzlUkhJvopNV23oc9iPESynx4BNi7r6Qd
         yJbY8EorNhd2puSGk7iGPu5kccjGxv42UglmC90m6ej9Ft3Lj9DpY3DjBkmvjMn/tlQp
         vpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016577; x=1784621377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM36wlhWe5Za+7EYg7RTzmmHOw7LMbYpoEaZIu5nkYI=;
        b=htXAG+aT8c8v2qYFlO/pP32HFFx7/PkVUYESF9XoBa23XLUon3RzD/OSdr5cCqz3/8
         5kZGxmOeZV7evA1rjPWY+c/Td028CPwdd5Y40qkCBOz8+mLg8PPZto920WDgejHge9Zf
         4pLNGNzLvUTLuV5PGHxxy4CS2DE/xAS8Ven6DW4DZsKocWPZwA8xz/vXuTZRvZwmfS5l
         5khMDMhu/JPdsipfPd/0UQ0b9NoDdAOeNJ3aU1OLFlWOTpnTpxxToIJxK9A0YmnVJvP+
         HgT2KGj2BoGlIvC6Iq71Ifro+7QQ7dp96ZHPI2vNdPVUP1t9IJZZXbm6tCtdZy5MtkGA
         Epag==
X-Gm-Message-State: AOJu0YycOEbAfQVThKeRPnw7tVT3YLHK0F/rTrEYjIgfLuEcNytWT62P
	zb5iOeDofOkhE+CNQFYOkRKYloVDDpeQlGsmTbANnokA7ta1ITwp8mnyLW5vjQ1G7MVk/dtuYeQ
	2Sy+V
X-Gm-Gg: AfdE7clhbUwgsMqNy0BZsSpflx4Up5jV8lk9XxBlcyHqj/LPNug0ZYSrH/YzWGQVD20
	FmTQ4pWLp/Ilx+dgtcYB0X6XTm1n8ZsczX7NsUBPJRi7dWwtPLA4iFUAhmeuI07NLht4NCZkG9U
	nd+F01g00omeh6RgW9Jala0CXfXPcGXGIqTCp7MndnN+6WbahA4nNCOQYe0vHunBFY0+8MTWJ6B
	M1K8BFI0zWADAVM/rJLZcgGgK/QNKM5LCguJiu1PJwSTznzn5pJu44NvzkqOi/J4AkeepEeHDun
	q2KgxfjD1zj2epLJpQLXkk3k/AvY/nWTtgLB7rAWaklfB2e7hKv1gUH40WqVNmz6pwI6MdPmUVg
	fIEhXNR2aI3QIIn5jQJgVxPTVLUNTcMXOp4qRId7aaUvb25fM83hPUVAKTM4Rs3QF0iYygvayKt
	WrYqbWT2snqKMLfQIWRNcEfZacQBq9nS4CxWNTtv8eVBG2hi5PsdjvavpW0/i8Hsx7A8RlpqfDF
	z1l
X-Received: by 2002:a05:600c:6304:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-49485739980mr44250605e9.34.1784016576650;
        Tue, 14 Jul 2026 01:09:36 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2f9402sm61598235e9.13.2026.07.14.01.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:09:35 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:09:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
Message-ID: <alXtMOwKmsfM0LDE@monoceros>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
 <20260714073425.CA6181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="db73lwnkw6hdook6"
Content-Disposition: inline
In-Reply-To: <20260714073425.CA6181F000E9@smtp.kernel.org>


--db73lwnkw6hdook6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
MIME-Version: 1.0

Hello,

On Tue, Jul 14, 2026 at 07:34:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Missing MODULE_DEVICE_TABLE export for the mpc52xx_simple_gpioch=
ip_match table.
> --
>=20
> --- Patch [7]: [PATCH v1 07/20] gpio: Add missing OF module annotations -=
--
> commit 292bbbdcede3ce86fe1309d514a852f272c27bac
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> gpio: Add missing OF module annotations
>=20
> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
> > index 00f209157fd0f..2c828bc922ae3 100644
> > --- a/drivers/gpio/gpio-mpc5200.c
> > +++ b/drivers/gpio/gpio-mpc5200.c
> > @@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpioc=
hip_match[] =3D {
> >  	{ .compatible =3D "fsl,mpc5200-gpio-wkup", },
> >  	{}
> >  };
> > +MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
> > =20
> >  static struct platform_driver mpc52xx_wkup_gpiochip_driver =3D {
> >  	.driver =3D {
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but since the patch focuses on
> adding missing OF module annotations, should it also add one for the seco=
nd
> match table in this same file?

Ah, this is snaky, there are two drivers in that file and thus two
of_device_id arrays. My script only handles the first, so the style fixes
are missing here, too.

I will wait a bit for further review and then address this in a v2.

Best regards
Uwe

--db73lwnkw6hdook6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpV7rwACgkQj4D7WH0S
/k4XaAgAr47ojbzXcjqsjF1FttUvP817tdDTOildKlkxSlYP4gIjsiIubgQYdwg7
MpSLhXX5sDIJmMklwzM5pALU2Ct5LQu6t/1MjKG6XHftyRj2LwgKbU2FbG2NNn+G
JAQs0CdGH4mfmhux9mvhe39b0V4h5S3bpRe1lA2Iv9ex/dGL4bNEto3cM7QD31Ap
FCw8wFkpbaZbBBppVbdK7o5utKerY5rA2f7Ns2vVPkLNhMx9ps61j4d8FB2BKaoJ
0rPe6NVzC81WjsrwZUhpwUHucCbjsqHGxQrl7j3TaX77dy5pOXi9WxhTGNodm5JR
z0Im+LrSjd/VfmFscgr6z0IU+KWrhA==
=3L74
-----END PGP SIGNATURE-----

--db73lwnkw6hdook6--
