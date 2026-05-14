Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1E40DFBE
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766885; cv=pass; b=W70RNJbei87E1uFWCA3SkrSAsbIwY9G/B0PJ9bHVqhBEa0fBneMuF25wnBnxR7fi5RLMrKYb5xXDGTjmvbSHeGWH2jXTMh5FaPPidOYC8O8d2/dJU5X/Q8P2mZ3yn0cvqazozKMD/Kzmh6A2JAylgnpEa9ca+vQaYamEDcttXh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766885; c=relaxed/simple;
	bh=ZEzprdMfJ7nMk4D7he84mrRA4QUGO6FIF+ftWRayMp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlK9l8CcrXSt0Gc5U8/B9+FCiFKhcUv3edYj+cExmQMTTb/GYLqnee6j9wYFkcHi5TTGpBG+vKfJXM7naLxKYYWNV/FsBUBQOUyYEVlE5sCDZizOjoqM7iDHNTOE1FwL+O4dGjglS0cJKgNp6CO47LmrHxKMv2iUwuB2mGK+hZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOmZ5V7/; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOmZ5V7/"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b98482b253so106703086d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 06:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778766880; cv=none;
        d=google.com; s=arc-20240605;
        b=b1QhbFzayyqXJrY+yFqezHSEoukuE8EcQ7uGTQd6yvOFm7N31YVJ/bJ2/zlf1xpYva
         /xfvr5HZZKp+sDK1FhMyXbvlTrUFx/FFxaxTeq7yFYp9TiU/nhRVY3tpzynE5SwN6oYD
         sEXjYLxx7rPONnSmhKclKlbvYY5t9omfigIlWHi5Sf+ANzkO9q3INuO8hzX4aShKBXm7
         PYEQGilqvS2Sn72KE2Pho405UyD57qUlwAf37GL7sGSFzP3/iXWY+DQ2tDvDYw7C1LZT
         wvk/nL7YrlTStytUFBI4baJMxyifVscO36dUQ+5TUtcj0vD1hEXYZJwLOx35GgMbid7/
         Fp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUf5ENwrvYCD59sribRgmCCruN7lvNNZBafmSJJQq2k=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=lDRRjj99CEadJJvxvZMxMSg5tkHiUnn05ZocgmiAGuYO0LidV871CNKoNCby8eH98k
         IEZ7/LJnPVeNbkwYvQIKisslRViwVhEMJTDegJkBx+B5EMFld5nL8y1XZaUoudJuZnwW
         g1VP3LEJWRQF2EkHltkIDD6jI9uFx89MHWVF/vMhxFAUnjJ6veWCOTs6hkoah02uAqTk
         rH6fWnXuqB1D7nQPj82GhVyVgQERgWcVlXLj1LlRDsp/p882HPuRNOHds2KoOqHY3wmT
         6bKrOeefeoNRIpABLLf8wTAf6B31urjSypLAa2LhiiBtzKpoFDCkFGS3T4AGIvFW134U
         3k1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778766880; x=1779371680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUf5ENwrvYCD59sribRgmCCruN7lvNNZBafmSJJQq2k=;
        b=NOmZ5V7/fqTcvQVvQYEJfHMVSdR7OoPKYDMLKsgp2o7GVTYFnSbUoaN0ULnrWtQ1ZF
         1eCIKPYRvQoNsi8N3DacqJ4KIssbO1SmeMRwSaBuMiBn/m5bGjg9sKTtkqXDuo+5esDH
         v8nDJ3bx7/+/IYsuk2Psa9P6YIjkiIaeNDk/rao39e7CZZp2kymOS5CgaT6dqk7rGpnY
         iPjMrsk9OkJbb3jRsGYyblmyfW4hLmK6pcRcB/yhVO9DcGKHWwCkoJ9FB6xsaUtJVPVl
         wC9N378Zna2NSxSxNUIg20RHq91S1/e+Xk9w4GJUudxO3gTLNB/BpjeSjgwBC2XGGhyN
         No0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766880; x=1779371680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jUf5ENwrvYCD59sribRgmCCruN7lvNNZBafmSJJQq2k=;
        b=hliw5hWHD2qwwMPL0szzr7f6qKXgqIuot3NLLMO7kjdPjQBtOfzm3tqVEiecC08pOE
         YUNEiCGE/1kdIQTedpNQxJjiO4tULwVe4g8RYJnMLy14EKO2TB00G68RdvLVTVUHUTuW
         oTEe47BrtNnXyaUGZk8kCe6QAijczVKNX4CL/v29OU221XeXM0XoutBTjrBNL4i2m20e
         P1bWs/tsP5DRu7exum2npweuuuFSowaI8U2SuohWQA1IPfGcNV/bNC5CtdjVXqPPV2Z5
         vA0xNn/RCAuJ87e6248SLIpuBENGOv/yBoTEtEn8nCvmUt26DPgnsCLIVbB0dxXGvCex
         uQGg==
X-Gm-Message-State: AOJu0Yw7VL/LbhWkNpzWwKWbtQ6rYq3IJuyUzIFae0/DRZDQGqBpVX4J
	2yo8/lVFBFRq8m6EjLklXnrSjzVqUwKt1DR/Jhd8tj7qvIlU6R4TvwdtpwJv0y7N4qjuZufipR3
	Mq+Z2zM6QGSF6tElkACUBXRyEF7xaHjF8Sg==
X-Gm-Gg: Acq92OHKUDJ9sVcHQ4ZJ4KhlCj3RPU8XkvMf7KOnY/70C+P1nLYiUluIH6xtuQ1NgJ0
	8phZgNSGk4ubYpgX7S8rW2fEK6KcnjbIOahVevQllmJR52lS8oybFxk1dk36sywZKsjwfQnBAHp
	b8Y4sJUgMsugrgj5e1P3HlK0w7g0OivxggTP4fLDAG60i8dZahoH0cRlSGZz8m+JQCTwVPSLV2v
	V7wmwkhs75q/ZNfuCM+a9ys1lA7djW5ZL5aTY3+qgRCqMzFOXnRuzdfjriHELJxIpnln7bGxOAg
	LdJomczW
X-Received: by 2002:a05:6214:5294:b0:8bd:de6d:c340 with SMTP id
 6a1803df08f44-8c7bb4b1cafmr127540116d6.26.1778766879720; Thu, 14 May 2026
 06:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513231445.3213501-4-derekjohn.clark@gmail.com> <20260514125337.950E8C2BCB3@smtp.kernel.org>
In-Reply-To: <20260514125337.950E8C2BCB3@smtp.kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 14 May 2026 06:54:28 -0700
X-Gm-Features: AVHnY4L5lwdI44FHg0fPESrXT2M7Uo8LeL1z1SpAOCehX6GQjcM26_P8E8Nou_A
Message-ID: <CAFqHKT=MuPUajfGFR19iKNpTeEMMymqriHXNf+XyprB60D08vQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] HID: hid-msi: Add RGB control interface
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 5:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [Critical] The `speed_show` function incorrectly casts the LED class de=
vice to a HID device, resulting in an invalid pointer dereference and a gua=
ranteed kernel panic.
> - [Critical] Missing bounds check on `frame->frame_count` from the USB de=
vice leads to an out-of-bounds read of kernel memory.
> - [High] Re-arming `rgb_queue` from sysfs attributes after it has been ex=
plicitly cancelled in `claw_remove` leads to a Use-After-Free.
> - [High] The `guard(mutex)` macro in `claw_hw_output_report()` is incorre=
ctly used inside a block scope, providing absolutely no synchronization.
> - [High] Concurrent modification of shared RGB state without lock protect=
ion causes data races and memory corruption.
> - [High] Every RGB state change triggers a `SYNC_TO_ROM` command, causing=
 severe flash memory degradation.
> - [Medium] An early return in `cfg_setup_fn` silently drops core gamepad =
sysfs attributes if RGB initialization fails.
> --
>
> commit a90ff4a0f03b6df7827bfbcd222f977138b9d280
> Author: Derek J. Clark <derekjohn.clark@gmail.com>
>
> HID: hid-msi: Add RGB control interface
>
> Adds RGB control interface for MSI Claw devices. The MSI Claw uses a
> fairly unique RGB interface. It has 9 total zones (4 per joystick ring
> and 1 for the ABXY buttons), and supports up to 8 sequential frames of
> RGB zone data.
>
> > --- a/drivers/hid/hid-msi.c
> > +++ b/drivers/hid/hid-msi.c
>
> [ ... ]
>
> > @@ -308,15 +368,52 @@ static int claw_profile_event(struct claw_drvdata=
 *drvdata, struct claw_command_
> >               for (i =3D 0; i < CLAW_KEYS_MAX; i++)
> >                       codes[i] =3D (cmd_rep->data[6 + i] !=3D 0xff) ? c=
md_rep->data[6 + i] : 0x00;
> >               break;
> > +     case CLAW_RGB_PENDING:
> > +             frame =3D (struct rgb_report *)cmd_rep->data;
> > +             rgb_addr =3D drvdata->rgb_addr;
> > +             read_addr =3D be16_to_cpu(frame->read_addr);
> > +             frame_calc =3D (read_addr - rgb_addr) / CLAW_RGB_FRAME_OF=
FSET;
> > +             if (frame_calc > U8_MAX) {
> > +                     dev_err(drvdata->led_mc.led_cdev.dev, "Got unsupp=
orted frame index: %x\n",
> > +                             frame_calc);
> > +                     ret =3D -EINVAL;
> > +                     goto err_pending;
> > +             }
> > +             f_idx =3D frame_calc;
> > +
> > +             if (f_idx >=3D CLAW_RGB_MAX_FRAMES) {
> > +                     dev_err(drvdata->led_mc.led_cdev.dev, "Got illega=
l frame index: %x\n",
> > +                             f_idx);
> > +                     ret =3D -EINVAL;
> > +                     goto err_pending;
> > +             }
> > +
> > +             /* Always treat the first frame as the truth for these co=
nstants */
> > +             if (f_idx =3D=3D 0) {
> > +                     drvdata->rgb_frame_count =3D frame->frame_count;
>
> drvdata->rgb_frame_count is assigned directly from the hardware packet.
> Should there be a bounds check here to ensure it is less than or equal to
> CLAW_RGB_MAX_FRAMES?
>
> Later, claw_write_rgb_state() uses drvdata->rgb_frame_count as the upper
> bound for a loop reading from drvdata->rgb_frames. If a device sends a
> frame count greater than 8, could this read out-of-bounds kernel memory
> and send it back to the USB device?

I'll add a bounds check, though again it is unlikely with the previous chec=
ks.

> > +                     /* Invert device speed (20-0) to sysfs speed (0-2=
0) */
> > +                     drvdata->rgb_speed =3D frame->speed;
> > +                     drvdata->led_mc.led_cdev.brightness =3D frame->br=
ightness;
> > +                     drvdata->led_mc.subled_info[0].intensity =3D fram=
e->zone_data.zone[0].red;
> > +                     drvdata->led_mc.subled_info[1].intensity =3D fram=
e->zone_data.zone[0].green;
> > +                     drvdata->led_mc.subled_info[2].intensity =3D fram=
e->zone_data.zone[0].blue;
> > +             }
> > +
> > +             memcpy(&drvdata->rgb_frames[f_idx], &frame->zone_data,
> > +                    sizeof(struct rgb_frame));
>
> claw_profile_event() modifies drvdata->rgb_frames and
> drvdata->rgb_frame_count from the HID raw event handler context.
> Simultaneously, claw_rgb_queue_fn() runs in a workqueue and calls
> functions that overwrite these exact same fields.
>
> Since there are no locks protecting these updates, could a background
> worker read torn state or corrupt the frame arrays while they are being
> actively updated by the asynchronous device response?

I'll add another mutex I suppose.

> [ ... ]
>
> > @@ -759,6 +856,397 @@ static const struct attribute_group claw_gamepad_=
attr_group =3D {
> >       .is_visible =3D claw_gamepad_attr_is_visible,
> >  };
> >
> > +/* Read RGB config from device */
> > +static int claw_read_rgb_config(struct hid_device *hdev)
> > +{
>
> [ ... ]
>
> > +/* Send RGB configuration to device */
> > +static int claw_write_rgb_state(struct claw_drvdata *drvdata)
> > +{
> > +     struct rgb_report report =3D { 0x01, 0x0000, CLAW_RGB_FRAME_OFFSE=
T, 0x00,
> > +                     drvdata->rgb_frame_count, 0x09, drvdata->rgb_spee=
d,
> > +                     drvdata->led_mc.led_cdev.brightness };
> > +     u16 write_addr =3D drvdata->rgb_addr;
> > +     size_t len =3D sizeof(report);
> > +     int f, ret;
> > +
> > +     if (!drvdata->rgb_addr)
> > +             return -ENODEV;
> > +
> > +     if (!drvdata->rgb_frame_count)
> > +             return -EINVAL;
> > +
> > +     guard(mutex)(&drvdata->rom_mutex);
> > +     /* Loop through (up to) 8 pages of RGB data */
> > +     for (f =3D 0; f < drvdata->rgb_frame_count; f++) {
> > +             report.zone_data =3D drvdata->rgb_frames[f];
> > +
> > +             /* Set the MCU address to write the frame data to */
> > +             report.read_addr =3D cpu_to_be16(write_addr);
> > +
> > +             /* Serialize the rgb_report and write it to MCU */
> > +             ret =3D claw_hw_output_report(drvdata->hdev, CLAW_COMMAND=
_TYPE_WRITE_PROFILE_DATA,
> > +                                         (u8 *)&report, len, 8);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Increment the write addr by the offset for the next fr=
ame */
> > +             write_addr +=3D CLAW_RGB_FRAME_OFFSET;
> > +     }
> > +
> > +     ret =3D claw_hw_output_report(drvdata->hdev, CLAW_COMMAND_TYPE_SY=
NC_TO_ROM, NULL, 0, 8);
>
> Does sending CLAW_COMMAND_TYPE_SYNC_TO_ROM on every RGB state change
> cause excessive flash memory degradation?
>
> Because claw_apply_rgb_state() is triggered by unthrottled sysfs writes
> (such as rapidly changing a brightness slider), this might cause hundreds
> of NVRAM writes per second and potentially degrade the MCU's flash
> endurance.

This is throttled by mod_delayed_work, where each subsequent call
under 50ms resets the timer.

> [ ... ]
>
> > +static ssize_t effect_store(struct device *dev,
> > +                         struct device_attribute *attr,
> > +                         const char *buf, size_t count)
> > +{
> > +     struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +     struct led_classdev_mc *led_mc =3D container_of(led_cdev, struct =
led_classdev_mc, led_cdev);
> > +     struct claw_drvdata *drvdata =3D container_of(led_mc, struct claw=
_drvdata, led_mc);
> > +     int ret;
> > +
> > +     ret =3D sysfs_match_string(claw_rgb_effect_text, buf);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     drvdata->rgb_effect =3D ret;
> > +     mod_delayed_work(system_wq, &drvdata->rgb_queue, msecs_to_jiffies=
(50));
> > +
> > +     return count;
> > +}
>
> Is there a potential use-after-free here if sysfs attributes are written
> after the device is removed?
>
> In claw_remove(), the driver attempts to tear down the worker using
> cancel_delayed_work_sync(&drvdata->rgb_queue). However, the sysfs files
> and LED endpoints remain active because devm cleanup executes after
> claw_remove() completes.
>
> A concurrent write to a sysfs attribute like effect_store could call
> mod_delayed_work() and re-arm the work item, causing it to execute after
> drvdata has been freed.
> [ ... ]
>
> > +static ssize_t speed_show(struct device *dev, struct device_attribute =
*attr,
> > +                       char *buf)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(dev);
> > +     struct claw_drvdata *drvdata =3D hid_get_drvdata(hdev);
>
> Is the dev parameter passed to speed_show actually a hid_device?
>
I forgot to fix this.

> The rgb_attr_group sysfs group is attached to the LED class device
> (led_cdev.dev), not the parent HID device. The macro to_hid_device(dev)
> blindly performs a container_of cast, which will yield an invalid pointer
> for hdev.
>
> Dereferencing it with hid_get_drvdata(hdev) will likely cause a kernel
> panic when this world-readable attribute is accessed.
>
> [ ... ]
>
> > @@ -772,6 +1260,13 @@ static void cfg_setup_fn(struct work_struct *work=
)
> >               return;
> >       }
> >
> > +     ret =3D claw_read_rgb_config(drvdata->hdev);
> > +     if (ret) {
> > +             dev_err(drvdata->led_mc.led_cdev.dev,
> > +                     "Failed to setup device, can't read RGB config: %=
d\n", ret);
> > +             return;
> > +     }
> > +
> >       /* Add sysfs attributes after we get the device state */
> >       ret =3D devm_device_add_group(&drvdata->hdev->dev, &claw_gamepad_=
attr_group);
>
> If claw_read_rgb_config() fails due to a temporary USB error or
> unsupported firmware, this early return skips the subsequent
> devm_device_add_group call.
>
> Does this unintentionally break the device's core gamepad configuration
> interface simply because the RGB initialization failed?

The expectation is that if any of these error there is a problem with
the kernel or the device hardware. This is intentional.

> This isn't a new bug introduced by this patch, but does the guard() in
> claw_hw_output_report() provide any synchronization?
>
> claw_hw_output_report() {
>     if (timeout) {
>         guard(mutex)(&drvdata->cfg_mutex);
>         reinit_completion(&drvdata->send_cmd_complete);
>     }
>     ...
> }
>
> Because the guard is declared inside the block, the mutex is immediately
> released at the closing brace before hid_hw_output_report() and
> wait_for_completion_interruptible_timeout() are ever called. This seems
> to leave the I/O operations unprotected against concurrent threads, which
> this patch introduces via the new RGB workers.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513231445.32=
13501-1-derekjohn.clark@gmail.com?part=3D3
