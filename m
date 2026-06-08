Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB753E5598
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949528; cv=pass; b=L8PPu8M8RIW26hlqZ5Hf30ihsc1njp41WlWzPOvyyZQx4ZzyPHY9grt9LxeShGs77JYieiDg4ElIg/26DFlgDfTR2smRCoHhVtI2qW7FmIYbi9qnCS4IEnTE5GxkefZEhYeGAg8QJHnJBI46ywi/ygHkvV5qLrv2Nwyt6UrwjuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949528; c=relaxed/simple;
	bh=XpWX9cWXke00UbnzVbKTNfQkbY13yCLNrJPtZCI5UMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjeS+JCbHFk0iNDktLhFUPFUPASHGAKwU1VWVYzvhdwqJ5c9bwoq2/w7IDQDgGUqb9jNjkjzVowWJpWXSL1AzUnOpexPmxKxAjqBlMDy7p61HXa+PW4VH5AAyV0wWnL3l8lZdglzUFLM9IMzpvjSaZ2OKKklC4hKqIw6nKP6AYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M17h9Hlz; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M17h9Hlz"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso8381148a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 13:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780949525; cv=none;
        d=google.com; s=arc-20240605;
        b=V+Hb/Gd+xWSRFRwgwg4kng2qRL/XcLH5WoK5woYXr9j8S37oa5MJwwDjhW8JT+PKUZ
         qXKedAaKGk/afqx1MCZEFxNFtrRZMDrUy3Rl02t9xVWTQ2DGqU9xa1gaDhBOFMkqy+L1
         CRm2XImha93RkYLvhh1QJdOcFIcbtd47yfMZdufobd80rAuxJ4UfOCT/Do645UMr1IQl
         /drUawSVbhxgyUfuRSDdwEg76Gd3CyJSww99SSI1a771JdpWhUVWlvQ8TBnpdXRfsT9w
         0F6GwqiIc0vnilrRUNoRF5JxeQvGY0V3dyJEET+vRM/2cCecP4XELlP/2+dsAzcDc4+y
         qS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ie7erbFYSlxKVKBCuZe2qFzsyOhWMnLPIgWKaTSeC+Q=;
        fh=H+gwCkcjSbequB1Ok3qiGVepWvNJo9Y477mtJdrNMpU=;
        b=cO7THpRZ7HlXR+3zmFYqwFfonrPgWhOiWs0rzFdLUpcJoNdHMNoGupSJjBsDs3U8NZ
         zd4pBXCbD6uuWt605nASNIS0D62FXLf+3xvtZy3xgduQ6lSZ0yRrn3mXhHL20NZ/ukFZ
         y0jPRvqeUIQeyunDh/55yk6xpaQjBOIQE5ZAeDQLW2EsVtBYx11jJEbJ5n3wn901rFmr
         NH4AeFJeO1pYd/9fA+sjYnp5ovgak8qtj6xdgA0qtpnR031PeK655L1bH6x20i06jPed
         rcPyLRbJqLq03sFAQ9N+rfZBMgHHx6wCbmj+wBEq857nn8aZwwP9JLJIkCezI6pHUSDx
         hBDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949525; x=1781554325; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie7erbFYSlxKVKBCuZe2qFzsyOhWMnLPIgWKaTSeC+Q=;
        b=M17h9Hlz3m8PTqXzQciWWyK8VVL3NxJUqhh6/EPqFU7dqpOps6X4ObNi7WxZoKi1p1
         rJtw7K2keq72jd0Tc7qoAWh26lPpwe1SHUWYmNAT3p/+gd49b6f4U5cKr9k4dL2wcZw8
         CtFhNjog0ntbSXDCa1NYaD013xd5ip6jVwWWuNsfpAmFHoHdcx2DhGkcbNElNS9qmdQE
         uvxx79I2sX4CPdbUczKXBB87HMyABQPuWpOX8ORw/z6tmUOwenrKLpcVQf+o4Khja5Jo
         vTmb88YGRoirSGrog/v8QFI/Xd9Jv/NcH1+ulqh2Tj1/eJ8czpYvWz0CQVMEo9coGagH
         /oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949525; x=1781554325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ie7erbFYSlxKVKBCuZe2qFzsyOhWMnLPIgWKaTSeC+Q=;
        b=NMdrDTU8ndx+H74YYW2qeGYgux2dcgnf23egD8c29aTWGiRdSdriV/dxA7J07DVuuY
         7NxaD7Whm4SWXY1gUrt0Sl5CWPxQqXEpXSUteFgppN6SWzhGqBQ7G6CFBJEpRQHPLUck
         oMxIIyl2BDE9sMdsJd0WN3ohdMnlpg7Swv8igSxkKs2zYiIFTePMQEW3cGlSizhDbYpt
         S3b0pz4cnuIcAeSE9zw0I7/e38qdISsj15HXleRYais//e38NeSUbUzZT16MlFhYUpAk
         kANXOtCqDeBGfTAheSyThI6m/jerTx1BiIGgMVhggGQ9D4qrxYesfV/j9jGmqUVzbwUy
         gEGg==
X-Gm-Message-State: AOJu0Yw6txP1m8uyFpYU9QRZMdSpkBhB03Hnd147IWY0LfjciNSw/Gx4
	G3Yz5gieE3TeuHo/Vz+5sRo0FRHJr8BnhIaWW7md4W//2ffjJ/i1BHs+5bgE4SGDFBnyo3uZPv4
	vhe893XMsc+kMknh/asZ/EA455svUI30=
X-Gm-Gg: Acq92OGZhKLzIsdGuB1Y4WULYXifgX4iqlLTu2RIEdMdoGxx18Z6dfjU+HnEqE4Uarw
	hbzEWiQce9DXIZ1xmBdFQaB29IhJZi4V3hrptefc+lOg3QkfR4oBotFMM8A8hl33KhOfLXlNupx
	dK2aSLWzIK8MIOqM4//JLbh/pSKHd8uepFrMDnT1G8eEWKE5XmmyYTlULJzvTetZE/kPvMXqXbz
	e866E38Uiu+zgSoIWTm254S9jmqoW+AKm+vXwpNPFfWY3pcd6hMZgRCZiLmUlaXdjrbyMm/KsrM
	IJUfVSN3cQiCm+k3R469tnBVNUlLyrZ0danJm5+1Er64KLizWMykPOlGsnQQbTnSVPBR7HS3ntj
	9kcDtOcxPMX+R9y1bLEW6jxJVOZv0tJ78DsKQE8UyMz1MB40fWetXvEtPH76Xg23Oosit
X-Received: by 2002:a05:6402:5251:b0:686:9c15:3121 with SMTP id
 4fb4d7f45d1cf-68fa504626bmr8950050a12.12.1780949524804; Mon, 08 Jun 2026
 13:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603005409.226774-1-rosenp@gmail.com> <20260603010104.56C0C1F00893@smtp.kernel.org>
 <19f5c865-0ec6-4079-bb77-cf6f203723fa@roeck-us.net>
In-Reply-To: <19f5c865-0ec6-4079-bb77-cf6f203723fa@roeck-us.net>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 8 Jun 2026 13:11:52 -0700
X-Gm-Features: AVVi8Cco_r-TKhhvTrePrN80x-Q28yG193uETB7XGTu_bg9HZx4eXDdMssZYVGw
Message-ID: <CAKxU2N8SwOzGqjoVrOGQm3fwrhp8M_Q7JGwPFQjOv8y2ubJeTw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: sama5d4_wdt: use platform_get_irq()
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 12:26=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 6/2/26 18:01, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > New issues:
> > - [High] Assigning the signed result of `platform_get_irq()` to an unsi=
gned `u32` variable causes the `irq < 0` error check to always evaluate to =
false, breaking the driver's fallback mechanism.
> > - [Medium] Using `platform_get_irq()` instead of `platform_get_irq_opti=
onal()` for an optional IRQ causes spurious error messages to be logged.
> >
> > Pre-existing issues:
> > - [High] The driver registers a shared interrupt handler (`IRQF_SHARED`=
) before setting the platform driver data, creating a race condition that c=
an lead to a NULL pointer dereference.
> > --
> >
> > commit 7ff7f2de154616b7a42f6e5710f322b20ff6152e
> > Author: Rosen Penev <rosenp@gmail.com>
> >
> > watchdog: sama5d4_wdt: use platform_get_irq()
> >
> > irq_of_parse_and_map() requires irq_dispose_mapping() on failure. Don't
> > bother with it as platform_get_irq doesn't need it.
> >
> >> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4=
_wdt.c
> >> index 13e72918338a2..d9b212557ce36 100644
> >> --- a/drivers/watchdog/sama5d4_wdt.c
> >> +++ b/drivers/watchdog/sama5d4_wdt.c
> >> @@ -286,8 +286,8 @@ static int sama5d4_wdt_probe(struct platform_devic=
e *pdev)
> >>              return ret;
> >>
> >>      if (wdt->need_irq) {
> >> -            irq =3D irq_of_parse_and_map(dev->of_node, 0);
> >> -            if (!irq) {
> >> +            irq =3D platform_get_irq(pdev, 0);
> >> +            if (irq < 0) {
> >
> > [Severity: High]
> > Since irq is declared as an unsigned u32 earlier in sama5d4_wdt_probe()=
, won't
> > this irq < 0 check always evaluate to false?
> >
> > platform_get_irq() returns a negative error code (like -ENXIO) on failu=
re,
> > which will be implicitly cast to a large positive integer. Instead of
> > gracefully falling back by setting wdt->need_irq =3D false, won't the d=
river
> > proceed to call devm_request_irq() with an invalid IRQ number and fail =
the
> > probe?
> >
>
> Please fix the problems reported by Sashiko. That applies to all your pat=
ches.
Done for the reported ones. Sent as a series.
>
> Since it appears that you are fixing bugs based on issues reported by AI =
agents,
Difficult to do given how late in the merge window this is. The other
issue is every time I fix bugs reported by sashiko, it complains about
new pre-existing ones. Cat and Mouse game at best.
> I would kindly ask you to fix _all_ problems in the drivers you are modif=
ying,
> not just a selected subset. In this specific case, the problem below is m=
uch more
> serious than the problem you are trying to fix. On top of that, the fix i=
ntroduces
> two new problems while trying to fix one. That is not really helpful.
Agreed.
>
> Thanks,
> Guenter
>
> > [Severity: Medium]
> > Will this log spurious error messages when the IRQ is genuinely absent?
> >
> > The driver treats the IRQ as optional and handles its absence gracefull=
y.
> > However, platform_get_irq() internally calls dev_err_probe(), printing =
a
> > core-level error message to the kernel log when an IRQ is not found. Sh=
ould
> > this use platform_get_irq_optional() instead to avoid confusing user-vi=
sible
> > error logs during boot?
> >
> >>                      dev_warn(dev, "failed to get IRQ from DT\n");
> >>                      wdt->need_irq =3D false;
> >>              }
> >
> > [Severity: High]
> > This is a pre-existing issue, but does requesting a shared IRQ before s=
etting
> > the platform driver data create a race condition?
> >
> > A few lines later in sama5d4_wdt_probe(), the driver requests the IRQ:
> >
> >       if (wdt->need_irq) {
> >               ret =3D devm_request_irq(dev, irq, sama5d4_wdt_irq_handle=
r,
> >                                      IRQF_SHARED | IRQF_IRQPOLL |
> >                                      IRQF_NO_SUSPEND, pdev->name, pdev)=
;
> >
> > Because the IRQ is requested with IRQF_SHARED, another device sharing t=
he line
> > or a spurious interrupt could cause sama5d4_wdt_irq_handler() to execut=
e
> > immediately.
> >
> > The interrupt handler calls platform_get_drvdata() and dereferences it:
> >
> > drivers/watchdog/sama5d4_wdt.c:sama5d4_wdt_irq_handler() {
> >       struct sama5d4_wdt *wdt =3D platform_get_drvdata(dev_id);
> >       ...
> >       if (wdt->sam9x60_support)
> >       ...
> > }
> >
> > However, platform_set_drvdata(pdev, wdt) is only called at the very end=
 of
> > sama5d4_wdt_probe(). If the interrupt fires within this window, won't
> > platform_get_drvdata() return NULL and cause a NULL pointer dereference=
?
> >
>
