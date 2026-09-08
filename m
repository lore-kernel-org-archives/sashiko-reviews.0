Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1E62E7623
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870201; cv=pass; b=A+BAUKK5Ok9AF21yufaNXbLOs4joSNuHeUN8BDcgx8D9ENWOXk4aJkkU/DCQX6H4++A2vaEUsUhu39stw/awslecBW8gmfgFMbib4akZZfseYTepu4nUqjlo9pZTEUKM3skdxX5VnfrzpJqfukKm7ZJSNg7BdZuEDfY/hCWpIuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870201; c=relaxed/simple;
	bh=7B//ywSPA31oLbLkiJWEnOV8UhYI9nR5ExoskFX6af8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/a/Z5Vob8unrsZPYgB+JpAKVoCjPMdqjHUKZxERIggvRtVPHXRHaptNBlOZIphrBAL/M6yaHBUmbcisYpnawadiFOTHfRcC//r7XFYjolCUyZ6M9bW1RDb+qC0EvL1oVyPzWg+BxWtlatu349FQ1vN6Q+sTdMR9GVdZY+HoLpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByFuSJ/M; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByFuSJ/M"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so7613126a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 05:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788870198; cv=none;
        d=google.com; s=arc-20260327;
        b=RlABv9vSz/rltnp+zGgNo9cpOxJVa31TnkKF72K9yP26C/D/hU+8m76ju/DjJScZ7j
         nZ4NN25A6d6k/+aGf8L2G7y6O1wsAmAh4+xzfPzpS2VqB7cy+pAcBnEgKHGJRPCcGEnW
         P+FcIdK3HyJ15+W5AK8iKhJLSnMxxA6zIrdXss6olWN7sCZvS59M2RSMErF5mf+BL2sS
         ArUvWGCeuJ+xGoGFZK1h7tLP9TgkE8sjgiBOrJu813NIoOZO1C4hGIjOlMYBxITgF6FU
         /NPKgUQskx4qqbwi6S+s6ZF0LqCi/vrKUx/26N6xI3LyjP1DMBMTuZXHseusgZxyqsYf
         eCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kMTwhNu5pCcwPamJHqUSc+QqQ3bw/cfakmLflS8d1lI=;
        fh=orp1a3sw37+koAzHJzM3c7ZyU2UhSdEZSlOETZqrIxM=;
        b=O2jf6QqUf/UC1AsE/mHltMzdNqs3vr5evaLo7JjIGoXhuMJWw+jCHK3t2+GsZOgwZo
         zc48yzvyu3shj3YsCnswgx3if5GYOWZtVg31j7oy+idp6BBul1dm4BcoKgvUWimN/19n
         VzZE0aOAT67J+JCJos8W1GsW0JU+w56SPBHDmB5nna+p34Rf0qdH8o+mWP571z3QDYCH
         pLhxgpHSwoiZOo3Ai1LdfsZuJnZ/o+ypATA7l5xxD3DwxCSsWxP+4ncpEzfqoLH0NeSF
         niwLVB7S2YqIdijUrGliI5dhUeqid1x6kSC+SGwTMTB3uQRfHlokmWCOYpICj/cmbX0I
         n+Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788870198; x=1789474998; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMTwhNu5pCcwPamJHqUSc+QqQ3bw/cfakmLflS8d1lI=;
        b=ByFuSJ/Ma7pgQE0b9EgU+6vxV5IokmHqY1ErHSaI7cE2CeAL3uYuNCSFRiUjXhdDXg
         LVdobEU9G/M9C0GG0E4ZnMyIjvGsV+p1YWlZorfbB7di+uyPfp+N4mA0AfNsdCbma+05
         oF1pBCbi9qQ31VibRBe5i2WAV8oo/Z0ADhIqUtGKqcCBkzXFWlljFW/sfr/3zwK2qmCG
         3cGxu6Z2NPDvL99AAanEBpyz7sxbq4K1qX+cgEQVJvxcI4UdjRcc6z6ev1MJixcGulNQ
         /DODGZ5lmyhodcXEXczpU1sYCuH1TXBrzxDl5hrUkEjYMyIDUNwll7JPZr5bAgVRM7Bq
         YgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870198; x=1789474998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMTwhNu5pCcwPamJHqUSc+QqQ3bw/cfakmLflS8d1lI=;
        b=i7ChJ2bSCtiodzYgAEgm6xLT8jG/yHurUfcaaKnatl1LtRiQ4Y9Rxp7mPHvhB2VStK
         37+3esXWIVQBJRamecU3KrbfSRHdC09bj+Ym2Goo5IZCpwwOWhuk/bgH4ErQblFXXMyX
         Loo+1TEX/EbF/WN8ATctzawUoRrHtVDvtCokOgdRpDwB3bPXcm6fzGewjyLICfd2R2AT
         ltWBbP0uEBhk1W0xORCbrvQBcIf14klXIw25ePGnNxq/dm8IXPnM0uJlDguaub+Ov92L
         xVM7XpsZBOYZEiLlIU8yZ3qtIU+aPOakkJYyr6O6RPNAYE7I1b2ZtRm2ZS9XQZJf8TEw
         3H4Q==
X-Gm-Message-State: AFuF++lwgzEFU8o7G6Oj7eXDpdYYbzJrfVsrErowPgVVGSZ7KF8d2Dlk
	ksYzvZnkLd6Txwu5rccbUXGKFyNayrp/iitO1ewgT3dUvyrqe96QqynePwEdCQ/pT/H2PrzQu3M
	EyGtedFHSdO8nQetvW+ITl4YG0CypuNz5fYPqbIg=
X-Gm-Gg: AYBFou0SGG4FuNYXrF1o6K34ztfH3PsaF3ewtAZK85T7SsE0sCNhZ1I2xfImnt4F3iC
	rNx+OT3z7ia/S0uctD2I0DH95CqDs+Sv0fpE/Gt9DqGy+Q0PhlXzVbzQCJfEF+gv11+XwoPsKKE
	QLEdjRjUR695NzVgFlSiDQ2PkzyVGppF48ayGNNAOLbfbrty6Kzbar/Q8qz91TBKqIlsi9ZnM7/
	6dV7VGzGQWoLY9IFpBP2+poyAeeTEDFFH2UJys3C0vNUOfsh1e+eGs3Mw2TE1eNBgf33l0wKlhI
	85Hmp31Qt1kX3VgRadeb4oFtU9eXvYGrxznHr/duch7U7F4gXTw15RwZPFA7jVA1WNNzstM/BTq
	lUZOa91eXEwEIh0xwTXCBvAPCaG0GlQ==
X-Received: by 2002:a05:6402:3814:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a7e8d67669mr9906512a12.6.1788870197348; Tue, 08 Sep 2026
 05:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814191415.2110732-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260814192638.EA99A1F000E9@smtp.kernel.org>
In-Reply-To: <20260814192638.EA99A1F000E9@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 13:22:48 +0100
X-Gm-Features: AcwNN1Wx4etsK429Q3Q8c3-LvEEz0E7ckOfxtJenny8EdfSwTa4Tjef1JG7X6dI
Message-ID: <CA+V-a8u4_gziwgevLUWwPkhkm2TbQXJhwFMa9ug8MAss+aZcug@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR access errors
To: sashiko-reviews@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Cc: wsa+renesas@sang-engineering.com, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Aug 14, 2026 at 8:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Error path unwinding in `rzv2h_wdt_stop()` leaves the watchdog h=
ardware unconfigured, causing an unintended immediate system reboot.
> - [High] Aborting the `restart` handler upon register access failure prev=
ents system reboot and hangs the system.
> - [Medium] Using asynchronous `pm_runtime_put()` on the probe error path =
leaves the device permanently powered on.
> --
>
> --- Patch [1]: [PATCH v3 1/3] watchdog: rzv2h_wdt: Propagate WDTDCR acces=
s errors ---
> commit ffabc27a1b8e9074dcd4cdaba7bc802a6d661fcc
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h_wdt: Propagate WDTDCR access errors
>
> The WDTDCR helpers currently access the register directly using readl()/w=
ritel()
> and therefore cannot report failures to their callers. Make the helpers r=
eturn
> an error so their callers can propagate failures.
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 3b6abb66a1da0..b770226f785ea 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -171,8 +181,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *=
wdev)
> >       if (ret)
> >               return ret;
> >
> > -     if (priv->of_data->wdtdcr)
> > -             rzt2h_wdt_wdtdcr_count_stop(priv);
> > +     if (priv->of_data->wdtdcr) {
> > +             ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> > +             if (ret) {
> > +                     reset_control_deassert(priv->rstc);
> > +                     return ret;
> > +             }
> > +     }
> >
> >       pm_runtime_put(wdev->parent);
>
> [Severity: High]
> If rzt2h_wdt_wdtdcr_count_stop() fails, this unwinding leaves the hardwar=
e
> out of reset but unconfigured.
>
> If the stop operation returns an error, the watchdog core assumes the
> hardware is still running and immediately issues a fallback ping. Will th=
is
> ping against zeroed, unconfigured registers start a zero-length timeout a=
nd
> cause an unintended immediate system reboot?
>
Agreed, I will drop deasserting the reset and add a pr_warn() message.

> [ ... ]
>
> > @@ -234,8 +250,19 @@ static int rzv2h_wdt_restart(struct watchdog_devic=
e *wdev,
> >       rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
> >                       WDTCR_RPES_75 | WDTCR_TOPS_1024);
> >
> > -     if (priv->of_data->wdtdcr)
> > -             rzt2h_wdt_wdtdcr_count_start(priv);
> > +     if (priv->of_data->wdtdcr) {
> > +             ret =3D rzt2h_wdt_wdtdcr_count_start(priv);
> > +             if (ret) {
> > +                     if (!active) {
> > +                             reset_control_assert(priv->rstc);
> > +                             clk_disable(priv->oscclk);
> > +                             clk_disable(priv->pclk);
> > +                     } else {
> > +                             reset_control_reset(priv->rstc);
> > +                     }
> > +                     return ret;
> > +             }
> > +     }
> >
> >       rzv2h_wdt_ping(wdev);
>
> [Severity: High]
> Does returning an error here prevent the system from resetting?
>
> The watchdog core's restart notifier wrapper translates an error return i=
nto
> NOTIFY_BAD. Since NOTIFY_BAD includes the NOTIFY_STOP_MASK bit, this abor=
ts
> the restart notifier chain entirely, skipping any fallback handlers and
> causing the system to hang indefinitely.
>
> Should this restart handler make a best-effort attempt (perhaps ignoring =
the
> WDTDCR start failure) instead of returning an error?
>
Since the register writes aren't succeeding, it implies a serious
failure with no recovery path, so returning an error makes sense.

> [ ... ]
>
> > @@ -266,11 +293,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_=
device *pdev,
> >       if (ret)
> >               return ret;
> >
> > -     rzt2h_wdt_wdtdcr_count_stop(priv);
> > +     ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> >
> >       pm_runtime_put(&pdev->dev);
> >
> > -     return 0;
> > +     return ret;
> >  }
>
> [Severity: Medium]
> When rzt2h_wdt_wdtdcr_count_stop() fails, this returns an error that fail=
s
> the probe function.
>
> Does using the asynchronous pm_runtime_put() here leave the device powere=
d
> on?
>
> Since probe failed, devres immediately calls pm_runtime_disable(), which
> cancels any pending asynchronous power-management work. Should this be
> pm_runtime_put_sync() instead, to ensure the device powers down before th=
e
> disable occurs?
>
I'll create a patch for this.

Cheers,
Prabhakar



> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814191415.21=
10732-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D1
