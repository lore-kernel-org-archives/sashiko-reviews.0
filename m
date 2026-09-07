Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C53E49F4
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 21:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816007; cv=none; b=OJedcQ5A0W0Z5EKEWFZBnWI0xw5pqfIoft20Y7VyVwwXmrhHpTdB2h3hTBeJcs5CVkZthQUTmYgEq7EhJsKf+7CxniLgsPPeDLpi107pwfCHi4y4UDKGc/QYGylfkvLo7VGwM+y5XaZwV3G5xcL4+Zo7hfHKp8jPTE8U32JmaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816007; c=relaxed/simple;
	bh=k/QImo2NCCg/3TCmY5Vmxee1X5XnCsMH8Zic6TCGMok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gKv8GvFnRCmh66nBPp+7yWJkypqzgAYhzhganEujMcPHyTZTC5CMFY8BDQ7M/umfbriUOoMZJBG6y9y/rcEjFziNepjP7L84XO/e9HnN6dcCYrXLQMrKq40ENcWDYb0zYo197pDzZIT27gvyufm2QMX7AMskTM/ZyCnxbaodLnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPfpvjV4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPfpvjV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788816005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNqMvmk3XjOuru6dfpLyr8VojH7qEb8Z1Jw+8letoJM=;
	b=GPfpvjV4KK3GVMD9YFmKKVm9YX8RrQNW/1u7yco+0lcm/O9Iiq1zPPMtmyWEhCF5uU+L3g
	JyQ1qXRuJTfBhjAAgNp4W+9VBol07MqfwwCFbaQA4Ro2j+xzxoMvK/ELTvVLFJglWIK4qx
	c7iZSXf4vnWCLDAwkDiqmSTmQ+mRQi4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-HQkrkQflMv6dOqF0E9eHWQ-1; Mon, 07 Sep 2026 17:20:04 -0400
X-MC-Unique: HQkrkQflMv6dOqF0E9eHWQ-1
X-Mimecast-MFC-AGG-ID: HQkrkQflMv6dOqF0E9eHWQ_1788816003
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49554715277so38472005e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 14:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816003; x=1789420803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dNqMvmk3XjOuru6dfpLyr8VojH7qEb8Z1Jw+8letoJM=;
        b=ndnt3/xMpFNzaWFSSP3+N7B7mWR9XazrZWUR0uUAt3biJJw5rUwQoxkRcYuMY8ILom
         g8yezucKeV6jcoGxJzYNdwJKF9VVi2yfCsFBpZbz/7XVCk0jdvuU4cV/41Ywgx/NkL0S
         guhot32qBRMLnL2f07LgymA/KQO3pW2CvSYgOa/myJ1xpAMLsyhtriql9Ao2JAvDkFZp
         vSJDt4z0hZDREPej4WuAcfydWhS5dTrMYiXtMhacbGfE9yxn1lkzQgO8VnrA06xGRA1a
         Nw6H/uJzl8wm5UmITy9qjbmAFw4jTxj4k4ZWjrYIDSMA83Q+2hTiUkEx5QKik30iXkLJ
         IWBw==
X-Gm-Message-State: AFuF++mIid31HMq2RPScRF0C2Oo6ALoBrsGQh97NlShQq3pCni2TDRJs
	5Wlq1p+dnYIjkPZ6nwXUGRmwqb7dmk7gUuP9njmD7wbYNh3Ztwon1dhFayvFFM4o0I/kGtyWAwU
	Tli3Nf6ip7wkQ5YJFfmBYVEZi3M+cUhwe25JKDf8ML3JY7hSO2qkLOZtP+llsWEbGmJxswyX5VW
	Lc6WzWjL80OUsl6JwPLr9yvPC6HzHYRMUGgXNRoCY+2jcAobw=
X-Gm-Gg: AYBFou1pyG/tDTVHq392yuhIAtd0Fo4a9b8v/cTeklorczjLQHVOtt8FElddp9SOrVn
	UtoGIhNmhZH7RnDoV6M5Q3CJJQ/6bDh3McHXjIsVXH2eMCK0if5wAV6ny+a9fVPp/Yfq5sayVdX
	7H4W528/dLWSS7LEoV1muS9cRFv8okYqPqeCc6tvnyFzC3Gi34kU1R2be4OPYUdWJTlR/sLTruE
	djW9QTdOazEvSvbeLMaFL6ZAutYxTUv7pekXVYZA1kq4yag2WCS0cImP6/gZNcR78mGWF0DVJkM
	iTWzEkTmCFHA7tEl95Dc7yhnWQ6wGw+PLkaOxoKwoyLyF1mWT6Xt3HCIA0nNM+a7oDA7kFkm3BF
	ji0HP1nt7QKdYVycAq54ke5U=
X-Received: by 2002:a05:6000:491a:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-4858704a9d7mr51670320f8f.8.1788816002953;
        Mon, 07 Sep 2026 14:20:02 -0700 (PDT)
X-Received: by 2002:a05:6000:491a:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-4858704a9d7mr51670251f8f.8.1788816002441;
        Mon, 07 Sep 2026 14:20:02 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm32653149f8f.30.2026.09.07.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:20:01 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:19:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-s390@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, kvm@vger.kernel.org,
	linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <20260907171921-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
 <20260905153357.7FE5E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260905153357.7FE5E1F00A3A@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UwhclLExkGzqIKqjs6Ckxd_-el2iQTJ5dHN5x4jJ0oc_1788816003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Sep 05, 2026 at 03:33:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing `virtio_reset_device()` in the error path of `virtinput_probe()` before deleting virtqueues, potentially leading to use-after-free or memory corruption by the active hardware/hypervisor.

This one is fixed in my tree.

> - [High] The driver leaks DMA mappings for unconsumed buffers in the event virtqueue (`vi->evt`) upon device removal or suspend/freeze.
> --
> 
> commit 71bbbcca0b03e3c67fa905a8357e9d3ad23e7fe4
> Author: Karl Mehltretter <kmehltretter@gmail.com>
> 
> virtio_input: stop callbacks before unregistering input device
> 
> virtinput_remove() unregisters the input device before resetting the
> virtio device. virtinput_recv_events() drops vi->lock around input_event(),
> so clearing vi->ready does not stop a callback that passed the entry check.
> It can still use vi->idev, requeue buffers and kick the queue.
> 
> > diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
> > index deec24e8e6828..7b654af0a42cb 100644
> > --- a/drivers/virtio/virtio_input.c
> > +++ b/drivers/virtio/virtio_input.c
> [ ... ]
> > @@ -350,8 +353,9 @@ static void virtinput_remove(struct virtio_device *vdev)
> >  	vi->ready = false;
> >  	spin_unlock_irqrestore(&vi->lock, flags);
> >  
> > -	input_unregister_device(vi->idev);
> > +	/* Callbacks use vi->idev. */
> >  	virtio_reset_device(vdev);
> > +	input_unregister_device(vi->idev);
> >  	while ((buf = virtqueue_detach_unused_buf(vi->sts)) != NULL)
> >  		kfree(buf);
> >  	vdev->config->del_vqs(vdev);
> 
> [Severity: High]
> This is a pre-existing issue, but does this cleanup leak DMA mappings for
> the event virtqueue (vi->evt)?
> 
> The cleanup loop correctly detaches and unmaps vi->sts using
> virtqueue_detach_unused_buf(), but it ignores vi->evt. Since
> virtinput_fill_evt() populates vi->evt with buffers using
> virtqueue_add_inbuf_cache_clean(), which establishes DMA mappings under
> the hood, omitting the detachment step leaves these mappings active.
> 
> Does this result in a persistent DMA mapping leak every time the device is
> unbound? Furthermore, since the memory for these buffers (vi->evts) is freed,
> does this leave active DMA mappings pointing to freed memory, posing a memory
> corruption risk if delayed DMA occurs?
> 
> Does this exact same DMA mapping leak also occur during the power management
> suspend cycle in virtinput_freeze() which performs the same cleanup?
> 
> [Severity: High]
> This is also a pre-existing issue, but is there a missing
> virtio_reset_device() in the error path of virtinput_probe()?
> 
> Looking at virtinput_probe(), the device is marked as ready:
> 
> drivers/virtio/virtio_input.c:virtinput_probe() {
>     ...
> 	virtio_device_ready(vdev);
> 	vi->ready = true;
> 	err = input_register_device(vi->idev);
> 	if (err)
> 		goto err_input_register;
>     ...
> }
> 
> If input_register_device() fails, the error path deletes the virtqueues:
> 
> drivers/virtio/virtio_input.c:virtinput_probe() {
>     ...
> err_input_alloc:
> 	vdev->config->del_vqs(vdev);
>     ...
> }
> 
> Since virtio_device_ready() sets the device status to DRIVER_OK and enables
> the host/hardware to start processing virtqueues, does deleting the active
> virtqueue structures without first calling virtio_reset_device() to halt
> the device risk a use-after-free or memory corruption by the host backend
> if it continues to access the freed vring memory?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260905152059.89560-1-kmehltretter@gmail.com?part=2

