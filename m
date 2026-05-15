Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193F380FE8;
	Fri, 15 May 2026 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778864911; cv=none; b=CULNmgWblkFNAQ1booVPBD6yP7sbmQYM8vS/2r2bPrRX0rt/kNTSo0OJ25HLlMkH/gZ3oefFQJG2D6wLxnX80OugY9wCDtcT6+cPbSxus1xAC6k/bk0ClRMr0+PUTnj0AjH+VX21NHUEIIa0soa2gwAMv0GRldkzTsytejG5Bmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778864911; c=relaxed/simple;
	bh=vtfXNuA8zD9LOyQaeVk5+l3MR2Lkun0ntP92/yVmZl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3wUq14DJfBugqp5GhK+F2gQOGCDwTuTrAH2b75V8pbxn9IXWVe3JxoIk/M/p2+9jj8ugki366+VAnFMJt/p/9rZnnlF00L1bKGSdrwyFCd1H0jt6O/Yclc8cZQ6l1Bge66cKTmRf9dglTZKSkWTh7GdSN/QhLZ0k97reebruk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmuWqvFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmuWqvFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7E1C2BCB0;
	Fri, 15 May 2026 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864911;
	bh=vtfXNuA8zD9LOyQaeVk5+l3MR2Lkun0ntP92/yVmZl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmuWqvFpdGMuMlAewPyZ5Au/Xv2usTnJZcWzokoeqKgFA8Jk70FcE3id6p7/v5OnS
	 yENu68AhbqN89MMKZXELTr/W42i0rd7piiLnE7BFgb8N1cLzv9JrDTBqy2dgfvHJUz
	 CFpxH04nqANy4bNpHd27gToTIV4/sj0JwfwFQ/Qt5rTIAfeMnaTB0l2SBGpmEVj7S1
	 hy/rQGfVS2IRATPkXwdmGDwPCn8NDeDdgGo/Tt88G1Do9gAoFDME57q+iiCeIIpp5e
	 YmPZv/zO49VLO9LVGEe4vHdJkgDbhnCPPUkZnvd1Th2zRnCG/LuUworcMg3Toz6/xL
	 nxGIlK/uMd91g==
Date: Fri, 15 May 2026 18:08:26 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Radu Sabau via B4 Relay <devnull+radu.sabau.analog.com@kernel.org>,
	krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v11 1/6] dt-bindings: iio: adc: add AD4691 family
Message-ID: <20260515-geometric-uptight-c4e467a92790@spud>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-1-eab27d852ac2@analog.com>
 <20260515133752.EE3CCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGgL7fGpZZ1xzXrU"
Content-Disposition: inline
In-Reply-To: <20260515133752.EE3CCC2BCB0@smtp.kernel.org>


--ZGgL7fGpZZ1xzXrU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 01:37:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The binding defines GPIO controller capabilities but omits `gp=
io-controller` and `#gpio-cells` from the `required` list and the `examples=
` section.
> --
>=20
> commit 5576d49868d1ae53d794381f2b3e2079954441db
> Author: Radu Sabau <radu.sabau@analog.com>
>=20
> dt-bindings: iio: adc: add AD4691 family
>=20
> This commit adds device tree bindings for the Analog Devices AD4691 family
> of multichannel SAR ADCs. It defines hardware connections including power
> domains, PWM, reset GPIOs, and interrupt sources, along with providing
> two binding examples.
>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
> > new file mode 100644
> > index 0000000000000..af28a0c1cfa9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4691.yaml
>=20
> [ ... ]
>=20
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  '#trigger-source-cells':
> > +    description:
> > +      This node can act as a trigger source. The single cell in a cons=
umer
> > +      reference specifies the GP pin number (0-3) used as the trigger =
output.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - avdd-supply
> > +  - vio-supply
>=20
> Since the binding defines the device as a GPIO controller, should
> gpio-controller and #gpio-cells be added to this required list?
>=20
> Omitting these properties from the required list might allow incomplete
> device tree nodes to pass validation.

This is crap right? The gpio pins are the same as the interrupt ones so
it has to be optional?

--ZGgL7fGpZZ1xzXrU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdTCgAKCRB4tDGHoIJi
0sN/AQD0lgiPetp8pj7CID6wl0wC85pDJhAXEjpgTNHDsUK9xwEArBFxeNaus2dD
GuVZlDjJNZUvnMDAG8Ncc1lu66LCHws=
=asaa
-----END PGP SIGNATURE-----

--ZGgL7fGpZZ1xzXrU--
