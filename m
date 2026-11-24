Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795519674;
	b=ETJGMSo1AegBmW+067Ts0rJ/v/ZMqbr+zmDwW838XYGmHKgoShahiT0Wp3i1wMMyK3VI
	 eLpAsmDls6058XFl0R0cyII2GWMUv3Qt6K5BLbcMy6SNan1sDuMp2kcSzKrQLIoQK079v
	 eppOghwWw6A7Y6uG71b7B+DEk3mPDDO1z1DhaYceANXnlfb/RCZObN2L1pD/RGhhFnXMx
	 UBzUXtr0FyyEK/uWNUEpmZQ8N/xu5t94TZLAfSUHRW5baiKb7kE6N8xj64erfkN0Mp7yx
	 roLrF617MHIEwXcY/C+GgWmdLJCtSg6QOTvTGvQhezunPaEF5j0Rqe+11xDgsLkNfAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
	b=m2l7N8hEC6fAuc5J27k78IMis62FTXmlKbZ/Md/3jOR8e40/K7g5ibr8vd1caqO+W/qj
	 cR8U6SKz9FtkdNxfbHVVQoDamT6g/yEuBku9eEI07qp2Ro9hzh9Dr6j27NKuFtKcAdjyC
	 tW6m2xZK7Cotq8GTWVnLBA4O5qTiMr8gO1bknveNOUs3DLhSd2bPYPTDHi7VkHr5AbEN3
	 Sa2cP65qh+HzyvGnI4LhHN8zRpBqZNT8NVcNoHtXR+j9dS64Q07XQCOT6k2HqmD9Dvqom
	 /VZsOPWJ9zOkmv2o4y5eoqwyA+GasLArRcdfVaKWbYmTQkRhUF7Gc2UeAsRM9P01meg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHFD8eSd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DAE606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 11:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHFD8eSd
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5363316fa0cso47909521cf.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 03:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795519672; cv=none;
        d=google.com; s=arc-20260327;
        b=MNUfW80l8SoIp5+RBLPhc42LnaqcEkl+tcTkjAl/FiHicS4Vbp2eDoTVDx2TgIsiDb
         ayCg2eQZUfPIZzRePDs8tYFGAuDO2zJrppYKS/AnwST338uQSy7/lLnHrr09CPWxXWGM
         7OSVGl7xzOb92s2x4gK7kK/7m8faTE3v+6rA1y7HeMVhlSy42zS19w0+kMVaWQ0r2/XR
         qK68MEwmNmD4FRXqYtDptvkcdBZoKkbdrJOcnj4ImBb1XtJUSjaVm9JvmlFnh0leWpML
         LypGtvy4JlVC7kwrfi5PEbKm2MXJezxNo36KE6kEiL301HQj4SYUCF2ZSZQRiPt8ajp6
         VD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=AjIr2M4dBfJ23u7yWE2as0J2Mb02xMt86l7AJ5cCmvsFvaYrvBctsN2lL5MoRaNLb/
         KbIlADKWaMj0Unz379/FdRGUtEwny3PNW5uS36gFbcRah1Qm4UNM1yVNzYoJB0JPWHxr
         aZBOprpVPfFoTUTzS9ePG1Q61JVEvJFNdAkWqVpZb5HtyWtqld2S3u5cKNGfEzezAWJS
         G9Tz1POwgRKL32J966T9CNF/cUhGpC+JoVMbVvTcRi2Kdm/tHnYKEKGHXP9sut6W2pc+
         dVcvdnCPxs6VywwKReZbQ2QoWxQJ9ZDMe4VXvJ74iTzNwHI+L3dlXNq5zNJKXw1fws5L
         M6LQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519672; x=1796124472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
        b=lHFD8eSdvGC2VgIGP+BwpsInYjfl6hAgGd9716d/w1CoJ12TZ54sNpmC1jYdhvh1rT
         EEwHeysowpYC6+bumcuZyLajgJVriMSmiAnR/Bns4UsmAtThlC21w1jta+/aXHt3yLao
         jGHU4fLTzFwQEzbCPnTcgDH8Z5w69StImI38CW16FaKGMBxJhg9bmUBKLhSrUoBCxmRo
         uej6mF5pvPnvT4y9q0DRzwBWs7X4XBN+Ul6t13n0YdqVwdJ+wtV1Jv0XITCwtSe3D44D
         RqGv0fnCJ+LoHXQ3ha709LEyabnAA/HEsOFr9BlVJah17zKD+SGEQLyTFgBqj1DNPtS9
         +Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519672; x=1796124472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
        b=IFEEd07EAqG+ULHRN3IKW47mKrw8BlHX2Czk+p/dBkj2s6s7Tm4deg8ee5pR2lFSJ/
         PkGmg6EaipCu1kSdNN3H5mB6XfY6uYQoj7L5ZJWsfjKp8JvBp7c8fCZnv4BUktYvwVY/
         dTHXJIrTC1Fb1bJpiH9s/5pkvB7jraokDqBRCsnCbjQmg/TDZKsCicbuK6ukDV+BDKVP
         kXM2LwR2KycbNL/MSusHj53e96bFwYOb4SgxSjLz8zNN+t7rRNssaKXe3dU50XozTni4
         z/PisznGMHl3kcjAOLQGrWtDMhbKH/W3vqmrJvyPp30g+7Bjwfn1dlnU2VZDiMnaQrNV
         51MA==
X-Gm-Message-State: APuU4Z91B8bi/lSEfJJSrcXwjXSWmg5Jx0YShRrN1x8AWkILrtBIfiYI
	UjdtfC5Ux8CyXwCimAEtUNiehcNx5TGnDQm3JqvHFhg2+MEI8okPMjyMsZmA8ad2BHrgT/e/WJH
	hq693PHRLxZZyAr6I1oeEyvhQlhHtxhTreg==
X-Gm-Gg: AZFdTZev7EHapUMl5kgxSKGdxXRgEfByDvh2ZQr/z9noHsztCCxI51ATiMkGNtuHXVb
	vKHT05gVtdSbdBjHGaxGc8p/hnAhn5lW0bzR1jv1kwBH4At3d6QN4KXgsoBtuazEmF73BWdDD64
	kQrx3O5nQW3Sr/YzKJXR8cWnhVHsvgLdRQyVkJtWqWGaX9WXYVU5yY+fmDrP/RMgBzDP/Uihqga
	kCfxyAynrYA8syuRWyOO0/leFVFCv4t0HrVzfv37IWSeMNIJ/0dpnTqSZmRmja8QYwtodyG47bt
	p+c0gbp3lgFzlY3mNMPG2yHyR/U/JRmN84+9q98hbl5SpPTboKbDLZ83ddm7CTCj7v4ZmlNq/Xg
	uD6rPHx8wpW9JRhwJkVzUSIuP5GxwXz9qMFAmmURxGig1b10jxNwzUmj3Nfu1w9VMYkFMjw==
X-Received: by 2002:ac8:6906:0:b0:535:2283:20a3 with SMTP id
 d75a77b69052e-55d76a1f731mr241074461cf.33.1795519672518; Tue, 24 Nov 2026
 03:27:52 -0800 (PST)
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
 <20261123-sdhi_rzg3l-v2-2-bad3a6358849@bp.renesas.com> <sashiko-outbox-229391@kernel.org>
In-Reply-To: <sashiko-outbox-229391@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 11:27:41 +0000
X-Gm-Features: Aa3M54ppbsJLM4wVbJ_c7D0B6fZzE35d4EIHnXGoFNEoMK2kWDjqihyiCCRU6Sk
Message-ID: <CADT+UeBih2phy7qy_DeUtCdhj0QJQjfRco8AKWZn9NbRWPgM=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] arm64: dts: renesas: non-generic node name vqmmc-sd0-pvdd for
>   GPIO regulator
> - [Low] arm64: dts: renesas: misplaced closing brace in #if
>   RZ_BOOT_MODE3 around &sdhi1
> --
>
> commit ef8324be968fe270658aa5eec8f4516a9acb1022
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
>
> This commit adds pin control, regulator, and SDHI0 device tree nodes to
> support either eMMC or an SD card on the RZ/G3L SMARC SoM depending on th=
e
> SW_SD0_DEV_SEL macro.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/=
arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > index e9b7b3280615c..3699712d8bf1d 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > @@ -9,6 +9,7 @@
> >
> >  /* Switch selection settings */
> >  #define RZ_BOOT_MODE3                1
> > +#define SW_SD0_DEV_SEL               0
> >  #define SW_SD2_EN            0
> >  #define SW_DPI_EN            0
> >  #define SW_GPIO4             1
>
> [Severity: Low]
> In commit "arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC =
and
> SDHI1 pincontrol on SMARC EVK" earlier in this series, does closing &sdhi=
1
> before #else break DT compilation when RZ_BOOT_MODE3 is set to 0?
>
> arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts:
> #if RZ_BOOT_MODE3
> &sdhi1 {
>         pinctrl-0 =3D <&sdhi1_pins>;
>         pinctrl-1 =3D <&sdhi1_uhs_pins>;
>         pinctrl-names =3D "default", "state_uhs";
>
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> };
> #else
>         status =3D "disabled";
> #endif
>
> When RZ_BOOT_MODE3 is 0, status =3D "disabled"; is emitted at top-level f=
ile
> scope outside any node, causing a DTC syntax error instead of overriding
> status =3D "okay"; from renesas-smarc2.dtsi.  &sdhi1 { ... }; should encl=
ose
> the #if RZ_BOOT_MODE3 / #else / #endif block.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index 91b2d0d431045..e64a611aebecd 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -78,6 +83,19 @@ reg_3p3v: regulator-3p3v {
> >               regulator-always-on;
> >       };
> >
> > +#if SW_SD0_DEV_SEL
> > +     vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
> > +             compatible =3D "regulator-gpio";
> > +             regulator-name =3D "SD0_PVDD";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
> > +             gpios-states =3D <0>;
> > +             states =3D <3300000 0>, <1800000 1>;
> > +             regulator-ramp-delay =3D <1200>;
> > +     };
> > +#endif
>
> [Severity: Low]
> Should vqmmc_sd0_pvdd use the generic regulator-vqmmc-sd0-pvdd node name
> instead of vqmmc-sd0-pvdd to match the Devicetree generic node naming rul=
es
> and vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd in r9a08g046l48-smarc.dts?

Will fix this.

Cheers,
Biju

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sdhi_rzg=
3l-v2-0-bad3a6358849@bp.renesas.com?part=3D2
