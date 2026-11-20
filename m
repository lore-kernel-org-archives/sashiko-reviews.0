Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175549;
	b=pa/knohkJpxfvILL+XYkCQCZ/5Re87xxAGVIE1MnK5bfApj950BOl7Xs92zAu/46EWzY
	 uBG3kneg+ZHQkNJe2g0FCvtJ+ewj8RIzumJfrRsxlOd0/+a7K0s8fR3ch6doNuiu8UpFr
	 ift29wmLQx3vFSqW+6OsWh09rSeOaDOmm1KFMoTRhuMWjwXBlS9m5coDOZuyT1dsv6FFY
	 oCkDSWw+PwAEj1yjLoehO6mIUvCagEhFQFimYyW91qCjqDuvYZyjrCgUolzPknkQm95Ri
	 qimscQROV+whVr8Mx8WM7tfMOVZHGEAqf9dG8FQnXZHtT2k6k7JIvwifIKDDpVH19dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175549;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=EvklcGWh62+gF3hPDKmSnPcFAzpcN/JQJuD/j1FiZZ8=;
	b=c7t38GWhZTKr+IuwG2//o6B6jfzrkK1OBifEBuTyRz5J1S1nfkZ/9jee8z7+AAhb33qi
	 H+uc7Rn5Yp+mJVHG+mdAyzhthjugqtdR7K16inzus35yDpehmjqBpZKFrHVTFdHNgt9+v
	 ika38U3d4aXAiB8/ojbh/cyx7UYGMHOSKuV8YxLD/BZgAMwIbVoBkiaM/lCkNFbEG5ZcE
	 CpVxxVxAt12QtrtSG5DTrp7FexOAMNUTWSWfuaPvki176KaDUqOmTaUqSrTJm46f2AFDi
	 2KHfN7jnmAUPEJ3+ZM93aS5T51L+itgeNNmemWFWCHVRQVGZFAH0fn08Jy3eK+wHRQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awPxlDUG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Uin9VaVP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awPxlDUG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Uin9VaVP;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C652606A338
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C652606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awPxlDUG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Uin9VaVP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=awPxlDUG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Uin9VaVP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA09222578;
	Fri, 20 Nov 2026 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795175546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EvklcGWh62+gF3hPDKmSnPcFAzpcN/JQJuD/j1FiZZ8=;
	b=awPxlDUGmgsegOo1U9mCbYZRdiywdYwxWEHrDMZ+nhSH+k4MDm+mjWhPX/ZTLSkV//MbOI
	MhEi/mIyXGIAtInbVoB03XpoxLG5ayTtytkNFczwdrdCbhUVLxH+CpXw46yNfYMnDwaNw4
	OSRNnoTrs9j0BAummLZwyM2j51pNgUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795175546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EvklcGWh62+gF3hPDKmSnPcFAzpcN/JQJuD/j1FiZZ8=;
	b=Uin9VaVPw4F0TUAwvOjyaG9IJ62cEP05KsQEyTl/LbbgzxyBPOFxFydl3InAT6LwqO3ac0
	Dg5Cz1PMEZ2LPECA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795175546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EvklcGWh62+gF3hPDKmSnPcFAzpcN/JQJuD/j1FiZZ8=;
	b=awPxlDUGmgsegOo1U9mCbYZRdiywdYwxWEHrDMZ+nhSH+k4MDm+mjWhPX/ZTLSkV//MbOI
	MhEi/mIyXGIAtInbVoB03XpoxLG5ayTtytkNFczwdrdCbhUVLxH+CpXw46yNfYMnDwaNw4
	OSRNnoTrs9j0BAummLZwyM2j51pNgUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795175546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EvklcGWh62+gF3hPDKmSnPcFAzpcN/JQJuD/j1FiZZ8=;
	b=Uin9VaVPw4F0TUAwvOjyaG9IJ62cEP05KsQEyTl/LbbgzxyBPOFxFydl3InAT6LwqO3ac0
	Dg5Cz1PMEZ2LPECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 674571348F;
	Fri, 20 Nov 2026 11:52:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UE2UA3o0AGsbDAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 20 Nov 2026 11:52:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/6] fbcon: Clean up glyph handling on redraws
Date: Fri, 20 Nov 2026 12:49:53 +0100
Message-ID: <20261120115215.52092-1-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Score: -11.80

Fbcon's drawing functions open-code much of the glyph handling. Use
font helpers instead. Makes fbcon more consistent and easier to
understand.

Patch 1 updates fbcon to use unsigned char for glyph buffers. This
is consistent with the font code and font_data_t.

Patches 2 and 3 update font rotation to return rotated glyphs as
font_data_t. A rotated font can now use the same interfaces as the
unrotated source font. Fbcon uses this to ref count the rotated
font's buffer.

Patches 4 to 6 update various parts of fbcon to use font helpers
instead of open-coding access to font_data_t. Having the rotated
font as font_data_t makes this convenient.

Tested with fbcon on DRM's bochs driver (qemu).

v2:
- resolve merge conflicts in fbcon
- fix typos in commit descriptions

Thomas Zimmermann (6):
  fbcon: Use unsigned char for glyph data
  lib/fonts: Provide internal helpers for allocating font_data_t
  lib/fonts, fbcon: Use font_data_t for rotated fonts
  fbcon: Refactor size calculation for cursor buffers
  fbcon: Look up glyphs using the font interface
  fbcon: Handle characters with no glyph defined in a consistent way

 drivers/video/fbdev/core/bitblit.c      | 82 +++++++++++++++----------
 drivers/video/fbdev/core/fbcon.c        |  3 +-
 drivers/video/fbdev/core/fbcon.h        |  5 +-
 drivers/video/fbdev/core/fbcon_ccw.c    | 56 +++++++++++------
 drivers/video/fbdev/core/fbcon_cw.c     | 57 ++++++++++-------
 drivers/video/fbdev/core/fbcon_rotate.c | 19 +++---
 drivers/video/fbdev/core/fbcon_ud.c     | 77 +++++++++++++++--------
 include/linux/font.h                    |  5 +-
 lib/fonts/font.h                        | 12 ++++
 lib/fonts/font_rotate.c                 | 32 ++++------
 lib/fonts/fonts.c                       | 63 ++++++++++++-------
 11 files changed, 254 insertions(+), 157 deletions(-)


base-commit: 7d502136b31169f6b5575f7f89c3da60cdf7891d
-- 
2.56.0

