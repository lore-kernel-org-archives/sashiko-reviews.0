Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4C41F7EE
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814869; cv=none; b=fWQWNdB8THqFpSKBUi8KnZWxP/ZWmsjEwhdP31FLH4Sh7xT0qkgA4HdX4HKCrECpaT0+cWiER1uSxldxyPbpwZzb7RYEpLoc1JYDYY6krMVn3uxzrsSj2YRGTScZfOxCRSVN2TTbrzMGWduhxhOqS91qdJb+MPAYFxGU0TMYnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814869; c=relaxed/simple;
	bh=Pfp4fHaGp3DYNoQNsq++Hih2POFfdEHNA9k/g4/DYlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTAeVoyxXGWgyCPj4g14XVl7QPFWSgOFbucHIMDtLj48j4whUvybexVvbSxPAN8ZICxan7HNzsdGQWnXw7NuRS141yIjKwjUnXe8ZiNlgut/rGex9/wcPeVvBP0aKdhpdpG1xWjMXVv1EcxG1RnzJscU/QGHAGmFeB7OwAkwEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgI1rcg1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgI1rcg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788814866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
	b=LgI1rcg1cbsuNW1oWevjWdKuRypXCfEXJFDufDhqSoD/ozQUByaVtEOx26PO0heKbPIxwF
	HFJ3/8hrTelO+HrnpL2F+oQaHcbQx9MopFoM/lAdBrnukfvSL7/zKM6ri0diot2OXkaRqP
	JtvMBjIKQZiVIwvztxq2gu4R/AII3Fw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-xMQuxvO8OrCpNT80bQtMZw-1; Mon, 07 Sep 2026 17:01:02 -0400
X-MC-Unique: xMQuxvO8OrCpNT80bQtMZw-1
X-Mimecast-MFC-AGG-ID: xMQuxvO8OrCpNT80bQtMZw_1788814862
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4957287363bso31423265e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814862; x=1789419662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
        b=nFyL3jyY0a0ssuZWxAI/cg9vWcqZdnNrF/1kJgpc4BasSy79CkVCIYzc0K1RMObbs/
         CM5Ycom+sGVZAZDC757Y4yjuLeAcAIxc+5ZJDR4x1ewi/VCiNOvK8hIr5QHRbectpSWt
         Ck8HQcl9mn2yKIyLnpniyPyaaX4qArl9aBaWgf4b3agrYxntRGcHFypFxvMIPMAC9Jmm
         klrDpquU11qOyUVPrbbcizL75u14pyp51PB2CT/WDmQekmsaMlXAgVOVXFnJZL+dI2X1
         2+lrcrrx29snf11jjqVBNDDdZGLplOhGbDMQXzl5mreNKXFEDsZ/7JcIwk492VkJZS7x
         iL3g==
X-Forwarded-Encrypted: i=1; AKwUvBxbozbCHzworNCuM1i8MrXk8m8GCGx2Kxs9xPU6Il4EENWPd3gNSmMavQRTvDtrncFfiM1+0f2moIXKZq2L98A=@lists.linux.dev
X-Gm-Message-State: AFuF++nJSE3kVz/ukJJNw/OU9whUnWKTXYhFOfIsQXUKOC0R99vWPgTu
	xXbdC8v3QB5paCCHyxNRiLEt/kIJSccjX5IO3sDMdngou6krY1Sy9a3ezakY8mDHDhNNRsBU6D8
	BkPJHlTMXJ6tpsszKiD4Q5+3z6s0muGXCK8rhTF/i/VygPo8ECxiiGUhhtgoAVj+9cjz6dg==
X-Gm-Gg: AYBFou0CC4j+3KZKq0/0pww/ZVvSVuTuEBVaLrJ4WeGpQmhJTKSCvnrCzI/AusTFoFv
	WvXkoLj+Bgd4lTTiiVBptPBwrrFcUpD2+pGZxDT9d18++ivFm2BIo0XMgrq+TC94i60uQlejajB
	jZk7RyI+7UzIxbBuiDsXC+7uIDN3ZKNNAWW2FymZC2XbNGgEJMs4gau4uTeEftFQEqqqDcwETo1
	mwAxC9/La6WYKmFA1/29TZMZk4yEXpdhC7O7mOiDSce91QwBrxvKiJN2F4zQCoigE+MUIjYuw8y
	z3/t/aB+yhe7/iX4QaBR+zMeZcdfFgBkVy4BGkj1WW5oODGLv/wAoYmTxPk7xRqEmBvpe6sRHwY
	VI33wtGptHQf67UbbG0d+05/KU6+xcN8Kw5yepqtdwOt1ofk8
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167275145e9.33.1788814861725;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sKDzXGU0-gAlmDmTbN-eX0pFgIvn_TF9QU42xjn5_jU_1788814862
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

