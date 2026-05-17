Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA13D199920;
	Sun, 17 May 2026 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779050774; cv=none; b=TiP91pXyhiPWFJx9eempJ7QSPZnLStA7qKvYECgThQF+HYyZBZuv1+kGHRC08kJ/eDHDHD4c6rWIrsHKj0qVYIgx8XQ3zndbJKtcaevbF2mSbhRnL7mv8JgitTzUWR2CIWPWxsxe3FXkao7XZJIm3/L8J3xfAsIN/zqzNJQ6Mrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779050774; c=relaxed/simple;
	bh=B9rfiTJRjyjXAJSEgvhZLZHwcNBRgl8iA7YymCZHq34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwaXC19kiGe25z0VkRgLBQdGSGXY6FJuadf8WnmuLvXnXduJpvXGFA9iSO2fANwd/ndCMB/9d87ie4Omt2qleAIBTU6tzJCgDdEBSSzukWW8OVkFUC7vxn34GXyZquyLacpRgBWL7jzXnq/JgkThSJ5mCAoMm+/cBviBTYVaXOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQiuEFrA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQiuEFrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD63C2BCB0;
	Sun, 17 May 2026 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779050774;
	bh=B9rfiTJRjyjXAJSEgvhZLZHwcNBRgl8iA7YymCZHq34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQiuEFrAzqI0m/Q6iomWRf3UJ7D1NfdkLWFmTel3bBKAVcedvwiVwtiN/A3On+QCq
	 wGiqNuD8yPrx4A1rUG/ft7NRn6lZ/CY2T8ro88k2oROewATRDUYUh2oORcuTALp/tf
	 yL+98lT4Q2GjoJPD6KCzI8tUqnD3hJlpvFSPs0tiwCpVo2iuuqKFUlaq+8cJN29Rhi
	 C+CreBY/KrhUBtvBDUyIBDVZKLG0duV7H/0im/QiIbt3t4aZ1wXDUfbWGG3Xa2KWIt
	 9UVo+NPbrgluY9fd1mUS7fExoxDy5jN/IE91CFjozr2v0q760iIMxUDp01jL2fiVbc
	 xrDasXVRc5Uvw==
Date: Sun, 17 May 2026 21:46:10 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Chuanhong Guo <gch981213@gmail.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: add Siflower RISC-V SoC family Kconfig support
Message-ID: <20260517-aground-shadow-d4ac455623fe@spud>
References: <20260517-sf21-topcrm-v1-1-438f2e0513ff@gmail.com>
 <20260517143152.C3318C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bSL9o6xos8LVkq/6"
Content-Disposition: inline
In-Reply-To: <20260517143152.C3318C2BCB0@smtp.kernel.org>


--bSL9o6xos8LVkq/6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 02:31:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Conditionally selecting the `ARM_AMBA` hardware bus based on t=
he `TTY` software subsystem.
> --
>=20
> commit 49824e33ae15603df7f899c7df0a4ab9b5f20eed
> Author: Chuanhong Guo <gch981213@gmail.com>
>=20
> riscv: add Siflower RISC-V SoC family Kconfig support
>=20
> This adds Kconfig support for the Siflower RISC-V SoCs, including the
> SF21A6826 and SF21H8898 chips. It defines ARCH_SIFLOWER, selects the
> relevant T-Head errata, and conditionally selects ARM_AMBA for the UART.
>=20
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index c174ac0ec46b4..9996591cd9dbf 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> [ ... ]
> > @@ -37,6 +37,13 @@ config ARCH_SIFIVE
> >  	help
> >  	  This enables support for SiFive SoC platform hardware.
> > =20
> > +config ARCH_SIFLOWER
> > +	bool "Siflower RISC-V SoCs"
> > +	select ARM_AMBA if TTY
>=20
> Should ARM_AMBA be selected conditionally based on TTY?
>=20
> ARM_AMBA models the presence of a physical hardware bus, which exists
> regardless of whether the TTY software subsystem is enabled. Even if the

There's no point having the driver built if there's no driver built for
devices on the bus, I think is the angle here.

> PL011 UART is currently the only AMBA device on this platform, tying the
> hardware bus infrastructure to a software abstraction might cause issues =
if
> other AMBA devices are added later and TTY is disabled.
>=20
> Would it be better to select ARM_AMBA unconditionally, similar to how oth=
er
> architectures handle it?
>=20
> > +	select ERRATA_THEAD
> > +	help
> > +	  This enables support for Siflower RISC-V SoC platform hardware.
>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260517-sf21-topcrm=
-v1-0-438f2e0513ff@gmail.com?part=3D1

--bSL9o6xos8LVkq/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagopEgAKCRB4tDGHoIJi
0k+xAP9fybmFULqTMp78JR3HvZz13xvD1grBcGF3UZ5crBVmKQD+LWKVv/Z7b7LW
EpcZjGfuRvzUq1Agf1+/ePr7u9e2hQg=
=xE5w
-----END PGP SIGNATURE-----

--bSL9o6xos8LVkq/6--
