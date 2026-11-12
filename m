Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510234;
	b=kjNL+icCBcR0MVUJqrMFufBf1sgHy75aLNXsHNHUP9lR2F6s2GYcRO8sMJmT4kVAdSyM
	 iDw2YYUWkq0KF0+Gcm/OTGv10oNMOm32GAuug1cA/CApkEBzHyKGMDmjKkL0bPtdcxTeT
	 FOztC4IjtNgc+E7NLEz3ic9S17ZDC9dsvYC1bzjcIVjDb2yFBdCkDPFTjcwtYFD5ml2Jp
	 1QGUwjJym5wF6Wpb6A/ZoOT9npyDzzjqYwnA/Zr9NRQBxSMzlg3lh7dZK7vkp9fxmkLnv
	 xP8q/JZaDgUJNtk8Y8F36Crxqrvxb+oOsAEaBMW7LBnVxQqUExiEAXcGBORa8uH6sIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP;
	bh=34UOelsS1u8J1Uax+iSptlCYL+hzY+Ctl8Zrfoy2beI=;
	b=mJTFPA340+oCdA/HL88Ej0Zf9bny641aliRItJyFjGDaLW3Fh/qe74Qx7xpKIT/jA2FF
	 Y8wwhfd+t6hCTzd7EhOe2ucq6STssq9DXO35OxIyPwrio/zhnQrkPNLKMxYx/GtDm+gGz
	 RVsJfAt8zS1Ex4Wdb0B7VJBh6spTP7UCg/2UYfjT6L6NbHFGqnjUgnWtDzUJYsk2l0pE6
	 KFztcbbYr7MMWce+bON1hF68nniildd/24X0djplm71IewBkHL4A6kjecsXgYuRqLIHNp
	 JyGllwjZksJKb8l3flsMgsevBB3YfWU6XMT6jIhRq0Kxg5Z1cer02hathS5M/5+zXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.de;
	spf=pass smtp.mailfrom=posteo.de;
	dkim=pass header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=MTKfHkLr;
	arc=none smtp.remote-ip=185.67.36.66
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9D606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 19:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256 header.s=1984.8680eb header.b=MTKfHkLr
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4CB0C240101
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 20:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1794510231;
	bh=34UOelsS1u8J1Uax+iSptlCYL+hzY+Ctl8Zrfoy2beI=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=MTKfHkLrUB9e6B15w0F22opC06VcAJd1ydSpfvLnR6643YBgVnLf+7sViZP/yrcqM
	 oTn4V1BoVM3tfoZXI/9QEWXxVjgVNklFwwPxCto49gdAtNKOJL4q8zDmlQqKfuubA/
	 j5znxSMp3yS4Mk9czxaFp8/rqXiYaXSU4WHTFBudDHnleagk0qe1xjQWkOitl0gLLH
	 MsTfM+DekI2tJBz+lgRnvSZvwTdP3koMNuJvasc8gPFu6I3kOoMNUe7IrHvRj4WJFu
	 Cc+briRs+VDSTU9iNwNlBRq8h5WrCfIN6JX3PqYqQN9SZTCylEuRceU6+593ZqashM
	 gFO1+hF4zw5Rg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jQVD65HZ3z6txj;
	Thu, 12 Nov 2026 20:03:50 +0100 (CET)
Message-ID: <62071b5d53e8b7674cec5d8d1f496331c7eaeda8.camel@posteo.de>
Subject: Re: [PATCH v6 1/4] tty: serdev: Add mutex lock
From: Markus Probst <markus.probst@posteo.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org, ojeda@kernel.org, gary@garyguo.net
Date: Thu, 12 Nov 2026 19:03:51 +0000
In-Reply-To: <sashiko-outbox-211656@kernel.org>
References: 
	<20261112-rust_serdev_probe_refactor-v6-0-3568ed56264c@posteo.de>
	 <20261112-rust_serdev_probe_refactor-v6-1-3568ed56264c@posteo.de>
	 <sashiko-outbox-211656@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IdMqXOY+BoFXe+5ky473"
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-IdMqXOY+BoFXe+5ky473
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-11-12 at 17:58 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] tty: serdev: late close in serdev_device_remove() and missed
>   driver unbind
> - [High] tty: serdev: returning -EALREADY in ttyport_open() breaks
>   hci_mrvl probe
> - [Low] tty: serdev: dev_WARN() used instead of dev_warn() in
>   serdev_device_remove()
> --
>=20
> commit 5353012a0aab4d9161723d4449dfeeb88d3f481c
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> tty: serdev: Add mutex lock
>=20
> This commit adds mutex locking to serdev-ttyport to serialize open, close=
,
> and receive operations, returns -EALREADY on duplicate opens, makes closi=
ng
> an already-closed device a no-op, and closes the device with a warning in
> serdev_device_remove() if left open.
>=20
> > diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> > index 7500efcdfc218..86d9cf8215edc 100644
> > --- a/drivers/tty/serdev/core.c
> > +++ b/drivers/tty/serdev/core.c
> > @@ -142,6 +142,13 @@ void serdev_device_remove(struct serdev_device *se=
rdev)
> >  	struct serdev_controller *ctrl =3D serdev->ctrl;
> > =20
> >  	device_unregister(&serdev->dev);
> > +
> > +	/* Warn if driver did not close the serial device. */
> > +	if (ctrl->ops->close && ctrl->ops->close(ctrl)) {
>=20
> [Severity: High]
> Does closing the controller after device_unregister(&serdev->dev) leave a
> use-after-free window on serdev and its devres data?
Yes, pretty much the reason for the WARN. See below.
>=20
> When a child driver leaves the device open, SERPORT_ACTIVE remains set
> while device_unregister() runs device_unbind_cleanup() (freeing devm
> resources and clearing drvdata) and put_device() -> serdev_device_release=
()
> -> kfree(serdev), before ctrl->ops->close(ctrl) clears SERPORT_ACTIVE and
> ctrl->serdev is set to NULL:
>=20
> CPU0                                  CPU1
> serdev_device_remove()
>   device_unregister(&serdev->dev)
>     ...
>     device_unbind_cleanup()
>     kfree(serdev)
>                                       ttyport_receive_buf()
>                                         serdev_controller_receive_buf()
>                                           serdev =3D ctrl->serdev;
>                                           serdev->ops->receive_buf(serdev=
, ...)
>                                             <-- use-after-free
>   ctrl->ops->close(ctrl)
>   ctrl->serdev =3D NULL
>=20
> In addition, serdev_device_remove() only runs when the struct serdev_devi=
ce
> itself is unregistered, not when a client driver is unbound via
> serdev_drv_remove() (e.g. module unload or sysfs unbind).  If a driver
> leaves the port open across unbind, this fallback close never runs,
> leaving SERPORT_ACTIVE set with NULL drvdata and causing any later re-pro=
be
> to fail in serdev_device_open() with -EALREADY.
>=20
> > +		dev_WARN(&ctrl->dev, "Child driver did not close the serial device")=
;
> > +		pm_runtime_put(&ctrl->dev);
> > +	}
Not sure. Can be moved later on if the case. The check also only makes
sense once devm has been run (which likely is not the case inside
`serdev_drv_remove` yet).

>=20
> [Severity: Low]
> As reported by Greg Kroah-Hartman on v4 [1], this should log a normal
> kernel warning rather than a WARN_ON() splat.  dev_WARN() expands to
> WARN(1, ...), which still triggers a backtrace and crashes systems with
> panic_on_warn; dev_warn() (with a trailing newline) logs at KERN_WARNING
> without a WARN trap.
Intentional.

This should NEVER happen, so a backtrace is wanted in order to fix it.
Before closing the device (partially recovering), there is a window in
which the device is open and resources are already cleaned up. Thus a
call to `receive_buf` (which can happen at this stage if not closed),
will likely result in a use-after-free or nullptr dereference
vulnerability.

If panic_on_warn is enabled, the user deliberately choose to panic on
this event.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/s=
erdev-ttyport.c
> > index b6638f9f40d2d..17c18d4b0cb8f 100644
> > --- a/drivers/tty/serdev/serdev-ttyport.c
> > +++ b/drivers/tty/serdev/serdev-ttyport.c
> [ ... ]
> > @@ -99,14 +103,23 @@ static int ttyport_open(struct serdev_controller *=
ctrl)
> >  	struct ktermios ktermios;
> >  	int ret;
> > =20
> > +	mutex_lock(&serport->lock);
> > +
> > +	if (test_bit(SERPORT_ACTIVE, &serport->flags)) {
> > +		ret =3D -EALREADY;
> > +		goto err_flags_unlock;
> > +	}
>=20
> [Severity: High]
> Does returning -EALREADY here break probing of Marvell serdev Bluetooth
> devices in drivers/bluetooth/hci_mrvl.c?
>=20
> During probe, mrvl_serdev_probe() calls hci_uart_register_device() ->
> hci_uart_register_device_priv(), which opens hu->serdev and then calls
> p->open(hu):
>=20
> drivers/bluetooth/hci_serdev.c:hci_uart_register_device_priv() {
> 	...
> 	err =3D serdev_device_open(hu->serdev);
> 	if (err)
> 		goto err_rwsem;
>=20
> 	err =3D p->open(hu);
> 	if (err)
> 		goto err_open;
> 	...
> }
>=20
> mrvl_open() then calls serdev_device_open(hu->serdev) a second time:
>=20
> drivers/bluetooth/hci_mrvl.c:mrvl_open() {
> 	...
> 	if (hu->serdev) {
> 		ret =3D serdev_device_open(hu->serdev);
> 		if (ret)
> 			goto err;
> 	}
> 	...
> }
>=20
> With ttyport_open() returning -EALREADY when SERPORT_ACTIVE is already se=
t,
> mrvl_open() and mrvl_serdev_probe() will unconditionally fail.
I am currently investigating this issue, see

https://lore.kernel.org/all/341e56b1ff7d8a5b109e26e30dfed61faa54d603.camel@=
posteo.de/

>=20
> [1] https://lore.kernel.org/r/2026101758-confidant-comprised-e1c0@gregkh

--=-IdMqXOY+BoFXe+5ky473
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmr2DZYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSqzgQAJQmKTIpx8no8/fj63SQ
egzrxg/cRwaE0jY6XjWofcLaxBf+eV4CMj/SdYcMMy5vxEicXDizlLwstfyTC7od
dQUYUuxsrWsdSqq42InSZCc4aPLLHfpHSIw1JwRcnTJ5H6kiA2kc23BJiHevH7ii
nBgdk99zTBC1lkTB60AkCojBFO8Qr6kTCCQhAxSrWgXQKxY3v4XiTTpNwXKRa63c
hCbijIiW9ybsMRWvI/l+EHr/WkOJfAgbM/fUUeLMmHe2us9U9ZLOqFTdpCxdUsay
nzIT+TiuqANLUS1LGbXuxPBesrieIc0XgH/n10FXNECPisLlNOq/UdmZpqjvjUAF
AYvtDcP1gqeqUbDtyCvXX1xcafQssmAm7wCTtlR7tYBY1bx9XZAgFUtzKnj/JZBi
Xh1Jic+WfRH6HyVLVt1Vm2QACZZ4YZJC6UZAeTS1zJoynX+ZQbVs1v4zglhtNFDZ
FLkwZgeq25gqlfTncDrVSDgtZ/pWjQswKCkF8FUEI2Gw2pu6T4LOR714x3rUg4eb
0fsNmfmplPBXTft+hA0fBPo68pIza/hDagRsHCf5zzv8APzJaqYttMmabnQbDLZ0
n+W6TQc1uhDkx7vQc8d++LDLmGm/Kd9gVMxgYRJF6MTEIbN5cNuV+eWvEClvfCzV
xu4NIH+paL6eqsHQ5lLINelV
=PJhy
-----END PGP SIGNATURE-----

--=-IdMqXOY+BoFXe+5ky473--
