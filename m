Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9687481FC3;
	Mon, 18 May 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122351; cv=none; b=oHma/eNZkTJUmIzz7WsIxkS8es21hcze/svgMfOr/BL7bjEqeL0bZVjTg5QnTxIKetVTFjxSq/hs329DVX3j9wseYMaiT1BG5hdhpDDG2btWbDtjKMSbje/7VmGsXpAwkhwxkl5guDlIklB82/lRhFtoRcJigpbs+NLHcgT96Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122351; c=relaxed/simple;
	bh=Stf0ehQABcL3BWcb4wO+GZaxhOMvSkzAfcn2Ijq0AG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKxEyT0+jFU5Xc0U1UBJ6WzZ/bytHIcVhnWlDdffjK5b8QJ2E+7sR7iNc4Pe7v0oX1Ez7mJYwqQ18NV/aslzo7m9jyZhRlV+e/bcF45JcecE4eYP9FSeeH6TcXzmxo08p0ix+SYhfm2AJ4NKJuVBzdNcBcZGqAJQp5V/izq5BVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ri+taL0k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ri+taL0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DCCC2BCB7;
	Mon, 18 May 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122351;
	bh=Stf0ehQABcL3BWcb4wO+GZaxhOMvSkzAfcn2Ijq0AG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ri+taL0kKcikhS3U246fV7VwmCwQVJ6iR4pUT7Y1ejnazoXIXqjNukoVEtnXYq4lE
	 H9J3jMBXFgj+4iIZwHXfMn0US77NnnM26zye4J+RRc4jt/+lY7C4FT9sbpQWzLkoXS
	 3lKf16QcCWIYaD112BN30pqxYvycFepjSujK34DF99lOud7ieetTWqTwDUzu+yfk5x
	 lXurmf8G/GOUGgYBX1RIb3baq/h9LbplM+2ki7B+fyjHYAjnvf0daBI/oLqZSyouZd
	 NdgD8a3RBpVpTsXSmGL5WNhSxi+QnnX9e1cSQniKU9PWXZuOhZia/Y1d5DQU0wQZSI
	 16mpmxkrjQ6TQ==
Date: Mon, 18 May 2026 17:39:08 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "lianfeng.ouyang" <lianfeng.ouyang@starfivetech.com>,
	devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: Add bindings for StarFive JHB100 SoC
 trng controller
Message-ID: <20260518-try-county-894e2fc4a433@spud>
References: <20260518065243.20865-2-lianfeng.ouyang@starfivetech.com>
 <20260518070622.446D9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nobh5KDaNa7Qm609"
Content-Disposition: inline
In-Reply-To: <20260518070622.446D9C2BCB7@smtp.kernel.org>


--Nobh5KDaNa7Qm609
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sashiko devs,

On Mon, May 18, 2026 at 07:06:21AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Removing the existing 'starfive,jh8100-trng' compatible string=
 breaks backwards compatibility.
> --
>=20
> commit 847e83dc6a2024f6cb7a70fd0453035b2808bedb
> Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
>=20
> dt-bindings: Add bindings for StarFive JHB100 SoC trng controller
>=20
> This commit adds device tree bindings for the StarFive JHB100 SoC TRNG
> controller, updates the maintainer, and removes the JH8100 compatible
> string.
>=20
> > diff --git a/Documentation/devicetree/bindings/rng/starfive,jh7110-trng=
=2Eyaml b/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> > index 4639247e9e510..d21769b7d54e6 100644
> > --- a/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
> > +++ b/Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
>=20
> [ ... ]
>=20
> >  properties:
> >    compatible:
> > -    oneOf:
> > -      - items:
> > -          - const: starfive,jh8100-trng
> > -          - const: starfive,jh7110-trng
> > -      - const: starfive,jh7110-trng
> > +    enum:
> > +      - starfive,jh7110-trng
> > +      - starfive,jhb100-trng
>=20
> Does removing the existing "starfive,jh8100-trng" compatible string break
> backwards compatibility?

The commit message is perfunctory but does attempt to explains this.
Since the bot reply fails to retain the commit message as quoted text,
it's annoying to go figure that out.

It's really annoying that this happens, especially when the LLM text
references the commit message. Can you please change the email response
settings to retain the commit messages?

Cheers,
Conor.

>=20
> Device tree bindings represent a stable ABI, and removing the previously
> merged "starfive,jh8100-trng" string breaks dt-schema validation for any
> existing or downstream device trees that used it. Even if the hardware is
> no longer supported, the standard practice is to retain such strings,
> perhaps optionally adding "deprecated: true", rather than deleting them
> outright.
>=20
> > =20
> >    reg:
> >      maxItems: 1
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260518065243.20865=
-1-lianfeng.ouyang@starfivetech.com?part=3D1

--Nobh5KDaNa7Qm609
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagtArAAKCRB4tDGHoIJi
0o12AQDfhow6+UreCj+Kxz2nab/sMC839yIeHrsR1Pq22+htBwD7BfQZx0HnYdXo
fxDeTRst6kAiF7iC3miaaV0wMcgM1Qk=
=lwZU
-----END PGP SIGNATURE-----

--Nobh5KDaNa7Qm609--
