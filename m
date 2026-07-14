Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B838398E;
	Tue, 14 Jul 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031794; cv=none; b=G1DTAOaGmOLNNxHlzMe0WoRpYueVwuU53u+BOFw+TS2676hfqwgNoUb0EtbN2frgGhapPUGDP5TptdO7bJDNewixozMVaKnxaa/w+RuVjBOuDf/rEllqDHhsgdS8V2wNeI28tvKZrGRd00u62CKdF0UHUQaet7A6JaLEcb/n6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031794; c=relaxed/simple;
	bh=auZ4C5ReUYq7BzaciJn06uxsOqN9s9GqqIYihlqkBtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNfSpFtdXHCPpRgv6jVicq28V9XRXL7OdINwfZXEFiGX7Xghi0871jTShF2RuHbi/4ihuNaLHMn+NqDqKk5CwdbKBX8ixGgyz30IXzUt+q7/D0mOb9C/l6/tOfFrZ4AwC6AQLNmKOQKRsFiIkLVpMjcwAaM4dRyiYHRdmFgcIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JXCj53Rf; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JXCj53Rf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XrrEeqFj/zMDMUWNJzoASYNNQtEig1sQZ0PwjZWRQSI=; b=JXCj53RfarxMkZ0ybH40l7TIjO
	TQBzb5NkO+dqgXPkr9+f4SZNx5b8sPTLIhoksu1x4qiH+pjaxa0EwzhYK0ID17t9zDAN9bhTnSWT5
	ENytREbChrPK93WpW/lkFh3vKaKWuqoybbbWlGGPat2uuh+i3XideXAMMS7TmxvRCTSpFgejWk4+O
	ZXoWQitk4YJ/hDoGaxrYL+0nZHV5ampLcmS+Y/4quX3IdycgCFdbirTKTofmd/i70udidf5V+13hM
	ZEbKdg4MEG5TYDKAE2HgqQfdS4z9pln4eXpHz/NQk+XvQYj6h7vwHfMCUFmwmL2qDqKayKw0/GJq8
	hu+ofSQg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjcA3-000PTO-2X;
	Tue, 14 Jul 2026 14:22:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjcA3-0000xs-25;
	Tue, 14 Jul 2026 14:22:55 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, Frank Li <Frank.li@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 Frank.Li@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Tue, 14 Jul 2026 14:22:54 +0200
Message-ID: <1965063.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <alUO-oOtWBescUK6@SMW015318>
References:
 <20260707062506.949806-1-alexander.stein@ew.tq-group.com>
 <20260707065956.124121F000E9@smtp.kernel.org> <alUO-oOtWBescUK6@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2273617.irdbgypaU6";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28060/Tue Jul 14 08:25:07 2026)

--nextPart2273617.irdbgypaU6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Tue, 14 Jul 2026 14:22:54 +0200
Message-ID: <1965063.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <alUO-oOtWBescUK6@SMW015318>
MIME-Version: 1.0

Hi Frank,

Am Montag, 13. Juli 2026, 18:14:50 CEST schrieb Frank Li:
> On Tue, Jul 07, 2026 at 06:59:55AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] Conflicting GPIO assignments for M.2 Key-E SDIO Reset between =
the `wifi-connector` device node and a leftover `gpio-hog`.
> > - [High] The fan supply regulator `reg_pwm_fan` is never enabled, leavi=
ng the fan unpowered.
> > --
> >
> > --- Patch [1]: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca ---
> > commit c06cc8eb19eb4a69fc0547caa6773b503beae3a7
> > Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > arm64: dts: add tqma9596la-mba95xxca
> >
> > This patch adds support for the TQMa95xxLA modules on the MBa95xxCA car=
rier
> > board. It introduces a common device tree include for the module and a =
specific
> > device tree for the carrier board.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca=
=2Edts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > new file mode 100644
> > > index 0000000000000..db2fd6991d112
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > [ ... ]
> > > +	wifi-connector {
> > > +		compatible =3D "pcie-m2-e-connector";
> > > +		vpcie3v3-supply =3D <&reg_v3v3_mb>;
> > > +		vpcie1v8-supply =3D <&reg_v1v8_mb>;
> > > +		i2c-parent =3D <&lpi2c2>;
> > > +		w-disable1-gpios =3D <&expander2 9 GPIO_ACTIVE_LOW>;
> > > +		w-disable2-gpios =3D <&expander2 10 GPIO_ACTIVE_LOW>;
> > > +		/* UART_WAKE is connected to SM */
> > > +		/* SDIO_WAKE is connected to SM */
> > > +		sdio-reset-gpios =3D <&expander3 2 GPIO_ACTIVE_LOW>;
> > > +	};
> >
> > [Severity: High]
> > Does this sdio-reset-gpios assignment conflict with the gpio-hog on the=
 same
> > line?
> >
> > The wifi-connector node requests expander3 line 2 here, but later in th=
e file,
> > m2-keye-sdio-rst-hog hogs the exact same GPIO line. Won't this conflict=
 cause
> > the wifi-connector driver to fail probing with -EBUSY?
>=20
> suppose needn't gpio hog for expander3 2 ?
> can you double check it?

Well pwrseq-pcie-m2.c doesn't support "sdio-reset-gpios" yet, so there is n=
o -EBUSY.
But I'm okay with remove the hog which seems appropriate.

> >
> > [ ... ]
> > > +	fan_controller: fan-controller@2f {
> > > +		compatible =3D "microchip,emc2301", "microchip,emc2305";
> > > +		reg =3D <0x2f>;
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +		#pwm-cells =3D <3>;
> > > +		status =3D "okay";
> > > +
> > > +		fan: fan@0 {
> > > +			reg =3D <0x0>;
> > > +			pwms =3D <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> > > +			#cooling-cells =3D <2>;
> > > +			fan-supply =3D <&reg_pwm_fan>;
> > > +		};
> > > +	};
> >
> > [Severity: High]
> > Will the reg_pwm_fan regulator ever be enabled?
> >
> > The emc2305 driver does not parse or request the fan-supply property fr=
om
> > child nodes. Since reg_pwm_fan is not marked regulator-always-on earlie=
r in
> > this file, does this leave the fan unpowered?
>=20
> look like make sense, but dts itself should be correct. You'd better upda=
te
> driver also.

I'ts on my TODO, but I won't manage to add it for the time being. How do you
want to procede? I'd rather remove the fan-supply and disable the reg_pwm_f=
an
for the time being.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart2273617.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmpWKh4ACgkQaS+g2M0Z
/iVX6gf8CPBANnI2cDftSXLqyxDSkPQeBrw29NY27Nf62/0kqw7KBe6+H3+dwo4p
KXbgaJlOgIhwEdXVocHIQgzHvdziHS0gJrKFMm2ZYVby0ye3jPdQzwY4uZQcxDKP
Qtwy8Diam4XANdlZ4olRnAk6USOxwEbocsELmeaq7ozh1n3HkAorNSEtMa3Dem6G
knaMLQglNqkD/vcz+foCfe0stfWeSCj/S/HtqOH+f7+yhqPfHOC2sdaO43bGWSmI
QzOHRKkRu3bmp/7Y5b1NNp3uHaxwVmhd8UqPZ7FC4why7EudcAeYMRQB9zXik1yn
CbWZ5R9EAoopG/FhvhkN1KMXiJ6tyQ==
=m9jA
-----END PGP SIGNATURE-----

--nextPart2273617.irdbgypaU6--



