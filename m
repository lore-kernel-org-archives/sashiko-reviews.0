Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F52D738F;
	Tue, 13 Oct 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900318; cv=none; b=KjyNhV8gfpwXbOLi1xbMJWnziO5ihneIhdblWdKv1G08D3WNYF35qe9xWd0WsG0SUVtkvKi3p5xHH+X8VdIrkr3mTWRc5PVHOMS1SG+xXyNhktjRCiQrcsIq2gYhztPg4u98kdj75vq/zUN+riCHIjyLE5Mlb1HgmXouKImWRWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900318; c=relaxed/simple;
	bh=uEQ2tY9xTG8yKAecuC6cIO200KOxqrXCYwFmpV3eRv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYzEX5egdYa1WytnV0yvuWPKCAERhtgdTkrLqh2IGce3H/oHvTUy8PWkziTLjDvU26HcgQQ4CjiXYlV7QdA+kgeDqsw1jg0ie+hdeMz+p95lnmOLYo1EqwqksunFNh/NoYzdLG53MJ49/BHuGhaH7K9N8o81IrnlSsA/ry2aNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=b7EnCqfg; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="b7EnCqfg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=plEBybSZs17ofMuAql8ugZTiTKQWX5rpFZ+CNp+rQ5I=; b=b7EnCqfgNyAuiYM2hWQuUcSZ/9
	BazouujCmceVJE8w4EpCnRZg+p6ycrKpM6mhEQnCeDHNoEXey019Q9kv6q5rqeolY0reFBvRQjYmh
	fFjVULtGgjdPnFfJyduak3ySqj+qiQF8nhJ8l4XeIENiOYDZB//9TVD6g4sAktGeBMhDlQqftVTQC
	HdgN1p8mmK131FimY2kkYRhP0F0YKkfYrUDFe/FFGWuqev6sPLEdB394NCQ6KWBJwt1r7+y88fdk7
	6QohO8bc652qdCPf/yfDqgOxiW7iESqOMbW5n16hvnPg+b5rEummT59mo4BFDDkaQiN5RpIcIqapK
	1L1LqAeQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGd7x-000L1C-34;
	Tue, 13 Oct 2026 16:05:14 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xGd7x-000HRa-1z;
	Tue, 13 Oct 2026 16:05:13 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: imx8qxp: Add display controller subsystem
Date: Tue, 13 Oct 2026 16:05:12 +0200
Message-ID: <5866247.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <sashiko-outbox-169627@kernel.org>
References:
 <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
 <20261013111737.998282-3-alexander.stein@ew.tq-group.com>
 <sashiko-outbox-169627@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28152/Tue Oct 13 08:26:14 2026)

Am Dienstag, 13. Oktober 2026, 13:29:55 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] arm64: dts: Missing power-domains and compatible override for =
dc0_irqsteer
> --
>=20
> commit ae70e9d2f5935bf44872ed0bd30be554653b06e0
> Author: Liu Ying <victor.liu@nxp.com>
>=20
> arm64: dts: imx8qxp: Add display controller subsystem
>=20
> Add display controller subsystem in i.MX8qxp SoC.
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8-ss-dc0.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> [ ... ]
> > +dc0_subsys: bus@56000000 {
> [ ... ]
> > +	dc0_irqsteer: interrupt-controller@56000000 {
> > +		compatible =3D "fsl,imx-irqsteer";
> > +		reg =3D <0x56000000 0x1000>;
> > +		interrupt-controller;
> > +		interrupt-parent =3D <&gic>;
> > +		#interrupt-cells =3D <1>;
> [ ... ]
> > +		clocks =3D <&dc0_lis_lpcg IMX_LPCG_CLK_4>;
> > +		clock-names =3D "ipg";
> > +		fsl,channel =3D <0>;
> > +		fsl,num-irqs =3D <512>;
> > +	};
>=20
> [Severity: Medium]
> Is the dc0_irqsteer node missing a power-domains property?
>=20
> If it lacks power-domains =3D <&pd IMX_SC_R_DC_0>;, could this trigger a =
bus
> fault (SError) during boot or suspend/resume cycles if the irqsteer driver
> accesses its registers when the IMX_SC_R_DC_0 power domain is off?

I cannot test suspend/resume but adding the power-domain is reasonable.
Will be added in v2.

> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > @@ -0,0 +1,236 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +&dc0 {
> > +	compatible =3D "fsl,imx8qxp-dc";
> > +};
>=20
> [Severity: Medium]
> Should there be an override for &dc0_irqsteer in this file to set its
> SoC-specific compatible string?
>=20
> For example, setting compatible =3D "fsl,imx8qxp-irqsteer", "fsl,imx-irqs=
teer";
> here would ensure the node matches correctly. Omitting the SoC-specific
> compatible string might mask the missing power domain violation from
> dtbs_check and prevent SoC-specific driver quirks from applying.

This is a good idea. I removed the "default" compatible, similar to the
other dc nodes.

> &dc0_irqsteer {
> 	compatible =3D "fsl,imx8qxp-irqsteer", "fsl,imx-irqsteer";
> };

This is added in imx8qxp-ss-dc.dtsi instead in v2.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


