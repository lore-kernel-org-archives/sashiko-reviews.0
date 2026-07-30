Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5B036A03F
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401041; cv=pass; b=SplIr6BxRfK8jzJZsP1RbiWW9xzI38w6tjFou9NYU670SH4vYpx8IPeWfjgxa+1gqWt5tLrjBo0cWZefzOblZmyYBbAczwaoZVGLXRsSySn/vheknzWYp9+MI4051SGqUKiSYv8lbp01RYtj3LyBMXDP8mALs6Wcp6STYj26kdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401041; c=relaxed/simple;
	bh=Ru71+WFlJWFBpbdTm3eIOQ17TUmrQj82u/YmVjINnrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8hmznYIrmsCwC7UQTtt+eI1jwze9tkdJXFcTU7LZRtYZ/P6mV/6JO4e0K5ElPEnJ86bgiVPhJEq8b+HuxJ4ilFZYsIS70eju/hWoHSPoerMcbNthgZ8AeJk6vJG529zd25IhP2mR/pTBS5jdpF96eEqvBPBLgbonrBstwG63QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6+sbLTD; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6+sbLTD"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667f1390f58so2582756d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 01:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785401038; cv=none;
        d=google.com; s=arc-20260327;
        b=XuF4cukowepFSnbyy9aSjDQeehYcaEXbBMEBz8aK0iODSjulfoKW9vyS1o89e3nFyM
         ufLw0o/A6ODyCcGq/R5oMSqwPxFuoDS/uVClZHWbxLaTv5QjbwscUmm2qO7O3b3mr1iF
         pu+zArmMcAbDwwTtbg4I2bQGvvzQUxb4y053V7E8KtsEdjIg/Fzxk4/Ddsq6mZ9x3J7W
         1v+0KWsaxDI5tTDmJvrgliFvAqyz1u4J18fGCFbbqGjTgu3w6/1OOeSGTTbKlubWpwC4
         NvWfAJgXDjwNBXeSj/ulV53yfGb62nqhcc1h5t6tISvHFyTTbLdDQhEfCH/byhJY21fP
         ljVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yaKFxfR0fzpkcksdwy+w8qcnKI4eQ3ef3ipK09UpHVA=;
        fh=byHgOfYmdgGkLqTOu/xRGCGzOl8NHjvEMDUZO9gl7rY=;
        b=jAXdgUA8ibU+XQPrwXW3S61jz1phizVbMDjiVbuz51K/qFe4syCuDFdCkoDBtHgfd4
         rXJXG8Y/ZrA5NOMdV+ZdCQCEcphVTUAC3SS2hVhDcpsAy/uwID0j6QrSzHGhydjT/j0u
         ONRUdjulHYuGRsb/ZnJgrTVUHxad7D0n5evSvLSx/8ffCI7nxI25MYNGdzyWi6gj7eFE
         JOjnxjIzAPNOjinWLlecsYFnItktq9k03zx7/GgxYp/h5EkqPK85ilDsH3VzO3Om27Rg
         o8eRqANa9bjKyQ63wx47ShNp918Uc0pkz9NpKmLgREWdXJ7RKTITNtXtz/09reayYwxj
         I5YA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785401038; x=1786005838; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaKFxfR0fzpkcksdwy+w8qcnKI4eQ3ef3ipK09UpHVA=;
        b=l6+sbLTDRhHneztxdoxSsFzfPo0PpZDGauJ244+nCdj7wtBREYFqEWMjz7D5NHf06H
         9MqztD15cYi1OGT3mLg6sMx5ahnms9Pbsl7x7Iu83ZRprNDqrFXSH6LrJMzHIaA7SrYD
         xQ7QmvZuZNrECBaYyYFItk9dcHEK1epLdb2jkkzvL+H1naC4LREVqFIj7W1x0Kzf3nLE
         ypGiOpcI0jNBrhgPqNmAxoqyRak3F55bJEzobIrPwxyQaPZ6pWDLKkypn+E/kxzeQem+
         NhhNoz2Iw1nC6WrOkiT9GVXyiM7ZegeKjPTVledH8LdpExH+shReukJvfcFnNyfSNoQ8
         xnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401038; x=1786005838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaKFxfR0fzpkcksdwy+w8qcnKI4eQ3ef3ipK09UpHVA=;
        b=ArHAfzxSxeoCknjk1nXD3H2EL9glYg1xbJ2pUEOA+dHKIIuT7Bin8HGFbQ+sk8s45E
         OquJ6qHXBf9nEOINa0YLZFiLSxJTBr7TM4UINOe22Q6Q4Hwbh7frhtG82G20ZDJE55gE
         m0JwCbJ2nGOImpU1iLve+p70iSrmJi7WJ0OTYueZDWxQWFCV2orM/PxH4FQDdIpSr3kN
         4pPZtcay3OdzgmBSfzCaB31RaKKI7CkM60Cm9dAeWrKcduinLMYEVDC0yKFx1yiodA+5
         nOFVpCQy5nc/Aj1gG/fjEuGd+cPdlhSujKJX/FjVCoWYhjNaWskqr/fRlmIlfKqNjb8G
         YTeA==
X-Gm-Message-State: AOJu0YzO+ezbJIVeYP57WYrh3WpMmxDBoZhlY0VAKVKmF8+7T39yfbu6
	Od9NU653eJE+n9Hs4YqG83d9ksOwWgQ7Q5+Tk/TnhgrcCAROnuOY8Vt+GnYJPJGF4NvpIMhyHXs
	mg68T3KDvTpOaYINb2msJMA+pEcu007FQNBK9hDBz6NOOptDt+67aZluP1Q==
X-Gm-Gg: AR+sD11Zx53uNyvwqipDta/vgBBM08nD/hWB3WAB0h4b9JwsKM4YDwDguOlShmjr8lg
	WkeKYsWSoKqDuMKXheXWqwV3Jzm4s1PnCEQ06g+Ng7yYUCRo3a4ecThje8wee8lm3/0GilsBSJX
	AIkGHldc+Me9pjeDvPP2Z9x138MMq1WQmXpt0Fi7TWfuS+QYu3Vyu6jJSGLjYPAATBfiIWt7DaA
	9GeJ39y/vP8hsoOF743fGuBVyKhr1hB9dDVJfonhOQvigApQfn8ByukNbwj/VQE/tmhQZOLfzT8
	nBStAkYaLQpqo5QRgLt/M8REVDjJoXi/yE+HZfSSAKdrEVHA
X-Received: by 2002:a05:690e:e83:b0:668:15d6:8fd9 with SMTP id
 956f58d0204a3-6692f4a9ed7mr1128538d50.24.1785401037357; Thu, 30 Jul 2026
 01:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org> <20260727082018.2E7221F000E9@smtp.kernel.org>
In-Reply-To: <20260727082018.2E7221F000E9@smtp.kernel.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 Jul 2026 16:43:45 +0800
X-Gm-Features: AUfX_mzmu9T7jWwyxv5TKXdZNOp5IckU0GRtjEnl3MBaxtLZhEgB4Ber3zbb-JE
Message-ID: <CABymUCN9Dft18JZW9NtP_pu_UxEWWpdr-cLhgAN=_3f4AY8A7Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=8827=E6=97=A5=E5=91=
=A8=E4=B8=80 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 8 potential issu=
e(s) to consider:
> - [High] A copy-paste error in the BOE panel initialization sequence dupl=
icates command bytes, corrupting the DSI payload.
> - [High] Concurrent non-atomic read-modify-write operations on DSI `mode_=
flags` can corrupt the transmission mode state.
> - [High] Missing IS_ERR() check on the return value of devm_drm_panel_all=
oc() leads to an immediate dereference of an error pointer.
> - [High] The backlight sysfs interface is exposed to userspace before the=
 DSI device is fully configured and attached.
> - [Medium] The macros LE16_BYTE0/1 and BE16_BYTE0/1 use endianness conver=
sion functions before bitwise masking, causing incorrect byte order on Big =
Endian architectures.
> - [Medium] Returning PTR_ERR() on a valid pointer when the GPIO array siz=
e is incorrect leaks a kernel heap address and produces a positive error co=
de.
> - [Medium] The backlight update_status callback blindly sends DCS command=
s without checking the panel's power state.
> - [Low] An early return in the panel disable path on DSI command failure =
skips disabling the backlight.
> --
>
> --- Patch [6]: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 =
DSI panel ---
> commit 89f5e4df3241a9188e302ee5028a24a7b0bc9542
> Author: Jun Nie <jun.nie@linaro.org>
> Subject: drm/panel: Add driver for Synaptics R63455 DSI panel
>
> This commit adds support for the Synaptics R63455 DSI panel used in virtu=
al
> reality devices. It exposes a dual-panel configuration as a single logica=
l
> panel to the DRM framework.
>
> > --- a/drivers/gpu/drm/panel/panel-synaptics-r63455.c
> > +++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
> [ ... ]
> > +/*
> > + * Extract the low byte and high byte of the 16bit number converted
> > + * to the cpu endianness.
> > + */
> > +#define LE16_BYTE0(val) (le16_to_cpu(val) & 0xff)
> > +#define LE16_BYTE1(val) ((le16_to_cpu(val) >> 8) & 0xff)
> > +#define BE16_BYTE0(val) (be16_to_cpu(val) & 0xff)
> > +#define BE16_BYTE1(val) ((be16_to_cpu(val) >> 8) & 0xff)
>
> [Severity: Medium]
> Will this generate the correct byte order on Big Endian architectures?
>
> Since be16_to_cpu is a no-op on Big Endian systems, applying the bitwise
> shift and mask afterward will extract the bytes in Little Endian order
> rather than Big Endian. This will cause the panel initialization sequence=
 to
> receive payload bytes in reversed order.
>
> Could we directly shift and mask without the endian conversion macros to
> safely serialize CPU-native integers across all architectures?

From Neil:
No we extract the low byte and high byte of the 16bit number converted
to the cpu endianness,
so it's the right code here.

>
> [ ... ]
> > +static int r63455_panel_on_boe_vs026c4m_n52_26000(struct drm_panel *pa=
nel)
> > +{
> [ ... ]
> > +     r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
> > +                          0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> > +                          0xf, 0xb2,
> > +                          0xf, 0xb2, 0x00, 0x64);
>
> [Severity: High]
> Does this sequence intentionally send the 0xf, 0xb2 bytes twice for the B=
OE
> panel initialization?
>
> This looks like it could be a copy-paste error that sends 14 bytes instea=
d
> of the expected 12 bytes. Could this transmit malformed configuration dat=
a
> to the display controller and cause initialization failures?

Yes, the sequence is send twice intentionally. As there are 2 panel control=
lers
as 1 logic panel in DRM high level system.
>
> [ ... ]
> > +static int r63455_set_brightness(struct r63455_ctx *ctx, u16 brightnes=
s,
> > +                               u16 pulse_offset_rows)
> > +{
> [ ... ]
> > +     ctx->dsi[0]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> > +     ctx->dsi[1]->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> [Severity: High]
> Are these bitwise operations on mode_flags safe from race conditions?
>
> Since r63455_set_brightness executes under the backlight sysfs lock, it c=
an
> run concurrently with DRM atomic commit handlers like r63455_enable or
> r63455_disable which use independent locks.
>
> Could a concurrent read-modify-write here corrupt the transmission mode s=
tate,
> such as unintentionally dropping the MIPI_DSI_MODE_VIDEO flag?

It's very improbable this happens, panel cmds and backlight are called
at very different times.
>
> [ ... ]
> > +static int r63455_disable(struct drm_panel *panel)
> > +{
> [ ... ]
> > +     r63455_dsi_write_seq(ctx, dsi_ctx, MIPI_DCS_ENTER_SLEEP_MODE);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 200);
> > +
> > +     if (dsi_ctx.accum_err)
> > +             return dsi_ctx.accum_err;
> > +
> > +     /* required by hardware to be after MIPI_DCS_ENTER_SLEEP_MODE */
> > +     return backlight_disable(ctx->backlight);
>
> [Severity: Low]
> Does returning early here leave the backlight subsystem in an active stat=
e?
>
> If the DSI ENTER_SLEEP_MODE sequence fails, the driver skips calling
> backlight_disable. While the physical regulators are disabled later in
> r63455_unprepare, could this leave the backlight framework out of sync?

Technically yes, but practically it is an unrecoverable hardware state. So =
it is
a low risk issue and can be ignored.

>
> [ ... ]
> > +static int r63455_bl_update_status(struct backlight_device *bl)
> > +{
> > +     struct mipi_dsi_device *dsi =3D bl_get_data(bl);
> > +     struct r63455_ctx *r63455_ctx =3D mipi_dsi_get_drvdata(dsi);
> > +
> > +     return r63455_set_brightness(r63455_ctx, bl->props.brightness,
> > +                                  bl->props.pulse_offset_rows);
> > +}
>
> [Severity: Medium]
> Does this function need to verify the panel power state before sending DC=
S
> commands?
>
> Userspace can modify the brightness via sysfs while the DRM display is
> disabled. If this occurs, it might trigger MIPI DSI transmissions to a
> powered-off panel or unclocked DSI host.
>
> Could this lead to hardware lockups or DSI timeouts?

Yes, I will add below logic in next version.

+++ b/drivers/gpu/drm/panel/panel-synaptics-r63455.c
@@ -456,6 +456,9 @@ static int r63455_bl_update_status(struct
backlight_device *bl)
        struct mipi_dsi_device *dsi =3D bl_get_data(bl);
        struct r63455_ctx *r63455_ctx =3D mipi_dsi_get_drvdata(dsi);

+       if (!r63455_ctx->panel.enabled)
+               return 0;
+

>
> [ ... ]
> > +static int r63455_panel_add(struct r63455_ctx *ctx)
> > +{
> [ ... ]
> > +     ctx->reset_gpios =3D devm_gpiod_get_array(dev, "reset", GPIOD_OUT=
_LOW);
> > +     if (IS_ERR(ctx->reset_gpios) || ctx->reset_gpios->ndescs !=3D 2)
> > +             return PTR_ERR(ctx->reset_gpios);
>
> [Severity: Medium]
> If the GPIO array has a count other than 2, will this return a positive v=
alue
> derived from a valid heap pointer?
>
> When devm_gpiod_get_array succeeds but returns an unexpected number of
> descriptors, ctx->reset_gpios is a valid pointer rather than an error poi=
nter.
>
> Could we return an explicit error code like -EINVAL here instead of leaki=
ng
> the pointer address through PTR_ERR?

Right, -EINVAL is proper value to return.
>
> [ ... ]
> > +static int r63455_probe(struct mipi_dsi_device *dsi)
> > +{
> [ ... ]
> > +     ctx =3D devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), panel,
> > +                                &r63455_drm_funcs, DRM_MODE_CONNECTOR_=
DSI);
> > +
> > +     ctx->dsi_init_seq =3D of_device_get_match_data(dev);
>
> [Severity: High]
> Should we check the return value of devm_drm_panel_alloc for an error poi=
nter?
>
> If memory allocation fails during driver probe, devm_drm_panel_alloc retu=
rns
> ERR_PTR(-ENOMEM). Dereferencing ctx on the very next line to assign
> dsi_init_seq will result in a kernel panic.
>
Right, a check shall be added in next version.

> [ ... ]
> > +     ret =3D r63455_panel_add(ctx);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(dev, "failed to add panel %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     for (i =3D 0; i < 2; i++) {
> > +             dsi_dev =3D ctx->dsi[i];
> > +             dsi_dev->lanes =3D 3;
> > +             dsi_dev->format =3D MIPI_DSI_FMT_RGB888;
> > +             dsi_dev->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MO=
DE_LPM |
> > +                     MIPI_DSI_CLOCK_NON_CONTINUOUS;
> > +             ret =3D devm_mipi_dsi_attach(dev, dsi_dev);
>
> [Severity: High]
> Is it safe to register the backlight device before the DSI host is config=
ured
> and attached?
>
> Calling r63455_panel_add exposes the backlight sysfs interface to userspa=
ce.
> However, the lanes, format, mode_flags, and devm_mipi_dsi_attach are not
> set up until the loop that follows.
>
> If a udev rule writes to the brightness node during this window, could it
> trigger DSI transmissions on an unattached device and lock up the host?

It is OK per Neil's answer.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-sm8650-7=
-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org?part=3D6
