Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F493F485E
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091929; cv=none; b=lLkxJH5Q0uNp3bJPRp5eNvR/QQpOEityoLPVOlnJvM/+8ZNi8AFzY0jEKKveCf0GoGHGBwNvJVWs63gqbruEJ9ZyZjjHaSdRW6Zo8jnt9gb34BJOwEruJIbJmLO/N/dwZs5AIZLHoD2HVK5Jq7vxPiNvbnWq0lI/CXcIoDHOUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091929; c=relaxed/simple;
	bh=a6uRukHynzRBxa6yVJFefPSq9LWwdrKrQRef3qI10Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+ivPM36I2+mJ3a7cwaOzTcFd3mREY0yuUR2aHNaNY2lnrK9jqysQVWw2CM2QabgAk9kRKzxLyCenH7A0vSiYeup0T/75cTjFCXIws/dYSX1vUzeZBTqSwNYIbZwJE+XUrDByo9tGUzvBO6aLVLBz8U74Etg2TjLPDsfqAyuThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=coYrjJI8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2wpiyrWc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=coYrjJI8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2wpiyrWc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="coYrjJI8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2wpiyrWc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="coYrjJI8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2wpiyrWc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E46E2760F1;
	Fri,  3 Jul 2026 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783091925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NQTM2oRzhIsKiFczNbL+VXTrzmZ/yKVuvhOrXGPR4MQ=;
	b=coYrjJI8Dj3I8R2cEPlGGNAklUvFv/7qNONXEss/YCyRLbfIeGafJDwwZT42O1xMoCEr5v
	GFOZUq/nqx3R3AQr9GloiaXVzXYEVaWqyG0vsWlumeOxYb1uwgRt7mDzG3jpfkdadsBHtg
	Ai0GdJhAoAXSAFP0HwdCZ8N07X6M5aI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783091925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NQTM2oRzhIsKiFczNbL+VXTrzmZ/yKVuvhOrXGPR4MQ=;
	b=2wpiyrWcxvw1xBfpCkk4+7/uqTiiRKT+Jfl3WybSccLcTlM7DRPaEJl9TCCYLGPbFgyqwn
	APZpW377FDt9eMDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783091925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NQTM2oRzhIsKiFczNbL+VXTrzmZ/yKVuvhOrXGPR4MQ=;
	b=coYrjJI8Dj3I8R2cEPlGGNAklUvFv/7qNONXEss/YCyRLbfIeGafJDwwZT42O1xMoCEr5v
	GFOZUq/nqx3R3AQr9GloiaXVzXYEVaWqyG0vsWlumeOxYb1uwgRt7mDzG3jpfkdadsBHtg
	Ai0GdJhAoAXSAFP0HwdCZ8N07X6M5aI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783091925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NQTM2oRzhIsKiFczNbL+VXTrzmZ/yKVuvhOrXGPR4MQ=;
	b=2wpiyrWcxvw1xBfpCkk4+7/uqTiiRKT+Jfl3WybSccLcTlM7DRPaEJl9TCCYLGPbFgyqwn
	APZpW377FDt9eMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7F6A779AA;
	Fri,  3 Jul 2026 15:18:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OXGlJ9XSR2r+SgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 03 Jul 2026 15:18:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hansg@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm/vboxvideo: Use damage iterator and plane damage clips
Date: Fri,  3 Jul 2026 17:18:30 +0200
Message-ID: <20260703151841.375364-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

Use damage iterator to handle updates without damage clips correctly.
If no damage clips have been given, drivers should update the entire
display area.

Also enable damage clips for the plane to minimize the area of each
display update.

v2:
- fix plane-state order when calling _damage_iter_init() (Sashiko)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 8e4e5fc9d3c5..cd78071b6cbb 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
@@ -282,9 +283,10 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
 									   plane);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct vbox_private *vbox = to_vbox_dev(fb->dev);
-	struct drm_mode_rect *clips;
-	uint32_t num_clips, i;
+	struct drm_rect damage;
+	struct drm_atomic_helper_damage_iter iter;
 
 	vbox_crtc_set_base_and_mode(crtc, fb,
 				    new_state->src_x >> 16,
@@ -292,22 +294,17 @@ static void vbox_primary_atomic_update(struct drm_plane *plane,
 
 	/* Send information about dirty rectangles to VBVA. */
 
-	clips = drm_plane_get_damage_clips(new_state);
-	num_clips = drm_plane_get_damage_clips_count(new_state);
-
-	if (!num_clips)
-		return;
-
 	mutex_lock(&vbox->hw_mutex);
 
-	for (i = 0; i < num_clips; ++i, ++clips) {
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, new_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		struct vbva_cmd_hdr cmd_hdr;
 		unsigned int crtc_id = to_vbox_crtc(crtc)->crtc_id;
 
-		cmd_hdr.x = (s16)clips->x1;
-		cmd_hdr.y = (s16)clips->y1;
-		cmd_hdr.w = (u16)clips->x2 - clips->x1;
-		cmd_hdr.h = (u16)clips->y2 - clips->y1;
+		cmd_hdr.x = (s16)damage.x1;
+		cmd_hdr.y = (s16)damage.y1;
+		cmd_hdr.w = (u16)drm_rect_width(&damage);
+		cmd_hdr.h = (u16)drm_rect_height(&damage);
 
 		if (!vbva_buffer_begin_update(&vbox->vbva_info[crtc_id],
 					      vbox->guest_pool))
@@ -539,6 +536,7 @@ static struct drm_plane *vbox_create_plane(struct vbox_private *vbox,
 		goto free_plane;
 
 	drm_plane_helper_add(plane, helper_funcs);
+	drm_plane_enable_fb_damage_clips(plane);
 
 	return plane;
 

base-commit: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
prerequisite-patch-id: b9adc9622920a3e70168e672c2c92795b3e3a106
prerequisite-patch-id: 5030de433a01c2e99056cadb676a8e2ba35f055a
-- 
2.54.0

