Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D746F498;
	Fri,  2 Oct 2026 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934301; cv=none; b=DPHL7ylBLjJ/mk287LdRp81djvZLnXeasqq1IS3I5wv7fa6tmIn9Yqiam/9MaBZYeh9nJM/2rTg3BdCtIObbrrRH/JRmCgNk0WefKFAlBNJshAo1XdwK6z+l1RYjDLr0+7FAHmREPe8991Ay3oAFYEgkbTEaOxmC9P/SeXNTGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934301; c=relaxed/simple;
	bh=4of8sWxprnt9S/BW3WWLJvAo0dudddC8g87jOW2r9Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGcRrZHKGdlNZPWSlBHUXHWYQZ0LeTrmEfRCKDkeDWZAIf5GRUIDxb6VeSqrJNhyaqr/qvrgfn2nHc/XTaBWsGFuobRTPht8FJS+eX/KeHJ1R1p1dHcxb3OTYvFxpnE8l3q5AlKvu2IoeTVEvhYftO9WrIq89JGTOqVDzSguquc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Isjivyed; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Isjivyed"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=liOd2sCFDhODfd60RF9lAvSvZGgNsQRWBBUInqpCsH8=; b=Isjivyed81TOzDJkWA28MJwL3h
	IHOIct94MrgGwCS+4AdLXRLOQdJKUrzNkuRb26xcgPALsyIYS5ZtTlmIzzFzFjFHmurVWPEupfath
	m5x5gTzQe9cfMFsQUlSy3sgzQXLF7HhLmHKa5OXtYLajNDQL66fwHv3ALLcfSfdhFO7x8zNWePW32
	MKsKvJMrolxH54pEAiYiymaFi6ekIU79SquVaV5y5CMaYYhj03Vhnd+Wva9H3fE8I3VWc9v8DAVFU
	F1SERbnu5ShDm9MkDAbTvvtUHCdYm/i8YoooyLCMIO/ETJzv0cAXHE3/2D4hAiT63eD1rndjgnhPr
	C1/NXlnA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCZp2-00016B-1E;
	Fri, 02 Oct 2026 11:44:56 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCZp2-00095u-0k;
	Fri, 02 Oct 2026 11:44:56 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/8] ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL
Date: Fri, 02 Oct 2026 11:44:55 +0200
Message-ID: <4993405.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261002091447.0E8F51F00899@smtp.kernel.org>
References:
 <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
 <20261002081417.2092471-3-alexander.stein@ew.tq-group.com>
 <20261002091447.0E8F51F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)

Am Freitag, 2. Oktober 2026, 11:14:46 CEST schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] kbuild: wrong base DTB for imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jv=
hg33
> --
>=20
> commit 008daca5167f9a5874f9d9c4e80bdfc8d57fb2cc
> Author: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL
>=20
> This commit adds the LVDS DT overlay for the TQMa6ULxL board, reusing
> the overlay file from the TQMa6ULx board.
>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp=
/imx/Makefile
> > index ea0799ba1893e..734d40b8d389c 100644
> > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > @@ -421,8 +421,10 @@ dtb-$(CONFIG_SOC_IMX6UL) +=3D \
> >  	imx6ulz-bsh-smm-m2.dtb
> > =20
> >  imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ul-tqma6ul2-mba=
6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
> > +imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ul-tqma6ul2-mb=
a6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
>=20
> [Severity: High]
> Should this use imx6ul-tqma6ul2l-mba6ulx.dtb as the base instead of
> imx6ul-tqma6ul2-mba6ulx.dtb?
>=20
> Using the non-L variant base DTB here for the TQMa6ULxL board might boot
> the board with incorrect hardware definitions.

That is correct and will be fixed in v2.

Best regards
Alexander

> > =20
> >  dtb-$(CONFIG_SOC_IMX6UL) +=3D 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg3=
3.dtb
> > +dtb-$(CONFIG_SOC_IMX6UL) +=3D 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg=
33.dtb
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


