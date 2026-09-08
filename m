Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D7387599
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871231; cv=pass; b=KMTdsXZirMwo/YSbtE9R5n4B6ayDKwaPCLcEoJ/yRX7Kz9Dw+fRicD/2H6jVb/XdF+ykSTrwyDLwJ6EqFoqLo/6Hqaw1VOEvk89KHSU3RSVVt0wyvZzSjY3Y/RyDZU36SUVgG55tpstLr/cAGaIlZ/t6dIfpiYq/Qs9w3xf7NN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871231; c=relaxed/simple;
	bh=evUbGcFID4QtYm47NxKIeUMU4pgUbDtSy0vYOfpxyuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/k/1+R14cxysksM7k7IzbBbc0XD5aFQxJ/Igt+mEp/QkTyOc2BtPWvCL/302Fo7xtd3I6oYk9c+pmtv3L/Cjq9bB7TzwEP4rBOnkuw2+ig16UzGxNC6Wd5dpfmfrYk6k5EOQ+ZLS9e8fPAxSjVdzktM8dJfx3cQjJ0YDtFSNoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaRL8lun; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaRL8lun"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4859b45abadso279382f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 05:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788871228; cv=none;
        d=google.com; s=arc-20260327;
        b=gZS13/x4mW03bIp0nn3LwN6n7BygRxSVxLKtO1R2VROhG0MDUrs3ZrNC6Gfr6EnH7k
         mDnflz3J7tWFf4lcy+B4HpNhet6RGXohn1BV4WZRrioGd+cHGKPRmZ1d0ER7G/EgRXtH
         QI2ZiIioOhyeycdbZWdpuq7/p7PyD60BQ4vMRPLWYON0Bd9p0iYgFncUWTyw9Cy11nZx
         Ig8GF/1w86VSUFp9BXbksvUkwe/xE2ptfgSK9uQvBwL9eNeA10XbSD1XXvSV0Wwr+nfI
         B9Sd+3ngvrntsAvJaaNdtgqkkI9YfQyJXJZpQlu609M82IwDR6J7V0qDG9Y8lKEoxJEo
         YbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NgeaoDrPPQqs3i7AVciPBqV6bEiju7BB54wKAc+G8xM=;
        fh=orp1a3sw37+koAzHJzM3c7ZyU2UhSdEZSlOETZqrIxM=;
        b=CDkyvDnxrTpb0ngGRg2eXY3jKHWnQwbchM21jToA0KpPVy8K0HJ3QzMw8fTHSLtA4e
         OSo0zJwJnp7gxx1s8TZ4y+RTSHaIlxK3UnBxBYFSfDJOoPbu1R3zE0F67nhlj1Oa7HI5
         mZQTV0GNolcOXHqgcRvgX+uBAH3x9Ey5Trd2RYkhqUbFFbUrUwy/eTuRgUNiYC/sQM8Y
         Gt+9kRpGjHLDtatotu5fSQb8CSKZsCAyF4Dj7PR9hhWrQ64uHaAs3UTwOghNReNPD1Nc
         WMI6GI7hchPIAPFMUqpR/h86ZtVBGBFk9jc3mbJxdT9wrItgJTxcD7VXMqbzmElN1IW9
         0NqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788871228; x=1789476028; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgeaoDrPPQqs3i7AVciPBqV6bEiju7BB54wKAc+G8xM=;
        b=gaRL8lunET/LxfvBRlEPkpSa28oOxn9gy3Uhl9RBJ84rv9TZMkuuPVJSteE72QsNPC
         P909wAunPjaSE8/sKJLmaj5+SylV7JiYKZN5W/JGiRfepEeHmy2w2Kx86swTBUyEc3na
         mTrJun2C4qFqGgFA24HPKOATqRVWZCuEGhTuvy/ctPq9r9VBP24frIgGMKas+7bpedHG
         cbLMqmaPku7neyc8NBx9K9D51e3mPru8cHnyXCZXocX9Hzmp9bRW9iIRoJ8L1cb7oe3H
         HeQmfJ8BVDhp2tqw2o+MiT+MdY2d0C43FZQ854hDOfYC3uEim21FCpXhffsjCsCN5AAH
         vx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871228; x=1789476028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgeaoDrPPQqs3i7AVciPBqV6bEiju7BB54wKAc+G8xM=;
        b=lPZbPrOJwJO4deZP2wsww+I/4YKS3qgxZd6au8TAiLtPG7Uz/Q5to2lVKrWtkZ5NvU
         aCYMncOPpJH2ennVbTmXArREQcNKCGTpiKHoRzDjc4A4h0KvIdAUE69pn0D8aNlinm6/
         5dl4359CJW2fecK3G255ulzLkjN28YUCffZYM3z9lhcHEKKTb1Hm+fQ5vFcN9qR3AJ9T
         uFemelV8IHjwux3tuI9YbtE/uTn1Ii9DhI1AIOMefhyaGtdzrc/73hHE3107jDsj0DV8
         dgIZlTNyEFk0sSkWjwOSggi6I1/wZfqZq6wjc+0XGPC/vTE4Ez0K1AalP6dYK6Ju3zai
         uJuA==
X-Gm-Message-State: AFuF++myYuDJJR8PziyI3/U7VlweLOC9XWJZVFLagC+YVNI+pCJO4+fq
	bnJ8D9yw4I0N4rfrmrDdNGMj+VkdQ0B2R4X3dSQn4jyiKHGDY9GN30Y9zljJJ8r+r2quRAkVMrK
	PjHZpaDGp8zBW0FnpQ4wdvqOTw2FbWB9zEriyleM=
X-Gm-Gg: AYBFou1Z8PczSjyBm+TY3oCv1AtP9MhiC2WNcF1tOTRpq7HicFHLBR5RauF4JAHwLEP
	KjgPxsu5drtbGKUt4/shzdeur1df8paqFY5JxCBIbAbg/KFsk+hNdAmC7Qt5D9W5voaZyIS2eY+
	YJPMhaAx2v54TL5NusEFkh4GB/vwRjh4YItI2TAarMwyC3pFOluO47ZLOxjSZSDJ1EZkwLKXKdu
	TA8UZ+jIIiMPtCxgUisiNNFEq/GpQcAW9LH/T1HtalIV/hsb4yOk7xVgUBbwryQhRBXxYehdP52
	TiRLP8nsDq9e83jiueBJcJHmSkVvj5pbrkBmarchUHH0hQhUn4RlKzh3GChWTmIG5qhbkwWFRzC
	YZBicktDYjPYxP5rWx2DbRIq4vmrD0N8=
X-Received: by 2002:adf:e19b:0:b0:485:a410:63fd with SMTP id
 ffacd0b85a97d-485a410656cmr5381472f8f.35.1788871227613; Tue, 08 Sep 2026
 05:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814191415.2110732-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814192638.EA99A1F000E9@smtp.kernel.org> <CA+V-a8u4_gziwgevLUWwPkhkm2TbQXJhwFMa9ug8MAss+aZcug@mail.gmail.com>
In-Reply-To: <CA+V-a8u4_gziwgevLUWwPkhkm2TbQXJhwFMa9ug8MAss+aZcug@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 13:40:00 +0100
X-Gm-Features: AcwNN1VertBmr010y9sYBgWuN3rvRKIh5jFb3iZYSUlr3P1nhOJVBI0pBF_CfNw
Message-ID: <CA+V-a8sd8w9Lhh8vFangc7VY4_1eUtLFRQK2vvJ2kaym-9GRPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR access errors
To: sashiko-reviews@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Cc: wsa+renesas@sang-engineering.com, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:22=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Sashiko,
>
> On Fri, Aug 14, 2026 at 8:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [High] Error path unwinding in `rzv2h_wdt_stop()` leaves the watchdog=
 hardware unconfigured, causing an unintended immediate system reboot.
> > - [High] Aborting the `restart` handler upon register access failure pr=
events system reboot and hangs the system.
> > - [Medium] Using asynchronous `pm_runtime_put()` on the probe error pat=
h leaves the device permanently powered on.
> > --
> >
> > --- Patch [1]: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR acc=
ess errors ---
> > commit ffabc27a1b8e9074dcd4cdaba7bc802a6d661fcc
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > watchdog: rzv2h_wdt: Propagate WDTDCR access errors
> >
> > The WDTDCR helpers currently access the register directly using readl()=
/writel()
> > and therefore cannot report failures to their callers. Make the helpers=
 return
> > an error so their callers can propagate failures.
> >
> > > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wd=
t.c
> > > index 3b6abb66a1da0..b770226f785ea 100644
> > > --- a/drivers/watchdog/rzv2h_wdt.c
> > > +++ b/drivers/watchdog/rzv2h_wdt.c
> >
> > [ ... ]
> >
> > > @@ -171,8 +181,13 @@ static int rzv2h_wdt_stop(struct watchdog_device=
 *wdev)
> > >       if (ret)
> > >               return ret;
> > >
> > > -     if (priv->of_data->wdtdcr)
> > > -             rzt2h_wdt_wdtdcr_count_stop(priv);
> > > +     if (priv->of_data->wdtdcr) {
> > > +             ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> > > +             if (ret) {
> > > +                     reset_control_deassert(priv->rstc);
> > > +                     return ret;
> > > +             }
> > > +     }
> > >
> > >       pm_runtime_put(wdev->parent);
> >
> > [Severity: High]
> > If rzt2h_wdt_wdtdcr_count_stop() fails, this unwinding leaves the hardw=
are
> > out of reset but unconfigured.
> >
> > If the stop operation returns an error, the watchdog core assumes the
> > hardware is still running and immediately issues a fallback ping. Will =
this
> > ping against zeroed, unconfigured registers start a zero-length timeout=
 and
> > cause an unintended immediate system reboot?
> >
> Agreed, I will drop deasserting the reset and add a pr_warn() message.
>
Actually, it deasserts the reset and returns early, so the pings will be fi=
ne.

Cheers,
Prabhakar

> > [ ... ]
> >
> > > @@ -234,8 +250,19 @@ static int rzv2h_wdt_restart(struct watchdog_dev=
ice *wdev,
> > >       rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
> > >                       WDTCR_RPES_75 | WDTCR_TOPS_1024);
> > >
> > > -     if (priv->of_data->wdtdcr)
> > > -             rzt2h_wdt_wdtdcr_count_start(priv);
> > > +     if (priv->of_data->wdtdcr) {
> > > +             ret =3D rzt2h_wdt_wdtdcr_count_start(priv);
> > > +             if (ret) {
> > > +                     if (!active) {
> > > +                             reset_control_assert(priv->rstc);
> > > +                             clk_disable(priv->oscclk);
> > > +                             clk_disable(priv->pclk);
> > > +                     } else {
> > > +                             reset_control_reset(priv->rstc);
> > > +                     }
> > > +                     return ret;
> > > +             }
> > > +     }
> > >
> > >       rzv2h_wdt_ping(wdev);
> >
> > [Severity: High]
> > Does returning an error here prevent the system from resetting?
> >
> > The watchdog core's restart notifier wrapper translates an error return=
 into
> > NOTIFY_BAD. Since NOTIFY_BAD includes the NOTIFY_STOP_MASK bit, this ab=
orts
> > the restart notifier chain entirely, skipping any fallback handlers and
> > causing the system to hang indefinitely.
> >
> > Should this restart handler make a best-effort attempt (perhaps ignorin=
g the
> > WDTDCR start failure) instead of returning an error?
> >
> Since the register writes aren't succeeding, it implies a serious
> failure with no recovery path, so returning an error makes sense.
>
> > [ ... ]
> >
> > > @@ -266,11 +293,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platfor=
m_device *pdev,
> > >       if (ret)
> > >               return ret;
> > >
> > > -     rzt2h_wdt_wdtdcr_count_stop(priv);
> > > +     ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> > >
> > >       pm_runtime_put(&pdev->dev);
> > >
> > > -     return 0;
> > > +     return ret;
> > >  }
> >
> > [Severity: Medium]
> > When rzt2h_wdt_wdtdcr_count_stop() fails, this returns an error that fa=
ils
> > the probe function.
> >
> > Does using the asynchronous pm_runtime_put() here leave the device powe=
red
> > on?
> >
> > Since probe failed, devres immediately calls pm_runtime_disable(), whic=
h
> > cancels any pending asynchronous power-management work. Should this be
> > pm_runtime_put_sync() instead, to ensure the device powers down before =
the
> > disable occurs?
> >
> I'll create a patch for this.
>
> Cheers,
> Prabhakar
>
>
>
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814191415.=
2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
