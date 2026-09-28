Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573336B938
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618974; cv=none; b=cBy3cS8CbkchtIUbdyWKP+OPFVqyNZYOAJK9sI+nwz0PXCBvhEznLw3iTkgBYn9lbhrDvgboaDMx7J961tloi9KlGCXB9mN27CdYlG3ymjwwjfXlrupB7smogr/+fIkR6vjlgh59xp7WaSXyeVI7fPeivV0O29US0mgepH7N05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618974; c=relaxed/simple;
	bh=IJl8ZLVeSLK/3tm4qT2HpxIpgkaGExTUeW/aig9VFu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YjbfH83+x/cGTldW8ILhhEEzBqCPjWwj3U8KyBJ5ke4Qft8IpsX6Emc2lHYLTtPSiBpkV9NcX63Vv/j0Vvz1WuO40EBle9tE+YlFAGVgfn/f2oUG8TWpQLJv+bDtdPh31yLM0QDGlY9b/6OfGAm4EeDKV42JYB2ZS30FC8jJpos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHEggkCY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHEggkCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790618971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
	b=NHEggkCYfDnfzrKj+yfGW29mwnX264s7CQa4z6AOxX9MZB5qTNlk7g9DwUOq7p5DcFcawO
	F5pRcsZ4GBPSLGAJM2CZfcNBxEw9TyfE40slQru1rNlhgLbfqxm9TZh+03/7Vrsq6qjzsI
	3qiJoNQm5sF9ArBYhLgwgs3pVnlXBko=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-ho3mIHejOdCmIGL536zbaA-1; Mon, 28 Sep 2026 14:09:28 -0400
X-MC-Unique: ho3mIHejOdCmIGL536zbaA-1
X-Mimecast-MFC-AGG-ID: ho3mIHejOdCmIGL536zbaA_1790618967
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso32644605e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 11:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618967; x=1791223767;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
        b=hnhBxg0cSnH/7wjAKQgZFb1nf04G4YVGWc5eq3NiS+53bmAAh+MSiYdy+JOgk+BCka
         ZO+NLkNzMfI4OJgTqZS8zrd82FKUUjck8Vmt3v8J0C2mFf7faxlwhM9r3y6jFTIm4EpN
         HCk/40hAQG56pzCp6naG3+ExCPChu7V5GWDKQtto9Yb+/GZaBc5iD4G2XVchiDff3Jce
         ARwcdk50PiAH+n+Pv6IRmhmLNQYQNdT0jMrEpDfimdcLrhukzpxQI0LK0QPLfwr9wQYn
         HuYOkoDwUulKjHGLdHcIUC4ViOHs/sGoyxdunGvx7qRnKGGMs5VY3vgMOF/IVaDLKIpW
         bAaw==
X-Forwarded-Encrypted: i=1; AKwUvBy+/rP8JEM647hOh2gRBGe8Nfq8TyXuRRP/IYe0NtRaevTy8zUdJee7FotoSe3Gy2lhSNqeSlvHU7IHjiW6Bds=@lists.linux.dev
X-Gm-Message-State: AFuF++leetQe2TLhoDylB6+n1QQeoCOQ+Dg/IIlLMU8E/lWoHOjqBPtL
	KmtvCo43euSE2OSgzMsbS8MYaanlrhbCgwwISUfziZNfPQPw/ebhuYo7MMYOlCLR67DvhQ61Nnw
	NE+HDgkI+Qq7y9mvFX4i4xiTsxsBCrkR7uRvKy5g7lG/zY8gOOHcQpswTR4xdUB2hwxxbWA==
X-Gm-Gg: AYBFou0+tA1amvGfN5N3sGr4QAvTy0GCUN5R5eunXe/8HpiT8QVFL4lT188wPZuk/48
	m16eMEaiX76GkZ+0a8U6p8o6E7UiITN/wFGecKjcGKTxqhSfbLV/qZjjxKD/4/K2j/DFV22xkEA
	SmKiF2wLQgmD8bl5Gvl0veCPfNVhKRqQS5RvYAwI3Kaa+UkkDr2qwdDPTlN+k9m42+pFavj3dNo
	3HoXmmsfkKX63kpcoAE7fTN8cMCK1XeVCz4exxPZNodFKVqV6hvlEV/x5rpHWkmNQypf64qgZTn
	4qXTJ1u5Y5No+t3uT2IRSK9s+mpTCou8IhxRTiRS86pxFcyzLPJb5gHkjG/J1kikIN3grnkobny
	kYd1dwtSXUyKuXGwlr4gDc1fy1R5+2w/KnoLWqasIMCcurq37ZEV5W4NwwfJeuQy+3Q==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739905e9.18.1790618966877;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445;
        Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
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
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IbACRKflshipBZlO6CHqzuxRSG5yL7y9IirQoranF24_1790618967
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

