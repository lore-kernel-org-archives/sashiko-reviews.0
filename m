Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C43BFACE;
	Tue, 13 Oct 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912873; cv=none; b=Dw1qo+mkK0sAxANL+17xah5pvauY6XF+MZXMJVRBjYID4kyti2nHhEPIdcwioOXu6d7wtk1CpdKO0DXVxePPByyl8JPry8/DvLzyiViNC1FRz8HoLTLWYLe35YNptMVK5DG66yROHu36gzLl/ilma+IA5cL7IPyOwGQTce/+XUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912873; c=relaxed/simple;
	bh=0REZj+Y5xRbXEX63tU1HkTZMW+yMUCxRIOiDxRtW3ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCVEsP8T8RPkEyASxrXuZBCRBWphDYHyRlAJdsrlpdrpsPdX2xXqVZhb1/2I8LMfSL0emKI6pqvKS1sfRSWiLAQcxH8ONCkiFA8rsnXWdzrWiEhUCrOZqQPmJzoaaX942wybjYvFYD4MVHXE41o56fFWYVY1L1gwjX8sUwWGGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ2645ZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ2645ZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9D51F000FF;
	Tue, 13 Oct 2026 17:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912871;
	bh=UKZjkfFZ4FYGcXQEHDMlBAA8+NB177fpIG/AdqrIr4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iJ2645ZVOr7T0MM1npBDbv7PKTxiY7xiPRdXy9tYSKYu8H9JQrhpJSMt2roBVLsqd
	 JN231BYSSvTzsn5Tm3eQinmd2uAG8rJ+ZE2mp8Hnt/+8JkOyUf87vygN+e8GCif/xu
	 eWFsQpfRTezdMAHBJRoAaVoiSnxACY6I6zyoHwbWXE95AusfJ9knJ4XrMHoMM17HCz
	 +pFlUAQ+R5APERCQGH7VzYMlXaibGet80PNVf0QCq09Lt94gzAa+/HA3QSDDJQ9Jhj
	 xlgzc0t3WeggjUPP/xYyMLGzoblNpXvPVdAJQWMMzm4Dx2azkuDDTfmg6vMce2QnzR
	 ykqqhZpGWdVog==
Date: Tue, 13 Oct 2026 18:34:28 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Xincheng Ji <jixincheng@ultrarisc.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Message-ID: <20261013-siesta-starship-f078a51d2389@spud>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-7-5ff3ebb2a90d@ultrarisc.com>
 <sashiko-outbox-169511@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+zommd9eSHOBvE74"
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-169511@kernel.org>

--+zommd9eSHOBvE74
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Andrew Lunn <andrew@lunn.ch>

On Tue, Oct 13, 2026 at 10:31:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dts: incorrect RGMII phy-mode causes double clock delay
> --
>=20
> commit 471320732fb47362c8b5d5e16472052117a95204
> Author: Jia Wang <wangjia@ultrarisc.com>
>=20
> riscv: dts: ultrarisc: Add Milk-V Titan board device tree
>=20
> This commit introduces the device tree for the Milk-V Titan board, an ITX
> motherboard based on the UltraRISC DP1000 SoC.
>=20
> Link: https://milkv.io/docs/titan/overview
>=20
> > diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arc=
h/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> > new file mode 100644
> > index 0000000000000..59edd8157221a
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
>=20
> [ ... ]
>=20
> > +&ethernet {
> > +	phy-handle =3D <&phy0>;
> > +	/*
> > +	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
> > +	 * integration adds fixed delays in both directions.
> > +	 */
> > +	phy-mode =3D "rgmii-id";
>=20
> [Severity: Medium]
> The comment notes that the DP1000 integration already adds fixed delays in
> both directions. When the MAC or SoC natively provides the RGMII delays,
> shouldn't phy-mode be set to "rgmii" instead of "rgmii-id"?
>=20
> Setting it to "rgmii-id" instructs the PHY to insert its own internal del=
ays
> as well, which might result in a double-delayed link. This combination co=
uld
> shift the clock outside the valid data window, leading to link failures or
> dropped packets.

You previously commented on this stuff, are you okay with what's
currently here?

Thanks,
Conor.

>=20
> > +
> > +	status =3D "okay";
> > +
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20261013-ultrarisc-d=
ts-v3-0-5ff3ebb2a90d@ultrarisc.com?part=3D7

--+zommd9eSHOBvE74
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5rpAAKCRB4tDGHoIJi
0h7ZAQCiRZY2qP/s7KE/sKZQSgOIJcX5+JzWLHvK4kSQ5R+tLwEAkessTiqpkmWN
AJTOWEIj5oCTatMtUWOfoYuYbDVRegU=
=4sS3
-----END PGP SIGNATURE-----

--+zommd9eSHOBvE74--
