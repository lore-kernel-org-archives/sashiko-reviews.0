Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794919822;
	b=lg2cClicnkjLSGhE3gUiDwAyA4oEqfuehGVyae5mOd4NA7NTNUsT1WuLUqEmARfK1flp
	 uEZWxwIMEOsSMCLJV2j2HmUK3LMJQK2Ywuwj3TYdi6P8YchtXndFSXRT53h3+ApBDJZUg
	 4DovqsoFxVHbjJ4UJRfwxOYwfgnVYKuqvP63/2bylmkJW6+Is6XzCXfSwHyy1ZvnsejHO
	 pqGkGpuskV9Radg6kRQ44dlLcGkRBrqNhjTV3FlOCRj+AlYBPWbgR3xVd4dCKgUNjn1Ht
	 +riBqOnj+FZCDKPuz7r6Lf4xITURlj81S4XuBW/Up7FkRbedGWFI9R3NbqwSbOk2wbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
	b=qiZRLPww6vKdD/XfRmZh2IqIGccT7eIdqF9eFOx41D9KrxYnl45cnck9bq3QOQCWnGPE
	 75LqC2K73TR5qg1tkpZ7okKUfvj5Bws2vXMzUlJSWXxiWCDzveqd2IJ7dZnA4DcbUIthK
	 ZpyXnkWgW/+ucPw7f/1m68hQWL2DjLQJ+GQUHXbFwWejbmM6E8wdU1X8lFIoPw5pliXRA
	 LuLYmdeNQYMH+fQU4PFjX6CBOL0p3Lr9tTnTiXa3pJxy+Rt71UqdgdMLFKW0Yp9Le2W0l
	 yh4gCBGSo5dc9/k1phXUiXhF7KqbKjau92hwYP0RDaoZohOkBjc3HpRbvv1zZV+gkZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Hb+a0W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523F606A881
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D523F606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Hb+a0W
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-94937a33cfbso478561085a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 04:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794919821; cv=none;
        d=google.com; s=arc-20260327;
        b=liQVv642uCgk6k3g8yPs92DI3XE36xZDod0cb5++TFwm9HQCAgSzf1v/ctHhSBpk2p
         ReHTxsuASdoo+b91Me5qLoKEK4RWJGO4azCjGt8mFzZiL/BqQnwiqY7EacbfG+uBt9VX
         aEN2UtNGIu1Ou+mQs3yPawRTWX3r2E1JlheBefshOS1wOjTmJeX0g3w7jk8lIiLC4ZU0
         h3xQkL13E1fAVn0ODOu42flAGHOzO4luf7x/Zsdty+fOIzJWkkF1bu6MCoa/L1O2uLPv
         ZaBQ7f+9drTnTnIWi2iF5jfNke3RNpr7L+YlPU639ErqKBvtk8CwMAw1jokcQbVfoODH
         F7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
        fh=Z3Ltbh8BclnrpFnlmwQDz5wGCFXWIOu9zk09Hf9fXG8=;
        b=fEEjVSQTtxq5NCzT+N24kV7kDhS8mvhZYEcQIIRJWBpRqLyu6a5Xps88jJQ+x1qNko
         K4M3ArFV1kX8mtPPTOQi1BxtZK+0hvzne8CxF6/kb1i+fVTgHXmSF+07VpdHLdQGn1FY
         6ZdSRmggmKpTSEZZxpdCnNBjowKKAM4pcK70WE813/EmMKNcO1EpUVuy9jdS78OUPyuu
         uZplRj102fULJfuocESwmovSQMUW1BSryN7TkjUDwczPoZD2uJ+jbWdZcEs8eiKnetmC
         zEsz98m/cTqMJVzb6c7l+imbArWuvq0kVlEjaR2UMw/MAiGL1y4V5LZvEOoPEJ4RMrG/
         lnPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919821; x=1795524621; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
        b=o9Hb+a0WYUIeOvcJtaETOIwbHWIe9WOD+E7oxe2zgbIlldTq7fyfAP4w9OoQAhigX0
         +Hl1A1dW1DcPiQTCCxK+Hbjwi+4nRfwAw5b5sqymk3xEnf5OSsfsGlkpzcYk65c+lOs7
         cTJGUHeb/5s85QhImivwm1Zmv8qp6zYLwD+Y+QLJ4ygFlFe1TCOBohaNBVQ4osUO0TUQ
         ECso/6Bof7XeEyafIKVzafzT5hbdMtgwRAMrrH+jnsJ6n50FcIALMDRQbOHdxSsBeFgt
         EGiaKTG9aCGy388MUvsJa+fBv1GgM+FGo5f+2Q7PR2PXurNYnK+ND+58gIcKv87n8q4r
         A7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919821; x=1795524621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alp2wdj0ciuINrldi+v2R8ftFh9goTMatxYZrDAB0WY=;
        b=E+QlmklC+2ItSr20Z25B1RgegP8q33Y73BA0UDN0rX6t3sq5mt+LZN/ioU5H2yRDs0
         Nw5kHgINOB3ZTZeiFn0Uc89yqzhSbcyoptMDecOpLVZF67at3bxN+3kfGaeDv+qlCI0Q
         oh+M4Sr+oyG4RKAn1nckIm8DMq+NXhx0PKe71l2NJIQCRTHEeHxUtqxU1c6CZOe/aw/x
         QqUyLB7WcFF9UV5F/OxVeluc+IRBZdKk+vJCELbnKkfhlSCV2/eY3dKMx+DweCiVi7cX
         ujhq+iNz4jYvjAGRiIK2oSpX4RFZNPjaMIpeU3G9exwgKj427LytIdALzY7AxezYzHZY
         p4Cw==
X-Gm-Message-State: APuU4Z+uvioGLeGfGVXE3xpv3DbGVyF/AB3GNcOa+/grkqyL1dtm+SXQ
	qnKcxCztiEirfCFr9k6ggTAS7LKmfEu1IyNFhZPZXcaUAOLOzPAwzyW4LgLMRSufCLlN8X9Duad
	hOnfs0QBVwIDUWFlaEdL0g0vimfct1BPfOQ==
X-Gm-Gg: AYBFou14K6bCQkziMYruXh157EvtuFC+zCqILWc47e4DbzNBxAPK9XGhtjSszRGnw2K
	qwK2+N/u6CSGVgBycyQToMc2r5OMrgVw8EHtDvHQUjYWbgNHCa6xgx/mrjuTeFbUnZBgxLEBF1h
	+a2ipmB1kOV0RAkGQ9+C5PKKrxdag5bg09ElU1Y43m4m2APxxXyow38eL3X0zzl0d8pkI5q+WkP
	5XwkkQBonR6wSp48E6Q9tb9VkpBV9BJ0k7AEk3q/ApEpLhm5QrcE7FyOGw8EevalOSDV3eUomBH
	di/c7PhBqF87wnTTcztykIQjTZ9YJCve1ZdtNingwYSzqNvQDfA6wsNT+1H1BQv3X+GDCJYBwSN
	rI2qEFS95LcBCBsiLqis/9Du5zIRWhxikHGA9q6+nJnNT1QMaCHv+Ejnn38jOsg/qZPIjVQ==
X-Received: by 2002:a05:620a:2b46:b0:949:6898:2e4b with SMTP id
 af79cd13be357-94968982e92mr1377520185a.66.1794919820609; Tue, 17 Nov 2026
 04:50:20 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
 <20261116-sdhi_hs400-v2-3-de41f7a7f330@bp.renesas.com> <sashiko-outbox-217555@kernel.org>
In-Reply-To: <sashiko-outbox-217555@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 17 Nov 2026 12:50:08 +0000
X-Gm-Features: AclHuK-JNOMvr1H6WVjiviK4fa2hA1fYql31E_0MLnDzOYs0jMAbidAzy2CCdtY
Message-ID: <CADT+UeBDnDrgz=AqH08JqbgdGQ+ogzZPhozghSotao_d_Sqmqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: Add RZ/G3L HS400 support
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] mmc: renesas_sdhi: hs400 state not cleared in
>   renesas_sdhi_reset()
> - [Medium] mmc: renesas_sdhi: transient SCLKEN enable in
>   renesas_sdhi_set_clock()
> - [Medium] mmc: renesas_sdhi: ios.timing check in
>   renesas_sdhi_set_clock() halves clock
> --
>
> commit f53353ca4ff89c05b540eaa85ee6f33b90c060d3
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> mmc: renesas_sdhi: Add RZ/G3L HS400 support
>
> This commit adds HS400 mode support for RZ/G3L by introducing the
> TMIO_MMC_HS400MODE2 flag, programming the SDm_SCC_HS400MODE2 register, an=
d
> handling the RZ/G3L HS400 internal divider bypass and divider 0
> restriction.
>
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 7dfcf7f970aae..66da2d1e93708 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> [ ... ]
> > @@ -226,12 +227,33 @@ static void renesas_sdhi_sclken(struct tmio_mmc_h=
ost *host, bool enable)
> >       }
> >  }
> >
> > +static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
> > +                                       struct renesas_sdhi *priv);
> > +
> >  static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
> >                                  unsigned int new_clock)
> >  {
> > +     struct renesas_sdhi *priv =3D host_to_priv(host);
> >       unsigned int clk_margin;
> >       u64 clk =3D 0, clock;
> >
> > +     if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
> > +             /*
> > +              * While HS400 is enabled in hardware only divider 0 is a=
llowed.
> > +              * Leaving HS400 (e.g. mmc_hs400_to_hs200()) lowers the c=
lock
> > +              * before the core calls prepare_hs400_tuning(), so disab=
le
> > +              * HS400 here once a non-HS400 clock is requested.
> > +              */
> > +             if (priv->hs400_active && new_clock &&
> > +                 new_clock <=3D MMC_HIGH_52_MAX_DTR)
> > +                     renesas_sdhi_reset_hs400_mode(host, priv);
> > +
> > +             if (new_clock)
> > +                     priv->hs400_clk =3D priv->hs400_active ||
> > +                             (host->mmc->ios.timing =3D=3D MMC_TIMING_=
MMC_HS400 &&
> > +                              new_clock > MMC_HIGH_52_MAX_DTR);
> > +     }
> > +
> >       renesas_sdhi_sclken(host, false);
>
> [Severity: Medium]
> Does calling renesas_sdhi_reset_hs400_mode() here transiently re-enable
> CLK_CTL_SCLKEN before the new clock rate and divider are programmed?
>
> renesas_sdhi_reset_hs400_mode() clears the HS400 mode bits (re-engaging t=
he
> internal /2 divider while priv->clk is still 400 MHz and CTL_SD_CARD_CLK_=
CTL
> still holds divider 0) and ends with renesas_sdhi_sclken(host, true), rig=
ht
> before renesas_sdhi_set_clock() calls renesas_sdhi_sclken(host, false) to
> stop the clock again.
>
> > @@ -259,6 +281,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc=
_host *host,
> >                       clk &=3D ~SDHI_SD_CLK_CTL_DIV1;
> >       }
> >
> > +     /*
> > +      * RZ/G3L SoC HS400 mode has only 1 divider value.
> > +      * Other divider values are prohibited
> > +      */
> > +     if ((host->pdata->flags & TMIO_MMC_HS400MODE2) && priv->hs400_clk=
)
> > +             clk =3D 0;
>
> [Severity: Medium]
> When host->mmc->ios.timing is MMC_TIMING_MMC_HS400 and new_clock <=3D 52 =
MHz
> (such as in mmc_select_hs400() before mmc_set_bus_speed() or in
> mmc_hs400_to_hs200()), does the SDHI_SD_CLK_CTL_DIV1 check just above
> halve the bus clock to 25 MHz?
>
> drivers/mmc/host/renesas_sdhi_core.c:renesas_sdhi_set_clock() {
>     ...
>         /* 1/1 clock is option */
>         if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & =
0x1)) {
>                 if (!(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400))
>                         clk |=3D SDHI_SD_CLK_CTL_DIV1;
>                 else
>                         clk &=3D ~SDHI_SD_CLK_CTL_DIV1;
>         }
>     ...
> }
>
> At 52 MHz, priv->hs400_clk is false, so renesas_sdhi_clk_get_rate()
> already divides the 100 MHz core clock by 2 to 50 MHz for the internal
> divider, and the divider loop selects the 1/1 divider (clk =3D BIT(22)).
> Because the check above still tests ios.timing =3D=3D MMC_TIMING_MMC_HS40=
0, it
> clears SDHI_SD_CLK_CTL_DIV1 and programs divider 0 (1/2), dividing the
> 50 MHz clock a second time to 25 MHz.
>
> [ ... ]
>
> > @@ -623,6 +674,12 @@ static void renesas_sdhi_reset_hs400_mode(struct t=
mio_mmc_host *host,
> >                        host->pdata->osel_tmpout) &
> >                       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPP=
ORT2));
> >
> > +     if (host->pdata->flags & TMIO_MMC_HS400MODE2)
> > +             sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0=
);
> > +
> > +     priv->hs400_active =3D false;
> > +     priv->hs400_clk =3D false;
> > +
> >       if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(pri=
v, hs400_bad_taps))
> >               renesas_sdhi_adjust_hs400_mode_disable(host);
> >
>
> [Severity: Medium]
> Should renesas_sdhi_reset() also clear priv->hs400_active and
> priv->hs400_clk when resetting via priv->rstc?
>
> drivers/mmc/host/renesas_sdhi_core.c:renesas_sdhi_reset() {
>     ...
>         if (!preserve) {
>                 if (priv->rstc) {
>                         ...
>                         reset_control_reset(priv->rstc);
>                         ...
>                         priv->needs_adjust_hs400 =3D false;
>                         renesas_sdhi_set_clock(host, host->clk_cache);
>     ...
>                 } else if (priv->scc_ctl) {
>                         renesas_sdhi_scc_reset(host, priv);
>                 }
>         }
> }
>
> On RZ/G3L, priv->rstc is populated, so renesas_sdhi_reset(host, false)
> resets the hardware out of HS400 mode without calling
> renesas_sdhi_scc_reset() -> renesas_sdhi_reset_hs400_mode().  When called
> during runtime resume or MMC_POWER_OFF (while host->clk_cache is still
> 200 MHz), priv->hs400_active remains true, causing renesas_sdhi_set_clock=
()
> to omit the internal /2 divider in renesas_sdhi_clk_get_rate() and progra=
m
> the HS400 divider while HS400 is disabled in hardware.

Ok will fix these issues in next version

Cheers,
Biju
