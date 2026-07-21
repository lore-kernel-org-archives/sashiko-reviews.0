Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47E47255F
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784664198; cv=none; b=Lc5SVqVFFEKeyrM1G+HqG3RhP/EfR6orNk+qyu8yT29NefdWTjz7db6rJW2XTkVq59yKZlgqJ7wg0lrhiDcI/o/BhLxmCetReOX6d6ac2S+49C5Vyf/gY9TtTUmcyaUEWHalDUWJNvNhzSYvP1Ex0HR4jq3gyCAvpzthoaJ+T6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784664198; c=relaxed/simple;
	bh=t25+hCqC0Q5ry9GEdDkpF+TdzkLSLj4Gw3WnDxivc0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEd+3pWhJOtJMMeNZMiz8zM987l7VPjLN9VXIzXtLKIJ3H3xuZPKqHDiKJCvPN8NblvtE7ORoi/uqSvRAVDrpVn5JNd4WvJ6t30+q+P0/EMPtvSBGAVWmtvyi0g2r6i+IK0NkDeZs8L4Z6u2rppHwGcX1YW95AYuiJGyU4GDHxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LBEgw7je; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LBEgw7je"
Received: from ideasonboard.com (mob-5-90-63-152.net.vodafone.it [5.90.63.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D618517;
	Tue, 21 Jul 2026 22:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784664130;
	bh=t25+hCqC0Q5ry9GEdDkpF+TdzkLSLj4Gw3WnDxivc0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBEgw7jeryo/gACIToEK96mfaHIbeAwYClY/rXvMHaFjSBrlM8CRusyuidTvnfVQr
	 hG6hMHc4O1jhtSHQmZbsL59kSfmAi7XtuUC1bInPVVuhbt1kbyE9MN4LkqXUJZGWUy
	 TkiZUiZwFVH/RHQirdEvqZs2k5fbFv1eWq7yUpZE=
Date: Tue, 21 Jul 2026 22:03:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	media-ci@linuxtv.org, Philippe Baetens <philippebaetens@gmail.com>, 
	kieran bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220
Message-ID: <al_Ptq4ICRLhsXb_@zed>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
 <20260721-mira220-v5-2-533b0ad1065e@ideasonboard.com>
 <20260721143615.68F5B1F000E9@smtp.kernel.org>
 <al-VH7diL1arQLU6@zed>
 <178465132119.3005206.14389356633093852393@freya>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178465132119.3005206.14389356633093852393@freya>

Hi Jai

On Tue, Jul 21, 2026 at 09:58:41PM +0530, Jai Luthra wrote:
> Hi Jacopo,
>
> Quoting Jacopo Mondi (2026-07-21 21:37:59)
> > Hi Sashiko
> >
> > On Tue, Jul 21, 2026 at 02:36:14PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> > > - [High] Dereferencing `mira220->vblank` without checking for NULL in `mira220_init_controls()`.
> > > - [High] Missing `v4l2_subdev_cleanup()` in the driver's remove function causes an active state memory leak.
> > > - [Medium] The uninitialized stack variable `id` is evaluated and logged without checking if the I2C read succeeded.
> > > - [Medium] The active state format code is not updated when `V4L2_CID_HFLIP` or `V4L2_CID_VFLIP` are modified.
> > > - [Medium] Exposure control maximum limit exceeds the 16-bit hardware register width, leading to silent truncation.
> > > - [Medium] Hardware exposure register is not updated when `V4L2_CID_EXPOSURE` is clamped due to a `V4L2_CID_VBLANK` change.
> > > - [Medium] `mira220_power_on()` discards the actual error code when `clk_prepare_enable()` fails.
> > > - [Medium] Missing runtime PM reference hold during probe exposes the device to concurrent suspend.
> > > - [Medium] The error path in probe unconditionally powers off the device without checking its runtime PM state.
> > > - [Medium] V4L2_CID_HBLANK reports an incorrect static value when using a 1-lane MIPI CSI-2 configuration, breaking user-space framerate and exposure calculations.
> > > - [Low] Typo in user-facing control menu item: 'Vertial Gradient' instead of 'Vertical Gradient'.
> > > --
>
> [...]
>
> > > @@ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *client)
> > > [ ... ]
> > > > +   /* Enable runtime PM and turn off the device */
> > > > +   pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > +   pm_runtime_use_autosuspend(dev);
> > > > +   pm_runtime_set_active(dev);
> > > > +   pm_runtime_enable(dev);
> > > > +
> > > > +   ret = mira220_identify_module(mira220);
> > >
> > > [Severity: Medium]
> > > Is it possible for the device to be concurrently suspended while probe
> > > continues?
> > >
> > > The device is marked active with a usage count of 0 after pm_runtime_enable().
> > > If the PM subsystem or userspace triggers a suspend (e.g. by setting
> > > autosuspend_delay_ms=0), the device could be powered down while probe executes
> > > mira220_identify_module().
> > >
> > > This could lead to I2C timeouts or bus crashes. Taking a pm_runtime reference
> > > hold could prevent this.
> > >
> >
> > By calling pm_runtime_get_noresume() (as the device is powered up
> > already) ?
> >
> >
> > > @@ -1985,5 +1985,5 @@ static int mira220_probe(struct i2c_client *client)
> > > [ ... ]
> > > > +error_power_off:
> > > > +   pm_runtime_disable(dev);
> > > > +   mira220_power_off(dev);
> > > > +   pm_runtime_set_suspended(dev);
> > > > +   return ret;
> > > > +}
> > >
> > > [Severity: Medium]
> > > Should this error path check the runtime PM state before unconditionally
> > > powering off the device?
> > >
> > > The PM core might have already suspended the device due to the zero usage count.
> > >
> > > Calling mira220_power_off() unconditionally could redundantly disable clocks
> > > and regulators that are already disabled, potentially causing double-disable
> > > warnings.
> > >
> >
> > Only in the case some suspend went on during probe. Even if unlikely,
> > guarding the call with
> >
> >         if (!pm_runtime_status_suspended(&client->dev))
> >                 mira220_power_off(&client->dev);
> >
> > costs nothing
> >
>
> For the above two issues it would be simpler to move the autosuspend just
> before you return from probe:
>
>     pm_runtime_set_active(dev)
>     pm_runtime_enable(dev)
>
>     ... rest of probe ..
>
>     pm_runtime_idle(dev)
>     pm_runtime_set_autosuspend_delay(dev, 1000);
>     pm_runtime_use_autosuspend(dev);
>
>     return 0;
>
> I saw this pattern in imx219/imx708 (sashiko was happy with this part in
>                                      the imx708 series I posted last week)
>

This is a good suggestion.

To be honest the comment

--------------------------------------------------------------------------------
@ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *client)
[ ... ]
> +     /* Enable runtime PM and turn off the device */
> +     pm_runtime_set_autosuspend_delay(dev, 1000);
> +     pm_runtime_use_autosuspend(dev);
> +     pm_runtime_set_active(dev);
> +     pm_runtime_enable(dev);
> +
> +     ret = mira220_identify_module(mira220);

[Severity: Medium]
Is it possible for the device to be concurrently suspended while probe
continues?

The device is marked active with a usage count of 0 after pm_runtime_enable().
If the PM subsystem or userspace triggers a suspend (e.g. by setting
autosuspend_delay_ms=0), the device could be powered down while probe executes
mira220_identify_module().
--------------------------------------------------------------------------------

Does mention "userspace triggering a suspend" (a system suspend?)
which seem to imply might happen concurrently to the driver probing
even if the device doesn't use autosuspend..

I feel like I should take your suggestion in and ignore the case of
system-suspend-while-probing ?


> Thanks,
>     Jai
