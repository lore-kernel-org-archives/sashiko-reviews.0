Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CB3DD51F
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791979; cv=none; b=de3LjlpOpK8TTKk2CDN4D0lU/28Xjox72xrHtbk9KbZd76D9D3XIoFZNVLl6ebFmbCJQpUooxbZJp3rHlLYhVvgEXN05Os1XFeUs4348ssVFszBMFOeJQEdUMTQvGlJy15mE8yARrNdsVMYzRQfo2younhBHs/lFhSEnoIvJldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791979; c=relaxed/simple;
	bh=iJzU/5FMZ+cjb1ffSFgbxX5/4hbwxEHjblMkGIUqZ+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lF1tUhjim6lknMbKf1ksrKXLCuBnOUSvIfZz7EIOwxVT8qMvMf8DNCO1r0UbT3gXDxX4Q7+9R7G/bPIB4KWyiZ/1GwD7CHpyVI24E64ex9lj9STsn+twEGyJ010vGzOzTl0kqFN2dCvqRKBtgnXJoXvjEMu6SeW/7VmgSLKp9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TXuvAm+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N7z0xaf2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TXuvAm+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N7z0xaf2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TXuvAm+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N7z0xaf2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TXuvAm+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N7z0xaf2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B780275C38;
	Thu, 18 Jun 2026 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=TXuvAm+AUDHTT00aBB0N7g9k1mc9TNkMOZ8oJDqp8ppLEb94+4l8vlipIPh12p4ZOGp87N
	8LKeI400hzYwZgjFCkVKUlY3lNHSJHfkpVK9AW+SrXfCqC9uf8KgYBWB6xIsx7NH1EwPUo
	AIblNHMBzR6ZcSFvwRSyGlAwQnvIOUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=N7z0xaf2gpZp27mwKlmMj48n9bF9nsG7vOnpgBbz3OFscKs5XHPjNb4S87YvUVN9lzJZk9
	0tZVLXsTx9PAwOAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TXuvAm+A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=N7z0xaf2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781791976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=TXuvAm+AUDHTT00aBB0N7g9k1mc9TNkMOZ8oJDqp8ppLEb94+4l8vlipIPh12p4ZOGp87N
	8LKeI400hzYwZgjFCkVKUlY3lNHSJHfkpVK9AW+SrXfCqC9uf8KgYBWB6xIsx7NH1EwPUo
	AIblNHMBzR6ZcSFvwRSyGlAwQnvIOUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781791976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XHS9rpHO2emFyRayn0+qlw2fZtQR1qQZlQIg7aPOj34=;
	b=N7z0xaf2gpZp27mwKlmMj48n9bF9nsG7vOnpgBbz3OFscKs5XHPjNb4S87YvUVN9lzJZk9
	0tZVLXsTx9PAwOAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C3BF779A8;
	Thu, 18 Jun 2026 14:12:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ogYRFej8M2o8DQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 14:12:56 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/6] drm/msm: fbdev: Use client buffers
Date: Thu, 18 Jun 2026 16:11:31 +0200
Message-ID: <20260618141249.151338-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B780275C38
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

A client buffer holds the DRM framebuffer for an in-kernel DRM
client. Until now, msm created an internal ad-hoc framebuffer for
its fbdev emulation, while by-passing the regular interfaces used by
user-space compositors.

Convert msm's fbdev emulation to use client buffers. Replacing the
existing code with a client buffer allows for stream-lining msm code
and later also the fbdev helpers. The new framebuffer will be registered
against the client's file and will support handles for GEM objects. It
is then just another framebuffer within the DRM ecosystem.

Patches 1 and 6 change visibility of msm_framebuffer_init() during the
refactoring. It is the easiest way to refactor the fbdev probe helper.

Patch 2 and 3 inline the fb allocation code into the fbdev-probe helper
and fix it up a bit.

From there patches 4 and 5 convert fbdev buffer allocation to common
DRM helpes and client buffers.

If all fbdev emulation helpers can be converted to client buffers, the
emulation's whole framebuffer handling could possibly be moved into
shared helpers.

v2:
- clarify on the page alignment of the framebuffer size (Dmitry)

Thomas Zimmermann (6):
  drm/msm: Do not declare msm_framebuffer_init() as static
  drm/msm: fbdev: Inline msm_alloc_stolen_fb()
  drm/msm: fbdev: Fix error reporting
  drm/msm: fbdev: Calculate buffer geometry with format helpers
  drm/msm: fbdev: Use a DRM client buffer
  drm/msm: Make msm_framebuffer_init() an internal interface again

 drivers/gpu/drm/msm/msm_drv.h   |  9 ---
 drivers/gpu/drm/msm/msm_fb.c    | 98 +++++++++------------------------
 drivers/gpu/drm/msm/msm_fbdev.c | 85 +++++++++++++++++++---------
 3 files changed, 85 insertions(+), 107 deletions(-)


base-commit: fc59f76558703febba8056be87d1c97d14f7485e
-- 
2.54.0

