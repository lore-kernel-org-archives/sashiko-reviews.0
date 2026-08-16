Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D432F83B5
	for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786871813; cv=none; b=I9akrO+m0lFHuH7J0k9TqZQncQxPuiaTgrIBQxJdOkuhQ+FDqZ/1wEg+2T+8h51bYJ9JyeBLyZCcEfcjk9ewUcN9G3dfJOLXo1tJ0MBN2G2PA+QPkuYR1ZlAdbo98xt6RzVDymGjaW/ZctSc/pA7Yf7KTQaMf0vPuWX0/4cRsq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786871813; c=relaxed/simple;
	bh=oROtORULl4dFZmYi+/ACXqFUGsSxYXzy8X3dtWjNxPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uoecNUGXOAGImLnFXmEHWFCedf40N2TTuWasEVmJYKtf9f2ptV/EW65bjgy/yxGe7MFQpgZ94+bdNEE1Dvo1hW6n+WZmaqBi24I047Vm8wBA68NxnAEkmyIf7S74a9g1nnF3DsoBs+UrXsGgIb8NZAB7g4DuwLoOm21OLBWcrp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=biS7jxpP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biS7jxpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786871810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FW0q/l/BMmA1CDKQ2fAEVmVa70q845GMM4GxoY7ef4A=;
	b=biS7jxpPW6qlZzkdMQBCGOpMVXcdkPT094djTOpL/0d67NL8EBI5yqrpuzGdHNw4G5ovkW
	QhfrjRNMVezmQ47c0QHKX9KfNPxfE09aIMoYLGnVU6DgigphwVvSNqPjonsUcYCJTudQ1g
	P73wLU51Se4Gdk4aSUR1P0gFaPBOERI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-74OBaboBPJS7zUFvYEqG7Q-1; Sun, 16 Aug 2026 05:16:49 -0400
X-MC-Unique: 74OBaboBPJS7zUFvYEqG7Q-1
X-Mimecast-MFC-AGG-ID: 74OBaboBPJS7zUFvYEqG7Q_1786871808
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47485fde05aso1339960f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 02:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786871808; x=1787476608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FW0q/l/BMmA1CDKQ2fAEVmVa70q845GMM4GxoY7ef4A=;
        b=Ftm+UdvMkokar0Ri54guZdL8/QEbGyGdBt5AT/y5kYqWszz/J0mdQotrz4sp3QCPJf
         1PSDouCjk8XhCPzADMq1PsNUzEp48SAhWFHBCWp7bxMNxfDV7dQXfIUzAa0dOkLyWcdL
         L/ocUHRULgQR9KCwR0vtJm4k6rrVSJQa1yDF0OYGytKtjcFAZtULg107pl7wNqilUE0A
         9mtZd6/WCFt5sJxe0JoOLXy6R9knfIn03INCetGpq1EhkEwEUSbRws/whY4NKTe8QkOy
         28C6gSaaTriF1jvJLOXj/0AMCLwvVqQghRqHcwRHFK4t9JIaZbZ5eRLDe1csrR/fUC7T
         TLXg==
X-Gm-Message-State: AOJu0YxLgZG9q/qogPHZ5z5WHxksHhbfAjJkD+k0na5V/QA0O3ocpJ5c
	M+rZIfXmkfrYDTgAl/78VYERVt89dkXIUkSbyzpF9L05xB80ximwJe5rm/e+5HCd2FqsAoEAJtX
	Djv/zF/i0zrYtzxtiqrd4n4MRCy4c/ZS/7LqmVWe/ydCw9cjfIIPQDkDQhuFs6+e4cNn5sQ==
X-Gm-Gg: AR+sD13+RNkpUMsKStxbJoJhZ5zfyYcdeOdarqvLVVoUMAs4Z7y8TAOoJfsqdavDFGJ
	FLeJDtmbPNP5kPS12ML2mtYpK87MjMuPFp/9rVeo278Xd1EKPp+A0T/nZsfgFmMNG+/Jif9CV6U
	hQ+XTGJdMTI9ydT53IFUxCovLfyWZudz5uTNFfDZroFn1I8MHq9GeTmMkvDB41kDpf3L5BVsboA
	krcd9xRkEJmclaWqEbZAyqWF5VdSAZi24airDmgHYCZA/rHYSxmfouRR8V9ZARYs8C1bzKHe6d1
	rbMdRKelCT56GSfZs98a4k3WEZUBV8Acb7HrcH5nuGE0stpzZaLhRiQ9smjPlupnNHY=
X-Received: by 2002:a05:6000:230d:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-481607100bdmr30055765f8f.6.1786871807564;
        Sun, 16 Aug 2026 02:16:47 -0700 (PDT)
X-Received: by 2002:a05:6000:230d:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-481607100bdmr30055670f8f.6.1786871807003;
        Sun, 16 Aug 2026 02:16:47 -0700 (PDT)
Received: from redhat.com ([78.138.60.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2cc811sm23695403f8f.33.2026.08.16.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 02:16:46 -0700 (PDT)
Date: Sun, 16 Aug 2026 05:16:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: sashiko-reviews@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 2/3] vhost/vsock: discard IOTLB when ACCESS_PLATFORM
 is cleared
Message-ID: <20260816051339-mutt-send-email-mst@kernel.org>
References: <20260814072903.124991-1-physicalmtea@gmail.com>
 <20260814072903.124991-3-physicalmtea@gmail.com>
 <20260815072935.DA5831F00A3A@smtp.kernel.org>
 <CAJwVaMLXO8ygwCvWUsrA_W0xteYehuDMEq4nBxgHgw8YtzYesg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJwVaMLXO8ygwCvWUsrA_W0xteYehuDMEq4nBxgHgw8YtzYesg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0g-jlYY8PYb-FR0hkSMWmHN_i44oSusdAtbDKVlU6zU_1786871808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 16, 2026 at 01:35:05PM +0800, Jia Jia wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >
> > New issues:
> > - [Critical] Arbitrary kernel write and privilege escalation due to bypassed `access_ok()` bounds checking when VIRTIO_F_ACCESS_PLATFORM is cleared dynamically.
> > - [High] Data race causing NULL pointer dereference in `translate_desc()` due to lockless `dev->iotlb` teardown.
> >
> > Pre-existing issues:
> > - [High] The vhost-net subsystem suffers from the exact same bug that this patch fixes in vhost_vsock, but `vhost_net_set_features()` was not updated.
> > --
> >
> > --- Patch [2]: [PATCH v4 2/3] vhost/vsock: discard IOTLB when ACCESS_PLATFORM is cleared ---
> > commit e884f4b90201c9e0d904641890e2f9e4ea704c9a
> > Author: Jia Jia <physicalmtea@gmail.com>
> >
> > vhost/vsock: discard IOTLB when ACCESS_PLATFORM is cleared
> >
> > This commit addresses an issue in vhost_vsock_set_features where the device
> > iotlb remains attached when userspace clears VIRTIO_F_ACCESS_PLATFORM. It
> > introduces a call to vhost_clear_device_iotlb to detach the iotlb and clear
> > the metadata cache for each virtqueue. This prevents descriptors from using
> > stale translations installed prior to the feature change.
> >
> > > diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> > > index 86f25ff80722d..a18fe1335349b 100644
> > > --- a/drivers/vhost/vsock.c
> > > +++ b/drivers/vhost/vsock.c
> > [ ... ]
> > > @@ -882,6 +882,10 @@ static int vhost_vsock_set_features(struct vhost_vsock *vsock, u64 features)
> > >               goto err;
> > >       }
> > >
> > > +     if (!(features & (1ULL << VIRTIO_F_ACCESS_PLATFORM)) &&
> > > +         vsock->dev.iotlb)
> > > +             vhost_clear_device_iotlb(&vsock->dev);
> >
> > [Severity: Critical]
> > If userspace clears the VIRTIO_F_ACCESS_PLATFORM feature while the device is
> > running, can this allow arbitrary writes to host kernel memory?
> >
> > When VIRTIO_F_ACCESS_PLATFORM is enabled, vq_access_ok() intentionally
> > returns true without validating addresses, deferring validation to the
> > iotlb.
> >
> > If userspace provides arbitrary kernel addresses via VHOST_SET_VRING_ADDR,
> > starts the device, and then dynamically clears the feature,
> > vhost_clear_device_iotlb() sets vq->iotlb to NULL on the fly.
> >
> > Since the existing vring addresses are never re-validated, a concurrent
> > worker thread calling vhost_put_used() -> vhost_copy_to_user() will
> > observe !vq->iotlb and fall back to __copy_to_user().
> >
> > Because __copy_to_user() omits bounds checking, it will write to the
> > previously configured unvalidated kernel addresses.
> >
> > Should the vring addresses be re-validated, or the device stopped, before
> > dropping the iotlb?
> >
> 
>  I was able to reproduce the vring issue described here with a userspace test.
> 
>  A complete fix may require broader changes and could alter the
> existing userspace contract,
> so I am not sure that the additional scope is justified. The
> conservative approach

I'm not sure i understand. Alter the contract how?

> I am considering is to allow the transition only when no VQ backend is attached:
> clear the IOTLB, invalidate the cached vring addresses, and require
> userspace to configure them again.
> If a backend is attached, the helper would return -EBUSY before
> modifying any state.
> 
> This differs from the suggestion in
> <20260730104857-mutt-send-email-mst@kernel.org> to discard
> the IOTLB and let the kernel rebuild it. I am unsure whether returning
> -EBUSY while a backend is active is compatible
> with existing userspace flows, or whether live transitions should
> instead be preserved by quiescing the queues first.
> 
> I plan to prepare v6 along this conservative line, but I would
> appreciate guidance on whether this is the right approach and
> whether -EBUSY for an active backend is acceptable.
> 
> Thanks.
> 
> > [Severity: High]
> > Could clearing the iotlb here create a data race with concurrent worker
> > threads?
> >
> > Looking at vhost_clear_device_iotlb() in drivers/vhost/vhost.c, it
> > locklessly sets d->iotlb to NULL before acquiring vq->mutex for the
> > virtqueues:
> >
> > drivers/vhost/vhost.c:vhost_clear_device_iotlb() {
> >     iotlb = d->iotlb;
> >     d->iotlb = NULL;
> >
> >     for (i = 0; i < d->nvqs; ++i) {
> >         struct vhost_virtqueue *vq = d->vqs[i];
> >         mutex_lock(&vq->mutex);
> >         ...
> > }
> >
> > If a worker thread is concurrently executing vhost_copy_to_user() ->
> > translate_desc(), it holds vq->mutex. The ioctl thread will block on
> > the mutex but has already cleared d->iotlb locklessly.
> >
> > In translate_desc(), the code evaluates the iotlb pointer:
> >
> > drivers/vhost/vhost.c:translate_desc() {
> >     ...
> >     struct vhost_iotlb *umem = dev->iotlb ? dev->iotlb : dev->umem;
> >     ...
> > }
> >
> > It observes dev->iotlb as NULL and falls back to dev->umem. Since
> > dev->umem is NULL when using an iotlb, passing umem to
> > vhost_iotlb_itree_first() will unconditionally dereference iotlb->root,
> > crashing the host kernel.
> >
> > Would it be safer to clear d->iotlb after the virtqueues are quiesced?
> >
> > [Severity: High]
> > This is a pre-existing issue, but is vhost_net_set_features() in
> > drivers/vhost/net.c missing the exact same cleanup introduced here?
> >
> > When userspace clears VIRTIO_F_ACCESS_PLATFORM via the
> > VHOST_SET_FEATURES ioctl on a vhost-net device, n->dev.iotlb is left
> > attached. This completely misses the newly introduced
> > vhost_clear_device_iotlb() cleanup.
> >
> > Should the identical fix be applied to vhost-net to prevent memory
> > isolation bypasses via stale translation entries?
> >
> > > +
> > >       if ((features & (1ULL << VIRTIO_F_ACCESS_PLATFORM))) {
> > >               if (vhost_init_device_iotlb(&vsock->dev))
> > >                       goto err;
> >
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260814072903.124991-1-physicalmtea@gmail.com?part=2

