Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822382E9729;
	Wed, 10 Jun 2026 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108291; cv=none; b=dekEZHw3SDb9JGaKlYceubjbYHOIe8dQzL82WYbFDx/Qf+PpaaoHrZe9gUunlHf5hV4EEYGGEJ6ZFmHUMZ9SK3AL9vGsUif7Nae6WuwAycUqzxknMTwuoziYHyywdQczQKeKrhjWIlN1DNqZn6zW5leISYZ1/EvPj0iwqjm9KgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108291; c=relaxed/simple;
	bh=WG8ZHRpOmtS3cBjxoVUlMsSm5s2iDPAHWB7OahC+Hoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqQgoyKwOtLu1qqs/vP3uSO0LMewW2MvoMclMYMsX8iskKfsJJhcIlY4AKaogKKCKCv67pqIj0dhZM7W4tH4XMtsidgt2n9UAZpTMLzL0I6hDRfxAZbR8szHESwYaPnf483XZy+oMiEWjQiUiZDO0cbQr9NPqns4uR4Wev08y2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAdv01eB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAdv01eB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779381F00898;
	Wed, 10 Jun 2026 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108290;
	bh=i1SiM+srhZJrxPc41KcEFlLF5o71oWdU4HjzfQk2qsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BAdv01eB0xNBgP+KzFAbufOm1uJciimy9BeA8Vv7UpuftCOLfm4AmdYphdxH1n4cx
	 QueY/efPdo1J6YBcxZaJvc2VImjvSD2XHM/JYHfq3hPZgUa+jdViTLEWNOT9JMyO6p
	 kIaj4DLo9kfBGtSX71VZqsf1lmpDi/eIs6QgsPB8HBiexM7VRqR4ZEbvwBi0gqGw17
	 1kiqIm6inAwNXhq72jnKt9tH1vA7boCuNcYTroTwa/PIzDD1QCmvxdM9Gnhp/P0nRB
	 4CMyuRH881E2UdW9DNG26oR9chGP09tFC9+bxlbCHW4n+RjQE0w0RESJFcb6Bz35qG
	 8FnILFi4S6kew==
Date: Wed, 10 Jun 2026 17:18:03 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: timer: mips,p8700-gcru
Message-ID: <20260610-triangle-parakeet-151de7a14cf0@spud>
References: <20260610-riscv-time-mmio-v8-1-a865206675c6@htecgroup.com>
 <20260610082646.B29F71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hYwqHXbjlgBBv1ZM"
Content-Disposition: inline
In-Reply-To: <20260610082646.B29F71F00893@smtp.kernel.org>


--hYwqHXbjlgBBv1ZM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 08:26:46AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Mismatch between the node's unit-address and the first address in=
 its 'reg' property in the device tree example.
> --
>=20
> commit 28ad318962744fd052dc7a14265d2214d613bc60
> Author: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> dt-bindings: timer: mips,p8700-gcru
>=20
> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
> platforms. The GCR.U memory region contains shadow copies of the RISC-V
> mtime register and the hrtime Global Configuration Register.
>=20
> > diff --git a/Documentation/devicetree/bindings/timer/mips,p8700-gcru.ya=
ml b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
> > new file mode 100644
> > index 0000000000000..3498255762cce
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/mips,p8700-gcru.yaml
>=20
> [ ... ]
>=20
> > +examples:
> > +  - |
> > +    timer@1617f000 {
> > +        compatible =3D "mips,p8700-gcru";
> > +        reg =3D <0x1617f050 0x8>,
>=20
> [Severity: Low]
> Does the unit-address in the node name (1617f000) need to exactly match t=
he=20
> first address specified in the reg property (1617f050)? This mismatch wil=
l=20
> likely trigger a unit_address_vs_reg warning during dt_binding_check.

Yes, it should.

>=20
> > +              <0x1617f090 0x8>;
> > +    };
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260610-riscv-time-=
mmio-v8-0-a865206675c6@htecgroup.com?part=3D1

--hYwqHXbjlgBBv1ZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimONwAKCRB4tDGHoIJi
0pP0AQDcMdQQeJ+Yt7AkRWY6pdWg62A8j/RViuNF9nJd7im04AEA33Z90YcsthMN
epH1Xg6r5w53zCuM4QTj1jVA73PwzgI=
=XxAa
-----END PGP SIGNATURE-----

--hYwqHXbjlgBBv1ZM--
