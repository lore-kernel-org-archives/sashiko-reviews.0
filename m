Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF18277C81;
	Mon, 25 May 2026 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779728506; cv=none; b=QI44scHz8WIkehQsyrJDl+glt/RPghvZBWYqEOOtYURvn8QkX1cNEDc+JQvfiwORCTNS5jQRkGhpIQEd3fR0jsz0i4LBXPXocmUU3Z+npXZ2PlXjQIPcGX9VHDbnnF4ZlTdVf09H6TeKSUmqHFHgYctXL7aA/++GUwPmqIEhksM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779728506; c=relaxed/simple;
	bh=K0AA2EI0slxXdzuBYYSN2xZQfdcHB0CpKkDc+CvBQNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0kFxVnmZ+APbzr2xc8uMnHnxDx9ZpXJVLC605U8ijqGpQoyKYrNPXCziuz7IE/62yfU9sS1NIwJmx+hjlPKi0kYvHscnvgmTjxtEpFSOmwv2SVZwk/7H6aFoDykWFv6GBPs3ifT6ziETGHQptniZ6cxXBhs3ut5pFkjLKIwXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=At03eXB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="At03eXB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29901F00A3A;
	Mon, 25 May 2026 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779728505;
	bh=4bUnj5wRWm9BaLpg6JIfnPPofho7KdNy5EHDHEzsego=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=At03eXB3CJ5WaIbM461vq+h/0MGHP+1j2ebW9zkT3j1CLxsSw1ZBQWChbxWMd+fj2
	 zH/gFVOsvf8DAGL8nMJgd4XXz+YzCat0FzZKYPaiOlT0rRfIODEkyDl/qYQdLHlLSO
	 SWMgB+7JjM7se0CWrHuFX/L2twNnj1MmnEHU8HweiFix3arLkf+HRI1dVPlr2kmKAN
	 KlQbSKKX/Rc4rZmcVf32u24QKbRtl7siGer+2T/8fwxQJlW+dRBkAZy2eUayXRHPCZ
	 IoF+FwZ1sFFNNjFfMcw9Jvys2gWuWglN9ph4coK6JH5B+nK9dIltu9xvumVJ+EWOZI
	 3p2/78VgCUi2A==
Date: Mon, 25 May 2026 18:01:41 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev, jic23@kernel.org
Cc: Piyush Patle <piyushpatle228@gmail.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 04/11] dt-bindings: iio: adc: hx711: add HX710B
 support
Message-ID: <20260525-clanking-possum-4ba58b466854@spud>
References: <20260525105127.180156-5-piyushpatle228@gmail.com>
 <20260525111144.CA7E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fw+eNqhMXX3s6SuY"
Content-Disposition: inline
In-Reply-To: <20260525111144.CA7E71F000E9@smtp.kernel.org>


--fw+eNqhMXX3s6SuY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jonathan,

Here's an example of the sort of stuff it complains about on every
iteration.

On Mon, May 25, 2026 at 11:11:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The `dvdd-supply` property is utilized by the HX710B and menti=
oned in the commit message, but it is not enforced as a required property f=
or the new compatible or included in the example.
> - [Low] The `if` condition for the `avia,hx710b` compatible incorrectly u=
ses `const` instead of `contains: const`, causing schema validation to alwa=
ys fail for HX710B nodes.
> --
>=20
> commit 006ef740da7a1ce47e48ea34371f93f0e9dd9a9a
> Author: Piyush Patle <piyushpatle228@gmail.com>
>=20
> dt-bindings: iio: adc: hx711: add HX710B support
>    =20
> Add the avia,hx710b compatible and document the HX710B-specific
> DVDD and VREF supplies. Add constraints that forbid HX711-only
> properties on HX710B nodes and require vref-supply for HX710B,
> then add a separate HX710B example.
>=20
> >     Add the avia,hx710b compatible and document the HX710B-specific
> >     DVDD and VREF supplies.
>=20
> [Severity: Medium]
> The commit message mentions documenting the DVDD supply, and the binding
> description notes the HX710B measures the DVDD-AVDD supply voltage differ=
ence.
> However, dvdd-supply is not enforced as a required property for the new
> compatible, nor is it included in the new example node.
>=20
> Should dvdd-supply be added to the required properties and the example to
> ensure complete schema constraints?
>=20
> [ ... ]
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml =
b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > index 099235b5fd548..f0aeb15e9eb9e 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> [ ... ]
> > @@ -62,6 +71,21 @@ properties:
> >      maximum: 2500000
> >      default: 400000
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: avia,hx710b
>=20
> [Severity: Low]
> Is this the correct way to match the compatible string? Since the compati=
ble
> property is evaluated as a string array, using a strict scalar comparison=
 here
> evaluates to false, causing the schema to always fall through to the else=
 block.
>=20
> Would it be better to use contains: const: avia,hx710b instead so that it
> properly evaluates the array and enforces the constraints in the then blo=
ck?
>=20
> > +    then:
> > +      properties:
> > +        vsup-supply: false
> > +        rate-gpios: false
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260525105127.18015=
6-1-piyushpatle228@gmail.com?part=3D4

--fw+eNqhMXX3s6SuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahSAdQAKCRB4tDGHoIJi
0tATAQCP0e0slpD8B11L81rxuxKuqmfI2uzcanhjUdk5MnjkFwD/azGoNFRf5GnB
LKSAZ6UNf50qLMt+rmsPTikVR14O2QQ=
=ZuTe
-----END PGP SIGNATURE-----

--fw+eNqhMXX3s6SuY--
