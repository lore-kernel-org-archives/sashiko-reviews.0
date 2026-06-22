Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A035028D
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134707; cv=none; b=sJ55gQ9as1+rXf2JGXK7R/AphWFhRA2LqPZe63ZSK/7nojZI/1B4SZEo/wavawihCdaayMYD0J98ripESok41A2JN1iDRcVAhRw99KyleYnzXmujS/ae5YivPsRLaab7dZRxacnSpHT6zJUlTueVpBbtzfrBoem2YjTMY0YETtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134707; c=relaxed/simple;
	bh=cCXEubPURO6JziBLjj726b6+5m8cAFJd2sNN8kWNRFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJencCd+RJUyfHbF35TSdDxkM+mA9l98IhyXYUlmdczwmaFdH4F58UE8EiO6sg5yG1h9GmVtPG4Hl2lYnM2KUgoBJbWeIdo+53kSsT4GMaim6xy6bdocfMsbkHklEc81lMXH0cHhr7Ofpvjm7upMA68BGS20tgXnHikW9UGkcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s9FJJ4sZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3qXbQIfC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s9FJJ4sZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3qXbQIfC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s9FJJ4sZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3qXbQIfC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s9FJJ4sZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3qXbQIfC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E715275D08;
	Mon, 22 Jun 2026 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782134681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeU+CBKNbf1ZaAxg2amODgN/OuUs3hH42Q/jjuvFT5w=;
	b=s9FJJ4sZ6nSJ1jnqWxHSMjxY/OMJ4O6ZL9K/MImfdB+lJJMajhhLR+Yn5VKOX6GJ4UL/5F
	gVEkCNPG2n35fVpdcov3iXyEjoinhn1vHMo0E8KBTYau48CEK5EsObJvIMe5gRmo5QNtoT
	9smDKlH3rn+/OUQ3fve5BE/mdBymp/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782134681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeU+CBKNbf1ZaAxg2amODgN/OuUs3hH42Q/jjuvFT5w=;
	b=3qXbQIfC1Afw49kHw2J4Jt+8rl5YnfYPylWV76WH+y7xhiLVMVV/f0JZ13j79JJhMP56S3
	vGNmJNNlkcsqdHDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782134681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeU+CBKNbf1ZaAxg2amODgN/OuUs3hH42Q/jjuvFT5w=;
	b=s9FJJ4sZ6nSJ1jnqWxHSMjxY/OMJ4O6ZL9K/MImfdB+lJJMajhhLR+Yn5VKOX6GJ4UL/5F
	gVEkCNPG2n35fVpdcov3iXyEjoinhn1vHMo0E8KBTYau48CEK5EsObJvIMe5gRmo5QNtoT
	9smDKlH3rn+/OUQ3fve5BE/mdBymp/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782134681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeU+CBKNbf1ZaAxg2amODgN/OuUs3hH42Q/jjuvFT5w=;
	b=3qXbQIfC1Afw49kHw2J4Jt+8rl5YnfYPylWV76WH+y7xhiLVMVV/f0JZ13j79JJhMP56S3
	vGNmJNNlkcsqdHDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A82BE779A8;
	Mon, 22 Jun 2026 13:24:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPcAKJk3OWpYIQAAD6G6ig
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/6] drm/sysfb: simpledrm: Read panel orientation from DT node
Date: Mon, 22 Jun 2026 15:19:40 +0200
Message-ID: <20260622132433.722823-7-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,ansari.sh];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLof9hwn8p5zsfkob18n85cjgs)];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

A DeviceTree panel node can specify the panel's rotation in steps
of 90 degrees. Set the DRM connector orientation from the field.
Do nothing if the field is missing or invalid.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 32 +++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a04f0c852ea4..b585d17ca817 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -221,6 +221,33 @@ simplefb_get_panel_height_mm_of(struct drm_device *dev, struct device_node *of_p
 	return __simplefb_get_panel_size_mm_of(dev, of_panel_node, "height-mm");
 }
 
+static enum drm_panel_orientation
+simplefb_get_panel_orientation_of(struct drm_device *dev, struct device_node *of_panel_node)
+{
+	int ret;
+	u32 rotation;
+
+	ret = of_property_read_u32(of_panel_node, "rotation", &rotation);
+	if (ret) {
+		drm_dbg(dev, "simplefb: cannot parse panel rotation: error %d\n", ret);
+		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	}
+
+	switch (rotation) {
+	case 0:
+		return DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	case 90:
+		return DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	case 180:
+		return DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	case 270:
+		return DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	default:
+		drm_dbg(dev, "simplefb: cannot parse panel rotation: value %u\n", rotation);
+		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	}
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -624,6 +651,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	int width, height, stride;
 	u16 width_mm = 0, height_mm = 0;
 	struct device_node *panel_node;
+	enum drm_panel_orientation orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 	const struct drm_format_info *format;
 	u64 size;
 	struct resource *res, *mem = NULL;
@@ -689,6 +717,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		if (panel_node) {
 			width_mm = simplefb_get_panel_width_mm_of(dev, panel_node);
 			height_mm = simplefb_get_panel_height_mm_of(dev, panel_node);
+			orientation = simplefb_get_panel_orientation_of(dev, panel_node);
 			of_node_put(panel_node);
 		}
 	} else {
@@ -853,8 +882,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
-	drm_connector_set_panel_orientation_with_quirk(connector,
-						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+	drm_connector_set_panel_orientation_with_quirk(connector, orientation,
 						       width, height);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
-- 
2.54.0

