Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55C346766;
	Mon, 29 Jun 2026 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747663; cv=none; b=JxmSfor9s9ARZ95IKz13V/tkkvkV6/hzUNqYStVC0rCLik5IBzFiLV4M5NL0j5Svv8SdoRNxFxUrtmBNlI9+/5V0GzMyeZ5bxFuM1SakFyvZQ2HoGtqOSyclTBkIq6+XM+Uz88uiCn1N6abBHofP/bN9OVs8GDljVF1YZYfVcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747663; c=relaxed/simple;
	bh=rswPskcN/RRQHGJ902UrZcCJGTezAbbrNN6coAxwfc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLCaQcRX9jzMwc9Vh+d0v+Qp+jaG0JIUlmzyDNaTVMglqU+QFjdb/aln78xNaP3FLBP4ovHq0k2aMH7d73xnkf4ExR+szvSt8PC8Ubv3ZlbGj9Fo6itti21Xtu5reKz5m3AlOtq5Z3kDhUWq6B/NXN8n5qBCHunTNlQUEmVJeDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0nOe/r5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0nOe/r5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349F51F000E9;
	Mon, 29 Jun 2026 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782747661;
	bh=PzRxgBHlbkeuvPpeSnjPJmcCLBvqWL+knmj3C3qFY9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0nOe/r5BiPQMgC/pEsdNyfJmtZFPQ1mn2eFSbSbB0GEy/E37qrUwkj82dLhnA2xe
	 OAPua0cPJRZUQJPDQuMQzaEjfjILbAzJ+ER94pp4ts67aHN0ZB2ZwTbRoxZV/B4Q39
	 s/7Lyp6HcTlkgO7HF9Kv6+StugeicBpcmp6sUj2DOJAgzl+EhRtNLtR6VNQ3f7clXM
	 Ixm6hUEJ2EGIdsfX/M3MQUQ8joPjxC6nJsrdhkcez6462pf52VYOwdyf+n1DlhHVBB
	 KVRGWBBcgzIfS4UFYFWDP8RjSuGI6Vn/ecA12Yy8PKKXi40GCA2Lh07KOz0/pIPYyQ
	 smSb1wOrg4hHQ==
Date: Mon, 29 Jun 2026 16:40:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, linux-sunxi@lists.linux.dev,
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
Message-ID: <20260629-grime-chasing-8f09675e5013@spud>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
 <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
 <20260629125305.0DF981F000E9@smtp.kernel.org>
 <1jpl198jzk.fsf@starbuckisacylon.baylibre.com>
 <20260629-aliens-busload-ef9178973b4f@spud>
 <CAGb2v67QV4gt=iXvaWeRCAxcasvzSpgTPodHhspd2ka19Hgdtg@mail.gmail.com>
 <1jechp8j0a.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FsVq+3ZUQ4Vt+gBu"
Content-Disposition: inline
In-Reply-To: <1jechp8j0a.fsf@starbuckisacylon.baylibre.com>

--FsVq+3ZUQ4Vt+gBu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 05:27:01PM +0200, Jerome Brunet wrote:
> On lun. 29 juin 2026 at 23:20, Chen-Yu Tsai <wens@kernel.org> wrote:
>=20
> > On Mon, Jun 29, 2026 at 11:16=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >>
> >> On Mon, Jun 29, 2026 at 05:05:51PM +0200, Jerome Brunet wrote:
> >> > On lun. 29 juin 2026 at 12:53, sashiko-bot@kernel.org wrote:
> >> >
> >> > > Thank you for your contribution! Sashiko AI review found 1 potenti=
al issue(s) to consider:
> >> > > - [Low] The `clock-output-names` property has a global `maxItems: =
3`
> >> > > constraint and a description limiting it to three clocks, which co=
ntradicts
> >> > > the new clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
> >> > > --
> >> > >
> >> > > commit a1565b632e372c724867216463a453c9d1600ad2
> >> > > Author: Jerome Brunet <jbrunet@baylibre.com>
> >> > >
> >> > > dt-bindings: rtc: sun6i: add sun60i-a733 support
> >> > >
> >> > > Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for =
the
> >> > > peripheral oscillator clock gates of this SoC.
> >> > >
> >> > >> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6=
i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-=
rtc.yaml
> >> > >> index 9df5cdb6f63f2..197a6f67b180a 100644
> >> > >> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml
> >> > >> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-r=
tc.yaml
> >> > >> @@ -33,6 +33,7 @@ properties:
> >> > >>            - enum:
> >> > >>                - allwinner,sun20i-d1-rtc
> >> > >>                - allwinner,sun55i-a523-rtc
> >> > >> +              - allwinner,sun60i-a733-rtc
> >> > >>            - const: allwinner,sun50i-r329-rtc
> >> > >
> >> > > [ ... ]
> >> > >
> >> > >> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-b=
indings/clock/sun6i-rtc.h
> >> > >> index 3bd3aa3d57ce1..5132a393ca4b6 100644
> >> > >> --- a/include/dt-bindings/clock/sun6i-rtc.h
> >> > >> +++ b/include/dt-bindings/clock/sun6i-rtc.h
> >> > >> @@ -6,5 +6,9 @@
> >> > >>  #define CLK_OSC32K                0
> >> > >>  #define CLK_OSC32K_FANOUT 1
> >> > >>  #define CLK_IOSC          2
> >> > >> +#define CLK_HOSC_UFS              8
> >> > >> +#define CLK_HOSC_HDMI             9
> >> > >> +#define CLK_HOSC_SERDES0  10
> >> > >> +#define CLK_HOSC_SERDES1  11
> >> > >
> >> > > [Severity: Low]
> >> > > Will adding clock IDs up to 11 conflict with the existing clock-ou=
tput-names
> >> > > constraint in allwinner,sun6i-a31-rtc.yaml?
> >> > >
> >> > > The clock-output-names property currently has a global maxItems co=
nstraint
> >> > > alongside its description:
> >> > >
> >> > >   clock-output-names:
> >> > >     minItems: 1
> >> > >     maxItems: 3
> >> > >     description:
> >> > >       The RTC provides up to three clocks
> >> > >
> >> > > If a device tree author attempts to define an array of clock-outpu=
t-names
> >> > > to document all outputs for the allwinner,sun60i-a733-rtc node, wo=
n't it fail
> >> > > dt_binding_check validation because it exceeds the maximum allowed=
 items?
> >> >
> >> > Not quite sure what to do with that one.
> >> >
> >> > The h616 compatible devices all exposed more than 3 clock through the
> >> > provider, even if the higher IDs did not have define.
> >> >
> >> > The clock output names for the h616 compatible device are not really
> >> > supposed to be defined through DT ... at least AFAIU ??
> >>
> >> The output names aren't even defined anyway, so the property is not
> >> really all that helpful. It's worth increasing the max to whatever is
> >> permitted now and look into the conditional sections to see if any
> >> constraints need updating.
> >
> > Or just not allow it for the newer RTC compatible? On the kernel side,
>=20
> I was edging toward this. Would this be acceptable to you Conor ?
> I'm thinking about disallowing it for all the h616 compatible ones, not
> just the a733.

Works for me.
Just make sure you note somewhere that the names aren't ever defined
anyway.

--FsVq+3ZUQ4Vt+gBu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKSCgAKCRB4tDGHoIJi
0gn5AQDD5BpnbkEuXFqjXr45UvCGpc0VNOtAllspIK02XLX22gEAtkL5sluYvcyP
4gx+sYYqb+rdzPsLBlKIqNSYOsEaLQ8=
=q2lG
-----END PGP SIGNATURE-----

--FsVq+3ZUQ4Vt+gBu--
