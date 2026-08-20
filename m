Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084AF47DD77
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246137; cv=none; b=qmfqmn8VFC6/xLN/L3hOzwsAgulO7uTziJa8EzEACQZCkSt/nkw2BxozQ68bLywvq0spPt0qPVro7Lgy2Nt/ZTtsKU66YR9OPdnpkPRmxmQTMv47uzSNgEvypJBUKNVxjs+iM0wet3PUlZVln39tsdRQYiut9JtwOYUYvRZQJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246137; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsrVMTVGy9V/0bkS1MwFFMvumt5ggRXFbKfYKLAnHa18uKM4yoQskOZPZd6JVb6VahcDE2gj+a05yyiRxCvnxqaj04fOjEf/vNvM/bTRD8sPKGdEvBeHBO1huEl2uQlg/Uhwg8p0Odf0zhOA18z2QNxV10c4G66RoOUVVdiIQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbvYlM8g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbvYlM8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787246134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=UbvYlM8gQtehnb+mJGkZ770E/RZPmqF7CxIfe6OtQD1aXeTxWjauf90zkThNzXxe/GMf6K
	I+ZvgdL++BwfrJT/09BAzQsqQduEKSt233ECNbiRaAwkOIcxcZY//S9Gan+BnvSQycveDi
	paV+t9bEqZxR9/MWTVQ7mkPqYgd4HLA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-lXfmB6FUNtmL7kDgjE4OPg-1; Thu, 20 Aug 2026 13:15:31 -0400
X-MC-Unique: lXfmB6FUNtmL7kDgjE4OPg-1
X-Mimecast-MFC-AGG-ID: lXfmB6FUNtmL7kDgjE4OPg_1787246131
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49571407d1dso447335e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246130; x=1787850930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=ovb52Bpt8dqueAXtxO8ZqdRQenK6jSAfF38mxnHaOR0IHZRhAN0qs+YvZps8EjE4GU
         JNC96zb/kjwnIFSF2VAlMYutcgN4P9X3CHHIu99ed4hTee4p+zNX9OP5a8Z4JFiCqcKY
         Dm9sJobVzHFrpkXFgCPRjkdJzCrRk5Dt2RaiC7lPdtvNmiSTQG2B2pwN3nXwHTBUOwYa
         w1lVygwQ1b6Sy7MvzaV8bGSnTFWxy6TFbUvQDOpZXzMSoTpuxclAIfUDlmhycG0CQvaA
         RgHcKyT/X2qYtu/U2ywtuVxdX5DA/TT82aZopzQdqfxGohdMsOyoywKypd/FYdzSFZ3i
         PjiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxBMmftOdAKPhbTCGeT/6Ae96tFbybne9/3ETVsIQ2J8We4BWZbjwcQrZh9K28cWho6Cdr1ISlR69xBVSCWP4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwpc9zt9lHE3d4KqB7wun58AbxQGP1/1gfiHkpAAclGV9/Qeo4
	Opz8bna1W9snoZVRgrkdKRxLUiE6ERL4RygIUpgWPyLi6xtZiZM1xaYj1P1+SU4BkhrNUU1OPej
	5MCiWB9Kmt1IXqX3AkVQmTIqBw88VOcYyv4xW2/2tSpVQMPtmIDjxT6FL/YCYSEzw/capBg==
X-Gm-Gg: AR+sD12/3mgWEXJUY2oRCvmrKuSRnk+gJGPnxHF03KbqKTiJvC23+s3MhPA9LTcC1gE
	mju5Dk5MLDeCcX+XXZvMqAW4ECOUi1RcVRvKogo+hhp8632RTK0zJZ5eXtUYfxUF0NoNCnDRIzm
	kGEHfjMJVws9ZneCd5yICGNIL/11i6D+/esCKxpx2P14drxy0k5uW/XYTXy7DCSh7QraBI7Nr9o
	tFa4XgWbopVCQ7YOjgQmHMV4hjPlVgW4zG06l9Cy+Y8a4dwn5TLy1LhjK9Y3naF+Ze3bU+Ip/zw
	nDybFJ5OmQ1QZt6BFaIAETGM371Ei8R4rVwhUNs26Ij470/TaWrBCihbEzxzp1Rrlm02l6qs6GC
	DILWiTQBPwH1RU99iJSYLyiYSVj88qEiEC7hbQK/zU8u+Ag==
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6845835e9.15.1787246130463;
        Thu, 20 Aug 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr6843265e9.15.1787246129216;
        Thu, 20 Aug 2026 10:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm14505430f8f.10.2026.08.20.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:15:28 -0700 (PDT)
Message-ID: <dd1da602-675f-4b63-ace3-a23e55ce549b@redhat.com>
Date: Thu, 20 Aug 2026 19:15:24 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panic: Retry in dispatch function if panic
 output fails
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uDyY52NswW2-MJ7-ITcXv_lCBpaJkEggFfiLSYaCnD8_1787246131
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> On failed output of QR codes and kmsg buffers, fall back to a user
> message. QR-code output already did this internally, but now formally
> support it in drm_panic_dispatch(). Streamlines the existing logic.
> 
> Also pass module parameter drm_panic_type as a parameter to
> drm_panic_dispatch(). This simpifies the implementation. It will later
> allow for moving the function into a helper library.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 12c39217cbcb..0960750bfce2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -746,9 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color,
> -				      unsigned int qr_version)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -816,15 +816,6 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
>   	return 0;
>   }
> -
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				     u32 fg_color, u32 bg_color,
> -				     unsigned int qr_version)
> -{
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
> -		draw_panic_screen_user(sb, fg_color, bg_color);
> -	return 0;
> -}
>   #else
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
> @@ -899,13 +890,22 @@ static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_typ
>   {
>   	int ret;
>   
> +retry:
>   	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
>   		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
> +		if (ret) {
> +			panic_type = DRM_PANIC_TYPE_USER;
> +			goto retry;
> +		}
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:

