Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B143FE644;
	Tue, 22 Sep 2026 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100213; cv=none; b=WXSPffGUoTE2/u40hZunuYDWrhmBu2hNml+TxObz6BFnAdmiC1JX9CdNRo+PvX6372g4Mx1OClLZXyerR9z//euVfDtwbLO+/b7U6NmLVgKtctebZsm813QpiMqLVbkOM9wT66H0osOnxFIxAZjBIYqYnJBW/95GAR+8Shs97SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100213; c=relaxed/simple;
	bh=dz1CFvaNtCGBUblMCs/3qyd/jE7PVNYRiBvUfjD03yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui3hQIH6ydlRo7lCVORx6GMqpQW6DBJ/WrXD1OIUDTFM70w9xQv+umpQygadFjGlDDyLeJUkhYAL5E++NNlIhFNq+fMZUgQt0p92U1DhZntJ8P4DZgBn3lKWMg26CmSfq1qjhDE35ssLgjXh1TVaEN6lJ0Lt6aES898Y3JsmA1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgjC7Vg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgjC7Vg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681A11F000FF;
	Tue, 22 Sep 2026 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100212;
	bh=TNrvPAH0QlIp8jGccbtayU0zThHOeielkfDbXFqQA20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PgjC7Vg3axhCcco3eUo/EPIoJvkk/h0zYg2lAHWG+Q2XZrrEzTp1OKwBKz01wgS5d
	 Ui9gJPb+x5vJZwoZZoyC5+xxYVQEVjyHydw5BvDUMrPrDYDPW9hia5UNs4QM9oJpFg
	 tdwj9I2OJUhC3j3THiy83MySKYqhT8J8WCBvPVI9zhRiVomCQNGOgzxTTSN2GENZnH
	 tRf1fHEJrgdaX01Ybq45WDyYyfTvL8VB/Omc39jCQGAT2x1oM/IE/GKDcd6nzuAaJg
	 1LciSyUi0Jxr6mZ+2aTpn1n8CDmkNj3nGgD+I0pYlOKTDHARJnfTzZhzk1+fxRvsvU
	 9srn5e4KDB6Qg==
Date: Tue, 22 Sep 2026 19:03:29 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: panel: Add JDI NT35596S
Message-ID: <20260922-stress-creole-094d9e68fe6a@spud>
References: <20260921232609.3130272-1-robh@kernel.org>
 <20260921233127.C2F1E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y7+JQJdZ48SF86o1"
Content-Disposition: inline
In-Reply-To: <20260921233127.C2F1E1F000FF@smtp.kernel.org>

--Y7+JQJdZ48SF86o1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:31:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] dt-bindings: incorrect use of additionalProperties instead of une=
valuatedProperties
> --
>=20
> commit e0dc4d49c687f6d5568ce2c31031086acb6cd5e6
> Author: Rob Herring (Arm) <robh@kernel.org>
>=20
> dt-bindings: panel: Add JDI NT35596S
>=20
> This commit adds a new device tree binding schema for the JDI FHD
> NT35596S MIPI-DSI panel. It documents properties such as the DSI reg valu=
e,
> reset GPIO, backlight, port, and various power supplies.
>=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt=
35596s.yaml b/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt355=
96s.yaml
> > new file mode 100644
> > index 0000000000000..aefc9ae5d8abd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596s.=
yaml
>=20
> [ ... ]
>=20
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: jdi,fhd-nt35596s
>=20
> [ ... ]
>=20
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - vddio-supply
> > +  - vddneg-supply
> > +  - vddpos-supply
> > +  - port
> > +
> > +additionalProperties: false
>=20
> [Severity: Low]
> Does the use of additionalProperties: false here incorrectly reject stand=
ard
> inherited panel properties?
>=20
> Because this schema references panel-common.yaml in an allOf block,
> additionalProperties does not traverse the $ref references. This blocks
> standard properties like rotation and forces the redundant declaration of
> properties like backlight, reset-gpios, and port just to pass static JSON
> schema validation during a make dt_binding_check.
>=20
> Should this use unevaluatedProperties: false instead?

This seems to be the new thing that Sashiko whines about, any binding I
see with additionalProperties: false seems to get complained about.

--Y7+JQJdZ48SF86o1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarLC8QAKCRB4tDGHoIJi
0hIyAPwNKPbOV9Hmv3D6u1Ws4ur/UPFz+V2rAS8gvcZXil7eZQD9F++RKgFFy3Gh
L9jt9PTuDnXHIEsLTMblxdY+gpa/kgI=
=0wBR
-----END PGP SIGNATURE-----

--Y7+JQJdZ48SF86o1--
