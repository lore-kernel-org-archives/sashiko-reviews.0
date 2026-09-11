Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2129BD91
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115261; cv=none; b=Z/HOhGOfglq8HbkfS97LNTHDYhdsd9wj5tbQ8qT1jnyVq0CbdX1DnVtUOB3DG3pNP2HSNT2LrGAYkB4okiJYimVpzfAedmMyJ03FD3oBFB1Oh9VDr39bzMnShlcWPKOYDeabztLyoZBu0C8ix51qWZH2cXqnIiiieFeT3jtvyCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115261; c=relaxed/simple;
	bh=ZiLEUyTUk1N3CKNtzjm8jTBPQyHlJ2Cm5nKgeQ+TGHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/4WtGyLqbwsA43AuG0KSDFSRcodyepZzaP7ORvmya8oBdSLHDsi4RQe5+ro7ZkdJ6vH++vxeXbv1bqYzSXk1N8K5T05BMPy4vaF73KVoTB0DhML2Mj7a/ZFyeftCHwKFL7gUj2ZUJYLYwlkUZroVxjryyHTyU8w8pNn3E/a9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ychuang570808@gmail.com
X-PTX-Original-Recipient: zychennvt@gmail.com
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: sashiko-reviews@lists.linux.dev
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3C2CD20100D;
	Fri, 11 Sep 2026 10:27:36 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1x4wbg-000OGG-0K;
	Fri, 11 Sep 2026 10:27:36 +0200
Received: from pengutronix.de (unknown [185.104.138.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id EE8F9599FEE;
	Fri, 11 Sep 2026 05:56:34 +0000 (UTC)
Date: Fri, 11 Sep 2026 07:56:29 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jacky Huang <ychuang570808@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, Zi-Yu Chen <zychennvt@gmail.com>, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
Message-ID: <20260911-frisky-imperial-elephant-3336e4-mkl@pengutronix.de>
References: <20260908014526.413399-1-zychennvt@gmail.com>
 <20260908015435.7DE071F00A3A@smtp.kernel.org>
 <853110ab-1bd8-41cc-9b82-cc28002c0bed@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbjm735kz2knxz3e"
Content-Disposition: inline
In-Reply-To: <853110ab-1bd8-41cc-9b82-cc28002c0bed@gmail.com>


--wbjm735kz2knxz3e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
MIME-Version: 1.0

On 11.09.2026 10:15:21, Jacky Huang wrote:
> > [ ... ]
> > > @@ -244,6 +244,58 @@ gpion: gpio@340 {
> > >                        };
> > >                };
> > >
> > > +             can0: can@403c0000 {
> > > +                     compatible =3D "bosch,m_can";
> > > +                     reg =3D <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c=
0200 0x0 0x2000>;
> > > +                     reg-names =3D "m_can", "message_ram";
> > > +                     interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > > +                     interrupt-names =3D "int0", "int1";
> > > +                     clocks =3D <&clk HCLK3>, <&clk CAN0_GATE>;
> > > +                     clock-names =3D "hclk", "cclk";
> > > +                     bosch,mram-cfg =3D <0x0 4 4 32 32 32 8 8>;
> > > +                     status =3D "disabled";
> > > +             };
> > [Severity: Medium]
> > Should this node include the hardware resets property (e.g.,
> > resets =3D <&sys MA35D1_RESET_CANFD0>;)?
> >
> > Without the hardware reset line, the bosch,m_can driver cannot perform a
> > hardware reset of the CAN controllers during probe or interface toggles.
> > It must rely solely on software initialization, which can fail to fully
> > recover the controller if the bootloader or a prior crashed state left
> > the hardware in an unpredictable state.
> >
> > This omission pattern is identically repeated across the newly added ca=
n1,
> > can2, and can3 nodes below.
>
> The reset property is optional for the MA35D1 CAN nodes.

yes, but....

> The bosch,m_can binding does not require a reset property, and the
> m_can driver obtains the reset control through
> devm_reset_control_get_optional_shared().
>
> The MA35D1 CAN controllers also operate correctly without explicit
> CAN reset properties in the existing platform DTS. Therefore, no
> change is required for this patch.

=2E..we've observed that the SW reset doesn't clear the CAN state and
error counters, see commit 9271d0ea07c2 ("can: m_can: add support for
optional reset") for details. As your SoC has a reset line connected to
the M_CAN IP core, please add it to the dtsi.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wbjm735kz2knxz3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaqOX9wAKCRDMOmT6rpmt
0m5sAQDe8rpJRlj59JnXeh7uUHfFHP/ofivVRJiOXEAdam4QsQEA2wqvKefFKh7t
gb/iyr+i/u/xI4v+NxR8FxerA6Vh0gU=
=Kk71
-----END PGP SIGNATURE-----

--wbjm735kz2knxz3e--
