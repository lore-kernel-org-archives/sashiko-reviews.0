Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD32D94B5
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779564124; cv=none; b=Jp1ttuhpB7+t2gnrCfHVj8nHgah9pp3a5VY3GThbhChBOaDFtOIgA0IpTnNrucalWVAjlU5h87psf7cVgpy00+nXix2VrSQdB7LOJz/V4q2RrL51MR/zG/idae0gIGqsw0J/iutcIm9cSuQ7HClCEffZnQe1ehkpuFXuGbCQOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779564124; c=relaxed/simple;
	bh=Qi1cKD48gCY2y8NURF+96CXY7Rx4S2C30Nzcs3+wm8M=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=hCTiB54EEEDEz8V8Xzi76JLxAkwQHdLV2raROkWhCi+LRaCWAN3k0OMSZOAVQLkOrnTd5SGCD2hvnBiUf6l/2p8RD3vj6Ea9w89dVcKpzVGAY4B9PYyfjNvqIH3/utuw8SOf6jxUUW37eTZRXubpVvR330mHsyVKEmdE56nOxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fov9EKWc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fov9EKWc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so6403168f8f.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779564121; x=1780168921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1nyil2UrybGod099ae7Fu+qN7s7Wzz/PUhg4kbNilFU=;
        b=fov9EKWcn2Pan+pAnZXvW5xiyADOIk40PleX1lMOI09OQ/MQ6qQI0yqD1z1EW/MYme
         kcG+W5Xk8+V09vyh1oQgu/VyFITOL+QvwVqm9Oh7/kTyACGp9f63twGMcVIASbjSazu0
         98eUgyZAZyfYhfhfFasH15QhT778n15VENdBOZIXWMjnnsy49Xfvsm3EvSs2Wzy6qJo1
         eUmgoNlVqCoSY/bvAJgB4svUHqdAupD3LiElxr4ZUdvPT3kWtnM2JtpEkntCf1Ntz8ze
         5i8uT21qRk/FoR7MdxpzI4oK63sRoW/Q4yYuVPhz/jwhPqonckD5dPKwO5jxmYnvjFOe
         Ff8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779564121; x=1780168921;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nyil2UrybGod099ae7Fu+qN7s7Wzz/PUhg4kbNilFU=;
        b=W39SlJzQ5LxoNCnPDaimwIGqrqafnjIQMhxIpx8BYu8KDCryQBYMlvRbWxF7QvK5l2
         ZJTQA3dR3fkKxAcpDR4x01crvdHIh5faNulT7kI0I1shjOT6p5kbhNGSoy5JX/v0LQuP
         OJ7i8doCg/Qhp+HZYXeTSBDEF7YsC35phhrPF42ZRHzPguIxrQcfir7nRdw7ojiGo2Py
         xq3CCww2jUI9tgavXemFk5PW1TvfSgjPezMXKaEm2LrhSDcRYj0CwJclK+SGo1cfbJIN
         KwxeWC7CzN8HMnhvTCm6wbh4GioeSYkXa2DyywtwYJ0RC1r0trFQmdsBOz/xYNB6EIaQ
         hqzg==
X-Gm-Message-State: AOJu0YyofNO4SI0DBw867da6dlDQ8nfIK0x7ZGJl3+M3hP40q8ENp1C4
	XQIGDwys+1kVKe/DrgjAOx6VyYoX/lbzBDET5MbSD69i54cwFuXIu5JpwHGasg==
X-Gm-Gg: Acq92OG53dvnYF5jpQMtrUTGShks+pTIQa2cbf9x1tEDdyPf5LImsxdkpMwGyt6sRPI
	mjY+reOtdQmq6W3VcYH4eH1M3xvKwI6hor/68E/6G+OEbqOHfG+WreD8m/yu7Bs5GvkII7MTOlG
	zhDc/uLTFSOEAl/dNABabcRKAFcqINO/Z9ojCdcPin57DsAmuvbLzH8i7Fh/6dpG64fQkHLzvfO
	bQtmYRO3RciFrBnmqToMXb/0XViYiNb3voCrO7jaAZeG55Kihi2uZa0Oz6OvF/pDHT07J3uc1m9
	iN/4fqsgEGho8PMEssiKrb3VIo5JEtl0h3ccL1MhC4++9xu0JxpX6ONX8rYasp42TJJIP8Yh1d0
	Ejr0s6KemgZjRpp0IhGb5dDktkoICRmRMrEe93p316JED8t/xgkIPlv597y+cyvvMNYf9YffxH5
	hPpHaQEMw7yZk6pWbFIR94tnYk
X-Received: by 2002:a05:6000:4283:b0:44d:261:54c5 with SMTP id ffacd0b85a97d-45eb38b7934mr13481139f8f.30.1779564120271;
        Sat, 23 May 2026 12:22:00 -0700 (PDT)
Received: from localhost ([81.6.39.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd211sm18661289f8f.10.2026.05.23.12.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 12:21:59 -0700 (PDT)
Date: Sat, 23 May 2026 10:57:55 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org,
 dmitry.torokhov@gmail.com
Subject: Re: [PATCH v5 1/3] HID: nintendo: Add preliminary Switch 2
 controller driver
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <20260512200051.2534081-2-vi@endrift.com>
 <20260514001510.964E7C19425@smtp.kernel.org>
In-Reply-To: <20260514001510.964E7C19425@smtp.kernel.org>
Message-Id: <25DJXAMCCCNLA.234CWZVQ8IOM4@homearch.localdomain>
User-Agent: mblaze/1.4-1-g5a69507 (2026-01-24)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Heyhey!

Below some comments regarding the findings (note that I am not an expert
on neither Linux kernel drivers in general nor USB HID specifically).

sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential iss=
ue(s) to consider:
> - [High] Sleeping in atomic context and AB-BA deadlock in `switch2_usb_di=
sconnect`
> - [High] Race condition in IN URB tracking causes permanent starvation
> - [High] Dangling pointers and use-after-free on probe failure
> - [High] Memory corruption and double free due to incorrect devm input li=
fecycle management
> - [High] NULL pointer dereference in USB probe error path
> - [High] Division by zero crash from unvalidated trigger calibration data=

> - [High] BUG_ON kernel panic when `ida_free` is called with U32_MAX
> - [High] Out-of-bounds read when parsing NS2_CMD_FW_INFO response
> - [High] Race condition due to URB submission before initialization of sy=
nchronization primitives
> - [Medium] Infinite USB retry storm on protocol errors
> - [Medium] Unaligned memory access on byte array casts
> --
>=20
> commit 00cb7265ad5983144c6923702e2ee2c3c047d29e
> Author: Vicki Pfau <vi@endrift.com>
> Subject: HID: nintendo: Add preliminary Switch 2 controller driver
>=20
> This adds a new driver for the Switch 2 controllers. The Switch 2 uses an=

> unusual split-interface design such that input and rumble occur on the ma=
in
> HID interface, but all other communication occurs over a "configuration"
> interface.
>=20
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index 29008c2cc5304..2193afcdefabc 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
> [ ... ]
> > +static int switch2_init_input(struct switch2_controller *ns2)
> > +{
> [ ... ]
> > +	input =3D devm_input_allocate_device(&hdev->dev);
> > +	if (!input)
> > +		return -ENOMEM;
> [ ... ]
> > +	ret =3D input_register_device(input);
> > +	if (ret < 0) {
> > +		hid_err(ns2->hdev, "Failed to register input; ret=3D%d\n", ret);
> > +		input_free_device(input);
>=20
> Calling input_free_device or input_unregister_device on a devm-managed
> input device can cause double frees when devres cleanup fires. Can this
> lead to memory corruption?

I think sashiko is actually correct here, unfortunately. The documentation
for devm_input_allocate_device states that

  Managed input devices do not need to be explicitly unregistered or
  freed as it will be done automatically when owner device unbinds from
  its driver (or binding fails). ...

Looks like we can remove all the input_unregister_device and
input_free_device calls here.

>=20
> > +		return ret;
> > +	}
> [ ... ]
> > +static void switch2_controller_put(struct switch2_controller *ns2)
> > +{
> > +	struct input_dev *input;
> > +	bool do_free;
> [ ... ]
> > +	if (input)
> > +		input_unregister_device(input);
>=20
> Calling input_unregister_device on a devm-managed input device can cause
> issues. If the input device remains alive (tied to the HID device devres)=

> and its child LEDs are not released, will reconnecting the USB cable
> allocate a new input device and corrupt the LED lists by re-registering
> the exact same ns2->leds structures?

This input_unregister_device can also be removed.

>=20
> > +
> > +	if (do_free) {
> [ ... ]
> > +static void switch2_report_trigger(struct input_dev *input, uint8_t ze=
ro, int abs, uint8_t data)
> > +{
> > +	int value =3D (NS2_TRIGGER_RANGE + 1) * (data - zero) / (232 - zero);=

>=20
> The zero variable is loaded directly from the controller's factory calibr=
ation
> flash. If a device reports a zero point of exactly 232, will this trigger=
 a
> division by zero exception and crash the kernel?

Not sure this is an issue in practice, but we might want to protect the
code in any case by doing something like the below perhaps (untested).

int value =3D (NS2_TRIGGER_RANGE + 1) * (data - zero) / max_t(int, (232 - z=
ero), 1);


>=20
> > +
> > +	input_report_abs(input, abs, clamp(value, 0, NS2_TRIGGER_RANGE));
> > +}
> [ ... ]
> > +static int switch2_read_flash(struct switch2_controller *ns2, uint32_t=
 address,
> > +	uint8_t size)
> > +{
> > +	uint8_t message[8] =3D { size, 0x7e };
> > +
> > +	if (!ns2->cfg)
> > +		return -ENOTCONN;
> > +	*(__le32 *)&message[4] =3D __cpu_to_le32(address);
>=20
> The driver directly casts &message[4] to __le32. Since message is a uint8=
_t
> array, it is only guaranteed to be 1-byte aligned. On strict architecture=
s,
> will this unaligned memory write trigger a hardware alignment fault?

I assume this could be an issue and we should just use something like
the below (only compile-tested).

put_unaligned_le32(__cpu_to_le32(address), &message[4]);


>=20
> > +	return ns2->cfg->send_command(NS2_CMD_FLASH, NS2_SUBCMD_FLASH_READ, m=
essage,
> > +		sizeof(message), ns2->cfg);
> > +}
> [ ... ]
> > +int switch2_receive_command(struct switch2_controller *ns2,
> > +	const uint8_t *message, size_t length)
> > +{
> [ ... ]
> > +	header =3D (const struct switch2_cmd_header *)message;
> > +	if (!(header->flags & NS2_FLAG_OK)) {
> > +		ret =3D -EIO;
> > +		goto exit;
> > +	}
> > +	message =3D &message[8];
> > +	switch (header->command) {
> [ ... ]
> > +	case NS2_CMD_FW_INFO:
> > +		if (header->subcommand =3D=3D NS2_SUBCMD_FW_INFO_GET) {
> > +			if (length < sizeof(ns2->version)) {
> > +				ret =3D -EINVAL;
> > +				goto exit;
> > +			}
> > +			memcpy(&ns2->version, message, sizeof(ns2->version));
>=20
> The message pointer is advanced by 8 bytes to skip the header, but length=

> is not decremented. The bounds check compares length against
> sizeof(ns2->version). If length is exactly sizeof(ns2->version), the chec=
k
> passes, but the advanced message pointer only has length - 8 valid bytes
> remaining. Will the memcpy over-read into uninitialized memory?

Sounds like something that we should fix by either decreasing length or
increasing the size in the check.

>=20
> > +			ns2->ctlr_type =3D ns2->version.ctlr_type;
> > +			switch2_init_step_done(ns2, NS2_INIT_GET_FIRMWARE_INFO);
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +exit:
> > +	if (ns2->init_step < NS2_INIT_DONE)
> > +		switch2_init_controller(ns2);
>=20
> If a command response has the NACK flag set or encounters another error,
> the code jumps to exit and invokes switch2_init_controller. Since
> ns2->init_step has not advanced, the state machine will immediately re-se=
nd
> the exact same command. Can this cause an infinite tight feedback loop of=

> failures and retries, flooding the USB bus?

We have discussed this before and it doesn't seem to be an issue in
practice.

If we want to be on the safe side, we could pass a retry count and abort
on too many error retries, perhaps?


> > +
> > +	return ret;
> > +}
> [ ... ]
> > +int switch2_controller_attach_cfg(const char *phys, struct switch2_cfg=
_intf *cfg)
> > +{
> [ ... ]
> > +	guard(mutex)(&ns2->lock);
> > +	WARN_ON(ns2->cfg);
> > +	ns2->cfg =3D cfg;
> > +
> > +	if (ns2->hdev)
> > +		return switch2_init_controller(ns2);
>=20
> If switch2_init_controller fails here or in switch2_probe, the error is
> returned immediately without unrolling the state. Will ns2->cfg or ns2->h=
dev
> remain set, potentially leading to a use-after-free when subsequent devic=
e
> events occur?

AFAICT, since we are always checking for both ns2->cfg and ns2->hdev
before doing any processing in switch2_init_controller, there should
never be a use-after-free

It *is* true that we don't call hid_hw_{close,stop} in switch2_probe,
if the switch2_init_controller call fails though. It might make sense
to return a specific error and use it to check whether we want to give
up and call these?

>=20
> > +	return 0;
> > +}
> [ ... ]
> > +static void switch2_remove(struct hid_device *hdev)
> > +{
> > +	struct switch2_controller *ns2 =3D hid_get_drvdata(hdev);
> > +
> > +	hid_hw_close(hdev);
> > +	mutex_lock(&ns2->lock);
> > +	WARN_ON(ns2->hdev !=3D hdev);
> > +	ns2->hdev =3D NULL;
> > +	mutex_unlock(&ns2->lock);
> > +	ida_free(&nintendo_player_id_allocator, ns2->player_id);
>=20
> If ida_alloc fails during probe, ns2->player_id remains at its default
> value of U32_MAX. When ida_free is called, the IDA framework enforces a
> check on the ID. Casting U32_MAX to a signed integer yields -1. Will this=

> trigger the BUG_ON and cause a kernel panic?

ida_free seems to return early on

if ((int)id < 0)
	return;

so that should be fine as is.

>=20
> > +	switch2_controller_put(ns2);
> > +	hid_hw_stop(hdev);
> > +}
> [ ... ]
> > diff --git a/drivers/input/joystick/nintendo-switch2-usb.c b/drivers/in=
put/joystick/nintendo-switch2-usb.c
> > new file mode 100644
> > index 0000000000000..ebd89d852e21a
> > --- /dev/null
> > +++ b/drivers/input/joystick/nintendo-switch2-usb.c
> [ ... ]
> > +static void switch2_bulk_in(struct urb *urb)
> > +{
> [ ... ]
> > +	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
> > +	for (i =3D 0; i < NS2_IN_URBS; i++) {
> > +		int err;
> > +		struct switch2_urb *ns2_urb;
> > +
> > +		if (ns2_usb->bulk_in[i].urb =3D=3D urb) {
> > +			ns2_usb->message_in =3D i;
>=20
> If multiple URBs complete in quick succession before the work item execut=
es,
> the message_in index is overwritten. Will this cause the work item to onl=
y
> process the last completed URB, leaving earlier URBs indefinitely active
> and leading to starvation of the URB pool?
>=20
> > +			continue;
> > +		}
> [ ... ]
> > +static int switch2_usb_probe(struct usb_interface *intf, const struct =
usb_device_id *id)
> > +{
> [ ... ]
> > +	ns2_usb->bulk_in[0].active =3D true;
> > +	ret =3D usb_submit_urb(ns2_usb->bulk_in[0].urb, GFP_ATOMIC);
> > +	if (ret < 0)
> > +		goto err_free_out;
> > +
> > +	init_usb_anchor(&ns2_usb->bulk_out_anchor);
> > +	spin_lock_init(&ns2_usb->bulk_out_lock);
> > +	init_usb_anchor(&ns2_usb->bulk_in_anchor);
> > +	spin_lock_init(&ns2_usb->bulk_in_lock);
> > +	INIT_WORK(&ns2_usb->message_in_work, switch2_usb_message_in_work);
>=20
> usb_submit_urb is invoked for bulk_in[0] before the initialization of the=

> spinlocks, anchors, and work struct. If the URB completes immediately, th=
e
> completion handler will execute and attempt to use uninitialized
> synchronization primitives. Can this cause a crash?

As the documentation for usb_submit_urb mentions that the call is async,
I assume that this is indeed a theoretical possibility.

>=20
> > +
> > +	usb_set_intfdata(intf, ns2_usb);
> [ ... ]
> > +err_kill_urb:
> > +	usb_kill_urb(ns2_usb->bulk_in[0].urb);
> > +err_free_out:
> > +	for (i =3D 0; i < NS2_OUT_URBS; i++) {
> > +		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_out[i]=
.data,
> > +			ns2_usb->bulk_out[i].urb->transfer_dma);
> > +		usb_free_urb(ns2_usb->bulk_out[i].urb);
> > +	}
> > +err_free_in:
> > +	for (i =3D 0; i < NS2_IN_URBS; i++) {
> > +		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_in[i].=
data,
> > +			ns2_usb->bulk_in[i].urb->transfer_dma);
>=20
> If usb_alloc_urb fails during the loop, it jumps to err_free_in. During
> cleanup, it accesses ns2_usb->bulk_in[i].urb->transfer_dma. Since urb is
> NULL for the failed index, will this trigger a NULL pointer dereference?

Yes, most likely we would need a new label for this case.

>=20
> > +		usb_free_urb(ns2_usb->bulk_in[i].urb);
> > +	}
> > +	devm_kfree(&intf->dev, ns2_usb);
> > +
> > +	return ret;
> > +}
> > +
> > +static void switch2_usb_disconnect(struct usb_interface *intf)
> > +{
> > +	struct switch2_usb *ns2_usb =3D usb_get_intfdata(intf);
> > +	unsigned long flags;
> > +	int i;
> > +
> > +	spin_lock_irqsave(&ns2_usb->bulk_out_lock, flags);
> > +	usb_kill_anchored_urbs(&ns2_usb->bulk_out_anchor);
>=20
> Both usb_kill_anchored_urbs and cancel_work_sync can sleep. Is it safe to=

> call them while holding a spinlock?

According to some googling, this indeed seems to be an isuse. The
non-sleeping way to cancel transfer requests would be to use
https://www.kernel.org/doc/html/v6.1/driver-api/usb/usb.html#c.usb_unlink_a=
nchored_urbs


>=20
> > +	for (i =3D 0; i < NS2_OUT_URBS; i++) {
> > +		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_out[i]=
.data,
> > +			ns2_usb->bulk_out[i].urb->transfer_dma);
> > +		usb_free_urb(ns2_usb->bulk_out[i].urb);
> > +	}
> > +	spin_unlock_irqrestore(&ns2_usb->bulk_out_lock, flags);
> > +
> > +	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
> > +	usb_kill_anchored_urbs(&ns2_usb->bulk_in_anchor);
> > +	cancel_work_sync(&ns2_usb->message_in_work);
>=20
> Furthermore, cancel_work_sync waits for message_in_work which attempts to=

> acquire bulk_in_lock. Does this cause a deadlock since the lock is alread=
y
> held by the disconnecting thread?

Yes, this looks like a real concern as well.

Cheers,
Silvan

>=20
> > +	for (i =3D 0; i < NS2_IN_URBS; i++) {
