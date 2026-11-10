Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312221;
	b=cLGllDu+bb/prIFCLrD03CKuC313Ci4h9Y4tTY+g5/g58aina/xb5OVHbkxzP8eqta1u
	 GLyi+aSTykoVHE1T7r16xjC4DKRSRpceo5ZVbU/1ue4v1nELF6gPFbW2airvTBPwr0NVz
	 xkvwKh58VUI7RgwP5nlMtTzyAjmQO3/ELG74HjNueBLn8MXitsPyhXIUqZt2g1Vdo7h+A
	 9qxo5qYQrBrHndYPqleggo4u2ZM2dYbE6W6EEOwTAfi2AlnrEWrhQ9kLFJnitkB/UjcLd
	 3U54ydcWwkcr2lhrHm34+vbluI/MajGjHoBUwFzBzAy6krArMvJES2II0ipmUS2vL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312221;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=go2ahT4J/OnyocruO+TgN7OM95Vdo2X0uJ3MT6oMFXk=;
	b=EE38Nwb8f0pxb8gipixmFaPJwu464bMxPiY0FIA8m2cQhIBHxUAAtSWcE4YJL/gu2LCo
	 wA3tJvuyht2kyCiMKMkZgUk2peLPb0tV8nX35sY1MXRw4gk2OMaEwScr2Yq9LEfHF1mL2
	 bRKx2GNmr3hQy0ZZ9zKC4WZFe/sxacXXzwTFZWteGX6Uzy+DV1HvXcA6oAHoDb2iRihaE
	 uTgmQ8tr36ePaYIV5BHthay1dJEcy/XvzwJS/dd7z/CpbU/9jG6lNdAldR4b9qRUHg/Nb
	 0kJPIWjsiN6cZIJ8UEHuTNgA0+r+cLTEABlpVhcymWSqszbH3wmmKUYPYcIa2jnfVyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zY5HeK2a;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="1djRc/xn";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c6RB1tVg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YkRxJbQV;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59C2606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 12:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C59C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zY5HeK2a;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1djRc/xn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c6RB1tVg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YkRxJbQV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E59A1F453;
	Tue, 10 Nov 2026 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794312212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=go2ahT4J/OnyocruO+TgN7OM95Vdo2X0uJ3MT6oMFXk=;
	b=zY5HeK2aSkBydJQNfaPAP0/nJeoTiL7t+en/vRlvWB3Z2SoPiVeBMlkDp2viegJLRmZwgj
	hXp3zcQ7FraifsLXS+V6U2xPETe9AtbawBUoJDnIhfGXP67m+TZYImqNUHWf0Jn9cpgpzJ
	UHLzu0n9gBgUaGA/jZzDlXoqcfA3+a4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794312212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=go2ahT4J/OnyocruO+TgN7OM95Vdo2X0uJ3MT6oMFXk=;
	b=1djRc/xnP2/CVTqCbRwBhzjgu1jfg0aIN01mFRMHjT2uvLuoXKhcIGVdwiuenPOHKOCaOb
	iwwZA8rcYImL8eAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c6RB1tVg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YkRxJbQV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794312211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=go2ahT4J/OnyocruO+TgN7OM95Vdo2X0uJ3MT6oMFXk=;
	b=c6RB1tVg5PuJdU7J/l6Ib6kzbhgubOCWGSD8Cdg7vLYwa99D/WWiJe+ad0dwQX38dUu66T
	em7ynhHaO8FG6qzPOHcY0e6+E57e2KcMNq5r9b/92psTGytiut6IG5KzKsUTKgmJDUYfx0
	71baDUD0ZAwfLOOW/tGpOgSwwUzRr+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794312211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=go2ahT4J/OnyocruO+TgN7OM95Vdo2X0uJ3MT6oMFXk=;
	b=YkRxJbQVw1VFSKFi/VICpQhySVCwv9YA3iz01lZ/0yAchSwG0JefjaqhHzxLWhGVuirvpi
	dT+juOgw8eDAUBAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCB3713479;
	Tue, 10 Nov 2026 12:03:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9RxpJBII82qUDQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Nov 2026 12:03:30 +0000
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
Subject: [PATCH 0/5] drm/amdgpu,radeon: Inline drm_crtc_init()
Date: Tue, 10 Nov 2026 12:53:26 +0100
Message-ID: <20261110120326.538252-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: 2E59A1F453
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

The helper drm_crtc_init() sets up a CRTC with a primary plane for
non-atomic mode setting. Only drivers for some AMD hardware still
use it.

Inline drm_crtc_init() into amdgpu and radeon and remove it from
DRM. All new code implements atomic mode setting, which does not
use drm_crtc_init().

DRM support for kernel panic is only implemented in amdgpu. Take
the panic helpers from drm_crtc_init() in amdgpu, but clean it up
in radeon.

With this series in place, DRM's helpers for drawing panic screens
can be further integrated with other drawing helpers, as outlined
in [1].

Tested on radeon with a Radeon HD 6570.

[1] https://lore.kernel.org/dri-devel/20261019154612.777074-1-tzimmermann@suse.de/

Thomas Zimmermann (5):
  drm/amdgpu: dce_v6_0: Inline drm_crtc_init()
  drm/amdgpu: dce_v8_0: Inline drm_crtc_init()
  drm/amdgpu: dce_v10_0: Inline drm_crtc_init()
  drm/radeon: Inline drm_crtc_init()
  drm: Remove drm_crtc_init()

 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c  | 44 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c   | 44 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c   | 44 ++++++++++++++-
 drivers/gpu/drm/drm_crtc.c              | 26 +++------
 drivers/gpu/drm/drm_modeset_helper.c    | 74 -------------------------
 drivers/gpu/drm/radeon/radeon_display.c | 47 +++++++++++++---
 include/drm/drm_modeset_helper.h        |  3 -
 include/drm/drm_plane.h                 |  5 --
 8 files changed, 170 insertions(+), 117 deletions(-)

-- 
2.56.0

