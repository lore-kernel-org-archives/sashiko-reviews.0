Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795106362;
	b=lJvCaRkgoKbszUsKka76psQPNRGmIuR24FtMlDflDViVYEvzaStKhyUR0J8H4eMKp/ED
	 Td53IeTPVWX13Q7SbZ+gErSBpFNicBwBhuAy0Vdv2XWpR+ndV3IREk3XgwYl1sMcA86Zo
	 kjBAUlhdTmoKuQ/q3bauWBh64wg7Jyi4w32DnOZ5z4Lm7SxUxCeXJuBYEi1X4EiF0BxUk
	 QhdHFrs/AcvfIYtaKvBLMUbvfZH6lqeNHTQxD5wzxF8ZxqDW6CHhRh4t/efODwVuuoKbx
	 PFoUK7B+3N9n8dzzNlGuUINg6RtMg0gttKHEvAwxGtP1IIhEzTU88YffHH4Vr1YRGvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=b7FItsl8wpDWWtVp85YkbDLxbtweLFpOBExBkGzSVQw=;
	b=Pc9cJdiLMfDr4uhKuL6hd0e69VRB69zzzK7282B+MVy2bJriwkIbarmhTT4/uQUs82s6
	 Dt/Kkyfpe+QKhCCrKK9y/jCsAT/YSH/ZRUlr3xuA75pQ38uptx0b43qMPH8p2yMDPwAQH
	 O+U3bbD/401XRT6kq0o6KWoSBXV2Z7d+pa7UqOqxxs5Jzi5MmCEaaUYxFGQLh+/Ju0cFZ
	 VPTAM6kfDFZY7P3/o5pj/QNQfn+1L9eR95DKhXoR2iX1sgiV/vIGNcNPm9f0BuhwFIWuv
	 YZu6npH5W8HojEc/RZZ8QPIdhpP/T1TH0elHhAwHjBM2xUA46yeYQIhZ10aOqWwEIBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FlWWmaED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92AC606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 16:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FlWWmaED
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d290b10a35so1155533eaf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 08:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795106361; cv=none;
        d=google.com; s=arc-20260327;
        b=HZWlrTNoZxUy9VgVd6jffXB++xm/zutAKsnGHJHAhhaSJzNRRz6q5K6WVnWdfsQ4Lp
         59jOg6ynt1fl3kEd5G8oiSdzyPdLSnQlXkQYYzCx49YfUaav5cKinNzXO5Be7pogBGjP
         ArDa92qshwfugCaBY12Bij2xkIcaDR9FL2rAj+Zlv1Y5H9h79ae/vhyWBnLAeJBQ6sfn
         sJiSEx1hEH30RsNZP/3moxqtEKm2eqLlCFbaCyQ7KRkiwbhevI+55KpRd/I5FO8Yb+pK
         KL5/if899IkoKwDV1w+IY6XvT6U+bAPwL6B/TqbfzjTPam2g4G8eiyV60LgIJLR9QZEC
         Qiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b7FItsl8wpDWWtVp85YkbDLxbtweLFpOBExBkGzSVQw=;
        fh=5V7JZTBoZOJSOrj6eJY3ZiqgYxXTcakTxZhZc0RcdfQ=;
        b=X5xuU1YPdFL1Ojb2mLwyoGVBwdWrIdQC+OQZpwJL5XzCQ2SONo2NsvWRK3Am9n2ASN
         OVQzcN2Iifmwp8wF24LlD6yllSYzxlojxC0GgoCx+eg5H9/a9DenqQHFMzdZ0ea3drNv
         vLfT0pP0vPNh9IZ5T8M/imFavbaab+TMoCXmJ8BBuWc5nUwBp+By04nj8BMqc+QS8+S6
         6I5sYAMnCsF9Gh83up9woob+5Nllcj02GeN2AJzdi101VrdAz0EdaUhc1J5Wt03U/0sI
         ZSA9vV4JentMEYgUXjl6r9gTxUeDW7/MIkjeyBFWExNuYN252/UISy/0N9m3nQ+mgpjP
         Bbew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106361; x=1795711161; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7FItsl8wpDWWtVp85YkbDLxbtweLFpOBExBkGzSVQw=;
        b=FlWWmaEDt1tQI2ar36c1rQAu4N/ADl/WEYdbnCjQDiAMI0XZ8yMMVJBX2KfqYlkSzJ
         WxL0C9BqVkCNov1kwHbsqBhmb5RsqCosMvIal9DEZGLqD/Q81yr/uVOwSvgtVGKUMnY8
         IFJJGv9Jfs6s6tgAiEQ623za2iWx2Mo3tGoTu7wiNsFn5tgCpLNEcOsWRlCKs5c0ZiAd
         5YaX32ef+iJaLvnXJB3aQAuOlugPkz8vsg901tCcUwb09F1j0jcM3Mjl26CUQnmNsthX
         RNLfNrYs+jslrPjx9BDXqx2swjQNfZYLBr0S/BZoHNbM7QIaf5ocaKPVrmamwTKEJcGL
         Eqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106361; x=1795711161;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b7FItsl8wpDWWtVp85YkbDLxbtweLFpOBExBkGzSVQw=;
        b=s1td3ASN2JqsKgsBRLyAW+mahOBFJvioaro0c7Vinabwg8+JxCE44RuHK331yRVcc/
         UJD//t5moCqZLIi3AnFxEGAf+cKV8z5kOsRgfqwoEK8WwL1hfhW7KeNIvyx2nUsf4DRo
         eKtE0kA08sPG9O4QdA5grugTeS+79M6lOzJVSrDpmoNR/YSVDyu5fWIkLu8yNtg9k+KS
         froYXB8g9lEmdfu4Rx0O4UYxtCsO6pM9MT30qHbt4jdOeh5vF7JY3A+YUw9rfgrpdcMs
         soJwAlaofxWjTammgF1vEy6rneD2fNwfYF1d9MErkZBQ1CtvomrlgSdXps1jNPblwm2e
         akQg==
X-Forwarded-Encrypted: i=1; AL+hErGsIcCzUufRea75smaiWqnB6dsIu3dlULJDKIPOa/Eh7ytmRMWybhIX7yD189uSHAkJqA19inBwzTM8UtAaWrc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/GEo4/4o8KbHLcHBlBs2WregzYlbbn11BUqQu2QNlq210msgse
	5DcIt8DV5rqU45dqNxs6xbMI7YNBhlu5f4mKSUJ+H+Nv43bmCjoNK8xRu03EliNZY/Ja0S0RkpN
	XDf9YimLixmor5O63A/IfzCC2CQh/3AvoirWcJuwM6A4a
X-Gm-Gg: AYBFou2ZemAVr8aWagwn+0BEBUbKky9CWLqD1aagSEQpuLcFapICLmiKxqncU/NPAlk
	DgEEedA9ECUTm0A1y6Nx8XqPnS9IITt9aGp9s3t5lE3wcE7ttokiqbDodRICFw9Bmktkpfe7wID
	SpBxuMEX2c/yXetTNVlvASYF658YHDrDfjm55obfkbnnP7PvgwaGVR4bE1Mg7YafLIEx/mv4AM9
	5WWdGxJUd5qxd2tlFd9CaFdvJInYFh9+DrdlVk00ghKr13Wyt+klj1skd8E304S404WhNVAvMdA
	wTlEBJtJlPUo8Eba5KziQRv6rnno8RAjFRmt5kW3zemunahxy3JjwuibYofZnGDsbjBu3i+wKk3
	OKuuJqBKs6+RJ5Up3wC9bLXCRNzoCItJPXaBUj4rzUtalCD2Er8xTGXE0sOVZjiQGj+c1GYi9yK
	eqCloLCZBplN4Maj5Sive+2OOjgMs8t5A=
X-Received: by 2002:a05:6820:83d6:20b0:71a:fbc6:6a9d with SMTP id
 006d021491bc7-71b39496a07mr80280eaf.41.1795106360618; Thu, 19 Nov 2026
 08:39:20 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119142114.152052-1-tzimmermann@suse.de> <20261119142114.152052-5-tzimmermann@suse.de>
In-Reply-To: <20261119142114.152052-5-tzimmermann@suse.de>
From: Jie Feng <hjf3108@gmail.com>
Date: Fri, 20 Nov 2026 00:38:43 +0800
X-Gm-Features: AclHuK8BQ0beJx04YFSpWnOXXOCfB9S0SZrWi3J3-CqIecB4FFduuegLi2YFnbw
Message-ID: <CABOQOSW8f2Dw7DATTB-c1jhOzyo4BBsKh4cNVnEA0VpRJ=5H8g@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/udl: Allocate bulk URBs in helper functions
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, tiwai@suse.com, 
	patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 00:30, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move the code for allocating an URB into a separate helper function. Use
> the helper for initializing the URB cache.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_main.c | 74 +++++++++++++++++++++-------------
>  1 file changed, 47 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index 67da676f0f94..a799d7710a7b 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -163,6 +163,47 @@ static void udl_urb_completion(struct urb *urb)
>         udl_put_urb(urb);
>  }
>
> +static struct urb *udl_alloc_bulk_urb(struct udl_device *udl, size_t size)
> +{
> +       struct usb_device *udev = udl_to_usb_device(udl);
> +       struct urb_node *unode;
> +       struct urb *urb;
> +       char *buf;
> +       int ret;
> +
> +       urb = usb_alloc_urb(0, GFP_KERNEL);
> +       if (!urb)
> +               return ERR_PTR(-ENOMEM);
> +
> +       unode = kzalloc_obj(struct urb_node);
> +       if (!unode) {
> +               ret = -ENOMEM;
> +               goto err_usb_free_urb;
> +       }
> +       unode->dev = udl;
> +       unode->urb = urb;
> +
> +       buf = usb_alloc_coherent(udev, size, GFP_KERNEL, &urb->transfer_dma);
usb_alloc_coherent might map uncached memory on platforms such as ARM.
This might be slow for moving large amounts of frame data.
Would using kmalloc/usb_alloc_noncoherent be better?
> +       if (!buf) {
> +               ret = -ENOBUFS;
> +               goto err_kfree;
> +       }
> +       unode->alloc_size = size;
> +
> +       /* urb->transfer_buffer_length set to actual before submit */
> +       usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, 1), buf, unode->alloc_size,
> +                         udl_urb_completion, unode);
> +       urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
> +
> +       return urb;
> +
> +err_kfree:
> +       kfree(unode);
> +err_usb_free_urb:
> +       usb_free_urb(urb);
> +       return ERR_PTR(ret);
> +}
> +
>  static void udl_free_urb_list(struct udl_device *udl)
>  {
>         struct urb_node *unode;
> @@ -191,11 +232,7 @@ static void udl_free_urb_list(struct udl_device *udl)
>
>  static int udl_alloc_urb_list(struct udl_device *udl, int count, size_t size)
>  {
> -       struct urb *urb;
> -       struct urb_node *unode;
> -       char *buf;
>         size_t wanted_size = count * size;
> -       struct usb_device *udev = udl_to_usb_device(udl);
>
>         spin_lock_init(&udl->urbs.lock);
>         INIT_LIST_HEAD(&udl->urbs.list);
> @@ -205,36 +242,19 @@ static int udl_alloc_urb_list(struct udl_device *udl, int count, size_t size)
>
>  retry:
>         while (udl->urbs.count * size < wanted_size) {
> -               unode = kzalloc_obj(struct urb_node);
> -               if (!unode)
> -                       break;
> -               unode->dev = udl;
> +               struct urb *urb;
> +               struct urb_node *unode;
>
> -               urb = usb_alloc_urb(0, GFP_KERNEL);
> -               if (!urb) {
> -                       kfree(unode);
> -                       break;
> -               }
> -               unode->urb = urb;
> -               unode->alloc_size = size;
> -
> -               buf = usb_alloc_coherent(udev, unode->alloc_size, GFP_KERNEL,
> -                                        &urb->transfer_dma);
> -               if (!buf) {
> -                       kfree(unode);
> -                       usb_free_urb(urb);
> -                       if (size > PAGE_SIZE) {
> +               urb = udl_alloc_bulk_urb(udl, size);
> +               if (IS_ERR(urb)) {
> +                       if (PTR_ERR(urb) == -ENOBUFS && size > PAGE_SIZE) {
>                                 size /= 2;
>                                 udl_free_urb_list(udl);
>                                 goto retry;
>                         }
>                         break;
>                 }
> -
> -               /* urb->transfer_buffer_length set to actual before submit */
> -               usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, 1),
> -                                 buf, size, udl_urb_completion, unode);
> -               urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
> +               unode = urb->context;
>
>                 list_add_tail(&unode->entry, &udl->urbs.list);
>
> --
> 2.56.0
>
>

Best regards,
Jie Feng
