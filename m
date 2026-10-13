Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08BA522EE1
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906028; cv=none; b=Q8V1Isyo7kvpiSCnVerzl6B18bhHjjjIvCvBXtiKoZan1WLgR5ftEUkCBLWjTfO0730sWn71qlF73MWc/2vSBipeKvoPJedJt6yjuX1qQfPJcya87vKmNYEhi1qMAtSQlzqWQzIJK/72qSioTIi01h8CnXN5V92wn6l7xoAAXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906028; c=relaxed/simple;
	bh=Z6JKX/LsGzZGq55Ndc5oDGytStsC0Qheu9Ctj2zsOXk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kAt3yrprwCksa3pEh0CdNPyXjoSlJdVnVkXMDkiawA/XdE+rUGeb0vVdKffXpOyRMyaczrby7+0YSPqLP4VAritZa0e0LmGrA21J3Xgd8V0V5E63DTHYBkEW1Kr6w1hkmV3sikvtUH1NEInYgsV7+XpiMDvD7O4LKdInR3Uybx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZUfIQk8W; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZUfIQk8W"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DF814E411A5;
	Tue, 13 Oct 2026 15:40:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E07360362;
	Tue, 13 Oct 2026 15:40:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5508411D70CE0;
	Tue, 13 Oct 2026 17:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791906019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YrA4Pi+VskucaUDlqdfjiorhF+qsnusYmhp68e1bar8=;
	b=ZUfIQk8WOmtRYv68v2X1Svgn8saXrU3FyW8wo3VNrYKhWozt7HSaE2y9raP+AiBHnHriZ+
	5wjJO+IACJnGCeJPUmDxM1/N7Upq9R/L2qAUxyyyw7JJ7ByJuGscVwMoPL5epp00726DXy
	gMKSotx+7i46OUfATP85driG1VIghpN24yTX2921LRcaa4CRAPZgt6oqQ2s7ZFHMeUklIC
	zi6M2cvo3vES7s1JuQfPNRv5a7OAT4YliDP+KSgs68/+OP7RoItHQM0XtPCk4spdmQUrqf
	1Fg91kFiZzO4DFt8Vd8NpNMc8y0S6vAY0q0gK3Qh7boX5TGceXrxp/DborLDtQ==
Message-ID: <1c1db1ab1ac89e36b3a81d1a1cadc8b8bddbf614.camel@bootlin.com>
Subject: Re: [PATCH v2 5/7] spi: cadence-xspi: Add irq-less support
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
Date: Tue, 13 Oct 2026 17:40:12 +0200
In-Reply-To: <sashiko-outbox-169916@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-6-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169916@kernel.org>
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

Le mardi 13 octobre 2026 =C3=A0 14:33 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s)
> to consider:
> - [High] spi: cadence-xspi: 1ms polling timeout is too short for large ST=
IG
> transfers
> - [High] spi: cadence-xspi: stale completion state after early abort or
> double-completion
> - [High] spi: cadence-xspi: missing SDMA error check in polling mode
> - [High] spi: cadence-xspi: spurious completions from uncleared polling s=
tatus
> --
>=20
> commit 16ebab91423ce939f852c48607b518f29634b538
> Author: Tanmay Jagdale <tanmay@marvell.com>
>=20
> spi: cadence-xspi: Add irq-less support
>=20
> Make the interrupt line optional. If not provided, the driver will
> instead resort to polling registers.
>=20
> > diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-x=
spi.c
> > index 095bf640b379a..185dffda54bbd 100644
> > --- a/drivers/spi/spi-cadence-xspi.c
> > +++ b/drivers/spi/spi-cadence-xspi.c
> > @@ -365,6 +365,39 @@ static int cdns_xspi_wait_for_controller_idle(stru=
ct
> > cdns_xspi_dev *cdns_xspi)
> > =C2=A0					=C2=A0 100, 1000);
> > =C2=A0}
> > =C2=A0
> > +static bool cdns_xspi_is_stig_ready(struct cdns_xspi_dev *cdns_xspi, b=
ool
> > sleep)
> > +{
> > +	u32 ctrl_stat;
> > +
> > +	return !readl_relaxed_poll_timeout
> > +		(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
> > +		ctrl_stat,
> > +		((ctrl_stat & BIT(3)) =3D=3D 0),
> > +		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
> > +		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
>=20
> [Severity: High]
> Does this polling loop leave the CDNS_XSPI_STIG_DONE bit uncleared in
> INTR_STATUS_REG?
>=20
> If a shared IRQ fires later, cdns_xspi_irq_handler() will see the unclear=
ed
> CDNS_XSPI_STIG_DONE bit and call complete(&cdns_xspi->cmd_complete). This=
 can
> corrupt the completion counter and cause subsequent commands to premature=
ly
> return from wait_for_completion().

Whether or not this is true, it is irrelevant for this patchset, this code =
is
just being moved around the driver without changes.

Cheers,
-Paul
