Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305AE21C16A
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532694; cv=pass; b=sgo20zBj5mYInGVnBMmW3j9peA6szJZSMi5GiNT5MGK+pcyCoTBWuR44XDB/YMZ7QSuncVZePrn8pHM3WzFO1cIQQ1G7EDon9QxffR6ImhV7mC1fpPHNK+gMzTM2msfRybSnponCdzKeoxpxYw8YFc1aziQla47dqeDy82GmsLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532694; c=relaxed/simple;
	bh=UKZhWeWAfm91Tl34gD1jUYGw1Gj8LP6juUfsejBIZXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBWrUyITTd6ock5+HX6f+2k8Jr5B5CRcxq4jvCr2k4/Ohk14bRz9FkNe8rp9puu840vJ62zp9FIqanDS6OGGZCJx54R5nOHFU58TdKyW+pRug6sQSZA12rw7k2QI6z8835lS0AzBzpyQ3cucXq6JJgYTKOiBOV0QvjgiiDudeis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feyThw10; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feyThw10"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660512d80b4so3306777d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 07:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532692; cv=none;
        d=google.com; s=arc-20240605;
        b=Xiuo1ZiFTbp8AIGO70o5/vbaDe3PcoDhWycyvpaYfOnkwwAoJIGw3cmw6gHFhJb7Ce
         KyMOzLP+7HscYN/Qm/S2jj5KgE2Y+xaKQf5/b6g7Lx1q7bqgAGocSfgESvtNP48tN8ER
         FUhHuu2xGQyzGTJaJTDWn9oG8ry8a5yDIedNxkJZwqReaDLH5AlsW6XeO6DHMZtVL4sg
         w59DS9cCGX3WUAPXNPUHAuKvQO6bUxcLPDPXDUYsNjnXBcdb97zHbpjLqf3vh2mBbJGU
         AWeVlrRkiJ8yY5w1DUT6EgC5JE48/1Wc4haQsxThAgBzvZ6QYQwqnOdzGWktyO88D82n
         38ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrGpYc7EZ2BDTKPv+yN+W6g0qTS6gFnZcs1t2tSQ68g=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=f4DPUi4psN5xl1FWzW2ILYBp1thK2ffx5Jpg4f2amnbOffRq+39YILE8DgY3biV9Dj
         O+4F465pSSemmms2gCHT38G0IHBLUp5j4FgeOZY7pFJPkb16HDQOwNKE8j10SzooyEYM
         sOhQNzVRI5UozOuFvR5Ba6hCk5YtkbzTRvwfXPmIXBKBKaMh0sJmthd+9g6ar0PQyIE6
         PiQ/B4lldbrHvDyvtd5+2xepw6eBiHUPkv4ci44IH3AYrDkyt9jVGy0bq6y2obmE6t8+
         IdBMuo3OOJEQqtw0ufnb6V/J1OHSe8coHY8XZ+H6XjXjlPOvulOI7mJ7eqY4yBc7j5kQ
         /Ekg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532692; x=1782137492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrGpYc7EZ2BDTKPv+yN+W6g0qTS6gFnZcs1t2tSQ68g=;
        b=feyThw10WBI+9wInQhPvTrs22T4GDx+Y18j01y7PGkpelDayxxpoPUhaT9ampG4iXU
         CLnflQ6uknfp9+YGB6mCD0WDl0ORuv/oo1NC6+g6u51hvHcM52WSEl0EMs7btM8y7fqG
         /wgkIMzGiXV68pi82NI9RlJ2URluGIqQ7ipL77xizXi9/DnY2HXly/1oLDZrf+oGUEwY
         EYP4s/RmzoriJGPvsZ4YL5z0Cvebho6GOue3OUVkHMQCyw9FWhHPY+eZTNV7eDq5sdNQ
         uhHxng+wgHgbWuNEM+ieRrvicCFG0t/i+aLCFa331FLlTV0jLrLKd0okMlTqy9LPwm+S
         S5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532692; x=1782137492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrGpYc7EZ2BDTKPv+yN+W6g0qTS6gFnZcs1t2tSQ68g=;
        b=PTVgbxJckf/9dgvtw/npGAmEWlifMiaGnyUlPJhH0raoP8K3ymEVxG6ihXpPTu+nPT
         9zH2wZ6AZfPpPQybPMuTv7Hq5InCr+b0i8oYUDdGEyGLAOJWwleB6AogGAFz2wnziqDC
         Eh8sx0z+EVelf2PLhiYok53AAGQCQ2t1Uhij92esctWzhf9Q6UJElBRClcwysazuUS43
         +KxHXvIeRNiTxH2FXeg5oXYBJRjqNleKX1n1WQXmgFU1LfCPLACDIrOcz4Fy0Dw2uOZL
         YOzZlijxLbEHkTSeAj1MH4XkuxriLIMga1mWCXStPLRUUcGFyuFBKXqFttsBTp1fncer
         gFPw==
X-Gm-Message-State: AOJu0YzD6e+gJ5zWeI4HJ6cpCVBOQZnsqIka2eTgPs5dXpHKJQGTxlg+
	VJUVgzQbmy+JOqoZMuBS/z7MgOmuL6Ws2femjB+3/U7yuNN9j1i2IRDMHzmpchHDWDAjmjAt7mf
	S2OS8cgGlsrhXodFkImccy83r+OK8y2euTRBW
X-Gm-Gg: Acq92OHPKMeIT4tXx19UAjci/SMQnEKCeldaItAjEwRlcjcbEmmVy+YlQyBYnxoc8id
	ha4SL/YKtMDbQQAGL8PrZs4x38CCGHDeFq7gI14qStHyEngma7Wl0PpWoaDNkpO7rmk17Pz4Ht3
	wrZViarDano3rJ2Hf5uDKukqjjdJK4DEM03tr48wy9hoOfl4gNaZCe+jXBxYzyDmaIKcWlvm58p
	qEV4rsaPkw5up4Swkuz/l05nen//sxqtZ+GhCr0hWmbO8/b69fLHfWWCXKgWNz/7DgIik82Jn4A
	PoN5fOTU0g==
X-Received: by 2002:a05:690e:1443:b0:65c:6bf0:fad4 with SMTP id
 956f58d0204a3-66278d4f1f8mr7941983d50.27.1781532692254; Mon, 15 Jun 2026
 07:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610160816.2828713-3-tmaimon77@gmail.com> <20260610162038.304A01F00893@smtp.kernel.org>
In-Reply-To: <20260610162038.304A01F00893@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jun 2026 17:11:20 +0300
X-Gm-Features: AVVi8CfEc81qkCQBN8OJtoQ-_JIGYWvllSrsq9M306zQn2ux9pWdHNpYV0tje48
Message-ID: <CAP6Zq1iC_sLfZtBkXGB-3CEodftR1hNnq8BfRx8mYc5_Je7FNQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 10 Jun 2026 at 19:20, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] DTC Warning (unit_address_vs_reg): The `apb` node includes a unit=
 address but lacks a `reg` property.
> - [Low] DT Binding Schema Violation: `nuvoton,sysgcr` property is undocum=
ented and forbidden by the ChipIdea USB2 schema.
> --
>
> commit b1b96db36d76cd5dd1f935613798ed29aade275d
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845: Add peripheral nodes
>
> Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
> by the evaluation board and downstream platforms. Add the Ethernet MACs,
> USB device controllers and PHY, MMC controller, FIU controllers, memory
> controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
> OP-TEE firmware node needed to describe these blocks.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/=
arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 7976baafb9942..1e21b2704784f 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> [ ... ]
> > @@ -51,7 +57,255 @@ clk: rstc: reset-controller@f0801000 {
> >                       #clock-cells =3D <1>;
> >               };
> >
> > -             apb {
> > +             gmac1: ethernet@f0804000 {
> [ ... ]
> > +             udc8: usb@f0838000 {
> > +                     compatible =3D "nuvoton,npcm845-udc", "nuvoton,np=
cm750-udc";
> > +                     reg =3D <0x0 0xf0838000 0x0 0x1000
> > +                            0x0 0xfffef000 0x0 0x800>;
> > +                     interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names =3D "clk_usb_bridge";
> > +
> > +                     nuvoton,sysgcr =3D <&gcr 0x9C 0xC000 0xC000>;
>
> [Severity: Low]
> Does this undocumented nuvoton,sysgcr property cause a dtbs_check warning=
?
>
> The USB Device Controllers bind to "nuvoton,npcm750-udc", which is evalua=
ted
> against Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml. This sch=
ema
> specifies unevaluatedProperties: false but does not document nuvoton,sysg=
cr
> internally or in any dependencies.
will be removed at V5
>
> > +                     phys =3D <&udc0_phy>;
> > +                     phy_type =3D "utmi_wide";
> > +                     dr_mode =3D "peripheral";
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             udc9: usb@f0839000 {
> > +                     compatible =3D "nuvoton,npcm845-udc", "nuvoton,np=
cm750-udc";
> > +                     reg =3D <0x0 0xf0839000 0x0 0x1000
> > +                            0x0 0xfffef800 0x0 0x800>;
> > +                     interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names =3D "clk_usb_bridge";
> > +
> > +                     nuvoton,sysgcr =3D <&gcr 0x9C 0x3000 0x3000>;
>
> [Severity: Low]
> Is this the same undocumented property issue as seen above in udc8?
will be removed at V5
>
> > +                     phys =3D <&udc0_phy>;
> > +                     phy_type =3D "utmi_wide";
> > +                     dr_mode =3D "peripheral";
> > +                     status =3D "disabled";
> > +             };
> > +
> [ ... ]
> > +             fiux: spi@fb001000 {
> > +                     compatible =3D "nuvoton,npcm845-fiu";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     reg =3D <0x0 0xfb001000 0x0 0x1000>,
> > +                     <0x0 0xf8000000 0x0 0x2000000>;
> > +                     reg-names =3D "control", "memory";
> > +                     clocks =3D  <&clk NPCM8XX_CLK_SPIX>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             apb: bus@f0000000 {
>
> [Severity: Low]
> Will changing this node name to include the @f0000000 unit address
> trigger a unit_address_vs_reg DTC warning?
>
> According to the Devicetree specification, if a node name includes a
> unit-address, the node must also have a reg property where the first
> address matches the unit-address. Because the apb node defines ranges
> but lacks a reg property, this might introduce build noise.
would be back to apb in V5
>
> >                       #address-cells =3D <1>;
> >                       #size-cells =3D <1>;
> >                       compatible =3D "simple-bus";
> > @@ -59,14 +313,6 @@ apb {
> >                       ranges =3D <0x0 0x0 0xf0000000 0x00300000>,
> >                               <0xfff00000 0x0 0xfff00000 0x00016000>;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610160816.28=
28713-1-tmaimon77@gmail.com?part=3D2

Thanks,

Tomer
