Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10431619D;
	Tue, 19 May 2026 17:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211603; cv=none; b=RXRf0Ngi54fHanjGqv+DqSBz97NsuP/QevJOe5nKoHsC3gJrQSeW1xuS3Fl6zgPb5DBwBadNgzcjexVs11j+I6czonVWCgxWqr7XCkH0/uIfu/s37ssge+uonxraC1ykcNACBpNyVRF5I90L3lNXEM+bvoBRXqnXVYCUF+9tKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211603; c=relaxed/simple;
	bh=R/7nL3j9Cx4LwCou2g5oKPxxNkhOCVfmmMZvByJjNVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX7H0U9zBEP7RFiPZXHiiqhVIMb4pNabqz0gN3rv5SlLFPmrGXqMKtT5TiJFAhEb8hH02C6DGSS9KCWJpeScsfreH4CAqdsWYhhC0BE/9RlH+GXluAJgbn6gEGz3hvHOZiFY/Ef49O1gddtgaXEqMnmJSSVPNKSmvCPSfOYaoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmgNQEX/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmgNQEX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBE0C2BCC9;
	Tue, 19 May 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779211602;
	bh=R/7nL3j9Cx4LwCou2g5oKPxxNkhOCVfmmMZvByJjNVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmgNQEX/y/+qxG1pGpE1vIK/meWdKDDrU7iPG/SN2xNGb8sZrDXtT2UIs8xoH3M3I
	 UZyPts72aIYhfruy7j92x1OJHx7de43RWewMmDsjewXOJkUNOaXFkc4Uz/fd73DEbv
	 8WJktUEWPtapSkR+cOcgnK+DpbuFlqrMbP0DA1zlbJxiRQclqZHWujy8/LenLEIzL7
	 bqNi+GW315zddh+FYjs8wgqe4O4UWnXTbivb+U6r4JcXawKW/MBqigUxnHSn76FhMw
	 Q1EQxOEuk4l2bpPQNojyaUdVjtAQnv4Ke6sdOuwdTJQf6QpQY5bXwNyRvVDqNJ+HeV
	 miQ1ea/31/k+w==
Date: Tue, 19 May 2026 18:26:39 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v12 1/6] dt-bindings: iio: adc: add AD4691 family
Message-ID: <20260519-customs-nervous-ba840be442d3@spud>
References: <20260519-ad4692-multichannel-sar-adc-driver-v12-1-5b335162aa51@analog.com>
 <20260519122832.780DCC2BCB3@smtp.kernel.org>
 <20260519-bamboo-gleeful-669dcbefb0a3@spud>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qK6beUo4OmGuCPtl"
Content-Disposition: inline
In-Reply-To: <20260519-bamboo-gleeful-669dcbefb0a3@spud>


--qK6beUo4OmGuCPtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 06:26:06PM +0100, Conor Dooley wrote:
> On Tue, May 19, 2026 at 12:28:32PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The binding defines GPIO controller capabilities but omits `=
gpio-controller` and `#gpio-cells` from the `required` list.
> > --
> >=20
> > commit 96f168db5f8432c094e1917f0e5c69f84e070941
> > Author: Radu Sabau <radu.sabau@analog.com>
> >=20
> > dt-bindings: iio: adc: add AD4691 family
> >=20
> > This commit adds device tree bindings for the Analog Devices AD4691 fam=
ily
> > of multichannel SAR ADCs. It describes the hardware connections includi=
ng
> > power domains, optional PWM for CNV Burst Mode, reset GPIO, and GP pins
> > usable as interrupts or GPIOs.
> >=20
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yam=
l b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> > > new file mode 100644
> > > index 0000000000000..af28a0c1cfa9e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> > [ ... ]
> > > +  gpio-controller: true
> > > +
> > > +  '#gpio-cells':
> > > +    const: 2
> > > +
> > > +  '#trigger-source-cells':
> > > +    description:
> > > +      This node can act as a trigger source. The single cell in a co=
nsumer
> > > +      reference specifies the GP pin number (0-3) used as the trigge=
r output.
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - avdd-supply
> > > +  - vio-supply
> >=20
> > Should gpio-controller and #gpio-cells be added to the required list he=
re?
> >=20
> > When a hardware variant provides GPIO controller capabilities, these
> > properties generally need to appear in the required list.
>=20
> More deja vu. This is incorrect advice, reading the binding or commit
> message explains it, and is being regurgitated on multiple versions.
>=20
> Fix this please.

"This" being the bot.

--qK6beUo4OmGuCPtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagydTwAKCRB4tDGHoIJi
0iojAP9Ry1IrcAzs1NxLjOe/cAD3LxRl4YEdj3z4WQbOKQgWeAD+JX4C+vHm6LuG
Y7/CZbOhAj4Kn4CNjd8xY38BBx4wigM=
=Oj7W
-----END PGP SIGNATURE-----

--qK6beUo4OmGuCPtl--
