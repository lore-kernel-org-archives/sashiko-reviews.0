Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098112;
	b=JxxxUl3M9ZgZCyDuwmL9ErHT0TDPt8kpUE65NdwOh7PRJ7X2w0H28E9mwB+3uuwCQHcW
	 7GaD7Tv5BmtyUMVNhW2rvyGM4XXP4CWXB9NDhamEG8w6t4226q7Dh2KjzKBIQKKeS6qza
	 0B0Jqxp8Cb+OfcUrhe8lKs29Gq83kMI7+ewruVtmX1Qn3oCt7jTPQZF+rd5Coqk8OqPyZ
	 jmMF0lnMoQab34gkHGxINftH4XcWCGcCjkm06aDuXMDETA6Ym7lsUzEZdA99R/GO3X5oC
	 M7k0EjqChtQJawz689mpUAeDTduGfXNIuUrhTs13TRXdoNEdY+VNTvi33YZYaXVzelA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098112;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=Nk7SgBbXciuFdwoOqxPefJqs4yRhRInOqDvcIuwRhV0=;
	b=DCuIoZz00guIo3AMu6PXVkxYJZsiA9iQky5g8BiIeSTxAQhDTPUV1NNINicbwnj5/k+R
	 xMtIflbkqkW1IylL5HSfg4Dui/mA5GkkBgID3c8cvbdNPC76MIijEPsfyh/Fvr+CPUUea
	 Sh8NUAYLMfOPkI5zy6rcw0qn2Dss3pLxpz4SkVZdiJ98AQONUQAkiRJHX0H8gMT0vhjVv
	 lsA1K6T6eC3synW7NHLBODJF67aLcARJy1mETjOfEV4sGwhsgq3tb94bdUQ1mAW9GrtAf
	 MIr5FPGhoZd3ax2sAUhKToD0+ser9TYJ6pOGAlLuAGuRF9+kp5lAk7jZIRC09+kKQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gdrUOZQa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HbCYqJkH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uMCif2L6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fuOQlKE7;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A8606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885A8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gdrUOZQa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HbCYqJkH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uMCif2L6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=fuOQlKE7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9F4B1FB7E;
	Thu, 19 Nov 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk7SgBbXciuFdwoOqxPefJqs4yRhRInOqDvcIuwRhV0=;
	b=gdrUOZQaPfFAmsET6mzN4SoZMRoKCveG+O06uhRK4KqM1UpTCcQ+yPCA5eI1UR9EwWeqIT
	MZmlLlYtJ6dYEiWCKEh+rQRQTpxH6vVPi1yCGl0T3mEaEMWz5QC5yJlVhgQPuBnozEbNT1
	9orSwkxmqLbckVnjaxWVCmEDIty59YA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk7SgBbXciuFdwoOqxPefJqs4yRhRInOqDvcIuwRhV0=;
	b=HbCYqJkHydt3we3NXfW+1543kZEcOHLdrP8pZpir8CL8k+/UxCbYpnQVx7Rkstj2ieHf6P
	7bC/N45WmXzPxvCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uMCif2L6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fuOQlKE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795098082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk7SgBbXciuFdwoOqxPefJqs4yRhRInOqDvcIuwRhV0=;
	b=uMCif2L60OULaw8NP8VOybHwgQHAzCJ0JRYYl79VvMPCuDHeKrNS+pmK3zJv6nlf4fWZ+Y
	Lzw1f6yWRvJ9t5Jte2MLYV1reVQrJaVIX71/1Wmr7o4f5UobUG2suG4CWUTcC5751cpDFv
	8iLx4IM8+ofuprZYCf7DqmuHSxDZzZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795098082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nk7SgBbXciuFdwoOqxPefJqs4yRhRInOqDvcIuwRhV0=;
	b=fuOQlKE7l5SeUSHhkxUJeZMafowo606usxU9SRz9cKSRyiJ+UbT/5FA1R21xsTD2TBa39O
	nkyn3MeW/y1gi/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 817F91342D;
	Thu, 19 Nov 2026 14:21:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RynyAeAF/2rJfgAAD6G6ig:T7
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Nov 2026 14:21:22 +0000
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
Subject: [PATCH 06/11] drm/udl: Rework the error handling in udl_submit_urb()
Date: Thu, 19 Nov 2026 15:02:18 +0100
Message-ID: <20261119142114.152052-7-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E9F4B1FB7E
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -10.51

Refactor the error handling in udl_submit_urb(). Replace DRM_ERROR()
macro with drm_err_ratelimited(). No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 1c3960974a10..821725cbebbe 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -331,15 +331,21 @@ int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len)
 
 	if (drm_WARN_ON_ONCE(drm, len > unode->alloc_size)) {
 		ret = -EINVAL;
-		goto error;
+		goto err_udl_put_urb;
 	}
+
 	urb->transfer_buffer_length = len; /* set to actual payload len */
+
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
- error:
 	if (ret) {
-		udl_put_urb(urb);
-		DRM_ERROR("usb_submit_urb error %x\n", ret);
+		drm_err_ratelimited(drm, "usb_submit_urb() failed with error %d\n", ret);
+		goto err_udl_put_urb;
 	}
+
+	return 0;
+
+ err_udl_put_urb:
+	udl_put_urb(urb);
 	return ret;
 }
 
-- 
2.56.0

