Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB27B3DB332;
	Tue, 19 May 2026 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211315; cv=none; b=BVttrneoFOwEj01OfwVKoJlhGABGJ6LVM0GTb93I80EYBge0aAfZXrTpK3jIeGL93W6bVdePBOcfY0/PBMRl0OPpaNwigK8beElESNXEOqiEvcAuLGN1O3zDAu/1CxwMV8yDJdTDuUAjQnYaXw5uwYJhIFD9zLkTn6eEsmsuuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211315; c=relaxed/simple;
	bh=Ia3/QcXqzSymaJJ8l6fAmOGDHX35UkO1yPopuOfh8PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3GixHMwGAJPTH5YKYuXA6B4kJy/dETDMrJ/uAfg494E4b99LLGnEj+tuO3vnOj3l4YiOa4gY52WD4m/GFFZcg+M+dQXh7bbA01EUi1U+l9lk6STk+/XBtmOkEyxTQTv/D0lXct28vHAvv/2F/vwW6S+u2CPH8IggMIV9DqXRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1JHUYFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1JHUYFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFA8C2BCB3;
	Tue, 19 May 2026 17:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211315;
	bh=Ia3/QcXqzSymaJJ8l6fAmOGDHX35UkO1yPopuOfh8PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1JHUYFt/ryA5ujSO53Gh+Bvqwq00n3D+IfYOKgWQpOuJhHd3JNU8XhBCkyLFf3Mf
	 mjcy5AYiUsahNWwurebRahxCXNURXQ5cYK3yIDeoqcocdwFpaE2gTqs86Kr9HWjaIe
	 4hhaVwc2RgYrgQyG68sOtl8Mqr6aiZhx0jpbtYUbkKM1PEsARdfne6FpFw20p/cLSM
	 sVgMZd0lS1EIpUP7hyWzSz4Fjv9FA0q0A6c4gUIk0+aJMg+1wlP3cuuiyPe0Gl7gWT
	 JP0Z0BSzCHkMtIXo9XPWkFsZ8jGGRQp3e84JRMA24f500lGAkAfpkpqm1oUOMF8PbX
	 i28R1Wj8DKCvg==
Date: Tue, 19 May 2026 18:21:52 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Piyush Patle <piyushpatle228@gmail.com>, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 04/11] dt-bindings: iio: adc: hx711: add HX710B support
Message-ID: <20260519-cherisher-trouble-e72d6c6d5c38@spud>
References: <20260518220228.63322-5-piyushpatle228@gmail.com>
 <20260518221101.A38E9C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mfTuUQjY6TrG/bcM"
Content-Disposition: inline
In-Reply-To: <20260518221101.A38E9C2BCB7@smtp.kernel.org>


--mfTuUQjY6TrG/bcM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 10:10:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The newly added `dvdd-supply` property is described as HX710B-spe=
cific but is not forbidden on HX711 nodes in the schema.
> --
>=20
> commit e277e4c3f21226be9f52ecf29adbdc5f6f73f38d
> Author: Piyush Patle <piyushpatle228@gmail.com>
>=20
> dt-bindings: iio: adc: hx711: add HX710B support
>=20
> This commit adds support for the HX710B ADC chip. It adds the avia,hx710b
> compatible string, documents the HX710B-specific dvdd-supply and vref-sup=
ply
> properties, and updates the schema constraints.
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml =
b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > index 9134bbe413796..b2b5c7bdf05e6 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
>=20
> [ ... ]
>=20
> > @@ -53,6 +69,21 @@ properties:
> >      maximum: 2500000
> >      default: 400000
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: avia,hx710b
> > +    then:
> > +      properties:
> > +        vsup-supply: false
> > +        rate-gpios: false
> > +      required:
> > +        - vref-supply
> > +    else:
> > +      properties:
> > +        vref-supply: false
>=20
> The commit message mentions documenting the HX710B-specific DVDD and VREF
> supplies. While vref-supply is explicitly forbidden on HX711 nodes in this
> else branch, dvdd-supply is not.
>=20
> Does this schema unintentionally allow the dvdd-supply property on avia,h=
x711
> nodes? Should dvdd-supply: false also be added to this else branch?

No.

https://lore.kernel.org/all/20260512-frantic-finch-2b268bed4e15@spud/


--mfTuUQjY6TrG/bcM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagycMAAKCRB4tDGHoIJi
0iiqAQDEL7f9fP5DR0zuRQCfEE1KsOBfkhWa5RZe2o2FXLDC6wD+MEeM5nDcT/or
+QsdkzJKZbZGTo03ozjHh4i3fw3YlAM=
=l2f8
-----END PGP SIGNATURE-----

--mfTuUQjY6TrG/bcM--
