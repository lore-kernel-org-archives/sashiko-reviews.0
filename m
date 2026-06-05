Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1944CAEA;
	Fri,  5 Jun 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642860; cv=none; b=nn5JiZhmcy7L1/j3b8v2KkOzmKTA77bXwLON+3lFT5ioS+B07WnyMDC9M6kemSrY4BdVcQ7AfMfBxnl3u1vspOm4HK7RqU5Rd8w6MUwVxRDDnh4izT5AXL6iEyZd5YFDoUisF5gLZcpc0+AMQiBqPOfedHw8d37xsbCFAIfU7Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642860; c=relaxed/simple;
	bh=xdyh2vxrj3LiGIwHOvIqIAR/3ybTlOR3E9FR7Dqfpa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZfBdb+1EYn9TxFzpXLM5eEuVhwwTeEo0H2jYLkp5OMYUF+hBF4pjqrY/LvdukWB95z/DWggi5/KL9a4qFiznGK7lN2NoawG6yNjwoCehfdFaS4jwLrlj8LwBh/srFpWPOPoMP15/1meC4MqQg+if/TZtHxd1/Pmewz0ZT6hdwHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=opKaYSNS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="opKaYSNS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vaoF5rZkwsU+N1JWPgwtDAZ59NZOwBQt/1XnFYImb6Q=; b=opKaYSNSDV66q6c4olA58Aja0M
	352HXJt0qTeMAoH2dyyssSWpen8FoUZrlh9SE5exgUGI+3uFQjZcO/p9iAB0bml1xRy4+8bEXzJyM
	1qVnSkIVuU3FbyYShV0Kbs+f1oGkBMI853AfcDnzSo33BesuOIgvhVN9tqssJotGAY1+wRvUikFFI
	yDVg464vJYUFNkir612OCVQD6z/XsWt5hlkWAkqu4LT24yap493Tg49qPy/OJCWsKzjCGrwZZApda
	+ypRME3PAEE+2iBGMRmTUIOcaNrA2zIPl4ReXlx8p+1jm9ZUyuPZVaaflgO5sjxszZ9z0LIvKyoMS
	BEDCVTzw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wVOXv-000Fje-08;
	Fri, 05 Jun 2026 09:00:51 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wVOXu-000PmQ-2F;
	Fri, 05 Jun 2026 09:00:46 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, Frank Li <Frank.li@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev,
 wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org
Subject:
 Re: [PATCH v4 2/4] arm64: dts: freescale: add initial device tree for
 TQMa8MPQS with i.MX8MP
Date: Fri, 05 Jun 2026 09:00:45 +0200
Message-ID: <4788246.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aiBnWwW2x1TOsGcy@lizhi-Precision-Tower-5810>
References:
 <20260603093621.2504490-2-alexander.stein@ew.tq-group.com>
 <20260603100559.6E7E21F00893@smtp.kernel.org>
 <aiBnWwW2x1TOsGcy@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (Could not determine AV Version)

Am Mittwoch, 3. Juni 2026, 19:41:47 CEST schrieb Frank Li:
> On Wed, Jun 03, 2026 at 10:05:59AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [High] Incorrect `reset-gpios` polarity on `dp_bridge` will permanent=
ly disable the device.
> > - [Medium] Missing `interrupts` property for the DisplayPort bridge des=
pite hardware routing.
> > --
> >
> > commit ec4a92e3f2baae5d65ed787df020c8a40c851231
> > Author: Paul Gerber <paul.gerber@tq-group.com>
> >
> > arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8=
MP
> >
> > This adds support for TQMa8MPQS module on MB-SMARC-2 board.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> > > new file mode 100644
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> >
> > [ ... ]
> >
> > > +&i2c3 {
> > > +	clock-frequency =3D <384000>;
> > > +	pinctrl-names =3D "default", "gpio";
> > > +	pinctrl-0 =3D <&pinctrl_i2c3>;
> > > +	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> > > +	scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	status =3D "okay";
> > > +
> > > +	dp_bridge: dp-bridge@f {
> > > +		compatible =3D "toshiba,tc9595", "toshiba,tc358767";
> > > +		reg =3D <0xf>;
> > > +		pinctrl-names =3D "default";
> > > +		pinctrl-0 =3D <&pinctrl_tc9595>;
> > > +		clock-names =3D "ref";
> > > +		clocks =3D <&clk_dp>;
> >
> > [Severity: Medium]
> > Is this node missing the interrupt properties for the Hot Plug Detect s=
ignal?
> >
> > The pinctrl node pinctrl_tc9595 configures GPIO5_IO21 (DP_HPD_INT), but
> > without the interrupt-parent and interrupts properties here, the tc3587=
67
> > driver won't be able to request the hardware IRQ.
> >
> > Will this cause the driver to silently fall back to 10-second software
> > polling for HPD and link training events instead of using the hardware
> > interrupt?
> >
> > > +		reset-gpios =3D <&expander0 4 GPIO_ACTIVE_HIGH>;
> >
> > [Severity: High]
> > Will this reset-gpios polarity leave the device permanently held in res=
et?
> >
> > The tc358767 driver initializes the reset GPIO to logical 0, pulses it =
to
> > logical 1 to assert, and returns it to logical 0 to deassert. Since this
> > is specified as GPIO_ACTIVE_HIGH, the final logical 0 maps to a physical
> > LOW signal.
> >
> > If this pin controls the bridge's Enable or active-low Reset, won't hol=
ding
> > it physically LOW leave the bridge permanently disabled? Does this need=
 to be
> > GPIO_ACTIVE_LOW so the driver's logical 0 maps to a physical HIGH inste=
ad?
>=20
> Does AI said correctly?

Currently in next there is only one position where the reset-gpio is touche=
d in
tc358767:

/* Reset GPIO is optional */
tc->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
if (IS_ERR(tc->reset_gpio))
	return PTR_ERR(tc->reset_gpio);

if (tc->reset_gpio) {
	gpiod_set_value_cansleep(tc->reset_gpio, 1);
	usleep_range(5000, 10000);
}

So yes, the reset GPIO is set to logical 0 and to 1 afterwards. The RESX in=
put
(reset) is indeed active-low. So AFAICS the driver is assuming
GPIO_ACTIVE_HIGH anyway.
Nevertheless right now the bridge is not functioning at all without
additional patches [1].

Without the polarity cleared/fixed in tc358767, there is not much benefit
in addressing the polarity in DT.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20240625122824.148163-1-marex@denx.de/

> Frank
>=20
> >
> > > +		toshiba,hpd-pin =3D <0>;
> > > +		status =3D "disabled";
> > > +
> > > +		ports {
> >
> > [ ... ]
> >
> > --
> > Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260603093621.250=
4490-1-alexander.stein@ew.tq-group.com?part=3D2
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


