Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13A3A380C
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134689; cv=none; b=niB2SsFm9O3sJPUr3NPE4jOPo7XccHweGFq41JFQD8pgIylDo0ptBiEsDpsKrgm1wDs5MhpkQgtHMfou+xTP/OadmT58hSje3DQkknGZjH9xDUK+7ykNBi3wa2K2DZnyWRXh6X+nn4YbPkZTtKGZWnESooJ+M+m77BpfOWLO4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134689; c=relaxed/simple;
	bh=fDx/D/PITbX/XDZfIe4MNo+lGuWYRCOYZeyVPOCmtm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkizNnZYTpJl4xUmhnDNYJI2W6ZQCqqJMcChMrw/GKADJqJeCla7BeFtVqSkthT1SWpjlcEHeEmz/lBpIH7M6EFKoxIMpiur6GLvnQ3mBtbwV6PhAuatD3YwRJ6kwksm5wRwZiSrmo0RIhJyJCitUpvMgo79eTkDgx2GBhRdRgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vfo2r4sb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AJENDhSW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vfo2r4sb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AJENDhSW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vfo2r4sb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJENDhSW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vfo2r4sb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJENDhSW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0DF4F75C8F;
	Mon, 22 Jun 2026 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782134681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QtoRJd+i0YPGFI04NXoXJWiaT5gZhXARTFcTMpCHcg=;
	b=Vfo2r4sbtRAu4QoBp70bbZFtk3Fd6H+rDSg78nKpRbGdOnWv8xfaSjM3pspE+uW0qkyGxM
	RJG+FM3AKCRLfF9RpHH7V80bqFopHDnbgDU+6Wb8bsL523qzh87/zqWZ2m5VehNvB90Mue
	zZXycnXiV+FrWCUTTl2WzcKz36Ehc9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782134681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QtoRJd+i0YPGFI04NXoXJWiaT5gZhXARTFcTMpCHcg=;
	b=AJENDhSW/IVIzGKZj8WiQLZ7OhBHUQiJvVV4xD07QLSDVXsJwUpea4yPAM6VrjCzWqH3E/
	xBQT3d/LGd8ZdlCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782134681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QtoRJd+i0YPGFI04NXoXJWiaT5gZhXARTFcTMpCHcg=;
	b=Vfo2r4sbtRAu4QoBp70bbZFtk3Fd6H+rDSg78nKpRbGdOnWv8xfaSjM3pspE+uW0qkyGxM
	RJG+FM3AKCRLfF9RpHH7V80bqFopHDnbgDU+6Wb8bsL523qzh87/zqWZ2m5VehNvB90Mue
	zZXycnXiV+FrWCUTTl2WzcKz36Ehc9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782134681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QtoRJd+i0YPGFI04NXoXJWiaT5gZhXARTFcTMpCHcg=;
	b=AJENDhSW/IVIzGKZj8WiQLZ7OhBHUQiJvVV4xD07QLSDVXsJwUpea4yPAM6VrjCzWqH3E/
	xBQT3d/LGd8ZdlCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4008779AB;
	Mon, 22 Jun 2026 13:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SFamLpg3OWpYIQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 22 Jun 2026 13:24:40 +0000
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
Subject: [PATCH v2 3/6] drm/sysfb: simpledrm: Inline simplefb_get_validated_int()
Date: Mon, 22 Jun 2026 15:19:37 +0200
Message-ID: <20260622132433.722823-4-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,ansari.sh];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -6.80

The helper simplefb_get_validated_int() is only a wrapper around
drm_sysfb_get_validated_int(). Inline the function into its callers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index fa2121f81def..709922ea656c 100644
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

