Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0213F26738B
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781548044; cv=none; b=Z1Bb9San8UHeVH3tE7lf+WrPAsVlpLG8DR+LWonniMpB94RykxvJsTMFQ/H+tNia+nJJSP5Bg8vLITfri62DaOc6tFK/KJPztIOiGlOfGGN5TMPfcbeAAeHQcCVtP1bWZ0NfEfbebTSkjn4pGJbDcsn98cgmY7EXnjXEeLDWPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781548044; c=relaxed/simple;
	bh=f7KvGe2FS5Tgmpbt0VHMVWazbbOa4R4h7k5ccAWDI+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHPgC4IjZTI7UMueD2G/Dh12e8rFoV314YbiNbnwGgyeToPWbTRMhmPZs3uxy88W9uzsroQJfbUZy2D/a0p1m/GNi2auO4fZnBnrpWq9d4fGNpTYb5xk2iusaogbsP7x3Pdq4LLqZKapGH+RELUr+x2SIzH8xC20wb00eam+9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com; spf=pass smtp.mailfrom=Igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GE/yVCfk; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GE/yVCfk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xdvmpa02NvRDCnlFtecMMZM6My+GX1DYEYglA7Z1Bro=; b=GE/yVCfk78acpv9YH5tMCuIV/V
	v1UJPZQ9PLUoBIMAttSL+CnDztnjc6XiCeS0bMWuF2lRqi+ycErHzwv2Bww7xwrAxbdhSrdBkkDTg
	wiaC6ZIqQdzClxyKkcyZhXWHlLqXFVhXTprZ1jnXPtSBHqHVSI2ApFvPjrvoV3rFHPZuJb9w44n/c
	ZOiCVh8oC50xe5Fj6VXhK18Y24n0bgj1aP7fU64F4Vn0PJbQG9BwYEnh5yIxUuqIkXyEGN0HUfSLu
	euXTlj5cy+y+Ayuakbdnuk5NTjqSAgnBu4I2AknlsTrZy+oYPpU4hpzh2NrLiM4ZHp5Pd0j1hREkQ
	2jaNfF3A==;
Received: from 216-176-47-241.ptr.pdx.com ([216.176.47.241] helo=[10.132.7.237])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wZC1k-000Mqb-Ed; Mon, 15 Jun 2026 20:27:16 +0200
Message-ID: <e98e6632-20a1-4e76-a6e5-916066c7438a@Igalia.com>
Date: Mon, 15 Jun 2026 11:27:12 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] drm/amd/display: use
 drmm_writeback_connector_init()
To: sashiko-reviews@lists.linux.dev,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, wsa+renesas@sang-engineering.com
References: <20260612-wb-drop-encoder-v6-3-9f3a54f81310@oss.qualcomm.com>
 <20260612185828.C0D241F00A3E@smtp.kernel.org>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260612185828.C0D241F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/26 11:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Dangling drmm cleanup action on writeback connector initialization error path leads to Use-After-Free, and possible build failure with drmm_kfree.
>
> Pre-existing issues:
> - [High] Pre-existing memory leak of `wb_info` and sleeping in atomic context in `dm_set_writeback()`.
> --
>
> commit 946e1af8401710237d25526b5d87b4357eceb542
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> drm/amd/display: use drmm_writeback_connector_init()
>
> The patch converts the driver to use drmm_writeback_connector_init() and
> drmm_plain_encoder_alloc() to ensure proper cleanup of the writeback
> connector instance and its job queue.
>
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> [ ... ]
>> @@ -11086,7 +11086,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>>   		return;
>>   	}
>>   
>> -	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
>> +	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
> [Severity: High]
> This is a pre-existing issue, but does dm_set_writeback() allocate memory
> using GFP_KERNEL in an atomic context?
>
> It appears that wb_info is allocated using kzalloc_obj() earlier in this
> function, which implicitly uses GFP_KERNEL. However, this function is called
> from amdgpu_dm_atomic_commit_tail(), which is an atomic context where sleeping
> functions are forbidden.
>
> Additionally, dc_stream_add_writeback() copies the contents of wb_info by
> value, but the originally allocated pointer seems to never be freed before
> dm_set_writeback() returns. Does this introduce a memory leak every time a
> writeback job is queued?
>
>>   	if (!acrtc) {
>>   		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
>>   		kfree(wb_info);
> [ ... ]
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> [ ... ]
>> @@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
>>   	struct dc *dc = dm->dc;
>>   	struct dc_link *link = dc_get_link_at_index(dc, link_index);
>>   	int res = 0;
>> +	struct drm_encoder *encoder;
>> +
>> +	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
>> +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +	if (IS_ERR(encoder))
>> +		return PTR_ERR(encoder);
>> +
>> +	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
>> +
>> +	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
>>   
>>   	wbcon->link = link;
>>   
>>   	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
>>   
>> -	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
>> +	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
>>   					    &amdgpu_dm_wb_connector_funcs,
>> -					    &amdgpu_dm_wb_encoder_helper_funcs,
>> +					    encoder,
>>   					    amdgpu_dm_wb_formats,
>> -					    ARRAY_SIZE(amdgpu_dm_wb_formats),
>> -					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
>> +					    ARRAY_SIZE(amdgpu_dm_wb_formats));
> [Severity: High]
> If drmm_writeback_connector_init() fails internally after successfully calling
> drmm_connector_init(), will it leave the drmm_connector_cleanup_action
> registered?
I'm not following this one. everything that 
drmm_writeback_connector_init() does has a check on the return code and 
only if everything works does it register the cleanup function as the 
last action. So how do you get a dangling anything?

>
> The caller, amdgpu_dm_initialize_drm_device(), appears to handle this failure
> by attempting to free the connector using drmm_kfree(). Since drmm_kfree()
> requires a dev argument, will this missing argument result in a build failure?
Bizarre that it is complaining about something in a totally different patch.

>
> More importantly, since drmm_kfree() frees the memory but does not unregister
> actions, will the managed resource list later execute
> drmm_connector_cleanup_action on the already-freed pointer, resulting in a
> use-after-free when the DRM device is torn down?
Isn't this just lying? The whole point of drmm_kfree() is surely that it 
does unregister the cleanup of the allocation?

>
>>   
>>   	if (res)
>>   		return res;

