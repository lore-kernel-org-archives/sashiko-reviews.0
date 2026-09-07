Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCEB375F82
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817210; cv=none; b=PZnn3lL38WQcbv25yEkB9i+/0Arwfr6FVSnMXdl3F8OkKod5sL43IRlrJoFyCHAJKGXuOxtMD9IN6diCOT5o/7AXiFwRxM/WjjW0X4FL3OpFd6OUe0iCzCtJCoH1yTeWc5FNbBfr3uKxn/YnBtTdLExjdPeJXfjGnWY3dbhTZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817210; c=relaxed/simple;
	bh=WK5jWQltk5vyR1Cu/cdEG/Z6ilUkGdamhWepcLq/Ixs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qv98efSDVD4YTPjhyJ+l9oT/p00hRc9TRUZkO7ZT9graqIJ1Eea1oaRz4fOosMVrM0Ez5/Bz5S1ihO9qUIUs8BFnex2gqDWb8SzYpUQhk6QAYDUDcYEXEpZdDbuITZfR1T8b8H9fCkNT74GF95ze7uoY3kR0kmX0EFw4aL4dhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmCrMWl7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmCrMWl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788817208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YAXKQ4OOcdQjAB+UG0/5rt4pMsYCjaJqcNAWj/elvSU=;
	b=UmCrMWl75zDb34TvsNOYOM/cat0+pV8qnO1QAlkhMXC9JnwpWMIvpeldc9Du14E5flX74y
	EQTxraWbQQFGBJ2u8ZW8x9v+jzq+EOBKvkEfvSkcHg/ybKW8+GLeD5dgZ9yVfUU5nWYHwc
	yLvdiur9Ae5ZZrfQTdcy9vAvp2KT9v0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-9LmjPPqwNhabgAyjgHpcFw-1; Mon, 07 Sep 2026 17:40:06 -0400
X-MC-Unique: 9LmjPPqwNhabgAyjgHpcFw-1
X-Mimecast-MFC-AGG-ID: 9LmjPPqwNhabgAyjgHpcFw_1788817206
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f4bff865cso2245254f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 14:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817205; x=1789422005;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YAXKQ4OOcdQjAB+UG0/5rt4pMsYCjaJqcNAWj/elvSU=;
        b=X3lHtvhoE66JIhinp9Yl4NRi2j21DDWzXD6WmlgKHeb4jLrAElzqvGVcpymQjuR1UD
         TxZF6MpaK7pLJarnGz3hgsVMfRaJNcHjFdCQJzl46ZrblwUrOhXokmhAErWq4JrVzQmi
         CF0YxahKYperWhh1dmE1BdZ6mu138xmP2JVlqmG9AtPsA79swEWe8m+y4T205YbZ3+0G
         YCRKQtnAk5sUZ9x2/kGEzix0A+JgT9BG8GXFxsx6bzH0Ql2PiD3w+WcPnnQ0YxPw+oP4
         olN8f6wSPgEge7F6KzQyxTFIEI/vGvCbHsKk02YMbOfML1twG65mXOZFwqpvLXbFafyL
         LuUg==
X-Gm-Message-State: AFuF++nfURHmTrtZRv5Xq7nPA3m2XQkGhXdAw1wM0mILQsdy5fwGbjtU
	AdTbG2OPA9bSsUg4cGRxek9Pd3KsUfvQ5E8kTc2uaRLdbM6o7QH22+LxH0yR7pWJjplD4tGMN2n
	yF5XiTfkDGATsAZyVisADFCYZ+Fi8/1gOumWC9xMeGHdyTzcAUbZtS0Zhci9t19/GdreD/BN78j
	84tFZ21cqSHTdE+0Vp27BVF31ZlxQGcea3nxbDWXjT8o9VbCI=
X-Gm-Gg: AYBFou2X/fDfOfDOHxXFtpLCgstx24U2X+EvuolokoWCnLKiDvp5/2r4E9RvinUaklQ
	aZFhWRGGG2SykgsMOfx7Sn49ZFcctBBU0kmB0Du/KkQf7bEJRuP3fMjJizFNJtlOY8cL/4FGlgt
	pDfmPOeSc8Lp0zU+E1d4lH7kJdhxqsyxzm5hdMH19B4Uu2kKVkR/aIKRBu4KUmuRgYElk/Xo8ee
	oeacM4kMh0UlGlQu5go9RMgjn8YcrL2jfcYLa/e/ma//JFJpr1B7teyZLGLgpo0g81Ghc0oqVDd
	sNnXfYuWbaMFO9yjTvr/1AG0n4K7dNlUiYhPcLy3nWP/2fCAFcf2JZ0oj4F7d5pC3lr8C9pU/rJ
	CZA3kB9IK2WsuL85u9DkwDEU=
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr44620581f8f.13.1788817205594;
        Mon, 07 Sep 2026 14:40:05 -0700 (PDT)
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr44620539f8f.13.1788817205058;
        Mon, 07 Sep 2026 14:40:05 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm31768111f8f.4.2026.09.07.14.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:40:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:40:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yu Zhang <yuz08559@gmail.com>, kvm@vger.kernel.org
Subject: Re: [PATCH] vhost-vdpa: drop the parent's vq callback before the
 call fd is released
Message-ID: <20260907173931-mutt-send-email-mst@kernel.org>
References: <20260806150323.2154-1-yuz08559@gmail.com>
 <20260807150405.53F5B1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260807150405.53F5B1F00A3E@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BuiumbkiIaGmt3Ny54bq4jkmGypiZHD9a3DXgZwCpp8_1788817206
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 07, 2026 at 03:04:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Torn read causing NULL pointer dereference and incomplete UAF fix for hardware VDPA drivers.
> --
> 
> --- Patch [1]: [PATCH] vhost-vdpa: drop the parent's vq callback before the call fd is released ---
> commit 59fc02f21fdc99bd2ce2389a383eab4badff2c47
> Author: Yu Zhang <yuz08559@gmail.com>
> 
> vhost-vdpa: drop the parent's vq callback before the call fd is released
> 
> This commit clears the vdpa callback pointers before vhost_vring_ioctl()
> releases the eventfd to prevent a use-after-free regression with VDUSE. It
> aims to ensure the parent driver drops references to the callback context
> before it is destroyed.
> 
> > diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> > index c3d913bd7cac7..63ffa94bb4793 100644
> > --- a/drivers/vhost/vdpa.c
> > +++ b/drivers/vhost/vdpa.c
> > @@ -721,13 +721,34 @@ static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
> >  			if (ops->get_status(vdpa) &
> >  			    VIRTIO_CONFIG_S_DRIVER_OK)
> >  				vhost_vdpa_unsetup_vq_irq(v, idx);
> > +			/*
> > +			 * The parent caches call_ctx.ctx in cb.trigger without
> > +			 * holding a reference, so it has to stop using it
> > +			 * before vhost_vring_ioctl() drops the last one.
> > +			 */
> > +			cb.callback = NULL;
> > +			cb.private = NULL;
> > +			cb.trigger = NULL;
> > +			ops->set_vq_cb(vdpa, idx, &cb);
> 
> [Severity: Critical]
> Can this non-atomic update cause a NULL pointer dereference for hardware
> drivers?
> 
> For hardware drivers like vp_vdpa, the interrupt handler reads the callback
> struct without locks. If a concurrent interrupt occurs during ops->set_vq_cb(),
> could it read a torn state where it sees the old valid cb.callback but the
> new NULL cb.private?
> 
> drivers/vdpa/virtio_pci/vp_vdpa.c:vp_vdpa_vq_handler() {
>     ...
> 	if (vring->cb.callback)
> 		return vring->cb.callback(vring->cb.private);
>     ...
> }
> 
> If this happens, it would call vhost_vdpa_virtqueue_cb() with a NULL pointer,
> causing a panic when attempting to dereference it.
> 
> Additionally, since there is no synchronize_irq() here, could an
> already-executing hardware interrupt handler still race with the subsequent
> vhost_vring_ioctl() freeing the eventfd, leaving the original use-after-free
> unfixed for hardware drivers?

Yu Zhang any plans to address these concerns? Seem legit.


> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260806150323.2154-1-yuz08559@gmail.com?part=1
> 

