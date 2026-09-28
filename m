Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982637A844
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619037; cv=none; b=PQwdXRSLQH1V+BDSDPsOkL24r1QNQTVsKeh9c/iRdJyzbMK0an4hysKe1hIe8/lT6jv7agETbOiTDRckhISIurFgVNeeFnpoKKU2736U9sSa5XiawJqH30bxh8a75dCyNwr8f5JWh3A+rAL9uA84cnF/XOz8apQYn21tp0Oh6q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619037; c=relaxed/simple;
	bh=bbVVcjiD4ES+ov/wPnX+0XE+Qh3pApdn+aRpLrnrl9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rbw+NdHbIUZguArxWd0mWTMk2QY2TtfdIRNaz+vDnLUCr8P2lwgAW+BJgJw0SuODfiIA7/pt8aZ6c3XD92vnthsjoYODszB4PZz2NLzjBUybGdkfZIlUSjAIv1O5aJhlx1CrShre+Lx1ItvLV0/GXTIA2S23pvZY3Q5wpBoIc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ba5M3eSB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ba5M3eSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790619034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
	b=ba5M3eSB2aU1dR+veVcUzfFraM+VToN/iV7Wpk8dz1654estlF+ipPmSpkfiV7SNzL0sTn
	IlxU5CrReGOZ52vnu2CyWIFT6Vq6cnGlBH+MF7CbOHlW/x57wmC8uOoCUSs2eLoIOo7BR+
	1d96OCVGuIvm2DE2vmxxTX58BGEFmA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-zBTGfSwUNR-LLZgF1G1hww-1; Mon, 28 Sep 2026 14:10:31 -0400
X-MC-Unique: zBTGfSwUNR-LLZgF1G1hww-1
X-Mimecast-MFC-AGG-ID: zBTGfSwUNR-LLZgF1G1hww_1790619030
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ffe48d1dfso23756425e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619030; x=1791223830;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
        b=M7Xy0ly6FqNsB+40w6xaoP0jh83lTBnIoRW6x0B/t/x+khPFeQtnR3mRENoBI6Ug+q
         zylK6k4wRrIZtUMCn3jazw/nICGYnyaADnTXk4FKJAc+/emRtpBvzCJMD8tCkthdIWl9
         eBM9Nw7yV/aXSW7qkyjQGnm5Bsp3tB9oZCwXbpVJlVQBg6iYf0R39l2p8gi8H4xmY0dd
         nNFeNT4h7XjcawzYuinWQGN5DNtynEqLIIhHgFlx6H7AkTPNKU5iusFP0KAfJU6q1lQp
         Jbw7IMuKWWXQA+GsKPvzVzgCIQwIQPQZSUK79dwHobbABbn+hL6HVK2N+DWTxsnEGWck
         9TBA==
X-Forwarded-Encrypted: i=1; AKwUvByc9VzfZqR+1PaYOFlolIX9uNzc1dCd8XDi9qoSdAnjIux25srBf/yiHdFpcZI0acEJ8fxjcB+2iHYPj41fGEo=@lists.linux.dev
X-Gm-Message-State: AFuF++kozSFM3uDxTffffq2kSQ/r97gEZ3/+UJLp0NOzZ6L/EdBb3oS2
	pKMblDMZ213P6vStBxieb5glL3cheA6waV38YOmcJ6XxvP1cFAoilZLP6oBNeXmSVPZXU37rxiE
	aKHXKB9v1CoHn8GRVmuViR7GMBPBvCrnnEGbcmYEtyNdgbB0WFg+F/xwPT1ZB6nMcHgeMQA==
X-Gm-Gg: AYBFou0ARHkc1A2oMqUWG1YiqV1qIx6u7oWDE7Q4YKTZyD10Eah+r0HH/mQ/fyM9fyu
	YORBy7B4s8fcuSn9uKsTB+wIVt99mePHyDiQaT7LmopE2w0NNKer83dIEJDU7QkyXdRb9Gq4Yxa
	9p1ob+M31BhXn/icuYHglEze9GIMNxNgYVKb/4lwcauSOurzdGQs+2RnuWFI0VtTM6b+br0eAXF
	B/2z+aTWKU9Ubiab3nV3MG4zc9ak1cTkOZv7UPxZaq1/hr0NrFU3xpb0IB6+hJlIJQ/djaY2uc9
	ph6FdWsGCU2H/c6+Rm8WX9FzpWH2d8ohYj7JFSGnhro7x2WjbEW/KwVMrtRN6gb3qMhBuUZ59IP
	5HwFJZeLiHx9efnEdfHUCTFWzPyCrFAynGB543oFjgAiIVYpNlYRs29SvBdXAgtrZ8w==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712585e9.2.1790619030046;
        Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624;
        Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eGywPlEYVR0FIBLEEmhIcUE1pCinyKfvKYD5fZC5zK4_1790619030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

