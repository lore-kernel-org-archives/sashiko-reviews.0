Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214537;
	b=XgXaVqZ0BDIiA3Jh0jstU9VCLBR20rFS5jxB55WyAOFeBSnQrrJ8U0Trr0+k+4RLV4IQ
	 F13oKdDF48vleFg47vAg3UFoZtUeu9xpTPIOL5szk3a4u/n1ug5ViHaj1C6LS9YoZIv2R
	 oM8Yw2E+QogKFzac38OQbMt6Njx4C09wUfVFWmV0ZLl8oHyJwjDcI4y2gxWKEuaO7dokI
	 /a802eAnKa02XMdH2QCJl2sLz7zzP9uVoSzxdpKznTpkQw8GYQiYTTG+q0y9bOY1UnFFJ
	 hQmBmiJ3cCMLd3yh3Z/83HCVVeJxTXmYkt44S9HINJh4FEI85DvAubzojEyZ5J/KsEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
	b=dEnWMBc6h+HXDw39pUSM7sHJarRyAeeqYQi5qCVO9htg0Q51q1qaQDrjtnPY+fI0wnbR
	 XcJ2yjdFfz20RABau4nvpR5loD5aOOcfpxbABQ7bkgD26Krya58fbxYxQdWltF+S1n9Fq
	 B7JOkpWKv5RgK+7vYJWdbcqCNgYLXsznA4SmlkpEMWsuYbPBzyDMp2ftQwCazJPwstvzy
	 8UXYwoFM6ROaWqcxedvEq4Q8HxNhyWwhNAbxH/v7+sH2eYgmSfepqcP/JxLTskyATzI1k
	 sknN4JdVwOAdkfHEVPx0Kvn23vowcNOPg9lVLgM2xpPgO1ffyQBp5i9ajjzePWhcfAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hD8Lb5aF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF06E606A6BC
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 22:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF06E606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hD8Lb5aF
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so1719088d50.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 14:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214531; cv=none;
        d=google.com; s=arc-20260327;
        b=fJOY51jqcl0qtnPbUZH5/hXBJaOHsTShYY3V44YfwEfIpGguIbEjl6++A0YPvFh1ND
         F2HWJdelcSWfsRkDNkta+kh8CoY+VIKsSOzJsQgUazmhFq6nDApoHFlWpNKjAONp+A2V
         BaA40y7TKyXzACRD/R48lkSBt563kqulRvazgyqcG7Y7tod/VsODhTU0I/wctU9MFAFR
         AZvRCjheIhUcHiAR521x5ZXsUFWFDbhm/EIjKFApoCphCuc897Rzp0go4iMOzXU5bs25
         EPaadWhf740XV7Z0ZIJ1dPPRL5upMBNwHLJIkCmjkYyVVcTUu/4Cz4HqArVcOND55GEJ
         R7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
        fh=osfj9leewLfc4MqIYaUjfG4KfpRUNqFnByXZRUnRoVs=;
        b=KBIANaV07b0hmGfj3pBD/akeYrecXDxuZymYIKgi1Dk1IgMlc8h+MK/BM6jr17OgTh
         jX0ti1JsHuslrss8cVcy3fgCjCfv7CrARKkXT4xHHExh3GONE1By1objbsp9EFKYPv3c
         ND2t3tgmrBv6fWGQIqZGbP9S1GfVoV9wZLtDza5iJkmG5Pgufq8lW4vxq79iMdgyhPM5
         jEPNtVSVncMv1X0v8FyFrKYmet0/6Jxt69/kkabkuiiBEAs9Z2f3/joV7lka/zbBJ+8e
         AdsNO6fbAgvvur+Jp5PEGvmQkWPPCAcnSdbJaWW+Eofdi8tRf8QUvVl7Roy50tSltYw4
         IFow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795214531; x=1795819331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
        b=hD8Lb5aFkwbNJeKt8o3UFJx1J4AF35gLDePrMozP7iYel2Fww3Y6pjeSVZUKTi404M
         83c0T5W/gV5NNtaUn+CWiyqPiPqEOmN0Sgv9k16EQ87hAsrwRf0eHXIcUpOqnqKV6DhO
         1O3A2DiK6WALxw0FEFBANnzF38FA839OTWr0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214531; x=1795819331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQU4s0s9jpO6QmWD/0jmrJPFOrD2Wfw5sN63JkEaowU=;
        b=vfFmErr9xT8DYufw/6CElcs/U5666IaP7qbeB5STRFbOz26v4W36qZhBAhUU4vMX9n
         iSDot5xvKvxi3URTdSHo1G7pJ8cr8J2Me22zHRl8LBJuEs12HofGXVZ5PfmkK+7GuqfE
         WqNGcnkvivphFtVRCziYP/jQpXGRK3zOED/gQEWwm7ug4VGEm+SrJU/gUiruDTj0VsxW
         iCB01TEj8PEjgzEtviuXMiJjca5ZFWlooYud43os8r8X/UFXStU6Qdnx5aA9QKaLob/6
         3q/5F9evI6c7VUStIt33kHk3XoESIBhbzayn/QGAUumr+icbnPRzZZ4zAXpgoOQ3qCko
         77+g==
X-Gm-Message-State: APuU4Z9rhfbv7OMIqpbaWCsh5Vq3nEKldHt2JFHsfqmmDbCoLUaXtB2P
	nIlrqXCD+YxVzNWubFAxwFmz7X9jQRRsbszdNzwBqQ2mSfVAE0fmussDjFKyPpNNzzRh5BSeFU2
	DachE17o67Mas7m4nafhcySBFvC1Mz2soU3S/ecD3MMeA4GKCIrESuw==
X-Gm-Gg: AZFdTZfTZ1ogO1KEpQNmLQkTEmnhYAelEwV5EjlW/jP8vbXSQRyOO3cvCQyJMy0emqZ
	RAKKhb+5umgb78UJGEhwq4/l+pcrZNkw1ZqazBmUyCiWcm4BhEJC2I7olBEhOkXD8a9HsjvZdC0
	9Yx7pDkJEuATGC3tgmgo94sksfFrajM2I2mtsACEUOsOE7zDfY9vBMMv1ZO68Xh1/mE9kwuAMag
	p5fyuXVVILvKJtMojGIZwfY2ucHXEF9Smer0Ik6RPImvi1t0Msxb6k+5/q4wIjTcviNy+qMqMmd
	U4Cj0mavHqBHtazA9QYIHsYYNxBgtTe0g4AMXsAFAoNRO8saZmHplS2TeHNefUuxgpdaODwJBHv
	65/7B8lnsORUmiXKiJz/LqRdSF8cLX+Apid8mQan442eoFEJ7s4IoXgPcB76wUUByOrA=
X-Received: by 2002:a05:690e:1918:b0:67d:e4c3:d838 with SMTP id
 956f58d0204a3-67df440a008mr1910475d50.29.1795214531587; Fri, 20 Nov 2026
 14:42:11 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
 <20261024-send-upstream-v7-11-abad13174b43@chromium.org> <sashiko-outbox-183484@kernel.org>
In-Reply-To: <sashiko-outbox-183484@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 14:42:00 -0800
X-Gm-Features: Aa3M54qwBjwBmrAzhDq76JOH0mkyHB45HQlbB0ykD_xKYZsQBf4Gvgfm3ggVaBs
Message-ID: <CAEe3GZHSuQ2c2gOJPgJDu08T2+m+2RHLmcpGsE_0o+=UX96F_A@mail.gmail.com>
Subject: Re: [PATCH v7 11/11] HID: spi-hid: add panel follower support
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] HID: spi-hid: unrecovered deassert_reset() failure in spi_hid_=
resume()
> - [Medium] HID: spi-hid: improper wakeup teardown for panel followers in =
probe
> --
>
> commit 35d9a38c1b6ffa8dbb3ab740ec9ce120c5b2e7a1
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add panel follower support
>
> This commit adds DRM panel follower support to spi-hid so that a follower
> device powers up and suspends in coordination with its panel rather than
> during initial probe and standard system PM callbacks.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 3b8874ca0e1cc..496b33cdf3d46 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -325,28 +328,30 @@ static int spi_hid_resume(struct spi_hid *shid)
> >               return 0;
> >       }
> >
> > -     if (!device_may_wakeup(dev)) {
> > -             if (shid->power_state =3D=3D HIDSPI_OFF) {
> > -                     shid->ops->assert_reset(shid->ops);
> > +     /*
> > +      * Check power_state, not device_may_wakeup(): power/wakeup can c=
hange
> > +      * while the device is off.
> > +      */
> > +     if (shid->power_state =3D=3D HIDSPI_OFF) {
> > +             shid->ops->assert_reset(shid->ops);
> >
> > -                     shid->ops->sleep_minimal_reset_delay(shid->ops);
> > +             shid->ops->sleep_minimal_reset_delay(shid->ops);
> >
> > -                     error =3D shid->ops->power_up(shid->ops);
> > -                     if (error) {
> > -                             dev_err(dev, "%s: could not power up: %d\=
n", __func__, error);
> > -                             /* Suspend runs next even if resume fails=
. */
> > -                             enable_irq(shid->spi->irq);
> > -                             return error;
> > -                     }
> > -                     shid->power_state =3D HIDSPI_ON;
> > -                     reinit_completion(&shid->reset_done);
> > -                     error =3D shid->ops->deassert_reset(shid->ops);
> > -                     if (error)
> > -                             dev_err(dev, "%s: failed to deassert rese=
t: %d\n",
> > -                                     __func__, error);
> > -                     else
> > -                             was_reset =3D true;
> > +             error =3D shid->ops->power_up(shid->ops);
> > +             if (error) {
> > +                     dev_err(dev, "%s: could not power up: %d\n", __fu=
nc__, error);
> > +                     /* Suspend runs next even if resume fails. */
> > +                     enable_irq(shid->spi->irq);
> > +                     return error;
> >               }
> > +             shid->power_state =3D HIDSPI_ON;
> > +             reinit_completion(&shid->reset_done);
> > +             error =3D shid->ops->deassert_reset(shid->ops);
> > +             if (error)
> > +                     dev_err(dev, "%s: failed to deassert reset: %d\n"=
,
> > +                             __func__, error);
> > +             else
> > +                     was_reset =3D true;
> >       }
>
> [Severity: Medium]
> What happens if shid->ops->deassert_reset(shid->ops) fails in
> spi_hid_resume()?
>
> For non-followers, initial power-up goes through spi_hid_dev_init(), whic=
h
> powers down the device and returns the error when deassert_reset() fails.
> For panel followers, spi_hid_core_probe() leaves shid->power_state as
> HIDSPI_OFF and shid->hid as NULL, and spi_hid_panel_follower_work() relie=
s
> on spi_hid_resume() for the initial power-up as well as subsequent resume=
s.
>
> When deassert_reset() fails in spi_hid_resume(), was_reset remains false
> while shid->power_state is set to HIDSPI_ON and the IRQ is enabled with t=
he
> device still held in reset:
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_resume() {
>     ...
>         if (shid->hid) {
>                 if (was_reset && spi_hid_wait_for_reset(shid)) {
>                         /* No reset response: let recovery retry. */
>                         set_bit(SPI_HID_ERROR, &shid->flags);
>                         schedule_work(&shid->reset_work);
>                         return -ETIMEDOUT;
>                 }
>                 /* HID requests would fail while the device is not ready.=
 */
>                 if (!test_bit(SPI_HID_READY, &shid->flags))
>                         return 0;
>     ...
> }
>
> On the first power-up of a panel follower, shid->hid is NULL, so
> spi_hid_resume() returns 0 without scheduling shid->reset_work. On subseq=
uent
> resumes where shid->hid is non-NULL, was_reset is false and SPI_HID_READY=
 was
> cleared during spi_hid_suspend(), so spi_hid_resume() again returns 0 wit=
hout
> setting SPI_HID_ERROR or scheduling shid->reset_work.
>
> Should a deassert_reset() failure in spi_hid_resume() trigger recovery (o=
r
> clean up and return the error) so the device is not left powered on in re=
set
> and permanently uninitialized?

Same as the 10/11 comment; the next panel prepare retries the power
up.

>
> > @@ -1447,6 +1452,108 @@ static struct hid_ll_driver spi_hid_ll_driver =
=3D {
>
> [ ... ]
>
> > +static int spi_hid_register_panel_follower(struct spi_hid *shid)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +
> > +     shid->panel_follower.funcs =3D &spi_hid_panel_follower_prepare_fu=
ncs;
> > +
> > +     /*
> > +      * If we're not in control of our own power up/power down then we=
 can't
> > +      * do the logic to manage wakeups. Give a warning if a user thoug=
ht
> > +      * that was possible then force the capability off.
> > +      */
> > +     if (device_can_wakeup(dev)) {
> > +             dev_warn(dev, "Can't wakeup if following panel\n");
> > +             device_set_wakeup_capable(dev, false);
> > +     }
> > +
> > +     return drm_panel_add_follower(dev, &shid->panel_follower);
> > +}
>
> [ ... ]
>
> > @@ -1523,21 +1618,19 @@ int spi_hid_core_probe(struct spi_device *spi, =
struct spihid_ops *ops,
> >               }
> >       }
> >
> > -     error =3D shid->ops->power_up(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: could not power up: %d\n", __func__, er=
ror);
> > -             return error;
> > -     }
> > -
> > -     error =3D shid->ops->deassert_reset(shid->ops);
> > -     if (error) {
> > -             dev_err(dev, "%s: failed to deassert reset: %d\n", __func=
__, error);
> > -             shid->ops->power_down(shid->ops);
> > -             return error;
> > +     if (shid->is_panel_follower) {
> > +             /* Like the IRQ: the first panel_prepared resume enables =
it. */
> > +             disable_work(&shid->reset_work);
> > +             error =3D spi_hid_register_panel_follower(shid);
>
> [Severity: Medium]
> Does calling device_set_wakeup_capable(dev, false) in
> spi_hid_register_panel_follower() after devm_pm_set_wake_irq() in
> spi_hid_core_probe() leave the wake IRQ configured and leak
> dev->power.wakeup if wakeup was enabled on the device before probe?
>
> In spi_hid_core_probe(), if the firmware node marked the device as wakeup
> capable (for example via acpi_bind_one()), device_can_wakeup(dev) is true=
 and
> devm_pm_set_wake_irq(dev, spi->irq) attaches a wake IRQ before
> shid->is_panel_follower is checked:
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_core_probe() {
>     ...
>         if (device_can_wakeup(dev)) {
>                 error =3D devm_pm_set_wake_irq(dev, spi->irq);
>                 if (error) {
>                         dev_err(dev, "%s: failed to set wake IRQ\n", __fu=
nc__);
>                         return error;
>                 }
>         }
>
>         if (shid->is_panel_follower) {
>                 /* Like the IRQ: the first panel_prepared resume enables =
it. */
>                 disable_work(&shid->reset_work);
>                 error =3D spi_hid_register_panel_follower(shid);
>     ...
> }
>
> Furthermore, if a wakeup_source was attached to dev->power.wakeup (for
> example via sysfs power/wakeup before async or deferred probe completes),
> calling device_set_wakeup_capable(dev, false) directly sets
> dev->power.can_wakeup =3D false without detaching the wakeup source first=
.
> Subsequent calls to device_wakeup_disable(dev), including from
> device_pm_remove() on unbind, check dev->power.can_wakeup and return earl=
y:
>
> drivers/base/power/wakeup.c:device_wakeup_disable() {
>         struct wakeup_source *ws;
>
>         if (!dev || !dev->power.can_wakeup)
>                 return;
>
>         ws =3D device_wakeup_detach(dev);
>         wakeup_source_unregister(ws);
> }
>
> Should spi_hid_register_panel_follower() use device_init_wakeup(dev, fals=
e)
> (which calls device_wakeup_disable(dev) before clearing wakeup capability=
),
> and should spi_hid_core_probe() skip devm_pm_set_wake_irq() when
> shid->is_panel_follower is true?

This follows i2c-hid's panel follower handling. The wake IRQ is
not armed once can_wakeup is cleared, and the SPI core doesn't
enable wakeup before probe.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-send-ups=
tream-v7-0-abad13174b43@chromium.org?part=3D11
