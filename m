Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F0182D6;
	Wed,  1 Jul 2026 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895816; cv=none; b=XiOkddyClHxaIG5WaWcf8Er7MuB+bw3x4Z+3TYib4KX5Wlv3SJEN45fXMAgitKa7tMYNyT1a9TAsCDZTqekXslGaaMb+qCrWfmEzNiwJxlzu9NO78+gy9lPIvLTsGndZyrgcfJptMibKkkV3NdrRWz51CM3G48mGmXGu+v90Hw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895816; c=relaxed/simple;
	bh=5eilU705tp1cuMmdd9UjB9+ztsF4icFnT7Q7omOKcX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MRW3XYeS95TX36yMDtXFq3sP2OYz0AkLlHTwmykKoyGWUwB6/hHWhNA85WEUUk12gTRUc/NJZocfOR0Nlbp367hPZqDE2sYjk6bsV7i2RYHFAo5zhhYb0/BDvkK/QrZEK5fs+y7LLwb+yxelKcf4noC2VO9hu3f0A3lzJ2RK4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WuYHFzTL; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WuYHFzTL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TcjewTMbKqCfQPM8SSPvtYzOxIR7T++bcwwvFAoDU28=; b=WuYHFzTL08wKntVEtULPAYQxir
	vzOS1Jz3av5FbNRt4W4NXGj0oZf70+WatQ9wBAuuk8DZkbaIgkaluhvTplB/VrBvhUuVRcquwLpV7
	wsYvYM30wn5ZcigJfrZkiwRZ874F3G1vhH7avi8rGCz/d892Ttf4We6r4mKm/Le48N4ILiy16PcSA
	v0d0X7miy06yFZPGIzYBFuzvt70M0PRq39osCcKydhTdkoyCLil5Th2xrK3WEdrHse+G+TrKZElh5
	x+hTB7pv8OxvpvF/7hWWBJRGzc+RsLj8NX5qlgHZh31WceNsKlDsBfglXKEGniRTyoW4zKAMYbdP+
	7FH6uCCg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1weqe5-0006gl-0Z;
	Wed, 01 Jul 2026 10:50:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1weqe5-0003ux-28;
	Wed, 01 Jul 2026 10:50:12 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 wsa+renesas@sang-engineering.com, imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v6 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Wed, 01 Jul 2026 10:50:11 +0200
Message-ID: <15795907.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260701084522.5A5301F000E9@smtp.kernel.org>
References:
 <20260701082611.3126036-1-alexander.stein@ew.tq-group.com>
 <20260701084522.5A5301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8879389.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28047/Tue Jun 30 23:29:24 2026)

--nextPart8879389.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v6 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Wed, 01 Jul 2026 10:50:11 +0200
Message-ID: <15795907.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260701084522.5A5301F000E9@smtp.kernel.org>
MIME-Version: 1.0

Hi,

here some comments about the findings.

Am Mittwoch, 1. Juli 2026, 10:45:22 CEST schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Hardware components (PWM fan and 10G SFP) remain permanently unp=
owered due to disabled regulators
> - [Low] Dead code: Unreferenced `pinctrl_ethphy0` node
> --
>=20
> commit f54617810555494fd6b435aa3ac070a14b264e01
> Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>=20
> arm64: dts: add tqma9596la-mba95xxca
>=20
> This adds support for TQMa95xxLA modules, designed to be soldered
> on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> design. Enable the external accessible PCIe controllers as host, add
> clocking and reset GPIO.
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.d=
ts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > new file mode 100644
> > index 0000000000000..e90f37bbdcd80
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
>=20
> [ ... ]
>=20
> > +	reg_3v3a_10g: regulator-3v3a-10g {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "3V3A_10G";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		gpio =3D <&expander2 15 GPIO_ACTIVE_HIGH>;
> > +		startup-delay-us =3D <2000>;
> > +		enable-active-high;
> > +	};
>=20
> [Severity: High]
> Is this regulator missing a consumer or the regulator-always-on property?
>=20
> Since the sfp_xfi node does not have a vcc-supply or vcc link to this
> regulator, and there is no always-on flag, won't the regulator framework
> automatically disable it, leaving the 10G SFP module unpowered?

XFI is not yet supported upstream, but the regulator is already prepared.

> [ ... ]
>=20
> > +	fan_controller: fan-controller@2f {
> > +		compatible =3D "microchip,emc2301", "microchip,emc2305";
> > +		reg =3D <0x2f>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#pwm-cells =3D <3>;
> > +		status =3D "okay";
> > +
> > +		fan: fan@0 {
> > +			reg =3D <0x0>;
> > +			pwms =3D <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> > +			#cooling-cells =3D <2>;
> > +			fan-supply =3D <&reg_pwm_fan>;
> > +		};
> > +	};
>=20
> [Severity: High]
> Is reg_pwm_fan guaranteed to be enabled to power the cooling fan?
>=20
> While it is referenced via fan-supply in the fan@0 node here, the
> microchip,emc2305 hardware monitor driver does not parse fan-supply or ma=
nage
> regulators.=20
>=20
> Without regulator-always-on in the reg_pwm_fan node, won't this regulator
> remain permanently disabled, preventing the fan from operating?

Indeed the driver is missing regulator support for now.

> [ ... ]
>=20
> > +	/* IRQ pin is AON GPIO, not usable */
> > +	ethphy0: ethernet-phy@0 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <0>;
> > +		reset-gpios =3D <&expander3 0 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us =3D <500000>;
> > +		reset-deassert-us =3D <50000>;
> > +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +		ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> > +		ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > +		ti,dp83867-rxctrl-strap-quirk;
> > +		ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +	};
>=20
> [ ... ]
>=20
> > +	pinctrl_ethphy0: ethphy0grp {
> > +		fsl,pins =3D <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_BIT9		0=
x1100>;
> > +	};
>=20
> [Severity: Low]
> Is this pinctrl group missing a reference?
>=20
> It defines pin configuration for the ethphy0 IRQ pin, but doesn't seem to=
 be
> referenced by the ethphy0 node (e.g., via pinctrl-0) or any other node.

This pad is connected to gpio1 which is under control of the system manager,
so Cortex-A55 (Linux) has no access to it.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart8879389.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmpE1MQACgkQaS+g2M0Z
/iVLWwf/fk8nQFU7ErPNiaXq3faQw6stgzboWoi8uhRqDAJ1+Zz0YOvu8VWjjSdQ
bENCvALL/2GH1Y4xpQLzSJZYX7811a/jQKCmWl6TgaLwtFFfN38aR2i6Ge/egiYZ
dIBx2W2rNsodubBLRNQVniPw3aw+ks+c13iJW2/Ykj+uC19pyzYeWGK1gZX6rD0C
pXzznUVgBWOQ6Jpa4mDvw3oElDr8atu4a/XrURGYeuGV9G0tsPb9iUzGkw4a1xUn
tyy6z/X1vAwgYx5dZgWZ6AFi5WqhdmDAVHnhYUk158nrX8z1Jj2HKC07/EkcEE6Z
uxnV6RfwQMzTzmWfQRQPZRBEkutQCA==
=nc0t
-----END PGP SIGNATURE-----

--nextPart8879389.DvuYhMxLoT--



