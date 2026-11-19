Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795107839;
	b=OUO5ydL//tqQuxA4bJ5A1tuUfhAcLycf6SB5dCv6+GIP3LvjnBX6iTNcGPgna/1aLOFC
	 vRNVv9iejNMbDmb3O17Yo48CNEPzyZChKfgosPPba59ma09lseLLHhOTf+fwIbcGJnPy5
	 o9E3OCeeQSQ2bee9mMo7Ufk15Mc/PFOhiR7uRtv8U9dxtTdxCp7i34ir5gcVNZi1zL2sp
	 1R9o5+aIYD+3HEwZUI0Q359rtF8b9++gTb8dRRkbJRlWrPmRPk1KN/0eDguuClj/K2ZzY
	 akhBWcepFJ+93vMVtwKQpzhgN0mxuPp4xIOfqTrLcyxg40Md67HgPVdXA+cHCKiKG6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tuGun+0zjW7dRUYikOaNsmwWDgkDAaBtu6YVJwMcddI=;
	b=BYjiHVkWzophGkwq7/NriZz/HAJ/F136291kTawo301MWpotj0HlOknqKKYPZUpJG2L/
	 W6y+q3lmN8F7tWemV24q/qbHI/XwBtCcU/PWL/tzf/kvdbPZtF9v6ubke4CMwGo5y1HQR
	 feJ2SygvqSSG3RD4scPb3ffcKR0Tceagp4WBg2r5dkriGZtIuax3pqhDE5aW9ztcCrZ8F
	 OR9Ftknrt22VDe63Nc7ogcnxl1BITHOROA6OQFwkjSFtsAOMuVT3vkDc7sZo3FeqTWz7N
	 r1kFWWFtCSLiOn2rlKof+/rv0bjIVYWH7K8rsarXa1b+eDqOHY8x6Taleu03I6QCRgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tp//C9f2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0ED606A337
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0ED606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tp//C9f2
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71ad1db7e31so809953eaf.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 09:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795107838; cv=none;
        d=google.com; s=arc-20260327;
        b=HoYh3kuvNB6dllXvjnWMhd/KLbLSEenDOfepeZJRabl5ihoo4d5k/Mahat/xC2iSGP
         UZfQe4g2MP+aDon7O5F24uB8QtwGf+ZkO949gz2yK02Sx1ArAXPTGpSG3TvNnnwjdKUf
         6Wa7y9efQ6/U5eUHSpxrWj5d3ZMWFkEgTALfwxf2m0/bVMberIZhYO2bZJe0jhL9czbl
         CAe1/KlO0K5D0x03dsJ6pfTagLqcZpW9HhtnFGD8hidJXDuKkE5+2FMZWhP7dCJT7DYW
         hDgdnVL+bUVK8Ugj2UWHhwvYbDKGQzK6j8U5W1OuKU7uqjBePqVVevV/6R6MzciMGx8q
         lCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tuGun+0zjW7dRUYikOaNsmwWDgkDAaBtu6YVJwMcddI=;
        fh=GWyuKp8mpjdbvifl1xDvY/PJpzL92mTkXM4rOwiM6e8=;
        b=ddyK20g/CxeCG4LrHPTa7sBoMA8lmdkMdU7FjMISm+OjgvGr+9SNnAePX2lkl6NDFT
         mwOGHijo6p+gHNwkxiEWRluQq+7cLFhZkrjN1xFyIPqTbDoC/djuCju8AbEYnYLJX6vt
         IRNSoJzCTq8fI7lvhQDLLS9Nws5BU8aS716sOiSfwVWGBcC+XhneGs7rJdkDxge9VlPd
         Zws2s0e8pOS79Azutfjq4fQdYA+V4LF0RCEEn6oc1ZCeaYCqGAottUTDlMT9UfQ1fi3Z
         BDQkzTR3WrZXX1jyopkwistsuSmRPJ7OMHjZnjrrj4SsBHf5oyCdLm3I4AyxT2gQZPIe
         5GhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107838; x=1795712638; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuGun+0zjW7dRUYikOaNsmwWDgkDAaBtu6YVJwMcddI=;
        b=tp//C9f2iV9s7a89n/1JYdKMTCeyCAD1+1SdBqpipIW/6ZFRYoyDdrut90MVrxRl4/
         inW4D/sUp4LzfiFuRfdRUD3zt+XJn09D91lNoQ57NFABZ7DcUb25UXz3BCbBXpkvNMGR
         wN73yXJ5m3da9biROmiaVXE9NndXi8ig5xRUqtYxRC5nhxiW4ZnMhD+2PGzq8+8mGqj4
         lQdIZ+AofuH07+Zn8He2ya44e23xSOXuK8BYoeVGUDAL3FV3TQBmWipAh+0riCqsm9dK
         YTKSJgVpEsBdv0Bwin4kdXEc6vS/qdq3ChhooxzKNwFppvdhR+Rp/etLnb+M0S4OjQA8
         rV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107838; x=1795712638;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tuGun+0zjW7dRUYikOaNsmwWDgkDAaBtu6YVJwMcddI=;
        b=EDOlNKRid5IiNZesiFsZoGYjWar00Eophb6gAVChDBWQeTKT+k9pXaQyeHMiT+mOOJ
         +JobkWnxkH8VUElb6LMwVzHGvvtuZ/m7dxavTj7dB3UKkt4OJIDML/oRlg4iUDbFx2LT
         OC5mBUsGxRnyqAGJazj3nGAPV8iMZ1ja78hl8N7H5AnIPQAY/tIw963KH01Zmo9YlKw9
         jixb56ZD22lRPl5PKwedPGSm4trzBqR+lJIj20V7l8nWRVhYRmVF1meSGfgtnbZRa2gi
         oYGOMgemuSlHIqAjVFk7FDmxUTf6C2TIhzINyIEMO2CH/1xSNFqcvh5QHONSvnFbWmeH
         WONw==
X-Forwarded-Encrypted: i=1; AL+hErE05NsxmqUtNIL6Ge0x7JdUncCXxdsvwH3ecjyQQRARG8VeyCBAblkb6R/BUx5N5xTYjhRzuRRrXrqxC6q3CKk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/LBgBJM0ek1yTEB27VYGlaY5hGMGByz4wlyO/km9X/X42WiByR
	opk/53mxpseEhvCowm10GGbTyvhfv6aMFI6pJJS/dBgEbnSiH93CJqg1xCajutZ2hwF3ziZXQxE
	uPOAxkTvIdDl17AEYUiZYnve4GNj3xQw=
X-Gm-Gg: AYBFou07tLiF2Br/PicTHAJC+3CWQzV62U40VdSJb0+sY3mTYdhOEW3MLAYEPe2G9iO
	GTR8wAHazc+ACFq/nnGh2Rp4Gd513ptl7uO4RdY/Oa9UgJREIJb226MMGjv557e8U1yFXcqnr03
	dC6EAz/caiXbn4gs2IaBAHKe36AFbcXU53CB39I9jOfa+qdLde23OVhlH7a9zj0w4bVk6vaUQ6V
	dvJJxTrDFFOjmdIWWf9gpThhi1tOocQH0glXtC0sL0A74QZycYGc5DA7VG3kxsxKFokD9U0XSoS
	cvY1e2f6PXCxrkHmcmb9W7GDbBh0OgSndbzxSdKZ09ynMImZJVq67aTQmaUiflIxjhjZ0oqK0A5
	sQOoD8eGk4EHvyvagx29bObR3dYVsTA+fI34kMsyGc/shlwZ3dnu9taiv9MHm5wrIqKc55ATdZE
	haZZAp7r2zafkzGi/d7b2iK3c2fYgfXMg=
X-Received: by 2002:a05:6820:c0d1:10b0:6cd:3fdc:2664 with SMTP id
 006d021491bc7-71b395dde7fmr82537eaf.37.1795107837642; Thu, 19 Nov 2026
 09:03:57 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119142114.152052-1-tzimmermann@suse.de> <20261119142114.152052-2-tzimmermann@suse.de>
In-Reply-To: <20261119142114.152052-2-tzimmermann@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 20 Nov 2026 01:03:20 +0800
X-Gm-Features: Aa3M54p1Z7ZjenP4XkWfrFINWycd_rZ-DRlvxZfcqUU-F5xalNyIVDzYFMr-4bk
Message-ID: <CABOQOSVebjwJ4hmFYUYHX3JL1TDKcdH-sRUBf4CdmkfJ==qn8w@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/udl: Release URB in udl_put_urb()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, tiwai@suse.com, 
	patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 00:47, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move URB cleanup from udl_urb_completion() to udl_put_urb().
> udl_put_urb() is the inverse of udl_get_urb(). The new helper will
> allow for further fixes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.h  |  1 +
>  drivers/gpu/drm/udl/udl_main.c | 29 +++++++++++++++++------------
>  2 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 145bb95ccc48..9535e9c59950 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -73,6 +73,7 @@ int udl_modeset_init(struct udl_device *udl);
>  struct drm_connector *udl_connector_init(struct drm_device *dev);
>
>  struct urb *udl_get_urb(struct udl_device *udl);
> +void udl_put_urb(struct urb *urb);
>
>  int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len);
>  void udl_sync_pending_urbs(struct udl_device *udl);
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index 17950fe3a0ec..936fb6565bdb 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -149,10 +149,6 @@ int udl_select_std_channel(struct udl_device *udl)
>
>  void udl_urb_completion(struct urb *urb)
>  {
> -       struct urb_node *unode = urb->context;
> -       struct udl_device *udl = unode->dev;
> -       unsigned long flags;
> -
>         /* sync/async unlink faults aren't errors */
>         if (urb->status) {
>                 if (!(urb->status == -ENOENT ||
> @@ -164,14 +160,7 @@ void udl_urb_completion(struct urb *urb)
>                 }
>         }
>
> -       urb->transfer_buffer_length = udl->urbs.size; /* reset to actual */
> -
> -       spin_lock_irqsave(&udl->urbs.lock, flags);
> -       list_add_tail(&unode->entry, &udl->urbs.list);
> -       udl->urbs.available++;
> -       spin_unlock_irqrestore(&udl->urbs.lock, flags);
> -
> -       wake_up(&udl->urbs.sleep);
> +       udl_put_urb(urb);
>  }
>
>  static void udl_free_urb_list(struct udl_device *udl)
> @@ -295,6 +284,22 @@ struct urb *udl_get_urb(struct udl_device *udl)
>         return urb;
>  }
>
> +void udl_put_urb(struct urb *urb)
> +{
> +       struct urb_node *unode = urb->context;
> +       struct udl_device *udl = unode->dev;
> +       unsigned long flags;
> +
> +       urb->transfer_buffer_length = udl->urbs.size; /* reset to actual */
> +
> +       spin_lock_irqsave(&udl->urbs.lock, flags);
> +       list_add_tail(&unode->entry, &udl->urbs.list);
> +       udl->urbs.available++;
> +       spin_unlock_irqrestore(&udl->urbs.lock, flags);
> +
> +       wake_up(&udl->urbs.sleep);
Using a completion might be cleaner than using a counter and a waitqueue?
P
> +}
> +
>  int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len)
>  {
>         int ret;
> --
> 2.56.0
>
>

Best regards,
Jie Feng
