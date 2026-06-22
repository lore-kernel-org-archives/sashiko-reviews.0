Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323833D4E5;
	Mon, 22 Jun 2026 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147201; cv=none; b=IV/BrN1q5CCYfpDlhRXd9RYQyNfZTLrhy6LR5B9THIEJautdBLC+pWRXHNR5uAcCwdrBSkxibDRkKCO7VHPnRnusr4rZeEFDzjY7ukUgtB+TIYYyvW1Vx4zcdgEdIk1NDvcA5wuuWMwdU5kkzCIufqG9fZKn8AwC0qLCiX6USt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147201; c=relaxed/simple;
	bh=FxJjpsxvkAqSPrNMDbSXqBAMpUNiZ2cgt/xlzF6tb/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9dCv1DnZaQ0chIBwPsLFaLyEgJj4uCVmYgqL/cKb/LmKh9asuI78hTMsEGg6Peir9bG03WTpp5W+BEnaN2CGOdIlMjMJqlSPUF2Ghuw1Oi92Dp7apDUW+gPtY05QupxF3sQ+VNrap3sjWrqZVlz74vXsW2CznWmK0FXiUB5D1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7u1+3XD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7u1+3XD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BCD1F000E9;
	Mon, 22 Jun 2026 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782147200;
	bh=9eH6Ui0cecxJPS3dEn05LRmx18eKSljEw+pMdE0wLdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7u1+3XDrrbufHbrH6ZQe6V3qFGjUCGYVkJOqAL4vlLVLIMPJx5d+eL10ZeODs278
	 pSssncH7yv5gMuVsUIuShNLX6bWMWFV426SKDvVvL+IweFeqbJK+5hI012bIBjT3rs
	 SsEKofTvCEYTyY72aPkkwwDurWsSBjrzr8mr3olukQd2rW+7pBLu1HZQNWxKNQ0ZKY
	 aDrQJiySg4JIyM4ytXMcuvXkZhIZ4w2w5uVvgOUb7zYf6U0GQRwQEQ1ptI0ErIe/Xc
	 Ew9HPNFffTspmZ5U1P3K+1+pntc9YZ/YHLvD8DpC7UCIyN7jCKrDU/aZLwKkuzK6NI
	 zTm7dcinwYsmw==
Date: Mon, 22 Jun 2026 17:53:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, neil.armstrong@linaro.org,
	vkoul@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org,
	conor+dt@kernel.org, linux-phy@lists.infradead.org,
	olteanv@gmail.com, devicetree@vger.kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
Message-ID: <20260622-sullen-botch-6a131a218bbe@spud>
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101959.37DB41F00A3D@smtp.kernel.org>
 <0a6f92ba-de8c-48ae-9025-a7570e53e453@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SwqP7sa7vCVgtsLA"
Content-Disposition: inline
In-Reply-To: <0a6f92ba-de8c-48ae-9025-a7570e53e453@oss.qualcomm.com>


--SwqP7sa7vCVgtsLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 03:23:05PM +0200, Krzysztof Kozlowski wrote:
> On 22/06/2026 12:19, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] Unintended replacement of BNF notation `::=3D` with `:=3D`.
> > --
> >=20
> > commit a9fdd0b065eb5b6394a9c33ffba0fd5194e80115
> > Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >=20
> > dt-bindings: Drop incorrect usage of double '::'
> >=20
> > This commit cleans up device tree binding schemas by removing the redun=
dant
> > double colons at the end of descriptions inside YAML literal style bloc=
ks.
> >=20
> > Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> >=20
> >> diff --git a/Documentation/devicetree/bindings/mux/mux-consumer.yaml b=
/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> >> index 9e2d78a78e409..769243a2bf046 100644
> >> --- a/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> >> +++ b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
> >> @@ -13,8 +13,8 @@ description: |
> >>    Mux controller consumers should specify a list of mux controllers t=
hat they
> >>    want to use with a property containing a 'mux-ctrl-list':
> >> =20
> >> -    mux-ctrl-list ::=3D <single-mux-ctrl> [mux-ctrl-list]
> >> -    single-mux-ctrl ::=3D <mux-ctrl-phandle> [mux-ctrl-specifier]
> >> +    mux-ctrl-list :=3D <single-mux-ctrl> [mux-ctrl-list]
> >> +    single-mux-ctrl :=3D <mux-ctrl-phandle> [mux-ctrl-specifier]
> >=20
> > [Severity: Low]
> > Does this unintentionally change the standard Backus-Naur Form (BNF) ::=
=3D
> > operator to :=3D? It looks like a global search-and-replace for :: might
>=20
>=20
> I wasn't sure about that... and indeed this should not be changed. I
> will send a v2.

Other than this one that I agree shouldn't be changed to a single :,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

(Although I find the syntax used here to be really confusing and a good
example in the text would be a lot clearer. OTOH, how to write consumers
is, I think, well understood, since they all work the same.)

--SwqP7sa7vCVgtsLA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajloewAKCRB4tDGHoIJi
0kPnAQD8eVHaFulgAbHw35l/IQzDimQ2fqS5h0DH2KihcqqTKQD/fyaz/rNP6xCD
y8UHn2H90kJhQjjmt/NRIZ/YFpGyEg0=
=SCA7
-----END PGP SIGNATURE-----

--SwqP7sa7vCVgtsLA--
