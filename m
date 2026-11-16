Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794824716;
	b=nnC7RfFI+vg5GfQt7l3A4M65hpEOfyrU+/ve81homp48PEnwVrcUL4Vqiw7rl5Uw/CK8
	 icihyhB5zJnj6OlyD7gEUTvmw4EfVr1WKDwT5r71fxEe4x4J0UM+ibFFVKjvesDGDLtkK
	 f9759r5sdpUhPSt14EBbNcay24K+ko+LFDF7bUD6E+Dgi1aFlD746g0m5UcjXD7KVjt7P
	 r/RcxqDLfFl2/ufza32PdtdmAAPBU2qZurG0uYxURUxn6iu74y/cPcrPjhUHTH0IFrfA2
	 D0ebmUViejBmEGldMsglS/8CYgxP/FkjS3KKRGu1P+KMYxUGVYolfNOVwalYLNNkvBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
	b=jJLFQM5O5WwKmV0RymDCjqSJg9KcTYUlBYAnFyw2hg+eVUKQ2nXXonwUJMILgyowYdHF
	 jLJNO6NTlXtL0M7/bT479B66oP9ubrdfFqkUzqBKmD1FDFaTgQpiwX/DtQhy8X4YjwXkV
	 wDg3V10blgCOvQdpTzotlw3YolK/b9J6th5qHm1mADPm9CHFxhbc/X1UTguAim3oL9WcZ
	 ORyvtGqK8cROjhfV5BX10QV5AsoptRBlznm4QdqOTdKgKNSRQP8AsUaHByGdxiN4KflbY
	 cFs40l36M7CbMmQ9L4by1CYhzCHq9EF0jThCqHyOVPyaY61rxmZi0tlCQtcJmqD1Nyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5QxIfoM;
	arc=fail smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06B606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 10:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C06B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5QxIfoM
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-536c8f958d7so21430221cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 02:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824715; cv=none;
        d=google.com; s=arc-20260327;
        b=n2ytdedSj61oyZvVFRk25Dn1t9Qv53/FP8yDncYSBiwY9eFkdinr4Okkfm7F8JQxgU
         2alH0Y0kVjqpbPJHIa5WjxyQJpkLNFoEgkWQUzf5VlGfdQ+F7zpCFVasB8elKwgCQaqk
         YIYLzM1lWb9HkRKSD6+34hmmZvZTSAbSYHMtJ6mhqEOVJkJggOzeT3KWbe78EvcxUs8s
         cLzAN6gu7DxpZ3+vZIfyqzKgRImVWN6WNjTlLbhZI3W+4GntO3xE0pweydhYNd+bmh6+
         WAMXguHcOd3tbcIKdUBKD6/JHPFYixeBKeS10/7kOb30gomACQRXEbNEhs9RfBK8fxsh
         kxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=IaAd8KzIZFD2oJjtfsQogvtmFp4fBgiQP8TCt7jKSuWwlkWF9idMKibEzolWQ5AFhP
         EFKpZIQTFQwT0t/Qo3WorLc2EhUq+w4/+viT5UeQpBDpZBs7d3wJ/6eoFwJpR5n9hq8g
         UrxloiTRYz6vZ5qRLlBoXNLQPfxZy0w9MOfsS6EJSXQJ1k/PWIzTyEWv8NKLzSHElEx8
         qW4lt5nlRaTHzW8V0rZH0/n4tBiduWqgU+cyLOW5Fo200sOkF75xYDS4qd4x1TROp4J1
         VFdfumoHp+YehJvRIf07kj13dh5HcpfNW97eSzyJ/x9iVcZ0AAKzl6lIve7Bj16OiSW0
         /Dkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824715; x=1795429515; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
        b=h5QxIfoMXYYdW0PEJ6HFqIbnhkiShxnTqNMmInhxMl3iql579aW9PKysgzHOUkudWJ
         4yyLtr4SDL55Kka8pGnugAJMzgj+BV/JWKwNBsRXxcLRYWasDLNOEJG+GWO/cWB9r1sX
         NTn12IvOrKC5+gtYtYIPxrVVjd14ghDKyaUnRQdhj9NFO6QSLy3qCmRg7AIJ7QpScXCK
         jd7pLbRFNDu62mNOLYTrfTsR45fCrm6vXBOgKWZI++GWwmOH5qCUhtecRVcjUwEiaRvI
         Hl4xdrdtbDcVgS/I76mUi4HN8JZMGy6GcMIt1fyoyomqOaxI15ODhzT63uNhSjuI58uT
         K+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824715; x=1795429515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNX0aK9++vSiV1WezhGxFL7nskIB2Up4Asmsfa7EyD0=;
        b=QhS0PsaJ9p63G5iNH0JmA5nhOTmIWcEECDdO2xM/+1sG0b5KlTXfRuo5rFW39fcrnq
         RPPdDr+9zh2EKytQ+JtVX30r+OizKTw7Kdj9XbX36gRoy8ca648RMsZUDYIlhJR1AuZu
         /GxHWS96X2peRhG4Gvw+v7OrKwo31E3hnABt29AS01ogSrOk1e90ygTr3qbbAOpR/Ion
         1zl3TSXIzr3lxA21omzmS2yuMUTeo7ERIV6Ep5Qa5M9ZsUgyMpX8XYyYm1dpPH6ZEzb+
         yHFiWlUqn6eN09J4eube5O1RTOGKnkCDvYkfUTsASyma47NVIM7NzbhVJU0PbKRp/PPN
         Bubw==
X-Gm-Message-State: APuU4Z+uLyQNru9d/HrhSi6kmUSIlR+vBuw8XF9j8QjKpgXhmbp9AKlw
	vSsgcGJMXq5RM2WgLCIKdDX4+hg0A8oQ0EEgyPpI3SRINoVk9+bjIsiqNhJBvDVDxO+DCm08Mud
	V6e5wWkFkPUKTGvC8Y4Y3XtIhbqamR3kliZBh
X-Gm-Gg: AYBFou0qVz4GOKOjyuCd6ywPRT+4sb2hqiSMkIGnTEyd/vLTVv/f45t/kDGN9nOlPHq
	glPk1u6p8AfrpNK1r/z28I8E0ozg2I3P+GYTkx4WX4seoFGwdBHxZ/Uv2GHnBnjGd1UDyWxCyNy
	MfwT7EOmTO2V5RYxrtyZI//7lSdIi0ygnFaZGGq03IM6Wrgl721ecFw8UtUvgYKOOxFFYEkDxve
	ZYSvNns3cqfUEsrzefd2BIE1h5RsDI8830Dp8302+6MT8GuQSG7p4/e1JmdeNYuWmYqo01KVIhr
	lN35Zuh2a2HDjVvKNTaRlA6nSMBAkVo0709R65tJEyQjg1cBMsUO0h3419R9hkgZrAxkOv50z3j
	8hWX0g4w/JNP3ozJZdiwsDWm/UfugDx1hzvgGWHD7df4Rt7mKshPMDw50ka9mZzPrpWEzLA==
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id
 d75a77b69052e-55c37c1b4b8mr115585791cf.77.1794824715319; Mon, 16 Nov 2026
 02:25:15 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com> <sashiko-outbox-211760@kernel.org>
In-Reply-To: <sashiko-outbox-211760@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:25:03 +0000
X-Gm-Features: AclHuK8X75tCZs1GrS1mQ7GgS6O10f61ls9OHBbkjwh4tusAHwGuZrKUIJeR4cY
Message-ID: <CADT+UeBxUecV10oAzTDn+rPas43iGLgpuHKHYZUKd_o=gN9Znw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 7:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
>   clocks, and resets
> - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: sdhi1 left enabled
>   when RZ_BOOT_MODE3=3D0
> - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: missing pull-up and
>   no-op UHS pinconf
> - [Medium] arm64: dts: renesas: r9a08g046: SDHI power-source not wired
>   in pinctrl-rzg2l
> --
>
> commit c182c80f2e51018770e032cd10fb901dca56ea0e
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 p=
incontrol on SMARC EVK
>
> This commit adds device tree nodes for the three SDHI controllers on the
> RZ/G3L SoC (r9a08g046) and configures SDHI1 pinmux and voltage regulator
> nodes on the RZ/G3L SMARC EVK board.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a08g046.dtsi
> > index c63a857f0e5b0..3665ccbdd91be 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -762,9 +762,80 @@ dmac: dma-controller@11820000 {
> >                       dma-channels =3D <16>;
> >               };
> >
> > +             sdhi0: mmc@11c00000 {
> > +                     compatible =3D "renesas,sdhi-r9a08g046";
> > +                     reg =3D <0x0 0x11c00000 0 0x10000>;
> > +                     interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> > +                     clock-names =3D "core", "clkh", "cd", "aclkm", "a=
clks";
> > +                     max-frequency =3D <150000000>;
> > +                     resets =3D <&cpg R9A08G046_SDHI0_IXRST>,
> > +                              <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> > +                              <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> > +                     reset-names =3D "rst", "axim", "axis";
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: High]
> Can sdhi0, sdhi1, and sdhi2 bind to the Renesas SDHI driver or pass
> dtbs_check with these properties?

The dtbs checks are passing.

>
> "renesas,sdhi-r9a08g046" has no fallback compatible string and is not pre=
sent
> in renesas_sdhi_internal_dmac_of_match or
> Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml.

That is correct.


>The binding schema
> also restricts clocks and clock-names to at most 4 entries, restricts res=
ets
> to 1 entry without reset-names, and only permits the vqmmc-regulator chil=
d
> node (added under sdhi1 and sdhi2 below) for "renesas,sdhi-r9a09g057".

Binding clearly specifies 5 clocks/clock-names, 3 resets/reset-names
and optional internal regulators.


> In
> addition, renesas_sdhi_probe() only requests a single unnamed reset via
> devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL),
> leaving the axim and axis resets unmanaged.

These resets are managed. see below

priv->rstc =3D devm_reset_control_get_optional_exclusive_deasserted(&pdev->=
dev,
NULL);
if (IS_ERR(priv->rstc))
return PTR_ERR(priv->rstc);

priv->rstc_axim =3D
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
"axim");
if (IS_ERR(priv->rstc_axim))
return PTR_ERR(priv->rstc_axim);

priv->rstc_axis =3D
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
"axis");
if (IS_ERR(priv->rstc_axis))
return PTR_ERR(priv->rstc_axis);

>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/=
arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > index 5289efd1a430a..0b6b7e109200f 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > @@ -14,6 +14,7 @@
> >  #define SW_GPIO4             1
> >  #define SW_I3C_EN            0
> >  #define SW_SER0_PMOD         1
> > +#define SW_SDIO_M2E          0
> >
> >  #define PMOD_GPIO4           0
> >  #define PMOD_GPIO6           0
> > @@ -38,6 +39,7 @@ / {
> >       aliases {
> >               i2c2 =3D &i2c2;
> >               i2c3 =3D &i2c3;
> > +             mmc1 =3D &sdhi1;
> >               serial0 =3D &rsci2;
> >               serial1 =3D &rsci3;
> >               serial2 =3D &rsci1;
>
> [ ... ]
>
> > @@ -175,6 +190,68 @@ scif0_pins: scif0 {
> >               power-source =3D <1800>;
> >       };
> >
> > +#if RZ_BOOT_MODE3
> > +     sd1-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd1_pwr_en";
> > +     };
> > +#endif
> > +
> > +     sdhi1_pins: sd1 {
> > +             sd1-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_C=
D */
> > +             };
> > +
> > +             sd1-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_C=
LK */
> > +                     power-source =3D <3300>;
> > +             };
> > +
> > +             sd1-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             sd1-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <3300>;
> > +             };
> > +     };
> > +
> > +     sdhi1_uhs_pins: sd1-uhs {
> > +             sd1-cd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_C=
D */
> > +             };
> > +
> > +             sd1-clk {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_C=
LK */
> > +                     power-source =3D <1800>;
> > +             };
> > +
> > +             sd1-cmd {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_C=
MD */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
>
> [Severity: Medium]
> Should sd1-cmd in sdhi1_uhs_pins also keep bias-pull-up like sd1-cmd in
> sdhi1_pins?  Also, neither sdhi1_pins nor sdhi1_uhs_pins specifies
> drive-strength-microamp on the PG0..PG5 pins, where PIN_CFG_SOFT_PS only
> uses power-source to select the drive-strength table.

These all are uses reset values as it is sufficient.

>
> > +
> > +             sd1-data {
> > +                     pinmux =3D <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_D=
AT0 */
> > +                              <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT=
1 */
> > +                              <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT=
2 */
> > +                              <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT=
3 */
> > +                     input-enable;
> > +                     power-source =3D <1800>;
> > +             };
> > +     };
>
> [Severity: Medium]
> Does setting power-source on PG0..PG5 in sdhi1_pins and sdhi1_uhs_pins
> actually program the SD_CH1_POC register during signal voltage switching?

yes, it programs  SD_CH1_POC.

 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3,
RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
   PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),


 RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
   PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),

>
> In drivers/pinctrl/renesas/pinctrl-rzg2l.c, r9a08g046_variable_pin_cfg
> configures RZG3L_PG pins 0..5 (and RZG3L_PH pins 0..5 for SD2) with
> RZG3L_MPXED_PIN_FUNCS(B), which sets PIN_CFG_SOFT_PS rather than
> PIN_CFG_IO_VMC_SD1:

See above definitions.
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg2l_set_power_source() {
>     ...
>         if (caps & PIN_CFG_SOFT_PS) {
>                 pctrl->settings[pin].power_source =3D ps;
>                 return 0;
>         }
>     ...
> }
>
> Because rzg2l_set_power_source() returns early when PIN_CFG_SOFT_PS is se=
t,
> switching between sdhi1_pins and sdhi1_uhs_pins never writes to the SD_CH
> register at .sd_ch =3D 0x3004.  Similarly, rzg3l_dedicated_pins defines t=
he
> SD0_* pins with neither PIN_CFG_IO_VMC_SD0 nor PIN_CFG_SOFT_PS, so applyi=
ng
> power-source on SD0 pins in commit "arm64: dts: renesas: rzg3l-smarc-som:
> Enable SD/eMMC on SDHI0" fails with -EINVAL in rzg2l_caps_to_pwr_reg().
>
> [ ... ]
>
> > @@ -230,6 +307,17 @@ &scif0 {
> >       pinctrl-names =3D "default";
> >  };
> >
> > +#if RZ_BOOT_MODE3
> > +&sdhi1 {
> > +     pinctrl-0 =3D <&sdhi1_pins>;
> > +     pinctrl-1 =3D <&sdhi1_uhs_pins>;
> > +     pinctrl-names =3D "default", "state_uhs";
> > +
> > +     vmmc-supply =3D <&reg_3p3v>;
> > +     vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> > +};
> > +#endif
>
> [Severity: Medium]
> Does &sdhi1 remain enabled without pinctrl or regulators when RZ_BOOT_MOD=
E3
> is 0?

Yes, this needs to be fixed. on the else case status should be disabled.

>
> renesas-smarc2.dtsi unconditionally sets status =3D "okay" on &sdhi1, and=
 mmc1
> =3D &sdhi1 in /aliases above is also outside #if RZ_BOOT_MODE3.  When
> RZ_BOOT_MODE3 is set to 0 (routing PJ0..PJ3 to JTAG instead of SD1 CD, IO=
VS,
> and PWEN), &sdhi1 lacks an #else branch setting status =3D "disabled" and=
 will
> probe without pinctrl, sd1-pwr-en-hog, vmmc-supply, or vqmmc-supply.  Als=
o,
> SW_SDIO_M2E is defined at the top of the file but never used.

yes, it corresponds to default switch setting.

Cheers,
Biju
