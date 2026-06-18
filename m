Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBFC3B4EAD
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791993; cv=none; b=SRCIVwF84MTref/x17afmyRXDs6IQp/OHSFMeAP9MxphNqT6YQBtL/82EfRMXyBKjeeoa4MSWRbS/qAGkr9Dr1R5Ha+Mw6ey5MBwdh+skedNosx51DaQpzSJJgk8VhJa7ztD2U+3iSW9ZZf3DEegOXjn+As5aCuRvuc8fG9AUeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791993; c=relaxed/simple;
	bh=ugH9Cadz1XerC8KEL12mcLYGm7GlGQivUvF7/SR0gbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eM/TrH0uwwqwhRUVwxOKG2DRDidCm0VH3F0nmpUtVf3NAP/5jF3YDDjb9A8DB6TRj/0GdY5pZJM2OKi+VkjBmELmWKq+c7ur2hspLbM5pVfKDz1ASwRNxyTR9HdDkikoS/HOr6CQV7mzAT/8i45mRAuUNOnPYwg5YDBHC7ebJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GNK6Pa4V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2hc563vt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GNK6Pa4V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2hc563vt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GNK6Pa4V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2hc563vt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GNK6Pa4V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2hc563vt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0E5A66D2AC;
	Thu, 18 Jun 2026 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXuPfYwladA576QKoL9/bwiGLh3LuoPF1a/UCcIeEW4=;
	b=GNK6Pa4Vmsmn7SN9/ToVXi952c+NvV6fmjYG0Inks2R88IS0wZTxT+gRFBJzDwWzydqWFx
	4TtDoNcim1sts5Wln/z+RN4zK106205ZNvITPdYL1Iuwnbm2DzXfNaZq1jPDkYMFFcS2CL
	N1lXKP9G9YlAqVNqr1kS+UtVjWo9cJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXuPfYwladA576QKoL9/bwiGLh3LuoPF1a/UCcIeEW4=;
	b=2hc563vt7yecGoXEK1Bl9W2bP7xTSyfY/2ZgUDp6ug23+uzrYviJIuX5WQfGdmMKEqrw/w
	6BtrhHOcdDQc8QBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXuPfYwladA576QKoL9/bwiGLh3LuoPF1a/UCcIeEW4=;
	b=GNK6Pa4Vmsmn7SN9/ToVXi952c+NvV6fmjYG0Inks2R88IS0wZTxT+gRFBJzDwWzydqWFx
	4TtDoNcim1sts5Wln/z+RN4zK106205ZNvITPdYL1Iuwnbm2DzXfNaZq1jPDkYMFFcS2CL
	N1lXKP9G9YlAqVNqr1kS+UtVjWo9cJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXuPfYwladA576QKoL9/bwiGLh3LuoPF1a/UCcIeEW4=;
	b=2hc563vt7yecGoXEK1Bl9W2bP7xTSyfY/2ZgUDp6ug23+uzrYviJIuX5WQfGdmMKEqrw/w
	6BtrhHOcdDQc8QBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB5EF779A8;
	Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8CqjKOr8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:58 +0000
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
Subject: [PATCH v2 6/6] drm/msm: Make msm_framebuffer_init() an internal interface again
Date: Thu, 18 Jun 2026 16:11:37 +0200
Message-ID: <20260618141249.151338-7-tzimmermann@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

The only caller of msm_framebuffer_init() is msm_framebuffer_create()
from the same source file. Declare the former as static.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.h | 4 ----
 drivers/gpu/drm/msm/msm_fb.c  | 8 ++++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b21f8971dfa1..2a3ce6afca1c 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -258,10 +258,6 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
-struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-					     const struct drm_format_info *info,
-					     const struct drm_mode_fb_cmd2 *mode_cmd,
-					     struct drm_gem_object **bos);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		struct drm_file *file, const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index dec550e6cf75..60c108d35d2a 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -134,10 +134,10 @@ const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb)
 	return msm_fb->format;
 }
 
-struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
-					     const struct drm_format_info *info,
-					     const struct drm_mode_fb_cmd2 *mode_cmd,
-					     struct drm_gem_object **bos)
+static struct drm_framebuffer *
+msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
+		     const struct drm_mode_fb_cmd2 *mode_cmd,
+		     struct drm_gem_object **bos)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-- 
2.54.0

