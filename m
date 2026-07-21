Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26546D2A3
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651329; cv=none; b=To67fRd8kvl2E+JNS3elpyjwnDKaPT87vF7O2eVP2ld04DRUvOw/1GqM9S28ZDu83M9deErKjhSZ8rOV3e2Dtwp/0IEd5Scqzqp8BaQYPEc55/+Rmj0kc8dI6WCmKO1ZTyzrYENOI92eDCBue0vuqmTeK5CHsYHOEynckXyo+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651329; c=relaxed/simple;
	bh=UECWk/b4oqoiDuPX07RYGuSq3lLl8qDVbnQ2y0q3S5I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ac+sStJwb0obDgxLuHfibgW3QEWXnTVZTR2ni1IeRwauDMNtH3vwt8hEp8ZInIrcT/YXE++vLElBn38Yu3YjdnbUIaKO1qw7F4q4ykr+nywKi/WAsd/91QK2QApLEW2QGxh/vFExnRqerUXUhsqzLceUNpEo0aiHmz6+4Vq1DmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ulQqVGF7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ulQqVGF7"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C0FA517;
	Tue, 21 Jul 2026 18:27:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784651267;
	bh=UECWk/b4oqoiDuPX07RYGuSq3lLl8qDVbnQ2y0q3S5I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ulQqVGF7TevkXBCD8RIUVxCIrL53rL9yeKgw2vhNmP+Nc/GJf63AdwPEGDNI1dXmy
	 hLkNOxSSOQ8/hQ/ofgIq6MfAL6SYtCBwPvgQ/3sO6HWw2Gf+Hq9iJYA0o+5+avCGLL
	 K7D/6zuEjtymE/zS3Gs8oEFKs5nnvXC7t8/XSDs8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <al-VH7diL1arQLU6@zed>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com> <20260721-mira220-v5-2-533b0ad1065e@ideasonboard.com> <20260721143615.68F5B1F000E9@smtp.kernel.org> <al-VH7diL1arQLU6@zed>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, Philippe Baetens <philippebaetens@gmail.com>, kieran bingham <kieran.bingham@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, sashiko-reviews@lists.linux.dev
Date: Tue, 21 Jul 2026 21:58:41 +0530
Message-ID: <178465132119.3005206.14389356633093852393@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Jacopo,

Quoting Jacopo Mondi (2026-07-21 21:37:59)
> Hi Sashiko
>=20
> On Tue, Jul 21, 2026 at 02:36:14PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 11 potential i=
ssue(s) to consider:
> > - [High] Dereferencing `mira220->vblank` without checking for NULL in `=
mira220_init_controls()`.
> > - [High] Missing `v4l2_subdev_cleanup()` in the driver's remove functio=
n causes an active state memory leak.
> > - [Medium] The uninitialized stack variable `id` is evaluated and logge=
d without checking if the I2C read succeeded.
> > - [Medium] The active state format code is not updated when `V4L2_CID_H=
FLIP` or `V4L2_CID_VFLIP` are modified.
> > - [Medium] Exposure control maximum limit exceeds the 16-bit hardware r=
egister width, leading to silent truncation.
> > - [Medium] Hardware exposure register is not updated when `V4L2_CID_EXP=
OSURE` is clamped due to a `V4L2_CID_VBLANK` change.
> > - [Medium] `mira220_power_on()` discards the actual error code when `cl=
k_prepare_enable()` fails.
> > - [Medium] Missing runtime PM reference hold during probe exposes the d=
evice to concurrent suspend.
> > - [Medium] The error path in probe unconditionally powers off the devic=
e without checking its runtime PM state.
> > - [Medium] V4L2_CID_HBLANK reports an incorrect static value when using=
 a 1-lane MIPI CSI-2 configuration, breaking user-space framerate and expos=
ure calculations.
> > - [Low] Typo in user-facing control menu item: 'Vertial Gradient' inste=
ad of 'Vertical Gradient'.
> > --

[...]

> > @@ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *clien=
t)
> > [ ... ]
> > > +   /* Enable runtime PM and turn off the device */
> > > +   pm_runtime_set_autosuspend_delay(dev, 1000);
> > > +   pm_runtime_use_autosuspend(dev);
> > > +   pm_runtime_set_active(dev);
> > > +   pm_runtime_enable(dev);
> > > +
> > > +   ret =3D mira220_identify_module(mira220);
> >
> > [Severity: Medium]
> > Is it possible for the device to be concurrently suspended while probe
> > continues?
> >
> > The device is marked active with a usage count of 0 after pm_runtime_en=
able().
> > If the PM subsystem or userspace triggers a suspend (e.g. by setting
> > autosuspend_delay_ms=3D0), the device could be powered down while probe=
 executes
> > mira220_identify_module().
> >
> > This could lead to I2C timeouts or bus crashes. Taking a pm_runtime ref=
erence
> > hold could prevent this.
> >
>=20
> By calling pm_runtime_get_noresume() (as the device is powered up
> already) ?
>=20
>=20
> > @@ -1985,5 +1985,5 @@ static int mira220_probe(struct i2c_client *clien=
t)
> > [ ... ]
> > > +error_power_off:
> > > +   pm_runtime_disable(dev);
> > > +   mira220_power_off(dev);
> > > +   pm_runtime_set_suspended(dev);
> > > +   return ret;
> > > +}
> >
> > [Severity: Medium]
> > Should this error path check the runtime PM state before unconditionally
> > powering off the device?
> >
> > The PM core might have already suspended the device due to the zero usa=
ge count.
> >
> > Calling mira220_power_off() unconditionally could redundantly disable c=
locks
> > and regulators that are already disabled, potentially causing double-di=
sable
> > warnings.
> >
>=20
> Only in the case some suspend went on during probe. Even if unlikely,
> guarding the call with
>=20
>         if (!pm_runtime_status_suspended(&client->dev))
>                 mira220_power_off(&client->dev);
>=20
> costs nothing
>=20

For the above two issues it would be simpler to move the autosuspend just
before you return from probe:

    pm_runtime_set_active(dev)
    pm_runtime_enable(dev)

    ... rest of probe ..

    pm_runtime_idle(dev)
    pm_runtime_set_autosuspend_delay(dev, 1000);
    pm_runtime_use_autosuspend(dev);

    return 0;

I saw this pattern in imx219/imx708 (sashiko was happy with this part in
                                     the imx708 series I posted last week)

Thanks,
    Jai
