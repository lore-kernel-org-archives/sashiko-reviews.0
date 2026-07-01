Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADC35E1C0;
	Wed,  1 Jul 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920259; cv=none; b=ZAyTSeTbbqW0etKi8OTlttezTgSplJsIyIgg+jPKiQVNtZht0ch6X/yS2KatsTHElu5Xkl43fpoD4+H4Wv8aPio7y8n6yW5c+7td/9IR2uTTOCHkhjDWUsD45jee5g60CN19yrhjbsGNC3ALBiZEXeGxG/ajyaHxVVHvSxMJ6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920259; c=relaxed/simple;
	bh=VvIoblXm1X/tPSKbRBSuGnldR1RB2yvtUeqUtUOCdWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVxyh7wmKpmKuua4knhQWGGfaceVpFbCB9d91umSxiMvSDvsah71h2FUAzHxtv9mtH7ODWigPqYrAPx0vMT3t5o+02PuqHOdOcBXTmvFFC9wYAVAxxpjFjAYpoa4sGbbDFOlNK4zhCeqhHbCI4iPTy5GRYlg3pgdbR79UdpNQzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OClQymhQ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OClQymhQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XzHsAIiohOX4DX5StnSfkUvqP8C5JNbxsBNcOJnj0rE=; b=OClQymhQGEv99ZHRnzybIl9YvS
	/IRVrKiKnsfUvU5QsSifCbYcDZF4sNgGJUNm+JweKSvZCRCKntsKGN9BBux1lHSxGTTciW3Mq7PQm
	Bxt/qwpQhLBQ3vEQYZYezw6oXOssspH8ih+wlwmPCL/JxWFfsAydN/ZnJ62+yj+PUTZ4kNdcWI6yj
	9etnmg7nukA7FFpU5OKyH5GbBxYU4fZmZDOGXUggtlKNckbH5Gb9MoiPkjQzabffKvIrEatNlVy37
	A5mbSwJWm+qZftkM2zjcDltr4RpzyWMMJ1+FiZJzyyzjPGARk1q9jHmBfi0CwVyaXRIuRQ55v7A+A
	cit6PxBA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wex0I-000Psz-2v;
	Wed, 01 Jul 2026 17:37:34 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wex0I-000OUc-2S;
	Wed, 01 Jul 2026 17:37:34 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com,
 imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v6 1/1] arm64: dts: add tqma9596la-mba95xxca
Date: Wed, 01 Jul 2026 17:37:33 +0200
Message-ID: <7985027.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <akUsE6A6lX0mgM5g@SMW015318>
References:
 <20260701082611.3126036-1-alexander.stein@ew.tq-group.com>
 <15795907.O9o76ZdvQC@steina-w> <akUsE6A6lX0mgM5g@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28047/Tue Jun 30 23:29:24 2026)

Hi, Frank,

Am Mittwoch, 1. Juli 2026, 17:02:43 CEST schrieb Frank Li:
> On Wed, Jul 01, 2026 at 10:50:11AM +0200, Alexander Stein wrote:
> > Hi,
> >
> > here some comments about the findings.
> >
> > Am Mittwoch, 1. Juli 2026, 10:45:22 CEST schrieb sashiko-bot@kernel.org:
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > > - [High] Hardware components (PWM fan and 10G SFP) remain permanently=
 unpowered due to disabled regulators
> > > - [Low] Dead code: Unreferenced `pinctrl_ethphy0` node
> > > --
> > >
> > > commit f54617810555494fd6b435aa3ac070a14b264e01
> > > Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > >
> > > arm64: dts: add tqma9596la-mba95xxca
> > >
> > > This adds support for TQMa95xxLA modules, designed to be soldered
> > > on a carrier board. MBa95xxCA is a carrier reference board / starter =
kit
> > > design. Enable the external accessible PCIe controllers as host, add
> > > clocking and reset GPIO.
> > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xx=
ca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > > > new file mode 100644
> > > > index 0000000000000..e90f37bbdcd80
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > >
> ...
> > >
> > > > +	pinctrl_ethphy0: ethphy0grp {
> > > > +		fsl,pins =3D <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_BIT=
9		0x1100>;
> > > > +	};
> > >
> > > [Severity: Low]
> > > Is this pinctrl group missing a reference?
> > >
> > > It defines pin configuration for the ethphy0 IRQ pin, but doesn't see=
m to be
> > > referenced by the ethphy0 node (e.g., via pinctrl-0) or any other nod=
e.
> >
> > This pad is connected to gpio1 which is under control of the system man=
ager,
> > so Cortex-A55 (Linux) has no access to it.
>=20
> If not one refer it, it will never be set to GPIO at all.

At on Linux side. But this pad is owned by System manager (SM) and will be
set and used there exclusively.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


