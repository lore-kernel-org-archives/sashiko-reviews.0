Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BBE47DFAF
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245505; cv=none; b=OUTYxAC0ypVRl4jjeZdcHyvt4pWtkF0oT4C2coJgstupS9aTHIgKy78GSbdr1P6xG19eVy1VXgZs/uZpHwr2SRoS7s9bLFx8fKWrm0vANFzamBk4wntB6yXAOKbbdfPUUwJPTVY/Bwry3UiX+r46Gm06ZSzHea2wMZXQK4WXJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245505; c=relaxed/simple;
	bh=OOvAhEjtRhOw0a+UjXxcotOqI4sqWEFsEYl3cZ0ejEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m77pnON6SdPFfdcf2QegKyBeUr2a0OHg/nOakzBukcRFlVpgebxfqBfyY8ojJzxlL8ccZRii+mOW87eBInpTMbvfgitPwdysM+RkjcEX49lWgdOcn7LajW4v/BkJb7ZspRNlxl7tXNRxjo67INzKoRhjuKmQI5yPyOeCWa2uKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Be3T+p6m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Be3T+p6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=Be3T+p6mFPfn5YcVDRQG2CTD8jYXC1m/QI14N6v0z2Suy97Ou/5AV8Mlfx+Yz+DuEII7D6
	hs+wBoZ4O4hvmcm27JtziryF4Yq2/xiHoaKlEa7LzaolwrJVDX9R+R3Ku8lQBpe1XyZ8N3
	hdLCWQHgz3whNb0tpqBArAFqfzPNBt4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-lCTMXdcyNjibE3EyCJSOPg-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: lCTMXdcyNjibE3EyCJSOPg-1
X-Mimecast-MFC-AGG-ID: lCTMXdcyNjibE3EyCJSOPg_1787245499
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496b6f97676so349045e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=YgmVOJ3Lfa6bVosQJMBi7SiBZ7EXKDnJVw69EiyoCVqJLF6LiPWbyLsjjfLrasRWzy
         IU5+Ljap9ircdwIg3K5fOPj8g8z+PMBaK4wlSjaN0bHONShuEaAIBDwU2kS77RVTUUIy
         9UkYKjjGHbHw9YHL4gkseRHgItT6EBk9uCZMr0+4Mqhx0GMbvL5W7Cq4LCsc6lWVlv3M
         k/FIHOyEhQ1zEr6uCSpJiAhUlXmjhDfPA/QUtzdPyqmR8uNeD0vvmGvTPDZUr+kLwYM7
         JLVCXpl6i767Zc0jHZeRNZSOsquncgS0wrvLZsfssGBmI31DZB3LY7aQD5LazklwlBCO
         HLxA==
X-Forwarded-Encrypted: i=1; AHgh+RpmiSSglPDxIyfwXRBczGB0Ba/hcFNPIxxtl8KAcYOT5gJDP/t3ULC6KFNw4xTmLBWcfA+/COHfNT5xIztRqs8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCsw3LpjegeHodv7vF5Uvswg8wuE/cQMTHuk8OFxKCOpjUBjRx
	bxRf0BfkJQtqrHGcex8lEmohotgCJwygVD1F6iRcF3DcaI1Nh+I28kwK0akkTbOSC8W512ypIQd
	JG1YpjmsSp/wZ4+4+8dbyMhK9H6voUnQUlVoif2ZMaucTOTsLj/hw2jn9D4BQQZ2itihi5w==
X-Gm-Gg: AR+sD11UShJzntHbkMvFhZKgBNLUMABZI+ra4DpfaUrDBl5ketQSzRhwmhEbHyaRj+2
	okDNFlE6jWuC6wBqIgxU9htEJAg37fr4aHvMrTJlkWZ8iBrv+I55xM6lK0tjdhSAPsKboxIizRb
	14MiSLuoffuOpM7cY3J4c2kAJq9hsyygfe8soDyJEpgICk3D+flttTQAx5tvRF0Bd/rzk70FCN+
	HxoaYMVbqE4Zn2RVE9tXGcJG2xC3ZIyzX5A6lbmQNLSyDaDdZOx0W7Vz0qY3OjIWbGrpWmfZBJQ
	KVdJNptiFQA6CTkkD9Py2BlVoashaAoIdA9pnI4NK7QjDaMs7t1CvFsJSmObh8dELaL+nji6LPa
	/V0OzZ52VAQ+M1MHYFPsoM9/l29IPvTOdHe+SsjmzlcbH9g==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5016985e9.10.1787245499095;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
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
 <20260818125012.468092-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qGWqRaC0iXII5bIvWaf5gJUevrvvUG461De9i3HzsU4_1787245499
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

