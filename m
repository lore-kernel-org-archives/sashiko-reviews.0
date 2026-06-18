Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FB837AA65
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785923; cv=none; b=Ro3KrwaIZ4nuUEzZ1RX+J6LxMGTJHXgoEG8oED8evX+9E35Vg0HDJAnEDUsJ/tCefDkFrNyF9Yk0PbHghYAs+SSl2okPYzdcHW/z/XaF6IZg96figBU/+GIYL4Z+mvx0nKhen+EoyIv0hEIDtJ2NbbD8MRf5vKXWXNyYy6NuMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785923; c=relaxed/simple;
	bh=huIetHkQR2jTTwx/X+PQ/Oui54MfRWvS55LzaeTDQX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha+YJEpJY3jQvh+n7r7+8qO0PJ9oj6gpmPUVT3YLYJhbUywE4XZ4SCOG0rV8pGxeHtM4i2150GHe2x/mo2GuGicVAtpHZUXxeet0Y9mK8FXKoyQN/CapsRBaRIWLbMkF7WjbTfjmkIurfCy2vOb+Hnx2r48e4eadBdGaMDxTB7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F5826D2F7;
	Thu, 18 Jun 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0137779AB;
	Thu, 18 Jun 2026 12:31:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4GyyLTTlM2rTJQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 12:31:48 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 3/6] drm/hibmc: Store fb in variable in atomic_update
Date: Thu, 18 Jun 2026 14:28:41 +0200
Message-ID: <20260618123142.92298-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 0F5826D2F7
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

The atomic-update helper frequently refers to the framebuffer in
new_state->fb. Store it in a local variable to make the code more
readable. No functional changes.

Suggested-by: Yongbang Shi <shiyongbang@huawei.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 2e6e189bec1a..19cb16a7daf9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -100,18 +100,18 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 static void hibmc_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_atomic_commit *state)
 {
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *fb = new_state->fb;
 	u32 reg;
 	s64 gpu_addr = 0;
 	u32 line_l;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(plane->dev);
 	struct drm_gem_vram_object *gbo;
 
-	if (!new_state->fb)
+	if (!fb)
 		return;
 
-	gbo = drm_gem_vram_of_gem(new_state->fb->obj[0]);
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (WARN_ON_ONCE(gpu_addr < 0))
@@ -119,9 +119,9 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 
 	writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
 
-	reg = new_state->fb->width * (new_state->fb->format->cpp[0]);
+	reg = fb->width * fb->format->cpp[0];
 
-	line_l = new_state->fb->pitches[0];
+	line_l = fb->pitches[0];
 	writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
 	       HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_OFFS, line_l),
 	       priv->mmio + HIBMC_CRT_FB_WIDTH);
@@ -129,8 +129,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	/* SET PIXEL FORMAT */
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
 	reg &= ~HIBMC_CRT_DISP_CTL_FORMAT_MASK;
-	reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT,
-			   new_state->fb->format->cpp[0] * 8 / 16);
+	reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, fb->format->cpp[0] * 8 / 16);
 	writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
 }
 
-- 
2.54.0

