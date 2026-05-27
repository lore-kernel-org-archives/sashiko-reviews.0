Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD623EF66D;
	Wed, 27 May 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893658; cv=none; b=RvJW+Gtx74i7EPdoWvP4ScwhlpBeBHmAirBbNyUmW7pekErgdC+ZdGLX7V6eUZRudngUpTzpN9ZSl4UhDW6ViPfcmkm+Lx/JKK2twTAQx+D911C74aKWZZkSblQmO7+WJW4N6uHX02YNE7m9JGsC4m759UGCxli7eNiWhmDHRN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893658; c=relaxed/simple;
	bh=5KXY9RNo/P9k9vgem9pDEphLfwrz8IF7cNf4NPiSR4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da1cFT3+t91muZbh4f6m/76wzO6HqycRAIbwkS9WIHV06nbHJXlZ9TcidxHCjC/y7LrzwBFegMiVGk+0nZ4mYxyc9RKNPESWLS2LW0HjJcGdLRzyA3uMucxTGtbmI3ntWjCrbnibhLan0/ZRss+91wV9oHU8e9858zEE6tr3JFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRKa1usI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRKa1usI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5C71F000E9;
	Wed, 27 May 2026 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779893656;
	bh=MUpZ3gGj7CH699b71TTXbhvBn43KHNsIqKKfaoprKis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRKa1usIQ3Rz54Wqgp0sibJpWyRhs7khYlReYA6EhqiFXvjcwXdT8YXO67RA9WLEF
	 xkhRz04Bo4I3talF1obu0xfgi7SzLjEtjYZGtTeh68uEye4PaHZC1Oix3gkO8iRmyV
	 VlXsnp/pcqZi/foJ38V/uRug3VEY1MB6aTKTdeuuQ2kUaz21NS9qmm4mniTosEo8iE
	 M/1vV1qSY8uI84gBNfUaIzOucyn1izKIKcjNwmpF4cmd2aGp2wiYt2hpOMFZYaeDEt
	 KA9lOXuNDMNBnXO469UHijMlF8WEYZk+AsfNZPOgxBJlPrjNWzSy+95MzxFa/fUE5w
	 9Ycjh3TeNdKAw==
Date: Wed, 27 May 2026 15:54:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: sashiko-reviews@lists.linux.dev,
	John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
Message-ID: <20260527-prankish-causing-4139d0dd0b51@spud>
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org>
 <20260525-gaining-unaired-c96367a78c9b@spud>
 <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Zkf7kpn/+4vMAhl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWUeExOnKm1=kRSr0=HVJhgyLDBAK3VqTP-LK1q0-f9gA@mail.gmail.com>


--7Zkf7kpn/+4vMAhl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 02:44:51PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, 25 May 2026 at 18:57, Conor Dooley <conor@kernel.org> wrote:
> > On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] Strict array ordering prevents the independent use of newl=
y added optional clocks.
> > > --
> > >
> > > commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> > > Author: John Madieu <john.madieu.xa@bp.renesas.com>
> > >
> > > dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
> > >
> > > This commit updates the clock bindings for the RZ/V2H family SoCs to =
include
> > > the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. T=
he
> > > AUDIO_CLKA input is fed internally and thus does not require a bindin=
g entry.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-=
cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > > @@ -26,16 +26,22 @@ properties:
> > > >      maxItems: 1
> > > >
> > > >    clocks:
> > > > +    minItems: 3
> > > >      items:
> > > >        - description: AUDIO_EXTAL clock input
> > > >        - description: RTXIN clock input
> > > >        - description: QEXTAL clock input
> > > > +      - description: AUDIO_CLKB clock input
> > > > +      - description: AUDIO_CLKC clock input
> > > >
> > > >    clock-names:
> > > > +    minItems: 3
> > > >      items:
> > > >        - const: audio_extal
> > > >        - const: rtxin
> > > >        - const: qextal
> > > > +      - const: audio_clkb
> > > > +      - const: audio_clkc
> > >
> > > [Severity: Medium]
> > > Will this strict array ordering prevent the independent use of the ne=
wly
> > > added optional clocks?
> > >
> > > Because JSON schema validates arrays strictly by position based on th=
e items
> > > list, if a hardware board connects AUDIO_CLKC but does not connect AU=
DIO_CLKB,
> > > the device tree node would provide an array of 4 clocks where the 4th=
 name
> > > is audio_clkc.
> > >
> > > When dt_binding_check evaluates this, won't it check the 4th element =
against
> > > the schema's expectation of audio_clkb and fail, incorrectly rejectin=
g a valid
> > > hardware configuration?
> > >
> > > Should this use an anyOf block enumerating the valid permutations of =
optional
> > > clocks to avoid forcing users to write incorrect device trees to pass
> > > validation?
> >
> > Seems like a valid question to me. Can be solved by making the second
> > last clock an enum.
>=20
> Calling them optional may be a misnomer: these pins are present.
> Typically we provide zero rate fixed clocks for such clocks in the
> SoC .dtsi, to be filled in or replaced by the board .dts.

IOW, either both clocks will be provided or none will be?

--7Zkf7kpn/+4vMAhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahcFkgAKCRB4tDGHoIJi
0tvIAQDK/XT39cUBdI4LVU3DPH8G0Vz5MYdIb4zkpeFjaSVQfwEAj8ZfoI+9KDDa
fqbXj2sUaUIji05z9Ca5Hki8NTLeHA0=
=HvoU
-----END PGP SIGNATURE-----

--7Zkf7kpn/+4vMAhl--
