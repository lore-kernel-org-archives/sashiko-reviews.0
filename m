Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EE30AAA6
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752824; cv=pass; b=tR+tQxkj1W8IBCYeEGcx9aVdi/513XurQwuMbj+bUr9t/DC84C1BY2qNJ/RvIquNEBneCBHK3lv9QcdwanlTwL3qSX8iHdq4WoFdulpYdfVkjkQNsZ7nKL/em28FVFPakO4Xl3p+csZMoyweyRLo5dsDVnvaL3779ecz3w4v5IU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752824; c=relaxed/simple;
	bh=qGt0YsFYcN017fQvszpRHzy5hsd1xvba1wbomW7VY3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzcgFsrCLYpkpXMlZbVbr0PjH0jPVBiqVejAW8IdqkNOlkY0YhxpVNwvR+zVvAYFY7hZUwfYpJs4Q+3pAFRuqn65nM3cCUb42wo8gwlSqiRJb4aPEJ3eVPw8FYOwQ4mgzQ/qw3XPd9erLPbifjkMashheQdPY7zRbTSs/zVrZS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clA0nCNL; arc=pass smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clA0nCNL"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7ba99a2e56dso378646137.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 00:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752821; cv=none;
        d=google.com; s=arc-20260327;
        b=YfmNXkBSfrx6WEm8zfT5U4SowWiw/34hpqIvGHWV30zGbCdXNT27okxhdyi4IQldE3
         JKsZkl0tBfC5bp4jo+8txn/wALjCOlNIhSAHvYHr7OcnFZT+BCsc7MuJSYwWtfFH13cw
         X8kGQzoN1ZAXBcIi4geIw+ZiR9ubW6HDohnieKgoHslDiRrc50D0A8huQZFxGxA0YVED
         heR7T88atxQetih1QHLN50Dh6UtcTJSY/yrAKx26HQES8tg0WNA9nlx9H8vWLTOBJJGE
         55lIDacRHn6Qu9cV9T9Lk6iNlvK/4Dg3QVP298mlXunsRdP6ZQSdIcteSWu+W1Up49gA
         ISCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRhP5/3LMDdFdRUnOnnSO2A2XycO9Quxua+nOknp1LU=;
        fh=2xfOhBJyN5MrDXDnqEqgkqZlEOPXo6XBQo6m99gnAL4=;
        b=fkUo8LUG5AQLBC29a1hORvQQuug+4AImiZ71HcGgVehN2oW5aPY/WL/3YFpb23iXyk
         Sq4Anzq15cVUeumRO3zzmcXM/Iy+tTMKbHs+4VUWYe2QkbZ3mEaORJ63QXxDxiJ0s/s4
         71gEUdChWPY0Yr4VtDtyJ7JWwGNXrznFQWMgvslers7gTe53WbB2R1bUrVFlui0/P46k
         PyWU6w9SWCm9ygdkOeULu+GKDH7HDjGAuEoXviSPv0+LiEIQF+eEKR0b0NXZtnBaeLdm
         g5ENs9PYFztOxgTYTjouSfGTZO5PouzOjCx/edlwFV0CWAyVvyDfGLxLmM4RKItM9SB8
         nnsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752821; x=1791357621; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tRhP5/3LMDdFdRUnOnnSO2A2XycO9Quxua+nOknp1LU=;
        b=clA0nCNLmlc3VpQSmmnA/v08BAU+bmm+XGOeXtpaye/S0J4NR8MVUEut0f6QE+Elpu
         6GEzPdlt4erq11MfsLj1PuU4+rCCsrvy6BkeRhTOBQzREXbceIKClh8HMPK9qFuEzvym
         8Le2kwco7Lp6fZqBszwppKeW8SngvwjpYeF4S7U5m7ftWcCq1xs8oarROBsCbq9YL979
         VCS9GV8TaN9T0Q4XksoDxvNFVbP09kmxwkYLmIuRv+krW5Jp47gpSycRi5MxTE/PaWK0
         cvV4/NcWaI6nqXWboAnwikYJbkLKDnizYCexE6FXw4aImAffQ1tC5T+3QcnGe6k06d6y
         bB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752821; x=1791357621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRhP5/3LMDdFdRUnOnnSO2A2XycO9Quxua+nOknp1LU=;
        b=QT1Nq1VVitq/DihVY17ryhBxqugiO1tgvPoWq7Dl1xSVcGOQwSfmFDnxC00PivslfR
         vF6oxeoeisSCsTJ18UNKhaqYprjIEi4a9IBCzHAtaGyxBhPg4i3J28Ny3if4XddZJvrj
         SKLxmeiwOE+I8W3ftPwMVSFy7nxq5L35Avbeiyj7wSrJncebmSgbr6wjEqye26iKwc+7
         a7ZxcZ14VyyGm1V/XAmOh/jGT/ucDB3KFPTMG2z+g9KBt3/2ok3PRsrpRbOD191cHliO
         7C4QPJQVZOKxPsMBaoZyIgb17pl/L7x4k1geVZtiR6GYkvheY2MXJqeLIjzBdvVcmGQ9
         0FEQ==
X-Gm-Message-State: AFq9FYJxFRlRIx9O5retHVRdwQzFbSncfS9fIO1iGjApA+b1O4/bTvTP
	vLQKPDHziXEwfSUO+Z3eNAh2U6b/EEMAnqWLOZONH/rkmleuXlcyiTFgIw6Nw/z2qmv0SIjTDL0
	yL2o5Ce2QEtQN+1yYKKnLP09hyjZTQ7eB0U1GqgVmhQ==
X-Gm-Gg: AYBFou3Khi6LMJ/RcrQHzIabXs/B2xgOI6ZW/DKiw+dntTOCGAcXYTRocSuwB08MHPM
	YiFCLbUvsJHV9MPYqbfA/4GBLhC7VIUJKuVMZxjUtk75j7eweLBTJo+EX8baaWCXqeT8OQD9/ke
	wpYCpbHjEbuUUFcw7HVUJF263qBZYLKKQGb8uR7TcfTKzytbwOi13mOalvK26K3UepXJo7rK7ia
	iqH5ejirn9nUu+tkZLfUZIj23SHR8zNj1hSi7av1NJduyeifXnQgqodavIIB4UAtg2FxDkvdAwW
	q4iTu7kjI/bV0wOSlI0HxNbR9msiYmHSpCNAWR73zDx6t/qTrGdPnxdPMvTYA/7B2HSj9exMbvT
	VVbt+rsDfLJqAsumMa8SBWlOkE7sm3Pi+5F3AUMqcgciJPwBzz/onM6OktogPAkjVuyNR3NhKcA
	==
X-Received: by 2002:a05:6102:6a8b:b0:7a7:7961:b14d with SMTP id
 ada2fe7eead31-7be727addccmr57937137.12.1790752820234; Wed, 30 Sep 2026
 00:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-b4-elan2514-irq-route-v1-1-44671bf01d05@gmail.com> <20260930063500.7D2B31F00899@smtp.kernel.org>
In-Reply-To: <20260930063500.7D2B31F00899@smtp.kernel.org>
From: Waqar Gulzar <iamwaqargulzar@gmail.com>
Date: Wed, 30 Sep 2026 12:20:07 +0500
X-Gm-Features: AclHuK9IFTRHVM_07XLjX37kXd5ttmHGtWIewbnT6PdHeLfO8q_q-f65p6pYENE
Message-ID: <CADeB2Yr5WZ2mbWCv7YT4YWS-jaD=XvSXvyjffdsTFtwdg3ijow@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid-acpi: restore touchscreen IRQ routing on HP
 OmniBook X Flip 16
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 11:35, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] hid: i2c-hid-acpi: IRQ routing quirk bypassed on resume if wak=
eup enabled
> --
>
> commit c1ea0adbfc4956d2ccd0cfccdc56448c010e7ac2
> Author: Waqar Gulzar <iamwaqargulzar@gmail.com>
>
> HID: i2c-hid-acpi: restore touchscreen IRQ routing on HP OmniBook X Flip =
16
>
> The HP OmniBook X Flip 16 firmware disconnects the ELAN2514 touchscreen
> interrupt from the IO-APIC in its power resource _ON method, which Linux
> runs at probe and resume. This patch re-enables the routing through the
> firmware's own helper from i2c-hid-acpi's power_up hook.
>
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142384
> Link: https://github.com/testyfishy/hp-omnibook-flip16-touchscreen-fix
> Link: https://github.com/iamwaqargulzar/hp-omnibook-x-flip-16-linux-touch=
screen-pen-fix
>
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i=
2c-hid-acpi.c
> > index 9371db200fc4d..b6348ee3d422b 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
>
> [ ... ]
>
> > @@ -85,6 +140,9 @@ static int i2c_hid_acpi_probe(struct i2c_client *cli=
ent)
> >       ihid_acpi->adev =3D adev;
> >       ihid_acpi->ops.shutdown_tail =3D i2c_hid_acpi_shutdown_tail;
> >       ihid_acpi->ops.restore_sequence =3D i2c_hid_acpi_restore_sequence=
;
> > +     if (acpi_dev_hid_uid_match(ihid_acpi->adev, "ELAN2514", NULL) &&
> > +         dmi_check_system(i2c_hid_acpi_irq_route_dmi))
> > +             ihid_acpi->ops.power_up =3D i2c_hid_acpi_restore_irq_rout=
e;
>
> [Severity: Medium]
> Will this quirk be reliably applied on resume if the device has wakeup en=
abled?
>
> The quirk is hooked up to the power_up callback. However, in
> i2c_hid_core_resume() the core driver conditionally skips the power_up
> callback if wakeup is enabled:
>
> drivers/hid/i2c-hid/i2c-hid-core.c:i2c_hid_core_resume() {
>     ...
>         if (!device_may_wakeup(&client->dev))
>                 i2c_hid_core_power_up(ihid);
>     ...
> }
>
> If the user or system enables wakeup for the touchscreen,
> i2c_hid_core_resume() skips i2c_hid_core_power_up(). If the device's ACPI
> power resource was turned off during sleep, _ON will execute on resume an=
d
> break the IRQ routing again, but the power_up quirk will not run to fix i=
t.
>
> Does the quirk need to run unconditionally on resume instead of being tie=
d
> to the core's power management logic?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-b4-elan2=
514-irq-route-v1-1-44671bf01d05@gmail.com?part=3D1


> Will this quirk be reliably applied on resume if the device has wakeup en=
abled?

On the affected boards it cannot have wakeup enabled. The touchscreen's
ACPI device (\_SB.PC00.I2C4.TPL1) has no _PRW, so it is not wakeup-capable:
there is no power/wakeup attribute for the i2c client, it is not listed in
/proc/acpi/wakeup, and device_may_wakeup() is always false. So
i2c_hid_core_resume() always calls power_up here, which matches the test
result (the IRQ stays idle after s2idle resume).

I agree the dependency is implicit. If the maintainers prefer, I can send a
v2 that either documents this assumption in a comment or makes the routing
fix independent of the wakeup state.

Thanks,
Waqar
