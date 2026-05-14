Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C8248867
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766520; cv=pass; b=ZjieP+kfo+awxGYkFTWwGb2e/5gc44msfb3JU7yO5MrooxiRxekm9I5i2gJ5MDdMAXyjNooL1pDCCJKQH3klM8aeQ1bDh55ozPXTwTeQxRTgOOMhcFNNq/tTsIKZnBFxJYyMN9oJuB12TcUdX3aGIVJmcsCkGCCxJ7TGxZwD4nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766520; c=relaxed/simple;
	bh=aKCJjxQ7V3dO6eK1gNWZ6oqy7EqfvCbd5MBzRRyNsM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGy8wrfu/Bm+h6E09g4MgkQ9iL7eoY+kS48Lyjyri+v3e/kriiEHhpKyWR3wRHsudRxZlPz1sNsTsZG634dK8Qkh4p/rCVov3ILFDe5q8vsfnVBp17ifuZk/vkVJ97/LhIwG+yW5NQFzRjs0BYABA9N/npSaYt7TyM+8tIOA2eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4n4dz/G; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4n4dz/G"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso71825076d6.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 06:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778766518; cv=none;
        d=google.com; s=arc-20240605;
        b=OZUvV76vwIHlnymqxKrEkQhOFkXnIat2/vJCZu/AnESQs+CGMsN4T+udV5CpliqRFt
         GA6FMqf/N00RAnN46iXzXCHVPsflE4SrgSXFPedrZHib7+q3eFlS8Pe+EGfIv68ZoTs9
         kJlIkfgdF0ciPMqK1CbgzpqDOjyWx6iuEsskNjBHxWDHMkPhyMXOBPW/fnx+VkvkBwBv
         8gvQeh/qSCR4dZAD2ddvsoxKt5dY2rvzAW8yI1na8J4Vj4ZRhLP1bdudY4EYcUL4cf7n
         9VZhpdU8+la835iPHRKBIamjaZgOy5SixYls2CnwCSD9p63eAtwQSvwi0LZQBRFfsLJv
         0N2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7V+svfvmPORbGEpy9kH2oGvJhOmw0DtV4AhxNSn0F8=;
        fh=2xfOhBJyN5MrDXDnqEqgkqZlEOPXo6XBQo6m99gnAL4=;
        b=jubSRRHxo24bzQCIsi9X/aotvdizIvagTQyqgOKOA8psqhW4xDVgDxPZ/Vs6F+rigA
         gl1lNzGOGDkALJBG+LHlqxGV/TvM9elqMEXxQWHX5pMuJWqlBsqHPswaF9mjs/D5xhns
         a+YJnt70BnhbC4fZ8Rs3iiTqM5d41LZb9rZ2UTkYJYlSd5Id7rqKzgCt9c1TyKjKey+Y
         GYhthxDXd6QbPuKQxW4wuZSZZm8CQUjOTfkFr668YXz7Fbnb1VRbPrWqlwo/H27y4WxO
         vNhb3cYkQegzyyILIDv9UL9gopE1aKwcBCMy/v6BwulFppjwQcInR6lZdMh3acqNMKKT
         6eUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778766518; x=1779371318; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7V+svfvmPORbGEpy9kH2oGvJhOmw0DtV4AhxNSn0F8=;
        b=N4n4dz/GKUFrEycc9dpZ9VIsS6gaNksuDbdtqH3l23cledBY7eo+7m8NmVLaA8VXi5
         Mk9XjgrSHitJUVhSH2oSwOVMX0vl3EoYLHRTKfS6OryuLy3emjzlZASkNXJ0W0zqVtMD
         HabJNeXLkfP+8MwUAIzaEq7CK0RXs0PMwrT9TQ6/n3mNiLd837+flnmnR/C/akblDObb
         9CdCyp950SZ6No9J/aAFeXGh29NG/2qYC/4nxcYBT1sUrLLMggsBdVP4w8NcLfjkA6Up
         NnmM+cQvD8lcFvdiinWKD15+WwllX4CQG6/5lU3Y9n/Rh5AmcHnH8l+cbYtvXTuljQ39
         TfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766518; x=1779371318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P7V+svfvmPORbGEpy9kH2oGvJhOmw0DtV4AhxNSn0F8=;
        b=BEze8wzWX9ANt/+f/KegVfs+v3VNySiy/tOK297N8FjfIBm3QQQVCuh+SbWXMwgnuA
         Oa7Z5uLWE4o+eWiOdwTfvqDgnOwwHUEk12JmsEk2xGhaZi29B9Vv+rxLIB/qqEs+VAf1
         v7eTwMKYqQwbQbdr9+DsKJUmYzXQx357HMQWfKjs9LB9ollFSy7kHNTLytVKEeYyvlfp
         PBf+QdIqC6xnEX8OWR5JI33qOCXpXiGxVGueEXAZVWnFity/0nNPt9AsXA1j+HUa/+dB
         Fn+ToLGaaU9USl3GdqOQTdI5oXLL8eCjiOXRmQ+YqaToNBK0cs2YXowTvmpVSBNs3chR
         4FXQ==
X-Gm-Message-State: AOJu0YxHGwAvof7T6XfkjkM0v1kARVnawWu20RoPAuAsRhNC27ziuISD
	Gln7T1odHrRiDu2Tb1EnP5xV1+6jBZjI4c9voQK26HGKGnBJdaIrlgjCRAL8Z3IrSOyQ6zhDTqI
	voIMsWvP+LRlbWvQjHdSTIvahlEyYWJ4A1g==
X-Gm-Gg: Acq92OEDBmP9vmpdECIQdibIDU1tMwH4610TNrEMA7D7tWTyrJbWmChSt7ftAmkIQWM
	Zv2eGw3kO2kQgxFszQRcjZGAIEfE9gGIF20vWmjdavx+nqYintHxH+3oS6UNeaEX9mlEZhNdIbV
	ihaGqtdy2S1c0S0C0/SZ1f884L9dJw7LwH55JjGlAbUEYpi6ndY48WeKyUu1W20QHbEZk6vkp+n
	bVF0aXL88L+I6Ivb8Lc+bBbopDCOWUIGxzymMOBLTugI95t1iSCurp/+81sAJaaZ2yrb0uHcyPZ
	jUV2pd7h
X-Received: by 2002:a05:6214:4a87:b0:8ca:e16:9654 with SMTP id
 6a1803df08f44-8ca0e169b66mr10237246d6.51.1778766517852; Thu, 14 May 2026
 06:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513231445.3213501-3-derekjohn.clark@gmail.com> <20260514122200.E52C4C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514122200.E52C4C2BCB3@smtp.kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 14 May 2026 06:48:26 -0700
X-Gm-Features: AVHnY4KSZC4VkJHQRXm-_XFmPM9aMSk8J4vuVM8tNCzABESdwXLpTFZ87pMFfAw
Message-ID: <CAFqHKTm0G_HznwTmcOCEumihzXzgSbAj7u8Xm_5GWKUB1g1fKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] HID: hid-msi: Add M-key mapping attributes
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 5:22=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] The `cfg_mutex` guard in `claw_hw_output_report()` is scoped to =
an `if` block, releasing the lock before the critical section executes.
> - [High] Lockless concurrent access to `profile_pending` between process =
and interrupt contexts causes data corruption and sequence mismatches on de=
layed responses.
> - [High] Unsafe assumption of USB transport in `claw_probe()` causes type=
 confusion and invalid pointer dereference for non-USB devices.
> - [High] Returning an error from `claw_profile_event()` for a spurious ev=
ent unconditionally triggers `complete()`, causing premature wakeups of unr=
elated commands.
> - [Medium] The function `claw_buttons_store()` illegally mixes scope-base=
d `guard()` cleanup with `goto`-based error handling.
> --
>
> commit 42be71c046dc9b6b31d28598f5e0bb568d78b7a1
> Author: Derek J. Clark <derekjohn.clark@gmail.com>
>
> HID: hid-msi: Add M-key mapping attributes
>
> Adds attributes that allow for remapping the M-keys with up to 5 values
> when in macro mode.
>
> > diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
> > index 8915942af15e6..13ba2747fdb66 100644
> > --- a/drivers/hid/hid-msi.c
> > +++ b/drivers/hid/hid-msi.c
>
> [ ... ]
>
> > @@ -125,6 +294,31 @@ static int claw_gamepad_mode_event(struct claw_drv=
data *drvdata,
> >       return 0;
> >  }
> >
> > +static int claw_profile_event(struct claw_drvdata *drvdata, struct cla=
w_command_report *cmd_rep)
> > +{
> > +     u8 *codes;
> > +     int i;
> > +
> > +     switch (drvdata->profile_pending) {
> > +     case CLAW_M1_PENDING:
> > +     case CLAW_M2_PENDING:
> > +             codes =3D (drvdata->profile_pending =3D=3D CLAW_M1_PENDIN=
G) ?
> > +                     drvdata->m1_codes : drvdata->m2_codes;
> > +             /* Extract key codes; replace disabled (0xff) with 0x00, =
which is (null) in _show */
> > +             for (i =3D 0; i < CLAW_KEYS_MAX; i++)
> > +                     codes[i] =3D (cmd_rep->data[6 + i] !=3D 0xff) ? c=
md_rep->data[6 + i] : 0x00;
> > +             break;
>
> Is it safe to read and modify profile_pending locklessly here in the
> interrupt handler?
>
> Since claw_buttons_show() modifies this state in process context under
> profile_mutex, if a sysfs request times out and a subsequent request star=
ts,
> could the delayed ACK from the first request cause this handler to see th=
e
> new profile_pending state and corrupt the new request's buffer?

The lock covers this case as it is only released after the completion
fires or time out, after this.

> > +     default:
> > +             dev_warn(&drvdata->hdev->dev,
> > +                      "Got profile event without changes pending from =
command: %x\n",
> > +                      cmd_rep->cmd);
> > +             return -EINVAL;
> > +     }
> > +     drvdata->profile_pending =3D CLAW_NO_PENDING;
> > +
> > +     return 0;
> > +}
> > +
> >  static int claw_raw_event(struct claw_drvdata *drvdata, struct hid_rep=
ort *report,
> >                         u8 *data, int size)
> >  {
>
> [ ... ]
>
> > @@ -146,6 +340,9 @@ static int claw_raw_event(struct claw_drvdata *drvd=
ata, struct hid_report *repor
> >       case CLAW_COMMAND_TYPE_GAMEPAD_MODE_ACK:
> >               ret =3D claw_gamepad_mode_event(drvdata, cmd_rep);
> >               break;
> > +     case CLAW_COMMAND_TYPE_READ_PROFILE_ACK:
> > +             ret =3D claw_profile_event(drvdata, cmd_rep);
> > +             break;
> >       case CLAW_COMMAND_TYPE_ACK:
> >               break;
> >       default:
>
> When claw_profile_event() returns -EINVAL for a spurious event,
> claw_raw_event() breaks from the switch and unconditionally calls
> complete(&drvdata->send_cmd_complete).
That case is unlikely as the profile events are serialized by a mutex.
Holding the completion until timeout would only result in delaying
subsequent calls.

> Could this prematurely wake up a thread waiting on a completely different
> command, such as WRITE_PROFILE_DATA?
>
> [ ... ]
>
> > @@ -366,6 +563,161 @@ static ssize_t reset_store(struct device *dev, st=
ruct device_attribute *attr,
> >  }
> >  static DEVICE_ATTR_WO(reset);
> >
> > +static int button_mapping_name_to_code(const char *name)
> > +{
>
> [ ... ]
>
> > +static int claw_buttons_store(struct device *dev, const char *buf, u8 =
mkey_idx)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct claw_drvdata *drvdata =3D hid_get_drvdata(hdev);
> > +     u8 data[] =3D { 0x01, (drvdata->bmap_addr[mkey_idx] >> 8) & 0xff,
> > +                   drvdata->bmap_addr[mkey_idx] & 0xff, 0x07,
> > +                   0x04, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff };
> > +     size_t len =3D ARRAY_SIZE(data);
> > +     int ret, key_count, i;
> > +     char **raw_keys;
> > +
> > +     raw_keys =3D argv_split(GFP_KERNEL, buf, &key_count);
> > +     if (!raw_keys)
> > +             return -ENOMEM;
> > +
> > +     guard(mutex)(&drvdata->rom_mutex); /* all err_free paths must be =
in scope */
> > +     if (key_count > CLAW_KEYS_MAX) {
> > +             ret =3D -EINVAL;
> > +             goto err_free;
> > +     }
> > +
> > +     if (key_count =3D=3D 0)
> > +             goto set_buttons;
> > +
> > +     for (i =3D 0; i < key_count; i++) {
> > +             ret =3D button_mapping_name_to_code(raw_keys[i]);
> > +             if (ret < 0)
> > +                     goto err_free;
> > +
> > +             data[6 + i] =3D ret;
> > +     }
> > +
> > +set_buttons:
> > +     ret =3D claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_WRITE_PROFI=
LE_DATA, data, len, 8);
>
> While reviewing the addition of these sysfs attributes, I noticed a
> pre-existing issue in claw_hw_output_report() that is exacerbated by
> the concurrent sysfs requests added here:
>
> drivers/hid/hid-msi.c:claw_hw_output_report() {
>     ...
>     if (timeout) {
>         guard(mutex)(&drvdata->cfg_mutex);
>         reinit_completion(&drvdata->send_cmd_complete);
>     }
>     ...
> }
>
> Since guard() is scoped to the if block, the mutex is immediately release=
d at
> the closing brace.
>
> Doesn't this mean hid_hw_output_report() and
> wait_for_completion_interruptible_timeout() execute entirely without
> the lock, defeating the intended serialization and allowing concurrent
> requests to race?
>
> > +     if (ret < 0)
> > +             goto err_free;
> > +
> > +     ret =3D claw_hw_output_report(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM=
, NULL, 0, 8);
> > +
> > +err_free:
> > +     argv_free(raw_keys);
> > +     return ret;
> > +}
>
> Is it safe to mix goto-based error handling with scope-based guard() clea=
nup
> in the same function?

I'll make this a scoped guard over claw_hw_output_report.

> According to the cleanup guidelines, functions should either convert
> entirely to scope-based cleanup, for example by using a DEFINE_FREE
> wrapper for argv_free, or not use guard() at all to avoid confusing
> ownership semantics.
>
> [ ... ]
>
> > @@ -432,8 +796,31 @@ static void cfg_resume_fn(struct work_struct *work=
)
> >               dev_err(&drvdata->hdev->dev, "Failed to set gamepad mode =
settings: %d\n", ret);
> >  }
> >
> > +static void claw_features_supported(struct claw_drvdata *drvdata)
> > +{
>
> [ ... ]
>
> >  static int claw_probe(struct hid_device *hdev, u8 ep)
> >  {
> > +     struct usb_interface *intf =3D to_usb_interface(hdev->dev.parent)=
;
> > +     struct usb_device *udev =3D interface_to_usbdev(intf);
>
> Is it guaranteed that this device is always connected via USB?

This function is only called by msi_probe, which checks for a valid
USB device as a first step.

> If this driver is bound to a device connected over a non-USB transport li=
ke
> I2C, Bluetooth, or UHID, hdev->dev.parent would not be a valid USB
> interface, which could cause an invalid pointer dereference here.
>
> Could this code check hid_is_usb(hdev) first or read the version from
> hdev->version instead?
>
> >       struct claw_drvdata *drvdata;
> >       int ret;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513231445.32=
13501-1-derekjohn.clark@gmail.com?part=3D2
