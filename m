Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F74DF4DC;
	Wed, 14 Oct 2026 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971518; cv=none; b=J79YujILglawtZVwwKLpy1B/DJWUcEH7UiV60hJhJ8Xy6z80Z8Xwi6VcCWLEIWADur0IToUn9x/JImCKP4cGGFJe+seH0vtgFQ0ARNpE3+/rjkM9r+n0/vGfMB8AIfPT90K+FNNQkLJiPADIn9W+htQ7qJrKIsn/zdeD3P2ea/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971518; c=relaxed/simple;
	bh=aA9hNSxz1vjdTkgnJho2BTzP5XSFQlBPKVnD9tD4N3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3Ka8hX3WnO1jaJNaXnWSUrqtv5/IR3P4rA/rh9CBaO/dPCpSh35nzaAnLJQNbP7CS08Vd1MOBwzPDJGA/47ldcmHs9WxlfvZ7HaTj+pbVrIwfiigaTwfyOLRlD6y54Z9w2ZC8Tf5MDjfxZi7UABHYJWB+gx35XLfblHzkRoLOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pZTmyLpG; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pZTmyLpG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H6QzKIwSmfFejp0WgfYGwApBPn5BWj9AueYoyESHiu8=; b=pZTmyLpGv5uzvKoAEf6LcZRLoY
	fdKg5EQZT+7+iyB/at67qqVFLP1rCc2ERpMG2r7GYjmm1wrjTwoUE6/HFsb68z/M2qU8RSk7td0dx
	9V5mzhH+0kDqRiLFnr/jHxRCnFT4Gu3F0vgJX5XU2uJzvOmJJGOOiaoCr77VgddmmfvlM/XgqRM/f
	bArM/e3gMzEUbeKe9Fu1ripCb+vQkymuXmO/98tyuf9bvhLijr/lgWqfXnGGr4v1OtBpHO4kfB1Cm
	sm281qalXLqO2ZsPjQA4IMhDnB3w221meunO0GyrFvUgIbUgac5R6FHgRfL2lGqzt5E0MEovbbWAk
	0jzvLkHQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGvEv-000Oea-0l;
	Wed, 14 Oct 2026 11:25:37 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGvEu-000Geq-30;
	Wed, 14 Oct 2026 11:25:36 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
Subject:
 Re: [PATCH v2 3/5] arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
Date: Wed, 14 Oct 2026 11:25:36 +0200
Message-ID: <5262517.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <sashiko-outbox-170941@kernel.org>
References:
 <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
 <sashiko-outbox-170941@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28153/Wed Oct 14 08:24:15 2026)

Am Mittwoch, 14. Oktober 2026, 09:29:25 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] dts: simple-pm-bus node specifies address cells but lacks memory-=
mapped children
> - [Low] dts: irqsteer evades DT binding by omitting SoC-specific compatib=
le and power-domains
> --
>=20
> commit bf42b82f7a33a44c5f4805e13c2e5eb848f29919
> Author: Liu Ying <victor.liu@nxp.com>
>=20
> arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
>=20
> The MIPI-LVDS combo subsystems are peripherals of pixel link MSI bus in
> i.MX8qxp display controller subsystem. Add the MIPI-LVDS combo subsystems.
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/=
arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> > new file mode 100644
> > index 0000000000000..67f5392cfc803
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
>=20
> [ ... ]
>=20
> > +&dc0_pl_msi_bus {
> > +	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
> > +		compatible =3D "fsl,imx-irqsteer";
>=20
> [Severity: Low]
> Does this node omit the required SoC-specific compatible and power domain=
s?
>=20
> The fsl,irqsteer.yaml DT binding schema strictly requires the power-domai=
ns
> property when the fsl,imx8qxp-irqsteer compatible is used. By only specif=
ying
> the generic fsl,imx-irqsteer compatible, this evades the schema's
> enforcement.
>=20
> Failing to model the power domain directly on the interrupt controller vi=
olates
> the hardware description conventions. The equivalent node in imx8-ss-mipi=
0.dtsi
> correctly included both the SoC-specific compatible and the power-domains
> property.

That's correct. Proper compatible and power-domain will be added in v3.

>=20
> > +		reg =3D <0x56220000 0x1000>;
> > +		interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
>=20
> [ ... ]
>=20
> > +	mipi_lvds_0_csr: bus@56221000 {
> > +		compatible =3D "simple-pm-bus", "syscon";
> > +		reg =3D <0x56221000 0x1000>;
> > +		clocks =3D <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> > +		clock-names =3D "ipg";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges;
> > +
> > +		mipi_lvds_0_pxl2dpi: pxl2dpi {
>=20
> [Severity: Low]
> Is this simple-pm-bus configuration correct given that it lacks memory-ma=
pped
> children?
>=20
> The mipi_lvds_0_csr node specifies #address-cells =3D <1> and #size-cells=
 =3D <1>,
> but its children (like pxl2dpi and ldb) do not possess reg properties. The
> device tree compiler (dtc) expects children of simple-pm-bus or simple-bus
> nodes to have reg properties if #address-cells is greater than 0.
>=20
> This will trigger simple_bus_reg and avoid_unnecessary_addr_size dtc warn=
ings
> during the build and violates standard DT architecture patterns.

I think that is not correct. mipi_lvds_0_csr is a simple-pm-bus as it needs
clocks and power-domains. AFAIK as it is not a simple-bus the
avoid_unnecessary_addr_size warning is not applicable.

>=20
> > +			compatible =3D "fsl,imx8qxp-pxl2dpi";
> > +			fsl,sc-resource =3D <IMX_SC_R_MIPI_0>;
>=20
> [ ... ]
>=20
> > +	mipi_lvds_1_irqsteer: interrupt-controller@56240000 {
> > +		compatible =3D "fsl,imx-irqsteer";
>=20
> [Severity: Low]
> Like the mipi_lvds_0_irqsteer node above, does this irqsteer node also om=
it
> the fsl,imx8qxp-irqsteer SoC-specific compatible and the power-domains
> property?

That's correct. Proper compatible and power-domain will be added in v3.

Best regards
Alexander

> > +		reg =3D <0x56240000 0x1000>;
> > +		interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


