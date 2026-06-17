Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163093EAC90
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696660; cv=none; b=PtEXdENb+p7X8faG9tMXtOlMaXFzCoYbREPnUV5SQbjEEC7+N5Cam2Owr4Ey8upO6Vf181Es59X1EIRBZ+xwUEYHr6tiIiUpQkQOLxO8U8UXKd06o6tnRFea2C6ew7l23E5KZVs7BltFL77EIbLWPjJknYYWrzfsrnmnxACeRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696660; c=relaxed/simple;
	bh=FsC9z+5KqjTqBr7jf9uBgCkDB9qmd1T3Zp3yITNmu64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JiJ2hmEbmUE5opoXujr28MrCkJnmJ0COj3CjQuPKCQdW1QiXyXixWGVJE9+b/CkLRZyn4ZCCxGk5aRirWsvkB6RdTxuw6HX2aOF3v6BH+hPTkZwntOUTEhyQ4tx4hKt3EthOqttJvjfkmkKU+yBIXFVSE8Fc2rJ1wt1r5XV5Gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J8uOxm2c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8uOxm2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781696658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HW7N5ERr5Ko13FP1e+xp+U+3cKGn0k0mN8ikI4Rsw8s=;
	b=J8uOxm2cNuNUZLuxh2V4y54yleGRkhPulJv0tgD9KddOR6GYmCEiU9JRh10GmpJ54gCS+9
	22yD9Xnx8Vb2L9gEimZq6W+1VYmY/4PXEbke0BwkuVi9S7QGU40RK8+V9lBvQR00ELw503
	rz0IXLzlr1MMqsMIQlLxJCy1oyWmdDo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-XwIAZ0J_OumxQXwhqZj2Vg-1; Wed, 17 Jun 2026 07:44:16 -0400
X-MC-Unique: XwIAZ0J_OumxQXwhqZj2Vg-1
X-Mimecast-MFC-AGG-ID: XwIAZ0J_OumxQXwhqZj2Vg_1781696656
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-46067399d5dso2551155f8f.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 04:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696655; x=1782301455;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW7N5ERr5Ko13FP1e+xp+U+3cKGn0k0mN8ikI4Rsw8s=;
        b=CpPSmpiiNmtTD5iM9gnFNWE175C9W4It0WxpZe/9K7g04EM2VVb2k70Pd4jvYzZwWx
         Jn4OoWqR74Wg/L+DNArQ/oTyrBOFXN0gmemq+r1UzJSbd+00oBFvZ5M95+Tej1FGSPIB
         bdiT3YofB4ArKjSgE8SGryfUhJGhGh4pmOR0E1/d5NQck2hVDFcrefYNyUM9RyrJCuXF
         Ecs545xg3922ct9b5ZXBm4HemJRjqn4K7pfPGWjOTrzfSj/WLQ6DEtUhP9uacK9oBQ6h
         Xmwu1NQkljPNYoLKQ+Hc5DUk47CbwjTBsRzfsD9Jkos4r2w7HDN4sYc3FX/B6ZM4FF3w
         oCEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LeNCefeFKMNo2YSP8ZVQN70uIju66ixX3olm9z/xfOTUZOf/8GRbya79m/t3jn7tNMtXl5ttGt1WIgu+nwvw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXYW+qchQUm2a/BLV5t9SakeyydAxkV2oJaBGtJg+L9uKslyYZ
	VVeGeNNoay652GMKXVuEp4Ads9qgAUk/DPRI0bGQA2XgCy2ts/g4v8uIs2mNTQ9RWUqozBZqYGc
	4JAF4+Ekpb5oseLrNlTj+6ECGYu5xo1osvlSeTRALuhdrUJ/+G5ySC5D4DI72vc9oLI6ZkQ==
X-Gm-Gg: AfdE7cnrkLXXDLXBJwt7LgnkarZCA2UL7b58N/kxii2RDL+cx+N99qUIscL2azqWMd+
	zVVAlmVezQhg/D/p3iXGWmZ8ae/hFe+eoqCJNc5Wdl/WeEtXF928eVUygwEdKP7Zd+BsSVFXAG6
	63GX33Q8YFTaociuYhqE+wCbzUDUC8e1gZUvfR7RLkgrzxYyr6cBmj5oRCexT9FgE3tiLFM2iOk
	YgliRhI53MJJHKgB83y/AxX95FkTZ+vi9CHsrbffMugjF/6TXaal0iVppcb/Ypt+3fXj0iOQCeU
	UBwjS/L9R+W/ngkXhARKnKMJhsPRX7O4WQI26VUypyy4R31oQT+ahnf+lsVkrQCNuyaZwd4bDhe
	L2tHQZHeEgcB8Bxe9AzxRN4axuPiQyAUXOx1AnOBf93tMOPnRRDLnfcMeD0uOGRFhknFJWg==
X-Received: by 2002:a05:6000:4b13:b0:462:e086:35f with SMTP id ffacd0b85a97d-462e08603dfmr3383269f8f.21.1781696655493;
        Wed, 17 Jun 2026 04:44:15 -0700 (PDT)
X-Received: by 2002:a05:6000:4b13:b0:462:e086:35f with SMTP id ffacd0b85a97d-462e08603dfmr3383197f8f.21.1781696655005;
        Wed, 17 Jun 2026 04:44:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm47931839f8f.25.2026.06.17.04.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:44:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/sysfb: Do not page-align visible size of the
 framebuffer
In-Reply-To: <20260617112932.511657-2-tzimmermann@suse.de>
References: <20260617112932.511657-1-tzimmermann@suse.de>
 <20260617112932.511657-2-tzimmermann@suse.de>
Date: Wed, 17 Jun 2026 13:44:13 +0200
Message-ID: <874ij1z90y.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TBVQ7m0E0GAdy1wEzK3xKpYnXguORlQZwYI_VGHD_08_1781696656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Only return the actually visible size of the system framebuffer in
> drm_sysfb_get_visible_size_si(). Drivers use this size value for
> reserving access to framebuffer memory. Increasing the value can
> make later attempts to do so fail.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Fixes: a84eb6abe2b6 ("drm/sysfb: Add vesadrm for VESA displays")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
> index 749290196c6a..361b7233600c 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
> @@ -67,7 +67,7 @@ EXPORT_SYMBOL(drm_sysfb_get_stride_si);
>  u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
>  				  unsigned int height, unsigned int stride, u64 size)
>  {
> -	u64 vsize = PAGE_ALIGN(height * stride);

Do you know why the original efidrm_get_visible_size_si() (from where
you took this code to make it generic) did the page align ?

The change makes sense to me though from your explanation:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

