Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C214492529
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529594; cv=pass; b=iig4OtFzpiEaOnaGpPyaYy1F80Uq023ezpmud3HtNx3twTXJISRa0qpMVbmbVAlnjnL2l2LTlkGcFtqBsSglgPoeBNFYueT3pN/bJLxQOl0faIsUitbS3vlU1qGlk0mhQ8wcxK1VtQVVacOb2uw6fCz7UYG0YLQZfCz8OgbHjNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529594; c=relaxed/simple;
	bh=W8eIEWNV4Lg1AgsxOXc2g7AdcwmqqBy/84fiSqtrQbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EImZPF7dUl1iOGGHHvNizDL5K+3iH8mK24egOlnw7frjf08MN6EOYiDP/nb92OVLjFZEkicYIGL+RDS5rbLI8ivwuEiiDRbD1N0uXTjOF/E3yiaOaxSRs3wED93ZRfIC+5NQlVG06izGEU2bzf8zah+CkCk8Cl0oYegAWfnAxKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbHNGNOp; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbHNGNOp"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664d35b4777so1219573d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 09:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783529587; cv=none;
        d=google.com; s=arc-20260327;
        b=Id0/tSAAflDlbItMiPD6BvmcoEikX0GgxTVR31U7kc0ShJqfgZfQHxIdxS5n3ffhZy
         I5b5GAhwghTsBGo5LZ++41/TpnRkkgEmTITWyg8V1v7UDTxeOMnJxM9OPaCPrO1tNLPB
         0bL7PDcspgWLkYQ93WCtVSA9dISyE0Dn1tYvl5urwp10I1mcJCnFAvdmjH3DCnd5Qw0g
         Sgi2/TPrbCFgNdCPbsDSuGIXhSBqlV/61NHC4LenP+wdZs3SuwwOWWZblrrdCDKduANU
         B6f4YF3rHXl9KyZRvxL4d+ZKL5XHfGuKNtA6eJtaqhMs5GNEDRC5MXPxS4O8DO4lfmYu
         Z1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJgq1hdSaEnlg7KPyw8iDLSOCyB+KQFBg4rjGDDZ4Uc=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=YUHF85rs319z5mqRIXyIG02KxD1Zex1Uaw5HONelecAX82Y8JpKou8kpd90CMNxMzo
         LxFvXB+VfcAAAYr7Givuc9xWKnm2yA5cqj3UmZMdgf0EvsufHgHbijVTUpkc2g3IoKjR
         PcObB09Vd6zxD8Luu6g8L4M4LY/2fbrmHRXSQ90aWY1Uu+FBDwdnIQ52GN6La1GHZzS/
         S6EZ70i+iz31Uk643Wi0PoWBBTWzqBQ2tOtFCBqEWB4vBWSCUoKoNTbwViImRGL4JK4l
         1QiE2j8lfGCYP3PUL3U8LGRKmoEmon4NNCYnZyQpDS6mZBA9KSMNwoGugXT/Ob5IXq24
         Rjyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529587; x=1784134387; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJgq1hdSaEnlg7KPyw8iDLSOCyB+KQFBg4rjGDDZ4Uc=;
        b=YbHNGNOptaj4MDndsNGcje7Wy4QPwjRuR8w2tyvljk8Cike9H46/oVugEtAj0aVjFd
         eJDzWbhlYI3N8u9sp0vsUwvZergefsG4MdBOH9zJkQruu/ZOeuJbDsPuGlMxkIoK7Uec
         GWkBPZHKKB60ETvxNVG1gCpU/WsfLsOYdvyz5HNObnolnztQwOWEr6XeZEVE5Mpil4YU
         D/ItiYTw4mivQHWGwp7H/+3oS/7hGSVJk0JcfHr7OWBt3OgffIlTWT0t8Gp9nfKmr9X7
         WkDcbb2gQQCaD9c7apbwffpVZ+w87YNIgfV8tVkFLCWnTNMjtC4YQl9iRQBa5CFxgmps
         KDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529587; x=1784134387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJgq1hdSaEnlg7KPyw8iDLSOCyB+KQFBg4rjGDDZ4Uc=;
        b=NF3+PqUdtyWmHt9zmydmGKT81HFklrWoobGr08rCFgmgIzYOprT3fCv2RYeAN391ap
         yFC8K/6+ZnzzubcN8pD70JzW18ofg62Db8oSA6MaWFCXFlgU8L3/oGZjbTzHorCA8/0S
         MKIsYVNip/j7lG0j+Bk/8mLINBoYhp1ceW6UhT/UEYZq4mcU/r3i+2rNevukwIQkFVc3
         mYidnusRsBX3uU0bL3VbfWZMEbw17k6Xz7KElugDA8uz9ZZ3uPXUzgili3W3yNwWYVuo
         PJx5taA2pcfNwTmyVCHsfC/+zoICwWvKnKEg0MNKrXG8ZvfiAV2/DgmtbBXlf8Fuf9pM
         RBSA==
X-Gm-Message-State: AOJu0YwOIxpfBxCQCsspkrBrzLH5JtUPWSKX+599blRmnrmLFwWXQA1S
	+IRBVBFJg4xjd3VVc7bY8al4wcLmDxlrAwrXkwuOXgFcQgxOEUJbJZVFbYela819BUauKFf8SOz
	dQETFkVpRmSo4kgnFDSQSkEPxE4mPRu3C8Ln0
X-Gm-Gg: AfdE7cln303oOhLaBmTL8h+2AIM9qgG0kmHPDAvjt04oja+GK22Y7wVkB8/CEf0wybH
	HvyKMOY3CaadbleljQ3fLFboZ3XJpDQs6Ar10+S2W7IBiGu3T2QBcKjis9rA6nMw5m+KsHlX125
	5L5LOnpl9GikG22zrWfcnXStAskRVcN4487T3fmj6VAEo4MdRAVT5LbmZk3Rvei7TUHcbo7svaU
	DxCGWwVrgun/PbvzrGM1rFuq0LEQudc2iSlb+sZWCfmnromnhqxMvgTgD5linL0yuB35Q0vgw==
X-Received: by 2002:a53:d018:0:b0:664:6d12:1f3b with SMTP id
 956f58d0204a3-6679effc4ddmr2385788d50.3.1783529587276; Wed, 08 Jul 2026
 09:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708125352.1915040-1-tmaimon77@gmail.com> <20260708125352.1915040-4-tmaimon77@gmail.com>
 <20260708131101.C23C91F000E9@smtp.kernel.org>
In-Reply-To: <20260708131101.C23C91F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 8 Jul 2026 19:52:56 +0300
X-Gm-Features: AVVi8Cf-_oFSXa-fC1UcIDHKMC-4yKp0muJRAjtuMlVILRwIEOgf0oM1ZZqblkQ
Message-ID: <CAP6Zq1iY9GEo6YQEk9CcFKW-PiVUxd-hKJyjMGuhH494hh91yQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 at 16:11, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The `fiu0`, `fiu1`, and `fiu3` SPI flash controllers omit the =
required `memory` mapping region.
No, it is explained in the dt-binding
  Alias convention:
    The '/aliases' node should define:
      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&fiu1;

> - [Low] The `pspi` (Peripheral SPI) controller is added but not documente=
d in the commit message.
Will be changed in V8
>
> Pre-existing issues:
> - [High] The IRQ name passed to `devm_request_irq` is allocated on the st=
ack, leading to a dangling pointer in the IRQ subsystem.
> - [High] The fan ISR calculates the module index using virtual IRQ number=
s, leading to an out-of-bounds array access and memory corruption.
> - [High] The USB device controller driver fails to save the allocated `ci=
_hdrc` pointer, causing a deterministic NULL pointer dereference on device =
removal.
> - [High] The EDAC driver frees its main control structure on the probe er=
ror path while a device-managed interrupt is still registered and active.
> --
>
> --- Patch [3]: [PATCH v7 3/4] arm64: dts: nuvoton: npcm845: Add periphera=
l nodes ---
> commit f606ce99eafc7d4c8e2d67d9d5119b1c25593a16
> Author: Tomer Maimon <tmaimon77@gmail.com>
> Subject: arm64: dts: nuvoton: npcm845: Add peripheral nodes
>
> This commit extends the NPCM845 SoC DTSI by adding peripheral controller =
nodes
> needed by the evaluation board and downstream platforms. It adds nodes fo=
r
> Ethernet, USB, MMC, FIU, memory controller, RNG, ADC, PWM/FAN, I2C, and t=
he
> OP-TEE firmware.
>
> > Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> > by the evaluation board and downstream platforms. Add the Ethernet MACs=
,
> > USB device controllers and PHY, MMC controller, FIU controllers, memory
> > controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
> > OP-TEE firmware node needed to describe these blocks.
>
> [Severity: Low]
> The pspi (Peripheral SPI) controller node is added by this patch, but it
> isn't mentioned in the commit message. Should it be included in this summ=
ary?
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 0e5feabf2d718..7608dcf5489c4 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> [ ... ]
> > +             mc: memory-controller@f0824000 {
> > +                     compatible =3D "nuvoton,npcm845-memory-controller=
";
> > +                     reg =3D <0x0 0xf0824000 0x0 0x1000>;
> > +                     interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
>
> [Severity: High]
> This is a pre-existing issue, but adding this memory controller node expo=
ses
> a vulnerability in the EDAC driver (drivers/edac/npcm_edac.c).
>
> In drivers/edac/npcm_edac.c:setup_irq(), a devres-managed interrupt is
> registered and the hardware is unmasked:
>
>     ret =3D devm_request_irq(&pdev->dev, irq, edac_ecc_isr, 0,
>                            dev_name(&pdev->dev), mci);
>     ...
>     regmap_write(npcm_regmap, pdata->ctl_int_mask_master,
>                  pdata->int_mask_master_non_ecc_mask);
>
> If edac_mc_add_mc() fails later in edac_probe(), the code jumps to the er=
ror
> path and frees the main control structure:
>
> free_edac_mc:
>     edac_mc_free(mci);
>     return rc;
>
> Since the interrupt remains registered and active until devres teardown,
> could the hardware assert an ECC interrupt during this window, causing
> edac_ecc_isr() to dereference the freed mci pointer?
Yes, should be changed
>
> [ ... ]
> > +             udc0: usb@f0830000 {
> > +                     compatible =3D "nuvoton,npcm845-udc", "nuvoton,np=
cm750-udc";
> > +                     reg =3D <0x0 0xf0830000 0x0 0x1000
> > +                            0x0 0xfffeb000 0x0 0x800>;
> > +                     interrupts =3D <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names =3D "clk_usb_bridge";
> > +
> > +                     phys =3D <&udc0_phy>;
> > +                     phy_type =3D "utmi_wide";
> > +                     dr_mode =3D "peripheral";
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: High]
> This isn't a bug introduced by this patch, but adding these USB controlle=
r
> nodes exposes an issue in drivers/usb/chipidea/ci_hdrc_npcm.c.
>
> In drivers/usb/chipidea/ci_hdrc_npcm.c:npcm_udc_probe(), plat_ci is
> successfully returned but never assigned to ci->ci:
>
>     plat_ci =3D ci_hdrc_add_device(dev, pdev->resource, pdev->num_resourc=
es,
>                                  &ci->pdata);
>     if (IS_ERR(plat_ci)) { ... }
>
> When the device is removed, npcm_udc_remove() passes the uninitialized ci=
->ci
> pointer to ci_hdrc_remove_device(), which immediately dereferences it.
>
> Could this lead to a NULL pointer dereference during device unbind?
>
> [ ... ]
> > +             fiu0: spi@fb000000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb000000 0x0 0x1000>;
> > +                     reg-names =3D "control";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             fiu1: spi@fb002000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb002000 0x0 0x1000>;
> > +                     reg-names =3D "control";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI1>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&spi1_pins>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             fiu3: spi@c0000000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xc0000000 0x0 0x1000>;
> > +                     reg-names =3D "control";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPI3>;
> > +                     pinctrl-names =3D "default";
> > +                     pinctrl-0 =3D <&spi3_pins>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: Medium]
> Do these FIU controller nodes need a 'memory' mapping region?
>
> Without the 'memory' register range, the SPI driver might fail to use
> memory-mapped direct reads and drop to UMA (manual) mode, degrading
> performance. The fiux node below includes it, but fiu0, fiu1, and fiu3
> do not.
>
> [ ... ]
> > +                     pwm_fan:pwm-fan-controller@103000 {
> > +                             compatible =3D "nuvoton,npcm845-pwm-fan";
> > +                             reg =3D <0x103000 0x3000>,
> > +                                     <0x180000 0x8000>;
> > +                             reg-names =3D "pwm", "fan";
> > +                             clocks =3D  <&clk NPCM8XX_CLK_APB3>,
> > +                                     <&clk NPCM8XX_CLK_APB4>;
> > +                             clock-names =3D "pwm","fan";
> > +                             interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL=
_HIGH>,
> > +                                             <GIC_SPI 97 IRQ_TYPE_LEVE=
L_HIGH>,
> > +                                             <GIC_SPI 98 IRQ_TYPE_LEVE=
L_HIGH>,
> > +                                             <GIC_SPI 99 IRQ_TYPE_LEVE=
L_HIGH>,
> > +                                             <GIC_SPI 100 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                                             <GIC_SPI 101 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                                             <GIC_SPI 102 IRQ_TYPE_LEV=
EL_HIGH>,
> > +                                             <GIC_SPI 103 IRQ_TYPE_LEV=
EL_HIGH>;
> [ ... ]
> > +                             status =3D "disabled";
> > +                     };
>
> [Severity: High]
> This isn't a bug introduced by this patch, but enabling this PWM/FAN
> controller node triggers a dangling pointer bug in
> drivers/hwmon/npcm750-pwm-fan.c.
>
> In drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_pwm_fan_probe(), the IRQ name =
is
> allocated on the stack:
>
>     char name[20];
>     ...
>     sprintf(name, "NPCM7XX-FAN-MD%d", i);
>     ret =3D devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr, 0, n=
ame,
>                            (void *)data);
>
> Since devm_request_irq() stores the name pointer in the IRQ descriptor, t=
he
> stack frame destruction upon probe return leaves a dangling pointer.
>
> Could this cause a use-after-free or panic when userspace reads
> /proc/interrupts?
>
> [Severity: High]
> This is also a pre-existing issue, but there is another bug in
> drivers/hwmon/npcm750-pwm-fan.c that this node exposes.
>
> In drivers/hwmon/npcm750-pwm-fan.c:npcm7xx_fan_isr(), the module index is
> derived by subtracting the first virtual IRQ from the incoming virtual IR=
Q:
>
>     module =3D irq - data->fan_irq[0];
>     spin_lock_irqsave(&data->fan_lock[module], flags);
>
> Because the kernel's irqdomain does not guarantee that virtual IRQs are
> contiguous or allocated in order, could this subtraction result in an
> out-of-bounds array access and memory corruption when acquiring the spinl=
ock?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708125352.19=
15040-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
