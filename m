Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098099;
	b=qulRdFEpNOBjlywEOAkSvNblA4rh2jhLlXdAndn0GSKvfohkpVmRO6SnBbhaG8X9rQLU
	 1L84E8dUlPniquhwn5eiSXBxCqHyWl9Oh9V1CabgE9tbhfB/SGN/6Cepj8FLwdVHUrWE1
	 sjoHpNhOwelAxxgVtDNg0j/ifp8aB9SAEQ+fUVJ7l8w811fzQB7ExYR+xC4BGdAiTEfzN
	 t42SJ1KJed73/S7X0HAvxQpNjjLw+qDJMCGX+/K2ccX9eGUmPbruh4DSehBMeAAKtFKe+
	 muZTwErPp11CB8S4aNKxg7uaDAc9HlkIXJ7A6azcGtiT/an4hpBh0qDkijSmRdD1sCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098099;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=ZCvgNNzNzAU8oVlxPQCllxA4ysYrcHXBADOlpckeK7s=;
	b=IT72uAz6vMPs4WJV4xdD0SqI7hEptrvyWNHbG4kkd2Y7K/tCLAkATXL+eqgvYWN6Zsft
	 OQWcSltuZYei3dcgleFfsxWI6UbNxwqrkJPlj/P3+JCeNS6M40GOui9ORMJYc6gxHM7/m
	 ci43Hq6ZbOM2PEeaPWhB6+KyLUVlvuExtvnU7skkb8/YuGW9bWVtOon95fHPGT7Q+PIVN
	 INgLrotLjLE6/esZ7Ryf8x1OFMmdEgH6i2/ZkmcjARjpqSQQBpF8W5TKwfYuU0KexIvpB
	 3a9xYhBi6RTBGh0okRsDhgZ8OLHzxW75J4UANdXBo3DAdsnBVsuqa01gPWOI4jp62iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iRUzcfEC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yzwrFknr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iRUzcfEC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yzwrFknr;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59C360A2606
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C59C360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iRUzcfEC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yzwrFknr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iRUzcfEC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yzwrFknr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1143F224A8;
	Thu, 19 Nov 2026 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCvgNNzNzAU8oVlxPQCllxA4ysYrcHXBADOlpckeK7s=;
	b=iRUzcfEC5Cn4cC1I2fsSJwraRDjhLa5bJOl+fzZU6DDwRKTUvJxzgmUiitiF7NqW935LK+
	KGdRCo1pIhHWZ68olYhJczW37b9TiwnNXwXF/iIbKjj3SqSpUEspuYOYdTMCOD49dosts/
	cnsETlyGAd06sW1rZG/ob+m7GwkzdZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCvgNNzNzAU8oVlxPQCllxA4ysYrcHXBADOlpckeK7s=;
	b=yzwrFknrlecDI7xEYYF8wIzNV8SqknkVVBIt7vb9089Ypljd7TwxNPC4UxllgwxQNXr89q
	lyW0Ijd+BSUpjkCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iRUzcfEC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yzwrFknr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCvgNNzNzAU8oVlxPQCllxA4ysYrcHXBADOlpckeK7s=;
	b=iRUzcfEC5Cn4cC1I2fsSJwraRDjhLa5bJOl+fzZU6DDwRKTUvJxzgmUiitiF7NqW935LK+
	KGdRCo1pIhHWZ68olYhJczW37b9TiwnNXwXF/iIbKjj3SqSpUEspuYOYdTMCOD49dosts/
	cnsETlyGAd06sW1rZG/ob+m7GwkzdZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCvgNNzNzAU8oVlxPQCllxA4ysYrcHXBADOlpckeK7s=;
	b=yzwrFknrlecDI7xEYYF8wIzNV8SqknkVVBIt7vb9089Ypljd7TwxNPC4UxllgwxQNXr89q
	lyW0Ijd+BSUpjkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97E8A13510;
	Thu, 19 Nov 2026 14:21:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RynyAeAF/2rJfgAAD6G6ig:T10
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Nov 2026 14:21:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	tiwai@suse.com,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/11] drm/udl: Synchronize pending URBs on each frame
Date: Thu, 19 Nov 2026 15:02:21 +0100
Message-ID: <20261119142114.152052-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119142114.152052-1-tzimmermann@suse.de>
References: <20261119142114.152052-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-10.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[redhat.com,poorly.run,suse.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 1143F224A8

Wait for in-flight URBs from the previous frame before sending out
the current frame. Throttles frame rate to USB limits.

PC display usually runs with a refresh rate of 60 Hz or more. Sending
out URBs for each frame at this rate easily overloads the USB. This
results in display lag up to several seconds. Udl currently avoids
this by limiting the number of URBs to 20 at a time. This prevents
overloading the USB, but also prevents udl from using all the
bandwidth available.

Solving this requires more flexibility in the number of in-flight
URBs. The exact value depends on the framebuffer configuration and
the available bandwidth on the USB.

Before removing the limit on the URB count, add another means of
synchronizing the frame rate to the USB. Do this in atomic_begin, so
that the USB has the maximum time between sending two frames.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index bbba1dee8e4f..caa0a117e3c2 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -329,6 +329,23 @@ static const struct drm_plane_funcs udl_primary_plane_funcs = {
  * CRTC
  */
 
+static void udl_crtc_helper_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct udl_device *udl = to_udl(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	/*
+	 * It is acceptable to briefly block in this call, but
+	 * having it timeout frequently indicates a problem.
+	 */
+	udl_sync_pending_urbs(udl);
+	drm_dev_exit(idx);
+}
+
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
 {
 	struct drm_device *dev = crtc->dev;
@@ -395,6 +412,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 
 static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
 	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_begin = udl_crtc_helper_atomic_begin,
 	.atomic_enable = udl_crtc_helper_atomic_enable,
 	.atomic_disable = udl_crtc_helper_atomic_disable,
 };
-- 
2.56.0

