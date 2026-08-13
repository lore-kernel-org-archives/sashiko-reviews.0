Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21047CC67
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633467; cv=none; b=cdJCF+0Zq/jQp/bn+FLjUxSw7HRS9LdJQkHD+G+P40OCha5GyXy4Kb9jSrIFftK5v504TSdolw5q3DMaHTjoOfFGH03ATAEtgvxjtKIz+UCe+ufKmdwb/FghKy52ZbY1STYdvzvXDpOqK0YTq/UM6LwjrDsGmh65eq/AmkQTRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633467; c=relaxed/simple;
	bh=5zTi31vZB3GT0Sh+ZwqdBoZyA/bp9f5f4Ldd7AUuq98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLvz6fsp56INp1knzuV5loZ9OTsVKJWDW6Z9nNBcNZPVHkqLhzBxSvRhelKvmeHEVkPzPobyDUkWkpzYGJjdIDEPjis1fJXSJ5rC+Ci9IWxPHiWl+SxtMSg2pKSiqev/9neZrhuJ/b4V40rCQcIcY0PiBi+fch/7G84XfZBQdG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lNZ8yr6l; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lNZ8yr6l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=KtKOQIt0m4NPOgD4wYzf6ZB8/ruzhBRsosCHoXqM2DM=; b=lNZ8yr6lxUcj/hNOSPoO+ECEFC
	wMvCx1mYS1qAHtqAjqPchGI/U1KtVc1YiPYotrYm/Vx/LWMDDBUAdY8qL7JtThuyboj+sTTOnFi1q
	Ya6A0mSk4pAjvB4nFvHHroWm4zoXCOkZ8mxSr8uyPBXPe+IplBM+p/rL0QP5+i8EqKq3UWeIVeAQe
	akcCAHUcOQ245Gve5Q+U2I9jNFK9OghTNvUamATkbL+3gLLnnmmdWvUqvr2WfE1n0ybIW64H9FLrU
	FriFahJqmlMykyFlp0V43obY4pCIFKJ7JFT/m2z+XFrdeYKjfkdjpQtLbvLMR+H7UTvJBirw7zz3L
	WKtTgcDw==;
Received: from [31.4.149.66] (helo=[192.168.1.126])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wuWyi-000t6j-Jk; Thu, 13 Aug 2026 17:04:20 +0200
Message-ID: <9a5ec6db-2f5b-459c-9d21-11e0de993523@igalia.com>
Date: Thu, 13 Aug 2026 17:04:19 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/amd/display: advertise PIXEL_NONE as blend
 mode for DCE generations
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260813143605.106104-1-mwen@igalia.com>
 <20260813143605.106104-4-mwen@igalia.com>
 <20260813144405.EF8031F000E9@smtp.kernel.org>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260813144405.EF8031F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/08/2026 16:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Calling drm_plane_create_blend_mode_property() without PREMULTI support triggers a kernel warning (WARN_ON) and fails to create the property.
> --
>
> --- Patch [3]: [PATCH v3 3/3] drm/amd/display: advertise PIXEL_NONE as blend mode for DCE generations ---
> commit 44681caffc8bcfc7085bcfe1ec288a0eafc8c992
> Author: Melissa Wen <mwen@igalia.com>
>
> drm/amd/display: advertise PIXEL_NONE as blend mode for DCE generations
>
> This commit changes the blend mode property creation for primary planes on
> DCE generations. It modifies the driver to create the blend mode property
> with PIXEL_NONE only, instead of the DRM default PREMULTI mode.
>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 423e3cd7b9c98..e02cbafc8c5d0 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> [ ... ]
>> @@ -2208,14 +2208,18 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> [ ... ]
>> -	if ((plane->type == DRM_PLANE_TYPE_OVERLAY ||
>> -	     plane->type == DRM_PLANE_TYPE_PRIMARY) &&
>> -	    plane_cap && plane_cap->per_pixel_alpha &&
>> -	    plane_cap->type == DC_PLANE_TYPE_DCN_UNIVERSAL) {
>> +	if (plane_cap && plane_cap->type != DC_PLANE_TYPE_DCN_UNIVERSAL) {
>> +		drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_PIXEL_NONE));
> [Severity: High]
> Does this trigger a kernel warning and fail to create the property?
>
> Looking at drm_plane_create_blend_mode_property() in drm_blend.c, the DRM
> core explicitly enforces that DRM_MODE_BLEND_PREMULTI must be supported:
>
> int drm_plane_create_blend_mode_property(struct drm_plane *plane,
> 					 unsigned int supported_modes)
> {
> 	...
> 	if (WARN_ON((supported_modes & ~valid_mode_mask) ||
> 		    ((supported_modes & BIT(DRM_MODE_BLEND_PREMULTI)) == 0)))
> 		return -EINVAL;
> 	...
> }
>
> Since amdgpu_dm_plane_init() now passes only BIT(DRM_MODE_BLEND_PIXEL_NONE),
> this will trigger the WARN_ON and return -EINVAL during device probe,
> meaning the property is not created at all.

No, you are probably looking at an outdated codebase.

Other blend modes are supported since:

9813e158d13d5 ("drm/drm_blend: allow blend mode property without 
PREMULTI") in drm-misc-next.

Melissa

>
>> +	} else if ((plane->type == DRM_PLANE_TYPE_OVERLAY ||
>> +		    plane->type == DRM_PLANE_TYPE_PRIMARY) &&
>> +		   plane_cap && plane_cap->per_pixel_alpha) {
>>   		unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>>   					  BIT(DRM_MODE_BLEND_PREMULTI) |
>>   					  BIT(DRM_MODE_BLEND_COVERAGE);

