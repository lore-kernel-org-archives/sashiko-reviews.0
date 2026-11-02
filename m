Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793641362;
	b=UMXTJ84RrafxxAwSkx08eAYC39ArM3/t7hzCNQCF9mTV2bKOnhmeKnARZSCFrDx8dl1p
	 Ep9e+Q9gt1m8Py1xe6zAdexi7cO71oz5dsXAfRfD6zpXCrpMk9xSgS8vAOCCTIhh8TbSS
	 rX+0K+K7wsKaUfqL07qsEUwDlKdIkzriOU2vkv4mdp0oOGgRnPdOe7J+Y5PGf4ieF53Bt
	 EGL4QmU07eEN0vU+boSPrBv5u4T+RLTp71yYSsBdC519y5wPaOjFQaP5mj++1RvpMoi5Z
	 m+G7JKHEs6qyYwRwhDlpZqi+gbzov3OErsowl74o5t6uI/QcY09s/xuPfDXhk2llj2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dfZtYrSlMFhP5ZZKCiH+D2bx/dcrqaWgLYnNi4RKbPY=;
	b=t1nlizjYU1ooztlQR9nPBZv3zR7ZLchXwnoJV6TWHC/Nk7xJgOpGMjK4l6fdi+cJJ4pV
	 p0eGvGeHx5Er4DoKPfywXg/Piy2GhLbPhQVH+rmYqwUuTsr45lGv1zyN9hfEayeDtA5t6
	 bzB0hX7afTHAHjTCRqre5zURd3lFqMT95G9mr2BCs1RzRAvao9WmvHfQlqwJU3El+si1e
	 J1uLwASIDUq91+ugTp82kfUTmTSCFS304pBTel12sxX8n7YhH9qivbZ1vv9w7BGU1UUtt
	 ZLJ8cPSqva48LJZzcjlKFw3J6c4HqchlJRi0RkFxO+NoFBlTM6DFzUwaYOlY9wBlyFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DDTfbwcl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.136
Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D097606CEC2
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 17:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D097606CEC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DDTfbwcl
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c2e790c38caso185728666b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 09:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793641361; cv=none;
        d=google.com; s=arc-20260327;
        b=pSlDOrLxGWQCtSKOo7UKX4lqne5ZoReIyXH4h61wSl+crxfX5DFVhG4iXJTEJMItrn
         Mm/ELdaF3I3kNYmqGQ3hdtAKjegCiyQppN6Q/EOIuyQEmhcNyTxFJjLZboB3tDuo5HXG
         IEU27A5utcRFMym7A7COuTygv88Z0e0yhtzs7xjS3XbdPpMVwC+Gr1D68F0G9Hdtddlz
         HN9zvUiZFFSAPr0UfIjn1N2Gi4qFM252fiLmrSNV5gjFC35DICHYjoLVRmdPY5c9fU2f
         eaUDm65TEaLloZ/c3oJWvosJ46Gp2mo2votnnoxrcPkzJT7pWKzqD3ribaBe2DiomQOK
         4d+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dfZtYrSlMFhP5ZZKCiH+D2bx/dcrqaWgLYnNi4RKbPY=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=StOAYt3XOMpdpYlLr1GaDE2K9dxsbBF3qj7oDupiVi5vETM1ltpG6+EMJl5keqi6Fu
         itEwVLnEsvStv8tNxPwsHxO2SoKJjoX834ZiQFYLY7P5fRGO3HaqV33ZjMVyDaKKflUp
         7H9+YR4Lwy4ZgEFx4kojgN8gfcF4OSXB2RtSSvKmUdYjOCXw0rSBu/gcEj69+KLSXbTF
         dggILLS3rVSxyZf7B5MXMtoyj0rK4JPrJ8bGm7zubP0RKEzP4afVfd/BiPeB3DPn21yh
         6KjCTRf6kG0apUp1J/T9DLJG1C8vhvc2y298tAjQkX/yno4KPu7tpfmQqFso2IdG4lKC
         u0vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641361; x=1794246161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfZtYrSlMFhP5ZZKCiH+D2bx/dcrqaWgLYnNi4RKbPY=;
        b=DDTfbwcli+7XI66MwHYkLqMZoJhqx79wY5b9voHMNZ0RFnArBvO7K0j3MEaMzrN/By
         rAiuv2svv9jfLhFN/Ext5EYvj3XBaCRBrwTbckbtAX3iCFbIZS3s/d6pE4DseGOYJ78u
         E/tAv6C1+tWzp7lvtFCvUMNID6BYwMi5BrmfuZpqVS1zZmbr50O/D73KRy+mgx5ZL2/+
         YaP2zoFyhW48/iT2sMhOZA2em3Ac+eTaV2dpw0hn8hht+Hz0aRgLyhLs8BS99B4CprAR
         KzcQZSFurGtEvIo0JfRrzkO8+Px7k3GQ9qgWVGS2I2H0yyc1/ReriPY5ac7Xi5UuuOQc
         UhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641361; x=1794246161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfZtYrSlMFhP5ZZKCiH+D2bx/dcrqaWgLYnNi4RKbPY=;
        b=1fXH6bRT5xoyx5Vnyo2ZdTxOvjiz2Bb3d6bTqZgSgV4c0StVjphMzuM/wdpGLwnE/A
         giawmfcs7gzL31Yb8KcLCHpnWSdeKvEZLZ7h3Mvj4ergJe8AfvJ+mh2mZpMOlMfaxqBy
         /Y5tzRjLkbixbftrA0Dsjy9DcK4qQC8/3Ch2Q/4ugTyB/At8Joiz2j8sZQ7KDICSVJk+
         NCO86shtWVlD5X4BirVBJ44cIefmRTAYRUfaNl8UhAbwV+OVIJiLN1xaqV6nbomWQtoe
         h8a8Q8XmITIV9T6q/W8q1gFDAd9kA3MV0p/7xfN+Ciuih92o3k685VQriWGGBe1YdM6Q
         fSGg==
X-Gm-Message-State: AFq9FYIlD/SXs8MS/3MfVqDromXsA1fojf52q1OE9WH0gNlvn2g1nBI7
	KOWkYKW92081b3qh8ekoOCOIavTL4m/LZoUj0P3xKCWOCnWt/dLhgh7BfUCbyZzH8z7+Oe+yyMx
	QcIw35IDsya54DBvEC6eGCK0V097vCJ5auOACisg=
X-Gm-Gg: AYBFou0oGu98uctkHs/Vpcr0TrU2yNkKLLgJPFyVpsGqj/ZvMYS9e+Gq9aQAgpYUQvd
	m8/+b9NjEmSNqH6LqvLrPsEzDHx57FbPg++HogjW15eGH2r11AW7KOeXthBT0YF+m1+XwdgJj0c
	0NgUFBQ/6fmkMYksmMO6CpIM3Rz0t7VZEk+Nt4xrViE2uJmOnHzzRca2rSY2lstn5XMJ/7M1MO2
	8lxQaFqk44VNo34Ouna0oAz+ldsFvSPzJO+oWi6zYJBC5k8nKfMPY2szUG2xfhukRPq/w/xOuyo
	QMlO6I2OwOW+EkUsw982Prq+Y68UNco2zV59dOU4ZphgC0yG8+TMlm93chvY7iJ8dXzDg2UGmr2
	y0R9BQimY/++OXjijkYpAf0ZMNwzZH5mGEBupXNs=
X-Received: by 2002:a17:907:2d25:b0:c2d:c739:30e1 with SMTP id
 a640c23a62f3a-c4ca7a9fa75mr847426766b.32.1793641360498; Mon, 02 Nov 2026
 09:42:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102171838.2958552-1-coiaprant@gmail.com> <20261102171838.2958552-7-coiaprant@gmail.com>
 <sashiko-outbox-193831@kernel.org>
In-Reply-To: <sashiko-outbox-193831@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 3 Nov 2026 01:42:27 +0800
X-Gm-Features: AclHuK-zSZVE4xA4OiTqJXnTLiSXMquw5uZzwgfkktwguiYBDSKOj8Fr7BfWLyE
Message-ID: <CALj3r0hEMqWA6bcrzhXF-2+6KO5ytzpOfdiVgQ+_SUXy=gYUvw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: rockchip: fix modem power supply on Photonicat
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=883=E6=97=A5=E5=91=
=A8=E4=BA=8C 01:26=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] arm64: dts: rockchip: vbat min/max microvolt mismatch fails prob=
e
> - [Medium] arm64: dts: rockchip: vcc3v4_rf vin-supply change has no runti=
me effect
> - [Medium] arm64: dts: rockchip: vcc5v0_usb30_otg0 leaves regulator_5v_ou=
t unused
> --
>
> commit e4c4248e8e73884f2860befcec1dafef98cd711c
> Author: Coia Prant <coiaprant@gmail.com>
>
> arm64: dts: rockchip: fix modem power supply on Photonicat
>
> This commit changes the vin-supply of the vcc3v4_rf regulator from vccin_=
5v
> to vcc_syson in the Ariaboard Photonicat RK3568 device tree to match the
> hardware schematic and keep the M.2 5G modem powered on battery.
>
> Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photoni=
cat_rk3568_sch_20221116.pdf (Page 18)
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/=
arm64/boot/dts/rockchip/rk3568-photonicat.dts
> > index 4d362f665031c..6a51f97395741 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> > @@ -169,7 +169,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
> >               regulator-name =3D "vcc3v4_rf";
> >               regulator-min-microvolt =3D <3400000>;
> >               regulator-max-microvolt =3D <3400000>;
> > -             vin-supply =3D <&vccin_5v>;
> > +             vin-supply =3D <&vcc_syson>;
> >       };
>
> [Severity: Medium]
> Does reparenting vcc3v4_rf from vccin_5v to vcc_syson actually change the
> hardware power state when running on battery, as described in the commit
> message?
>
> In arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts, vccin_5v, vcc_sysi=
n,
> and vcc_syson are all regulator-fixed nodes marked regulator-always-on an=
d
> regulator-boot-on with no GPIO, clock, or power-domain control, and vcc_s=
yson
> chains directly back to vccin_5v:
>
>         vccin_5v: regulator-vccin-5v {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "vccin_5v";
>                 regulator-always-on;
>                 regulator-boot-on;
>                 regulator-min-microvolt =3D <5000000>;
>                 regulator-max-microvolt =3D <5000000>;
>         };
>
>         vcc_sysin: regulator-vcc-sysin {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "vcc_sysin";
>                 regulator-always-on;
>                 regulator-boot-on;
>                 regulator-min-microvolt =3D <5000000>;
>                 regulator-max-microvolt =3D <5000000>;
>                 vin-supply =3D <&vccin_5v>;
>         };
>
>         vcc_syson: regulator-vcc-syson {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "vcc_syson";
>                 regulator-always-on;
>                 regulator-boot-on;
>                 regulator-min-microvolt =3D <5000000>;
>                 regulator-max-microvolt =3D <5000000>;
>                 vin-supply =3D <&vcc_sysin>;
>         };
>
> In reg_fixed_voltage_probe() in drivers/regulator/fixed.c, a fixed regula=
tor
> without a GPIO, clock, or PM domain uses empty fixed_voltage_ops and perf=
orms
> no hardware switching.
>
> Should the commit message clarify that this only updates the DT supply
> hierarchy to match the schematic, or is there a controllable switch or bo=
ost
> regulator needed to power the modem on battery?
>
> >
> >       vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
>
> [Severity: High]
> In commit cf017fdefcec ("arm64: dts: rockchip: fix USB OTG power on Photo=
nicat
> in battery mode") earlier in this series, vcc5v0_usb30_otg0 was updated t=
o
> depend on regulator_5v_boost, which in turn depends on the newly added vb=
at
> fixed regulator:
>
>         regulator_5v_boost: regulator-5v-boost {
>                 ...
>                 vin-supply =3D <&vbat>;
>         };
>         ...
>         vbat: regulator-vbat {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "vbat";
>                 regulator-min-microvolt =3D <3400000>;
>                 regulator-max-microvolt =3D <4200000>;
>                 regulator-always-on;
>                 regulator-boot-on;
>         };
>
> However, reg_fixed_voltage_probe() -> of_get_fixed_voltage_config() in
> drivers/regulator/fixed.c requires regulator-min-microvolt and
> regulator-max-microvolt to be equal for a regulator-fixed node:
>
>         if (init_data->constraints.min_uV =3D=3D init_data->constraints.m=
ax_uV) {
>                 config->microvolts =3D init_data->constraints.min_uV;
>         } else {
>                 dev_err(dev,
>                          "Fixed regulator specified with variable voltage=
s\n");
>                 return ERR_PTR(-EINVAL);
>         }
>
> Won't vbat fail to probe with -EINVAL, causing regulator_5v_boost,
> regulator_5v_out, vcc5v0_usb30_otg0, and the consumer USB2 OTG PHY nodes
> (usb2phy0_otg and usb2phy1_otg) to permanently defer with -EPROBE_DEFER?
>
> [Severity: Medium]
> Also in arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts, the comment a=
bove
> regulator_5v_out states that 5V_OUT supplies VCC5V0_USB30_OTG0:
>
>         /*
>          * ...
>          * 5V_OUT supplies:
>          * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
>          * - VCC5V_HDMI (HDMI 5V via D5000)
>          * - J53 expansion header (Pin 1)
>          */
>         regulator_5v_out: regulator-5v-out {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "5v_out";
>                 regulator-min-microvolt =3D <5000000>;
>                 regulator-max-microvolt =3D <5000000>;
>                 vin-supply =3D <&regulator_5v_boost>;
>         };
>
> However, vcc5v0_usb30_otg0 sets vin-supply to regulator_5v_boost directly=
,
> leaving regulator_5v_out completely unreferenced in the device tree:
>
>         vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
>                 ...
>                 vin-supply =3D <&regulator_5v_boost>;
>         };
>
> Should vcc5v0_usb30_otg0 use vin-supply =3D <&regulator_5v_out> instead?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102171838.29=
58552-1-coiaprant@gmail.com?part=3D6

Hi,

Thanks for the review. All points are valid and I will address them in v3.

For the High and Medium issues in patch 5:
1. vbat min/max is now fixed to 3700000 to satisfy the fixed-regulator
constraint (min =3D=3D max) and avoid the EPROBE_DEFER cascade.
2. vcc5v0_usb30_otg0 now references <&regulator_5v_out> as its
vin-supply, making the 5v_out node functional. The commit message node
names are also aligned with the DTS labels.

For patch 6:
You are right that reparenting vcc3v4_rf has no runtime hardware
effect since both rails are always-on fixed regulators. This patch is
purely a DT topology fix to match the schematic (VCC3V4_RF is derived
from VCC_SYSON via a ferrite bead). I have updated the commit message
to clarify that it corrects the hardware description rather than
fixing a runtime power-cutoff issue.

Coia
