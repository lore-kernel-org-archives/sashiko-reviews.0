Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EBA351C0B;
	Tue, 19 May 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184530; cv=none; b=hYVl7X6jFjNqnyUCwRuH7m6wRg4jvaGGn3LsBCX4nf+2vOkzOlKZCNhIaVN6rLydn4WYe1X6PflY15UKzEM1Y37cm8Keo+Api2HfXWhAICvphFiT/YYwj71LA97/S2nF/DdxqypodkrvRq1YHKjElyPmBacBGnvmk6O0DV0Ox+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184530; c=relaxed/simple;
	bh=P68ocLlfcKq8sVnOcphv9kpBQ+r9lZFcgkUppEe9QY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuUctXO7Oz/wtoBL12NbcmxsP43VRlqURuKq75ttYUNry2Ad5bKkyoZJ0vf1VWlJSqTkAQspc8eXRsv9YGZrrYy3e1g8lpbMhu1NM5Wo0NBbNVCq+MpKNs0RGhJ5zoKYWrbJpIoBnI6tdE1Lx7wlkfZStBE3ZsTYWyKRsBrPWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOxWZbLR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOxWZbLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCDFC2BCF5;
	Tue, 19 May 2026 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184530;
	bh=P68ocLlfcKq8sVnOcphv9kpBQ+r9lZFcgkUppEe9QY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOxWZbLRx8wwsYl8j9fGRHGyeY7CuTV0qqQFTksbogaNR7ZQHcH1OAfNC95OTVCh+
	 n8Y+f4NxjQW5G2WT1EnzWKj9Nakt90JoWtCkCMAqjTpWL0TYdef5y/i1SPtqFvW1v1
	 jP85gqVMr5Edl3KkHleAshLxFTY9sdPzEok5tMXBjbB0gKPeOYfMZFR7YYXqZAg+JU
	 lJHeDqhbrKN4oWU8hNluNCvIpbLpoQWiWsRhRTfol4JtFDRwfqnHOmefVPgY7kZDUP
	 UGCl2EEQM3QxLCvQhGXmP9RtmJzwIV6XDZm01inM5v1dS3JaemNS4sGn/i/Y/UG4ha
	 2woeC4V38tysg==
Date: Tue, 19 May 2026 10:55:27 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add
 optional TXD and RXD delay register offsets
Message-ID: <20260519-presuming-arrest-718fc461b055@spud>
References: <20260518022023.427-1-lizhi2@eswincomputing.com>
 <20260519022334.35742C2BCB7@smtp.kernel.org>
 <20260519-thinness-slashing-cc0310904419@spud>
 <44d1ad42.8505.19e3fa56a49.Coremail.lizhi2@eswincomputing.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KnJSF7QB1NgE5tAq"
Content-Disposition: inline
In-Reply-To: <44d1ad42.8505.19e3fa56a49.Coremail.lizhi2@eswincomputing.com>


--KnJSF7QB1NgE5tAq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 05:51:05PM +0800, =E6=9D=8E=E5=BF=97 wrote:
>=20
>=20
>=20
> > -----Original Messages-----
> > From: "Conor Dooley" <conor@kernel.org>
> > Send time:Tuesday, 19/05/2026 17:11:59
> > To: sashiko-reviews@lists.linux.dev
> > Cc: lizhi2@eswincomputing.com, robh@kernel.org, devicetree@vger.kernel.=
org, conor+dt@kernel.org
> > Subject: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add optio=
nal TXD and RXD delay register offsets
> >=20
> > On Tue, May 19, 2026 at 02:23:33AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Missing `minItems: 4` constraint makes the newly added opt=
ional cells mandatory, breaking schema backward compatibility.
> > > --
> > >=20
> > > commit 2992483df88af2823c275fc86187f7e38acbee5c
> > > Author: Zhi Li <lizhi2@eswincomputing.com>
> > >=20
> > > dt-bindings: ethernet: eswin: add optional TXD and RXD delay register=
 offsets
> > >=20
> > > This commit documents two optional cells in the eswin,hsp-sp-csr prop=
erty
> > > for the TXD and RXD delay control register offsets.
> > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-et=
h.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> > > > --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> > >=20
> > > [ ... ]
> > >=20
> > > > @@ -82,6 +91,8 @@ properties:
> > > >            - description: Offset of AXI clock controller Low-Power =
request
> > > >                           register
> > > >            - description: Offset of register controlling TX/RX cloc=
k delay
> > > > +          - description: Optional offset of register controlling T=
XD delay
> > > > +          - description: Optional offset of register controlling R=
XD delay
> > >=20
> > > Will this make the two new offsets strictly required instead of optio=
nal?
> > >=20
> > > In dt-schema, when an items list defines a tuple, minItems implicitly
> > > defaults to the total number of items in that list. By increasing the=
 list
> > > from 4 to 6 items without adding a minItems: 4 constraint to the inne=
r items
> > > list, won't validation now strictly require exactly 6 items?
> > >=20
> > > Could this cause dt_binding_check to fail for existing device trees t=
hat
> > > correctly specify only the original 4 elements?
> >=20
> > Looks like a valid complaint to me.
> > pw-bot: changes-requested
> >=20
> You're right, this is a valid issue.
>=20
> I'll fix it in v3 by adding only minItems: 4 to preserve backward
> compatibility with existing 4-cell device trees.
>=20
> Should I drop your Acked-by in v3 due to the schema change, or should
> it be retained?

Just fix it, and you can retain.

--KnJSF7QB1NgE5tAq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagwzjwAKCRB4tDGHoIJi
0otQAQDm1kk2i60YjFGgUWijyPbE2FoJPZiCkqbk18+HKWun4QD+J3Hs6fI3lQC5
JtmJl87KXaRMy4+WlNT+LBuj5nr5Qgg=
=fhGo
-----END PGP SIGNATURE-----

--KnJSF7QB1NgE5tAq--
