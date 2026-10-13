Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD051CF6C
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905751; cv=none; b=Jchc4Mkpjig6Q36Y3YynwydAuiaVhY+E7qiNh2mXPQY660RrbCi54hHWrB8DCRC1MvjPjqJiJl3nQpjDGmHh0aZKxKTIF+qBreZeIS/NeiTrX8w8Uyih6ec1+69NB6On1MBMzBmuXJAu5K4g4ZXLl/JKc4dH7fNBBo2Jm1irdD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905751; c=relaxed/simple;
	bh=HHcZ/SxDiz+wG4Gov32dCFRx8RB0aAdaUhBhSd6JJCI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PkOsZVc2VTC5r/x62jc48WWIyc+Uhy3WWcZgLvaZdMIfeNWVwRpH0QfpOd5MzIYWEzzsb5ClR5LSXBmXCdtywQyIHROoFFYEuLg+OUdscdGyVo+Gwj5B9/n8HoVPGX0iP9f9ijXWsfvUJwnnDHXaFb2fAKfrVk3NR0EArxCw2fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZMjVsRfS; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZMjVsRfS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8C31C653F0;
	Tue, 13 Oct 2026 15:36:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 019D760362;
	Tue, 13 Oct 2026 15:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15A9611D717CE;
	Tue, 13 Oct 2026 17:35:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EraYlQSOG3Kmw8zxzgg1U+mxAvQiXdVcq1oNRQOWmLg=;
	b=ZMjVsRfSESj9Y/TlgYyp4BICLyGyzJ6ramQT4KbdED3XMtfcOVlSuXQsddgTDjuph5mXh1
	yjzG0SpSMxxI19ddIQsEXkHqMM2g//4BdZQxV40pEv/plj+y9+mfN0Htz6Qy3n9uACDbQP
	fRyQ8WQ7pb06QBhir0WZlaHnF+1e1CF4kP6Hx1e2gFx+4Gdw2va7OZx6hNxOGLkR3JTOSN
	e9326crYH896IlWB6sIQkQxP6cfnW7NRhjN+FcXDIL5HhPuwqVKdg3iPvi6s1RBSjCKUvc
	2EDidiCK2PGHRuJ4PI9sAweZKBWQ1cMKVki+3QQetBrxKqOlqvMvF2r/9LVEiQ==
Message-ID: <e6772c3b70828bb9aca7f3b1c24d4a03107728a4.camel@bootlin.com>
Subject: Re: [PATCH v2 3/7] mtd: spi-nor: Add support for panic writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: sashiko-reviews@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Miquel Raynal	 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
Date: Tue, 13 Oct 2026 17:35:33 +0200
In-Reply-To: <sashiko-outbox-169903@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-4-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169903@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Sashiko,

Le mardi 13 octobre 2026 =C3=A0 14:27 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s)
> to consider:
> - [Critical] pm: spi-mem: mishandled pm_runtime_get_if_active() silently
> breaks panic write
> - [High] mm: spi-nor: panic write allocation uses sleeping GFP mask
> - [High] spi: spi-mem: panic write fallback path sleeps on ENOTSUPP
> --
>=20
> commit a1f9f053470ff10fa10c133dc5aeb0827bc367a1
> Author: Tanmay Jagdale <tanmay@marvell.com>
>=20
> =C2=A0=C2=A0=C2=A0 mtd: spi-nor: Add support for panic writes
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 If the SPI controller supports it, provide the functio=
nality of doing a
> =C2=A0=C2=A0=C2=A0 panic write.
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Update the spi-nor core code and controllers to make s=
ure they won't try
> =C2=A0=C2=A0=C2=A0 to grab locked mutexes or sleep when doing a panic wri=
te, as preemption
> =C2=A0=C2=A0=C2=A0 and IRQs are disabled.
>=20
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 2509fb983d4f2..281acc54b3245 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
>=20
> [ ... ]
>=20
> > @@ -2196,6 +2235,7 @@ static int spi_nor_read(struct mtd_info *mtd, lof=
f_t
> > from, size_t len,
> > =C2=A0static int spi_nor_octal_dtr_write(struct spi_nor *nor, loff_t to=
, size_t
> > len,
> > =C2=A0				=C2=A0=C2=A0 const u8 *buf)
> > =C2=A0{
> > +	gfp_t mm_flags =3D GFP_KERNEL;
> > =C2=A0	u8 *tmp_buf;
> > =C2=A0	size_t bytes_written;
> > =C2=A0	loff_t start, end;
> > @@ -2204,7 +2244,10 @@ static int spi_nor_octal_dtr_write(struct spi_no=
r
> > *nor, loff_t to, size_t len,
> > =C2=A0	if (IS_ALIGNED(to, 2) && IS_ALIGNED(len, 2))
> > =C2=A0		return spi_nor_write_data(nor, to, len, buf);
> > =C2=A0
> > -	tmp_buf =3D kmalloc(nor->params->page_size, GFP_KERNEL);
> > +	if (nor->mtd.oops_panic_write)
> > +		mm_flags |=3D GFP_ATOMIC;
> > +
> > +	tmp_buf =3D kmalloc(nor->params->page_size, mm_flags);
>=20
> [Severity: High]
> Does this bitwise OR successfully remove the sleepable __GFP_DIRECT_RECLA=
IM
> flag?
>=20
> Because mm_flags is initialized to GFP_KERNEL (which includes
> __GFP_DIRECT_RECLAIM), bitwise ORing GFP_ATOMIC into the mask does not
> clear the __GFP_DIRECT_RECLAIM bit. This means the resulting mask still
> instructs the page allocator that it is allowed to sleep and enter direct
> reclaim.

My bad, it should be GFP_KERNEL *or* GFP_ATOMIC. Good catch.

Cheers,
-Paul
