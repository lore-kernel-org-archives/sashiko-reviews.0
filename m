Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51D49B46E
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574066; cv=pass; b=OfjPOPLc9jK+8sexoVeQjoVQvJORveRVsZ13b8dPTiQM62VdaTFfvK5BI1fPFYESiUnp6Y2WVlHuNEBHt2wa/q7T8ZrtQukCQ7xzOFr6QeS4cWgxqs+op5XQ0xy2ApE/HUhqgC/nVmYoO3zZJuHNnXItLfGb2cwKJQJrfh4uKdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574066; c=relaxed/simple;
	bh=Szs4unNIrEZMIAMU2/cjkkFp75qpkEuPA04qQ41Ey0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRAdttyWbQCYS1NdpszT4CvW2+JN9syR+6fHV2R/k2htPWqjhMc2OifMnDKwUs5Vtz0+de7gIBfwZghO9HUfpN8Qvd++wfsro+xwzoWAr/zGOY3XLJgiygfGQ3k5mwnOPDxcah8YqU8Bw8EuZacMLpLinbt4WatnGIWvnZTXyWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8tyya39; arc=pass smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8tyya39"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c294938a983so316629366b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789574061; cv=none;
        d=google.com; s=arc-20260327;
        b=dSk85bKxSnidYqUZx6zBIBgCvSpmWq4m2vg7+2ym89W8d4kJB+DMhgKey+AKS5N6a9
         nQQIo0d9AbzEt4a/uej3DwTIXaIhSBJ8fnK0hIaVrxdGbq+49udkUZRmvLf8ulUMMbq2
         XWW2eiV3fuFuz2F/HaMPjyhcZ2qs64L/xcj5RMFy5aCcvmmdg7Lx1nAV9NdDUN7K/39r
         qQFJ9j5JRikCTFFDd20uX52Mq3RIIQ2+/qQBMePmXxb8Wg1N4/SMO++6bioRlk89A5zV
         qvGVrNOfpWHP9zTDdikOp2guogPrbCgwRFV4gAmnaMbPOc5vkJgRgYs0RU9ouBRBAZeN
         oo8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j+JwEudxR1MPbpx1/HWXM6CVKH1JpRcqP9oj2gRPYA=;
        fh=RKKu6ZNF4CiIfeGb+FNxwc929Ghv0GgNffETlQDWDSA=;
        b=RuTRgyTexMdAGn+yxhvp34i7ShD8BT2Jwbjmum4zuyXYfwsD7+XwdQi/2MV0cLOSPu
         XgpNBCbjSMaC+QcoFqiNyZ/CNIcVQ0BawXdPBizQbcrGX+dYEjesGN+VcFiTxSivIxr3
         kMPeUUXQ0Vwq8SVHR1K8qdvEkufC3u1OfylN0it8Nsm3gpLZ2rMkXZZoihwg7tgG5Zh7
         FVU1flQFAAWdTetaebIY9v/IafSxY74IFoGvLTKCp35gP5VZu/MJx8UVPGWiI/3vCAez
         YfwkbIyslnJ91UiMjIbc7JLeISzrYe2EdAKdVxAwmL3M4uiTQnQJLixkb8cxM3cxN69b
         GVHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574061; x=1790178861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j+JwEudxR1MPbpx1/HWXM6CVKH1JpRcqP9oj2gRPYA=;
        b=R8tyya39kAwNSOQzdRUqKbTJFeM5CqT5+mE1UpBipcZFvhypHmNG3HsFb8gSTzx/Uf
         Bw1ibMFgffjkiQ3aRph37IxOADyJUrYnr6zjYD128A4bZfX91Xb8ECspK5Br4EEchfoO
         FAIrCyKCZQeAI1G6BReHpJZpdaL6isoOLMi6HU/bW+EDjJzH5KpbBJIIjwUuwT1EVmn3
         Czxgb+F2SJnaskxqeoB9HA+JAUu5fnNSmDa0XrWe/7rK2J3+osI+/pL62OFYUNR8yLx1
         7VFqcqR/b46cScHeHuFO3PZbHUW4TfAYelQrbjx27Q6uIygcCki9u4+SwwsapTLtdKih
         6bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574061; x=1790178861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j+JwEudxR1MPbpx1/HWXM6CVKH1JpRcqP9oj2gRPYA=;
        b=gDLQHN2c+I6CAv2gMVAWXdzRMp23AOivfUsN9grZEUSv6sbfqcwoKQet8JrpV2n7AN
         CP6vuyC2FwCECAPTMrgWNBaG96j6gGGPq4uADtVauOHxp0GKyoRnDE9c/Ym4yVI5Zjg4
         FpEawL5HFaht5XLRKnZyrJmz175Eg6TqSB69qQ9xwgIiWbZ1j3fMf3g+kO1SXwlQIIX3
         /nQP/V4g91cprG3u/r6Te13adcnOMO9oxbyBqIV7FdHukU3vO9YkydUvs/PSg5zxaPwx
         GRZWyGHTKqbK8BXG/iKQe/uXCXkeMLqjhr2iBKIk2kzEab2vbndlUTemLYSy+aB/Oxk9
         lqBg==
X-Gm-Message-State: AFuF++n3jyRiiIamUyleqLAlT+3a2SJ/r5N+j6TdxXkZ8JD8UCcNiJ+Q
	LYNRUZ+lfU1Y/QxrxRw+QG0/3O4EGnJlk7KRE8VW4/NMiYFmi71D2e0B67smGOucCrryD+jnixR
	fJipHvQPvWM65c4wcicH01BgV5HJNejW0lJssqq6eHg==
X-Gm-Gg: AYBFou27H5Zmazs0W4XlBS2R042XEanWmvX2rTXNBErkFVqT53AQbkGnH5HzxmVnFY9
	hkAHSFRDFKel0ky5/Qylgmmedv1dcAXa5JRh9SxvlkXW7HqlUJmEE90wyBpCI1KEVP5JwRdIQX+
	K9xbMVOxdylWv2ClLGG1TER1Ppb5KT+Qm2kbJ8FkXx39biE3+WTCsjwviQnt+52K52hKyWtz4TQ
	0t2f7zR/mKC7PyvuDwfwkMs2htMYtSkrVyBNZgosXeBBEnM1mSU5m1Kw9oFuNytYAz4XpRlH943
	15GhCIyW7mFt+BI7fHtMv6TYRVBia6cd/KundD25NW97lWQYu60jOOWKng==
X-Received: by 2002:a17:907:a689:b0:c26:2a5:819 with SMTP id
 a640c23a62f3a-c29e533436cmr419239466b.18.1789574061173; Wed, 16 Sep 2026
 08:54:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915123802.1561724-1-coiaprant@gmail.com> <20260915123802.1561724-8-coiaprant@gmail.com>
 <20260916145017.E901A1F00893@smtp.kernel.org>
In-Reply-To: <20260916145017.E901A1F00893@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 16 Sep 2026 23:54:09 +0800
X-Gm-Features: AcwNN1XzWka-gBP6JzQo7V21TLELEHt1FwivFATTB3eG1OP-0RdzvQzVP33L0zA
Message-ID: <CALj3r0gt9jFM6LHPBT_Ow62etk-ij7JmYWnx3fMmRjJavf6_Pw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, 
	vkoul@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=
=A8=E4=B8=89 22:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] net: pcs: UAF in xpcs_rk_create due to lockless drvdata access
> - [Low] kconfig: unmet PM_GENERIC_DOMAINS dependency via select
> - [Low] net: pcs: integer underflow in EEE multiplier calculation
> --
>
> commit 45fa9f088b9d4ae656f2c67e864a462b4d229815
> Author: Coia Prant <coiaprant@gmail.com>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit adds a Rockchip RK3568 platform glue driver for the Synopsys
> DesignWare XPCS controller. It creates a virtual MDIO bus to translate MD=
IO
> operations to APB3 register accesses and derives the EEE multiplier at ru=
ntime.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf
>
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> [ ... ]
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> > +     select GENERIC_PHY
> > +     select PM_GENERIC_DOMAINS
>
> [Severity: Low]
> Will selecting PM_GENERIC_DOMAINS without inheriting its PM dependency ca=
use
> unmet direct dependency warnings?
>
> The config PM_GENERIC_DOMAINS has a strict dependency on PM. If
> PCS_XPCS_ROCKCHIP is enabled on a platform where PM is disabled, won't th=
is
> force PM_GENERIC_DOMAINS on and trigger Kconfig warnings?

PM is already selected by ARCH_ROCKCHIP, so PM_GENERIC_DOMAINS has its
dependency satisfied on the target platform. On COMPILE_TEST the driver
is not run on hardware, so the unmet dependency does not matter.

> > +     help
> > +       Support for XPCS controller on Rockchip RK356x SoC.
> [ ... ]
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> [ ... ]
> > +     /*
> > +      * Compute the multiplier for the EEE clock so that
> > +      * clk_eee_period * (mult_fact + 1) falls within 80..120 ns.
> > +      *
> > +      * On RK3568, clk_xpcs_eee is muxed between gpll200 (200 MHz, 5 n=
s)
> > +      * and cpll125 (125 MHz, 8 ns), selected by CRU_CLKSEL_CON29 bit =
13.
> > +      * The reset value is 0 (200 MHz), but derive the value at runtim=
e to
> > +      * stay correct if the mux is changed by a board.
> > +      *
> > +      * Use a 64-bit intermediate: on 32-bit builds, 100 * 200000000
> > +      * does not fit in unsigned long. Clamp to the 4-bit
> > +      * DW_VR_MII_EEE_MULT_FACT_100NS field.
> > +      */
> > +     rate =3D clk_get_rate(pxpcs->eee_clk);
> > +     if (!rate)
> > +             return dev_err_probe(dev, -EINVAL, "Invalid EEE clock rat=
e\n");
> > +
> > +     mult =3D DIV_ROUND_CLOSEST_ULL(100ULL * rate, NSEC_PER_SEC) - 1;
> > +     pxpcs->eee_mult_fact =3D min_t(u64, mult, 15);
>
> [Severity: Low]
> Does this calculation underflow if the EEE clock rate is very low?
>
> If the board configuration provides a clock rate under 5 MHz, the divisio=
n
> yields 0. Subtracting 1 causes an unsigned underflow to UINT64_MAX.
>
> Won't the subsequent min_t() clamping logic evaluate UINT64_MAX < 15 as f=
alse,
> incorrectly assigning the maximum multiplier of 15 instead of 0?

clk_xpcs_eee is muxed between gpll200 (200 MHz) and cpll125 (125 MHz),
so the rate can never approach the 5 MHz underflow threshold. The
existing !rate check is sufficient.

> > +     return 0;
> > +}
> [ ... ]
> > +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node =
*np)
> > +{
> [ ... ]
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
>
> [Severity: High]
> Can this lockless access to the supplier's drvdata cause a use-after-free=
?
>
> If the supplier driver is concurrently unbound via sysfs, the supplier mi=
ght
> have already passed the consumer unbind checks before this device link wa=
s
> established.
>
> If the supplier then proceeds to devres cleanup and frees the pxpcs memor=
y,
> won't dereferencing pxpcs->bus access freed memory?
>
> Should the consumer hold device_lock(&pdev->dev) while validating the sup=
plier
> state and reading its drvdata to prevent this race?

The link is established before reading the drvdata, so the window you
describe does not exist: device_link_add() rejects a supplier that is
being unbound and returns NULL, and the caller defers before touching
platform_get_drvdata().

I also removed the explicit device_link_remove() calls on the failure
paths. DL_FLAG_AUTOREMOVE_CONSUMER already releases the link when the
consumer device is destroyed, which covers all probe failure cases, and
manual removal adds complexity for no benefit.
