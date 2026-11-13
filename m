Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794568763;
	b=xXpZml2EaY6AZ17BJ6dYVy0YIIXs5Ih0Lc4P9aACnTRhJSCO9XrVBtjI7fJtLsa84+z7
	 zmG/cxA2D1iOSq6HIrt98OkgYgTY83fIwmpojfalzrWy26gf4aiQbjsl0GqUoXf6PCFJv
	 jwig6LFrMedFq6E5RynKw92G/YDCj5OEJE60HIImaQjTBbxiBqPgDUiRzSDpJxhZpETIg
	 V1mN1ou9WCev1KsZEgezi9Gv7P9ZH7w3eyVXCaORu9Y5RWqAvzmlinrIy3lJOX2/hhdQ5
	 7s0Yonhm2GeOh/7OONB7TdxVLcXvidgzQUHb0w/jSboXbdomlbQhXtbsT8sHhP5OwSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
	b=CScFDVAODZtAbPJX+H9VdKJu4VOtNN+nUQseBKoizheMdiiOqWBYeKfqhLQDyhlz2KQ/
	 OzyzDK0dhejhXBIrzEefTstXtSOkpAYwpHpyeV8cFu/BxveNtErRKxs9nGaR3ASJpuvqV
	 hE7d7MD3Ca3ZXbifL6VQMYOV8uU9nsyOOM00zt4RIONTTAiT3im0kDD7rF3tc9aPgxZOr
	 cVQvtBaJaFw2utOe8T+tSARjyAW47k2NIYbSK5ApJ7E4J3+i9lEhZJHnHdZaYqoHzjih0
	 l2N8giH8BLIBlPfy0BqFYjYCWYj5zHu23hPuZRL1D3SphYr4fuUzI3llmJXwIFha4ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BDLGgQp+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68E9606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 11:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68E9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BDLGgQp+
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso201010566b.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 03:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794568761; cv=none;
        d=google.com; s=arc-20260327;
        b=EA75hOyBiuxdb2yJGmJwNzl5QeymHz5ct+FyUGo76ky5t226I2m9tgUCZDpQBMHmZ6
         kWywtCNE6aBr6zRFDFwMFWIwF5thU2XMhqn+LaoaAwtMaqQDU4GY2uZMi0sqaQPwgfY/
         Dnr7zWJ67rB7UbH25otzkyGiR7w00I1Tb3gwZV15DfdYSjoGImTZlb51phf0bRuCGLm3
         CG1BfiT5cyue8dQ5OaQ2wLE8r6jLJQU4jBWRhkNUyaaJvv9akzsB1gcDgYrygtx0VrGw
         2sClKtYKhIJHVDBVTOOvnhPyFUaNcgtuJg3h13wqcd1DwotiDhQPPRCby9P9bI258rn5
         RB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=AXMpBgN9HSF45SsQK2xffcele+Au2VxEQPLvPxWdNRrc6fuIbNsFyqOtTWxj2hYgND
         NrydXwdwkdPFPvBfDyNhDygOjhAkeheOC8qDu0v5Dz2l8biRLtf448KqKTFsJgxLUUw+
         AbBHvcE/UFY4VM2CDxqfoJYCI3TkV00v/iLNfVBOMEPL9WfHsOa+MnT1ARdmtl1yXnE4
         cplxKbPPf9q58XUal2URSwrUbVd9zazCNV8T6xOod5wrstVtm/zdaOhgG6cOi0F7YFn9
         kjnAYSSXHluhzXON+zhqtVkFtQr32ecprczRcfEQ3Qcs2xoGBib2j2t9623BZiA+vn4P
         MYMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794568761; x=1795173561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
        b=BDLGgQp+/h0AjAAO89kk6OwMGvyBiw9i/WVPYRxHtmo99W3m/c3vsxj1d1onicDBas
         e224fiDjZTEOWMl1aGXKnMT9+tURMfpeF/yIUWeYfJg/dAwmZl+hyTf4BllVEqT6P2eS
         dfuT937SU79FUJMIqGk9A2wu7XAgRau7PATwkR19VUagzo5+CjPwEMkqfZfVLJaamn5X
         PKArwYndvrbSdTy8wPi0GnMwLUTAEzaowkSvL+/gM2AUViG8IvUqQpZyKGWHDwx1nExH
         lUguC+AAfu92NvyKmP5WwzYsXn15hMsVUe/Ps61Mr9vyqj0wiG9DvaRc33uabKGBgtLI
         UFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568761; x=1795173561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
        b=DEVM4uZqP7U3ZjdE/qrSxiwAtOxSVZLNEDBQeNEhEy/bCw2hrD/xjERqI8AHA3Bw5m
         TMVilnK4a/a1vkA6n70TD1Dv9wWCw0u1yOAO9M4vehLtYg1DqkBHYUpMinour5COc8/F
         YOWib+balMLNYR5luhfJCUQzsDk40qAGIO2+yspuALST3VIihGF5QBBXf9WqYrPVBh+N
         bRCBogQNiSgKd51NQiwfw0zrZk6QeG14Y8MdBMedro9nRTdxRGqXplnH3YfSBkv+QM/w
         eWFv8EaJoTZHhcUY3Zs4ZofsCIy+8npnddx/8FVo3p7W8Nnkqe9Td1+4mo+eTXyXJvN7
         bY4w==
X-Gm-Message-State: APuU4Z8/x4EqpmL8oimpEXlL0s9Z7YZbOC6A0WrFLKh4p4Ru50Sf+0dI
	I7+VDMmeJAzSTIVFhSpwAtKnCPuMYsqfOZjAXAikqogH49GL8JgMajD/rDNgUs8v+lU2duk46WM
	41f4uJ8dap/GDw6ikrDdw0bso+A9dpT1H5tXTWAU84wqoPvfXDLVyp+LarQ==
X-Gm-Gg: AYBFou3n23psV8CEVlaNa/uC91Xy0DR4RKSUFwswOvsuGJV/OFg3Wnu+pkEDdUkugYu
	E3p7/7Tg9oxugx7rSxh8YUqGcbIERmFPOnDaauNdUX7vT+cOOvadhYy2xBJJ6sGVVDgPxcI9/xo
	Yu6zYe7f1BPEBsRK4gry/5R/mBE6uQAdilo7Wu6k9fAaLBjAvFVNxMA0wvMJjAnjInhSNEfOjVD
	RF2XNEdu+IHR/V3rxmahII1b9J64Hf2Js05pbmBLEUP7xhK30BoAHeIIVWVHXn5gg3Oy09iUs4Y
	Q9mEh4kyW0lM2NgOWR6oTwuRoNkpJvoniKKHspjnblWQvqMKU5DpSs040NVl79CYLe6e2uXCT3l
	gN5Z6bG+OecexBTH6bzplXFgmyM9dErBDcMbkt9U8vlMsKGdP5l0hWN76Au7wNh8N+7Cx
X-Received: by 2002:a17:907:d29:b0:c4d:31ad:9de9 with SMTP id
 a640c23a62f3a-c50963b430dmr206562766b.42.1794568761017; Fri, 13 Nov 2026
 03:19:21 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net> <sashiko-outbox-212565@kernel.org>
In-Reply-To: <sashiko-outbox-212565@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 15:19:08 +0400
X-Gm-Features: AclHuK-FqQN5oUw9MnQi77vdHOak_yOmchgkwngpVp-7ydgu0G-GT1QAHVlaw28
Message-ID: <CAKTNdwFwHZ8cUNXhNJ0qRHECMV6Ab4CSXBsXiDFtP7=BR6tZVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] usb: gadget: udc: Decide on connecting in one place
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: gadget: udc: stale gadget->connected if pullup disable
>   fails on unbind
> --
>
> commit 8198ac49b976bc4f15b1f15c4abb55ae61ceb982
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: gadget: udc: Decide on connecting in one place
>
> This commit centralizes the UDC connection rules in
> usb_udc_update_connection_locked() so that gadget->connected only tracks
> whether the pullup is enabled.
>
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/cor=
e.c
> > index 84dc0820c2cb9..e592705de55e4 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> [ ... ]
> > @@ -1236,16 +1238,8 @@ static inline int usb_gadget_udc_start_locked(st=
ruct usb_udc *udc)
> >       }
> >
> >       ret =3D udc->gadget->ops->udc_start(udc->gadget, udc->driver);
> > -     if (!ret) {
> > +     if (!ret)
> >               udc->started =3D true;
> > -             /*
> > -              * The pullup is never enabled while the UDC is stopped, =
so any
> > -              * connection recorded meanwhile was only a request. Forg=
et it,
> > -              * so that the next usb_gadget_connect_locked() enables t=
he
> > -              * pullup rather than returning early.
> > -              */
> > -             udc->gadget->connected =3D false;
> > -     }
> >
> >       return ret;
> >  }
> [ ... ]
> > @@ -1733,15 +1729,17 @@ static void gadget_unbind_driver(struct device =
*dev)
> >
> >       dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->func=
tion);
> >
> > -     udc->allow_connect =3D false;
> > -     cancel_work_sync(&udc->vbus_work);
> >       mutex_lock(&udc->connect_lock);
> > -     usb_gadget_disconnect_locked(gadget);
> > +     udc->bound =3D false;
> > +     usb_udc_update_connection_locked(udc);
> >       usb_gadget_disable_async_callbacks(udc);
> >       if (gadget->irq)
> >               synchronize_irq(gadget->irq);
> >       mutex_unlock(&udc->connect_lock);
> >
> > +     /* A VBUS event can no longer connect the gadget, so just wait it=
 out */
> > +     cancel_work_sync(&udc->vbus_work);
>
> [Severity: Medium]
> Can gadget->connected stay set across unbind and prevent the next bound
> gadget driver from enabling the pullup?
>
> In usb_gadget_disconnect_locked(), gadget->connected is only cleared when
> gadget->ops->pullup(gadget, 0) returns 0, and some UDC drivers fail that
> call when VBUS is already inactive:
>
> drivers/usb/gadget/udc/fsl_udc_core.c:fsl_pullup() {
>         ...
>         if (!udc->vbus_active)
>                 return -EOPNOTSUPP;
>         ...
> }
>
> When that happens during gadget_unbind_driver(), neither
> usb_gadget_udc_stop_locked() nor usb_udc_forget_driver_locked() clears
> gadget->connected, and usb_gadget_udc_start_locked() no longer resets it
> either.  On the next gadget_bind_driver(), usb_gadget_connect_locked() se=
es
> gadget->connected =3D=3D 1 and returns early without calling
> gadget->ops->pullup(gadget, 1).
>
> Also, if vbus_work is pending when cancel_work_sync() runs after
> usb_gadget_disable_async_callbacks(), a lingering gadget->connected =3D=
=3D 1
> causes vbus_event_work() -> usb_gadget_disconnect_locked() to invoke
> driver->disconnect() after async callbacks have been disabled.

Looks valid. Will fix in the next version.

Best regards,
Alexey
