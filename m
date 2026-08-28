Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B903EDAD2
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906752; cv=pass; b=KC2at/FcnriHcb6+25VRMaagDyoD7QCFVlnIT3gBAm62U+y94siNpdMZ7n52JWogdaTSvkeI7Ud1zkuUcLJO9eYeNBO3CUmpAT/9WNozPxMvcMlPU3k63TI0PYnmTivr9T2Ioy5/YZDmtS6vEsF6ugJiKr9IdBfe4JuIc5Z7tDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906752; c=relaxed/simple;
	bh=foMYCCJ+aKQqeLr03l4kG5PGTUXTArR/A61o6BzmI+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INvRUAnQNpO4EwpoVJZRJpML+qMtoDxp760tRtJAMwqwkW+qRI3KRfYLkspxHjjPNQUuoSYWvtGS+5YtRTSJXCL3QwUQq4RUTzB98L9g8AN0WOakys1LB2+/NiL4jsmtabbs64DNHz43AYel+JPSFxMHL6xCGkBpVTkyssPi0A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7Sduvua; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7Sduvua"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cd0e6fd80so5271016d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 01:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906750; cv=none;
        d=google.com; s=arc-20260327;
        b=pECC4br9K8aeLXo5HVF35WSztDJRKFWOHr72mHeCuo49b9HqUMZsz554Dpm1XsTXT7
         p1eKdZs8aY2oVwqJXdKBKt5eG/+bL0ZgqtrNyI3rkAu/TLy8Hg6OA/lI326v600Vw18u
         THAvIhW7mvzldfowj5iQhV+0hTNwuaatw0AQs7HSVhM1W4/ThhL/jIKapHACuJDhmiL+
         LYADq7FzQ63G9ICUmSTu61DwucSqr3Cg54rV/ASipoOOJH/V+xQyT3OfsImQOpbcz/Zj
         IFLVLcYt8GueWPUmCGA6Og6hiKV3tiMi2vJu8czGPWhKoyqgTn1GXI10f99pQsSzOZ8v
         W4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R+vuGpXV32M//EXLT1S4dmLGkLzlqAlnEnpUouWH7fw=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=i93MAT6XTE+7x4FSRww4CoL7s9hSOmlnZfP2gdTvn26RfuGrpuD0xWlNac6+jSxeSx
         uoR06KVfjlbWsrPX1+dwEU89PILqJnp8BcNklpTkmUVnNo8ms1G3XqbgLQj1YzznvODM
         WndweWYSHCZ8+9PBD5nYj82X/GXHPSJPDN7pYdMSCjUF/nDUOGVPb9QZyFidPdvO3Dy1
         1ynAkVAPoO9B9Sz3EAnYSK3+TK+S7XH5HvBAEJHI2h6YThsUunpubzY3dbsnmQhy6KLe
         r1iE/r/VYjP4YiuhhAa6BxdcUlTURqUiTsiHA76nECmqnkD6ZXL8jp8ZMI0OVGRK6q6w
         afBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906750; x=1788511550; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+vuGpXV32M//EXLT1S4dmLGkLzlqAlnEnpUouWH7fw=;
        b=j7Sduvua/L1pwYr16bLYPu0pbmSyOTK0bdRaZofKyA1rA9bKfGwDIpUnjaXI3eSDHU
         0BQRE5LCCCbcj/m20XLvcqduwpMm2hvrIoJe5sFIkHd3r403mAwAzeipt5ds9mUh7RoN
         zonONVZWokw2Mc1JScMJTxF99t6Wg5JUYfdJhFepvNjww/9x9/eWXEh+DZrHzzsBSjNk
         fNB2a+irdOLyfo4cbozqRcrm4mto/kZs9LSMvqowOSPYjdxzlz9kgQBPoZTkn4O6FtOr
         iFRD4tHUtiQO7vwXKIjsbNoz8NV51lKD3eMWKtdFOZQ3yXXcmolsH+BHnG9gXzFsuOJ8
         QFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906750; x=1788511550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+vuGpXV32M//EXLT1S4dmLGkLzlqAlnEnpUouWH7fw=;
        b=N5LzzVxib7Dzu9XvLJEId7YNjLk4ziesoh3Ner7xG3Y/WOXydvf2MzE4XvU60ILb8d
         rtTmHkQjS1/4wCp0dEuPo3r1FjxQF173wwf1Fpbjr+PCUkQOKlxBYtZspOLFOMbsHWgB
         0dKEdExgC5xOS6+BQvcguEk+SUjOy9hZb5Z/E5uFAh+UKIAEErqxjvA41eJioMpyEiqs
         lyuFrr7pXC2A/6P0YZ2NlPVbHu34y22KcRJvhYJDCRzZtolmjrZke++pR/a9rlojdGTo
         7xE8Z/b4Ea5CFWuGVkbDLsEKSJbtBdZqhVeHBEa1EN1bw6kgpeYGD2WZWqiv0Pks9FIV
         0zHg==
X-Gm-Message-State: AFuF++kBlb/X2LOedJCA/SXrmzA38a0V2UcZaVa/v8N5Punx+ebBEWB8
	BuE1Z38V+h/+qT3FbJoMDfBbP8zwd4XVJJEIuFiRsvUOOL+5Z8I31CC2iaIO8ZZ7rqeUfrJMww5
	aGBKtj/p6zejtP7ZUgaq2KdExLzhp8UdjrmPQ
X-Gm-Gg: AR+sD11ckt8qzrnOjOy5azts0w65cEzThvrx+XkjrQyWXp8hTC4WFxFoNxGIIc5Lvw3
	XUiPsbA4LO3rv4Ygr21pAmEDwZKGbLnzZq/bwY6TFBbGLgUOGVgDcWT54w92sITB6oKjGLkUvk7
	g/TJsA2Z0XqIPovGTYcO7nOn5BYKcp/brv93c9ul9qeYFWElnMkbXfzPl0AoAxqip8pMufOgb4U
	P8Zm7gpNg9mmGQip1e+GkzE1TggjNd9XlQiHiMmnn1oIrV2YnD8SaFLugij5pawPjgXB37Vpzay
	0adauEmu3ii5xiyMQrp2CWbDclvtTfKbHJDzEbJFjdPC
X-Received: by 2002:a05:6214:4902:b0:8f0:3b98:d6af with SMTP id
 6a1803df08f44-90ce0ec4959mr62282336d6.26.1787906749180; Fri, 28 Aug 2026
 01:45:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821092108.334318-1-physicalmtea@gmail.com> <20260822092149.B85491F000E9@smtp.kernel.org>
In-Reply-To: <20260822092149.B85491F000E9@smtp.kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Fri, 28 Aug 2026 16:45:13 +0800
X-Gm-Features: AcwNN1VO5lrxjn7mKua8z_P2HOL-1Kz6_UW4T9Fp5-7w_bziMTnekXRsXsDA_2I
Message-ID: <CAJwVaMJqo06tf0XeM84VzZmqh5A1Q_hAHW44gyh2Ni2_FCmkPQ@mail.gmail.com>
Subject: Re: [PATCH v8] vhost: invalidate vring access on IOTLB transitions
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Concurrent execution of `vhost_clear_device_iotlb()` and a v=
host worker thread calling `translate_desc()` results in a NULL pointer der=
eference or arbitrary host memory access due to lockless clearing of `dev->=
iotlb`.
> --
>
> --- Patch [1]: [PATCH v8] vhost: invalidate vring access on IOTLB transit=
ions ---
> commit 601cfcb65f9457e49ce60311ed18a7ca3496a8ba
> Author: Jia Jia <physicalmtea@gmail.com>
>
> vhost: invalidate vring access on IOTLB transitions
>
> This commit introduces a helper to clear the device IOTLB when the
> VIRTIO_F_ACCESS_PLATFORM feature is cleared. It drops the device-wide
> view first and then drops the per-VQ views under their respective mutexes=
.
>
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> >
> [ ... ]
> >
> > +/* Caller must hold the device mutex. */
> > +void vhost_clear_device_iotlb(struct vhost_dev *d)
> > +{
> > +     struct vhost_iotlb *iotlb;
> > +     int i;
> > +
> > +     iotlb =3D d->iotlb;
> > +     if (!iotlb)
> > +             return;
> > +
> > +     /*
> > +      * Drop the device-wide view first.  Each VQ then drops its
> > +      * per-VQ view and its cached ring access under its own mutex.
> > +      * Keep the old table alive until every VQ has completed this
> > +      * handoff, since a worker may still be using it while waiting
> > +      * for its VQ mutex.
> > +      */
> > +     d->iotlb =3D NULL;
>
> [Severity: Critical]
> Could setting d->iotlb =3D NULL here race with a running vhost worker thr=
ead?
>
> While this update is protected by dev->mutex, it does not hold vq->mutex.
> If a worker thread is concurrently calling translate_desc(), it evaluates
> the device IOTLB locklessly:
>
> drivers/vhost/vhost.c:translate_desc() {
>     ...
>     struct vhost_iotlb *umem =3D dev->iotlb ? dev->iotlb : dev->umem;
>     ...
> }
>
> Since dev->iotlb is cleared without vq->mutex, could the worker erroneous=
ly
> fall back to dev->umem?

I was able to reproduce the issue. Although I did not observe the more
severe symptoms described, repeated resets of ACCESS_PLATFORM showed
that
translate_desc() can select dev->umem while the device IOTLB is
active. This confirms that the race is real.

>
> If dev->umem is NULL, this looks like it could trigger a NULL pointer
> dereference when accessing umem->root. If dev->umem is populated, could
> it map GIOVAs using the GPA table and lead to arbitrary host memory acces=
s?
>

The reported consequences require several additional preconditions. I
could not reproduce them; at this point, they remain theoretical.

> > +
> > +     for (i =3D 0; i < d->nvqs; ++i) {
> > +             struct vhost_virtqueue *vq =3D d->vqs[i];
> > +
> > +             mutex_lock(&vq->mutex);
> > +             vq->iotlb =3D NULL;
> > +             vhost_vq_invalidate_access(vq);
> > +             mutex_unlock(&vq->mutex);
> > +     }
> > +
> > +     vhost_clear_msg(d);
> > +     vhost_iotlb_free(iotlb);
> > +     wake_up_interruptible_poll(&d->wait, EPOLLIN | EPOLLRDNORM);
> > +}
> > +EXPORT_SYMBOL_GPL(vhost_clear_device_iotlb);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821092108.33=
4318-1-physicalmtea@gmail.com?part=3D1
