Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C038E8AB
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725135; cv=none; b=uYXjAkVU3fRawiYEW8PwgVX0sBZh/lPN0KxTDJ/bKJJIe6ocUuUs/Q4PNuCVw6JUNXSvFNwinUl2oov/HSXeKJrtiyULpMPBaesbvla89TfLcR1fQRngX+HW7zWwmQmmXYhCDgDOvcIrKgAInl1us9F2rdpRaeaS7shGv/MWSgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725135; c=relaxed/simple;
	bh=DbCTJukolfpS5vBXMuJe1+/zbUuM7hlBYEssvD68LNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7EdIkSZiXw/6MVpKyzzPYfmFSjli/0bqcp8UPzw7etrgMI5aClMcavp3hzcb9TrXf1Br5nS+O/gx9ri5B6hVdDaH9yu4U0UmF7eY69vmA7eQQDzwfbbMQ/ja3OSNxQHNieIUcSXLB5YHu/fxf1uJp1RSDQzdgM+v+LrteWkyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BTgZYYJx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BTgZYYJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XAVd
	fQMKoUNKXhIRLBSmGx+VPPOXsC/vwNmW1w94LKs=; b=BTgZYYJxGNEjDNidHU4Z
	HmhTNvBqE637Ds4eRWtyxo8RIYXNwghwfLcpoV6loo6Rccq1g/tkaDuhWPpIXefW
	dkj2HjrP4Vtv7+eVoKAo03iU8DV6QgzGlPXDpGD3NSqhaoWlN8eUiD/12HuzBq94
	uyCSnw6aeLtAWTXLRCfXJUCM9qFRqAM5k0+zSAuTIiggRfp4qZSnBArImgIW8UfX
	Tc9vlHPrpu0GBxl3bV9Sl7ae7KhZ9fH3ih7o0JH4dYIL2cokGjvTgoyLdbqIP7nI
	jZ7snk/loH8kxwnebZWSrcb/zcf3mBSGl+caF4plroh/TZw6AgI7Rl3lSJYdMvQi
	lw==
Received: (qmail 750881 invoked from network); 26 Aug 2026 08:18:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2026 08:18:47 +0200
X-UD-Smtp-Session: l3s3148p1@G/wlMe1ZrJkujnsh
Date: Wed, 26 Aug 2026 08:18:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA channels
Message-ID: <ao6FRUMWN2eq-nTv@shikoro>
References: <20260825203251.2118-2-wsa+renesas@sang-engineering.com>
 <20260825204204.0E52B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prp2l7oMeMD20m2F"
Content-Disposition: inline
In-Reply-To: <20260825204204.0E52B1F000E9@smtp.kernel.org>


--prp2l7oMeMD20m2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> > index c4ace5585e1e2..bfe55e20f1251 100644
> > --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> > @@ -77,14 +77,14 @@ properties:
> > =20
> >    dmas:
> >      minItems: 2
> > -    maxItems: 4
> > +    maxItems: 6
>=20
> [Severity: Medium]
> Doesn't globally increasing maxItems to 6 allow invalid device trees for =
older
> hardware generations (Gen3/Gen4) to silently pass schema validation?

Will fix!


--prp2l7oMeMD20m2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqOhUUACgkQFA3kzBSg
Kbbb+g//QI6v7WawK7SerzuJxosgC7mCbCTbj2w2BzdCHTIlpix9XBp9BRT2TipX
YdaDbUUZlaTaQKKFdX5SUkljI/90JD9FCYTdXxeRsVDvlLjZxKMQ4ie8VuR41t9m
52tWCwq/zWVOeeIc7SzyRD517+klJ6yQ2q1DcCKm2cZ683RYfoKKfQC/cKRchbvt
4JPRrTCSnx5ngwETawoGYjyBXDEwbn48Xe59rjqVyqix1WiMsEkbCTrrOVVN508o
PDhbKRxyJui5sQwO07vieOvF2A5gcVPWojjNhNQSynjlJtTEPfP4Ew5ePa/FFokg
nAXkWMtUXrA7iEJP+tzlzkmLPsjWY5XoN5+CVgcOg2991IKZjlj4SjKK6BWieBUN
BPQYdgtgfBKgr/mDF7pLAtxpa7Uj1qM9q3uSvokVvqALv0ui31TbcCKs+h1PPLXL
dgM2Z/qq2KARe9JK9PmKCVU3GCrj+4ubjMEud4j3lkD5GNQeBVmuGQF6QMlE1NEs
pfa5CCyEvQME3WD/W7BkgJUpfhzPBMQM7HoIVRLQi5J6I6HTcnpxHtx2ZKtFhO+P
jAJelHtc4WpADEBVC+8IzTYZhG1/964EjRDDYSlCOyt+tu5lAQLBgKwRIK1xJjta
6EEpL/cTg5qVsh4wx24gxlH+xA0wa3FKiC3DpIAss5X+Uc2AiX0=
=C/wK
-----END PGP SIGNATURE-----

--prp2l7oMeMD20m2F--
