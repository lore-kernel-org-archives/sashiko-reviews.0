Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF98933B6D3;
	Tue, 19 May 2026 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779212341; cv=none; b=AZeiWXJzCqinG9D1ILRIwNKaTeJYmd/lzrCOWmeCd97kYk/P1wU0nLRM5YvRh6Cl4a+Bxk2tLR0q6fmc+/9970BxFZ1weNa8LL9ceyey1RM9yyvGcSI4KjT0nfV9cRdiJOdEXFpqufd5xbopmnCbG8BW9NSQfOsPUg2e0RieJGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779212341; c=relaxed/simple;
	bh=yE0MQ5O+2BiSnbnxmrnXTQucvHny+WEF9XAz/SehQcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xt3L2mWiVhvK518QmzNDXZu1F9FaCLfrUPTvDDRY0h6bMUWjMl0uG/82woYmznivbhmlR82WG7NCJYCPg7LUhnZhU2ME6R3p7y+F+yVBTCaBMHBGA7g6pzyFPOxV+1D6khBzHEcS1QRsfu62xYeWqc6+AIBQacAdk/dL0QuTm5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hk5p/Tde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hk5p/Tde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5ABC2BCB3;
	Tue, 19 May 2026 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779212340;
	bh=yE0MQ5O+2BiSnbnxmrnXTQucvHny+WEF9XAz/SehQcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hk5p/Tdew1J6ZM08hIIeh0Yf4TMU6bFxYp5+2BX0Mneh9ti7tvajocWEcihHmWCv4
	 fD5eaKoG1lqdGgiyEKRWtgTMJUzV59MQdOL6Zpm9GApw8MmVF13uy9xwpU2ha/ChSh
	 /H109pfyFOAwrOvZ7ZFpQPhLl3Ykkl/MRcFj1vxNSlziP1b4Pa+tTwimJvfr7L4WVU
	 sPZOi4CWjcDdWx+2jW19thcQOlrtqGSGUbEgeWuric2Wwxo0fwf7+q5mSUtkzngbb1
	 dMMwTtzCg8aKf4mblcrqNZ5BEy7f/e3VNmexJc6PRCzBiZ7slDkDsbKtINyJz+1bzx
	 ImzNmEPj1jUrw==
Date: Tue, 19 May 2026 18:38:57 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Edelweise Escala <edelweise.escala@analog.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Message-ID: <20260519-dynamic-wanted-fddec7378bfa@spud>
References: <20260519-ltc3220-driver-v8-1-e1771c1733f7@analog.com>
 <20260519012307.5FDF6C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jFWuByN8vty1TieX"
Content-Disposition: inline
In-Reply-To: <20260519012307.5FDF6C2BCB7@smtp.kernel.org>


--jFWuByN8vty1TieX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 01:23:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] `#address-cells` and `#size-cells` are omitted from the top-level=
 `required` list.
> - [Low] The schema fails to programmatically enforce the constraint that =
`reg` must be 1 when `led-sources` is used.
> --
>=20
> commit 7595dbcc690fee63863037049c154e7a47df9973
> Author: Edelweise Escala <edelweise.escala@analog.com>
>=20
> dt-bindings: leds: Add LTC3220 18 channel LED Driver
>=20
> This commit introduces the device tree binding for the Analog Devices LTC=
3220,
> a multi-display LED driver with an I2C interface. It defines properties f=
or
> both individual and aggregated LED control.
>=20
> > diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/=
Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> > new file mode 100644
> > index 0000000000000..9e545442f3d9d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> [ ... ]
> > patternProperties:
> >   '^led@([1-9a-f]|1[0-2])$':
> >     type: object
> >     $ref: /schemas/leds/common.yaml#
> >     unevaluatedProperties: false
> >     properties:
> >       reg:
> >         description:
> >           Output channel for the LED (1-18 maps to LED outputs D1-D18).
> >           Unit-address must be in hexadecimal (1-12 hex =3D 1-18 decima=
l).
> >           For aggregated LED control, define only one LED node with reg=
 =3D <1>
> >           and use led-sources to list all controlled outputs. Only reg =
1 should
> >           be present when using led-sources.
> >         minimum: 1
> >         maximum: 18
> >=20
> >     required:
> >       - reg
>=20
> The description notes that only reg =3D <1> should be present when using
> led-sources, but the schema doesn't appear to programmatically enforce th=
is.
>=20
> Would it make sense to add an if/then block or dependencies rule to enfor=
ce
> that reg must be 1 when led-sources is present, so that invalid configura=
tions
> do not silently pass schema validation?

I actually dunno what the syntax is for restricting this from the parent
node, but it could be done in the led node I guess, using something like
if:
  required:
    - led-sources
then:
  properties:
    reg:
      maximum: 1

Probably.

>=20
> [ ... ]
> > required:
> >   - compatible
> >   - reg
>=20
> Since the schema defines child nodes with reg properties, does the top-le=
vel
> node need to include #address-cells and #size-cells in this required list?
>=20
> While dtc might issue warnings for missing cell properties, omitting them
> from the schema's required list might leave the DT schema validation
> incomplete for the container node.

I think this second one is something you should implement.


--jFWuByN8vty1TieX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagygMQAKCRB4tDGHoIJi
0pZuAQCu5fvAkyJyyYSGkOCuaqXalCuD9aytQuNq2gAQphPx0AD+IWYlDUf0WUxs
bHxb4em06rCh8VSmok9Bq3Bml1WQmAY=
=9Txo
-----END PGP SIGNATURE-----

--jFWuByN8vty1TieX--
