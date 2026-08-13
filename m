Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1CB4A21;
	Thu, 13 Aug 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629369; cv=none; b=DQk0T3TK8gbkR0ZHLpz2R3j7dnsQtXvlwHwB+sWxrQ44u1IPOUiIUEfXWU3fA8IdUieB/DAKngsAvGSpxyCmSakiSeNrHu3wGSKA4xYe/PZlpY9I4Z8C4Yr6+57Fm9FoQY4HO/tRrwu9rMqB7XVgl5FflTWq8V3QbsPYNbLPSik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629369; c=relaxed/simple;
	bh=yWYTw39zIbgcmSbmey890cc9ZgRI1QY1zthecXTEb1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VK0Ja5U2ynRUA7EWgQIELv4sh2SyZFzckdb7TGwnE/5IuIBzviVsDtC4XryV+jnPs+W7ETTx2sk6ps5DuW+vKcZCq7zbgNsF9F9vdiBXWtXOurrfWFuWItNZGMZMhSo3suw3WWe1kQAcq5Jpaa+ZumTJaRg28n2F6QNbfcRs2a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mpyTWxKn; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mpyTWxKn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2ZUinKNyUo3XcfxWkaOsI90dMllxe5U/OvSncOxGsEI=; b=mpyTWxKn7N8lX2KifH7f0/03MF
	ZzV2U+sfAyHwiuG7BznZWgCWbu8BUkmXS5BrlXVMr7aoJfTuE7FovtIeweMjYBO0krFrgOk/3iU16
	EtYymcwuYLKMGuFjYjhzHp9bZAtPZTNevssVqSG+c4Km/NS/qqAkfVK3ShMavsmUJj8GFRhl0+0cf
	EdV+9wrO2HYJcHidH79suapxmmGvrtf0g6F79sWYZy5LT3S/6e5kSmRK4dMSxYt+AZBFc7aNUVcg9
	Y5wTzI2leuZVC8DInw9ezD17yU1TC268FwdLtGH5bdbjeOvKh4Ak3AmHBhds+rGHXaBQLmTykUISH
	wbS6tJMA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuVTb-00093P-0b;
	Thu, 13 Aug 2026 15:28:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuVSW-000Lcu-0L;
	Thu, 13 Aug 2026 15:28:07 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
Date: Thu, 13 Aug 2026 15:28:06 +0200
Message-ID: <6338721.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260813125131.A76481F000E9@smtp.kernel.org>
References:
 <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
 <20260813121250.3993187-2-alexander.stein@ew.tq-group.com>
 <20260813125131.A76481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

Am Donnerstag, 13. August 2026, 14:51:31 CEST schrieb sashiko-bot@kernel.or=
g:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Leftover `gpio-hog` nodes (`enet1_int-hog` and `enet2_int-hog`=
) for Ethernet PHY interrupt pins double-book GPIO resources.
> --
>=20
> --- Patch [1]: [PATCH 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt =
support ---
> commit b452753cee9dad50d404387319c21ed7231c45d2
> Author: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
>=20
> This commit adds interrupt-parent and interrupts properties to the ethphy0
> and ethphy1 nodes in the device tree. It configures the Ethernet PHYs to
> use level-low interrupts provided by the GPIO expander.
>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts=
/nxp/imx/mba6ulx.dtsi
> > --- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
> > @@ -214,6 +214,8 @@ ethphy0: ethernet-phy@0 {
> >  			clocks =3D <&clks IMX6UL_CLK_ENET_REF>;
> >  			reg =3D <0>;
> >  			max-speed =3D <100>;
> > +			interrupt-parent =3D <&expander_in0>;
> > +			interrupts =3D <6 IRQ_TYPE_LEVEL_LOW>;
>=20
> [Severity: Medium]
> Will this conflict with the existing enet1_int-hog in the expander_in0 no=
de?
>=20
> Further down in this file, expander_in0 still defines these pins as
> gpio-hogs:
>=20
> 		enet1_int-hog {
> 			gpio-hog;
> 			gpios =3D <6 0>;
> 			input;
> 		};
>=20
> 		enet2_int-hog {
> 			gpio-hog;
> 			gpios =3D <7 0>;
> 			input;
> 		};
>=20
> Does leaving these redundant gpio-hog nodes in place cause the device tree
> to claim the same hardware resource twice? This might result in a resource
> ownership conflict between the GPIO and IRQ subsystems, potentially causi=
ng
> the IRQ request to fail and fall back to polling.

Because drivers/gpio/gpio-pca953x.c does use GPIOCHIP_IRQ_RESOURCE_HELPERS
these hogs are actually redundant. Will remove in v2.

Best regards
Alexander

> >  		};
> > =20
> >  		ethphy1: ethernet-phy@1 {
> >  			compatible =3D "ethernet-phy-ieee802.3-c22";
> >  			clocks =3D <&clks IMX6UL_CLK_ENET2_REF_125M>;
> >  			reg =3D <1>;
> >  			max-speed =3D <100>;
> > +			interrupt-parent =3D <&expander_in0>;
> > +			interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> >  		};
> >  	};
> >  };
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


