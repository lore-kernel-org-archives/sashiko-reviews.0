Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79843901E;
	Tue,  9 Jun 2026 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022995; cv=none; b=DobODzQdNmCfzhwydtPckLeNFzu3Rl52PL+7Yym/lzham/DfjDKjf23XWPuKtfEYkUEbDMY3cInB+iyH4qzDmLUPTK0GzJenDek27JUuARs69+SVURepNiFT0mXnbreQTYrsEOFhhXjK9r/0v8rRMI2J8/g32df+V0f2UWVNHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022995; c=relaxed/simple;
	bh=xByF0F/h7ktLt8lyZSDxHvLsA0knmEA+TzCJxkgFBdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1kgXRtrCo9vkiYr7Tke1zDzwhSOfQ79JjO7Yq5QocoSQxMbghOJI7lWdK5OsaDRDZJTZ+KF5PcGHL/gGVYAExfGhvww2hqT1vkasyDRkOmSOIFO+kQStE7dtbYVHPG685Y268kaP0qlwRq692StK9hNKfvf+bY/y2i/JiGkirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7srYTgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7srYTgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FB11F00893;
	Tue,  9 Jun 2026 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022994;
	bh=LwMOiZxgW53fTEkj2s9qCUAq2VW/FZU0VZwV5eBvpcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k7srYTgnpnlzXL1IuMkoGdY3uf5tr4jvi6oSbUyvyGh5/bd7bGBpiFBmTD9f4KRvo
	 eWzalQLigf0hT8KHpsKnBt97+xPL2G0JoAD5HHSCOL+Ml/xH/zNn6XOKQSP1tXsKDz
	 fQM4zFEB4bFP1WpPa9VgfGOmbIgWxRzocBgGeOM/ds08PTDVufhmctbcFkp2s3ug37
	 ev8tXZn8uVLKU+dPb8pKC9CSJ7PFTaLRQh5Y4btuBICCnSQ32e+Q9vy3rEg9j6DeJM
	 iNKSWd7zFaEuvNJ6kwZhmXUjJZqHbGfvsHSDS/y+HLV0BcwDp+CkKNSwNMIfHf76VN
	 hWnDDIvtRS1VA==
Date: Tue, 9 Jun 2026 17:36:30 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: syscon: Disallow simple-bus
 with syscon
Message-ID: <20260609-appraiser-sedate-c76c7b06690c@spud>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-1-4eba9ec1212a@oss.qualcomm.com>
 <20260608205406.45ED31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7GIejA9sAOaRBJP"
Content-Disposition: inline
In-Reply-To: <20260608205406.45ED31F00893@smtp.kernel.org>


--g7GIejA9sAOaRBJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 08:54:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch introduces several new compatible strings (e.g., `ti=
,am3352-scm-conf`) to the exception list without documenting them in any va=
lid dt-binding schema. This causes a bisectability breakage in `dtbs_check`=
 during the series and leaves permanent 'undocumented compatible' warnings =
at the end of the series.
> --
>=20
> commit 0cddec624a3b6ba2f0c447b95621f32101d2e31f
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> dt-bindings: mfd: syscon: Disallow simple-bus with syscon
>=20
> This commit adds a schema to disallow the combination of syscon and
> simple-bus compatibles. It includes an exception list for legacy
> configurations that currently rely on this pattern.
>=20
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b=
/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > index 14a08e7bc8bdd..2d5eef5add544 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
> [ ... ]
> > @@ -52,11 +53,44 @@ allOf:
> >            contains:
> >              const: simple-mfd
> >      then:
> > +      # Always require a specific compatible for syscon with simple-mfd
> >        properties:
> >          compatible:
> >            minItems: 3
> >            maxItems: 5
> > =20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: simple-bus
> > +    then:
> > +      # simple-bus conflicts with syscon - if a device is a system con=
troller
> > +      # with miscellaneous registers, then it has at least one dedicat=
ed
> > +      # function thus it is not a simple bus. Allow existing exception=
s.
> > +      if:
> > +        properties:
> > +          compatible:
> > +            not:
> > +              contains:
> > +                # This list CANNOT grow
>=20
> [Severity: Medium]
> Will this break bisectability for dtbs_check? Since the DTS files are
> updated later in the series, it seems like existing TI DTS files using sy=
scon
> and simple-bus without these new specific compatibles will fail validation
> when this patch is applied.

Perhaps worth telling the sashiko people that transitory warnings like
this aren't something we care about, especially since even the normal
development process for devicetrees introduces validation issues in the
platform maintainer branches.

--g7GIejA9sAOaRBJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaihBDgAKCRB4tDGHoIJi
0mORAP9XbacaXxKtk0YB3FToPLoZf0AcjnruCGhq+mcJSV5BeQD+Psshiw/O0AFl
UoJZc6ASeJ1rzvfyEPatykMZTs+B0Ac=
=dzg1
-----END PGP SIGNATURE-----

--g7GIejA9sAOaRBJP--
