Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7022D59E8
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336413; cv=pass; b=sGLIyPOVIigHhmYd7HqzO+niCEHviFuH99bv6gIGPlljMyI54bwL1TE9FXrkGJpMHR0GReHdHgzXyn0T51xG2a4bZ42f1KjwKmcT7kuAKmFA6ilKRHCtVZ4y2OF+ahE2q0TZ0BUFfjVifeV00FFJrx95IlqxFsmONO0b+pUgPTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336413; c=relaxed/simple;
	bh=hQga2uJk4te2JdiP7ZPrmbvnNE5x3B3S932BjonzqXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSMz/WP684z6yx8iPCpvQLQa1uFkrFKOb2o4kZxENLxyPCRjBw8cQqU0ESAcQW2MWJAEhEYA2PVGehuJwVejr0wLC9hmoZlqJoGGemib49Ixg9wZsSN0pwB60zWLvVlxQethmzjY720bFMhWjdoANk8dwlCUH5bfelkZk9G0ERk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRLPgsrR; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRLPgsrR"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-745497ac8fcso267909137.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 01:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788336411; cv=none;
        d=google.com; s=arc-20260327;
        b=YrP2yWYwn2aPumHA7xyinmuAk3KBFVUduiIk2ObQF7roMRttpt7ou5Puwl6et9R6vF
         nw+rbBLzXPdJQgnnbh+gVKPQEhFhItZdd85zbi21xiCD2Y/R4QRHTd21jPMr9hH6/Ufh
         +sraHSsiD7ElrRd6B8mmeXG9nAoJcRN53ngQQCMMOlqKtUJqMNefQ0qsYpHj913EydSr
         b1iusf1fyDU3B2OeSZufclGRrWOvnopkSyAyM4EtSm7DPbLCHUjg7IrRvBqkew8Y6Pcq
         MX8Ezy9QYojwUerWsS87CDS365zrVxtkiOPIM97fJCQInFv1agClAjPxOZQGkxwQongb
         P6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeQzdGJUarKKj9Bhwy2Y263pX70GsqDeHRMWxk6xp5w=;
        fh=q2oa1ekct7KR5WHTVsuodzZeNY7MhQ5926J4NNvSleA=;
        b=JgQhZWyfnzDHMbveBFt5DOSP4QXKPgas+iF7eTH+GS5qAri1szAKK4jDd+GWYKiesG
         L0vZXznJz1Nu3LoIZ9PLcWZ4byreNw/GLWMnuxo/SEk5ANlNB9in53YXMdCldBVu8N+P
         bewZWK6kLi4CJsA5tWg5m2keX5NetRUaPhNocM0sCx38jDc7CKuJrsyvrdzLmLPs4JCJ
         HQmKPEanKrshj+W/NZUq1Pyq6WC8/7MQIQDnPs06f8panJCBsgFNXmLnygAiFwPcA4NL
         2cR494mXYXelSGBCPyLh7MVi1DVs9kHvMjpzsrhbTozIAOhp+pqL/QLsDsdudSd+QJlF
         0olw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788336411; x=1788941211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeQzdGJUarKKj9Bhwy2Y263pX70GsqDeHRMWxk6xp5w=;
        b=XRLPgsrRRHMmMfNTFljqHagdwyaIt0PuRL2GRl+aH0tE1CRQWLU3AhWLj9MtADFcgv
         41qM4W/0py2PpVsMOJA1Q2o8ANWA0EZEGsIY533KThLB0rI+opsmX8hGWBnI3Ibf9DzJ
         re3S5Rjk8RJgFVm7ORmKt3G7QG41Whvw/PTatCXBjtonOAE+2CWx0fxx2ynwNfkzYlrq
         /1xPAaXKTQVPYl4mVsll6Jfujs+XEz5iJ8Q/PiQ4cT9sY8cCFAfsPLGICTnbZd+77HV1
         o04OaAkqtJPhfuCptQsevTDVOFP9vku9dyagFsuA4DTY0JM2Bpzksq3U4D+ACF5B5tBq
         ngEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336411; x=1788941211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeQzdGJUarKKj9Bhwy2Y263pX70GsqDeHRMWxk6xp5w=;
        b=ZUbjS//Dy7Ck5mC4tEZEBM8Z7liOPdwOhHm+3inHFKOpVF3iz0ceVyMB7PvFcSqPpX
         soNRdT6Ajhfof7RfLa0iqI+0RWdPEaKCUzMzmDYdbL0e8B5I8p+7+3s/Z/+EXupDv6V9
         I1Dj3JM+3R43aN/0tCDmTzj1Z/4dRJzQfENNi5W5K+rmOBezJk3p+FfYYWEcCSKcbtPo
         iZzZq3dPLqVYt9YYQUryiXBOjBM+4SYfEHZS1XcohrJvfzSLOIaP10cXoW+IafuiDrD+
         jAhCJ3bMKIXhxyuV65kLTq0So5ROk3JSvW1CbBaQTdRpiamG22LKP/ALBgRi9nx4jG+Y
         pzpQ==
X-Gm-Message-State: AFuF++lC8wJjj34yIMDv7IR22i9CcWNHpRSju62gHiCy24JXOgBdKD2s
	sWPMrUpdsVZpcHB5T0yb0FmVbhYHLXjkhZJbv5rZ+CL4oSTeC33qLTw6I0bbl2W3Ahr1t486bDV
	5T4IbwUU6Eok2ufFByE1a77Dpyi+3e6qiN1zk
X-Gm-Gg: AYBFou3SHSI6iPyCGf75Alkj8lysZIpa8GrT09XQF/2Fuf/ZaYF91ko7OyTDIr4MZBg
	rKh4R7lA/wW/nl/GscXd1ylbH7V865kc1ZJm1z+mjzXYv3oGSyCx3FdKPRAYMfxSpJ1DwWemr5S
	LWoWjCEKuQV/BVuJE0iKGtvK6iP0P1v2Wi0tnlQ1AQavDN881TwCoeTU+Jgf8cdmsm7aeNw2XsA
	cRbpgvT4BkRVJ44v2JKcrzytsc/p2GbQDybg2SNgGMeFDXS2TPHxXPFT/fTk2WWq6cALc1hlYkW
	GpLnUXlGpjx+3+/3q4VfG/Q+yJPYGpWcwZqRneUxNoPKWrI=
X-Received: by 2002:a05:6102:38c6:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a1f1c3849mr1045866137.4.1788336410616; Wed, 02 Sep 2026
 01:06:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
 <20260901-anacapa-devlop-phase-devicetree-v7-1-0bd71d2e0105@gmail.com> <20260901123044.80C4D1F000E9@smtp.kernel.org>
In-Reply-To: <20260901123044.80C4D1F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 2 Sep 2026 16:06:39 +0800
X-Gm-Features: AcwNN1V45jvtUIUPmkklS3A0YD1HKbVBaiVqSEvsVzc8mt2Z165gyW50PQxffjs
Message-ID: <CAPBH0A_OpB22HEa9=ZSUyWF4F6LUcvQNrak_4d=pYrRv03gyRg@mail.gmail.com>
Subject: Re: [PATCH v7 01/11] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=881=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] The board compatible string was silently changed from "faceb=
ook,anacapa-bmc" to "facebook,anacapa", breaking dt-bindings and backward c=
ompatibility.
> - [Low] The /dts-v1/ directive is improperly placed inside a .dtsi includ=
e file instead of the top-level .dts file.
>
> Pre-existing issues:
> - [High] Multiple consumer nodes request GPIO pins and interrupts from sg=
piom0 that strictly exceed its defined maximum limit of 128.
> --
>
> commit aa5900d50b8d457379595fa4812e97d97a192959
> Author: Colin Huang <u8813345@gmail.com>
> Subject: ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper=
 to it
>
> This commit introduces an EVT1 development-phase devicetree for the
> Facebook Anacapa BMC. It updates the top-level wrapper DTS to include
> the EVT1 hardware revision file and pushes down several configurations.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.=
dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
> > new file mode 100644
> > index 0000000000000..017700920cb1d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
> > @@ -0,0 +1,1128 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +/dts-v1/;
> > +#include "aspeed-g6.dtsi"
>
> [Severity: Low]
> Is it standard practice to place the /dts-v1/ directive inside a .dtsi
> include file instead of the top-level .dts file?
I will put "/dts-v1/" into aspeed-bmc-facebook-anacapa.dts
>
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +
> > +/ {
> > +     compatible =3D "facebook,anacapa", "aspeed,ast2600";
>
> [Severity: Critical]
> Does changing the board compatible string from "facebook,anacapa-bmc" to
> "facebook,anacapa" break dt-bindings and backward compatibility?
>
I will fix it. thanks.

> Userspace applications and bootloaders often rely on the exact string in
> /proc/device-tree/compatible to identify the board. Could this modificati=
on
> cause them to fail unconditionally on boot?
>
> [ ... ]
> > +             i2c8mux0ch0: i2c@0 {
> > +                     reg =3D <0>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     adc@1f {
> > +                             compatible =3D "ti,adc128d818";
> > +                             reg =3D <0x1f>;
> > +                             ti,mode =3D /bits/ 8 <1>;
> > +                     };
> > +
> > +                     gpio@22 {
> > +                             compatible =3D "nxp,pca9555";
> > +                             reg =3D <0x22>;
> > +                             #gpio-cells =3D <2>;
> > +                             gpio-controller;
> [ ... ]
> > +                             interrupt-parent =3D <&sgpiom0>;
> > +
> > +                             interrupts =3D <174 IRQ_TYPE_LEVEL_LOW>;
> > +                     };
>
> [Severity: High]
> This is a pre-existing issue, but does requesting IRQ line 174 from the
> sgpiom0 controller exceed its defined maximum limit of 128?

This's not an issue.

For ASPEED SGPIO, ngpios in DT is the number of SGPIO pins, while the GPIO
consumer index space is twice that size because each SGPIO pin is exposed a=
s an
input/output pair.

Evidence in tree:

Binding explicitly states each SGPIO is represented as an input/output pair=
:
aspeed,sgpio.yaml:39
Driver registers total GPIO lines as nr_gpios * 2:
gpio-aspeed-sgpio.c:676


>
> The gpiolib and IRQ domain could reject this out-of-bounds request, causi=
ng
> the driver to fail probing with -EINVAL.
>
> [ ... ]
> > +             i2c13mux0ch7: i2c@7 {
> > +                     reg =3D <7>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     nfc@28 {
> > +                             compatible =3D "nxp,nxp-nci-i2c";
> > +                             reg =3D <0x28>;
> > +
> > +                             enable-gpios =3D <&sgpiom0 241 GPIO_ACTIV=
E_HIGH>;
> > +                             interrupt-parent =3D <&sgpiom0>;
> > +
> > +                             interrupts =3D <156 IRQ_TYPE_LEVEL_HIGH>;
> > +                     };
>
> [Severity: High]
> This is a pre-existing issue, but does requesting GPIO 241 and IRQ 156 fr=
om
> sgpiom0 completely overshoot the 128-pin cap?
>
> Since the controller restricts its capacity, the out-of-bounds requests c=
ould
> lead to probe failures unconditionally during driver initialization.
>
This's not an issue.

For ASPEED SGPIO, ngpios in DT is the number of SGPIO pins, while the GPIO
consumer index space is twice that size because each SGPIO pin is exposed a=
s an
input/output pair.

Evidence in tree:

Binding explicitly states each SGPIO is represented as an input/output pair=
:
aspeed,sgpio.yaml:39
Driver registers total GPIO lines as nr_gpios * 2:
gpio-aspeed-sgpio.c:676

> [ ... ]
> > +&sgpiom0 {
> > +     bus-frequency =3D <2000000>;
> [ ... ]
> > +     ngpios =3D <128>;
> > +
> > +     status =3D "okay";
> > +};
>
> [ ... ]
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > index 1fddf3a5d1383..724f4d312de4d 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > @@ -1,1079 +1,3 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> >
> > -/dts-v1/;
> > -#include "aspeed-g6.dtsi"
>
> [Severity: Low]
> Does stripping the /dts-v1/ directive from the top-level .dts file violat=
e
> style and architecture practices for Device Trees?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-anacapa-=
devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com?part=3D1
