Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312214;
	b=XkO8kOYjcvDGbE70sgeWJNE/nVpgDZAvJqHx0y8epaJEasBMzWH10fM3kcRnuYZgZcgc
	 +zhxNxC4fmU5n/+SHyKjq4rLNecxVfTZK9xZX8feTuL0gFWAsor4TLK0PGSekktIqNYyC
	 xHO4KooZ5A5xUf0OTz6l1YZg7ST9iLuCAhQOZrjzZ7IpjitpkhJ8eIUmpwQDN4Cc737wv
	 Zb2xU1ng8MUmZAS99Nkl4bNB2R4qurFPe3X+iUPuZTPD9vncpumNWFFrgvTqKNTXSFggC
	 4iYefScUhv9SmLc97aq3eCxTTDt7+XOBLeA40jVVeD3kNlp+FEFIVMcH8D8gZpu3gUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312214;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=rFqTIK2hlQJEzHl3y0zxpe9TFatSKKN7/NiIH4LRip0=;
	b=BWqk1zqwvD9J87HsPsiKNUnjYSwm8a7sFVRXy768//FrjBWb4eD7wu7WczNA/lw30IwX
	 hKBxb5TXP2s5oDM1KxOkglpAyQI8gW3LJfv+UaIvjeisxcTEQeYW11inDQJrwQ7hpxoc2
	 WRcgnI21Nv24KGDyvKJZBVRluF32SIh9i0PuLxnMaiYFsxnuHMuWDGpcH+EbGHA0hVKcv
	 W4XBw7qm5T6eBJt8oiCqMeF8bNMxmmwaIIeaFttLuQdL/wKR8kpHr0Xs8PbyhmPqyoyBs
	 uC+FDu8gUY8pXZFG/sCzmCN+Ntj3NIRLBcICKpZ4c1V/PXytU9zWLyrDHSruw53V8kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4zIEqGw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JySm8A+K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4zIEqGw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JySm8A+K;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E4606A326
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 12:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4zIEqGw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JySm8A+K;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=k4zIEqGw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JySm8A+K
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7C4301F750;
	Tue, 10 Nov 2026 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794312211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFqTIK2hlQJEzHl3y0zxpe9TFatSKKN7/NiIH4LRip0=;
	b=k4zIEqGwuKBNXyPIZ35S3IeLbV4/jIx3greWWhMIrzAYQuz59dwqitdkZzkiV0NFS2afxX
	+HwQNssaEDJmgb2pZEqP2c3BTw5cLxRWIbiJ0lAZD6/1T8dAtIIWJFGH9S9hHtxLv6e0B0
	CscdTBh5KI9mdwNF/OIMT5lBPHGOR6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794312211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFqTIK2hlQJEzHl3y0zxpe9TFatSKKN7/NiIH4LRip0=;
	b=JySm8A+Kv/nIEpFMzlxyJ1Eng4R0ZwdIsFL0ISHetxnKhVtjlhxoWOxtoBjqALV9dqRxxU
	fl3A8209jyCmiMBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794312211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFqTIK2hlQJEzHl3y0zxpe9TFatSKKN7/NiIH4LRip0=;
	b=k4zIEqGwuKBNXyPIZ35S3IeLbV4/jIx3greWWhMIrzAYQuz59dwqitdkZzkiV0NFS2afxX
	+HwQNssaEDJmgb2pZEqP2c3BTw5cLxRWIbiJ0lAZD6/1T8dAtIIWJFGH9S9hHtxLv6e0B0
	CscdTBh5KI9mdwNF/OIMT5lBPHGOR6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794312211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFqTIK2hlQJEzHl3y0zxpe9TFatSKKN7/NiIH4LRip0=;
	b=JySm8A+Kv/nIEpFMzlxyJ1Eng4R0ZwdIsFL0ISHetxnKhVtjlhxoWOxtoBjqALV9dqRxxU
	fl3A8209jyCmiMBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1223A134F4;
	Tue, 10 Nov 2026 12:03:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9RxpJBII82qUDQAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Nov 2026 12:03:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/amdgpu: dce_v6_0: Inline drm_crtc_init()
Date: Tue, 10 Nov 2026 12:53:27 +0100
Message-ID: <20261110120326.538252-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110120326.538252-1-tzimmermann@suse.de>
References: <20261110120326.538252-1-tzimmermann@suse.de>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -11.80

Inline drm_crtc_init() into DCE v6 CRTC initialization. The helper is
only used by drivers for AMD hardware to implement legacy mode setting.

As in drm_crtc_init(), create a primary plane for the CRTC. Use the same
formats as with drm_crtc_init(). Format modifiers are still marked as
unsupported and handled internally by the plane. For the CRTC, call
drm_crtc_init_with_planes() for initialization. Clean up on errors.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

dce 6
---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 44 +++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index f0722bdaeab6..18c5d21be45e 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -27,6 +27,8 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic_helper.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "amdgpu.h"
@@ -2607,6 +2609,18 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
 	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
+static const u32 dce_v6_0_drm_primary_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static const struct drm_plane_funcs dce_v6_0_drm_primary_plane_funcs = {
+	.update_plane = drm_plane_helper_update_primary,
+	.disable_plane = drm_plane_helper_disable_primary,
+	.destroy = drm_plane_helper_destroy,
+	DRM_PANIC_PLANE_FUNCS,
+};
+
 static void dce_v6_0_panic_flush(struct drm_plane *plane)
 {
 	struct drm_framebuffer *fb;
@@ -2635,14 +2649,31 @@ static const struct drm_plane_helper_funcs dce_v6_0_drm_primary_plane_helper_fun
 
 static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
 {
+	struct drm_device *dev = adev_to_drm(adev);
+	struct drm_plane *primary;
 	struct amdgpu_crtc *amdgpu_crtc;
+	int ret;
+
+	/* possible_crtc's will be filled in later by crtc_init */
+	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
+					      &dce_v6_0_drm_primary_plane_funcs,
+					      dce_v6_0_drm_primary_plane_formats,
+					      ARRAY_SIZE(dce_v6_0_drm_primary_plane_formats),
+					      NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
 
 	amdgpu_crtc = kzalloc(sizeof(struct amdgpu_crtc) +
 			      (AMDGPUFB_CONN_LIMIT * sizeof(struct drm_connector *)), GFP_KERNEL);
-	if (amdgpu_crtc == NULL)
-		return -ENOMEM;
+	if (!amdgpu_crtc) {
+		ret = -ENOMEM;
+		goto err_drm_plane_cleanup;
+	}
 
-	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_v6_0_crtc_funcs);
+	ret = drm_crtc_init_with_planes(dev, &amdgpu_crtc->base, primary, NULL,
+					&dce_v6_0_crtc_funcs, NULL);
+	if (ret)
+		goto err_kfree;
 
 	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
 	amdgpu_crtc->crtc_id = index;
@@ -2663,6 +2694,13 @@ static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
 	drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v6_0_drm_primary_plane_helper_funcs);
 
 	return 0;
+
+err_kfree:
+	kfree(amdgpu_crtc);
+err_drm_plane_cleanup:
+	drm_plane_cleanup(primary);
+	kfree(primary);
+	return ret;
 }
 
 static int dce_v6_0_early_init(struct amdgpu_ip_block *ip_block)
-- 
2.56.0

