Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030405;
	b=JPNnZ1xmXU9J1eVqNWYxQdbTS5itNlADlfIHjyacdAMPc1gD4s3b+8RwxHUp9XV/UPQP
	 eu4eNor42dr4D3eF0vbBK1mPkoSV75jgMpSbIopows8QXdm83raF2zN/+0quA/tx0b9RV
	 ZJQtvQlPi+Uv6aieoIXLgRm1NKdHzrn7e6yhrCI53s2NnOpXexp3Zt9fHWe+kizfSHjNl
	 31K7g5bzyAKWA9y52m1od6scVO4GTFpCf3ldjC1HN/El0vNjZr7A6VKyuwHWpxv6/C6y7
	 Af8DACqdODvEbdN7jezu9Wru7B3yf8c4360XbAUhAZOCZO7U7vlINX4xYhzvR9QAi8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030405;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=c2WuH6kPMXMbpt315DBFCc0jlTBpS0O6mr9XG8/O1sU=;
	b=2MKtZWd7iEbym8fIsrSQyFk7WSc5uyON9YXxk55SgAmid+if0S4inrxlItg9OoO+HuVA
	 YuJ93Ru87D/JJJtq0/X0wENyaEpxkW0J/wjMyFMtEU3OYb3zxBEwpTdC1t+0Azd50g1cd
	 j8fTzNX4Q3ueY+QwVojyUZh6UYc8glfov0A/GdGUubHKrlBOagzSPMDt3sF5v5addOIUG
	 JAvSjKq1MY2rAVUdJl9JQHBaT0kAyxdCcFD9UsBobIH79UWbkhhkSauc09FkM20EleRA+
	 lFfemnu4ZtPTl0lX/gK6DRRxtKBEirxbjOD4I9ieHWFKzuh7T8e7qOWpSZYfk2I4wuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yv5MZwMW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0297606A31D
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 16:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0297606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yv5MZwMW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793030404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2WuH6kPMXMbpt315DBFCc0jlTBpS0O6mr9XG8/O1sU=;
	b=Yv5MZwMW3rB2YkZOz65XntZBYKXcurnyLAyf8xwkMoPgehgOw+cXK3zTxEZ7ADSga6MHHb
	ufOVfSzSJhdzSNbEmF0wgXkRpxZDnoBGXgYGf6Ds/7s6SI/cCXx55DIYiSiHRiHrzAuKGN
	fujkHFyioNd9lq3+wJ6WcLdbukHI/Ig=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-_UKfFEt7PV-U9Aagby5Ycw-1; Mon, 26 Oct 2026 12:00:02 -0400
X-MC-Unique: _UKfFEt7PV-U9Aagby5Ycw-1
X-Mimecast-MFC-AGG-ID: _UKfFEt7PV-U9Aagby5Ycw_1793030401
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e1ad3cb66so1873616f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 09:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030401; x=1793635201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c2WuH6kPMXMbpt315DBFCc0jlTBpS0O6mr9XG8/O1sU=;
        b=W9G0jki9V9LqZjdIVnACxcL5Dk3r/x9+XsGEr+CuCLH4N6cZEoFHwphbH3m5DW8vFe
         p8EX12gT/IyhAsoT88BqG06g7EN7PFjxboNId6n0M8jAMUAQu7zJu6/QWGW+XS3TVRGB
         STnGxZ17oF01AE7y5pl3l36coVrMUinGDUEryBwNOyUGU1fSDF52YJ+GPxLNPxkRJHzG
         EdOuFP0xc8Cjy3lmH85MxJvkvItbvIrbaxcih1TeFXLkJvKtdem+MYAKrEv49aiBia0e
         T3kzQWEc1Eh2I/hjGSjdfQNOxRHUySMY0o7yiFuOFw7ctRnY2ZSbukyYpWh9n/7D54eS
         LNHw==
X-Gm-Message-State: AFq9FYJt01aBGIihPSqKupTEcNOCq3FVvl3WE7JD0I+9mpD8yTVOLuPz
	ZxV4Pvr9ZgV1CCCG0nBCQ4K23Hk80FaTt2IbjMJAMOY04vTeARGa/5Il8S6qyEJJC3Pp4L6tjg3
	F2ElSNJBWhirv189dZQbNpjQxGOBlT0hhGP9n09uefrCz8I0uGSDmge9ARwntF631cDC4ldWdTk
	pUCCHu8ua3q+XrlSTSYh6GWYngG7Wgn43KdScMetAHxoqny6c=
X-Gm-Gg: AYBFou32o9Q5OLlp2i/EMG206qHyfubA21JzEVGjY+cvvaZ9eNcivU9OYeADoIrcbNZ
	/eUkJ7MxXQtJjXsWrQHLszNxS9dxcnFJ40dMUnbjnSSodZvQVmg8HQVNB1j4l0uY+tXSUHRDUmw
	7T53plaG4rRjJT29dEGSRE98jRKLtLgwqRJk4iBI8XyLlOuxQwM8KGyNXZ2AMLxAsw2WiAQD6d0
	+FnZ24NZAL2Bgvv43RXXawAHpwHITkxCwXRYVqCEqPE299sZA5zelNLMGEPuLgc2CXC+jSw/ajF
	762wLj8lVKT4Gu/bE2t0qOu//VEo//281astlnc0pGMU02WDYEjeAvntuAPiJ2ZCu4Y=
X-Received: by 2002:a05:6000:4a0a:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e3eac8e4bmr14090335f8f.0.1793030400974;
        Mon, 26 Oct 2026 09:00:00 -0700 (PDT)
X-Received: by 2002:a05:6000:4a0a:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e3eac8e4bmr14090282f8f.0.1793030400293;
        Mon, 26 Oct 2026 09:00:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm17417900f8f.17.2026.10.26.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:59:59 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:59:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, Eugenio Perez <eperezma@redhat.com>
Subject: Re: [PATCH 1/2] virtio_ring: add virtqueue_enable_cb_delayed_max
Message-ID: <20261026115933-mutt-send-email-mst@kernel.org>
References: <ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com>
 <sashiko-outbox-185433@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-185433@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s1sqlkPNqeGOsX_LNQoNChfjC3VROhk0FKS4TF800UE_1793030401
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 03:24:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] virtio_ring: off-by-one in virtqueue_enable_cb_delayed_max_split()
> - [High] virtio_ring: off-by-one in virtqueue_enable_cb_delayed_max_packed()
> - [High] virtio_ring: missing vq->broken check in virtqueue_enable_cb_delayed_max()
> - [Medium] virtio_ring: missing READ_ONCE() in virtqueue_enable_cb_delayed_max_split()
> --
> 
> commit f77f0cd19bbfba432c2d11a8e7e8a7c7597a610a
> Author: Michael S. Tsirkin <mst@redhat.com>
> 
> virtio_ring: add virtqueue_enable_cb_delayed_max
> 
> This commit introduces virtqueue_enable_cb_delayed_max(), which arms the
> virtqueue callback with the used event placed at the last currently queued
> buffer so that the device only notifies the driver once all queued buffers
> have been used.
> 
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index db678f5a80e03..98b630fc6f8f6 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> [ ... ]
> > @@ -1165,6 +1166,42 @@ static bool virtqueue_enable_cb_delayed_split(struct vring_virtqueue *vq)
> >  	return true;
> >  }
> >  
> > +static bool virtqueue_enable_cb_delayed_max_split(struct vring_virtqueue *vq)
> > +{
> > +	u16 bufs;
> > +
> > +	START_USE(vq);
> > +
> > +	/* We optimistically turn back on interrupts, then check if there was
> > +	 * more to do. */
> > +	/* Depending on the VIRTIO_RING_F_USED_EVENT_IDX feature, we need to
> > +	 * either clear the flags bit or point the event index at the next
> > +	 * entry. Always update the event index to keep code simple. */
> > +	if (vq->split.avail_flags_shadow & VRING_AVAIL_F_NO_INTERRUPT) {
> > +		vq->split.avail_flags_shadow &= ~VRING_AVAIL_F_NO_INTERRUPT;
> > +		if (!vq->event)
> > +			vq->split.vring.avail->flags =
> > +				cpu_to_virtio16(vq->vq.vdev,
> > +						vq->split.avail_flags_shadow);
> > +	}
> > +	/* Point the used event at the last queued buffer: the device
> > +	 * will only notify us once it has used everything. */
> > +	bufs = (u16)(vq->split.avail_idx_shadow - vq->last_used_idx);
> > +
> > +	virtio_store_mb(vq->weak_barriers,
> > +			&vring_used_event(&vq->split.vring),
> > +			cpu_to_virtio16(vq->vq.vdev, vq->last_used_idx + bufs));
> > +
> > +	if (unlikely((u16)(virtio16_to_cpu(vq->vq.vdev, vq->split.vring.used->idx)
> > +						- vq->last_used_idx) > bufs)) {
> > +		END_USE(vq);
> > +		return false;
> > +	}
> 
> [Severity: High]
> Is there an off-by-one in how bufs and vring_used_event are computed in
> virtqueue_enable_cb_delayed_max_split()?

Ugh. I actually fixed it, but forgot to commit (
Will fix in v2.


> 
> Here bufs is set to (u16)(vq->split.avail_idx_shadow - vq->last_used_idx),
> so vq->last_used_idx + bufs equals vq->split.avail_idx_shadow. Per the
> virtio specification and vring_need_event():
> 
> include/uapi/linux/virtio_ring.h:vring_need_event() {
> 	return (__u16)(new_idx - event_idx - 1) < (__u16)(new_idx - old);
> }
> 
> event_idx is 0-indexed and triggers a notification when used->idx (new_idx)
> transitions from event_idx to event_idx + 1 (for example,
> virtqueue_enable_cb_prepare_split() writes vq->last_used_idx + 0 to be
> notified when the first buffer is used and used->idx reaches
> vq->last_used_idx + 1). When the device consumes all queued buffers,
> used->idx advances to vq->split.avail_idx_shadow. With event_idx also set
> to vq->split.avail_idx_shadow, (u16)(new_idx - event_idx - 1) underflows to
> 0xffff, so vring_need_event() evaluates to false and the device never sends
> an interrupt when the batch finishes.
> 
> In addition, in the post-barrier race check:
> 
> 	if (unlikely((u16)(virtio16_to_cpu(vq->vq.vdev, vq->split.vring.used->idx)
> 						- vq->last_used_idx) > bufs)) {
> 
> because only bufs (avail_idx_shadow - last_used_idx) buffers have been made
> available to the device in total, (u16)(used->idx - vq->last_used_idx) can
> at most equal bufs when every queued buffer has been used and can never be
> strictly greater than bufs. Even if the device already consumed all queued
> buffers before vring_used_event or avail->flags was updated, this check
> always evaluates to false and virtqueue_enable_cb_delayed_max_split()
> returns true, causing callers to sleep forever waiting for a notification
> that will never arrive.
> 
> [Severity: Medium]
> Also in virtqueue_enable_cb_delayed_max_split(), should the read of
> vq->split.vring.used->idx use vring_read_split_used_idx(vq) instead of
> reading vq->split.vring.used->idx directly?
> 
> Commit 32fe1de5c124 ("virtio_ring: Add READ_ONCE annotations for
> device-writable fields") introduced vring_read_split_used_idx(vq) to wrap
> the lockless read of device-writable vq->split.vring.used->idx in
> READ_ONCE(), which is what virtqueue_enable_cb_delayed_split() uses:
> 
> drivers/virtio/virtio_ring.c:virtqueue_enable_cb_delayed_split() {
>     ...
> 	if (unlikely((u16)(vring_read_split_used_idx(vq)
> 					- vq->last_used_idx) > bufs)) {
>     ...
> }
> 
> > +
> > +	END_USE(vq);
> > +	return true;
> > +}
> [ ... ]
> > @@ -2391,6 +2428,67 @@ static bool virtqueue_enable_cb_delayed_packed(struct vring_virtqueue *vq)
> >  	return true;
> >  }
> >  
> > +static bool virtqueue_enable_cb_delayed_max_packed(struct vring_virtqueue *vq)
> > +{
> > +	u16 used_idx, wrap_counter, last_used_idx;
> > +	u16 bufs;
> > +
> > +	START_USE(vq);
> > +
> > +	/*
> > +	 * We optimistically turn back on interrupts, then check if there was
> > +	 * more to do.
> > +	 */
> > +
> > +	if (vq->event) {
> > +		/* Point the event at the last queued buffer: the device
> > +		 * will only notify us once it has used everything. */
> > +		bufs = vq->packed.vring.num - vq->vq.num_free;
> > +		last_used_idx = READ_ONCE(vq->last_used_idx);
> > +		wrap_counter = packed_used_wrap_counter(last_used_idx);
> > +
> > +		used_idx = packed_last_used(last_used_idx) + bufs;
> > +		if (used_idx >= vq->packed.vring.num) {
> > +			used_idx -= vq->packed.vring.num;
> > +			wrap_counter ^= 1;
> > +		}
> > +
> > +		vq->packed.vring.driver->off_wrap = cpu_to_le16(used_idx |
> > +			(wrap_counter << VRING_PACKED_EVENT_F_WRAP_CTR));
> > +
> > +		/*
> > +		 * We need to update event offset and event wrap
> > +		 * counter first before updating event flags.
> > +		 */
> > +		virtio_wmb(vq->weak_barriers);
> > +	}
> > +
> > +	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {
> > +		vq->packed.event_flags_shadow = vq->event ?
> > +				VRING_PACKED_EVENT_FLAG_DESC :
> > +				VRING_PACKED_EVENT_FLAG_ENABLE;
> > +		vq->packed.vring.driver->flags =
> > +				cpu_to_le16(vq->packed.event_flags_shadow);
> > +	}
> > +
> > +	/*
> > +	 * We need to update event suppression structure first
> > +	 * before re-checking for more used buffers.
> > +	 */
> > +	virtio_mb(vq->weak_barriers);
> > +
> > +	last_used_idx = READ_ONCE(vq->last_used_idx);
> > +	wrap_counter = packed_used_wrap_counter(last_used_idx);
> > +	used_idx = packed_last_used(last_used_idx);
> > +	if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
> > +		END_USE(vq);
> > +		return false;
> > +	}
> 
> [Severity: High]
> Won't virtqueue_enable_cb_delayed_max_packed() also place driver->off_wrap
> one past the last queued descriptor and miss the completion interrupt?
> 
> When bufs = vq->packed.vring.num - vq->vq.num_free descriptors are queued,
> they occupy offsets 0 through bufs - 1 starting from
> packed_last_used(last_used_idx). Adding bufs to
> packed_last_used(last_used_idx) sets used_idx to vq->packed.next_avail_idx
> (with vq->packed.avail_wrap_counter), which is the next free descriptor
> slot that has not been made available to the device.
> 
> With VRING_PACKED_EVENT_FLAG_DESC, the device notifies the driver when it
> marks the descriptor at driver->off_wrap as used (for comparison,
> virtqueue_enable_cb_prepare_packed() sets driver->off_wrap to
> vq->last_used_idx, i.e. offset 0, to trigger when the first queued
> descriptor is used). Because no descriptor is queued at next_avail_idx (and
> if the last queued buffer is a multi-descriptor direct chain, the device
> writes the used completion to the head descriptor of that chain), the
> device stops at next_avail_idx without ever using the descriptor at
> driver->off_wrap.
> 
> When the post-barrier check then tests is_used_desc_packed() at
> packed_last_used(last_used_idx) and sees the first queued buffer is not yet
> used, virtqueue_enable_cb_delayed_max_packed() returns true and the caller
> sleeps forever waiting for an interrupt at next_avail_idx that never
> arrives.
> 
> > +
> > +	END_USE(vq);
> > +	return true;
> > +}
> [ ... ]
> > @@ -3278,6 +3380,29 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *_vq)
> >  }
> >  EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed);
> >  
> > +/**
> > + * virtqueue_enable_cb_delayed_max - callback for all queued buffers
> > + * @_vq: the struct virtqueue we're talking about.
> > + *
> > + * Like virtqueue_enable_cb_delayed, but with VIRTIO_RING_F_EVENT_IDX
> > + * the used event is placed at the last currently queued buffer, so the
> > + * device only notifies us once it has used everything we queued.
> > + *
> > + * Returns "true" if the callback is armed and we can sleep waiting
> > + * for the notification, or "false" if some buffers were already used
> > + * and we should poll instead.
> > + */
> > +bool virtqueue_enable_cb_delayed_max(struct virtqueue *_vq)
> > +{
> > +	struct vring_virtqueue *vq = to_vvq(_vq);
> > +
> > +	if (vq->event_triggered)
> > +		data_race(vq->event_triggered = false);
> > +
> > +	return VIRTQUEUE_CALL(vq, enable_cb_delayed_max);
> > +}
> 
> [Severity: High]
> Should virtqueue_enable_cb_delayed_max() check if (unlikely(vq->broken))
> and return true, matching virtqueue_enable_cb_delayed()?
> 
> Commit 0d0eff39ceb3 ("virtio_ring: fix infinite loop in
> virtnet_poll_cleantx when device is broken") added:
> 
> drivers/virtio/virtio_ring.c:virtqueue_enable_cb_delayed() {
> 	struct vring_virtqueue *vq = to_vvq(_vq);
> 
> 	if (unlikely(vq->broken))
> 		return true;
>     ...
> }
> 
> because virtqueue_get_buf_ctx_split() and virtqueue_get_buf_ctx_packed()
> immediately return NULL when vq->broken is true without detaching buffers
> or advancing vq->last_used_idx. Without this check in
> virtqueue_enable_cb_delayed_max(), if vq->broken becomes true while used
> descriptors remain in the ring, a caller polling until
> virtqueue_enable_cb_delayed_max() returns true will spin forever because
> virtqueue_get_buf() returns NULL without advancing vq->last_used_idx while
> virtqueue_enable_cb_delayed_max() repeatedly returns false.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/ad6a530f49c4a0e182112a73789e31b5e91f3bb7.1793026707.git.mst@redhat.com?part=1

