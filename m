Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0530C172;
	Sat, 13 Jun 2026 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781359934; cv=none; b=j8JBuf2vxb92A9e/923Z19HDV54dyP/DPv0bWRueO9VPOXXbl6VCEZr4AUyllAYFCPWRIKP7uq/O5xCn7NF5HLN82f6wMghnzxNYx1O8ZykUsEgz1GaWUnYHYo2lt3Pdwmy57dE0Y4dtmaww/h7jTE7w95ROAP0jNxpryMZhp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781359934; c=relaxed/simple;
	bh=9sf5RX76Qg3Fsb9LsJOdbwZYhik9BU5n/mmgrjEARWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4Idk8Xkh/r+8co6VrcR5b5bDhBF+9c9sTmNmRDhfDPL33yNcpw7v4GqXZ8Ktz5pdfNz/SVjwr++RJviyor+6Dxqj8o1va9hK4m2aoJyE71l7vFcjHf82M/XBuK4Xi/MTK0RG1VOPvBxAv6aMmfKYlHtH8G5cIeJ3nmVgf00I3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 407FD37002F0;
	Sat, 13 Jun 2026 14:12:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 510C8B45508; Sat, 13 Jun 2026 14:12:02 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id A3469B45501;
	Sat, 13 Jun 2026 14:12:01 +0000 (UTC)
Date: Sat, 13 Jun 2026 16:11:59 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v9 5/9] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2
 support
Message-ID: <ai1lLxu9rFYfeUEF@collins>
References: <20260518153339.619947-6-paulk@sys-base.io>
 <20260518161130.F0A4CC2BCB7@smtp.kernel.org>
 <CAGb2v65+JwwU2p5TQ6hrqonYNUgVgZQMPY6D=ROqWJu=xy=drQ@mail.gmail.com>
 <ahWqcWy_6QuNIOi-@shepard>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BmBfy00rvIVsUu+z"
Content-Disposition: inline
In-Reply-To: <ahWqcWy_6QuNIOi-@shepard>


--BmBfy00rvIVsUu+z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Le Tue 26 May 26, 16:13, Paul Kocialkowski a =C3=A9crit :
> > > > +                     reg =3D <0x01cb2000 0x1000>;
> > > > +                     clocks =3D <&ccu CLK_BUS_CSI>,
> > > > +                              <&ccu CLK_MIPI_CSI>;
> > > > +                     clock-names =3D "bus", "mod";
> > > > +                     resets =3D <&ccu RST_BUS_CSI>;
> > >
> > > Will this node fail dtbs_check schema validation? The existing device=
 tree
> > > binding schema for "allwinner,sun6i-a31-mipi-dphy" requires an interr=
upts
> > > property, which appears to be missing here.
> >=20
> > Yeah, this is definitely going to fail validation.
>=20
> To be very clear about this, the interrupt is absolutely not required for
> proper operation of the unit and there's a chance we might eventually see
> a SoC that doesn't have it wired.
>=20
> I could just hook the interrupt for now and we could make it optional if =
ever
> needed, but I could also mark is as optional now if you prefer.
>=20
> > > If the V3s hardware physically lacks a D-PHY interrupt, would it be b=
etter
> > > to add the V3s-specific compatible string and update the binding sche=
ma
> > > to make the interrupts property conditionally optional for the V3s?
> >=20
> > FWIW the vendor kernel has some code for the D-PHY's interrupt bits [1].
> > Could you add the interrupt (I'm guessing the MIPI-CSI interrupt?) and
> > give it a quick test?
>=20
> Thanks for digging this up! It really looks like it's just used for debug
> purposes.
>=20
> I have previously used the mipi csi-2 interrupt for the mipi csi-2 contro=
ller
> and never for the d-phy. There's a chance it's the same interrupt that is=
 wired
> to both units (like it is for isp/csi).
>=20
> I'll give it a try when I get back home. If it doesn't trigger, it probba=
ly
> means it's not wired to the d-phy and should really be made optional.

I just tested it: the interrupt is wired to both the mipi csi-2 and d-phy
units and triggers when interrupt enable bits are set on the d-phy.

So I will just add it to the d-phy node and keep the property marked as
mandatory in the binding.

All the best,

Paul

> > Thanks
> > ChenYu
> >=20
> > [1] https://github.com/gediz/v3s-linux-sdk/blob/master/linux-3.4/driver=
s/media/video/sunxi-vfe/mipi_csi/dphy/dphy_reg.c
> >=20
> >=20
> > > > +                     allwinner,direction =3D "rx";
> > > > +                     status =3D "disabled";
> > > > +                     #phy-cells =3D <0>;
> > > > +             };
> > > > +
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026051815333=
9.619947-1-paulk@sys-base.io?part=3D5
> > >
>=20
> --=20
> Paul Kocialkowski,
>=20
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>=20
> Expert in multimedia, graphics and embedded hardware support with Linux.



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--BmBfy00rvIVsUu+z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmotZS8ACgkQhP3B6o/u
lQw1ChAAiF20uGxNDOycrnVDBnuiX+febC+MQJwpqrGMHH3EoqxmnThKrh0zJMpk
s5ijPNG+qdPTIHIRVzOFYRY1nGa1c3H1IRua1yOx6Ipi3z+Q6Ex/IbLOKoRRsF1m
Z5USsjvqGJ3++c/8Wlqf0Lp9W7+Vs8QuQLQmUi3aZ7l8BjG16OsPzXqapUPuR3zK
tljeOJrDzoqg2pwIj/WyPnxHQIruS4T8DiOBfXfkTjBzZk1uBvZkE7XLAEPNFUDG
AAolAO3cgTEJjESa3nFQnFdNI27fZ7ebuMHevIbc5ukkO8KRszuh1+VlISgmAY+C
gte/JnkwQl6azdizs715N0V7yDg1h13mtgDRWf9GqLFveY8SIKU/s3DHhQ9H8ca9
LCN9AX+8qE7kjv5BnA1BcyrEawrjOO37c4ogUm6dg6P7Gjr4OjU1+FqZXfausUw0
ksjMUrArPrHV1ff406HeiJ2OnyO6CI6gPtTQfzpdaxOp9Il3wsBugl/O8ZPjqdLC
KQmQMVt2RNTM2fGQXtG/Sv8Px+8XVmyfHGH/ioR85HAQf6vmO2aO8rdsK7RCrmWm
E/BfS0JGas31C92BRQ2QqYtujonEcMAQqDSRW5GtBDEqxiF0sJDET+tPraXoNql6
X5xipjSOClXd/fvntRPYDs6YXwWpGp0bIpl02JhxEqTTU1nhFag=
=caES
-----END PGP SIGNATURE-----

--BmBfy00rvIVsUu+z--
