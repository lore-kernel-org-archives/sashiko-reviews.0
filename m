Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC1334C08
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785077607; cv=pass; b=FO4TZ2I9nu+BpjpeLoBtT29pSGhOfmXTF9rr5L3cADFuhld0Nbl44YMAI19japFO4CR2ob5z4WRymeYKNMujlASNoFSDZXvh77JjZzUDwiRgCd4+G86TycLybly1/2KLmRPcdfD1K+RAvZwxbkg7JtBfsoKWba1YRtUuXwR/2TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785077607; c=relaxed/simple;
	bh=0GAdslSPIUzPgsP9WtaNMHUaqXLHQnOorwGQNsDzmco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrL+PlOTfOI2tUClsAVa3WaGdNBlmP068GqmZ2SK3n+GegMv3muTmDIiinWxBZkCN3ygR0X16hvUT8+Rgb346wpyz34Jv6SwhxFXVfO7X9QtOHYwhTC02bzB+7gmRrvPcWpm/2IxiJJUr5whQTnTEvDAQhmDXhmVQ5akA6rkwhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COKqOP4r; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COKqOP4r"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698af3e3620so237111a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 07:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785077604; cv=none;
        d=google.com; s=arc-20260327;
        b=XD4uh6ipbLOQBuPfugIIM7kDueBUMrq4vISd+4kdCmcX/gmz3k/TZXUN4ugLzC0szP
         kIJwEcI/rJ2qA85M1iodcFdFt7A3Te1IZ73pwSD3mxskXIHoRCeNhruuaqrXKWSAzjl/
         mtEfWoVYhgLllDzwQO2Db4qKpEfGFYA3MwKluDgGQ6woNE1BUaIcFj34CIrYIPw2UGhg
         OkbTzaxYPUcVx4KIGqcwSu23oeOT9ACCtpv7/TLT9QRWByzjtXdSJ2Tz6LfA0wyvpE0e
         nyIOycTOr56SToau+kMKgJAKj+9NjWGWercZHZGu9S4ZA2IgwSFwgawuM3oZkfbmkGBc
         r8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21Ke86u3QQOW0+WvIHZr/yfreUMZndKTcNAYqwVL8R4=;
        fh=hHuD41Km5rd9t1mUHtqAlep8H7AwWKVWPVF/gkmgTyc=;
        b=n47hXZ0T3w1jaq1BIdYG4L/8linFqFPGH/ihY6bk3DR9K49+ZcuIes5idBM2Pl4SZp
         4IeIdczC5BbUohBmOcnLNNzqTaVfYm7UoV9OijjqPG/dm9T54tQfRmMuhm/PRoXIU26N
         vXgo8VYO+NchrrAilFTbaDTpqL43t9WYYZcFVJDM82n4QMj5oRYMCJK4VeS5mUTaVAq1
         ofSzfBKoPdx4GOsTsYTOtQr8Osb7ZBnReC0KpuMUhnakfDnHasYR8d+DK8KkDyveLuiK
         uTEDd4ZWMQDlEASiehMRGVubSQCo4I5OohlRuvpC0wBgIU0dspSVOSZerFqW6UiReHDZ
         96Kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785077604; x=1785682404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=21Ke86u3QQOW0+WvIHZr/yfreUMZndKTcNAYqwVL8R4=;
        b=COKqOP4rerhr5sS89E4jDtlta3kT7c8nR69eIyYYLoikKQ71UMNbch9Cydl5W0TO+V
         Kkbn/xmU6bTG3VrzjL4RExoH9h/dzBza3Yt1PJl/7aWXl4JNCdGVlsbWx8Vk5kPQLDgk
         lwaOzPippIcNITDP3gFGzENpDBQ7KqOJgLs43ZqSzRclbv14p32GdT2Utp1XgHEsqjj6
         Hj/IiQhHby1V97Iv1QJb6ogp7XIb1cILLYhQ3A4j8N8cRpQZedRh7DKHZQDpqt8NxtPm
         gjS2AA2NK7+AuJb/n04W6SmZSIw006PYBY62DZA6AgNZRnzCvPG+mvNEDJ2zclaJTOY5
         vNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785077604; x=1785682404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21Ke86u3QQOW0+WvIHZr/yfreUMZndKTcNAYqwVL8R4=;
        b=AHaCbON9FgW2tYixPpwihHsGs9igDEQS+ZyKROWM4cRwPQ4t0ZWUXIhVtyni05Wg92
         NsiR9V1QZD6suRPSuz7yUYD23rFiLR4ZmO8sA+Xq5/zewj3XHw4mMP0ANy3FXxurWXIb
         urL2SFX9rCHVWh1tqjRAGfk6rMT396epUUVBHt+/CzDv7XXGUY4dNpdjFYCFY1VCj6h3
         RsitVEOgr7352PRYLs/tMnf3Yyn8M7+d0vY7K2Eex/0T1nUA6nFATb0GwdY7a7+rvYcZ
         W1CYJ4XCbDCPXnrfR0pU5JnIbyehqIQa9LnRP2woVYEEfSkd05jyxw+oZyro+aHhutyb
         FHIg==
X-Gm-Message-State: AOJu0YzevorwdgwreX8oK1UlMCFtcsqeA2JWj3fFcTwkiKTqRSxyFewA
	Vn25YNwS6/6vyZNu8/y5DFPhyB89peqHf3PUjibhkg2aTZdO6JBs7ri14dRSLmVFRmBkfqx7C5m
	ETiYvyjepX7wOjDTO2FsxY3rLfGiKWi8Gtyju
X-Gm-Gg: AR+sD12YmQfsyqMTWIAzsIHJ0c5S6k+cJmKCmjJNCvW4Z8r4f4bRfm155l46o5jNo3s
	XO5EQJuz7S04NBPLvnWUJOh2CtIqTcqdRwIx3k6Fkef6mO6zOhSgnzplnj35JgNJwuzy74MSz/C
	+B1RQixLZ9es6TMydcwv7OcRCR85Nv634EMAQVI8qIyv6JvS0qWRoR7zEOzNN8j+ccb3wiNt7+3
	cg3j2k/iCU4/0RR7+Ggv7bomr9f5gDflQb17Xet3Z3OCZYopaEsq3wyijHHjvxJP8dJfwsP
X-Received: by 2002:a05:6402:388c:b0:698:d8d2:df38 with SMTP id
 4fb4d7f45d1cf-69fc0fe9783mr2207350a12.2.1785077603687; Sun, 26 Jul 2026
 07:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-4-4fc83c0ccac9@gmail.com> <20260721105725.547CD1F000E9@smtp.kernel.org>
In-Reply-To: <20260721105725.547CD1F000E9@smtp.kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Sun, 26 Jul 2026 22:53:58 +0800
X-Gm-Features: AUfX_mzW8odAED0UgyCRKI3eQ77fatS3N-dodt_GM1Fv7QOtJgboWWuZ9d86VQk
Message-ID: <CAPwA33JXBwDcP0fsXGNKDhqVmFH=MG88kx-JgO0noqSUDdZyxg@mail.gmail.com>
Subject: Re: [PATCH 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, vkoul@kernel.org, robh@kernel.org, 
	olteanv@gmail.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The RX power-on sequence fails to toggle the `apb_rst` reset line,

This is intentional rather than an omission. The vendor BSP toggles
apb_rst only on its TX power-on path and never in its RX bring-up, and
this driver mirrors that split: the APB reset is issued only when the
transmitter powers on first. The TRM start-up sequence (figure 22-8)
does not require it for the receiver, and a CSI-only configuration -
where the receiver is the only direction ever powered - captures
frames on real hardware without the APB reset ever being issued.

> If `samsung_mipi_dphy_rx_lane_enable()` fails [...] leaves the
> `PHY_ENABLE` bits set

Valid - in v2 the already enabled lanes are switched back off before
the error is returned.

> The `lanes` configuration field is shared between TX and RX,

Also valid, and it reproduces on hardware (see my reply on patch 3).
In v2 the lane count becomes per-direction state.

> time-of-check to time-of-use (TOCTOU) vulnerability on the
> unprotected `peer->power_count`.

Agreed - in v2 each direction records its powered state under the
provider mutex instead of reading the peer's power_count, which closes
that window.

Happy to revisit any of these if an assessment looks wrong.

Thanks,
Jason


<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8821=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The RX power-on sequence fails to toggle the `apb_rst` reset lin=
e, potentially leaving the shared APB bus interface uninitialized if the RX=
 direction is powered on before TX.
> - [High] If `samsung_mipi_dphy_rx_lane_enable()` fails (e.g., due to a PH=
Y_READY timeout), it returns an error but leaves the `PHY_ENABLE` bits set =
in the PHY registers and unconditionally deasserts the `s_phy_rst` core res=
et.
> - [High] The `lanes` configuration field is shared between TX and RX, lea=
ding to state corruption and incorrect lane cleanup if both directions are =
configured independently.
>
> Pre-existing issues:
> - [High] Concurrent power_on calls for TX and RX can race due to a time-o=
f-check to time-of-use (TOCTOU) vulnerability on the unprotected `peer->pow=
er_count`.
> --
>
> --- Patch [4]: [PATCH 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY re=
ceiver support ---
> commit 1a7ff981a5098deb181df94fdb6e07f8dc4040a9
> Author: Jason Yang <jason98166@gmail.com>
> phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support
>
> This commit implements the receiver (CSI) direction of the D-PHY. It adds=
 the
> RX register layout, the HS-frequency settle table, and hooks the receiver
> bring-up and teardown into the per-direction power and configuration path=
s.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
>
> [ ... ]
>
> > +static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy =
*samsung)
> > +{
> > +     u32 sts;
> > +     int ret, i;
> > +
> > +     regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE,=
 PHY_ENABLE);
> > +     for (i =3D 0; i < samsung->lanes; i++)
> > +             regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0=
[i],
> > +                                PHY_ENABLE, PHY_ENABLE);
> > +
> > +     ret =3D regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON=
0,
> > +                                    sts, sts & PHY_READY, 200, 4000);
> > +     if (ret) {
> > +             dev_err(samsung->dev, "RX clock lane not ready\n");
> > +             return ret;
> > +     }
>
> [Severity: High]
> If regmap_read_poll_timeout() fails here, do we leak the previously set
> PHY_ENABLE bits?
>
> Returning early leaves the PHY_ENABLE bits set in the PHY registers.
> The caller catches the error and propagates it, meaning the framework
> will not call power_off() to clean up. On subsequent retries, writing
> PHY_ENABLE to a register where it is already 1 will fail to produce the
> 0 -> 1 edge transition required by the PHY state machine to start, breaki=
ng
> future attempts to initialize the RX lanes.
>
> [ ... ]
>
> > +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *sa=
msung,
> > +                                      struct phy *peer)
> > +{
> > +     bool first =3D peer->power_count =3D=3D 0;
>
> [Severity: High]
> This is a pre-existing issue, but is it safe to rely on peer->power_count
> here to determine if shared initialization is needed?
>
> The PHY core framework increments phy->power_count outside the driver's l=
ock,
> only after the power_on() callback returns. If Thread A (RX) and Thread B
> (TX) call phy_power_on() concurrently:
>
> Thread A configures RX, drops samsung->lock, but is preempted before
> rx_phy->power_count is incremented.
> Thread B acquires samsung->lock, sees rx_phy->power_count is still 0, and
> executes its 'first' initialization sequence.
>
> For TX, this involves explicitly asserting the shared APB bus reset
> (apb_rst), which would wipe out the entire RX configuration Thread A just
> applied. Should the driver track the initialization state internally inst=
ead
> of relying on power_count?
>
> > +     int ret;
> > +
> > +     if (!samsung->hs_clk_rate)
> > +             return -EINVAL;
> > +
> > +     reset_control_assert(samsung->s_phy_rst);
> > +
> > +     if (first)
> > +             samsung_mipi_dcphy_bias_block_enable(samsung);
>
> [Severity: High]
> If the PHY is used in a receive-first or receive-only role, does this seq=
uence
> omit the apb_rst hardware initialization for the shared APB bus?
>
> Looking at the TX power-on sequence, it toggles apb_rst when first is tru=
e to
> ensure the shared APB bus interface is properly initialized. If RX powers=
 on
> first, the apb_rst toggle is skipped here, and a subsequent TX power-on w=
ill
> see first =3D=3D false and also skip it. Can this leave the shared APB bu=
s
> interface uninitialized and potentially cause system hangs during regmap
> accesses?
>
> > +     samsung_mipi_dphy_rx_config_common(samsung);
> > +
> > +     ret =3D samsung_mipi_dphy_rx_config_settle(samsung);
> > +     if (ret)
> > +             goto out_deassert;
> > +
> > +     ret =3D samsung_mipi_dphy_rx_lane_enable(samsung);
> > +
> > +out_deassert:
> > +     reset_control_deassert(samsung->s_phy_rst);
> > +
> > +     return ret;
> > +}
>
> [Severity: High]
> Does this unconditionally commit the leaked PHY_ENABLE state to the hardw=
are?
>
> If samsung_mipi_dphy_rx_lane_enable() fails due to the timeout mentioned
> earlier, it drops through to here and deasserts s_phy_rst. Combined with =
the
> missing PHY_ENABLE cleanup, this commits the broken hardware state.
>
> [ ... ]
>
> > @@ -1525,13 +1831,17 @@ static int samsung_mipi_dcphy_configure(struct =
phy *phy,
> >       struct samsung_mipi_dcphy *samsung =3D pd->parent;
> >       unsigned long long target_rate =3D opts->mipi_dphy.hs_clk_rate;
> >
> > +     mutex_lock(&samsung->lock);
> >       samsung->lanes =3D opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dph=
y.lanes;
>
> [Severity: High]
> Does sharing the samsung->lanes variable between TX and RX lead to state
> corruption?
>
> Since the driver models TX and RX as two independent PHY instances, eithe=
r
> instance will blindly overwrite samsung->lanes here. If a consumer config=
ures
> TX with 4 lanes and a second consumer configures RX with 2 lanes,
> samsung->lanes becomes 2. A subsequent TX power_off() will read this stat=
e
> and only disable 2 lanes, leaking the other 2 active TX lanes. Should lan=
es
> be tracked per-direction?
>
> > -     if (pd->dir =3D=3D RK_DCPHY_DIR_RX)
> > -             return -EOPNOTSUPP;
> > -
> > -     samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> > -     opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> > +     if (pd->dir =3D=3D RK_DCPHY_DIR_RX) {
> > +             /* The sensor supplies the link clock; the PLL stays off.=
 */
> > +             samsung->hs_clk_rate =3D target_rate;
> > +     } else {
> > +             samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
> > +             opts->mipi_dphy.hs_clk_rate =3D samsung->pll.rate;
> > +     }
> > +     mutex_unlock(&samsung->lock);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dcphy-rx=
-v1-v1-0-4fc83c0ccac9@gmail.com?part=3D4
