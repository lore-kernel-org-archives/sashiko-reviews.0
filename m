Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838166;
	b=AUV00Z3BtFk6cEHfGtLgAycZ0DypwOnm4cysUAZheovGiZr/gjRN9jKL95AnI0wJt4B1
	 tZt5GdLyiCfD4kr/L65JHJJ37wChS1tlz4Ybcr+Dr2R9BQYFFZjlkzImRP28BQcSeGDeu
	 yBoxHVps+AZ4n8j2C+0fmbf8B8j1n5Pr7x4wcr/EjIwxSNWSfjHeeBR8ZEGhFSCaiDJHf
	 l3H/Sc0HXowH284uEVDvgzEtKfawt/7KdY9udYSMj5j+xLbNdXNCz23LjoJYrGwDUPx6c
	 87Mi+9Ww5NvjLyOf84fUQqZYXtlYgr4SKJ8s5S+iaLBNcUTWsl99miynAwmlvuucNkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
	b=uXuLF4QnieTPcnNcFlEVj5J+IazP9GX0R+fwJCT8TnBbeUcJlxf+vk7xD9MlCOgIdgDn
	 I3x1APRimCHvwfaavbx9126Wg9X9yAthQFV44nGS5TLKYY1UshxqqLS/hwxVlH5JhEHYi
	 +vhebDOcWbiuSgOZd/ioS015NosS1rToZpzmzd3XN3mGAi7RBGUwOtrIPaUxLFB/lxQaZ
	 qMw8BLhVtVW2wz1GR9CGn9Ddn5XHt38Zk7FzzHGwKv5eaR5lZmE6S/JIJuscHarsCCi5B
	 CTRVxbrX7mt6d8DdcQ9raNt6CzeJfDLmY3pufXsY9EvNpm85AIjvcDAIes7Obax9/lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vgmq0i/L";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD576606A338
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 14:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD576606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vgmq0i/L
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55b8cd4e2abso38331291cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 06:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794838165; cv=none;
        d=google.com; s=arc-20260327;
        b=DRSaD9hjq31CVlUY5LffQP+jv1nw3Xq8uRD7ocQGyc7j1JuER6JgXdbQhUyZuUXlHX
         u1tAVyUV3nIatcx/C6bbpigoXRudn/JUvAY2giyYbpQ+oNfXBL9Ebk4EWwWzfwe3HNMi
         QWvr1xKaPrmxvOVFPz/e30qGfOZH4ihznsA45ybLFDfR51rrkEwRhYy2W8uN17d9NJ2N
         XS+dsHBLctRRq8YRSh17NAYWJ2V0KpzrGlE6cqPRrAG8flRJTRp+ZWnw/izSnFZN1PhQ
         hapD+RJ1XfgFuoJS3oWWnGwHkenwkcFsIMtIwBANZYY2vytswTIsLCPA7RyP1maL6Gxd
         RT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
        fh=ovoIV3eSQ8lwoP46mLx/1hpCZWJRZmZt86CkqVtrYmc=;
        b=HiDDlCVS6WglmCODfxxu7eUs5/cnlT9vj9MjXWGx6eLCbZZoZBOWW81fpQiSMBcJmf
         Lyiqft4hZSoBiRwo2YEjDaj58803jB9eZiDy00iBLf3GVwkD+seG4sLbJ4Oz0BpGYdPH
         JG9TY+B6F7J09Lt1xrlez3Vu5zqJ8XfFxd74RFTGHXpT9MwCG92KpdAS6YJp2ygFIjW5
         94vAjRJ5rjRRgh8waabklfyTcAg3uxmWQgfLoX8x7T180D7jL2moRtXhPoVxLMOcbdKP
         iWV7x+wdxBMqp0ZVnvWalcESKC3SKuHJuXVHkwIXL9QbKZfz2mrEKYYTIlmWLcuREbS4
         x00Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838165; x=1795442965; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
        b=Vgmq0i/LB5/KaCeOfhVfSwpfUHDi2mP/bAKcMtphQdIbWNJNhKf3zBgH+m8fzM09KR
         BYvWJ4atyweJzvVU5tRjWEicU1MM1PMWeIiTcNXHh5UuXxg+QXQXajwjrEouPzbbaif0
         HrmJ4ZE5E+RSk8j8jKhrOpb6VQvJ7X23X6mYZ9L11RY7tbPj2V45N0baGUneJ/HqWr5E
         0KOp4ATX+m7HIq0bWG1aSDSmJEFBqWiDhTOLpqV8OUrg4mfAQonoutXp6ayRIP6VjK5r
         ru+ljYmXzdlopgnhzPBr5dengsYCRVIbo2vyWPix6FCuuiIDQ+79jXOKV876XJKkLkQ5
         cUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838165; x=1795442965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAJHKsJwQHmkCNrAnto0w4Yt2QcPc3iiUtlr1glYIIM=;
        b=zVBSh8vK83Rf4L/Ez5oH8ZCddh892aq3JsS7ljslpYCKDLP+8D/02DUl/mY/XPS65R
         ruZ3FzkWKLFuAFDgage5V57POOjlXgtmrZDHRL+CmcyLKT7hxf+LGpM6EQ9rZnJRdxif
         dKYEmmjFztavF8lidQLroN/lseUG7huDC7DtV+rCIQWAM6CBMkhWWgwjf+FUoD+eTNEX
         g5Z7tQEOSubAM/+P1sxi3k8VanBsr/viYXiMXV3YjFEi0otu7kh17nHbtnLvIrtkomS1
         88fiKYv+0KvVb9OirA8jo5krEkkiqzSfHFygkWBUvJfxuwp9GzIUbSyLdwaq0hQdyN8l
         gP7Q==
X-Gm-Message-State: APuU4Z80xLLHb5n2dHKhi7CxvFUmTFU2iGpzNT31qi1/j9C2Ipl4WR4w
	sqi2+jWbC0MbZI7EOVx+GzjXwVN38dnYqf6iZhADKMXEVZulzR3j2mXVSGYqt9ngrvVD4+/sxUA
	7x5af/C5IZ/+gEaeycxVElIzuS+W+waGUcsKL
X-Gm-Gg: AYBFou31m0kDN02gVvCbUStSXWaLrKGI96bPXtzpMw+tRrW1vzN2m3ewhKjADrjnNL8
	sQZfxJtj8cFTV8e7NvtY5bivSl447hgb9Z+gZl/3FUxfXCvVyqBtFBh3jWBbEale4FfgNOsAeKf
	GzIZAshvgML3vx0p8FNNi5B2wtXc1y5Oj3zo2O2S6Dp29jN2P3Tb1EG9dmblhICo6AfiVm/FO//
	sgdfLSc+T/N+g/Iqur3szjC3RYtoA9GdJ3IxmEPYgj++FBu5tlkm3UyDE7tUJ2lSn4A91ZBNv8G
	d0F1Sqhr00RuLXhbM9NltWzCUDb9uBm77INjPnpNDj6GNy1hq8a+RbN6xesM4GcLP9iQUwZE0Ub
	KMMPMad3F/Q2CFE+qLcXm+NU62Rb+Dvcc6BRtHl5J5V1C8aQ6l2Rm3M93ZXOimPeaG4HlK7w=
X-Received: by 2002:a05:622a:514d:b0:55d:3350:d262 with SMTP id
 d75a77b69052e-55d3350d4eemr64503751cf.52.1794838164440; Mon, 16 Nov 2026
 06:09:24 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com>
 <20261116-sdhi_hs400-v1-3-c5bedd312408@bp.renesas.com> <sashiko-outbox-217008@kernel.org>
In-Reply-To: <sashiko-outbox-217008@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 14:08:59 +0000
X-Gm-Features: AclHuK9ZvygS4VW44O8Tz7cTK4R7bVPaN0SY-46xoL5MqjI10i2BuLdn1oOZx-M
Message-ID: <CADT+UeBPa=C77QY55gHZ8jkMn174=hWH-Eip4ZCQB-MTWuJf3w@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mmc: renesas_sdhi: broken clock and divider state in
>   mmc_hs400_to_hs200()
> --
>
> commit e37da0a9061ca81415249820ba8b669566811e04
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> mmc: renesas_sdhi: Add RZ/G3L HS400 support
>
> This commit adds HS400 support for RZ/G3L by introducing the
> TMIO_MMC_HS400MODE2 flag, programming the RZG3L_SDHI_SCC_HS400MODE2
> register, and skipping the internal /2 divider and non-zero clock divider=
s
> when in HS400 timing.
>
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 7dfcf7f970aae..f15f766b7666d 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -135,7 +135,8 @@ static unsigned int renesas_sdhi_clk_get_rate(struc=
t tmio_mmc_host *host,
> >  {
> >       unsigned int freq =3D clk_get_rate(clk);
> >
> > -     if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
> > +     if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
> > +         host->mmc->ios.timing !=3D MMC_TIMING_MMC_HS400)
> >               freq /=3D 2;
> >
> >       return freq;
> > @@ -259,6 +260,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc=
_host *host,
> >                       clk &=3D ~SDHI_SD_CLK_CTL_DIV1;
> >       }
> >
> > +     /*
> > +      * RZ/G3L SoC HS400 mode has only 1 divider value.
> > +      * Other divider values are prohibited
> > +      */
> > +     if ((host->pdata->flags & TMIO_MMC_HS400MODE2) &&
> > +         host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400)
> > +             clk =3D 0;
> > +
> >       clock =3D clk & host->pdata->clk_div_mask;
> >       if (clock !=3D SDHI_SD_CLK_CTL_DIV1)
> >               host->mmc->actual_clock /=3D (1 << (ffs(clock) + 1));
>
> [Severity: High]
> Does checking host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 here and =
in
> renesas_sdhi_clk_get_rate() break clock and divider programming during
> mmc_hs400_to_hs200()?
>
> When mmc_retune() calls mmc_hs400_to_hs200(), it first lowers the clock t=
o
> <=3D 52 MHz while ios.timing is still MMC_TIMING_MMC_HS400.  Because
> mmc_doing_tune() is true, renesas_sdhi_clk_update() does not lower the CP=
G
> clock, and forcing clk =3D 0 keeps CTL_SD_CARD_CLK_CTL at 0, so the bus
> clock stays at 200 MHz when CMD6 switches the card to High Speed timing.
>
> Conversely, mmc_hs400_to_hs200() then changes ios.timing through DDR52, H=
S
> and HS200 before calling prepare_hs400_tuning()
> (renesas_sdhi_reset_hs400_mode()).  During those intermediate steps, HS40=
0
> mode is still enabled in CTL_SDIF_MODE, SH_MOBILE_SDHI_SCC_TMPPORT2 and
> RZG3L_SDHI_SCC_HS400MODE2, but ios.timing is no longer
> MMC_TIMING_MMC_HS400, so renesas_sdhi_clk_get_rate() assumes the internal
> /2 divider is active and renesas_sdhi_set_clock() writes prohibited
> non-zero dividers to CTL_SD_CARD_CLK_CTL while hardware HS400 mode is
> still active.
>


Will integrate the below diff to fix the above issue.


 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 33 ++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdh=
i.h
index 8ae2ec04bd1f..d14cfd873bb9 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -94,6 +94,8 @@ struct renesas_sdhi {
  const u8 *adjust_hs400_calib_table;
  bool needs_adjust_hs400;
  bool card_is_sdio;
+ bool hs400_active; /* HS400 enabled in hardware */
+ bool hs400_clk; /* divider bypassed for HS400 clock */

  /* Tuning values: 1 for success, 0 for failure */
  DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c
b/drivers/mmc/host/renesas_sdhi_core.c
index f15f766b7666..66da2d1e9370 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -133,10 +133,10 @@ static int renesas_sdhi_clk_enable(struct
tmio_mmc_host *host)
 static unsigned int renesas_sdhi_clk_get_rate(struct tmio_mmc_host *host,
       struct clk *clk)
 {
+ struct renesas_sdhi *priv =3D host_to_priv(host);
  unsigned int freq =3D clk_get_rate(clk);

- if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
-    host->mmc->ios.timing !=3D MMC_TIMING_MMC_HS400)
+ if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) && !priv->hs400_clk)
  freq /=3D 2;

  return freq;
@@ -227,12 +227,33 @@ static void renesas_sdhi_sclken(struct
tmio_mmc_host *host, bool enable)
  }
 }

+static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
+  struct renesas_sdhi *priv);
+
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
    unsigned int new_clock)
 {
+ struct renesas_sdhi *priv =3D host_to_priv(host);
  unsigned int clk_margin;
  u64 clk =3D 0, clock;

+ if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
+ /*
+ * While HS400 is enabled in hardware only divider 0 is allowed.
+ * Leaving HS400 (e.g. mmc_hs400_to_hs200()) lowers the clock
+ * before the core calls prepare_hs400_tuning(), so disable
+ * HS400 here once a non-HS400 clock is requested.
+ */
+ if (priv->hs400_active && new_clock &&
+    new_clock <=3D MMC_HIGH_52_MAX_DTR)
+ renesas_sdhi_reset_hs400_mode(host, priv);
+
+ if (new_clock)
+ priv->hs400_clk =3D priv->hs400_active ||
+ (host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 &&
+ new_clock > MMC_HIGH_52_MAX_DTR);
+ }
+
  renesas_sdhi_sclken(host, false);

  if (new_clock =3D=3D 0) {
@@ -264,8 +285,7 @@ static void renesas_sdhi_set_clock(struct
tmio_mmc_host *host,
  * RZ/G3L SoC HS400 mode has only 1 divider value.
  * Other divider values are prohibited
  */
- if ((host->pdata->flags & TMIO_MMC_HS400MODE2) &&
-    host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400)
+ if ((host->pdata->flags & TMIO_MMC_HS400MODE2) && priv->hs400_clk)
  clk =3D 0;

  clock =3D clk & host->pdata->clk_div_mask;
@@ -515,6 +535,8 @@ static void renesas_sdhi_hs400_complete(struct
mmc_host *mmc)
  sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
        RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);

+ priv->hs400_active =3D true;
+
  sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
        SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
        sd_scc_read32(host, priv,
@@ -655,6 +677,9 @@ static void renesas_sdhi_reset_hs400_mode(struct
tmio_mmc_host *host,
  if (host->pdata->flags & TMIO_MMC_HS400MODE2)
  sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);

+ priv->hs400_active =3D false;
+ priv->hs400_clk =3D false;
+
  if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv,
hs400_bad_taps))
  renesas_sdhi_adjust_hs400_mode_disable(host);

--=20
2.43.0

Cheers,
Biju
