Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038426B764;
	Tue, 26 May 2026 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804808; cv=none; b=T+TlOBqIqsJQFR6lLRaHbkDQOAyKZptgUku+eMH5+aTL3NiiDmk/2yi3xHCIX8ck1fDhpMZyDO+B5mcY0Tf0nU6iHH3MLnO9BbdXWyUIjTPsyrXlVR7b+fwKbzC5O//v049sija0f+sbk0aSv98o2Y6ssCYyi8Wzrpg+e2gcXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804808; c=relaxed/simple;
	bh=0ExaLqZz8H/scaF4ESGOgbBXyDPgoURUWi3f4cwnXos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoB1x81Zpj1A7PR57UaLu1R2UjLT1dSt1YCe+kgU199DAizYWxmBdDigQ70AfzmizVJiabHZiixxHnYaLwhSQVbkwa0f4tInblUxiKMNa//rO8t8q3katHzgGmX+JK+z9Ey3V856lNHlT3OqOfZi8Paq5+0sD9TKf2MjXIFeL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 1A5F43700271;
	Tue, 26 May 2026 14:13:17 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2690FB408F5; Tue, 26 May 2026 14:13:16 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [37.167.72.125])
	by laika.paulk.fr (Postfix) with ESMTPSA id E42EAB408F4;
	Tue, 26 May 2026 14:13:14 +0000 (UTC)
Date: Tue, 26 May 2026 16:13:05 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v9 5/9] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2
 support
Message-ID: <ahWqcWy_6QuNIOi-@shepard>
References: <20260518153339.619947-6-paulk@sys-base.io>
 <20260518161130.F0A4CC2BCB7@smtp.kernel.org>
 <CAGb2v65+JwwU2p5TQ6hrqonYNUgVgZQMPY6D=ROqWJu=xy=drQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3/yyHngUfyzKNMrH"
Content-Disposition: inline
In-Reply-To: <CAGb2v65+JwwU2p5TQ6hrqonYNUgVgZQMPY6D=ROqWJu=xy=drQ@mail.gmail.com>


--3/yyHngUfyzKNMrH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sun 24 May 26, 20:49, Chen-Yu Tsai wrote:
> On Mon, May 18, 2026 at 6:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] The `dphy` node is missing the required `interrupts` propert=
y and a SoC-specific compatible string.
> > --
> >
> > commit ceae1b5da24380c4a30d9a8b480a23eaee3c0814
> > Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >
> > ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
> >
> > This commit adds MIPI CSI-2 support to the Allwinner V3s SoC. It introd=
uces
> > the device tree nodes for the CSI0 controller, the MIPI CSI-2 bridge, a=
nd
> > the D-PHY block.
> >
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/bo=
ot/dts/allwinner/sun8i-v3s.dtsi
> > > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > [ ... ]
> > > +             dphy: d-phy@1cb2000 {
> > > +                     compatible =3D "allwinner,sun6i-a31-mipi-dphy";
> >
> > Should a SoC-specific compatible string like "allwinner,sun8i-v3s-mipi-=
dphy"
> > be included here alongside the generic a31 fallback?
>=20
> Following our general guideline, I believe it should.

Yes I guess it makes sense. I don't think we've been doing that in every ca=
se
but it doesn't hurt.

> > > +                     reg =3D <0x01cb2000 0x1000>;
> > > +                     clocks =3D <&ccu CLK_BUS_CSI>,
> > > +                              <&ccu CLK_MIPI_CSI>;
> > > +                     clock-names =3D "bus", "mod";
> > > +                     resets =3D <&ccu RST_BUS_CSI>;
> >
> > Will this node fail dtbs_check schema validation? The existing device t=
ree
> > binding schema for "allwinner,sun6i-a31-mipi-dphy" requires an interrup=
ts
> > property, which appears to be missing here.
>=20
> Yeah, this is definitely going to fail validation.

To be very clear about this, the interrupt is absolutely not required for
proper operation of the unit and there's a chance we might eventually see
a SoC that doesn't have it wired.

I could just hook the interrupt for now and we could make it optional if ev=
er
needed, but I could also mark is as optional now if you prefer.

> > If the V3s hardware physically lacks a D-PHY interrupt, would it be bet=
ter
> > to add the V3s-specific compatible string and update the binding schema
> > to make the interrupts property conditionally optional for the V3s?
>=20
> FWIW the vendor kernel has some code for the D-PHY's interrupt bits [1].
> Could you add the interrupt (I'm guessing the MIPI-CSI interrupt?) and
> give it a quick test?

Thanks for digging this up! It really looks like it's just used for debug
purposes.

I have previously used the mipi csi-2 interrupt for the mipi csi-2 controll=
er
and never for the d-phy. There's a chance it's the same interrupt that is w=
ired
to both units (like it is for isp/csi).

I'll give it a try when I get back home. If it doesn't trigger, it probbaly
means it's not wired to the d-phy and should really be made optional.

All the best,

Paul

>=20
>=20
> Thanks
> ChenYu
>=20
> [1] https://github.com/gediz/v3s-linux-sdk/blob/master/linux-3.4/drivers/=
media/video/sunxi-vfe/mipi_csi/dphy/dphy_reg.c
>=20
>=20
> > > +                     allwinner,direction =3D "rx";
> > > +                     status =3D "disabled";
> > > +                     #phy-cells =3D <0>;
> > > +             };
> > > +
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518153339.=
619947-1-paulk@sys-base.io?part=3D5
> >

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--3/yyHngUfyzKNMrH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoVqnEACgkQhP3B6o/u
lQyVBxAAkmBbJfWH/Zap2m4SELdLqBWc4TbBFrxkvapEAEVhEDEjPt43XnjnVTGB
RlS4WMVVEdLi1WtYEYPA7VkcGsYZQsuwySF5q0DoNkUbumm7qu0c2oewxahvd8i4
iC1xUQHV+tgcIOd3KzRWgb6r+PoEASdHP1ND+Nn5ifZtA4qQODLtIK92cQfx2qXR
zKvub/V2rDx9U6wHaoDcDkY5WTDh27Yb95Pwv9EuublD1RovX4zhNyDRFSTol3pB
APuNJoQZAEhL7YLOK+myTEnZgQTSsYCrALKJyIpj++9wtBUfaCQvzZVhTBQJrq0H
v4WHw/vc0M0FcULjEU4kQhpqpkDKx44rhny8yXxiI+9DpNWrJ5o8neoVUiEn+Yzi
omFq3SSeGGbw9r5A57Y6COhERx5IFkIJ0p+0oz5ANwFwKSADL7/JTk35Fu/cg6Hn
zJ+SMjLHJJFl4P5AunKhxed1M4w1QGev8kkkmp5FXcdwNU/qDVKEqiBXTgCdr6mA
f0JT8pmhSCp3esUbvYrNS+thKgR3s5B+YEUikO9pLhIMvBnfAsmp8RTbRmFyIK78
Lw1Diz6iGKBR+6rsxZlTySZ5nAPEeKIXScdnJFsQPGCBudGhIUEIv82ev7uESu3x
xKIO6SYIio+eUZgeA8QXVqGWVDCvJYUDC5yQ8nS4TqjfI8diJAs=
=sw0R
-----END PGP SIGNATURE-----

--3/yyHngUfyzKNMrH--
