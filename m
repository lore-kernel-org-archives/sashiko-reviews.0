Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C673B3D890E;
	Fri, 15 May 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865874; cv=none; b=GQNahzmYT849n1Z2U5hX0eL9O5Mw86rS5YnyDSHpNIUPDIQnpid/OGGOt2hBA09BNKsRweebhLSSN8yxCh5aSENOjNuP+uDpikNMgV0j3/w0nFCtfXI0HvG533P6UYvvm3Glj+AgjRnPMGZoiwov9aE85bLJqpSL4WxI+L4nHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865874; c=relaxed/simple;
	bh=qq67U4kKDQmCOTQy7btyPXWKsKzzgH9USf781n7iIhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFLERhYYfjmniIA9sGav4+CvqnqlAMKZBC7+GvyVL6PIe9BZuNQco/qg1axeINI7QKMdvL7Q95vuqJbtdRMzvfwFNTlV54tODAUED9heAt7iQ/ot+m+AvJ72lfq4BpDZd5eatOk7TnKGrkLStHbSxW8/hpiyLEJpjiqJAmwaYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGrpQBri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGrpQBri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B575C2BCB0;
	Fri, 15 May 2026 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865874;
	bh=qq67U4kKDQmCOTQy7btyPXWKsKzzgH9USf781n7iIhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGrpQBriLzDUBUTbuSbbmLNybhApT5HpfyBrAw8CmIh9lJHYuzfIeXQBwEL11LY9C
	 Qz+z2qaCQF3JTQdSm2HNE1COVRh/RhYHbd+l19kVCrt4GSfNAOwuXHOpDM/eFfw28+
	 HIUkHm13CTQ2Xkd0NhXabnIt+Q502VmV/UKz/NqOBkJgxiX1QxjY1v+XmuzD5gkG2K
	 6ein0XuP2RxbGMN6GrBnS9L8CbCHpCbkLnNHFFbQfZkWZ/neV5TID+fJ/Xi+sN4SlR
	 xvC562Une7IyugG319efAACeFtTeilV6/rysZj9ruZVAvbels6x/iSPZmj1GaxqPy8
	 W/gRzy5l7UlhQ==
Date: Fri, 15 May 2026 18:24:30 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: marius.cristea@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: add support for PAC1944
Message-ID: <20260515-rupture-humped-772e7e2072c9@spud>
References: <20260515092946.10791-2-marius.cristea@microchip.com>
 <20260515093849.4E62CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xqvlnm0IK55KDOeE"
Content-Disposition: inline
In-Reply-To: <20260515093849.4E62CC2BCB0@smtp.kernel.org>


--Xqvlnm0IK55KDOeE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:38:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The binding defines GPIO controller capabilities but omits `gp=
io-controller` and `#gpio-cells` from the `required` list and `examples` bl=
ock.
> --
>=20
> commit a57d647e4dad8345f6c818b69281dba50b43a7f4
> Author: Marius Cristea <marius.cristea@microchip.com>
>=20
> dt-bindings: iio: adc: add support for PAC1944
>=20
> This commit introduces the device tree schema for the Microchip PAC194X
> and PAC195X series of Power Monitors with Accumulator. It covers variants
> for high-side and low-side current sensing or floating VBUS applications.
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,pac194=
4.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,pac1944.yaml
> > new file mode 100644
> > index 0000000000000..eca1b25f038be
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/microchip,pac1944.yaml
> [ ... ]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-supply
> > +  - "#address-cells"
> > +  - "#size-cells"
>=20
> Should `gpio-controller` and `#gpio-cells` be added to this `required` li=
st?
>=20
> According to the dt-bindings guidelines, when a binding defines hardware
> provider capabilities such as a GPIO controller, the standard properties
> should be explicitly required to prevent incomplete device tree nodes from
> passing schema validation.

Same here as the other series, bot is not capable of deducing that
interrupts and gpio use have some mutual exclusion.

>=20
> [ ... ]
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        power-monitor@10 {
> > +            compatible =3D "microchip,pac1954";
> > +            reg =3D <0x10>;
> > +            vdd-supply =3D <&vdd>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
>=20
> Should `gpio-controller` and `#gpio-cells` also be included in this examp=
le
> block?
>=20
> If they are added to the required properties list, omitting them from the
> examples section might cause dt_binding_check to fail.
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260515092946.10791=
-1-marius.cristea@microchip.com?part=3D1

--Xqvlnm0IK55KDOeE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdWzgAKCRB4tDGHoIJi
0iZyAQCEwzG130eW3qs1q7JPfBcCdzk+pniFsZaK7Cfwp++HzgD8CAsNW01wgJDm
8FVZhJYG6cZvt/yZWCL9DANj8GYMVgg=
=FGza
-----END PGP SIGNATURE-----

--Xqvlnm0IK55KDOeE--
