Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82813D1AB0
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797742; cv=pass; b=NwU1orDCbrFi5EIxZHsZuVIJQtvZuVtbovqApJsheIh97Gsdv5L9swKH5dYhaM1WUxHR+QZbDdnXdP/0ZQ6xWlE74Y5E8s9WmEJSyXGav5kXWi7KFEqbrWSM3u83SEwv3sXlJfLJOjnGc0zZWBquSWBLe1xgrRV3SBEbod0zgqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797742; c=relaxed/simple;
	bh=TQsdtoRoKBjKlgY/JKJivHqZBz64mvyVLYtjyFzhU9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lHA3sRz09WDMcl8K5Mf4CACAyHJzV8TPWo295xfWNZXdze9AR8mjQkQ5VaQIKwDoCGYRy63TfBHnJnx3qO7aaWIs9okkQU/bL7vB8p0GICJFWY4fli+9gJsyD+XiS152ouKLQowm1gOqyTB4oNUdA2b0CKqP883SYbc9rPuCkbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0Uo8WwU; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0Uo8WwU"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e5c5033f6so59070121cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 15:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778797740; cv=none;
        d=google.com; s=arc-20240605;
        b=aHfGYaOcbYO9jQBkSKqANl9YL/bmCTjFhfGBkJJJI3FgvEZpIKQJlCPY9p6hQ13b4O
         fPbHX6SyBPWXywDNJK+UvDtvEsxhR4P3jHLJJMjX3z/uZE/CDe/e0K6xN8IB1Yz0sch4
         kgm1WB9NJ6eyYQZ+WKGbrgKFJykp8dV59UagmxpiV6+QL0BV6pUxh4LlehA61/BptTgX
         J+w/puhnpdBTAHksL3EKDAuZWmXRF6kiVEBzH8PGzHhEsqWvZ4ifdZ7kPANk+RxHRAn/
         dq6ukoqndQ3bkZsxjhQb5Avo57/ovKkoiMrg+3k5k3C42VXB7glbuZHSFfJZt9OWx/31
         Qyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bwcl/VntQw/rKhXYMReAiVTe4j5xYb5xMmOLW3LO9Gw=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=Bm5QafBggW71Tk6BC3gVKA0qG5hR6kVfnwJ3lLzCDbxoZs8+klwAbAXA7AWQI+RpGo
         js5mndYU7dFRu4zKrfVH37HP1DJeYVssUOo9jWi2/b0FWwbKXCGa+Vg0DYYyjRotLnV9
         7EMg9hgUJMPBEsxyZQLJz8aOHSZRu/5+tSzUm74Ju067CBcckuUoXb66cDqHtM+XPPv7
         //8fJlbzdcpJb6VQZ6skGq/97s7vctqS7ISOLJO1qGscOo33bsAIxwn+PivMU5sYOj+4
         Odb/jBJceUPeOtw6kyp0WAx5EgiZTs9EWwxrrjYqkmwNKAmg/sIF2Glr1C/7dURFYetM
         DWMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778797740; x=1779402540; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwcl/VntQw/rKhXYMReAiVTe4j5xYb5xMmOLW3LO9Gw=;
        b=s0Uo8WwUtWFM1RYS85dATxExYlI/KLf+eloduLRRJZ2Gs/VN3yZ6JBT0e3l8B6YZ5Z
         qIPn4ZpyjT1AiEIrvIWEvAao7qLg9bZmOyUQpbyrzkUypZF83nto6WfL23aXVnj/0GPy
         BowdC08PYJlDtwHW+Vnx27ZgQWcgNYk4N+YdNo56qq46zcFt60KeRyp/Qjmn2zHaPup9
         jS99L3OOehJV1pYNL2NDU79n2S764yGUovzp9+RfRUatUhmVGDmk/8bQM/3O25RiV/dy
         CrHyfmBBVGLivfL++h/LIWcSQXe4iFZ+4War1ZTmW37QtwDPPnZBQ5gG1vCokliHZf1o
         GDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797740; x=1779402540;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bwcl/VntQw/rKhXYMReAiVTe4j5xYb5xMmOLW3LO9Gw=;
        b=sC8lvVodSABuMnoahc0qfl0MvR3UUBq1akflUGN5C8vybn1UZZcqyBQMR0iPoD5/3F
         kieGtSq4bUYYWgfT5DaYAoOsOhrGVRnJBWk9yPe7wMjnEKlZMTuV6QfSs6kzjYw+O8WU
         3JNo0uoyr1u+dYVMGcs3zzRupguHYbnwVmyRDPPMpfY7/4aPO7/x9XtBUAy0/xrljuA3
         Vbc1Vyd/Z6lG8Y+3BcWF/XLJAMKvuduQu26uoRNTlazAI0Zx6x2R8MIiaLIM/eXs1SQb
         +NHfHf33dOrjNhz05QWXvPtS+yeWHnTJAarzLOxj/VA3J9ZV0nMWm7CE3FxOdYVjo0TR
         1dtw==
X-Gm-Message-State: AOJu0Yy+fuipFAlB+uQu2Af6Om+vCoipGiUvhkIkDykClk8f7atXdKCl
	fJBiPa2DQ+Lb4UugEy+cxrcI4IeMsXwLLBLIqzDGanBXUy8M4zBXREB3sHOM/0hES+SVieXeb4H
	udSeGFWacdAxrQxMmSvwpiw9YU3PHdDDD7j7W
X-Gm-Gg: Acq92OEZ41iY8uaeeleD6nT3PtzoWeCg4oWgKB9g/Hj1w1pTv/o/rJhgfIIZHaZADUX
	2Y0QfAuo4CyKaLczyyromtdN3VyjZkHgfHwppBzhiC4dFxoDsQyHBDaayKJ9yleOboLco+FYJnG
	ZDhkQjLh55RzOlcvSQ9WKLwAGsG6yAj32KZPToJHGkzknJauJDpZaba27NC9zuKaaDJWRnMC7zZ
	sNzxFJ6RPSBeAJGWLoCCAr4yVqD5+GtwILps+qvt+ZIvjIKuRxLuQQ+PTBHWbT6hqCbwrh+wg7o
	TZlUZdNFyNm1YHEq
X-Received: by 2002:a05:622a:d1:b0:509:1b76:e9b2 with SMTP id
 d75a77b69052e-5165a276812mr18497161cf.55.1778797739891; Thu, 14 May 2026
 15:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513155723.230707-1-andrewmaney05@gmail.com> <20260514065043.1F11AC2BCC7@smtp.kernel.org>
In-Reply-To: <20260514065043.1F11AC2BCC7@smtp.kernel.org>
From: Andrew Maney <andrewmaney05@gmail.com>
Date: Thu, 14 May 2026 18:28:48 -0400
X-Gm-Features: AVHnY4LmzGd-6h15pikDQBgXvuWE2vTY6MA5n_nokjy8z3Hk5OP1uBeNEY5MWHw
Message-ID: <CAO1jzHj_ZkSKOXvjw13a9mA97TsQdZ7Z12RNWwPG4O=g2TYiPg@mail.gmail.com>
Subject: Re: [PATCH] HID: Expose LattePanda IOTA UPS as a power_supply device
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 2:50=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 7 potential issu=
e(s) to consider:
> - [High] Kernel panic due to invalid type cast when transport is not USB =
(e.g. uhid).
> - [High] Kernel panic from dereferencing an ERR_PTR in the raw event hand=
ler.
> - [High] Exposing fabricated 0 values for unsupported TIME_TO_EMPTY prope=
rties causes immediate system shutdown.
> - [Medium] Hardcoded sysfs name prevents multiple devices and causes prob=
e failure.
> - [Medium] Data race on `ups->charge_limit`.
> - [Low] Missing `POWER_SUPPLY` dependency in Kconfig causes build failure=
s.
> - [Low] Driver synchronously blocks the probe path for 3 seconds.
> --
>
> commit 7d140ce589ec6c637bec5ce8b0c27bf8634322c6
> Author: Andrew Maney <andrewmaney05@gmail.com>
> Subject: HID: Expose LattePanda IOTA UPS as a power_supply device
>
> This commit adds a driver for the LattePanda IOTA UPS. It exposes battery
> status, capacity, and charging status via the power_supply subsystem by p=
arsing
> custom HID reports.
>
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -105,6 +105,16 @@ config HID_HAPTIC
> >
> >  menu "Special HID drivers"
> >
> > +config HID_LATTEPANDA_IOTA_UPS
> > +     tristate "LattePanda IOTA UPS"
> > +     depends on USB_HID && X86
>
> If the kernel is configured with CONFIG_POWER_SUPPLY=3Dm and
> CONFIG_HID_LATTEPANDA_IOTA_UPS=3Dy, will the built-in HID driver fail to =
link
> against the modular power supply core? Should this include a dependency o=
n
> POWER_SUPPLY?
>
> > diff --git a/drivers/hid/hid-lattepanda-iota-ups.c b/drivers/hid/hid-la=
ttepanda-iota-ups.c
> > --- /dev/null
> > +++ b/drivers/hid/hid-lattepanda-iota-ups.c
> [ ... ]
> > +static enum power_supply_property iota_ups_properties[] =3D {
> > +     POWER_SUPPLY_PROP_STATUS,
> > +     POWER_SUPPLY_PROP_CAPACITY,
> > +     POWER_SUPPLY_PROP_PRESENT,
> > +     POWER_SUPPLY_PROP_ONLINE,
> > +     POWER_SUPPLY_PROP_SCOPE,
> > +     POWER_SUPPLY_PROP_TECHNOLOGY,
> > +     POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> > +     POWER_SUPPLY_PROP_CAPACITY_LEVEL,
> > +     POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
> > +     POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
>
> If the hardware doesn't support reporting time remaining, is it safe to
> include these properties and return 0?
>
> Returning 0 seconds remaining while discharging can signal to userspace p=
ower
> daemons like UPower or systemd-logind that the battery is empty, which mi=
ght
> trigger an immediate emergency suspend or shutdown. Could these unsupport=
ed
> properties be omitted from the array entirely?
>
> [ ... ]
> > +static int iota_ups_set_property(struct power_supply *supply,
> > +                              enum power_supply_property psp,
> > +                              const union power_supply_propval *val)
> > +{
> > +     struct iota_ups *ups =3D power_supply_get_drvdata(supply);
> > +
> > +     if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD) {
> > +             /*
> > +              * V1.0 supports 80% and 100% charge limits only, set via
> > +              * DIP switch on the board. This property allows userspac=
e
> > +              * to inform the driver which limit is configured.
> > +              */
> > +             if (val->intval !=3D 80 && val->intval !=3D 100)
> > +                     return -EINVAL;
> > +             ups->charge_limit =3D val->intval;
>
> Does this introduce a data race on ups->charge_limit?
>
> This field is modified here without holding ups->lock, but it is concurre=
ntly
> read in iota_ups_raw_event() and iota_ups_get_property() where it is
> protected by spin_lock_irqsave(). Should this assignment also be
> protected by the spinlock?
>
> [ ... ]
> > +static int iota_ups_raw_event(struct hid_device *hdev,
> > +                           struct hid_report *report,
> > +                           u8 *data, int size)
> > +{
> > +     struct iota_ups *ups =3D hid_get_drvdata(hdev);
> [ ... ]
> > +     /*
> > +      * Notify the power_supply core outside the spinlock. This
> > +      * triggers UPower's PropertiesChanged signal with the new values=
.
> > +      */
> > +     if (changed && ups->psu)
> > +             power_supply_changed(ups->psu);
>
> Could ups->psu contain an error pointer here?
>
> In iota_ups_probe(), if devm_power_supply_register() fails, it returns an
> error pointer like ERR_PTR(-ENOMEM), which gets directly assigned to ups-=
>psu.
>
> Because hid_hw_start() is called earlier, raw HID events can be processed
> concurrently before the hardware is stopped in the error path. Since an e=
rror
> pointer is not NULL, the check (changed && ups->psu) would pass, and
> power_supply_changed() would be called with the error pointer, leading to=
 a
> crash.
>
> Would it be safer to assign the return value of devm_power_supply_registe=
r()
> to a local variable first, and only update ups->psu on success?
>
> [ ... ]
> > +static int iota_ups_probe(struct hid_device *hdev,
> > +                       const struct hid_device_id *id)
> > +{
> [ ... ]
> > +     /* Retrieve serial number from the USB descriptor */
> > +     udev =3D to_usb_device(hdev->dev.parent->parent);
> > +     if (udev->serial)
> > +             strscpy(ups->serial, udev->serial, sizeof(ups->serial));
>
> Can this cause a kernel panic if the HID device is instantiated via users=
pace
> mock drivers like uhid?
>
> When using uhid (which allows setting the bus type to BUS_USB), the paren=
t
> device is the uhid character device, not a usb_interface. Dereferencing t=
he
> resulting struct usb_device pointer would perform an out-of-bounds memory
> read.
>
> Should the driver verify the transport layer using hid_is_usb() before
> dereferencing USB-specific structures, or simply use hdev->uniq instead?
>
> [ ... ]
> > +     /*
> > +      * Wait for both status and capacity reports before registering.
> > +      * The device sends reports every ~1 second; 3 seconds is safe.
> > +      */
> > +     wait_for_completion_timeout(&ups->got_initial_data,
> > +                                 msecs_to_jiffies(3000));
>
> Does blocking the probe path for 3 seconds cause issues for device
> enumeration?
>
> Calling wait_for_completion_timeout() synchronously stalls the kernel's
> device enumeration thread for that bus, which can unnecessarily delay the
> overall system boot process or stall the handling of other devices during
> hotplug.
>
> Could the registration be deferred, or could the device be registered
> immediately with an unknown state instead of blocking?
>
> > +
> > +     ups->psu_desc.name                      =3D "lattepanda-iota-ups"=
;
>
> Is it possible to have multiple of these UPS devices connected to a singl=
e
> system?
>
> If a second device is plugged in, it will attempt to register a sysfs
> directory with the exact same hardcoded name, which fails with -EEXIST.
>
> This probe failure would then trigger the error pointer panic mentioned
> earlier. Should the driver dynamically construct a unique name using
> devm_kasprintf() with dev_name(&hdev->dev)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513155723.23=
0707-1-andrewmaney05@gmail.com?part=3D1

Thanks for the detailed review! I'll address them in v3.

I'll do the following:
* Remove TIME_TO_EMPTY_NOW and TIME_TO_FULL_NOW to avoid spurious
shutdowns. The UPS board doesn't currently have any way to report
these values as of right now.
* Add the POWER_SUPPLY requirement to Kconfig.
* Fix the data race for ups->charge_limit in set_property.
* Address the 3 second probe delay, it may not be needed. Registering
the UPS immediately with an unknown state may not be safe if its
reports are misinterpreted.
* Fix ERR_PTR panic with a local variable.
* Fix uhid panic with hid_is_usb() before dereferencing.
* Use devm_kasprintf() for a unique sysfs name. It is not currently
possible to have more than one UPS board connected to the IOTA, but
I'll implement this as a safeguard in case future hardware revisions
do add support for this.

Thanks,
Andrew
