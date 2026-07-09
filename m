Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217141C313
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 11:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598284; cv=pass; b=d1W3f9u/TtEzNU+Q0kDqZvakhhrtljWu3G6BlNQhRUDL1E366WE1gfrufFquxBK42kIJNq/rinXiBJoKiCgi/W7hm4lsopmHrGyrMSsb+b2xzUEh4SYFxPHcsAJMHYpqRgOt8PGPAV649O9v7biIrlMAbCN2q4SFImzpLeDBsQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598284; c=relaxed/simple;
	bh=Zms1S65LsMRFGo2WadrcJ4wjEPu5Dm9PLijmLJn1DUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwK8JW1Uncadc9WeSZt+ySyqoruR6nu3cs5FZ8HsA2XXPhzXl6/tDHMndBCqMYgwZvUbps1VFgYUsTTSqKyzwDU2aNFZGUryVswwKLJFEL0xDfAKj4xVLd/j7KGh+5T2PVyzOMdAFDMn1Fi0iOZ7YPCHOTsGdxUxc1Nsl5WU6n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Q94lQuN1; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Q94lQuN1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15e2937e9dso95965166b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 04:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783598279; cv=none;
        d=google.com; s=arc-20260327;
        b=Hk58mujwKNXt9jd/FnoGySBmEMUT/Halb5FbLY7VwRbIBN5vqYUe37v5vSKGV36g/E
         Bun30q1rYgDHfT4bVr7RStlt+9s/VHmSTOFRzAyiWazzhTSzymntOO9KFZ3rZek2VFgD
         rEZqLe7jmBg+71pM9Yah2z+8qDn7mkEo3eYl3lWnLoydJqJIvQrTSYYXGi9siqfys2Jh
         b8Y7alpHE0z36TfJw8hvxoWJbFzIQfqR5rLmaeC7QsWbtYhopDjNL1Sv7NPxKiRe1jtB
         gwpOXJf0z8XKQjTYRVzsmLMwpe5tTdje7vEI5aiB6TtgqEi35HMwKy6XboatYJ7VHZNY
         vPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Lc5fIJ5fx5B/pbye1r+zNH46BLjKugiwBq078pJoIY=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=aoW4Wliu9NJruI55bZuqkn3ADGx09HxKjTPFDOKAg5kEcm3b+B4HVrhFuMgVkBXmgP
         kLWdUel9hw6QaAnE93K66eH3yYvekMs3wamOoMequRlZuChwPOluYO1pgnDKGEwryZTv
         LAvU2Sn3fApjCcwRKGKASX3UtSk98Txd1v5ogCVCgaEseurkM86A2yjRsvQYBM32luu8
         Aa1WDjkjHDVGwvYqAQZcOQ+eKbzgLC5y3EqGgWdbV3xNOD4i1O/Zh6oFjBtWXjA60+3z
         xQiXDXpKiOY77JDZ5y5WOv1vHb+YLi6I04GtNUcfbdFlPEyqFjHRtjyCeGnX32eZEl0x
         06xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783598279; x=1784203079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Lc5fIJ5fx5B/pbye1r+zNH46BLjKugiwBq078pJoIY=;
        b=Q94lQuN1tE+QNsDT58nkZeZx8p6YTd/7TA4MXCskH5MktXbmoL1l2RSU4/x+wxxOI5
         /8iIl29058pzoTB+W1wLpdmiPZ1bBBqLvEtk8w0X20ZKCbbqzv1YMDk5akkJxibchntS
         77qTPxnGBHVgPctxiUHHYj8FL4qrwTmgpf2NWuUsA8GenqG4wtHPydqhc8YRiMadyRau
         8aKXiNO51rVEKHnTTqFopOrO3oqXOT3vw8eQHpy2Wx4qN8+Dlxldf0YtxNCw6UAFhQtr
         GnCUR67+Z34WrT+F7/PP4JcKxMXLD18gjhqAJVPP3wmMit6L0i5fu+s0C8jJoppBu1cN
         U8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598279; x=1784203079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Lc5fIJ5fx5B/pbye1r+zNH46BLjKugiwBq078pJoIY=;
        b=nnrMSDClAZMlhE1rYla72qzx57CTSMrLu0dgKtvKrxTrc7UlMWGFaQ/IIOhUW+XPQt
         5rCFM3aZTMRGT4PI0z+7r/SQEWskgLMbUSqO9Rs9V0+lCIAj1EBm5omXTkXhdGiSm7dl
         nv9R5ZA+/uvicYaz3Ii8kwWsKuaYTQwVtMeGM1ZA0IIr36PZzYp1OfcBuQdKitA8oHSB
         19qNBKRyHLe36HhEjbzX4qM3BJaoPUYMbfYnM14V49Oj2MlUle+PJm8BvOPQtj8jXDUN
         /aq3fyoW7qX5G/Pl5ZDZr1gsbcTArD8mPTEHweXgkTa5HU24VmmhaKgp6x5H0+afPL9a
         Fxbg==
X-Gm-Message-State: AOJu0YyJWRmO1ECLEryrXWlXvoHLyiaCKR2lFs3GfUkBw2B9Dp8xIfmK
	4ol2m936sLm4ayy9K/BbhLPrskCqVdHYsH1OFhOhdZPCkx04aTPkJSRLM+Xagsgc/4AzI7MCl44
	6TSzi3lVtDxjeyKEoBV77PaVUQBNLkcRuLkWr8+rJbd55P+iMcxbR
X-Gm-Gg: AfdE7cl+MyP4+VnDG0ZT7xyesYBLFiX+bXIuO2J15/2KVkO+2G+D0xh7E+sDnhhlFqn
	YIgXFR9Qm1/MxZhB8KAC0indXfwGxztOcDX974ugB00eh55MDExZ1dQ7ZA1f2boTIRA/g7PkNnr
	uc6CZzRA632C2QASLNCK9YTc9C10glfTjMsJqFAY7Hq73dlCO/KXidyPRiAIPQza3KDEb85P9m5
	IzLIqmoZMr5NwM25ULgOwMfNAjOiiScZ7Kieb89Zcpv9uHZMXk44NiExUpjlp9eLx/KRblKcxEQ
	UINkevcvByOVp3biAO5Kg+NsytPmR//eK7e3lB7+QdpBGpBD5m8=
X-Received: by 2002:a17:906:8d8d:b0:c15:cd54:e026 with SMTP id
 a640c23a62f3a-c15ce144f5cmr335284266b.31.1783598278968; Thu, 09 Jul 2026
 04:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-6-robert.marko@sartura.hr> <20260709115011.D920B1F000E9@smtp.kernel.org>
In-Reply-To: <20260709115011.D920B1F000E9@smtp.kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 9 Jul 2026 13:57:46 +0200
X-Gm-Features: AUfX_myDvdrO3OyQghqyuoWYPe5PO0-J0F84lshRH-WnbjqKgWEOiROjSluu8z4
Message-ID: <CA+HBbNF2t4GKEJCDRHh5wMxRTK4hXugPcoX0P-Utt1N34E6j4A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `qspi2` node is missing `dmas` and `dma-names` properties =
(unlike `qspi0`), which degrades performance to PIO mode and causes the atm=
el-quadspi driver to log a spurious error during probe.
> --
>
> --- Patch [5]: [PATCH v2 5/5] arm64: dts: microchip: lan969x: add QSPI no=
des ---
> commit 297e92dccc7e525621a995eb1402956ad591b3bf
> Author: Robert Marko <robert.marko@sartura.hr>
>
> arm64: dts: microchip: lan969x: add QSPI nodes
>
> This commit adds device tree nodes for both QSPI controllers on the Micro=
chip
> LAN969x SoC. It configures base addresses, interrupts, and clocks for the
> controllers.
>
> > diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/bo=
ot/dts/microchip/lan9691.dtsi
> > index ed997d87dd09f..a8541c6a098d1 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
>
> [ ... ]
>
> > @@ -396,6 +396,39 @@ clks: clock-controller@e00c00b4 {
> >                       clock-names =3D "cpu", "ddr", "sys";
> >               };
> >
> > +             qspi0: spi@e0804000 {
> > +                     compatible =3D "microchip,lan9691-qspi";
>
> [ ... ]
>
> > +                     dmas =3D <&dma AT91_XDMAC_DT_PERID(1)>,
> > +                            <&dma AT91_XDMAC_DT_PERID(0)>;
> > +                     dma-names =3D "tx", "rx";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             qspi2: spi@e0834000 {
> > +                     compatible =3D "microchip,lan9691-qspi";
> > +                     reg =3D <0xe0834000 0x00000100>,
> > +                           <0x30000000 0x04000000>;
> > +                     reg-names =3D "qspi_base", "qspi_mmap";
> > +                     interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =3D <&fabric_clk>, <&clks GCK_ID_QSPI2>;
> > +                     clock-names =3D "pclk", "gclk";
> > +                     assigned-clocks =3D <&clks GCK_ID_QSPI2>;
> > +                     assigned-clock-rates =3D <100000000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
>
> [Severity: Medium]
> Is it intentional that qspi2 is missing the dmas and dma-names properties=
?
>
> During probe, the atmel-quadspi driver unconditionally checks for dma sin=
ce
> aq->caps->has_dma is true for LAN969x compatible strings, and then calls
> atmel_qspi_dma_init().
>
> Without the dmas property present here, devm_dma_request_chan() returns
> -ENODEV. The driver handles this with dev_err_probe(), which emits a
> kernel error log ('error -ENODEV: RX DMA channel is not available') becau=
se
> it is not -EPROBE_DEFER.
>
> The controller will then fall back to pio mode, degrading performance.
>
> If the hardware supports dma for qspi2, should these properties be added?
> If it does not, should the driver be updated to avoid unconditionally set=
ting
> has_dma to true for all instances?

The datasheet is quite conflicting for QSPI2, as it sometimes
references QSPI0 and QSPI2,
but then sometimes references QPSI0 and QSPI1.

DMA lists channels 17 and 18 for QSPI2, but it also lists 15 and 16
for QSPI1, which does not exist.
So, I will drop QSPI2 node in v3 until its clear which DMA channels are cor=
rect.

Regards,
Robert
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709112006.39=
0742-1-robert.marko@sartura.hr?part=3D5



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
