Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB10402459;
	Fri, 22 May 2026 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465767; cv=none; b=iD61SIdHnNPBguCKhIa4o1+lHldbl3flzGarVIdwQ+9a/HlXOdcpjlvC7GdI4ShgH6Bbj5B1jkYPU/kkZnGtBlzYactt0VV/EEyzxeD+iLbtiVgbAz38o/pySmYUhF841GW1+6dfdQqCznnS0x9GAlY6XplHJ5eKU8i3h95laBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465767; c=relaxed/simple;
	bh=T/de1HSiWTKVZlADdJ1XHM/qwI52sZVvrHQdF/FkAbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHGZmzf4RdPn8DQ7JzaIPY4VcVgekcqf1s4+DwFec4jZ8Z52gw4zmVs4h+B1CtJQhHFQYKlagW5Ffwele8XCcFgnMBB2K4YpQ0CRQz5e2ramvWIENivE2SZHLQ8kLUngF/REv7x44o03RkucZCba+t3I6HmWAt1F31/BMOmHrmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9u4ynTb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9u4ynTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991441F000E9;
	Fri, 22 May 2026 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779465762;
	bh=BXyZYjOXT756+wjkhcTautxR3ojxUDJZeJ/cEzE2GfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N9u4ynTbFo7jiIJRrblM2VSnOe/1qdRWcinQh6HQ0Y/n4rmOskXqVeI0AISpZIocq
	 dnRqu8ynZ7AgPUN/l3OGg+KqCv+w2hnhX9fA2zh+j+LdeUZmEmP3kwvBY06yOgYH2E
	 SIsnAfO1kK+dbD3dHokUlZL+CdN0tOZniE631pTFAcjRiW8AzxLSbjLsXEQYaV356D
	 ItJjFQ3x4855EIHVSmjZjN2j6eJc+IoFLoMnNZJA9LLYN0Ig2EgUxi+f0vKR3pwx0W
	 SKVvgIckyerKvb29aS1rk0DU5SXRKzeQ9YkDhCpGe82wV5HhWfLP869A+Y46SkbG1Z
	 SYAsb6FBDnKsA==
Date: Fri, 22 May 2026 17:02:39 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: Re: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add
 optional TXD and RXD delay register offsets
Message-ID: <20260522-jalapeno-gilled-c1fe0cc2b83c@spud>
References: <20260518022023.427-1-lizhi2@eswincomputing.com>
 <20260519022334.35742C2BCB7@smtp.kernel.org>
 <20260519-thinness-slashing-cc0310904419@spud>
 <44d1ad42.8505.19e3fa56a49.Coremail.lizhi2@eswincomputing.com>
 <20260519-presuming-arrest-718fc461b055@spud>
 <1dd4d673.86ff.19e4d99369e.Coremail.lizhi2@eswincomputing.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xBZ8exzOtN9kWHfY"
Content-Disposition: inline
In-Reply-To: <1dd4d673.86ff.19e4d99369e.Coremail.lizhi2@eswincomputing.com>


--xBZ8exzOtN9kWHfY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 10:52:27AM +0800, =E6=9D=8E=E5=BF=97 wrote:
>=20
>=20
>=20
> > -----Original Messages-----
> > From: "Conor Dooley" <conor@kernel.org>
> > Send time:Tuesday, 19/05/2026 17:55:27
> > To: =E6=9D=8E=E5=BF=97 <lizhi2@eswincomputing.com>
> > Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, devicetree@vger.k=
ernel.org, conor+dt@kernel.org
> > Subject: Re: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add o=
ptional TXD and RXD delay register offsets
> >=20
> > On Tue, May 19, 2026 at 05:51:05PM +0800, =E6=9D=8E=E5=BF=97 wrote:
> > >=20
> > >=20
> > >=20
> > > > -----Original Messages-----
> > > > From: "Conor Dooley" <conor@kernel.org>
> > > > Send time:Tuesday, 19/05/2026 17:11:59
> > > > To: sashiko-reviews@lists.linux.dev
> > > > Cc: lizhi2@eswincomputing.com, robh@kernel.org, devicetree@vger.ker=
nel.org, conor+dt@kernel.org
> > > > Subject: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add o=
ptional TXD and RXD delay register offsets
> > > >=20
> > > > On Tue, May 19, 2026 at 02:23:33AM +0000, sashiko-bot@kernel.org wr=
ote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > > - [Medium] Missing `minItems: 4` constraint makes the newly added=
 optional cells mandatory, breaking schema backward compatibility.
> > > > > --
> > > > >=20
> > > > > commit 2992483df88af2823c275fc86187f7e38acbee5c
> > > > > Author: Zhi Li <lizhi2@eswincomputing.com>
> > > > >=20
> > > > > dt-bindings: ethernet: eswin: add optional TXD and RXD delay regi=
ster offsets
> > > > >=20
> > > > > This commit documents two optional cells in the eswin,hsp-sp-csr =
property
> > > > > for the TXD and RXD delay control register offsets.
> > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/net/eswin,eic770=
0-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> > > > > > --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.y=
aml
> > > > > > +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.y=
aml
> > > > >=20
> > > > > [ ... ]
> > > > >=20
> > > > > > @@ -82,6 +91,8 @@ properties:
> > > > > >            - description: Offset of AXI clock controller Low-Po=
wer request
> > > > > >                           register
> > > > > >            - description: Offset of register controlling TX/RX =
clock delay
> > > > > > +          - description: Optional offset of register controlli=
ng TXD delay
> > > > > > +          - description: Optional offset of register controlli=
ng RXD delay
> > > > >=20
> > > > > Will this make the two new offsets strictly required instead of o=
ptional?
> > > > >=20
> > > > > In dt-schema, when an items list defines a tuple, minItems implic=
itly
> > > > > defaults to the total number of items in that list. By increasing=
 the list
> > > > > from 4 to 6 items without adding a minItems: 4 constraint to the =
inner items
> > > > > list, won't validation now strictly require exactly 6 items?
> > > > >=20
> > > > > Could this cause dt_binding_check to fail for existing device tre=
es that
> > > > > correctly specify only the original 4 elements?
> > > >=20
> > > > Looks like a valid complaint to me.
> > > > pw-bot: changes-requested
> > > >=20
> > > You're right, this is a valid issue.
> > >=20
> > > I'll fix it in v3 by adding only minItems: 4 to preserve backward
> > > compatibility with existing 4-cell device trees.
> > >=20
> > > Should I drop your Acked-by in v3 due to the schema change, or should
> > > it be retained?
> >=20
> > Just fix it, and you can retain.
>=20
> Hi Conor,
>=20
> I noticed that the v2 series has already been applied to net.git:
> https://lore.kernel.org/lkml/177935821264.4013498.4647676520552839707.git=
-patchwork-notify@kernel.org/
>=20
> Since the missing minItems: 4 breaks backward compatibility for
> existing 4-cell device trees, I plan to send a new single-patch series
> targeting net to add the missing constraint.
>=20
> Just wanted to confirm that this is the preferred approach.

That sounds like the right approach to me.

Thanks,
Conor.

--xBZ8exzOtN9kWHfY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahB+HAAKCRB4tDGHoIJi
0nw+AQC8bewuij2Ms1VC02njg2XUP6usN+ciVB/BeAzNBFRi1gEAozI7bvnkdAl9
JJ30pBIFKQBcLrCzSYLtqnIJWAmB5Q0=
=l2EA
-----END PGP SIGNATURE-----

--xBZ8exzOtN9kWHfY--
