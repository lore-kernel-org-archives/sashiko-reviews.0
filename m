Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1EB39099E
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002131; cv=pass; b=X0W0AMpa5HtIMS57m2ueMfiYZbkaHTvtw7hEaj+u5AKb8TsneEdqHF7GstTGSmj9FjASUgziE1XD2FkMqA8MM+255NAZQOSoj3fbSog8OO8kcaR1dp5HwzciQ+m0hv9CPReCmOCnfMAg7y02OWfvE5RO7fdupbZsr3v+x8iHJD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002131; c=relaxed/simple;
	bh=b9kifEXDkgdbLZHjZehLYSHr/pku1ziKm51x7inSn10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MO4DT+e9a90vgs1ykTtyx/VcMKto/pJQ9pqO85Ro/04zwwBgND/hNVGoPxVc8mn3y9w9/xsARnYy6vttAkzIvWnXcT4NjKdLH0WPm7lwLEH4ENNguZgfDAiQeJC0CMf63NHIyw7lm5+vr/gwj9+cPd5VGt4IjeXNRbDs5mj3W20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axwCHE+z; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axwCHE+z"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2960ea2fbso153571e87.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 10:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785002128; cv=none;
        d=google.com; s=arc-20260327;
        b=QTiFy7kTRwsa48G+7wvE6eyNWv4vyBJRDtR617wvObMj++TnuywT9BSS5Wflj4v8F9
         +1HLNyerYeEtDIPRSwv9vW7Shq/PhSX2dP6eyUOH3aRiSq5xv438jhZoMmAxyJwqnxM1
         y6dTDJ1s7tiKLLMZzjF0SwAPMYhMxmUhSTTGzyDk+X19tV/CsDDR3LI/CVmT+O2+xJX9
         1RSX0hXIAlQbF3ZTMXDSvzggmHr3mbwDr/nhaf3o9PfNrYoSlW1pFuFiaaHD33Cus5Qj
         nxRXmJvRfoQRYrMDWv3+hb1ebtVdU4pDEpKco8pLXSkeGAiCmW3qZbh7aEm6VcUZga5G
         epyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yteFUPwKHiROMdXXI9GsH3+4d/0le9UOI6hRzkgiAG0=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=l/WnV1Nki+dGVUMKyvQfyxv1d5f/AuQCd69ixLcfGOQC9pEdUm7CRmy5dblD6qtCuu
         x15TQe6U5CEG6nr5sldbT3NUMDLkekDaYlH0TgQi57ZJpagYHNpHfZfZm9BQrlMzm/Rd
         KmuY+uTikPbm5ZNWCu/Scb/YpmleOHb3jkgjJhrbvrpYdSonqQT5D8HPDCPtz8184mok
         5R2ipwlF7QluHHqfAnsjknB7X+Fgur3hTODUPhFB+uDg54c6GsdiQoYFPoz7LZvIyI9G
         DDvjU8+JnGsUp/jadlKFE3ZkZ33Vx5wlaK+P7lBAKc9bZ5Cb2PcSPafCvcWaL3ikTTiD
         lwTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002128; x=1785606928; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yteFUPwKHiROMdXXI9GsH3+4d/0le9UOI6hRzkgiAG0=;
        b=axwCHE+zoHcYx3c3tlDBt5CzJtiV3b+S/aG9trfv+YBce0I7qUCU2sPIis72GZ9ptM
         pB19hDT0q+34U6raXPohvXU+QC/X7LySjY2HxD5azGWqTsCVJQaZwFTlaS/CFKsd/+Oa
         N/MAPW5DnZUs4Pu3ut3Av+zQwv14gfOITdIn9FhOjIWYfNRd05yElQTODzhMsZwc0pRm
         Krv6W9ijnS8wY+fN6GtfKR8zG/9KZAR+SvGFDVl22ZuM7Qs/Pb8u7yA2Y1pbx2SySrmF
         nwEIb4ixIkS5Y96OAkDp9FooLCE4cJdL0zVvna4zgiKyUDFcVJR6ghORqaT9E4Vj02h+
         I5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002128; x=1785606928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yteFUPwKHiROMdXXI9GsH3+4d/0le9UOI6hRzkgiAG0=;
        b=tM54I+ph+d6a0ehE+6sWmJRj11ouAlIPQRSitkoVUa01bpMPhU43iWE9bt9vi0JJ53
         r4uLXNfhQbOuVlKO5IcVs8gdPR3ExhfNsyj8FicwhkQilS6OTKiJF06ONb8maJsw5NYS
         VLFWi7FnREM1uQLI2gD27v1zPS4uES3R+nFEFiwKKOlW8Gn0T1RwJi/nQLbrx1VDFaBL
         +WR2ITBmlbh4rfb7349CiOZuZr1uMkAhUAEouOIP7QAxs6mzZLqtHHVg8SP44c+qh61B
         wwgzz/uPxA8D4dCyJG7yA8mQeoC5qNoh7X6hTKwwznWkFj0+wOJKZ69BJtBglV6Ec7Mg
         buiA==
X-Gm-Message-State: AOJu0YxIJlP0GO9S3XvEC4dhPC/X99/rpjkTxlQjRpyFY2+UuEpZVBUl
	16bkTCbSQwC4Hz707vC1hgeVKSQ+uAmiU+bbaaKfmzzN+IAENDuQO0j36KpdEhbyYXNO5WGAoEI
	ygvBzUJLabQQdiWPnfRSqbWDgSNjE2Xf14cEs
X-Gm-Gg: AR+sD11/teoAVYWjBMh75zgWS29o4YW/J2L9C8yaUqye1k7zCY8YqN4kArKv2m6p5vH
	ISIKoUZ5lpX28jtSc11RADzYX667ocg8GP/7F/zZEolXHdSozyAsFee4nmTWD/Ar9HmSW8kzAzR
	r1Jm8DT8TvTQuhE0n+lS/0JGPJA3VDtxjlekipxetHnnVXCwNJlBBrKSG9XqwwjBM1zCMrEUEwI
	YeMf5XyR1RWKwlJELYdAzzhnzW4vMu/K/8E9qF8fmTk/C/LnV6vGpsrSslXecxif7FlPSYddj+R
	s/5TbY/qSDgih/4/dbc4cDy0rFC8ZHb0nAbA7EksWUNuznPx473yhUjDIIeEB/SItFXhg/wdhtb
	Z/qJTgMYliKk=
X-Received: by 2002:a05:6512:2520:b0:5b0:6aea:cdb5 with SMTP id
 2adb3069b0e04-5b2c1af7abemr344844e87.1.1785002127934; Sat, 25 Jul 2026
 10:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721233452.112204-1-chenyou910331@gmail.com>
 <20260721233452.112204-4-chenyou910331@gmail.com> <20260721234526.4300B1F000E9@smtp.kernel.org>
In-Reply-To: <20260721234526.4300B1F000E9@smtp.kernel.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sun, 26 Jul 2026 01:55:15 +0800
X-Gm-Features: AUfX_mwO0exdk6xo--FQSz6O3-k6E9IELUmukLCixnAOZrpUBTapZU86C2pRIFs
Message-ID: <CAKspUhJnvEb-W+a8UEFxUKN=T=dyTpBSA5su7NrC1nszBuGsGg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed, this was a real bug. The address was carried over from the
64M Duo. The 256M board's firmware reserves the top 2MB instead --
the vendor device tree declares memory as <0x80000000 0x0fe00000> --
so the region is 0x8fe00000/0x200000, matching cv1812h-huashan-pi.
Fixed in v5.

Chen-Yu

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8822=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8A=E5=8D=887:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Potentially incorrect coprocessor RTOS memory region address c=
ausing memory fragmentation and risking memory corruption.
> --
>
> --- Patch [3]: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M boa=
rd support ---
> commit 0fb7e443f556963d48319d1228e77903653e11bc
> Author: Chen-Yu Yeh <chenyou910331@gmail.com>
>
> riscv: dts: sophgo: Add Milk-V Duo 256M board support
>
> This commit adds basic device tree support for the Milk-V Duo 256M board
> based on the Sophgo SG2002 SoC. It includes configurations for UART, SD/M=
MC,
> USB host, and the onboard status LED.
>
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch=
/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> > new file mode 100644
> > index 0000000000000..21ef6ed9f0d21
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
>
> [ ... ]
>
> > +     reserved-memory {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             coprocessor_rtos: region@83f40000 {
> > +                     reg =3D <0x83f40000 0xc0000>;
> > +                     no-map;
> > +             };
>
> [Severity: Medium]
> Is this reserved memory address correct for the 256M board?
>
> This address (0x83f40000) is at the top of the 64MB boundary, which match=
es
> the 64MB Milk-V Duo. Since the Milk-V Duo 256M has 256MB of RAM, would th=
e
> RTOS usually be placed near the top of the 256MB space instead?
>
> If the bootloader places the RTOS at the top of memory but the device tre=
e
> reserves this lower address, could Linux inadvertently overwrite the actu=
al
> RTOS memory during allocation? This might also artificially fragment the
> contiguous Linux memory pool around the 64MB mark.
>
> > +     };
> > +};
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721233452.11=
2204-1-chenyou910331@gmail.com?part=3D3
