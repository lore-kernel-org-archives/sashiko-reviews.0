Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300451;
	b=IWtOmV5Pi73IVSReipFRpRzTflFVoiHo/eFicGdGvmAkYBCRfg5w3IMr6Jhf99RFq3JG
	 0GUO3kOlnocVOF3wL2kiv3tA1lEbrHCg/Ie+cV/ox6iD53TYsPteoF0A6aGqGzGD20YbD
	 FH8XqVHArxEnAbKPKofGerAJ9SWynKP4T3xXPnFW8oQ54JFnWrs0MQl081Fl6bhUlmpP0
	 iCMxXrbWdmdwhA2gaq2cn0HEOxuPBA6iRra4suHij02bVZNoCrtlEpERxQYt+vUhhQTMR
	 aBEnEHEzWB8oPY9SaUJ96VjoSAcD+59r7k7VPLabrDvilZ2od8czEifxuxd/Eo7azSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300451;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=wjLCFHMq4L7EraxJkCj/mFTRxT9QiHb57xgvmsJUPoM=;
	b=d5sOerMeeXKPk14QoRqJ47rQKyiixDh0FAbwiNJZZHYVm+Dnqg5rtILW9OasCbEszkEJ
	 M7z7d5OuK+WQDTNB790zEDDJ33cWQ7n6yL2alrHq96H74IIWyr9eipNIqIyBEwJeGEEG7
	 4GTVTT5FoIdWWyYL6NhpHvXZgGqA2SRKRejn2lhAl2P/ik7qxbqXtHThmcGrblKIE7KHN
	 a5w0pik6bgoeDnv3SG54BTuknL1ScGICcagdY/4tJoBcR3p1GxdszIjEl1prRKQFJA+uz
	 f1uHXH8/dqoJJBeYwS506B1wUW+w0g8gNW6xFefXRx3w8VIrXPMuyBAnY7Emz1H8ulQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wiGyt9kG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FimjtOch;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wiGyt9kG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FimjtOch;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1413606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1413606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wiGyt9kG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FimjtOch;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wiGyt9kG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FimjtOch
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9E9E22054;
	Tue, 10 Nov 2026 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794300435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjLCFHMq4L7EraxJkCj/mFTRxT9QiHb57xgvmsJUPoM=;
	b=wiGyt9kG5wDm93ebHyG1FtWau2cIahpr0w9F6BqTBlUV7+4pEUW5Bt+uplbTb/uo2KZ1qj
	IW8Q2Jq0tX5UjS/qU3VIsUf2zN4yoEWr3IpOfCqf/bVsiu+dg15autnlYwxYQSvUHREv2N
	ISBNZVi4UZdVheu+bvnJAz0w3XzRev8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794300435;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjLCFHMq4L7EraxJkCj/mFTRxT9QiHb57xgvmsJUPoM=;
	b=FimjtOchf9kMW6yNdyc5Ge27GQprQ2HaqLgnDqHrJ/P27nD28bSGMrkYgl0wIvgreTejFU
	wi240PWWqy6BpmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794300435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjLCFHMq4L7EraxJkCj/mFTRxT9QiHb57xgvmsJUPoM=;
	b=wiGyt9kG5wDm93ebHyG1FtWau2cIahpr0w9F6BqTBlUV7+4pEUW5Bt+uplbTb/uo2KZ1qj
	IW8Q2Jq0tX5UjS/qU3VIsUf2zN4yoEWr3IpOfCqf/bVsiu+dg15autnlYwxYQSvUHREv2N
	ISBNZVi4UZdVheu+bvnJAz0w3XzRev8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794300435;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjLCFHMq4L7EraxJkCj/mFTRxT9QiHb57xgvmsJUPoM=;
	b=FimjtOchf9kMW6yNdyc5Ge27GQprQ2HaqLgnDqHrJ/P27nD28bSGMrkYgl0wIvgreTejFU
	wi240PWWqy6BpmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45E4E134F4;
	Tue, 10 Nov 2026 08:47:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GTbNGhLa8mojQwAAD6G6ig:T3
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Nov 2026 08:47:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ville.syrjala@linux.intel.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	javierm@redhat.com,
	zack.rusin@broadcom.com,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/2] drm/vblank: Cancel vblank timer outside of critical section
Date: Tue, 10 Nov 2026 09:45:20 +0100
Message-ID: <20261110084710.503870-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110084710.503870-1-tzimmermann@suse.de>
References: <20261110084710.503870-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,broadcom.com,bootlin.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_RATELIMIT(0.00)[to_ip_from(RLgb6padn6wcu17bxtda1k7h6p)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -15.80

Cancel the vblank timer's hrtimer after disabling the vblank timer to
avoid running timer function with outdated interval.

Stopping and restarting the vblank timer with a different interval can
leave behind an already-running timer function that uses the previous
interval. This can result in a vblank event with inconsistent timing. At
the same time, canceling the hrtimer in drm_crtc_vblank_cancel_timer() with
hrtimer_cancel() is not possible due to a deadlock between vblank_time_lock
and the hrtimer.

Resolve this problem by calling hrtimer_cancel() outside of
vblank_time_lock's critical section. Implement this with the new callback
sync_vblank in struct drm_crtc_funcs. Invoke this callback after switching
off the vblank. Some internal bookkeeping is necessary to ensure that the
timer is really switched off.

Implement sync_vblank for vblank timers with the new helper
drm_crtc_vblank_helper_sync_vblank_timer(). From there, the vblank function
drm_crtc_blank_stop_timer() stops the hrtimer unconditionally. Install
drm_crtc_vblank_helper_sync_vblank_timer() in most drivers via
DRM_CRTC_VBLANK_TIMER_FUNCS. Update vmwgfx, which does not use this macro.

Implement the locking in drm_crtc_vblank_cancel_timer() with a guard. Also
remove the call to hrtimer_try_to_cancel() from that function. It is no
longer needed with sync_vblank invoking hrtimer_cancel().

v2:
- handle uninitialized timer in drm_crtc_vblank_cancel_timer()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank.c         | 56 +++++++++++++++++++++++-----
 drivers/gpu/drm/drm_vblank_helper.c  | 16 ++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c |  2 +-
 include/drm/drm_crtc.h               |  9 +++++
 include/drm/drm_vblank.h             | 16 ++++++++
 include/drm/drm_vblank_helper.h      |  2 +
 9 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 8cc8d018d353..c26464ca4a12 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1403,6 +1403,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
 
 	spin_unlock_irq(&dev->event_lock);
 
+	if (crtc->funcs->sync_vblank)
+		crtc->funcs->sync_vblank(crtc);
+
 	/* Will be reset by the modeset helpers when re-enabling the crtc by
 	 * calling drm_calc_timestamping_constants(). */
 	vblank->hwmode.crtc_clock = 0;
@@ -2246,28 +2249,61 @@ EXPORT_SYMBOL(drm_crtc_vblank_start_timer);
  * @crtc: the CRTC
  *
  * Drivers should call this function from their CRTC's disable_vblank
- * function to stop a vblank timer.
+ * function to stop a vblank timer. Only signals the timer to stop at
+ * the next invocation. Non-blocking. To fully stop the vblank timer,
+ * drivers should invoke drm_crtc_vblank_stop_timer().
  */
 void drm_crtc_vblank_cancel_timer(struct drm_crtc *crtc)
 {
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
-	unsigned long flags;
+
+	if (!vtimer->crtc)
+		return;
 
 	/*
-	 * Calling hrtimer_cancel() can result in a deadlock with DRM's
-	 * vblank_time_lime_lock and hrtimers' softirq_expiry_lock. So
+	 * Calling hrtimer_cancel() here can result in a deadlock between
+	 * DRM's vblank_time_lock and hrtimers' softirq_expiry_lock. So
 	 * clear interval and indicate cancellation. The timer function
-	 * will cancel itself on the next invocation.
+	 * will cancel itself on the next invocation. Otherwise cancel it
+	 * in drm_crtc_vblank_stop_canceled_timer().
 	 */
+	scoped_guard(spinlock_irqsave, &vtimer->interval_lock)
+		vtimer->interval = 0;
+}
+EXPORT_SYMBOL(drm_crtc_vblank_cancel_timer);
+
+/**
+ * drm_crtc_vblank_stop_canceled_timer - Stops a CRTC's previously canceled vblank timer
+ * @crtc: the CRTC
+ *
+ * Drivers should call this function from their CRTC's sync_vblank
+ * function to fully stop a vblank timer. The timer must have been
+ * canceled before. Use drm_crtc_vblank_stop_timer() to stop a vblank
+ * timer unconditionally.
+ *
+ * The function blocks until a running timer function has returned.
+ */
+void drm_crtc_vblank_stop_canceled_timer(struct drm_crtc *crtc)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
+	ktime_t interval;
 
-	spin_lock_irqsave(&vtimer->interval_lock, flags);
-	vtimer->interval = 0;
-	spin_unlock_irqrestore(&vtimer->interval_lock, flags);
+	if (!vtimer->crtc)
+		return;
 
-	hrtimer_try_to_cancel(&vtimer->timer);
+	/*
+	 * The vblank timer is off if it has an interval of zero. Cancel
+	 * it before drm_crtc_vblank_start_timer() reprograms it.
+	 */
+	scoped_guard(spinlock_irqsave, &vtimer->interval_lock)
+		interval = vtimer->interval;
+
+	if (!interval)
+		hrtimer_cancel(&vtimer->timer);
 }
-EXPORT_SYMBOL(drm_crtc_vblank_cancel_timer);
+EXPORT_SYMBOL(drm_crtc_vblank_stop_canceled_timer);
 
 /**
  * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
index d3f8147ecdc1..7465d74ce29e 100644
--- a/drivers/gpu/drm/drm_vblank_helper.c
+++ b/drivers/gpu/drm/drm_vblank_helper.c
@@ -146,6 +146,22 @@ void drm_crtc_vblank_helper_disable_vblank_timer(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_helper_disable_vblank_timer);
 
+/**
+ * drm_crtc_vblank_helper_sync_vblank_timer - Implements struct &drm_crtc_funcs.sync_vblank
+ * @crtc: The CRTC
+ *
+ * The helper drm_crtc_vblank_helper_sync_vblank_timer() implements
+ * sync_vblank of struct drm_crtc_funcs for CRTCs that require a
+ * VBLANK timer.
+ *
+ * See also struct &drm_crtc_funcs.sync_vblank.
+ */
+void drm_crtc_vblank_helper_sync_vblank_timer(struct drm_crtc *crtc)
+{
+	drm_crtc_vblank_stop_canceled_timer(crtc);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_helper_sync_vblank_timer);
+
 /**
  * drm_crtc_vblank_helper_get_vblank_timestamp_from_timer -
  *	Implements struct &drm_crtc_funcs.get_vblank_timestamp
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 0dea09cc29a7..e8c7100a3dc8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -33,7 +33,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-
+#include <drm/drm_vblank_helper.h>
 
 #define vmw_crtc_to_ldu(x) \
 	container_of(x, struct vmw_legacy_display_unit, base.crtc)
@@ -256,6 +256,7 @@ static const struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.enable_vblank          = vmw_vkms_enable_vblank,
 	.disable_vblank         = vmw_vkms_disable_vblank,
+	.sync_vblank            = drm_crtc_vblank_helper_sync_vblank_timer,
 	.get_vblank_timestamp   = vmw_vkms_get_vblank_timestamp,
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 39d58fc392bf..a74cafb1769e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -35,6 +35,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #define vmw_crtc_to_sou(x) \
 	container_of(x, struct vmw_screen_object_unit, base.crtc)
@@ -312,6 +313,7 @@ static const struct drm_crtc_funcs vmw_screen_object_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.enable_vblank          = vmw_vkms_enable_vblank,
 	.disable_vblank         = vmw_vkms_disable_vblank,
+	.sync_vblank            = drm_crtc_vblank_helper_sync_vblank_timer,
 	.get_vblank_timestamp   = vmw_vkms_get_vblank_timestamp,
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index b505f8ba3e83..d3f7a5c2d131 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -37,6 +37,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #define vmw_crtc_to_stdu(x) \
 	container_of(x, struct vmw_screen_target_display_unit, base.crtc)
@@ -785,6 +786,7 @@ static const struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.enable_vblank		= vmw_vkms_enable_vblank,
 	.disable_vblank		= vmw_vkms_disable_vblank,
+	.sync_vblank            = drm_crtc_vblank_helper_sync_vblank_timer,
 	.get_vblank_timestamp	= vmw_vkms_get_vblank_timestamp,
 	.get_crc_sources	= vmw_vkms_get_crc_sources,
 	.set_crc_source		= vmw_vkms_set_crc_source,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
index 3d0d5dfa869f..8ce10cf9c19e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -299,7 +299,7 @@ vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
 	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
 	if (vmw->vkms_enabled)
-		drm_crtc_vblank_cancel_timer(crtc);
+		drm_crtc_vblank_stop_timer(crtc);
 
 	if (du->vkms.surface)
 		vmw_surface_unreference(&du->vkms.surface);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index be5dca538d87..46546006f361 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -908,6 +908,15 @@ struct drm_crtc_funcs {
 	 */
 	void (*disable_vblank)(struct drm_crtc *crtc);
 
+	/**
+	 * @sync_vblank:
+	 *
+	 * Synchronizes vblank hardware and software state after switching off
+	 * vblanks for the given CRTC. Called without holding vblank locks. Allows
+	 * the driver to clean up vblank state outside of critical sections.
+	 */
+	void (*sync_vblank)(struct drm_crtc *crtc);
+
 	/**
 	 * @get_vblank_timestamp:
 	 *
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 2fcef9c0f5b1..257b83d145ce 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -319,6 +319,22 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 
 int drm_crtc_vblank_start_timer(struct drm_crtc *crtc);
 void drm_crtc_vblank_cancel_timer(struct drm_crtc *crtc);
+void drm_crtc_vblank_stop_canceled_timer(struct drm_crtc *crtc);
+
+/**
+ * drm_crtc_vblank_stop_timer - Stops a CRTC's vblank timer
+ * @crtc: the CRTC
+ *
+ * Drivers should call this function to fully stop a CRTC's vblank timer.
+ *
+ * The function blocks until a running timer function has returned.
+ */
+static inline void drm_crtc_vblank_stop_timer(struct drm_crtc *crtc)
+{
+	drm_crtc_vblank_cancel_timer(crtc);
+	drm_crtc_vblank_stop_canceled_timer(crtc);
+}
+
 void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time);
 
 /*
diff --git a/include/drm/drm_vblank_helper.h b/include/drm/drm_vblank_helper.h
index 28051f08d0f4..dd0029e045be 100644
--- a/include/drm/drm_vblank_helper.h
+++ b/include/drm/drm_vblank_helper.h
@@ -37,6 +37,7 @@ void drm_crtc_vblank_atomic_disable(struct drm_crtc *crtc,
 
 int drm_crtc_vblank_helper_enable_vblank_timer(struct drm_crtc *crtc);
 void drm_crtc_vblank_helper_disable_vblank_timer(struct drm_crtc *crtc);
+void drm_crtc_vblank_helper_sync_vblank_timer(struct drm_crtc *crtc);
 bool drm_crtc_vblank_helper_get_vblank_timestamp_from_timer(struct drm_crtc *crtc,
 							    int *max_error,
 							    ktime_t *vblank_time,
@@ -51,6 +52,7 @@ bool drm_crtc_vblank_helper_get_vblank_timestamp_from_timer(struct drm_crtc *crt
 #define DRM_CRTC_VBLANK_TIMER_FUNCS \
 	.enable_vblank = drm_crtc_vblank_helper_enable_vblank_timer, \
 	.disable_vblank = drm_crtc_vblank_helper_disable_vblank_timer, \
+	.sync_vblank = drm_crtc_vblank_helper_sync_vblank_timer, \
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp_from_timer
 
 #endif
-- 
2.56.0

