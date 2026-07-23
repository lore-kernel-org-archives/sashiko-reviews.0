Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF3345EA9;
	Thu, 23 Jul 2026 16:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824620; cv=none; b=qzfBnyCvUocbp776dLxGG6dW/x/HW8SivnL9QYYZR+U6qddcxcdeH5JxECzl2VtHkH3Dv77kNXIl3qUPdneE8NUKuX9JMI8ZsEtDVfW1XdEoqPs0nvQiRw9n8dK6if8bZe+5tX7mx1u6yN/17cSk5UYe2E7BopjtraHDdVeTTyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824620; c=relaxed/simple;
	bh=6jI0ftHgEIa4QOfa+aPb2/P+102XLq9gL5sGL+M/8w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYQo/Kzby2pwV6Tql3BJ0E/wqkCZsnzXtTPJ4Ez6jEzCKtmCg6Y4sB0z5YYh1uafb3zMLZ/8HcXCZStaTwLu1b6f4jBiGhkLREJ1l31K/OeKLitsXm0rWuHuKg2wRyK3xKKn/AHhXhQkzi3ZeUU7B5QkWSVpJxzQWaXztQQ7B/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEMj4Wd/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEMj4Wd/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6909E1F000E9;
	Thu, 23 Jul 2026 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784824618;
	bh=4wJRwgPZ4AI7SWe4QB67LiniTR58MRIskUEiQ1zUBE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kEMj4Wd/lfr3ve62GnSJ7LOnIdXKVhD/jkdJGfhM2kZaqSyYc676weklICmzyb0IG
	 DyJxBZAHZ38qNuQLIbqnsEKIlVP+j6Y/j0kk9L5y4SPUyojBwpOLKlMVyB8CuE+v5l
	 kgeJUP5Ds8/JJLfSc3EEZpL83DqmESHJrKP0BITIawyum2NI8u6OIg29n6H3BEiOZj
	 57p/6pBbuYZxAoU+muC8R7FsTNM3UyZ9JjAxlkixMzdGEUPdd77Mq0ueggCnQ0keYz
	 N8wK/4mILUyRGkhBMfSDCskcjJtCQJvruJeqhwB28ZUTGpEP+73UBkQQg9R0vCAEpO
	 4p4KPD1bpZ6Mw==
Date: Thu, 23 Jul 2026 17:36:54 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ariana Lazar <ariana.lazar@microchip.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: iio: dac: add support for MCP48FEB02 SPI
Message-ID: <20260723-tinkling-apple-9cdac4921218@spud>
References: <20260723-mcp47feb02_refactor-v1-0-ee59e63672bc@microchip.com>
 <20260723-mcp47feb02_refactor-v1-2-ee59e63672bc@microchip.com>
 <20260723135115.2AF451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gO3PmxjrUfw3GFuH"
Content-Disposition: inline
In-Reply-To: <20260723135115.2AF451F00A3D@smtp.kernel.org>

--gO3PmxjrUfw3GFuH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 01:50:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The schema retains `additionalProperties: false` at the root l=
evel while introducing a conditional `$ref` to `spi-peripheral-props.yaml` =
in the `allOf` block. This breaks schema validation for standard SPI proper=
ties.
> - [Low] The newly added SPI device tree example uses an inappropriate SPI=
 chip select value (`0x60`), copied from the I2C device address example.
> --
>=20
> --- Patch [2]: [PATCH 2/3] dt-bindings: iio: dac: add support for MCP48FE=
B02 SPI ---
> commit a357ffde05c7807cd64bca71103d780d8dde416b
> Author: Ariana Lazar <ariana.lazar@microchip.com>
>=20
> dt-bindings: iio: dac: add support for MCP48FEB02 SPI
>=20
> This commit adds SPI support for the MCP48FxBy1/2/4/8 DAC families to the
> existing MCP47FEB02 device tree binding. It introduces the new compatible
> strings, the spi-max-frequency property, and a devicetree example for SPI.
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47f=
eb02.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.=
yaml
> > index d131f136bd151..d25c763241a4f 100644
> > --- a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.ya=
ml
> > +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.ya=
ml
> > @@ -178,6 +239,13 @@ required:
> >    - vdd-supply
> > =20
> >  allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            pattern: "^microchip,mcp48f[ev]b[0-2][1248]$"
> > +    then:
> > +      $ref: /schemas/spi/spi-peripheral-props.yaml#
>=20
> [ ... ]
>=20
> > +    then:
> > +      properties:
> > +        spi-max-frequency: false
> > +
> >  additionalProperties: false
>=20
> [Severity: Medium]
> Since this schema now includes a conditional $ref to spi-peripheral-props=
=2Eyaml
> in the allOf block, should this be changed to unevaluatedProperties: fals=
e?
>=20
> JSON Schema limits additionalProperties: false to only evaluating propert=
ies
> explicitly declared in the root properties or patternProperties. Any stan=
dard
> SPI properties pulled in via the conditional $ref will be incorrectly rej=
ected
> by dt_binding_check.

This trips up Sashiko a lot.
This additionalProperties is fine if spi-max-frequency is the only
property from that binding that this device uses.

>=20
> >  examples:
> > @@ -299,4 +424,29 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    spi {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        dac@60 {
> > +          compatible =3D "microchip,mcp48feb02";
> > +          reg =3D <0x60>;
>=20
> [Severity: Low]
> Is 0x60 intended to be used as an SPI chip select here, or was this copied
> from the I2C example?
>=20
> Typically, an SPI chip select would be 0 or 1, and the node would be named
> dac@0 with reg =3D <0>.

It's an example, so it doesn't matter. But yes, looks like a copy-paste
mistake.

>=20
> > +          vdd-supply =3D <&vdac_vdd>;
> > +          vref-supply =3D <&vref_reg>;
> > +          spi-max-frequency =3D <10000000>;
> > +
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +          channel@0 {
> > +            reg =3D <0>;
> > +            label =3D "Adjustable_voltage_ch0";
> > +          };
> > +
> > +          channel@1 {
> > +            reg =3D <0x1>;
> > +            label =3D "Adjustable_voltage_ch1";
> > +          };
> > +        };
> > +    };
> >  ...
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260723-mcp47feb02_=
refactor-v1-0-ee59e63672bc@microchip.com?part=3D2

--gO3PmxjrUfw3GFuH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamJDJgAKCRB4tDGHoIJi
0qdSAQCyvH4tH2zk8ZjftTMXyjvrVt3MH+Z/o5Vg9ky5FJKqmAEA4e9dYGtSfbp3
gVL/YmYj9j8o/YWFEb0q+FlYHX2LTQs=
=PKMa
-----END PGP SIGNATURE-----

--gO3PmxjrUfw3GFuH--
