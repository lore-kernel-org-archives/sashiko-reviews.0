Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41583B3BE1
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134701; cv=none; b=ZBJYnrsUisT5t+4Waf/iuHWrkeUaAgbPd1K/YWOKwKP7Yxkd8opqR0WbYhcbRklmKCeXqubioGsIcVRgOobZJfEWwvjrpuVTsG6w5xUAM7qb+wNmFL6+4s/NCR1/34osnQdnt0wQUzgXVqcLBKP4NHRJAJKWcUmWO53j2gh/fik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134701; c=relaxed/simple;
	bh=1qc01l7ziWB2fgfSYfqKv6nUneA3Fpol9wjhft20ofo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdtpEvRlbVb1p8h186dkWP3pmZqsG7V9Q6uhNuVxhJbFkzVhvalQyR28AG02qT8NGrvdpP0GW4ZwVlgj1hlol3+itEAlPPWKmYr7M2Jm9PTJtkEX3g6M+dXReEq7zve381tZ/YP0tM6OrptpvLqb/XSHMjgbc4ZSp27WcuYVHpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A497175D04;
	Mon, 22 Jun 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D924779AB;
	Mon, 22 Jun 2026 13:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CHO1FZk3OWpYIQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 22 Jun 2026 13:24:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	treding@nvidia.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rayyan@ansari.sh
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 5/6] drm/sysfb: simpledrm: Validate mmap size against framebuffer size
Date: Mon, 22 Jun 2026 15:19:39 +0200
Message-ID: <20260622132433.722823-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622132433.722823-1-tzimmermann@suse.de>
References: <20260622132433.722823-1-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: A497175D04
X-Rspamd-Action: no action

The size of the mmap'ed framebuffer could be smaller than the minimum
required framebuffer size. Validate the resource size against the
framebuffer size.

Buggy firmware that triggers this check should be fixed up with a quirk
on a case-by-case base.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Sashiko <sashiko-bot@kernel.org>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 76b9a3f5c4ef..a04f0c852ea4 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -6,6 +6,7 @@
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/overflow.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -624,6 +625,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	u16 width_mm = 0, height_mm = 0;
 	struct device_node *panel_node;
 	const struct drm_format_info *format;
+	u64 size;
 	struct resource *res, *mem = NULL;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
@@ -704,6 +706,15 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		}
 		stride = pitch;
 	}
+	if (check_mul_overflow(height, stride, &size)) {
+		drm_err(dev, "framebuffer size exceeds maximum\n");
+		return ERR_PTR(-EINVAL);
+	}
+	size = ALIGN(size, PAGE_SIZE);
+	if (size < PAGE_SIZE) {
+		drm_err(dev, "framebuffer alignment exceeds maximum\n");
+		return ERR_PTR(-EINVAL);
+	}
 
 	sysfb->fb_mode = drm_sysfb_mode(width, height, width_mm, height_mm);
 	sysfb->fb_format = format;
@@ -729,6 +740,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 		drm_dbg(dev, "using system memory framebuffer at %pr\n", mem);
 
+		if (resource_size(mem) > size) {
+			drm_err(dev,
+				"framebuffer size of %llu exceeds memory range %pr\n",
+				size, mem);
+			return ERR_PTR(-EINVAL);
+		}
+
 		screen_base = devm_memremap(dev->dev, mem->start, resource_size(mem), MEMREMAP_WC);
 		if (IS_ERR(screen_base))
 			return screen_base;
@@ -762,6 +780,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 			mem = res;
 		}
 
+		if (resource_size(mem) > size) {
+			drm_err(dev,
+				"framebuffer size of %llu exceeds memory range %pr\n",
+				size, mem);
+			return ERR_PTR(-EINVAL);
+		}
+
 		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
 		if (!screen_base)
 			return ERR_PTR(-ENOMEM);
-- 
2.54.0

