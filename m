Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7E52E046
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932816; cv=pass; b=fD/h4QqgraNR/gyn2YCueRf0/fko5bhLPSaW/9xy3hHGQCD4PZMFSMM9eDavy4wkTVOs55R7GbZIf+r8JlPHGVJpBlobYi5ebYB+/XFWYHcAHDJl5VC9kBuTRwcJzVCPlCkpZ9YXRt7TftytX/IRZQ3xo5KqUFmPmJiKZtiK6fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932816; c=relaxed/simple;
	bh=OJKCxitzFX7Devyeo1RMIWQKY4aZ2+94sv/X63QES54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgcJ4Ep/bECVrN6FN9bv+UEL4eTriV+s3Bugo2FU0cwPmjGB43PLN74eJS3HGaj3C4O3uFE5fo/kJfvksh/fJPjIh12pAMzxCaB8G4RRNZBaiBZvEqC7+UX5O1VoGCs0dFwdjk+8GQKxr6isXPtOIQHRJRKhFcWQkq5J+LyQXyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OFpB1MgA; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OFpB1MgA"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8a83d2706fdso4634787b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 16:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932813; cv=none;
        d=google.com; s=arc-20260327;
        b=Bh6Rr2zKeRFvCe70L3R2CUg/Kdt821hE9OLU6Wx6XokuxSTmYZc8Mwqn2FMHsl1/5H
         XMIthFygypURBsmuzSIUSaoKAcnG9CJXr4EXn4F2a5rdR+7HvuQ7QwPscpj6ZiQbBLfg
         J9Jh5RZ9r1HICIjzRR/2Oxb5eK2F2HId2nmrbwAgNYC/XO6b55LcAM5/3lUO8uskZEiQ
         lgPB0glF4bIV1OGh22SIWz0zzavQCim6yr1q5s9/W3eN7R2a7Z9cEWrEXez5j2CGZbuF
         E4LsReePWLF8G2VTSlVY9/J2geUnvD0r+O6vW+zseO6HWVuUPfGfLVXggu/qfSbUGyTs
         yc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QntlmUV+IlR8FFxFh/1ODDrw2JuP6ngb9YrJOIy5BCA=;
        fh=xCbd4lM22LjB8IhAqx/zH6+NDsu/bNx6irYeEclNzxY=;
        b=eoo4H2xXB+mnIPMHXPhJlYRxbBsPnZ3kpFK7PoFvAUwIQv/OLzlwGX1fAdpQCGfuR5
         izsLSpoPoBJYTNCk3PMHAUqzAreyTCX/ksE6gvPp8DL5gD//v5z6U+tBRsFDNiPZzj5c
         a2G1Q87Z66mUVgGSQ6FtGkxgjJRaLa2XHrqNZ4t2cmSHJ+csa8l4iUiFzEXmDEFklRoT
         foqG681jkUhwN+6CvgVTonsUgyMfxHELWUVrVOFrfNJqe1K0Oc4maMwnvSPOD9mRlGpP
         +5t10y2AIIuB5bTOAW2WhLl4Hqnp2esR6j81KbwxrJQtb3scxg/ChdkcK81XJEf3iOEl
         sknQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791932813; x=1792537613; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QntlmUV+IlR8FFxFh/1ODDrw2JuP6ngb9YrJOIy5BCA=;
        b=OFpB1MgAD7oT20sSarX8dpHgG7c+SrhQ92r1Cd3yTaSEiWyqxVt3CTKvb8YvQJmUoP
         eDb7rA+CmsvSIz12Cwqq2nOyt5ul77KrmQ6Gbyf8dYo889JPoQ0UbyMU9Q0t1xTDqTum
         c/sU+W0n3pU5rl5Ze4ClTy2oz8a53gw/tj3s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932813; x=1792537613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QntlmUV+IlR8FFxFh/1ODDrw2JuP6ngb9YrJOIy5BCA=;
        b=f/l5Ekket3iiUFUiyEytaxciq0xnAYPvczHDyb10XNL2fBvdd7KBYFg4nXhMcsHZCr
         3wW4kTD7EnaHo3F3IRbUTOdmVp3yx2CjHfalQmBFVwgJyNDlkXKHCzgeUyOvWBT9eGT0
         mtEhBXfQ1tkH1+BoL+HZTy35KlFBAqFmHk/VDNSckzMPoYo8ZI3Nd/FTggdkJiqAQNLE
         40G//4Gx0xGZMYGrD2gNYHavaq+iGgCTX2uJzuMixHAlUBwvYxD1bcwBn4L0qDix46+/
         BfndGJOypnnxnfj4YCsowfdcIm3Wdf7GgFUitm0o55pTgP2jUhIvy/XO84qqPI06brYX
         xHwQ==
X-Gm-Message-State: AFq9FYJ/zSZaDJYcIqgcKap9hPmiKYqCqhvjL1fFwRqMV4qMvY7CBLkj
	ElxfEgjs15GpLv9XgzFJt+JRqChBd7bav4XGjOAff431sadHeOP4BNF6C0NdqQAcdqgLYs7cEBv
	apGPJ0bQ7Et9wiE6nH7GzSSk/yfIM9f/tQ8bpVHnvHmBSnNuhTzysAw==
X-Gm-Gg: AYBFou0Ij/6+RUAZOMpcBoDzMFPX4kjlnMlLAjDsYRUWrnADgMKsQYqhTVYBGWOuguq
	4Vs29mXaP01ynEaMcpshKhu5EyX2ueS9dB4G9IOaqUUbFJMh36fK6DnsCWzEOH0111a3PUKH/l5
	T0F4XqLkej6QDkUboNNU7uWBwSa40X9GfC3yyY1uE/4IW3CgDnNm4JamAmuQNzcbKqwDodR22Wv
	kGKGe+j6pY3tpqZxAogG6ZNVDByF7BxGy60dVsY9t4ivABuV5YR96LIbU9OMvC1YZs4teroa7Lu
	SusZQCCFgRx23FeW2hymu+B6Wq+KPVVd+E63ZGbo9bFjH5Je1qW0PSwW146m5bMcshCHoOi5E8/
	J+fnpYAMiow==
X-Received: by 2002:a05:690c:82e:b0:8ac:805b:3a6e with SMTP id
 00721157ae682-8b07edb832amr35007727b3.25.1791932813416; Tue, 13 Oct 2026
 16:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-11-384af01da3ee@chromium.org> <sashiko-outbox-166150@kernel.org>
In-Reply-To: <sashiko-outbox-166150@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 16:06:42 -0700
X-Gm-Features: AclHuK_EPiuPXQkmP4djXq_D1z67MVt8XUJL6Sx0kl0aGpRUcTZIlzf43HHn9kY
Message-ID: <CAEe3GZH07w_-Be--FnoVJXvOXtQ4pnjO1T8CMkejVaUFrVC9VA@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] HID: spi-hid: add panel follower support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-trace-kernel@vger.kernel.org, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] spi-hid: Inconsistent wake IRQ configuration for panel followers
> --
>
> commit 4c8d0ec463c5dbd300c392f3f924992096f8ebc1
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add panel follower support
>
> This commit adds support to the spi-hid transport driver to act as a
> panel follower, allowing its power state to be sequenced with a display
> panel.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > @@ -1577,21 +1676,17 @@ int spi_hid_core_probe(struct spi_device *spi, =
struct spihid_ops *ops,
> >               }
> >       }
> >
> > -     error =3D shid->ops->power_up(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: could not power up\n", __func__);
> > -             return error;
> > -     }
> > -
> > -     error =3D shid->ops->deassert_reset(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: failed to deassert reset: %d\n", __func=
__, error);
> > -             shid->ops->power_down(shid->ops);
> > -             return error;
> > +     if (shid->is_panel_follower) {
> > +             error =3D spi_hid_register_panel_follower(shid);
> > +             if (error)
> > +                     return dev_err_probe(dev, error,
> > +                                          "Failed to register panel fo=
llower\n");
>
> [Severity: Low]
> Does this sequence leave a dangling, inactive wake IRQ attached to the
> device when it is a panel follower?
>
> In spi_hid_core_probe() just prior to this block, the code checks
> device_can_wakeup(dev) and unconditionally allocates the wake IRQ via
> devm_pm_set_wake_irq().
>
> However, if the device is a panel follower, it calls
> spi_hid_register_panel_follower() here. Inside that function, it checks
> device_can_wakeup(dev) again, warns the user, and forcibly disables the
> capability:
>
>     if (device_can_wakeup(dev)) {
>         dev_warn(dev, "Can't wakeup if following panel\n");
>         device_set_wakeup_capable(dev, false);
>     }
>
> Because the capability is disabled after the IRQ is already requested, it
> appears to waste resources by allocating an IRQ that is immediately rende=
red
> unusable. Should the panel follower check and the potential clearing of t=
he
> wakeup capability occur before the wake IRQ is requested?

This is harmless: devm_pm_set_wake_irq() doesn't request a new IRQ,
it only marks the existing one as the wake IRQ, and the PM core only
arms it when wakeup is enabled. i2c-hid has the same sequence (the
I2C core sets the wake IRQ before the panel follower check).

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D11
