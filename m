Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39924CA6B
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781136878; cv=none; b=DuIcXpCVjCNJB/IPeKhf3ISx1NVExYOOJPXQAZKpTCwe+oXekROjh3ZeVGYcHWI2LyHjnv/HGbPcrCaflzFNeSJDUvoXIVD33fVavMzI2YN/rk25c9nNBDp8ikhY57rP0aCO1BJJ71QX2L3rm/l4fJvFSFZcUNPkX+ykF6VcNtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781136878; c=relaxed/simple;
	bh=d51th9MuthaOOayBAbL9CMzbyqvJX+tXPX48uwtqEKU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NXFOikYkk3gfkgfCOOOBkoB4GDcrSYIn1zKHJUccoa+ITyf5y6j+R0o0JD22rxpmMqlKVB7V5x2xE81tXdgnXcohgoG+Dcof5V1yaMAxvQM0Sx8RxIfHVCXLb/jHOO9AdvB2h511J86bEAOet6PyQ4n3eklDUoaGHhBZsd8GVmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=VvmBnNRF; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="VvmBnNRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781136872;
	bh=UwL81a4jD1lVgNPbYQb6XSbzauf8TNMOvs4noHtAzVI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VvmBnNRF9gtCAAthcA6MT4X1dKaRsTz5qzc4Ia6/H+jWK/42PBrGgAFDkrfUXo0kc
	 cnGW3C0GfRV3KTIf00Kq43jo7ZGZB/lsvRucJ5XMLWdaELX/1T37qU8bQKZ2FNL3dN
	 yViTgSE+B6y1O3eFe0zVm7bJ4bMgl0FcyBhJtjvIbqNvCY++JawLcsK0ZIPeyu7tf3
	 37ZpDCbyfJeGQGVjutXUoiZ3Os7ss+BB4DrBIF0X3iz0KiRo3kuFXUFKtkn9QVEMyy
	 CnWfgo9ikEQSyy88PT8EZ7WycUmQnOFSgkJVqCNfYDLm8pFJOjE8oU1Kvhux5CmsgE
	 XEdF7/6G7+lGg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 13A8D60975;
	Thu, 11 Jun 2026 08:14:32 +0800 (AWST)
Message-ID: <45e1df1ad72eb982ddb13500b9224bf54b6f3fa2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 3/4] arm64: dts: aspeed: Add initial AST27xx SoC
 device tree
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "sashiko-reviews@lists.linux.dev"
	 <sashiko-reviews@lists.linux.dev>
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"	
 <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Date: Thu, 11 Jun 2026 09:44:31 +0930
In-Reply-To: <TY2PPF5CB9A1BE674CFFD62F27DFDFE0B2AF21D2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260609-upstream_ast2700-v9-3-f631752f0cb1@aspeedtech.com>
	 <20260609025708.ADBFE1F00893@smtp.kernel.org>
	 <TY2PPF5CB9A1BE674CFFD62F27DFDFE0B2AF21D2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Ryan,

On Tue, 2026-06-09 at 05:36 +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH v9 3/4] arm64: dts: aspeed: Add initial AST27xx SoC=
 device
> > tree
> >=20
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to
> > consider:
> > - [High] INTC1 maps its summary interrupts to INTC0's TSP routing range=
,
> > preventing SOC1 interrupts from reaching the Cortex-A35 GIC.
> > - [Low] The device tree defines ad-hoc top-level nodes ('secondary', 't=
ertiary',
> > 'bootmcu') that violate standard naming schemas, and embeds direct Linu=
x
> > kernel source URLs to justify '#size-cells' behavior.
> > - [Low] Duplicate label definitions in the pinctrl device tree include =
for multiple
> > pinctrl groups in SOC1 will cause a hard DTC build failure.
> > --
> >=20
> > commit 92031db9a3c255cefbfcc33df4ca0cb9780dd226
> > Author: Ryan Chen <ryan_chen@aspeedtech.com>
> >=20
> > arm64: dts: aspeed: Add initial AST27xx SoC device tree
> >=20
> > Add initial device tree support for the ASPEED AST27xx family, the
> > 8th-generation Baseboard Management Controller (BMC) SoCs.
> >=20
> > > diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
> > > b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
> > > new file mode 100644
> > > index 0000000000000..ef283d95649a3
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
> > [ ... ]
> > > @@ -82,10 +82,10 @@ l2: l2-cache0 {
> > > =C2=A0	};
> > >=20
> > > =C2=A0	secondary {
> > > =C2=A0		#address-cells =3D <2>;
> > > =C2=A0		/*
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/
> > of/address.c?h=3Dv6.16#n491 */
> > > =C2=A0		#size-cells =3D <0>;
> > > =C2=A0		/*
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
e
> > > e/drivers/of/address.c?h=3Dv6.16#n430 */
> > >=20
> >=20
> > [Severity: Low]
> > Are these OS-specific comments and ad-hoc root nodes ('secondary', 'ter=
tiary',
> > 'bootmcu') appropriate here?
> >=20
> > Device trees typically provide an OS-agnostic hardware description usin=
g
> > generic nodes (like 'bus', 'soc', or 'remoteproc'). Embedding Linux ker=
nel
> > source URLs suggests the hardware is being modeled around a specific Li=
nux
> > parser implementation rather than providing an independent hardware
> > description.
>=20
> The concern is valid and acknowledged. The sub-processor interrupt
> controllers (ssp_nvic for SSP/Cortex-M4, tsp_nvic for TSP/Cortex-M4,
> bootmcu_hlic for BootMCU/RISC-V) cannot be placed under the soc1 bus
> because their registers reside in each sub-processor's private address
> space and are not accessible from the Cortex-A35 cores.
>=20
> The 2-cell address scheme (#address-cells =3D <2>, #size-cells =3D <0>)
> encodes a <cpu-index reg-base> tuple as suggested by Matt Johnston [1].

That was me, not Matt.

Further, that two cell scheme was part of a tentative sketch for
discussion from quite some time ago and wasn't intended to be
copy/pasted without further thought. We should remove the index now.

> The Linux kernel source URLs in the comments are admittedly
> Linux-specific and will be removed in v11; the cover letter explains
> the rationale instead.
>=20
> All sub-processor nodes carry status =3D "disabled". They are present
> solely to provide phandle references for the aspeed,interrupt-ranges
> properties in intc0 and intc1, which the interrupt controller drivers
> use to build the interrupt domain hierarchy at boot time.
>=20
> [1] https://lore.kernel.org/all/1a2ca78746e00c2ec4bfc2953a897c48376ed36f.=
camel@codeconstruct.com.au/
>=20
> >=20
> > > =C2=A0		ssp_nvic: interrupt-controller@1,e000e100 {
> > [ ... ]
> > > diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
> > > b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
> > > new file mode 100644
> > > index 0000000000000..72d93323593d5
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
> > [ ... ]
> > > @@ -475,10 +475,10 @@ pinctrl_hvi3c15_default: hvi3c15-default-state =
{
> > > =C2=A0		function =3D "I3C15";
> > > =C2=A0		groups =3D "HVI3C15";
> > > =C2=A0	};
> > >=20
> > > =C2=A0	pinctrl_tach0_default: tach0-default-state {
> > > =C2=A0		function =3D "TACH0";
> > > =C2=A0		groups =3D "TACH0";
> > > =C2=A0	};
> > >=20
> >=20
> > [Severity: Low]
> > Is this label duplicated? There is another pinctrl_tach0_default defini=
tion
> > earlier in this file.
> >=20
> > Defining the same pinctrl label multiple times (such as pinctrl_tach0_d=
efault
> > through pinctrl_tach15_default, and pinctrl_ncts5_default) in the same =
device
> > tree will cause a fatal syntax error in the Device Tree Compiler.
>=20
> Will fixed in v11. The labels pinctrl_tach0_default through
> pinctrl_tach15_default were duplicated in aspeed-g7-soc1-pinctrl.dtsi
> due to a copy-paste error. The second block has been removed.

Please send me fixes for these, and avoid sending patches under review
to soc@ in the future:

> Note that the soc@kernel.org is usually not the place to discuss the
> patches, thus work sent to this address should be already considered
> as acceptable by the community.

https://docs.kernel.org/process/maintainer-soc.html#submitting-patches-to-t=
he-main-soc-maintainers

Andrew
