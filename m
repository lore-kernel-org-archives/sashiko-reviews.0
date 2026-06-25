Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBA93A9014
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380740; cv=none; b=KfPhosGMiTJNcKDznbONwkAUPBaMXyRWF3E3o0j0LosE+UtbPqVCqEWc/ptGHtoUP/f54Vq087I+pGEqfunnzyAA/cNWk3m1l6NHU4TEgHkwKGSLgd+8HhBQnqV3eChEhw+PmiBHN0cE0DmDACYht5KKKBXT5e7i0pe77Rs/R+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380740; c=relaxed/simple;
	bh=jDZiyesaHmnftZLKTSAPZxBuve7guSL76Z5DOA/F8Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhJDxrMIX7cNWbjUlG79gPftE4OYFqScnm1WVGrRURNyHI5MXj/bhm0/HZc9tQGX+6UQtvEoGnk04ikXY1LbR9dlcQ9z3L+UuZpn+lCJT00sCfv9hVTq1XEZhTXotguTH1JCc6J4RdwlPBVcIMQwWau35pPVDIA0VxZzl5lhYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E10771A05;
	Thu, 25 Jun 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4625779AB;
	Thu, 25 Jun 2026 09:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qLalMq/4PGqaBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 25 Jun 2026 09:45:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	treding@nvidia.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	rayyan@ansari.sh
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 6/7] drm/of: Implement drm_of_get_panel_orientation()
Date: Thu, 25 Jun 2026 11:39:38 +0200
Message-ID: <20260625094509.157581-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625094509.157581-1-tzimmermann@suse.de>
References: <20260625094509.157581-1-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 2E10771A05
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

Implement drm_of_get_panel_orientation() to retrieve a panel's
rotation property as enum drm_panel_orientation. The code has
been taken from of_drm_get_panel_orientation(), so convert that
helper over. Callers of the old helper can be converted as well.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_of.c    | 44 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_panel.c | 26 ++--------------------
 include/drm/drm_of.h        | 11 ++++++++++
 3 files changed, 57 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d03ada82eac9..96eef327bf7e 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -7,6 +7,7 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
@@ -220,6 +221,49 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
+/**
+ * drm_of_get_panel_orientation - look up the orientation of the panel through
+ * the "rotation" binding from a device tree node
+ * @np: device tree node of the panel
+ * @orientation: orientation enum to be filled in
+ *
+ * Looks up the rotation of a panel in the device tree. The orientation of the
+ * panel is expressed as a property name "rotation" in the device tree. The
+ * rotation in the device tree is counter clockwise.
+ *
+ * Return: 0 when a valid rotation value (0, 90, 180, or 270) is read or the
+ * rotation property doesn't exist. Return a negative error code on failure.
+ */
+int drm_of_get_panel_orientation(const struct device_node *np,
+				 enum drm_panel_orientation *orientation)
+{
+	int rotation, ret;
+
+	ret = of_property_read_u32(np, "rotation", &rotation);
+	if (ret == -EINVAL) {
+		/* Don't return an error if there's no rotation property. */
+		*orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+		return 0;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (rotation == 0)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	else if (rotation == 90)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	else if (rotation == 180)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	else if (rotation == 270)
+		*orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_panel_orientation);
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 2c5649e433df..eddd13a34c03 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -28,6 +28,7 @@
 #include <linux/of.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
@@ -508,30 +509,7 @@ EXPORT_SYMBOL(of_drm_find_panel);
 int of_drm_get_panel_orientation(const struct device_node *np,
 				 enum drm_panel_orientation *orientation)
 {
-	int rotation, ret;
-
-	ret = of_property_read_u32(np, "rotation", &rotation);
-	if (ret == -EINVAL) {
-		/* Don't return an error if there's no rotation property. */
-		*orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
-		return 0;
-	}
-
-	if (ret < 0)
-		return ret;
-
-	if (rotation == 0)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
-	else if (rotation == 90)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
-	else if (rotation == 180)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
-	else if (rotation == 270)
-		*orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
-	else
-		return -EINVAL;
-
-	return 0;
+	return drm_of_get_panel_orientation(np, orientation);
 }
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 7bcc0ccfe0f4..ebebed14c611 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -20,6 +20,8 @@ struct device_node;
 struct mipi_dsi_device_info;
 struct mipi_dsi_host;
 
+enum drm_panel_orientation;
+
 /**
  * enum drm_lvds_dual_link_pixels - Pixel order of an LVDS dual-link connection
  * @DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS: Even pixels are expected to be generated
@@ -47,6 +49,8 @@ int drm_of_component_probe(struct device *dev,
 int drm_of_encoder_active_endpoint(struct device_node *node,
 				   struct drm_encoder *encoder,
 				   struct of_endpoint *endpoint);
+int drm_of_get_panel_orientation(const struct device_node *np,
+				 enum drm_panel_orientation *orientation);
 int drm_of_find_panel_or_bridge(const struct device_node *np,
 				int port, int endpoint,
 				struct drm_panel **panel,
@@ -101,6 +105,13 @@ static inline int drm_of_encoder_active_endpoint(struct device_node *node,
 {
 	return -EINVAL;
 }
+
+static inline int drm_of_get_panel_orientation(const struct device_node *np,
+					       enum drm_panel_orientation *orientation)
+{
+	return -EINVAL;
+}
+
 static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 					      int port, int endpoint,
 					      struct drm_panel **panel,
-- 
2.54.0

