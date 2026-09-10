Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357FF3CE497
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025042; cv=none; b=qO6G55YbTMN27/QUcxDo+QvfTvmc9e1c1Dh/ZCVTPlKN9PVsjEjQHYd2Ro6KE9Dw94ETm2YQ4JUXrgtDQgZfkVuVgpJOZqu3SMWc8OG31Cq02ftABj8pZ08r2d5cCHavh9CHiN4Ng/Vsr+3ql9O6ViHyhh7IF6mOc3JO0JekCNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025042; c=relaxed/simple;
	bh=TcHfeW/i2tzsCkrrrpYuReaiBuundKEKEtkLpL2Alac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ohOf9rps3x1FGwFEijStelOOiXQv5J5bpwHr2CIEbGv05tAsZZGt5bVN3+7rBJtw7litGsJTT3P8ya96rsoaC+nb48bz2WJw3yA5YTkE24/m7cQpuDRmIyVV1xCCAeUSP9EicY/Mz5mdihU5qmwXHpNydhfoyOUPt9dgMZM+vPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LsVCyvE3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LsVCyvE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789025037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MOllz7iFisoMuqz9HYVsrPAX9tAU/LdtpLGaNl5A5Bo=;
	b=LsVCyvE3T4CaMMz5GG/dQh31LV3AzOyjcxtQYPy8vY51OQ0+a2rqu8TSXLJtJUuMu8N12e
	2mEzseRt4nBdUoxsHjHzA+EhEI4DEggNnpWXe/YphyOd4Kp3nLSNGeTDFOa8gMpHJ+IEGd
	7Qgp67s06TtxGYcFqD3jk/fau5k0bpU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-3Oz55SjuPsSR_2D-YxOJMA-1; Thu, 10 Sep 2026 03:23:55 -0400
X-MC-Unique: 3Oz55SjuPsSR_2D-YxOJMA-1
X-Mimecast-MFC-AGG-ID: 3Oz55SjuPsSR_2D-YxOJMA_1789025034
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso53592825e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 00:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025034; x=1789629834;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jz9koIHvC3GBX/XUcgHOfcrwJtKrYjkKEL6ZBTQ6TM0=;
        b=LnqN8EQJdcxqY8SL71kYIL0/gd00TLMhWQ4SIaopjCqSv4AwEhwT37NW+oy3Ou23+e
         fC0ZAEJXrbQm42oP+S7Cmv8LwARer+5lfDM238ngmBk0Oqgwasg56e1b6KsY30P+xwYd
         bKttuYTmho2/WFAGTcJWQ3jYCnsDn7RBvFrCxV5Ez3F1venXMI8xiEUZOIIgcNNrSvFh
         VM++PsclM0VHMzcewip/Y96LFJFdQG9jCDtS3BMvn3Wv79LJrnQLlJG7r2VOZAVjhWub
         X77lgvXy3667NU1AMbhvsYAopOBzpFrxRE1pwIn48jBc3EKMz3A4v/1WJanDfjvQogP/
         pEaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYQtUbXQhEaDniuayrqiJ8morbyEgUus3vsLZulF86ik8f35tytBBIkhAOq1tJR+mxiKkaDGKZhCa8Y2XlAlI=@lists.linux.dev
X-Gm-Message-State: AFuF++kU7svwY97OqZvC9D5/XrT3kyA01teI5NNUy4RgZdnxp4gQkhKo
	a5KORnIm10ww3E1rNi6o4PuraCptOK75KReQLpvoB23Jxh3TZan+BkAJSy/p/IQtQE5pILEYBcH
	GMi+lTfsN3tR0KRuG0QO9zA/orz/GTQ0SPJiERtOx4/bPGaT+AtPKoYNsuDoZdoBzfJUnEQ==
X-Gm-Gg: AYBFou0mT9mN4iPyQIk2HvMMC7ou00WIuxhQffy9o7isnT5g8nzdKb6FGO73wPzgq8B
	SQbTZNeURWVAwGxH/gEMTP2zGevE8QQxKTYpgVnp+OpK9W5oN9J1hXKyTrJ8im6pfokyxH/EQOG
	lZpFj6rkBdNHhzj+97WoBxIhiH3wqxeIoCguGUzQlXoveDWJGdnceZ8kkzY59cTdYuM4LuIKZfE
	Cwb6+I4erdXXfoeGZ929fLvdnFJtOik0qwprQb2aYCtM4DVcHeK7pgGC+JTe0PRrcJkiQEFgeYU
	Z7RKjghrHPD9KzrZvcuK5CFicTqBMgLYxeVKqGtebnJQy6jUP8FW3JpbNvOCyqenKN9tn+3EBj6
	xaipxG3FEZN5/e66WVcbrh/7K+hi2IgMqQUv8evDHd85fs0cQvUdAKg88Gw==
X-Received: by 2002:a05:600c:46d5:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49d258d8be2mr48295425e9.9.1789025034233;
        Thu, 10 Sep 2026 00:23:54 -0700 (PDT)
X-Received: by 2002:a05:600c:46d5:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49d258d8be2mr48294805e9.9.1789025033597;
        Thu, 10 Sep 2026 00:23:53 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm19301115e9.13.2026.09.10.00.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:23:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 ilias.apalodimas@linaro.org, jani.nikula@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-efi@vger.kernel.org,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/3] firmware/sysfb: Remove rotation quirk for Lenovo
 D330
In-Reply-To: <20260904090850.43060-2-tzimmermann@suse.de>
References: <20260904090850.43060-1-tzimmermann@suse.de>
 <20260904090850.43060-2-tzimmermann@suse.de>
Date: Thu, 10 Sep 2026 09:23:48 +0200
Message-ID: <871pb1efi3.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CXo-zZBUcKHlXWZgxyKvk7q-D7g0l8qaKlhF4ATPoMU_1789025034
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> The Lenovo D330 is a notebook with detachable display. The display
> is installed in landscape orientation, but the display mode is in
> portrait orientation. By default, the display output is rotated to
> the left by 90=C2=B0.
>
> The sysfb quirk breaks the display by swapping display width and
> height; and thus mixing up the display geometry. Fix this by keeping
> the display as-is. The sysfb DRM drivers, usually efidrm, will pick
> the correct panel orientation for the display.
>
> The exact behavior might depend on the version of the BIOS release,
> but the exact version numbers of broken and good releases are unknown.
> Users are advised to update to the latest firmware.
>
> Tested on a Lenovo D330-10IGM IdeaPad with firmware 8NCN43WW.
>
> v3:
> - mention possible dependency on BIOS release in commit description
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/firmware/efi/sysfb_efi.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysf=
b_efi.c
> index 685283bb7327..2338de73c62c 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -301,15 +301,6 @@ static const struct dmi_system_id efifb_dmi_swap_wid=
th_height[] __initconst =3D {
>  =09=09},
>  =09=09.callback =3D efifb_swap_width_height,
>  =09},
> -=09{
> -=09=09/* Lenovo D330 with 800x1280 or 1200x1920 portrait screen */
> -=09=09.matches =3D {
> -=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
> -=09=09=09=09=09"Lenovo ideapad D330-10IGM"),
> -=09=09},
> -=09=09.callback =3D efifb_swap_width_height,
> -=09},

Agreed that is better to rely on the information provided by the
firmware, instead of having this quirk. Specially given that it
breaks when the firmware provides the correct display geometry.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

