Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8883597B
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950170; cv=pass; b=ufE7SVR2j/kVq6EdSlmjitE7DDGyzYxD0iOJ+oDXuCyuZpHdrEfSKFQ6WoymJkSWnYN1uuIDNJ3mxU5K7PA/5CqDVuWnDAvCrI5kNm/rlY5SnyNwk9iHuvNubOhGq06d5nLNzyYYk988lxQTe4fsHuo5Tr+tq4Mqjj54iUlRJfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950170; c=relaxed/simple;
	bh=PkHz/u0/trdQkywvOqCxmqohTHFs3s/l1hWmzYDl6sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oos5vleUbOOE1q6cJyPvnn7HaCbDOeKv87kG2lIN6eCrHymmw9y/US1fR4N4FJmZPPeZQEFTZJPB9cGFWFkBVQrFDptbS78M+/VomZS3cgzMhc3inFyGpVAIcjWAxtOQ3BaI1qreTYwiVH4QeycFpzR3GWPS1mgX3vfS7LY4qcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ4ABs5m; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ4ABs5m"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-526f963372aso18662981cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 00:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786950168; cv=none;
        d=google.com; s=arc-20260327;
        b=ICVKJwml4cKskPzmCeQX2t7kwsPmVgzBgW8r+UczNk9sb2SZHd0wC2nJJBdsmJZjPc
         FSQK33VHBBeytT3TYf3RUV7ve0trb6YkyqcRHIz8R046zaXnuyjCF2g8IQ8dXRvZiUPP
         hvEcIJrsoGBMhWugYkPQZZ3bIdkfyI6anpb/CxXNXsZL3xaGlEVN6H09K0BEKfcHwGAC
         akMUSK3r/jUnuXMe36BP0WMYlodkfTuRTUjamtVy9b3FHIJENnS0YvFw0Cb92KmFDoT0
         0+oMJkc4s0itSzQ8XqHsVeLz91v9aOhZxsxzJl3JbcR3SgyV8rStTefGImTdIHshrcqN
         FM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uvalpkC4OZKmRKco1kzVv3ufHRThuGXTuyuxkY+jbDU=;
        fh=x2mKMPnIJedpAuNqdsTQRZrkDXOjsXDeHHB+uOpGQy0=;
        b=pTzTTiuFF9y8S4EMzXvrUvGggpK+spbye+v/imkJf4i75eccq4XOxaNoww9N7921y4
         8Elv0bR6nhajuOhqMSMTwrQx7dC55PJJT9gOBPpR34pST8on+Bq/d8trh4BRPzoi24hm
         BnpRI40jh6ubkGroGnc4Sa73J3IA7wcS20Ennd4SNIDz+Av9fxE1aUnyZbiOq3V1MeP4
         lv2FqTFC6AIRipIkXhHS1v9aZP2t/FCZGt4eyXZgr/ywXyA3l5dVd7nWdPPNZ4BmGR02
         k1yyoHrj1LV0hraXA+E0YQcxZ16Du6WsQ/xRHK31SKsu1JTlj0Kls1+CM+414F1mob13
         whWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786950168; x=1787554968; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvalpkC4OZKmRKco1kzVv3ufHRThuGXTuyuxkY+jbDU=;
        b=jZ4ABs5mIDj8n30Kbow5ZIjNuXQJkoHVzYQBHlCwoGj7MeOMFKxO8PHNJucd+8OsK+
         N2TfY/AIAyP2IWgNTsLeGkgBpxnnZBMBMgmVsy8idM3LB+OevGzNYK4JRXE3NPckuKsG
         VrPOASLc8UMZ2jN9B/y81T5VAWo5L6xoQaQSkNXb/3QpLtVZ4UZ5P2wdPuWseumhVh8J
         b/Ff1od84PfjPoDhdqsSizMY1g2DOtYRwBSJKW6pe+HNMznogW12rGyn4ISv6TfjfYEn
         QQ01y3lqYnglnTCKrOOU0CYgd80SyIYqkX4EXPNYYteyL3SAHy+weAGpx6iGJrkpNef0
         D6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950168; x=1787554968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvalpkC4OZKmRKco1kzVv3ufHRThuGXTuyuxkY+jbDU=;
        b=jN81UY2lZNgob3ZsreMa6If9QMLpHwvMKX/xdvBaEBdGmhaaOBQW9k8pgRSfgF2ahM
         9ooeFDddwNLhuMrPYMJuv8kUk7rYrGThwglL8fm8M5EGwkChNfk8KYrdLIcYYuk3CqmZ
         TX7lor58KFjC4C8WjPah9Q1iC5WHt3SQb1pmjYQEs3QB1R9diai69ck7vJdGyMBVEWrs
         XrxFccF+AOFFV4TnPeCgkDytNp0TD/ce8iCrNJ50xEqAT4zo8tr40goBJmdHMXPiWh3l
         gM/XrINsA4GS0HePT4Y8CVFxarngk1jtTVM5At0FPe4ycfb7ju+IcZFXQE79yaq+X61v
         Nxjg==
X-Gm-Message-State: AOJu0YzDUlGWAKlZ5i67CDFDvOPh6CCOgU9NUG+Dc9z9I0YZMhLLzHyI
	9zcdyxBDPUfC/8kxoCH8LNh3Ssi3yMO6q53c8c93SnfzGyVvG+hmr5g9VxgRy+TM8RppXOde1zB
	qZk1E/V4ORtMIcrnwt43dNduGBCTPj/6otJ1W1OA=
X-Gm-Gg: AR+sD13jprqltfwTOhngVBjhkKp1hSsw8BzOGuE0qEmnKqexw976iH/0Jw362RhV7ow
	f8e2eY+HGR7pgMv1oG6wuZPNRRkPdWQLUeR8EkkfaQZ5pSPG+Hlu1YxLlUj3LXPl9GA8oZ1SnF5
	n/P5JmhGPacMAY7g1QhNreTzTi6A1Tzd9ooE7dEBN4qX/fR2J0qD5daest2mQlrNxZTAyHnD0G1
	ywtkfE3FnOtq/ZuhqE9brb2Lm7d0tv+8ao7BWGxXZRdwz2wmFFecoMa35ubMC91C+Eyv/1Ru5aF
	sSlklzvejvAZauJX8g+l13NH6NLjyq14iy1NKCn3+SVN
X-Received: by 2002:a05:620a:318a:b0:936:bc78:791b with SMTP id
 af79cd13be357-936d202efaamr1957599985a.15.1786950166971; Mon, 17 Aug 2026
 00:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814072903.124991-1-physicalmtea@gmail.com>
 <20260814072903.124991-3-physicalmtea@gmail.com> <20260815072935.DA5831F00A3A@smtp.kernel.org>
 <CAJwVaMLXO8ygwCvWUsrA_W0xteYehuDMEq4nBxgHgw8YtzYesg@mail.gmail.com> <20260816051339-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260816051339-mutt-send-email-mst@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Mon, 17 Aug 2026 15:02:10 +0800
X-Gm-Features: AcwNN1XUjPQqxW41N6zVs-rRIuDjUtbgoV7Z31CM3mlILvO08kQAAx3t2hZKn_Y
Message-ID: <CAJwVaM+Rk3H2k=uB0T=UoDAVZxkhOBRaB3SR2SMhpkRdW7M3yQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] vhost/vsock: discard IOTLB when ACCESS_PLATFORM is cleared
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> On Sun, Aug 16, 2026 at 01:35:05PM +0800, Jia Jia wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
> > >
> > > New issues:
> > > - [Critical] Arbitrary kernel write and privilege escalation due to b=
ypassed `access_ok()` bounds checking when VIRTIO_F_ACCESS_PLATFORM is clea=
red dynamically.
> > > - [High] Data race causing NULL pointer dereference in `translate_des=
c()` due to lockless `dev->iotlb` teardown.
> > >
> > > Pre-existing issues:
> > > - [High] The vhost-net subsystem suffers from the exact same bug that=
 this patch fixes in vhost_vsock, but `vhost_net_set_features()` was not up=
dated.
> > > --
> > >
> > > --- Patch [2]: [PATCH v4 2/3] vhost/vsock: discard IOTLB when ACCESS_=
PLATFORM is cleared ---
> > > commit e884f4b90201c9e0d904641890e2f9e4ea704c9a
> > > Author: Jia Jia <physicalmtea@gmail.com>
> > >
> > > vhost/vsock: discard IOTLB when ACCESS_PLATFORM is cleared
> > >
> > > This commit addresses an issue in vhost_vsock_set_features where the =
device
> > > iotlb remains attached when userspace clears VIRTIO_F_ACCESS_PLATFORM=
. It
> > > introduces a call to vhost_clear_device_iotlb to detach the iotlb and=
 clear
> > > the metadata cache for each virtqueue. This prevents descriptors from=
 using
> > > stale translations installed prior to the feature change.
> > >
> > > > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > > > index 86f25ff80722d..a18fe1335349b 100644
> > > > --- a/drivers/vhost/vsock.c
> > > > +++ b/drivers/vhost/vsock.c
> > > [ ... ]
> > > > @@ -882,6 +882,10 @@ static int vhost_vsock_set_features(struct vho=
st_vsock *vsock, u64 features)
> > > >               goto err;
> > > >       }
> > > >
> > > > +     if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)) &&
> > > > +         vsock->dev.iotlb)
> > > > +             vhost_clear_device_iotlb(&vsock->dev);
> > >
> > > [Severity: Critical]
> > > If userspace clears the VIRTIO_F_ACCESS_PLATFORM feature while the de=
vice is
> > > running, can this allow arbitrary writes to host kernel memory?
> > >
> > > When VIRTIO_F_ACCESS_PLATFORM is enabled, vq_access_ok() intentionall=
y
> > > returns true without validating addresses, deferring validation to th=
e
> > > iotlb.
> > >
> > > If userspace provides arbitrary kernel addresses via VHOST_SET_VRING_=
ADDR,
> > > starts the device, and then dynamically clears the feature,
> > > vhost_clear_device_iotlb() sets vq->iotlb to NULL on the fly.
> > >
> > > Since the existing vring addresses are never re-validated, a concurre=
nt
> > > worker thread calling vhost_put_used() -> vhost_copy_to_user() will
> > > observe !vq->iotlb and fall back to __copy_to_user().
> > >
> > > Because __copy_to_user() omits bounds checking, it will write to the
> > > previously configured unvalidated kernel addresses.
> > >
> > > Should the vring addresses be re-validated, or the device stopped, be=
fore
> > > dropping the iotlb?
> > >
> >
> >  I was able to reproduce the vring issue described here with a userspac=
e test.
> >
> >  A complete fix may require broader changes and could alter the
> > existing userspace contract,
> > so I am not sure that the additional scope is justified. The
> > conservative approach
>
> I'm not sure i understand. Alter the contract how?
>

If I understand your concern correctly, one reason for not simply
returning -EBUSY is that vhost cannot predict how an arbitrary userspace
owner will react to the error, or what state this may leave the
application in.

However, the same concern seems to apply if the transition is accepted
but the kernel clears the IOTLB and the cached vring state. In that case,
the owner must issue VHOST_SET_VRING_ADDR again for every virtqueue, but
an arbitrary userspace owner may not know that this follow-up operation
is required either.


  The approach I am considering is approximately:

          old_iotlb =3D dev->iotlb;
          dev->iotlb =3D NULL;

          for_each_vq(vq) {
                  mutex_lock(&vq->mutex);
                  vq->iotlb =3D NULL;
                  vhost_vq_invalidate_access(vq);
                  mutex_unlock(&vq->mutex);
          }

          vhost_clear_msg(dev);
          vhost_iotlb_free(old_iotlb);
          wake_up readers;

  vhost_vq_invalidate_access() would clear:

          vq->desc
          vq->avail
          vq->used
          vq->log_used
          vq->log_addr
          vq->meta_iotlb[]

  The helper would also be used when initializing the device IOTLB:

          if (d->iotlb)
                  return 0;

          ...
          vq->iotlb =3D niotlb;
          vhost_vq_invalidate_access(vq);

  The idempotent initialization is needed so that a later feature update
  which keeps ACCESS_PLATFORM enabled does not replace the existing IOTLB
  with a new empty table.

  After a successful live transition, the backend would remain attached,
  but the cached vring addresses would be invalidated. Userspace would
  therefore need to call VHOST_SET_VRING_ADDR again for every virtqueue
  before data processing could resume. If ACCESS_PLATFORM is enabled
  again, userspace would also need to repopulate the new IOTLB through the
  normal MISS/UPDATE protocol.

  I checked the relevant QEMU code. QEMU does not normally withdraw
  ACCESS_PLATFORM in the middle of an active feature-negotiation session.
  If it needs to change that feature, it follows the reset/restart path,
  which reconfigures the vring addresses. Therefore QEMU already performs
  the required sequence. However, we cannot assume that every other
  userspace owner follows the same reset/restart behaviour.

  This does not add a new ioctl, and a successful VHOST_SET_FEATURES call
  would still return zero. The change is in the postcondition of a
  successful call: previously configured vring addresses would no longer
  be preserved across the transition.

  This is different from returning -EBUSY. -EBUSY rejects the transition
  and leaves the previous state intact, while this approach accepts the
  transition and requires a follow-up vring reconfiguration. Both choices
  may affect userspace behaviour, but in different ways.

  This is the userspace contract change I was referring to.

 This is the approach I can currently think of for safely handling the
transition even when a backend is attached.
 Please let me know if I have misunderstood anything.


> > I am considering is to allow the transition only when no VQ backend is =
attached:
> > clear the IOTLB, invalidate the cached vring addresses, and require
> > userspace to configure them again.
> > If a backend is attached, the helper would return -EBUSY before
> > modifying any state.
> >
> > This differs from the suggestion in
> > <20260730104857-mutt-send-email-mst@kernel.org> to discard
> > the IOTLB and let the kernel rebuild it. I am unsure whether returning
> > -EBUSY while a backend is active is compatible
> > with existing userspace flows, or whether live transitions should
> > instead be preserved by quiescing the queues first.
> >
> > I plan to prepare v6 along this conservative line, but I would
> > appreciate guidance on whether this is the right approach and
> > whether -EBUSY for an active backend is acceptable.
> >
> > Thanks.
> >
> > > [Severity: High]
> > > Could clearing the iotlb here create a data race with concurrent work=
er
> > > threads?
> > >
> > > Looking at vhost_clear_device_iotlb() in drivers/vhost/vhost.c, it
> > > locklessly sets d->iotlb to NULL before acquiring vq->mutex for the
> > > virtqueues:
> > >
> > > drivers/vhost/vhost.c:vhost_clear_device_iotlb() {
> > >     iotlb =3D d->iotlb;
> > >     d->iotlb =3D NULL;
> > >
> > >     for (i =3D 0; i < d->nvqs; ++i) {
> > >         struct vhost_virtqueue *vq =3D d->vqs[i];
> > >         mutex_lock(&vq->mutex);
> > >         ...
> > > }
> > >
> > > If a worker thread is concurrently executing vhost_copy_to_user() ->
> > > translate_desc(), it holds vq->mutex. The ioctl thread will block on
> > > the mutex but has already cleared d->iotlb locklessly.
> > >
> > > In translate_desc(), the code evaluates the iotlb pointer:
> > >
> > > drivers/vhost/vhost.c:translate_desc() {
> > >     ...
> > >     struct vhost_iotlb *umem =3D dev->iotlb ? dev->iotlb : dev->umem;
> > >     ...
> > > }
> > >
> > > It observes dev->iotlb as NULL and falls back to dev->umem. Since
> > > dev->umem is NULL when using an iotlb, passing umem to
> > > vhost_iotlb_itree_first() will unconditionally dereference iotlb->roo=
t,
> > > crashing the host kernel.
> > >
> > > Would it be safer to clear d->iotlb after the virtqueues are quiesced=
?
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but is vhost_net_set_features() in
> > > drivers/vhost/net.c missing the exact same cleanup introduced here?
> > >
> > > When userspace clears VIRTIO_F_ACCESS_PLATFORM via the
> > > VHOST_SET_FEATURES ioctl on a vhost-net device, n->dev.iotlb is left
> > > attached. This completely misses the newly introduced
> > > vhost_clear_device_iotlb() cleanup.
> > >
> > > Should the identical fix be applied to vhost-net to prevent memory
> > > isolation bypasses via stale translation entries?
> > >
> > > > +
> > > >       if ((features & (1ULL << VIRTIO_F_ACCESS_PLATFORM))) {
> > > >               if (vhost_init_device_iotlb(&vsock->dev))
> > > >                       goto err;
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026081407290=
3.124991-1-physicalmtea@gmail.com?part=3D2
>
