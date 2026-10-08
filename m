Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521663A641D
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477472; cv=pass; b=Sh7GMPNb/soJL6RZzZE3yr9YARRf5iOBwzEsIW/MMrqjKDbebqpn2VJhjHOFvJVcENyvJy6YwLW8R4OQY3WyAjSIAb5znwiUysylijE23AqoMk9v/ckERqa5FhhuKu9SWlMHZEeyJUsxqHiDRqpdKB8D9kilbM3c/za1i/upnBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477472; c=relaxed/simple;
	bh=En5U5u49w4UmshWqOnBCL/m93syLvZU8NeEuJpf26Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS65PnT0k+4hjsz2ZWZa38VYTJoDDmSQ74grhg8fWFRzlGG9UKdaQlwyoC0xWucJwWJvEbGatC/AeiWDbFKfYWOVCA1wqovHTp3izYOoB/ZKf3SvBbFflE5+NtRmtwyxQM2xrIm0SatUjPV8KOu+yP0OkJjfu6GNEtowMJ1OZMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxlCT1yr; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxlCT1yr"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49e1dbfe15eso1463278fac.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 09:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791477469; cv=none;
        d=google.com; s=arc-20260327;
        b=ruS48ofRqOfBCAW4XYAS31g9sHi/1om3lvyQq/AEKrfje+QKTJPz/jrd3MiG9Cofg/
         pf9uzEGweIvBadwS+KWpUqOvjQl67f6qOzkEX9+xu47GxcfoqJuDovngYK/Gg2p8fbc5
         zkD97i1HcZB0JWzuK90+wt6FgB5zh9CcTjgBQxYTUXZjFO1Ae0pBYH1ai5OHoW534zsa
         8hOKqR2wuT2ISnB/YQ8aNPPAFm4fNWxp94U4xV3yNkFvxzGzksi9UcUZw5WuKhqZOjgc
         DzUoaG2Td0rgP0fkUJM47TDGIgVH5HWy+0xa/kOjjRmOjZkRTDVLfvjQMDNlNkDhjH7z
         XUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWfZrABJb9vZdtlqeyCN1MT17SR0Qr3TXZnegaH4SR0=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=YY1K/SSytguzR8Z3sufUWlCOzh8KaI/J/0+6DBAd7r4uWKTltvTDMi/JbaCattgOOd
         Oh9g31JUuN9nmsmuZihlQeqrbJCkCl7iZi/Ud721xWC7FcyFn2TiVmM0FoE9T5Hq7Xfu
         BvQTwP+scmgdV2hGaR7x1pYdem974WEIOk1GkXG/mnthmZREYMXIds97D7Wq4IIyTdMF
         EF0iOoEhb9uN7FPoAPqv4Z5Q1EgYaRrdRPCKzIdhbhNxM2Ioqgz9Qk+b8/Y/SFdN8QHw
         a4Q/h0iCFBvduXlqvpFb0qndd+xFN2TkYpX9qHpNvH1454jAGgFbhwEx2+KCiagBhEYb
         nu8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477469; x=1792082269; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWfZrABJb9vZdtlqeyCN1MT17SR0Qr3TXZnegaH4SR0=;
        b=XxlCT1yrlmmAI8vYP+1pFa5A9TDWT3I6bLrRzadis4syOTDYoLNWQmBBsuAdtFHzLE
         MWBu7UlyH6QgbwPUIY0c1HD/xwLFoxvNViAPHYK9rFptp4k3tnLHSqlq8ppwKACwGDWa
         vJ+zpK1j4U3wwaMr2JJ6PbNYU8EHyraZbWcnbc1DbV2VNK+dcDraRWM3lGv1mRnY/ZSX
         X0x+sex/3DDpV6ov9BiLbpyBvO2wxylP7tiJat1rnXQnlclnCtA8N4EbFqwqNrTV6sQ9
         Gl5s7A7Or/5GtW7BsgHWux2WWrm6Br5eqxF4kKFKjhcvMn1uwwsJcSQ4rqov7RcY6qgC
         ePeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477469; x=1792082269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWfZrABJb9vZdtlqeyCN1MT17SR0Qr3TXZnegaH4SR0=;
        b=qkr5fDAsh/AZy/hLsxc7OSypzcrfq/VCPh+tCB+0guqy3i2Cqb84mM4QjlsOGSzB9v
         uzmIDvDunIq1TjoDK4o8o9fF+3aodwAntmqqvEWkBWTz+M5mp7uGSRqx7oKdLRFoyljb
         xY4PB+SixJ4L9LOVP02Ni28PcS+D2FjSVy/bEbTbaSosOeq+U2GIABiwyBIWmtviX06C
         lrYGfhUuwGtkYz+QjdjObyVUacCXHE+Qc5Dl/kIZaclbCXF2t3p2hnhxOXnz6WC/QvL4
         1JgUqjNzp0wLo2gwh12swyBkGNMXUe9Oi4tnQrBsMNGYqolygVcBLTMry9Zu89EoGOmf
         ORDg==
X-Gm-Message-State: AFuF++m7wv3eMYx/+UFB/HjjQnenLJwr4UzwqqZlIwz4AB/kKuZiI+ef
	qnhkULWxRvX0ynLIdMstClFCbb4FtTNhEJiQxcrK1zlbJPtLc9P9NJIDHBt4GOpeDpjTdIBIAwl
	ZaD86vjnU0Yad4zoh14am65rJcr5+5czpvKGCzDY=
X-Gm-Gg: AYBFou3HrgRDts21so61fKA+JzmMFvzVWOF4rYFq2Pojg1evleSRNJLDjHSwZzxF1hb
	WJ2xVdeZFKWdlA1PUabXC9rL8e5GjIMDKDaXR0J450PDziB5+VFBdoI8u1nkRkfTEnAmm835zfz
	bt5Jddcy6ITFVtE2jSTV8I5wr3XTnYsaU2PuUF9AAnWcQW/f6O3R4pUu9aupbVjzpbxXIjBqra2
	447BwDr87RuJluX8ltnRuRm8RvpzHf7+CQJO95qihvC8gA6XM/oC18nzSveETkelT0OhrYjFH7S
	CXK+yoaKXqmZsjGDHkSRvLl+UwILeyNM4xEWlmKASWPf+y9fezrt/1HOl1mKaDJq9nFm7SqjTnT
	8hPHYh9f8fQ==
X-Received: by 2002:a05:6808:50a0:b0:4e8:18ee:eb4d with SMTP id
 5614622812f47-4fc45d5e66fmr6923456b6e.20.1791477469015; Thu, 08 Oct 2026
 09:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008155727.3801095-1-mmyangfl@gmail.com> <20261008155727.3801095-3-mmyangfl@gmail.com>
 <sashiko-outbox-164366@kernel.org>
In-Reply-To: <sashiko-outbox-164366@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 9 Oct 2026 00:37:11 +0800
X-Gm-Features: AclHuK9fhidRIKiHbhhSf7GOuQfr19VhGOH1frhLvA-cSkV3GxZ1gjBKfdjhS1M
Message-ID: <CAAXyoMM_VD+g4Q3QUWfB90mjyWK4VO0xwq+MU0nwP=oN4-muUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] regulator: histb: add voltage regulator driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 12:06=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] regulator: histb: set_voltage may apply voltage exceeding max_uV=
 constraint
> --
>
> commit 800fca6de780a18cd0c58b4d9fc8681fea0944fb
> Author: David Yang <mmyangfl@gmail.com>
>
> regulator: histb: add voltage regulator driver
>
> Add a driver for the voltage rails on HiSilicon STB SoCs which are
> controlled by the PMOC block through a PWM signal, as described by the
> hisilicon,histb-volt binding.
>
> > diff --git a/drivers/regulator/histb-regulator.c b/drivers/regulator/hi=
stb-regulator.c
> > new file mode 100644
> > index 0000000000000..77073a646e493
> > --- /dev/null
> > +++ b/drivers/regulator/histb-regulator.c
>
> [ ... ]
>
> > +static int histb_regulator_set_voltage(struct regulator_dev *rdev, int=
 min_uV,
> > +                                    int max_uV, unsigned int *selector=
)
> > +{
> > +     struct histb_regulator *priv =3D rdev_get_drvdata(rdev);
> > +     unsigned int duty;
> > +     u32 val;
> > +
> > +     if (min_uV >=3D priv->max_uV)
> > +             duty =3D 0;
> > +     else if (min_uV <=3D priv->min_uV)
> > +             duty =3D HISTB_PWM_PERIOD;
> > +     else
> > +             /* rounding down keeps the output at or above the request=
 */
> > +             duty =3D DIV_ROUND_DOWN_ULL((u64)(priv->max_uV - min_uV) =
*
> > +                                       HISTB_PWM_PERIOD,
> > +                                       priv->max_uV - priv->min_uV);
> > +
> > +     val =3D FIELD_PREP(HISTB_DUTY, duty + 1) |
> > +           FIELD_PREP(HISTB_PERIOD, HISTB_PWM_PERIOD + 1);
> > +     writel_relaxed(val, priv->base);
> > +
> > +     return 0;
>
> [Severity: High]
> Could this rounding logic result in applying an output voltage that excee=
ds
> the max_uV limit?
>
> Because a smaller duty cycle yields a higher physical voltage, rounding d=
own
> the duty cycle ensures the output voltage is at or above min_uV. However,
> if the exact requested voltage range does not perfectly align with one of
> the 240 PWM steps, the resulting physical voltage might exceed the strict
> max_uV constraint requested by the consumer.
>
> Should the driver verify if the achieved physical voltage violates max_uV
> and return -EINVAL here instead of applying the setting and unconditional=
ly
> returning success?

The counter spans 240 steps, so a request off the grid is at most one
step (2.3 mV over a 550 mV range) high. Rejecting a 240-step miss
would just break DVFS: single-cell opp-microvolt is a zero-width
window.

> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008155727.38=
01095-1-mmyangfl@gmail.com?part=3D2
