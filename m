Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC13E1D16;
	Mon, 29 Jun 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746209; cv=none; b=l+KkVVWPsEAy/rwGBhthBJXu/9WCnBi2I7AXounxfEm8BIKTtFV1Xdzna27GGQ/WnHvT8ZaAyfPsgZUPxkcwGfBV3Z2cvUjL45eh12ZaQ9fsAB+BZkt4HoOaXQ1V13V4VVzNNkkbuda490OgLnY+y/ynUsf49QLshq/BcY3BIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746209; c=relaxed/simple;
	bh=AV3l5fVgtxTGprNu1pDmP2wuvYyWSJFeofspKPbFotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUHAmSmbWbbS/q/m8DfHVSxGnq37WjdzopI03yXM9fxXnefh/Khx4OvxOSEzlKF6z/BElXuClzs1RfpXL2VJl4QEicfUhZQbmToUrCXOFlf7ydqH2EC/6N7GYv/+NqlZlIRDm3OQf0hpcBe6Xaa09Vwc5C/iOpJs0UTXzvbxNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQH/acCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQH/acCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FD11F000E9;
	Mon, 29 Jun 2026 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746207;
	bh=iIgejC6IQrPGLLqgVPr+xqlt9s+MfdG8wn6GjoNgG6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gQH/acCKvJMVdLCh2PWTn+o5+zrz4Vi0PMIGAqzA18D4vLL9xtEOXuWZ6hFc/Ya9U
	 QrOXqz8SS9HAx5qiyd7sYl+hIR4pZBaDclW+PnUf9xWKxTYWWeqgd9wZm0vWt4qRf7
	 Qdv4dLr+iHB75y+LTO0qB6HuuTIyF8I03nBLP4pbpA57fH4f2M/DBwcGaebKa+/k6k
	 5lk/udHUO/35V/x14cZ+j63aMOS+W5SqGM9+KLJsqnBgwfMfsAd0w5v1BP2yUKKHJC
	 ICoZ0N+h7jywHMqLvZTWOsejlT2EqOs8Hh1TZfs+lYDBUsHoRj+P+n+7U889w9RO2A
	 9idvMsJR42N1A==
Date: Mon, 29 Jun 2026 16:16:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-sunxi@lists.linux.dev, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
Message-ID: <20260629-aliens-busload-ef9178973b4f@spud>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
 <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
 <20260629125305.0DF981F000E9@smtp.kernel.org>
 <1jpl198jzk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikOrL7wRpvUSBvGg"
Content-Disposition: inline
In-Reply-To: <1jpl198jzk.fsf@starbuckisacylon.baylibre.com>

--ikOrL7wRpvUSBvGg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 05:05:51PM +0200, Jerome Brunet wrote:
> On lun. 29 juin 2026 at 12:53, sashiko-bot@kernel.org wrote:
>=20
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] The `clock-output-names` property has a global `maxItems: 3`
> > constraint and a description limiting it to three clocks, which contrad=
icts
> > the new clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
> > --
> >
> > commit a1565b632e372c724867216463a453c9d1600ad2
> > Author: Jerome Brunet <jbrunet@baylibre.com>
> >
> > dt-bindings: rtc: sun6i: add sun60i-a733 support
> >    =20
> > Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> > peripheral oscillator clock gates of this SoC.
> >
> >> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31=
-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.y=
aml
> >> index 9df5cdb6f63f2..197a6f67b180a 100644
> >> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.ya=
ml
> >> @@ -33,6 +33,7 @@ properties:
> >>            - enum:
> >>                - allwinner,sun20i-d1-rtc
> >>                - allwinner,sun55i-a523-rtc
> >> +              - allwinner,sun60i-a733-rtc
> >>            - const: allwinner,sun50i-r329-rtc
> >
> > [ ... ]
> >
> >> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindin=
gs/clock/sun6i-rtc.h
> >> index 3bd3aa3d57ce1..5132a393ca4b6 100644
> >> --- a/include/dt-bindings/clock/sun6i-rtc.h
> >> +++ b/include/dt-bindings/clock/sun6i-rtc.h
> >> @@ -6,5 +6,9 @@
> >>  #define CLK_OSC32K		0
> >>  #define CLK_OSC32K_FANOUT	1
> >>  #define CLK_IOSC		2
> >> +#define CLK_HOSC_UFS		8
> >> +#define CLK_HOSC_HDMI		9
> >> +#define CLK_HOSC_SERDES0	10
> >> +#define CLK_HOSC_SERDES1	11
> >
> > [Severity: Low]
> > Will adding clock IDs up to 11 conflict with the existing clock-output-=
names
> > constraint in allwinner,sun6i-a31-rtc.yaml?
> >
> > The clock-output-names property currently has a global maxItems constra=
int
> > alongside its description:
> >
> >   clock-output-names:
> >     minItems: 1
> >     maxItems: 3
> >     description:
> >       The RTC provides up to three clocks
> >
> > If a device tree author attempts to define an array of clock-output-nam=
es
> > to document all outputs for the allwinner,sun60i-a733-rtc node, won't i=
t fail
> > dt_binding_check validation because it exceeds the maximum allowed item=
s?
>=20
> Not quite sure what to do with that one.
>=20
> The h616 compatible devices all exposed more than 3 clock through the
> provider, even if the higher IDs did not have define.
>=20
> The clock output names for the h616 compatible device are not really
> supposed to be defined through DT ... at least AFAIU ??

The output names aren't even defined anyway, so the property is not
really all that helpful. It's worth increasing the max to whatever is
permitted now and look into the conditional sections to see if any
constraints need updating.

--ikOrL7wRpvUSBvGg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKMXAAKCRB4tDGHoIJi
0uAOAQDWZnHOaoJjJp7KnT92/8egsTTLoA7FrX2Iawn+kUmAZwEAooWfygxiGHXR
HCwkdNQv8x9nm9kBBkt2gh3PA3JS2gw=
=w6P2
-----END PGP SIGNATURE-----

--ikOrL7wRpvUSBvGg--
