Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD113B38A9
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380726; cv=none; b=A7EcWGukqd2wUd1cDJs4RNIRF08JWOTgL02X1tAYySyo8QYuRXDRKjkcueItewZ77WJNTgmPg6p0/X4z8JYpu8joTdJ5G7zTi5ZV6DID4OPtG3f5UxroM0+nO7IoM8uoAer2OgjJuH2t66X7wePPJDsfjrvC64gJ8R/QgfbBpjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380726; c=relaxed/simple;
	bh=NYxQIuV9OsW/qBYUCzW/O/erVWTKXMVx30fEqr/7ElQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2zUxmfzEQdfDaXD/j6Amo9gK4u9YbPJWbECcTl9xA175lbMHrnz6PsViqUWSBm0wHn7kRZLJmyqZwvEZsmYlQLBnVFazEbrKlp2JuVQiB3/LYFYBSra2Jf1vsvGWWtWpANg5PBH52WhXcj4inLrfL2rptqbxbCXCyouLxMELA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dp0qyN0Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jdel3oge; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dp0qyN0Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jdel3oge; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dp0qyN0Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jdel3oge";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dp0qyN0Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jdel3oge"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 09F1C75BD1;
	Thu, 25 Jun 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782380718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=036BBx9QIvXcuVr/871xuDrxPZ68kF7IqWRxXuhlHnk=;
	b=dp0qyN0Z3wG7gBPuGsVhMUTV86Hrptf6tb8z/m0Ks4m2GtO8Wjrvoott/MJUZUeey9BZg+
	XfDaHqWvcz1KvOFwGdFfaD+UVfXgk4P9gybWAxcenH+/zBgmDr2gM41o1QVnTuECSk7qOV
	JkFFpCqRz0Wm3ZkSx2bdggUXAOI8ogU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782380718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=036BBx9QIvXcuVr/871xuDrxPZ68kF7IqWRxXuhlHnk=;
	b=jdel3ogekkPdTfRtMx6NcQsnV/Tzg3PFWXV8kirX0EH+v3vrrGGRoXoAbphir2YiSgHDS4
	k/Td6Pf7I78ycaDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782380718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=036BBx9QIvXcuVr/871xuDrxPZ68kF7IqWRxXuhlHnk=;
	b=dp0qyN0Z3wG7gBPuGsVhMUTV86Hrptf6tb8z/m0Ks4m2GtO8Wjrvoott/MJUZUeey9BZg+
	XfDaHqWvcz1KvOFwGdFfaD+UVfXgk4P9gybWAxcenH+/zBgmDr2gM41o1QVnTuECSk7qOV
	JkFFpCqRz0Wm3ZkSx2bdggUXAOI8ogU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782380718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=036BBx9QIvXcuVr/871xuDrxPZ68kF7IqWRxXuhlHnk=;
	b=jdel3ogekkPdTfRtMx6NcQsnV/Tzg3PFWXV8kirX0EH+v3vrrGGRoXoAbphir2YiSgHDS4
	k/Td6Pf7I78ycaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B15CD779A8;
	Thu, 25 Jun 2026 09:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SIMWKq34PGqaBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 25 Jun 2026 09:45:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	treding@nvidia.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	rayyan@ansari.sh
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/7] drm/sysfb: simpledrm: Various improvements
Date: Thu, 25 Jun 2026 11:39:32 +0200
Message-ID: <20260625094509.157581-1-tzimmermann@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,linaro.org,ansari.sh];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

Patches 1 to 5 improve validation of the values provided by the
device firmware.

Patches 6 and 7 improve support for panel orientation. There's a rotation
property in the DT panel node. Read the value and set the connector's
orientation property accordingly. To do so, patch 6 moves the existing
code for parsing the rotation to drm_of.c. This makes it available to
simpledrm without introducing a dependency on DRM_PANEL.

v3:
- use shared helper for parsing the panel orentation (Thierry)
- fix framebuffer size checks (Sashiko)
- minor improvements
v2:
- further improve input validation (Sashiko)

Thomas Zimmermann (7):
  drm/sysfb: simpledrm: Improve framebuffer-size validation
  drm/sysfb: simpledrm: Improve panel-size validation
  drm/sysfb: simpledrm: Inline simplefb_get_validated_int()
  drm/sysfb: simpledrm: Improve stride validation
  drm/sysfb: simpledrm: Validate mmap size against framebuffer size
  drm/of: Implement drm_of_get_panel_orientation()
  drm/sysfb: simpledrm: Read panel orientation from DT node

 drivers/gpu/drm/drm_of.c          |  44 +++++++++++
 drivers/gpu/drm/drm_panel.c       |  26 +------
 drivers/gpu/drm/sysfb/simpledrm.c | 120 +++++++++++++++++++++++-------
 include/drm/drm_of.h              |  11 +++
 4 files changed, 150 insertions(+), 51 deletions(-)


base-commit: fc59f76558703febba8056be87d1c97d14f7485e
-- 
2.54.0

