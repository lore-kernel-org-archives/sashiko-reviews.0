Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86863EDAC6
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779538; cv=none; b=fKmFuQ8NkUKcvaHuFh3cF76HUUuEa4zDL/mQWnefv/dwboXLc3aqTmq7GOV+sLwfMV8xkliDHVKmTTonRedPpveUQUb0g4EbLYQ63dcl31a5oGymMvVa0bSNFJ+xj7AyeceJAMBCk+as8RvYoAfeszCYwRcVFbIMPwLm67wK578=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779538; c=relaxed/simple;
	bh=Wj7lHFDw7QwsljMhK+ltKOvxMVwEF40WJ2l1whX5uww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I6mhpt4rooRrp3qryFKkSGM0CBunUfOJY7IpNFKq8fsthJssjXMnphS8EB/4uWYDGL4grFmwd9XhtyL7ujK/V2arSQch0YsOIU5IiDeldLDL99bx/XxpIU46nT7keQ82sLNb2VoHKVUNbVAFK2pFzIeWIiDb0TLSzcRF8EZLnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGnM1z7C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGnM1z7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781779535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ex4FXoS07wD1HdVUSdQ/7roGTbJyzugyEwIGze9M3sg=;
	b=IGnM1z7C62ekUWIPYWdG5JMOJSEh8dY0L3Z4Z3C7JbOQ6vuFjScF3h9mhESCKShVePhyjp
	4HUCJZgLuqGZGOJrqNDADFZNDQRXOwViAORAvpaQs9O/Vvm4GozrzpvTxGai70pD4790al
	9rvqQ/8XZphiaE/DDrvJB1E8o7xDcxI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-DsIv1ouAM9uJNVFnfTcDgQ-1; Thu, 18 Jun 2026 06:45:34 -0400
X-MC-Unique: DsIv1ouAM9uJNVFnfTcDgQ-1
X-Mimecast-MFC-AGG-ID: DsIv1ouAM9uJNVFnfTcDgQ_1781779533
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4642a5651d4so396171f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 03:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779533; x=1782384333;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex4FXoS07wD1HdVUSdQ/7roGTbJyzugyEwIGze9M3sg=;
        b=Qjihn2SbSNKnT4GMma3bbv0xRoQ2Y4NEhAGdID71r2mqh9oefo1q+5HEAaxQ7E3NYK
         Zs5bR9lzynasEZHsNXRy2vYMs2AR/XtIYK2cv9sUjOXGyGq880IriGGIY6JB5IEAlQIq
         0XToUNqtwX4OoJUMPm1hVlNJtlBIJ+k7wT3XIkYTSSoOVC4n+qpH9LGuGNLgM/JFyCx6
         lSOfs9j0v7OKI6Xu3FDW3ji1yXdySRmV7JjAyJdIKX+M8AYHm+8xv826webkjig75xyJ
         xR5r59sxItY//vxTN+/unQ0E5v4x9swU3CarG5ntjpj3gnYv81etk1KjQowQftDrWVex
         Xleg==
X-Forwarded-Encrypted: i=1; AFNElJ/VGtwOZitW1BZH0urwolx3UyIioipsvMKc3T7+bIHaAEo0TF2Fr1VeGlL5TKe3Kcy5Ms/CeYDXg5Bdfxt19Mk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwS+gCb8GSFcVVbMeDyNS7vTmpW/VOjKir/3t7aRebJbeGL3JR4
	5jGWk8fhX31dLYa9L+tL2MbnqHh6TMlXNAsiFJ0hdnk4/JedGCy8lwl6TPu+Ir0OvAnTUfl/DzR
	gjUfNDpM2q4RkV/zSdXA/IxMDAfA7bMarXVQ/hDrBJOpk4YhYmgyhtz/rmvV7WY41AYSrvg==
X-Gm-Gg: AfdE7ckuLrN71sCEUZSk/fqU3QHz1KJUm01PsSSEAj7wSfIqc8zUPnnyriv2GDX1SV4
	aQFzRkbGdg9wKdWJ2Uu/L727JMdso62Xv0GCuAU3kbhWEtz0B7K7UpPXk9WjrrvxjACxT6vdDKD
	zxdTxQiVe6jexWNompKkghAQwO3tWiitC3usVrOVCZwOzCNgQ3jNxnicq9EL+rPyxpaMCopryzl
	XjdwDaHSj3LoudSs6NLY2i9r+fKf4ahPEOwpVVTa9g9vebqqLOBCufzM7Gl5xrDx0Ab2+p/lbO4
	vpjp07g9GOfcedDPH9zcTqV4osOr8GISxTJA5fcSg2/ZsERaTjJVtKNv6ObTaCrh0w0E+yU7Wwt
	ROXNwEj12w0nfF/gZ7WeeFBNnIyjWhstNRYFbiWpr82dHqrENDeNtlxt3mAZWDqx5kpKUfw==
X-Received: by 2002:a5d:46ce:0:b0:461:c779:1e45 with SMTP id ffacd0b85a97d-46235e9bae2mr9463942f8f.2.1781779532862;
        Thu, 18 Jun 2026 03:45:32 -0700 (PDT)
X-Received: by 2002:a5d:46ce:0:b0:461:c779:1e45 with SMTP id ffacd0b85a97d-46235e9bae2mr9463902f8f.2.1781779532333;
        Thu, 18 Jun 2026 03:45:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm64765302f8f.11.2026.06.18.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:45:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Sashiko <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/sysfb: Avoid possible truncation with
 calculating visible size
In-Reply-To: <20260618084327.46567-3-tzimmermann@suse.de>
References: <20260618084327.46567-1-tzimmermann@suse.de>
 <20260618084327.46567-3-tzimmermann@suse.de>
Date: Thu, 18 Jun 2026 12:45:29 +0200
Message-ID: <87cxxojfee.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HksQfOmDUfL4r5gf27nd85RlnowdY9PPUNtcJRFY-U0_1781779533
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Calculating the visible size of the system framebuffer can result in
> truncation of the result. The calculation uses 32-bit arithmetics,
> which can overflow if the values for height and stride are large. Fix
> the issue by multiplying with mul_u32_u32().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Fixes: a84eb6abe2b6 ("drm/sysfb: Add vesadrm for VESA displays")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/20260617114027.1F2A71F000E9@smtp.kernel.org/
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
> I've added Reported-by and Closes tags because this is a pre-existing issue.
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

