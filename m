Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B123F3F9A0B
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964252; cv=none; b=bk6x4eP77NEIuVB/inlXA4OJVazPp16X1/qew1sNxl6/eun2iyAwsI7dRTJz3FsryPmRntmifYI2q3YyfWSH4t4BO9mHIO4k3uqNBCQ4uhYyCb9ULIn4yrSdFi9DDeVYJ+uQ2rQbkMO1FthX6tCnqJr8oiDBsh39xVAwiehY4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964252; c=relaxed/simple;
	bh=k6QMAmvR7oiiM2zpYRuiK1cON67SvRFPBz0Jrl6znQs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOgGcs4HSR0P53RWaJy9q0u/SJ7fM8/KZXpo/iKdXvcAM89V/M7/TsTq299C+GV80nbYn3sgmmfyr9I/uoQechY+sL7DEZpWqV9hur63iVdGHqHbWgBE253wuFdH9B0Ike5jlH6mETA3YaZ0PXL4NlzsfgNx5J7CHnblr4FpFQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=D5Ddwtsa; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D5Ddwtsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786964237; x=1787223437;
	bh=ALeWuSlo0QtSBVcZZxY3NYHTSQ2ZeD9XjNaYqM62K9w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D5DdwtsaNduiK9zcku0Z7GQNNTw13UBNT0TUeA9JLsZJuiPZ/6v53Ze3JacXWmMmI
	 X0cOQYgS9bMg+h27w76EKmVPSXXgvsk4t832OjPNl6LZE80KqKSkHeQceqgQnV8fJ7
	 WxgUWbeigg0VC4KpIP9DN9suYwUDmvQnQw4d4LUb4QKg0M9+gFMdpIECdxu5Ee80ft
	 FrdGs0ZoS+r+nUJOazcpBvFkea+WZBObZWe08aLDr40nsFbg14VwXdFNjtTZ1OGqPI
	 fu6vUNPuEV1MD//pIY50rhr6TO+6aIaU501WiVxFvliNswn/4qJpj5zdwBfVOtlDVm
	 jCw1fQ9D6lb/Q==
Date: Mon, 17 Aug 2026 10:57:12 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Add initial support for Exynos5515 SoC
Message-ID: <Pp0QN_mgHmmlv7ieIHJhdvcHN0pA5tq1GjWku09cL7Xe7RXbTGDL5JY__Zb1QqHhoPRVCfqq0Pmnc4WAySRVq6krCT3zviOpfWl5JZ7_UFQ=@protonmail.com>
In-Reply-To: <20260817103807.788801F000E9@smtp.kernel.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org> <20260817-for-next-lucky7-v1-1-42ffb2b71ba2@member.fsf.org> <20260817103807.788801F000E9@smtp.kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 7a60e15d1ba53d1acbfbccfb67fb5e481594137e
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
>
> --- Patch [1]: [PATCH 1/2] arm64: dts: exynos: Add initial support for Ex=
ynos5515 SoC ---
> commit e8b991884f3a3fd45bff9e8dcdd76dcc3db06db9
> Author: Aiden Isik <aidenisik@member.fsf.org>
>
> arm64: dts: exynos: Add initial support for Exynos5515 SoC
>
> The patch adds initial device tree support for the Exynos5515 SoC, used i=
n
> Samsung Galaxy Watch models. It adds CPUs, generic timer, watchdog, and
> various clock management units.
>
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
>
> [Severity: Low]
> Is this header file missing? It appears it was not added in this patch or
> earlier in the series, which will cause the device tree compilation to fa=
il.
>

This header is added in the series introducing clock driver support.

> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> [ ... ]
> > +=09=09cpu1: cpu@1 {
> > +=09=09=09compatible =3D "arm,cortex-a55";
> > +=09=09=09reg =3D <0x100>;
>
> [Severity: Low]
> Does the unit-address for cpu1 match the reg property? The device tree
> specification requires the unit-address to match the first address in the
> reg property, so should this be cpu@100?

I took this as a CPU index, but if any maintainers want it to be this way,
then I am happy to change it.

>
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
>
> [Severity: Low]
> Are these custom function IDs necessary? Since compatible =3D "arm,psci-1=
.0"
> is used, the kernel relies on standard architecturally mandated function
> IDs, and explicitly defining cpu_off, cpu_on, and cpu_suspend will be ign=
ored.

This is how it is done downstream and in other mainline Exynos SoCs from
memory. Again, if a maintainer wants it changed I am happy to.

>
> > +=09=09method =3D "smc";
> > +=09};
> [ ... ]
> > +=09=09gic: interrupt-controller@15600000 {
>
> [Severity: Low]
> Does the unit-address for the gic node match its reg property? The first
> address in the reg block is 0x15601000, so should the node be named
> interrupt-controller@15601000?

Possibly, I will look into this.

>
> [Severity: Medium]
> Is the interrupts property for the VGIC maintenance interrupt missing fro=
m
> the gic device node? Without it, KVM virtualization cannot properly handl=
e
> virtual interrupt maintenance.
>
> > +=09=09=09compatible =3D "arm,gic-400";
> > +=09=09=09reg =3D <0x15601000 0x1000>,
> > +=09=09=09      <0x15602000 0x1000>,
>

Unsure.

> [Severity: Medium]
> Is the GICC memory region incorrectly sized at 0x1000? KVM VGIC
> initialization requires access to the GICC_DIR register at offset 0x1000 =
in
> the GICC region for EOI mode 1, so should this size be at least 0x2000?
>
> > +=09=09=09      <0x15604000 0x2000>,
> > +=09=09=09      <0x15606000 0x2000>;
>

Unsure.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next=
-lucky7-v1-0-42ffb2b71ba2@member.fsf.org?part=3D1
>

Kind regards,
- Aiden Isik
