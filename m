Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795519511;
	b=C8nfLQHtNpqPx+hJ49F7aechkRXoSKNhrTD9B/Q3CD38aqWMbjxWQE4ev+RRmFKI0SFl
	 ybQPkmYh/2tEpS0Q0p0i/t7fLPjwIeqSkXiy9jQBuiJu1/kgK1NZiYS2YeJ5meou8lAS3
	 Vkur+Ra5HIuCpCeI0fRM7BQVD/59uT2sIWejclUaH5vJszXvNWc2wtyIarIJY4VQpIOkO
	 Zzljbql6kTkaE3NYkKnr4L6Xz1jvxf8xIvxTA3vNe8mxbimCqJ7JGMQUOw3Je1wKtYAp4
	 H+jx1UGgiT3Lw3/CdSo4PFoAtLFklus6latYwFvK+pesUBkZ7xh01AALBbnsylGmIZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
	b=Sw0TW92QVuh3/DrwzKWmEK+8Xq+H/r055JNrmyNf+Onze7+YL0wZAuebgqZrR/ESl9AK
	 DFY8dQqDUj2Zecngd/oLKiDVp6fc4RmMQsz26wnlGoImnv3Yvv3e6Z+5x1tpMUPa3D9F+
	 DtICLbKzcPYFdHW8RmT+akpfO/96i9l7LugvBUql3QD0ZRAJ98uKQy4JrMtvdvATDf6uF
	 8Yb1xx+/jNKsC3cbtezzKHogfOxxM4ah47zJKLl/nBsS4co6VY5f/mPcX2tthjWSGzITO
	 vAVG4TrdFXBiYqORShCGkKxabFv0BZyQYD51Ff4z/e/i6kk8fcsnAgj7rcG/RRxQC1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQZ4B0Iw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7F606A322
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 11:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C7F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQZ4B0Iw
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53639b8903bso54080131cf.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 03:25:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795519509; cv=none;
        d=google.com; s=arc-20260327;
        b=KXW6luXFJoDea/5F1wcs0hHluQJfvJ9pJgHurPmgDTJU6CxbC97EJBwngBvumOPVB9
         5hUmAPr/8DXJY28jnZ830YLLUpP1iKgFqKU/M5AX0f1HKoMI4E4lqq2Rlpth/npkg81F
         90mYjRf3sl1BCLd2b6y8DAGa0MhnTRgBCEcled6bppYzBKw6iqcbr8YJtqJeMBF586i1
         Z9rb00wNW/c4Jpxe+caW0nxFgh7yBLcilNai1Ij2JQ1AsQZb6mpl50ENraUEEc4xk+Pt
         q+TMjV49M+tPp6xJCnlDcotnfAPrxDVJGGsPkUpZGGVydiM5YgZuJfd1zDxL8RMfLE4o
         BEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=WAXozhJkunygeRfmIzttAVeCeUBhByW690TVzRW8UpwXyZppxSYZUJLyYWkaxEx+MB
         EED7pjuPWULIvcEJBw5PYKm5+Lr2PAeyWPY0m/arSsJ7+RplgbCD9jJQ1NWVbAXEJkTy
         kBGwgzpLmuK3ARvsKuttsRv2p+Cv2Q56OVDb4iNffo0gan3gHLB7U3qldUEnBNBk94g0
         t1nn3tRCtHngP7wtlZCJNmOvlwVe0kDngdXoFRCrilhvY0HB/XhL4Tj6LSJ22GI+lvW9
         d8WI6YlrI5LW6g1Ax26kHdzYuqq/FZ7qYsSdU0kvXJXLN1pbtRXpli8dKI/nUL2vRW4J
         79hA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519509; x=1796124309; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
        b=fQZ4B0IwtYWijgVZ/gM28gdNDrYl/qdS7tQ6aizTD8NTBRiPnp4gj0aGmE23fARN//
         JNfDGYokJ11//33SWLfpUdmNLzHfBH2vWc/Ioa1f9LhsqtwMKebyMih0wa1FX3BfI5A/
         8VlvXkyGF4ehx2vJIBE2idmWuRxxZrtv3LYntFxLcyte6KJJHiSAiR+5W9IdKKA14Zkj
         l3oRfJ+Vb/t88Re4QwqS0N7JleJgx8wzTavkyE7Q1Ug3AFPFtrlrSXbOHncwAqyD+Rf0
         w9JrddCE6LJotmbD/fg2b24Ui4p7EjBmA4/oyBVcZc0nOvC5DDVMx/KeZqDb3Hh8gSvs
         rIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519509; x=1796124309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niLnhqEojIQkgFRmg5OZWjZ1ZFoo3q8YeUc29rlN20M=;
        b=JwkKscwbhRtm5jpRzX7y9RXgJHDN8LIfN3CnhTFMZShMphRxryeBOYY9I9ZZ0Wc3Jo
         oVT1rzfqdOgLX+JHWE0GetS3uWQyQtpVWyxT8ImAF6PZIjdJ2aREfec5wWJ29AmFDQMN
         5AfHxFyZq0DnhaebhaPegMkupuc5vDyEqCeIU1/ZItK/sAeK8FJ91yDmPeAzWk3K368M
         0015eZ8CfJI0aCu3B7QkZQ0Tr/gqeCYKpN3HToW+qHTQPOasI+5LCwCLpKfDiNhHs4sp
         0GhUSFdGcSzulsT0q92KEWfA8DBhLALPYIDRTM026uuqw51X1w3kFzAzm4SU+ft3weYD
         /ANA==
X-Gm-Message-State: APuU4Z+GgU/Z063SemVMB07uGeP+kghPGjtIpmlqzllTnK9MbQIbX++U
	yVodJTQO27tmghlAZVN7cEylRY6KyP9Ugs9RBHbNZmepzuXpUpbBlclRPwMYloDoC8CBi9o+2oY
	8fUWtT59f2CQfjIv3vEWrSFqRFB0xusrQYQ==
X-Gm-Gg: AZFdTZdeuNAO9EFlsOBWDo/a0wXSzMZspTE3RYMqWI2RUmmnClpvZQ4OAIYpMYqP//U
	zah0iau0xuVA+KdXbja+9u34VZzWyn/abnVQli66BdmnFkMqHnViH/Qcs0+RL2PgYcFFcsBuZVQ
	kDjPfscW18/xdQ+tcifUUE1vIofjyMP1a9/jawWfdaJFvX4d0mOkxGzKg/Jw8lWkTxRiZjDUcMN
	oP89JC1cH9owlkNdKEy6A2UUGAekb13p4LUWSQNAdUIrS4KfaWkwibvHOq0QVgbcSuf4zzEqYGY
	84rZmc1XT0R4n1cCFvmGC1BNxKcFxmd898hwEARMpsUhsSli7YOzNCkBl7yxpwX42Lge5kGoo0y
	5oIGz+70SGQvdafIn9us32kFK8sJhPpEF0B/LUJnNHk3i5/KLI1xkSoRFNYGLPY7s6Lqhbg==
X-Received: by 2002:a05:622a:652:b0:536:64ee:73e8 with SMTP id
 d75a77b69052e-55d769c8a8bmr247880221cf.8.1795519509553; Tue, 24 Nov 2026
 03:25:09 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
 <20261123-sdhi_rzg3l-v2-1-bad3a6358849@bp.renesas.com> <sashiko-outbox-229381@kernel.org>
In-Reply-To: <sashiko-outbox-229381@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 11:24:58 +0000
X-Gm-Features: Aa3M54pDTkymqBGURe3Pj6U5WPV5YSKg8Nl2GM3dC_SaLCa0n-aneKX6oiqXn5I
Message-ID: <CADT+UeBxPq-HDLNNgEWObK=CpwJaHh3ss7FyOHQ3b3r5AiWk3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: renesas: r9a08g046: undocumented SDHI compatible,
>   clocks, and resets
> - [Medium] arm64: dts: renesas: r9a08g046l48-smarc: syntax error in
>   sdhi1 #else branch
> --
>
> commit 527fb6eb84a5c0b07ad82e70e9460e0c1834eaeb
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 p=
incontrol on SMARC EVK
>
> This commit adds the SDHI0, SDHI1, and SDHI2 controller nodes to the
> RZ/G3L SoC dtsi and configures SDHI1 pin control and regulators on the
> RZ/G3L SMARC EVK board.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a08g046.dtsi
> > index bb69e5e3528d0..b710f47d3f030 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -1068,9 +1068,80 @@ dmac: dma-controller@11820000 {
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
> > +
> >               sdhi1: mmc@11c10000 {
> > +                     compatible =3D "renesas,sdhi-r9a08g046";
> >                       reg =3D <0x0 0x11c10000 0 0x10000>;
> > -                     /* placeholder */
> > +                     interrupts =3D <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> > +                     clock-names =3D "core", "clkh", "cd", "aclkm", "a=
clks";
> > +                     max-frequency =3D <150000000>;
> > +                     resets =3D <&cpg R9A08G046_SDHI1_IXRST>,
> > +                              <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> > +                              <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> > +                     reset-names =3D "rst", "axim", "axis";
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +
> > +                     sdhi1_vqmmc: vqmmc-regulator {
> > +                             regulator-name =3D "SDHI1-VQMMC";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-ramp-delay =3D <1200>;
> > +                             status =3D "disabled";
> > +                     };
> > +             };
> > +
> > +             sdhi2: mmc@11c20000 {
> > +                     compatible =3D "renesas,sdhi-r9a08g046";
> > +                     reg =3D <0x0 0x11c20000 0 0x10000>;
> > +                     interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> > +                              <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> > +                     clock-names =3D "core", "clkh", "cd", "aclkm", "a=
clks";
> > +                     max-frequency =3D <150000000>;
> > +                     resets =3D <&cpg R9A08G046_SDHI2_IXRST>,
> > +                              <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
> > +                              <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
> > +                     reset-names =3D "rst", "axim", "axis";
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +
> > +                     sdhi2_vqmmc: vqmmc-regulator {
> > +                             regulator-name =3D "SDHI2-VQMMC";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-ramp-delay =3D <1200>;
> > +                             status =3D "disabled";
> > +                     };
> >               };
>
> [Severity: High]
> Are the prerequisite binding and driver changes for "renesas,sdhi-r9a08g0=
46"
> missing from this tree?
>
> Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml does not list
> "renesas,sdhi-r9a08g046", limits clocks to 4 items and resets to 1 item
> without reset-names, and only allows vqmmc-regulator for
> "renesas,sdhi-r9a09g057", so dtbs_check fails on these nodes.  In additio=
n,
> renesas_sdhi_internal_dmac_of_match[] has no entry for
> "renesas,sdhi-r9a08g046" (and the nodes have no fallback compatible), and
> renesas_sdhi_probe() only requests a single unnamed reset, leaving the
> controllers unbound and their axim and axis resets unmanaged.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/=
arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > index 517747aef36ef..e9b7b3280615c 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> [ ... ]
> > @@ -312,6 +389,19 @@ &scif0 {
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
> > +#else
> > +     status =3D "disabled";
> > +#endif
>
> [Severity: Medium]
> Does building with RZ_BOOT_MODE3 set to 0 fail with a dtc syntax error?
> Both "&sdhi1 {" and its closing "};" are inside the #if RZ_BOOT_MODE3
> branch, which leaves "status =3D "disabled";" in the #else branch outside=
 of
> any node block.

Will fix this in next version.

Cheers,
Biju
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sdhi_rzg=
3l-v2-0-bad3a6358849@bp.renesas.com?part=3D1
