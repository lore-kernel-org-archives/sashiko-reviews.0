Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF13A83BF
	for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140125; cv=pass; b=KefC6xlK1oSHCzBO9dQ4XvmLlfB6zfvXu/n/NsV0wrlgBjhMym7203k8ceVgFZyfHC/UnpdOSe0/bSMWhrq7Qqp/Jjmg/c47C+u4y6LpzR/pHpB8qmTomxqJ8GCL5/dpK8i5i90CSApsjcvjS/nnBLeARRE8GF8dF8z6s91LqGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140125; c=relaxed/simple;
	bh=lFNrxzNQ5edL8UN6TD1iTrQnKblEFc91/Mi79oiB39M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBRIHv+QT0GXeZrrEOwWhpL6QzM6UyxeVjJZ+WK/Vx5II0IcNfyk3famGFgGRHkR+aXtibPPCwQwylxPCCI57nYwJ88Nxqg44Ce+snUfwjNhUfuWkSfzCQMQtOJPA7GLMODnh6P3Yh+/thMQ4rah/AId0E9KUk14Ax/kRydHaHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku9nHHl7; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku9nHHl7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-beb19bce272so1891566b.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 04:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780140122; cv=none;
        d=google.com; s=arc-20240605;
        b=eyHF1Uyj5K47UzSeh0RB640m4IaWT+fzCzd+Hc4QdC9qK6+kndl5rxztIDSOvzIDSY
         mfV4n/VTJWGjEcB8DpOYufX4MYw1OxXdqtOICbO0daBDDsM/m1ksPfSfP6d9wqSHjHjH
         LbE1/KPImXbSTeZjCnQhgAqn43FY6AoNasdIn+IJ0SZuON6pkXtaRcU/PBd7m3mDIBog
         z1CnAOFsJcwBerpIjVuWxGeuLZGI4+rZ98Dd4NqXiwd/7FeCy3xbPgQG4xqhZORSTCCu
         z56qPQdk14kQeO3ka38pSi1Do8Cn7xo53DBVcR9r3ZEOljwE7FWSATJrc3kfBGVHP68Z
         NC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25QSe8FS27jbL7gvHOw+es5cmwhYoyIGedo22jkR4Mc=;
        fh=q2oa1ekct7KR5WHTVsuodzZeNY7MhQ5926J4NNvSleA=;
        b=KrAgHjNHNrYOUY/APWY1F0iI9joWCxClt7gvtAV19MflMe+4bsAk1HePOWcfuRcQpG
         Kycxm2cagYs0mFU4s87r1ZBwXyonyo3jJUJP6FPoJrOzgyw7A69arzvDiLgTVVgHlZ30
         8CxFQM8FaBnCD66zkjQNz6m93aBOmoMRyeFEG3mP30AjdtNsDtHCWslPQm/+FfMbCAoS
         wloGEyY/S4GooiY+gDp2abhycY7RRxXauNM+JVrbM86+44UJExxs02+H2MOoIOVkznEb
         zKwdf2yQLoYWvCwiRnGAWXg5HEmBhYw7TC4A51qBnAb4X5NHTisxnO/qpUk82bZ/vCrV
         V7fA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780140122; x=1780744922; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25QSe8FS27jbL7gvHOw+es5cmwhYoyIGedo22jkR4Mc=;
        b=ku9nHHl7Ly3eW83LEt9qvtRUzFls1ZiWUy/S7o6Kscl8jSEFwh3GXJB62aAqSywJOi
         Xr7Oa37Pt84pp7IMPRTX+EpFFTQar+KY5UU6NN1gfRlaG0Exs1FrUOVbrM3+Ejc1eG6o
         zzwrC4ZAYdJNzl9nUq7vKp7PJDkJsrvoAOqd05V6MJRxg1neH8BCDrpBXqaGBnW3To8d
         NN7Ie49fmR8VLNGa470hndFcQlfHTCv3mckyHmWBFAh+27wCYP9OwWRPaiTgVa3WBfBk
         csp/f/xhI9n4BcJtMMzk7qw/ZTMyNE+mVSQTe4Y1NC2XBahNUrv3vtdFisDEVxx/QMsB
         U+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780140122; x=1780744922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=25QSe8FS27jbL7gvHOw+es5cmwhYoyIGedo22jkR4Mc=;
        b=bNtjHOZuPdEC7T8gwuzkipXrkG2W3kOxHNCFhf77YYM6ZU3ylWLNz24D14a8h1ISr7
         FzNlBa/0mUcvKvvp1DEeVp0LOEahb8i0/16UNlnl1iVpvmt7UmGZGM04pu6lm922Sf5i
         5j93flnAP1SB/PpXb7KS0/aJPyyxBf5XegU7avqY0AiCSyBBJRKpW3NrK/jHa/+V5NjC
         V6xbMC4RsSE2nvhyEZ2VtDWx5GhlnWmBQfxY3lJulig/SMCwxcQmg10jZ0JyOlqNsxjN
         0zDcK1vn1ZuJNpRIG736b9R8/tcPp6yCsURQVWgz7z6js7JOcetSVQyy1hp/Fao51Y82
         dqog==
X-Gm-Message-State: AOJu0Yw3wO91Sa83czyt5YVM0w3cMC9o2vgPEJEgNLkUpY4EuYh/E2cQ
	LTslMXAIeAZUwT5BwDWtIO9Mm9erCBn3a/AFgZOcRNqLhSgksDybhKCW8wQLNiOpsfq3fOFgXkv
	6nCfKdLUCs3RbiPmcasIZq5OVBGYTYU06cIl+w6xjY2CpzvY=
X-Gm-Gg: Acq92OG7J2UwZpxX78TQROlWdc3pDmwtLQThdosBm2tLegyTZTaeR/0tcZ0n+G5BBtT
	M13tt3R5AieqPVTiWDbNNt3sQm38f1QJYQSxGr1OtW+Fibc8SEYMYh1N1eaT33+OFSPmTJ/bkIh
	67c7R82+9k1ZoXCeT8HFnHRtgebSKV9VCgR3FgtEd3K8PCHfYOv2PtoqZX9qqLcgqNHJAdJtTs8
	aAxnvF6V4zZGWUdXZ7RuDNZKlT/eLqSZWsI2leXzGjBxtryCqThoKjhd2wVhi/nIWtaSynw63bz
	GsBKj4Lgi9pywk4BjA==
X-Received: by 2002:a50:ec96:0:b0:689:ac19:3fb4 with SMTP id
 4fb4d7f45d1cf-68c8b2e7048mr483014a12.1.1780140122179; Sat, 30 May 2026
 04:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530135302.54688-1-tahanarimani3443@gmail.com>
 <20260530110658.30EB11F00893@smtp.kernel.org> <CAEsNvj8Q3n3-tuPhANfRjUfqrnCtzfguuRKL0OrwCEEkSXrUaw@mail.gmail.com>
In-Reply-To: <CAEsNvj8Q3n3-tuPhANfRjUfqrnCtzfguuRKL0OrwCEEkSXrUaw@mail.gmail.com>
From: Taha Narimani <tahanarimani3443@gmail.com>
Date: Sat, 30 May 2026 14:51:49 +0330
X-Gm-Features: AVHnY4Lgj0IR4-__iwmvmZBCf2z0cg5CbA51LFHjpNp4kCeS6HxzCvMaJGnWKoc
Message-ID: <CAEsNvj-xv4PC6jZD+x_xUh4_Ec=eO=BA=LXT0t9aMTEy4X+LEg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: adc: Add schema for AD7816/7/8 digital
 temperature sensor
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the detailed analysis and for pointing out these issues.

I would like to clarify that these are pre-existing issues in the
driver and were not introduced by my documentation patch. My current
goal is limited to adding the missing Device Tree bindings to resolve
the checkpatch.pl warnings.

I acknowledge that the driver has issues regarding concurrency
protection, DMA mapping, and polling loops. I intend to focus on those
in a separate, subsequent patch series after this one is merged, as I
believe refactoring the driver logic requires a broader scope.

Thank you for your patience and for reviewing my contribution.

Best regards, Taha Narimani


On Sat, May 30, 2026 at 2:41=E2=80=AFPM Taha Narimani
<tahanarimani3443@gmail.com> wrote:
>
> Hi,
>
> Thank you for the detailed analysis and for pointing out these issues.
>
> I would like to clarify that these are pre-existing issues in the driver =
and were not introduced by my documentation patch. My current goal is limit=
ed to adding the missing Device Tree bindings to resolve the checkpatch.pl =
warnings.
>
> I acknowledge that the driver has issues regarding concurrency protection=
, DMA mapping, and polling loops. I intend to focus on those in a separate,=
 subsequent patch series after this one is merged, as I believe refactoring=
 the driver logic requires a broader scope.
>
> Thank you for your patience and for reviewing my contribution.
>
> Best regards, Taha Narimani
>
>
> On Sat, May 30, 2026 at 2:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] Missing concurrency protection during sysfs accesses.
>> - [High] Stack-allocated buffers are passed directly to `spi_read()` and=
 `spi_write()`, violating DMA mapping rules.
>> - [High] Unbounded polling loop for the BUSY pin can cause a hard CPU lo=
ckup.
>> --
>>
>> commit cb7e57cc9cdde2668abda84c0f0d3e60ebb9a962
>> Author: Taha Narimani <tahanarimani3443@gmail.com>
>>
>> dt-bindings: iio: adc: Add schema for AD7816/7/8 digital temperature sen=
sor
>>
>> This commit adds a new YAML device tree binding schema for the Analog
>> Devices AD7816, AD7817, and AD7818 digital temperature sensors. It
>> documents the compatible strings, SPI configuration, interrupts, and
>> required GPIO pins.
>>
>> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml=
 b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
>> > new file mode 100644
>> > index 0000000000000..74008c14d40c6
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
>> > @@ -0,0 +1,87 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>
>> [ ... ]
>>
>> > +properties:
>> > +  compatible:
>> > +    enum:
>> > +      - adi,ad7816
>> > +      - adi,ad7817
>> > +      - adi,ad7818
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but is there a missing lock t=
o
>> protect concurrent sysfs accesses?
>>
>> Looking at ad7816_show_value() in drivers/staging/iio/adc/ad7816.c:
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_show_value() {
>>     ...
>>     ret =3D ad7816_spi_read(chip, &data);
>>     ...
>> }
>>
>> Since this is called for world-readable sysfs attributes, can multiple
>> userspace processes trigger this concurrently?
>>
>> If so, could concurrent execution of ad7816_spi_read() interleave GPIO p=
in
>> toggling and SPI transfers, corrupting the hardware state?
>>
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but does this code pass
>> stack-allocated buffers to SPI transfers?
>>
>> Looking at drivers/staging/iio/adc/ad7816.c:
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_spi_read() {
>>     ...
>>     ret =3D spi_read(spi_dev, &buf, sizeof(*data));
>>     ...
>> }
>>
>> And also in ad7816_spi_write():
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_spi_write() {
>>     ...
>>     ret =3D spi_write(spi_dev, &data, sizeof(data));
>>     ...
>> }
>>
>> Since the SPI subsystem often maps these buffers for DMA, will passing
>> variables from the stack cause mapping failures or crashes on architectu=
res
>> with virtually mapped kernel stacks?
>>
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but can this unbounded pollin=
g
>> loop cause a CPU lockup?
>>
>> Looking at ad7816_spi_read() in drivers/staging/iio/adc/ad7816.c:
>>
>> drivers/staging/iio/adc/ad7816.c:ad7816_spi_read() {
>>     ...
>>     while (gpiod_get_value(chip->busy_pin))
>>         cpu_relax();
>>     ...
>> }
>>
>> If the external device malfunctions or the GPIO line gets permanently st=
uck
>> high, will this loop block indefinitely and cause a hard lockup?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530135302.5=
4688-1-tahanarimani3443@gmail.com?part=3D1
