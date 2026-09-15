Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723254B66F9;
	Tue, 15 Sep 2026 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491536; cv=none; b=uYIFhr+RFYnxQU5qvjI9NQLiYv7BOl078PBDVy6zEjNidlS4el9usSU1GZiookVGNt6NpDMvJIv/ZC8So1AykSzFNg+poVHlxpMuR8cKslAZZg+TkqR1Ip3rmVoH2G+dzD4/nnrOSQIVpKDGwS5efn0v+ZtRCk6quWhPute4tXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491536; c=relaxed/simple;
	bh=gR44p01LnEgNJXXna64M0qtBWQmCmY5s7fOKwOJgSRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg2tHgUcovrdmqLgTAY3Irno7sfFNhWPN+YltLSKXzOSEW6VFoAaKJsIxjIzmBux/j8yEDK26ft/SSsJAat74lzFKqQY6SPFqBl1s8wVXhq0SsXPS7HSf5yw9JGPzWt7jCAD+vK8So85QW/GFY1HlLLjugPqiYkkn/iwQPCxcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOWpNrtZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOWpNrtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA961F000FF;
	Tue, 15 Sep 2026 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491534;
	bh=sYntz231zT5S30pCWx3eSwRjtq5eWxZnTzHTkFIGlTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SOWpNrtZeUfu+6q2KkVu/IPtDaP3vzXJ0IYvqDWNkptxdgqclUsuHHF3WhWl5Qo/n
	 vowcOoLb+M9wevSjiR3Psn59ssSof7QKW41Oaj2s0ZEPxhHG4jRbyoyJ91MmTxrSgK
	 2Ut7Tj8c41beq/zJc7HbP7ePbXpcqMeqnRN4cV1jMQZjM7BFou8HNS/I+fyoIHtlVO
	 ohrjEk/deRS0Mx0S7GiXtcRYh/fj0Gc1HpJRxRNe/heKFlo81LChvasvDfaW8XkN63
	 Sfo5I+M2te5aNTmPcPhOFpJk+GC984vATQVSC0BAw3XWxMkctVt3sBBtLlIZNV2Pdq
	 V9myAlzSddnFQ==
Date: Tue, 15 Sep 2026 17:58:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	robh@kernel.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Message-ID: <20260915-flip-steadfast-9198d002f381@spud>
References: <20260914210115.28151-1-andre.przywara@arm.com>
 <20260914210115.28151-3-andre.przywara@arm.com>
 <20260914211940.256A11F000FF@smtp.kernel.org>
 <20260915005122.40ba2d7a@ryzen.lan>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hp3a/vH/bxBW+7QF"
Content-Disposition: inline
In-Reply-To: <20260915005122.40ba2d7a@ryzen.lan>

--Hp3a/vH/bxBW+7QF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:51:22AM +0200, Andre Przywara wrote:
> On Mon, 14 Sep 2026 21:19:39 +0000
> sashiko-bot@kernel.org wrote:
>=20
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Missing SoC fallback compatible string 'allwinner,sun50i-a100'=
 for the Teclast P80 tablet breaks CPU frequency scaling.
>=20
> Well, there is more to it. We should rather add the a133 as an explicit
> name in the driver, like we did for the H616 family. And the whole OPP
> table is still from the old A100 days, it doesn't really cover the A133
> or A133P values, which go up to 1.6GHz and 2.0 GHz, respectively.
> The bin selection in the driver is also not adequate, the BSP code
> seems to use the SID cell at 0x00 to select one of two speed bins, at
> least for the A133. The A133P is probably still different.
>=20
> So I'd rather keep the a133 fallback compatible, and adjust the driver.

Can you explain the complaint from Sashiko to me?
=46rom where I am sitting, without awareness of allwinner SKUs, it seems
like the bot is suggesting that you add a "random" fallback to make a
driver probe.

>=20
> Cheers,
> Andre
>=20
> > --
> >=20
> > commit 582b866f1ad9000afddf47eb7e4c9d37a95dfbc8
> > Author: Andre Przywara <andre.przywara@arm.com>
> >=20
> > dt-bindings: arm: sunxi: Add two Teclast tablets
> >=20
> > This commit adds devicetree bindings for the Teclast P80 and P85T table=
ts.
> > The Teclast P80 is based on the Allwinner A133 SoC, and the P85T uses t=
he
> > Allwinner A523 SoC.
> >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Docum=
entation/devicetree/bindings/arm/sunxi.yaml
> > > index f04db28c630ac..28437c47ac01b 100644
> > > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > @@ -933,6 +933,16 @@ properties:
> >=20
> > [ ... ]
> >=20
> > > +      - description: Teclast P80 Tablet
> > > +        items:
> > > +          - const: teclast,p80
> > > +          - const: allwinner,sun50i-a133
> >=20
> > [Severity: High]
> > Does this strict two-item compatible array omit the necessary fallback =
string?
> >=20
> > The sun50i-cpufreq-nvmem driver in drivers/cpufreq/sun50i-cpufreq-nvmem=
=2Ec
> > requires allwinner,sun50i-a100 to exist in the root node's compatible a=
rray
> > to bind via of_machine_device_match(sun50i_cpufreq_match_list).
> >=20
> > Without this fallback string included in the bindings (and subsequently=
 the
> > board's Device Tree), cpufreq-dt will not be instantiated. This will ca=
use
> > CPU frequency scaling to silently fail on the Teclast P80 tablet, leavi=
ng
> > the system stuck at the bootloader-configured frequency.
> >=20
> > > +
> > > +      - description: Teclast P85T Tablet
> > > +        items:
> > > +          - const: teclast,p85t
> > > +          - const: allwinner,sun55i-a523
> > > +
> >=20
>=20

--Hp3a/vH/bxBW+7QF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql5SgAKCRB4tDGHoIJi
0ktmAP4ueevAr87FG1+dR1SopZgvP1Fz5/9V+7pn/OMbIRfg9AEAkII1pfBW4e8p
6sjt1RpJvACzJoMsQhbvUzzLK1K6QgE=
=sg+j
-----END PGP SIGNATURE-----

--Hp3a/vH/bxBW+7QF--
