Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D944B30ACF1
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 04:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780910; cv=pass; b=s2xHpGtfFx3FkLPY82xR4lSV4FizNthpF9nbs64ZP4N7UkNkSkScMhjeTWZcxXqNNEDX5/r9ODEySr3vokIduM1MZXjfIo7gGOb6WSZVR91rnmKc25HY5IBlFKIMd79Czy2lG+kiAARPZVub68vRByRGa4AXwHEkhXRyzuPuJno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780910; c=relaxed/simple;
	bh=9vx/VYo+6G8iZ3jiBXE658v2YHNsnAQSc4/dQn2+zkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfY05iL/oiiymjbtKjxU9tnaguvQ1LnY3AVHhF2Gl90c2A9pZ2y9Zw6P0x27Sw8FgLptylpm1XwfEtTfHi0+zg4FpX7C6E3s1A5yD2L60Llr+M5TD8foYIpZ1/snyQ8fZBpVAZMQ5fFisnV8xyI4vp8YJMsB2oB+mtiivFj/PjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htkAznzG; arc=pass smtp.client-ip=74.125.231.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htkAznzG"
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-824413e10dcso604662a34.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 21:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791780908; cv=none;
        d=google.com; s=arc-20260327;
        b=PR63xMmEKdK0zo5TYQQyMc+r8cwW0yfdy5pS/cHXHr06lpevYlemZIATUmS2e6oyAf
         McYALDrFAGeEhZpIQSaLl/4g/jXWifLl6Aa+WKjbdGT6UTuCA7urw+NbOQl98EHGlroP
         T54p+FRK2zz22uhXmurcmvWAHLuSZ57QYPlf7YoqRuBvT9sf6M7LIMlscDQTw/VttOSy
         uRLYm0niqHICHCtSJxH8ZzCJh+jOQPMwjm5hIHd2DUHzEPyHRL2n4e6Qv6wQ8NVYk67O
         BO7n0LuSTRwHmdpLi7TJhdrj6czRWqFloaZiyqa6r3NkQmmIcHZ5b6EqThAnBlEicUlx
         B2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aqvyDxeOl1wvCDEtRUYDI2YTDHjt1RCV2NsQZH4A4Cs=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=cexuQLBA8PQUQ+LDS9La1NUEdqKg/9+I2wcu3b5JBpbJGqsezWgnlbDsTM7qBW6Ods
         nyVjBerxtozMlakRpRhNEaekr7PfHx52uIcMtPhBBJF9hjwHuOEIpx4IO8PI6IhYq1ZL
         wjPSwEUFfoaY33J3eFPPsAzCIVT3qZYVHMlRt5j5fvg/+c8SVoQLlJQlvDVplvKmo3di
         kWY2z6WEgl/QLCvnP5KHIHg2s0P8JF0oVFsZcph5XNaZmmfxgRDKaoM7cC7+NCKiQ0KL
         ISsLuUmmD5P6O/TdRrJwwY09USGg0pijfAQl2lYecLPSJ28rmS87zx4Ray1XBtNRwlAB
         CKsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780908; x=1792385708; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aqvyDxeOl1wvCDEtRUYDI2YTDHjt1RCV2NsQZH4A4Cs=;
        b=htkAznzGFtY+o8mVH9se7CtQCeWC/7sHHMxbDNuYNuE+PX9ufE97B2ToRweU5jNWc0
         9jYDoSx1ipp0NZNBneHDiWV7PFt3f/swx79JEN17NldEcxobG3lnhnKvRhcoaBNiXrqV
         GoZ/pZtbginNdJ1ov1yF1sFAG7b82bMLGf36EVTQ8rxDYLA7mH4HyxupMiU57WtPePjX
         n2w9WQvJsh1IVRP/t0CORDbhixAg8Zw4F0MSH4qax8v0QJ+/d/GIHF1wFW9kkrNOZY0o
         S68udUZ4vJ6J01HN+7OE95CetzNNP473wJGW3h2LKwTxI4qps4pRlYZplx1M6dk3tr+F
         ci/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780908; x=1792385708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aqvyDxeOl1wvCDEtRUYDI2YTDHjt1RCV2NsQZH4A4Cs=;
        b=wtPn1ayJAoJKp8aKRapXmdAlRYx8H95/2+koPe52RmsIIi0lNPmK2WCF1re2c0Rc59
         kKzQveyus2f4DmRtLGRTCbgSWPWuT/Xsn590SV3Dt1EDgwGw/NJobDoY5ELFCeFtZ3B9
         0wlqR4lkLkorVU6zsGdWyl5r/OGQhC4S2+mpXHchQV7tyCnWOOtncQyYNXXYIvEaK4WI
         uNUbeA7+A1rCFisWt2sJRtrrvZnzNMkfZL6SdHL6jfNbD91mRX1L9C0vMgWQdLsLJi0R
         BSA9XEfngdKsooxvzXuVlAcuvT9V8A4NEY+kuEDerQvb3Kn/j/6183WQv2KW5gHSE5/s
         TXhQ==
X-Gm-Message-State: AFq9FYLWCM0dTEQ4vUYLEd6hPmx7kh3lRJkg126KsDK5IRb6Y67TR/jd
	c+UYdKnmYo0C4cI3e5NMxL04BRJ2G3bZRxFRwO9HqD6cDgGEkUoB/3ru1P4/cr6lxV6l0J7J5/P
	CRTjrQYYthLfSXzbtyu4BGOkwfsGgYZZHWzQQ+4DKEA==
X-Gm-Gg: AYBFou153XAjNIwpbXQkQog3+cxNMBZEgc9u4ULYlA4MNiFTfr67lpVbDM9dvdZqjyX
	wTqeyvroWK7tph6/P4cs7nc1AoOjEkYR94XYXKswiu/yLiSRubxJ/dFk2Ry/YUyix+I556RBhD8
	05Wt6jdXdwDUXVED/WLvh2uHSSpSJJdU10KfZGja3JZxnp3AT3PQvp4+r4YWEiFNUqibQEH2i3J
	bXGyFTq2+V6KaSlisklf4fIztz56NRhEYZ7GX05UzxeBBgyXhEJjrzRhfWxrrJgQSPDNE1bbqFH
	16k1WtzojERY5GuT3Qr45wl6YT3zyaOx5G3fF9GHQgjVaUgL/KbLIuoK4Do5CnQOHUZZMCpWy0I
	7uGD59UKJD0OsZw==
X-Received: by 2002:a05:6808:308b:b0:4e8:e664:f268 with SMTP id
 5614622812f47-50c52f1b32bmr8648086b6e.25.1791780907663; Sun, 11 Oct 2026
 21:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011035150.53315-1-xinsheng.zhu.ny@gmail.com> <sashiko-outbox-167584@kernel.org>
In-Reply-To: <sashiko-outbox-167584@kernel.org>
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
Date: Mon, 12 Oct 2026 00:54:55 -0400
X-Gm-Features: AclHuK9wQ_vVEXntxeqyIN1mfTO85kGFLtSXc3BvcstRXkNZqeUsWwxQu9E5AfQ
Message-ID: <CAFGKm+xW=UW66mQim2oLywHvv+pNdppAg-4qB9ZhhLKqAta8Ew@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> Pre-errata devices typically return a 26-byte structure
> instead of the full 28-byte structure.

The NTB parameter structure was already 28 bytes before the CDC
NCM 1.0 Errata. Issue K of CDC NCM 1.0 Errata [1] repurposed the
existing two-byte reserved field at offset 26 as wNtbOutMaxDatagrams;
it did not extend the structure from 26 to 28 bytes.

The driver comment says that "devices prior to NCM Errata shall set
this field to zero", not omit it from the response. A complete 28-byte
response with the last two bytes set to zero still passes the new length
check to avoid short read and uses the existing tx_max_datagrams
fallback later.

The patch does reject an actual 26-byte response, so compatibility
would be a concern if devices previously supported by the driver
return exactly that length of 26 bytes. However, the quoted
comment does not establish that such a response is the pre-errata
format.

This response was assisted by LLM.

[1] CDC NCM 1.0 Errata, Issue K:
https://www.usb.org/sites/default/files/NCM10_012011.zip

Thanks,
Xinsheng

On Sun, Oct 11, 2026 at 11:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] usbnet: cdc_ncm: strict 28-byte length check breaks pre-errata 2=
6-byte hardware
> --
>
> commit 21684fc876b53044a42f2941b653d84cd5d8ed14
> Author: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
> net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
>
> This patch updates the initialization sequence to strictly validate the
> length of the GET_NTB_PARAMETERS response. Instead of only checking for
> negative errors, it requires the response to exactly match the 28-byte
> size of the ncm_parm structure to avoid using zero-filled parameters.
>
> Link: https://lore.kernel.org/netdev/20261005041525.49111-1-xinsheng.zhu.=
ny@gmail.com/
>
> > diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> > --- a/drivers/net/usb/cdc_ncm.c
> > +++ b/drivers/net/usb/cdc_ncm.c
> > @@ -524,9 +524,9 @@ static int cdc_ncm_init(struct usbnet *dev)
> >                             |USB_RECIP_INTERFACE,
> >                             0, iface_no, &ctx->ncm_parm,
> >                             sizeof(ctx->ncm_parm));
> > -     if (err < 0) {
> > +     if (err !=3D sizeof(ctx->ncm_parm)) {
>
> [Severity: High]
> Could this exact length check unconditionally fail on pre-errata CDC NCM =
1.0
> devices?
>
> According to the driver's fallback logic further down in cdc_ncm_init(),
> "devices prior to NCM Errata shall set this field to zero" when referring=
 to
> wNtbOutMaxDatagrams. Pre-errata devices typically return a 26-byte struct=
ure
> instead of the full 28-byte structure.
>
> Previously, with the leniency of checking if err is negative, a 26-byte r=
ead
> would succeed and the kzalloc-backed ctx would safely leave the trailing
> missing fields as zero. By requiring exactly 28 bytes, does this patch
> unintentionally reject valid 26-byte responses from legacy hardware with =
-EIO,
> preventing probe entirely on those devices?
>
> >               dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
> > -             return err; /* GET_NTB_PARAMETERS is required */
> > +             return err < 0 ? err : -EIO; /* GET_NTB_PARAMETERS is req=
uired */
> >       }
> >
> >       /* set CRC Mode */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011035150.53=
315-1-xinsheng.zhu.ny@gmail.com?part=3D1
