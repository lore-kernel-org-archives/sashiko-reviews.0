Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710716;
	b=Zs19n/Raq3y0fja8+siOvws+9q1MwYQoa/v5grj+YGSKnsRL2b2XP/SCuOH1kmYTItbD
	 sC4sLXv6fD4gwzeZjrc8x/HA2GoNyGMpT39FmViZY9iOfc6iBOeYzsUJrHkawddeIxlzW
	 mfJ11W2WIuRStziXjLwB52VsiDo4tCv3CtaFwgDJ2Jw/E2ROqSRbxUvuqLD27gJs/VirX
	 WpMDo57wwt0WNGHAB52I5OsiaJIIkk5K9k6NjTwtjaspfIUk5eyJegwR2qd5Vnjn4G2PM
	 G6t1J9TnJaAp2YZ2j1mJ9PgHQBpnt0qFvge6AENEgVi90t9TcXKpqMdY8/jmcnX34Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710716;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=tflz+qs7VnKN0qJnBZfZf4kzCicLquJztd+JuQc3LoU=;
	b=RmLcyxjUGX5KhQhi3QDnZhkCr+mZmkaPzQadPROkySbDBCvaPn+XvLQb5c6beP+KHemb
	 h4BiizEQ7C12HA3n7rs+3PgYG4slYaUe4L+jbeaSQ5t1wRO+JNlSX5pleREyj1iHLNOfx
	 DjHwe2iW2hoxARNflVUJsuHOSVRyvtLRgkDxyDtEIxnTyak0t+e18YIdowdffK21yt95r
	 oOsJr98KRuyKCSsbn/A7cN21A7sq1yiW5Iex+acSEcFFxyF/KBoqub5sGwU3vqFhQXKk/
	 lVr+o5Dx6rr932/8qJthRZZWOVcAYBuLeW3YThymksec2o2HOqI8aEF7Dc6rWavBiEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QBOlfUBh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Nvx57a14;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QBOlfUBh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Nvx57a14;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13260A2621
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 16:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C13260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QBOlfUBh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Nvx57a14;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QBOlfUBh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Nvx57a14
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF9A21FE03;
	Thu, 26 Nov 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tflz+qs7VnKN0qJnBZfZf4kzCicLquJztd+JuQc3LoU=;
	b=QBOlfUBhd0hTwlmRQNkRDxJjhay/Eu1koIDM9/etPYpn/N+IROFwSCjJrlc2EGgO0vpqZD
	kkNqVrCrY570jHiBGRZmu4wbRHZaTHMR5DSZWkHiqcYsxeigQiygUrGzsAAp8X6wq0fhVL
	nhm5BjFZTTDRGh8atW0+W4nCvnDojGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795710713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tflz+qs7VnKN0qJnBZfZf4kzCicLquJztd+JuQc3LoU=;
	b=Nvx57a14PM9aC5qgvrIxnMpSVl2YdubxEaDfk8nAXJxRour7kY/qJTeaJ/KSkOrFafKxsz
	lhcvmRRdJelJ8oDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QBOlfUBh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Nvx57a14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tflz+qs7VnKN0qJnBZfZf4kzCicLquJztd+JuQc3LoU=;
	b=QBOlfUBhd0hTwlmRQNkRDxJjhay/Eu1koIDM9/etPYpn/N+IROFwSCjJrlc2EGgO0vpqZD
	kkNqVrCrY570jHiBGRZmu4wbRHZaTHMR5DSZWkHiqcYsxeigQiygUrGzsAAp8X6wq0fhVL
	nhm5BjFZTTDRGh8atW0+W4nCvnDojGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795710713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tflz+qs7VnKN0qJnBZfZf4kzCicLquJztd+JuQc3LoU=;
	b=Nvx57a14PM9aC5qgvrIxnMpSVl2YdubxEaDfk8nAXJxRour7kY/qJTeaJ/KSkOrFafKxsz
	lhcvmRRdJelJ8oDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C3D4134C3;
	Thu, 26 Nov 2026 16:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vrCcCfleCGvnJgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 26 Nov 2026 16:31:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] fbcon: Fix segfault on re-orientation
Date: Thu, 26 Nov 2026 17:23:09 +0100
Message-ID: <20261126163150.91355-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.1
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.01
X-Spam-Level: 
X-Rspamd-Queue-Id: AF9A21FE03

fbcon_init() re-rotates the console even when initializing a hidden
console. The rotated console then accesses its screen buffer with
regular bit ops. This results in a segmentation fault. Fix this by
resetting rotation only on new and visible consoles.

The problem can be reproduced by rotating the console on bochs and
shutting down the system. When plymouth opens the terminal, it
triggers the crash.

Patch 1 fixes the bug. I used an LLM to debug the issue and create
the fix. This goes first to simplify backporting.

Patch 2 slightly refactors the fix.

Thomas Zimmermann (2):
  fbcon: Don't change shared blitting state for hidden consoles
  fbcon: Provide a single implementation of fbcon_set_rotation()

 drivers/video/fbdev/core/fbcon.c | 43 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 16 deletions(-)

-- 
2.56.1

