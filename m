Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098085;
	b=2NDQ9gtbUjzrDMTUNaoR/Q0LUubwxWMoNld64IQid0FJlyzlKrwXDjqLeziFw0aOnw0D
	 yd5Lg0lqnzsNJR1wgpBbD5H0NXn2TiiPvHtEyRrZj7TMq7MzpDdsnCreNMu5NJYrB418k
	 0Dutu9ahtzytz85Ru1Yr4JhZwf3tOeyEIggrgIlJRA9LcRAx+NHHQEWqOmWknQ0P+74oC
	 pU/MnYNcbU+J7zumUCYopYKaFci92PKeZmMGM04tqW7nyF+lXUvALpfLxPEq601vvHiJo
	 i6iDqoupHuiLr9wtNaU2HeBOUWRXx0HSdSmBZIVypWBKo6eNP6BGvRgq0DPEDEf+Vug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098085;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=2kkYlcQYm15iaKo9GaUw4TYYSOAyWWivoUk2QLLzmW8=;
	b=CEWdir/rOAoE70OkWRCgsp7bGUUEKAlAEptXkbTW3rxUL/wrEwUfVaphUTiDUdKWuC0f
	 9ziFOvxWvhzRtq5arXW0lTd+TThbBDh+MqN9x0YxUHJy7fHYdCFgYijgOkyliwnq32wiw
	 rCW+HnAcgInoANuQ2VYizelkFl08ePAMiH5vUMFtFmyqySpNAWqyB2vMXUnlqFyesYLRj
	 +0NXCbnNcm/TLdgUmPzXjcjeebc8QMfubMZmGtlh8t0eAjG9GTIYDRsDJux3k8NcrTph7
	 upnTMXDopwJZTnlDO6E8Yu/kRO4jUTol6/g5ewtj7HOvjoskABYy06RgStm/tr5aE2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pj0T0oN0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iUlRni7+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d80b2BeS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=c+2LFWtN;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE6606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DE6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pj0T0oN0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iUlRni7+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=d80b2BeS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=c+2LFWtN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2900A2247B;
	Thu, 19 Nov 2026 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kkYlcQYm15iaKo9GaUw4TYYSOAyWWivoUk2QLLzmW8=;
	b=pj0T0oN0BVG8ikHKo/nj7BWd+EnaZqzDz25uulJQWfUyRNMWoFrIKjxceo4titXzxQOtug
	cBCnJRwL0y7e+m8Hq6P35RNTszXz+7xYTw8sCzU3Xp1YagCE6nlYbG0M7BD6NJwOyiXHbY
	d6AHWiYVRh+Eft486UkBqDhDWk+EbJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kkYlcQYm15iaKo9GaUw4TYYSOAyWWivoUk2QLLzmW8=;
	b=iUlRni7+dO6IWOlj0QoubQIDf/isxbJSvrTo211hcYTtfF6WCcirq7DM3qnbLWaBiBcdXL
	WYW3MnYuKR8lGwCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=d80b2BeS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c+2LFWtN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kkYlcQYm15iaKo9GaUw4TYYSOAyWWivoUk2QLLzmW8=;
	b=d80b2BeSAb7iWKf3ThNqiQsScy3rNCJrKJ4uweIQZZKxaA3q4lQ1qmH+XDJEIuY/ilgAsq
	eq907puZw3HwEaIQnteCQoDAX7ebnvEoeVcUSwMZhyBFchYquFqx4vJ0JoV06sZDuGQS38
	zgPpaEYhFFYHim9uSVWdlTU3NxY/sjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098081;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kkYlcQYm15iaKo9GaUw4TYYSOAyWWivoUk2QLLzmW8=;
	b=c+2LFWtNglM+8RXfhfd+ZGJ/mVwIbWRKOd04STCIfUmOTuhwObFO8AjRsh9+5pMvP0YDKu
	9d4XqUihmxPpQhBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9847134F6;
	Thu, 19 Nov 2026 14:21:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RynyAeAF/2rJfgAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Nov 2026 14:21:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	tiwai@suse.com,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/11] drm/udl: Release URB in udl_put_urb()
Date: Thu, 19 Nov 2026 15:02:13 +0100
Message-ID: <20261119142114.152052-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119142114.152052-1-tzimmermann@suse.de>
References: <20261119142114.152052-1-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-10.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[redhat.com,poorly.run,suse.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 2900A2247B

Move URB cleanup from udl_urb_completion() to udl_put_urb().
udl_put_urb() is the inverse of udl_get_urb(). The new helper will
allow for further fixes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.h  |  1 +
 drivers/gpu/drm/udl/udl_main.c | 29 +++++++++++++++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 145bb95ccc48..9535e9c59950 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -73,6 +73,7 @@ int udl_modeset_init(struct udl_device *udl);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
 struct urb *udl_get_urb(struct udl_device *udl);
+void udl_put_urb(struct urb *urb);
 
 int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len);
 void udl_sync_pending_urbs(struct udl_device *udl);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 17950fe3a0ec..936fb6565bdb 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -149,10 +149,6 @@ int udl_select_std_channel(struct udl_device *udl)
 
 void udl_urb_completion(struct urb *urb)
 {
-	struct urb_node *unode = urb->context;
-	struct udl_device *udl = unode->dev;
-	unsigned long flags;
-
 	/* sync/async unlink faults aren't errors */
 	if (urb->status) {
 		if (!(urb->status == -ENOENT ||
@@ -164,14 +160,7 @@ void udl_urb_completion(struct urb *urb)
 		}
 	}
 
-	urb->transfer_buffer_length = udl->urbs.size; /* reset to actual */
-
-	spin_lock_irqsave(&udl->urbs.lock, flags);
-	list_add_tail(&unode->entry, &udl->urbs.list);
-	udl->urbs.available++;
-	spin_unlock_irqrestore(&udl->urbs.lock, flags);
-
-	wake_up(&udl->urbs.sleep);
+	udl_put_urb(urb);
 }
 
 static void udl_free_urb_list(struct udl_device *udl)
@@ -295,6 +284,22 @@ struct urb *udl_get_urb(struct udl_device *udl)
 	return urb;
 }
 
+void udl_put_urb(struct urb *urb)
+{
+	struct urb_node *unode = urb->context;
+	struct udl_device *udl = unode->dev;
+	unsigned long flags;
+
+	urb->transfer_buffer_length = udl->urbs.size; /* reset to actual */
+
+	spin_lock_irqsave(&udl->urbs.lock, flags);
+	list_add_tail(&unode->entry, &udl->urbs.list);
+	udl->urbs.available++;
+	spin_unlock_irqrestore(&udl->urbs.lock, flags);
+
+	wake_up(&udl->urbs.sleep);
+}
+
 int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len)
 {
 	int ret;
-- 
2.56.0

