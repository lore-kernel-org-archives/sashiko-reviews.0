Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EF3E7141
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791992; cv=none; b=byOtMhNwaIsSNhlINdpTJYPGnUeZXdtRM7xRCELQlS5Mira08lyPwr7ybKAWhUWKKOJVXr/8kE7/tmwd2vu6kjC3z0mMHVK3zcllg0OQGFpcIu3LpDNvOMYI4/H0uApB4yXmd+E5mvTwYO5UphFGRtvnTa07E5KOo9iO/yirTTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791992; c=relaxed/simple;
	bh=hsnvPkWe/XUFehHDNecGLFJBWgwQ+VmpHnlubltg+5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaFOenrsY4ogeow3wpbJW/Mj6NmvsBeiXGxnNhFZRnMkosVzMEwiJjsKzygePfGcLGkDb6cJd9himqaJ+tFdP2YNHTjgLI6HbxWI3H9V+o+7aMYc6JJ5YEtveYm/9U7GjpBwFrWoFp4e9Dc2fszN0XE001/wHyx2WkSy8adtMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W4iDUSE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kMsHVRIy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W4iDUSE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kMsHVRIy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W4iDUSE+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kMsHVRIy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W4iDUSE+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kMsHVRIy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDB5D75F6E;
	Thu, 18 Jun 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=W4iDUSE+OwqlUo+cxFieIZCoCblJ7gYnxhjTlOho6ezacIb7Ax8RPRyp0Wj62+YwTIJnku
	DSacblxfuFMdwOQFfDcG5V1lFeirc3B67l/Vc3yKvLfGDELlcntpqVynKsyDlcSGJYyG+4
	JJ+Ga3zpx5tPD4Crgh399ARnXjcYXxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=kMsHVRIyqf4vHQ8X2euldXgIEaDSCOp6gCTtUpJa/iCAfbQEV1HzmVDbDf5dBTeVGB459c
	ZmQrmEbu2gcyHhDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=W4iDUSE+OwqlUo+cxFieIZCoCblJ7gYnxhjTlOho6ezacIb7Ax8RPRyp0Wj62+YwTIJnku
	DSacblxfuFMdwOQFfDcG5V1lFeirc3B67l/Vc3yKvLfGDELlcntpqVynKsyDlcSGJYyG+4
	JJ+Ga3zpx5tPD4Crgh399ARnXjcYXxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnUsmQJNzFL8yHqOFdp+UjS+G/WBEj/XVx2imYlhiEA=;
	b=kMsHVRIyqf4vHQ8X2euldXgIEaDSCOp6gCTtUpJa/iCAfbQEV1HzmVDbDf5dBTeVGB459c
	ZmQrmEbu2gcyHhDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8716C779AB;
	Thu, 18 Jun 2026 14:12:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YFXBH+n8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:57 +0000
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
Subject: [PATCH v2 3/6] drm/msm: fbdev: Fix error reporting
Date: Thu, 18 Jun 2026 16:11:34 +0200
Message-ID: <20260618141249.151338-4-tzimmermann@suse.de>
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
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

Replace deprecated error reporting in msm_fbdev_driver_fbdev_probe().
Use drm_warn() and drm_err() instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index a507f1de0c5d..1eb0368a6d07 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -114,11 +114,11 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	DBG("allocating %d bytes for fb %d", size, dev->primary->index);
 	bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC | MSM_BO_STOLEN);
 	if (IS_ERR(bo)) {
-		dev_warn(dev->dev, "could not allocate stolen bo\n");
+		drm_warn(dev, "could not allocate stolen bo\n");
 		/* try regular bo: */
 		bo = msm_gem_new(dev, size, MSM_BO_SCANOUT | MSM_BO_WC);
 		if (IS_ERR(bo)) {
-			DRM_DEV_ERROR(dev->dev, "failed to allocate buffer object\n");
+			drm_err(dev, "failed to allocate buffer object\n");
 			return PTR_ERR(bo);
 		}
 	}
@@ -136,7 +136,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 						      mode_cmd.modifier[0]),
 				  &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
-		DRM_DEV_ERROR(dev->dev, "failed to allocate fb\n");
+		drm_err(dev, "failed to allocate fb\n");
 		ret = PTR_ERR(fb);
 		goto err_drm_gem_object_put;
 	}
@@ -148,7 +148,7 @@ int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 	 */
 	ret = msm_gem_get_and_pin_iova(bo, priv->kms->vm, &paddr);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "failed to get buffer obj iova: %d\n", ret);
+		drm_err(dev, "failed to get buffer obj iova: %d\n", ret);
 		goto err_drm_framebuffer_remove;
 	}
 
-- 
2.54.0

