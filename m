Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5E3B2FCE
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855275; cv=none; b=lmrl09NGysx/HxIZZ0mnT3pkyQMug8RCWYpYuFBj1uNl1TNBPjhMyf3gYN5P56oWkRL4xLWVuvFpUf1tQ1TAAoLwilYYnvpq95+XcCKM5DBqozYH71UawoRUbwCwY5VaDBlo5QVO53oDikaWX0or83xJrmIA0zoHJ17+1qrFrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855275; c=relaxed/simple;
	bh=p0hrqdChiW+STst7BxkT07ROO3GuAhUQ7F3vjs7ZfoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AhG5Kgxk3lq8C8Q91iqKSj6FyzJa8BCTa+MUNP8IGK75zLjLL4UN7stdZ9N3aFWEG13mvHIr7gi+WsCrdEbTpRIa3/kmC7lX/vYxsChBwf+ic57E07ZyMnfPyIiMKuFK38AydHhhBvnZEnRf3Pd1Quq8wm7Yb6u3ObI4CTVvy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fh4JeYz+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fh4JeYz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788855273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ACV6/WKaVrWxyqCJOW8h61Ofi+NiZkidjU4efmY89RE=;
	b=Fh4JeYz+a9gmfL13iNsC4bUmzOEki3ipzE4sKCx42UW0q2coZJqFU2DstdQ8RAhY3ABIwF
	8vZdRjxOHI1aIEk+l+281Z7Rkzzd1k3PVMjYAR5AWkxaCYXq3QFDtMlay4j6M82nMRLIWT
	d2ufYrK4FZE1G//xBl9/PS+nE4N04AQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-8Uip3oQNPCWw4jTMpRf4cg-1; Tue, 08 Sep 2026 04:14:29 -0400
X-MC-Unique: 8Uip3oQNPCWw4jTMpRf4cg-1
X-Mimecast-MFC-AGG-ID: 8Uip3oQNPCWw4jTMpRf4cg_1788855269
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843e59c32dso2786592f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 01:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855268; x=1789460068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ACV6/WKaVrWxyqCJOW8h61Ofi+NiZkidjU4efmY89RE=;
        b=Ba5bUN1o9pHQzSJzoBEOUffuibU6oRhw0yzGW0ySM0qOtG2fs1v6LPufDJpSj0obSy
         V1OKPsvfeNTa7AzezFP+4wE+Ba9x64Vqea/37RW/Pb/m3sBqlxr5+S59eUKXQ5rcN5NC
         zeR2fuhux3e4npzQMfE70fFnLPLxakIBc+t70P915aimS3pOM03ekSbf7e8uB1J6/wre
         J9cUy7P+kVwjh2kqFyAcnHucu/BGl9irxcby+q7CDjtcahleGgliOVIIwIJ7J+UiYVlH
         yQiCcR/hEkEGFC1IHs3UnGt2wukSEN3pY3UmzmcoWVdTx0X3pOwwmEFEXx05HtO1wbj2
         V3Mg==
X-Gm-Message-State: AFuF++keQRGGhGGHot0zqTM4JYUGTCi+QWDMlA4voM4PuavewymMFikk
	YuLskdAPCe1k/obPkFSnAUX0mh990zDcbH8Z5jzzVcYhg4YE67oGny7kK7fbaoq0chxV/bba8kM
	FDInEwskQ47vXQ7Bl/6jF2HZhnFS8ym16W+WDLK/edB+DnSi4dxTcKSuXn14hvwUH/vrqQwYbAu
	SEOu7TaI4MkI5lTA8t5rzXHKRfkEUSU57rHzr9yuY6Nw7pluo=
X-Gm-Gg: AYBFou1ccEd8DezsosDQ4pcJnXY0jy+t+uvRETb6taU7zwWwboLVGQQFEQJRbRTxaKY
	d0nfXi4oiAhxM/VoISwRJxMnnWFErs1idCqFlZs6EgbmGMS77rB+CQOEQ1YuDVont6SmLY0TkUd
	rsUCqFjZUFjrHRzywR8B5RJDS9gZNLHvC7NI+OOqpDtC2m+1FRvBA6tmo0B2AjtfqldhKkEXRUN
	14zVz0HtQr0fmnjGYR9wtNeP9iUFpqPGnAAQN9kzOzH2D+dKZU8bZr0vcWvwN0/s01xu5Uzp4HK
	cXGqoLJGv/AY/inFn1YRxvAYloEovivQ8M4xZKgJ4dmu5PncxxFl4USD5xqiaCUJEf1s7+otqmF
	FShSmLpkZDqjGXGeXDW6OIu0=
X-Received: by 2002:a05:6000:1e4b:b0:485:85ed:4911 with SMTP id ffacd0b85a97d-48587291427mr22863844f8f.25.1788855268431;
        Tue, 08 Sep 2026 01:14:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1e4b:b0:485:85ed:4911 with SMTP id ffacd0b85a97d-48587291427mr22863786f8f.25.1788855267857;
        Tue, 08 Sep 2026 01:14:27 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm34253540f8f.14.2026.09.08.01.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:14:27 -0700 (PDT)
Date: Tue, 8 Sep 2026 04:14:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>, dmitry.torokhov@gmail.com,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	kvm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/6] virtio_ccw: always take irq_lock in the classic
 interrupt handler
Message-ID: <20260908041323-mutt-send-email-mst@kernel.org>
References: <20260908053817.26065-1-kmehltretter@gmail.com>
 <20260908053817.26065-3-kmehltretter@gmail.com>
 <20260908055148.B600D1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908055148.B600D1F00A3F@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H9DvKFTh7bel-ya4gVdAzEJCpNHDZ-8uz8moRESyl0A_1788855269
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 05:51:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The virtio interrupt handlers pass retrieved virtqueue pointers directly to `vring_interrupt()` without a NULL check. A malicious or buggy host can trigger a kernel panic by providing an invalid indicator or interrupt vector.

Buggy host crashing guest is not something we worry about.
Host denying guest service at will is exactly how cloud providers get paid.

> - [High] Lost configuration change notifications due to clearing the indicator bit after processing.
> --
> 
> commit 40545ed73d4381a07a7934fddf3ac60ecd1f90d7
> Author: Karl Mehltretter <kmehltretter@gmail.com>
> Subject: virtio_ccw: always take irq_lock in the classic interrupt handler
> 
> This commit unconditionally takes the read lock on vcdev->irq_lock in 
> virtio_ccw_int_handler() so the write side can properly synchronize with
> the callbacks even when notification hardening is disabled.
> 
> > diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> > index b90299205698b..552d779980129 100644
> > --- a/drivers/s390/virtio/virtio_ccw.c
> > +++ b/drivers/s390/virtio/virtio_ccw.c
> > @@ -1204,13 +1204,11 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> 
> [ ... ]
> 
> >  	for_each_set_bit(i, indicators(vcdev),
> >  			 sizeof(*indicators(vcdev)) * BITS_PER_BYTE) {
> >  		/* The bit clear must happen before the vring kick. */
> > @@ -1219,9 +1217,7 @@ static void virtio_ccw_int_handler(struct ccw_device *cdev,
> >  		vq = virtio_ccw_vq_by_ind(vcdev, i);
> >  		vring_interrupt(0, vq);
> 
> [Severity: High]
> This is a pre-existing issue, but is it possible for virtio_ccw_vq_by_ind()
> to return a NULL virtqueue pointer if a malicious or buggy host provides an
> invalid indicator?
> 
> Passing an unvalidated NULL pointer directly to vring_interrupt() can cause a
> kernel panic when it is dereferenced inside more_used():
> 
> drivers/virtio/virtio_ring.c:vring_interrupt() {
>     ...
>     if (!more_used(vq)) {
>         pr_debug("virtqueue interrupt with no work for %p\n", vq);
>     ...
> }
> 
> Similarly, in virtio_airq_handler(), airq_iv_get_ptr() can return NULL which
> is unconditionally passed to vring_interrupt().
> 
> Could we add a NULL check before calling the interrupt handler?
> 
> >  	}
> > -#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> >  	read_unlock(&vcdev->irq_lock);
> > -#endif
> >  	if (test_bit(0, indicators2(vcdev))) {
> >  		virtio_config_changed(&vcdev->vdev);
> >  		clear_bit(0, indicators2(vcdev));
> >  	}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but could this sequence lead to
> lost configuration change notifications?
> 
> Because indicators2 is shared DMA memory updated by the host, if the host
> triggers another configuration change in the window between test_bit() and
> clear_bit(), it sets the bit in memory and raises a new interrupt.
> 
> However, the guest will then blindly execute clear_bit() and wipe out the
> newly set notification flag. When the newly queued interrupt handler runs,
> it will find the bit cleared and do nothing, permanently losing the event.
> 
> Would using test_and_clear_bit() before calling virtio_config_changed()
> close this race window?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908053817.26065-1-kmehltretter@gmail.com?part=2

