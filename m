Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CA343D8A
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 01:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784685248; cv=none; b=trCA3NCHQVX7/6H9jftFqB7p4b94vYML8wJI/UpW1l3A70s44qYPQgolPKWjvsChSEOVP3Vbuelmswfoc4vZmJ3IlDC7UG+UfTQc9XwXPVAhagqlKl9y02EX5pyID0ZmJoompovyWb7pFtKoYvZLNNZqEYXMNuDIvC26LxC0l2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784685248; c=relaxed/simple;
	bh=mEJUBokExlgaW/i1u8SYRYTnEB43dYbMdoSHg3ZfZDo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oKJirfHtOpfxxhNwylNQMe5QQLWIVK7PAoOGAXrDg2xq3qlUP8sovXDUEBNTwf/QjByZUJmOAXOgEHeVGh+UYrrJETk+zLNMOHysCXTvwo4hj+MZ+7GGc14FBxmaFw8m/91aGm0Z3TDNfpHS2hbN0JeoGGCF4PugG26YPiUh04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fu/lsnz3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fu/lsnz3"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0540B838;
	Wed, 22 Jul 2026 03:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784685184;
	bh=mEJUBokExlgaW/i1u8SYRYTnEB43dYbMdoSHg3ZfZDo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fu/lsnz398jck+u2kcz6rOTVYF+ZXOD/lcK74GMY/sgBspqETZkQDQZ/R+FS3p9Zn
	 ZJSYNtjx6ySw2NokyyGUEBfB8ivjDryzRLUIo7rUWv5oWn32YUoYlKC87447v6Kmwf
	 4M9Fy4tXFvCrW6CXkflZoiE85cAJy5IOZnd78M6E=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <al_Ptq4ICRLhsXb_@zed>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com> <20260721-mira220-v5-2-533b0ad1065e@ideasonboard.com> <20260721143615.68F5B1F000E9@smtp.kernel.org> <al-VH7diL1arQLU6@zed> <178465132119.3005206.14389356633093852393@freya> <al_Ptq4ICRLhsXb_@zed>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, Philippe Baetens <philippebaetens@gmail.com>, kieran bingham <kieran.bingham@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 22 Jul 2026 07:23:58 +0530
Message-ID: <178468523820.3005206.17982631531563747321@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Quoting Jacopo Mondi (2026-07-22 01:33:07)
> Hi Jai
>=20
> On Tue, Jul 21, 2026 at 09:58:41PM +0530, Jai Luthra wrote:
> > Hi Jacopo,
> >
> > Quoting Jacopo Mondi (2026-07-21 21:37:59)
> > > Hi Sashiko
> > >
> > > On Tue, Jul 21, 2026 at 02:36:14PM +0000, sashiko-bot@kernel.org wrot=
e:
> > > > Thank you for your contribution! Sashiko AI review found 11 potenti=
al issue(s) to consider:
> > > > - [High] Dereferencing `mira220->vblank` without checking for NULL =
in `mira220_init_controls()`.
> > > > - [High] Missing `v4l2_subdev_cleanup()` in the driver's remove fun=
ction causes an active state memory leak.
> > > > - [Medium] The uninitialized stack variable `id` is evaluated and l=
ogged without checking if the I2C read succeeded.
> > > > - [Medium] The active state format code is not updated when `V4L2_C=
ID_HFLIP` or `V4L2_CID_VFLIP` are modified.
> > > > - [Medium] Exposure control maximum limit exceeds the 16-bit hardwa=
re register width, leading to silent truncation.
> > > > - [Medium] Hardware exposure register is not updated when `V4L2_CID=
_EXPOSURE` is clamped due to a `V4L2_CID_VBLANK` change.
> > > > - [Medium] `mira220_power_on()` discards the actual error code when=
 `clk_prepare_enable()` fails.
> > > > - [Medium] Missing runtime PM reference hold during probe exposes t=
he device to concurrent suspend.
> > > > - [Medium] The error path in probe unconditionally powers off the d=
evice without checking its runtime PM state.
> > > > - [Medium] V4L2_CID_HBLANK reports an incorrect static value when u=
sing a 1-lane MIPI CSI-2 configuration, breaking user-space framerate and e=
xposure calculations.
> > > > - [Low] Typo in user-facing control menu item: 'Vertial Gradient' i=
nstead of 'Vertical Gradient'.
> > > > --
> >
> > [...]
> >
> > > > @@ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *c=
lient)
> > > > [ ... ]
> > > > > +   /* Enable runtime PM and turn off the device */
> > > > > +   pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > +   pm_runtime_use_autosuspend(dev);
> > > > > +   pm_runtime_set_active(dev);
> > > > > +   pm_runtime_enable(dev);
> > > > > +
> > > > > +   ret =3D mira220_identify_module(mira220);
> > > >
> > > > [Severity: Medium]
> > > > Is it possible for the device to be concurrently suspended while pr=
obe
> > > > continues?
> > > >
> > > > The device is marked active with a usage count of 0 after pm_runtim=
e_enable().
> > > > If the PM subsystem or userspace triggers a suspend (e.g. by setting
> > > > autosuspend_delay_ms=3D0), the device could be powered down while p=
robe executes
> > > > mira220_identify_module().
> > > >
> > > > This could lead to I2C timeouts or bus crashes. Taking a pm_runtime=
 reference
> > > > hold could prevent this.
> > > >
> > >
> > > By calling pm_runtime_get_noresume() (as the device is powered up
> > > already) ?
> > >
> > >
> > > > @@ -1985,5 +1985,5 @@ static int mira220_probe(struct i2c_client *c=
lient)
> > > > [ ... ]
> > > > > +error_power_off:
> > > > > +   pm_runtime_disable(dev);
> > > > > +   mira220_power_off(dev);
> > > > > +   pm_runtime_set_suspended(dev);
> > > > > +   return ret;
> > > > > +}
> > > >
> > > > [Severity: Medium]
> > > > Should this error path check the runtime PM state before unconditio=
nally
> > > > powering off the device?
> > > >
> > > > The PM core might have already suspended the device due to the zero=
 usage count.
> > > >
> > > > Calling mira220_power_off() unconditionally could redundantly disab=
le clocks
> > > > and regulators that are already disabled, potentially causing doubl=
e-disable
> > > > warnings.
> > > >
> > >
> > > Only in the case some suspend went on during probe. Even if unlikely,
> > > guarding the call with
> > >
> > >         if (!pm_runtime_status_suspended(&client->dev))
> > >                 mira220_power_off(&client->dev);
> > >
> > > costs nothing
> > >
> >
> > For the above two issues it would be simpler to move the autosuspend ju=
st
> > before you return from probe:
> >
> >     pm_runtime_set_active(dev)
> >     pm_runtime_enable(dev)
> >
> >     ... rest of probe ..
> >
> >     pm_runtime_idle(dev)
> >     pm_runtime_set_autosuspend_delay(dev, 1000);
> >     pm_runtime_use_autosuspend(dev);
> >
> >     return 0;
> >
> > I saw this pattern in imx219/imx708 (sashiko was happy with this part in
> >                                      the imx708 series I posted last we=
ek)
> >
>=20
> This is a good suggestion.
>=20
> To be honest the comment
>=20
> -------------------------------------------------------------------------=
-------
> @ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *client)
> [ ... ]
> > +     /* Enable runtime PM and turn off the device */
> > +     pm_runtime_set_autosuspend_delay(dev, 1000);
> > +     pm_runtime_use_autosuspend(dev);
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +
> > +     ret =3D mira220_identify_module(mira220);
>=20
> [Severity: Medium]
> Is it possible for the device to be concurrently suspended while probe
> continues?
>=20
> The device is marked active with a usage count of 0 after pm_runtime_enab=
le().
> If the PM subsystem or userspace triggers a suspend (e.g. by setting
> autosuspend_delay_ms=3D0), the device could be powered down while probe e=
xecutes
> mira220_identify_module().
> -------------------------------------------------------------------------=
-------
>=20
> Does mention "userspace triggering a suspend" (a system suspend?)
> which seem to imply might happen concurrently to the driver probing
> even if the device doesn't use autosuspend..
>=20

Hmm I wouldn't rely on Sashiko's understanding of PM framework, it has been
wrong about it before [1] because it tries too hard to be adversarial.

The example it used was setting autosuspend_delay_ms=3D0, would be good to
check if that is even possible with your current driver. In general if any
random sysfs write or system suspend can mess with the probe, I would
likely file it as a bug in the driver core or PM framework, who should
ideally prevent that.

> I feel like I should take your suggestion in and ignore the case of
> system-suspend-while-probing ?
>=20

Yes, that pattern feels cleaner overall, even if Sashiko is wrong. If it's
easier to reason about for a bot, it's probably easier to read for humans
too.

>=20
> > Thanks,
> >     Jai

[1]: https://lore.kernel.org/all/20260520160638.7F2BA1F000E9@smtp.kernel.or=
g/
    and https://lore.kernel.org/all/178080367434.9570.8101421417305606672@f=
reya/

Thanks,
    Jai
