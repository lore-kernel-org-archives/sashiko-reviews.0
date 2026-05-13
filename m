Received: from out198-19.us.a.mail.aliyun.com (out198-19.us.a.mail.aliyun.com [47.90.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA0B3D5C05
	for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656742; cv=none; b=Y5wEUol1slJ3fN2eZ4v7wvGemrUi2JLhUk6lpkx/g//R77CMvuX48XDqW9YXdOE5mZJUk78ERz4PRlisq7MFI2O5zHUgcyQoOYOyTgt8vYkszdcRr2VcFPEjv2w0ALPHErXhZOgwIU7cW8FjLVXE7C/GiAYbwD/WBFIJYqLM0nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656742; c=relaxed/simple;
	bh=QsHEW1JdmqmkfyZTfonQtwjYZe6c5LBxUYVFUTAcOPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GI6sxjO3I9Ghc0uL83daIR7zFE/oM98y2z3Yvsme8F8g8Xx5QTbcBg1zazG72eyHb8zo0udb70D9XtiK5zcSi+FfW1IKzNME+2uypc9A/D8MYIZRg1/wslvmg64LARY5b0feg4j7DctsF2qs3feyZKr6nRAufOtbTiN8GBdfc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com; spf=pass smtp.mailfrom=lontium.com; dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b=OcdFzYAI; arc=none smtp.client-ip=47.90.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lontium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lontium.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lontium.com header.i=@lontium.com header.b="OcdFzYAI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lontium.com; s=default;
	t=1778656723; h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	bh=DUWgtEeLjpo1vNh2+QkOBk1kPDLJmhxUmkhc8h/nZJM=;
	b=OcdFzYAIyLRztr69xDessmSGbqRFwkqEPOnwodMtiRok8xIeG6KpZx++/aOCTt+dKd+rRechjQwRjP/bQpcH9HlSwCAy2Mkv1aBBlk113h6UHTwKrKibPq0J/CMxHHbGaMZueJTJkeAr/N5eBq14CrKdvz1K1fn4bzc3ZP98uKowxeUnnSbDLG4U7O2/1ipUQa6SpAhMFT/W0iYZb+MKMjfXsHwAPIhZlBSOduKgZ5ZnpYKXpUit/28lyWmKcXWXRJtRRKXgbTHEo1ulCtlZ4fks25Shhkp+Fr4tC4tmMA4wllUoGPIlb3Ecq13MxwnwrsIahnXyVQQygrrnAcyfAw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436764|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.320713-0.0274654-0.651822;FP=4490223146391758010|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037021130;MF=syyang@lontium.com;NM=1;PH=DS;RN=1;RT=1;SR=0;TI=SMTPD_---.hW1cxtq_1778656720;
Received: from mail-oo1-f47.google.com(mailfrom:syyang@lontium.com fp:SMTPD_---.hW1cxtq_1778656720 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 13 May 2026 15:18:41 +0800
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-694932346a1so2334502eaf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 00:18:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YyRsPO88Ou2AS3QrafOh0CDieADoCchAjehu1SBylotcfsETJBA
	gFlpfNOAkucQ78VEyAGWSGobUb5+FoZ+8y7b0Ty0jBIMZd12/+92VtTCpZ31q7O+6jje7GaMxy2
	bau2Anlu7Z+EV8o/frGznZZCotJN/I7w=
X-Received: by 2002:a05:6820:1b0c:b0:696:1bde:cd8f with SMTP id
 006d021491bc7-69b78e45ce0mr1226841eaf.53.1778656719922; Wed, 13 May 2026
 00:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512064013.40066-3-syyang@lontium.com> <20260513060452.F227DC2BCB7@smtp.kernel.org>
In-Reply-To: <20260513060452.F227DC2BCB7@smtp.kernel.org>
From: Sunyun Yang <syyang@lontium.com>
Date: Wed, 13 May 2026 15:18:27 +0800
X-Gmail-Original-Message-ID: <CAFQXuNbsGTkx9a6mw9bVYwn9WnZi3N=zT7tUDZ+NF5RYk_KEbw@mail.gmail.com>
X-Gm-Features: AVHnY4JoYhVY-9EthCMWPYiHC0PojkQOT1cXob0mNhrxpZakFrJ4sxsbubOWX2A
Message-ID: <CAFQXuNbsGTkx9a6mw9bVYwn9WnZi3N=zT7tUDZ+NF5RYk_KEbw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B45=E6=9C=8813=E6=97=A5=E5=91=
=A8=E4=B8=89 14:04=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [Critical] Firmware upgrade via sysfs races with DRM atomic modeset cal=
lbacks, risking hardware bricking.
      it will be fixed in next version.

> - [High] Hardware reset in `remove` callback races with DRM bridge teardo=
wn.
       we will remove set reset gpio in `remove`.  the chip has
hardware protection, no need to consider backpowering.

> - [Medium] Undefined behavior in CRC validation due to integer promotion.
      it will be fixed in next version.

> - [Medium] Incomplete display configuration and missing MIPI DSI host reg=
istration.
        it will be fixed in next version.

> - [Medium] Unbalanced reset pin state on probe failure creates backpoweri=
ng risk.
      the chip has hardware protection, no need to consider backpowering.

> - [Medium] Ignored return values for critical I2C writes during firmware =
upgrades.
       it will be fixed in next version.

> - [Low] `dev_err_probe()` used outside of `probe` context.
      it will be fixed in next version.
> --
>
> commit 0bae053b4ef87003ffe3f7c844f0ddb1092f16bf
> Author: Sunyun Yang <syyang@lontium.com>
> Date:   Tue May 12 06:40:13 2026 +0000
>
>     drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge
>
>     This commit adds support for the Lontium LT7911EXC eDP to MIPI DSI
>     bridge. It implements I2C-based setup, display configuration, and
>     provides a firmware update mechanism.
>
> The commit message states:
> > It implements I2C-based setup, display configuration, and
> > provides a firmware update mechanism.
>
> Is this description completely accurate? Looking at the drm_bridge_funcs
> implementation, there are no atomic_enable/disable functions configuring
> the display. Additionally, as an eDP to MIPI DSI bridge, should it also
> register a mipi_dsi_host so downstream panels can attach?
>
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/d=
rm/bridge/lontium-lt7911exc.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> [ ... ]
> > +static void lt7911exc_block_erase(struct lt7911exc *lt7911exc)
> > +{
> [ ... ]
> > +     regmap_multi_reg_write(lt7911exc->regmap, seq_write, ARRAY_SIZE(s=
eq_write));
> > +
> > +     msleep(200);
> > +     dev_dbg(dev, "erase flash done.\n");
> > +}
>
> Could this silently fail to erase the flash? If regmap_multi_reg_write()
> fails due to hardware communication errors, the driver will continue and
> attempt to write new firmware data to an unerased flash segment. Should
> the return value be checked here and in lt7911exc_prog_init()?
>
> [ ... ]
> > +static int lt7911exc_upgrade_result(struct lt7911exc *lt7911exc, u32 c=
rc32)
> > +{
> [ ... ]
> > +     read_hw_crc =3D crc_tmp[0] << 24 | crc_tmp[1] << 16 |
> > +                             crc_tmp[2] << 8 | crc_tmp[3];
>
> Can this cause a signed integer overflow? In C, u8 values are implicitly
> promoted to signed 32-bit integers before shifting. If crc_tmp[0] is 128
> or greater, shifting left by 24 bits will shift into the sign bit. Would
> explicitly casting to u32 prevent this?
>
> [ ... ]
> > +static int lt7911exc_firmware_upgrade(struct lt7911exc *lt7911exc)
> > +{
> [ ... ]
> > +     /*1. load firmware*/
> > +     ret =3D request_firmware(&fw, FW_FILE, dev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to load '%s'\n", F=
W_FILE);
>
> Is it safe to use dev_err_probe() outside of a probe context? This functi=
on
> is called exclusively from the sysfs store callback. Calling dev_err_prob=
e()
> here might interfere with deferred probe tracking.
>
> [ ... ]
> > +static void lt7911exc_atomic_pre_enable(struct drm_bridge *bridge, str=
uct drm_atomic_state *state)
> > +{
> > +     struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> > +
> > +     lt7911exc_reset(lt7911exc);
> > +}
>
> [ ... ]
>
> > +static ssize_t lt7911exc_firmware_store(struct device *dev, struct dev=
ice_attribute *attr,
> > +                                     const char *buf, size_t len)
> > +{
> [ ... ]
> > +     lt7911exc_lock(lt7911exc);
> > +
> > +     ret =3D lt7911exc_firmware_upgrade(lt7911exc);
>
> Can a DRM atomic modeset race with a firmware upgrade here?
>
> The sysfs attribute protects internal I2C sequences with ocm_lock, but th=
e
> DRM bridge callbacks toggle the reset_gpio without acquiring this lock.
>
> If a display modeset occurs concurrently with a firmware flash, could the
> hardware reset pin be toggled mid-flash and corrupt the firmware?
>
> [ ... ]
> > +static int lt7911exc_probe(struct i2c_client *client)
> > +{
> [ ... ]
> > +     lt7911exc_reset(lt7911exc);
> > +
> > +     lt7911exc_lock(lt7911exc);
> > +
> > +     lt7911exc->fw_version =3D lt7911exc_read_version(lt7911exc);
> > +
> > +     lt7911exc_unlock(lt7911exc);
> > +     if (lt7911exc->fw_version < 0)
> > +             return dev_err_probe(dev, lt7911exc->fw_version, "failed =
read version of chip\n");
>
> If lt7911exc_read_version() fails, does this leave the reset pin in an
> unbalanced state?
>
> The lt7911exc_reset() call leaves the reset_gpio low, and as noted in the
> remove function, it should be pulled high to prevent backpowering. Should
> the error path assert the reset pin high?
>
> [ ... ]
> > +     return devm_drm_bridge_add(dev, &lt7911exc->bridge);
> > +}
> > +
> > +static void lt7911exc_remove(struct i2c_client *client)
> > +{
> > +     struct lt7911exc *lt7911exc =3D i2c_get_clientdata(client);
> > +
> > +     /* pull reset low to prevent backpowering*/
> > +     gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> > +}
>
> Does this teardown sequence race with DRM operations?
>
> Because the bridge is registered with devm_drm_bridge_add(), it will be
> unregistered during the devres cleanup phase, which happens after the
> driver's remove callback has finished.
>
> Since lt7911exc_remove() asserts the reset pin to shut down the hardware,
> could concurrent DRM operations attempt to access the disabled hardware
> while it is still registered?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512064013.40=
066-1-syyang@lontium.com?part=3D2
