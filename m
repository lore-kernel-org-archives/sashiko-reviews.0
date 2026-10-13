Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD852120A
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898474; cv=pass; b=AkYgMco46EuA5bG4Kw8l1Un9yqC6gCVtqyhWFjWMmryUvdSIsWAUjb19+L2SBZKwS8utS9SOBS1gZiTieUmRaEXBvHNlhySYkiwBsCJ+XfQl1EE7qOAjUgbfZYoiYi4HD6CyyDfy2ev6T9PhkhKq7rEF+KwEbiifX/N8TfQIGUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898474; c=relaxed/simple;
	bh=rum1qEWxnjQkNc/QZyRngUhFTPTCbS/MB5RebliGBbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ig7DrrL2rkO6dMzzADqzCkY1JbUPZIXf+6WdefinSh2Se9zJVJ2jnb1Sl7bFF7dKa6Fldz2/HtMey+CpXUvL4rY5OOSs/mybccwFqORCkZCHhY0JKX2foaD+G1PoadSc3VQp5zwJXCq8WsbPNw5v4xclsxQB7yRm1SHDegE/M3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dclx/wNv; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dclx/wNv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso16319075e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 06:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791898469; cv=none;
        d=google.com; s=arc-20260327;
        b=hGKRojmPnoHUCKQ8R9JEKMGuHwmxoLU8QtZaHyF+VVEXJvzvGMQyzPJZn63rB37AKN
         ZPVda/nBTPudqwSv2l5NZJjGA0kerX2Ub3m2xQe+mLXRGD5u95ouTn+6+aHVL/q0WHwL
         QATKLVg2GBcE9XxEfdKKtgEbh/eiODnBfhVkuBTAKjMds5lXgN+4I0SovU/NwtmdHkKc
         oAehJuNUO7i/WZKbVTTJ/4GCzVZt7vWQ/gThZJz9XGMfA1RGNrlp3TXR12V6y/psY89l
         IltQ9wxHmE+A3wPJj+SGXvedy2Ljhtku8rhCGbxWIyCoZg5WBbbF/GcYtt0A0eZ4EUuo
         IAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8ODZ279ysMIjt8ws2/8idiazas6JnMazE457gGy3Tk=;
        fh=CYgAUBP7R3OJgRZ5fmSExHBuzm1GQ3aKCNguwIdJr+Q=;
        b=AR3+N932ynGU5Z2gCls2bWi5T8TWQ0BaiIbuXQw3XHPtP3WBWlNzEW8QgrpchHqsGi
         Ght0ygLLizrK13uvjGXv3ftVuxm6t8B6UQmB4EBqAijjemCA9rcCoWCrjhR4X2xNXstF
         rWA3MN+gklTXD9aI0yux4WgUq6P7sV7mxzZ7m77nalBw3oD2/L3ZoNll9wF1tKHldDTm
         po45yUl1zuJPkQa+5PQk/JPyIKOrCQRU+r9Jtef/P0QkF5vwlgbpZOn5FxWyKorzky+I
         0c4A3Y+LI3qMPDbQSRq0S36gZO9NSgcH17H4KJpyLqKawNTcgMQnkEd1wIWKgb8DKDhI
         OzbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898469; x=1792503269; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8ODZ279ysMIjt8ws2/8idiazas6JnMazE457gGy3Tk=;
        b=dclx/wNvKCYeSc19zzo/4R9JFVDOk+y4TrSsTV+XHB8eiu6cExOrWz16YXfEnD6tSl
         IPujZvwMsmkk4ogRxkXXq5DsdhxoYC54mPfgdgvoMwweVkbhtop2Q77pWTWUW63aYS5L
         hTX+nnqgg3FiZXeNiaug+z6uOiv5Xfeh8XSXwqUXDx8umVllVVWJ/AYu4gte0++wJ4eR
         x4wrG0OLL3FaHZ0Mcow9hbhlQH4CEWJsabwSoXm6yLIfj9uT10rM7z3S6OEJs3zbXyjX
         Kpkp1ITKgJ5Apia8K6vWLe/rL6NAnply9yfD6yZRGivSXLsm9ZCTR0ObgbjY/1LK/JU3
         jjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898469; x=1792503269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8ODZ279ysMIjt8ws2/8idiazas6JnMazE457gGy3Tk=;
        b=TPpALNZUDdA+bk5a2+KzRWEkZtMFrYsF0dfUVYGB7vo9qoGGbIbliEFe9VVXEMRhi2
         mC1jeM5l0KxdMwV21p+m46OVVFPIA3YBZ96u2L9eIwyeTRTiTwsXZ/Yxn95g/oKMDEZH
         +s4J489b2DN+WIPlwEPgvF3HVSgeyUqHLvc2hzSiufFU/ypELGEaDR7e/alqI2tn/rmr
         Nr2YsmCoHEQv6GEtHE4ZmTUUkHBbsRbvh6CxMxPiUtez3lx0K0BwO6Bb01l/L5UJB54K
         jfIxvp465JuMiqZNfIsmg5ISfblgjUaAKdpkIXXg2tk9zwTd4xJJO+ZfLmURbeT1zKAy
         XXZg==
X-Gm-Message-State: AFq9FYJTp1CxwiMIjYpbtiD4TJxq+YpjXkNCX79btFrM/0UHNXHcLxwo
	bR7DXCxBUscL38n61f5zLPcqJVMRMV/exm5HfkpK5Mi6fDln+3BBUSXEqj1ySIUapueDRKqaUjo
	SWRJkLGmOpMejwkyvEF4Pdzt3NjJdEp6Og2+rq50=
X-Gm-Gg: AYBFou2W8yOLU4WSLcQIK5QenZiZpLErLgzqSbiyzWxjSf+Oc+/46aOlJ3lrmVJjgaq
	lAkWbfeyYY3TgSqJt3Jr+90rF09CGM7vE2VH84bWV4QAvIsUMb0HAa9XfGrQXT2I9UPtA7whOA8
	D//B2qwuWsErS2VLlg1BadmEZ1MyolVDrumfjAJiZ4+4Brbz2a+xkEmSxBMhScDC6dLNN2WJubT
	IFqY5ngfFbSwFnkV18I4vFSZiIedN/MZaoAKbdh0bYBoaiXforM8QeDagwn5j0ixjfpXsuE1Ye6
	LHWECiCRSdybrvjLqtMsPIqyjBj76sozpBiLMY5zyHW0ZKJA7Z+kqBATzjiXYQUa/ksuSJnOuWG
	Uwd2b/125C+jYKECVCGZpyHuGp6s3SWcM1pb79YlVgDUUL1wjk+lxpFbxQWvm9ucCCcvo+SuU4w
	==
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id
 5b1f17b1804b1-4a18e4d55f2mr282596195e9.31.1791898468395; Tue, 13 Oct 2026
 06:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <sashiko-outbox-165990@kernel.org>
In-Reply-To: <sashiko-outbox-165990@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Oct 2026 14:34:01 +0100
X-Gm-Features: AclHuK9yXvosqpoEdi8gTLFoTZpA9vUA7jJSVlp6BidQuyc7Xjr_s0G1mkXtk4A
Message-ID: <CA+V-a8tmMnGiVTSGQsbFe6eKvgGowLaiM-+eAccofh_DsWERPg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 9, 2026 at 8:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pm: hardware stabilization delay is bypassed for SoCs without ca=
libration
> --
>
> commit b9111d7d4d36117212882ae96747fcfe15f3bdd8
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
>
> Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which shares
> the RZ/T2H ADC IP but differs in channel count, sampling, calibration and
> resolution support.
>
> > diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> > index 0703c2025e3fc..be8273f3b61d3 100644
> > --- a/drivers/iio/adc/rzt2h_adc.c
> > +++ b/drivers/iio/adc/rzt2h_adc.c
>
> [ ... ]
>
> > @@ -818,6 +1005,12 @@ static int rzt2h_adc_pm_runtime_resume(struct dev=
ice *dev)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D pwrseq_enable(adc->pwrseq);
> > +     if (ret) {
> > +             reset_control_assert(adc->rstc);
> > +             return ret;
> > +     }
> > +
> >       if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
> >               return 0;
>
> [Severity: High]
> The datasheet note below indicates a 0.5 =C2=B5s delay is required after
> releasing the module-stop state before starting A/D conversion.
>
This delay is only needed for RZ/T2H and RZ/N2H SoCs where calibration
is performed; it is not required for the RZ/V2H and RZ/V2N SoCs.

Cheers,
Prabhakar

> With the newly added RZ/V2H(P) SoC that lacks the calibration feature,
> rzt2h_adc_pm_runtime_resume() returns early here, completely bypassing th=
e
> stabilization delay.
>
> Will this lead to hardware being accessed before the analog circuit has
> settled, potentially resulting in corrupted or inaccurate data on this ne=
w
> SoC?
>
> >
> >       /*
> >        * Datasheet Page 2810, Section 41.5.6:
> >        * After release from the module-stop state, wait for at least
> >        * 0.5 =C2=B5s before starting A/D conversion.
> >        */
> >       fsleep(1);
> >
> >       ret =3D rzt2h_adc_calibrate(adc);
> > -     if (ret)
> > +     if (ret) {
> > +             pwrseq_disable(adc->pwrseq);
> >               reset_control_assert(adc->rstc);
> > +     }
> >
> >       return ret;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009184122.13=
78797-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D8
