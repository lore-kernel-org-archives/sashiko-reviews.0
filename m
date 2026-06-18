Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5B120E334
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772215; cv=none; b=A35M9CVYwXnSJCwdmHwmJJTEENiJ01az6h1kJp7/d41i/dOKwLsJ/ooOhRUKiJrMgcaoJpt4rFjZ47s4NOFlO987TXUxfyABgx9gBP/PyqMuDfpuHosL7kcX3ty2plG3xAMvXTB6ODY17z+ZSUzaMT1031F0U3Hlo+dx+IYVbO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772215; c=relaxed/simple;
	bh=/lHd91J8izF3cIrL6sCtkhKC6oQcxhKtzEmoIP9TM6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJeAmkdwMc6neOaymPdVATR4UnR+Cdh+DEn4LSVtN5kmURLsOBUB98QnXHQx3lnG37VMGbOIwE7e6F1HB5tvt7AFTFN1RkojzjPkCvfP0m819cBy2dljn+IwXqwG32h7hdFFG/fzdZmVj0NjDaCvujSrU7RPq30qV5wJPCC37PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGqKg7zR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xIjPewMD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RGqKg7zR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xIjPewMD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGqKg7zR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xIjPewMD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RGqKg7zR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xIjPewMD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F26F6D21C;
	Thu, 18 Jun 2026 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781772212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QkpSmxNHwrG7TnL6tM77FKYxbuC/z/EzLa6uF/rsfyM=;
	b=RGqKg7zRUyaqZevV81oHKfF0BuQDLLKYLjtC6aaf3U9QagWJDim3NixM5nCszx6T+aG2nh
	53SjOiy3WhBb63acK1z1UnxkrvNTWHpmvEjK6iC33z7dCZrkCFbEM7h9Gtsurty3i7P5N3
	dBJtpb3aRNAra0JJs1OQ5XVrjBvGjhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781772212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QkpSmxNHwrG7TnL6tM77FKYxbuC/z/EzLa6uF/rsfyM=;
	b=xIjPewMDmM7GQLAoBJ+IrWi2AKmXau/30+M/+Hi9C/8AZ9DSgf1i7vnYc42av1CYqoLLV3
	P88xv0lFnaycxYAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781772212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QkpSmxNHwrG7TnL6tM77FKYxbuC/z/EzLa6uF/rsfyM=;
	b=RGqKg7zRUyaqZevV81oHKfF0BuQDLLKYLjtC6aaf3U9QagWJDim3NixM5nCszx6T+aG2nh
	53SjOiy3WhBb63acK1z1UnxkrvNTWHpmvEjK6iC33z7dCZrkCFbEM7h9Gtsurty3i7P5N3
	dBJtpb3aRNAra0JJs1OQ5XVrjBvGjhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781772212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QkpSmxNHwrG7TnL6tM77FKYxbuC/z/EzLa6uF/rsfyM=;
	b=xIjPewMDmM7GQLAoBJ+IrWi2AKmXau/30+M/+Hi9C/8AZ9DSgf1i7vnYc42av1CYqoLLV3
	P88xv0lFnaycxYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47108779A8;
	Thu, 18 Jun 2026 08:43:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X7EBELSvM2pAPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 18 Jun 2026 08:43:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] drm/sysfb: Fix visible size and related checks
Date: Thu, 18 Jun 2026 10:41:56 +0200
Message-ID: <20260618084327.46567-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 

We need the system framebuffer's visible size in efidrm and
vesadrm. Fix the size calculation for some corner cases and
handle errors correctly.

v2:
- fix trunctions from type conversions (sashiko)

Thomas Zimmermann (4):
  drm/sysfb: Do not page-align visible size of the framebuffer
  drm/sysfb: Avoid possible truncation with calculating visible size
  drm/sysfb: Return errno code from drm_sysfb_get_visible_size()
  drm/sysfb: Avoid truncating maximum stride

 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 13 ++++++++++---
 drivers/gpu/drm/sysfb/efidrm.c                |  7 ++++---
 drivers/gpu/drm/sysfb/vesadrm.c               |  6 +++---
 4 files changed, 18 insertions(+), 10 deletions(-)


base-commit: fc59f76558703febba8056be87d1c97d14f7485e
-- 
2.54.0

