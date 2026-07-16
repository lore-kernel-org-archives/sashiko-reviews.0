Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684694314B5
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223914; cv=none; b=WVCby0rZ6bmJ4dmcU/pqPUMMQvNBomgXXj89rlSViIeUENI7kw1NKbV42/x8PG8rac1VKlbumd98ct8lvK4VB1qFYaIHXVbg4t7q9ShXk+5uffIb+XVZ6WAmV7V2rmWbKiuBFfC3JQ1aZZepa9LrUULXUrOAEWKbVrF4xJiw4DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223914; c=relaxed/simple;
	bh=1dfy9RE5U2IVlA8P28xUhfZh2yZquVsLMiHJH1bz/D0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQbHERZWIiYfMqF9s5Xp2oL214YQa2GRWaewQDegyPzTpsEvyB7ifg+NjrmJLdUxPEENQgehxVylJYA/cpRWwkvvP9gWNamMmoEdjkV/f0FsO48FciuKGYOIjSMZyht72Ml90f9AUGjSU1KCNL15erlgOpXakJdEijFvXW6zp7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=copzqbm9; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="copzqbm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784223900; x=1784483100;
	bh=uV+h8kswGmI1NApft8QVwhf9JSqdwsitsi4i9XWwa+g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=copzqbm9HhgCn9qJmTLwYmEO4fAFxer3aZkF1hO/U4vBynEWMG6ZXF9k1d7dByqv9
	 tgFX+FVLQvoYng3jotRKVzlLR1iXvhOarmeC4oRf8GC73hzEiH13hTtLaRMIGEzqqI
	 94ZSc46rqM+s3ewt4bt7U1FJ67eBWBo/vqiDy2YM7vQNkdEXVqccA8lOOKMGyB6RyR
	 4BYWYWT1Khtxi6Uhq0MPlmrOFz+5277t6PU5xTgsxFigL0OwYzV0LQ1Q8t4c+zhz3z
	 gF5jjN/riYQrJ/pK5PRTHeLEYDGh20MqoM0PsDoEAtngCpQVqAq056ctyuPKMx9APw
	 oGOODHxvExxiA==
Date: Thu, 16 Jul 2026 17:44:55 +0000
To: sashiko-reviews@lists.linux.dev
From: Alexandru Chimac <alex@chimac.ro>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: samsung: Introduce Exynos9610 clock controller driver
Message-ID: <al6J-v3k-MVc0gtv_aKi7PpUIyg46m1Klg8-izKAn116l5fMLI3IKLwcRP3j0xsrEzDOtbtrJf4Mfgzs2Whw44pbLICNsoAMIKYH9gg2oZs=@chimac.ro>
In-Reply-To: <20260716172637.445E41F000E9@smtp.kernel.org>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro> <20260716-exynos9610-clocks-v2-4-c13ce8ef1861@chimac.ro> <20260716172637.445E41F000E9@smtp.kernel.org>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 7062e42b9ab2804d81f786388b9ed7ac279446a3
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello!

On Thursday, 16 July 2026 at 8:26 PM, sashiko-bot@kernel.org <sashiko-bot@k=
ernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 10 potential iss=
ue(s) to consider:
> - [High] Clock ID collision for `dout_cmu_usb_usb30drd` due to reused `CL=
K_DOUT_CMU_USB_BUS` ID.
> - [High] The `dout_cmu_core_cci` divider incorrectly targets the `CORE_BU=
S` hardware register.
> - [High] All PCLK clock gates for CMGP I2C and USI mistakenly map to IPCL=
K register offsets.
> - [High] OCC clocks in the core domain suffer from register, naming, and =
parent copy-paste errors.
> - [High] Several configured clock registers are omitted from the `clk_reg=
s` save/restore arrays.
> - [High] The `dispaud_cmu_info` structure is bound to the wrong sysreg sa=
ve/restore array.
> - [High] Six clock gates will be orphaned due to nonexistent parent clock=
 references (typographical errors).
> - [High] The `CLK_DOUT_CLK_CPUCL0_CPU` divider is instantiated with a bit=
 width of 0.
> - [High] Mux width is too narrow for `mout_cmu_cpucl0_switch`.
> - [High] The probe function is marked `__init` but registered as a persis=
tent platform driver, creating an execute-after-free risk.
> --
>=20
> --- Patch [4]: [PATCH v2 4/5] clk: samsung: Introduce Exynos9610 clock co=
ntroller driver ---
> commit 5ae09894e4056fd99b1810f99f65fba5b78df46a
> Author: Alexandru Chimac <alex@chimac.ro>
>=20
> clk: samsung: Introduce Exynos9610 clock controller driver
>=20
> This commit introduces the Common Clock Framework driver for the Exynos 9=
610
> SoC. It provides support for numerous clock domains, including TOP, APM,
> CAM, CMGP, CORE, CPUCL0, DISPAUD, FSYS, G2D, G3D, PERI, and USB.
>=20
> > diff --git a/drivers/clk/samsung/clk-exynos9610.c b/drivers/clk/samsung=
/clk-exynos9610.c
> > index 0000000000000..39c1650247e8d
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos9610.c
> [ ... ]
> > static const unsigned long top_clk_regs[] __initconst =3D {
> > =09PLL_LOCKTIME_PLL_MMC,
> > =09PLL_LOCKTIME_PLL_SHARED0,
> [ ... ]
> > =09CLK_CON_DIV_CLKCMU_CAM_BUS,
> > =09CLK_CON_DIV_CLKCMU_CORE_BUS,
> [ ... ]
>=20
> [Severity: High]
> Are some registers missing from the save and restore array?
>=20
> The CLK_CON_DIV_PLL_MMC_DIV2 and the four CIS dividers
> (CLK_CON_DIV_CLKCMU_CIS_CLK0 through CLK3) appear to be omitted from
> top_clk_regs. Could this cause these dividers to revert to power-on defau=
lts
> after a suspend and resume cycle?
>=20

Good catch, will fix in v3.
> [ ... ]
> > static const struct samsung_mux_clock top_mux_clks[] __initconst =3D {
> [ ... ]
> > =09MUX(CLK_MOUT_CMU_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0_=
dbg_p,
> > =09    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG, 0, 1),
> > =09MUX(CLK_MOUT_CMU_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_c=
pucl0_switch_p,
> > =09    CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 1),
>=20
> [Severity: High]
> Does this mux have a bit width that is too narrow?
>=20
> The mout_cmu_cpucl0_switch_p parent array has 4 elements, but the width
> parameter is set to 1 bit. A 1-bit width can only represent indices 0 and=
 1,
> preventing the selection of parents at indices 2 and 3 when the CPU frequ=
ency
> scaling attempts to reparent the clock.
>=20

Ditto

> [ ... ]
> > static const struct samsung_div_clock top_div_clks[] __initconst =3D {
> [ ... ]
> > =09DIV(CLK_DOUT_CMU_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus",
> > =09    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> > =09DIV(CLK_DOUT_CMU_CORE_CCI, "dout_cmu_core_cci", "gout_cmu_core_cci",
> > =09    CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
>=20
> [Severity: High]
> Is the wrong hardware register targeted by this divider?
>=20
> The dout_cmu_core_cci divider targets CLK_CON_DIV_CLKCMU_CORE_BUS instead=
 of
> CLK_CON_DIV_CLKCMU_CORE_CCI. Could this cause writes to the CCI divider t=
o
> inadvertently modify the CORE_BUS divider, potentially hanging the core b=
us?
>=20

Ditto

> [ ... ]
> > =09DIV(CLK_DOUT_CMU_USB_BUS, "dout_cmu_usb_bus", "gout_cmu_usb_bus",
> > =09    CLK_CON_DIV_CLKCMU_USB_BUS, 0, 4),
> > =09DIV(CLK_DOUT_CMU_USB_DPGTC, "dout_cmu_usb_dpgtc", "gout_cmu_usb_dpgt=
c",
> > =09    CLK_CON_DIV_CLKCMU_USB_DPGTC, 0, 4),
> > =09DIV(CLK_DOUT_CMU_USB_BUS, "dout_cmu_usb_usb30drd", "gout_cmu_usb_usb=
30drd",
> > =09    CLK_CON_DIV_CLKCMU_USB_USB30DRD, 0, 4),
>=20
> [Severity: High]
> Is there an ID collision in this divider array?
>=20
> The CLK_DOUT_CMU_USB_BUS identifier is reused for dout_cmu_usb_usb30drd.
> This duplicate definition overrides the earlier USB bus divider registrat=
ion.
>=20

Ditto

> [ ... ]
> > static const struct samsung_gate_clock top_gate_clks[] __initconst =3D =
{
> > =09GATE(CLK_GOUT_CMU_MIF_SWITCH, "gout_cmu_mif_switch",
> > =09     "mux_cmu_mif_switch", CLK_CON_GAT_CLKCMU_MIF_SWITCH,
> > =09     21, 0, 0),
>=20
> [Severity: High]
> Is there a typographical error in the parent clock name?
>=20
> This gate requests mux_cmu_mif_switch as its parent instead of the
> registered mout_cmu_mif_switch. Could this orphan the clock gate and
> prevent proper clock management for the MIF switch?
>=20

Ditto

> [ ... ]
> > static const struct samsung_div_clock cpucl0_div_clks[] __initconst =3D=
 {
> [ ... ]
> > =09DIV(CLK_DOUT_CLK_CPUCL0_CPU, "dout_clk_cpucl0_cpu", "mout_clk_cpucl0=
_pll",
> > =09    CLK_CON_DIV_DIV_CLK_CPUCL0_CPU, 0, 0),
>=20
> [Severity: High]
> Could the bit width of 0 for this divider break CPU frequency scaling?
>=20
> A 0-bit width results in a zero bitmask for the clock divider, causing
> configuration operations to become no-ops. Will this prevent dynamic
> frequency scaling for the CPU cluster?
>=20

Need to take a look into this, if this is an issue I will fix it in v3.

> [ ... ]
> > static const struct samsung_gate_clock cmgp_gate_clks[] __initconst =3D=
 {
> [ ... ]
> > =09GATE(CLK_GOUT_CMGP_I2C_CMGP00_IPCLK, "gout_clk_cmgp_i2c_cmgp00_ipclk=
",
> > =09     "mout_clk_cmgp_i2c", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
> > =09     21, 0, 0),
> > =09GATE(CLK_GOUT_CMGP_I2C_CMGP00_PCLK, "gout_clk_cmgp_i2c_cmgp00_pclk",
> > =09     "gout_cmu_cmgp_bus", CLK_CON_GAT_GOUT_CMGP_I2C_CMGP00_IPCLK,
> > =09     21, 0, 0),
>=20
> [Severity: High]
> Do these PCLK gates accidentally map to the IPCLK register offsets?
>=20
> This pattern repeats across the CMGP I2C and USI PCLK definitions, where =
the
> IPCLK register offsets are used for the PCLK gate clocks. Could toggling
> the PCLK gates overwrite the IPCLK state while leaving the actual PCLK
> unconfigured, leading to unclocked peripheral access hangs?
>=20

Will fix in v3.

> [ ... ]
> > static const struct samsung_gate_clock core_gate_clks[] __initconst =3D=
 {
> [ ... ]
> > =09GATE(CLK_GOUT_CORE_CCI_CLK, "gout_core_cci_clk", "mout_pll_core_cci_=
user",
> > =09     CLK_CON_GAT_GOUT_CORE_CCI_CLK, 21, 0, 0),
> > =09GATE(CLK_GOUT_CORE_CCI_OCC_CLK, "gout_core_cci_occ_clk",
> > =09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_CCI_CLK,
> > =09     21, 0, 0),
> > =09GATE(CLK_GOUT_CORE_G3D_CLK, "gout_core_g3d_clk", "mout_pll_core_g3d_=
user",
> > =09     CLK_CON_GAT_GOUT_CORE_G3D_CLK, 21, 0, 0),
> > =09GATE(CLK_GOUT_CORE_G3D_OCC_CLK, "gout_core_cci_g3d_occ_clk",
> > =09     "mout_pll_core_cci_user", CLK_CON_GAT_GOUT_CORE_G3D_OCC_CLK,
>=20
> [Severity: High]
> Are there copy-paste errors in the CCI and G3D OCC clock definitions?
>=20

> CLK_GOUT_CORE_CCI_OCC_CLK targets the CLK_CON_GAT_GOUT_CORE_CCI_CLK regis=
ter,
> meaning both clocks will manipulate the exact same hardware bit. Also,
> CLK_GOUT_CORE_G3D_OCC_CLK uses the mout_pll_core_cci_user parent instead =
of
> the intended G3D parent. Could this break on-chip controller operations a=
nd
> clock gating for the Core and GPU domains?
>=20
Will fix in v3.

> [ ... ]
> > static const struct samsung_gate_clock dispaud_gate_clks[] __initconst =
=3D {
> [ ... ]
> > =09GATE(CLK_GOUT_DISPAUD_BTM_DPU_ACLK, "gout_dispaud_btm_dpu_aclk",
> > =09     "mout_cmu_dispaud_disp_user", CLK_CON_GAT_GOUT_DISPAUD_BTM_DPU_=
ACLK,
> > =09     21, 0, 0),
>=20
> [Severity: High]
> Does this clock gate request an incorrect parent?
>=20
> It requests mout_cmu_dispaud_disp_user instead of the registered
> mout_pll_dispaud_disp_user. This error appears on multiple gates in this
> block. Will this prevent proper clock tree registration for the DPU?
>=20

Ditto

> [ ... ]
> > static const struct samsung_cmu_info dispaud_cmu_info __initconst =3D {
> [ ... ]
> > =09.sysreg_clk_regs=09=3D drcg_cam_memclk_sysreg,
> > =09.nr_sysreg_clk_regs=09=3D ARRAY_SIZE(drcg_cam_memclk_sysreg),
>=20
> [Severity: High]
> Is the wrong sysreg save and restore array bound here?
>=20
> The sysreg_clk_regs field points to drcg_cam_memclk_sysreg (which uses
> offset 0x1000) instead of drcg_memclk_sysreg. During suspend and resume, =
could
> the DISPAUD domain perform reads and writes to address offset 0x1000 inst=
ead of
> its proper DRCG offset (0x104) and fail to restore the correct setting?
>=20

This is intended behaviour, CAM and DISPAUD share the same DRCG_EN offset, =
different than on the other CMUs.

> [ ... ]
> > static const unsigned long fsys_clk_regs[] __initconst =3D {
> > =09PLL_CON0_MUX_CLKCMU_FSYS_BUS_USER,
> [ ... ]
> > =09CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_ACLK,
> > =09CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_FMP_CLK,
> > =09CLK_CON_GAT_GOUT_FSYS_XIU_D_ACLK,
> > };
>=20
> [Severity: High]
> Is a UFS register missing from this array?
>=20
> The CLK_CON_GAT_GOUT_FSYS_UFS_EMBD_CLK_UNIPRO register appears to be omit=
ted
> from fsys_clk_regs. Could this cause the register to revert to power-on
> defaults after a suspend and resume cycle?
>=20

Will fix in v3.

> [ ... ]
> > static int __init exynos9610_cmu_probe(struct platform_device *pdev)
> > {
> [ ... ]
> > static struct platform_driver exynos9610_cmu_driver __refdata =3D {
> > =09.driver =3D {
> > =09=09.name =3D "exynos9610-cmu",
> > =09=09.of_match_table =3D exynos9610_cmu_of_match,
> > =09=09.suppress_bind_attrs =3D true,
> > =09},
> > =09.probe =3D exynos9610_cmu_probe,
> > };
>=20
> [Severity: High]
> Could marking the probe function as __init create an execute-after-free r=
isk?
>=20
> The exynos9610_cmu_probe function is mapped into a persistent platform dr=
iver
> but marked __init, meaning it resides in memory that is freed after boot.
> If a compatible device is bound dynamically post-boot, will the driver co=
re
> jump into freed memory? Additionally, the use of __refdata suppresses the
> section mismatch warning that would normally catch this.
>=20

Not an issue

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-exynos96=
10-clocks-v2-0-c13ce8ef1861@chimac.ro?part=3D4
>=20

Regards,
Alexandru Chimac <alex@chimac.ro>
