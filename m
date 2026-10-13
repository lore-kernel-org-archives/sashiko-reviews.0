Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAADC544898
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932290; cv=pass; b=kZ8Fr0bEXy4z3wMDkLsuQz+93U7M0JzD+KQ0kiEpCpUnjLD7FEP0s9HIU54e8rZ7ktKBL9dDNMJ3cGBfldFnyd7WAsJ8J1MZgjbPKY4L8bhb34f7MTYrVFITD2bpR7jfYDMbvshRKGGstTzDNJLpHqJiDEoybhCvkFxTiWBX+BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932290; c=relaxed/simple;
	bh=0EpohbfYukostjZXI2ncT+Tc3ZmFCLMbMduDseGX9/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X15z/ZuNGIsXD0RoyxsQLflhc6OX3f+Pjq5LSi6HM1z2bNUQpDETgKaKCXE3lTsSDAMGTHdkiBc9tbwJAzU88GdH4GIBCwrm4s2xAQri1CtpU4hFrexlZXL3i53FEn+Op7JPqiX/2adLpcMs7AXm+6Akk0nzFy/85dKqnXxppNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bvRt2f9X; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bvRt2f9X"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab43af5e97so34643827b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791932287; cv=none;
        d=google.com; s=arc-20260327;
        b=WcCJFvM3WwTlD5NfltFObvvEzJP2/scrmQTpHMeRam4axrS8O3sVzDTpRF1Vpig3sN
         7mGSwWmEexnCIV7Gvpkzk60y/HIsxIGCEvXcU5QpXa45FcOvlfsawZkdBPhYwUDqJ42J
         C9G7XlC/T6ecVP7kDQTT5b+Nuso9sIuIfYTygNEbQfyjm+yqbX9ufGDUrkimruW1g3l9
         1H0TIwv3xz/vMSAG0IRfw7YFdfEd1cb2uTEkHjnZODN1bYpq6+BLqrx4IxTpI5YpH8pS
         N9W/25uOwtZtCVBxcYyNmNOQN5GO+G9bJcQPZgKNNQBdDE+jzAqanLMdYkQfc2BXZGYe
         BXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNT5k/R5hoaf9iRJyFQonm0fN6tqHDSkSoHBE1CtQE8=;
        fh=kt9uZKYVzMe1fIpqPMaN+ALLVNcFaK2DXrt/OMnvjME=;
        b=G5UfYEx5pP3qL7e5e/wiJb7e2eCfcuGX8pvwk05o5a66lnfm9CVwo/7CNHKhEXEFCd
         ny7tUTPBGoahHfOeSYdQ09Zo7J3KRZ2kV54P1KZOWh/jpyq6iQX18t52aYOeo2pqFZth
         Y8oPmrRTFWFChKtghBv46XBdJ+brv5dCg7aql/aDYzdbo3RybBEPHbUwqw3ofDLIHxiU
         qD+3INxLz/ji0BmwhSB4giDwaufuWPBKpebY8qjeYaJC+xiuxQeY2zO0tn5dCj0nckli
         xESR2nnJY0ouq5HULr7kXml5/U7kpHuxnWBj51bvt/ZtNnEybyTU+bIHqtodog13cAip
         EM5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791932287; x=1792537087; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNT5k/R5hoaf9iRJyFQonm0fN6tqHDSkSoHBE1CtQE8=;
        b=bvRt2f9XdTcG/7ZKbHdRHMU3M8MWnK4v+xvWJcQoj0YpM5s1T0R5jWhP/6flq/JQam
         YY8ltmZe552KHhPo8DDMusu9upo9SCM6cDpfy0xHJc7TiPWxsSnR9VU1OfGhRq3IkAGz
         VRdNQHtIcNu0pKQfXaeSh/e0kzeA6RNLI21rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791932287; x=1792537087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNT5k/R5hoaf9iRJyFQonm0fN6tqHDSkSoHBE1CtQE8=;
        b=WO8PnHVi1+ONgKIqn5NbbUC+/1rVWedW7WPbu/uDvljLcvFkSjnbSoz5+sr4o4r0xd
         zjJdq9fGJebb39kYlyb5seQGiNnra14MEs/gbMHezixf590e9dXxyfbQGFZ6T9jV7aOD
         sWQ7jfSmka6gXgWUxSbFRXCpTcBbcHsumDJPvBkCNO413z9nHjt8/Hs9BNV4b11K8FpE
         g2VvcgC/BIVn0i7l7NQNjP8SChVMnjgRZY+ZXICWORAEyeSC4tgcJcWxBxd3LHmNIpvP
         Vp3lv50OpkqUaha/E0bVRicArJofkFsWeBw4lAjW/AwdFt6+U4ELJnjoViXDpYg3nhcn
         0zDg==
X-Gm-Message-State: AFq9FYJBzJkSc+k3qr2nQ8qpZk5/rn4VrxNZRfu1qcvlNSDcqGZJCfhd
	+ZTenRSlRZDDbqGB7Le2OjNMdhuJuMxjLCSOjichvmSqIKFqALw2gqqSQ0n3+wikeu+32PXtZPK
	eEsTkOzrUztWigKBcYYLJgjTqCQ+0DcMhVJEMxRj+58fzIlQNZ7E4iw==
X-Gm-Gg: AYBFou1ZY+bxtMiwlPLgUNQiWZ/6WrO7i4nA2JF9Gbqsh6YrGZJXhyPqwGyDlEHnfTI
	TLAVi5UZlGoQo9ASKaliQb+sSyB0WfSIylZjx4hzR5cHpNQ1QXdKccQ1Wp7hVbbAOTZHHvriAxh
	ibvWuXc6R4Q94k2p+9FFtSluU1fftcYS8Bx7dC5RAtM5qM2VH38wMgmO1B9vEt1K/mGgK0aOmVu
	4vThch8i7dWsLdjwrtucXDXv3zydI58Fs33qnBErdKaL7Z7G4UjzEwlel4PhiREOIR+mvvwIO/d
	ZkzZ6sY9RSfHq54QPrDIyklizZOXeaVi5YTmY1oKD/a4uW7qcHYbB6AjUul1Sv1exqOBrMA/k/B
	H357DqDzSUA==
X-Received: by 2002:a05:690c:47c4:b0:8ac:927:f7e5 with SMTP id
 00721157ae682-8b07ed0a2e1mr37669057b3.10.1791932287599; Tue, 13 Oct 2026
 15:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-10-384af01da3ee@chromium.org> <sashiko-outbox-166155@kernel.org>
In-Reply-To: <sashiko-outbox-166155@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:57:56 -0700
X-Gm-Features: AclHuK81HkBfvQ90JSsC-kMkz_kzpA8f9XGiSlSkqkbfMIOwnBJRPKPpuZiMjK8
Message-ID: <CAEe3GZGdbXdbqLjAmubh6EwdZ=FgzSDphmTy6YR53PySnH4cvQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] HID: spi-hid: add power management implementation
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] spi-hid: hid_driver_reset_resume() races with error recovery d=
uring resume
> --
>
> commit e43c402ebe88a8dd98c0bab5a81f64d825faf560
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
>     HID: spi-hid: add power management implementation
>
> This commit implements power management callbacks for the HID over SPI
> driver. It introduces suspend and resume operations, handling device
> power state and reset coordination during system transitions.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index f4e9b4e1294ed..66bfc251bd915 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > +static int spi_hid_resume(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
> > +     bool was_reset =3D false;
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     if (test_bit(SPI_HID_DEAD, &shid->flags)) {
> [ ... ]
> > +     enable_irq(shid->spi->irq);
> > +
> > +     /*
> > +      * For devices that may wake up, process work that was pending wh=
en
> > +      * suspend cancelled reset_work. Otherwise suspend already droppe=
d it.
> > +      */
> > +     if (test_bit(SPI_HID_RESET_RESPONSE, &shid->flags) ||
> > +         test_bit(SPI_HID_CREATE_DEVICE, &shid->flags) ||
> > +         test_bit(SPI_HID_ERROR, &shid->flags))
> > +             schedule_work(&shid->reset_work);
> > +
> > +     if (shid->hid) {
> > +             if (was_reset)
> > +                     spi_hid_wait_for_reset(shid);
> > +             error =3D hid_driver_reset_resume(shid->hid);
>
> [Severity: Medium]
> Does hid_driver_reset_resume() race with error recovery here?
>
> In spi_hid_resume() (drivers/hid/spi-hid/spi-hid-core.c), the power_lock =
is
> acquired at the beginning of the function and held until it returns.
>
> If a wakeup-capable device suspends while an error recovery is pending
> (the SPI_HID_ERROR flag is set), spi_hid_suspend() cancels reset_work and
> leaves the device powered on.
>
> During system resume, spi_hid_resume() reschedules reset_work to handle t=
he
> pending error. However, because the device was left powered on, was_reset=
 is
> false, causing spi_hid_resume() to skip spi_hid_wait_for_reset().
>
> It then immediately calls hid_driver_reset_resume() while still holding
> power_lock. Because reset_work requires power_lock to execute
> spi_hid_error_handler(), the scheduled error recovery is blocked until
> spi_hid_resume() returns.
>
> Consequently, hid_driver_reset_resume() attempts to communicate with the
> device synchronously while it is physically still in an unresponsive erro=
r
> state, which will time out or fail, aborting the device resume.

This needs an error to be pending exactly at suspend on a wakeup-enabled
device. Error recovery still runs right after resume, so I'd rather keep
the resume path simple.

>
> > +             if (error) {
> > +                     dev_err(dev, "%s: failed to reset resume hid driv=
er: %d\n",
> > +                             __func__, error);
> > +                     return error;
> > +             }
> > +     }
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D10
