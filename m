Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A826738D;
	Mon, 25 May 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779728202; cv=none; b=koggc8KoIFbxI5wRPgCDjfkjeRQQ2yRcQi8LaJGx75ptEs2WFy2UciSqEl+5MIx8l3A1ckliIeJb1TBnkNH/yW3/JlUsBgGm9KDCC36trqpCZ9a31b1l5pcQsBw3HphrJjdjiN+7fhMJZec5LlTLWu5eReVkOpxV5iKQvYkodxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779728202; c=relaxed/simple;
	bh=GArPRsREuNZr1yR4ENQ3MYt68HLFzHW9R10+lZrlnxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k68rAbCqBmMzYVrEPJkYJsoJNlUjWKSKvRvt0lw5Hjp7leTLzDkaPvgG0GngzBngAhVUE3seLpqPxD9VEMdIkWz7iqwUY+cJGphnhBP95KsNT18994k3TuvpOiys87m9nLUI6vXbCjL8oTVch70tZwZrdXdoRuAjKI28g15IWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+wjh3BL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+wjh3BL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAE41F000E9;
	Mon, 25 May 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779728201;
	bh=tCDCfEDWhIap0JffiNMerwlm/HNbTpZ6KbNrccX+3po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+wjh3BL+R/PsCgogKFUcGMZbb+4c801iB8yRR+7KtVAqflDu5jqIFRgjpbCu/rne
	 1gQsYWzNW+5kJ/medxzBGIYB7Z6ybZp4ibJ6L61NHykmc/CHS01OrMxfBVgPN8T/aT
	 NNzrhEv6ivbyFidbbFT2hVbSuUhPKJCgxCqgXsZQ8xyd0XqLbL0CopNcjzaiyZlLME
	 prZDqz1j3cryqk1oadiN4QH6GTGMtrl2uJUWKyF7wwRKdDOMCY+Gz9QJCkM6UXePMf
	 EOThHJGoXpk28MLmzLspCsLAywmuOT+ASMGkmruzS8XpkhZzjOw+JdVCLwa7YKnak1
	 AsTVzmB99KI0w==
Date: Mon, 25 May 2026 17:56:38 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock
 inputs for RZ/V2H family
Message-ID: <20260525-gaining-unaired-c96367a78c9b@spud>
References: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
 <20260525111920.15F771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5MiZYj8duF5qWx0T"
Content-Disposition: inline
In-Reply-To: <20260525111920.15F771F000E9@smtp.kernel.org>


--5MiZYj8duF5qWx0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 11:19:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Strict array ordering prevents the independent use of newly ad=
ded optional clocks.
> --
>=20
> commit 3723d06ba80fe72a3e7492af52e5e54aa0f36b03
> Author: John Madieu <john.madieu.xa@bp.renesas.com>
>=20
> dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
>=20
> This commit updates the clock bindings for the RZ/V2H family SoCs to incl=
ude
> the optional external audio clock inputs AUDIO_CLKB and AUDIO_CLKC. The
> AUDIO_CLKA input is fed internally and thus does not require a binding en=
try.
>=20
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.=
yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > @@ -26,16 +26,22 @@ properties:
> >      maxItems: 1
> > =20
> >    clocks:
> > +    minItems: 3
> >      items:
> >        - description: AUDIO_EXTAL clock input
> >        - description: RTXIN clock input
> >        - description: QEXTAL clock input
> > +      - description: AUDIO_CLKB clock input
> > +      - description: AUDIO_CLKC clock input
> > =20
> >    clock-names:
> > +    minItems: 3
> >      items:
> >        - const: audio_extal
> >        - const: rtxin
> >        - const: qextal
> > +      - const: audio_clkb
> > +      - const: audio_clkc
>=20
> [Severity: Medium]
> Will this strict array ordering prevent the independent use of the newly
> added optional clocks?
>=20
> Because JSON schema validates arrays strictly by position based on the it=
ems
> list, if a hardware board connects AUDIO_CLKC but does not connect AUDIO_=
CLKB,
> the device tree node would provide an array of 4 clocks where the 4th name
> is audio_clkc.
>=20
> When dt_binding_check evaluates this, won't it check the 4th element agai=
nst
> the schema's expectation of audio_clkb and fail, incorrectly rejecting a =
valid
> hardware configuration?
>=20
> Should this use an anyOf block enumerating the valid permutations of opti=
onal
> clocks to avoid forcing users to write incorrect device trees to pass
> validation?

Seems like a valid question to me. Can be solved by making the second
last clock an enum.

--5MiZYj8duF5qWx0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR/RgAKCRB4tDGHoIJi
0n9kAQDsStUdMG63NktGAGyVEeqMPNGIHk48TxjiU/9PjRitEgD+I93bIzYJH41l
PZ6fx5aqG+PnR1w0UZTj1qrGs6XPywA=
=WWPc
-----END PGP SIGNATURE-----

--5MiZYj8duF5qWx0T--
