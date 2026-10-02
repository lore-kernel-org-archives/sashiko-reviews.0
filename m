Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19743DA7DD;
	Fri,  2 Oct 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934748; cv=none; b=fNDY1t1szqL+hWJKR+KDu8Hpe+AmkeyR2yxNrBdckomNbc2MUyYrfF5CXFBuAXpqzqPh3yx57oUwOQ0vYSL6hiOGD2nZ0giOO1LcvZuu1qQ5V4LnjUgV5zhGrpQ9bq2PkxlYwZ+d7ehj21tN3hSfnWvAnczO/sBBrLJo+G1+6mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934748; c=relaxed/simple;
	bh=hWF5NVPDGeavTZ2CmTxvVgwrzuWuvj2xDBCIgVZsAoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AeKdmvWGPyzHvkiTErifkuy4ZWNE9dnE0lDZX6xOaxYMrIiXNeBqgIXncDieqSzu4aaWkIhQKi3FAgnMYpMnC9FM0AYDkv25W7paMfFfm0zvJFpLn6m+xC7Y7rrcsKAbW6FjEVDc6Ib0i85XxvOZgUD3KB7oY2e2glUv27rj3VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EelR0GJe; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EelR0GJe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=23bZN+sNeGjgUvD43/rhOqW+40shzWtYC3P1eUNq76U=; b=EelR0GJe27E7hO4k0wYu+1/QJF
	e1UbhLAE6s1ciFt0/JrwKnVxyQ0ujmK7lvidK6sitWt1qlPq43svUMRiGaXXt28xtz9qvpf9x1hfO
	1oz9pR8DXkNEBZvHNAc8YTZdQ5Zhl/HdB65iJ0TOqkVHrrc/9NejynkFfgnV0Yvs1CjhhEARCVPhP
	ROh7Ll41Xlx48aNY3lWrhU7oARxTAKs5+UZivTwRUIeYhdvuiYuxPm58bgkuEWTSk0TynZf/3NWjS
	3phDtkKsEUuZEKysI1PrBeOKwnO4I1O+fLL3ofqb86Z6kZ+ahzSVt2EmaVLmQ26c/s7T+YpgaqRKA
	fsoZ3Wew==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCZwF-0002aY-0v;
	Fri, 02 Oct 2026 11:52:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCZwD-000MG3-3A;
	Fri, 02 Oct 2026 11:52:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 robh@kernel.org, conor+dt@kernel.org
Subject:
 Re: [PATCH 7/8] ARM: dts: imx6ull: Add parallel display DT overlay for
 TQMa6ULLx
Date: Fri, 02 Oct 2026 11:52:21 +0200
Message-ID: <8176216.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261002091446.3571F1F0089A@smtp.kernel.org>
References:
 <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
 <20261002081417.2092471-8-alexander.stein@ew.tq-group.com>
 <20261002091446.3571F1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)

Am Freitag, 2. Oktober 2026, 11:14:45 CEST schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dts: Makefile: incorrect dtbo included for fc21 dtb target
> --
>=20
> commit bc626d69455423e37445a45960310a9fe70cea35
> Author: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLx
>=20
> This commit adds parallel display device tree overlays for the TQMa6ULLx =
board.
> It reuses the existing .dtso files from TQMa6ULx for these new targets.
>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp=
/imx/Makefile
> > index e86b9c1a63005..5f190900904ab 100644
> > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > @@ -427,6 +427,8 @@ imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs +=3D=
 imx6ul-tqma6ul2-mba6ulx.dtb im
> >  imx6ul-tqma6ul2l-mba6ulx-cdtech-dc44-dtbs +=3D imx6ul-tqma6ul2l-mba6ul=
x.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
> >  imx6ul-tqma6ul2l-mba6ulx-cdtech-fc21-dtbs +=3D imx6ul-tqma6ul2l-mba6ul=
x.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
> >  imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ull-tqma6ull2=
=2Dmba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
> > +imx6ull-tqma6ull2-mba6ulx-cdtech-dc44-dtbs +=3D imx6ull-tqma6ull2-mba6=
ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
> > +imx6ull-tqma6ull2-mba6ulx-cdtech-fc21-dtbs +=3D imx6ull-tqma6ull2-mba6=
ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
>=20
> [Severity: Medium]
> Should this target use the fc21 overlay instead? It looks like it is
> incorrectly including imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo for the
> cdtech-fc21 target.

That is correct and will be fixed in v2.

Best regards
Alexander

> >  imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs +=3D imx6ull-tqma6ull=
2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


