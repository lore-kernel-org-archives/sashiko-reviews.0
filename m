Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9940D589
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162496; cv=none; b=SM+gb2hQGAMLPtVOgDbabIX2nK4z7wfrRKoCwt6+ZBBQVVGjm3NAAz0ReHGFv04mw/nA05CdsCBzw3sKo4VdTWoK4srz8OENzEiyD6Y5H+pP/UHIQN4vvRvcCBEDczIp4fMJI4lA2Ob61FLJIjBPpkKaAG0ZOQ9ds9j/4JSJaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162496; c=relaxed/simple;
	bh=6hSwPTXfSUKha9xSDmwb23pO7OT5Ech59/HZtmWYMWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJkg4GDkGFjk20xIS6hAi55COMVmXkgvcGZ7Ce58t8RhaUCcKP3Hso4sLSoWoqNc2ex0tHimrl54nCBhBlUCbepJg1cO+djzN5RGO5JXbn7lYNrezE7ZEqN2Xm96VdANLAEM71cRx+OYN0rB/7RPgQ8BBmUONPSDL1J6HiuYRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bLdc3+WF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jE98TOMS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bLdc3+WF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jE98TOMS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bLdc3+WF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jE98TOMS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bLdc3+WF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jE98TOMS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A82796AE80;
	Thu, 11 Jun 2026 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781162487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzwW8m48HUFeC/68gJ4oWigLQpBtoo74ozVcMPNbVXs=;
	b=bLdc3+WFt+wJkNpAtJpPYnQqAq8/L7sDRaIk6h0z0G+IhxtmvOu+0PAOegQXCC4P8roxf2
	xdp1VUPYGr1ElBI2ygGDWle+yS8CQvuF6yO4Wog+k2AsPoLfiida5ZBoJrCB5GgGxAbLBP
	aPyiMvFkNDFiTgQe/U9NUbHb+Fo+H88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781162487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzwW8m48HUFeC/68gJ4oWigLQpBtoo74ozVcMPNbVXs=;
	b=jE98TOMSMdby1emkjYVZCSrXbnLlvOE6xVVrviF7IzwfnlAmKQbtgFRzGp3T+BlSbnKroK
	7vmUX2dfOHgKM5Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781162487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzwW8m48HUFeC/68gJ4oWigLQpBtoo74ozVcMPNbVXs=;
	b=bLdc3+WFt+wJkNpAtJpPYnQqAq8/L7sDRaIk6h0z0G+IhxtmvOu+0PAOegQXCC4P8roxf2
	xdp1VUPYGr1ElBI2ygGDWle+yS8CQvuF6yO4Wog+k2AsPoLfiida5ZBoJrCB5GgGxAbLBP
	aPyiMvFkNDFiTgQe/U9NUbHb+Fo+H88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781162487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzwW8m48HUFeC/68gJ4oWigLQpBtoo74ozVcMPNbVXs=;
	b=jE98TOMSMdby1emkjYVZCSrXbnLlvOE6xVVrviF7IzwfnlAmKQbtgFRzGp3T+BlSbnKroK
	7vmUX2dfOHgKM5Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 704AF779A9;
	Thu, 11 Jun 2026 07:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJE+GvdhKmqKKAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 11 Jun 2026 07:21:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk,
	airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/3] drm/armada: fbdev: Calculate buffer geometry with format helpers
Date: Thu, 11 Jun 2026 09:20:11 +0200
Message-ID: <20260611072121.71492-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611072121.71492-1-tzimmermann@suse.de>
References: <20260611072121.71492-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -6.80

Replace the geometry and size calculation in armada's fbdev emulation
with DRM format helpers. This consists of a 4CC lookup from the fbdev
parameters, format lookup, pitch calculation and size calculation.

Then allocate the GEM buffer object for the framebuffer memory from
the calculated size. Mmap provides the allocated buffer to user space,
so align the buffer size to PAGE_SIZE.

Slightly rearrange cleaning up the GEM object and rolling back on
errors. This will simplify error handling when the code uses client
buffers.

v2:
- add more error checks to geometry calculations

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_fbdev.c | 65 ++++++++++++++++-----------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 8bbae94804f8..f95658091acf 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -45,20 +45,30 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 {
 	struct drm_device *dev = fbh->dev;
 	struct fb_info *info = fbh->info;
+	u32 fourcc, pitch;
+	u64 size;
+	const struct drm_format_info *format;
 	struct drm_mode_fb_cmd2 mode;
 	struct armada_framebuffer *dfb;
 	struct armada_gem_object *obj;
-	int size, ret;
+	int ret;
 	void *ptr;
 
-	memset(&mode, 0, sizeof(mode));
-	mode.width = sizes->surface_width;
-	mode.height = sizes->surface_height;
-	mode.pitches[0] = armada_pitch(mode.width, sizes->surface_bpp);
-	mode.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-					sizes->surface_depth);
+	fourcc = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	if (fourcc == DRM_FORMAT_INVALID)
+		return -EINVAL;
+	format = drm_get_format_info(dev, fourcc, DRM_FORMAT_MOD_LINEAR);
+	if (!format)
+		return -EINVAL;
+	pitch = armada_pitch(sizes->surface_width, drm_format_info_bpp(format, 0));
+	if (!pitch)
+		return -EINVAL;
+	if (check_mul_overflow(pitch, sizes->surface_height, &size))
+		return -EINVAL;
+	size = ALIGN(size, PAGE_SIZE);
+	if (size < PAGE_SIZE)
+		return -EINVAL;
 
-	size = mode.pitches[0] * mode.height;
 	obj = armada_gem_alloc_private_object(dev, size);
 	if (!obj) {
 		DRM_ERROR("failed to allocate fb memory\n");
@@ -66,30 +76,26 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 	}
 
 	ret = armada_gem_linear_back(dev, obj);
-	if (ret) {
-		drm_gem_object_put(&obj->obj);
-		return ret;
-	}
+	if (ret)
+		goto err_drm_gem_object_put;
 
 	ptr = armada_gem_map_object(dev, obj);
 	if (!ptr) {
-		drm_gem_object_put(&obj->obj);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_drm_gem_object_put;
 	}
 
-	dfb = armada_framebuffer_create(dev,
-					drm_get_format_info(dev, mode.pixel_format,
-							    mode.modifier[0]),
-					&mode, obj);
-
-	/*
-	 * A reference is now held by the framebuffer object if
-	 * successful, otherwise this drops the ref for the error path.
-	 */
-	drm_gem_object_put(&obj->obj);
+	memset(&mode, 0, sizeof(mode));
+	mode.width = sizes->surface_width;
+	mode.height = sizes->surface_height;
+	mode.pitches[0] = pitch;
+	mode.pixel_format = fourcc;
 
-	if (IS_ERR(dfb))
-		return PTR_ERR(dfb);
+	dfb = armada_framebuffer_create(dev, format, &mode, obj);
+	if (IS_ERR(dfb)) {
+		ret = PTR_ERR(dfb);
+		goto err_drm_gem_object_put;
+	}
 
 	info->fbops = &armada_fb_ops;
 	info->fix.smem_start = obj->phys_addr;
@@ -105,5 +111,12 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 		dfb->fb.width, dfb->fb.height, dfb->fb.format->cpp[0] * 8,
 		(unsigned long long)obj->phys_addr);
 
+	/* The framebuffer still holds a reference on the GEM object. */
+	drm_gem_object_put(&obj->obj);
+
 	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&obj->obj);
+	return ret;
 }
-- 
2.54.0

