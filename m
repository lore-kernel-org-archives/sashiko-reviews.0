Received: from mail-106102.protonmail.ch (mail-106102.protonmail.ch [79.135.106.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2663E3C7B
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963969; cv=none; b=DIYo/qupnHCOFBvc/ghV9VWhoDrE5gwuSICA4gXoxEZjCIEeOIYq4pWdq0mgcOMEa79YHCkSLX3d+PrIiABhygZpvK6NeE3jJrL9Vl8GsEcBkMIlSEwvdckxWrss46Y36zSR8UPhI7D97wdm+hay74G9OArm1MDusCY3050FC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963969; c=relaxed/simple;
	bh=8HjhxxtaATLk41oB2j93G78X+KpMlJ7I0XQ00MsbsKI=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdagWeBIDhijL4cnCWI5btwzhS3gzriESOOWJaa0pbSInSWzExdHBgcDznKKkpuSONf3+0lvZY2LjV7L4FxrgLW9FTfToboOJ9827ZCBq9/NCsvT0nVN+d+6o+/yvt9FAilrL/0sxavbSi0YmspehiinkXyX2qZVXtx/Slk6xk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=UUt3USG+; arc=none smtp.client-ip=79.135.106.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="UUt3USG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786963954; x=1787223154;
	bh=6/FtdzVf5edo+7iSR01B4pSM15yJll5BO1nAuNeCSvA=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UUt3USG+s9ogjoGaWFMjwHjkBX5BZ/pJug3wVrNTAY6HEkGKTq/bXy/+fCuq7q/sj
	 oE1aDyf6dxLguPeDeL2hOvuW7Ha36awr2rd284CJNsfqQJOWqP7WO6f76eIXqQvsds
	 Ob2lNuD/05ZMEMLEXvoAH+AGix8JRDltwfOeKeqgDvEgP9z5KxQ/ZJ6D0RIRfJ6du6
	 XwilWy1Cog5nbJ6JwvZU/jXZTYxppW7oWNS6nHVvOef+6FtPLxD3N0a7xmWjUl+1hG
	 EafIfGuO7ZXoSsBLykdLsv0s8YfbP7ElEn6PQT6Cm+u0eVjkLyfK8fTtMnYV2/8eB5
	 FvmwOiGkfkZEQ==
Date: Mon, 17 Aug 2026 10:52:30 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Add initial support for Exynos5515 SoC
Message-ID: <Hxwvo94AP4fE32plJX7gMYzx9AVUT-OhBWD9dfrsZz3wKHuTLsJf6L_wv4bNSjFaMyINacSXuu7Nij-4zKchfPYEJQVgWSEsusULK1hzs_Y=@protonmail.com>
In-Reply-To: <20260817103807.788801F000E9@smtp.kernel.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org> <20260817-for-next-lucky7-v1-1-42ffb2b71ba2@member.fsf.org> <20260817103807.788801F000E9@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: af393ccdb991e447438535d2428afcb86b1ca0d0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [Medium] The GIC-400 node lacks the VGIC maintenance interrupt property=
.
> - [Medium] GIC CPU interface (GICC) memory region is incorrectly sized at=
 0x1000, which breaks VGIC support.
> - [Low] Node unit-addresses for `cpu1` and `gic` do not match their `reg`=
 properties.
> - [Low] Redundant and deprecated custom function IDs are provided for PSC=
I 1.0.
> - [Low] Missing dt-bindings clock header `samsung,exynos5515-cmu.h`.
> --
>=20
> --- Patch [1]: [PATCH 1/2] arm64: dts: exynos: Add initial support for Ex=
ynos5515 SoC ---
> commit e8b991884f3a3fd45bff9e8dcdd76dcc3db06db9
> Author: Aiden Isik <aidenisik@member.fsf.org>
>=20
> arm64: dts: exynos: Add initial support for Exynos5515 SoC
>=20
> The patch adds initial device tree support for the Exynos5515 SoC, used i=
n
> Samsung Galaxy Watch models. It adds CPUs, generic timer, watchdog, and
> various clock management units.
>=20
> > diff --git a/arch/arm64/boot/dts/exynos/exynos5515.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos5515.dtsi
> > new file mode 100644
> > index 0000000000000..5584c1a3aaf4f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynos5515.dtsi
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Samsung Exynos 5515 SoC device tree source
> > + *
> > + * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
> > + */
> > +
> > +#include <dt-bindings/clock/samsung,exynos5515-cmu.h>
>=20
> [Severity: Low]
> Is this header file missing? It appears it was not added in this patch or
> earlier in the series, which will cause the device tree compilation to fa=
il.
>=20

This header is added in the series introducing clock driver support.

> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> [ ... ]
> > +=09=09cpu1: cpu@1 {
> > +=09=09=09compatible =3D "arm,cortex-a55";
> > +=09=09=09reg =3D <0x100>;
>=20
> [Severity: Low]
> Does the unit-address for cpu1 match the reg property? The device tree
> specification requires the unit-address to match the first address in the
> reg property, so should this be cpu@100?

I took this as a CPU index, but if any maintainers want it to be this way,
then I am happy to change it.

>=20
> > +=09=09=09device_type =3D "cpu";
> > +=09=09=09enable-method =3D "psci";
> > +=09=09};
> > +=09};
> [ ... ]
> > +=09psci {
> > +=09=09compatible =3D "arm,psci-1.0";
> > +=09=09cpu_off =3D <0x84000002>;
> > +=09=09cpu_on =3D <0xc4000003>;
> > +=09=09cpu_suspend =3D <0xc4000001>;
>=20
> [Severity: Low]
> Are these custom function IDs necessary? Since compatible =3D "arm,psci-1=
.0"
> is used, the kernel relies on standard architecturally mandated function
> IDs, and explicitly defining cpu_off, cpu_on, and cpu_suspend will be ign=
ored.

This is how it is done downstream and in other mainline Exynos SoCs from
memory. Again, if a maintainer wants it changed I am happy to.

>=20
> > +=09=09method =3D "smc";
> > +=09};
> [ ... ]
> > +=09=09gic: interrupt-controller@15600000 {
>=20
> [Severity: Low]
> Does the unit-address for the gic node match its reg property? The first
> address in the reg block is 0x15601000, so should the node be named
> interrupt-controller@15601000?

Possibly, I will look into this.

>=20
> [Severity: Medium]
> Is the interrupts property for the VGIC maintenance interrupt missing fro=
m
> the gic device node? Without it, KVM virtualization cannot properly handl=
e
> virtual interrupt maintenance.
>=20
> > +=09=09=09compatible =3D "arm,gic-400";
> > +=09=09=09reg =3D <0x15601000 0x1000>,
> > +=09=09=09      <0x15602000 0x1000>,
>=20

Unsure.

> [Severity: Medium]
> Is the GICC memory region incorrectly sized at 0x1000? KVM VGIC
> initialization requires access to the GICC_DIR register at offset 0x1000 =
in
> the GICC region for EOI mode 1, so should this size be at least 0x2000?
>=20
> > +=09=09=09      <0x15604000 0x2000>,
> > +=09=09=09      <0x15606000 0x2000>;
>=20

Unsure.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next=
-lucky7-v1-0-42ffb2b71ba2@member.fsf.org?part=3D1
>=20

Kind regards,
- Aiden Isik
