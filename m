Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A430D401
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349283; cv=pass; b=KejnPCygYuXyJokZ5nuW8T0PsUouPf4mA/fsarLqRemEydOdSyET8hk34LvHDldBm+dGea3G4eIAt0ekEJubWafm6uF9sz1g92m3Pa7eidN6O853WBPQIhgEcatX6rJodG2T1t7DxqnupYQuDBQDiMT2BUl+VP0kdSkS8K1RbBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349283; c=relaxed/simple;
	bh=z1WMhYROfcnlWkez5XhXfycvYHmg/c2mKR5LYrEvaX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ko0KKbKLlQHs9x6miYVvuirr5+e9G5rMOO9TFEQKVRJVbFd0Y9kZFmVtTNrxkDUarVK5q1V7cdcMWTlGU5joKqcwhMwyEnd9UzpIL60vaTO8ZL0w2iWmFLulEfNsJgfhV8WAvhol+xhaM2G9yL7dwpQRKq1rrdpXoslgkD03ejI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxP6CD2j; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxP6CD2j"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664c6304683so2889814d50.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 07:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783349281; cv=none;
        d=google.com; s=arc-20260327;
        b=dXHsbNddCQPEQUiJ1IVu0/UEfZyMg1tSLkfh7UxpwBBoO8rBcHx+PdYTyDQx9A0lRl
         fcNBQFBRE1bi1MG6/l7c4CZnf+67BvQr8twtI0HcKMZCXyvmp4+UqFdh1FMruqpRNNQ/
         Oal/EAQIiclJ4Zmlt+4EstJNWR73r0SCUbK2ulYnmHw9P3O2sncm9U0K29sdpZ6Pz2Y8
         NnhbYxZIQL/m4N+gxyDMDUJ2atVwEf0CSIdJZbxgmNASviNIbOOLVx2w9gYPb4gKAEcm
         ld/mPnHUh/Xh7h1vQBrlSNpzdNvzwql04d8W4v8cuFvuQ3Cp6MlVlLPB0rBt0xmELdnZ
         PC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p5nnj/UGt/6jwYg2fLgCm/eVqC9qp6a8hp/dGZkv014=;
        fh=weZoGF8xMOu5NmEVSewSYOp+V7Y8Zz14LaoQfGzRhX0=;
        b=rGZA3atQkn+YVHqMjDq5msfXeXw2GqlpTt6P5v55WH0q79qsHE8DJRQZ8JR8pMpC4O
         jz1fAQYQpF96osi7Z+8zb6lG8M672juiQy2kqisdeL5gD4hxp7h2iA9fN9i9/XIMMSiQ
         Lt0Fcm5C9YK4SkNBQJgjBoVGesxRx9ROWHHk5KOgEHKJbdT0HcevvnCwC3+vMlFesXQi
         MIHv3rPNW402ZKlTnQ0rXP4L+eAe0YtOHB4rRQL6HVMNFROrc0xSE86Sh3E5jXG12f9A
         pvT44koZWEZsVAXFb9DJdsZQ76vQoeCHxpEBTd/ehF7G44QTQ36+TGYgBRdmznHSkUTZ
         0Euw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349281; x=1783954081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5nnj/UGt/6jwYg2fLgCm/eVqC9qp6a8hp/dGZkv014=;
        b=YxP6CD2jl+MbuQhkYw/iYBK3KENuwf3LfzS6irdBdxgM6yT7GYJDq0x5rzTAdPSM5L
         F296uMVa18/6uAyWPjnG3EpBKzhyjfOCb2jz8PEB9Mo3fmdhck/xoYAJ5aVGo8gaZCRk
         7BQjAaNj1JeVswfWtaNFHecj4lrQLVaAdDLQMbz9g9Fr4K6+hfsyG1GlTYfoaDnu0zId
         P/vZymMCVN17ltelWxtKNptOt2IFgW1PZHFgFYPvsoTWmAkl1PcF5LGcjwgWKi6DZZUG
         hEoIdbuO8bhHAE1NsFbQiNQCr0XwmfiuQ1k/8j7/jiZ8z0i0XPSIwMErZP/JhBMorAaA
         c4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349281; x=1783954081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5nnj/UGt/6jwYg2fLgCm/eVqC9qp6a8hp/dGZkv014=;
        b=rU6b/csxVY2WPCfzsmRhCqpW882XM3IyISwkeBd5spnV1G4EdNfGBM65U34f2dpeCb
         6PlNnKyomYL9YFfZ6vmk3vTV3FIdork4/i71rzWBCrJxZDMXTb0Fru53AXsPU3BKe6J1
         CU4PrKtuvQnxd9xItHuiWxDtRa+HhUiovY3aXp7rSwLHuyIc/L1rTn8vaT7xpJsSuqFV
         dMG/uzuljUCTyt+FtzJhFuQCjohZ1MXnfYthbOf45WHLP42sfc47TRCwu2n62HqxSkjb
         FEMqyPbK15hfSqIDzJ7V+tarMGFToUk4oG+O3V1X4NtGUNhF+S4snQG60FPtJtowrTL8
         l5GQ==
X-Gm-Message-State: AOJu0YzmNTgG1MxYZrIqYGsb83zMRH7arW0XQql+qEROqu2BRvQNWZNJ
	6ysuOPLg/4e5SJHZZMZdA4jHi3gMdynoMUFPtp+gFTduyxWcpXJcbYz9DLtNGAFng+Tk7qN47Xe
	p2Oi9MIjgilsGFQXpwTq1CRm+hZJ8c+baPA==
X-Gm-Gg: AfdE7cnj7O/bfHokFouZkOJ9Al2E+38O5lx9h5ohXEaBToMp+HVarjj18yK8YFINdk4
	5yb3bYHgKAyChH7pRYPlgefQBmkkHqRTdxEH5+9MfTjjrOfS25G6WxHXPTA/uLnLl5lUIC7FtqK
	+WE5yxyZzmW2zPTPylMHoWGRmLWUgaI0RETZxT3zKrHMwSoPVgeaQ0He9xhu3D3YtEVvoN3vyRg
	1FsWccIMmr3ak1aLsRM+Bcm6vSxNEAsyD5lYWYl9qRivqsk1aQ/jxMzXExJBL8WuNTbZyZ8Eg==
X-Received: by 2002:a05:690e:14cc:b0:664:d162:6b79 with SMTP id
 956f58d0204a3-6677fd1eed7mr679747d50.77.1783349276001; Mon, 06 Jul 2026
 07:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705140100.1543486-1-tmaimon77@gmail.com> <20260705140100.1543486-4-tmaimon77@gmail.com>
 <20260705141048.75C5D1F000E9@smtp.kernel.org>
In-Reply-To: <20260705141048.75C5D1F000E9@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 6 Jul 2026 17:47:45 +0300
X-Gm-Features: AVVi8CdXTk1bIQEOW3h9KTSW1KJWWjzHAZ_jfS41xGm8rGDEHzBzwdiWBU9odgY
Message-ID: <CAP6Zq1i_n7OSPJDBxKfcJnDutFC2B1jmGdFJ0M_F+rv7SOGNrw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] watchdog: npcm: add bootstatus support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 5 Jul 2026 at 17:10, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Non-atomic read-modify-write on shared syscon registers corrupts=
 concurrent updates or incorrectly clears W1C bits.
Not needed, only the WD using this register.
> - [High] The driver hijacks standardized watchdog bootstatus flags to rep=
ort unrelated SoC reset reasons.
Approved by the maintainer.
> - [Low] The driver hardcodes physical MMIO base addresses to identify dri=
ver instances.
>
> Pre-existing issues:
> - [High] The driver leaks a clock enable reference on every timeout chang=
e and fails to clean up on probe errors.
> --
>
> commit 3d82c9ef067a4770a83258e13cbb0ed566d4998b
> Author: Tomer Maimon <tmaimon77@gmail.com>
>
> watchdog: npcm: add bootstatus support
>
> The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset indicat=
ions.
> Read those bits during probe and map them into watchdog bootstatus flags.=
 For
> NPCM845, cache the sampled INTCR2 state in SCRPAD10 after the reset statu=
s
> bits are cleared.
>
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index e62ea054bc618..82ff3956dcf21 100644
> > --- a/drivers/watchdog/npcm_wdt.c
> > +++ b/drivers/watchdog/npcm_wdt.c
>
> [ ... ]
>
> > +static const struct npcm_wdt_rst_map npcm750_rst_map[] =3D {
> > +     { 0xf000801c, NPCM_WD0RST },
> > +     { 0xf000901c, NPCM_WD1RST },
> > +     { 0xf000a01c, NPCM_WD2RST },
> > +};
>
> [Severity: Low]
> Does this code hardcode physical MMIO base addresses to identify driver
> instances?
It is hardcoded.
>
> Matching the resource start address against hardcoded values in
> npcm_get_reset_status() can be brittle if the memory map changes in futur=
e
> SoC revisions or alternative device tree mappings. Is there a way to use
> device tree aliases or instance IDs to identify the hardware block instea=
d?
>
> > +
> > +static const struct npcm_wdt_status_map npcm750_status_map[] =3D {
> > +     { NPCM_PORST, WDIOF_OVERHEAT },
> > +     { NPCM_CORST, WDIOF_FANFAULT },
> > +     { NPCM_SWR1RST, WDIOF_EXTERN1 },
> > +     { NPCM_SWR2RST, WDIOF_EXTERN2 },
> > +     { NPCM_SWR3RST, WDIOF_POWERUNDER },
> > +     { NPCM_SWR4RST, WDIOF_POWEROVER },
> > +};
>
> [Severity: High]
> Does this mapping hijack standardized watchdog bootstatus flags to report
> unrelated SoC reset reasons?
>
> Translating NPCM SoC-specific reset reasons into standard UAPI flags migh=
t
> cause issues in userspace. For example, WDIOF_OVERHEAT and WDIOF_FANFAULT
> are strictly defined in the UAPI to indicate thermal overheating and fan
> failures.
>
> Could system monitoring tools misinterpret a normal cold boot (NPCM_CORST=
)
> as a severe hardware failure and trigger unintended alerts or shutdowns?
>
> [ ... ]
>
> > +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device =
*dev,
> > +                               const struct npcm_wdt_data *data,
> > +                               resource_size_t start)
> > +{
>
> [ ... ]
>
> > +     if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt"))=
 {
> > +             ret =3D regmap_read(gcr_regmap, NPCM_INTCR2_OFFSET, &rstv=
al);
> > +             if (ret) {
> > +                     dev_warn(dev, "Failed to read INTCR2 reset status=
: %d\n",
> > +                              ret);
> > +                     return;
> > +             }
> > +
> > +             if (rstval & NPCM_RST) {
> > +                     ret =3D regmap_write(gcr_regmap, NPCM_INTCR2_OFFS=
ET,
> > +                                        rstval & ~NPCM_RST);
>
> [Severity: High]
> Can this non-atomic read-modify-write sequence on the shared syscon
> register corrupt concurrent updates?
>
> If INTCR2 (and RESSR below) are standard read-write registers, this
> sequence could silently overwrite modifications made by other drivers
> sharing the syscon.
>
> Alternatively, if these are Write-1-to-Clear (W1C) registers, writing
> rstval & ~NPCM_RST will write 1s to all other active status bits,
> inadvertently clearing them, while writing 0 to the watchdog bits,
> failing to clear the intended reset flags.
>
> Would it be safer to use regmap_update_bits() for atomic updates, or if
> W1C, write only the target bits without a read-modify-write?
>
> [ ... ]
>
> > @@ -220,6 +430,8 @@ static int npcm_wdt_probe(struct platform_device *p=
dev)
> >       /* Ensure timeout is able to be represented by the hardware */
> >       npcm_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
> >
> > +     npcm_get_reset_status(wdt, dev, data, start);
> > +
> >       if (npcm_is_running(&wdt->wdd)) {
> >               /* Restart with the default or device-tree specified time=
out */
> >               npcm_wdt_start(&wdt->wdd);
> >               set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> >       }
> >
> >       ret =3D devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchd=
og",
> >                              wdt);
> >       if (ret)
> >               return ret;
>
> [Severity: High]
> This is a pre-existing issue, but does this code leak a clock enable
> reference?
>
> In npcm_wdt_probe(), if the hardware is running, npcm_wdt_start() is call=
ed:
>
> npcm_wdt_start()
>     clk_prepare_enable(wdt->clk);
>
> If subsequent probe steps fail (e.g., devm_request_irq() returns an error=
),
> probe returns without unwinding the clock enable.
>
> Additionally, npcm_wdt_set_timeout() calls npcm_wdt_start() when the watc=
hdog
> is active. Since there is no matching disable on timeout change, every
> WDIOC_SETTIMEOUT ioctl increments the clock's refcount. This prevents
> the clock from ever being disabled when the watchdog is stopped, leading
> to a resource leak.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705140100.15=
43486-1-tmaimon77@gmail.com?part=3D3

Thanks,

Tomer
