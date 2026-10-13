Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725865304A2
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905395; cv=none; b=o65JfZht7Hc/r/u8oprjFtXyjICYVsbTMrrcWLCzXj3s/VtyIt1f44oHzd50WYBqIQ4RgAkCft+JGkCvfYxCqdajkO748qi4fvh02BEr8uoghxAcL/sv24XB2V/p4TLHRqvEZkQH9v2XLilNuiDizDFtT3QBUhYvCcnCRmsfkAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905395; c=relaxed/simple;
	bh=bfCRLRHl+YNSltdKq4Rd2FAFxC2Qahj2ISByXrAyGcg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVSS2LNB28+wkNyKP1IzEZuudkwUlQkiE/GSWPM+6nAQAEoboU0GMuy9zK2R2tusW7uE8s4SYS23wKaAW+4akJIMF+GIlc+wBGJfN+KdwUSlsDxxx07p9JfCS5kQf5VyzPCZH9YdFuzAcydHnKQGHnPc9L3jNnmUfsVFuaQWnHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fpCWDA7G; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fpCWDA7G"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A7B654E4120D;
	Tue, 13 Oct 2026 15:29:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73E8E60362;
	Tue, 13 Oct 2026 15:29:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E5E411D716D0;
	Tue, 13 Oct 2026 17:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P/nWjSBdkKSblDwKpRFQB9IqO9R3gTyrpmyYCQVnZdE=;
	b=fpCWDA7GLpniLZmDeKe916+BkIHrnGUnPTvAbKqk5N2p/G5/78/2au5FbTfgd7zcmBfJHJ
	HxSRTjmEgeT6r1lpTZqEpH512OSVYYJYnn65yP+nHtcWbr2tCaggl8ybw0OANHVyv3zjjE
	S5lEqeSdsq/u48pzymNnNSUCyVnH+EAYKYHnhAHm6s/CruyL/NJJfo1T/Kq6wYI8j1p1cR
	mBD3dQ0KgksmghfORMdBTE96bOo/S9rPPtUv+mx3nLTNspsUWqO5FtadD/neSQrnnuzcdL
	ZdoTWPGAT555IknknlLgOBXuIOb0kK6DU+Jq8XGEjhI6UX8p5mT9Jw/4zJDgKQ==
Message-ID: <5ce5ffcd7c38e4fe9f972937954dd177fb631bce.camel@bootlin.com>
Subject: Re: [PATCH v2 2/7] mtd: spi-nor: Wait for NOR ready with
 poll_timeout_us()
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
Date: Tue, 13 Oct 2026 17:29:36 +0200
In-Reply-To: <sashiko-outbox-169912@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-3-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169912@kernel.org>
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

Le mardi 13 octobre 2026 =C3=A0 14:30 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [High] mtd: spi-nor: 32-bit integer overflow in timeout_ms * 1000
> --
>=20
> commit d88f329aca4b57db5e4ba0a0fc748ee4d7440aba
> Author: Tanmay Jagdale <tanmay@marvell.com>
>=20
> mtd: spi-nor: Wait for NOR ready with poll_timeout_us()
>=20
> Instead of polling for the spi_nor_ready() with a custom loop, use
> poll_timeout_us(). The sleep period between two polls is set to 100 us
> which I think should be fine.
>=20
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 8bc117b46e028..2509fb983d4f2 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> [ ... ]
> > @@ -712,29 +713,21 @@ static int spi_nor_ready(struct spi_nor *nor)
> > =C2=A0 * Return: 0 on success, -errno otherwise.
> > =C2=A0 */
> > =C2=A0static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *n=
or,
> > -						unsigned long
> > timeout_jiffies)
> > +						unsigned long timeout_ms)
> > =C2=A0{
> > -	unsigned long deadline;
> > -	int timeout =3D 0, ret;
> > +	int ret, status;
> > =C2=A0
> > -	deadline =3D jiffies + timeout_jiffies;
> > -
> > -	while (!timeout) {
> > -		if (time_after_eq(jiffies, deadline))
> > -			timeout =3D 1;
> > -
> > -		ret =3D spi_nor_ready(nor);
> > -		if (ret < 0)
> > -			return ret;
> > -		if (ret)
> > -			return 0;
> > -
> > -		cond_resched();
> > +	ret =3D poll_timeout_us(status =3D spi_nor_ready(nor), status,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100, timeout_ms * 1000, false);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^=
^^
> [Severity: High]
> Can this multiplication overflow on 32-bit systems?
>=20
> In spi_nor_erase_dice(), the timeout scales with the flash size. For a 25=
6MB
> flash, timeout_ms evaluates to 40000UL * 128 =3D 5,120,000.
>=20
> Because both operands are 32-bit types on 32-bit platforms, the arithmeti=
c
> could overflow ULONG_MAX (4,294,967,295), wrapping to 825,032,704 before =
being
> implicitly promoted to u64 inside the poll_timeout_us macro.
>=20
> This truncates the wait timeout from ~85 minutes to ~13.7 minutes, which =
could
> cause legitimately slow erase operations on large flashes to prematurely =
abort
> with -ETIMEDOUT.
>=20
> > +	if (ret < 0) {
> > -	dev_dbg(nor->dev, "flash operation timed out\n");
> > +		dev_dbg(nor->dev, "flash operation timed out\n");
> > +		return ret;
> > +	}

Technically you're not wrong, but to overflow the multiplication here, you'=
d
need a NOR size of at least (UINT32_MAX / 40000 * 2MiB) ~=3D 210 GiB, good =
luck
finding one of these.

I guess I need a v3 anyway, so I'll switch 'timeout_ms' to a u64 there.

Cheers,
-Paul
