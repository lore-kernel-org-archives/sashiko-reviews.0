Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37173563E1
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785928; cv=none; b=tvEIQ8Whzjo2IX1hQiJV1gNZjAYKvn69+IBgJjDaUoLrB6TMTx9ThRSzrbfHqiHCE2P2BzklzHRjQBAehz/gVLoQYOVj9uyfxXiBP545lLcjinqeyHoQfkw73ErUgzssvN2NHj6hmwQwynB5OB9ZXy+8VEeS20VDCfKyRQ7/SfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785928; c=relaxed/simple;
	bh=hTrAtP5m4gRdBq0r8KlUeSSp2C65W2psDb1vP9wdqNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXplzLv4C8L2ruoLHs5+3E+pkR5JALryRc6+Cvh0wDxLNHyQ3/jrfFXThB9FW9c4FPT291MyQTpXM1RjXqnLLqd6hTR6JVJ9AOi/74Q1asY9rJbEA/YwIq35E3IzAx5JRmnHKZ+lL7eODvK6VkbEF4iheMYL0pCjqhrNrLCcADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZZsYzFD4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2gPTz2AW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZZsYzFD4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2gPTz2AW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZZsYzFD4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2gPTz2AW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZZsYzFD4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2gPTz2AW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 582BA6D35D;
	Thu, 18 Jun 2026 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781785909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOoFoS9hdtQrhntR5wxoaqFbboaKguIrREDbmhHPJxo=;
	b=ZZsYzFD4cO2IywIksFMaHRTNkuefJWnxQ/Yk5rDZH2yoUfmhI+medun6UKoG3FYxcX1tjZ
	D0a5671NSvh2Q3C4rIMEKVm3PO2bWnb2P4zF87dqwZ2V8kyOwKIASgh1huv58n+AFqsAK/
	H5bbq17WcK2WjRdjO2dZa2zZ4XoCeYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781785909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOoFoS9hdtQrhntR5wxoaqFbboaKguIrREDbmhHPJxo=;
	b=2gPTz2AWAHcDKpoAfDOOiZl5QUQS/wrJhQNtxYf5JJpad5WVEHHDMAuhTvllv2QtcpEYvL
	OELTwGEURPVM5MAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781785909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOoFoS9hdtQrhntR5wxoaqFbboaKguIrREDbmhHPJxo=;
	b=ZZsYzFD4cO2IywIksFMaHRTNkuefJWnxQ/Yk5rDZH2yoUfmhI+medun6UKoG3FYxcX1tjZ
	D0a5671NSvh2Q3C4rIMEKVm3PO2bWnb2P4zF87dqwZ2V8kyOwKIASgh1huv58n+AFqsAK/
	H5bbq17WcK2WjRdjO2dZa2zZ4XoCeYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781785909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOoFoS9hdtQrhntR5wxoaqFbboaKguIrREDbmhHPJxo=;
	b=2gPTz2AWAHcDKpoAfDOOiZl5QUQS/wrJhQNtxYf5JJpad5WVEHHDMAuhTvllv2QtcpEYvL
	OELTwGEURPVM5MAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 160E9779A8;
	Thu, 18 Jun 2026 12:31:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SMZCBDXlM2rTJQAAD6G6ig
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
Subject: [PATCH v4 4/6] drm/hibmc: Do not use cpp from struct drm_format_info
Date: Thu, 18 Jun 2026 14:28:42 +0200
Message-ID: <20260618123142.92298-5-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[huawei.com,hisilicon.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -6.80

Replace uses of struct drm_format_info's cpp with appropriate interfaces.
The cpp field contains the characters per pixel. It is deprecated and
should be avoided.

Calculate the line width in bytes with drm_format_info_min_pitch(). This
is the preferred way of getting pixel and line sizes.

Program HIB_CRT_DISP_CTL_FORMAT from the format's 4CC code instead of
calculating the field's value from the cpp.

v4:
- introduce fb variable in separate patch (Yongbang)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 19cb16a7daf9..fe73b365e547 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -119,7 +119,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 
 	writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
 
-	reg = fb->width * fb->format->cpp[0];
+	reg = drm_format_info_min_pitch(fb->format, 0, fb->width);
 
 	line_l = fb->pitches[0];
 	writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
@@ -129,7 +129,14 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	/* SET PIXEL FORMAT */
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
 	reg &= ~HIBMC_CRT_DISP_CTL_FORMAT_MASK;
-	reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, fb->format->cpp[0] * 8 / 16);
+	switch (fb->format->format) {
+	case DRM_FORMAT_XRGB8888:
+		reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, 2);
+		break;
+	case DRM_FORMAT_RGB565:
+		reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT, 1);
+		break;
+	}
 	writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
 }
 
-- 
2.54.0

