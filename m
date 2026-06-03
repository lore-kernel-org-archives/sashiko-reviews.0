Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A814028DC;
	Wed,  3 Jun 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471664; cv=none; b=FNA/6ZosImKSzmpU+kDz9A0nKdd01M85zE9BmIkqNgu/6ce3E0XgOMOk88mNApg+yXgyMj14YWUZpUPj2tEDhR6oGYiMTdsGo5Q/vVCkO5R6byakODoaNAnsG4yU2gDBkLGXFGFuYhfLXVJPb3G6te7rTfLDy93OClvq8ZVvrHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471664; c=relaxed/simple;
	bh=degubvwbp4XhVRmmwxuQ4QA2I0c53w+k2ABIBxpCgNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUeoMhH0UAgc8ha8FBD/0lv1eiqkp0n+mibyO9F6kRhCbtbWIvsmVDJQ0M/8ALF+gRVmQxkhcnCx1ZTyjWWMliuJdf53FCsURKmgtIzBs1XPJeg+SaMhOyJBpVGkalCkCyBStFiv5Xk0Z/QaYfwlOu5cqRKBG7UfYxX8CpBfEgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Vo0z9t6A; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Vo0z9t6A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xPhkAqNarpr7frrVANy2tD5r7lHkqN54dU3a/6+NLlU=; b=Vo0z9t6AEd7h6QggsM6/1b9U98
	YF+dVrW5MfZGFkoy9ROGvplgjmCkB3guCA4tvo5h5s/72G1HFqvbA2VrSbW7LUzdnvAuyisJB1xyT
	OEQRXgkAh8hu8YwAv9eugiQHvCSCbWtRTQQuOGlLHPnndDXJCeEb1UCMs4Q9wRzm6nFcm6a9aEWU1
	ggWY1FRKNrKtvdWHpWQUM+n+c0LOK7jpm0P/jMemUBFZUxjYMT/kHkGC6xuZWdXFCvc3s3XAO86KI
	W9oLBL9Mog3yMqUMe4HXfamtj+tMcFxE0VtOjuxihoK+NFAx+uU+YvL3HHbnWufo3Ke9OAQ4keK9p
	kNQtfA1Q==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUg0q-0007eF-1V;
	Wed, 03 Jun 2026 09:27:40 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wUg0p-000DWb-1Q;
	Wed, 03 Jun 2026 09:27:40 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, Frank Li <Frank.li@nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 wsa+renesas@sang-engineering.com
Subject:
 Re: [PATCH v3 2/2] arm64: dts: freescale: add initial device tree for
 TQMa8MPQS with i.MX8MP
Date: Wed, 03 Jun 2026 09:27:39 +0200
Message-ID: <3356319.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ah3i63BKcwav8t7n@lizhi-Precision-Tower-5810>
References:
 <20260522075656.841745-2-alexander.stein@ew.tq-group.com>
 <20260522082439.011DF1F000E9@smtp.kernel.org>
 <ah3i63BKcwav8t7n@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)

Hi Frank,

Am Montag, 1. Juni 2026, 21:52:11 CEST schrieb Frank Li:
> On Fri, May 22, 2026 at 08:24:38AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [High] Off-by-4 error in `gpio4` line names array assigns GPIO names =
to actively driven Ethernet pins
> > - [Medium] Redundant `gpio-hog` nodes for pins concurrently used as int=
errupts by drivers
> > - [Medium] Missing `status =3D "okay";` for `pwm2` and `pwm3` will caus=
e backlight overlays to fail
> > --
> >
> > commit 33a28c1f4850f44b57edd7bcc9794f6b7f5401a7
> > Author: Paul Gerber <paul.gerber@tq-group.com>
> >
> > arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8=
MP
> >
> > This adds support for TQMa8MPQS module on MB-SMARC-2 board.
> >
> ...
> >
> > > +&gpio4 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&pinctrl_gpio4>, <&pinctrl_sdp>, <&pinctrl_espi_rst>;
> > > +
> > > +	gpio-line-names =3D "RTC_INT#", "GPIO8", "", "",
> > > +			  "GPIO9", "ESPI_RST#", "", "",
> > > +			  "", "", "", "",
> > > +			  "", "", "GBE0_SDP_DIR", "",
> > > +			  "GPIO7", "", "", "",
> > > +			  "", "", "", "",
> > > +			  "", "GPIO0", "GPIO1", "",
> > > +			  "GPIO2", "GPIO6", "", "";
> >
> > [Severity: High]
> > Are GBE0_SDP_DIR and GPIO7 placed at the correct indices in this array?
> >
> > They are currently at indices 14 and 16, which correspond to GPIO4_IO14=
 and
> > GPIO4_IO16. However, these are actively driven Ethernet lines (ENET1_RG=
MII_TD2
> > and ENET1_RGMII_TX_CTL) as multiplexed in pinctrl_fec.
> >
> > Could this be an off-by-4 error, and should they instead be at indices =
18 and
> > 20, which are explicitly multiplexed as GPIOs? If exposed to userspace =
as
> > GPIOs, could manipulating these active Ethernet TX lines cause hardware
> > conflicts or disrupt network connectivity?
>=20
> Is AI said true?

It's actually true. This is an off-by-4 error. Fixed in next version.

> >
> > [ ... ]
> >
> > > +&pwm2 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&pinctrl_pwm2>;
> > > +};
> > > +
> > > +&pwm3 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&pinctrl_pwm3>;
> > > +};
> >
> > [Severity: Medium]
> > Since the backlight_lvds0 and backlight_lvds1 nodes on the baseboard re=
ly on
> > &pwm3 and &pwm2, should these controllers have status =3D "okay"; added=
 here?
>=20
> Make sense, in dtsi, pwm2 pwm3's status is disabled.

They are disabled on purpose, the same as for the backlights. Both the
backlight and pwm are supposed to be enabled in display overlay. I don't
see a problem here. I'll add the overlays in the next version as well, so
it's visible.

Best regards,
Alexander

> >
> > If left disabled (as they are in the SoC dtsi), won't any overlays that=
 enable
> > the panels silently fail when the backlight driver cannot acquire the d=
isabled
> > PWM channels?
> >
> > --
> > Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260522075656.841=
745-1-alexander.stein@ew.tq-group.com?part=3D2
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


