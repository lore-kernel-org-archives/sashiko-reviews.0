Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578968;
	b=Px7rmsF5dceNq4f4iWdeK1hJZemTk9CZcl0xhTLkKlevMFeDqJ+wxPx6emx/YNSOccnz
	 21MH3gZ5lSv9xfdyC+2WBumoXFzU05yYT9Il7zjtMHTkU/OOH7+frm/AUE7ADrpPFfreD
	 sYs/7S1IpAQCOkbAErkRmfCqkOw1iY68fd1RtvVaISbQPzptpEEBw7fAkx2j9ipmBlFld
	 KQkfNe8atVF3FiM9JM1kmC3wMZpwr0a1ZPPyeVIsiqAwDcAKSQos5wIVxAwyAUnM7SpmP
	 TUK5Mxq3MAm9piAT23qMsdCfBhbpvEZJ95k3pLEDaH0guP/VxvyE84bF8adqVr03AyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578968;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=JOVQ4ASZFEh46dK4HlVqM/YOvdjeg+7exp1HRpI2jDQ=;
	b=MbH8ywkPZ2+lVrpXXzy87G0Qe3oINihmvIacfutir9mEFCjxi2Ka0h6RRYPbdftTc3aL
	 hIaCtENHkuOL+d5aX5V+9eNC1HGQatvg8OFHC5qJrpBpxQRjNzeEEejvpXv1J4iMFTPsK
	 bZaM9yWpYOZ+JUIJ6/YLYZR75aN69arGmgqQq86jobYFjgm499qeSJ/Y7Tr736nP3grlA
	 gNQtBX6obJHAwsKuNml7KHSHLocV37YfAiAMeWqCZD03hjR2ZM9OOcVfDCjpiQJxHQ0PW
	 8YH/bhLB4teB3/jXjfUkjHHZFUtKhXKtBmJah6Zm8I5dkv6tCVqcVCF3qA72oIYcXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NAmYoCUe;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ECD606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 00:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21ECD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NAmYoCUe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793578967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOVQ4ASZFEh46dK4HlVqM/YOvdjeg+7exp1HRpI2jDQ=;
	b=NAmYoCUeHojKJL4HlPl4u3dwQ1W+d+ZevazbKbCMN1SoUHcUOZBR5RrtpTBE38zXw8UtA/
	sT9+XZRcbax1pZRV3y4eSZGfkNR04YNtDMRlnw2HfahEtUxS+bTPXKKNN90Z3uK/zEo/I+
	hOcWDR4k0ARe6/bR1B/1jlQXEKQlwlE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-onqbskMqOyyI1GDWFsdwyQ-1; Sun, 01 Nov 2026 19:22:46 -0500
X-MC-Unique: onqbskMqOyyI1GDWFsdwyQ-1
X-Mimecast-MFC-AGG-ID: onqbskMqOyyI1GDWFsdwyQ_1793578965
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso23390575e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 16:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793578965; x=1794183765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JOVQ4ASZFEh46dK4HlVqM/YOvdjeg+7exp1HRpI2jDQ=;
        b=R52vaqJB3XiZYwiZCjBiee3kdWDXMZBbN4H3KyrYos6kdf+U7njT2KtDzMx4XChFKJ
         JlvzM4bYXQE2vLyS0emrPdu3lKy2OF6vK3wswv77BUinKxND0gEYhAmFHtRR5b4k772r
         SzLQ62Evo+yCkDGro2buZlKCrM3lARlzQEaOSPtey9uLsOouTR2BjFpS8pou8GkTr+sP
         1No3zhZ6mxu1FJxC152lI79EhE2Vf2vjHkFJkv9tq+K1SN88JA6MfRiLcshwh2JAR4vo
         oektdR8WRAO9bk35rqFKKou1IRDqUPQvdpZOgM8tPGPTAjx8XJj1vMMcElo2wETgfZUF
         qMLw==
X-Gm-Message-State: AFq9FYJ2e3iTWwiFsgCoBKWwArDUDkB/j/maE8KVejEL87MN+gnudFM1
	zRy4MD2LW40TyeM4dNbR4rf3wme3YlQujH019VfEmEWFwW5xRISlPsKwditBOQEOQBDl+4hjA5R
	RBrQdN9lHqrqIkB/u+iwbs1F48kMFSgjJk058hfAFX97B76uVGaA952/NkOwHB5ZS825byJ9aVp
	vhNojcPDpb5jgH1SPMORnsrrJUM4vuktto9CvbI+b7BbABkuA=
X-Gm-Gg: AYBFou0DxcKKHNWss4lEXX8xfh+C2htNKPN5olejTd1VatMiyBZLeAAk5zk95PYOTTw
	iNyDS3fYQZHaEgTQBO8cxyi9g6lPC/eB7PZK+WBABdCa4XtLuJYkaz4OcBionawBQll4m7DwLm1
	rglB1z7zH9iehFADzaNvPEmR6407qUhlGOkZQBF7iC+8WnIupOZkVCknjk9LW/Xd/5U2wiMk5vQ
	EewMKCiK20Tmc9p8PjRapY9eiEeQyYxZtziqJVfYwvk9kz8hTaT89Mx4CCkdb7iPWg7AUsfuZbc
	/7S49HpZNBVoObPcu0hhPK/kZlKvLc/vnqgOUzigc9EgtnOQDi7Xfyc/zdvbMiQZ3bzw8NScX22
	Bp7g3cJD4vSKn+mRkOqGp+AXTSgdeTcAVUoIChhXSag==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr197874465e9.26.1793578964657;
        Sun, 01 Nov 2026 16:22:44 -0800 (PST)
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr197874195e9.26.1793578964162;
        Sun, 01 Nov 2026 16:22:44 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm220328625e9.8.2026.11.01.16.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:22:43 -0800 (PST)
Date: Sun, 1 Nov 2026 19:22:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Linfeng Sun <linfeng.sun.dev@gmail.com>,
	Eugenio Perez <eperezma@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: Re: [PATCH v2] vhost-vdpa: initialize state before publishing cdev
Message-ID: <20261101192214-mutt-send-email-mst@kernel.org>
References: <20261011-fix-null-pointer-in-vhost_vdpa_release-v2-1-66ba929971ce@gmail.com>
 <sashiko-outbox-167170@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-167170@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9zI1D7jujcWe9rLiRrsCw-phdfv0wBstHFp90JFZ6a0_1793578965
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026 at 10:39:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] vhost_vdpa: spurious -EBUSY on open() due to uevent race during probe
> --


Linfeng do you want to address the bot review on list pls?

> commit cef3a58744e8aa0a22f86fbbe577797fa0a78e31
> Author: Linfeng Sun <linfeng.sun.dev@gmail.com>
> 
> vhost-vdpa: initialize state before publishing cdev
> 
> Initialize the completion and as hash buckets before cdev_device_add()
> makes the device accessible.
> 
> > diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> > index ff7d907191712..6cff1ed2004ee 100644
> > --- a/drivers/vhost/vdpa.c
> > +++ b/drivers/vhost/vdpa.c
> > @@ -1655,7 +1655,7 @@ static int vhost_vdpa_probe(struct vdpa_device *vdpa)
> >  		return minor;
> >  	}
> >  
> > -	atomic_set(&v->opened, 0);
> > +	atomic_set(&v->opened, 1);
> >  	spin_lock_init(&v->config_lock);
> >  	v->minor = minor;
> >  	v->vdpa = vdpa;
> > @@ -1678,16 +1678,17 @@ static int vhost_vdpa_probe(struct vdpa_device *vdpa)
> >  
> >  	cdev_init(&v->cdev, &vhost_vdpa_fops);
> >  	v->cdev.owner = THIS_MODULE;
> > +	init_completion(&v->completion);
> > +	for (i = 0; i < VHOST_VDPA_IOTLB_BUCKETS; i++)
> > +		INIT_HLIST_HEAD(&v->as[i]);
> >  
> >  	r = cdev_device_add(&v->cdev, &v->dev);
> >  	if (r)
> >  		goto err;
> >  
> > -	init_completion(&v->completion);
> >  	vdpa_set_drvdata(vdpa, v);
> >  
> > -	for (i = 0; i < VHOST_VDPA_IOTLB_BUCKETS; i++)
> > -		INIT_HLIST_HEAD(&v->as[i]);
> > +	atomic_set_release(&v->opened, 0);
> 
> [Severity: Medium]
> Will this cause a spurious -EBUSY for userspace orchestration tools like udev?
> 
> When cdev_device_add() registers the character device, it fires a KOBJ_ADD
> uevent. If userspace reacts immediately by calling open(), it will hit
> vhost_vdpa_open():
> 
> drivers/vhost/vdpa.c:vhost_vdpa_open() {
> 	...
> 	opened = atomic_cmpxchg(&v->opened, 0, 1);
> 	if (opened)
> 		return -EBUSY;
> 	...
> }
> 
> Since v->opened was artificially set to 1 earlier in probe, open() will be
> rejected with -EBUSY until atomic_set_release() clears it, which might
> break normal userspace orchestration that attempts to open the device right
> after the uevent.
> 
> >  
> >  	return 0;
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261011-fix-null-pointer-in-vhost_vdpa_release-v2-1-66ba929971ce@gmail.com?part=1

