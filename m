Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FBD328B71;
	Tue, 19 May 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181923; cv=none; b=jXBd5w1Zgl2tl0BRiCp1PsE32DK6pZHHy/fPCb0RxM/iZiZv9BC+IdC1LdFQNt7Z18weDisyTGcO/Xxtg0Cvs3BNjPx+5i4ik/jclYSt4MRn7+P0s4EC4cods9iq7IflYMmKlwB+A2OgywN9v/gstY7S8oIxSejBMAS5qnfgXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181923; c=relaxed/simple;
	bh=yI3Dqx5BLQpj6PCjamarP/QvxpJ6J2brIIh9AtfKL7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDgQ4tLzdcdh1+6r5d0dLgtuU9fLMUwLRNipQqTnSg/58Smjdw/CJjJP7hHTzX//H2btR3I5bBlHRwvqOXPpazIpbMT0JjBVt9BN/jq+zQfuZHjns5uT5vNNP3RCIrNPZBCfywv6esdSQ3N4Qg/6L0+Nz61M48y0PIPb/yFNduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bh6bRTrC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bh6bRTrC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D1BC2BCB3;
	Tue, 19 May 2026 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181922;
	bh=yI3Dqx5BLQpj6PCjamarP/QvxpJ6J2brIIh9AtfKL7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bh6bRTrCy7FhE8SXLhwbL5Uy5BX9vNP+EU2grHUiTalo8hYOJGnQVH1v6bhLutruJ
	 A+OpMyG2F4CSHfkIDQoSSZCTVEzkc7DN5IH4/K6ccqwCCAX4+MF+bfp9MLZGTGNGaE
	 oTxxDyVbo+QJBEMGXF/KTD+TgD9R5iu3XP+qpzaPHoBlmXDDijpgD98tzS5Jw4/VKb
	 +WZNSGOyV1wlQVl14NQZv2QVOzlafeuisWWmLC0F1K4AlEYAfZwgIOXzUrbyxQBTV0
	 PHBSb+7N2hSXWs02Pzkouctq0c0ycX13lzFrFsn82SkqCINrd8BeU96WVbbTMnsT50
	 GXzz2JlqRCpfA==
Date: Tue, 19 May 2026 10:11:59 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: lizhi2@eswincomputing.com, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add optional
 TXD and RXD delay register offsets
Message-ID: <20260519-thinness-slashing-cc0310904419@spud>
References: <20260518022023.427-1-lizhi2@eswincomputing.com>
 <20260519022334.35742C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lIFGvHYWqI+iA/o3"
Content-Disposition: inline
In-Reply-To: <20260519022334.35742C2BCB7@smtp.kernel.org>


--lIFGvHYWqI+iA/o3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 02:23:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing `minItems: 4` constraint makes the newly added optiona=
l cells mandatory, breaking schema backward compatibility.
> --
>=20
> commit 2992483df88af2823c275fc86187f7e38acbee5c
> Author: Zhi Li <lizhi2@eswincomputing.com>
>=20
> dt-bindings: ethernet: eswin: add optional TXD and RXD delay register off=
sets
>=20
> This commit documents two optional cells in the eswin,hsp-sp-csr property
> for the TXD and RXD delay control register offsets.
>=20
> > diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.ya=
ml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> > --- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> > +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
>=20
> [ ... ]
>=20
> > @@ -82,6 +91,8 @@ properties:
> >            - description: Offset of AXI clock controller Low-Power requ=
est
> >                           register
> >            - description: Offset of register controlling TX/RX clock de=
lay
> > +          - description: Optional offset of register controlling TXD d=
elay
> > +          - description: Optional offset of register controlling RXD d=
elay
>=20
> Will this make the two new offsets strictly required instead of optional?
>=20
> In dt-schema, when an items list defines a tuple, minItems implicitly
> defaults to the total number of items in that list. By increasing the list
> from 4 to 6 items without adding a minItems: 4 constraint to the inner it=
ems
> list, won't validation now strictly require exactly 6 items?
>=20
> Could this cause dt_binding_check to fail for existing device trees that
> correctly specify only the original 4 elements?

Looks like a valid complaint to me.
pw-bot: changes-requested

Cheers,
Conor.

--lIFGvHYWqI+iA/o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagwpXwAKCRB4tDGHoIJi
0gMKAP0TPiXIF9Qusg/774FYoNcuauITKDygcm3ZuxByKU7inwEAvCXf11tVbL+E
+bGPEBkuHlFCfZNtim9Y9vF3hSxjSwE=
=ri7E
-----END PGP SIGNATURE-----

--lIFGvHYWqI+iA/o3--
