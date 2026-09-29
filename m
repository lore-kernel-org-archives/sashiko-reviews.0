Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38F526A9F
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686942; cv=pass; b=YZky3o76KbTyIzz2k07ppyz47GYzMTwEAhw0WDH3eEyorSlkfODAb42Wd247KR/E8RrZXL11SIRAZxjboi5QYXySMBozBT1vgiu9ojQc94VVMayxKxm69NFAkPNAiNbr1/qIpnFUyRZxNCVwvlaA5YPF2du9bESSmOTkjUbbe2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686942; c=relaxed/simple;
	bh=h/dEkLgDNm8kwSpMuXoRiZdMMmblme/cWbeX4MOc2Lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAPQv5wZc8DQVUQz2L+8xUmCaXSlk48A52R5sJmhLR70/LlGRPk/5Ic1zox2JljlSMo9xNAYQbSO4KYQ0C148uMUpXzWqUVgt+oOlr1lDfZCsblzprIdfijpXKq0BEu6KEcDjJWWaG3JZeQIsRk8LwEYD3yYjOTR7QsgUmU85p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf9pd8rd; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf9pd8rd"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e7d0e42662so1198457b6e.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 06:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790686939; cv=none;
        d=google.com; s=arc-20260327;
        b=EStb7DdXSBQZS5ErHmgfI54pJXU10afMzxwlLBkJEyD97TeFIduUyJc/hXkMlp1ngb
         6KW8wfZL7GOy6dAVJPfb4MrpqzGxRyN4oxMhV51YFG22iJInePkayF1rB8XuIpILYnVd
         1VGTFUaVFYq+t5VoBqrx+UMC5fVw25AjqedHDYX4JzFVvB8LxX3Ua7uTeZMUzHQh0KeI
         D9LraG8tCzJSNI4lFdrP7s/bWymjkNCu8Is1xSHEHMNElnD2i1wUpF6U9jxijHdUrqUS
         rhFCiRnRIrq4nvqRDclcM8+GD5Esfj9q5B1wU4bBUtm7C0WlwojN6qHx1Qo7s8kCCeSl
         3C3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zxgzqfnj/lyafXYZ5m9OtdVoRSskQx5b5evxTeWWCXQ=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=ZZMZB6vqhZ/dOMoVnXONV8J1HP176X9+DR6qgGvyYAlVE6XTCKbmleeIiz1KT2bBr8
         ZbAfoakX7xm/ZDcTFAQpH8bhdZqD/euDLBA+Q75Dpf0PhF2Yrt25c/nYm3PGBgT01j8v
         kO2pOEE1nIXpaLjaKABncjxWKZPrkC66fIGVxFkqbw9FsMAHBeuJfNICqsr9Ph/XEuGA
         LI5+K/oyhTuMurr6Vb6HRVNbgkpUlDyw2BfPDOxrOQX6QS96vewGQd8yKeb63huk0rlf
         3tBJRv5wW6FUTlCqOagQJ0X60zQrmvVPSWn7rEPAReXinnyq+/F6ZEq+uB4oqk+Vimmh
         vU2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686939; x=1791291739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zxgzqfnj/lyafXYZ5m9OtdVoRSskQx5b5evxTeWWCXQ=;
        b=Lf9pd8rdFUpCOoFLW4m1MJ9cht7gY8Y0zl4470LJI+AevNddgq9NOePR3TrU3c6muO
         Kf7n4MPj2GFGbrs9XAsnciTbAcs3fJg7P7xu5IiRiUK0tR3f6FSE2AHMCafSmLDrPagH
         oWQ+bAmSYfE8E+I3buSFBeav9DOvTbxQntPS4mrb7q4WF5BjDJkknDonbwSVDKITXMMS
         /vyUz1dK6czmnAHAH76bhcaa8okuyd/YihD+BLB6YF8yS/pPiDwyrjH6vzew/5xzzAWz
         IoA8JmCvG61JKNw3Nuob1yBUE7zEaym0gGkQ+eaKcXcitDOWICvSbV5qb1WJJ+8ropkC
         Gp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686939; x=1791291739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zxgzqfnj/lyafXYZ5m9OtdVoRSskQx5b5evxTeWWCXQ=;
        b=nJAkN9MRXJS+DoV80HzDqdXDfBlf0XDqdcmKsKT1M7Gcg5gAfwLYFPbjPgoS4lLU7e
         p3/GaDtmbWqHzwrJGFsnCnyA2wJvtixiwJfuwPQ0NRK7ET5qJb+ce249bhubZ8YOlvse
         LNcHNfCvaQ63iD5uD35Fh5BVIzdXZoXzNW6+H+PUZQeMd7atdu8A/GZ33uYy9E9OiTwz
         /bxMIKSpyOO7Muii80AcwFfcN0NAhTNzdz/u5pG38UE4dGNhNfNUKuXQjseZTvfYYP7D
         9eAUsv/QjSqYK7gAmXgX1xLp0bSD6c+oGcy9f3R+mmeOZsodueXcGp679dg2QKLEsOCK
         isbw==
X-Gm-Message-State: AFuF++kHTh2g7vJupldwC641ETD1LzTlcZWpDehBUF3IEc4yHOAaS8Bj
	DF09lvyZq6JApo0mU94MANRgfYAXqvcdUMKnpWY+xocR4za1LrGKaPOl+VCJKA+kM/P9mRMT64M
	kZOi7S1rPHrrktEeJ5ihJuVnontXebpxhpsat
X-Gm-Gg: AYBFou3o586lHd3UMTe6q/NLXTFksRMrauTnNQJXYut/QySzQfhHjxSvcDRO2SrCep2
	0GmkYFFGqnVAC+h9kRWOsg+xOFozcGGKMIc7de262k9Aadvldp6NCbKaCXu+dS0Zs414jPQmdfV
	iQBZwJChbrRC9gH0r8MRU8xnDRjXW+vYXVmsb4VLdS1ErwGjsD0I7Bd+wW8BwQkPakShj9a0YJE
	jxEsg2uQihFZmhBFgcI074Z8IMEdxD+GE2fjkBOGT8QadCyeoMwywOK2pAgmsHZBfWAZKUjemsx
	qKVVmrtRil9eFY+lUBQCKmLryKd2giibLVqwcBE3sLpnZtXu1wpK6uIP
X-Received: by 2002:a05:6808:124e:b0:4c9:79ae:2709 with SMTP id
 5614622812f47-4d72c7397b7mr14370723b6e.41.1790686939184; Tue, 29 Sep 2026
 06:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
 <20260729114312.3947300-4-chou.cosmo@gmail.com> <20260729120805.F38E71F00A3A@smtp.kernel.org>
In-Reply-To: <20260729120805.F38E71F00A3A@smtp.kernel.org>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:01:50 +0800
X-Gm-Features: AclHuK-lEiHYHxmzMLkU9wIMTNELJBsJ9PeC1ucIrEY7bGueerJBRBa8vOcsNbQ
Message-ID: <CAOeEDytOgkz-vLPCAHpVLDnx85oGA8d3vfjssO0PBBRQqUK1vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second source
 PCA9532 LED controllers
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 8:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The alternative PCA9532 LED controllers use incorrect GPIO activ=
e polarity flags, causing the LEDs to operate inverted compared to the prim=
ary PCA9552 controllers.
> --
>
> --- Patch [3]: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second sou=
rce PCA9532 LED controllers ---
> commit a1677ab804733ff8d7d1bbc1ba314032d50ddf82
> Author: Cosmo Chou <chou.cosmo@gmail.com>
>
> ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>
> This commit adds alternative PCA9532 LED controllers at address 0x66 to
> support boards populated with the PCA9532 instead of the primary PCA9552
> at 0x67.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > index e1fa3a18ea5cf..3da1cf9bbb990 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
>
> [ ... ]
>
> > @@ -86,6 +87,66 @@ led-7 {
> >               };
> >       };
> >
> > +     fan_gpio_leds_alt {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     default-state =3D "on";
> > +                     gpios =3D <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;
>
The polarity mismatch described here was a bug in leds-pca9532. It has
been fixed in mainline by:

  commit 65a38a28a0b0 ("leds: pca9532: Fix inverted GPIO output polarity")

With that fix, leds-pca9532 maps val=3D1 to high-Z and val=3D0 to driving
the pin low, matching leds-pca955x. The alternative PCA9532 nodes
therefore intentionally use the same GPIO flags as the primary PCA9552
nodes.

> [Severity: High]
> Will this GPIO active polarity cause the LED to operate inverted compared=
 to the
> primary PCA9552 controller?
>
> The leds-pca955x driver maps a raw value of 1 to High-Z and 0 to Output L=
OW,
> whereas the leds-pca9532 driver maps a raw value of 1 to Output LOW and 0=
 to
> High-Z.
>
> Because the two drivers map raw GPIO values to opposite electrical states=
, does
> this flag need to be GPIO_ACTIVE_LOW to produce the same physical state w=
hen
> logically ON?
>
> > +                     label =3D "fan0_blue";
> > +                     retain-state-shutdown;
> > +             };
> > +
>
> [ ... ]
>
> > @@ -162,6 +223,24 @@ led-1 {
> >               };
> >       };
> >
> > +     sled1_gpio_leds_alt {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     default-state =3D "keep";
> > +                     gpios =3D <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;
>
> [Severity: High]
> Similar to the fan LEDs above, does this polarity need to be GPIO_ACTIVE_=
HIGH
> for the PCA9532 to output the same physical LOW state when logically ON?
>
> The current GPIO_ACTIVE_LOW flag appears to be copied from the primary PC=
A9552
> node, but due to the inverted semantics of the leds-pca9532 driver, this =
might
> result in inverted electrical signals.
>
> Does this polarity issue also apply to the alternative nodes for sled2 th=
rough
> sled6?
>
> > +                     label =3D "sled1_amber";
> > +                     retain-state-shutdown;
> > +             };
> > +
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729114312.39=
47300-1-chou.cosmo@gmail.com?part=3D3
