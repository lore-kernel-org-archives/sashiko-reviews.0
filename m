Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5233554083
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905629; cv=none; b=NNqeVIccc+HrE4ad9BE/nugu24RyirG0xJUFDzOk5TKzIFCFq2wt+/w9JXzSu24mdM7uN//ysCefsUcCUqsp0xe52yTskoBUQ5lVxb8sVwLw/FdtLPL4N5Xi8ZIduSejCS7dryhWC1Hak3ixaZGlg0/G0gOWYjzE3teuWOmEgT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905629; c=relaxed/simple;
	bh=iH3bUqG2D5slOQBDO5szoS3JDqnmf8BdUj/T1HOM/gY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HflYxbmzWqTxP4OBLUWTAqECAVqT2ho5mej6ZZN3r5OgQsAdE0CHbA8ioxDhBtR+T4a0RweaJnk3iUrYkFeN2gUlMV/P97gsYBAIuUdD9caJZ1qUQ67DSwnFCNR9hvh7HtGGSQ39HPZuT5UTtM1m0XfhBL1SjUheIjaumzEJQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YrEIUtWc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YrEIUtWc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 206C61A1203;
	Tue, 13 Oct 2026 15:33:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7C3260362;
	Tue, 13 Oct 2026 15:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F94111D717C0;
	Tue, 13 Oct 2026 17:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iy3kJahGWq1o0jLOI0ZcDiQpbjtGY/DRzRu+9LbaoPU=;
	b=YrEIUtWcyMlI1VG9RKkd56NP4TO8YW7eVh3aSwTMyE3lDTRJ5SAJvbQ/UD/4yD2Oze7nOb
	QcmmPtPQhECMaQG3JpMoJwlj0qxqYa1THbvd/ZtvFsVyNGkzEQxmk0H2bykmCCx1Gx77pT
	xVu7QNrcu9q+s3tOHkWNDegEBIjbK3P+Z6HS2cO4TaeAwdjeoFL+WUb6jzWfLSD9bYFRGm
	F4yAviaRBCHaaEAlUHEbAidBgsw0wOPW5BiL0WOVEimkMUrw7c4hPPEk2X4N2zvMnv5mx2
	Fh/GkFZV8FHUgDnZYfGW7SZG+DBe2+nYCo2eyf8/IBi+Vc1ECbmhIdSFPYc0Zw==
Message-ID: <4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
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
Date: Tue, 13 Oct 2026 17:33:32 +0200
In-Reply-To: <sashiko-outbox-169898@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-2-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169898@kernel.org>
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

Le mardi 13 octobre 2026 =C3=A0 14:23 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s)
> to consider:
> - [High] spi: spi-mem: inverted pm_runtime_get_if_active() return check
> - [High] spi: spi-mem: fallback path deadlocks during panic_write on -
> EOPNOTSUPP
> - [High] spi: deadlock in panic context from pm_runtime_get_if_active()
> --
>=20
> commit 3d801ffb98468bd4b61d20480140ce8dbbcf4ae2
> Author: Tanmay Jagdale <tanmay@marvell.com>
>=20
> spi: spi-mem: Add support for panic mem writes
>=20
> Add a 'panic_write' flag to the controller's capabilities struct.
> When set, the SPI controller indicates that it will be able to send
> commands to a connected NOR or NAND memory in the context of a kernel
> panic, which means without sleeping and without relying on IRQs.
>=20
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index b94680b60af95..3b6fa44e45504 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
>=20
> [ ... ]
>=20
> > @@ -420,7 +445,10 @@ int spi_mem_exec_op(struct spi_mem *mem, const str=
uct
> > spi_mem_op *op)
> > =C2=A0		return -EOPNOTSUPP;
> > =C2=A0
> > =C2=A0	if (ctlr->mem_ops && ctlr->mem_ops->exec_op &&
> > !spi_get_csgpiod(mem->spi, 0)) {
> > -		ret =3D spi_mem_access_start(mem);
> > +		if (!op->panic_write)
> > +			ret =3D spi_mem_access_start(mem);
> > +		else if (ctlr->auto_runtime_pm)
> > +			ret =3D pm_runtime_get_if_active(ctlr->dev.parent);
> > =C2=A0		if (ret)
> > =C2=A0			return ret;
>=20
> [Severity: High]
> Is it safe to call pm_runtime_get_if_active() here during a kernel panic?
>=20
> pm_runtime_get_if_active() relies on pm_runtime_get_conditional(), which
> unconditionally acquires dev->power.lock via spin_lock_irqsave(). In a pa=
nic
> context with NMIs or IRQs disabled, trying to acquire a spinlock that may=
 be
> held by a halted CPU causes an infinite spin. On PREEMPT_RT,
> spin_lock_irqsave()
> maps to a sleeping rt_mutex, which is strictly forbidden in atomic contex=
t.

ACK, I'll just drop pm_runtime_get_if_active() here, and restore the return=
 -
EOPNOTSUPP that was in v1 when ctlr->auto_runtime_pm is set.

> [Severity: High]
> If the controller's exec_op implementation dynamically returns -EOPNOTSUP=
P
> during a panic write, could this fallback path cause a deadlock?

Good point, dear bot. We do not want to go to the fallback code.

Cheers,
-Paul
