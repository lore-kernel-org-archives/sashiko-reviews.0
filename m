Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD2E31F995;
	Wed, 15 Jul 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097937; cv=none; b=gkkgIBLQYScCj3lyhusFH07g0vSbP0qA9D698nBbRTaSLqMsMVl4guNEmfiRDv07KBlAnR7QJbMQw++oR3jx0BpfRF6cYF7a6N02t0xvl7/pa5mwnnzlrGTgTLMYf10I8lRw7E0qdNgFduEyx3MtmH3ILZkYT7D+1uohxHzjpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097937; c=relaxed/simple;
	bh=NCYbY8ASteWFE28nnDC4+QOGRmwy/KpIhVSQPXAZwJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExpjJMs2ccMqc0adXse5lGhlz4rUl4FZhfl/3EOzuUmDdfL3Mv7l5wWXsQNWkD8aaUBJotG/kiIWx4k1JfA7fQ22AeT65VopnB2Fky5ZfqXaaWaKnHCf/8mhA+JvCRxc1Ydxf2ny4x3baFV3n019XONXoM8ulMIPTLjxUbDC+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=G7zdkKUC; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="G7zdkKUC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vM1HZpnp+xMsMpc2d7PzrpEfeSafS28iCXXhm4fqmZs=; b=G7zdkKUCdw+mCBSiqSjIFj+c6/
	BG65JmaLZHj6u1BTNFQYNUMd8OEBFbxJIuLSEf0M9HPcVD6NgsWZGcUcHf206rfwU1iqnDia0xx3D
	ikyadVNDYWUp5XRUzDVKaCDwqhLO6y9hMd1869VlofVxcmnhUloAuZSDVY4DPOVIDzNTiIm271XKL
	bwWkndtimdcNwN68ScTSPPMO2WlCDkgZBSKgeBQPXi6wBxFiaSxMr78swc1bIZWikkGS2Cu7/yWu9
	KMfvmbpHMYROy+2Lv75Dg30tjvfscIpB0i8Y3yvvq1oGhsACn/vmVzsCHoI5b6bLYw1vr3bQeY4/8
	SwyFmzxA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjtN5-000BJu-1x;
	Wed, 15 Jul 2026 08:45:31 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjtN5-000Enz-0l;
	Wed, 15 Jul 2026 08:45:31 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, Frank Li <Frank.li@oss.nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Wed, 15 Jul 2026 08:45:30 +0200
Message-ID: <8709657.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <alZW0l9rJpn8L0Mh@SMW015318>
References:
 <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
 <20260714150126.09D971F000E9@smtp.kernel.org> <alZW0l9rJpn8L0Mh@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28060/Tue Jul 14 08:25:07 2026)

Am Dienstag, 14. Juli 2026, 17:33:38 CEST schrieb Frank Li:
> On Tue, Jul 14, 2026 at 03:01:25PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Unreferenced 10G SFP regulator will be unconditionally disab=
led by the regulator core.
> > --
> >
> > --- Patch [1]: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca ---
> > commit b7aa596cf679be039938abc33965834ed28f5c60
> > Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > arm64: dts: add tqma9596la-mba95xxca
> >
> > This adds support for TQMa95xxLA modules, designed to be soldered
> > on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> > design.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca=
=2Edts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > new file mode 100644
> > > index 0000000000000..1d745d66997cb
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> >
> > [ ... ]
> >
> > > +	reg_3v3a_10g: regulator-3v3a-10g {
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "3V3A_10G";
> > > +		regulator-min-microvolt =3D <3300000>;
> > > +		regulator-max-microvolt =3D <3300000>;
> > > +		gpio =3D <&expander2 15 GPIO_ACTIVE_HIGH>;
> > > +		startup-delay-us =3D <2000>;
> > > +		enable-active-high;
> > > +	};
> >
> > [ ... ]
> >
> > > +	sfp_xfi: sfp-xfi {
> > > +		compatible =3D "sff,sfp";
> > > +		pinctrl-names =3D "default";
> > > +		pinctrl-0 =3D <&pinctrl_sfp>;
> > > +		i2c-bus =3D <&lpi2c7>;
> > > +		maximum-power-milliwatt =3D <2000>;
> > > +		mod-def0-gpios =3D <&expander1 3 GPIO_ACTIVE_LOW>;
> > > +		tx-fault-gpios =3D <&gpio2 30 GPIO_ACTIVE_HIGH>;
> > > +		los-gpios =3D <&gpio2 31 GPIO_ACTIVE_HIGH>;
> > > +		tx-disable-gpios =3D <&expander2 2 GPIO_ACTIVE_HIGH>;
> > > +	};
> >
> > [Severity: Medium]
> > Will the 10G SFP regulator be turned off by the regulator core?
> >
> > The reg_3v3a_10g regulator is defined without regulator-always-on, and =
the
> > sfp_xfi node seems to be missing the vcc-supply =3D <&reg_3v3a_10g>; pr=
operty
> > to link the SFP to its power source.
> >
> > Since it lacks consumers, won't the regulator core automatically disabl=
e this
> > unused regulator at the end of boot and unconditionally turn off power =
to the
> > 10G interface?
>=20
> Is it true?

That's true, the regulator will be disabled. But currently there is no
XFI/10G support anyway, so nothing will be disabled. This regulator is
taken from downstream where XFI already is supported.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


