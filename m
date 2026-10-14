Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F271B3F0A9B
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966302; cv=none; b=NYCObpLrKlUOJ/FDnRpmnL+tldsS2C+jMxp5P6vrThhpPjyZipZ7qxhiDWrnIr20bRIv/S3xsxEW1QPTBibr0S/m8ynQt0sFyULtYVJrI7e19EiGjxbtDEYyRpFdMCkWsoOA2XM59PlkwDtA33bjHkdQiTVuwXHp1Ffqr+aCxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966302; c=relaxed/simple;
	bh=uG3TpedY1vEs460u4nd+AVx4nLwUfNy/KQRVBXilNb4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EdE53z3cgXij+v72XkxpH3+VRKOyrWVKG5mmku+TReWFbx1PCIT0fe/LdlwP1KBmY0LwM2Yl3/FzL6lX1ho/VmQYRsbU5zEerji6GkzDiWsGEQKxCNaKpMinrg25wIw+kvT9xM/JNhwwUThCR0DUJoVDqBA9w+F1GjZvNj5vb9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vT5EQd1M; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vT5EQd1M"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D0FA8C63440;
	Wed, 14 Oct 2026 08:25:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDFC560368;
	Wed, 14 Oct 2026 08:24:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 580D410328AD7;
	Wed, 14 Oct 2026 10:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791966296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=71Unaai47oG9YWYzUALaY8suroh2hCKw55TRbaM+FLs=;
	b=vT5EQd1MnqSBdw1Q7dPnBerAu3+c0LwJ5E1sTPFCAz/lrxhWfp0OghOLqG/V0lTbA/Q86g
	ogJQYwENzzJ8G3wmxtpYlwhZZD0E1Qq5v/YJ6Cypn0DfQLxB2IE2IF/TOwxzzUeYC8MI2S
	STWXHN0eRen4GTraP/AcqTOPi0KD4oZ0YkeeW+YdHnXZukhQNe/6qwnVuyIZdvetF0ajVX
	kaaqD7qZ8Se0ZAbWXSqAE1sLs2wVb0RL1H+X23Qp4CjFH8aIHdXqvBphuAA5htbP4y2crq
	jepoS3URyqUY70n1NZGwNU9GT5U7kF3/oy/pU6xkhR4z//ZQvDrQc2PZ8YtQHA==
Message-ID: <73139fed463dc3c32ccccfddb84d0f500066401f.camel@bootlin.com>
Subject: Re: [PATCH v2 1/7] spi: spi-mem: Add support for panic mem writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Richard Weinberger	 <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown	 <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli"
	 <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, Bharat Bhushan	
 <bbhushan2@marvell.com>, Sunil Kovvuri Goutham <sgoutham@marvell.com>, 
 Tanmay Jagdale <tanmay@marvell.com>
Date: Wed, 14 Oct 2026 10:24:45 +0200
In-Reply-To: <87wlrlvbix.fsf@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
		<20261013141350.189996-2-paul.cercueil@bootlin.com>
		<sashiko-outbox-169898@kernel.org>
		<4a8f6d2bff13967288cbff72d1c3e8fcb4ca9f8d.camel@bootlin.com>
	 <87wlrlvbix.fsf@bootlin.com>
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

Hi Miqu=C3=A8l,

Le mardi 13 octobre 2026 =C3=A0 17:57 +0200, Miquel Raynal a =C3=A9crit=C2=
=A0:
> Hi Paul,
>=20
> On 13/10/2026 at 17:33:32 +02, Paul Cercueil <paul.cercueil@bootlin.com>
> wrote:
>=20
> > Hi Sashiko,
>=20
> :-)
>=20
> > > > -		ret =3D spi_mem_access_start(mem);
> > > > +		if (!op->panic_write)
> > > > +			ret =3D spi_mem_access_start(mem);
> > > > +		else if (ctlr->auto_runtime_pm)
> > > > +			ret =3D pm_runtime_get_if_active(ctlr-
> > > > >dev.parent);
> > > > =C2=A0		if (ret)
> > > > =C2=A0			return ret;
> > >=20
> > > [Severity: High]
> > > Is it safe to call pm_runtime_get_if_active() here during a kernel pa=
nic?
> > >=20
> > > pm_runtime_get_if_active() relies on pm_runtime_get_conditional(), wh=
ich
> > > unconditionally acquires dev->power.lock via spin_lock_irqsave(). In =
a
> > > panic
> > > context with NMIs or IRQs disabled, trying to acquire a spinlock that=
 may
> > > be
> > > held by a halted CPU causes an infinite spin. On PREEMPT_RT,
> > > spin_lock_irqsave()
> > > maps to a sleeping rt_mutex, which is strictly forbidden in atomic
> > > context.
> >=20
> > ACK, I'll just drop pm_runtime_get_if_active() here, and restore the re=
turn
> > -
> > EOPNOTSUPP that was in v1 when ctlr->auto_runtime_pm is set.
>=20
> This is tricky but automatically rules out about 1/6th of the
> controllers (45 controllers set this boolean out of +300). I don't like
> it much. I guess it deserves a comment in case someone ever wants to
> enable this feature on their auto-RPM-enabled controller, to understand
> why this is not possible. My gut feeling is that the runtime PM layer
> lacks its own understanding of what a panic is. We should, I believe, be
> able to query the usage_count of a controller without taking the lock
> during a panic write.
>=20
> Nevertheless, let's move forward and return an error for now.

I guess I can use pm_runtime_active() then?

Cheers,
-Paul
