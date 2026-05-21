Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0623EA8B;
	Thu, 21 May 2026 20:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779393788; cv=none; b=re1WbHe4uRh4uQuky2ahJexlN5Y7U98EnvNoCYkMCfp9VNd0yGb88MjFeKI3/QYXsLgvMdvDnbb9CcM70o72ups57LMaTjgvuNz3PSfVBW0GIvesMmV1Q6A+QI1tXaga8whNXR2DmfW6Pz9uNkq4sJ8qR/FyXchtbOfvNr0m90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779393788; c=relaxed/simple;
	bh=H9AvFKKQjepJnOdb1a/bsg8n++DrKK/1dV4eClM8mw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mknoVLPUixyU1yN8uAru+IgQD+Rc8IoKWs5qfN5bIUF0RttGe6U3Rw57tGxCgKuSjq2B2JBU+eycOl9y+vo3jgA+p4SI2SDhAvos3XdO2YZCwrLStVquORMdG3gWP/I+Gru+DBg0Seh1UieLfx5VUKAZucILAkgbjsBsBCjaLcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5M0veWo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5M0veWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED681F000E9;
	Thu, 21 May 2026 20:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779393787;
	bh=E4YRGGW4H7ruxp6iaGiVCmzzXdYcdeqEv6eGOIZaGs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5M0veWoREZ97k8obzUBsqywun/YxFvO2v6AcAMdrWutKyWM3KJlMKpz5vOfJ7dQE
	 PVKGG8LROPDqU3WqpVVKAcIGU/JpmAID2iZpdl0LwfvImzPZgFrX9mfZ/Cl0Wl1g52
	 pTB4qKjogUuc9sKJV7+xDbF2Yu69aVDAQNR/u8YqArNWgv9PkLFsdfBr3ElHPKv7TE
	 D4Ys7eSDlgwpsr3YObvDZF8FKi21QrrkcgFao0eKu/uE7wISy58TZY1mtJSWvsDE5O
	 PLY3Kyavpb/ZrPVifsqYiv0V44KVKBWsycrZj+Q+HhdWUdSctS2w6BsBzBj3y9z1ug
	 bRDwlBaQxJweg==
Date: Thu, 21 May 2026 21:03:04 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp
 compatible string
Message-ID: <20260521-pester-exclusive-2fff881b3a3c@spud>
References: <20260521-no_drd_config_v9-v9-1-2512cef10104@cadence.com>
 <20260521081651.D22181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nCnuKTetHULOvloM"
Content-Disposition: inline
In-Reply-To: <20260521081651.D22181F000E9@smtp.kernel.org>


--nCnuKTetHULOvloM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 08:16:51AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] The schema does not enforce the presence of the `dr_mode` prop=
erty when `cdns,cdnsp` is matched, despite the commit message explicitly re=
quiring it.
> - [Medium] Array bounds (`minItems` and `maxItems`) for `reg`, `reg-names=
`, and `interrupt-names` are not explicitly constrained inside the conditio=
nals.
> - [Medium] Use of the empty schema `{}` as a wildcard for compatible stri=
ngs breaks dt-schema validation and explicit documentation rules.
> --
>=20
> commit 1f787c873a0b8a21200340bba7dffd95f1916193
> Author: Pawel Laszczak <pawell@cadence.com>
>=20
> dt-bindings: usb: cdns3: Add cdns,cdnsp compatible string
>=20
> Introduce a new generic fallback compatible string cdns,cdnsp for
> Cadence USBSSP controllers without the Dual-Role Device (DRD) register
> block. It restricts the resources to host and device configurations,
> requiring dr_mode to be explicitly set.
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Doc=
umentation/devicetree/bindings/usb/cdns,usb3.yaml
> > --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> > @@ -17,22 +17,24 @@ description:
> > =20
> >  properties:
> >    compatible:
> > -    const: cdns,usb3
> > +    oneOf:
> > +      - const: cdns,usb3
> > +      - items:
> > +          - {}
>=20
> [Severity: Medium]
> The commit message mentions using an empty schema wildcard {} to allow
> future vendor SoC compatibles to be prepended. Does this break dt-schema
> meta-validation during dt_binding_check? The tooling usually expects
> concrete compatible strings to be explicitly documented via an enum rather
> than using a wildcard.

Obviously this is intentional.

> > +          - const: cdns,cdnsp
>=20
> [ ... ]
>=20
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: cdns,cdnsp
> > +    then:
> > +      properties:
> > +        reg:
> > +          items:
> > +            - description: XHCI Host controller registers
> > +            - description: DEVICE controller registers
> > +        reg-names:
> > +          items:
> > +            - const: xhci
> > +            - const: dev
>=20
> [Severity: Medium]
> In dt-schema, specifying an items list inside conditional branches does n=
ot
> automatically override the top-level minItems and maxItems length constra=
ints.
>=20
> Since the top-level schema allows 2 to 3 items, would omitting maxItems: 2
> for reg and reg-names in this 'then' branch allow a 3-item configuration
> to incorrectly pass validation? Similarly, does omitting minItems: 3 in t=
he
> 'else' branch allow a 2-item configuration to pass for cdns,usb3?

This looks valid, easily fixed by adding the correct fooItems
properties.

>=20
> > +        interrupts:
> > +          maxItems: 2
> > +        interrupt-names:
> > +          items:
> > +            - const: host
> > +            - const: peripheral
> > +        dr_mode:
> > +          enum: [host, peripheral]
>=20
> [Severity: Medium]
> The commit message states that dr_mode must be explicitly set to either
> 'host' or 'peripheral' when this compatible is matched.
>=20
> Should dr_mode be added to a required list in this block? Without it, the
> property remains optional, and device trees missing dr_mode could silently
> pass validation.


This is a good point, because the default dr_mode is otg.

--nCnuKTetHULOvloM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9k+AAKCRB4tDGHoIJi
0gv2AP4po8ZPJ8NphmQW5U/c/Dv1wGAJwv3KaG3GqY2pvyT4lQEA459vH44slyTp
sjL7ggz1tyS4m2QADRBm115tDt0mAQE=
=2c6W
-----END PGP SIGNATURE-----

--nCnuKTetHULOvloM--
