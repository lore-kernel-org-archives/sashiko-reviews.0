Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5463EDE5F
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696712; cv=none; b=f/RK7KtGeA0FGWvyg+efANGTMqpTts7+RnVyBsZH7r+sCTCJjAjlhnIf+x5jIRdZIjAZ8lNOXO+jqRLUym18MUx/ol0b2LiGCiPVzmcw6OxD+bnKg/X1wbwyMwW9CJrZgN2YiEYq2+5R7KISWqxBjp5GEh3SRytgro8pzXQtTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696712; c=relaxed/simple;
	bh=UNOPNt3Tkj1fUbyNoRuaxHaZ3HpOAfl8W0SXs06UoTM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V4ooq6P0LC/FFK1BkcG2jFgJQKQwc7zWt1zAqbVCRZsX7/VZh0mWI87CHl9ht5o8dc//dwElUZXVXF1rXhVSmS53FfQdfgkyQSOYoXYSM6UQ/1CX/CU+U3vLutaseWUaQk1mf7xi2TrAZG+vYfB7dnNaUo/InOlneTOjZKaBcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZ9I49cK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZ9I49cK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781696708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFpuqaDieAHnE3Ar5B8cZarVK1thuyCr3IXVZ5S3Hp4=;
	b=YZ9I49cKIiBTXmqzG4HejnbnW3hBa6Eai8lzJvoakUhb/9DGk5gavolSNbGQ2uZWgD2PXo
	MzOEqtIIodc7GHp2z1Nxfnk9OVmDgsHtx/8ALVM1uE70ji3BuhMXDlOkdyJqQs94AgQKmu
	nKj6O0vaBoGyZeNeoKsq0bnAOyfcfTs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-6GdwAqhQPYOpARTUNLXDTw-1; Wed, 17 Jun 2026 07:45:07 -0400
X-MC-Unique: 6GdwAqhQPYOpARTUNLXDTw-1
X-Mimecast-MFC-AGG-ID: 6GdwAqhQPYOpARTUNLXDTw_1781696706
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490ae0167ceso30769595e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 04:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696706; x=1782301506;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFpuqaDieAHnE3Ar5B8cZarVK1thuyCr3IXVZ5S3Hp4=;
        b=OJL0prFTw9sgcCru5HivjN5B1S39tHsdUgXBCDtG0Fh950K2AiR0lZsmczp99QT48C
         gGaPlSxPp/waEVZO+xurU5CjATUzqHryIvGBH6gvLNefb0dGwfpf2lsOHgIoH3oOlABf
         x+twHwg0I0nBuCj7V7DZ39RHd7JsLQ0xrPM+NK2OfU0rOF27C70loIhsYq3auAXmcEee
         nqUO8UzQa8+EsAdBeKUMcGJAMePlHVp3wGOHmuUIq2xqQVVdGN29RVeM9jzlPrv9PLKr
         O91yl/THiexhm5GvDPwWqFBlvQlOF0SM83akRISjI9Zvhp0AZG7xJoiabrn3aPJ4aIrV
         QbYw==
X-Forwarded-Encrypted: i=1; AFNElJ95YuzQgZaxNnCcq9IPY7yTyK8Ztkp1cBIJn9jBQQBMCk1IC7IoUUQqW/Wp5CLB/rJuuraCR0OlXkxXxRQcr/0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8sKA2qz8zE0pLDLlPCWfwtiGBJCQaAVXegfrAIE5SQOlX715n
	rB5m0z8nMERBYg1x6Eq760VKaDWYgk/cTMrms+YWQa0U7JtHP0p3lqQREpJaVuKpJ8FZCfYM+ZH
	B9ird9oGalC10HouE+7jyyE176fXUYNG6E+jtsiiSI/7fbuP4hPKvE/8En2cyOxqUOCol2w==
X-Gm-Gg: Acq92OFoaadc5gID4zWFPCRJy2Wsueb0cxVcg+GIhtRgfjM++KcV4wXPUgn+ZVxl1jG
	nN47oWhFcMuek6MDljOecNQJxrAvvFBMkz2XOrcUSgSi224IA0GgiDVa13SGfBU6Hi7ST6fjSNu
	udzGqfcg76O3R7vt7rCnCQkrhCeBh8pweDiV+VNqya8oJT5NjEo2cqxoUoC5gwApgDP/930mXP9
	e17n7u6RpOKxyS1Z9h4KfdNv+PEAbGQxXCQbzJvt5yHAnAyA07M40tqXjJN4mc2pmSm8Zu/oFAN
	i80XLjd6iZ6U+4PPQoJ8E2i3MJ3PxMZifYKvdb+JnyqmgniyGZQthIln55T7ebYNjKdFm2hAVWG
	Pji4VUlsc85kP2Mx11ihbhuaB2G/MQTa1Y8d7KPHGXzo3a1Q9YYkNC9W8J6nWsco2P/JhSA==
X-Received: by 2002:a05:600c:6089:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-4923412f185mr46138875e9.22.1781696706225;
        Wed, 17 Jun 2026 04:45:06 -0700 (PDT)
X-Received: by 2002:a05:600c:6089:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-4923412f185mr46138295e9.22.1781696705767;
        Wed, 17 Jun 2026 04:45:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9a399sm137247345e9.14.2026.06.17.04.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:45:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/sysfb: Return errno code from
 drm_sysfb_get_visible_size()
In-Reply-To: <20260617112932.511657-3-tzimmermann@suse.de>
References: <20260617112932.511657-1-tzimmermann@suse.de>
 <20260617112932.511657-3-tzimmermann@suse.de>
Date: Wed, 17 Jun 2026 13:45:04 +0200
Message-ID: <871pe5z8zj.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nLyEVe8pdcLyPCv3g9zmAPZWSd-yxuyQhzdVxVQl98I_1781696706
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Change the return type of drm_sysfb_get_visible_size() to s64 so
> that it returns a possible errno code from _get_validated_size0().
> Fix callers to handle the errno code.
>
> The currently returned unsigned type converts an errno code to a
> very large size value, which drivers interpret as visible size of
> the system framebuffer. Later efforts to reserve the framebuffer
> resource fail.
>
> The bug has been present since efidrm and vesadrm got merged. It
> was then part of each driver.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Fixes: a84eb6abe2b6 ("drm/sysfb: Add vesadrm for VESA displays")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

