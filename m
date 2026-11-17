Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.105.120.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943811;
	b=KtVdzVJfQa0neQzdtHOR/YGe2Ds5WEJHH91wcMtYd+X+xUClQBQqTqY1Z440G9arAzlf
	 dUu4IqmItchXQSsLN2y7tt2ijJN5sxgZxgvzB4Qg5+P54Sj7vtN5tw+A1oBdYoNqO3jTH
	 AGv7gJewurEMnh6vggIQlQPp0kcqoQmlw+QnAyKpAHVxR/y6Tlb9MdL1LMBUSsKZ7y0bd
	 Zfm8pDeobpuvOaQ3WeIj+Mj7xIxv7ilLSdnAYKDHPUNrXLE+USYKP8J00ThQSjW3EHbC1
	 lpQhN8tT/KVZBNL/jknMKqMn8zPAJxP5+Cb8jt6JO5GT2BxAA3lLAq/NbDyNnt6T2bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943811;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NQcWJYXcCsWg3X8NCs1f9mSi3iz2sxvBngZ3uCDDJqI=;
	b=0PjI2fUdOd0Kjuhsi9uDdNeNOAE0KbLxQHSJ8keqzgeyGgWHwBht3WvAH4/OhrFwpDqM
	 zvPFn4c/FxMTBtbkt5ySPOpp/ZSQOUOZ2jVHyeEaJZpTGTMNkv6A6um9rNIfl0PIOA+Yn
	 islclULt31ogJgEStgdzm6WGRUnD/0mXNNO9bz4wbLcmK8FDBhfIYEtQBbNS7y53uW5CY
	 UagCx9qOb/CMCV2qtPND5OwxLSvHLjxjxV9vxWWjPC1GW8N7rBQuUwHjOYVB6Wmbbuwhs
	 fWFJcbwAocdWQH7g8GbAWD6Q/f41LK4oyItb6v0fosbtIIU0eaBSbNhDUFTiK+YajpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lankhorst.se;
	spf=pass smtp.mailfrom=lankhorst.se;
	dkim=pass header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=OqLfek60;
	arc=none smtp.remote-ip=141.105.120.124
Received: from lankhorst.se (unknown [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C336D606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 19:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C336D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=OqLfek60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
	s=default; t=1794943802;
	bh=Kp7UZQSY/Cg0B3igh2ZCIB/oKMtP9d1sLZeK+URz0pU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OqLfek60QX+RMh91IGTv5VHmniVGrfc5mB6nZG1lR2Jox2iRrf7sxYvEPIBwANd0f
	 3+MHAdABwSXzWGXpxJSdXsIebm56kYd7QLFSLxnRlgx3twqmf1tz8k/PuPREnjvVtJ
	 oelV8ZE1wnKV39/8pllkh/kZYCCB6S3TrD+HYGU8yWpC4FdaEvybhfCeK5nJUdMZ5a
	 qibaGXUzDmHFSvHqhYZYjn1iHFBqjaA1ojJL0Hmf0+yfmdw4i9Lz0V1Gb55aOGsPxf
	 +mrCgFFzuRd3NTZFMx3KuxGKU1zQB/1UoJefaYfZtG+vFI9K9IBHPtZ+pGIr8KQzU4
	 ep02SwHpERtRg==
Message-ID: <971e4aa1-917d-4bc1-bb6e-b4259a97c45a@lankhorst.se>
Date: Tue, 17 Nov 2026 20:31:18 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/i915: Introduce
 intel_bo_fbdev_bios_fb_takeover()
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20261117143038.479557-7-dev@lankhorst.se>
 <20261117143038.479557-12-dev@lankhorst.se>
 <sashiko-outbox-219104@kernel.org>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <sashiko-outbox-219104@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/17/26 16:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [Medium] drm/i915/fbdev: deferred BIOS FB takeover breaks FBC and
>   drm_panic
> - [Medium] drm/xe/display: missing fence wait in
>   xe_display_bo_fbdev_bios_fb_takeover()
> - [Medium] drm/xe/display: unconditional return false in
>   xe_display_bo_fbdev_prefer_stolen()
> - [Medium] drm/i915/fbdev: double unpin on error in
>   __intel_fbdev_fb_realloc()
> - [Low] drm/i915/fbdev: commit message mismatch on bios_fb_ok() rename
> --
> 
> commit 9269db9d41cf2915da41de1cbfd42a10b2dd2198
> Author: Maarten Lankhorst <dev@lankhorst.se>
> 
> drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()
> 
> This commit defers the decision to keep or replace a stolen-memory BIOS
> framebuffer from initial plane readout to fbdev probing via a new
> intel_bo_fbdev_bios_fb_takeover() parent interface callback, copying the
> BIOS framebuffer to system memory with the blitter on Xe when stolen
> memory is not preferred.
> 
>> Additionally, bios_fb_ok() was renamed
>> to bios_fb_takeover() with a different function signature.
> 
> [Severity: Low]
> This isn't a bug, but bios_fb_ok() is kept unchanged in intel_fbdev.c while
> intel_fbdev_fb_takeover() and intel_bo_fbdev_bios_fb_takeover() are added
> alongside it.
> 
> [ ... ]
> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index 219ee17de3f68..31f4dd2660c07 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -262,6 +262,50 @@ __intel_fbdev_fb_alloc(struct intel_display *display,
>>  
>>  }
>>  
>> +static struct intel_framebuffer *
>> +__intel_fbdev_fb_realloc(struct intel_display *display,
>> +			 const struct drm_framebuffer *orig_fb,
>> +			 struct drm_gem_object *obj)
>> +{
>> +	struct drm_framebuffer *new_fb;
>> +	struct drm_mode_fb_cmd2 mode_cmd = {
>> +		.flags = DRM_MODE_FB_MODIFIERS,
>> +		.width = orig_fb->width,
>> +		.height = orig_fb->height,
>> +		.pitches[0] = orig_fb->pitches[0],
>> +		.offsets[0] = orig_fb->offsets[0],
>> +		.pixel_format = orig_fb->format->format,
>> +		.modifier[0] = orig_fb->modifier,
>> +	};
>> +
>> +	new_fb = intel_framebuffer_create(obj, orig_fb->format, &mode_cmd);
>> +
>> +	if (IS_ERR(new_fb)) {
>> +		intel_bo_fbdev_destroy(obj);
>> +		return ERR_CAST(new_fb);
>> +	}
> 
> [Severity: Medium]
> Can this error path unpin obj twice on Xe when intel_framebuffer_create()
> fails after intel_bo_framebuffer_init()?
> 
> xe_display_bo_fbdev_bios_fb_takeover() allocates copy_bo via
> xe_bo_create_pin_map_novm() with XE_BO_FLAG_PINNED set and pin_count == 1.
> Inside intel_framebuffer_init(), xe_display_bo_framebuffer_init() takes a
> reference on the BO without pinning it, but if a later step in
> intel_framebuffer_init() fails (such as drm_framebuffer_init()), its error
> unwind calls intel_bo_framebuffer_fini() -> xe_display_bo_framebuffer_fini():

No, it only fails like that if framebuffer parameters are invalid. As we copy
them from a valid framebuffer, this will never happen.

> drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_framebuffer_fini() {
> 	struct xe_bo *bo = gem_to_xe_bo(obj);
> 
> 	if (bo->flags & XE_BO_FLAG_PINNED) {
> 		/* Unpin our kernel fb first */
> 		xe_bo_lock(bo, false);
> 		xe_bo_unpin(bo);
> 		xe_bo_unlock(bo);
> 	}
> 	xe_bo_put(bo);
> }
> 
> intel_bo_fbdev_destroy() -> xe_bo_unpin_map_no_vm() then calls
> xe_bo_unpin() a second time on copy_bo, triggering the pinned assertions in
> xe_bo_unpin() and WARN_ON_ONCE(!bo->pin_count) in ttm_bo_unpin().
> 
>> +
>> +	drm_gem_object_put(obj);
>> +	return to_intel_framebuffer(new_fb);
>> +}
> 
> [ ... ]
> 
>> @@ -305,13 +349,26 @@ int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
>>  
>>  	ifbdev->fb = NULL;
>>  
>> -	if (fb && !bios_fb_ok(fb, sizes)) {
>> +	wakeref = intel_display_rpm_get(display);
>> +
>> +	if (fb && bios_fb_ok(fb, sizes)) {
>> +		struct intel_framebuffer *bios_fb =
>> +			intel_fbdev_fb_takeover(display, fb);
>> +
>> +		if (IS_ERR(bios_fb)) {
>> +			drm_dbg_kms(display->drm, "Re-using BIOS fb failed (%pe).", bios_fb);
>> +			bios_fb = NULL;
>> +		}
>> +
>> +		if (fb != bios_fb) {
>> +			drm_framebuffer_put(&fb->base);
>> +			fb = bios_fb;
>> +		}
>> +	} else if (fb) {
>>  		drm_framebuffer_put(&fb->base);
>>  		fb = NULL;
>>  	}
> 
> [Severity: Medium]
> Does deferring the stolen-memory check to intel_fbdev_driver_fbdev_probe()
> and swapping ifbdev->fb without a plane commit regress FBC, stolen-memory
> workarounds, and drm_panic?

The whole point is to fix the stolen memory workarounds in a better way. :-)

> 
> Because initial_plane_vma() and initial_plane_bo() now unconditionally wrap
> the BIOS framebuffer in stolen memory, it remains allocated during
> intel_initial_commit() before intel_fbdev_setup() runs.  When the BIOS
> framebuffer occupies more than half of stolen memory, intel_fbc_alloc_cfb()
> -> find_compression_limit() during intel_initial_commit() either fails with
> -ENOSPC or permanently degrades fbc->limit to 1:2 or 1:4, as
> intel_fbc_is_cfb_ok() does not upgrade the CFB once the stolen BIOS
> framebuffer is freed.
> 
> In addition, when intel_fbdev_fb_takeover() replaces the stolen framebuffer
> with a system-memory framebuffer, drm_framebuffer_put(&fb->base) only drops
> ifbdev->fb's reference; the active primary plane's plane_state->uapi.fb and
> plane_state->hw.fb still hold the original stolen framebuffer until an
> atomic commit flips the plane.  When
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y or
> CONFIG_FRAMEBUFFER_CONSOLE=n, register_framebuffer() returns without
> calling fb_set_par(), leaving the hardware plane scanning out the stolen
> framebuffer (and leaving MTL Wa_22018444074, Xe Wa_22019338487_display, and
> media GT MC6 latency unmitigated) while ifbdev->fb and /dev/fb0 point to
> the new system-memory buffer.
This is intentional.

> 
> While plane_state->hw.fb still points to the stolen BIOS framebuffer and
> display->fbdev.fbdev->fb points to the replacement framebuffer,
> intel_get_scanout_buffer() also no longer matches
> intel_fbdev_framebuffer(display->fbdev.fbdev) and falls back to
> intel_parent_panic_setup() on the stolen BO, which fails on both i915 and
> Xe.
> 
> [ ... ]
> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
>> index d78d893210c4f..43d05a58bcb47 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
>> @@ -120,7 +121,7 @@ static u32 xe_display_bo_fbdev_pitch_align(u32 stride)
>>  	return ALIGN(stride, XE_PAGE_SIZE);
>>  }
>>  
>> -bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>> +static bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>>  {
>>  	struct ttm_resource_manager *stolen;
>>  
>> @@ -152,6 +153,64 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>>  	return stolen->size >= (size * 2) >> PAGE_SHIFT;
>>  }
>>  
>> +static struct drm_gem_object *xe_display_bo_fbdev_bios_fb_takeover(struct drm_gem_object *obj)
>> +{
>> +	struct xe_bo *orig_bo = gem_to_xe_bo(obj), *copy_bo;
>> +	struct xe_device *xe = xe_bo_device(orig_bo);
>> +	struct xe_validation_ctx ctx;
>> +	struct drm_exec exec;
>> +	int err;
>> +
>> +	if (IS_DGFX(xe) ||
>> +	    xe_display_bo_fbdev_prefer_stolen(xe, xe_bo_size(orig_bo)))
>> +		return obj;
> 
> [Severity: Medium]
> Does xe_display_bo_fbdev_prefer_stolen() unconditionally return false here?
> 
> Earlier commit "HACK: Always fallback" in this series left an unconditional
> "return false;" right before the size check in
> xe_display_bo_fbdev_prefer_stolen():
> 
> drivers/gpu/drm/xe/display/xe_display_bo.c:xe_display_bo_fbdev_prefer_stolen() {
>     ...
> 	/* machine hang when doing lots of LMEMBAR accesses */
> 	if (XE_DEVICE_WA(xe, 22019338487_display))
> 		return false;
> 
> 	return false;
> 
> 	/*
> 	 * If the FB is too big, just don't use it since fbdev is not very
> 	 * important and we should probably use that space with FBC or other
> 	 * features.
> 	 */
> 	return stolen->size >= (size * 2) >> PAGE_SHIFT;
> }
> 
> Because of that statement, the stolen size check is unreachable and
> xe_display_bo_fbdev_bios_fb_takeover() always rejects stolen memory on
> every integrated Xe platform.
> 
>> +
>> +	copy_bo = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), xe_bo_size(orig_bo),
>> +					    ttm_bo_type_kernel,
>> +					    XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT,
>> +					    false);
>> +	if (IS_ERR(copy_bo))
>> +		return ERR_CAST(copy_bo);
>> +
>> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
>> +		struct dma_fence *fence;
>> +
>> +		err = drm_exec_lock_obj(&exec, &orig_bo->ttm.base);
>> +		drm_exec_retry_on_contention(&exec);
>> +		if (err)
>> +			break;
>> +
>> +		err = drm_exec_lock_obj(&exec, &copy_bo->ttm.base);
>> +		drm_exec_retry_on_contention(&exec);
>> +		if (err)
>> +			break;
>> +
>> +		err = dma_resv_reserve_fences(orig_bo->ttm.base.resv, 1);
>> +		if (err)
>> +			break;
>> +
>> +		err = dma_resv_reserve_fences(copy_bo->ttm.base.resv, 1);
>> +		if (err)
>> +			break;
>> +
>> +		fence = xe_migrate_copy(xe_device_get_root_tile(xe)->migrate, orig_bo, copy_bo,
>> +					orig_bo->ttm.resource, copy_bo->ttm.resource, false);
>> +		if (IS_ERR(fence)) {
>> +			err = PTR_ERR(fence);
>> +			break;
>> +		}
>> +
>> +		dma_resv_add_fence(copy_bo->ttm.base.resv, fence, DMA_RESV_USAGE_KERNEL);
>> +		dma_resv_add_fence(orig_bo->ttm.base.resv, fence, DMA_RESV_USAGE_BOOKKEEP);
>> +		dma_fence_put(fence);\n+\n+\t\treturn &copy_bo->ttm.base;\n+\t}
> 
> [Severity: Medium]
> Can CPU accesses to info->screen_base race with the asynchronous
> xe_migrate_copy() blit into copy_bo?
> 
> copy_bo is created already pinned via xe_bo_create_pin_map_novm(), so when
> intel_fbdev_driver_fbdev_probe() subsequently calls
> intel_parent_fb_pin_ggtt_pin() -> __xe_pin_fb_vma() -> xe_bo_validate(),
> xe_bo_validate() returns early because xe_bo_is_pinned(copy_bo) is true
> without waiting on copy_bo's reservation fences.
> intel_bo_fbdev_fill_info() then exposes copy_bo->vmap.vaddr_iomem as
> info->screen_base and register_framebuffer() registers /dev/fb0.  If
> fb_set_par() is not called immediately (for example with
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y) or if
> drm_client_modeset_commit() in drm_fb_helper_set_par() returns -EBUSY,
> nothing waits for fence before CPU reads or writes hit info->screen_base,
> allowing the in-flight GPU blit to overwrite newly rendered fbdev pixels or
> expose incomplete copy data.
> 
Should be harmless, if it becomes a problem, we could maybe commit a nonblocking
flip to get rid of the old framebuffer.

