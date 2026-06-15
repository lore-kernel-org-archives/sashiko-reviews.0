Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9D3F8220
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532825; cv=pass; b=si0gEAtEat+kBWBhMtCvowSoMTOrnbyARD9QL3ZmJyJ8lVf6sm5EsPgzwEohsg5TYH3lWFw2G6rNfkO9udJGDQL1HGv5w1Tp2Oimy6tkmvJEmtbL5fbIhhw0dcaQ5pNVFeo0HU1KgR3FzpGLfOo6XvyXcgFhTBPC27MSb5PcHCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532825; c=relaxed/simple;
	bh=cVelw7fcNjmAbQTMBjtUEr4ud5VagRi5XfNiWdZvSlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJYRuBNzCY3urdG3qve8VB+G61nKkf9ili2qYT8dESISg1oNMMs7pRNOD8gcb5cm/YDwGkhpJ5Ji9jiHEBP+VyaU3POBXn7X/gQ2SxshbGxKhRN51XN/+X8F0CAsuuOW+z6RSCO3PUbAYEfg9k7lVybXkE+RQMwWSZ3w/OWELNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8AwneLu; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8AwneLu"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6606678420bso3410404d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 07:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532822; cv=none;
        d=google.com; s=arc-20240605;
        b=S8aI3CpzHsUZbfobXloys1tyH1+3vlcXQP7qEuKEus5Nd3mrhFA6z8U7BxHxb5YvNo
         nm+/uGB4UO6p7Ml2o89Z2y25rEzXmuMKx5DeFtAtn1ycm0C58v8Q3W0ETNzoY0RzgMLg
         vSSYkkUoyRw4Q7P2YC9AqWw9hIhGX/LMmPEjuG5r+m0qGunI/ye4RfZfULp8gIW0DMRp
         Jqgi5RfjIHufzI6sXMoG7Y0hz1L3yWKL2hqDMUXH1A7ybdLXV6vq4QRf/F51TabmkreL
         Vj6tL3lBhwl2+8FisGYrrdbNQoGy6CUKqgLuN/1/1eKNI3eFYXdgIbhTADYtl/z4soff
         /Xaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LgSe2jgByuUbVfHsyZ6zz3QwRmw592U5GGdlEu1FoPI=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=b0xrBLfoD62Aod7uJchpNtge+Mt+a5VizumgnxO++574xL1P2h5oPqtbn3eYj8stTH
         gNGnf6i8utZ78YZfknCScP8NSX0dnL14N1qDDZihqzl8Io+PPEsciCvs4MAlmzW7IFyl
         AoUKCIYwLnPxnmWpQHihE5LiJd5R81Tpoiv1pxyIqZPHK3LfTMv/MeHyIn8lSpzJ+Mtx
         L0IO+ObTAVf/ATu2c6VE30pwcmFvx/QDQN/CbUgoNHAzOqm0NO3Ma8qTTFQOi4EwKm6V
         E90N/aREAmLrfiOQJJ5aZOJGJ7vkz/CUNJZ7D1nS2D4v+P44/ljDAcDeHh2RBJWBaNbh
         2I8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532822; x=1782137622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgSe2jgByuUbVfHsyZ6zz3QwRmw592U5GGdlEu1FoPI=;
        b=X8AwneLukUma9AVzvQd6XKpFhWSvb6d5i4TCwvDpcgKrDorIDUoHw2hkCVE3FvkTAU
         3EyVsfT++bisXvCDQAykBw5NqsVfZZrSdnbAY5cP9U3nXU9Jf/YkF8iYQu1eiiO5tPEr
         0BPSWZwV/Xnd3VhPsjEC+54U13qzEGXMhLaYV5XmRJrhB1ui9E0WRmeR8IfkINDDjW0g
         xXnpzaBJCRq0EtlCvwg4tutON5ekDKmhNsZW53ywbUMTS95kLxNYtRktGo7V96ZE/dg7
         jpZlSY4fwALm43RdN20vfAx8gq1aC9XqYpULGf9UwnB6kYsCzODgPu+8fUnrDDyU1ohC
         8Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532822; x=1782137622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LgSe2jgByuUbVfHsyZ6zz3QwRmw592U5GGdlEu1FoPI=;
        b=jC7IvsIvbUA6HgsS3O33V1qpwAzZxATXKla41PosMG/d+EJZyuKhPRMJSvGvNJKJ/x
         r2wgtrGqtSm9QkuDg2Cfq7yEN72/eGT3e9+HFduUWlZeQzwStDQY5tMC6RjawLD4x3eC
         Ct3X6JN0r9JhrJ8cK6n1TpOfZTOf97amPDhWFPVWRtmDL9Ge1PpQnrl4vfxkIH56bN9C
         zW+UAz+kUYQBrtZTZWAY4FmNcdBn+8CgZfKiDTX5IWJcz2487VkwfuWd2DisNxYnoKit
         x17UaxP/h0iFKFjwb+SBcD4s2eEJiFQ1yu/tjCq2TXW5QIKwcTg/WAt43QxH/VVeyy9+
         uk6g==
X-Gm-Message-State: AOJu0Yw+g0V51x2pJQdCY0/QxlzHFIYrKgTcP6FZcJYO7PRUjbDU6fgL
	s+/hi4k2MNsdnM+ShubNYuIpsjPV4c4BYARJiiJqJyXuPKF1ptQrF6eCZy4tLY8pEDkWAjU/a0h
	R56MuzgwaUChnycw+lC5Sjqd9Fi3udJOpXg==
X-Gm-Gg: Acq92OEt+isJjTICMR2KarzEwH1nu+v6OdU8C74y4RBkOs6f7dyt0cbv4d4TC+Osm0+
	e2Wh1iOp6WWIb0lkRr9Kp+jMs+hA7kuq6mr4HZ7vOJfFDcAK77AllTCf76ffVDbhKam6gW03LEw
	oaogt+nRzYIqTMrrycxjsPwmNl7JxvF46tbzEFne4t+TimxImc2cd/v4L2XQkDByol7XZPHA+4S
	sOsRVJwPyYX5pT3/NwpGIsS9SOG9SHret6GYXgpQT/QFwfugohQafA7odOJ/bDnoaIA3CLrJ6SU
	9FKsrQO7OQ==
X-Received: by 2002:a05:690e:4842:b0:662:5e4d:2bd1 with SMTP id
 956f58d0204a3-66284f1afe6mr6617333d50.23.1781532821853; Mon, 15 Jun 2026
 07:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610160816.2828713-4-tmaimon77@gmail.com> <20260610162318.E468D1F00893@smtp.kernel.org>
In-Reply-To: <20260610162318.E468D1F00893@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jun 2026 17:13:30 +0300
X-Gm-Features: AVVi8CccHflQp_WEDPFT1deDFtEHQhAGFJXoGfxTiW93gE5Hb4eEw-ozhco4FAI
Message-ID: <CAP6Zq1g9s0JVKu0X7AT2CkK-v5xmnq3tp3UTCP8gh2Ysh7cdpw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, 10 Jun 2026 at 19:23, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Missing `/bits/ 8` for `fan-tach-ch` and `cooling-levels` causes=
 incorrect 32-bit integer array emission, corrupting the thermal fan driver=
 state.
> - [High] The `tip_reserved` memory node lacks the `no-map` directive, cau=
sing speculative external aborts.
> - [Medium] Incorrect Device Tree property name `spix-mode` prevents the F=
IU controller from enabling SPIX mode.
> --
>
> commit 011b4946d76e73a81f86b002033d53a6d052bd40
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
>
> Enable peripheral support for the NPCM845 evaluation board by wiring up
> the SoC controller nodes to the board design.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 5edf5d13342da..ea92888d9b9e2 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
>
> [ ... ]
>
> > @@ -26,12 +62,389 @@ refclk: refclk-25mhz {
> >               clock-frequency =3D <25000000>;
> >               #clock-cells =3D <0>;
> >       };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             tip_reserved: tip@0 {
> > +                     reg =3D <0x0 0x0 0x0 0x6200000>;
>
> [Severity: High]
> Does this reserved memory region need the no-map directive?
No, the kernel shouldn't use this memory
>
> Without no-map, the kernel establishes a direct, cacheable linear mapping
> over this region. Since this block is isolated by hardware firewalls for =
the
> Trusted Information Processing firmware, could speculative execution or
> prefetching by the CPU into this linear mapping trigger fatal synchronous
> external aborts or SErrors?
>
> > +             };
> > +     };
>
> [ ... ]
>
> > +&fiux {
> > +     spix-mode;
>
> [Severity: Medium]
> Is this property missing the vendor prefix?
Would be changed in V5
>
> The SPI driver for the NPCM FIU (drivers/spi/spi-npcm-fiu.c) appears to
> check specifically for the "nuvoton,spix-mode" property. If it is only na=
med
> "spix-mode" here, will the driver fail to detect it and silently fall bac=
k
> to standard mode?
>
> > +};
>
> [ ... ]
>
> > +&pwm_fan {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pwm0_pins &pwm1_pins
> > +             &pwm2_pins &pwm3_pins
> > +             &pwm4_pins &pwm5_pins
> > +             &pwm6_pins &pwm7_pins
> > +             &fanin0_pins &fanin1_pins
> > +             &fanin2_pins &fanin3_pins
> > +             &fanin4_pins &fanin5_pins
> > +             &fanin6_pins &fanin7_pins>;
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     fan@0 {
> > +             reg =3D <0x00>;
> > +             fan-tach-ch =3D <0x0 0x1>;
> > +             cooling-levels =3D <127 255>;
>
> [Severity: High]
> Should these arrays be explicitly sized using /bits/ 8?
Could be used 32 bits.
>
> The Device Tree compiler natively emits 32-bit big-endian integers for th=
is
> syntax. However, if the driver (npcm750-pwm-fan.c) explicitly reads both
> properties using of_property_read_u8_array(), an 8-byte payload like
> <127 255> would be read as 8 individual u8 elements:
> 0, 0, 0, 127, 0, 0, 0, 255.
>
> Does this result in registering intermediate thermal cooling states with =
a 0
> duty cycle, inadvertently turning the fan off during active cooling reque=
sts?
>
> > +     };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610160816.28=
28713-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
