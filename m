Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7247DF85
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245967; cv=none; b=Hp1imhb9//aL1ZfNgnML0vFnwSSP0bnbuWeZsScylnxMuKiR43QsrBPeSTnoW/G21OCu+jzY2buSxe4zKRrIla8HGoH0cKpv/7jajGTY0Ik+mMnCyWoD0wYp5KJc30L2NqAzOzpTFHOUlvLyuJQLookj90auMMQSAzrd0I7t7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245967; c=relaxed/simple;
	bh=9tk8Sl/tU+k06lyjB+gI117CsAuIPPkNt46ArevX/WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uhznf7GNDhIArDCdlD7MlNuuyEVML4oM1DZx7qZab+5cM+TxP14hm6ow3roHL3lzS2ioSMp18jQNFMzjC+30yrQKviC7VVN6JktecwAUNA68OlgFjUdtRo4CBQDuRpfTwfaMKFFfXRU3T/6FfgciwrM2Fsabt+DPrqiZszVXzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NoEikRvv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NoEikRvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
	b=NoEikRvvJIAzGCqVeHpMYmaZyqwNeXYtWFmCUrJ6iwJSdmj4d8N/JxKGCRK3x+L78NWzQw
	ePpXZk41riAr8CwApp7591gcfBMt3z+tgxq+Re/FLEH3WgmNtNaHSWugud7ZayFrPlMgpY
	O2/opja3r6FCvwJVZW1wAPuXtKYMfhI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-JYskL3vYMhKZCHojR22CDw-1; Thu, 20 Aug 2026 13:12:44 -0400
X-MC-Unique: JYskL3vYMhKZCHojR22CDw-1
X-Mimecast-MFC-AGG-ID: JYskL3vYMhKZCHojR22CDw_1787245962
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482bf4da3d5so90562f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245962; x=1787850762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM5PkmngzWPW5YVaOcE4doFSUi3DdsSPp8p0edYyrwQ=;
        b=Dff6p0cGW8YKM7xp0/tE4cIXOAy7RaxVY4WgO4sC0Ri0hS8KDHM2MzM0EF3wXDzwvX
         LzSBc80HLvl/4q24xXxmGlJEzWxzx1ip+ffuQkfVv4XJHfFXyhv0Ha+0/mKrH0DsAVuz
         YD+a9vPGH8n+6empFpKYXDVRcUVqZI80YrutvT1gS2DBTwVhnU2hQli6OA9sulPri0IM
         wM4WXF1TVIbiiqifdMo7Dr6aJu+ibhmqlg3kmX4G0N5FjyIswHykTA2ctw7SRIdzr0TM
         2uJ+3nqFqtViUnqs9WmdVrTpAyJqzG7knk432FVYAnb/OmjD99GbZ/JBjEqWF4HCXu9L
         DBKw==
X-Forwarded-Encrypted: i=1; AHgh+RqG+u5iD8oh6cUneqM4IU3NdTHNdbPj4zUmBjK4wsq65LXDs+3Y/Y/+ZrS/0jOOxsEC5GUKN0icMpY/+gXBpCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOxFnf6Na1A33HXAMvIUIu+yQ8z+It/zrFct5LTMFFHhjMDGCp
	KrLFgivPDt1ol98mINv5rMw8+OxS/IgSE56+qsGnKC8qooFlaB5F1TukX73Hk8+OvCy/qarosgt
	bpv+lAWG1YlmbSOEqJabd1/ac4VrP5FVPbteB6w4J6Xj6A5XltLcpFOe6CG25LlvKZpvdAg==
X-Gm-Gg: AR+sD13lpHDiyYIdifwzq269NBmWR3YzzbkjFt6hz2p4VVf4nz5l1SUdY8FC1//jdAT
	GyRzOFxFqzACy0jtnrpk4F41c8pwAoNlREd8gsAFiuYratnF+9BAJvwzbBLmpjeWlDj4lKjULbG
	GEgCWgJON7xyQqnrg6etYMCgQQmYKM1kdV41vSNOQpsUePxmowdLoXauh2wC71zCdjlwfEFd4tQ
	6hZF3i25aYO54oE2yAwaVtIk40aLC4C2YjjAj+DhBfQ2rqZE5I3DkrMgX/avPdxqEcz9TrM+B4P
	bnKvaaLDXziwxjDQE0fd/1mGB7hyIg2jIhwRAayy1dqY5SfAoZNAjBWUWjPUszUkRRiFyrF0AEp
	IxJcLLhCmFgJNJ+ZGI82rD1atAW4P1nl1areHejF/5U+05w==
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7853145e9.14.1787245961730;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8819:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499b8301c54mr7852145e9.14.1787245961316;
        Thu, 20 Aug 2026 10:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm168153685e9.14.2026.08.20.10.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:12:40 -0700 (PDT)
Message-ID: <b332e4f1-30a8-40b1-bdd5-f0c3f816c229@redhat.com>
Date: Thu, 20 Aug 2026 19:12:37 +0200
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
X-Mimecast-MFC-PROC-ID: pXXyySY12wEQdNocKCSwmVCUrg5oCr_1QySFaUt1dzE_1787245962
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

