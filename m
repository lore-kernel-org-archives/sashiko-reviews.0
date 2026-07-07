Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8AF1ABED9;
	Tue,  7 Jul 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441284; cv=none; b=J+RrIIrgh7nhMsWgjtusOS7Pj4aFdbIIcdARwARGZ+WuGAP3IbMAldteOvJH8fPNtmPh1hXtg8phEZ9kLxGrTo5SBagtxYhJko2pQYoKHgrMR2OO3ApnuPaxU85lETaTFBAhSVHPzoD9udNFW8IwJ2JJs6sLhzZUK+bQi3tEFI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441284; c=relaxed/simple;
	bh=4WB975X/EqILFgAfAmL8WbFdjrvWAkY9uYUP3aRmI1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVz6N+r+ZAPOjBMDSo68mFRoPF88Fz5splwRjmNyrsykMLM0/MvTirKBWvnM1n5m23wiWiGN+IVJRH3LYjbRQ1rg2XPR54ZrFwVWya26V2mFc2FjCg+27xihwY7Q8vsahR2OO/+gV21oCuZK69abQvWEPcCbNVzvkG0Q40fJNnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpzsMYPT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpzsMYPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28411F000E9;
	Tue,  7 Jul 2026 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441283;
	bh=vr7Ks1DCwvqtxTBrk6q4zbArTPG/BpwytD7pVNj1bjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YpzsMYPTcfCVr0YwD+UgvvTZmQfCzReXf3uffvar0+TyYBjqxssb/yILkLVHKtxC/
	 SSersHNqjtHQcUcK4AfaIJ2P8AHQeO2WoU0P7a/7kwxBrQcknZU0xVsLbeIETr/9zy
	 GR7QmrXhMteX9YoZUhgjNBKgkZRd1skTuojDeJjyeOEfi+FzmKtTGsX/63gNeqSWCH
	 ltkCrGRI0JnWPLwtXLOhOYYaLXlBpG7oBCpXCuVRTgWgXmzSlMcB2/fhKCWHRgelvt
	 CGTv8GffW+xg7U6QIQz0yPSNits169AKlW6rgTVMiyWvdy3QiUBlNB3rRX58YTEPIw
	 UBDvLt1Q9z+dQ==
Date: Tue, 7 Jul 2026 17:21:19 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Wojciech Dubowik <wojciech.dubowik@mt.com>, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: display: sn65dsi83: Add reverse lanes
 property
Message-ID: <20260707-aching-clutch-a71a6492cde2@spud>
References: <20260707070244.230546-1-wojciech.dubowik@mt.com>
 <20260707070244.230546-2-wojciech.dubowik@mt.com>
 <20260707074500.CAF1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ryl6ucjzQWrWKoA2"
Content-Disposition: inline
In-Reply-To: <20260707074500.CAF1B1F000E9@smtp.kernel.org>

--Ryl6ucjzQWrWKoA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 07:45:00AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch introduces a custom vendor-specific boolean property `t=
i,lvds-reverse-lanes` to indicate LVDS lane reversal. This is a device tree=
 anti-pattern because the referenced standard `video-interfaces.yaml` alrea=
dy provides the `data-lanes` property for this exact purpose (e.g., `data-l=
anes =3D <4 3 2 1>;`).
> --
>=20
> --- Patch [1]: [PATCH 1/2] dt-bindings: display: sn65dsi83: Add reverse l=
anes property ---
> commit c30eea01a74188461b7e527f71d282d68b885ec2
> Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
>=20
> dt-bindings: display: sn65dsi83: Add reverse lanes property
>=20
> This patch adds a boolean property to reverse the LVDS data lanes order f=
or
> endpoints.
>=20
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65ds=
i83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.ya=
ml
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> [ ... ]
> > @@ -115,6 +115,10 @@ $defs:
> >              enum: [100, 200]
> >              default: 200
> > =20
> > +          ti,lvds-reverse-lanes:
> > +            description: Reverse the order of LVDS lanes.
> > +            type: boolean
>=20
> [Severity: Low]
> Is it necessary to introduce a custom vendor-specific boolean property
> for this?
>=20
> Since video-interfaces.yaml already provides the standard data-lanes prop=
erty
> which can be used to describe the exact lane routing, does this hardware
> require a distinct property instead of using the standard data-lanes
> approach with data-lanes =3D <4 3 2 1>?

I don't know much about display devices, but this seems like a
reasonable thing to me. Why would it not work?

--Ryl6ucjzQWrWKoA2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0nfwAKCRB4tDGHoIJi
0hliAP9Za6VPiTNd2YOQPMgTQqjuqUU8tsMVvGXeI7WALz2OAwEAwTcAn6n+IeM/
XH2gRAwYsDuEIvmpI9z38gvbUoiFywE=
=a5FN
-----END PGP SIGNATURE-----

--Ryl6ucjzQWrWKoA2--
