Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7361F8755
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525542; cv=pass; b=BGkawPP+cvuOr78iT1z8IDakPlLimk1bJ26qKdx05ZZrN+lXKNpwDthWgof1N0xj8/yaAkEuvbGn+bymnE/4MoA6U9sDuMwJuxvKaAcG+cK4Uqwks/gQzXGXeUwQurA3j/Q5HYlI5ZYKhO9Bk54RC0Iz8uD09ZoZtUbUN8OYyww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525542; c=relaxed/simple;
	bh=3VvyaRT2KLtqRv1KAgHFGa6KCQOszCY1uEkWUilYHG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMtzeRJG4LHsSCbeuHksT6KfdlU0L/YuKkFMFvO1Id9V+jLQHTB1pS4hOjheRa0eV6i0um0Sr4h4Lpi36Tk8DYF6oW9+Hy0ecF5McpBFhYaq68xIe6lAignFRqKRZ4uNULo63HX2QU23XwEKhmXwTc4eje9C1dxwtX1qxnqrbwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezE5VYut; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezE5VYut"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667923d86a7so1393902d50.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 08:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525540; cv=none;
        d=google.com; s=arc-20260327;
        b=UZEN17aT8yh7Ys9PsuaQL6d9jexHsh1JvEbTSzIMRkQLRg3Fb7V0NhvmDJ1Xg0umOY
         wXUtxrrlcmOI8tZ1NwqSMNG6z7HMiAAUxRnpCVhCcCjN5DeOFpRCk4KolqepYHxsuP8q
         iROn3qtWbTE15Gj4QPTEwt4qpQJhI1A1/DX0vsO14ObiA9Yu303bdB6BjN93CLR/jE/x
         z46u/fOuqBVwbYNzJsCsOQljG4i64b4yP3Nq+YoaEtCVOj9LkL3lvwigNYqZ/fJg9kUV
         UoZb6BhFsK+d1pVwQkf/Pp9ED5ZJoPzu9bbY0+YBM++3St6LFWNspg5nHxuu2DR6BIpz
         RWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JrO/C4EGIXTavDbeUQFmwCmMVn+PH4kZLE3fSi4r440=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=areLx73mDO0H+f7kle30A5AsoESgbP6PnggK6qm647gNf48JevjZNBS0OF/saskfWf
         ObCODrPMeDCTE0e2Gc0NsUCkihh45fyJ3aAuemgdqPzgXRASi08EZRISux2te928MIiw
         NmgGH4gTiVu42tAWcNmR5jQ/9KQ7PCo7dD40Wo3mlNWuZpIgAapHebH24kIqFmE+twh7
         I1mCCzXwvaCNq/Jw7CQCSlsD76py81G8eeZaSJVxV/mlj2t9x97JiudSVAOFcA/CRthH
         NJTFBbPL985gBX6CJQD1v6EfmKnst8WZ+aVmNotjN46bU8jevWlazgWW4Cpg2iTjFYEe
         IJag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525540; x=1784130340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JrO/C4EGIXTavDbeUQFmwCmMVn+PH4kZLE3fSi4r440=;
        b=ezE5VYutOri2aQeAmcgzKimx11Yev+YnarXMWWZ4CyhA0ADNHosggrOURgWteO1ONS
         ArEQnIygvL3jbgmTiryYf3Orx4C9AMJA1QqMX1L6fB39qIBp1aVYCSLWTQFGzAcLNEAp
         ij+7nAmQwFpFs+Vnk/9T9rYdJYAzbiK1RiPtGxlt1EZb/6VcZRhLB0KI46NHW+pLD19i
         NA1LSm627HJqSaH9hoT5tGz3I2M/13xgqQhg7axLT9vU2Y4rE38AuNvWiw9S2lL58LGe
         uagQbRco1nIxi9cnAl7g0z2CyK/Rmg28z5jcOjiP5ePyUpFgOroJkf0/PUTBm9Rso5iL
         5ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525540; x=1784130340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrO/C4EGIXTavDbeUQFmwCmMVn+PH4kZLE3fSi4r440=;
        b=DFa8BeD3yiJAGR4WUJMAI7j5a4D5uI4Bvixf7yDDQyH/pWTWbz6Hi6KSZ1SyCfdeNg
         dkq9coDRkrzNOm6Kgm6Cea7QqkVLXv88YgcVzTTAgKzyA2EZiNhmtcRznec8GKgCbhZ0
         cgvwc31amnG3pB0vgJrZdzJe168XE147Resx2OQekntGX6RlmHG/EuXHB2RNugHm++YM
         64q76aIU1+czrx7HLlG/G08SXs83Z4pa4syJv0jw858L9Onjt4EqrRtXwSPfZZx9+vW6
         fdDRnxB4iBhQ/Sq3TuvSlrcDA2Vt2WVrg5vXf/WxKpmDq8dgvFLli7HJWfTO3s7FeZC2
         d+RQ==
X-Gm-Message-State: AOJu0YwC5HtcDpFmCjnpqWICbbibsRwj+1VcBte48IU+bldjF8TKRGpM
	yiJ9McDAW+gmE48+NyKOxYVeZoMBHiPCTBIqqkijGSU1rWVklFXDllgIIO/R5VH3SJcQ1W5BEUE
	cfbnT/Kp/L3NUQFlcxZeU8LitumHp8XESy9nb
X-Gm-Gg: AfdE7cnSVMr6MathjNWE/zW10+ubj24QU4LE2v9zdHCGdgtxIiNgCluIk3B83878k/h
	ifuEI2EP6x8RVQjSxj/wN/Q+ftlmuiv009qsUBBHyu2HmQ3OCmScNyWX4+KPupGQ4/MPyJ5JEQs
	8J+o4lRQVuGN0IHMis16RnWytN0lukrcKW+mLGSQI765utUmHo3ql70WGF2poQRgRZKXjKDI+u6
	XcRPCH8SjAXDHym91srQbBrf8Py0X1vVJagj3bMspsSsouVuUHXKVifZxBRyiJrgM1TGzOylg==
X-Received: by 2002:a05:690e:134a:b0:660:7bcb:7acd with SMTP id
 956f58d0204a3-66788fccd9dmr5382561d50.43.1783525539856; Wed, 08 Jul 2026
 08:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708125352.1915040-1-tmaimon77@gmail.com> <20260708125352.1915040-5-tmaimon77@gmail.com>
 <20260708130847.F34321F000E9@smtp.kernel.org>
In-Reply-To: <20260708130847.F34321F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 8 Jul 2026 18:45:27 +0300
X-Gm-Features: AVVi8CctSGpOc2XlFBYw7NY_6gayi67uBBxQfHK3U1oYnmCn7tlAUz4o01v9m98
Message-ID: <CAP6Zq1hJOwBNHD8hz+YYEBL8pZToYZLuTy27EZr5APnDdCkZcQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 8 Jul 2026 at 16:08, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The device tree aliases for fiu1 and fiu3 are swapped, causing=
 mismatched physical interfaces and partition labels.
> --
>
> --- Patch [4]: [PATCH v7 4/4] arm64: dts: nuvoton: npcm845-evb: Add perip=
heral nodes ---
> commit addb487f93312d5fc6f3c9be5cafae0cfda32949
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
>
> This commit enables peripheral support for the NPCM845 evaluation board b=
y
> wiring up the SoC controller nodes to the board design. It adds board ali=
ases,
> MDIO buses, reserved memory, flash partitions, and enables various contro=
llers.
>
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch=
/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index 5edf5d13342da..7717c3a8f76d2 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -10,6 +10,42 @@ / {
> >
> >       aliases {
> >               serial0 =3D &serial0;
> > +             ethernet1 =3D &gmac1;
> > +             ethernet2 =3D &gmac2;
> > +             ethernet3 =3D &gmac3;
> > +             mdio-gpio0 =3D &mdio0;
> > +             mdio-gpio1 =3D &mdio1;
> > +             fiu0 =3D &fiu0;
> > +             fiu1 =3D &fiu3;
> > +             fiu2 =3D &fiux;
> > +             fiu3 =3D &fiu1;
>
> [Severity: Medium]
> Are the aliases for fiu1 and fiu3 swapped here?
No, it is explained in the dt-binding
  Alias convention:
    The '/aliases' node should define:
      For NPCM7xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux;
      For NPCM8xx:  fiu0=3D&fiu0; fiu1=3D&fiu3; fiu2=3D&fiux; fiu3=3D&fiu1;

>
> The underlying node for &fiu1 is labeled "spi1-system1" and &fiu3 is labe=
led
> "spi3-system1" later in the device tree. Could this cross-wiring cause
> userspace scripts or tools that rely on fixed controller IDs to write to =
or
> read from the wrong SPI flash partition?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708125352.19=
15040-1-tmaimon77@gmail.com?part=3D4

Thanks,

Tomer
