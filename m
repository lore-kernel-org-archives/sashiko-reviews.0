Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F63F4135;
	Mon, 25 May 2026 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727305; cv=none; b=kRGToo3FNKWsfFacAcVK6D3uVLItOwV+P8UXxoVxJkDKqHxBwhqxjowGJKYI5DrX7B2UoDofjjhgiVzCb5iMjqHzgjOHTizxJnEetnlZLG7Lb4nIzZGTiyY6NyHfptGSBCOls8Rf5S8KxfXNzS2fwzCRi2Qlj3G/lRnayehyaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727305; c=relaxed/simple;
	bh=kLDyj8Q66/bPiLXCiftTL+cptht+gtf6AS8vrPXTl9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQNG/mKnsq6vPQOV6Y8Hs7QKye/QSr/K2O+hgNP7UNliV+nlfDhm9q/3AfAFI2YfOGz0dgC6/LMzeBglJrttCxoXAHg22s8TkMDVcn3IeOc/4IkmxITPzqaQKTV46ldUmenHY233IerOx6jF9UKldOlkNq89qV39CjIgOY+vIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaYYP1Hv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaYYP1Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150E31F000E9;
	Mon, 25 May 2026 16:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779727304;
	bh=Ub3un0HwrZIgXb4W43Ub12pPYxU2IUC0+Qd8HSzysC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FaYYP1HvvgnergOAsD/6NMZr2lemID4MtTM1pEK0/pCUuiZnyDxZe8k5t2YYvZzk2
	 amlDrwyhZID7DH9mrNWpliXXr6NA6Hrfq5iP1L5b6DECY/4skH5cO4LL4Hnn0PopMF
	 e7+3K56eIBzyX1h6mSQY3TXYx6SC4r/qLAh9LX6JKNXOyvM+9MSV57LFw7S5gp/KAy
	 W/tpAF8aVX//z21t/jbgB30GjL+AnbuMTFHpSrys3+5LtJUC2Ai+6GbTBnuX1cjZBW
	 rB7UVuEX5tX015PQvr+v7g6GBFOb8vNnW4qFrYAWgAI4ikCxL1svm8aXdjU/e3upYt
	 ycJyAEJwp36qg==
Date: Mon, 25 May 2026 17:41:41 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Manish Baing <manishbaing2789@gmail.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT
 schema
Message-ID: <20260525-radio-ungodly-9725b95ed67a@spud>
References: <20260524094616.106660-1-manishbaing2789@gmail.com>
 <20260524101513.A76711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CWN4pHQhd76h/Vhu"
Content-Disposition: inline
In-Reply-To: <20260524101513.A76711F000E9@smtp.kernel.org>


--CWN4pHQhd76h/Vhu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 10:15:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Mismatch between node unit-address and `reg` property base addres=
s in the YAML example.
> --
>=20
> commit cdc4e472d6093984a0a6b661575b015b013ec9d6
> Author: Manish Baing <manishbaing2789@gmail.com>
>=20
> dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT schema
>=20
> This commit converts the Mellanox BlueField SoC extensions for the Synops=
ys
> Designware Mobile Storage Host Controller from text format to YAML schema.
>=20
> > diff --git a/Documentation/devicetree/bindings/mmc/mellanox,bluefield-d=
w-mshc.yaml b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-m=
shc.yaml
> > new file mode 100644
> > index 0000000000000..32d50e45ddb86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-mshc.=
yaml
>=20
> [ ... ]
>=20
> > +examples:
> > +  - |
> > +    /* Mellanox BlueField SoC MMC */
> > +    mmc@2804000 {
> > +        compatible =3D "mellanox,bluefield-dw-mshc";
> > +        reg =3D <0x6008000 0x400>;
>=20
> [Severity: Low]
> Should the node unit-address match the first address in the reg property
> here?

Of course it should.
pw-bot: changes-requested

>=20
> The converted YAML example uses mmc@2804000 as the node name, but retains
> reg =3D <0x6008000 0x400>. This mismatch typically causes a unit_address_=
vs_reg
> warning during dt_binding_check validation.
>=20
> > +        interrupts =3D <32>;
> > +        fifo-depth =3D <0x100>;
> > +        clock-frequency =3D <24000000>;
> > +        bus-width =3D <8>;
> > +        cap-mmc-highspeed;
> > +    };
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260524094616.10666=
0-1-manishbaing2789@gmail.com?part=3D1

--CWN4pHQhd76h/Vhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahR7xQAKCRB4tDGHoIJi
0lsmAQDGcj3Q1+XAdIFwOTVlh4Pe301Y9pxqquqDqCAGVi3zCAD43ahUEcOZdLMc
+NKQ2WXYtcUTno7bdKEjZoB9tL9yAA==
=HIIh
-----END PGP SIGNATURE-----

--CWN4pHQhd76h/Vhu--
