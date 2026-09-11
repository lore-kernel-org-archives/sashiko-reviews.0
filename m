Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315E44F55E
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128742; cv=pass; b=kA2rhnVfDvEDzXu4CcO1niFgH1bLCAhCCrAMBDl3HogaFg77Xq4MAV7eT8wFcmz6GAPDJr0ujE5guf1mfX+2/UA+CHdPn1BygAzvp/y1yAMzzY3awPy70+QjYOZTjdVk9TPlmyjNwh0zYqqFwBXpYwr4yMdGArKYSuZRmSRTK7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128742; c=relaxed/simple;
	bh=y0XIFCeENQJqN8g/vbt7VAjbJq+Nz3Xv9yF4zfVVk+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rh1Bu5p67fW0LclTKhhDDNogVgMW+fVnT+DKYlElG3/mu/nXceSaTDUJ3I9yDTnYX3W6A2i+eFghZ6f39Es7K5kncBukO4/UZpZIYaixseEvZqH7lySojvCIX1VRT8JwS8VYTFAyi0w9llv9XwsoyB9g9T6ZVEIDonr7SOUdVkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If9vl4bF; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If9vl4bF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so5378475e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 05:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128737; cv=none;
        d=google.com; s=arc-20260327;
        b=A3VhRTNzrnoMZDmInaray4ntmfPj/EwTuZMX9XitbIKxTyIiGMbS5Yyyr0gjp4YoxQ
         45ElNcWVVzQJ8hjOJurFtRxH9juTVpv9gdvURwExCwr2ZEIcSD39ZaIT8zX5IHC0N0ab
         DzordqGTs/NeLBTf0jSQlmQ1EUnxSyOp8eZMQ+M6AMFwSAja/sNWp2EVI74TvbTUA5TQ
         H9fRgJxR4X1cNqKFB1qMh1MK/LWNPD5CyC+PuxQyvyLA+SZnNrsFonxdfTuFcgcwvq+h
         tsXe5x8CSlr9DO4fftwtNPupFooif80kqS2QxghWECtL3WJUoKIbA8rAILvYe+D9rT9N
         p3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNwnWJHPLgasWdBDmLTUGAni7FNn6xt21s/9H9MyjEs=;
        fh=Tz0qR1+jy+od0xGo0PqPYoqksvdyYInqvLjrFUTOaJo=;
        b=CbaNERt3FZwo+WPN7R7IVa+XykzHdFoNwwVLji3hNNzEwRE6LkSK1RWyPCM78J/zfG
         yxeGaYE9yYripHedEYJfL4uXj+lDUmlq6Ager6uNooOQusFguWkMRlTdt/ifzWDgFgOt
         SBG6PjTZgBpxrpXmZfTxtxxcD3MhkIdvjWnzRU8dSB/+C5WimL8ini7PWGYrbUWc+4F9
         O6fJuHzOYDJkX1mcJFYlrbEfOxIr/qhpnxJ9MxH1BMn3bledJfQ3zGcVSVpTEEa6kNGr
         RZvQyvbfDugvLo8qORksDAjJLg9wcDYlreMa9oXlQTeMyjFKSUP5zgj0apNpYnEyFhn6
         dnxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128737; x=1789733537; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lNwnWJHPLgasWdBDmLTUGAni7FNn6xt21s/9H9MyjEs=;
        b=If9vl4bFJTlbERYLA44tnRsWHbc9WRqyKnqEm+WxtfgPodlgF2AwWFx0Vubj/nkUcz
         v35/Jgzgre6Uh/YlGd8b+VTFK+AY5EhBxGIdKoUW5bAmHdk9BcZMkHa1zqYNMEHe7ORG
         IqJXVy0nO18+OW5HHTGWvNlfzurs/9P8TAaojexl1i8EaNCY+UGUZf/8TGXONeKeQt2d
         9jPq+qzrRNSTVYu6Hhgxne8gblOg3oeB/1uuzaQRI9/AT8H94bITFJtwRWZAsVZxsQmU
         u23TELST/Ft/xVhlcuCB4Nf1y288IRTcYzJn25lJ1+u+RvBo0yHCP1q5oDVUWQ49bc00
         eiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128737; x=1789733537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNwnWJHPLgasWdBDmLTUGAni7FNn6xt21s/9H9MyjEs=;
        b=nGLeC3t30QTnFy8Ga1kxzz8WcTN+Yqi8U7TVtUd3xjBaDoIYYo0I+K9XmZruupXrsB
         5KGXb8hXCy9JHC6kX+EsSL0rPtNSer2700IIdIXZYNUdpbh9dh5pijTuwykYV+4RLd1S
         Gj1gRl8kuYwTDWcfWhC6LK2NPyyp73uXeV7pFFwrokE2twW2j9KyweEKoO3K269Eo9Nz
         6ijXrLzmihsUzCuJ3/vkaNoTp6JPOy/S78O011eM3GWHBK3/5wKPnwLR4MgB95StZq7U
         IAa3WOzsNlRUrCTWmirGS8XxNCsPRS7++arAfKR9mvUlBueM8n/83HcnqALAoPobkPVd
         e+Dg==
X-Gm-Message-State: AFuF++mpl0ZuKphO+hfb3CgrHXWqLV+/F0qvblk6u7WR2JRIgN9eyqqc
	u9WP25Ji2V6DEm6lU2ML2J41gBVEf4sZhmaYFqSJgHbMHJhNH5INbJrpCExMYMHn2wqm7dW/31x
	cK+rgdgwA8YRKx/I+Zi4AFwpUltjBvRFVhHu1mKNFfg==
X-Gm-Gg: AYBFou3U3WQonWid6V13tuG3/m1kEh5MNTJ95+a8q9iXUBearmqFbAHCcrHshrL+5bZ
	SLEyWO9ciy8d1zs5xgj/tv2sRHbgPtnKKRNb8El0MKvn78DawKc5EQfdHoXeG7ciIBqxPuK+yDR
	IY6FaRFbD9u1HUYGMweuETrUOlVCVRofSPrwB9bVrQH/TVO5O2E17MfXZppxF3R8tr8Tq29gOst
	RxanzYFHN8a8O54HnAL9OeowjWqVyJofLmJQm13VhiPKrsKJk515rIR+Ju3/9tYopM/jtpfe9/6
	DitGrVoN0nZYa08JUbTlA9ObXfmxZ28WmPYkt1B6we3vyuHf0TJs+NLv+tSKcmogl7R3yxWvw2h
	lMCJyJvYfWsVu9VHkB+MSBJWZ1OQt97ma6t3TMESTJM/6CLZbjQz5tp5Z9GhyQwVXxFZehr54Q5
	aRYxS9L9Zz
X-Received: by 2002:a05:600c:1385:b0:499:a5c8:c6f3 with SMTP id
 5b1f17b1804b1-49e61878ab9mr68367055e9.3.1789128736767; Fri, 11 Sep 2026
 05:12:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911112713.355FA1F00893@smtp.kernel.org>
In-Reply-To: <20260911112713.355FA1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 13:11:50 +0100
X-Gm-Features: AcwNN1XOUOwZDNjKd0fMCAdW1pC8fPronyNs541sSWVf7U32M71-UP3UfDUWtnw
Message-ID: <CA+V-a8vH1yC_7V2F9HGMaP2QhuyU+qSXd_J2BAvn5aT-0CH61A@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] watchdog: rzv2h: Use pm_runtime_put_sync()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-watchdog@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 11, 2026 at 12:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix: rzv2h_wdt_stop() still uses asynchronous pm_runt=
ime_put() during driver unbind, risking a race with pm_runtime_disable().
> - [High] Kernel panic from division by zero when the optional 'oscclk' is=
 missing from the device tree.
> - [High] Missing NULL check for of_device_get_match_data() return value l=
eads to a NULL pointer dereference.
> --
>
> commit a446e675679ece36ef9554b71239f1b2c12cce73
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Use pm_runtime_put_sync()
>
> pm_runtime_put() may trigger the idle check after pm_runtime_disable()
> is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
> runtime PM active.
>
> Use pm_runtime_put_sync() to ensure the idle check runs synchronously.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index cbf414e0c9a3c..4a5a856060e91 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -270,7 +270,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_de=
vice *pdev,
> >
> >       ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> >
> > -     pm_runtime_put(&pdev->dev);
> > +     pm_runtime_put_sync(&pdev->dev);
> >
> >       return ret;
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but it seems there is another
> instance of this same issue in rzv2h_wdt_stop(). During module unbind, th=
e
> devres cleanup triggers watchdog_unregister_device(), which calls
> rzv2h_wdt_stop(). This function issues an asynchronous pm_runtime_put():
>
> drivers/watchdog/rzv2h_wdt.c:rzv2h_wdt_stop() {
>         ...
>         if (priv->of_data->wdtdcr) {
>                 ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
>                 if (ret) {
>                         reset_control_deassert(priv->rstc);
>                         return ret;
>                 }
>         }
>
>         pm_runtime_put(wdev->parent);
>         ...
> }
>
> Should this also use pm_runtime_put_sync() to ensure the idle check compl=
etes
> before the devres cleanup calls pm_runtime_disable()?
>
Agreed, I will update rzv2h_wdt_stop() to use pm_runtime_put_sync() call.

> [Severity: High]
> This is a pre-existing issue, but I noticed a potential NULL pointer
> dereference in rzv2h_wdt_probe(). The return value of
> of_device_get_match_data() is not checked:
>
> drivers/watchdog/rzv2h_wdt.c:rzv2h_wdt_probe() {
>         ...
>         priv->of_data =3D of_device_get_match_data(dev);
>         ...
>         switch (priv->of_data->count_source) {
>         ...
> }
>
> If the driver is bound via sysfs without device tree match data, could
> priv->of_data be NULL here and cause a crash?
>
> [Severity: High]
> This is a pre-existing issue, but could the clock rate calculation result=
 in a
> division by zero?
>
> drivers/watchdog/rzv2h_wdt.c:rzv2h_wdt_probe() {
>         ...
>         priv->oscclk =3D devm_clk_get_optional_enabled(dev, "oscclk");
>         ...
>         switch (priv->of_data->count_source) {
>         case COUNT_SOURCE_LOCO:
>                 count_clk =3D priv->oscclk;
>                 break;
>         ...
>         priv->wdev.max_hw_heartbeat_ms =3D (MILLI * priv->of_data->timeou=
t_cycles *
>                                           priv->of_data->cks_div) / clk_g=
et_rate(count_clk);
>         ...
> }
>
> If the optional 'oscclk' is omitted in the device tree, priv->oscclk will=
 be
> NULL. When count_clk is assigned this NULL clock, clk_get_rate(count_clk)
> safely returns 0. Will this cause a kernel panic due to division by zero?
>
As replied in the previous patch, I will add a new patch to check the
clock rate to avoid division by zero.

Cheers,
Prabhakar
