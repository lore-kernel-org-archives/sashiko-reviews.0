Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD1C47277C
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856278; cv=none; b=riyqd1JPVh74qQ5YrRP9QMC0F7PGi8AfRc8F7nh/eSSOX0JA1jpB8kptrSPHoRPuMHVIehHtASMW5rlHXMejKO8XIswpHrEWHd3duLz1j+miKEqnXakNzoZPsvGiqA5CE+oW+6Id5uUpIR1OxU7GLk9uuhUu35XjhsyTgcylZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856278; c=relaxed/simple;
	bh=bQVGmZsh54EPXaCbHVhqpE0sv9MCdcZelHyuzt63DU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FHFWuLWdB9gQfOgK5gekn+q8aDby7T45JwRlyINgm0z6cF6pMS/mzWPX7WuCa10eljUtTyrI3GO8PpWSKiC9RUgtAfnFkY8xPioa+9SpBztSpd1x0wTL24R3RYEX3yrhMCqK7Lrk0cuf9WpFMEVDtEFANIIAT/gWMkNFwK1cFjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aIXkID83; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aIXkID83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788856274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3vwxLtyfH5eqXgdY8WBSA5geJ/rIMZ7KgxZ+JZp1ZA=;
	b=aIXkID83FZBzMOs9IqwVsy7SQc+CVjXRHwcbm95LcQe34Re7gpgkJHpvslfDmtfBKHYpvG
	W3G0cCK6ifKsr87LR3xkb0J+uB9u04/tFUDlVCgBdQEjOK7edTig5sbjyC0FIM307GB1md
	pubURypBHMY+HBcNyviio9LgUPqddyI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-7IXMSWdBPI-Llhm2klsFFQ-1; Tue, 08 Sep 2026 04:31:13 -0400
X-MC-Unique: 7IXMSWdBPI-Llhm2klsFFQ-1
X-Mimecast-MFC-AGG-ID: 7IXMSWdBPI-Llhm2klsFFQ_1788856272
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49564d4b849so15211465e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 01:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856272; x=1789461072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x3vwxLtyfH5eqXgdY8WBSA5geJ/rIMZ7KgxZ+JZp1ZA=;
        b=G+NuWTc0fNFGG7WRtXcDW3WgEcBhrEoNjUVivfkBgE1eISCk5ehm6bzUll+2WNVDPh
         /h+KO224hbUx4tFYb9kWB9E1qIsXnW4scHVWyCgapl1EKlzeJcePuqOoPsGcksqelyjO
         3qOQETGlHj354+9X8ORRdKeoLR37O0NvqtPeU7gueMLkNfmSaP2zRrchThWHUZi83fv6
         /fErm0jcnCoFsI7xBECQ8OT+2MSqKetlhEEqQvTFMn/Og4NwYf98R4aD1Jt0szK0g38+
         k4fgLQN8aGkH+0QYwCrrE/CwVGxpGl7OAOXVZU11EZnE6Rhnin8UswjdnRxrBi8x/aQK
         +zLg==
X-Gm-Message-State: AFuF++lMLeDLhH+Yf4w1q4lpQaaOhXaFTvAD9aYNmRuFqrxrXaRIH9ca
	ixRXU7Cb37wHKKoIY7T/Kh4P6P8kVTXtR6Ur308BSMmSB+t/QRyooEDUtXFTLrIAKqmhiDee4Rm
	1Wd2BCNHwhwo1p06abZwxNGCp7g9vvTEq4KEirb9hp61R34olNSqM0/+LiAkNmBLqhS6/ClQDhx
	u+fCcE4+12ezAM50FD7h25SVpL7yotZolM24Ien7GJo1SeJCQ=
X-Gm-Gg: AYBFou1DNFd8pvR0rgnNctaBknHUUUJidb7gxsCQIXKYD1k5Wq+3SYQ5bR+eN4pgg0e
	8azYEbfuU7aj73bvQOOW8S40VBR/OqXWuuCFZiHaYZncV7gZza9fXkT46EB323XsVJ9Zdn2jNnk
	SSzETROB5w8PTH2qzUPHsesJWdCVeuKVPNe/46S2wJtxQeWFokbT7eyuRMVZUCeeOYXLRhlIUqc
	0E9SdVCn6MFyTQiRtxyrbWkRL626NmDV8uGtgIir46iSPKAQczHvnIarks4NEypuP2GFHahRNLG
	ZsWT6Zgz2wZbkBk+1U8yR42zSOfJYPYYSdPR3dUh40THqCV38gG4QpKRkq7umnF1UTuHOnLLVtd
	JrpSRGObZn6QrC4Xa0ZcbItI=
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr252852065e9.24.1788856272010;
        Tue, 08 Sep 2026 01:31:12 -0700 (PDT)
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr252851425e9.24.1788856271518;
        Tue, 08 Sep 2026 01:31:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm254295465e9.4.2026.09.08.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:31:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 04:31:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	kvm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] virtio_vdpa: implement synchronize_cbs()
Message-ID: <20260908043004-mutt-send-email-mst@kernel.org>
References: <20260908053817.26065-1-kmehltretter@gmail.com>
 <20260908053817.26065-7-kmehltretter@gmail.com>
 <20260908055159.E49DF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908055159.E49DF1F00A3A@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XB_htFxbFXZrmoRJFBVlGkeIo_DHx4660xsKNGJZcOE_1788856272
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 05:51:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Possible Use-After-Free of virtqueue memory in callback during find_vqs error handling
> --
> 
> commit 05a7e5947030bc4c942e05c96bf1d657ed426d56
> Author: Karl Mehltretter <kmehltretter@gmail.com>
> 
> virtio_vdpa: implement synchronize_cbs()
> 
> virtio_vdpa relies on the core's synchronize_rcu() fallback for callback
> synchronization. This commit adds an SRCU domain per device and implements
> synchronize_cbs() with synchronize_srcu() to cover the callbacks regardless
> of the calling context.
> 
> > diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> > index 6bcf4567a9292..f9559b6b2e0b6 100644
> > --- a/drivers/virtio/virtio_vdpa.c
> > +++ b/drivers/virtio/virtio_vdpa.c
> [ ... ]
> > @@ -123,8 +128,22 @@ static irqreturn_t virtio_vdpa_config_cb(void *private)
> >  static irqreturn_t virtio_vdpa_virtqueue_cb(void *private)
> >  {
> >  	struct virtqueue *vq = private;
> > +	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vq->vdev);
> 
> [Severity: High]
> This is a pre-existing issue, but could this callback be invoked
> concurrently on a freed vq, leading to a use-after-free when
> dereferencing vq->vdev?
> 
> During driver probe, if virtio_vdpa_find_vqs() successfully creates some
> virtqueues but fails on a subsequent one, it jumps to err_setup_vq and
> calls virtio_vdpa_del_vqs():
> 
> drivers/virtio/virtio_vdpa.c:virtio_vdpa_find_vqs() {
>     ...
> err_setup_vq:
> 	virtio_vdpa_del_vqs(vdev);
>     ...
> }
> 
> This tears down the previously created virtqueues. However, the callback is
> not cleared with set_vq_cb(..., NULL), nor does it synchronize with pending
> or concurrently running interrupt handlers (such as vp_vdpa_vq_handler).
> 
> Could a spurious or device-initiated interrupt occurring right before or
> during vring_del_virtqueue(vq) race and cause virtio_vdpa_virtqueue_cb()
> to dereference the freed vq structure when accessing vq->vdev?


IRQs are not yet allocated then are they?
Looks like a false positive to me.

> > +	irqreturn_t ret;
> > +	int idx;
> > +
> > +	idx = srcu_read_lock(&vd_dev->cb_srcu);
> > +	ret = vring_interrupt(0, vq);
> > +	srcu_read_unlock(&vd_dev->cb_srcu, idx);
> > +
> > +	return ret;
> > +}
> > +
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908053817.26065-1-kmehltretter@gmail.com?part=6

