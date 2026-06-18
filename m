Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259F37AA65
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785935; cv=none; b=hI5b8bs/1zivxHL12PIbLouSWdU4m/DPxlOjQjqJRkbZdP0cB93pOLC7/DcQN36F1FETqdAiGIQK0xlx95s6uifQ2eLTplS7ktxiYk4hpXNFSw40z8P4MFaQ+STcEGLtJa56QCYpb6R/rKl48I6Wt0oXxSpjaON2W7rnjnnLKiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785935; c=relaxed/simple;
	bh=Tw/8+P+qJ8R5lJcYiX2fL8WRgnXwYxJ5FB0RAHCYNCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wee5pAdPja+N+RDLwTOoZ9wHVRkpZ8WXOkhlxDpK/xS2fCcWyLB+PNSi68fN4yA7wrspryo4JiSApRvCENymVU3hgT4ZN7Jh+/bbY7qAHwL9fvp4llp4lYfOF057ezdToIgXM5c13zo5uuc8roC9IBy0WbVyTEVX8upMDXPfFhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WlurGGSL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7gl4UjCJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WlurGGSL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7gl4UjCJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WlurGGSL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7gl4UjCJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WlurGGSL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7gl4UjCJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F4786D35E;
	Thu, 18 Jun 2026 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781785909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5cadGKUCeSn5wajPXSM0kaCV84SkwuQRFtYL0uKARU=;
	b=WlurGGSL1p72GcaMHqhlpIqzx38UYchtsYiEftfyfLQ5Ag7zMIkfwZkPGgAv1/qWO9k65G
	p9LI68ruUjL4GICDgci1KfqcdxaxOyCbMkWfnSiT9JXrUliIrmxooynRa/tGXL/n+cGcl+
	gyc7+uCq6Rt+Bpuv/OiPflRjC6cgRPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781785909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5cadGKUCeSn5wajPXSM0kaCV84SkwuQRFtYL0uKARU=;
	b=7gl4UjCJ5RAAM3ch3ZVzhKIfUP4lOOTetc1Ew1Cg3SHsMaqYb0s8YUPjSRuNqHdAT0H33J
	Ktisw+C+Z4WDBMAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781785909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5cadGKUCeSn5wajPXSM0kaCV84SkwuQRFtYL0uKARU=;
	b=WlurGGSL1p72GcaMHqhlpIqzx38UYchtsYiEftfyfLQ5Ag7zMIkfwZkPGgAv1/qWO9k65G
	p9LI68ruUjL4GICDgci1KfqcdxaxOyCbMkWfnSiT9JXrUliIrmxooynRa/tGXL/n+cGcl+
	gyc7+uCq6Rt+Bpuv/OiPflRjC6cgRPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781785909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5cadGKUCeSn5wajPXSM0kaCV84SkwuQRFtYL0uKARU=;
	b=7gl4UjCJ5RAAM3ch3ZVzhKIfUP4lOOTetc1Ew1Cg3SHsMaqYb0s8YUPjSRuNqHdAT0H33J
	Ktisw+C+Z4WDBMAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D8ED779AB;
	Thu, 18 Jun 2026 12:31:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CJKbFTXlM2rTJQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 12:31:49 +0000
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
Subject: [PATCH v4 5/6] drm/hibmc: Verify the framebuffer pitch to be a multiple of 128
Date: Thu, 18 Jun 2026 14:28:43 +0200
Message-ID: <20260618123142.92298-6-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,hisilicon.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

The hibmc hardware requires the framebuffer pitch to be aligned to
a multiple of 128. Dumb-buffer creation already guarantees this for
the created GEM buffer object. Also verify this contraint during
framebuffer creation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 99b36de1fe13..55d175028c46 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -14,6 +14,7 @@
 #include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
@@ -106,11 +107,26 @@ static const struct dev_pm_ops hibmc_pm_ops = {
 				hibmc_pm_resume)
 };
 
+static struct drm_framebuffer *hibmc_mode_config_fb_create(struct drm_device *dev,
+							   struct drm_file *file_priv,
+							   const struct drm_format_info *info,
+							   const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	int i;
+
+	for (i = 0; i < info->num_planes; ++i) {
+		if (mode_cmd->pitches[i] % SZ_128)
+			return ERR_PTR(-EINVAL);
+	}
+
+	return drm_gem_fb_create(dev, file_priv, info, mode_cmd);
+}
+
 static const struct drm_mode_config_funcs hibmc_mode_funcs = {
 	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
-	.fb_create = drm_gem_fb_create,
+	.fb_create = hibmc_mode_config_fb_create,
 };
 
 static int hibmc_kms_init(struct hibmc_drm_private *priv)
-- 
2.54.0

