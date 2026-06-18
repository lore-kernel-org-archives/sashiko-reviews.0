Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7E3E7141
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791980; cv=none; b=tNeGT9u7m3Ho2ylAK3DXpC/V3ploKLnUb64QyZnFKLjukHzLdjCsHe9AjkXWkdvlJu149lVeJuC/hMcNl8o0y1ReDBqthM02Cg1b1yQYYaeOb184IO+n6yfIjpO2nu0mjWG72TRGfCwl/FI6EMje3vg3+lk50EAPYFOAMMhJ+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791980; c=relaxed/simple;
	bh=yfFd58+Iqkf8pTl2u9f/b9iA3W7asJBRrTXxed9on0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Swqwky8ERAUh+HKpATAjmIsmMYSesqQMfhReUKCOy1LydzcCGdIxARQD8AFY8w6cxHIIFxuExlg5P2zi2YK+fZDPfc5t8YZIkT9W7+4+gJwz86xrrqUvfNJ8GjNycyhZZFHUH2/WwKl1A6Dvnzu1MKDaUJ/h00xil4v3lYPh6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=El387rzx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=penUGzap; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=El387rzx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=penUGzap; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="El387rzx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="penUGzap";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="El387rzx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="penUGzap"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 207FC6D2A8;
	Thu, 18 Jun 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=El387rzxm0zrkISTvrzimIhHsV4+VPH5wRJzd4b3iOwxKEV//jAjz/8M0fuOxmH9OkYXjK
	R2HaNBHw/Y82q/qOGZAqpPCz6WNX6ilsDYka8BAw4f9VsVzFbLls+w5a4t4vCyDu9bJQQ+
	K2nWowfpVN1Be/J9boDwZmkgQxAEo5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=penUGzap8TW05NJWvxOR/JPKazdSDnDVdPy0CU84cGotxrzmrmW/Zz8xTWl6f2WO6l6muR
	/OAgdapc9uNa+VAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=El387rzxm0zrkISTvrzimIhHsV4+VPH5wRJzd4b3iOwxKEV//jAjz/8M0fuOxmH9OkYXjK
	R2HaNBHw/Y82q/qOGZAqpPCz6WNX6ilsDYka8BAw4f9VsVzFbLls+w5a4t4vCyDu9bJQQ+
	K2nWowfpVN1Be/J9boDwZmkgQxAEo5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZIfui3gGR3fHLdXAWNaVoCwDDDZ3yTFHyLYSq1yEXo=;
	b=penUGzap8TW05NJWvxOR/JPKazdSDnDVdPy0CU84cGotxrzmrmW/Zz8xTWl6f2WO6l6muR
	/OAgdapc9uNa+VAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDBD3779AB;
	Thu, 18 Jun 2026 14:12:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OKcbLej8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/6] drm/msm: Do not declare msm_framebuffer_init() as static
Date: Thu, 18 Jun 2026 16:11:32 +0200
Message-ID: <20260618141249.151338-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618141249.151338-1-tzimmermann@suse.de>
References: <20260618141249.151338-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,qualcomm.com:email,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

Declare msm_framebuffer_init() in msm_drv.h and remove the static
qualifier. The function will be required in msm_fbdev.c after inlining
msm_alloc_stolen_fb().

Also move msm_framebuffer_init() before msm_framebuffer_create(), so
that it can later be made static again. Prepares msm's fbdev emulation
for using client buffers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.h |  4 ++
 drivers/gpu/drm/msm/msm_fb.c  | 72 +++++++++++++++++------------------
 2 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 3787db8770ad..7dccf0713b02 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -258,6 +258,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
+struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
+					     const struct drm_format_info *info,
+					     const struct drm_mode_fb_cmd2 *mode_cmd,
+					     struct drm_gem_object **bos);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 9b681e144c07..d7523a0a866a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -29,10 +29,6 @@ struct msm_framebuffer {
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
-static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-		const struct drm_format_info *info,
-		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
-
 static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 				   struct drm_file *file_priv, unsigned int flags,
 				   unsigned int color, struct drm_clip_rect *clips,
@@ -139,39 +135,10 @@ const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb)
 	return msm_fb->format;
 }
 
-struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
-		struct drm_file *file, const struct drm_format_info *info,
-		const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	struct drm_gem_object *bos[4] = {0};
-	struct drm_framebuffer *fb;
-	int ret, i, n = info->num_planes;
-
-	for (i = 0; i < n; i++) {
-		bos[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
-		if (!bos[i]) {
-			ret = -ENXIO;
-			goto out_unref;
-		}
-	}
-
-	fb = msm_framebuffer_init(dev, info, mode_cmd, bos);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
-		goto out_unref;
-	}
-
-	return fb;
-
-out_unref:
-	for (i = 0; i < n; i++)
-		drm_gem_object_put(bos[i]);
-	return ERR_PTR(ret);
-}
-
-static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-		const struct drm_format_info *info,
-		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
+struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
+					     const struct drm_format_info *info,
+					     const struct drm_mode_fb_cmd2 *mode_cmd,
+					     struct drm_gem_object **bos)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
@@ -251,6 +218,37 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
+struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
+					       struct drm_file *file,
+					       const struct drm_format_info *info,
+					       const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_gem_object *bos[4] = {0};
+	struct drm_framebuffer *fb;
+	int ret, i, n = info->num_planes;
+
+	for (i = 0; i < n; i++) {
+		bos[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
+		if (!bos[i]) {
+			ret = -ENXIO;
+			goto out_unref;
+		}
+	}
+
+	fb = msm_framebuffer_init(dev, info, mode_cmd, bos);
+	if (IS_ERR(fb)) {
+		ret = PTR_ERR(fb);
+		goto out_unref;
+	}
+
+	return fb;
+
+out_unref:
+	for (i = 0; i < n; i++)
+		drm_gem_object_put(bos[i]);
+	return ERR_PTR(ret);
+}
+
 struct drm_framebuffer *
 msm_alloc_stolen_fb(struct drm_device *dev, int w, int h, int p, uint32_t format)
 {
-- 
2.54.0

