Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D348AE29;
	Mon, 18 May 2026 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122831; cv=none; b=PwHTZalGvX/tXYg3hxNOZW0fOGnYw0i4gKWAyJrAbp5cWwDGC8mst68O+JXVrcY1lhNzJ5u64eOdL27u8DEvGyqFmLBSMx4GmZNRLAG/xzg1WIr4f1hHB+Sqyg94vpUafo3W1ZNf1mXdzg41QPG5K5ykHckpZ8+hdHll5cpTVW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122831; c=relaxed/simple;
	bh=vlXPQJ0n+FxiQ5yHTycwVp3+DG9L5PjEk5xES/9jr/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs3YPKOAsGqWHuLJOENNwkLzzrY7LCzfuJLumH45iHUHAfNh59S1CHNTz//RAjhedkkUW9BVztX+PPC944VIWUptQvMvkvAeBmUhE+BCVdT/56M85GZugZc485yqLIN7dGcvs0Ra7+dpw839BDPu6uHkuzeiEjvDldfdpxEFfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qV2tYE57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qV2tYE57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231D8C2BCB7;
	Mon, 18 May 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122831;
	bh=vlXPQJ0n+FxiQ5yHTycwVp3+DG9L5PjEk5xES/9jr/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qV2tYE57grbbtPIULVsZPN/fs4Hlaw3SCEOAQWE7SsK6Vlc8YcLoCyhF4qXlF3X9S
	 KQ6i4+wMxkYGkUWAMCQg77h6OdzQAl+T7qjFwtsxwe2wIrYW3n9G/BAE5qOmu2Z47T
	 w380ZdHGmnkT5fO7J+IbnqxFM/bz86otaRaz7rw6nVCPTgQRhSFYzcAjEKzymF594C
	 7D6SM8o6s6ndNGgh6RVN7ch5EmdWfpEnBRNSCa6I65ZDxBelqW5tthghxFT532GTGU
	 r5vvyabauNnD+PKbjWyUIBsD29GujhFvuWX/zuQOPcw597ywAteuKK28vJVS67T8w3
	 nHy6LQVM67sQA==
Date: Mon, 18 May 2026 17:47:07 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, robh@kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	conor+dt@kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
Message-ID: <20260518-sandlot-womanlike-c7a1dc7a3294@spud>
References: <20260517234134.2737320-3-alexander.sverdlin@gmail.com>
 <20260517235006.92840C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQzAchun1Nh7Z/VC"
Content-Disposition: inline
In-Reply-To: <20260517235006.92840C2BCB0@smtp.kernel.org>


--sQzAchun1Nh7Z/VC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:50:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Missing standalone compatible entry for the Core board.
> --
>=20
> commit 76fcabeafe7a55386e6089c83f652ab14cf4b7ec
> Author: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
>=20
> Baijie HelperBoard A133 is a development board around their A133 Core
> board. Introduce a compatible for both the Core and the development
> boards.
>=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index 9e4627f97d7e3..845b5a93686e7 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -96,6 +96,12 @@ properties:
> [ ... ]
> > +      - description: Baijie Helper A133
> > +        items:
> > +          - const: baijie,helper-a133
> > +          - const: baijie,helper-a133-core
> > +          - const: allwinner,sun50i-a100
> > +
>=20
> The commit message states the intent to "Introduce a compatible for both =
the
> Core and the development boards."
>=20
> Since this items list requires exactly three elements, it correctly valid=
ates
> the development board, but it appears a device tree written solely for the
> standalone Core board would be rejected.
>=20
> If the Core board were used with a different custom carrier board in the
> future, would it need its own standalone compatible entry?
>=20
> For example:
>=20
>       - description: Baijie Helper A133 Core
>         items:
>           - const: baijie,helper-a133-core
>           - const: allwinner,sun50i-a100

This example is complete crap, compared to the point that is apparently
being made about different carriers.

> Does omitting a standalone entry for the Core board limit flexibility for=
 future
> designs based on it?

Obviously not.

--sQzAchun1Nh7Z/VC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagtCiwAKCRB4tDGHoIJi
0hTBAQCRBFFBgigvpaWfKQ/anWyIKWSu02n7V4zI2MiUTYQEsgD/SubCx43ZVsTB
B7sM8dyYZ869ZKCDx16A05eCV/fBdQE=
=DTkF
-----END PGP SIGNATURE-----

--sQzAchun1Nh7Z/VC--
