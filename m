Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351E36E468
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134683; cv=none; b=iLy5ElKdVgTIh4GcCWkh7b2WRM76zJJ++PDaHaubBUPc9ckjDFBR3cs8CKRqqfv0eE2y/NhrRsl3f0ivZX/9YzTFeCfEg5/viDa3n3v/w5MDfohE6BiQUEOfSQluPfnZG3HhXdwhKx0qPsfCfubzb7Uj9uzwShp6y+NGPZ3vWpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134683; c=relaxed/simple;
	bh=KGGr9iRyDnywrxTsoCIUrSGbPp04XbhdNseGVAHxC5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GF2tgrhnnmreSSqul7szVpj8h46qPlByye0tjVEraEgUN0BMhp6/itQqxqr4T6K3IkYABeE/qUg70kf1u+owAWOphhCA26ufyvSl+533bwdpKIBE6LuK5/hFs43ftqKZcFvxQbZbKfviFi49UjOFwFIFZrq1MbcnGOTHUfpX7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YG3yIB88; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W739RmJA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YG3yIB88; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W739RmJA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YG3yIB88";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W739RmJA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YG3yIB88";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W739RmJA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2A6996CBD9;
	Mon, 22 Jun 2026 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782134680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ziPyQI5a+wXw1IKNck8mmri9sPYWuco/MemOvhs8VMU=;
	b=YG3yIB88sErZhzdNELVlNSw7RCI6kPOPLu6kWJaTGD8nl4g1+A56UcggkOgre70HVVAJFL
	Yr38noOnsq4qTTioZUnHmB7NgFxD2XPHr0pdQ/lhg/ICD1B5BPCVbtFhwUfrAY1KhL8x1m
	kSsh7s0XItv6f8OL4PrUNC6mbAEbqk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782134680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ziPyQI5a+wXw1IKNck8mmri9sPYWuco/MemOvhs8VMU=;
	b=W739RmJAwqUJ+fjiRJKX6TeV5VzscNn2jfpHLxT0OUYtltVHBkVpbzyvTyDBs2Dbaf9saD
	I3aTifigT1TtAuAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782134680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ziPyQI5a+wXw1IKNck8mmri9sPYWuco/MemOvhs8VMU=;
	b=YG3yIB88sErZhzdNELVlNSw7RCI6kPOPLu6kWJaTGD8nl4g1+A56UcggkOgre70HVVAJFL
	Yr38noOnsq4qTTioZUnHmB7NgFxD2XPHr0pdQ/lhg/ICD1B5BPCVbtFhwUfrAY1KhL8x1m
	kSsh7s0XItv6f8OL4PrUNC6mbAEbqk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782134680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ziPyQI5a+wXw1IKNck8mmri9sPYWuco/MemOvhs8VMU=;
	b=W739RmJAwqUJ+fjiRJKX6TeV5VzscNn2jfpHLxT0OUYtltVHBkVpbzyvTyDBs2Dbaf9saD
	I3aTifigT1TtAuAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE729779A8;
	Mon, 22 Jun 2026 13:24:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4KzhNJc3OWpYIQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 22 Jun 2026 13:24:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	treding@nvidia.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rayyan@ansari.sh
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/6] drm/sysfb: simpledrm: Various improvements
Date: Mon, 22 Jun 2026 15:19:34 +0200
Message-ID: <20260622132433.722823-1-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,ansari.sh];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

Patches 1 to 5 improve validation of the values provided by the
device firmware.

Patch 6 improves support for panel rotation. There's a rotation
property in the DT panel node. Read the value and set the connector's
orientation property accordingly.

v2:
- further improve input validation (Sashiko)

Thomas Zimmermann (6):
  drm/sysfb: simpledrm: Improve framebuffer-size validation
  drm/sysfb: simpledrm: Improve panel-size validation
  drm/sysfb: simpledrm: Inline simplefb_get_validated_int()
  drm/sysfb: simpledrm: Improve stride validation
  drm/sysfb: simpledrm: Validate mmap size against framebuffer size
  drm/sysfb: simpledrm: Read panel orientation from DT node

 drivers/gpu/drm/sysfb/simpledrm.c | 133 ++++++++++++++++++++++++------
 1 file changed, 106 insertions(+), 27 deletions(-)


base-commit: fc59f76558703febba8056be87d1c97d14f7485e
-- 
2.54.0

