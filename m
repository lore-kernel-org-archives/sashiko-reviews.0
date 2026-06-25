Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C748388E55
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380738; cv=none; b=rwbmlstXvHpuOnfH5hjRoFHOo+WHjGh/C6Uf8ddIXRaKOsQczQsT3IjbzJ8Mf+vzwEzOCLIe19w2qYQr8zH0nU79kN8/8UhhAE/mj5inoE1b8bdNGWPfzPlI5M1QRmvb0RZII+WGS4VA1/UhrNBSdKvurc/OeJ/l6SKjC3pRlxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380738; c=relaxed/simple;
	bh=IQ7hXB3/ZH3rAHg+XYg0HjC47gAlp18vvoGV4CK8pjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6KvZp+Ya8u1tNwRhsfdIlqi+NPJtQ33QWCa7hFRZFTgydxvdhMXDkeaD/ba0cc41ER0bUkvHoYamVaniJoLq6SZfTNgDRC9HuVZEx2jp67gNRML38lvJqE9YH/BLOGciksyaAvl51S7lGpDqmqEAdfyRSZFSc0ZTY5cUanq2Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1AAD575E24;
	Thu, 25 Jun 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4B47779AB;
	Thu, 25 Jun 2026 09:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QGfULq74PGqaBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 25 Jun 2026 09:45:18 +0000
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
Subject: [PATCH v3 3/7] drm/sysfb: simpledrm: Inline simplefb_get_validated_int()
Date: Thu, 25 Jun 2026 11:39:35 +0200
Message-ID: <20260625094509.157581-4-tzimmermann@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 1AAD575E24
X-Rspamd-Action: no action

The helper simplefb_get_validated_int() is only a wrapper around
drm_sysfb_get_validated_int(). Inline the function into its callers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 6bbe779ec870..b4e91191a0ba 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -41,13 +41,6 @@
  * Helpers for simplefb
  */
 
-static int
-simplefb_get_validated_int(struct drm_device *dev, const char *name,
-			   uint32_t value)
-{
-	return drm_sysfb_get_validated_int(dev, name, value, INT_MAX);
-}
-
 static const struct drm_format_info *
 simplefb_get_validated_format(struct drm_device *dev, const char *format_name)
 {
@@ -95,7 +88,7 @@ static int
 simplefb_get_stride_pd(struct drm_device *dev,
 		       const struct simplefb_platform_data *pd)
 {
-	return simplefb_get_validated_int(dev, "stride", pd->stride);
+	return drm_sysfb_get_validated_int(dev, "stride", pd->stride, INT_MAX);
 }
 
 static const struct drm_format_info *
@@ -159,7 +152,7 @@ simplefb_get_stride_of(struct drm_device *dev, struct device_node *of_node)
 
 	if (ret)
 		return ret;
-	return simplefb_get_validated_int(dev, "stride", stride);
+	return drm_sysfb_get_validated_int(dev, "stride", stride, INT_MAX);
 }
 
 static const struct drm_format_info *
-- 
2.54.0

