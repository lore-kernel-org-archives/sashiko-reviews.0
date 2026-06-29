Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB123F8251
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722920; cv=pass; b=B5frU42X4h6Hp1pXpNytq1lUQNOgxXgG7WeXRot4+2CPHE8o2kzriJXfhR+sJ+8zwCup4o1yJTbtrNxEuNuyNTWodkmOAWFmSprRKNk9sbPMjf3H2Tv4E3CAmnX1Ctw4Qq0xZ4rv50+BVwqNmc3z8rwVOtVv0XYVijeBD5OZWtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722920; c=relaxed/simple;
	bh=vlj9kY1XGfqdtCgT3fZ5VL5CEwYNVtFcBJZbVqediMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIILe9Y8r7InuNBtj+i8Sx6sfhmbusRmvJPAfh1o1twFsFvvNtlYTd4Ll8SJq0776+CCvZ+AeVANXw8DaXAxdKeTDoZ3ZmS79odCyp7zCSq3UNtpOjfXWDd3AlyANi50eo6z+FUa2T0KJ/IsNwha9zfrBkoBPwPGpYr/xWcAQYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SezGyDLR; arc=pass smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SezGyDLR"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7e6128bd9b3so1559796a34.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 01:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782722917; cv=none;
        d=google.com; s=arc-20260327;
        b=iANXAeiqu0xFyOWAFp7kUzPd+x4rcWzQs842PKOyWUsw8RYynpvNF2czWjFBBGZPyB
         WXm2nglNSKAqjsXMWSMUeM4w2zMq32N07FqqcZqXew9rgRLWAkpJ6aoOMzA4UQxzGF8V
         LXlpvUdnKTLLthH/Is2bG1qlwT+muNBMHDvh0ZIQQi158IMTo0eP9S6HfqQdA996Nh8K
         Bj/zob+lrO3Mb/vqVE6du6p7gDSYNtajyYlljI7WVAwpouIZ14N1faBKYEi0mIqfcnwQ
         J812YgssvuFaeFuvLlIplF9nykQh0u/bCIx6k15mEMDIIHlckKaUsIj4fm+GJnV1Qyc1
         hSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aUFVwir31Lt9p8bnST+2MesNqx8N4BFQ0O5QuspoUJc=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=de6qgLqgUl9dUSIFWc6pWOn9mpLkAn1GZa7t/filcBbmsljyqip1dUtUuYeGlKxa7J
         o+tXmEaQ0GF6CTRaDOrZ3wqcVUa9Q1bvGM70dwFbAipMnOkYuijBPqEoEryFq/LtB5IW
         cc16vNe74Ughudh3uNoo1t35QsztOQJuWFqTdpsLKdxBn2Xdd3NgtmWEUE0byw1UlQGS
         J2P8x/XXxEA3BaffUOj2NWwPL4kRr3WQV/eWCOKpJIQHUDx2NHvyRzXyCdCv9HeDytpd
         gev3roUwHiDnu7tJtwkusYgBPzj9jK2p7ngB45yc2kS+zjM2UiDWJiUi313u7lfgNoqR
         zERQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782722917; x=1783327717; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUFVwir31Lt9p8bnST+2MesNqx8N4BFQ0O5QuspoUJc=;
        b=SezGyDLRcaWAddGO+dQ+TC1O78tcarpo43nUH6L6XXzGN7KqRQuMAHzReWxqZ04mht
         rlwBJL5Se0JsAwkCw2o98Or/TMUgP+xN0OsWRWheOWktYuLaY7ad0DXWFliylyxt+j5B
         56XukFSNn34Xbtn51mmil6qHUxvZLCy3yMvlc2g090YhVYFFVQM3JXB7DYjci5NgDBtu
         KohyKFkWIs1akbEs3hLKProEkr7HRWO0wDiMlc3FjuY88dvdK/1VlP6txdcM7n0mKUFC
         iBqMq0BpKHRf6TLO5k0WaPbR5hG5RLDD3v/xPgNw902LdyaCFytvBFKatayRq2t6RM37
         NVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722917; x=1783327717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUFVwir31Lt9p8bnST+2MesNqx8N4BFQ0O5QuspoUJc=;
        b=KYs2V7fu1SzAfH+u6eulW+kIF/QowCz5Q2gPWih5R3ymG3kttQPGuRBgLzQAUcvjro
         937xCrFnlTFIexk5alLltONbtbT3NY2iw23pG3gckzO8LMsrd43MLAzkdoiQhehUQ69l
         hmxBfrLN+oVjlsN3tBPfhhfE1nmRMsfUH6ejIDd0zC1M7u/y9N67VWLORKiZxgnxOHhY
         rimz/vmjqXP+KrzrpKHRnod3NxmzDRQ248qFqsWgIkmAOGDadWEd66UmX1jFuSLQmk9K
         Ef4dGQW2JDY4AWr9fp1jagAb4enoyiYyisnnHhdVffjSzMXBpfYlRxWpebJUQ6HFC3O0
         0n9w==
X-Gm-Message-State: AOJu0Ywubtpv8IzQofGvvO0pkiL6fLhrnEej75I7G2Hwe7iVGcq7o38F
	r/LdQdYmeqzAAiXoRb1DbBZABtf/4nqphH2KzBl+2ZhLAGSH9iqlYk1dZSGS2ETl7URLdvUV2+5
	NDkFFUv51NzDqAQ8pj9vQyFD5E5da4jVRhrPgjwDNClhb
X-Gm-Gg: AfdE7cmf36ov6XRT1y4rBSXudwfwYxPm8jUhXyiilyWk58o+3omVwPirOB7b1RagUnW
	SvTzFWF+pJXWMXMvGuriDga59sVIbQXwG+O9GPOtb8SEka8OwBPJ3Nr2jrVjZTo1TH70N7auGqM
	2gYb1D6hGyOMaebPOVBXceVFay5el7rS7LtZRsu59+eosM0P4XDodIiceAYcrc+DbNWxZ8ZAPeS
	6Iid+nyTOSSlrb8TOAfHLJYLZMHDKUzCghpi/3KdVhJL5NmKDHZuT6JTreMKySsUFWqN9BIUWXe
	Nt6k1HplkvA=
X-Received: by 2002:a05:6830:4902:b0:7e9:b4d0:539c with SMTP id
 46e09a7af769-7e9b4d05cb4mr7597336a34.29.1782722917221; Mon, 29 Jun 2026
 01:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260627225755.1710837-2-coiaprant@gmail.com> <20260627225755.1710837-6-coiaprant@gmail.com>
 <20260627230820.8C6AA1F000E9@smtp.kernel.org>
In-Reply-To: <20260627230820.8C6AA1F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 29 Jun 2026 16:48:24 +0800
X-Gm-Features: AVVi8CfuknIVpEUVONl1MaX488tBt0lHnX7_3hgzJaRxPHZonPlvSzmvsY1S_nE
Message-ID: <CALj3r0iZzrJUiEa4E8jftrZYcPxik7JoCXSt-zSh5c-6jzaQHQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=91=
=A8=E6=97=A5 07:08=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [Medium] Incorrect `press-threshold-microvolt` values in `adc-keys` use=
 boundary midpoints instead of nominal voltages, causing the MENU button to=
 misregister as ESC.
> - [Medium] The WiFi SDIO interface specifies `keep-power-in-suspend`, but=
 its I/O voltage supply (`vcc_1v8`) is configured to turn off in suspend, b=
reaking Wake-on-WLAN.
> - [Medium] The AP6356S Bluetooth UART is missing hardware flow control pr=
operties and the required Bluetooth child node.
> - [Low] The deprecated `gpio` property is used instead of `gpios` in fixe=
d regulator nodes.
> --
>
> commit 13181564cb78799e1d57eb0995588d8e839f22a5
> Author: Coia Prant <coiaprant@gmail.com>
> arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2
>
> This patch introduces the device tree for the Graperain G3568 v2, an RK35=
68
> based development board. It configures the hardware peripherals including
> ethernet, storage, wireless, and power regulators.
>
> Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6da=
ddec9e400458816dd4c57ba807fc3.pdf
> Link: https://blog.gov.cooking/archives/research-graperain-g3568-v2-and-f=
lash.html
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts=
 b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> > new file mode 100644
> > index 0000000000000..221992d6c6003
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
> > @@ -0,0 +1,894 @@
>
> [ ... ]
>
> > +     adc-keys {
> > +             compatible =3D "adc-keys";
> > +             io-channels =3D <&saradc 0>;
> > +             io-channel-names =3D "buttons";
> > +             keyup-threshold-microvolt =3D <1800000>;
> > +             poll-interval =3D <100>;
> > +
> > +             button-esc {
> > +                     label =3D "esc";
> > +                     linux,code =3D <KEY_ESC>;
> > +                     press-threshold-microvolt =3D <1250000>;
> > +             };
> > +
> > +             button-menu {
> > +                     label =3D "menu";
> > +                     linux,code =3D <KEY_MENU>;
> > +                     press-threshold-microvolt =3D <1600000>;
>
> [Severity: Medium]
> Will this cause the menu button to misregister as esc?
>
> The adc-keys driver uses a nearest-neighbor algorithm to match the ADC
> reading to the button. Since the commit message indicates the nominal
> voltages are 1.1V for ESC and 1.4V for MENU, an ADC reading of 1.4V from
> pressing MENU is closer to the ESC threshold of 1.25V (0.15V difference)
> than the MENU threshold of 1.6V (0.2V difference).
>
> Could we use the exact expected nominal voltages here instead of the
> boundary midpoints?
>
> [ ... ]
>
> > +     vcc5v0_usb_host: regulator-vcc5v0-usb-host {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
>
> [Severity: Low]
> Is this using the deprecated gpio property?
>
> The standard regulator-fixed binding expects gpios instead of gpio, which
> can cause device tree schema validation warnings.
>
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&vcc5v0_usb_host_en>;
> > +             regulator-name =3D "vcc5v0_usb_host";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             vin-supply =3D <&vcc5v0_usb>;
> > +     };
> > +
> > +     vcc5v0_usb_otg: regulator-vcc5v0-usb-otg {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
>
> [Severity: Low]
> Would it be better to use the gpios property here as well to match the
> regulator-fixed device tree binding schema?
>
> [ ... ]
>
> > +/* used for AP6356S WiFi */
> > +&sdmmc2 {
> > +     bus-width =3D <4>;
> > +     cap-sd-highspeed;
> > +     cap-sdio-irq;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     non-removable;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply =3D <&vcc3v3_sys>;
> > +     vqmmc-supply =3D <&vcc_1v8>;
>
> [Severity: Medium]
> Will this configuration break Wake-on-WLAN and SDIO communication on resu=
me?
>
> This node specifies keep-power-in-suspend, but the vqmmc-supply is set to
> vcc_1v8. Looking at the vcc_1v8 regulator definition (DCDC_REG5) earlier =
in
> the file, it is configured with regulator-off-in-suspend.
>
> Cutting power to the SDIO I/O domain during suspend violates the power
> sequencing for keep-power-in-suspend and prevents out-of-band wake interr=
upts
> from signaling the host.
>
> [ ... ]
>
> > +/* used for WiFi/BT AP6356S */
> > +&uart8 {
> > +     pinctrl-0 =3D <&uart8m0_xfer &uart8m0_ctsn>;
> > +     status =3D "okay";
> > +};
>
> [Severity: Medium]
> Does this Bluetooth UART configuration need hardware flow control and a
> device child node?
>
> High-speed Bluetooth modules like the AP6356S generally rely on RTS/CTS t=
o
> prevent buffer overflows, but the uart-has-rtscts property and the
> uart8m0_rtsn pin configuration are missing here.
>
> Additionally, without a bluetooth child node (such as compatible =3D
> "brcm,bcm4345c5"), the kernel's HCI UART driver might not be able to prob=
e
> and initialize the module automatically.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627225755.17=
10837-2-coiaprant@gmail.com?part=3D3

Thanks for the thorough review.

Here are my responses to the issues raised:

1. ADC Keys threshold (Medium)

The current threshold values (1.25V for ESC and 1.6V for MENU) are intentio=
nally
set to midpoints, as the adc-keys driver uses a nearest-neighbor algorithm =
to
match ADC readings. These midpoints provide the largest decision margin and
minimize the risk of mis=E2=80=91detection. I have verified the functionali=
ty with
evtest, and the buttons are correctly recognized. Therefore, I will keep th=
is
configuration unchanged.

2. GPIO property in fixed regulators (Low)

This is correct that gpios is the preferred property now, and gpio is
deprecated.
Since this board and the X3568 v4 share almost identical hardware, I plan t=
o
address this for both boards in a separate, follow=E2=80=91up patch series =
to ensure
consistency.

3. SDIO vqmmc-supply and regulator-off-in-suspend (Medium)

This is a valid concern. The configuration conflict between
keep-power-in-suspend
and regulator-off-in-suspend is indeed problematic. However, this same patt=
ern
appears in many existing RK3568 board files and appears to be a historical
mistake that has been copied across multiple devices. I believe this should=
 be
fixed systematically at the platform level rather than on a per=E2=80=91boa=
rd basis.
Should we submit a separate patch series to clean up this issue for all RK3=
568?

4. Bluetooth UART flow control and child node (Medium)

Agreed that hardware flow control (uart-has-rtscts) and a Bluetooth child n=
ode
are required for proper operation. Since this is a common requirement
for similar board
 (X3568 v4), I will address this in a separate follow=E2=80=91up patch seri=
es
to improve consistency
 across the platform.

If there are no more questions, I will submit PATCH v2.

Thanks.

Best,
Coia
