Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89446D55B
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650087; cv=none; b=IE4lHfCw/MwTDeRpZ3hOCbBgk7cf1SNBu/RJ8jv4Ao3KnGrjcdscYtJLL7MYzidzIxffISQ++TBs9dSQnyX95z7HjT4oJcQherb2hITCJBvgRfoZPbMfkkjCKYoxizSjMgUEMusG7wST3jwpVQEuuaTIVkR+J5jMkjqTGGxo1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650087; c=relaxed/simple;
	bh=gf01G/CzqfRS6nW14rB5w00KDU+E/yq/YOmp/STAjZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtzbbzOxEMh3FGaNwARqPorhlwZY6OtoTILd0uEy+bPSPn2CqtRnZljqHKtLUwPqsjK8JFnPXJO1iwUvHBnoqnByxdG4BhC3AkB3HFMEYOIW/LdHAqKgJ2T+pCjtKlBFmL7MVdy+kAEz0JU+ijT0lRhhy2WlpS7X/DjspMid5/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nc/C0WQj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nc/C0WQj"
Received: from ideasonboard.com (mob-5-90-63-152.net.vodafone.it [5.90.63.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EE0C6DF;
	Tue, 21 Jul 2026 18:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784650023;
	bh=gf01G/CzqfRS6nW14rB5w00KDU+E/yq/YOmp/STAjZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nc/C0WQjn2dNRiGxhTw4yX9/QqyWmHoet39HHUjP9KPuWLhjcKRfc6/a2qPpiEqfZ
	 YtfHxizoWw3PgBHFd5OURINDvuTeb3S0dgnflh18R9t8JnrZR3uGdF8kuQCBJes/qe
	 8YWECqVGCQKnB2E1Ffx70/OtNmFtg1gu8vhtUFxU=
Date: Tue, 21 Jul 2026 18:07:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, conor+dt@kernel.org, 
	robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, 
	Philippe Baetens <philippebaetens@gmail.com>, kieran bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220
Message-ID: <al-VH7diL1arQLU6@zed>
References: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
 <20260721-mira220-v5-2-533b0ad1065e@ideasonboard.com>
 <20260721143615.68F5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721143615.68F5B1F000E9@smtp.kernel.org>

Hi Sashiko

On Tue, Jul 21, 2026 at 02:36:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [High] Dereferencing `mira220->vblank` without checking for NULL in `mira220_init_controls()`.
> - [High] Missing `v4l2_subdev_cleanup()` in the driver's remove function causes an active state memory leak.
> - [Medium] The uninitialized stack variable `id` is evaluated and logged without checking if the I2C read succeeded.
> - [Medium] The active state format code is not updated when `V4L2_CID_HFLIP` or `V4L2_CID_VFLIP` are modified.
> - [Medium] Exposure control maximum limit exceeds the 16-bit hardware register width, leading to silent truncation.
> - [Medium] Hardware exposure register is not updated when `V4L2_CID_EXPOSURE` is clamped due to a `V4L2_CID_VBLANK` change.
> - [Medium] `mira220_power_on()` discards the actual error code when `clk_prepare_enable()` fails.
> - [Medium] Missing runtime PM reference hold during probe exposes the device to concurrent suspend.
> - [Medium] The error path in probe unconditionally powers off the device without checking its runtime PM state.
> - [Medium] V4L2_CID_HBLANK reports an incorrect static value when using a 1-lane MIPI CSI-2 configuration, breaking user-space framerate and exposure calculations.
> - [Low] Typo in user-facing control menu item: 'Vertial Gradient' instead of 'Vertical Gradient'.
> --

Thanks for your findings.

I'll go over them one by one

>
> --- Patch [2]: [PATCH v5 2/2] media: i2c: Add driver for AMSOSRMA Mira220 ---
> commit fbe78b3a27f19e95a842994664c11c10a075c4aa
> Author: Philippe Baetens <philippebaetens@gmail.com>
>
> media: i2c: Add driver for AMSOSRMA Mira220
>
> Add a V4L2 subdev driver for driver for the AMSOSRAM Mira220 image sensor.
>
> diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
> index 0000000000000..861f3230375c2
> --- /dev/null
> +++ b/drivers/media/i2c/mira220.c
> @@ -923,10 +923,10 @@ static const cci_reg_sequence mira220_init_reg_list[] = {
> [ ... ]
> > +static const char *const mira220_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"Vertial Gradient",
> > +};
>
> [Severity: Low]
> Is there a typo in the menu item name? It seems like it should be Vertical
> Gradient instead of Vertial Gradient.
>

Thanks, fixed

> @@ -1023,12 +1023,12 @@ static int mira220_power_on(struct device *dev)
> [ ... ]
> > +	ret = clk_prepare_enable(mira220->xclk);
> > +	if (ret) {
> > +		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
> > +		goto reg_off;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(mira220->reset_gpio, 0);
> > +
> > +	return 0;
> > +
> > +reg_off:
> > +	return regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
> > +}
>
> [Severity: Medium]
> Will this discard the actual error code when clk_prepare_enable() fails?
>
> The function returns the result of regulator_bulk_disable(), which typically
> returns 0 on success.
>
> This could cause the caller to falsely assume the device was successfully
> powered on, potentially leading to confusing I2C read failures later in the
> probe process.

Ack, I can call regulator_bulk_disable() ignoring its return value and
return the error code from clk_prepare_enable().

>
> @@ -1113,5 +1113,5 @@ static int mira220_write_stop_streaming_regs(struct mira220 *mira220)
> [ ... ]
> > +static u32 mira220_calc_exposure(struct mira220 *mira220, u32 height, u32 vblank)
> > +{
> > +	return (height + vblank) -
> > +	       (int)(MIRA220_GLOB_NUM_CLK_CYCLES / mira220->row_length);
> > +}
>
> [Severity: Medium]
> Could this calculation cause the exposure limit to exceed the 16-bit register
> capacity?
>
> With vblank up to 65535, max_exposure can reach roughly 66929. When the value
> is written to the hardware register:
>
> ret = cci_write(mira220->regmap, MIRA220_EXP_TIME_REG, exposure, NULL);
>
> it might be silently truncated to 16 bits (e.g., 66929 becomes 1393), resulting
> in an incorrectly brief exposure time.

Good finding! With a max vblank of 0xffff we can certainly overflow
the exposure register. I will cap the max exposure value to 0xffff

>
> @@ -1155,10 +1155,10 @@ static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> [ ... ]
> > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > +		int exposure_max, exposure_def;
> > +
> > +		/* Update max exposure while meeting expected vblanking */
> > +		exposure_max = mira220_calc_exposure(mira220, format->height,
> > +						     ctrl->val);
> > +		exposure_def = min(exposure_max, MIRA220_DEFAULT_EXPOSURE);
> > +		ret = __v4l2_ctrl_modify_range(mira220->exposure,
> > +					       mira220->exposure->minimum,
> > +					       exposure_max,
> > +					       mira220->exposure->step,
> > +					       exposure_def);
> > +		if (ret)
> > +			return ret;
> > +	}
>
> [Severity: Medium]
> If the current exposure exceeds the new maximum here, the framework clamps it,
> but does this code miss updating the hardware exposure register?
>
> Since exposure and vblank are not clustered, mira220_set_ctrl() is not
> triggered for exposure, and only the vblank hardware register is updated.
>
> This could leave the hardware exposure register out-of-sync with the clamped
> value.

Am I mistaken or __v4l2_ctrl_modify_range() calls set_ctrl() if
ctrl->val is updated ?

>
> @@ -1177,10 +1177,10 @@ static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
> [ ... ]
> > +	case V4L2_CID_HFLIP:
> > +		ret = cci_write(mira220->regmap, MIRA220_HFLIP_REG,
> > +				mira220->hflip->val, NULL);
> > +		break;
> > +	case V4L2_CID_VFLIP:
> > +		ret = cci_write(mira220->regmap, MIRA220_VFLIP_REG,
> > +				mira220->vflip->val, NULL);
> > +		break;
>
> [Severity: Medium]
> Should the active state format code be updated when the layout-modifying
> controls change the underlying format?
>
> Modifying these controls alters the Bayer format. Without updating the active
> state state->pads[0].format.code, subsequent calls to get the format could
> return the stale format code without the flip applied.
>

yes it should (note that here it should be done and it's harmless
because we grab the flip controls during streaming).

I have added

	/* Update the format code to adjust it to the new flip state. */
	if (ctrl->id == V4L2_CID_VFLIP || ctrl->id == V4L2_CID_HFLIP)
		format->code = mira220_get_format_code(mira220, format->code);

Before

	if (pm_runtime_get_if_in_use(&client->dev) <= 0)
		return 0;

And verified the format is updated when a flip is applied

$ v4l2-ctl -d /dev/v4l-subdev6 --get-subdev-fmt pad=0
ioctl: VIDIOC_SUBDEV_G_FMT (pad=0)
	Mediabus Code     : 0x3011 (MEDIA_BUS_FMT_SGRBG12_1X12)

$ v4l2-ctl -d /dev/v4l-subdev6 -c 'vertical_flip'=1

$ v4l2-ctl -d /dev/v4l-subdev6 --get-subdev-fmt pad=0
ioctl: VIDIOC_SUBDEV_G_FMT (pad=0)
	Mediabus Code     : 0x3008 (MEDIA_BUS_FMT_SBGGR12_1X12)


> @@ -1486,8 +1486,8 @@ static int mira220_identify_module(struct mira220 *mira220)
> [ ... ]
> > +	mira220_otp_read(mira220, 0x3a, 0, &id, &ret);
> > +	if (id < 1 || id > 2) {
> > +		dev_err(&client->dev,
> > +			"Read OTP 0x3a, id must be 1 or 2, but got: 0x%02x\n", id);
> > +		ret = -EINVAL;
> > +		goto err_power_off;
> > +	}
>
> [Severity: Medium]
> Does this evaluate the uninitialized id variable before validating the
> accumulated ret status?
>
> mira220_otp_read() is designed to skip execution if ret is already non-zero.
> If any previous OTP read failed, or if reading 0x3a itself fails, id is left
> uninitialized.
>
> This block could potentially log the uninitialized value before checking the
> error code in ret.

it can happen. I'll check for ret before accessing id.

>
> @@ -1837,12 +1837,12 @@ static int mira220_init_controls(struct mira220 *mira220)
> [ ... ]
> > +	hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
> > +				   MIRA220_HBLANK_1600x1400_304,
> > +				   MIRA220_HBLANK_1600x1400_304, 1,
> > +				   MIRA220_HBLANK_1600x1400_304);
>
> [Severity: Medium]
> Will this hardcoded hblank value report an incorrect static value when using a
> 1-lane MIPI CSI-2 configuration?
>
> It assumes a 2-lane layout where row_length is 304. If the device parses a
> 1-lane configuration, row_length doubles to 608, which would effectively
> double the line time, meaning hblank should be dynamically set to 4480.
>
> Because the control remains at 1440, user space might be misled into
> calculating a falsely high frame rate.
>

No, I don't think so.

doubling the row_length value programmed to the hardware maintains the
calculation stable with a single data lanes.

I've run some tests

$ cam -c2 -C100
18.330450 (8.46 fps) cam0-stream0 seq: 000041 bytesused: 1920000
18.448761 (8.45 fps) cam0-stream0 seq: 000042 bytesused: 1920000
18.567066 (8.45 fps) cam0-stream0 seq: 000043 bytesused: 1920000
18.685575 (8.44 fps) cam0-stream0 seq: 000044 bytesused: 1920000
18.803881 (8.45 fps) cam0-stream0 seq: 000045 bytesused: 1920000
18.922129 (8.46 fps) cam0-stream0 seq: 000046 bytesused: 1920000
19.040449 (8.45 fps) cam0-stream0 seq: 000047 bytesused: 1920000
19.158755 (8.45 fps) cam0-stream0 seq: 000048 bytesused: 1920000
19.277181 (8.44 fps) cam0-stream0 seq: 000049 bytesused: 1920000
19.395720 (8.44 fps) cam0-stream0 seq: 000050 bytesused: 1920000
19.513876 (8.46 fps) cam0-stream0 seq: 000051 bytesused: 1920000
19.632150 (8.45 fps) cam0-stream0 seq: 000052 bytesused: 1920000
19.750510 (8.45 fps) cam0-stream0 seq: 000053 bytesused: 1920000
19.869041 (8.44 fps) cam0-stream0 seq: 000054 bytesused: 1920000
19.987234 (8.46 fps) cam0-stream0 seq: 000055 bytesused: 1920000
20.105549 (8.45 fps) cam0-stream0 seq: 000056 bytesused: 1920000
20.223992 (8.44 fps) cam0-stream0 seq: 000057 bytesused: 1920000
20.342276 (8.45 fps) cam0-stream0 seq: 000058 bytesused: 1920000
20.460710 (8.44 fps) cam0-stream0 seq: 000059 bytesused: 1920000

The detected frame rate is ~8.45

Using the values reported in controls for calculating the frame rate

 v4l2-ctl -d /dev/v4l-subdev6 -l
            vertical_blanking 0x009e0901 (int)    : min=17 max=65535 step=1 default=17 value=13569 flags=0x00001000
            horizontal_blanking 0x009e0902 (int)    : min=1440 max=1440 step=1 default=1440 value=1440 flags=read-only, 0x00001000
            pixel_rate 0x009f0902 (int64)  : min=384000000 max=384000000 step=1 default=384000000 value=384000000 flags=read-only, 0x00001000

I get

        pixel_rate = 384000000
        llp = 1600 + 1440 = 3040
        fll = 1400 + 13569 = 14969
        384000000 / (3040 * 14969) = 8.438492182

Which matches the measured value

> > +	if (hblank)
> > +		hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	/* Max exposure is determined by vblank + vsize and Tglob. */
> > +	max_exposure = mira220_calc_exposure(mira220,
> > +					     MIRA220_PIXEL_ARRAY_HEIGHT,
> > +					     mira220->vblank->val);
>
> [Severity: High]
> Can mira220->vblank be NULL here?
>
> The v4l2_ctrl_new_std() call above could fail and return NULL if memory
> allocation fails.
>
> Dereferencing mira220->vblank->val immediately without verifying if the
> creation succeeded could cause a kernel panic during device probe.
>

I feel like this really is a corner case ?
I can bail out on !vblank though

> @@ -1936,6 +1936,6 @@ static int mira220_probe(struct i2c_client *client)
> [ ... ]
> > +	/* Enable runtime PM and turn off the device */
> > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> > +	pm_runtime_use_autosuspend(dev);
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +
> > +	ret = mira220_identify_module(mira220);
>
> [Severity: Medium]
> Is it possible for the device to be concurrently suspended while probe
> continues?
>
> The device is marked active with a usage count of 0 after pm_runtime_enable().
> If the PM subsystem or userspace triggers a suspend (e.g. by setting
> autosuspend_delay_ms=0), the device could be powered down while probe executes
> mira220_identify_module().
>
> This could lead to I2C timeouts or bus crashes. Taking a pm_runtime reference
> hold could prevent this.
>

By calling pm_runtime_get_noresume() (as the device is powered up
already) ?


> @@ -1985,5 +1985,5 @@ static int mira220_probe(struct i2c_client *client)
> [ ... ]
> > +error_power_off:
> > +	pm_runtime_disable(dev);
> > +	mira220_power_off(dev);
> > +	pm_runtime_set_suspended(dev);
> > +	return ret;
> > +}
>
> [Severity: Medium]
> Should this error path check the runtime PM state before unconditionally
> powering off the device?
>
> The PM core might have already suspended the device due to the zero usage count.
>
> Calling mira220_power_off() unconditionally could redundantly disable clocks
> and regulators that are already disabled, potentially causing double-disable
> warnings.
>

Only in the case some suspend went on during probe. Even if unlikely,
guarding the call with

	if (!pm_runtime_status_suspended(&client->dev))
		mira220_power_off(&client->dev);

costs nothing

> @@ -1992,7 +1992,7 @@ static void mira220_remove(struct i2c_client *client)
> [ ... ]
> > +static void mira220_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct mira220 *mira220 = to_mira220(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	media_entity_cleanup(&sd->entity);
> > +
> > +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
>
> [Severity: High]
> Does this unbind path miss a call to v4l2_subdev_cleanup()?
>
> The driver initializes the subdev active state via v4l2_subdev_init_finalize()
> during probe, but fails to clean it up in mira220_remove().
>
> This could permanently leak the memory allocated for the active state and pads
> every time the driver is unbound.

Ack, I should call v4l2_subdev_cleanup()

Thanks
  j
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com?part=2
