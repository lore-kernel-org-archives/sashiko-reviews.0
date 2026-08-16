Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDE224B13
	for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786856481; cv=pass; b=ePnVd+FV87bDrYc/tJdufVDLE3WF/0pXJN0Fg5P4SczK8jLbRH0VMDRr1wNsB4zQzSambr5YWmInguYA2W0TvAKZ+OV1rHGzUu9cz4LDC11JMFAxtTjfge/PhmWHT1jMDs9YdKbS7sv2+iBAAwDLr1T7PIFRFUpUjASyhS99kTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786856481; c=relaxed/simple;
	bh=6nZ7uWDKkKyQXWqZBP+SaoTwUDfFkyA+VI+BLcb4TEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPEPZ/MAHlW4w3Lu5VQhczrVP8zuy3LkZZccvnxdvJYKo2ob9IkI2zMayS65LZ7do6bU3vEVxrND0y+nQSWLOYDKqCsU73SDwtTzcK1LvTLCDoMwnw0h8/1rWx0+PN6eL6dSivjI/ge78XIorDG0VVZuAzTqSO3X8dSxn8ivDJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwxz/vrV; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwxz/vrV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c2a449c57so13113091cf.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 22:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786856478; cv=none;
        d=google.com; s=arc-20260327;
        b=EtaRyHr932XdNLn9XyS5U+HjYHkIWUGG/+8LTDtT2T277I0Ta9LeR+ED1FDiugsoXZ
         ImoBgb9wiq+e4yPx+6jOR32/S3fDpaseQZS93v9Jr/VjyeWxxIiryZgwCRGFZBiV2l9X
         xcLrzJKW5rLxuW8kLhzq+0ugNUJBI1hH1qA5S6wIwiJWeKYx7ZgEMTxS71czNgC1zI/z
         QpxkIXt8pPCJs9mDkg2WNB83BAwvfeAcw/Q+7wn4SLy2TCzFddmIH7IG7e10+ZqVLthm
         YM0gmoMWuQcQiGYSCJKjPM5WusmuI1r0VdKd5FLvodXRqUt4/ciF/Bkc0FTlRCJPtyjr
         5W9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8/71bLh+w9rZZhRc2yuSIKi4ExOKzKYVMgI7bI9QhU=;
        fh=D5TUnnSbdAmCFzRYxtyEYkT9Mnd8q0lRDN5K8kIiW6s=;
        b=dieImqfIW2uX8EtRJ0mLG8PR3vonQfx1u+fJTLAFwnS83bsS+6dy4yTC1lO5Uq6oaR
         hDQKsJvz407Zfb8bBmE7ZcGjwQsqLEdj0AKye6ZGrEZqh8zAXIzcPtdTkjsNSwfLM4TR
         4B/YPI6FIdafdHNn55UYRtxv8j0O0uV62eL6GoXvA37P2O65u3FsnwZkNVMPlwxVZxxq
         doAVY/+/5jVsxZbX7WWTX73hwZtSV4YQLhgLWeb0+7nHiFvvCzgxWSGNVjaZ/qrTtufU
         S/vgcnKG8T0cFVADMNKuSDxXkrLSLmVKe2no5PUzfr8HTuA3XWakw1kXXBNN7iF4nrnv
         j5ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786856478; x=1787461278; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D8/71bLh+w9rZZhRc2yuSIKi4ExOKzKYVMgI7bI9QhU=;
        b=Uwxz/vrVTQj+9vCPR3K/4ZHgZ2MMUP6PfV7t9ZXov5CyCHbZmI7VrAlV5XHGlViR2p
         AJvHr2ctxvUzoR/nSL9OA7JTHkL1xbJ/GO15jUYibnFrKK5SpvlEKfyS6FTcV0qpBU8U
         TCOrfgblpmhFh5srBKDOOEmvch1L8uyVG8SVnak5BchzVzxAvChN9xYPuNSz8wr0xOWe
         TPVdzdQW9roARPRi+kk9crbrRgBfcbFoZP5AAAVh7VoE4vSBOrUVawqMlps91MBAIaT7
         7FgXb4bL+cTPdJTuHn3+H6PKRNiy//yTCKeKHWNi4qJLd7pvfwUNKq1OjOWOrtZciPnB
         QJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786856478; x=1787461278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8/71bLh+w9rZZhRc2yuSIKi4ExOKzKYVMgI7bI9QhU=;
        b=cHMMhD+BHXm2s5Eo545CWI+YYdZ/wzy/tN6kgnyjbIU6LW4gRNf+Ovch/mnbBcjPy8
         7g46GEkt3+efyKAARc7OGDXwgDEUI8yWKUHDSj66wkLWj7EOlUFecFK8iiGIVGenAgw4
         VURfBxy7xFQjp53/URB2ZuA1lT9UTlh810rPy7NhvYtInoUSTQ6VfziZETflaFY1KBRK
         xUgtGaV0Ih0+Db5eD0JuMm1DjXn/eRcpWnR4+UWFloTzANyCTkDlpOHOEwrpUXicaT+u
         stX9/p1jfMHJOHtoNR2JAlJQdIrmxOhxTn71fpDq2PiyMu8Ja2C/8LP9YTx7EU0GMHkP
         jD9g==
X-Gm-Message-State: AOJu0Yy6zKF9GkXaqWNpgnz1VP5GauApcI3s+4ktn5P87ZAX1he/nA5h
	RuKz0R5KRtDjPwLW43H71k9r8jZHrBHWbzKpQ7GeADCCF1/VZ1WtBemFC6cc/jIjRAAZS7bOm6F
	2vJLvXs8TSGr6e6rP3jqNN7g2MKqnDcmFPmdxt5M=
X-Gm-Gg: AR+sD12XqS8mEZRMwYeyIYQziV65QvhiTGUWIUNHOSYelGXSRP0B6BZ+yPaiHzELPfQ
	h0Lgx8C+DkEhqE6cfcJUQWg6Rlvuprjy5UDv+iW5f1IJXFZRVGq7lK+wUXpNoqvBZ/Xo9FVL5n3
	8DRa0i7Uni0TLglYmDCctqHnySmpQPIoWsmhNh7/VvyoMdDUEJMnv+noR0j1HomGHe6E3EkEv2J
	O3Ph+FxMFWMAlHiN/Ncwc9coYylpNd6WO2+qbooGn23/XltpC3iqN30D+4po7sx+awi8EbStdYA
	+Yk8h/FL2AMn1PmulbRrDIjLFB2YeUpelk2nZsG018Sl
X-Received: by 2002:a05:622a:4189:b0:527:43a:2f30 with SMTP id
 d75a77b69052e-52d85381c96mr206682521cf.1.1786856477220; Sat, 15 Aug 2026
 22:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814072903.124991-1-physicalmtea@gmail.com>
 <20260814072903.124991-2-physicalmtea@gmail.com> <20260815072935.410ED1F000E9@smtp.kernel.org>
In-Reply-To: <20260815072935.410ED1F000E9@smtp.kernel.org>
From: "m'te'a physical" <physicalmtea@gmail.com>
Date: Sun, 16 Aug 2026 13:00:40 +0800
X-Gm-Features: AcwNN1UmwAk6Kw5H-vtPINn8bmj8KuTvj3801SSFEdFUigHbLDkbQCHJ4srJXfo
Message-ID: <CAJwVaMJXNh1TECy9aXS1pnLuLMjS5icUgO=VGbvgm7RNPZ5_gg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] vhost: add helper to clear device IOTLB
To: sashiko-reviews@lists.linux.dev, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Setting `d->iotlb =3D NULL` before acquiring `vq->mutex` in `vho=
st_clear_device_iotlb` creates a race condition with active vhost worker th=
reads. This exposes the host kernel to a NULL pointer dereference or an IOM=
MU bypass (TOCTOU vulnerability) leading to arbitrary host memory corruptio=
n.
> --
>
> --- Patch [1]: [PATCH v4 1/3] vhost: add helper to clear device IOTLB ---
> commit 721258d5c0d5f3c1aeaefcc8dc997b5bbedcd9c1
> Author: Jia Jia <physicalmtea@gmail.com>
>
> vhost: add helper to clear device IOTLB
>
> This patch adds a common helper for tearing down the device IOTLB shared
> by vhost backends. It drops each virtqueue's IOTLB pointer and metadata
> cache before freeing the old table.
>
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index a0c1d54019aac..0861406f3246f 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> [ ... ]
> > @@ -2298,6 +2298,30 @@ long vhost_vring_ioctl(struct vhost_dev *d, unsi=
gned int ioctl, void __user *arg
> >  }
> >  EXPORT_SYMBOL_GPL(vhost_vring_ioctl);
> >
> > +/* Caller must hold the device mutex. */
> > +void vhost_clear_device_iotlb(struct vhost_dev *d)
> > +{
> > +     struct vhost_iotlb *iotlb;
> > +     int i;
> > +
> > +     iotlb =3D d->iotlb;
> > +     d->iotlb =3D NULL;
> > +
> > +     for (i =3D 0; i < d->nvqs; ++i) {
>
> [Severity: High]
> Does setting d->iotlb =3D NULL before acquiring vq->mutex create a race
> condition with active vhost worker threads?
>
> If a worker thread is concurrently executing vhost_copy_to_user() while
> holding vq->mutex, it could call translate_desc(), which locklessly
> reads dev->iotlb:
>
>     struct vhost_iotlb *umem =3D dev->iotlb ? dev->iotlb : dev->umem;
>
> Since d->iotlb was already set to NULL by vhost_clear_device_iotlb(),
> the worker thread might mistakenly fall back to a potentially NULL
> dev->umem.
>
> This could bypass the IOTLB translation and expose the host to memory
> corruption via forged GIOVAs or result in a NULL pointer dereference.
>

This is a known issue and appears to be the same issue discussed in
<20260804072159.7506-1-physicalmtea@gmail.com>  I tried to reproduce
it, but was
unable to do so. Therefore, I retained the current approach.

> > +             struct vhost_virtqueue *vq =3D d->vqs[i];
> > +
> > +             mutex_lock(&vq->mutex);
> > +             vq->iotlb =3D NULL;
> > +             __vhost_vq_meta_reset(vq);
> > +             mutex_unlock(&vq->mutex);
> > +     }
> > +
> > +     vhost_clear_msg(d);
> > +     vhost_iotlb_free(iotlb);
> > +     wake_up_interruptible_poll(&d->wait, EPOLLIN | EPOLLRDNORM);
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072903.12=
4991-1-physicalmtea@gmail.com?part=3D1
