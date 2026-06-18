Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99B3563E1
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785916; cv=none; b=LFy1zrYLmgQ7B0+fvkpys+BV2X8QdE3iUqNRrg0xjDSIID1U++kl3y/vafoX0KHggy/RyfEQrVpi5dpcZTJPNwKMzO2aStZC+MGUR3tm109IfkbMP/bChcZqP6bL7tsmKD8LCer/q9yHe9WMD6o0sVEkKA5pTM1iW7u3LL0kPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785916; c=relaxed/simple;
	bh=mDZcyD6Qym7NLV78zpK4l6Yxyrba1PoSuj/nb7H/FI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbcrabzz1CPvT2tvzzwsY9/LssnwhirriXTaXxLIaL3BMhtN3yC2UlEg5cdUg0kvLNCoBm9CeWMxhn5Xv47zP5kfamGeOhLTR9UCTAKdWNFvWKLa3VI1zAHqdkVtT2EfyJmvQzPCzQcd9yXhHalc/jlbARn7d71DzeaEiLwHAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 566626D354;
	Thu, 18 Jun 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2822779AB;
	Thu, 18 Jun 2026 12:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cLQENjPlM2rTJQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 12:31:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: shiyongbang@huawei.com,
	tiantao6@hisilicon.com,
	kong.kongxinwei@hisilicon.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rongrong Zou <zourongrong@gmail.com>,
	Sean Paul <seanpaul@chromium.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Baihan Li <libaihan@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/6] drm/hibmc: Use drm_atomic_helper_check_plane_state()
Date: Thu, 18 Jun 2026 14:28:39 +0200
Message-ID: <20260618123142.92298-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618123142.92298-1-tzimmermann@suse.de>
References: <20260618123142.92298-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 566626D354
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]

Call drm_atomic_helper_check_plane_state() from the primary plane's
atomic-check helper and replace the custom implementation.

All plane's implementations of atomic_check should call the shared
_check_plane_state() helper first. It adjusts the plane state for
correct positioning, rotation and scaling of the plane. Do this
even if the plane's CRTC has been disabled by setting the parameter
can_update_disabled. The original code returned early in this case,
but it's safe to so and cleaner to have all plane state initialized.

As we don't set can_position, drm_atomic_helper_check_plane_state()'s
visibility check tests if the plane covers all of the CRTC. This is
a small change from the original code, which tested if the plane is
exactly the size of the CRTC. With the new test, the plane still has
to cover all of the CRTC, but can be larger than the CRTC's size. A
later patch can fully implement this feature in hibmc.

If the plane is disabled, the helper clears the visibility flag in the
plane state. On errors or if the plane is not visible, the atomic-check
helper can return early. Implement all this in hibmc and drop the custom
code that does some of it.

v2:
- extend the commit description (Yongbang)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: da52605eea8f ("drm/hisilicon/hibmc: Add support for display engine")
Reviewed-by: Yongbang Shi <shiyongbang@huawei.com>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Baihan Li <libaihan@huawei.com>
Cc: Yongbang Shi <shiyongbang@huawei.com>
Cc: <stable@vger.kernel.org> # v4.10+
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 46 ++++++-------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 3066dc9ebc64..7c0b88c774b5 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -72,46 +72,28 @@ static int hibmc_get_best_clock_idx(const struct drm_display_mode *mode)
 static int hibmc_plane_atomic_check(struct drm_plane *plane,
 				    struct drm_atomic_commit *state)
 {
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	struct drm_framebuffer *fb = new_plane_state->fb;
-	struct drm_crtc *crtc = new_plane_state->crtc;
-	struct drm_crtc_state *crtc_state;
-	u32 src_w = new_plane_state->src_w >> 16;
-	u32 src_h = new_plane_state->src_h >> 16;
-
-	if (!crtc || !fb)
-		return 0;
+	struct drm_plane_state *new_plane_state =
+		drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state = NULL;
+	int ret;
 
-	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	if (IS_ERR(crtc_state))
-		return PTR_ERR(crtc_state);
+	if (new_plane_state->crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 
-	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
-		drm_dbg_atomic(plane->dev, "scale not support\n");
-		return -EINVAL;
-	}
-
-	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0) {
-		drm_dbg_atomic(plane->dev, "crtc_x/y of drm_plane state is invalid\n");
-		return -EINVAL;
-	}
-
-	if (!crtc_state->enable)
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, true);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
 		return 0;
 
-	if (new_plane_state->crtc_x + new_plane_state->crtc_w >
-	    crtc_state->adjusted_mode.hdisplay ||
-	    new_plane_state->crtc_y + new_plane_state->crtc_h >
-	    crtc_state->adjusted_mode.vdisplay) {
-		drm_dbg_atomic(plane->dev, "visible portion of plane is invalid\n");
-		return -EINVAL;
-	}
-
 	if (new_plane_state->fb->pitches[0] % 128 != 0) {
 		drm_dbg_atomic(plane->dev, "wrong stride with 128-byte aligned\n");
 		return -EINVAL;
 	}
+
 	return 0;
 }
 
-- 
2.54.0

