Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC133F8A2
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780161255; cv=pass; b=d+8yhTuXH1r3HxYAHz2/2dzN+tPcDf1UuuCxl3wxH0aP4+CPfHpewxkbjc50hu1lcxQtckGPq0bxQKqV/xuRAcz9is8pKxNLSRPxBGsbxgiKHx2y8/GA+UdbaTnK1PRewweZKwn36q3MuczspX4nVhG/TCMsGRN2VYUVDgENAio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780161255; c=relaxed/simple;
	bh=2o+/rs9TndTp+GvavIomFayvai/SOzGUDWkHVGgdyzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrXxXaV+vzoSY2GkE/53v6zxtNGWEl1JkokHCTqBpnYYGdVyB2C6KFuzagy+h9Cxk/VH7Sp6gsgBxBaDm7L2k17N8pG+pdg5PIYGOhW6nfig2BE8nZKgr7PmdtOlKvA3Z9UPT7zuvd6vfMV8iwEFu8L9hVLy3J92PkKVuY8VG+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqP4dm34; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqP4dm34"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8cce20d2cbaso3425476d6.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 10:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780161253; cv=none;
        d=google.com; s=arc-20240605;
        b=JXCv/RN/4dnUaKQg8ou4pzact2IV9szZ6cXv5ogQwFtVLxDKYkAswBltm068lPg6Zm
         rHqF2iXWZg5dt9ncYaaqaJY+OWogOpf1w9qn0z+qJP0rM13x4lV7tXKilCdPPl5bIu5q
         jX20Cmi/rtMSPnZszhVFazgo5zD9cP9hwhW8mv+DzA49WJmaJLDlu8WLXWMX8G/C4mVr
         ZKdjvKIZWXbLsOebW/Rb87GzqKOMS9/rudHGM2E+kq3OkyOQdhvzdUN8pChgt6Jlbvlm
         M1QLsgtj+u1VnqSpr3kyst4lI5iLQ/T3kVgbNidsZlpdPQyo5H0peT9traJ/ZK8G4KzS
         W0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucTKT40VHRqUFLaRWPKDOED9BuLxH40CLDEbL6yUlMg=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=kDN8EsBc0ks+1BmA4YOs+lNa2SL9X4NKC2k1ULmfhSjb9vSTjUiDN5X6vmYnXBjJAY
         p+QvuHM21R2o3oiDfiD9KtJWAUxMXpvumS3pWCPZeN7r1CvF77P3tM1sPucKqRwNA4/I
         OQz1Pg+JlSsFEtBuSJKfHLdul6SZaL6sSbnme8zo+0Zz1HeajW0IWYqShChpYMAVicB+
         y3jK8cTmjpVXTGB1LyxtSJRaSWPQ+6hhWPNVsAk5Xx+rtDg/ud3W/sP88JrF/gH2jL3j
         suga/9gOy8TWcYRklZ31QRbHiH92j9WFJQNVDKQFLoOYQUF+tkjOrwsBNJUVEsEoxeOV
         ZIEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780161253; x=1780766053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucTKT40VHRqUFLaRWPKDOED9BuLxH40CLDEbL6yUlMg=;
        b=iqP4dm34KMKtnE40dBLSoO1iQ6MdklWyNwV53RvZ/hqLCZxKKDrNZUDitH5Tlu1pKh
         HPB6wXOUaOKDyBE5OxwXroBS7diErf0JtIWfHU1CFZQtW0TcTiMyaDqZPg5/H3tS5Yzd
         2HRxRT7Qi73tR/eE43WZkc0uJSuxgDyYQRQaEFjDcLBuNM0iA6hpJdADbhVBdCmRi39a
         uEhXgRoNPPM+pKx/yp0aL1x6SqjmuPRybrWxc47U8GTcuOy6Pb9ZODLilOPw7TXQs4WV
         KlOD/78GQGrqmrZIcNENWx6zsK/NuuhPcu9WK9Spg4AI64/aBoY3yH8DtedJ8yCjev6I
         LP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780161253; x=1780766053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucTKT40VHRqUFLaRWPKDOED9BuLxH40CLDEbL6yUlMg=;
        b=NNFGxH+H/UYGK8Ac6lud1Iqbg/19ook2Uvpyo5jRoc2vnSgQ8QPGFsOdXV5yhCp6CR
         mzC5k8lYB1G0kHp07PgahmQHQYemOGtBer35xI9XSRHbuI2Tgf0SaUuB8n045VUMaVVv
         6VZIlxdaWs+k6T4Hq1KG9dzBjVzIYyNz2SuVdxzhXEHofJdn43915qkMH2J3+/rZApJE
         3vRlCq48sNlVV7pjqhLOHvxR4sAWfyEFWC3TiaBUXMnAu+ISFtIA23g0SvtgpxovAi7g
         fIPdxHhCo79R4FPa3vX7Gjr1HEmR2CHlqI6z0qY5+lOO3BltmyJCogjUlhOMuZDpuvP4
         Fwjg==
X-Gm-Message-State: AOJu0Yy51H7/1mkplRvjMXCYr7WJc3uCHlSj/ETnmhI5k0jI8j1cRnN0
	iDbqDLX4ejs6GeOAkGgpPkOlBQG0tbWQEzGrf/Lvn9+y9xwjPlEhQ0kTpnyR5ZTICMK/scj5MUd
	jOSpqPl8ex5LUbR5GWqMgVGBdy0UG6NafQ2apaDVUL/Lv
X-Gm-Gg: Acq92OHrbgq5WxRERMNGktCTmVktASeEHUj235IsQwIaz0d8VP8nSK0cBKSsHNs2Xs+
	p2b7l0C814UFJ48ViGwHA2dATfvQOi1RXC8r39/ygKmEpmkS1YYKKwB6NSBViJ9WHzmpNCaOorz
	/T2aUceyULynIn91JQa/20tPVEHg5Fu36QXZQrVZ91OeGTklMi2pacPriVBQ5MVc2ks0rfy8UhV
	khG/inOist3wFJz2T3kHyLD5gZPsZRN9hxQ2jPjTHG/TSmc4wEuImBDrle6XBBnQZGNqbVXzi4j
	XmvrrJbDNNT4GqeaDA==
X-Received: by 2002:a05:622a:59cc:b0:50f:e5a1:29c4 with SMTP id
 d75a77b69052e-5173a95c0eamr37977631cf.4.1780161253242; Sat, 30 May 2026
 10:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530165917.55767-1-tahanarimani3443@gmail.com> <20260530170952.48D6B1F00899@smtp.kernel.org>
In-Reply-To: <20260530170952.48D6B1F00899@smtp.kernel.org>
From: Taha Narimani <tahanarimani3443@gmail.com>
Date: Sat, 30 May 2026 20:43:59 +0330
X-Gm-Features: AVHnY4Lv7zRXmQDf7gVKxPLn3hSGxb_gIFECi3xtDNCRDrvy6R5rVMjA-vfcYpI
Message-ID: <CAEsNvj-LoH11fWgt2d4cQsFm72+MTVNrVa6oJqsQD41Cen-zdQ@mail.gmail.com>
Subject: Re: [PATCH v3 RFC v3] dt-bindings: iio: adc: add ad7816/7/8 digital
 temperature sensor / ADC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko AI (and reviewers),

Thank you for the review.

Regarding the hardware pinouts mentioned in the review, there seem to
be some inaccuracies based on the AD7816/7/8 datasheet:

The AD7816 DOES have a REFIN pin (Pin 4).

Both AD7816 and AD7818 DO have dedicated RD/WR pins (Pin 8) and CONVST
pins (Pin 1).

The AD7818 DOES feature an OTI pin (Pin 2) alongside its VIN (Pin 4).
Therefore, the properties vref-supply, rdwr-gpios, convert-gpios, and
interrupts are physically accurate and correctly represented in this
binding.

However, the review is absolutely correct regarding busy-gpios
breaking the staging driver probe. The existing driver erroneously
requires a BUSY GPIO for the AD7816, which doesn't physically exist on
the chip.

Since DT bindings must describe the hardware rather than accommodate
legacy software bugs, I believe the YAML should strictly disallow
busy-gpios for the AD7816 as proposed. I will send a subsequent patch
to fix drivers/staging/iio/adc/ad7816.c so it no longer enforces the
busy pin requirement on the AD7816.

Best regards, Taha Narimani

On Sat, May 30, 2026 at 8:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Strictly disallowing `busy-gpios` for `adi,ad7816` breaks the ex=
isting driver probe.
> - [Medium] `rdwr-gpios` and `convert-gpios` are unconditionally required =
for all variants, forcing dummy GPIOs for 8-pin devices.
> - [Medium] The `vref-supply` property is incorrectly allowed for AD7816 a=
nd lacks a schema restriction.
> - [Medium] The `interrupts` property is incorrectly permitted for the 8-p=
in AD7818.
> --
>
> commit c95479a0b55dc8599b178909579f060bf75eb282
> Author: Taha Narimani <tahanarimani3443@gmail.com>
>
> dt-bindings: iio: adc: add ad7816/7/8 digital temperature sensor / ADC
>
> This commit introduces YAML device tree bindings for the Analog Devices
> AD7816, AD7817, and AD7818. It formally documents the required properties
> and uses conditionals to restrict busy-gpios to the AD7817 variant based
> on hardware capabilities.
>
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> > new file mode 100644
> > index 0000000000000..48563e4eab446
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
>
> [ ... ]
>
> > +  vref-supply:
> > +    description: |
> > +      Optional external reference voltage supply. If not provided, the
> > +      internal reference is used. Applicable for AD7816 and AD7817.
>
> [Severity: Medium]
> Does the AD7816 actually have a VREF pin?
>
> The 8-pin AD7816 lacks an external reference voltage pin due to physical
> pinout constraints (power, SPI, CONVST, OTI), and relies entirely on its
> internal reference. Should the description limit this to only the AD7817?
>
> [ ... ]
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-supply
> > +  - rdwr-gpios
> > +  - convert-gpios
>
> [Severity: Medium]
> Are rdwr-gpios and convert-gpios present on all these devices?
>
> The AD7816 and AD7818 are 8-pin devices whose pins are fully consumed by
> SPI bus communication, power, and their specific analog or interrupt
> functions.
>
> Since they physically lack dedicated RD/WR pins, does making these global=
ly
> required force device tree authors to invent dummy GPIOs to pass validati=
on?
> Should these be conditionally required instead?
>
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,ad7817
> > +    then:
> > +      required:
> > +        - busy-gpios
> > +    else:
> > +      properties:
> > +        busy-gpios: false
>
> [Severity: High]
> Will this break the existing staging driver probe for the AD7816?
>
> While the hardware lacks a BUSY pin, the driver unconditionally requires =
this
> GPIO for both AD7816 and AD7817 during probe:
>
> drivers/staging/iio/adc/ad7816.c:ad7816_probe() {
>     ...
>     chip->busy_pin =3D devm_gpiod_get(&spi_dev->dev, "busy", GPIOD_IN);
>     ...
> }
>
> If a device tree complies with this new binding by omitting busy-gpios fo=
r
> the AD7816, devm_gpiod_get() will return -ENOENT and the driver will abor=
t
> probing.
>
> Can we address the driver dependency before strictly enforcing this in th=
e
> binding?
>
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,ad7818
> > +    then:
> > +      properties:
> > +        vref-supply: false
>
> [Severity: Medium]
> Should vref-supply: false also be enforced for the AD7816?
>
> Since the AD7816 is an 8-pin device like the AD7818, it seems to rely
> entirely on its internal reference without an external pin.
>
> Additionally, does the AD7818 physically support the OTI interrupt?
>
> The AD7818 sacrifices the OTI pin to accommodate its Analog Input (AIN) p=
in.
> Should this conditional block also enforce interrupts: false for the
> adi,ad7818 compatible string to prevent physically impossible device tree
> configurations?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530165917.55=
767-1-tahanarimani3443@gmail.com?part=3D1
