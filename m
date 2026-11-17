Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924479;
	b=dRLTbjFVVEQfQE8xdeX5VrYw3GP0t4UsNvYT+X6x143hjbDs2Nd4EiBj1it1Sw1hL6h8
	 D0683nsrI71agdb6umOtsw7sxmVc5TVqUksPjFS8yBndBmJ7SHgMYsguGTtds+z3bDq1w
	 KJW0aPCgIxe3VuwAQ/Rla+Wwom9rNc1efPjXPCe+tO+BiMsuPYMNk94ufPec1Z3scmRcA
	 7wwvW6gx6fBOVhj6xLK5mGwXRkI7rHWRfTatI5l2plqfYtaNbVAs671A8tmqRFplhAUvS
	 ICS7jw8QlAM85ZrDbQzNhMrDBI1IVFDZ1ojOy1S8LEewPtb4HQC33wctTmmqD9pXGuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924479;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=z4/WKAT19Vpjrf1TybasxxG535T8z2t/1qjktjH0hrQ=;
	b=krZe/czD3nWRfgr8rdEEw2hYCoUOseRvEiW/2J+BT09m2hgTk+ZQrCdtaA8dqqeg7jUE
	 ygDaw/mCbhW/XxWSYWE8odoLHagD0LPmOngRKucAdXvtfYZFJFVxJ732wABfwudRVN4yU
	 BHTn+uIfkHfPXDiET+BTj6Q3dROCWNLeba7L5T1e33hLJWokL9OyzUfPHDGWU3loqN7fE
	 PRHYpBLtD76gxRwMmbKJCLFCqZs1A87oYTH95PNMN2YjWUVOG0TxHwVFx45xhB1FKYXZY
	 St+EDAUHYF/mKLdle2diQ9nacPeTy9nmLUtMk9eBsR//n/ndOaUBsYgqQ/tB1G7RTUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhrZgtD+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Aml1w1Ng;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhrZgtD+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Aml1w1Ng;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396FD606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396FD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhrZgtD+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Aml1w1Ng;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lhrZgtD+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Aml1w1Ng
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F321B22267;
	Tue, 17 Nov 2026 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794924476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z4/WKAT19Vpjrf1TybasxxG535T8z2t/1qjktjH0hrQ=;
	b=lhrZgtD+pyTojk/MCcSrXMx6TFxZn6YuCvOpTLRkcf4LvBemxaqD4KKCSIXciijpooSMGq
	+Ho0Fk8iJ1roxR4MWASw4Cy1bfReAOgNKLRxv0ZjjqUYZ0P4XsDL+GYnobIELQtkPPrW3b
	3sWH2BFDC6fm2ij3Sz97kSNCC+utqXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794924476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z4/WKAT19Vpjrf1TybasxxG535T8z2t/1qjktjH0hrQ=;
	b=Aml1w1NgkEBs3bsS2jtjyid/5Z/HsXC40wtevaKJFd62greKM+BF11lb36oeMYWKuwK/Vz
	yMv2QuZOjaHEamAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lhrZgtD+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Aml1w1Ng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794924476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z4/WKAT19Vpjrf1TybasxxG535T8z2t/1qjktjH0hrQ=;
	b=lhrZgtD+pyTojk/MCcSrXMx6TFxZn6YuCvOpTLRkcf4LvBemxaqD4KKCSIXciijpooSMGq
	+Ho0Fk8iJ1roxR4MWASw4Cy1bfReAOgNKLRxv0ZjjqUYZ0P4XsDL+GYnobIELQtkPPrW3b
	3sWH2BFDC6fm2ij3Sz97kSNCC+utqXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794924476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z4/WKAT19Vpjrf1TybasxxG535T8z2t/1qjktjH0hrQ=;
	b=Aml1w1NgkEBs3bsS2jtjyid/5Z/HsXC40wtevaKJFd62greKM+BF11lb36oeMYWKuwK/Vz
	yMv2QuZOjaHEamAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 884F113302;
	Tue, 17 Nov 2026 14:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lIVaDrtf/GpTJgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Nov 2026 14:07:55 +0000
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
Subject: [PATCH v3 0/2] drm/radeon: Inline drm_crtc_init()
Date: Tue, 17 Nov 2026 15:04:28 +0100
Message-ID: <20261117140750.541769-1-tzimmermann@suse.de>
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: F321B22267

The helper drm_crtc_init() sets up a CRTC with a primary plane for
non-atomic mode setting. Only radeon still uses it.

Inline drm_crtc_init() into radeon and remove it from DRM. All new
code implements atomic mode setting, which does not use drm_crtc_init().
DRM support for kernel panic is not implemented by radeon. Clean it up.

With this series in place, DRM's helpers for drawing panic screens
can be further integrated with other drawing helpers, as outlined
in [1].

Tested on radeon with a Radeon HD 6570.

Requires the patch series at [2].

v3:
- keep plane->format_default for now
- remove some obsolete include statements
v2:
- add missing formats for primary plane
- drop amdgpu patches

[1] https://lore.kernel.org/dri-devel/20261019154612.777074-1-tzimmermann@suse.de/
[2] https://lore.kernel.org/amd-gfx/20261111151546.3105062-1-alexander.deucher@amd.com/

Thomas Zimmermann (2):
  drm/radeon: Inline drm_crtc_init()
  drm: Remove drm_crtc_init()

 drivers/gpu/drm/drm_crtc.c              | 19 +++----
 drivers/gpu/drm/drm_modeset_helper.c    | 76 -------------------------
 drivers/gpu/drm/radeon/radeon_display.c | 53 ++++++++++++++---
 include/drm/drm_modeset_helper.h        |  3 -
 4 files changed, 53 insertions(+), 98 deletions(-)


base-commit: 7d502136b31169f6b5575f7f89c3da60cdf7891d
prerequisite-patch-id: 29d74d364880d75af999879ea5eec1e61f99eee4
prerequisite-patch-id: c4aac512c186a1189b7e7d81e3a118b3e487f955
prerequisite-patch-id: 2e6a87a46e3157194ea11a2a4821ffbe38e7748e
-- 
2.56.0

