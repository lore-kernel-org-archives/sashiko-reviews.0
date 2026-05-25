Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2EA2D592D;
	Mon, 25 May 2026 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727056; cv=none; b=HatxhBm5+PCxC4gipDQ9lNrR2HGAxxAHj+1VXiZdbZ+nzeLQakoDHV6XfRSC/cFGFYxW3+k+Nk1RkFPdYuh7FA+cGdIz0sW+Zf3CzGCLN3xZSEzdbkNZ3bQW2w4NveojCOnyXE+oFyyXVWGcoPVKAM9ziSN4/A7Yd5sMwTlmGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727056; c=relaxed/simple;
	bh=AHi7rNNpn/yTAAbk276BCOHZ69vvOQJTiWrJaKnuwvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J813ZnVeco2HekdWC9xj8lp7j6TOqBFY36xWbkuML/UUn+SYZT3Qu5feWEjIlaWGQChqkwerOFdb8dsrvknE5Xb3Dodcv46Ao0tc3a0HFKLE4pJZurVEu2JlXwvQSvNnRpaNvQZecqGXMqiLTInvQs2KiFqEe3bYrHBNqETDSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVKURIBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVKURIBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC741F000E9;
	Mon, 25 May 2026 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779727054;
	bh=OAXtG9eZJMx69Khid3reGVm+fhOBTP5LDIu/QiAbPyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AVKURIBTKW2rhJOBiGcgIuKGFWaPzoF/XIwaoHYWGyAsAAKvzwRb13i6TuU53KX9F
	 ofJR+9vl8rQ6U5LQmr5vyyyaF2X1Ou+Q7NwJRG8kWYX0qVcMVdZpqQYGyQgyO/VBhA
	 z+pN79QRVCqlLVHU1cFq38iFqCbipwsx75BHhl+PEKEriLdXFwQoF1CIkC4R8K33/n
	 kL2PQZSceA3Gcig3AUkCUeFpyFWf1pKp/yUXNTxdwdqjEtJNpBCzhMfZ8/ckXKv2vz
	 +2m2HOI4fevRxM2W5e5ok+pow2Mu/h0qo3MdzXJsjNqvR7Z4VuZF6GxbDj09u1mNyY
	 HI5QF5W1S0LLg==
Date: Mon, 25 May 2026 17:37:31 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, robh@kernel.org,
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Message-ID: <20260525-myth-flanking-667fa0a706ac@spud>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
 <20260523194047.AB7CA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PHtn3q++te5nap0r"
Content-Disposition: inline
In-Reply-To: <20260523194047.AB7CA1F00A3A@smtp.kernel.org>


--PHtn3q++te5nap0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 07:40:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Adding 18 items to `clock-output-names` in the example triggers a=
 `dt_binding_check` schema validation error due to an un-updated top-level =
constraint in `renesas,cpg-clocks.yaml`.
> --
>=20
> commit aaa0ff6ae07f5974071a547fef4a5b41bc484428
> Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock in R-Mobile APE=
6 example
>=20
> This commit updates the R-Mobile APE6 clock node example to include
> the "zt" and "ztr" clock-output-names entries. This aligns the example
> with the expectations documented in a previous commit.
>=20
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-c=
lock.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.=
yaml
> > index 2197c952e21df..b6ee8c8efd46d 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.ya=
ml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.ya=
ml
> > @@ -60,7 +60,7 @@ examples:
> >              clock-output-names =3D "main", "pll0", "pll1", "pll2",
> >                                    "pll2s", "pll2h", "z", "z2",
> >                                    "i", "m3", "b", "m1", "m2",
> > -                                  "zx", "zs", "hp";
> > +                                  "zx", "zs", "hp", "ztr", "zt";
>=20
> [Severity: Low]
> Does adding these two items cause a schema validation failure during
> dt_binding_check?
>=20
> The top-level clock-output-names property in renesas,cpg-clocks.yaml has a
> maxItems constraint of 17. Adding "ztr" and "zt" here brings the total
> item count to 18.
>=20
> While the underlying limit omission occurred in the earlier commit
> 2abdc3dcf978, modifying this example to 18 items will now directly
> trigger the overarching validation limit error.

What does renesas,cpg-clocks.yaml have to do with this?
This is just complete crap, right?

--PHtn3q++te5nap0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR6ywAKCRB4tDGHoIJi
0s4LAQCN4ZclgsCmp6W9ngXCxKJuTscAuGKFvTYvKJmWuLoMuQEA3zpykWl3tyyA
+l4vJl3u926PXHJjSRIKT/yR++YsPww=
=1z7V
-----END PGP SIGNATURE-----

--PHtn3q++te5nap0r--
