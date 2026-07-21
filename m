Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13B44C664
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627703; cv=none; b=qX1oinDfaMuYiGN9PWkyAtG8OOEttGRUMjzO26TCYrK7xdXoAu3N4ehVbXfHSenMU5DkW2EOTXxLwlMKEswVpzLE/Z01iMEFsG3hiIJ+QBSRKhfQjuTtd829foc23HSgvcN1rb3aIqHyZOEGYqmBp8RDZNTZCYE9uB44HoAeSC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627703; c=relaxed/simple;
	bh=yjVClPnUvtjVs0S+2DH+jfb+ubDnClsDuAfU/YnrNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FW7O9udLL9vr26O1S/ay7HCtImk/Ktf9KwOAH2FF7JxIPQTZYwxg8mW1oQ/7WrptKxxnB2RUqauOoQSgZUDd+SljFF42uBTQpvPdSBqeHRUVaRTudsgRlWaUPy0yO+ZaD/kXaTV6TbqNzNxeK9AWJJ7hU+0/3kF36k+XRVQZzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1rX2eBn6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yve6qeDw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1rX2eBn6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yve6qeDw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1rX2eBn6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yve6qeDw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1rX2eBn6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yve6qeDw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 463373DF8;
	Tue, 21 Jul 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784627700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnetzD2X0soEU98L6h+pzMU54A4FTkeqZhhdt7nUwTU=;
	b=1rX2eBn6p9WuvlmxC5LMXdGWXfFn26bFVrfolETII10fdlYROUPmLV6GhAySFrafytEQ2Z
	F2hkifIhqyMWU/z8Ez7GVwgnlESbWTZq7A3+/cka1pyiIa8ESSIPUQLLsxwfQ7uRSNX4ee
	+i/hktT02jSG5nXT4US7y9SqwBrzHpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784627700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnetzD2X0soEU98L6h+pzMU54A4FTkeqZhhdt7nUwTU=;
	b=yve6qeDw51M5WM01y/yaw7VbUIrm+KkFHXi7f+t3fnG9lc86LOPygsro87fLZVClsPjKLr
	A0iBT3VuGG60faCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784627700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnetzD2X0soEU98L6h+pzMU54A4FTkeqZhhdt7nUwTU=;
	b=1rX2eBn6p9WuvlmxC5LMXdGWXfFn26bFVrfolETII10fdlYROUPmLV6GhAySFrafytEQ2Z
	F2hkifIhqyMWU/z8Ez7GVwgnlESbWTZq7A3+/cka1pyiIa8ESSIPUQLLsxwfQ7uRSNX4ee
	+i/hktT02jSG5nXT4US7y9SqwBrzHpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784627700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CnetzD2X0soEU98L6h+pzMU54A4FTkeqZhhdt7nUwTU=;
	b=yve6qeDw51M5WM01y/yaw7VbUIrm+KkFHXi7f+t3fnG9lc86LOPygsro87fLZVClsPjKLr
	A0iBT3VuGG60faCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E45B3779AA;
	Tue, 21 Jul 2026 09:54:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y9eCNvNBX2rNMgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 21 Jul 2026 09:54:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ville.syrjala@intel.com,
	rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v3] drm/i915/display: Handle struct drm_plane_state.ignore_damage_clips
Date: Tue, 21 Jul 2026 11:54:11 +0200
Message-ID: <20260721095454.404298-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
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
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

Call drm_atomic_helper_check_plane_damage() in plane_atomic_check()
before copying the damage information to guarantees that ignore_damage_clips
from struct drm_plane_state has the correct value. Although i915 does not
directly modify or use the flag, DRM's damage iterator will soon rely on
it.

As a side effect, if the CRTC has been marked for a full modeset before
the call to drm_atomic_helper_check_plane_damage() happens, the plane now
ignores all damage clips and does a full update.

Git commit 35ed38d58257 ("drm: Allow drivers to indicate the damage
helpers to ignore damage clips") introduced ignore_damage_clips to
selectively ignore damage clipping for certain framebuffer changes. The
mode-setting pipeline can disabled damage clippings for an atomic commit
by setting ignore_damage_clips in struct drm_plane_state. The atomic
commit will then do a full display update.

Future directions: there's currently a multitude of options that affect
damage clipping; with different places seeing different state. In order
to unify this, drm_atomic_helper_check_plane_state() will soon evaluate
all options in a single place and set ignore_damage_clips accordingly. All
later stages of the mode-setting pipeline will only look at this field.

v3:
- fix the call to drm_atomic_helper_check_plane_state()
- use primary-CRTC's plane state (Sashiko)
- note full-plane updates in commit description
v2:
- move _check_plane_damage() before reading damage first time (Sashiko)
- expand commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
Taken with updates from the series at

  https://lore.kernel.org/dri-devel/20260610152505.260172-1-tzimmermann@suse.de/
---
 drivers/gpu/drm/i915/display/intel_plane.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index a440f92ff00c..d64f151ce410 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -850,7 +850,7 @@ static int plane_atomic_check(struct intel_atomic_state *state,
 		intel_atomic_get_new_plane_state(state, plane);
 	const struct intel_plane_state *old_plane_state =
 		intel_atomic_get_old_plane_state(state, plane);
-	const struct intel_plane_state *new_primary_crtc_plane_state;
+	struct intel_plane_state *new_primary_crtc_plane_state;
 	const struct intel_plane_state *old_primary_crtc_plane_state;
 	struct intel_crtc *crtc = intel_crtc_for_pipe(display, plane->pipe);
 	const struct intel_crtc_state *old_crtc_state =
@@ -873,6 +873,14 @@ static int plane_atomic_check(struct intel_atomic_state *state,
 		old_primary_crtc_plane_state = old_plane_state;
 	}
 
+	/*
+	 * Prepare plane-damage state before using it; do this on all
+	 * display versions to keep the underlying DRM plane state in
+	 * good shape.
+	 */
+	drm_atomic_helper_check_plane_damage(&state->base,
+					     &new_primary_crtc_plane_state->uapi);
+
 	intel_plane_copy_uapi_plane_damage(new_plane_state,
 					   old_primary_crtc_plane_state,
 					   new_primary_crtc_plane_state);

base-commit: fcaba3bc017906059b910ece3f83185e93010581
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
prerequisite-patch-id: b9adc9622920a3e70168e672c2c92795b3e3a106
prerequisite-patch-id: 5030de433a01c2e99056cadb676a8e2ba35f055a
-- 
2.54.0

