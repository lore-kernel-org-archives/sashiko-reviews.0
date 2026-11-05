Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890794;
	b=FRDRueAehQIWYJ/3LyEg4xjJ0oF2RbsyhtAbeEfwOpCf7B3rXu/zP4coi9t/XqGRR+4q
	 NjagC19l+UxqiTU1GPvYI+nY8CTpQv4cqWuNHcxOxke7tOB9h+ArhnJ1QITPlr2F/lOQp
	 Yk/8aQunV2GJVQKjJeFvi3GrUx0G+pQXlYf6VQ9JvTDI0EAp8U1MH8GXNsGI2Wm71xSSX
	 EltSGlUQp5FvBVH5mzEmPLnOg/za5KgSgHFD4TvtdTupCUJb3uBHwvMoX2tWyC2CoEpI9
	 y04HYFSjNoyGa/JuGXUjh8e0qzHK3tMx0viOSombfXqcYjSUxE3mFLRq/XOzwycMlMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890794;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=ITjHy6xFpnbiGfZKZcFBIec2PqNnLBr6zVLuSmhnI3k=;
	b=d/Ob0cLudiT5Y0aj4pbn/FbE+N/uA1lQ/oMY+Qn/Ry58GyacXQmJHzl14ZAoTFR4dxbP
	 wQQV0XMSlieyNn8MPAHYRpxd/xT2qI36zD7yHbkgXnt8PfbdTBa4aAlJ570vbWLYsn23t
	 lMNXucnqT0gSx3I5TlOHq4cdAdXBx7pisrTZk4Tv4dIkY0LM4JlAX6apVl461JiKEjzPH
	 M7E4aQweG4Y1BVyyxMPtaoQRCv3mm3FK5ocK+k0BpojffU8x5+8FCzk7F9R7hp1zcJyRa
	 quuvjzkunxQuMk/JehVBKCk/K1+6qV2XZjMYAum+46s+OAQPY/cEtyC2DipPxJuz4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEr4wbuH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="g/HDIomS";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEr4wbuH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="g/HDIomS";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE95606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 14:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEr4wbuH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=g/HDIomS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XEr4wbuH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=g/HDIomS
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E5B221EB4;
	Thu,  5 Nov 2026 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793890792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ITjHy6xFpnbiGfZKZcFBIec2PqNnLBr6zVLuSmhnI3k=;
	b=XEr4wbuHnCkDCUn9X/MvQ/yPZjyKospsicR1KrZx0MWzSo83ReAWOuzGt8oopo4CpL6aJT
	8K310YV2TSF6jdDcQQxLoghXqXDQNXzo88KFygJy+dN76PJtCgokcWIxFYUX1Ek6XxJdKJ
	pzR1/UI4vWfhgOP4+GGfbs8pVSiz7Is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793890792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ITjHy6xFpnbiGfZKZcFBIec2PqNnLBr6zVLuSmhnI3k=;
	b=g/HDIomSFuFBvSn4kxWjLSElouqtzASL82c3TUu1MjS07sUx9zhl2/71tuxJBB3PYZvwdC
	Zbbvo8XUov/lOiBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793890792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ITjHy6xFpnbiGfZKZcFBIec2PqNnLBr6zVLuSmhnI3k=;
	b=XEr4wbuHnCkDCUn9X/MvQ/yPZjyKospsicR1KrZx0MWzSo83ReAWOuzGt8oopo4CpL6aJT
	8K310YV2TSF6jdDcQQxLoghXqXDQNXzo88KFygJy+dN76PJtCgokcWIxFYUX1Ek6XxJdKJ
	pzR1/UI4vWfhgOP4+GGfbs8pVSiz7Is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793890792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ITjHy6xFpnbiGfZKZcFBIec2PqNnLBr6zVLuSmhnI3k=;
	b=g/HDIomSFuFBvSn4kxWjLSElouqtzASL82c3TUu1MjS07sUx9zhl2/71tuxJBB3PYZvwdC
	Zbbvo8XUov/lOiBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7B82133F6;
	Thu,  5 Nov 2026 14:59:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x+n9G+eZ7GrlSAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 05 Nov 2026 14:59:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	ville.syrjala@linux.intel.com,
	javierm@redhat.com,
	zack.rusin@broadcom.com,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/vblank: timer: Fix race condition in enable_vblank
Date: Thu,  5 Nov 2026 15:41:31 +0100
Message-ID: <20261105145946.896674-1-tzimmermann@suse.de>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,broadcom.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

(was: drm/vblank: Restart enabling vblank timer on possible deadlock)

Busy-waiting in drm_crtc_vblank_start_timer() until a previous vblank
timer has completed can deadlock. Rework how the vblank timer's start
and cancel helpers interact with the timer function.

Patch 1 fixes the possible deadlock by removing the busy-wait loop from
drm_crtc_vblank_start_timer(). To avoid possible interference between
_start_timer()'s hrtimer_start() and hrtimer_forward_now() in the timer
function, extend the interval_lock around both. Both, _start_timer() and
the timer function, can still overlap, but hrtimer initialization should
work reliably. At most, the first vblank event after changing the interval
might be off.

Fix the possible overlap by canceling the vblank timer's internal hrtimer.
Do this outside of the vblank code's critical section after switching
the vblank timer off. With the hrtimer being canceled, the next vblank
event will be sent at the correct time.

Tested with bochs on qemu.

Additional notes: there have been reports about vblank timers not happening
in time, such as [1]. We suspected that might happen due to guest systems
running under high CPU load. But the problem could also be caused by the
deadlock fixed in patch 1.

[1] https://lore.kernel.org/dri-devel/6a176ae6.d07c18fe.1069e4.0016.GAE@google.com/

Thomas Zimmermann (2):
  drm/vblank: timer: Do not block within critical section
  drm/vblank: Cancel vblank timer outside of critical section

 drivers/gpu/drm/drm_vblank.c         | 87 ++++++++++++++++++----------
 drivers/gpu/drm/drm_vblank_helper.c  | 16 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c |  2 +-
 include/drm/drm_crtc.h               |  9 +++
 include/drm/drm_vblank.h             | 16 +++++
 include/drm/drm_vblank_helper.h      |  2 +
 9 files changed, 105 insertions(+), 34 deletions(-)


base-commit: a3c3ff69be4e55d4f8f3d93789381ebb23684b17
-- 
2.56.0

