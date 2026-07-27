Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BD1221F0C
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785117677; cv=pass; b=DTcyzSgABHV2rwcDGdmapZSRJAmhRJq+3tVbTVHdshh6BVMfYEgxB8jimBFnivHnboEkncD4yvBzyIWqZpDHco48/mGW8q9RVCyNGqnA4C7SAUOcwj4ouZIhQSWZIIeXPQrFZV8UNc8+R5ekU9diD8RObIljuGk9YYlFXiT3J80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785117677; c=relaxed/simple;
	bh=Cgbgb/97B5pbnCy8IhzLU2oyYhrh12Il+I37KXS84To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duoy3TFkTzSBLmvQKvwkYxrvyg7PE/NCEC89LffVEifI/r2kCAHbtsAF4nANajVXAL4e3XkVBxD3rhmp5IvVcf/nABt9wAUHasX7cap4qkqIzCU8JmKthpIzuz/MutJLAbVnmxtqUyqww0iCHV5FEQ4q/rTVx9QVtKPrlwBpfgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw1RYKXY; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw1RYKXY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a33fb0031so353555a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 19:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785117674; cv=none;
        d=google.com; s=arc-20260327;
        b=fdpYkP6Xkx5AziosSFQOSZb/MOcd4T6VBcd78b7FpZDcAs9pBAa4UzW/H4+VhnGd0A
         g5ucyrxRqWdF3dkFDGuXg78rdRh9wT6I6ZCGwITmtlr+sIrH6VGzZYJ4p0Rm/7UFq2T/
         08iORHTOatJiUGhRYF2FazQfgONpe8QzhXsGaGAXcFFSjLYzjSpEn/zFIjs40YZQ9Tv9
         vyA9C8xiDxT8wQ/WlQ2nQZ5jXzOZ9uth5W4F4F01sKzddYEao7i0uRrkuyNYS00ito4L
         J19WOl8NRv/5F49bXyAz7Q7BNLaYRVye577TH4Htyn86inUb/ZalnFbjLWnRjKHxcbum
         qjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5+/AHWCEducqpwF8K7BV+G/0gvvxyPh5lYi8bnFbPfA=;
        fh=HPXTtJLJxKVrj9M3SSTlrGVUwD4+tiliYxLiqpIhSGs=;
        b=hMiLVFPirRJUfDKUbzbxRjSUlv/wQW302H5+aHwc+Z9cJVzrS4Nm47d680ymyRvJ4w
         OU2rqud1T3khwtqAk2r6IZfb/odohticfxVeYdQTs0WD9N8IP8XRnCXbgcvw6R7+2x5X
         xLbc+BhRfCavd8r95tAWGTLzg1GhYnllNEnuVBNegQvhRVRWwAPDMdP1IMEUTB8JQXtz
         H3Zx8GH4nmbCV57TDAjtrM10yPPfUGeNOEKFHXh1cxyPU6r7HR60nKtJKvRZ2xKpvlls
         /PSiDpfeaLy5EyuSp5jqV7y0fPec3het2DoTo0wG6iIF3vSiQatCVFwM3C1XNO93sdqD
         wtvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785117674; x=1785722474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5+/AHWCEducqpwF8K7BV+G/0gvvxyPh5lYi8bnFbPfA=;
        b=Dw1RYKXY7iaH3zWOCSMoSxNnBaNEUICcCIfkP/C/gYZMTGT96ARsLph4swn3yutA6D
         FJ7VC3c0rj1EVxVQbQ5ZGysYnL9DAAtUOs7KhnN2kpUODQbvABk6YNVnFB2tXI3CnOoB
         rgg9tRR+cpCQGYit901Cjwz3gKU21zPQ79bt5y3X59HPmyR1rLGxg/WryhJGXG7Rpj5o
         NKWbmRcJ94LEudW4SR//AzsGLHYpOSfFuZzTM/H05jIfCbolNmsTnBcuX7hC/l+R42pW
         5FZEToZkT2jy2h+XRYWCZXuzVldjzyvDMRwKElWn5ng8U3yS/p0aiJeEVKKrl6ijeUzL
         xFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785117674; x=1785722474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+/AHWCEducqpwF8K7BV+G/0gvvxyPh5lYi8bnFbPfA=;
        b=oHFsUBzKwhEs50p0xXndAsUwYWL1v/BpnliMnjGs5J5uR1EXJSmOONJrDshqZ+4tEK
         sPfW1zL0K38WOxYAvGMari0JvbaHhJsrG32b1jZNxT5MGHUfPq6XUSY51OMK/vp2qV/v
         p3j33Pp2gLd4EwvFasdRmoHnbAFjM1i6GOVA6zojTGovLtMLHWcD+jKX5ccAO6pAV3jd
         h+og8cKBnj/YcvPAHLStNtbI53046q1WitFlY21aJRACQUyeQmpEc/KxO41t3C1c6DYn
         fs/zCMzONX51EJTFoqHfXOL03agLZue6Bwl5XT4ouvvSXWY5ykGD9l/dYwd3LEa63fkc
         KaYQ==
X-Gm-Message-State: AOJu0YwVCCgWUj72rkNiwfIRDi8l7U+9XN6zTquO+ar0qV9TVJ6UZgGh
	FUL7hrzBda6hhTiL4v1TUE3GCq5MlxLPOPX9lM0rZVxU0uRYyTXyWGU4YFsv1pZbIrxIWZ6gOoT
	NOJAXOWS/LB3aw1Bl3oksuysGuac1FLvgt8yKvxI=
X-Gm-Gg: AR+sD10xzbD8Q1OSTSUCZLH0uY3nUNfGdfmh02jRee4JrgVO637sh6YBCN8TH+hTQTz
	BGmeAvIkt3D7qYxZ4qVepqz6Ay6vbsZ6PYngHaTS53RL+KqihYYSUJ6Tnzu6q+yuqzWpBwnLZgy
	U+79huhh6mMYgNRVxHS89URuJShiAi1Z1W0TcQ05X/rozd9US7GpVkQiy70wkqz4+bzxM8t5Bu3
	gNRLB+kncfHhvnCp9ruOc45u1IHkcCiwvPnr8H/a9KkhKPlCQAYwgMqi/XI+mgWRCWYLQs=
X-Received: by 2002:a05:6402:234f:b0:698:81d7:b812 with SMTP id
 4fb4d7f45d1cf-69fc1160318mr1644222a12.3.1785117673656; Sun, 26 Jul 2026
 19:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-4-cf9cc34a412a@gmail.com> <20260726150717.05D3F1F000E9@smtp.kernel.org>
In-Reply-To: <20260726150717.05D3F1F000E9@smtp.kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Mon, 27 Jul 2026 10:01:01 +0800
X-Gm-Features: AUfX_mxPeRAwfMB1LW6SbwIcSwcwD6Ov9zJ0Sq5EDYBErYupCAq0i7GTmKZBjAA
Message-ID: <CAPwA33K1oxnyzPgFOSTGyjCX2RLE8BEupUHe6XOn5A6UWSPKfw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY
 receiver support
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, 
	vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this code poll for PHY_READY while the PHY is still held in reset?

Yes, and that is the sequence the TRM specifies: the RK3588 TRM
start-up sequence (figure 22-8) asserts S_RESETN, programs the settle
registers, enables the lanes, waits for PHY_READY to go high, and only
then deasserts S_RESETN. The poll does succeed on real hardware -
every capture listed in the cover's Testing section went through this
exact path.

> Without this in the RX path, could the shared APB bus interface and BIAS
> block remain in an uninitialized state from the bootloader?

This one came up on v1 as well; summarizing the disposition: the
vendor BSP's RX bring-up does not touch the APB reset either, the TRM
does not require it for the receiver, and the CSI-only configuration -
where the receiver is the only direction ever powered - captures
frames on real hardware without the APB reset ever being issued. The
BIAS block is programmed explicitly by whichever direction powers on
first, so nothing relies on bootloader state.

Happy to revisit if either assessment looks wrong.

Thanks,
Jason


<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8826=E6=97=A5=E9=80=
=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The RX power-on sequence fails to toggle the shared APB reset (`=
apb_rst`) when it is the first PHY direction to power on, potentially leavi=
ng shared PHY state uninitialized.
> - [High] The RX lane enable function polls for `PHY_READY` while the PHY =
is still held in reset, guaranteeing a timeout failure.
> --
>
> --- Patch [4]: [PATCH v2 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY=
 receiver support ---
> commit 8b1f5adbd06df56ad03e2b8d081a6587be5fe71d
> Author: Jason Yang <jason98166@gmail.com>
>
> phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support
>
> This patch implements the receiver (CSI) direction of the D-PHY for the
> Rockchip Samsung driver. It adds the RX register layout, HS-frequency set=
tle
> table, and hooks the receiver bring-up and teardown into the per-directio=
n
> power paths. The PLL sequence is also skipped for the receive path as the
> sensor supplies the link clock.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > index 95eb1200cab48..f6d112935c016 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> [ ... ]
> > @@ -988,6 +1046,228 @@ struct samsung_mipi_dphy_timing samsung_mipi_dph=
y_timing_table[] =3D {
> [ ... ]
> > +static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy =
*samsung)
> > +{
> > +     struct samsung_mipi_dcphy_dir *pd =3D &samsung->phys[RK_DCPHY_DIR=
_RX];
> > +     u32 sts;
> > +     int ret, i;
> > +
> > +     regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE,=
 PHY_ENABLE);
> > +     for (i =3D 0; i < pd->lanes; i++)
> > +             regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0=
[i],
> > +                                PHY_ENABLE, PHY_ENABLE);
> > +
> > +     ret =3D regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON=
0,
> > +                                    sts, sts & PHY_READY, 200, 4000);
>
> [Severity: High]
> Does this code poll for PHY_READY while the PHY is still held in reset?
>
> Looking at samsung_mipi_dphy_rx_power_on(), samsung->s_phy_rst is asserte=
d,
> then samsung_mipi_dphy_rx_lane_enable() is called, and only after that is
> s_phy_rst deasserted.
>
> Will this cause the PHY_READY poll to always timeout?
>
> > +     if (ret) {
> > +             dev_err(samsung->dev, "RX clock lane not ready\n");
> > +             goto err_lane_disable;
> > +     }
> [ ... ]
> > @@ -1004,6 +1284,44 @@ static void samsung_mipi_dcphy_bias_block_enable=
(struct samsung_mipi_dcphy *sams
> [ ... ]
> > +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *sa=
msung)
> > +{
> > +     bool first =3D !samsung->phys[RK_DCPHY_DIR_TX].powered;
> > +     int ret;
> > +
> > +     if (!samsung->phys[RK_DCPHY_DIR_RX].hs_clk_rate)
> > +             return -EINVAL;
> > +
> > +     reset_control_assert(samsung->s_phy_rst);
> > +
> > +     if (first)
> > +             samsung_mipi_dcphy_bias_block_enable(samsung);
>
> [Severity: High]
> If the RX direction is powered on first, does it need to toggle the share=
d APB
> reset (apb_rst) before enabling the bias block?
>
> In samsung_mipi_dphy_tx_power_on(), when first is true, it does:
>
>         if (first) {
>                 reset_control_assert(samsung->apb_rst);
>                 udelay(1);
>                 reset_control_deassert(samsung->apb_rst);
>         }
>
> Without this in the RX path, could the shared APB bus interface and BIAS
> block remain in an uninitialized state from the bootloader?
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
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-dcphy-rx=
-v1-v2-0-cf9cc34a412a@gmail.com?part=3D4
