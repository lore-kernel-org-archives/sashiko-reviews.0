Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E44274B2A
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129536; cv=none; b=OnUr/Cm/Q9ec9wMza4ZmdSrZJddbPVc/N+iwsX8B4MUlgL7FtNPCsNVG80yiB0g7trQF3P1O7gBDVAeEwRz3LBBUkVrVltamAPtFryltduV11KAY4KWtRZtAvO1HwAlxCiIfoU4hm8RYMX3yF6rDAQfGjIef7wX4V76k6BmXaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129536; c=relaxed/simple;
	bh=mBzFfdwt63phXA4EyRq5Ct03YE8f6Hs5cmyJPfk6uTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tw1yAPfUKuf2tAufyRymwmz+doD5UzQzhTuYBkBZcej5gTr+FbudApknb+zI+nqHIqyBtN6bMEkoEYTQ9Cu9LwkJ6BOoXK9kPa/ZKqA5ibX65udBn1yzA6DkL+6SJp8VwY/sxk8bPMCWgkO22MTmOdADN/tacR6auzUuGv3pIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=dpci8ama; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="dpci8ama"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dN6IP1hSjT3zBfIMoR4CX8mAqxCapWhaNWitozUomXo=;
	b=dpci8amaNnerLFcvVJkrttavk1dYIK0F5kY/6X860PG5X54NB6QcfifVqOPhYPRqcJMYKj0tE
	UuYnDWZHAEFsiEJ2PiSVfLpxxVyZMAZFW0P0tbYmoKgaAEE/svG+nobRnJALXNd/zOKbcAeH/zk
	n2N0KaJARVzWRQ+WpqyYKzI=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gkRNH4z1Bz1prp5;
	Mon, 22 Jun 2026 19:50:39 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 26A2240569;
	Mon, 22 Jun 2026 19:58:44 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 19:58:43 +0800
Received: from [10.159.167.44] (10.159.167.44) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 19:58:42 +0800
Message-ID: <42dbba04-fa9d-49da-9c01-b8708218ab12@huawei.com>
Date: Mon, 22 Jun 2026 19:58:42 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/hibmc: Do not use cpp from struct
 drm_format_info
To: Thomas Zimmermann <tzimmermann@suse.de>, <tiantao6@hisilicon.com>,
	<kong.kongxinwei@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <sashiko-reviews@lists.linux.dev>,
	<shiyongbang@huawei.com>, "Liangjian(Jim,Kunpeng Solution Development Dept)"
	<liangjian010@huawei.com>, Chenjianmin <chenjianmin@huawei.com>, "fengsheng
 (A)" <fengsheng5@huawei.com>
References: <20260618123142.92298-1-tzimmermann@suse.de>
 <20260618123142.92298-5-tzimmermann@suse.de>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20260618123142.92298-5-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq100007.china.huawei.com (7.202.195.175)

> Replace uses of struct drm_format_info's cpp with appropriate interfaces.
> The cpp field contains the characters per pixel. It is deprecated and
> should be avoided.
> 
> Calculate the line width in bytes with drm_format_info_min_pitch(). This
> is the preferred way of getting pixel and line sizes.
> 
> Program HIB_CRT_DISP_CTL_FORMAT from the format's 4CC code instead of
> calculating the field's value from the cpp.
> 
> v4:
> - introduce fb variable in separate patch (Yongbang)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 19cb16a7daf9..fe73b365e547 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -119,7 +119,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
>  
>  	writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
>  
> -	reg = fb->width * fb->format->cpp[0];
> +	reg = drm_format_info_min_pitch(fb->format, 0, fb->width);
>  
>  	line_l = fb->pitches[0];
>  	writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
> @@ -129,7 +129,14 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
>  	/* SET PIXEL FORMAT */
>  	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
>  	reg &= ~HIBMC_CRT_DISP_CTL_FORMAT_MASK;
> -	reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, fb->format->cpp[0] * 8 / 16);
> +	switch (fb->format->format) {
> +	case DRM_FORMAT_XRGB8888:
> +		reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, 2);
> +		break;
> +	case DRM_FORMAT_RGB565:
> +		reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, 1);
> +		break;
> +	}
>  	writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
>  }
>  

Reviewed-by: Yongbang Shi <shiyongbang@huawei.com>

Thanks,
Yongbang.

