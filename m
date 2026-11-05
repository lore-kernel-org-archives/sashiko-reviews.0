Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891066;
	b=IzMO9pReSgXdNUOWXJl7UGLiOSdUpyfqidD1vHc55X6tqz9iV1hYVsgOI0aM1cqdIZ/p
	 jbMnNLgc/70d6Ucqi8PYRjkGpbFtvF2ONjRyS6HW5w5LrCcXIhPAHEra2E0eKbMLWUcUd
	 p/QfqCsWHFzPEcJueR64SHR32Cpy2zNTFUkyr0MVozjeOgPwc5z6dj/AX/KKXf3x2XpLZ
	 Xsq45S84nSsjyiKDnx7t13acIme7vJKbo+W48bRTr4fdiwUgi9sWoWXwYz7QOOMLHkjKR
	 2IqQezR2Xx/RRqlrQ2LdE62SRv8gVUGQZuXYyvueEz5VupAEvENyBzXj047aa4G1AwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891066;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6JpxKF69zra3KLEFXI7WNQ/Oicqi4O8hGXipJr7KSLw=;
	b=qCPB54dI4YoeH0FEZpKIopzz9J5ip2aThdQ2LzI3QIcC224p+4Qi4Rh4EdjNyAjnr8mZ
	 NZy9BKukFJENSIiFS6aJEAX0co9XzWfKsHZ8dJeXGiTHyXmz1/rjclFn0GMr25DP57nOI
	 7yP0Vg5uyYrzocdK8/sMPLFRzvgbHHnUOzptKE4Bfssmbbv1uV4B2aHQNocCaS37E7up5
	 rO6kmJfTbEr3nHqjGXmw9893lXW60aL72ShHXSF0WedW9LWxA6SkpXJlStU4UK7UEx/Gm
	 3pLrb+fuxCNtAZMDSOdxPEdrN8JE70oyelXIueakq1vyrE36mT6UL29FcB2955b8bsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMVUSQ5I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E0606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMVUSQ5I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF0F1F000C1
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891065;
	bh=6JpxKF69zra3KLEFXI7WNQ/Oicqi4O8hGXipJr7KSLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RMVUSQ5IfrgcGJMldSq/TbxxdAUx3pkhJFBKkO7IfBnRL/J42kuDv4suUTCHOyltF
	 aKPTg16cRtGFo7oNLoyxkSPZQATKQtxbmL6ToKXfJPSRfHoY56rCaxm8/17uLwpXEY
	 i9MkW3XKnCYz45oE+Dd7fsU+miRrEoB9jUqBfPxBKgqJPv2/Eqxd1zSneu5ijTRk4o
	 7E2UZaVD3QLtJ9J9ix31q1pp628Fi3f0cG2IKKhEPhiUENwbtpK3pdmJ6NZp4TRMFk
	 a4ekxirHrBdftTwfqSGW0QiDXsrTUUNn7pc5/Ym12Qtgcx99fe0t2jtmFUvmM2ORPj
	 QkYdUxiTrigCQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so848101a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 07:04:25 -0800 (PST)
X-Gm-Message-State: APuU4Z+zo30GNyOsJvrecJFGSmnXdC7bTyxVm/bQMjqkUeRnr4M5BkG6
	CXUTI0mtNmw5/VmuvjlpSP1kDr1N8fpU8qT+7RnDZGcuqVNtdPTenWb7SBzJFj7EfHiHZANsK7u
	XWGfvsq058pwWC9m7pDUKcoKwMbgKDQ==
X-Received: by 2002:a05:6402:a512:20b0:6ac:b0fb:57b5 with SMTP id
 4fb4d7f45d1cf-6b4d4c74d91mr10007519a12.26.1793891064026; Thu, 05 Nov 2026
 07:04:24 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105144920.2796623-2-robh@kernel.org> <sashiko-outbox-199279@kernel.org>
In-Reply-To: <sashiko-outbox-199279@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2026 09:04:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+U2RUjj1SQ8F5=3R30GBqXDzgBSFgqLbO1KRei=Xiv0w@mail.gmail.com>
X-Gm-Features: AclHuK-unT37pbZokmeKAjXq4HeyOtONEklLF2wD-ifUxqMj98lciCWNNlqIGF4
Message-ID: <CAL_Jsq+U2RUjj1SQ8F5=3R30GBqXDzgBSFgqLbO1KRei=Xiv0w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, 
	Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ARM: dts: imx6: Deleting Dwarf and Nymph .dtsi omitted by copy=
-paste in .dts
> --
>
> commit 22f4920daa7995325841819b6b25c37d2efd2b30
> Author: Rob Herring (Arm) <robh@kernel.org>
>
> ARM: dts: nxp/imx6: Drop unused .dtsi
>
> This commit removes four i.MX6 device tree include files that are not
> currently included by any in-tree device tree sources.
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> > deleted file mode 100644
> > index 3a968782e854b..0000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> > +++ /dev/null
> > @@ -1,45 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> > -//
> > -// Copyright 2017 NXP
> > -
> > -#include "imx6qdl-pico.dtsi"
>
> [ ... ]
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> > deleted file mode 100644
> > index 3d56a42164482..0000000000000
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> > -
> > -#include "imx6qdl-pico.dtsi"
>
> [Severity: Medium]
> Should imx6qdl-pico-dwarf.dtsi and imx6qdl-pico-nymph.dtsi be wired up to
> their existing board device trees instead of being deleted?
>
> Unlike the Kontron files, the corresponding board files for Dwarf and Nym=
ph
> already exist in the tree and are built by arch/arm/boot/dts/nxp/imx/Make=
file
> (imx6dl-pico-dwarf.dts, imx6q-pico-dwarf.dts, imx6dl-pico-nymph.dts, and
> imx6q-pico-nymph.dts).
>
> When commit 98670a0bb0ef ("ARM: dts: imx6qdl: Add imx6qdl-pico support")
> added support for the Dwarf, Hobbit, Nymph, and Pi baseboards, a copy-pas=
te
> error left the Dwarf and Nymph .dts files including imx6qdl-pico-pi.dtsi:
>
> arch/arm/boot/dts/nxp/imx/imx6dl-pico-dwarf.dts:
>     #include "imx6dl.dtsi"
>     #include "imx6qdl-pico-pi.dtsi"
>
>     / {
>             model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Dwarf=
 baseboard";
>             compatible =3D "technexion,imx6dl-pico-dwarf", "fsl,imx6dl";
>     };
>
> arch/arm/boot/dts/nxp/imx/imx6dl-pico-nymph.dts:
>     #include "imx6dl.dtsi"
>     #include "imx6qdl-pico-pi.dtsi"
>
>     / {
>             model =3D "TechNexion PICO-IMX6 DualLite/Solo Board and Nymph=
 baseboard";
>             compatible =3D "technexion,imx6dl-pico-nymph", "fsl,imx6dl";
>     };
>
> (and similarly in imx6q-pico-dwarf.dts and imx6q-pico-nymph.dts).
>
> As a result, the Dwarf and Nymph board DTBs are currently built with the =
Pi
> baseboard description (which disables HDMI and routes the LED to GPIO5_IO=
18)
> rather than their own baseboard descriptions in imx6qdl-pico-dwarf.dtsi
> (GPIO5_IO31 LED, mpl3115@60 on i2c1, and pca9554 io-expander@25 on i2c2) =
and
> imx6qdl-pico-nymph.dtsi (GPIO5_IO31 LED, adc@52 on i2c1, pca9554
> io-expander@25 on i2c2, ds1337 rtc@68 on i2c3, and PCIe enabled).
>
> Would it make sense to keep imx6qdl-pico-dwarf.dtsi and
> imx6qdl-pico-nymph.dtsi and update the four Dwarf and Nymph .dts files to
> include them?

Seems like the correct analysis. If someone cares about those
platforms, then they can send a fix. If not, we should delete them
too.

Rob
