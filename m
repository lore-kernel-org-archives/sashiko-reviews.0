Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059D33C198
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883780; cv=pass; b=CNVDKGP4Zu/lQobVvt1yShzlNxkkJB6vHPmsTT2ETOkG5kulxiAex40eu+TkaOGeXlfBDzUR4fWOFrr/Ccd66Vrco14/ojvmcdV/z45u6hO9AMzVXN1iYXe9NkTmEnd8HjvtqNUXcKr7x+VHRxtJYGv2nclQRfUMxGZNDBtQXVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883780; c=relaxed/simple;
	bh=WztWhHVc0H7CPyJLwxnwx6YXYXsrq7l98ZyMQp+1Ck4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFKJ6rOb5GqXk8JCNFuDhXLo3UraSHixJCjy8Eb9cCTjK3fxIx+9EYOikkrPzcD9+srMBji0ZMroX2+pv8xBZyVLh3oS2wcS42R0CVsmPywoOQVTE45Cm+OEqYnTTO09Jbnihb1IjNuxRhsZo+bW+wd530VpGvHCLMqjt1sg62A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPljulmf; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPljulmf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4858be8b509so2152269f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 09:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883776; cv=none;
        d=google.com; s=arc-20260327;
        b=B0fYB1QA3vlNNNzcHBQx9HXzrsCo7EO0njLyTN8oC1yf+5yQu2NI8T/ddBT7llFATY
         pHNpQMmxMfw7b3XpuiRQsmfrNXf9TGXFuQndOgcZPqo35gjU7z68GitkprGbfoQCr+95
         YgtZHYSSHW0ssh/Zzmmti19AtcEAaW0Iy/7r0hX/FpEKDO0i7fLjVx+EkGbSz/z+HLo7
         f5E8mHijKFlS1sJDYAIvQ3yUKuDi24m2lMxjSHzSk64XWKFVzWueCkAxgpxd/1eRula5
         qf/5EjPGBmwTLBQRCX0wWmxFrELSJPbkeiMPgmwUcNbVjJDiVxOyJcFvYM2Sa5rsrYks
         TUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTcRxNE+0QKPGmkvcXmGoBSJ3Svx4jopmL9a4dde9Bo=;
        fh=IJltLsJnZ8n5Xxf5+IO7e1o82sMq7gsEey8L9nD4Ydk=;
        b=fgJPRXKapTHz4fgknQCaIyn9ORRHJATIokBWfVeoe5ArBT1L5PtBCGltzGz+wrcBZw
         hsoFaPm7rY+pCSo1ySD+Oy7XLDR9fmigkknDI43C62zLQf+Z4lInoK8TZoPaOKYVonAr
         gDQGNUVH3QKPs2Ges7+Of6BSRrTt8heNQvZk+U34tu0nE4tuZ5oMFgHnekWGwuUjjo6J
         DprOyr8YX/smPjzKW1fQbzCgivm3ttRB5Qq2EFUyYbK0ThiiHhzXRVvtJnrW8G5V10Cg
         p95NoN8wNa4r9PB4xcbzdnVImifndW1o08SYQ17RpG/kGlXTc7F7cG8YA529bxvGBmQK
         OxdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883776; x=1789488576; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTcRxNE+0QKPGmkvcXmGoBSJ3Svx4jopmL9a4dde9Bo=;
        b=ZPljulmfFibI/jzUJF+4+aLkiui/54Wp7MSnSG/FuM53wnRMLGdfIf61KFn6ph+z7Y
         gMbCYTlbOp9MygKOJlFk5/WIO9i2plI/jtnY/N4X/gtH5T757IJSDFA0G+t6BwUAzUGg
         xkjOz/o58wbtJ5tJY3OmVuMSWg9syw7IcV3yf2diUPQBAy33SVB42vg6ydNP5nNIvt8Z
         K+dkrQ43FpJ/Gx2KFIzH8eBljHHgqvMmr2x0WK/cL2jcJnS2cSYGrHyjSOm35ObGEliX
         PBqvxB5jPIzhn9U2pcTyr40vHtCh31qZvrM0sXfvBOm4ZaWHx7SXFK/y+1a8YMmYy1Zr
         o1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883776; x=1789488576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTcRxNE+0QKPGmkvcXmGoBSJ3Svx4jopmL9a4dde9Bo=;
        b=HQI+nCC30g5fisnsudlWAxaG+Q2xXwh+buNmMtaXmIsT+A7MRd1e86STTfUHJfVWtW
         gzE9zsYF+1HELB8wAfUYi8kCmxSSHN7JHPGOU9wdv/mWADMPIYyj7IuKoc24LLNPvuBw
         musvKDrfmc08lH2oO4xLHhwNHTTTf/2NZGpQ/ykI7sj9HYl/Kr4gjJiwjAuabppsnpRh
         xQ52YYdiVGE2BxNnjpzplZzIoJniCt512+MsT3t4wPztlJvDm+0o05D3o6gzjkS4GMzL
         nSvQTzogiYnDpSxav0vFfUrFCiFSws7GhsZ/5vR3MLn4M6u7vn/laHBuR8GaX58edhMY
         an6g==
X-Forwarded-Encrypted: i=1; AKwUvBz9NQ0E0yT6VGac7epFR+YtsMQQA0HnxHnA5BJwsls11cOI80i3wC5gu59+edj9pPl2VGg0OnuOzkF8pbJCUo0=@lists.linux.dev
X-Gm-Message-State: AFuF++l14NsqzK7lbJPZsv2c3Gn0Fngf5PdI4DoR6VXEGbIanRgcia7h
	vRKLJBFkrquQMmXm08PUg/9xXvxjkqkHhinVgHKgKlWpZj0GzDH5KZ+hlbgv45SqSsyt1DBxdrr
	8EiajGYNYqQIsw1/1IaGHGJPp6E3cUpk=
X-Gm-Gg: AYBFou0p9+k3K2UJ3NcJmFP0lMEXgfD/KCogoKaWzgLSH/hZfb6nZ9k31yirJhem60w
	89OSsxAt3rr5FWHdgU5fql0/UqC6zd9A1XXQ6WsHKz43dRqd9QsUbY12O4VbgUFMarbwmyVQIu4
	WI33Dza0DFPLlQ8/HmrHD1lqcWA0DzMR5nmfjTP5ty+XJ8JFadCxgNm1OEzqqcVGtH2Hr0z0EYA
	mjEp05JI4FtQZINzshxgbPqaj2Ju0v8ZqBCu17diw4WrpetKCAqd9sbO98oNV6RawQDHX7VDOpa
	EsnSQQexvgO8D2z2Jv15fdLfvA3uPMhKxm3dca5a5CMiBoxYIcVCfSVG+rDrS42BhMgUGe/xR1q
	zypfXS3yyWtcnIzx0zyJuB6V4prajrA==
X-Received: by 2002:a05:6000:4694:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-4858703f92dmr25465606f8f.4.1788883775867; Tue, 08 Sep 2026
 09:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814191415.2110732-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260814192623.2A9251F000E9@smtp.kernel.org> <CA+V-a8sFKaoYe-5ETcoktTibaHZeJDQN+BGzsD2xFnVZRXxm0A@mail.gmail.com>
In-Reply-To: <CA+V-a8sFKaoYe-5ETcoktTibaHZeJDQN+BGzsD2xFnVZRXxm0A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Sep 2026 17:09:09 +0100
X-Gm-Features: AcwNN1UPrT-OBd75FMnOYw6-VBnoCdw_d03tw_YLhHOMh0wIOw46Gu0F0_TY1sM
Message-ID: <CA+V-a8uDW1M6z2R_KBhKLn4Njp+3mVSTPDWYrjs+Xy2TPuoaCA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] watchdog: rzv2h: Convert WDTDCR handling to regmap
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, sashiko-reviews@lists.linux.dev, 
	linux-watchdog@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Tue, Sep 8, 2026 at 5:02=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi sashiko,
>
> On Fri, Aug 14, 2026 at 8:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> >
> > New issues:
> > - [High] Using a regmap configured with `use_raw_spinlock =3D true` in =
the watchdog restart handler introduces a deadlock if a panic occurs while =
another CPU holds the regmap lock.
> > - [High] The watchdog restart handler inappropriately aborts on regmap =
errors, silently preventing system reboot.
> >
> > Pre-existing issues:
> > - [High] Calling `clk_enable()` from `rzv2h_wdt_restart()` can cause de=
adlocks if another CPU holds the corresponding framework spinlocks during a=
 panic.
> > --
> >
> > --- Patch [2]: [PATCH v3 2/3] watchdog: rzv2h: Convert WDTDCR handling =
to regmap ---
> > commit 81d528488e87b317129eaa95c0076e2e770f3265
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: watchdog: rzv2h: Convert WDTDCR handling to regmap
> >
> > This commit converts the WDTDCR register access from raw readl/writel
> > variants over to the regmap framework using devm_regmap_init_mmio(). Th=
is
> > refactoring allows the driver to subsequently support syscon-based syst=
em
> > controllers natively.
> >
> > > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wd=
t.c
> > > index b770226f785ea..cf28caef31e8e 100644
> > > --- a/drivers/watchdog/rzv2h_wdt.c
> > > +++ b/drivers/watchdog/rzv2h_wdt.c
> > [ ... ]
> > > @@ -91,20 +92,12 @@ static int rzv2h_wdt_ping(struct watchdog_device =
*wdev)
> > >
> > >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> > >  {
> > > -     u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> > > -
> > > -     writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> > > -
> > > -     return 0;
> > > +     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> > >  }
> > >
> > >  static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> > >  {
> > > -     u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> > > -
> > > -     writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> > > -
> > > -     return 0;
> > > +     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WD=
TSTOPCTRL);
> > >  }
> >
> > [Severity: High]
> > Since rzt2h_wdt_wdtdcr_count_start() is called by rzv2h_wdt_restart() d=
uring
> > a system panic, returning regmap_clear_bits() here means the restart ha=
ndler
> > can now fail if the regmap access fails.
> >
> > If rzt2h_wdt_wdtdcr_count_start() returns an error, the restart handler=
 aborts
> > early:
> >
> >     rzv2h_wdt_restart()
> >         if (priv->of_data->wdtdcr) {
> >             ret =3D rzt2h_wdt_wdtdcr_count_start(priv);
> >             if (ret) {
> >                 ...
> >                 return ret;
> >             }
> >         }
> >         rzv2h_wdt_ping(wdev);
> >
> > Does this silently prevent the watchdog ping and hang the system indefi=
nitely
> > during a panic instead of rebooting? Should the restart handler ignore =
the
> > error to ensure the watchdog ping always occurs?
> >
> If the regmap clear/set fails, it means something really bad has
> happened, and we cannot reboot the system. It's better to return an
> error instead, as the reboot won't happen anyway if regmap read/writes
> are failing.
>
> > [Severity: High]
> > This is a pre-existing issue, but I noticed the restart handler calls
> > clk_enable() when the watchdog is not active:
> >
> >     rzv2h_wdt_restart()
> >         if (!active) {
> >             ret =3D clk_enable(priv->pclk);
> >             if (ret)
> >                 return ret;
> >         }
> >
> > Since rzv2h_wdt_restart() is called in an atomic panic context where ot=
her CPUs
> > are halted via smp_send_stop(), can this cause a deadlock? If another C=
PU is
> > halted while holding the clock framework's global enable_lock spinlock,=
 the
> > panicking CPU will spin indefinitely waiting for it.
> >
> There are no APIs available to enable clocks in an atomic panic
> context. The other alternative would be to have the clocks ON all the
> time in the probe.
>
Please let me know if you want me to enable the clocks in the probe so
that we dont have any locking issues.

Cheers,
Prabhakar
