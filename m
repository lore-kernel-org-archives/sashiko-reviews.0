Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34686369D42
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786125541; cv=pass; b=NoxDYVcDumtzpngeN61RrDu4HwT0DJ+EiS2+uDscw2pMRF92rnpB9EpJ/1D+KEUkO784WrUKrEpl+LsWjpVO2CFlPCLRGzKimh/7z6mU6eRBxBjTSvMe4Cr+y/wkJfutKOMVcHo9MGxQcAUyyb7SVS5RWr0LtfWZnoaY9eN7amI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786125541; c=relaxed/simple;
	bh=KifaXFQu9tF6aWbmCs03ZjXqJQ4xMHpOYPZarNrPG7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI1bnDcbZ2PZAYxHS1Xf82Wl9A4Kfno+IDk5fc4I0qVdUhXkB8YzEhD5QuIwASTfK4iu0GDrXzFbUH8AZ5vmw4xyVU0wzon9zUWhvI/dyGeNqFEmQNJG7iHywBi9KoEvUTlwlIDeDkevoHzJgYNDElvVoBPU0nnx6fxDboTHPGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=OqvPtaZm; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="OqvPtaZm"
ARC-Seal: i=1; a=rsa-sha256; t=1786125530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QzJSbKGvx2PDYsGwY5DrXb4Mu5zyFa0nzmJ/Wq8DMJ1h4ZFn7ubt7DZqnidBwzz2EH3AuODm0AxnedWChB+KAhadpOrO1jeKje8pMzuhmoTN5BZFAGTSpOGHZWUbURN1st9pXqcpWcQ+ylBW/zx2HqS8rLvyx8fThC8hAGy357A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786125530; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5X66dM6QHHWxY6bBMRQTS1JmqGd1+5fST36EM3XypzI=; 
	b=Tt/Ww/goqTmfvvPIWAwwx+SWH2heRAPbT4OWC0xgfdP4Gohyd51tUICycexLDBqLEm/g6ZmEU6eMr7LgRUdQJ+61Yv0vAn4RW1T4ez1fJzUQrjerDC3XGZuQCc1RwgCJwWT4xTeYw/ZaDaqBFUu2NgTqOVRfcvU3E8c82dKtLRc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786125530;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=5X66dM6QHHWxY6bBMRQTS1JmqGd1+5fST36EM3XypzI=;
	b=OqvPtaZmlVYUECV2meelrS5ctdP+Kzaf9EUb7/3lHk+5hYJHMC1uZoq3dh69kfhQ
	KIOhLQ6keuYnJFuW1ndRmRcvcilurdPqHur6ZDM9494YEcnEREcag7gKS96M0wfLtbY
	htGARHm2QrMDSqN3EICpalkv51x2Xxy4U9o77Zmo=
Received: by mx.zohomail.com with SMTPS id 1786125527192874.9730414852983;
	Fri, 7 Aug 2026 10:58:47 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id E4007180895; Fri, 07 Aug 2026 19:58:43 +0200 (CEST)
Date: Fri, 7 Aug 2026 19:58:43 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Message-ID: <anYanfuZQT4Pz6lC@venus>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-20-0d508505f383@collabora.com>
 <20260806174000.668AB1F000E9@smtp.kernel.org>
 <20260807155140.GA882294-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xvnis4rjdghlkh7f"
Content-Disposition: inline
In-Reply-To: <20260807155140.GA882294-robh@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.110.97
X-ZohoMailClient: External


--xvnis4rjdghlkh7f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
MIME-Version: 1.0

Hello Rob,

On Fri, Aug 07, 2026 at 10:51:40AM -0500, Rob Herring wrote:
> On Thu, Aug 06, 2026 at 05:39:59PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Device Tree schema validation breakage for existing `rockchi=
p,rk3588-dp` configurations.
> > --
> >=20
> > --- Patch [20]: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp=
: Fix sound DAI cells ---
> > commit 2c15bbfcf4dec184872abdf4c2e06063a52d1e2f
> > Author: Sebastian Reichel <sebastian.reichel@collabora.com>
> >=20
> > dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells
> >=20
> > The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
> > possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
> > to select the right interface.
> >=20
> > > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchi=
p,dw-dp.yaml
> > > index 2b0d9e23e9432..c4f8959dd65da 100644
> > > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-=
dp.yaml
> > > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-=
dp.yaml
> > [ ... ]
> > > @@ -83,7 +83,8 @@ properties:
> > >      maxItems: 1
> > > =20
> > >    "#sound-dai-cells":
> > > -    const: 0
> > > +    const: 1
> > > +    description: 0 for I2S, 1 for S/PDIF
> >=20
> > [Severity: Medium]
> > Will this strict constraint update cause make dtbs_check validation to
> > fail for existing in-tree device trees?
> >=20
> > The mainline arch/arm64/boot/dts/rockchip/rk3588-base.dtsi still defines
> > #sound-dai-cells =3D <0>; for DP nodes.
> >=20
> > While the commit message notes this breakage is intentional and will be
> > fixed up separately, could changing the schema without the accompanying
> > DTS updates cause automated CI validation failures and break bisectabil=
ity?
>=20
> Yes, and I don't love the intermittent warnings introduced. As long as=20
> the warnings are on a downward trajectory, I won't notice...
>=20
> Not saying you have to do something here, but this will get more=20
> strict...

I don't like it either, but it's the best I came up with. If DT is
updated first, there will be a warning for the DAI cells being 1
instead of 0. To fully avoid the warning I see these options:

1. update DT binding and DTS in a single patch
2. allow 0 and 1 in the binding with 0 not really working

IMHO neither of those are great either, so I ended up with the
series like this. Regarding the downward trajectory: RK3588 should
be completley free of warnings in dtbs_check at the moment.

Greetings,

-- Sebastian

--xvnis4rjdghlkh7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp2HMwACgkQ2O7X88g7
+pp+Ig//YTasKYth8R0rZG54e32jecsEgJeOQXkU9uTt+XNoLMdVLNAOSz2O1Vz0
T0JwqtSO2hVj6tXqBQ4ZQmtE8FuPpKuUymgJtnOy2w9xSZP2aZzxjbZ6keQw9OEn
4bifhadn1iLTmRrYHoA9IwCn7rSqfgyS5oebPFENqNEKIJ+b9rr+UF6OpxPcPbk5
Z9hYf+NCddXja9C7OWTOYzyVMxaZ30coVr6jDidgrpZcZogXC5SsO7banHrQ71LE
0nQ85i59W1paV/cYNlK6hU5s2Iw+kAL2JyQqqmE6buK5T2ZPYLNpmoom7bI9U65m
CWKFUiHCWJDFB5Sor02KfokvWB9dOVS1TnVj1wxMyBjkAIoIJSd+h0J9RCDnok/d
Cnzd7x1pR7XTcux+w+AE+bJ4w/YQRxYka/E33ntZRXpKXQO8BRjO6p4m0/1a4KqY
0ChKQGMlDatl/oNhAXLRth/tCOGanMjr6bNXVh/0MkgtjGpRb2sA+vWd0kHNF3DJ
nHZwYR+1kntUZpvT5MdIaOpJrFQ83J0xEeQ+uUyFfOjzlSItwr0oUAgnQIdltEwc
cQ+OdwGr8wZm6s/AaPlEtakR7xUiofEUxhQMshASWhwRHL0nljCVXf36/vX7Sn03
JTKhNxI08uW0Fm4b2DNyAEa4dZMGDhP/rUl0SutKeYVeutCZi8A=
=kX1F
-----END PGP SIGNATURE-----

--xvnis4rjdghlkh7f--
