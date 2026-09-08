Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A509454CF6F
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883380; cv=pass; b=ovbPrUXWh0KKfMmjo7VNtHq6RmCjauQJUUN99+K18/gbrp5axXHxvJY3OWHazZ6QsrtQM2y0yBkyM2R+kaMPiJdDzGsYnXhQkJ81OC2gPqJd3zMWxfkZujBw6e4gaRf6Tngj3k5YcoUuoTo/9De4gYuYvtdRIBtLBsRSBh5lFw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883380; c=relaxed/simple;
	bh=ap4bULKqOLybulZlaa1OaNXmtfc2Emsxz2j9sR4KHns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTCscVM/9kxfOfge5LlTqZBMzVa1brmdocNJXZPXTommWQ5j+1H0ldPBwpMMKPkDHYfMlY8pY1LF7uBymWjFikWr//zuTol+J4v5FTxu/F8QetD0y2872C84PLXBW7Ltwi9M41+cHJQvVAQBqD/mFz/Cq+oyWDioT/60dP++uZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWs7LZJp; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWs7LZJp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso26795635e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 09:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883376; cv=none;
        d=google.com; s=arc-20260327;
        b=XvKGrPLztynE9iDW4Mc7J+WmuGrvVU8vc16BmZ8UJbXuSBkB5gXWnSIGgF4kUPovEE
         wGIgdkaqU3xbYkvN8K8MqnsEAwYKZALZzusizJ7anN+Fjozzv6zThv0cKgZ0G8Gymi/m
         D0v+kJeCEVc+7ybqrdXIi6MVgGSilxL4yqfJCxiSYp26kRsjWHIEDMOAskSU/HyPpmAX
         jDUNdHWepHLw3JAUZLLR9axbVRoYWdUDROFGkBWS2TS6AE4jzSMFxiUbXgEzKI1lHV3m
         s/I/I8qFv+DDQ+Bkxv3vPPRulnF0fDrj4Ttfv9TYpdb/mBWB2xXEudW/KX+qCNiZosrd
         /QEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YkIvvMRRAEqhmpV2P1NY9LfV1YUNX9a9VJmrcWZyRkQ=;
        fh=9TBLTvX/J2EAiQPyC+umMCUB8iO+rrfwgEXOrVCKN7s=;
        b=hdmEROLe7waz3sq5fmgdVw+369M6xcqDBwRVSdIXRcrBHtMwXwJH/NFye/b4xJpEGM
         vrj6C9+w6NZdFL7oXOBAWDAvbTDSyfxMGfw5a74QXpVZ+RytKyJ5Lnsf+GJ9lCoiYI/t
         femUSdSOMy+cQohzcRUwv2V59fbIept1+13TyQXw6UxiKWl6iWPGW3NfWOcliEPJq39J
         2cOd+gTL0kQzwO6xh390p0l5N5fi+Dsz6aCvfMg+H8eotbCBQ9W6c9bE6xgkvaxw3JI6
         1xoZV4jO64jYmhxboIaAHURHNLXsEEAMbGMTlk7auGZBbS6LYAGLh9+7+zhB4Wx79lZN
         ZXwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883376; x=1789488176; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkIvvMRRAEqhmpV2P1NY9LfV1YUNX9a9VJmrcWZyRkQ=;
        b=EWs7LZJp5UQ0kQRgZFZlZjeLBGlrWAlqaHgzwoEKaAv/Mq7O2dv7q3mQ0oJwZdNKP5
         ZjjDhSSev0A3vUjOWvqGundSxjO43Eep3/Wca8soGFaqjzStjHvrP4K+eIYd4xXSYLk1
         e0/PFdcZ6HFdp1fMCsVwRvGy4YMm6bK7NsXpfvhAsQX+vIBVnCQYSwbH8AMzXTAwMb9p
         4MLe2pQq3iRrUziVS+1v20i3wClKBsf3P2BNao6bpDysdN8XN/vXrmMdlljX4EXBbcC5
         6E81l4O+DnOyZtgzOXcKlVVmqXMQCDiW331HNYZW9HNFMJIO7aNmV4hqUyfLtvlWadEC
         uo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883376; x=1789488176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkIvvMRRAEqhmpV2P1NY9LfV1YUNX9a9VJmrcWZyRkQ=;
        b=GtZeHXi/SBMfe2DkaI1/2sF5ybBcgyRsUQqM8aiwVqaYtujEUoqjBqLE9P5TV0/q0i
         94CzaZ8ZP0Cl/rePTF7Ix8Mi8Zly/c9/m2HbvWagkcETowDXEJSMDRJsw4F/C+o1qtf4
         e1UnCBX0IZW/5mB3H3uHRnRK3uc6Zd+IgG5ZaURTs5ewznp/e+JBJcarkgilfNtv3dJm
         rRXj5uy9bkhH2gipWRdBJVDAdj+qgZoMNXnvudmJZBO0PYx32uPb6RwL7XXmaVAg0Jry
         Q3xPCCyHcZHl2fFjMJuj2kDgr3l9Av8D2A5W4M4NAQjsO9VjvnKI0z7CBDLO/t3hyZIJ
         TudA==
X-Gm-Message-State: AFuF++ncyQCQwNPOHZBPTMZQsefFys5SQD26JL5lFiPed4QmB/sTiPcL
	xWM/df7/dAOrxGyZsdDXEsVjyg5BKAfCPRVTxaBuX9iIAOpqCpRsV9YnnTSbCMcP1Wsxevc+u9L
	UlK/tqiZuUbyW8LZ1QLrLIUEVFaFXvuKuxOFAz88=
X-Gm-Gg: AYBFou3SyOX5qugmWPSBTv9dpJnueThNBqJ8C7koQ+8viTkUalkkzasolZxOm1DHb4u
	b9JqDbjCjHA3h86oz0HutQwIg2qI/bQeegAppfc2V6CmxV1KtKJstUryTXm2bXtnTeWCYz0EYBV
	AYN1vU2XOaAoaH9pVwpCO15Z7lVGGtLDIy8G7LEMYa0JyHJ2DF7caPa2mh3Ze4lxiMbzubELzd4
	3cEBR5UDgq5e48u7L4ClYZXD8xe2O+gvQzaWRW7YO9YKr33b30ww/5sdNB3NwdHuA3ZYo3wYgLF
	zKBu+t3Xl85shVSVXO5lAnEj8cMclYOwOLyJOha7+j1KaE+fNSLmkjLWt5GJb1WO4esdA/MqJ9J
	lsgEvndPftRcCfFajiCn7rU72WTdi3A==
X-Received: by 2002:a05:600d:849c:20b0:49c:fe46:7219 with SMTP id
 5b1f17b1804b1-49cfe467228mr197748585e9.20.1788883376090; Tue, 08 Sep 2026
 09:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814191415.2110732-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260814192623.2A9251F000E9@smtp.kernel.org>
In-Reply-To: <20260814192623.2A9251F000E9@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 17:02:29 +0100
X-Gm-Features: AcwNN1Wybw_Hnz5sBjzjFzK5_9pPy2Nv2GttNQzw-6PpM9StOTkX91FsrNlolkQ
Message-ID: <CA+V-a8sFKaoYe-5ETcoktTibaHZeJDQN+BGzsD2xFnVZRXxm0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] watchdog: rzv2h: Convert WDTDCR handling to regmap
To: sashiko-reviews@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-watchdog@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Aug 14, 2026 at 8:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Using a regmap configured with `use_raw_spinlock =3D true` in th=
e watchdog restart handler introduces a deadlock if a panic occurs while an=
other CPU holds the regmap lock.
> - [High] The watchdog restart handler inappropriately aborts on regmap er=
rors, silently preventing system reboot.
>
> Pre-existing issues:
> - [High] Calling `clk_enable()` from `rzv2h_wdt_restart()` can cause dead=
locks if another CPU holds the corresponding framework spinlocks during a p=
anic.
> --
>
> --- Patch [2]: [PATCH v3 2/3] watchdog: rzv2h: Convert WDTDCR handling to=
 regmap ---
> commit 81d528488e87b317129eaa95c0076e2e770f3265
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: watchdog: rzv2h: Convert WDTDCR handling to regmap
>
> This commit converts the WDTDCR register access from raw readl/writel
> variants over to the regmap framework using devm_regmap_init_mmio(). This
> refactoring allows the driver to subsequently support syscon-based system
> controllers natively.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index b770226f785ea..cf28caef31e8e 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> [ ... ]
> > @@ -91,20 +92,12 @@ static int rzv2h_wdt_ping(struct watchdog_device *w=
dev)
> >
> >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> >  {
> > -     u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> > -
> > -     writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> > -
> > -     return 0;
> > +     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTO=
PCTRL);
> >  }
> >
> >  static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> >  {
> > -     u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> > -
> > -     writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> > -
> > -     return 0;
> > +     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> >  }
>
> [Severity: High]
> Since rzt2h_wdt_wdtdcr_count_start() is called by rzv2h_wdt_restart() dur=
ing
> a system panic, returning regmap_clear_bits() here means the restart hand=
ler
> can now fail if the regmap access fails.
>
> If rzt2h_wdt_wdtdcr_count_start() returns an error, the restart handler a=
borts
> early:
>
>     rzv2h_wdt_restart()
>         if (priv->of_data->wdtdcr) {
>             ret =3D rzt2h_wdt_wdtdcr_count_start(priv);
>             if (ret) {
>                 ...
>                 return ret;
>             }
>         }
>         rzv2h_wdt_ping(wdev);
>
> Does this silently prevent the watchdog ping and hang the system indefini=
tely
> during a panic instead of rebooting? Should the restart handler ignore th=
e
> error to ensure the watchdog ping always occurs?
>
If the regmap clear/set fails, it means something really bad has
happened, and we cannot reboot the system. It's better to return an
error instead, as the reboot won't happen anyway if regmap read/writes
are failing.

> [Severity: High]
> This is a pre-existing issue, but I noticed the restart handler calls
> clk_enable() when the watchdog is not active:
>
>     rzv2h_wdt_restart()
>         if (!active) {
>             ret =3D clk_enable(priv->pclk);
>             if (ret)
>                 return ret;
>         }
>
> Since rzv2h_wdt_restart() is called in an atomic panic context where othe=
r CPUs
> are halted via smp_send_stop(), can this cause a deadlock? If another CPU=
 is
> halted while holding the clock framework's global enable_lock spinlock, t=
he
> panicking CPU will spin indefinitely waiting for it.
>
There are no APIs available to enable clocks in an atomic panic
context. The other alternative would be to have the clocks ON all the
time in the probe.

> [ ... ]
> > @@ -280,14 +273,30 @@ static const struct watchdog_ops rzv2h_wdt_ops =
=3D {
> >       .restart =3D rzv2h_wdt_restart,
> >  };
> >
> > +static const struct regmap_config rzv2h_wdtdcr_regmap_config =3D {
> > +     .name =3D "wdtdcr",
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D WDTDCR,
> > +     .fast_io =3D true,
> > +     .use_raw_spinlock =3D true,
> > +};
>
> [Severity: High]
> Since rzt2h_wdt_wdtdcr_count_start() uses regmap_clear_bits() and is call=
ed
> by the panic restart handler, can this raw spinlock introduce a deadlock?
>
> If a panic occurs while another CPU is executing rzv2h_wdt_start() or
> rzv2h_wdt_stop() and holds this regmap's raw spinlock, the other CPU is
> halted by smp_send_stop(). When the panicking CPU executes rzv2h_wdt_rest=
art(),
> it will attempt to acquire the exact same raw spinlock and hang forever
> instead of rebooting.
>
I will stop using the regmap spinlock and instead use a lock in the
driver itself, disabling the locking in the restart path.

Cheers,
Prabhakar

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814191415.21=
10732-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
