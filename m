Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDC3C6A29;
	Wed, 27 May 2026 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899777; cv=none; b=aB5X4pHvVawnDGyVUaEnYf2WtQscqTQnQVnAVeq1Yo4aoqg/kRWedjGDoWEyoGIYgtb3nX6tCGEoJh5LCvj2UVRB08SfQBcPy0J/YKfQtRl5GmGbGGfyS9hhUnSVfQXYaeScUnHrTMR02LVilPgvkMaeqwJs6SjZMPdRVZo+tL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899777; c=relaxed/simple;
	bh=oGsjHnjxb7tnbeFxwTofReCmRvRdXgrcahspfUAk90M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChV3nQ4LfeNQ3U86R5idD0TMuqa7Lz5MybxcVvKxmHgiJoBTgbIKphNP2zHOzbuxNhkDh4CpZUV3JMHClxjYIH+DVNL4Uk4DLDF1sDHu/f1bW4kMLbXh4AxYAq9UVpUyzw2eANx/cluyMd/gsnBOFEn04Pku8PkTFSnkyd+dvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOtJgWxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOtJgWxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48A91F000E9;
	Wed, 27 May 2026 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899776;
	bh=eicIThjRdxqzONvahNTZ3MgaYZMChrQuu/hwnH2c5fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LOtJgWxBU+DXx6yMHU3NQAL7wGUoiPIhgldYVZDSfblPsjAbbiALrJublQanT7021
	 2vebicdP7TkI2n6vvf6GobGoZsw3FPwCfc4W5pk04I9pZ1MyHr+UkPSm88gf5QSlI4
	 esYOZO+9y/qNzuBlcUJr36v2+m/3KIhnEPPNkhXTSVVsvf8ZKNUhodGKG2za/hffer
	 XE2HrFM9CrBEPxgGEMwz0t/9FGAYcNDN+Wkt18SfmO9nK+W91sdTvDZUp18ulUVjZg
	 hs+mXM/EEHOnCzlmv8w3HSI0C3y2836kKHDCO/gsOaFZ7/1ncOR5XMt3ttZ2EmH70z
	 BPIe3qVvF/6wQ==
Date: Wed, 27 May 2026 17:36:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: sashiko-reviews@lists.linux.dev,
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
Message-ID: <20260527-botanical-pushy-b9cffbe9ea16@spud>
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org>
 <20260525-gaining-unaired-c96367a78c9b@spud>
 <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
 <20260527-prankish-causing-4139d0dd0b51@spud>
 <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IGyJx9V+FxVTS+Dr"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtLorK+Hjc-ZWCAn273ZN6yUEdyjxpJ5ynZ09sWqcBdg@mail.gmail.com>


--IGyJx9V+FxVTS+Dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 05:45:12PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Wed, 27 May 2026 at 16:54, Conor Dooley <conor@kernel.org> wrote:
> > On Wed, May 27, 2026 at 02:44:51PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> > > > On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wr=
ote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potent=
ial issue(s) to consider:
> > > > > - [Medium] Strict array ordering prevents the independent use of =
newly added optional clocks.
> > > > > --
> > > > >
> > > > > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > > > > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > >
> > > > > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H fa=
mily
> > > > >
> > > > > This commit updates the clock bindings for the RZ/V2H family SoCs=
 to include
> > > > > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLK=
C. The
> > > > > AUDIO_CLKA input is fed internally and thus does not require a bi=
nding entry.
> > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rz=
v2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.ya=
ml
> > > > > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg=
=2Eyaml
> > > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg=
=2Eyaml
> > > > > > @@ -26,16 +26,22 @@ properties:
> > > > > >      maxItems: 1
> > > > > >
> > > > > >    clocks:
> > > > > > +    minItems: 3
> > > > > >      items:
> > > > > >        - description: AUDIO_EXTAL clock input
> > > > > >        - description: RTXIN clock input
> > > > > >        - description: QEXTAL clock input
> > > > > > +      - description: AUDIO_CLKB clock input
> > > > > > +      - description: AUDIO_CLKC clock input
> > > > > >
> > > > > >    clock-names:
> > > > > > +    minItems: 3
> > > > > >      items:
> > > > > >        - const: audio_extal
> > > > > >        - const: rtxin
> > > > > >        - const: qextal
> > > > > > +      - const: audio_clkb
> > > > > > +      - const: audio_clkc
> > > > >
> > > > > [Severity: Medium]
> > > > > Will this strict array ordering prevent the independent use of th=
e newly
> > > > > added optional clocks?
> > > > >
> > > > > Because JSON schema validates arrays strictly by position based o=
n the items
> > > > > list, if a hardware board connects AUDIO_CLKC but does not connec=
t AUDIO_CLKB,
> > > > > the device tree node would provide an array of 4 clocks where the=
 4th name
> > > > > is audio_clkc.
> > > > >
> > > > > When dt_binding_check evaluates this, won't it check the 4th elem=
ent against
> > > > > the schema's expectation of audio_clkb and fail, incorrectly reje=
cting a valid
> > > > > hardware configuration?
> > > > >
> > > > > Should this use an anyOf block enumerating the valid permutations=
 of optional
> > > > > clocks to avoid forcing users to write incorrect device trees to =
pass
> > > > > validation?
> > > >
> > > > Seems like a valid question to me. Can be solved by making the seco=
nd
> > > > last clock an enum.
> > >
> > > Calling them optional may be a misnomer: these pins are present.
> > > Typically we provide zero rate fixed clocks for such clocks in the
> > > SoC .dtsi, to be filled in or replaced by the board .dts.
> >
> > IOW, either both clocks will be provided or none will be?
>=20
> Exactly, see the first hunk of "[PATCH v4 3/8] arm64: dts: renesas:
> rzv2h: Add audio clock inputs" later in this series.
> https://lore.kernel.org/20260525110603.4018170-4-john.madieu.xa@bp.renesa=
s.com

In that case,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

--IGyJx9V+FxVTS+Dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahcdfAAKCRB4tDGHoIJi
0m0IAQCJmo5GfaZagqcruHh7ZH/z4UQfNwI5SfPvDii/H8WyawD8CME3psL+2tN9
EwPFLp/FVU8z8lWZ+SpNCmnmJfCE4AE=
=uRa+
-----END PGP SIGNATURE-----

--IGyJx9V+FxVTS+Dr--
