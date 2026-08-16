Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB534EEB3
	for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 05:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786858545; cv=pass; b=cufdcobNsMJHRvGXY0DbfZzIkBHdwvLUNlz5+qsRvF7o+j7ITpwmPM1GW1Vw5Cln+hSpT+R53ALYi0ipogeWgHpMHMLMhRIcJ32n5ZHfG8TCaj5Wb6HzL3QwKO2gGE/NvkCgBNLBmNBBMkK5zaJSbai6ZAmTM6BR9BGSB1MZfvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786858545; c=relaxed/simple;
	bh=kfdja7QPlUndeQg0B7QARd42WWxGmitawVAMGWJ0H4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=C8YQ07/bpzmx6OLHrNqcPqJmqzqMytCQO/OeeA9kYKwqk7GxGzj2VqlbcTFmF38LOcspWVd9ppehp2LciOkYjlMhhZiCORsCmrjgbF6p7uwPx+sEHD84HLXTuz1WFqx7QYHN8AP2ETuJgXCBG9j5veVddtuBTqcT+LTe/+8AmCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itUiZ7Bf; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itUiZ7Bf"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e65e18969so142872185a.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 22:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786858542; cv=none;
        d=google.com; s=arc-20260327;
        b=sdv0wDwulNAgslA2UQStwwF/wHT9iKl2h1NKUUgE1YTDgIybpAHbpu6/03y+pDy62G
         GOjej66ZUVgoLZJfjiTTrbXqMsRNYy3+vgcU5b1LTTgses5lOw77SbjSxs6fTQTg5Et0
         1+ntzhKbE+d7zTPGj2uxDs+wmkqXL2NoJuquyoQJiGhtqdOCatFPf8srC/3n/eprg3W0
         oi5gdiDyixFpxH1kjvsr8eMycCxGQqxbxMDsiS3+3LYN92nPfbObuiq4qgMsNjQT9XH3
         nXRAHS5NyrA15BF4HNQ2eqIbAKcmz7L/TBfzHVvk3FTVNRwfJeb9M3f40elKDWUFCgld
         /VDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjr8lG5wpHzg7sE6sPwrUuDErZ4BeDAtCqJWcN8BYJk=;
        fh=SNK4nfNIKkI2l/mq/uhjxuRyR2ljKpJpcjNSJxbwiAw=;
        b=shdX/3cvqVuCBCoU7ld2C3gW4+zz/gshfVkcKC1Pt1vFahjYZ+X94txeAhD+mtkrfz
         IBKjf5ODbdUlXoNb9U9uOeX8gljkrZTbSi/H5GPL+gKSlHC9GqBkmBdncGMBiur6O+iF
         TW8RbkhRydS8egEl6yIH2RBgk46HSEq6N+DbHIEEWAn39wWiAwkXXNZj0Rx7eTXf7apV
         6v7deOGeRgHel79EvCrf7qPNoSUfjqqjh8Bn1ORvDILozi9qU53vajyPoVK71M24JOl+
         /PPRGuDcRYEcY+xNgHu0/QPBAwbZp3YudXLRdgPEfYjq23qZHdbcosCg7NAopdDHi51b
         JVNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786858542; x=1787463342; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjr8lG5wpHzg7sE6sPwrUuDErZ4BeDAtCqJWcN8BYJk=;
        b=itUiZ7BfpV6F4C/fH1/M0P8N2sFnaGbe78zoiIpPsa0hRmN11YMmNB8DLPVgJgZ2hl
         46PwSOQFV2GKNEPTU/ny+I0wOZCKmQc3uoWgy8pB0xpOPFgLzL9UzkR/Aixk9qyW9qhL
         skgfgv6sBuTsMNMUk1yLil6+5uQH7NeptmIQQOUS8JUSiuPsPz4DIZKZzzTopx5AsmkF
         AbT8JkHn8oHlJLbmi4hhWbBMyZIutmng2Mwe1MIM80O1rBRrwlwH60vb5cAwNg8SMw3I
         HE1pJ80Pw+RDByrDbRfAdYoE2utHoxKGFm2Rv/Cf5Vdp10DzHfVhV07BpwtbM6yvFwk8
         coAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786858542; x=1787463342;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjr8lG5wpHzg7sE6sPwrUuDErZ4BeDAtCqJWcN8BYJk=;
        b=ns5k0RKTh0l5RH5+aYuP6tTGrUVJny/iVjxp5xsea4bwKWXZbNMNlZFfjz9WpGCQ3b
         pBMcV2pSk7VB3pUExtxD3PEBIL06LPCEOBD4Mmf3pabb+HbamuyHg07856vEyN+MBXvH
         YQoicqL9VKO7+COW7ZA2TOgg/n/ebVrahgSFEAOS+RBVVFRLXKvrZ2AoiG8MNusQrgjr
         2xuCjxso0z/o/4DPQdS6O+3SjUMLxwkikz0zGAaj7uRMLxdxuQV+d1jBHr918hVYHs88
         NJ0/zeG+dk6ytoBLzC6e+kEr2VatUK5yDkWapnKLf1CqZPe4iwbqKXNg/hnRG5iczGwC
         GYXQ==
X-Gm-Message-State: AOJu0Yyv10FkC6wegS6OxiKEg0pxj8t51hwU3U2xIZGCEQYrTMFiFpYU
	/ilk7ODeZEsn+kKJyxSRO4ywBp2vQZMxklm1f5JVwrmG6/gBfOfjReINgIyeWeWpI5ROolZNyKk
	xYc7fgZr1BHLl6uJt19jClxml1ofP+PbiVrf/46A=
X-Gm-Gg: AR+sD12B+7x/rDBKqiwX1DuYtSI+AUm0bowwqUNdCYrTETfZohslSb1qYiR9KgK80AF
	m8qJ8ZEmBRVyi8+5miEM5ZpC7EryyYSABZj3cvahW9+U/7h4uCt/kvLHI1WDcQw2fFcaNuPLYI0
	9/9FVqIoPzFt1bFH+t5Wk9f7JQwGvaadkMZnLJXwFJw7n7iAJI5tVRIk9sZsZP+QWjaRcipYWP4
	A4k2MjAi/NzEfsip/9cDktWh3dAMjr5zr0jvKOLbrnaNGcNL4fVjJRZmuykpEUxPxT0Py651FsB
	g1LxyiohzcTVK6/LTMXQ3udrNE/XqO2DPzNAJDwiWwKE
X-Received: by 2002:a05:620a:1d08:b0:930:9cbc:7121 with SMTP id
 af79cd13be357-936c05e43f3mr2548959385a.3.1786858541834; Sat, 15 Aug 2026
 22:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814072903.124991-1-physicalmtea@gmail.com>
 <20260814072903.124991-3-physicalmtea@gmail.com> <20260815072935.DA5831F00A3A@smtp.kernel.org>
In-Reply-To: <20260815072935.DA5831F00A3A@smtp.kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Sun, 16 Aug 2026 13:35:05 +0800
X-Gm-Features: AcwNN1UtdCJC6MF0XiQ9nCeL7RytKcxXjtlyGr6HD9_0-BoSA2LauemKU-vxttY
Message-ID: <CAJwVaMLXO8ygwCvWUsrA_W0xteYehuDMEq4nBxgHgw8YtzYesg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] vhost/vsock: discard IOTLB when ACCESS_PLATFORM is cleared
To: sashiko-reviews@lists.linux.dev, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] Arbitrary kernel write and privilege escalation due to bypas=
sed `access_ok()` bounds checking when VIRTIO_F_ACCESS_PLATFORM is cleared =
dynamically.
> - [High] Data race causing NULL pointer dereference in `translate_desc()`=
 due to lockless `dev->iotlb` teardown.
>
> Pre-existing issues:
> - [High] The vhost-net subsystem suffers from the exact same bug that thi=
s patch fixes in vhost_vsock, but `vhost_net_set_features()` was not update=
d.
> --
>
> --- Patch [2]: [PATCH v4 2/3] vhost/vsock: discard IOTLB when ACCESS_PLAT=
FORM is cleared ---
> commit e884f4b90201c9e0d904641890e2f9e4ea704c9a
> Author: Jia Jia <physicalmtea@gmail.com>
>
> vhost/vsock: discard IOTLB when ACCESS_PLATFORM is cleared
>
> This commit addresses an issue in vhost_vsock_set_features where the devi=
ce
> iotlb remains attached when userspace clears VIRTIO_F_ACCESS_PLATFORM. It
> introduces a call to vhost_clear_device_iotlb to detach the iotlb and cle=
ar
> the metadata cache for each virtqueue. This prevents descriptors from usi=
ng
> stale translations installed prior to the feature change.
>
> > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > index 86f25ff80722d..a18fe1335349b 100644
> > --- a/drivers/vhost/vsock.c
> > +++ b/drivers/vhost/vsock.c
> [ ... ]
> > @@ -882,6 +882,10 @@ static int vhost_vsock_set_features(struct vhost_v=
sock *vsock, u64 features)
> >               goto err;
> >       }
> >
> > +     if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)) &&
> > +         vsock->dev.iotlb)
> > +             vhost_clear_device_iotlb(&vsock->dev);
>
> [Severity: Critical]
> If userspace clears the VIRTIO_F_ACCESS_PLATFORM feature while the device=
 is
> running, can this allow arbitrary writes to host kernel memory?
>
> When VIRTIO_F_ACCESS_PLATFORM is enabled, vq_access_ok() intentionally
> returns true without validating addresses, deferring validation to the
> iotlb.
>
> If userspace provides arbitrary kernel addresses via VHOST_SET_VRING_ADDR=
,
> starts the device, and then dynamically clears the feature,
> vhost_clear_device_iotlb() sets vq->iotlb to NULL on the fly.
>
> Since the existing vring addresses are never re-validated, a concurrent
> worker thread calling vhost_put_used() -> vhost_copy_to_user() will
> observe !vq->iotlb and fall back to __copy_to_user().
>
> Because __copy_to_user() omits bounds checking, it will write to the
> previously configured unvalidated kernel addresses.
>
> Should the vring addresses be re-validated, or the device stopped, before
> dropping the iotlb?
>

 I was able to reproduce the vring issue described here with a userspace te=
st.

 A complete fix may require broader changes and could alter the
existing userspace contract,
so I am not sure that the additional scope is justified. The
conservative approach

I am considering is to allow the transition only when no VQ backend is atta=
ched:
clear the IOTLB, invalidate the cached vring addresses, and require
userspace to configure them again.
If a backend is attached, the helper would return -EBUSY before
modifying any state.

This differs from the suggestion in
<20260730104857-mutt-send-email-mst@kernel.org> to discard
the IOTLB and let the kernel rebuild it. I am unsure whether returning
-EBUSY while a backend is active is compatible
with existing userspace flows, or whether live transitions should
instead be preserved by quiescing the queues first.

I plan to prepare v6 along this conservative line, but I would
appreciate guidance on whether this is the right approach and
whether -EBUSY for an active backend is acceptable.

Thanks.

> [Severity: High]
> Could clearing the iotlb here create a data race with concurrent worker
> threads?
>
> Looking at vhost_clear_device_iotlb() in drivers/vhost/vhost.c, it
> locklessly sets d->iotlb to NULL before acquiring vq->mutex for the
> virtqueues:
>
> drivers/vhost/vhost.c:vhost_clear_device_iotlb() {
>     iotlb =3D d->iotlb;
>     d->iotlb =3D NULL;
>
>     for (i =3D 0; i < d->nvqs; ++i) {
>         struct vhost_virtqueue *vq =3D d->vqs[i];
>         mutex_lock(&vq->mutex);
>         ...
> }
>
> If a worker thread is concurrently executing vhost_copy_to_user() ->
> translate_desc(), it holds vq->mutex. The ioctl thread will block on
> the mutex but has already cleared d->iotlb locklessly.
>
> In translate_desc(), the code evaluates the iotlb pointer:
>
> drivers/vhost/vhost.c:translate_desc() {
>     ...
>     struct vhost_iotlb *umem =3D dev->iotlb ? dev->iotlb : dev->umem;
>     ...
> }
>
> It observes dev->iotlb as NULL and falls back to dev->umem. Since
> dev->umem is NULL when using an iotlb, passing umem to
> vhost_iotlb_itree_first() will unconditionally dereference iotlb->root,
> crashing the host kernel.
>
> Would it be safer to clear d->iotlb after the virtqueues are quiesced?
>
> [Severity: High]
> This is a pre-existing issue, but is vhost_net_set_features() in
> drivers/vhost/net.c missing the exact same cleanup introduced here?
>
> When userspace clears VIRTIO_F_ACCESS_PLATFORM via the
> VHOST_SET_FEATURES ioctl on a vhost-net device, n->dev.iotlb is left
> attached. This completely misses the newly introduced
> vhost_clear_device_iotlb() cleanup.
>
> Should the identical fix be applied to vhost-net to prevent memory
> isolation bypasses via stale translation entries?
>
> > +
> >       if ((features & (1ULL << VIRTIO_F_ACCESS_PLATFORM))) {
> >               if (vhost_init_device_iotlb(&vsock->dev))
> >                       goto err;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072903.12=
4991-1-physicalmtea@gmail.com?part=3D2
